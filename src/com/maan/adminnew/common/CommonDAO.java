package com.maan.adminnew.common;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.Logger;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.dao.IncorrectResultSizeDataAccessException;

import com.maan.adminnew.BrokerManagement.BrokerMgmBean;
import com.maan.common.LogUtil;
import com.maan.common.MyJdbcTemplate;

public class CommonDAO extends MyJdbcTemplate{
	final Logger logger = LogUtil.getLogger(CommonDAO.class);
	CommonAPI api = new CommonAPI();
	String query="";
	public List<Object> getAdminInfo(String user){
		logger.info("Method to getAdminInfo");
    	List<Object> menuIds=null;
    	String sql="";
    	try{
			sql=getQuery("GET_MAIN_USER_INFO");
			menuIds=this.mytemplate.queryForList(sql,new Object[]{user});
		   }
		catch (Exception e) {			
			logger.debug("EXCEPTION @ { " + e + " }");
		}		
		logger.info("Query===>" + sql);
		logger.info("getAdminInfo() - Exit || Result: " + menuIds.size());
		//logger.popRemove();		
    
    	return menuIds;
    }
	
	public List<Object>getMenuList(String menuIds, final String bCode, final String productId){
		logger.info("Get Menu List - Enter");
        List<Object> list = null;
        try {
            //query = LocalizedTextUtil.findDefaultText("GET_MAIN_MENU_LIST", Locale.ENGLISH, new String[]{menuIds.replaceAll(",", "','"), productId, bCode});
        	query ="SELECT MENU_ID,MENU_NAME,MENU_URL,PARENT_MENU FROM MENU_MASTER M WHERE STATUS='Y' AND  NOT EXISTS(SELECT 'Y' FROM MENU_MASTER MI WHERE MI.MENU_ID=M.MENU_ID AND MENU_ID IN(?)) AND MENU_ID IS NOT NULL  AND PRODUCT_ID=?  AND BRANCH_CODE=? ORDER BY MENU_ID DESC";
            logger.info("Query===> " + query);
            list = this.mytemplate.queryForList(query,new Object[] {menuIds,productId,bCode});
            logger.info("Menu List Size=>"+list.size());
        } catch (Exception e) {
        	logger.debug("EXCEPTION @ { " + e + " }");
        }
       
        logger.info("Params => " + menuIds);
        logger.info("Get Menu List - Exit");
        return list;
    }
	public List <Object> getCountries(String branchCode)
	{
//		List <Object> countries =null;
//		try {
//			logger.info("Method to getCountries");
//			query=getQuery("GET_Countries");
//			logger.info("Query===>" + query);
//			countries=this.mytemplate.queryForList(query, new Object[]{branchCode});
//			logger.info("getCountries() - Exit");
//		}
//		catch (Exception e) 
//		{
//			logger.debug("EXCEPTION @ { " + e + " }");
//		}
		return api.getCountries(branchCode);
	}
	
	public List <Object> getEmirates(String branchCode)
	{
//		List <Object> emirates =null;
//		try {
//			logger.info("Method to getEmirates");
//			query=getQuery("GET_Emirates");
//			logger.info("Query===>" + query);
//			emirates=this.mytemplate.queryForList(query, new Object[]{branchCode});
//			logger.info("getEmirates() - Exit");
//		}
//		catch (Exception e) 
//		{
//			logger.debug("EXCEPTION @ { " + e + " }");
//		}
		return api.getEmirates(branchCode);
	}
	public List <Object> getNationalities(String branchCode) 
	{
//		List <Object> nationalities =null;
//		try {
//			logger.info("Method to getNationalities");
//			query=getQuery("GET_Nationalities");
//			logger.info("Query===>" + query);
//			nationalities=this.mytemplate.queryForList(query);
//			logger.info("getNationalities() - Exit");
//		}
//		catch (Exception e) 
//		{
//			logger.debug("EXCEPTION @ { " + e + " }");
//		}
		return api.getNationalities(branchCode);
	}
	public int getExist(Object[] val,String str)throws EmptyResultDataAccessException,IncorrectResultSizeDataAccessException
	{
		int checkList=0;
		try{
			logger.info("Method to getExist()");
			
			if(str.equals("transport"))
			{
				query=getQuery("Check_mode_of_transport");
			}
			else if(str.equals("convey"))
			{
				query=getQuery("Check_convey");
			}
			else if(str.equals("country"))
			{
				query=getQuery("Check_Country");
			}
			else if(str.equals("bank"))
			{
				query=getQuery("Check_Bank");
			}
			else if(str.equals("material"))
			{
				query=getQuery("Check_material");
			}
			else if(str.equals("war"))
			{
				query=getQuery("Check_War");
			}
			else if(str.equals("sale"))
			{
				query=getQuery("Check_Sale");
			}
			else if(str.equals("tole"))
			{
				query=getQuery("Check_tole");
			}
			else if(str.equals("comEx"))
			{
				query=getQuery("Check_comEx");
			}
			else if(str.equals("extraCover"))
			{
				query=getQuery("Check_extraCover");
			}
			else if(str.equals("city"))
			{
				query=getQuery("Check_city");
			}			
			else if(str.equals("vessel"))
			{
				query=getQuery("Check_vessel");
			}
			else if(str.equals("warranty"))
			{
				query=getQuery("Check_Warranty");
			}
			else if(str.equals("constant"))
			{
				query=getQuery("Check_constant");
			}
			else if(str.equals("extra"))
			{
				query=getQuery("Check_extra_name");
			}
			else if(str.equals("countryDet"))
			{
				query=getQuery("Check_countryDet");
			}
			else if(str.equals("agent"))
			{
				query=getQuery("Check_Agent");
			}
			else if(str.equals("commodity"))
			{
				query=getQuery("Check_commodity");
			}
			else if(str.equals("currency"))
			{
				query=getQuery("Check_currency");
			}
			else if(str.equals("exchange"))
			{
				query=getQuery("Check_exchange");
			}
			else if(str.equals("cover"))
			{
				query=getQuery("Check_cover");
			}
			else if(str.equals("exclusion"))
			{
				query=getQuery("Check_Exclusion");
			}
			else if(str.equals("clauseID"))
			{
				query=getQuery("Check_ClauseID");
			}
			else if(str.equals("categ"))
			{
				query=getQuery("Check_Categ");
			}
			else if(str.equals("display"))
			{
				query=getQuery("Check_display_order");
			}
			checkList=this.mytemplate.queryForInt(query,val);
			logger.info("Query===>" + query);
			logger.info("getExist() - Exit");
			}
		    
		    catch(EmptyResultDataAccessException e){
				logger.info("Core Application Code Not Exist");
				
			}
			catch(IncorrectResultSizeDataAccessException e){
				logger.info("Core Application Code Not Exist");
				
			}
			return checkList;
	}
	

	public List <Object> getTitles(String branchCode)
	{
		List <Object> titles =null;
		try {
//			logger.info("Method to getTitles");
//			query=getQuery("GET_Titles");
//			logger.info("Query===>" + query);
//			logger.info("BranchCode===>" + branchCode);
//			Object[] obj=new Object[1];
//			obj[0]=branchCode;
//			titles=this.mytemplate.queryForList(query,obj);
//			logger.info("getTitles() - Exit");
		}
		catch (Exception e) 
		{
			logger.debug("EXCEPTION @ { " + e + " }");
		}
		return api.getTitle(branchCode);
	}
	
	public List <Map<String,String>> getProductsDET(String branchCode, String agencyCode){
		logger.info("Method to getProductsDET");
		List <Map<String,String>> product_Det=null;
		product_Det=api.getProductsDET(branchCode,agencyCode);
		return product_Det;
    }
	List<Map<String,String>> getReferralProducts(String branchCode,String productId){
		logger.info("Method to getReferralProducts");
		List <Map<String,String>> product_Det=null;
		String[] args=null;
		try{
			String product="";
			query=getQuery("GET_REF_PRODUCT_DET");			
			if("11".equals(productId) || "3".equals(productId)){
				query+="  and PRODUCT_ID in('3','11') order by product_id";
				args=new String[]{branchCode};
			}else{
				product=productId;
				query+="  and PRODUCT_ID in(?) order by product_id";
				args=new String[]{branchCode,product};
			}
			
			logger.info("Query===>" + query);
			product_Det=this.mytemplate.queryForList(query,args);
		}
		catch(Exception e){
			logger.debug("EXCEPTION @ { " + e + " }");
			e.printStackTrace();
		}
		return product_Det;
	}
 
	/*public int getCustomerId(String branchCode){
		int customer_id=0;
		try{
			query=getQuery("GET_Customer_Id");
			logger.info("Query===>" + query);
			customer_id=this.mytemplate.queryForInt(query,new Object[]{branchCode});
			query=getQuery("UPD_Customer_Id");
			logger.info("Query===>" + query);
			this.mytemplate.update(query,new Object[]{customer_id, customer_id, branchCode});
			logger.info("customer_id===>" + customer_id);
		}
		catch(Exception e){
			logger.debug("EXCEPTION @ { " + e + " }");
		}
		return customer_id;
	}*/
	public String getUserCode(String branchCode) {
		String agencyCode="";
		try {
			query=getQuery("GET_USER_AGENCYCODE"); 
			int acode=this.mytemplate.queryForInt(query, new Object[]{branchCode});
			agencyCode = String.valueOf(acode);
			query=getQuery("UPD_USER_AGENCYCODE"); 
			this.mytemplate.update(query, new Object[]{acode+1,branchCode});
			logger.info("Query===>" + query);
			logger.info("agencyCode===>" + agencyCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return agencyCode;
	}
	 public int getMaxUserId(){
		int user_Id=0;
		try{
			String query=getQuery("GET_MAXUSER_ID");
			logger.info("Query===>" + query);
			user_Id=this.mytemplate.queryForInt(query);
		}
		catch(Exception e){
			logger.debug("EXCEPTION @ { " + e + " }");
		}
		logger.info("getMaxUserId() - Exit	user_Id===>"+user_Id);
    	return user_Id;
    }
	 public void checkPassword(String[] args) {
	   try
	   { 
			String query=getQuery("UPD_broker_password");
			logger.info("Query===>" + query);
			this.mytemplate.update(query,args);
	   }
	   catch (Exception e) 
		{
			logger.debug("EXCEPTION @ { " + e + " }");
		}
	}
	 public void insertCommission(Object[] info, Object[] obj1){
		logger.info("ENTER-->Method to insertCommission");
    	try
    	{
			String query=getQuery("INS_PRODUCT_DET");
			logger.info("Query===>" + query);
			logger.info("queryFrammer : "+queryFrammer(query,info));
			this.mytemplate.update(query, replaceEmptyIfNull(info));
			if(obj1!=null){
				query=getQuery("UPD_PRODUCT_DET_LM");
				logger.info("Query===>" + query);
				this.mytemplate.update(query, obj1);
			}
    	}catch(Exception e)
    	{
    		logger.debug("Exception @ "+e);
    		e.printStackTrace();
    	}
    	logger.info("insertCommission() - Exit");
    }
	 public void updateCommission(Object[] info, Object[] obj1){
		logger.info("ENTER-->Method to updateCommission");
    	try
    	{
			String query=getQuery("UPD_PRODUCT_DET");
			logger.info("Query===>" + query);
			removeNull(info);
			this.mytemplate.update(query, replaceEmptyIfNull(info));
			if(obj1!=null){
				query=getQuery("UPD_PRODUCT_DET_LM");
				logger.info("Query===>" + query);
				removeNull(obj1);
				this.mytemplate.update(query, obj1);
			}
    	}catch(Exception e)
    	{
    		logger.debug("Exception @ "+e);
    		e.printStackTrace();
    	}
    	logger.info("updateCommission() - Exit");
    }
	 
	 public void updateMotorCommission(Object[] info, Object[] obj1){
			logger.info("ENTER-->Method to updateCommission");
	    	try
	    	{
				String query=getQuery("UPD_PRODUCT_MOTOR_DET");
				logger.info("Query===>" + query);
				logger.info("Arguments ===>" + StringUtils.join(info,","));
				this.mytemplate.update(query, replaceEmptyIfNull(info));
				if(obj1!=null){
					query=getQuery("UPD_PRODUCT_DET_MOTOR_LM");
					logger.info("Query===>" + query);
					logger.info("Arguments ===>" + StringUtils.join(obj1,","));
					this.mytemplate.update(query, obj1);
				}
	    	}catch(Exception e)
	    	{
	    		logger.debug("Exception @ "+e);
	    	}
	    	logger.info("updateCommission() - Exit");
	    }
	 
	 
	 public int checkExistProduct(String productId, String agencyCode){
		 int count=0;
    	try{
			String query=getQuery("GET_EXIST_PRODUCT_COUNT");
			logger.info("Query===>" + query);
			count=this.mytemplate.queryForInt(query, new Object[]{productId, agencyCode});
    	}catch(Exception e){
    		logger.debug("Exception @ "+e);
    	}
    	return count;
	 }
	 public int removeExistProduct(String productId,String agencyCode){
		 int count=0;
	    	try{
	    		String sql ="delete from LOGIN_USER_DETAILS where PRODUCT_ID=? and AGENCY_CODE=?";
	    		logger.info("Query===>" + query);
	    		count=this.mytemplate.update(sql, new Object[]{productId, agencyCode});
	    	}catch(Exception e){
	    		logger.debug("Exception @ "+e);
	    	}
	    	return count;
	 }
	 public List <Object> getAdminBrokerList(String branchCode, String appId){
    	List <Object> brokerList=null;
    	
    	try{
			logger.info("branchCode===>" + branchCode+" >> "+appId);
			brokerList= api.getAdminBrokerList(branchCode,appId);
		   }
		catch (Exception e) {			
			logger.debug("EXCEPTION @ { " + e + " }");
		}
    	return brokerList;
	 }
	 public List<Object> getBusinessTypeList(final String branchCode) {
		List <Object> brokerTypeList=null;
    	try{
			String query=getQuery("GET_BROKERTYPE_LIST");
			logger.info("Query===>" + query);
			logger.info("branchCode===>" + branchCode);
			brokerTypeList=this.mytemplate.queryForList(query,new Object[]{branchCode});		
		   }
		catch (Exception e) {			
			logger.debug("EXCEPTION @ { " + e + " }");
		}
    	return brokerTypeList;
    } 
	public List<Object> getCurrencyList() {
		List <Object> currencyList=null;
    	try{
			String query=getQuery("GET_CURRENCY_LIST");
			logger.info("Query===>" + query);
			currencyList=this.mytemplate.queryForList(query);		
		   }
		catch (Exception e) {			
			logger.debug("EXCEPTION @ { " + e + " }");
		}
    	return currencyList;
    }
	
	public HashMap getBrokerUserDetails(String branch){
		
		HashMap<String, Object> finalMap = new HashMap<String, Object> ();
		try{
			List<Map<String,Object>> list=api.getBrokerUserDetails(branch);
					
			if(list!=null && list.size()>0){
				Map<String,Object>resultMap=list.get(0);
				finalMap.put("Branch", branch);
				finalMap.put("CurrencyName",(resultMap.get("CurrencyName")==null?"SAR":resultMap.get("CurrencyName").toString()));
				finalMap.put("Orgination",(resultMap.get("OrgincountryId")==null?"1":resultMap.get("OrgincountryId").toString()));
				finalMap.put("Destination",(resultMap.get("DestcountryId")==null?"1":resultMap.get("DestcountryId").toString()));
				finalMap.put("CurrencyAbb",(resultMap.get("CurrencyName")==null?"SAR":resultMap.get("CurrencyName").toString()));
				finalMap.put("CurrencyDecimal",(resultMap.get("DecimalPlaces")==null?"2":resultMap.get("DecimalPlaces").toString()));
				finalMap.put("Tax",(resultMap.get("Tax")==null?"0":resultMap.get("Tax").toString()));
				finalMap.put("Site",(resultMap.get("Email")==null?" ":resultMap.get("Email").toString()));
				finalMap.put("LANG",(resultMap.get("LangYN")==null?" ":resultMap.get("LangYN").toString()));
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return finalMap;
	}
	public Object[] replaceEmptyIfNull(Object[] args){
		if(args!=null){
			for (int i = 0; i < args.length; i++) {
				if(args[i]==null){
					args[i]="";
				}
			}
		}
		return args;
	}
	public List<Object> isBetweenTwo(Object[] val) 
    {
		List<Object> list=null;
		try{
			logger.info("Enter into isBetweenTwo() ");
			query="SELECT   NVL (DEDUCTIBLE, '0') FROM   COMMODITY_EXCESS_PREMIUM  WHERE  ? BETWEEN START_SUM_INSURED AND END_SUM_INSURED AND STATUS = 'Y' and branch_code=?";
			
			logger.info("Values --->"+StringUtils.join(val,","));
			logger.info("Query --->"+query);
			
			list=this.mytemplate.queryForList(query,val);
			logger.info("Exit into isBetweenTwo() ");
		}catch (Exception e) {
			e.printStackTrace();
			logger.info("Exception isBetweenTwo() "+e);
			
		} 
		return list;
    }

	public List<Object> getAdminBranchList(String branchCode, String appId) {
		List <Object> branchList=null;
    	try{
			String query=getQuery("GET_ADMIN_Branch_Detail");
			logger.info("Query===>" + query);		
			branchList=this.mytemplate.queryForList(query);				
		}catch (Exception e) {
			e.printStackTrace();
			logger.info("Exception getAdminBranchList() "+e);
		}
		return branchList;
	}

	public List<Map<String, String>> getBranchDetails(String loginId) {
		List<Map<String, String>> result=null;
		try{
			String query=getQuery("GET_ADMIN_REF_Branch_Detail");
			logger.info("Query===>" + query);		
			result=this.mytemplate.queryForList(query,new Object[]{loginId});
		}catch (Exception e) {
		 e.printStackTrace();
		}
		return result;
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
	
	public String getB2CGuestLoginId(String branchCode) {
		String result = "";
		try {
			String query = getQuery("GET_B2C_LOGINID");
			Object[] args = new Object[]{branchCode};
			result = (String) this.mytemplate.queryForObject(query, args, String.class);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	public String getAgencyCode(String loginId) {
		String result = "";
		try {
			String query = getQuery("GET_AGENCYCODE");
			Object[] args = new Object[]{loginId};
			result = (String) this.mytemplate.queryForObject(query, args, String.class);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * User,Broker,Issuer Branch Linked Location
	 */
	public List<Map<String, Object>> getLinkedBranchList() {
		List<Map<String, Object>> result=new ArrayList<Map<String,Object>>();
		try{
			//String query=getQuery("GET_BROKER_LINKED_LOC");
			//logger.info("Query===>" + query);		
			//result=this.mytemplate.queryForList(query);
		}catch (Exception e) {
		 e.printStackTrace();
		}
		return result;
	}

	public List<Object> getBrokerList(String branchCode, String productId) {
		List<Object> result=null;
		try{
			String query=getQuery("GET_BROKER_DETAIL_LIST");
			logger.info("Query===>" + query);		
			logger.info("Arguments ===>" + branchCode);
			result=this.mytemplate.queryForList(query,new Object[]{branchCode,productId});
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	public List<Object> getUserListBasedOnBrokerCode(String loginId) {
		List<Object> result=null;
		try{
			String query=getQuery("GET_USER_DETAIL_LIST");
			logger.info("Query===>" + query);		
			logger.info("Arguments ===>" + loginId);
			result=this.mytemplate.queryForList(query,new Object[]{loginId});
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}

	public List<Map<String, String>> getDropdownValue(String branch, String loginId, String type) {
		return api.getDropdownValue(branch,loginId,type);
	}

	public void addProduct(BrokerMgmBean bean) {
		api.addProduct(bean);
	}

	public List<Map<String, Object>> getRegionsList() {
		return api.getRegionsList();
	}

	public List<Map<String, Object>> getBranchList(String regionCode) {
		return api.getBranchList(regionCode);
	}
	public List<Map<String, Object>> getAttachedBranchList(String selregions) {
		return api.getAttachedBranchList(selregions);
	}

	public List<Map<String, Object>> getAttancedRegion(String agencyCode) {
		return api.getAttancedRegion(agencyCode);
	}

	public List<Map<String, Object>> getUserAttachedBranchList(String agencyCode, String selregions) {
		return api.getUserAttachedBranchList( agencyCode,  selregions);
	}
}