package com.maan.marinevehicle.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.Logger;
import org.springframework.dao.DataAccessException;
import org.springframework.util.CollectionUtils;

import com.maan.DBCon.DBConnection;
import com.maan.common.DBConstants;
import com.maan.common.LogUtil;
import com.maan.common.MyJdbcTemplate;
import com.maan.common.runner;
import com.maan.common.dao.CommonDAO;
import com.maan.common.exception.BaseException;
import com.maan.marinevehicle.MarineVehicleBean;

public class MarineVehicleDAO  extends MyJdbcTemplate{
	final Logger logger = LogUtil.getLogger(MarineVehicleDAO.class);
	public String sql="";
	DecimalFormat df = new DecimalFormat("####0.00");
	public List<Map<String, Object>> getMarinevehicleDetails(String proposalNo, String searchType, String searchValue, String status) {
		List<Map<String,Object>> result=new ArrayList<Map<String,Object>>();
		try{
			
				sql=getQuery(DBConstants.MARINE_VEHICLE_DETAILS);
				result=this.mytemplate.queryForList(sql,new Object[]{proposalNo,proposalNo,status});
			
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
		
	}
	
	public List getDBColumns(String typeId) throws BaseException
	{
		logger.info("getDBColumns - Enter || typeId: "+typeId);
		List list=null;
		try {
			sql=getQuery("GET_DB_COLUMS");
			//sql = "SELECT DB_COLUMN_NAME,EXCEL_HEADER_NAME,DATA_TYPE FROM TMAS_VALIDATION WHERE ACTIVE='Y'";
			list=this.mytemplate.queryForList(sql);
		} catch (Exception e) {
			logger.debug("EXCEPTION @ { "+e+" }");
		}
		logger.info("getDBColumns - Exit || Result: "+list.size());
		
		return list;
	}
	public String insertRawData1(String fields,final List records, String tranId,String fileName,String filePath,String proposalNo, String reUpload, String baseOpenCoverNo,String endtYN) {
		return endtYN;/*
		logger.info("insertRawData() - Enter || recordsCount: "+records.size());
		//String[] queries=new String[0]; 
		String errorMsg="";
		int totLinesProcessed = 0, i, j=0;
		int prev=0, lineNo=0;
		try 
		{ 
			for(i=0; i<records.size(); i++)
			{
				int count=0;
				int count1=0;
				int count2=0;
			String[] sno=StringUtils.trim(records.get(i).toString()).split(",");
			sql="select count(*) from OPEN_COVER_HAULIER_DETAILS OCHD where "+sno[10]+" between START_LIMIT and END_LIMIT and HAULIER_CATEGORY_ID=(select CATEGORY_DETAIL_ID from constant_detail where DETAIL_NAME="+sno[1]+" and RSACODE='HAULIERCATG' and CATEGORY_ID =167) and  proposal_no="+proposalNo+" and amend_id=(select max(amend_id) from OPEN_COVER_HAULIER_DETAILS where proposal_no=OCHD.proposal_no )";
			count=this.mytemplate.queryForInt(sql);
			if(count==0){
				errorMsg+="~Limit "+sno[10]+" is Not in a Range for Sno "+sno[0];
			}
			sql="select count(*) from open_cover_master ocm where CONVERT(date,"+sno[9]+",103) between POLICY_START_DATE and POLICY_END_DATE and PROPOSAL_NO="+proposalNo+" and AMEND_ID=(select max(amend_id) from OPEN_COVER_MASTER where proposal_no=ocm.proposal_no )";
			count1=this.mytemplate.queryForInt(sql);
			if(count1==0){
				errorMsg+="~Effective Date "+sno[9]+" Must be in a Range of policy Start Date and Policy End Date for Sno "+sno[0];
			}
			sql="select count(*)  where CONVERT(date,"+sno[9]+",103) < (select CONVERT(date,max(INCEPTION_DATE),103) from MARINE_VEHICLE_DETAILS where BASE_OPEN_COVER_NO='"+baseOpenCoverNo +"')";
				count2=this.mytemplate.queryForInt(sql);
				if(count2!=0){
					errorMsg+="~Effective Date "+sno[9]+" Must be in Greater than existing uploaded Effective date for Sno "+sno[0];
				}	
			}
			if(errorMsg.isEmpty()){
			if(!records.isEmpty())
			{ 
				if(reUpload!=null && reUpload.equals("Y")){
					sql="select sum(convert(decimal(15,2),cast(ACTUAL_PREMIUM as float)))  from marine_vehicle_details where status='Y' and proposal_no="+proposalNo;
					String amount=(String) this.mytemplate.queryForObject(sql, String.class);
					sql="UPDATE OPEN_COVER_MOP_DETAILS  SET Recevied_Til_Date=isnull(Recevied_Til_Date,0)-convert(decimal(15,2),cast("+amount+" as float)) WHERE OPEN_COVER_MOP_DETAILS.PROPOSAL_NO="+proposalNo;
					this.mytemplate.update(sql);
					sql="select distinct(tran_id) from marine_vehicle_details where status='Y' and proposal_no="+proposalNo;
					String trans=(String) this.mytemplate.queryForObject(sql, String.class);
					sql="update marine_vehicle_transaction_details set status='R' where tran_id=?";
					this.mytemplate.update(sql,new Object[]{trans});
					sql="delete from marine_vehicle_details where status='Y' and proposal_no="+proposalNo;
					this.mytemplate.update(sql);
					
					
				}
				for(i=0; i<records.size(); i++)
				{
					try{
						String[] sno1=StringUtils.trim(records.get(i).toString()).split(",");
						sql="select HAULIER_PREMIUM from OPEN_COVER_HAULIER_DETAILS OCHD where "+sno1[10]+" between START_LIMIT and END_LIMIT and proposal_no="+proposalNo+"  and HAULIER_CATEGORY_ID=(select CATEGORY_DETAIL_ID from constant_detail where DETAIL_NAME="+sno1[1]+" and RSACODE='HAULIERCATG' and CATEGORY_ID =167) and amend_id=(select max(amend_id) from OPEN_COVER_HAULIER_DETAILS where proposal_no=OCHD.proposal_no )";
						String premium=(String) this.mytemplate.queryForObject(sql, String.class);
					
						sql="select (datediff(DAY,CONVERT(date,"+sno1[9]+",103),CONVERT(date,POLICY_END_DATE,103))+1)  from open_cover_master where PROPOSAL_NO=? and AMEND_ID=(select max(AMEND_ID) from open_cover_master where PROPOSAL_NO=?)";
						String DiffDays=(String) this.mytemplate.queryForObject(sql, new Object[]{proposalNo,proposalNo},String.class);
						
						premium=String.valueOf((Double.parseDouble(premium)/365)*Double.parseDouble(DiffDays));
						
						sql="INSERT INTO marine_vehicle_details_raw ("+fields+",PROPOSAL_NO,ENTRY_DATE,TRAN_ID,STATUS,ACTUAL_PREMIUM,BASE_OPEN_COVER_NO,CHARGEBLE_DAYS) VALUES ('"+StringUtils.trim(records.get(i).toString())+","+proposalNo+",getdate(),"+tranId+",'Y',"+premium+",'"+baseOpenCoverNo+"',"+DiffDays+")";
					totLinesProcessed = i+1;
					logger.info("Total Lines Processed==>"+totLinesProcessed);
					logger.info("Sql==>"+sql);
					this.mytemplate.update(sql);
					}
					catch (Exception e){
						logger.info("Error Sql==>"+sql);
						logger.debug("EXCEPTION @ { "+e+" }");
						String excepMsg = e.getMessage();
						//String newline = System.getProperty("line.separator");
						if(excepMsg.contains("not enough values")) {
							lineNo = (totLinesProcessed+1)-j;
							if(prev != lineNo){
							errorMsg+= "~Uploaded file contains invalid data in line no: "+lineNo+"";
							j++;
							}
							prev = lineNo;
							
						}
						else
							if(excepMsg.contains("invalid number") || excepMsg.contains("value too large for column")) {
								lineNo = (totLinesProcessed+1)-j;
								if(prev != lineNo){
								errorMsg+= "~Uploaded file contains invalid data in line no: "+lineNo+"";
								}
								prev = lineNo;
								
							}
						else
						if(excepMsg.contains("ORA-")) {
							errorMsg= excepMsg.substring(excepMsg.indexOf("ORA-"),excepMsg.length());
						break;
						}
						else
						{
							errorMsg= "Uploaded file contains invalid file format";
							break;
						}

					}
					
				}
					if(totLinesProcessed>0) {
					sql="INSERT INTO marine_vehicle_transaction_details (tran_id,entry_date,upload_file_name,total_no_of_records,error_records,status,proposal_no,BASE_OPENCOVER_NO) VALUES(?,getdate(),?,?,?,?,?,?)";
					Object []args=new Object[]{tranId,fileName,totLinesProcessed,records.size()-totLinesProcessed,"N",proposalNo,baseOpenCoverNo};
					logger.info("Query "+sql);
					logger.info("Args"+StringUtils.join(args,","));
					this.mytemplate.update(sql,args);
				} 
			} 
			}
		}catch (Exception e){
			logger.info("Error Sql==>"+sql);
			logger.debug("EXCEPTION @ { "+e+" }");
			String excepMsg = e.getMessage();
			if(excepMsg.contains("not enough values")) {
				errorMsg= "Uploaded file contains invalid data in line no: "+(totLinesProcessed+1);
			}
				
			else
			if(excepMsg.contains("ORA-")) 
				errorMsg = excepMsg.substring(excepMsg.indexOf("ORA-"),excepMsg.length());
			else
				errorMsg= "Uploaded file contains invalid file format";
		}
		if(errorMsg!=null && !errorMsg.equals("")){
			sql="delete from Tmas_Workshop_Master_Raw where tran_id=?";
			this.mytemplate.update(sql,new Object[]{tranId});
		}
		logger.info("insertRawData() - Exit || Error: "+errorMsg);
		return errorMsg;
	*/}
	public String insertRawData(String fields,final List records, String tranId,String fileName,String filePath,String proposalNo, String reUpload, String baseOpenCoverNo,String endtYN, String openCoverNo) {
		logger.info("insertRawData() - Enter || recordsCount: "+records.size());
		//String[] queries=new String[0]; 
		String errorMsg="",vatTaxPrecent;
		int totLinesProcessed = 0, i, j=0;
		int prev=0, lineNo=0;
		
		vatTaxPrecent=getvatTaxprecent(openCoverNo);
		try 
		{ 
			/*for(i=0; i<records.size(); i++)
			{
				int count=0;
				int count1=0;
				int count2=0;
			String[] sno=StringUtils.trim(records.get(i).toString()).split(",");
			sql="select count(*) from OPEN_COVER_HAULIER_DETAILS OCHD where "+sno[10]+" between START_LIMIT and END_LIMIT and HAULIER_CATEGORY_ID=(select CATEGORY_DETAIL_ID from constant_detail where DETAIL_NAME="+sno[1]+" and RSACODE='HAULIERCATG' and CATEGORY_ID =167) and  proposal_no="+proposalNo+" and amend_id=(select max(amend_id) from OPEN_COVER_HAULIER_DETAILS where proposal_no=OCHD.proposal_no )";
			count=this.mytemplate.queryForInt(sql);
			if(count==0){
				errorMsg+="~Limit "+sno[10]+" is Not in a Range for Sno "+sno[0];
			}
			sql="select count(*) from open_cover_master ocm where CONVERT(date,"+sno[9]+",103) between POLICY_START_DATE and POLICY_END_DATE and PROPOSAL_NO="+proposalNo+" and AMEND_ID=(select max(amend_id) from OPEN_COVER_MASTER where proposal_no=ocm.proposal_no )";
			count1=this.mytemplate.queryForInt(sql);
			if(count1==0){
				errorMsg+="~Effective Date "+sno[9]+" Must be in a Range of policy Start Date and Policy End Date for Sno "+sno[0];
			}
			sql="select count(*)  where CONVERT(date,"+sno[9]+",103) < (select CONVERT(date,max(INCEPTION_DATE),103) from MARINE_VEHICLE_DETAILS where BASE_OPEN_COVER_NO='"+baseOpenCoverNo +"')";
				count2=this.mytemplate.queryForInt(sql);
				if(count2!=0){
					errorMsg+="~Effective Date "+sno[9]+" Must be in Greater than existing uploaded Effective date for Sno "+sno[0];
				}	
			}*/
			if(errorMsg.isEmpty()){
				if(!records.isEmpty())
				{ 
					/*if(reUpload!=null && reUpload.equals("Y")){
					sql="select sum(convert(decimal(15,2),cast(ACTUAL_PREMIUM as float)))  from marine_vehicle_details where status='Y' and proposal_no="+proposalNo;
					String amount=(String) this.mytemplate.queryForObject(sql, String.class);
					sql="UPDATE OPEN_COVER_MOP_DETAILS  SET Recevied_Til_Date=isnull(Recevied_Til_Date,0)-convert(decimal(15,2),cast("+amount+" as float)) WHERE OPEN_COVER_MOP_DETAILS.PROPOSAL_NO="+proposalNo;
					this.mytemplate.update(sql);
					sql="select distinct(tran_id) from marine_vehicle_details where status='Y' and proposal_no="+proposalNo;
					String trans=(String) this.mytemplate.queryForObject(sql, String.class);
					sql="update marine_vehicle_transaction_details set status='R' where tran_id=?";
					this.mytemplate.update(sql,new Object[]{trans});
					sql="delete from marine_vehicle_details where status='Y' and proposal_no="+proposalNo;
					this.mytemplate.update(sql);


				}*/
					for(i=0; i<records.size(); i++)
					{
						try{
							String[] sno1=StringUtils.trim(records.get(i).toString()).split(",");
							/*sql="select HAULIER_PREMIUM from OPEN_COVER_HAULIER_DETAILS OCHD where "+sno1[10]+" between START_LIMIT and END_LIMIT and proposal_no="+proposalNo+"  and HAULIER_CATEGORY_ID=(select CATEGORY_DETAIL_ID from constant_detail where DETAIL_NAME="+sno1[1]+" and RSACODE='HAULIERCATG' and CATEGORY_ID =167) and amend_id=(select max(amend_id) from OPEN_COVER_HAULIER_DETAILS where proposal_no=OCHD.proposal_no )";
						String premium=(String) this.mytemplate.queryForObject(sql, String.class);
							 */
							if(getSource().equals("ORACLE")) {
								sql="select (TRUNC(POLICY_END_DATE) - TO_DATE("+sno1[9]+",'dd/mm/yyyy'))+1 from open_cover_master where PROPOSAL_NO=? and AMEND_ID=(select max(AMEND_ID) from open_cover_master where PROPOSAL_NO=?)";
							}else {
								sql="select (datediff(DAY,CONVERT(date,"+sno1[9]+",103),CONVERT(date,POLICY_END_DATE,103))+1)  from open_cover_master where PROPOSAL_NO=? and AMEND_ID=(select max(AMEND_ID) from open_cover_master where PROPOSAL_NO=?)";
							}
							//sql="select (datediff(DAY,CONVERT(date,?,103),CONVERT(date,POLICY_END_DATE,103))+1)  from open_cover_master where PROPOSAL_NO=? and AMEND_ID=(select max(AMEND_ID) from open_cover_master where PROPOSAL_NO=?)";
							String DiffDays=(String) this.mytemplate.queryForObject(sql, new Object[]{proposalNo,proposalNo},String.class);

							//premium=String.valueOf((Double.parseDouble(premium)/365)*Double.parseDouble(DiffDays));
							if(Double.parseDouble(DiffDays)>364)
								DiffDays="365";
							if(getSource().equals("ORACLE")) {
								sql="INSERT INTO marine_vehicle_details_raw ("+fields+",PROPOSAL_NO,ENTRY_DATE,TRAN_ID,STATUS,BASE_OPEN_COVER_NO,CHARGEBLE_DAYS,VAT_TAX_PERCENT) VALUES ('"+StringUtils.trim(records.get(i).toString())+","+proposalNo+",SYSDATE,"+tranId+",'Y','"+baseOpenCoverNo+"',"+DiffDays+","+vatTaxPrecent+")";
							}else {
								sql="INSERT INTO marine_vehicle_details_raw ("+fields+",PROPOSAL_NO,ENTRY_DATE,TRAN_ID,STATUS,BASE_OPEN_COVER_NO,CHARGEBLE_DAYS,VAT_TAX_PERCENT) VALUES ('"+StringUtils.trim(records.get(i).toString())+","+proposalNo+",getdate(),"+tranId+",'Y','"+baseOpenCoverNo+"',"+DiffDays+","+vatTaxPrecent+")";
							}
							//sql="INSERT INTO marine_vehicle_details_raw ("+fields+",PROPOSAL_NO,ENTRY_DATE,TRAN_ID,STATUS,BASE_OPEN_COVER_NO,CHARGEBLE_DAYS,VAT_TAX_PERCENT) VALUES (?,?,getdate(),?,'Y',?,?,?)";
							totLinesProcessed = i+1;
							logger.info("Total Lines Processed==>"+totLinesProcessed);
							logger.info("Sql==>"+sql);
							this.mytemplate.update(sql);
						}
						catch (Exception e){
							logger.info("Error Sql==>"+sql);
							logger.debug("EXCEPTION @ { "+e+" }");
							String excepMsg = e.getMessage();
							//String newline = System.getProperty("line.separator");
							if(excepMsg.contains("not enough values")) {
								lineNo = (totLinesProcessed+1)-j;
								if(prev != lineNo){
									errorMsg+= "~Uploaded file contains invalid data in line no: "+lineNo+"";
									j++;
								}
								prev = lineNo;

							}
							else
								if(excepMsg.contains("invalid number") || excepMsg.contains("value too large for column")) {
									lineNo = (totLinesProcessed+1)-j;
									if(prev != lineNo){
										errorMsg+= "~Uploaded file contains invalid data in line no: "+lineNo+"";
									}
									prev = lineNo;

								}
								else
									if(excepMsg.contains("ORA-")) {
										errorMsg= excepMsg.substring(excepMsg.indexOf("ORA-"),excepMsg.length());
										break;
									}
									else
									{
										errorMsg= "Uploaded file contains invalid file format";
										break;
									}

						}

					}
					if(totLinesProcessed>0) {
						try{
							sql=getQuery("UPDATE_RANGE_VALIDATION");
							logger.info("Query "+sql);
							this.mytemplate.update(sql,new Object[]{proposalNo,tranId,tranId} );

							sql=getQuery("UPDATE_EFEECTIVE_DATE_VALIDATION");
							logger.info("Query "+sql);
							this.mytemplate.update(sql,new Object[]{tranId,proposalNo,proposalNo,proposalNo} );

						}catch (Exception e) {
							errorMsg= "Uploaded file contains invalid data(vehicle limit or Effective date)";
							logger.info("Error Sql==>"+sql);
							logger.debug("EXCEPTION @ { "+e+" }");
						}


						sql=getQuery("GET_VEHICLE_RAW_COUNT");
						int count=this.mytemplate.queryForInt(sql,new Object[]{tranId});
						if(count==0){
							sql=getQuery("UPDATE_RAW_ACTUAL_PREMIUM");
							logger.info("Query "+sql);
							this.mytemplate.update(sql,new Object[]{proposalNo,tranId} );
							
							sql=getQuery("UPDATE_RAW_VAT_PREMIUM");
							logger.info("Query "+sql);
							this.mytemplate.update(sql,new Object[]{tranId} );
							
							
							sql=getQuery("INSERT_VEHICLE_TRANS");
							Object []args=new Object[]{tranId,fileName,totLinesProcessed,records.size()-totLinesProcessed,"N",proposalNo,baseOpenCoverNo};
							logger.info("Query "+sql);
							logger.info("Args"+StringUtils.join(args,","));
							this.mytemplate.update(sql,args);

						}else{
							sql=getQuery("GET_ERROR_MSG");
							List<Map<String,Object>> result =this.mytemplate.queryForList(sql, new Object[]{tranId});
							
							if(!CollectionUtils.isEmpty(result)){
								for(int k=0;k<result.size();k++){
									Map<String,Object>  map1=result.get(k);
									 if(!CollectionUtils.isEmpty(map1)){
										 errorMsg+= map1.get("ERROR_MSG");
									 }
								}
								
								
								
							}
						}



					} 
				} 



			}
		}catch (Exception e){
			logger.info("Error Sql==>"+sql);
			logger.debug("EXCEPTION @ { "+e+" }");
			String excepMsg = e.getMessage();
			if(excepMsg.contains("not enough values")) {
				errorMsg= "Uploaded file contains invalid data in line no: "+(totLinesProcessed+1);
			}

			else
				if(excepMsg.contains("ORA-")) 
					errorMsg = excepMsg.substring(excepMsg.indexOf("ORA-"),excepMsg.length());
				else
					errorMsg= "Uploaded file contains invalid file format";
		}
		/*if(errorMsg!=null && !errorMsg.equals("")){
			sql="delete from Tmas_Workshop_Master_Raw where tran_id=?";
			this.mytemplate.update(sql,new Object[]{tranId});
		}*/
		logger.info("insertRawData() - Exit || Error: "+errorMsg);
		return errorMsg;
	}
	public List moveToMaster(String tranId){
		List uploadResult=null;
		CallableStatement cstmt = null;
		Connection con = null;
		logger.info("moveToMaster() - Enter");
		try {
			con = DBConnection.getInstance().getDBConnection();
			cstmt = con.prepareCall("{CALL marine_vehicle_validation(?)}");
			cstmt.setString(1, tranId);
			cstmt.execute();
			
			//this.mytemplate.update("call marine_vehicle_validation(?)", new Object[]{new String(tranId)});
			//uploadResult=this.mytemplate.queryForList("SELECT TOTAL, DELETED, NOT_AVAILABLE, DUPLICATE  FROM TRANSACTION_CONTROL_DETAILS WHERE TRAN_ID=?", new String[]{tranId});
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
	          try {
	                if (cstmt != null)
		             cstmt.close();
	                 } catch (Exception e) { logger.debug(e);} 
	           try {		
	               if (con != null && !con.isClosed())
	                 con.close();
		           } catch (Exception e) { logger.debug(e); }
	              }
		logger.info("moveToMaster() - Exit");
		return uploadResult;
	}
	public List<Map<String,Object>> getDeletedList(){
		List<Map<String,Object>> lst=null;
		logger.info("getDeletedList() - Enter");
		try {
			String query = getQuery("GET_DELETE_LIST");			
			lst=this.mytemplate.queryForList(query);
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		logger.info("getDeletedList() - Exit");
		return lst;
	}
	public String getTransactionId() {
		String result="";
		try{
			logger.info("Enter into the getTransactionID()");
			String sql=getQuery("GET_VEHICLE_TRANS_SEQ");
			//"select next value for  marine_vehicle_tran_seq";
			result= this.mytemplate.queryForObject(sql,String.class).toString();
			logger.info("Exit From the getTransactionID()");
		}catch (Exception e) {
			e.printStackTrace();
			logger.info(e);
		}
		return result;
	}

	public List<Map<String, Object>> getOpenCoverList(String brokerId) {
		List<Map<String,Object>> result=new ArrayList<Map<String,Object>>();
		try{
			sql=getQuery(DBConstants.MARINE_OPENCOVER_VEHICLE_DETAILS);
			
		result=this.mytemplate.queryForList(sql,new Object[]{brokerId});
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public void deleteTransction(List<String> sno1, List<String> transNo1, List<String> proposalno1, String expiryDate, String baseOpenCoverNo, String proposalNo, MarineVehicleBean bean) {
		try {
			int totalDelete=0;
			if(sno1!=null && sno1.size()>0)
			for(int i=0;i<sno1.size();i++){
				sql=getQuery("GET_VEHICLE_REFUND_PREMIUM");
				String premium=(String) this.mytemplate.queryForObject(sql, new String[] {baseOpenCoverNo,sno1.get(i),transNo1.get(i)},String.class);
				sql=getQuery("GET_CHARGABLE_DAYS");
				String chargableDays=(String) this.mytemplate.queryForObject(sql,new Object[] {baseOpenCoverNo,sno1.get(i),transNo1.get(i)}, String.class);
				sql=getQuery("GET_DELETE_DIFF_DATE");
				String noofdays=(String) this.mytemplate.queryForObject(sql, new Object[]{expiryDate,proposalNo,proposalNo},String.class);
				//Double days=(Double.parseDouble(noofdays));
				premium=String.valueOf((Double.parseDouble(premium)/Double.parseDouble(chargableDays))*(Double.parseDouble(noofdays)));
				sql=getQuery("UPDATE_DELETE_STATUS");
				totalDelete = i+1;
				logger.info("Total Lines Processed==>"+totalDelete);
				logger.info("Sql==>"+sql);
				this.mytemplate.update(sql,new Object[] {expiryDate,premium,proposalNo,bean.getTranId(),noofdays,proposalno1.get(i),sno1.get(i),transNo1.get(i)});
				
			}
			
			sql=getQuery("UPDATE_DELETE_TAX");
			this.mytemplate.update(sql,new Object[] {bean.getTranId()});
			
			
			if(totalDelete>0) {
				sql=getQuery("INSERT_VEHICLE_TRANS");
				Object []args=new Object[]{bean.getTranId(),"",totalDelete,sno1.size()-totalDelete,"D",proposalNo,baseOpenCoverNo};
				logger.info("Query "+sql);
				logger.info("Args"+StringUtils.join(args,","));
				this.mytemplate.update(sql,args);
			} 
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

	public List<Map<String, Object>> getBrokerList(String branchCode) {
		List<Map<String,Object>> result=new ArrayList<Map<String,Object>>();
		try{
			sql=getQuery(DBConstants.MARINE_OPENCOVER_BROKER_DETAILS);
			
		result=this.mytemplate.queryForList(sql,new Object[]{branchCode});
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public List<Map<String, Object>> getMarinevehicleDeleteDetails( String proposalNo, String searchType, String searchValue, String status, String baseOpenCoverNo) {
		List<Map<String,Object>> result=new ArrayList<Map<String,Object>>();
		try{
				sql=getQuery("getMarinevehicledeletedetails");
				if(searchType!=null ){
				if(searchType.equals("tranId")){
					searchValue=searchValue.replaceAll(",", "','");
					sql=sql+"and TRAN_ID in('"+searchValue+"')";
					
					
				}
				if(searchType.equals("assetNo")){
					searchValue=searchValue.replaceAll(",", "','");
					sql=sql+"and ASSERT_NO in('"+searchValue+"')";
				}
				if(searchType.equals("plateNo")){
					searchValue=searchValue.replaceAll(",", "','");
					sql=sql+"and PLATE_NO in('"+searchValue+"')";
				}
				if(searchType.equals("chaseNo")){
					searchValue=searchValue.replaceAll(",", "','");
					sql=sql+"and CHASSIS_NO in('"+searchValue+"')";
				}
				}
				sql += " order by tran_id desc";
				result=this.mytemplate.queryForList(sql,new Object[]{baseOpenCoverNo,status});
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public String getRefundchargableAmount(MarineVehicleBean bean) {
		String amount="";
		try {
			sql=getQuery("GET_REFUND_CHARGE_AMOUNT");
			amount=(String) this.mytemplate.queryForObject(sql,new Object[] {bean.getTranId()}, String.class);
			bean.setRefundchargeamount(amount);
			sql=getQuery("GET_REFUND_VAT_AMOUNT");
			amount=(String) this.mytemplate.queryForObject(sql,new Object[] {bean.getTranId()}, String.class);
		//	bean.setVatTax(amount);
			
			/*String query = "UPDATE OPEN_COVER_MOP_DETAILS  SET PAYABLE_MARINE_PREMIUM=convert(decimal(15,2),cast(? as float)) ,PAYABLE_YN='C' WHERE PROPOSAL_NO=?";
			this.mytemplate.update(query, new String[]{amount,proposalNo});
			if("Y".equalsIgnoreCase(endtYN)&&endtYN!=null){
				
	            query = "select isnull(TOTAL_PREMIUM,0) from OPEN_COVER_MOP_DETAILS where PROPOSAL_NO=(select OLD_PROPOSALNO from OPEN_COVER_POSITION_MASTER where PROPOSAL_NO=? )";
	            String finalPre=(String) this.mytemplate.queryForObject(query, new String[]{proposalNo},String.class);
				
				 query = "UPDATE OPEN_COVER_MOP_DETAILS  SET TOTAL_PREMIUM = convert(decimal(15,2),cast(? as float))+ convert(decimal(15,2),cast(? as float)) WHERE PROPOSAL_NO=?";
				this.mytemplate.update(query, new String[]{ amount,finalPre,proposalNo});
				query="UPDATE OPEN_COVER_MOP_DETAILS  SET TOTAL_PREMIUM =FINAL_PREMIUM-POLICY_FEE-INSPECTION_FEE ,TOTAL_MARINE_PREMIUM=FINAL_PREMIUM-POLICY_FEE-INSPECTION_FEE WHERE PROPOSAL_NO=? ";
				this.mytemplate.update(query,new String[]{proposalNo});
			}*/
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return amount;
	}

	public String getRefundAmount(List<String> sno1, List<String> transNo1, List<String> proposalno1, String baseOpenCoverNo, String proposalNo, MarineVehicleBean bean) {
		String amount="";
		try {
			String query ="";
			sql=getQuery("GET_REFUND_VAT_AMOUNT1");
			 amount=(String) this.mytemplate.queryForObject(sql,new Object[] {baseOpenCoverNo,bean.getTranId()}, String.class);
			// bean.setVatTax(amount);
			//sql="select SUM((convert(decimal(10,2),cast(REFUND_PREMIUM as float)))) from marine_vehicle_details where BASE_OPEN_COVER_NO='"+baseOpenCoverNo+"' and Status='D' and deleted_tran_id="+bean.getTranId() ;
			sql=getQuery("GET_REFUND_AMOUNT");
			 amount=(String) this.mytemplate.queryForObject(sql,new Object[] {baseOpenCoverNo,bean.getTranId()}, String.class);
			 
			 
			 /*query = "UPDATE OPEN_COVER_MOP_DETAILS  SET PAYABLE_MARINE_PREMIUM=convert(decimal(15,2),cast(? as float)),PAYABLE_YN='R' WHERE OPEN_COVER_MOP_DETAILS.PROPOSAL_NO=?";
			this.mytemplate.update(query, new String[]{ String.valueOf(Double.parseDouble(amount)*-1),proposalNo});
		*/} catch (DataAccessException e) {
			e.printStackTrace();
		}
		return amount;
	}

	/*public int getCountNoOfVehicle(String proposalNo) {
		int count=0;
		try {
			
			sql=getQuery("get.vehicle.count");
			count=this.mytemplate.queryForInt(sql,new String[]{proposalNo});
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
*/
	public String getProposalNo(String openCoverNo) {
		String proposalNo="";
		 try {
			String query = "select PROPOSAL_NO from open_cover_position_master where OPEN_COVER_NO=?";
			 proposalNo=(String) this.mytemplate.queryForObject(query, new String[]{openCoverNo},String.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return proposalNo;
	}

	public List<Map<String, Object>> getTransDetails(String proposalNo,
			String searchType, String searchValue, String status) {
		List<Map<String,Object>> result=new ArrayList<Map<String,Object>>();
		try{
			if("N".equalsIgnoreCase(status)){
				//sql="select policy_no, tran_id,CONVERT(date,entry_date,103)ENTRY_DATE,upload_file_name,total_no_of_records,Status, floor(premium) as premium  from marine_vehicle_transaction_details where BASE_OPENCOVER_NO=? and Status in ('N') ";
				sql=getQuery("GET_TRANSACTION_LIST1");
			}else
				sql=getQuery("GET_TRANSACTION_LIST2");
			//sql="select policy_no, tran_id,CONVERT(date,entry_date,103)ENTRY_DATE,upload_file_name,total_no_of_records,Status, floor(premium) as premium  from marine_vehicle_transaction_details where BASE_OPENCOVER_NO=? and Status in ('Y','D') and policy_no is not null";
			
		result=this.mytemplate.queryForList(sql,new Object[]{proposalNo});
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public List<Map<String, Object>> getHaulierDetails(String proposalNo) {
		List<Map<String,Object>> result=new ArrayList<Map<String,Object>>();
		try{
			//sql="SELECT PROPOSAL_NO,HAULIER_CATEGORY,FLOOR(END_LIMIT)END_LIMIT, NO_OF_VEHICLES,FLOOR(HAULIER_PREMIUM)HAULIER_PREMIUM,FLOOR(TOTAL_PREMIUM),FLOOR(START_LIMIT)START_LIMIT FROM OPEN_COVER_HAULIER_DETAILS where PROPOSAL_NO=? order by SNO";
			sql=getQuery("GET_HAULIER_DETAILS");
		result=this.mytemplate.queryForList(sql,new Object[]{proposalNo});
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public List<Map<String, Object>> getVehicleTransDetails(String proposalNo) {
		List<Map<String,Object>> result=new ArrayList<Map<String,Object>>();
		try{
			sql=getQuery("GET_VEHICLE_TRAN_DET");
			
		result=this.mytemplate.queryForList(sql,new Object[]{proposalNo,proposalNo});
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public void getPremiumDetails(MarineVehicleBean bean) {
		List<Map<String,Object>> result=new ArrayList<Map<String,Object>>();
		try{
			/*sql=getQuery("GET_PREMIUM_DETAIL");
			
		result=this.mytemplate.queryForList(sql,new Object[]{bean.getProposalNo()});
		if(result!=null && result.size()>0){
			for(int i=0;i<result.size();i++){
				Map<String,Object> map=result.get(0);
				bean.setTotalPremium(map.get("TOTAL_PREMIUM")==null?"0":val.format(map.get("TOTAL_PREMIUM").toString()));
				bean.setPolicyFee(map.get("POLICY_FEE")==null?"0":val.format(map.get("POLICY_FEE").toString()));
				bean.setInceptionFee(map.get("INSPECTION_FEE")==null?"0":val.format(map.get("INSPECTION_FEE").toString()));
				bean.setFinalPremium(map.get("FINAL_PREMIUM")==null?"0":val.format(map.get("FINAL_PREMIUM").toString()));
				bean.setReceviedAmt(map.get("Recevied_Til_Date")==null?"0":val.format(map.get("Recevied_Til_Date").toString()));
				bean.setPolicyFeeRcvd(map.get("POLICY_FEE_RECEIVED")==null?"0":val.format(map.get("POLICY_FEE_RECEIVED").toString()));
				bean.setInceptionFeeRcvd(map.get("INSPECTION_FEE_RECEIVED")==null?"0":val.format(map.get("INSPECTION_FEE_RECEIVED").toString()));
				bean.setPremiumRcvd(map.get("PREMIUM_REC")==null?"0":val.format(map.get("PREMIUM_REC").toString()));
				bean.setBalanceAmt(map.get("BALANCEAMT")==null?"0":val.format(map.get("BALANCEAMT").toString()));
				bean.setPolicyFeeBal(map.get("POLICYFEEBAL")==null?"0":val.format(map.get("POLICYFEEBAL").toString()));
				bean.setInceptionFeeBal(map.get("INCEPTIONFEEBAL")==null?"0":val.format(map.get("INCEPTIONFEEBAL").toString()));
				bean.setReceviedTot(map.get("RECEVIEDTOT")==null?"0":val.format(map.get("RECEVIEDTOT").toString()));
				
				bean.setRefundAmt(map.get("PAYABLE_MARINE_PREMIUM")==null?"0":val.format(map.get("PAYABLE_MARINE_PREMIUM").toString()));
				bean.setPolicyFeePaid(map.get("POLICY_FEE_paid")==null?"0":val.format(map.get("POLICY_FEE_paid").toString()));
				bean.setInceptionFeePaid(map.get("INSPECTION_FEE_paid")==null?"0":val.format(map.get("INSPECTION_FEE_paid").toString()));
				bean.setTotal(map.get("TOTAL")==null?"0":val.format(map.get("TOTAL").toString()));
				bean.setChargeableYN(map.get("PAYABLE_YN")==null?"":map.get("PAYABLE_YN").toString());
			}
		}*/
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public void updateMopPremiumDetails(MarineVehicleBean bean) {
		try {
			String query = "";
			Object[] args =  new Object[5];
			query = " UPDATE OPEN_COVER_MOP_DETAILS SET INSPECTION_FEE=convert(decimal(10,2),cast(? as float)),PAYABLE_YN=?,PERCENTAGE=convert(decimal(10,6),cast(? as float)),POLICY_FEE=convert(decimal(10,2),cast(? as float)) WHERE PROPOSAL_NO=?";
			args[0] = bean.getInceptionFee();
			args[1] = bean.getChargeableYN();
			args[2] = bean.getChargeablePercent();
			args[3] = bean.getPolicyFee();
			args[4] = bean.getProposalNo();
			this.mytemplate.update(query, args);
			//mopPremiumCalc(bean);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
		public String mopPremiumCalc(MarineVehicleBean bean) {
			String result = "";
			try {
				String query = "";
				String[] args = null;
				String[] datas = getMopPremiumDetails(bean.getProposalNo(),"mopPremiumCalc");
				double chargeablePercent = 0;
				double payableAmt = Double.parseDouble(bean.getRefundAmt());
				double incFee = Double.parseDouble(bean.getInceptionFeeRcvd());
				double polFee = Double.parseDouble(bean.getPolicyFeeRcvd());
				double incFeePaid = Double.valueOf(bean.getInceptionFeePaid())==null?0:Double.valueOf(bean.getInceptionFeePaid());
				double polFeePaid =  Double.valueOf(bean.getPolicyFeePaid())==null?0:Double.valueOf(bean.getPolicyFeePaid());
				/*query = "select isnull(Recevied_Til_Date,0) ,isnull(TOTAL_MARINE_PREMIUM,0),isnull(POLICY_FEE_RECEIVED,0),isnull(INSPECTION_FEE_RECEIVED,0),isnull(POLICY_FEE,0) ,isnull(INSPECTION_FEE,0) from OPEN_COVER_MOP_DETAILS where PROPOSAL_NO=(select OLD_PROPOSALNO from OPEN_COVER_POSITION_MASTER where PROPOSAL_NO=? and ENDT_STATUS='Y')";
				String [][]preRefundAmt = runner.multipleSelection(query,new String[]{bean.getProposalNo()});
				if(preRefundAmt.length>0){
					payableAmt=Double.valueOf(preRefundAmt[0][0]);
					incFee=Double.valueOf(preRefundAmt[0][3]);
					polFee=Double.valueOf(preRefundAmt[0][2]);
					if(bean.getInceptionFee().equals("0")&&bean.getPolicyFee().equals("0")){

						bean.setInceptionFee(preRefundAmt[0][5]);
						bean.setPolicyFee(preRefundAmt[0][4]);
						//policyFee=Double.valueOf(preRefundAmt[0][4]);
					}
				}*/
				double totalPremium = Double.valueOf(datas[5]);
				chargeablePercent = Double.valueOf(StringUtils.isBlank(datas[10])?"0":datas[10]);

				double finalPremium = totalPremium+Double.parseDouble(bean.getInceptionFee())+Double.parseDouble(bean.getPolicyFee());
				double  actualRefund = Double.parseDouble(bean.getTotal());
				double payablePremium=Double.parseDouble(bean.getTotal())-Double.parseDouble(bean.getInceptionFeePaid())-Double.parseDouble(bean.getPolicyFeePaid());
				double commissionAmount = (payablePremium)*Double.valueOf(datas[12])/100;
				query = "UPDATE OPEN_COVER_MOP_DETAILS  SET FINAL_PREMIUM=convert(decimal(15,2),cast(? as float)),COMMISSION=convert(decimal(15,2),cast(? as float)) ,Recevied_Til_Date=isnull(Recevied_Til_Date,0)+convert(decimal(15,2),cast(? as float)),refund_amount=isnull(refund_amount,0)+convert(decimal(15,2),cast(? as float)) ,POLICY_FEE_RECEIVED=isnull(POLICY_FEE_RECEIVED,0)+ convert(decimal(15,2),cast(? as float)) , INSPECTION_FEE_RECEIVED=isnull(INSPECTION_FEE_RECEIVED,0)+convert(decimal(15,2),cast(? as float)) WHERE OPEN_COVER_MOP_DETAILS.PROPOSAL_NO=?";
				args = new String[7];
				args[0] = String.valueOf(df.format(finalPremium));
				args[1] = String.valueOf(commissionAmount);
				args[2] = String.valueOf(payableAmt);
				args[3] = String.valueOf(payablePremium);
				args[4] = String.valueOf(polFee);
				args[5] = String.valueOf(incFee);
				args[6] = bean.getProposalNo();
				this.mytemplate.update(query, args);
				if(actualRefund!=0.0){
					updateRefundInfo(String.valueOf(actualRefund-polFeePaid-incFeePaid),String.valueOf(polFeePaid),String.valueOf(incFeePaid),bean.getProposalNo());
				}
				/*
				 * PAYABLE_PREMIUM is Actual premium+Policy Fee paid + Inspection Fee Updated By ibrahim
				 * 
				 * For only Mop and  Hauler
				 * 
				 */

				query = "UPDATE OPEN_COVER_MOP_DETAILS SET PAYABLE_PREMIUM=ISNULL(PAYABLE_PREMIUM,0)+ISNULL(PAYABLE_MARINE_PREMIUM,0)+ISNULL(INSPECTION_FEE_PAID,0)+ISNULL(POLICY_FEE_PAID,0),PAYABLE_INSPECTION_FEE=ISNULL(INSPECTION_FEE,0)*PERCENTAGE/100,PAYABLE_POLICY_FEE=ISNULL(POLICY_FEE,0)*PERCENTAGE/100,TOTAL_MARINE_PREMIUM=FINAL_PREMIUM WHERE PROPOSAL_NO=?";
				args = new String[]{bean.getProposalNo()};
				this.mytemplate.update(query, args);
				updateRecivedPay(bean.getProposalNo(),bean.getRefundAmt(),bean.getInceptionFeePaid(),bean.getPolicyFeePaid(),"V",bean.getEndtYN());
			} catch(Exception e) {
				e.printStackTrace();
			}
			return result;
		}
		public String[] getMopPremiumDetails(String proposalNo, String type) {
			String[] datas = new String[23];
			try {
				String query="";
				if("mopPremiumCalc".equalsIgnoreCase(type)){
					query = "SELECT SUMINSURED,MARINE_RATE,MARINE_PREMIUM,WAR_RATE,WAR_PREMIUM,TOTAL_PREMIUM,ISNULL(POLICY_FEE,0),ISNULL(INSPECTION_FEE,0),FINAL_PREMIUM,PAYABLE_YN,PERCENTAGE,PAYABLE_PREMIUM,ISNULL(COMMISSION_PERCENT,0), C.ENDT_STATUS ENDT_STATUS,isnull(ocmp.Recevied_Til_Date,0),isnull(ocmp.TOTAL_MARINE_PREMIUM,0),isnull(ocmp.TOTAL_MARINE_PREMIUM,0)-isnull(ocmp.Recevied_Til_Date,0),isnull(REFUND_AMOUNT,0),isnull(POLICY_FEE_RECEIVED,0),isnull(INSPECTION_FEE_RECEIVED,0),isnull(POLICY_FEE_PAID,0),isnull(INSPECTION_FEE_PAID,0) , isnull(FLOOR(COMMISSION),0) FROM OPEN_COVER_MOP_DETAILS ocmp,OPEN_COVER_POSITION_MASTER C WHERE ocmp.PROPOSAL_NO=?  AND C.PROPOSAL_NO = ocmp.PROPOSAL_NO ";
				} else
					query=" SELECT SUMINSURED,MARINE_RATE,WAR_RATE,TOTAL_PREMIUM,ISNULL(POLICY_FEE,0),ISNULL(INSPECTION_FEE,0),isnull(FINAL_PREMIUM,0),isnull(Recevied_Til_Date,0) ,isnull(POLICY_FEE_RECEIVED,0),isnull(INSPECTION_FEE_RECEIVED,0),isnull(Recevied_Til_Date,0)+isnull(POLICY_FEE_RECEIVED,0)+isnull(INSPECTION_FEE_RECEIVED,0),PAYABLE_YN, FLOOR(abs(PAYABLE_MARINE_PREMIUM)),FLOOR(abs(POLICY_FEE_paid)),FLOOR(abs(INSPECTION_FEE_paid)) FROM OPEN_COVER_MOP_DETAILS ocmp,OPEN_COVER_POSITION_MASTER C WHERE ocmp.PROPOSAL_NO=? AND C.PROPOSAL_NO = ocmp.PROPOSAL_NO ";
				//
				String[] args = new String[]{proposalNo};
				String[][] result = runner.multipleSelection(query, args);
				for(int i=0;i<result[0].length;i++) {
					datas[i]=result[0][i]==null?"":result[0][i];
				}
			} catch(Exception e) {
				System.out.println("ERROR WHILE SELECTING RECORDS "+e.toString());
				e.printStackTrace();
			}
			return datas;
		}
		private void updateRefundInfo(String actualRefund,String polFeePaid,String incFeePaid, String proposalNo){
			/*
			 * PAYABLE_MARINE_PREMIUM is Actual premium only By ibrahim
			 * 
			 * For only Mop and  Hauler
			 */
			String query = "UPDATE OPEN_COVER_MOP_DETAILS  SET PAYABLE_MARINE_PREMIUM=convert(decimal(15,2),cast(? as float)),POLICY_FEE_paid=convert(decimal(15,2),cast(? as float)) ,INSPECTION_FEE_paid=convert(decimal(15,2),cast(? as float)) WHERE OPEN_COVER_MOP_DETAILS.PROPOSAL_NO=?";
			this.mytemplate.update(query, new String[]{ actualRefund, polFeePaid, incFeePaid,proposalNo});
			//runner.multipleUpdation(query,new String[]{ actualRefund, polFeePaid, incFeePaid});
			
		}
		public void updateRecivedPay(String proposal,String recivedPay,String inceptionFeePaid,String policyFeePaid,String haulierType,String endtYN) {
			String query="";
			//query = "UPDATE OPEN_COVER_MOP_DETAILS set Recevied_Til_Date =isnull(Recevied_Til_Date,0)+convert(decimal(10,2),cast(? as float)), POLICY_FEE_RECEIVED=isnull(POLICY_FEE_RECEIVED,0)+convert(decimal(10,2),cast(? as float)) , INSPECTION_FEE_RECEIVED=isnull(INSPECTION_FEE_RECEIVED,0)+convert(decimal(10,2),cast(? as float)) WHERE PROPOSAL_NO=?";
			//this.mytemplate.update(query, new  String[]{recivedPay,policyFeePaid,inceptionFeePaid,proposal});

			if("V".equalsIgnoreCase(haulierType)&&"Y".equalsIgnoreCase(endtYN)){

				String[][] haulierData=getHaulierDet(proposal);
				if(haulierData.length>0){
					for(int j=0;j<haulierData.length;j++){
						String count=(String) this.mytemplate.queryForObject("select count(*)  from marine_vehicle_details mvd where mvd.PROPOSAL_NO=? and mvd.LIMIT between convert(decimal(10,2),cast(? as float)) and convert(decimal(10,2),cast(? as float))", new  String[]{proposal,haulierData[j][6],haulierData[j][2]}, String.class);
						//count="select count(*)  from marine_vehicle_details_raw mvdwhere mvd.PROPOSAL_NO=? and mvd.LIMIT between convert(decimal(10,2),cast(? as float)) and convert(decimal(10,2),cast(? as float)";
						query="UPDATE OPEN_COVER_HAULIER_DETAILS set  NO_OF_VEHICLES=NO_OF_VEHICLES+?  where START_LIMIT=convert(decimal(10,2),cast(? as float))  and  END_LIMIT=convert(decimal(10,2),cast( ? as float)) and PROPOSAL_NO=?";
						this.mytemplate.update(query, new  String[]{count,haulierData[j][6],haulierData[j][2],proposal});

					}
				}
			}


		}
		public String[][] getHaulierDet(String proposalNo){
			String[][] result=null;
			String query="SELECT PROPOSAL_NO,HAULIER_CATEGORY,FLOOR(END_LIMIT), NO_OF_VEHICLES,FLOOR(HAULIER_PREMIUM),FLOOR(TOTAL_PREMIUM),FLOOR(START_LIMIT) FROM OPEN_COVER_HAULIER_DETAILS where PROPOSAL_NO=? order by SNO";
			String[] args=new String[]{proposalNo};
			result = runner.multipleSelection(query, args);
			return result;
			
		}

	public void getOpenCoverDetails(MarineVehicleBean bean) {
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		try {
			String query = "select PROPOSAL_NO,ENDT_STATUS from open_cover_position_master where OPEN_COVER_NO=?";
			result = this.mytemplate.queryForList(query, new Object[] { bean.getOpenCoverNo() });
			if (result != null && result.size() > 0) {
				for (int i = 0; i < result.size(); i++) {
					Map<String, Object> map = result.get(0);
					bean.setProposalNo(map.get("PROPOSAL_NO") == null ? "" : map.get("PROPOSAL_NO").toString());
					bean.setEndtYN(map.get("ENDT_STATUS") == null ? "N" : map.get("ENDT_STATUS").toString());
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

		public String getRawCount(String tranId, MarineVehicleBean bean) {
			String result="";
			int count=0;
			try {
				String query=getQuery("GET_RAW_DATA_COUNT");
				count=this.mytemplate.queryForInt(query,new Object[]{tranId});
				if(count>0){
					result="Duplicate Values there .Please Reupload";
					
					query=getQuery("UPDATE_DUPLICATE_VEHICLE");
					this.mytemplate.update(query,new Object[]{tranId});
					//MarineVehicleBean bean=new MarineVehicleBean();
					bean.setReUpload("Y");
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return result;
		}
		
		public String policyNoGen(String BaseOpenCoverNo,String openCoverNo){
			String policyNum="", CertNo="",query="";
			try {
				query=getQuery("GET_CERT_NO");
				CertNo=(String) this.mytemplate.queryForObject(query,new Object[]{openCoverNo}, String.class);
				query=getQuery("UPD_CERT_NO");
				this.mytemplate.update(query,new Object[]{openCoverNo});
				policyNum=BaseOpenCoverNo+"/"+CertNo;
			} catch (Exception e) {
				e.printStackTrace();
			}
			return policyNum;

		}

		public void updatePremiumDetails(String type,String branchCode, String loginId, MarineVehicleBean bean) {
			try{
				Map<String, String> DebitCreditTo = getDebitCreditTo(branchCode, type, bean);
				String debitTo = DebitCreditTo.get("DEBIT")==null?"":DebitCreditTo.get("DEBIT");
				String creditTo = DebitCreditTo.get("CREDIT")==null?"":DebitCreditTo.get("CREDIT");
				String debitToId = DebitCreditTo.get("DEBIT_ID")==null?"":DebitCreditTo.get("DEBIT_ID");
				String creditToId = DebitCreditTo.get("CREDIT_ID")==null?"":DebitCreditTo.get("CREDIT_ID");
				String debitNoteNo = DebitCreditTo.get("DEBIT_NOTE_NO")==null?"":DebitCreditTo.get("DEBIT_NOTE_NO");
				String creditNoteNo = DebitCreditTo.get("CREDIT_NOTE_NO")==null?"":DebitCreditTo.get("CREDIT_NOTE_NO");
				String customerId = DebitCreditTo.get("CUSTOMER_ID")==null?"":DebitCreditTo.get("CUSTOMER_ID");
				String commision=DebitCreditTo.get("COMMISSION")==null?"":DebitCreditTo.get("COMMISSION");
				String policyfee=DebitCreditTo.get("ENDORSEMENTFEE")==null?"":DebitCreditTo.get("ENDORSEMENTFEE");
				String brokerId=DebitCreditTo.get("BROKER_ID")==null?"":DebitCreditTo.get("BROKER_ID");
				String salesYN=DebitCreditTo.get("COMMISSION_VAT_YN")==null?"":DebitCreditTo.get("COMMISSION_VAT_YN");
				String premium=bean.getPremium();
				String vatTaxAmt=bean.getVatTax();
				String vatTaxPrecent=getvatTaxprecent(bean.getOpenCoverNo());
				policyfee=bean.getPolicyFee();
				if("Refund".equalsIgnoreCase(type)){
					premium="-"+premium;
					policyfee="-"+policyfee;
					vatTaxAmt="-"+vatTaxAmt;
				}
				String commisionAmt="0",vatcommisionAmt="0";
				String policyNo=policyNoGen(bean.getBaseOpenCoverNo(), bean.getOpenCoverNo());
				bean.setPolicyNo(policyNo);
			//	double vatTemp=Double.valueOf(StringUtils.isBlank(vatTaxAmt)?"0":vatTaxAmt)-((Double.valueOf(StringUtils.isBlank(policyfee)?"0":policyfee))*Double.valueOf(StringUtils.isBlank(vatTaxPrecent)?"0":vatTaxPrecent)/100);
			//	double vatTemp1=Double.valueOf(StringUtils.isBlank(vatTaxAmt)?"0":vatTaxAmt)-((Double.valueOf(StringUtils.isBlank(policyfee)?"0":policyfee))*Double.valueOf(StringUtils.isBlank(vatTaxPrecent)?"0":vatTaxPrecent)/100);
				//vatTaxAmt=String.valueOf(vatTemp1);
				
				if(!"0".equalsIgnoreCase(commision))
					commisionAmt=String.valueOf(Double.parseDouble(commision)*Double.parseDouble(premium)/100);
				    vatcommisionAmt=String.valueOf(Double.parseDouble(commisionAmt)*Double.parseDouble(vatTaxPrecent)/100);
				    
				    if(!"Y".equalsIgnoreCase(salesYN)){
				    	vatcommisionAmt="0";
					}
				String query=getQuery("UPD_VEHICLE_STATUS");
				this.mytemplate.update(query, new Object[]{"Refund".equalsIgnoreCase(type)?"D":"Y",bean.getTranId(),bean.getTranId()});
				query=getQuery("UPD_VEH_POLICY_DETAIL");
					this.mytemplate.update(query, new Object[]{policyNo,StringUtils.isBlank(loginId)?"":loginId ,customerId,bean.getEffectiveDate(),bean.getEffectiveDate(),creditTo,debitTo,creditToId,debitToId,creditNoteNo, debitNoteNo,bean.getOpenCoverNo(),bean.getBaseOpenCoverNo(),premium,policyfee,commisionAmt,commision,"Refund".equalsIgnoreCase(type)?"D":"Y",brokerId,bean.getConditionDesc(),bean.getEffectiveDate(),vatTaxPrecent,vatTaxAmt,vatcommisionAmt,!"Y".equalsIgnoreCase(salesYN)?"0":vatTaxPrecent,bean.getTranId()});
			
					new CommonDAO().drCrInsert(policyNo, branchCode, "VEHICLECRDR","","","13");
					//new CommonDAO().marineIntegrationInsert(policyNo, branchCode, "LANDTRANSIT","","","13");
					
				}catch (Exception e) {
				e.printStackTrace();
			}
		}
			
		public Map<String, String> getDebitCreditTo(String branchCode,String type, MarineVehicleBean bean) {
			Map<String, String> debitCreditTo = new HashMap<String, String>();
			List<Map<String, String>> list=new ArrayList<Map<String,String>>();
			String debitNoteNo = "";
			String creditNoteNo = "";
			String debitTo ="";
			String creditTo = "";
			String debitToId ="";
			String creditToId ="";
		
			Map<String, String> resultMap = new HashMap<String, String>();
			
			
			String query = "select  EXECUTIVE_ID,BROKER_ID,CUSTOMER_ID,DEBIT_TO_ID,CREDIT_TO_ID,DEBIT_TO,CREDIT_TO,floor(COMMISSION) as COMMISSION,ENDORSEMENTFEE,(select COMMISSION_VAT_YN from broker_company_master where agency_code =(select agency_code from login_master where login_id=ocm.BROKER_ID )) COMMISSION_VAT_YN from open_cover_master ocm WHERE  ocm.proposal_no =? and ocm.AMEND_ID=(select max(AMEND_ID) from open_cover_master where proposal_no=?)";
			list =  this.mytemplate.queryForList(query,new Object[]{bean.getProposalNo(),bean.getProposalNo()});
			resultMap= list.get(0);
			if("Charg".equalsIgnoreCase(type)){
				debitTo=resultMap.get("DEBIT_TO");
				creditTo=resultMap.get("CREDIT_TO");
				debitToId=resultMap.get("DEBIT_TO_ID");
				creditToId=resultMap.get("CREDIT_TO_ID");
				 debitNoteNo = new CommonDAO().getSequenceNo(branchCode, "11", "DEBIT_NO");
				
				if("0".equalsIgnoreCase(String.valueOf(resultMap.get("COMMISSION")))){
					creditNoteNo="";
				}else
					 creditNoteNo =  new CommonDAO().getSequenceNo(branchCode, "11", "CREDIT_NO");
			}else{
				creditTo=resultMap.get("DEBIT_TO");
				debitTo=resultMap.get("CREDIT_TO");
				debitToId=resultMap.get("CREDIT_TO_ID");
				creditToId=resultMap.get("DEBIT_TO_ID");
				 creditNoteNo =  new CommonDAO().getSequenceNo(branchCode, "11", "CREDIT_NO");
				if("0".equalsIgnoreCase(String.valueOf(resultMap.get("COMMISSION")))){
					debitNoteNo="";
				}else{
					 debitNoteNo = new CommonDAO().getSequenceNo(branchCode, "11", "DEBIT_NO");
				}
			}
			debitCreditTo.put("DEBIT",debitTo);
			debitCreditTo.put("CREDIT",creditTo);
			debitCreditTo.put("DEBIT_ID",debitToId);
			debitCreditTo.put("CREDIT_ID",creditToId);
			debitCreditTo.put("CREDIT_NOTE_NO",creditNoteNo);
			debitCreditTo.put("DEBIT_NOTE_NO",debitNoteNo);
			debitCreditTo.put("CUSTOMER_ID",String.valueOf(resultMap.get("CUSTOMER_ID")));
			debitCreditTo.put("COMMISSION",String.valueOf(resultMap.get("COMMISSION")));
			debitCreditTo.put("ENDORSEMENTFEE",String.valueOf(resultMap.get("ENDORSEMENTFEE")));
			debitCreditTo.put("CUSTOMER_ID",String.valueOf(resultMap.get("CUSTOMER_ID")));
			debitCreditTo.put("BROKER_ID",String.valueOf(resultMap.get("BROKER_ID")));
			debitCreditTo.put("COMMISSION_VAT_YN",String.valueOf(resultMap.get("COMMISSION_VAT_YN")));
			


			return debitCreditTo;
		}

		public List<Map<String, Object>> getPremiumDetailsList(
				MarineVehicleBean bean) {
			List<Map<String, Object>> list=(List<Map<String, Object>>) new ArrayList<Map<String,Object>>();
			try{
				String query = getQuery("GET_PREMIUM_TRAN_DET");
				list =  this.mytemplate.queryForList(query,new Object[]{bean.getTranId()});
			}catch (Exception e) {
				e.printStackTrace();
			}
			return list;
		}

		public boolean maxEffectiveDate(String effectiveDate, String baseOC) {
			String query="";
			int count2=0;
			try {
				query=getQuery("GET_MAX_EFFECTIVE_DATE");
				count2=this.mytemplate.queryForInt(query,new Object[] {effectiveDate,baseOC});
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return count2==0;
		}

		public void updateStatus(MarineVehicleBean bean) {
			String query="";
			int count2=0;
			try {
				query="update marine_vehicle_details set REFUND_PREMIUM=null ,deleted_tran_id=null ,Status=? where deleted_tran_id=? or TRAN_ID=?";
				this.mytemplate.update(query ,new Object[]{"D".equalsIgnoreCase(bean.getStatus())?"Y":"N",bean.getTranId(),bean.getTranId()});
				query="update marine_vehicle_transaction_details  set BASE_OPENCOVER_NO=? where TRAN_ID=?";
				this.mytemplate.update(query ,new Object[]{bean.getBaseOpenCoverNo(),bean.getTranId()});
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
		}

		public String getPolicyFee(String openCoverNo) {
			String policyFee="";
			 try {
				String query = "select ENDORSEMENTFEE from open_cover_master ocm where ocm.MISSIPPI_OPENCOVER_NO=? and ocm.AMEND_ID=(select max(AMEND_ID) from open_cover_master where MISSIPPI_OPENCOVER_NO=?)";
				policyFee=(String) this.mytemplate.queryForObject(query, new String[]{openCoverNo,openCoverNo},String.class);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return policyFee;
		}

		public List<Map<String, Object>> getDuplicateRecords(String tranId,
				String status) {
			List<Map<String,Object>> result=new ArrayList<Map<String,Object>>();
			try{
			
					sql=getQuery("GET_DUPLICATE_RECORD");
					
			result=this.mytemplate.queryForList(sql,new Object[]{tranId});
			}catch (Exception e) {
				e.printStackTrace();
			}
			return result;
		}

		public String validateImsDate(String effectiveDate, String branchCode) {
			String result="";
			try{
				sql=getQuery("POLICY_EFF_DATE_CT");
				result=(String) this.mytemplate.queryForObject(sql,new Object[]{effectiveDate,branchCode,effectiveDate,effectiveDate},String.class);
			}catch (Exception e) {
				logger.debug("Exception @ "+e);
			}
			return result;
		}

		public String getvatTaxprecent(String openCoverNo) {
			String vatTaxprecent="";
			 try {
				String query =getQuery("GET_VAT_TAX_PERCENT");
				//"select isnull(VAT_TAX_PERCENT,5) from open_cover_master ocm where ocm.MISSIPPI_OPENCOVER_NO=? and ocm.AMEND_ID=(select max(AMEND_ID) from open_cover_master where MISSIPPI_OPENCOVER_NO=?)";
				vatTaxprecent=(String) this.mytemplate.queryForObject(query, new String[]{openCoverNo,openCoverNo},String.class);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return vatTaxprecent;
		}
}
