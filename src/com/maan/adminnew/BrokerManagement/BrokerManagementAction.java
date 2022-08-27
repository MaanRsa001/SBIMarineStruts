package com.maan.adminnew.BrokerManagement;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.maan.adminnew.common.CommonService;
import com.maan.common.LogUtil;
import com.maan.common.Validation;
import com.maan.common.password.passwordEnc;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class BrokerManagementAction extends ActionSupport implements ModelDriven<BrokerMgmBean>
{
	final Logger logger = LogUtil.getLogger(BrokerManagementAction.class);
	private static final long serialVersionUID = 1L;
	private BrokerMgmBean bean = new BrokerMgmBean();
	private CommonService cservice=new CommonService();
	Validation validation=new Validation();
	private List <Object> brokerList;
	private List <String> brokerInfo;
	private List <Object> productData;
	private List <Object> commisionDetails;
	private List <Object> branchData;
	private List <Object> branchsInfo;
	private List <Object> coreCustomerInfo;
	private List <String> customerTaxInfo;
	private List <Object> commission_Det;
	private List <Map<String,String>> productList;
	private List <String> comp_Det;
	private List <Object> productInfo=new ArrayList<Object>();
	private List <Object> userInfo;
	private List <Object> userInfo1;
	private List<Object> portfolioList;
	final Validation validate=new Validation();
	
	BrokerManagementService service=new BrokerManagementService();
	final HttpServletRequest request=ServletActionContext.getRequest();
	Map<String, Object> session=ActionContext.getContext().getSession();
	String branchCode=(String)session.get("BranchCode");
	private String belongingBranch=(String)session.get("BelongingBranch");
	String appId=(String)session.get("AppId");
	String login_id=(String)session.get("user");
	passwordEnc pass = new passwordEnc();	
	
	public BrokerMgmBean getModel() {
		return bean;
	}
	
	
	public List<Object> getPortfolioList() {
		return portfolioList;
	}


	public void setPortfolioList(List<Object> portfolioList) {
		this.portfolioList = portfolioList;
	}


	public List<Object> getProductInfo() {
		return productInfo;
	}
	public void setProductInfo(List<Object> productInfo) {
		this.productInfo = productInfo;
	}
	public List <Object> getBrokerList() {
		return brokerList;
	}
	public List <String> getBrokerInfo() {
		return brokerInfo;
	}
	public List <Object> getProductData() {
		return productData;
	}
	public List <Object> getCommisionDetails() {
		return commisionDetails;
	}
	public List <Object> getCommission_Det() {
		return commission_Det;
	}
	public List <Object> getBranchData() {
		return branchData;
	}
	public List <Object> getBranchsInfo() {
		return branchsInfo;
	}
	public List <Object> getBrokerCode() {
		return service.getBrokerCode();
	}
	public List <Object> getCountriesInfo() {
		return cservice.getCountries(belongingBranch);
	}
	public List <Object> getEmiratesInfo() {
		return cservice.getEmirates(branchCode);
	}
	public List <Object> getNationalitiesInfo() {
		return cservice.getNationalities(belongingBranch);
	}
	public List <Object> getTitlesInfo() {
		return cservice.getTitles(belongingBranch);
	}
	public List <Map<String,String>> getProductDet() {
		return cservice.getProductsDET(branchCode,"");
	}
	public List <Object> getExecutivesInfo() {
		return service.getExecutives();
	}
	public List <Object> getCoreCustomerInfo() {
		return coreCustomerInfo;
	}
	public List <String> getCustomerTaxInfo() {
		return customerTaxInfo;
	}
	public List <String> getComp_Det() {
		return comp_Det;
	}
	public List <Object> getUserInfo() {
		return userInfo;
	}
	public void setUserInfo(List <Object> userInfo) {
		this.userInfo = userInfo;
	}
	public List <Object> getUserInfo1() {
		return userInfo1;
	}
	public List <Map<String,String>> getProductList() {
		return productList;
	}
	public List<Map<String,Object>> getLinkedBranchList(){
		return cservice.getLinkedBranchList();
	}
	public List<Map<String,Object>> getRegionsList(){
		return cservice.getRegionsList();
	}
	public List<Map<String,Object>> getBranchList(){
		return cservice.getBranchList(bean.getRegionCode());
	}
	public List<Map<String,Object>> getAttachedBranchList(){
		return cservice.getAttachedBranchList(bean.getSelregions());
	}
	public String branchSelection(){
		return "branchSelection";
	}
	public String getABList(){
    	logger.info("ENTER-->Method to getABList");
    	brokerList=cservice.getAdminBrokerList(branchCode,appId);
		logger.info("getABList() - Exit"+login_id);
    	return "brokerList";
    }

	@SuppressWarnings("unchecked")
	public String view() {
		logger.info("Method to view");
		JSONObject result = new JSONObject();
		result = service.getBrokerDetailsApi(bean, bean.getAgencyCode(), branchCode);
		List<Map<String,Object>> brokerData=null;
		brokerData = (JSONArray) result.get("BrokerDetails");
		service.setBrokerInfo(brokerData , bean);
		commisionDetails = (JSONArray) result.get("BrokerCommissionDetails");
		branchData = (JSONArray) result.get("BranchDetails");
		logger.info("view() - Exit");
		return "view";
	}
	
    @SuppressWarnings("unchecked")
	public String edit(){
    	bean.setBrcode((String)session.get("BranchCode"));
    	logger.info("Method to edit");
    	logger.info("branchCode-->"+branchCode);
    	logger.info("agencyCode-->"+bean.getAgencyCode());
    	try{
    		if(!"new".equals(bean.getMode())){
    			if("delete".equals(bean.getMode1())){
		    		service.deleteBroLogo(bean.getAgencyCode());
					File deleteFile = new File(request.getSession().getServletContext().getRealPath(bean.getBroImgName()));
		    		FileUtils.deleteQuietly(deleteFile);
		    	}
		    	
		    	JSONObject result = service.getBrokerEditApi(bean, bean.getAgencyCode(), branchCode);
				List<Map<String,Object>> brokerData=null;
				
				brokerData = (JSONArray) result.get("BrokerDetails");
				service.setBrokerInfo(brokerData , bean);
				commisionDetails = (JSONArray) result.get("BrokerCommissionDetails");
				branchData = (JSONArray) result.get("BranchDetails");
				customerTaxInfo =  (JSONArray) result.get("BrokerTaxDetails");
				service.setCustomerTaxInfo((JSONArray) result.get("BrokerTaxDetails") , bean);
		    	logger.info("getBrokerTaxInfo() - Exit   Result--->"+customerTaxInfo.size());
    		}
			logger.info("edit() - Exit");
    	}catch(Exception e){
    		logger.info(e);
    		e.printStackTrace();
    	}
    	return "edit";
    }
    public String checkPwd(){
    	logger.info("Method to checkPwd()");
    	validatePassword();
    	try{
	    	if(getActionErrors().isEmpty()){
	    		service.setPassword(bean);
//	    		bean.setPassword(pass.crypt(bean.getPassword()));
//				String args[]={bean.getPassword(),bean.getAgencyCode()};
//				cservice.checkPassword(args);
				bean.setDisplay("passwordsuccess");
	    	}
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    	return "assignNew";
    }
    public String getccInfo(){
    	logger.info("Method to getccInfo");
    	if(bean.getMode()==null){
	    	logger.info("customerName-->"+bean.getCustomerName());
	    	logger.info("bcode-->"+branchCode);
	    	coreCustomerInfo=service.getcoreCustomererInfo(bean.getCustomerName(),branchCode, (String)session.get("userLoginMode"));
	    	bean.setMode("display");
    	}else bean.setMode(null);
    	return "coreCust";
    }
    public boolean validPassword(String newpassword)
	{
    	Pattern pattern=Pattern.compile("((?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*()_+-=|{}][/?.>,<]).{7,20})");
    	Matcher matcher = pattern.matcher(newpassword);
    	return matcher.matches();
	}
    /*public String statusChange(){
    	bean.setStatus(service.getBrokerStatus(bean.getAgencyCode()));
    	return "status";
    }
    public String statusUpdate(){
    	String[] obj={bean.getStatus(),bean.getAgencyCode()};
    	service.updateBrokerStatus(obj);
    	bean.setDisplay("success");
    	return "status";
    }*/
    
    public String newBroker()
    {
    	bean.setBrcode((String)session.get("BranchCode"));
    	logger.info("Enter==>newBroker()");
    	bean.setBranch(bean.getBranchCodeS());
    	//validatenewUser();
    	service.insertBrokerInfoApi(bean);
    	validation();
    	if(getActionErrors().isEmpty()){
    	
    		if("new".equalsIgnoreCase(bean.getMode())){
    			bean.setDisplay("successNew");
    		}else {
    			bean.setDisplay("successUpdate");
    		}
    	}
    	edit();
    	return "edit";
    }
    
    
    public String addProduct(){
		logger.info("ENTER===> addProduct");
		String returnResult="edit";
		try {
			
			if("65".equalsIgnoreCase(bean.getProductID())){
				addMotorProduct();
			}else{
				addOtherProduct();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		edit();
		bean.setIndex("1");
		return returnResult;
	}
    
    public String addMotorProduct(){
		logger.info("ENTER===> addProduct");
		String returnResult="edit";
		try {
	    	logger.info("ENTER-->Method to validateProducts");
			validateProducts();
			if(!hasActionErrors()){
				if("newAjax".equals(bean.getMode1())){
					Object[] info ={cservice.getMaxUserId(), bean.getFirstname(), bean.getAgencyCode(), bean.getAgencyCode(), bean.getAgencyCode(), bean.getProductID(), "2", bean.getCommission(), "1000", bean.getInsurance_End_Limit(), bean.getDiscountPremium(),
									"0", "1", "", "", "", "Y", bean.getCustomer_id(), bean.getMin_Premium_Amount(), bean.getBack_Date_Allowed(), "", "", "", bean.getLoadingPremium(), bean.getUser_Id_Creation(), bean.getFreight(), bean.getPayReceipt(), bean.getProvision(), "", "","30".equals(bean.getProductID())?"3":"",bean.getPolicyType(),bean.getCheckeryn()};
					Object obj1[]=new Object[]{bean.getRemark(), bean.getAgencyCode()};
					
					logger.info("info===>" + StringUtils.join(info, ", "));
					logger.info("obj1===>" + StringUtils.join(obj1, ", "));
					cservice.insertCommission(info, obj1);				 
					bean.setDisplay("newsuccess");
				}
				else{
					Object[] info = {bean.getCommission(), bean.getInsurance_End_Limit(), "Y", bean.getDiscountPremium(), bean.getMin_Premium_Amount(), bean.getBack_Date_Allowed(),
								bean.getLoadingPremium(),bean.getPayReceipt(), bean.getFreight(), bean.getUser_Id_Creation(),bean.getProvision(),"","",bean.getPolicyType(),bean.getCheckeryn(), bean.getAgencyCode(), bean.getProductID()};
					Object obj1[]=new Object[]{bean.getRemark(), bean.getAgencyCode()};
					
					logger.info("info===>" + StringUtils.join(info, ", "));
					logger.info("obj1===>" + StringUtils.join(obj1, ", "));
					
					cservice.updateMotorCommission(info, obj1);
				
					bean.setDisplay("editsuccess");
				}
				service.savePolicyTypeDetails(bean);
				bean.setMode1("");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		edit();
		bean.setIndex("1");
		return returnResult;
	}
    
	public String addOtherProduct(){
		logger.info("ENTER===> addProduct");
		String returnResult="edit";
		try {
	    	logger.info("ENTER-->Method to validateProducts");
			validateProducts();
			if(!hasActionErrors()){
				cservice.addProduct(bean);
				
//				if("newAjax".equals(bean.getMode1())){
//					Object[] info ={cservice.getMaxUserId(), bean.getFirstname(), bean.getAgencyCode(), bean.getAgencyCode(),
//							bean.getAgencyCode(), bean.getProductID(), "2", bean.getCommission(),
//							"1000", bean.getInsurance_End_Limit(), bean.getDiscountPremium(),
//									"0", "1","", "", "", "", "Y", bean.getCustomer_id(), bean.getMin_Premium_Amount(), 
//									bean.getBack_Date_Allowed(), "", "", "", bean.getLoadingPremium(), bean.getProvision()
//									, bean.getFreight(), bean.getPayReceipt(),bean.getPayReceipt() ,"","","30".equals(bean.getProductID())?"7":"0"};
//					Object obj1[]=new Object[]{bean.getRemark(), bean.getAgencyCode()};
//					
//					logger.info("info===>" + StringUtils.join(info, ", "));
//					logger.info("obj1===>" + StringUtils.join(obj1, ", "));
//					cservice.insertCommission(info, obj1);				 
//					bean.setDisplay("newsuccess");
//				}
//				else{
//					Object[] info = {bean.getCommission(), bean.getInsurance_End_Limit(), "Y", bean.getDiscountPremium(), bean.getMin_Premium_Amount(), bean.getBack_Date_Allowed(),
//								bean.getLoadingPremium(),bean.getPayReceipt(), bean.getFreight(), bean.getUser_Id_Creation(),bean.getProvision(),"","", bean.getAgencyCode(), bean.getProductID()};
//					Object obj1[]=new Object[]{bean.getRemark(), bean.getAgencyCode()};
//					
//					logger.info("info===>" + StringUtils.join(info, ", "));
//					logger.info("obj1===>" + StringUtils.join(obj1, ", "));
////					
//					cservice.updateCommission(info, obj1);
//				
//					bean.setDisplay("editsuccess");
//				}
				bean.setMode1("");
				
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		edit();
		bean.setIndex("1");
		return returnResult;
	}
	
	/*public String newlogin()
    {
    	logger.info("newlogin");
    	String returnResult="logcreate";
    	try{
	    	validatePassword();
	    	if(getActionErrors().isEmpty())
	    	{
		    	if(bean.getPassword().equals(bean.getRepassword()))
		        	{
		        		if(validPassword(bean.getPassword())){
		        			String args[]={bean.getLoginid(), pass.crypt(bean.getPassword().substring(0, 3), bean.getPassword()), "RSAIssuer", bean.getFirstname(),"8", bean.getAgencyCode(),
		        					bean.getAgencyCode(), "1", "Admin", "Y", "Y", "Y", "BOTH", branchCode, bean.getCountry(),  bean.getLogin_Id()};
		        			for(String k: args){
								logger.info("args===>" + k);
							}
			    			service.insertLogInDet(args);
			    			
			    			Object params[]={bean.getLoginid(), bean.getAgencyCode()};
			    			for(Object k: params){
								logger.info("args===>" + k);
							}
			    			service.updatePersonalLogin(params);
			    			bean.setDisplay("success");
		        		}
		        		else bean.setDisplay("invalid");
		        	}
		        	else bean.setDisplay("different");
		    	logger.info("display-->"+bean.getDisplay());
		    	returnResult="success";
	    	}
	    	else{
	    		returnResult="logcreate";
	    	}
    	}catch(Exception e){
			e.printStackTrace();
		}
    	return returnResult;
    }
	
	public String getBrokerUserInfo(){
		try{
			String args[] = {bean.getAgencyCode()};
			userInfo = service.getProductStatus(args);
			
			String[] args1 = {bean.getAgencyCode(), bean.getProductID()};
			for(Object k: args1){
				logger.info("args===>" + k);
			}
			userInfo1 = service.getProductStatuss(args1);
			bean.setBroker_Code(userInfo.size());
		}catch(Exception e){
			e.printStackTrace();
		}
		return "status";
	}*/
    public void validatenewUser()
    {
    	if("edit".equals(bean.getStatus())){
	    	if(StringUtils.isEmpty(bean.getStatus())){
	    		addActionError(getText("error.quotation.status"));
	    	}
    	}
    	/*if(StringUtils.isEmpty(bean.getNameAndCode())){
    		addActionError(getText("error.quotation.nameAndCode"));
    	}*/
    	final String BROKER_CODE_CHECK =getText("BROKER_CODE_CHECK");
    
    	if(StringUtils.isEmpty(bean.getApprovedby())){
    		addActionError(getText("error.quotation.approvedby"));
    	}if(StringUtils.isEmpty(bean.getBcode())){
    		addActionError(getText("error.quotation.bcode"));
    		/*}else if(!StringUtils.isNumeric(bean.getBcode())){
    		addActionError(getText("error.quotation.bcode.invalid"));*/
    	}else if("YES".equalsIgnoreCase(BROKER_CODE_CHECK) && service.validateBcode(bean.getBcode(),bean.getAgencyCode(),branchCode) > 0) {
    		addActionError(getText("error.quotation.bcode.invalid"));
    	}else if("new".equalsIgnoreCase(bean.getMode()) && service.valBraWiseBcode(bean.getBcode(),branchCode)>0) {
    			addActionError(getText("error.branchwise.bcode.invalid"));
    	}
    	if(StringUtils.isEmpty(bean.getEmirate())){
    		addActionError(getText("error.quotation.emirate"));
    	}if("VARIOUS".equalsIgnoreCase(bean.getEmirate())){
    		if(StringUtils.isBlank(bean.getOthercity()))
    			addActionError(getText("error.broker.othercity.required"));
    		else if(!StringUtils.isAlpha(bean.getOthercity())){
        		addActionError(getText("error.broker.othercity"));
        	}
    	}
    	if(StringUtils.isBlank(bean.getOthercity()))
    		bean.setOthercity("");
    	if(StringUtils.isEmpty(bean.getCountry())){
    		addActionError("Please Select Country");
    	}/*if(StringUtils.isEmpty(bean.getPobox())){
    		addActionError(getText("error.quotation.pobox"));
    	}else */
    	if(StringUtils.isNotBlank(bean.getPobox()) && !StringUtils.isNumeric(bean.getPobox())){
    		addActionError(getText("error.quotation.pobox.valid"));
    	}if(!StringUtils.isNumeric(bean.getMobile())){
    		addActionError(getText("error.broker.mobile"));
    	}if(StringUtils.isEmpty(bean.getFirstname())){
    		addActionError(getText("error.quotation.firstname"));
    	}else if(StringUtils.isNumeric(bean.getFirstname())){
    		addActionError(getText("error.quotation.firstname.valid"));
    	}if(StringUtils.isEmpty(bean.getNationality())){
    		addActionError(getText("error.quotation.nationality"));
    	}if(!StringUtils.isNumeric(bean.getMobile())){
    		addActionError(getText("error.broker.mobile"));
    	}if(StringUtils.isEmpty(bean.getBemail())){
    		addActionError(getText("error.quotation.email"));
    	}else if(StringUtils.contains(bean.getBemail(), " "))
	 		addActionError("Email Id should not contain white spaces");
    	else if("invalid".equalsIgnoreCase(validation.emailValidate(bean.getBemail()))){
    		addActionError(getText("error.quotation.valid.bemail"));
    	}if(StringUtils.isEmpty(bean.getExecutive())){
    		addActionError(getText("error.quotation.executive"));
    	}if("new".equals(bean.getMode())){
    		if(StringUtils.isEmpty(bean.getLoginid())){
        		addActionError(getText("error.broker.loginid"));
        	}else if(StringUtils.contains(bean.getLoginid(), " "))
    	 		addActionError("Login Id should not contain white spaces");
        	else if(cservice.getAdminInfo(bean.getLoginid()).size()>0 && !"edit".equalsIgnoreCase(bean.getMode()))
    	 		addActionError(getText("error.loginid.exist"));
    		if(StringUtils.isEmpty(bean.getPassword())){
        		addActionError(getText("error.broker.newpassword"));
        	}else if(StringUtils.contains(bean.getPassword(), " "))
    	 		addActionError("Password should not contain white spaces");
    		if(StringUtils.isEmpty(bean.getRepassword())){
        		addActionError(getText("error.broker.repassword"));
        	}else if(!bean.getPassword().equals(bean.getRepassword())){
        		addActionError(getText("error.different"));
        	}else if(!new Validation().validPassword(bean.getPassword())){
        		addActionError(getText("error.invalid"));
        	}else if(cservice.getAdminInfo(bean.getLoginid()).size()>0){
        		addActionError(getText("error.loginid.notavailable"));
        	}
    	}
    	if("Y".equalsIgnoreCase(bean.getPolicy_fee())){
    		if(StringUtils.isEmpty(bean.getPolicFee())){
        		addActionError(getText("error.tax.policFee"));
        	}else  {
        		try {
	    			Double.parseDouble(bean.getPolicFee());
	    			if(Double.parseDouble(bean.getPolicFee())>99.999){	
	            		addActionError(getText("error.tax.valid.policFee"));	
	    			}
	    		}
	    		catch(Exception exception) {
	    			addActionError(getText("error.tax.valid.policFee"));
	    		}
        	}
		}if("Y".equalsIgnoreCase(bean.getGov_fee())){
    		if(StringUtils.isEmpty(bean.getGovtTax())){
        		addActionError(getText("error.tax.govtTax"));
        	}else {
        		try {
	    			Double.parseDouble(bean.getGovtTax());
	    			if(Double.parseDouble(bean.getGovtTax())>99.999){	
	            		addActionError(getText("error.tax.valid.govtTax"));	
	    			}
	    		}
	    		catch(Exception exception) {
	    			addActionError(getText("error.tax.valid.govtTax"));
	    		}
        	}
		}if("Y".equalsIgnoreCase(bean.getEmer_fee())){
    		if(StringUtils.isEmpty(bean.getEmergencyfund())){
        		addActionError(getText("error.tax.emergencyfund"));
        	}else if(!StringUtils.isNumeric(bean.getEmergencyfund())){
        		addActionError(getText("error.tax.valid.emergencyfund"));
        	}else if(Integer.parseInt(bean.getEmergencyfund())>99.999){
        		addActionError(getText("error.tax.valid.emergencyfund"));
        	}
		}
		/*if(StringUtils.isEmpty(bean.getOneOffCommission()))
    		addActionError("Please enter Commission for Issuer Quotes : For One Off Policy");
    	else */
    	if(StringUtils.isNotBlank(bean.getOneOffCommission()) && !Validation.decimalValidate(bean.getOneOffCommission()))
    		addActionError("Please enter valid Commission for Issuer Quotes : For One Off Policy");
		/*if(StringUtils.isEmpty(bean.getOpenCoverCommission()))
			addActionError("Please enter Commission for Issuer Quotes : For Open Cover Policy");
		else*/ 
		if(StringUtils.isNotBlank(bean.getOpenCoverCommission()) && !Validation.decimalValidate(bean.getOpenCoverCommission()))
    		addActionError("Please enter valid Commission for Issuer Quotes : For Open Cover Policy");
		if(StringUtils.isEmpty(bean.getEffecdate())){
    		addActionError(getText("error.tax.effecdate"));
    	}
		if(StringUtils.isBlank(bean.getBorganization()))
			addActionError("Please Enter the Broker Organization");
		
		String extensions[] = {"png","jpg","jpeg","gif"};

		if(bean.getUpload()!=null && (bean.getUpload().length())>0)
		{
			if(!FilenameUtils.isExtension(bean.getUploadFileName().toLowerCase(),extensions))
			{
				addActionError(getText("error.broker.image"));
			}
			//String filePath = request.getContextPath()+"/BrokerImages/"+bean.getUploadFileName()+"."+FilenameUtils.getExtension(bean.getUploadFileName());
			//System.out.println("filePath--->"+filePath);
			/*if(bean.getBroImgUpload().length()>10485760)
			{
				addActionError(getText("error.image.size"));
			}*/

		}
    }
    public void validatePassword()
    {
    	if(StringUtils.isEmpty(bean.getPassword())){
    		addActionError(getText("error.broker.newpassword"));
    	}if(StringUtils.isEmpty(bean.getRpassword())){
    		addActionError(getText("error.broker.repassword"));
    	}if(!bean.getRpassword().equals(bean.getPassword())){
    		addActionError(getText("error.different"));
    	}
    }
    public boolean validString(String value,int format)
    { 
    	boolean bo=false;
    	int count=0,c=0;
    	
    	try
    	{
    		value=value.trim();
    		String validChar,validno,validextra=null,validCode,validnumonly;
    		String string=new String("");
    					
    			validChar="abcdefghijklmnopqrstuvwxyz";
    			validno="1234567890-";
    			validextra="1234567890.";
    			validCode="abcdefghijklmnopqrstuvwxyz1234567890 ";
    			validnumonly="1234567890";
    			value=value.toLowerCase();
    			if(format==1)
    			    string=new String(validChar);
    			else if(format==2)
    				string=new String(validno);
    			else if(format==3)
    				string=validChar+validno;
    			else if(format==4)
    				string=new String(validextra);
    			else if(format==5)
    				string=new String(validCode);
    			else if(format==6)
    				string=new String(validnumonly);
    			for(int i=0;i<value.length();i++) {
    				if(string.indexOf(value.charAt(i))== -1)
    				bo=true;
    				if(value.charAt(i)=='.')
    					count++;	
    				if(value.charAt(i)=='-')
    				c++;	
    			}
    			if(count>=2 || c>=2)
    				bo=true;
    			
    	}catch(Exception e){
    		return bo;
    	}
    	return bo;
    }   
    
    public void validateProducts(){
    	if("newAjax".equals(bean.getMode1()) && StringUtils.isEmpty(bean.getProductID())){
    		addActionError(getText("error.product.productID"));
    	}
	    else{
	    		if("3".equals(bean.getProductID())){
		    	if(StringUtils.isBlank(bean.getCommission())){
		    		addActionError(getText("error.product.COMMISSION"));
		    	}else {	
		    		try {
		    			Double.parseDouble(bean.getCommission());
		    		}
		    		catch(Exception exception) {
		    			addActionError(getText("error.product.valid.COMMISSION"));
		    		}		
		    	}if(StringUtils.isBlank(bean.getInsurance_End_Limit())){
		    		addActionError(getText("error.product.INSURANCE_END_LIMIT"));
		    	}else if(!StringUtils.isNumeric(bean.getInsurance_End_Limit())){	
		    		addActionError(getText("error.product.valid.INSURANCE_END_LIMIT"));		
		    	}if(StringUtils.isBlank(bean.getMin_Premium_Amount())){
		    		addActionError(getText("error.product.MIN_PREMIUM_AMOUNT"));
		    	}else if(!StringUtils.isNumeric(bean.getMin_Premium_Amount())){	
		    		addActionError(getText("error.product.valid.MIN_PREMIUM_AMOUNT"));		
		    	}
		    	if("Y".equalsIgnoreCase(bean.getProvision())){
		    		if(StringUtils.isBlank(bean.getLoadingPremium())){
		    			addActionError(getText("error.product.loadingPremium"));
		    		}else if(!StringUtils.isNumeric(bean.getLoadingPremium())){	
		    			addActionError(getText("error.product.valid.loadingPremium"));		
		    		}if(StringUtils.isBlank(bean.getDiscountPremium())){
		    			addActionError(getText("error.product.discountPremium"));
		    		}else if(!StringUtils.isNumeric(bean.getDiscountPremium())){	
		    			addActionError(getText("error.product.valid.discountPremium"));		
		    		}
		    	}else{
					bean.setLoadingPremium(null);
					bean.setDiscountPremium(null);
				}
		    	if(StringUtils.isBlank(bean.getBack_Date_Allowed())){
		    		addActionError(getText("error.product.BACK_DATE_ALLOWED"));
		    	}else if(!StringUtils.isNumeric(bean.getBack_Date_Allowed())){
		    		addActionError(getText("error.product.valid.BACK_DATE_ALLOWED"));
		    	}
		    }if(StringUtils.isBlank(bean.getUser_Id_Creation())){
	    		addActionError(getText("error.product.USER_ID_CREATION"));
	    	}if(StringUtils.isBlank(bean.getPayReceipt())){
	    		addActionError(getText("error.product.payReceipt"));
	    	}if(StringUtils.isBlank(bean.getFreight())){
	    		addActionError(getText("error.product.freight"));
	    	}
	    	if(StringUtils.isBlank(bean.getRemark())){
	    		addActionError("Please Select Remarks Required");
	    	}
	    }
    }
    public String changePwd(){
    	brokerInfo=service.getBrokerDetails(bean, bean.getAgencyCode(),branchCode);
    	bean.setDisplay("");
    	return "assignNew";
    }
    public String getBrokerAjax(){
    	String result="adminAjax";
    	if("brokerLists".equals(bean.getReqFrom())){
    		brokerList=service.getBrokerListAjax(branchCode, bean.getSearchBy(), bean.getSearchValue(), appId);
    	}else if("productselections".equals(bean.getReqFrom())){
    		if("editAjax".equals(bean.getMode1()) && !"ajax".equals(bean.getMode())){
    			productData=service.getProducts(bean);
    		}
    		productList=cservice.getProductsDET(branchCode,bean.getAgencyCode());
    		//service.editPolicyDetails(bean);
    		result="adminComboAjax";
    	}else if("branchId".equals(bean.getReqFrom())){
    		
    	}
    	return result;
    }
    public String deleteProduct(){
    	service.deleteProduct(bean);
    	edit();
    	bean.setMode1("");
    	bean.setProductID("");
    	bean.setIndex("1");
    	return "edit";
    }
    public void validation() {
		if(bean.getErrors()!=null && bean.getErrors().size()>0) {
			for (int i =0;i<bean.getErrors().size();i++) {
				HashMap<String, Object> map=bean.getErrors().get(i);
				addActionError(map.get("Message").toString());
			}
		}
	}
    public String opencover() {
    	portfolioList=service.getPolicyRegisterList(bean.getLogin_Id(),branchCode); 
		return "brokeroc";
	}
}