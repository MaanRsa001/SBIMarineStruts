package com.maan.upload.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.Logger;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.jdbc.support.rowset.SqlRowSet;

import com.maan.common.LogUtil;
import com.maan.common.MyJdbcTemplate;
import com.maan.common.Token;
import com.maan.common.exception.BaseException;
import com.maan.quotation.api.QuotationApiCall;
import com.maan.quotation.model.DefaultValue;
import com.maan.quotation.model.QuotationModel;
import com.maan.quotation.model.QuotationResponse;
import com.maan.quotation.service.QuotationService;
import com.maan.upload.UploadAction;
import com.maan.upload.api.UploadApiCall;


public class UploadDAO extends MyJdbcTemplate 
{
	
	UploadApiCall api = new UploadApiCall();
	
	final static Logger logger = LogUtil.getLogger(UploadDAO.class);
	public String sql="";
	public List getDBColumns(String movementDetailId)
	{
		logger.info("getDBColumns - Enter || movementDetailId: "+movementDetailId);
		List list= new ArrayList();
		try {
			sql = "SELECT SOURCE_FIELD, DEST_FIELD, MANDATORY_STATUS, DATA_TYPE, FIELD_ID FROM XL_MASTER_TABLE_CONFIG  WHERE MOVEMENT_DETAIL_ID=? AND STATUS='Y'";
			list=this.mytemplate.queryForList(sql, new String[]{movementDetailId});
			
		} catch (Exception e) {
			
			logger.debug("EXCEPTION @ { "+e+" }");
		}
		logger.info("getDBColumns  sql: "+sql);
		logger.info("getDBColumns - Exit || Result: "+list.size());
		
		return list;
	}
	public List getDownloadData(String tranId, Map downloadInfo) 
	{
		logger.info("getDownloadData - Enter || tranId: "+tranId);
		String tableName=(String)downloadInfo.get("TABLE_NAME");
		String dbColumns=(String)downloadInfo.get("DB_COLUMNS");
		List list=null;
		try {
			if(dbColumns!=null)
			{
				sql="SELECT "+dbColumns+" FROM "+tableName+" WHERE TRAN_ID=? AND STATUS='Y'";
				logger.debug("sql==>"+sql);
				list=this.mytemplate.queryForList(sql, new String[]{tranId});
			}
		} catch (Exception e) {
			logger.debug("EXCEPTION @ { "+e+" }");
		}
		logger.info("getDownloadData - Exit");
		
		return list;
	}
	public Map insertRawData(String typeId, String tableName, String fields, List records, String movementDetailId, String tranIndex, String transId, String snoIndex, String headers,String finalHeaders) 
	{
		System.out.println("insertRawData() - Enter || recordsCount: "+records.size());
		String[] queries=new String[0];
		
		String sqlRaw = "";
		boolean error = false;
		String validationError = "";
		String errorMsg="", values="",tranId="0";
		Map result = new HashMap();
		//String tempTable = "TEMP_"+Calendar.DATE+Calendar.MONTH+Calendar.YEAR+Calendar.getInstance().getTimeInMillis();
		//String tempCreateTable = "CREATE TABLE  "+tempTable+"("+headers.replaceAll(",", " varchar2(500 byte),")+" varchar2(500 byte),TRANSACTION_ID varchar2(500 byte),SNO varchar2(500 byte))";
		//this.mytemplate.execute(tempCreateTable);
		String sequence = "select raw_sequence from xl_movement_detail where movement_detail_id=?";
		if(!fields.contains("TRANSACTION_ID")){
			fields=fields+", TRANSACTION_ID,SNO";
			if(StringUtils.isBlank(transId)){
				String query=getQuery("TRANID_SEQ"); 
			 tranId=(String)this.mytemplate.queryForObject(query,String.class);
			}else{
				// To addd records to the existing transaction
				tranId = transId;
			}
			String sequenceName = (String)this.mytemplate.queryForObject(sequence, new Object[]{movementDetailId}, String.class);
			
//			if("ORALCE".equals(getSource()))
				values=",'"+tranId+"',"+sequenceName+".nextval";
//			else
//				values=",'"+tranId+"',( SELECT "+sequenceName+".nextval from dual)";
		} 
		else{
			System.out.println("Error Reupload");
			error = true;
		}
		
		try 
		{
			int errorTransactionStartIndex=0;;
			int errorTransactionEndIndex=0;
			String errorTranID="";
			if(error){
			 errorTransactionStartIndex = nthOccurrence(records.get(0).toString(), '\'', ((Integer.parseInt(tranIndex)*2)-1));
			 errorTransactionEndIndex = nthOccurrence(records.get(0).toString(), '\'', ((Integer.parseInt(tranIndex)*2)));
			 errorTranID= records.get(0).toString().substring(errorTransactionStartIndex,errorTransactionEndIndex).replaceAll("'", "");
			}
			if(!records.isEmpty())
			{
				
				for(int i=0; i<records.size(); i++)
				{
					if(error){
						System.out.println("Error Tran ID"+errorTranID);
						String spli[] = errorTranID.split("\\.");
						tranId =spli[0]==null?errorTranID:spli[0];
						System.out.println(records.get(i).toString());
						int errorSnoStartIndex = nthOccurrence(records.get(i).toString(), '\'', ((Integer.parseInt(snoIndex)*2)-1));
						int errorSnoEndIndex = nthOccurrence(records.get(i).toString(), '\'', ((Integer.parseInt(snoIndex)*2)));
						String errorSNO= records.get(i).toString().substring(errorSnoStartIndex,errorSnoEndIndex).replaceAll("'", "");
						System.out.println("errorSNO"+errorSNO);
						sql= "select count(*) from XL_OPENCOVER_RAW WHERE TRANSACTION_ID=? and sno=?";
						String count = (String)this.mytemplate.queryForObject(sql, new Object[]{errorTranID,errorSNO},String.class);
						if(count.equalsIgnoreCase("0"))
							validationError =validationError+"Reference No "+errorSNO + " Not Exists<br/>";
						sql= "select count(*) from webservice_marine_quote WHERE TRANSACTION_ID=? and reference_number=?";
						 count = (String)this.mytemplate.queryForObject(sql, new Object[]{errorTranID,errorSNO},String.class);
						if(!count.equalsIgnoreCase("0"))
							validationError ="Quote already generated for Reference No "+errorSNO + "<br/>";
						
					}
					
				}
				
			}	
			System.out.println("validationError"+validationError);
			if(!records.isEmpty() && validationError.equalsIgnoreCase(""))
			{
				System.out.println("Error Exists::"+error);
				queries=new String[records.size()];
				
				for(int i=0; i<records.size(); i++)
				{
					if(error){
						int errorSnoStartIndex = nthOccurrence(records.get(i).toString(), '\'', ((Integer.parseInt(snoIndex)*2)-1));
						int errorSnoEndIndex = nthOccurrence(records.get(i).toString(), '\'', ((Integer.parseInt(snoIndex)*2)));
						String errorSNO= records.get(i).toString().substring(errorSnoStartIndex,errorSnoEndIndex).replaceAll("'", "");
						sql= "delete from "+tableName+" WHERE TRANSACTION_ID=? and sno=?";
						System.out.println("delete query ::"+sql+":error::"+errorTranID+"sn::"+errorSNO);
						this.mytemplate.update(sql,new Object[]{errorTranID,errorSNO});
					}
					
					sql="INSERT INTO "+tableName+"("+fields+") VALUES('"+records.get(i)+values+" )";
					System.out.println("Queries"+i+"::"+sql);
					queries[i]=sql;
				//	sql="INSERT INTO "+tableName+"("+fields+") select "+finalHeaders+" TRANSACTION_ID,SNO from "+tempTable+" ";
					//sqlRaw=sql;
					logger.info("Sql test1==>"+sql);
				}	
				try {
					if(queries.length>0){
						this.mytemplate.batchUpdate(queries);
					
						//this.mytemplate.update(sqlRaw);
					}	
						//this.mytemplate.execute("DROP TABLE "+tempTable);
					
				} catch (Exception e) {
				
					e.printStackTrace();
				}
				
			}
		}catch (Exception e) 
		{
			logger.info("Error Sql==>"+sql);
			logger.debug("EXCEPTION @ { "+e+" }");
			e.printStackTrace();
			String excepMsg = e.getMessage();
			if(excepMsg.contains("ORA-")) 
				errorMsg = excepMsg.substring(excepMsg.indexOf("ORA-"),excepMsg.length());
			else
				errorMsg= "Uploaded file contains invalid file format";
		} 
		System.out.println("insertRawData() - Exit || Error: "+errorMsg);
		System.out.println("Validation Error:"+validationError);
		System.out.println("tranId:"+tranId);
		result.put("tranid", tranId);
		result.put("error", validationError);
		return result;
	}
	public String insertMasterData(String typeId, String tableName, String fields, List records,  String tranId) 
	{
		System.out.println("insertMasterData() - Enter || recordsCount: "+records.size());
		String[] queries=new String[0];
		String errorMsg="", values="";
		fields=fields+", TRANSACTION_ID";
		values=tranId+"'";
		
		try 
		{
			if(!records.isEmpty())
			{
				queries=new String[records.size()];
				for(int i=0; i<records.size(); i++)
				{
					sql="INSERT INTO "+tableName+"("+fields+") VALUES('"+records.get(i)+values+" )";
					queries[i]=sql;
					logger.info("Sql test1==>"+sql);
				}	
				try {
					if(queries.length>0)
						this.mytemplate.batchUpdate(queries);
				} catch (Exception e) {
				
					e.printStackTrace();
				}
				    
			}	
		}catch (Exception e) 
		{
			logger.info("Error Sql==>"+sql);
			logger.debug("EXCEPTION @ { "+e+" }");
			
			
		}
		System.out.println("insertMasterData() - Exit || Error: "+errorMsg);
		return errorMsg;
	}
	public void archiveRawData(String movementDetailId, String tranId, String user) 
	{
		System.out.println("archiveRawData() - Enter: "+tranId);
		
		try 
		{
			String qry = "SELECT ARCHIVE_TABLE,DESTINATION_TABLE FROM XL_MOVEMENT_DETAIL WHERE ARCHIVE_TABLE IS NOT NULL AND MOVEMENT_DETAIL_ID=?";
			SqlRowSet rset = this.mytemplate.queryForRowSet(qry, new Object[] { movementDetailId });
			if(rset.next()){
				String archiveTable = rset.getString(1);
				String rawTable = rset.getString(2);
				String sql="insert into "+archiveTable+" select * from "+rawTable+" where transaction_id=? ";
				this.mytemplate.update(sql,new Object[]{tranId});
				String updateQry = "update "+archiveTable+" set transaction_date=SYSDATE , user_id=? where transaction_date is null and transaction_id=?";
				this.mytemplate.update(updateQry,new Object[]{user,tranId});
			}
			
		}catch (Exception e) 
		{
			logger.info("Error Sql==>"+sql);
			logger.debug("EXCEPTION @ { "+e+" }");
			e.printStackTrace();
		}
		System.out.println("archiveRawData() - Exit ");
		
	}
	public void updateOpenCoverDetail(String brokerCode, String openCoverNo,
			String tranId) {
		logger.info("updateOpenCoverDetail Enter" + tranId);
		
		try { 
			String qry = "update WEBSERVICE_MARINE_QUOTE_RAW set broker_code =? , MOC_NUMBER=? where transaction_id=?";
			this.mytemplate.update(qry , new String[] {brokerCode , openCoverNo , tranId});
			System.out.println(qry);
			String brokerValid =getQuery("declaration.updateOpenCoverDetail"); 
			this.mytemplate.update(brokerValid,new Object[]{tranId});
			System.out.println(brokerValid);
			//String openCoverValid =  "UPDATE WEBSERVICE_MARINE_QUOTE_RAW SET VALIDATION_ERROR=VALIDATION_ERROR||',OPEN COVER NO INVALID' WHERE MOC_NUMBER NOT IN ( SELECT MISSIPPI_OPENCOVER_NO FROM OPEN_COVER_MASTER WHERE STATUS='Y' and broker_id in (select company_name from BROKER_COMPANY_MASTER bc where broker_code=bc.agency_code and status='Y')) AND TRANSACTION_ID=?";
			//this.mytemplate.update(openCoverValid,new Object[]{tranId});
			//System.out.println(openCoverValid);
			String updateProposal = "UPDATE WEBSERVICE_MARINE_QUOTE_RAW SET PROPOSAL_NO=(SELECT PROPOSAL_NO FROM OPEN_COVER_MASTER OCM WHERE MOC_NUMBER =OCM.MISSIPPI_OPENCOVER_NO AND STATUS='Y' AND AMEND_ID=(SELECT MAX(AMEND_ID) FROM OPEN_COVER_MASTER WHERE MISSIPPI_OPENCOVER_NO =OCM.MISSIPPI_OPENCOVER_NO )) WHERE  TRANSACTION_ID=?";
			System.out.println("Update "+updateProposal);
			this.mytemplate.update(updateProposal,new Object[]{tranId});
				
				//Customer Info Updation 
				String customerUpdate = "UPDATE WEBSERVICE_MARINE_QUOTE_RAW  SET " +
				" OPENCOVER_POLICY_NUMBER=MOC_NUMBER," +
				/*" WSRCC=(SELECT (case when OCM.WRSC_YN ='Y' then 'YES' else 'NO' end) FROM OPEN_COVER_MASTER OCM"+
				"            WHERE OCM.AMEND_ID=(SELECT MAX(AMEND_ID) FROM OPEN_COVER_MASTER WHERE MISSIPPI_OPENCOVER_NO=OCM.MISSIPPI_OPENCOVER_NO)"+
				"            AND OCM.MISSIPPI_OPENCOVER_NO=MOC_NUMBER),"+*/
				" CUSTOMER_ID=(SELECT PI.CUSTOMER_ID FROM PERSONAL_INFO PI,OPEN_COVER_MASTER OCM"+
				"            WHERE OCM.CUSTOMER_ID=PI.CUSTOMER_ID"+
				"            AND OCM.AMEND_ID=(SELECT MAX(AMEND_ID) FROM OPEN_COVER_MASTER WHERE MISSIPPI_OPENCOVER_NO=OCM.MISSIPPI_OPENCOVER_NO)"+
				"            AND PI.AMEND_ID=(SELECT MAX(AMEND_ID) FROM PERSONAL_INFO WHERE CUSTOMER_ID=PI.CUSTOMER_ID)"+
				"            AND OCM.MISSIPPI_OPENCOVER_NO=MOC_NUMBER),"+
				" CUSTOMER_NAME=(SELECT PI.FIRST_NAME FROM PERSONAL_INFO PI,OPEN_COVER_MASTER OCM"+
				"            WHERE OCM.CUSTOMER_ID=PI.CUSTOMER_ID"+
				"            AND OCM.AMEND_ID=(SELECT MAX(AMEND_ID) FROM OPEN_COVER_MASTER WHERE MISSIPPI_OPENCOVER_NO=OCM.MISSIPPI_OPENCOVER_NO)"+
				"            AND PI.AMEND_ID=(SELECT MAX(AMEND_ID) FROM PERSONAL_INFO WHERE CUSTOMER_ID=PI.CUSTOMER_ID)"+
				"            AND OCM.MISSIPPI_OPENCOVER_NO=MOC_NUMBER),"+
				" ADDRESS1=(SELECT PI.ADDRESS1 FROM PERSONAL_INFO PI,OPEN_COVER_MASTER OCM"+
				"            WHERE OCM.CUSTOMER_ID=PI.CUSTOMER_ID"+
				"            AND OCM.AMEND_ID=(SELECT MAX(AMEND_ID) FROM OPEN_COVER_MASTER WHERE MISSIPPI_OPENCOVER_NO=OCM.MISSIPPI_OPENCOVER_NO)"+
				"            AND PI.AMEND_ID=(SELECT MAX(AMEND_ID) FROM PERSONAL_INFO WHERE CUSTOMER_ID=PI.CUSTOMER_ID)"+
				"            AND OCM.MISSIPPI_OPENCOVER_NO=MOC_NUMBER),"+
				" ADDRESS2=(SELECT PI.ADDRESS2 FROM PERSONAL_INFO PI,OPEN_COVER_MASTER OCM"+
				"            WHERE OCM.CUSTOMER_ID=PI.CUSTOMER_ID"+
				"            AND OCM.AMEND_ID=(SELECT MAX(AMEND_ID) FROM OPEN_COVER_MASTER WHERE MISSIPPI_OPENCOVER_NO=OCM.MISSIPPI_OPENCOVER_NO)"+
				"            AND PI.AMEND_ID=(SELECT MAX(AMEND_ID) FROM PERSONAL_INFO WHERE CUSTOMER_ID=PI.CUSTOMER_ID)"+
				"            AND OCM.MISSIPPI_OPENCOVER_NO=MOC_NUMBER),"+
				" PO_BOX=(SELECT PI.POBOX FROM PERSONAL_INFO PI,OPEN_COVER_MASTER OCM"+
				"            WHERE OCM.CUSTOMER_ID=PI.CUSTOMER_ID"+
				"            AND OCM.AMEND_ID=(SELECT MAX(AMEND_ID) FROM OPEN_COVER_MASTER WHERE MISSIPPI_OPENCOVER_NO=OCM.MISSIPPI_OPENCOVER_NO)"+
				"            AND PI.AMEND_ID=(SELECT MAX(AMEND_ID) FROM PERSONAL_INFO WHERE CUSTOMER_ID=PI.CUSTOMER_ID)"+
				"            AND OCM.MISSIPPI_OPENCOVER_NO=MOC_NUMBER),"+
				" COUNTRY=(SELECT PI.COUNTRY FROM PERSONAL_INFO PI,OPEN_COVER_MASTER OCM"+
				"            WHERE OCM.CUSTOMER_ID=PI.CUSTOMER_ID"+
				"            AND OCM.AMEND_ID=(SELECT MAX(AMEND_ID) FROM OPEN_COVER_MASTER WHERE MISSIPPI_OPENCOVER_NO=OCM.MISSIPPI_OPENCOVER_NO)"+
				"            AND PI.AMEND_ID=(SELECT MAX(AMEND_ID) FROM PERSONAL_INFO WHERE CUSTOMER_ID=PI.CUSTOMER_ID)"+
				"            AND OCM.MISSIPPI_OPENCOVER_NO=MOC_NUMBER),"+
				" EMIRATE=(SELECT PI.EMIRATE FROM PERSONAL_INFO PI,OPEN_COVER_MASTER OCM"+
				"            WHERE OCM.CUSTOMER_ID=PI.CUSTOMER_ID"+
				"            AND OCM.AMEND_ID=(SELECT MAX(AMEND_ID) FROM OPEN_COVER_MASTER WHERE MISSIPPI_OPENCOVER_NO=OCM.MISSIPPI_OPENCOVER_NO)"+
				"            AND PI.AMEND_ID=(SELECT MAX(AMEND_ID) FROM PERSONAL_INFO WHERE CUSTOMER_ID=PI.CUSTOMER_ID)"+
				"            AND OCM.MISSIPPI_OPENCOVER_NO=MOC_NUMBER),"+
				" MOBILE_NUMBER=(SELECT PI.MOBILE FROM PERSONAL_INFO PI,OPEN_COVER_MASTER OCM"+
				"            WHERE OCM.CUSTOMER_ID=PI.CUSTOMER_ID"+
				"            AND OCM.AMEND_ID=(SELECT MAX(AMEND_ID) FROM OPEN_COVER_MASTER WHERE MISSIPPI_OPENCOVER_NO=OCM.MISSIPPI_OPENCOVER_NO)"+
				"            AND PI.AMEND_ID=(SELECT MAX(AMEND_ID) FROM PERSONAL_INFO WHERE CUSTOMER_ID=PI.CUSTOMER_ID)"+
				"            AND OCM.MISSIPPI_OPENCOVER_NO=MOC_NUMBER),"+
				" CUST_TITLE=(SELECT PI.TITLE FROM PERSONAL_INFO PI,OPEN_COVER_MASTER OCM"+
				"            WHERE OCM.CUSTOMER_ID=PI.CUSTOMER_ID"+
				"            AND OCM.AMEND_ID=(SELECT MAX(AMEND_ID) FROM OPEN_COVER_MASTER WHERE MISSIPPI_OPENCOVER_NO=OCM.MISSIPPI_OPENCOVER_NO)"+
				"            AND PI.AMEND_ID=(SELECT MAX(AMEND_ID) FROM PERSONAL_INFO WHERE CUSTOMER_ID=PI.CUSTOMER_ID)"+
				"            AND OCM.MISSIPPI_OPENCOVER_NO=MOC_NUMBER),"+
				" EMAIL=(SELECT PI.EMAIL FROM PERSONAL_INFO PI,OPEN_COVER_MASTER OCM"+
				"            WHERE OCM.CUSTOMER_ID=PI.CUSTOMER_ID"+
				"            AND OCM.AMEND_ID=(SELECT MAX(AMEND_ID) FROM OPEN_COVER_MASTER WHERE MISSIPPI_OPENCOVER_NO=OCM.MISSIPPI_OPENCOVER_NO)"+
				"            AND PI.AMEND_ID=(SELECT MAX(AMEND_ID) FROM PERSONAL_INFO WHERE CUSTOMER_ID=PI.CUSTOMER_ID)"+
				"            AND OCM.MISSIPPI_OPENCOVER_NO=MOC_NUMBER),"+
				" CUST_CORE_APP_CODE=(SELECT MISSIPPI_CUSTOMER_CODE FROM PERSONAL_INFO PI,OPEN_COVER_MASTER OCM"+
				"            WHERE OCM.CUSTOMER_ID=PI.CUSTOMER_ID"+
				"            AND OCM.AMEND_ID=(SELECT MAX(AMEND_ID) FROM OPEN_COVER_MASTER WHERE MISSIPPI_OPENCOVER_NO=OCM.MISSIPPI_OPENCOVER_NO)"+
				"            AND PI.AMEND_ID=(SELECT MAX(AMEND_ID) FROM PERSONAL_INFO WHERE CUSTOMER_ID=PI.CUSTOMER_ID)"+
				"            AND OCM.MISSIPPI_OPENCOVER_NO=MOC_NUMBER)"+
				" WHERE TRANSACTION_ID=? AND VALIDATION_ERROR IS NULL";
				System.out.println("customerUpdate"+customerUpdate);
				this.mytemplate.update(customerUpdate,new Object[]{tranId});
		
			
		} catch (Exception e) {
		
			e.printStackTrace();
			logger.info("updateOpenCoverDetail Error"+e);
		}
		
		logger.info("updateOpenCoverDetail Exit");
		
	}
	public void generateQuotations(String tranId) {
		QuotationService qs = new QuotationService();	
		System.out.println("generateQuotations Enters");
		SqlRowSet rs = this.mytemplate.queryForRowSet("select reference_number from webservice_marine_quote where transaction_id=?",new Object[]{tranId});
		while (rs.next()){
			QuotationModel qmi = new QuotationModel();
			qmi.setReferenceNo(rs.getString(1));
//			qmi.setFinalizeYn(finalizeYN==null?"":finalizeYN);
//			qmi.setQuoteStatus(quoteStatus==null?"":quoteStatus);
			QuotationResponse qs2 = qs.quotePremiumCalc(qmi);
			DefaultValue dv = qs2.getDefaultValue();
			Token.save(dv);
//		QuoteGeneration quoteGeneration = new QuoteGeneration();
//		PolicyGenerationAction generate = new PolicyGenerationAction(rs.getString(1));
//		String remarks= generate.quoteGeneration();
//		
//		String response = quoteGeneration.generateResponse(rs.getString(1),remarks);
//		System.out.println("Response ::"+rs.getString(1)+"::"+response);
		}
		System.out.println("generateQuotations Exits");
	}
	public void getResult(String tranId, String movementDetailId) {
			
		String destTable = (String)this.mytemplate.queryForObject("select destination_table from xl_movement_detail where movement_detail_id=?",new Object[]{movementDetailId},String.class);
		
		try {
			String count =(String)this.mytemplate.queryForObject("select (select count(*) from "+destTable+" where transaction_id=?)+(select count(*) from webservice_marine_quote where transaction_id=?) from dual", new Object[]{tranId,tranId},String.class);
			System.out.println("Total No Of Records::"+ count);
			this.mytemplate.update("update xl_transaction_details set total_no_of_records=? where transaction_id=?",new Object[]{count,tranId});
						 
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	
        System.out.println("getResult() - Exit");
		
	}
	
	public List getResult2(String tranId, String movementDetailId) {
		String destTable = (String)this.mytemplate.queryForObject("select destination_table from xl_movement_detail where movement_detail_id=?",new Object[]{movementDetailId},String.class);
				
		try {
			String updateTransaction =  "update XL_TRANSACTION_DETAILS set UPLOADED_COUNT=(select (select q.TOTAL_NO_OF_RECORDS from XL_TRANSACTION_DETAILS q where transaction_id=?)-(select count(*) from "+destTable+" where transaction_id=?) from dual),PENDING_COUNT=(select count(*) from "+destTable+" where transaction_id=?) where transaction_id=?";
			this.mytemplate.update(updateTransaction, new Object[]{tranId,tranId,tranId,tranId});
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		List uploadResult=this.mytemplate.queryForList("SELECT TOTAL_NO_OF_RECORDS, UPLOADED_COUNT, PENDING_COUNT FROM XL_TRANSACTION_DETAILS WHERE TRANSACTION_ID=?", new String[]{tranId});
		System.out.println("getResult2() - Exit");
		return uploadResult;
	}
	public List<Object> getErrorList(String sno, String tranId) {
		System.out.println("Enter getErrorList");
		List<Object> list = null;
		try {
			list=api.getErrorList(tranId);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public List getErrorListBk(String tranId) {
		
		System.out.println("Enter getErrorList");
		List list = null;
		try {
			list = this.mytemplate.queryForList("select * from xl_opencover_raw where transaction_id=? and validation_error is not null",new Object[]{tranId});
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		System.out.println("Enter getErrorList");
		return list;
	}
	public List<Object> getUploadedList(String tranId) {
		System.out.println("Enter getUploadedList");
		List<Object> list = null;
		try {
			list=api.getUploadedList(tranId);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public String getBrokerId(String loginId) {
		System.out.println("Enter getBrokerId");
		String brokerId="";
		try {
			brokerId = (String)this.mytemplate.queryForObject("SELECT OA_CODE FROM LOGIN_MASTER WHERE LOGIN_ID=?",new Object[]{loginId},String.class);
			System.out.println("Exit getBrokerId");
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return brokerId;
	}
	public String getcustomerId(String openCoverNo) {
		System.out.println("Enter getcustomerId");
		String customerId="";
		try {
			String query= getQuery("declaration.getcustomerId");
			customerId = (String)this.mytemplate.queryForObject(query,new Object[]{openCoverNo,openCoverNo},String.class);
			System.out.println("Exit getcustomerId");
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return customerId;
	} 
	@SuppressWarnings("unchecked")
	public List<Object> getTransactions(String openCoverNo, String issuerId) {
		System.out.println("Enter getTransactions");
		List<Object> list = null;
		try {
			list=api.getTransactionList(openCoverNo,issuerId);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public  int nthOccurrence(String str, char c, int n) { 
		int pos = str.indexOf(c, 0);   
		while (n-- > 0 && pos != -1)   
			pos = str.indexOf(c, pos+1); 
		return pos; 
		} 
		
	public List getTypeInfo(String typeId,String campaignId, String partnerId)
	{
		logger.info("getTypeInfo - Enter");
		List list=null;
	
		try {
			sql = "SELECT DESTINATION_TABLE FROM XL_MOVEMENT_DETAIL WHERE MOVEMENT_ID='1' and product_id=? and campaign_id= ? and partner_id=? and status='Y'";
			list=this.mytemplate.queryForList(sql, new String[]{typeId,campaignId,partnerId});
		} catch (Exception e) {
			
			logger.debug("EXCEPTION @ { "+e+" }");
		}
		logger.info("getTypeInfo - Exit || Result: "+list.size());
		
		return list;
	}

	

	public String insertTransactionDetails(String loginId, String fileName, String folderPath, String movementDetailId, String tranId2) 
	{
		String resultTranId = "";
		int count = this.mytemplate.queryForInt("select count(*) from XL_TRANSACTION_DETAILS where transaction_id ='"+tranId2+"'");
		if(count==0){
		 //int tranId=this.mytemplate.queryForInt("SELECT TRANSACTION_NO.NEXTVAL FROM DUAL");
		
		String args[]=new String[5];
		args[0]=tranId2+"";
		args[1]=loginId;
		args[2]=fileName;
		args[3]=folderPath;
		args[4]=movementDetailId;
		sql="INSERT INTO XL_TRANSACTION_DETAILS (TRANSACTION_ID,TRANSACTION_DATE,USER_NAME,FILE_NAME,PATH,ACTIVE,MOVEMENT_DETAIL_ID) " +
				" VALUES(?,SYSDATE,?,?,?,'Y',?)";
		int result=this.mytemplate.update(sql,args);
		System.out.println("insertTransactionDetails() - Exit || Result: "+result+" Tran Id: "+tranId2);
		resultTranId=tranId2+"";
		}
		else
		{
			//sql= "delete from XL_OPENCOVER_RAW WHERE TRANSACTION_ID=?";
			//this.mytemplate.update(sql,new Object[]{tranId2});
			resultTranId=tranId2;
		}
		return resultTranId;
	}


	public List getMovements(String product, String partner, String campaign) {
		
		List movements = null;
		String sql = "SELECT MOVEMENT_DETAIL_ID FROM XL_MOVEMENT_DETAIL WHERE MOVEMENT_ID<>1 AND PRODUCT_ID=? AND PARTNER_ID=? AND CAMPAIGN_ID=?  AND STATUS='Y' AND MOVEMENT_TYPE='A' ORDER BY PRIORITY ASC";
		   movements= this.mytemplate.queryForList(sql,new Object[]{product,partner,campaign});
		return movements;
	}
	public List getExcelMovement(String product, String partner, String campaign) {
		
		//logger.info("getExcelMovement");
		List movements = null;
		String sql = "SELECT MOVEMENT_DETAIL_ID FROM XL_MOVEMENT_DETAIL WHERE MOVEMENT_ID=1 AND PRODUCT_ID=? AND PARTNER_ID=? AND CAMPAIGN_ID=?  AND STATUS='Y' ORDER BY PRIORITY ASC";
	    movements= this.mytemplate.queryForList(sql,new Object[]{product,partner,campaign});
	    //logger.info("getExcelMovement query "+ sql);
		return movements;
	}
	public String getTransDesc(String transId) {
		
		String transDesc = (String) this.mytemplate.queryForObject("select transaction_description from xl_transaction_details where transaction_id=?",new Object[]{transId},String.class);
		return transDesc;
	}
	public void updateIssuer(String issuer , String tranId) {
		
		this.mytemplate.update("update webservice_marine_quote set issuer=? where transaction_id=?",new Object[]{issuer,tranId});
	}

	public List<Object> getCommodityList(String openCover) {
		List ocList=null;
		try{
			String sql=getQuery("GET_COMMODITY_LIST_OC");
			logger.info("Query====>"+sql);
			ocList=this.mytemplate.queryForList(sql,new Object[]{openCover});
		}catch(Exception e){
			e.printStackTrace();
		}
		return ocList;
	}
	
	public void reuploadSave(final UploadAction up, String bcode) {
		logger.info("ENETR==>reuploadSave");
		try{
			for(int i=1; i<up.getUsno().size();i++){
				Object args[]=new Object[]{i, up.getUinterest().get(i), up.getUconveyance().get(i),bcode,up.getUcover().get(i), up.getUcover().get(i),up.getUvoyageFrom().get(i),
						up.getUvoyageTo().get(i),up.getUcurrency().get(i), bcode, up.getUincoTerms().get(i),up.getUsaleTermPercent().get(i), bcode,up.getUtolerance().get(i), bcode,
						up.getUpkgDesc().get(i),up.getUcommodityDesc().get(i), up.getUwar().get(i),"", up.getTranId(), up.getUsno().get(i)};
				for(Object k:args)
					logger.info("args===>"+k.toString());
				String sql=getQuery("UPD_XL_OPENCOVER_RAW_UPLOAD");
				this.mytemplate.update(sql,args);
				sql=getQuery("UPD_XL_OPENCOVER_ARC_UPLOAD");
				this.mytemplate.update(sql,args);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		logger.info("EXIT==>reuploadSave");
	}
	
	public String getWarYNOC(String openCoverNo) {
		logger.info("ENETR==>getWarYNOC");
		String warYN="";
		try{
			logger.info("args===>"+openCoverNo);
			String sql=getQuery("GET_WARYN_OPENCOVER");
			warYN=this.mytemplate.queryForObject(sql,new Object[]{openCoverNo}, String.class).toString();
		}catch(Exception e){
			e.printStackTrace();
		}
		logger.info("EXIT==>getWarYNOC");
		return warYN;
	}
	public String getUploadType(String docId) {
		String result = "";
		try {
			//String query = getQuery("GET_MOTOR_SELECTED_POLICY");
			String query = getQuery("GET_UPLOAD_TYPE");
			Object[] args = new Object[]{docId};
			logger.info("Query==>" + query);
			logger.info("Args==>" + StringUtils.join(args,", "));
			result = (String) this.mytemplate.queryForObject(query, args, String.class);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return StringUtils.isBlank(result)?"":result;
	}
	
	public void insertDocumentDetails(String quoteNo, String documentId, String documentPath, String docDesc, String fileName, String productId, String vehicleId,String uploadType,String docId) {
		try {
			String query = "";
			Object[] args = null;
			query = getQuery("INS_DOCUMENTS1");
			args = new Object[10];
			args[0] = quoteNo;
			args[1] = documentId;
			args[2] = documentPath;
			args[3] = docDesc;
			args[4] = "Y";
			args[5] = fileName;
			args[6]=productId;
			if("65".equalsIgnoreCase(productId)){
				args[7]=vehicleId;
			}else if("30".equalsIgnoreCase(productId)){
				args[7]="";
			}else{
				args[7]="";
			}
			args[8]=uploadType==null?"POLICY":uploadType;
			args[9]=docId;
			logger.info("Query==>" + query);
			logger.info("Args==>" + StringUtils.join(args,", "));
			this.mytemplate.update(query,args);
		} catch(Exception exception) {
			exception.printStackTrace();
		}
	}
	public void deleteDocument(String filePath) {
		Object[] args={filePath};
		try {
			String query =getQuery("DEL_DOCUMENTS");
			this.mytemplate.update(query, args);
		}catch(Exception exception) {
			exception.printStackTrace();
		}		
	}
	public List<Map<String, Object>> getUploadDocList(String productId,String quoteNo, String vehicleId) {
		List<Map<String,Object>> resultList = new ArrayList<Map<String,Object>>();
		try {
			String query = "";
			Object[] args=null;
				if("30".equalsIgnoreCase(productId)){
					args=new Object[]{quoteNo,productId};
					query = getQuery("GET_UPLOAD_DOCUMENTS_LIST_HOME");
				}else if("65".equalsIgnoreCase(productId) || "33".equalsIgnoreCase(productId)){
					args=new Object[]{quoteNo,productId,vehicleId};
					query = getQuery("GET_UPLOAD_DOCUMENTS_LIST_MOTOR");
				}else if("75".equalsIgnoreCase(productId)){
					args=new Object[]{quoteNo,productId}; //Here Quote Number is the tran id
					query = getQuery("GET_UPLOAD_DOCUMENTS_LIST_MOTOR_FLEET");
				}
			logger.info("Query==>" + query);
			logger.info("Args==>" + StringUtils.join(args,", "));
			resultList=this.mytemplate.queryForList(query, args);
		} catch(Exception exception) {
			exception.printStackTrace();
		}

		return resultList;
	}
	
	public String getTransactionId() {
		String result="";
		try{
			logger.info("Enter into the getTransactionID()");
			String sql="SELECT MAX(BATCH_ID)+1 FROM  batchupload_tran_details";
			result= this.mytemplate.queryForObject(sql,String.class).toString();
			logger.info("Exit From the getTransactionID()");
		}catch (Exception e) {
			e.printStackTrace();
			logger.info(e);
		}
		return result;
	} 
	
	
	public void insertTransaction(String tranId, String fileName, String typeId){
		sql="INSERT INTO batchupload_tran_details (ENTRY_DATE,BATCH_ID,BATCH_DESC,BATCH_TYPE,status,VALID_RECORDS,DUPLICATE_RECORDS,ERROR_RECORDS) VALUES(getdate(),?,?,?,'U',0,0,0)";
		Object []args=new Object[]{tranId,fileName,typeId};
		logger.info("Query "+sql);
		logger.info("Args"+StringUtils.join(args,","));
		this.mytemplate.update(sql,args);
	}
	public List<Object> getTypeList() {
		logger.info("getTypeList - Enter");
        List list = null;
        try {
        	String query ="SELECT TYPE_ID,TYPE_NAME FROM type_master WHERE STATUS='Y'";
        	logger.info("Query: " + query);
            list = this.mytemplate.queryForList(query);
            logger.info("getTypeList Size=>"+list.size());
        } catch (Exception e) {
        	logger.error("Exception in getTotalRecords => "+ e);
        }
        logger.info("getTypeList - Exit");
        return list;
    }
	
	/*public void renewalTime(String tranId,String status) {
		try{
			sql="INSERT INTO RENEWAL_GET_TIME (TRAN_ID,POSITION,ERROR_MESSAGE) VALUES(?,?,'')";
			this.mytemplate.update(sql, new Object[]{tranId,status});
		}catch(Exception e){
			e.printStackTrace();
		}
	}*/
	
	public int updateMovement(String status, String tranId, String error) {
		int updCount = 0;
		try {
			sql = "UPDATE batchupload_tran_details SET  status = '"+status+"' WHERE BATCH_ID='"+tranId+"'";
			logger.info("Query "+sql);
			this.mytemplate.update(sql);
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return updCount;
	}
	
	public List getTypeInfo(String typeId) {
		System.out.println("getTypeInfo - Enter");
		List list = null;
		try {
			String query = "SELECT TYPE_NAME, RAW_TABLE_NAME, TABLE_NAME FROM TYPE_MASTER WHERE TYPE_ID=?";
			list = this.mytemplate.queryForList(query, new Object[] { typeId });
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("EXCEPTION @ { " + e + " }");
		}
		System.out.println("getTypeInfo - Exit || Result: " + list.size());
		return list;
	}
	public String insertRawData(String fields,final List records, String tranId,String fileName,String filePath,String fileType,String rawTable, String typeId, String mfrType) {
		logger.info("Enter into insertRawDataTxt()-->Record Size => "+records.size()+"tranId =>"+tranId);
		String errorMsg="";
		String sql = "";
		String[] queries=new String[0];
		int totLinesProcessed = 0, i, j=0;
		int prev=0, lineNo=0;
		try 
		{ 
			if(!records.isEmpty())
			{ 
					try{
						//renewalTime(tranId,"Starting RAW");
						int splitValue = 0;
						queries=new String[records.size()];
						for(i=0; i<records.size(); i++){
							sql="INSERT INTO "+rawTable +"("+fields+",BATCH_ID,BRANCH_CODE) VALUES ("+StringUtils.trim(records.get(i).toString())+","+tranId+",01)";
							queries[i]=sql;
							totLinesProcessed = i+1;
						}
						if(queries.length>0){
							logger.info("queries Length=>"+queries.length+" TranId => "+tranId);
							if(queries.length<=2000)
								this.mytemplate.batchUpdate(queries);
							else{
								splitValue =(int) Math.round(queries.length*(0.10));
								logger.info("split Value => "+splitValue+" TranId => "+tranId);
								for(int w=0;w<queries.length;){
									String[] tempArray = Arrays.copyOfRange(queries, w, (w+splitValue) > queries.length?queries.length:(w+splitValue));
									if((w+splitValue) > queries.length)
										logger.info("stringArray between "+w+" and "+queries.length+" TranId => "+tranId);
									else
										logger.info("stringArray between "+w+" and "+(w+splitValue)+" TranId => "+tranId);
									this.mytemplate.batchUpdate(tempArray);
									w=w+splitValue;
								}
							}
						}
					}
					catch (Exception e){
						logger.info("Error Sql =>"+sql+" TranId => "+tranId);
						logger.info("Exception Occured @ insertRawData "+e+" TranId => "+tranId);
						String excepMsg = e.getMessage();
						if(excepMsg!=null && excepMsg.contains("not enough values")) {
							errorMsg+= "~Uploaded file has not enough values";
							updateMovement("E", tranId, errorMsg);
							prev = lineNo;
						}
						else
							if(excepMsg!=null && excepMsg.contains("invalid number") || excepMsg.contains("value too large for column")) {
								errorMsg+= "~Uploaded file contains invalid number";
								updateMovement("E", tranId, errorMsg);
							}
						else
						if(excepMsg!=null && excepMsg.contains("ORA-")) {
							errorMsg+= excepMsg.substring(excepMsg.indexOf("ORA-"),excepMsg.length());
						}
						else
						{
							errorMsg+= "Uploaded file contains invalid file format";
							updateMovement("E", tranId, errorMsg);
						}
					}
					if(totLinesProcessed>0) {
						sql = "UPDATE batchupload_tran_details SET TOTAL_RECORDS=?, VALID_RECORDS=0, NOT_UPLOADED=0, DUPLICATE_RECORDS=0, status = 'R' WHERE BATCH_ID=?";
						Object []args=new Object[]{totLinesProcessed,tranId};
						logger.info("Query "+sql);
						logger.info("Args"+StringUtils.join(args,","));
						this.mytemplate.update(sql,args);
					} 
				} 
			}catch (Exception e){
				logger.info("Error Sql==>"+sql);
				logger.debug("EXCEPTION @ { "+e+" }");
				String excepMsg = e.getMessage();
				if(excepMsg!=null && excepMsg.contains("not enough values")) {
					errorMsg= "Uploaded file contains invalid data in line no: "+(totLinesProcessed+1);
					updateMovement("E", tranId, errorMsg);
				}
					
				else
				if(excepMsg!=null && excepMsg.contains("ORA-")) 
					errorMsg += excepMsg.substring(excepMsg.indexOf("ORA-"),excepMsg.length());
				else
					errorMsg+= "Uploaded file contains invalid file format";
			}
			if(errorMsg!=null && !errorMsg.equals("")){
				updateMovement("E", tranId, errorMsg);
				sql="delete from "+rawTable+" where BATCH_ID=?";
				this.mytemplate.update(sql,new Object[]{tranId});
			}
			logger.info("insertRawData() - Exit || Error: "+errorMsg);
			return errorMsg;
		}
	public Map<String, Object> moveToMaster(String tranId,String typeId){
		/*List uploadResult=null;
		String query = "",total = "",moved="";
		logger.info("moveToMaster() - Enter");
		this.mytemplate.update("call NEW_DATA_UPLOAD(?,?,?,?)", new Object[]{typeId,tranId,"",""});
		//renewalTime(tranId,"Starting MASTER");
		logger.info("moveToMaster() - Exit");
		return uploadResult;*/
		Map<String,Object> outputValues = null;
		SimpleJdbcCall procedure= mySimpleJdbcCall.withProcedureName("NEW_DATA_UPLOAD");
		Map<String,Object> inputValues=new java.util.TreeMap<String, Object>(String.CASE_INSENSITIVE_ORDER);
		inputValues.put("Pvtype", typeId);
		inputValues.put("pvbatch", Integer.parseInt(tranId));
     	inputValues.put("PVBROKER", "0");
     	outputValues = procedure.execute(new MapSqlParameterSource(inputValues));
		return outputValues;
		}
	
	public List<Map<String, Object>> TransactionDetails(String tran_id) {
		String ttotal= "",tupload= "",tnotUpload= "",tduplicate= "";
		 List list = null;
	        try {
	        	String query = "SELECT TOTAL_RECORDS,VALID_RECORDS,NOT_UPLOADED,DUPLICATE_RECORDS FROM batchupload_tran_details WHERE BATCH_ID=?";
	        	logger.info("Query: " + query);
	            list = this.mytemplate.queryForList(query,new Object[]{tran_id});
	        } catch (Exception e) {
	        	e.printStackTrace();
	        }
	        logger.info("getTypeList - Exit");
	        return list;
	}
	public List getTransactionList(String tran_id){
		List translst=null;
		logger.info("getTransactionList() - Enter");
		try {
			String query = "SELECT BATCH_ID,ENTRY_DATE,status,TOTAL_RECORDS,VALID_RECORDS,NOT_UPLOADED,DUPLICATE_RECORDS FROM batchupload_tran_details WHERE BATCH_TYPE=?";
			Object arg[] = new Object[]{"101"};
			logger.info("Query ==> "+query);
			logger.info("args ==> "+StringUtils.join(arg,","));
				
			translst=this.mytemplate.queryForList(query,arg);
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		logger.info("getTransactionList() - Exit");
		return translst;
	}
	public List<Map<String, Object>> getUploadList(String tranId,String typeId) {
		List uploadlst=null;
		try{
			String query="SELECT NAJM_MODEL_ID,NAJM_MAKE_ID,NAJM_MAKE_DESC,NAJM_MODEL_DESC,NAJM_MODEL_DESC_AR,COUNTRY_NAME,VEHICLE_USE_DESC,BODYTYPE_DESC,YAKEEN_MAKE_ID,YAKEEN_MODEL_ID FROM MOTOR_MAKEMODEL_MASTER WHERE BATCH_ID=?";
			Object args[] = new Object[]{tranId};
			uploadlst=this.mytemplate.queryForList(query,args);
		}catch(Exception e){
			e.printStackTrace();
		}
		return uploadlst;
	}
	public List<Map<String, Object>> getDupList(String tranId, String typeId) {
		List dupList=null;
		try{
			String query="SELECT NAJM_MODEL_ID,NAJM_MAKE_ID,NAJM_MAKE_DESC,NAJM_MODEL_DESC,NAJM_MODEL_DESC_AR,COUNTRY_NAME,VEHICLE_USE_DESC,BODYTYPE_DESC,YAKEEN_MAKE_ID,YAKEEN_MODEL_ID FROM motor_model_upload_error WHERE BATCH_ID=?";
			Object args[] = new Object[]{tranId};
			dupList=this.mytemplate.queryForList(query,args);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		return dupList;
	}
	public List getDBColumnHeader(String typeId) throws BaseException
	{
		logger.info("getDBColumns - Enter || typeId: "+typeId);
		List list=null;
		try {
			sql = "SELECT EXCEL_HEADER_NAME,DATABASE_FIELD_NAME,REMARKS,DATATYPE,MANDATORY_YN FROM upload_config_master WHERE TYPE_ID=? and STATUS='Y' ORDER BY SNO";
			list=this.mytemplate.queryForList(sql,new String[] {typeId});
		} catch (Exception e) {
			// TODO Auto-generated catch block
			logger.debug("EXCEPTION @ { "+e+" }");
		}
		logger.info("getDBColumns - Exit || Result: "+list.size());
		
		return list;
	}
	
	public List<Map<String, Object>> getAttachmentDocList(String productId, String contentId) {
		List<Map<String,Object>> resultList = new ArrayList<Map<String,Object>>();
		try {
			String query = "";
			Object[] args=null;
					args=new Object[]{productId,contentId};
					query = getQuery("GET_EMAIL_ATTACHMENT_LIST");
			logger.info("Query==>" + query);
			logger.info("Args==>" + StringUtils.join(args,", "));
			resultList=this.mytemplate.queryForList(query, args);
		} catch(Exception exception) {
			exception.printStackTrace();
		}

		return resultList;
	}
	
	public void insertAttachmentDetails(String ContentId,String documentPath, String docDesc, String fileName, String productId,String remarks) {
		try {
			String query = "";
			Object[] args = null;
			//Insert into EMAIL_ATTACHMENT_DETAILS (DOC_ID, CONTENT_ID, FILE_PATH_NAME, DESCRIPTION, PRODUCT_ID, STATUS, FILE_NAME) 
			//Values (select max((doc_id+1),0) from EMAIL_ATTACHMENT_DETAILS, ?, ?, ?, ?, ?, ?)
			query = getQuery("INS_ATTACHMENT");
			args = new Object[7];
			args[0] = ContentId;
			args[1] = documentPath;
			args[2] = docDesc;
			args[3] = productId;
			args[4] = "Y";
			args[5] = fileName;
			args[6] = remarks;
			logger.info("Query==>" + query);
			logger.info("Args==>" + StringUtils.join(args,", "));
			this.mytemplate.update(query,args);
		} catch(Exception exception) {
			exception.printStackTrace();
		}
	}
	
	public void deleteAttachment(String filePath,String docId) {
		Object[] args={filePath,docId};
		try {
			String query =getQuery("DEL_ATTACHMENT");
			this.mytemplate.update(query, args);
			logger.info("Query==>" + query);
			logger.info("Args==>" + StringUtils.join(args,", "));
		}catch(Exception exception) {
			exception.printStackTrace();
		}		
	}
}
