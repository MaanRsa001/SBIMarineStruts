package com.maan.adminnew.referal;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.Logger;

import com.maan.common.LogUtil;
import com.maan.common.MyJdbcTemplate;

public class ReferalDAO extends MyJdbcTemplate
{
	final Logger logger = LogUtil.getLogger(ReferalDAO.class);
	String query="";
	ReferalAPI api = new ReferalAPI();
	
	public List <Object> getOCList(String reqFrom, String productID, String branchCode, String agencyCode,String login_id,String attched_Branch){
    	List <Object> occList=null;
    	String[] obj=null;
    	try{
    		if("3".equals(productID)||"11".equals(productID)){
	    		if("pending".equals(reqFrom)){
	    			query=getQuery("GET_OCLIST_PENDING");
	    		}else if("approved".equals(reqFrom)){
	    			query=getQuery("GET_OCLIST_APPROVED");
	    		}else if("rejected".equals(reqFrom)){
	    			query=getQuery("GET_OCLIST_REJECTED");
	    		}
    		}else{
	    		if("pending".equals(reqFrom)){
	    			query=getQuery("GET_HOMEOCLIST_PENDING");
	    		}else if("approved".equals(reqFrom)){
	    			query=getQuery("GET_HOMEOCLIST_APPROVED");
	    		}else if("rejected".equals(reqFrom)){
	    			query=getQuery("GET_HOMEOCLIST_REJECTED");
	    		}
    		}
    		if("3".equals(productID)||"11".equals(productID)){
	    		if(StringUtils.isEmpty(agencyCode)){
	    		 
	    			query+=" "+getQuery("SUBSTRING_REFERAL_1",new Object[]{("ALL".equals(branchCode)?"'"+StringUtils.join(attched_Branch.split(","),"','")+"'":branchCode)});
	    			obj=new String[]{productID,login_id};
	    		}else{
	    			query+=" "+getQuery("SUBSTRING_REFERAL_2");
	    			obj=new String[]{productID, agencyCode,login_id};
	    		}
    		}else{
    			if(StringUtils.isEmpty(agencyCode)){
	    			query+=" "+getQuery("SUBSTRING_REFERAL_3",new Object[]{("ALL".equals(branchCode)?"'"+StringUtils.join(attched_Branch.split(","),"','")+"'":branchCode)});
	    			obj=new String[]{productID};
	    		}else{
	    			query+=" "+getQuery("SUBSTRING_REFERAL_4");
	    			obj=new String[]{productID, agencyCode};
	    		}
    		}
			logger.info("Query===>" + query);
			//logger.info("Query===>" +StringUtils.join((String[])obj,","));
			occList=this.mytemplate.queryForList(query,obj);
		   }
		catch (Exception e) {			
			logger.debug("EXCEPTION @ { " + e + " }");
		}
    	return occList;
    }
	
	public List <Object> getPolicyList(String branchCode, String date, String productID, String reqFrom, String agencyCode,String loginId,String attched_Branch){
    	List <Object> policyList=null;
    	Object[] obj=null;
    	try{
    		if("3".equals(productID)||"11".equals(productID)){
	    		if("pending".equals(reqFrom)){
	    			query=getQuery("GET_POLICIES_PENDING");
	    		}else if("approved".equals(reqFrom)){
	    			query=getQuery("GET_POLICIES_APPROVED");
	    		}else if("rejected".equals(reqFrom)){
	    			query=getQuery("GET_POLICIES_REJECTED");
	    		}
    		}else{
    			if("pending".equals(reqFrom)){
	    			query=getQuery("GET_HOMEPOLICIES_PENDING");
	    		}else if("approved".equals(reqFrom)){
	    			query=getQuery("GET_HOMEPOLICIES_APPROVED");
	    		}else if("rejected".equals(reqFrom)){
	    			query=getQuery("GET_HOMEPOLICIES_REJECTED");
	    		}
    		}    	
    		
    		if("3".equals(productID)||"11".equals(productID)){
	    		if(StringUtils.isEmpty(agencyCode)){
	    		 
	    			query+=" "+getQuery("SUBSTRING_REFERAL_5",new Object[]{("ALL".equals(branchCode)?"'"+StringUtils.join(attched_Branch.split(","),"','")+"'":branchCode)});
	    			obj=new String[]{date,productID,loginId};
	    		}else{
	    			query+=" "+getQuery("SUBSTRING_REFERAL_6");
	    			obj=new String[]{date,productID, agencyCode,loginId};
	    		}
    		}else{
    			if(StringUtils.isEmpty(agencyCode)){
	    			query+=" "+getQuery("SUBSTRING_REFERAL_7",new Object[]{("ALL".equals(branchCode)?"'"+StringUtils.join(attched_Branch.split(","),"','")+"'":branchCode)});
	    			obj=new String[]{date,productID};
	    		}else{
	    			query+=" "+getQuery("SUBSTRING_REFERAL_8");
	    			obj=new String[]{date,productID, agencyCode};
	    		}
    		}
			logger.info("Query===>" + query);
			policyList=this.mytemplate.queryForList(query,obj);
		}catch (Exception e) {
			logger.debug("EXCEPTION @ { " + e + " }");
		}
    	return policyList;
    }
	public List<Object> getRegionList(String loginId, String accesstype) {
		List<Object> regionList=null;
		try{
			regionList=this.mytemplate.queryForList(getQuery("GET_ATTACHED_REGIONS"),new Object[]{loginId});
		}catch(Exception e){
			e.printStackTrace();
		}
		return regionList;
	}

	public List<Object> searchReferralQuote(String branchId, String searchQuote,String productID) {
		List<Object> rList=null;
		String query="";
		try{
			if("3".equals(productID)||"11".equals(productID)){
				query=getQuery("SEARCH_REFFERRAL");
			}else{
				query=getQuery("MOTOR_SEARCH_REFFERRAL");
			}
			rList=this.mytemplate.queryForList(query,new Object[]{searchQuote});
			logger.info("Query===>" + query);
			logger.info("Arguments===>" + StringUtils.join(new Object[]{searchQuote},",") );
		}catch (Exception e) {
			e.printStackTrace();
		}
		return rList;
	}
	
	public List<Object> searchDecReferralQuote(String branchId, String searchQuote,String productID) {
		List<Object> rList=null;
		String query="";
		try{
				query=getQuery("SEARCH_DEC_REFFERRAL");
			
			rList=this.mytemplate.queryForList(query,new Object[]{searchQuote});
			logger.info("Query===>" + query);
			logger.info("Arguments===>" + StringUtils.join(new Object[]{searchQuote},",") );
		}catch (Exception e) {
			e.printStackTrace();
		}
		return rList;
	}

	public List<Object> getOcListApi(String reqFrom, String productID, String branchId, String agencyCode, String login_id, String attched_Branch) {
		return api.getOcListApi( reqFrom,  productID,  branchId,  agencyCode,  login_id,  attched_Branch);
	}

	public List<Object> getSearchReferralQuoteAPI(String branchId, String searchQuote, String productID) {
		return api.getSearchReferalAPI(branchId , searchQuote , productID);
	}
}