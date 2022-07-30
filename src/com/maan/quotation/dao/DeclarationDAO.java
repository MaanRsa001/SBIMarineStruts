package com.maan.quotation.dao;
import java.util.*;

import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.Logger;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import com.maan.common.DBConstants;
import com.maan.common.LogUtil;
import com.maan.common.MarineJdbcTemplate;
import com.maan.common.exception.BaseException;
import com.maan.quotation.DeclarationAction;
import com.maan.quotation.service.PremiumService;
import com.maan.upload.api.UploadApiCall;

public class DeclarationDAO extends MarineJdbcTemplate{
	final static Logger logger = LogUtil.getLogger(DeclarationDAO.class);
	String sql="";
	UploadApiCall api = new UploadApiCall();
	
	
	public List<Object> getDeclarationList(String option, String[] args) throws  BaseException{
		logger.info("getReportList - Enter || option:" + option+" args: "+StringUtils.join(args, ","));
		List<Object> list=null;
		try
		{
			if("T".equalsIgnoreCase(option)){
				sql=getQuery(DBConstants.REPORT_TRANSACTION);
			}else if("D".equalsIgnoreCase(option)){
				sql=getQuery(DBConstants.REPORT_DECLARATION)+") A";
			}else if("DT".equalsIgnoreCase(option)){
				sql=getQuery(DBConstants.REPORT_DECLARATION_TRANSACTION);
			}else if("MC".equalsIgnoreCase(option)){
				sql=getQuery(DBConstants.DECLARATION_QUOTE_INFO);
			}else if("DE".equals(option)){
				//sql="SELECT  A.APPLICATION_NO,A.QUOTE_NO, A.CUSTOMER_ID, TO_CHAR (A.ENTRY_DATE, 'DD/MM/YYYY') QUOTATION_DATE, TO_CHAR (A.EFFECTIVE_DATE, 'DD/MM/YYYY') VALIDITY_DATE, NVL (B.COMPANY_NAME, B.FIRST_NAME) CUSTOMER_NAME, A.LOGIN_ID, B.COMPANY_NAME, A.EFFECTIVE_DATE, NVL (M.OPEN_COVER_NO, '0'), (NVL (M.PREMIUM, 0) + NVL (M.EXCESS_PREMIUM, 0) + NVL (M.GOVT_TAX, 0) + NVL (M.EMERGENCY_FUND, 0 ) + NVL (M.POLICY_FEE, 0)) PREMIUM, B.EMAIL FROM POSITION_MASTER A, PERSONAL_INFO B, MARINE_DATA M WHERE A.LOGIN_ID =? AND (A.FREIGHT_STATUS NOT IN ('F', 'B') OR A.FREIGHT_STATUS IS NULL) AND A.EFFECTIVE_DATE > = SYSDATE  AND A.STATUS  = 'Y' AND (A.REMARKS NOT IN ('Admin', 'Referal', 'NORMAL_EXCESS_PRICE')) AND M.APPLICATION_NO  = A.APPLICATION_NO AND NVL (M.ADMIN_REFERRAL_STATUS, 'N') NOT IN ('Y') AND B.CUSTOMER_ID = A.CUSTOMER_ID AND A.PRODUCT_ID = ? AND A.APPLICATION_ID = NVL(?,'1') AND NVL(A.OPEN_COVER_NO,'0') like NVL(? ||'%','0') ORDER BY QUOTE_NO DESC";
				sql="SELECT A.QUOTE_NO, NVL (B.COMPANY_NAME, B.FIRST_NAME) FIRST_NAME ,M.TOTAL_SUM_INSURED TOTAL_SUM_INSURED,(NVL (M.PREMIUM, 0) + NVL (M.EXCESS_PREMIUM, 0) + NVL (M.GOVT_TAX, 0) +NVL (M.EMERGENCY_FUND, 0 ) + NVL (M.FEE, 0)) PREMIUM,( select count(*) from WEBSERVICE_MARINE_QUOTE  WHERE APPLICATION_NO = M.APPLICATION_NO and TRANSACTION_ID is not null ) PACKAGE_DESCRIPTION FROM POSITION_MASTER A, PERSONAL_INFO B, MARINE_DATA M   WHERE A.LOGIN_ID =? AND (A.FREIGHT_STATUS NOT IN ('F', 'B') OR A.FREIGHT_STATUS IS NULL) AND A.EFFECTIVE_DATE > = SYSDATE AND A.STATUS  = 'Y' AND (A.REMARKS NOT IN ('Admin', 'Referal', 'NORMAL_EXCESS_PRICE')) AND M.APPLICATION_NO  = A.APPLICATION_NO AND NVL (M.ADMIN_REFERRAL_STATUS, 'N') NOT IN ('Y')      AND B.CUSTOMER_ID = A.CUSTOMER_ID AND A.PRODUCT_ID = ?  AND A.APPLICATION_ID = NVL(?,'1') AND NVL(A.OPEN_COVER_NO,'0') like NVL(? ||'%','0') ORDER BY QUOTE_NO DESC";
				}
			for (int i = 0; i < args.length; i++) {
				if(args[i]==null){
					args[i]="";
				}
			}
			list=this.mytemplate.queryForList(sql,args);			
		}
		catch (Exception e)
		{			
			logger.debug("EXCEPTION @ { " + e + " }");
		}		
		logger.info("Query=>" + sql);		
		logger.info("getReportList - Exit || Result: " + list.size());
			
		return list;
	}
	public List<Object> getDeclarationList(String option, String reqFrom, String[] args) throws  BaseException{
		logger.info("getDeclarationList - Enter ");
		List<Object> list=null;
		try {
			list = api.getDeclarationList(option, reqFrom, args);
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("getDeclarationList - Exit || Result: " + list.size());
			
		return list;
	}
	public List<Object> getDeclarationList(String selectedAllQuote) throws  BaseException{
		logger.info("getReportList - Enter || args: ");
		List<Object> list=null;
		try
		{
			list=api.getDeclarationQuoteList(selectedAllQuote);			
		}
		catch (Exception e)
		{			
			logger.debug("EXCEPTION @ { " + e + " }");
		}		
	
		return list;
	}
	 public int updatePolicyInfo(List<Object> selectedQuote, String generateStatus, String stampStatus,String policyStartDate,String declarationMnth,String declarationYr) throws  BaseException{
		 logger.info("updatePolicyInfo - Enter || args: " + StringUtils.join(selectedQuote,","));
		 int result=0;
		 try{
			 //UPDATE POSITION_MASTER SET PDF_GENERATE_STATUS\=?,PDF_STAMP_STATUS\=? WHERE QUOTE_NO IN (?)
				
			 //sql=getQuery(DBConstants.DECLARATION_UPDATE_QUOTE);
			 Object quoteNos[]=selectedQuote.toArray();
			 String str="";
			 for(Object k:quoteNos)
				 str+=",'"+k+"'";
			 if(str.length()>0)
 				 str=str.substring(1);
			 
			 //String policyCond="";
			 String sql=getQuery(DBConstants.DECLARATION_UPDATE_QUOTE, new Object[]{str});
			 result=this.mytemplate.update(sql,new Object[]{StringUtils.isBlank(generateStatus)?"N":generateStatus, StringUtils.isBlank(stampStatus)?"N":stampStatus,policyStartDate,policyStartDate});
			 sql="update  XL_TRANSACTION_DETAILS set DECLARATION_MONTH = ? ,DECLARATION_YEAR = ? where  TRANSACTION_ID=(select TRANSACTION_ID from webservice_marine_quote where APPLICATION_NO  = (select APPLICATION_NO from position_master where QUOTE_NO=?))";
			 this.mytemplate.update(sql,new Object[]{declarationMnth, declarationYr,quoteNos[0]});
		 }catch(Exception e){
			 logger.debug("EXCEPTION @ { " + e + " }");
			 e.printStackTrace();
		 }
		 logger.info("Query===>" + sql);
		 logger.info("updatePolicyInfo - Exit || Result: " + result);
		 
		 return result;
	 }

	 public List<String> validateFields(List<Object> selectedQuotes){
		 List<String> result=new ArrayList<String>();
		  try{
			  logger.info("Enter into validateFields()");
			  String query="SELECT APPLICATION_NO,BRANCH_CODE,SETTLING_AGENT_NAME SETTLING_AGENT ,QUOTE_NO FROM WEBSERVICE_MARINE_QUOTE WHERE QUOTE_NO IN("+"'"+StringUtils.join(selectedQuotes,"','")+"'"+")";
			  //String args="'"+StringUtils.join(selectedQuotes,"','")+"'";
			  List<Map<String,String>> listOfRecord = (List<Map<String,String>>)this.mytemplate.queryForList(query);
			  	if(!listOfRecord.isEmpty() && listOfRecord.size()>0){
			  		for(int i=0;i<listOfRecord.size();i++){
			  			Map<String,String> record =(Map<String,String>) listOfRecord.get(i); 
			  			/* if(record.get("SETTLING_AGENT")==null || StringUtils.isEmpty(record.get("SETTLING_AGENT").toString())){
				 			result.add("Please Go Back & Select Settling Agent in Quote No :"+String.valueOf(record.get("QUOTE_NO")));
				 			}*/
			  			String string = String.valueOf(record.get("APPLICATION_NO"));
			  			String string2 = record.get("BRANCH_CODE").toString();
			  			 List<Map<String, String>> list= searchList(string,string2);
				 			for(Map<String, String> map:list){
				 				/*if((String)map.get("INVOICE_NUMBER")==null || StringUtils.isBlank((String)map.get("INVOICE_NUMBER")))
				 					result.add("Please Enter Invoice Number for '"+map.get("COMMODITY_NAME").toString()+"' Commodity For Quote No"+ String.valueOf(record.get("QUOTE_NO")));
				 				*//*if((String)map.get("INVOICE_DATE")==null || StringUtils.isBlank((String)map.get("INVOICE_DATE")))
				 					result.add("Please Enter Invoice Date for '"+map.get("COMMODITY_NAME").toString()+"' Commodity For Quote No"+  String.valueOf(record.get("QUOTE_NO")));*/
				 			}
			  		}
			  	}
			  logger.info("Exit into validateFields()");
		  }catch (Exception e) {
			e.printStackTrace();
			 result.add(e.getLocalizedMessage());
		}
			return result;
	 }

 
	 public List<String> validateExcessPremium(List<Object> selectedQuotes) 
	 	{
		 boolean endt=false;
		 String totalPremium,additionalPremium;
		  List<String> result=new ArrayList<String>();
		  try{
			  String query="SELECT APPLICATION_NO FROM WEBSERVICE_MARINE_QUOTE WHERE QUOTE_NO IN("+"'"+StringUtils.join(selectedQuotes,"','")+"'"+")";
			 	List<Map<String,String>> listOfRecord = this.mytemplate.queryForList(query);
		  	for(int i=0;i<listOfRecord.size();i++){
		  		Map<String, String> record = listOfRecord.get(i);
		  		endt=new PremiumService().isEndorsement(String.valueOf(record.get("APPLICATION_NO")));
		  		double excessPercent=0.0,loadPercent=0.0,disPercent=0.0,minPre=0.0;
		  		query="select EXCESS_PREMIUM,PREMIUM from marine_data WHERE APPLICATION_NO=?";
		  		List<Map<String,String>> premium = this.mytemplate.queryForList(query, new Object[]{String.valueOf(record.get("APPLICATION_NO"))});
		  		additionalPremium=premium.get(0).get("EXCESS_PREMIUM")!=null?String.valueOf(premium.get(0).get("EXCESS_PREMIUM")):"0";
		  		totalPremium=premium.get(0).get("PREMIUM")!=null?String.valueOf(premium.get(0).get("PREMIUM")):"0";
	 		
		  		if(!endt){
		  			if(Double.parseDouble(StringUtils.isBlank(additionalPremium)?"0":additionalPremium)!=0)
		  				excessPercent= (Double.parseDouble(additionalPremium)/Double.parseDouble(totalPremium))*100;
		  			else
	 				excessPercent=0;
	 			 }
	 			  	if(Double.parseDouble(additionalPremium)>Double.parseDouble(totalPremium)){
	 					result.add("error.premiumInfo.excessPremium.exceeds.totalPre");
	 				}else if(minPre==Double.parseDouble(totalPremium) && excessPercent>0){
	 					result.add("Final premium less than Minimum premium");
	 				}else if(Double.parseDouble(totalPremium)-Double.parseDouble(additionalPremium)<minPre){
	 					result.add("Final premium less than Minimum premium");
	 				}
	 		}
		  }catch (Exception e) {
			 result.add(e.getLocalizedMessage());
		}
		  	return result;
	 	}
	 public List<Map<String, String>> searchList(String applicationNo,String branchCode){
			List<Map<String, String>> searchList=null;		
			String query=getQuery("SER_COMM_SHOW");
			logger.info("query "+query+">>>>"+applicationNo+" branchCode==> "+branchCode);
		    try{
		    	searchList=this.mytemplate.queryForList(query,new String[]{branchCode,applicationNo});
		    }
		    catch(Exception e){
		  	  e.printStackTrace();
		    }
		    return searchList;
		}
	public List<Object> getPolicyPrints(String startDate, String openCoverNo,String policyMode,String branch) {
		 List<Object> result=null;
		try{
			String query=getQuery("GET_POLICY_REPORT");			 
			logger.info("query "+query+">> args"+StringUtils.join(new Object[]{startDate,StringUtils.isBlank(openCoverNo)?"":openCoverNo,policyMode,branch},","));
			result=(List<Object>)this.mytemplate.queryForList(query, new Object[]{startDate,StringUtils.isBlank(openCoverNo)?"":openCoverNo,policyMode,branch});
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public void processRecords(String tranId, String loginId, String openCoverNo, String branchCode, String issuer, String productId, String brokerCode) {
		api.processRecords(tranId,  loginId,  openCoverNo,  branchCode,  issuer,  productId,  brokerCode);
		
	}
	
	public void getDeclarationQuote(DeclarationAction bean) {
		api.getDeclarationQuote(bean);
		
	}
		  	
}
