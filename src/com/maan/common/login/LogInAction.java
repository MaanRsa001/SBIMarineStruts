package com.maan.common.login;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.maan.adminnew.common.CommonService;
import com.maan.common.LogUtil;
import com.maan.common.Token;
import com.maan.common.Validation;
import com.maan.quotation.model.DefaultValue;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class LogInAction extends ActionSupport  implements SessionAware, ServletRequestAware, ModelDriven<CommonBean>{
	final static Logger logger = LogUtil.getLogger(LogInAction.class);
	private static final long serialVersionUID = 10001L;
	private HttpServletRequest request = ServletActionContext.getRequest();
	ServletContext context=request.getSession().getServletContext();
	private LogInService service=new LogInService();
	private CommonBean bean=new CommonBean(); 
	CommonService cservice=new CommonService();
	
	LoginApi api = new LoginApi();
	private Map<String, Object> session = null;	
	private String appId="16";
	private String b2cType = "";
    
	private final String RESULT_JSON="resultJson"; 
	public void setSession(Map<String, Object> map) {
	    this.session = map;
	}
	public void setServletRequest(HttpServletRequest hsr) {
	    this.request = hsr;
	}

	public String page(){
		return "page";
    }
	
	public String submit() {
		String response = "";
		String result = "page";
		try {
			String loginId , password ="";
			if("admin".equalsIgnoreCase(bean.getLoginType())) {
				loginId=bean.getAloginId();
				password =bean.getApwd();
			}else {
				loginId=bean.getBloginId();
				password =bean.getBpwd();
			}
		LoginApi loginApi = new LoginApi(loginId, password, bean.getBranch(), bean.getRegion(), bean.getLoginType());
		DefaultValue dv = new DefaultValue();
		response = loginApi.getLoginToken(bean);
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(response);
		JSONObject jo = (JSONObject) obj;
		
		validation();
		if (hasActionErrors()) {
			return INPUT;
		}
		jo = (JSONObject) jo.get("LoginResponse");
		if(jo==null || jo.get("Token")==null || "".equalsIgnoreCase(jo.get("Token").toString())) {
			if("ChangePassword".equalsIgnoreCase(jo.get("Status")==null?"":jo.get("Status").toString())){
				bean.setLoginId(loginId);
				bean.setPwdMsg(jo.get("PasswordMsg").toString());
				return "changePWD";
			}else {
				addActionError("Token is Empty");
				return INPUT;
			}
		}else {
			dv.setToken(jo.get("Token") == null ? "" : jo.get("Token").toString());
			Token.save(dv);
			service.insertSessionInfo(loginId, request.getSession(false).getId(), service.getClientIpAddr(request));
			JSONArray jarray=(JSONArray) jo.get("ProductDetail");
			session.put("ProductDetails", jarray);
		}
		if (!hasActionErrors()) {
			 if("ChangePassword".equalsIgnoreCase(bean.getStatus())){
//		    	bean.setPwdMsg("New Password Should contain one uppercase, one lowercase, one number, one special character(@ # $ %) & length between "+pwdlen[0]+" to "+pwdlen[1]);
				 result = "changePWD";
			}else {
				if ("admin".equalsIgnoreCase(bean.getUserType())) {
					session.put("MENU_ID", bean.getMenuId());
					session.put("user", bean.getAloginId());
					session.put("user1", bean.getUserType());
					session.put("usertype", bean.getUserType());
					if ("admin".equals(bean.getLoginType()) && !("Broker".equalsIgnoreCase(bean.getUserType()) || "User".equalsIgnoreCase(bean.getUserType()))) {
						session.put("BranchCode", bean.getBranch());
						session.put("AdminBranchCode", bean.getBranch());
						session.put("LoginBranchCode", bean.getBranch());
						session.put("adminBranch", bean.getBranch());
						session.put("RegionCode", bean.getRegion());
						result = "adminHome";
					} else {
						// addActionError(getText("E128"));
						result = INPUT;
					}
					 session.put("branchName", jo.get("BranchName")==null?"":jo.get("BranchName").toString());
					session.put("RegionCode", bean.getRegion());
					session.put("AdminCountryId", jo.get("CountryId")==null?"":jo.get("CountryId").toString());
					session.put("AppId", "2");
					session.put("ses", request.getSession(false).getId());
					session.put("userLoginMode", context.getRealPath("").indexOf("Saudi") != -1 ? "Test" : "Live");
					session.put("swidth", bean.getSwidth());
					
					session.put("BrokerDetails", cservice.getBrokerUserDetails(bean.getBranch()));
					session.put("CurrencyDecimal", jo.get("CurrencyDecimal")==null?"":jo.get("CurrencyDecimal").toString());
					
//					String[][] currenctDetials = new newCoverBean().getCurrencyName(rs.get("BRANCH_CODE").toString());
//					session.put("currencyType", currenctDetials[0][0] != null ? currenctDetials[0][0] : "SAR");
//					session.put("decimalPlace", (currenctDetials[0][1] != null ? currenctDetials[0][1] : "2"));
					
					session.put("BelongingBranch", jo.get("BelongingBranch")==null?"":jo.get("BelongingBranch").toString());
					session.put("Attached_Branch",(jo.get("AttachedBranch") == null || "".equals(jo.get("AttachedBranch").toString()))? jo.get("BranchCode").toString(): jo.get("AttachedBranch").toString());
					session.put("accesstype", jo.get("AccessType")==null?"":jo.get("AccessType").toString());
					session.put("belongs_to_b2c", getText("B2C_AGENCY_CODE").equals(jo.get("OaCode")==null?"":jo.get("OaCode").toString()));
				}else { // broker and issuer
                	String userType=jo.get("UserType").toString();
                	String loginType=!"B2C".equals(b2cType)?bean.getLoginType():"";
                	boolean issuerCondition=("RSAIssuer".equalsIgnoreCase(userType) && "admin".equalsIgnoreCase(loginType)) ;
                	boolean brokerCondition=(!"RSAIssuer".equalsIgnoreCase(userType) &&  ("Broker".equalsIgnoreCase(loginType) || "".equalsIgnoreCase(loginType) || "user".equalsIgnoreCase(loginType) ));
                	
                	if( issuerCondition || brokerCondition ){			                    	
                		if(issuerCondition){
                			String attachedBranch=(jo.get("AttachedBranch")==null || "".equals(jo.get("AttachedBranch").toString()))?"":jo.get("AttachedBranch").toString();
                			if("".equals(attachedBranch)){
                				addActionError(getText("E129")); // For Issuer Attached branch is Empty				                    			
                    		}else if(StringUtils.isNotBlank(bean.getBranch()) && !attachedBranch.contains(bean.getBranch())){
                    			addActionError(getText("E130")); // For Issuer Attached branch is Empty				                    			
                    		}			                    				
                		}
                		if(!hasActionErrors()){
                			session.put("ses", request.getSession(false).getId());
                    		session.put("user1", "brokers");
                    		session.put("rsa_type","s");
                    		session.put("usertype",bean.getUserType());
                    		session.put("user", jo.get("LoginId"));
                    		session.put("userLoginMode", context.getRealPath("").indexOf("Saudi")!=-1?"Test":"Live");
                    		session.put("swidth", bean.getSwidth());				                    		
//                    		String[][] currenctDetials = new newCoverBean().getCurrencyName(rs.get("BRANCH_CODE").toString());
//                    		session.put("currencyType",currenctDetials[0][0]!=null?currenctDetials[0][0]:"SAR");
//                    		session.put("decimalPlace",(currenctDetials[0][1]!=null?currenctDetials[0][1]:"2"));				                    		
                    		session.put("BelongingBranch",jo.get("BelongingBranch")==null?"":jo.get("BelongingBranch").toString());
                    		session.put("LoginType", b2cType);
                    		session.put("LoginBranchCode1",jo.get("BranchCode")==null?"":jo.get("BranchCode").toString());
                    		session.put("branchName", jo.get("BranchName")==null?"":jo.get("BranchName").toString());
                    		session.put("AdminBranchCode", issuerCondition ? bean.getBranch():jo.get("BranchCode")==null?"":jo.get("BranchCode").toString());
                    		session.put("LoginBranchCode", issuerCondition ? bean.getBranch():jo.get("BelongingBranch")==null?"":jo.get("BelongingBranch").toString());
                    		String countryId=jo.get("CountryId")==null?"":jo.get("CountryId").toString();				                    		
                    		session.put("AdminCountryId",(StringUtils.isBlank(countryId) || "0".equals(countryId))?"01":countryId);
                    		session.put("userLoginMode", context.getRealPath("").indexOf("Saudi")!=-1?"Test":"Live");
//                    		session.put("selectedBranch",);
//                    		session.put("BrokerDetails", cservice.getBrokerUserDetails(rs.get("BRANCH_CODE").toString()));
                    		session.put("CurrencyDecimal", jo.get("CurrencyDecimal")==null?"":jo.get("CurrencyDecimal").toString());
                    		session.put("belongs_to_b2c", getText("B2C_AGENCY_CODE").equals(jo.get("OaCode")==null?"":jo.get("OaCode").toString()));
//                    		session.put("belongs_to_promocode", (rs.get("SUBUSERTYPE")==null?"":rs.get("SUBUSERTYPE").toString()));
                    		session.put("RegionCode", bean.getRegion());
                    		session.put("BranchCode", bean.getBranch());
                    		result="home";
                		}else{
                			result=INPUT;
                		}			                    	 
                	}else{
                		addActionError(getText("E128"));
            			result = INPUT;
                	}
                }
				   session.put("LoginIdType", bean.getLoginType());
                   session.put("selectedBranch",bean.getBranch());
                   session.put("fromPortal", "no");
                   
			}
		} else {
			result = INPUT;
		}
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
    
	public void validation() {
		if(bean.getErrors()!=null && bean.getErrors().size()>0) {
			for (int i =0;i<bean.getErrors().size();i++) {
				HashMap<String, Object> map=bean.getErrors().get(i);
				addActionError(map.get("Message").toString());
			}
		}
	}

	private void assignLogin() {
		 String userName;
		 String pwd;
		 if(StringUtils.isBlank(bean.getLoginId()) && StringUtils.isBlank(bean.getPwd())){ 
			 if("Broker".equalsIgnoreCase(bean.getLoginType())){
				 userName=bean.getBloginId();
				 pwd=bean.getBpwd();
			 }else if("user".equalsIgnoreCase(bean.getLoginType())){
				 userName=bean.getOloginId();
				 pwd=bean.getOpwd();
			 }else{
				 userName=bean.getAloginId();
				 pwd=bean.getApwd();
			 }
			 bean.setLoginId(userName);
			 bean.setPwd(pwd);
		 }
		  
	}
	@SuppressWarnings("unchecked")
	public String pwdChange() {
		String returnResult = "changePWD";
		logger.info("Enter==>pwdChange()");
		bean.setStatus("changepwd");
		LoginApi api = new LoginApi("", "", "", "", "");
		try {
		String response = api.changePassword(bean.getLoginId() , bean.getNewpwd() , bean.getRepwd());
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(response);
		JSONObject jo = (JSONObject) obj;
		bean.setErrors((JSONArray)jo.get("Errors"));
		validation();
		if(!hasActionErrors()) {
			String message = jo.get("Message")==null?"":jo.get("Message").toString();
			if("success".equalsIgnoreCase(message)) {
				bean.setStatus("success");
			}else {
				addActionError(message);
			}
		}
		}catch(Exception e) {
			e.printStackTrace();
		}
    	logger.info("Exit==>pwdChange()");
    	return returnResult;

    }
	
	public String checkChangePassword() {
		LoginApi api = new LoginApi();
		api.checkChangePassword(bean);
		validation();
		if (hasActionErrors()) {
			bean.setStatus("changePwd");
		} else {
			bean.setStatus("");
		}
		return "changePWD";
	}

	public String pwdForgot() {
		logger.info("Enter==>pwdForgot()");
		LoginApi api = new LoginApi();
		api.getForgotPassword(bean);
		validation();
		if (!hasActionErrors()) {
			bean.setPwdMsg(bean.getStatus());
			bean.setStatus("success");
		}
		return "forgotPWD";
	}
	
	public String change(){
		String returnResult=INPUT;
		if("changePwd".equalsIgnoreCase(bean.getStatus())) {
			returnResult="changePWD";
		}else 
			if("forgotPwd".equalsIgnoreCase(bean.getStatus())) {
			returnResult="forgotPWD";
		}
		 bean.setPwdMsg("New Password Should contain one uppercase, one lowercase, one number, one special character(@ # $ %) & length between 8 to 15");
    	return returnResult;
    }
	
	public String out(){
			if(this.session!=null && this.session.size()>0){
				logger.info("Enter==> Logout()");
		        bean.setLoginId((String) session.get("user"));
		        service.updateSessionInfo(bean.getLoginId(), request.getSession().getId());
		        ((SessionMap<String, Object>) this.session).invalidate();
		        logger.info("Exit==> Logout()");
			}
		bean.setFori18nLink("Y");	
		return page();
    }
	
	public CommonBean getModel() {
		return bean;
	}
	
	public boolean validPassword(String newpassword){
		Pattern pattern=Pattern.compile("((?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*()_+-=|{}][/?.>,<]).{7,20})");
    	Matcher matcher = pattern.matcher(newpassword);
    	return matcher.matches();
	}
	public boolean validEmail(String email){
    	Pattern pattern = Pattern.compile("^[A-Za-z0-9_\\+-]+(\\.[A-Za-z0-9_\\+-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*\\.([A-Za-z]{2,4})$");
    	boolean stat = true;
        if(email.contains(",")){
        	String[] emails = email.split(",");        	
        	for(String ids:emails){
        		Matcher matcher = pattern.matcher(ids);
        		if(!matcher.matches()){
        			stat = false;
        			break;
        		}
        	}
    	}else{
            Matcher matcher = pattern.matcher(email);
            stat = matcher.matches();
    	}
        return stat;
    }
	public void validlogin(){
		if(StringUtils.isEmpty(bean.getLoginId())){
			addActionError(getText("loginid.empty"));
		}if(StringUtils.isEmpty(bean.getPwd())){
			addActionError(getText("pwd.empty"));
		}
		if("admin".equalsIgnoreCase(bean.getLoginType())) {
			if(StringUtils.isBlank(bean.getRegion())) {
				addActionError(getText("region.empty"));
			}else {
				if(StringUtils.isBlank(bean.getBranch())) {
					addActionError(getText("branch.empty"));
				}
			}
		}
	}
	
	public String b2clogin() {
		out();
		bean.setLoginId(getText("B2C_LOGIN_ID"));
		bean.setLoginType("Broker");
		bean.setPwd("Admin@01");
		b2cType = "B2C";
		return submit();
	}
	
	public String landing(){
		out();
		bean.setLoginType("Broker");
		return "page"; 	
	}
	public List<Map<String,Object>> getRegionList(){
		return api.getRegionList();
	}
	public List<Map<String,Object>> getBranchList(){
		return api.getBranchList(bean.getRegion());
	}
	public List<Map<String,Object>> getProductList(){
		return service.getProductList();
	}
	public String portalLogin(){
		if(getText("B2C_LOGIN_ID").equalsIgnoreCase(bean.getLoginId())){
			b2clogin();
			session.put("fromPortal", "yes");
			session.put("LoginBranchCode","01");
			String result="";
			if("65".equals(bean.getProduct()))				
				result="portalLogin";
			else if("33".equalsIgnoreCase(bean.getProduct()))	
				result="travelPortalLogin";		
			
			return result;
		}else{
			session.put("isArabic",StringUtils.isBlank(bean.getIsArabic())?"":bean.getIsArabic());
			return "initReport";
		}
	}
	
	public String NewRegistration(){
		b2clogin();
		return "newUser";
	}
	
	public String b2cProduct(){
		out();
		bean.setLoginId("guestmotor");
		bean.setLoginType("Broker");
		bean.setPwd("Admin@01");
		b2cType = "B2C";
		bean.setFori18nLink("Y");
		return "b2cProduct";
	}
	
	/*public String productSelection(){	 
		bean.setProductList(homeservice.getProductDetails(bean.getLoginId(), bean.getLoginType(), "01"));
		return RESULT_JSON;
	}*/
	
	public String b2bProduct(){	
		if(session!=null && session.size()>0 && session.get("user")!=null){
			bean.setLoginId(session.get("user").toString());
			bean.setLoginType(session.get("LoginIdType").toString());
		}else{
			return b2cProduct();
		}
		bean.setFori18nLink("Y");
		return "b2cProduct";
	}
	public String mobLogin(String userName,String pwd){
		out();
		 bean.setLoginId(userName);
		 bean.setPwd(pwd);
		 bean.setLoginType("Broker");
		 return "mobLogin";
	}
	
	
	
	public void validOlogin(){
		if(StringUtils.isEmpty(bean.getOloginId())){
			addActionError(getText("Enter Login Id"));
		}else if(Validation.INVALID.equals(new Validation().validateMobile(bean.getOloginId())))
		{
			addActionError(getText("Enter Valid Login Id"));
		}
	}
	
	public String regUser(){
		bean.setLoginType("user");
		bean.setFori18nLink("Y");
		return "page";
	}
	public String branchSelection() {
		request.setAttribute("ELEMENT_NAME", "branchselection"); 
		return "dropdown";
	}
		
}
