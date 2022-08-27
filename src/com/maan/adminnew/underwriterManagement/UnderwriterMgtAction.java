package com.maan.adminnew.underwriterManagement;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.Logger;

import com.maan.adminnew.common.CommonService;
import com.maan.common.LogUtil;
import com.maan.common.Validation;
import com.maan.common.password.passwordEnc;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;


public class UnderwriterMgtAction extends ActionSupport implements ModelDriven<UnderwriterMgtBean>{
	final static Logger logger = LogUtil.getLogger(UnderwriterMgtAction.class);
	private static final long serialVersionUID = 1L;
	private UnderwriterMgtBean bean = new UnderwriterMgtBean();
	UnderwriterMgtService service=new UnderwriterMgtService();
	Map<String, Object> session=ActionContext.getContext().getSession();
	String branchCode=(String)session.get("BranchCode");
	String belongingBranch=(String)session.get("BelongingBranch");
	String login_id=(String)session.get("underwriter");
	private List <Object> underwriterList;
	private List <Object> underwriterInfo;
	private List <Object> issuerList;
	private List <Object> includeIssuer;
	private List <Object> excludeIssuer;
	String appId=(String)session.get("AppId");
	CommonService cservice=new CommonService();
	passwordEnc pass = new passwordEnc();
	private List <Object> commisionDetails=new ArrayList<Object>();
	//String mainbranch=((Map)session.get("BrokerDetails")).get("mainbranch").toString();
	
	public List<Object> getExcludeIssuer() {
		return excludeIssuer;
	}
	public void setExcludeIssuer(List<Object> excludeIssuer) {
		this.excludeIssuer = excludeIssuer;
	}
	
	public List<Object> getIncludeIssuer() {
		return includeIssuer;
	}
	public void setIncludeIssuer(List<Object> includeIssuer) {
		this.includeIssuer = includeIssuer;
	}

	public List<Object> getIssuerList() {
		return issuerList;
	}
	public void setIssuerList(List<Object> issuerList) {
		this.issuerList = issuerList;
	}
	
	public List<Object> getUnderwriterList() {
		return underwriterList;
	}
	public void setUnderwriterList(List<Object> underwriterList) {
		this.underwriterList = underwriterList;
	}
	public List<Object> getUnderwriterInfo() {
		return underwriterInfo;
	}
	public void setUnderwriterInfo(List<Object> underwriterInfo) {
		this.underwriterInfo = underwriterInfo;
	}
	
	public UnderwriterMgtBean getModel() {
		return bean;
	}
	
	public List<Map<String, String>> getProductList(){ 
		return cservice.getProductsDET(belongingBranch,bean.getAgencyCode());
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
	public String getABList(){
    	logger.info("ENTER-->Method to getABList");
		underwriterList=service.getAdminUnderwriterList(bean, bean.getAgencyCode(), bean.getMode1(),branchCode);
		logger.info("getABList() - Exit");
		return "underwriterList";
    }
	
	public String view(){
    	logger.info("Method to view");
    	bean.setOptionMode("edit");
    	underwriterInfo=service.getUnderwriterDetails(bean, branchCode, bean.getIssurName());
		logger.info("view() - Exit");
    	return "underwriterInfo";
    }
	public String changePass(){
		return "changePass";
	}
	public String getNew(){
		return "edit";
	}
	public String edit(){
		
		return "edit";
	}
	public String insertIssuer(){
		String forward="edit";
		service.updateUnderwriter(bean);
		validation();
		if(!hasActionErrors()){
			bean.setOptionMode("new");
		  addActionError(getText("Inserted successfully"));
		  forward="underwriterList";
		  underwriterList=service.getAdminUnderwriterList(bean, bean.getAgencyCode(), bean.getMode1(),branchCode);
		}
		return forward;
	}
	
	public String updateissuer(){
		logger.info("Method to update");
		bean.setOptionMode("edit");
		service.updateUnderwriter(bean);
		validation();
		if(!hasActionErrors()){
			bean.setMode("edit");
			addActionError(getText("Issuer details updated successfully"));
			underwriterList=service.getAdminUnderwriterList(bean, bean.getAgencyCode(), bean.getMode1(),branchCode);
		}
		logger.info("update() - Exit");
		return "underwriterInfo";
	}
	
	public String includeIssuer(){
		logger.info("Method to include");
		includeIssuer=service.includeissuerDetails(bean, bean.getType1());
		//underwriterInfo=service.getUnderwriterDetails(bean, branchCode, bean.getIssurName());
		logger.info("issuer() - Exit");
		return "includeIssuer";
	}
	public String excludeIssuer(){
		logger.info("Method to exclude");
		excludeIssuer=service.excludeissuerDetails(bean, bean.getType1());
		logger.info("exclude() - Exit");
		return "excludeIssuer";
	}
	public String branchSelection(){
		/*logger.info("Method to branchSelection()");
		bean.setMainBranchCode(branchCode);
		service.getRSABranches(bean);*/
		return "branchSelection";
	}
	private void validateInsert(){
	 	if(StringUtils.isBlank(bean.getIssurName()))
	 		addActionError(getText("issuer.name.empty"));
	 	if(StringUtils.isBlank(bean.getEmailId()))
	 		addActionError("Please enter Email Id");
	 	else if(StringUtils.contains(bean.getEmailId(), " "))
	 		addActionError("Email Id should not contain white spaces");
	 	else if("invalid".equalsIgnoreCase(new Validation().emailValidate(bean.getEmailId())))
    		addActionError("Please enter valid Email Id");
    	if(StringUtils.isBlank(bean.getLoginId()))
	 		addActionError(getText("issuer.loginId.empty"));
    	else if(StringUtils.contains(bean.getLoginId(), " "))
	 		addActionError("Login Id should not contain white spaces");
	 	else if(cservice.getAdminInfo(bean.getLoginId()).size()>0 && !"edit".equalsIgnoreCase(bean.getOptionMode()))
	 		addActionError(getText("error.loginid.exist"));
	 	if(StringUtils.isBlank(bean.getCoreLoginId()))
	 		addActionError(getText("issuer.coreloginId.empty"));
	 	if(!"edit".equalsIgnoreCase(bean.getOptionMode())){
		 	if(StringUtils.isBlank(bean.getPassword()))
		 		addActionError(getText("issuer.password.empty"));
		 	else if(StringUtils.contains(bean.getPassword(), " "))
		 		addActionError("Password should not contain white spaces");
	 	}
	 	/*if(StringUtils.isBlank(bean.getBranchNames()))
	 		addActionError(getText("issuer.branch.empty"));*/
	 	if(bean.getProducts()==null || bean.getProducts().size()<=0)
	 		addActionError(getText("issuer.product.empty"));
	 	if(StringUtils.isBlank(bean.getBranchId())){
	 		addActionError(getText("issuer.branchId.empty"));
	 	}
	 	if(StringUtils.isEmpty(bean.getEffecdate())){
    		addActionError(getText("error.tax.effecdate"));
    	}
	 		
	}
	public String updatePass(){
    	logger.info("Method to checkPwd()");
    	validatePassword();
    	try{
	    	if(getActionErrors().isEmpty()){
//	    		bean.setPassword(pass.crypt(bean.getPassword()));
				service.changePassword(bean);
				bean.setDisplay("passwordsuccess");
	    	}
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    	return "changePass";
    }
	public void validatePassword()
    {
    	if(StringUtils.isEmpty(bean.getPassword())){
    		addActionError(getText("error.broker.newpassword"));
    	}else if(StringUtils.contains(bean.getPassword(), " "))
	 		addActionError("Password should not contain white spaces");
    	if(StringUtils.isEmpty(bean.getRpassword())){
    		addActionError(getText("error.broker.repassword"));
    	}if(!bean.getRpassword().equals(bean.getPassword())){
    		addActionError(getText("error.different"));
    	}
    }
	public String updateExclude(){
		service.updateExcludedBrokers(bean);
		includeIssuer=service.includeissuerDetails(bean, bean.getType1());
		bean.setProductId(null);
		bean.setStatus(null);
		addActionError(getText("Selected Brokers are Included successfully"));
		return "includeIssuer";
	}
	public String updateInclude(){
		service.updateIncludeBrokers(bean);
		
		excludeIssuer=service.excludeissuerDetails(bean, bean.getType1());
		bean.setProductId(null);
		bean.setStatus(null);
		addActionError(getText("Selected Brokers are Excluded successfully"));
		return "excludeIssuer";
	}
	public String getIssuerAjax(){
		underwriterList=service.getAdminUnderwriterList(bean, bean.getAgencyCode(), bean.getMode1(),branchCode);
		return "adminAjax";
	}	 
	/*public List<Object>getBranchList(){
		return cservice.getAdminBranchList(branchCode, appId);
	}	*/
	public void validation() {
		if(bean.getErrors()!=null && bean.getErrors().size()>0) {
			for (int i =0;i<bean.getErrors().size();i++) {
				HashMap<String, Object> map=bean.getErrors().get(i);
				addActionError(map.get("Message").toString());
			}
		}
	}
}