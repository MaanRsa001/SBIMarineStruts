package com.maan.copyquote.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.Logger;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import com.maan.common.DBConstants;
import com.maan.common.LogUtil;
import com.maan.common.MyJdbcTemplate;
import com.maan.copyquote.CopyQuoteApiCaller;


public class CopyQuoteDAO  extends MyJdbcTemplate{
	final static Logger logger = LogUtil.getLogger(CopyQuoteDAO.class);
	public String sql="";
	CopyQuoteApiCaller api = new CopyQuoteApiCaller();
	
	public List<Object> getCopyQuoteSearch(String type,String value,String openCoverNo, String productId, String issuer, String loginID,String branchCode)
	{
		List<Object> list=null;	
		try
		{
			list = api.getCopyQuoteSearch(type,value,openCoverNo,productId,issuer,loginID,branchCode);

		}
		catch(Exception e)
		{
			logger.debug("Exception @ "+e);
		}
		//logger.popRemove();
		logger.info("getOptionsList - Exit || Result: "+list.size());
		return list;		
	}
	public Map<String, Object> copyQuote(String loginId,String quoteNo, String type, String typeId, String issuer)
	{
		logger.info("copyQuote - Enter || loginId: "+loginId+" quoteNo: "+quoteNo+" type: "+type+" typeId: "+typeId);
	     	Map<String, Object> result=new java.util.TreeMap<String,Object>(String.CASE_INSENSITIVE_ORDER);
	     	result = api.copyQuote(loginId,quoteNo, type, typeId,issuer);
	     	return result;   	 

	}
	public List<Object> getTravelCopyQuoteSearch(String type,String value,String loginID,String productId) {
		List<Object> list=null;	
		try
		{
			if(type.equals("quoteNo"))
			{ 
				sql=getQuery(DBConstants.TRAVEL_COPYQUOTE_QUOTENO);		
			}
			else if(type.equals("policyNo")){
				sql=getQuery(DBConstants.TRAVEL_COPYQUOTE_POLICYNO);
			}
			else
			{
				sql=getQuery(DBConstants.TRAVEL_COPYQUOTE_CUSTNAME);
			}		
			list=this.mytemplate.queryForList(sql, new String[]{value,loginID,loginID,productId});		
			logger.info("args[] ==> "+type+","+value);
			logger.info("Qurey ==> "+sql);
		}
		catch(Exception e) {
			logger.debug("Exception @ "+e);
		}
		//logger.popRemove();
		logger.info("getTravelOptionsList - Exit || Result: "+list.size());
		return list;		
	}
	public Map<String, Object> travelcopyQuote(String loginId,String quoteNo, String productId,String branchCode, String typeId, String vehicleId) throws Exception {
		Map<String,Object> outputValues = null;
		//logger.info("travelcopyQuote - Enter || loginId: "+loginId+" quoteNo: "+quoteNo);
		//logger.info("args[]"+(StringUtils.isBlank(typeId)?"Normal":"Endt")+","+quoteNo+","+(","+typeId+",")+","+loginId+","+branchCode+","+productId+",,,,,");
		String spName = "";
		logger.info("travelcopyQuote - Enter || loginId: "+loginId+" quoteNo: "+quoteNo);
		if("41".equals(productId)) {
			spName = "HEALTH_COPYQUOTE_ENDT";
		} else if("65".equals(productId)) {
			spName = "MOTOR_COPYQUOTE_ENDT";
		} else if("30".equals(productId)) {
			spName = "COPYQUOTE_FARM";
		} else {
			spName = "TRAVEL_COPYQUOTE_ENDT";
		}
		if("65".equals(productId)) {
			SimpleJdbcCall procedure= mySimpleJdbcCall.withProcedureName(spName);
	     	Map<String,Object> inputValues=new java.util.TreeMap<String, Object>(String.CASE_INSENSITIVE_ORDER);
	     	inputValues.put("pvType", (StringUtils.isBlank(typeId)?"Normal":"Endt") );
	     	inputValues.put("PvQuoteNo", quoteNo);
	     	inputValues.put("pvEndtTypeId", (","+typeId+","));
	     	inputValues.put("pvLoginId", loginId);
	     	inputValues.put("pvBranch", branchCode);
	     	inputValues.put("pnProduct", productId);
	     	inputValues.put("pnvehicleid", vehicleId); 
	     	logger.info("Args==> " + inputValues.toString());
	     	outputValues = procedure.execute(new MapSqlParameterSource(inputValues));
		} else {	
			logger.info("Copy Quote SP Name=>"+spName);
			//TravelCopyQuoteStroredProcedure sp=new TravelCopyQuoteStroredProcedure(this.mytemplate.getDataSource(), spName);
			Map<String, String> map=new HashMap<String, String>();
			map.put("STATUS", (StringUtils.isBlank(typeId)?"Normal":"Endt"));
			map.put("QUOTE_NO1", quoteNo);
			map.put("END_TYPE", (","+typeId+","));
			map.put("LOGIN_ID", loginId);
			map.put("BRANCH_CODE", branchCode);
			map.put("PRODUCT_ID", productId);
			map.put("CUSTOMER_NAME", "");
			map.put("ERROR_STATUS", "");
			map.put("QUOTE_NO", "");
			map.put("APPLICATION_NO", "");
			if(map.size()>0){
				//logger.info("Arguments => "+(StringUtils.isBlank(typeId)?"Normal":"Endt")+","+quoteNo+","+typeId+","+loginId+","+branchCode+","+productId+","+","+","+","+"");
				logger.info("Args==> " + map.toString());
			}
			logger.info("travelcopyQuote - Exit");
			//outputValues = sp.executeProc(map);
		}
		return outputValues;
	}
	public List<Object> getOpenCopyQuoteSearch(String searchType,String searchValue, String openCoverNo, String productId) {
		List<Object> list=null;	
		try
		{
			if(searchType.equals("proposalNo")){ 
				sql=getQuery("openCopyquote.quoteNo");		
			}else if(searchType.equals("policyNo")){
				sql=getQuery("openCopyquote.policyNo");
			}
			logger.info("args[] ==> "+searchType+","+searchValue);
			logger.info("Qurey ==> "+sql);		
			list=this.mytemplate.queryForList(sql, new String[]{searchValue});	 
		}
		catch(Exception e)
		{
			logger.debug("Exception @ "+e);
		}
		//logger.popRemove();
		logger.info("getOptionsList - Exit || Result: "+list.size());
		return list;
	}
	public Map<String, Object> openCopyQuote(String copyQuoteValue) {
		Map<String, Object> outputValues=null;
		try{			
			SimpleJdbcCall procedure= mySimpleJdbcCall.withProcedureName("Renewal_OpenCover");
	     	Map<String,Object> inputValues=new java.util.TreeMap<String, Object>(String.CASE_INSENSITIVE_ORDER);
	     	inputValues.put("pvType", "ProposalCopy");
	     	inputValues.put("pvProposal", copyQuoteValue);	     
	     	inputValues.put("pvProposalNO", "");		     	
	     	logger.info("Args==> " + inputValues.toString());
	     	outputValues = procedure.execute(new MapSqlParameterSource(inputValues));
	      
		}catch (Exception e) {
			e.printStackTrace();
		}
		return outputValues;
	}
}

