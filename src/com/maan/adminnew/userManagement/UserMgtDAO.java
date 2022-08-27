package com.maan.adminnew.userManagement;

import java.util.List;
import java.util.Map;
import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.Logger;

import com.maan.common.MyJdbcTemplate;

public class UserMgtDAO extends MyJdbcTemplate{
	userMgtApiCaller api = new userMgtApiCaller();
	String query="";
	 final Logger logger=com.maan.common.LogUtil.getLogger(UserMgtDAO.class);
	public List <Object> getAdminUserList(final UserMgtBean ba, String agencyCode, String mode1, String branchCode){
		return api.getAdminUserList(ba, agencyCode,  mode1, branchCode);
    }
	
	public List <Object> getUserDetails(final UserMgtBean ba, String uagencyCode){
		List usertDetails=null;
		try{
			usertDetails = api.getUserDetails(ba,uagencyCode);
			if(usertDetails!=null || usertDetails.size()>0){
				Map map=(Map)usertDetails.get(0);
					ba.setUname(map.get("FirstName")==null?"":map.get("FirstName").toString());
					ba.setUfirstname(map.get("FirstName")==null?"":map.get("FirstName").toString());
					ba.setUlastname(map.get("LastName")==null?"":map.get("LastName").toString());
					ba.setUgender(map.get("Gender")==null?"":map.get("Gender").toString());
					ba.setUnationality(map.get("Nationality")==null?"":map.get("Nationality").toString());
					ba.setUnationalityName(map.get("NationalityName")==null?"":map.get("NationalityName").toString());
					ba.setUdob(map.get("DateOfBirth")==null?"":map.get("DateOfBirth").toString());
					ba.setUphone(map.get("TelephoneNo")==null?"":map.get("TelephoneNo").toString());
					ba.setUmobile(map.get("MobileNo")==null?"":map.get("MobileNo").toString());
					ba.setUfax(map.get("Fax")==null?"":map.get("Fax").toString());
					ba.setUemail(map.get("Email")==null?"":map.get("Email").toString());
					ba.setUaddress1(map.get("Address1")==null?"":map.get("Address1").toString());
					ba.setUaddress2(map.get("Address2")==null?"":map.get("Address2").toString());
					ba.setUoccupation(map.get("Occupation")==null?"":map.get("Occupation").toString());
					ba.setUcountry(map.get("Country")==null?"":map.get("Country").toString());
					ba.setUpobox(map.get("Pobox")==null?"":map.get("Pobox").toString());
					ba.setUagencyCode(map.get("UserAgencyCode")==null?"":map.get("UserAgencyCode").toString());
					ba.setEmirate(map.get("CityName")==null?"":map.get("CityName").toString());
					ba.setUcity(map.get("City")==null?"":map.get("City").toString());
					ba.setCustomerId(map.get("CustomerId")==null?"":map.get("CustomerId").toString());
					ba.setUserId(map.get("LoginId")==null?"":map.get("LoginId").toString());
					ba.setUlogin_Id(map.get("LoginId")==null?"":map.get("LoginId").toString());
					ba.setBname(map.get("CompanyName")==null?"":map.get("CompanyName").toString());
					ba.setUtype(map.get("UserType")==null?"":map.get("UserType").toString());
					ba.setUstatus(map.get("Status")==null?"":map.get("Status").toString());
					ba.setUcountryNa(map.get("CountryName")==null?"":map.get("CountryName").toString());
					ba.setBrokerName(map.get("BrokerOrganization")==null?"":map.get("BrokerOrganization").toString());
					ba.setAgencyCode(map.get("AgencyCode")==null?"":map.get("AgencyCode").toString());
					ba.setBroker(map.get("AgencyCode")==null?"":map.get("AgencyCode").toString());
					ba.setUtitle(map.get("Title")==null?"":map.get("Title").toString());
					ba.setBroLinkLoc(map.get("SubBranch")==null?"":map.get("SubBranch").toString());
					ba.setAttachedregion(map.get("AttachedRegion")==null?"":map.get("AttachedRegion").toString());
					ba.setBranchId(map.get("AttachedBranch")==null?"":map.get("AttachedBranch").toString());
			}
		}catch (Exception e) {			
			logger.debug("EXCEPTION @ { " + e + " }");
		}
    	return usertDetails;
	}
	
	public List <Object> getCommisionData(String uagencyCode, String agencyCode, String branchCode) 
	{
		List <Object> commisionDetails=null;
		try 
		{
			logger.info("Method to getCommisionData");
			commisionDetails=api.getCommissionData(uagencyCode, agencyCode, branchCode);
			logger.info("getCommisionData() - Exit");
		} 
		catch (Exception e) 
		{
			logger.debug("EXCEPTION @ { " + e + " }");
		}
		return commisionDetails;
	}
	
	public List<Object> getUserListAjax(String agencyCode, String searchBy, String searchValue, String mode1){
		List <Object> brokerList=null;
		try{
			if("name".equals(searchBy)){
				query=getQuery("GET_USER_LIST")+" and lower(nvl(per.first_name||''||per.last_name,per.company_name)) like '%'||lower(?)||'%'";
			}
			else 
				query=getQuery("GET_USER_LIST")+" and lower(per.agency_code) like '%'||lower(?)||'%'";
			if("broker".equals(mode1)){
				query+=" and log.oa_code='"+agencyCode+"'";
			}
			logger.info("Query===>" + query);
			brokerList=this.mytemplate.queryForList(query,new Object[]{"User", searchValue});
		   }
		catch (Exception e) {			
			e.printStackTrace();
		}
		return brokerList;
	}
	
	public List <Object> getOCCertificate(String agencyCode, String uagencyCode){
    	List <Object> occList=null;
    	try{
    		occList= api.getOccCertificate(agencyCode,uagencyCode);
		   }
		catch (Exception e) {			
			logger.debug("EXCEPTION @ { " + e + " }");
			e.printStackTrace();
		}
    	return occList;
    }
	
	 public void insertUserInfo(Object[] args, Object[] args1){
    	try{
			query=getQuery("INS_USER_PERSONAL_INFO");
			logger.info("Query===>" + query);
			logger.info("Args==>"+StringUtils.join(args,","));
			this.mytemplate.update(query,args);
			
			query=getQuery("INS_USER_LOGIN_MASTER");
			logger.info("Query===>" + query);
			logger.info("Args==>"+StringUtils.join(args1,","));
			this.mytemplate.update(query,args1);	
		   }
		catch (Exception e) {
			logger.debug("EXCEPTION @ { " + e + " }");
		}
	 }
	 public void updateUserInfo(Object[] args, Object[] args1){
    	try{
    		
			query=getQuery("UPD_USER_PERSONAL_INFO");
			logger.info("Query===>" + query);
			logger.info("Args==>"+StringUtils.join(args,","));
			this.mytemplate.update(query,args);
			
			query=getQuery("UPD_USER_LOGIN_MASTER");
			logger.info("Query===>" + query);
			logger.info("Args==>"+StringUtils.join(args1,","));
			this.mytemplate.update(query,args1);
		   }
		catch (Exception e) {			
			logger.debug("EXCEPTION @ { " + e + " }");
		}
    }

	public boolean userisElegile(String loginId, String productId) {
		 boolean result=true;
		 try{
			 String query=getQuery("GET_EXIST_BROK_COUNT");
			 logger.info("query "+query);
			 logger.info(loginId+" "+productId);
			 Map map = this.mytemplate.queryForMap(query, new Object[]{loginId,productId});
			 double count=map.get("COUNT")!=null?Double.parseDouble(map.get("COUNT").toString()):0;
			 result=(count<=0);		 
		 }catch (Exception e) {
			 e.printStackTrace();
		}
		 return result;
	}

	public void newUserInsertOrUpdate(UserMgtBean bean, String branchCode) {
		api.newUserInsertOrUpdate(bean,branchCode);
	}

	public void setPassword(UserMgtBean bean) {
		api.setPassword(bean);
	}

	public void addProduct(UserMgtBean bean, List<Object> comm) {
		api.addProduct(bean,comm);
	}
}