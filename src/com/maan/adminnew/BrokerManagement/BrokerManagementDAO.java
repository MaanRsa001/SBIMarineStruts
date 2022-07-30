package com.maan.adminnew.BrokerManagement;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.Logger;
import org.json.simple.JSONObject;
import org.springframework.jdbc.core.RowMapper;

import com.maan.common.LogUtil;
import com.maan.common.MyJdbcTemplate;

public class BrokerManagementDAO extends MyJdbcTemplate
{
	
	BrokerMgmApiCaller api = new BrokerMgmApiCaller();
	final Logger logger = LogUtil.getLogger(BrokerManagementDAO.class);
	public List <String> getBrokerDetails(final BrokerMgmBean ba, String agencyCode,String branchCode){
		List brokerDetails=null;
		try{
			String query=getQuery("GET_Broker_Info");
			logger.info("Query===>" + query);
			logger.info("AgencyCode===>" + agencyCode);
			logger.info("BranchCode===>" + branchCode);
			Object[] obj=new Object[2];
			obj[0]=agencyCode;
			obj[1]=branchCode;
			brokerDetails=this.mytemplate.query(query,obj,new RowMapper(){
				public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
					ba.setNameAndCode(rs.getString("missippi_id"));
					/*if(rs.getString("CUST_NAME")!=null && rs.getString("missippi_id")!=null)
						ba.setNameAndCode((rs.getString("CUST_NAME"))+"("+rs.getString("missippi_id")+")");*/
					ba.setApprovedby(rs.getString("APPROVED_PREPARED_BY"));
					ba.setBcode(rs.getString("rsa_broker_code"));
					ba.setBorganization(rs.getString("COMPANY_NAME")==null?rs.getString("FIRST_NAME"):rs.getString("COMPANY_NAME"));
					ba.setAddress1(rs.getString("ADDRESS1"));
					ba.setAddress2(rs.getString("ADDRESS2"));
					ba.setCountry(rs.getString("COUNTRY"));
					ba.setCountryName(rs.getString("COUNTRY_NAME"));
					ba.setPobox(rs.getString("POBOX"));
					ba.setTelephone(rs.getString("TELEPHONE"));
					ba.setFax(rs.getString("FAX"));
					ba.setEmirate(rs.getString("EMIRATE"));
					ba.setOthercity(rs.getString("CITY"));
					ba.setTitle(rs.getString("TITLE"));
					ba.setGender(rs.getString("GENDER"));
					ba.setFirstname(rs.getString("FIRST_NAME"));
					ba.setLastname(rs.getString("LAST_NAME"));
					ba.setNationality(rs.getString("NATIONALITY"));
					ba.setNationalityNa(rs.getString("NATIONALITYNAME"));
					ba.setDob(rs.getString("DOB"));
					ba.setOccupation(rs.getString("OCCUPATION"));
					ba.setMobile(rs.getString("MOBILE"));
					ba.setBemail(rs.getString("EMAIL"));
					ba.setExecutive(rs.getString("AC_EXECUTIVE_ID"));
					ba.setEntryDate(rs.getString("ENTRY_DATE"));
					ba.setLogin_Id(rs.getString("LOGIN_ID"));
					ba.setCustomer_id(rs.getInt("customer_id"));
					ba.setMissippiId(rs.getString("missippi_id"));
					ba.setCompanyName(rs.getString("COMPANY_NAME"));
					ba.setCIMSNO(rs.getString("missippi_id"));
					ba.setCustomerName(rs.getString("CUST_NAME"));
					ba.setStatus(rs.getString("STATUS"));
					ba.setOneOffCommission(rs.getString("ISSUER_COMMISSION_ONEOFF"));
					ba.setOpenCoverCommission(rs.getString("ISSUER_COMMISSION_OPENCOVER"));
					ba.setBroImgName(rs.getString("IMAGE_PATH"));
					ba.setBroLinkLoc(rs.getString("SUB_BRANCH"));
					return null;
				}
		   });
			ba.setAgencyCode(agencyCode);
		}
		catch (Exception e) {
			logger.debug("EXCEPTION @ { " + e + " }");
		}
    	return brokerDetails;
	}
	
	public List <Object> getCommisionData(String agencyCode) 
	{
		List <Object> commisionDetails=null;
		try 
		{
			commisionDetails = api.getCommissiondata(agencyCode);
			
			logger.info("Method to getCommisionData");
			String query=getQuery("GET_Commission_Data")+" order by lud.product_id";
			logger.info("Query===>" + query);
			logger.info("AgencyCode===>" + agencyCode);
			Object[] obj=new Object[1];
			obj[0]=agencyCode;
			commisionDetails=this.mytemplate.queryForList(query,obj);
			logger.info("getCommisionData() - Exit");
		} 
		catch (Exception e) 
		{
			logger.debug("EXCEPTION @ { " + e + " }");
		}
		return commisionDetails;
	}
	
	public List <Object> getProducts(final BrokerMgmBean ba) 
	{
		List <Object> productData=null;
		try 
		{
			logger.info("Method to getProducts");
			productData=api.getProductdetail(ba);
			if(productData!=null && productData.size()>0){
				Map map=(Map)productData.get(0);
				ba.setProductID(map.get("ProductId")==null?"":map.get("ProductId").toString());
				ba.setProductName(map.get("ProductName")==null?"":map.get("ProductName").toString());
				ba.setCommission(map.get("Commission")==null?"":map.get("Commission").toString());
				ba.setInsurance_End_Limit(map.get("InsuranceEndLimit")==null?"":map.get("InsuranceEndLimit").toString());
				ba.setUser_Id_Creation(map.get("Provision")==null?"":map.get("Provision").toString());
				ba.setDiscountPremium(map.get("DiscountPremium")==null?"":map.get("DiscountPremium").toString());
				ba.setMin_Premium_Amount(map.get("MinPremiumAmount")==null?"":map.get("MinPremiumAmount").toString());
				ba.setBack_Date_Allowed(map.get("BackDateAllowed")==null?"":map.get("BackDateAllowed").toString());
				ba.setProductStatus(map.get("status")==null?"":map.get("status").toString());
				ba.setLoadingPremium(map.get("LoadingPremium")==null?"":map.get("LoadingPremium").toString());
				ba.setRemark(map.get("Remarks")==null?"":map.get("Remarks").toString());
				ba.setProvision(map.get("Provision")==null?"":map.get("Provision").toString());
				ba.setFreight(map.get("Freight")==null?"":map.get("Freight").toString());
				ba.setPayReceipt(map.get("PayReceipt")==null?"":map.get("PayReceipt").toString());
				//ba.setRemark(map.get("REFERAL")==null?"":map.get("REFERAL").toString());
				ba.setPolicyType(map.get("POLICY_TYPE")==null?"":map.get("POLICY_TYPE").toString());
				ba.setCheckeryn(map.get("CHECKER_YN")==null?"N":map.get("CHECKER_YN").toString());
			}
			logger.info("getProducts() - Exit");
		}
		catch (Exception e)
		{
			logger.debug("EXCEPTION @ { " + e + " }");
		}
		return productData;
	}
	
	public List <Object> getBranchDetails(String branchCode)
	{
		List <Object> branchData=null;
		try 
		{
			logger.info("Method to getBranches");
			String query=getQuery("GET_Branch_Detail");
			logger.info("Query===>" + query);
			logger.info("BranchCode===>" + branchCode);
			Object[] obj=new Object[1];
			obj[0]=branchCode;
			branchData=this.mytemplate.queryForList(query,obj);
			logger.info("getBranches() - Exit");
		}
		catch (Exception e) 
		{
			logger.debug("EXCEPTION @ { " + e + " }");
		}
		return branchData;
	}
	public List <Object> getBrokerCode() 
	{
		List <Object> brokerCode=null;
		try 
		{
			logger.info("Method to getBrokerCode");
			String query=getQuery("GET_Broker_Code");
			logger.info("Query===>" + query);
			brokerCode=this.mytemplate.queryForList(query);
			logger.info("getBrokerCode() - Exit");
		}
		catch (Exception e) 
		{
			logger.debug("EXCEPTION @ { " + e + " }");
		}
		return brokerCode;
	}
	
	public List <Object> getExecutives() {
		List <Object> executives =null;
		   try
		   { 
			   logger.info("Method to getExecutives");
			   executives=api.executives();
		   }
		   catch (Exception e) 
			{
				logger.debug("EXCEPTION @ { " + e + " }");
			}
		return executives;
	 }
	
	public List <Object> getcoreCustomererInfo(String cust_name, String bcode, String userLoginMode) {
		List <Object> coreCustomerInfo =null;
		   try
		   { 
			   logger.info("Method to getcoreCustomererInfo");
				String query="SELECT CIMSNO,(CASE WHEN CUSTCODE IS NULL OR CUSTGRP IS NULL OR CUSTTYPE IS NULL OR CUSTCLAS IS NULL THEN '' ELSE (CUSTCODE ||'-'|| CUSTGRP ||'-'|| CUSTTYPE ||'-'||CUSTCLAS) END) ARACC, CUSTTITL,CUSTNAME,CUSTADD1,CUSTADD2,CUSTADD3,CUSTADD4 FROM C_CUST@ECARGO_"+("Test".equalsIgnoreCase(userLoginMode)?"DEV":"PROD")+" WHERE lower(CUSTNAME) LIKE '%'||lower(?)||'%' AND BRCODE=?";
				logger.info("Query===>" + query);
				Object[] obj=new Object[2];
				obj[0]=cust_name;
				obj[1]=bcode;
				coreCustomerInfo=this.mytemplate.queryForList(query,obj);
				logger.info("getcoreCustomererInfo() - Exit :   Result-->"+coreCustomerInfo.size());
		   }
		   catch (Exception e) 
			{
				logger.debug("EXCEPTION @ { " + e + " }");
			}
		return coreCustomerInfo;
	}
	
	public List <String> getBrokerTaxInfo(final BrokerMgmBean ba,String[] args){
		logger.info("Method to getBrokerTaxInfo");
		List customerTaxInfo=null;
		try{
			String query=getQuery("GET_Tax_Info");
			logger.info("Query===>" + query);
			customerTaxInfo=this.mytemplate.query(query,args,new RowMapper(){
				public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
					ba.setPolicy_fee(rs.getString("policy_feestatus"));
					ba.setPolicFee(rs.getString("policy_fees"));
					ba.setGov_fee(rs.getString("gov_taxstatus"));
					ba.setGovtTax(rs.getString("govt_tax"));
					ba.setEmer_fee(rs.getString("emergency_fundstatus"));
					ba.setEmergencyfund(rs.getString("emer_fund"));
					ba.setApp_for(rs.getString("TAX_APPLICABLE"));
					ba.setEffecdate(rs.getString("effec_date"));
					return null;
				}
		   });
		}
		catch(Exception e){
			logger.debug("EXCEPTION @ { " + e + " }");
		}
		return customerTaxInfo;
	}
	public void newBrokerCreation(Object[] args, Object[] info){
		logger.info("ENTER-->Method to newBrokerCreation");
    	try{
			String query=getQuery("INS_Broker_Det");
			String query1=getQuery("INS_BCM_DET");
			logger.info("Query===>" + query);
			logger.info("Query1===>" + query1);
			this.mytemplate.update(query1,info);
			logger.info("Success===>"+query1);
			this.mytemplate.update(query,args);
			logger.info("Success===>"+query);
			logger.info("newBrokerCreation() - Exit");
    	}
    	catch (Exception e) {			
    		logger.debug("EXCEPTION @ newBrokerCreation { " + e + " }");
    	}
	}
	public int getBroke_Code(){
		int brokerCode=0;
		try{
			String query=getQuery("GET_BRO_CODE");
			logger.info("Query===>" + query);	
			brokerCode=this.mytemplate.queryForInt(query);
			logger.info("brokerCode===>" + brokerCode);
		}
		catch(Exception e){
			logger.debug("EXCEPTION @ { " + e + " }");
		}
		return brokerCode;
	}
	public void getmax_Broke_Code(Object[] args){
		try{
			String query=getQuery("GET_MAX_BRO_CODE");
			logger.info("Query===>" + query);
			this.mytemplate.update(query,args);
		}
		catch(Exception e){
			logger.debug("EXCEPTION @ { " + e + " }");
		}
	}
	public void update_Broker(Object[] args){
		try{
			String query=getQuery("UPD_BROKER_DET");
			logger.info("Query===>" + query);
			this.mytemplate.update(query,args);
			logger.info("Exit ===>UPD_BROKER_DET");
		}
		catch(Exception e){
			logger.debug("EXCEPTION @ { " + e + " }");
		}
	}
	public void update_PersonalInfo(Object[] args){
		try{
			String query=getQuery("UPD_PERSONAL_INFO");
			logger.info("Query===>" + query);
			this.mytemplate.update(query,args);
			logger.info("Exit ===>update_PersonalInfo");
		}
		catch(Exception e){
			logger.debug("EXCEPTION @ { " + e + " }");
		}
	}
	public int getCustomer_Id(String agencyCode, String branchCode){
		int customer_Id=0;
		try{
			String query=getQuery("GET_CUST_ID");
			logger.info("Query===>" + query);	
			String[] args={agencyCode,branchCode};
			customer_Id=this.mytemplate.queryForInt(query,args);
			logger.info("brokerCode===>" + customer_Id);
		}
		catch(Exception e){
			logger.debug("EXCEPTION @ { " + e + " }");
		}
		return customer_Id;
	}
	public int getMax_amend_Id(String branchCode, int broker_Code){
		int amend_Id=0;
		try{
			String query=getQuery("GET_MAXAMEND_ID");
			logger.info("Query===>" + query);	
			Object[] obj=new Object[2];
			obj[0]=branchCode;
			obj[1]=broker_Code;
			amend_Id=this.mytemplate.queryForInt(query, obj);
		}
		catch(Exception e){
			logger.debug("EXCEPTION @ { " + e + " }");
		}
    	return amend_Id;
    }
    public void insTaxInfo(Object[] val){
		logger.info("ENTER-->Method to newBrokerCreation");
    	try{
			String query=getQuery("INS_TAX_DET");
			logger.info("Query===>" + query);
			this.mytemplate.update(query,val);
			logger.info("Success===>"+query);
			logger.info("insTaxInfo() - Exit");
    	}
    	catch (Exception e) {			
    		logger.debug("EXCEPTION @ { " + e + " }");
    	}
	}
    public void updTaxInfo(Object[] val){
		logger.info("ENTER-->Method to updTaxInfo");
    	try{
			String query=getQuery("UPD_TAX_DET");
			logger.info("Query===>" + query);
			removeNull(val);
			this.mytemplate.update(query,val);
			logger.info("updTaxInfo() - Exit");
    	}
    	catch (Exception e) {			
    		logger.debug("EXCEPTION @ { " + e + " }");
    	}
	}
    public List <Object> getCommissionDET(String agencyCode, String branchCode){
		logger.info("Method to getCommissionDET");
		List <Object> commission_Det=null;
		try{
			String query=getQuery("GET_COMMISSION_DET");
			logger.info("Query===>" + query);
			String[] args={agencyCode, branchCode};
			logger.info("Query===>" + args[0]+"		"+args[1]);
			commission_Det= this.mytemplate.queryForList(query,args);
		}
		catch(Exception e){
			logger.debug("EXCEPTION @ { " + e + " }");
		}
		logger.info("EXIT getCommissionDET : RESULT===>" + commission_Det.size());
		return commission_Det;
    }
    
    public List <String> getCompDet(final BrokerMgmBean ba,String agencyCode){
		logger.info("Method to getCompDet");
		List comp_Det=null;
		try{
			String query=getQuery("GET_COMP_DET");
			logger.info("Query===>" + query);
			String[] args={agencyCode};
			logger.info("Query===>" + args[0]);
			comp_Det=this.mytemplate.query(query,args,new RowMapper(){
				public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
					ba.setBorganization(rs.getString("COMPANY_NAME"));
					ba.setFirstname(rs.getString("FIRST_NAME"));
					return null;
				}
		   });
		}
		catch(Exception e){
			logger.debug("EXCEPTION @ { " + e + " }");
		}
		return comp_Det;
    }
   
    public void updateProduct(Object[] pId){
		logger.info("ENTER-->Method to updateProduct");
    	try
    	{
			String query=getQuery("UPD_PRODUCT_ID");
			logger.info("Query===>" + query);
			this.mytemplate.update(query, pId);
    	}catch(Exception e)
    	{
    		logger.debug("Exception @ "+e);
    	}
    	logger.info("updateProduct() - Exit");
    }
    public List <String> getLogInId(final BrokerMgmBean ba,String agencyCode){
		logger.info("Method to getLogInId");
		List logInId_Det=null;
		try{
			String query=getQuery("GET_LOGIN_ID");
			logger.info("Query===>" + query);
			String[] args={agencyCode};
			logger.info("Query===>" + args[0]);
			logInId_Det=this.mytemplate.query(query,args,new RowMapper(){
				public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
					ba.setLoginid(rs.getString("LOGIN_ID"));
					return null;
				}
		   });
		}
		catch(Exception e){
			logger.debug("EXCEPTION @ { " + e + " }");
		}
		return logInId_Det;
    }
    public void insertLogInDet(String[] args){
		logger.info("ENTER-->Method to insertLogInDet");
    	try
    	{
			String query=getQuery("INS_LOGIN_DET");
			logger.info("Query===>" + query);
			this.mytemplate.update(query, args);
    	}catch(Exception e)
    	{
    		logger.debug("Exception @ "+e);
    	}
    	logger.info("insertLogInDet() - Exit");
    }
    public void updatePersonalLogin(Object[] params){
		logger.info("ENTER-->Method to updatePersonalLogin");
    	try
    	{
			String query=getQuery("UPD_PERSONAL_LOGIN_ID");
			logger.info("Query===>" + query);
			this.mytemplate.update(query, params);
    	}catch(Exception e)
    	{
    		logger.debug("Exception @ "+e);
    	}
    	logger.info("updatePersonalLogin() - Exit");
    }
    public String getBrokerStatus(String agencyCode){
		logger.info("getBrokerStatus - Enter");
		String status="";
		try
		{
			String query=getQuery("GET_BROKER_STATUS");
			String[] obj={agencyCode};
			status=this.mytemplate.queryForObject(query,obj,String.class).toString();			
		}
		catch (Exception e)
		{			
			logger.debug("EXCEPTION @ { " + e + " }");
		}		
		logger.info("getBrokerStatus - Exit ");
		return status;
	}
	public void updateBrokerStatus(String[] obj){
		logger.info("updateBrokerStatus - Enter");
		try
		{
			String query=getQuery("UPD_BROKER_STATUS_LM");
			logger.info("query==>"+query);
			for(Object k: obj)
				logger.info("query==>"+k);
			this.mytemplate.update(query,obj);
			query=getQuery("UPD_BROKER_STATUS_BCM");
			logger.info("query==>"+query);
			this.mytemplate.update(query,new Object[]{obj[1], obj[3]});
		}
		catch (Exception e)
		{			
			logger.debug("EXCEPTION @ { " + e + " }");
		}		
		logger.info("updateBrokerStatus - Exit ");
	}
	/*public List <Object> getProductStatus(String[] obj){
		logger.info("getProductStatus - Enter");
		List <Object> userInfo=null;
		try
		{
			String query=getQuery("GET_USER_LIST");
			userInfo=this.mytemplate.queryForList(query,obj);		
		}
		catch (Exception e)
		{			
			logger.debug("EXCEPTION @ { " + e + " }");
		}		
		logger.info("getProductStatus - Exit ");
		return userInfo;
	}*/
	public List <Object> getProductStatuss(String[] obj){
		logger.info("getProductStatuss - Enter");
		List <Object> userInfo=null;
		try
		{
			String query=getQuery("GET_USER_LISTT");
			userInfo=this.mytemplate.queryForList(query,obj);		
		}
		catch (Exception e)
		{			
			logger.debug("EXCEPTION @ { " + e + " }");
		}		
		logger.info("getProductStatuss - Exit ");
		return userInfo;
	}
	public void updateUserIdCreation(String[] obj){
		logger.info("updateUserIdCreation - Enter");
		try
		{
			String query=getQuery("UPD_USERID_CREATION");
			this.mytemplate.update(query,obj);			
		}
		catch (Exception e)
		{			
			logger.debug("EXCEPTION @ { " + e + " }");
		}		
		logger.info("updateUserIdCreation - Exit ");
	}
	public List<Object> getBrokerListAjax(String branchCode, String searchBy, String searchValue, String appID){
		List <Object> brokerList=null;
		String query="";
		try{
			if("name".equals(searchBy)){
				query=getQuery("GET_BROKER_LIST_BY_NAME");
			}
			else 
				query=getQuery("GET_BROKER_LIST_BY_CODE");
			logger.info("Query===>" + query);
			logger.info("branchCode===>" + branchCode);
			brokerList=this.mytemplate.queryForList(query,new Object[]{branchCode, appID, branchCode, searchValue});		
		   }
		catch (Exception e) {			
			e.printStackTrace();
		}
		return brokerList;
	}
	public void deleteProduct(BrokerMgmBean bean) {
		try{
//			String query=getQuery("BROKER_DELETE_PRODUCT");
//			String args[]=new String[2];
//			args[0]=bean.getAgencyCode();
//			args[1]=bean.getProductID();
//			logger.info("Query "+query);
//			logger.info("args "+StringUtils.join(args,","));
//			this.mytemplate.update(query,args);
			api.deleteProduct(bean);
		}catch(Exception e){
			logger.debug("EXCEPTION @ { " + e + " }");
		}
	}
	public int validateBcode(String brokerCode, String agencyCode, String branchCode) {
		int result = 0;
		try {
			//String query = LocalizedTextUtil.findDefaultText("CHK_BROKERCODE_CNT",Locale.ENGLISH);
			String query="SELECT COUNT(*) FROM BROKER_COMPANY_MASTER WHERE RSA_BROKER_CODE=? AND BRANCH_CODE = ?";
			if(StringUtils.isNotBlank(agencyCode)){
				query+=" AND AGENCY_CODE not in(?)";
				result = this.mytemplate.queryForInt(query,new Object[]{brokerCode,branchCode,agencyCode});
			}else {
				result = this.mytemplate.queryForInt(query,new Object[]{brokerCode,branchCode});
			}
			
		}
		catch(Exception ex) {
			
		}
		return result; 
	}
	public void deleteBroLogo(String agencyCode) {
		try{
			String query=getQuery("BROKER_DELETE_LOGO");
			logger.info("Query "+query);
			logger.info("agencyCode "+agencyCode);
			this.mytemplate.update(query,new Object[]{agencyCode});
		}catch(Exception e){
			logger.debug("EXCEPTION @ { " + e + " }");
		}
	}
	public int valBraWiseBcode(String brokerCode,String branchCode) {
		int result = 0;
		try {
			String query = getQuery("BRANCH_BCODE_CNT");
			result = this.mytemplate.queryForInt(query,new Object[]{brokerCode,branchCode});
		}
		catch(Exception ex) {
			
		}
		return result; 
	}

	public void savePolicyTypeDetails(final BrokerMgmBean bean) {
		try{
			String query=getQuery("DEL_BROKER_COMM");
			logger.info("Query "+query);
			logger.info("args "+bean.getAgencyCode());
			this.mytemplate.update(query,new Object[]{bean.getAgencyCode()});
			query=getQuery("INSERT_BROKER_COMM");
			logger.info("Query "+query);
			final List<String> polics = new ArrayList<String>(Arrays.asList(bean.getPolicyType().split(","))); 
			Object []args=new Object[9];
			for(int i=0;i<bean.getPpolicyType().size();i++){
				String policyId = bean.getPpolicyType().get(i);				
				if(Collections.frequency(polics,policyId)>0) {
					args[0]=bean.getAgencyCode();
					args[1]=policyId;
					args[2]=bean.getPcommission().get(i);
					args[3]=bean.getPminPremium().get(i);
					args[4]=bean.getPsumInsured().get(i);
					args[5]="Y".equals(bean.getPcheck_yn().get(i))?bean.getPcheck_yn().get(i):"N";
					args[6]=bean.getPpolicyFee().get(i);
					args[7]=bean.getPnajamFee().get(i);
					args[8]=bean.getProductID();
					logger.info("args "+StringUtils.join(args,","));
					this.mytemplate.update(query, args);
				}				
			} 
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public void editPolicyDetails(BrokerMgmBean bean) {
		
		try {
			String query = getQuery("BROKER_COMMISSION_DET");
			String []arg=new String[]{bean.getAgencyCode()};
			logger.info("Query "+query);
			logger.info("args "+StringUtils.join(arg,","));
			List<Map<String,Object>> info = this.mytemplate.queryForList(query,arg);
			 List<String> ppolicyType=new ArrayList<String>();
			 List<String> pcommission=new ArrayList<String>();
			 List<String> pminPremium=new ArrayList<String>();
			 List<String> psumInsured=new ArrayList<String>();
			 List<String> ppolicyTypeDesc=new ArrayList<String>();
			 List<String> pcheck_yn=new ArrayList<String>();
			 List<String> ppolicyFee=new ArrayList<String>();
			 List<String> pnajamFee=new ArrayList<String>();
			for(int i=0;i<info.size();i++){
				Map<String, Object> infoMap = info.get(i);
				pcommission.add(infoMap.get("COMMISSION")==null?"":String.valueOf(infoMap.get("COMMISSION")));
				pminPremium.add(infoMap.get("MIN_PREMIUM")==null?"":String.valueOf(infoMap.get("MIN_PREMIUM")));
				psumInsured.add(infoMap.get("SUM_INSURED")==null?"":String.valueOf(infoMap.get("SUM_INSURED")));
				ppolicyType.add(infoMap.get("POLICY_SUBTYPE_ID")==null?"":String.valueOf(infoMap.get("POLICY_SUBTYPE_ID")));
				ppolicyTypeDesc.add(infoMap.get("POLICYTYPE_DESC_ENGLISH")==null?"":String.valueOf(infoMap.get("POLICYTYPE_DESC_ENGLISH")));
				pcheck_yn.add(infoMap.get("CHECKER_YN")==null?"N":String.valueOf(infoMap.get("CHECKER_YN")));
				ppolicyFee.add(infoMap.get("POLICY_FEE")==null?"":String.valueOf(infoMap.get("POLICY_FEE")));
				pnajamFee.add(infoMap.get("NAJM_FEE")==null?"":String.valueOf(infoMap.get("NAJM_FEE")));
			}
			bean.setPcommission(pcommission);
			bean.setPminPremium(pminPremium);
			bean.setPsumInsured(psumInsured);
			bean.setPpolicyType(ppolicyType);
			bean.setPpolicyTypeDesc(ppolicyTypeDesc);
			bean.setPcheck_yn(pcheck_yn);
			bean.setPpolicyFee(ppolicyFee);
			bean.setPnajamFee(pnajamFee);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
	}

	public JSONObject getBrokerDetailsApi(BrokerMgmBean ba, String agencyCode, String branchCode) {
		return api.getBrokerDetailsApi(ba,agencyCode,branchCode);
	}

	public void setBrokerInfo(List<Map<String, Object>> brokerData, BrokerMgmBean ba) {
		Map<String,Object> result = null;
		try {
			result = brokerData.get(0);
			if(result.size()>0) {
				ba.setNameAndCode(result.get("MissippiId")==null?"":result.get("MissippiId").toString());
				ba.setApprovedby(result.get("ApprovedPreparedBy")==null?"":result.get("ApprovedPreparedBy").toString());
				ba.setBcode(result.get("BrokerCode")==null?"":result.get("BrokerCode").toString());
				ba.setBorganization(result.get("CompanyName")==null?"":result.get("CompanyName").toString());
				ba.setAddress1(result.get("Address1")==null?"":result.get("Address1").toString());
				ba.setAddress2(result.get("Address2")==null?"":result.get("Address2").toString());
				ba.setCountry(result.get("Country")==null?"":result.get("Country").toString());
				ba.setCountryName(result.get("CountryName")==null?"":result.get("CountryName").toString());
				ba.setPobox(result.get("Pobox")==null?"":result.get("Pobox").toString());
				ba.setTelephone(result.get("TelephoneNo")==null?"":result.get("TelephoneNo").toString());
				ba.setFax(result.get("Fax")==null?"":result.get("Fax").toString());
				ba.setEmirate(result.get("City")==null?"":result.get("City").toString());
				ba.setOthercity(result.get("CityName")==null?"":result.get("CityName").toString());
				ba.setTitle(result.get("Title")==null?"":result.get("Title").toString());
				ba.setGender(result.get("Gender")==null?"":result.get("Gender").toString());
				ba.setFirstname(result.get("FirstName")==null?"":result.get("FirstName").toString());
				ba.setLastname(result.get("LastName")==null?"":result.get("LastName").toString());
				ba.setNationality(result.get("Nationality")==null?"":result.get("Nationality").toString());
				ba.setNationalityNa(result.get("NationalityName")==null?"":result.get("NationalityName").toString());
				ba.setDob(result.get("DateOfBirth")==null?"":result.get("DateOfBirth").toString());
				ba.setOccupation(result.get("Occupation")==null?"":result.get("Occupation").toString());
				ba.setMobile(result.get("MobileNo")==null?"":result.get("MobileNo").toString());
				ba.setBemail(result.get("Email")==null?"":result.get("Email").toString());
				ba.setExecutive(result.get("AcExecutiveId")==null?"":result.get("AcExecutiveId").toString());
				ba.setEntryDate(result.get("EntryDate")==null?"":result.get("EntryDate").toString());
				ba.setLogin_Id(result.get("LoginId")==null?"":result.get("LoginId").toString());
				ba.setCustomer_id(result.get("CustomerId")==null?0:Integer.parseInt(result.get("CustomerId").toString()));
				ba.setMissippiId(result.get("MissippiId")==null?"":result.get("MissippiId").toString());
				ba.setCompanyName(result.get("CompanyName")==null?"":result.get("CompanyName").toString());
				ba.setCIMSNO(result.get("MissippiId")==null?"":result.get("MissippiId").toString());
				ba.setCustomerName(result.get("customerName")==null?"":result.get("customerName").toString());
				ba.setStatus(result.get("Status")==null?"":result.get("Status").toString());
				ba.setOneOffCommission(result.get("IssuerCommissionOneOff")==null?"":result.get("IssuerCommissionOneOff").toString());
				ba.setOpenCoverCommission(result.get("IssuerCommissionOpenCover")==null?"":result.get("IssuerCommissionOpenCover").toString());
				ba.setBroImgName(result.get("ImagePath")==null?"":result.get("ImagePath").toString());
				ba.setBroLinkLoc(result.get("SubBranch")==null?"":result.get("SubBranch").toString());
				ba.setRegionCode(result.get("RegionCode")==null?"":result.get("RegionCode").toString());
				ba.setBranchCodeS(result.get("BranchCode")==null?"":result.get("BranchCode").toString());
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	public JSONObject getbrokerEdit(BrokerMgmBean bean, String agencyCode, String branchCode) {
		return api.getBrokerEditApi(bean,agencyCode,branchCode);
	}

	public void insertBrokerInfoApi(BrokerMgmBean bean) {
		api.insertBrokerInfoApi(bean);
	}

	public void setPassword(BrokerMgmBean bean) {
		api.setPassword(bean);
	}
}