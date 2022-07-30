package com.maan.adminnew.userManagement;

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

public class UserMgtAction extends ActionSupport implements
		ModelDriven<UserMgtBean> {
	
	final static Logger logger = LogUtil.getLogger(UserMgtAction.class);
	private static final long serialVersionUID = 1L;
	private UserMgtBean bean = new UserMgtBean();
	private CommonService cservice = new CommonService();
	Validation validation = new Validation();
	UserMgtService service = new UserMgtService();
	Map<String, Object> session = ActionContext.getContext().getSession();
	String branchCode = (String) session.get("BranchCode");
	private String belongingBranch=(String)session.get("BelongingBranch");
	String login_id = (String) session.get("user");
	private List<Object> userList;
	private List<Object> userInfo;
	private List<Object> commisionDetails = new ArrayList<Object>();
	private List<Map<String, String>> productList;
	private List<Object> productData;
	private List<Object> occList;
	String appId = (String) session.get("AppId");
	passwordEnc pass = new passwordEnc();

	public List<Object> getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(List<Object> userInfo) {
		this.userInfo = userInfo;
	}

	public List<Object> getCommisionDetails() {
		return commisionDetails;
	}

	public void setCommisionDetails(List<Object> commisionDetails) {
		this.commisionDetails = commisionDetails;
	}

	public List<Object> getUserList() {
		return userList;
	}

	public void setUserList(List<Object> userList) {
		this.userList = userList;
	}

	public List<Object> getProductData() {
		return productData;
	}

	public void setProductData(List<Object> productData) {
		this.productData = productData;
	}

	public List<Object> getOccList() {
		return occList;
	}

	public void setOccList(List<Object> occList) {
		this.occList = occList;
	}

	public List<Map<String, String>> getProductList() {
		return productList;
	}

	public void setProductList(List<Map<String, String>> productList) {
		this.productList = productList;
	}

	public UserMgtBean getModel() {
		return bean;
	}

	public List<Object> getCountriesInfo() {
		return cservice.getCountries(branchCode);
	}

	public List<Object> getEmiratesInfo() {
		return cservice.getEmirates(branchCode);
	}

	public List<Object> getBrokerList() {
		return cservice.getAdminBrokerList(branchCode, appId);
	}

	public List<Object> getNationalitiesInfo() {
		return cservice.getNationalities(branchCode);
	}

	public List<Object> getTitlesInfo() {
		return cservice.getTitles(belongingBranch);
	}

	public List<Map<String, String>> getProductDet() {
		return cservice.getProductsDET(branchCode, "");
	}
	public List<Map<String,Object>> getLinkedBranchList(){
		return cservice.getLinkedBranchList();
	}

	public String getOCCertificate() {
		occList = service.getOCCertificate(bean.getAgencyCode());
		return "openCover";
	}

	public String getABList() {
		logger.info("ENTER-->Method to getABList");
		logger.info("getABList() - Exit");
		userList = service.getAdminUserList(bean, bean.getAgencyCode(), bean.getMode1(), branchCode);
		return "userList";
	}

	public String view() {
		logger.info("Method to view");
		userInfo = service.getUserDetails(bean, bean.getUagencyCode());
		logger.info("view() - Exit");
		return "view";
	}

	public String edit() {
		logger.info("Method to edit");
		try {
			if (!"new".equals(bean.getMode())) {
				userInfo = service.getUserDetails(bean, bean.getUagencyCode());
				commisionDetails = service.getCommisionData(bean.getUagencyCode(), bean.getAgencyCode(), branchCode);
			}
			logger.info("edit() - Exit");
		} catch (Exception e) {
			logger.info(e);
			e.printStackTrace();
		}
		return "edit";
	}

	public String newUser() {
		logger.info("Enter==>newUser()");
		if ("new".equalsIgnoreCase(bean.getMode())) {
			service.newUserInsertorUpdate(bean,branchCode);
		} else {
			service.newUserInsertorUpdate(bean,branchCode);
		}
		validation();
		if (getActionErrors().isEmpty()) {
			try {
				if ("new".equalsIgnoreCase(bean.getMode())) {
					bean.setDisplay("successNew");
					bean.setIndex("0");
				} else {
					bean.setDisplay("successUpdate");
					bean.setIndex("0");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		userInfo = service.getUserDetails(bean, bean.getUagencyCode());
		commisionDetails = service.getCommisionData(bean.getUagencyCode(), bean.getAgencyCode(), branchCode);
		return "edit";
	}

	public String getUserAjax() {
		if ("userLists".equals(bean.getReqFrom())) {
			userList = service.getUserListAjax(bean.getUagencyCode(), bean
					.getSearchBy(), bean.getSearchValue(), bean.getMode1());
		} else if ("userproduct".equals(bean.getReqFrom())) {
			commisionDetails = service.getCommisionData(bean.getUagencyCode(),
					bean.getAgencyCode(), branchCode);
			productList = cservice.getProductsDET(branchCode, bean
					.getAgencyCode());
		}
		return "adminAjax";
	}

	public String checkPwd() {
		logger.info("Method to checkPwd()");
		validatePassword();
		try {
			if (getActionErrors().isEmpty()) {
				service.setPassword(bean);
				bean.setDisplay("passwordsuccess");
			} else
				bean.setMode1("login");
		} catch (Exception e) {
			e.printStackTrace();
		}
		userInfo = service.getUserDetails(bean, bean.getUagencyCode());
		commisionDetails = service.getCommisionData(bean.getUagencyCode(), bean.getAgencyCode(), branchCode);
		bean.setIndex("2");
		return "edit";
	}

	public String addProduct() {
		logger.info("ENTER===> addProduct");
		String returnResult = "edit";
		try {
			validateProducts();
			userInfo = service.getUserDetails(bean, bean.getUagencyCode());
			service.addProduct(bean,commisionDetails);
			validation();
			if (!hasActionErrors()) {
				commisionDetails = service.getCommisionData(bean.getUagencyCode(), bean.getAgencyCode(), branchCode);
				
			} else {
				bean.setMode1("product");
				commisionDetails = service.getCommisionData(bean.getUagencyCode(), bean.getAgencyCode(), branchCode);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		bean.setIndex("1");
		return returnResult;
	}

	public void validatePassword() {
		if (StringUtils.isEmpty(bean.getPassword()))
			addActionError(getText("error.broker.newpassword"));
		else if (StringUtils.contains(bean.getPassword(), " "))
			addActionError("Password should not contain white spaces");
		if (StringUtils.isEmpty(bean.getRepassword()))
			addActionError(getText("error.broker.repassword"));
		else if (!bean.getPassword().equals(bean.getRepassword()))
			addActionError(getText("error.different"));
	}

	public void validateProducts() {
		int count = 0;
		List<Object> commisionDetail = new ArrayList<Object>();
		for (int i = 0; i < bean.getProduct().size(); i++) {
			if ("true".equals(bean.getProduct().get(i))) {
				if (!"11".equals(bean.getUproductId().get(i))) {
					if (StringUtils.isEmpty(bean.getSpecialDis().get(i))) {
						addActionError(getText("error.product.specialdis")+ " " + bean.getUproductName().get(i));
					} else if (!StringUtils.isNumeric(bean.getSpecialDis().get(i).replace(".",""))) {
						addActionError(getText("error.product.specialdis.valid")+ " " + bean.getUproductName().get(i));
					}
					if (StringUtils.isEmpty(bean.getInsEndLimit().get(i))) {
						addActionError(getText("error.product.insEndLimit")+ " " + bean.getUproductName().get(i));
					} else if (!StringUtils.isNumeric(bean.getInsEndLimit().get(i).replace(".",""))) {
						addActionError(getText("error.product.insEndLimit.valid")+ " " + bean.getUproductName().get(i));
					}
				}
				count++;
			}
			Map<String, String> map = new HashMap<String, String>();
			// map.put("product",bean.getProduct().get(i)=="true"?"Y":"N");
			if ("true".equalsIgnoreCase(bean.getProduct().get(i)))
				map.put("product", "Y");
			else
				map.put("product", "N");

			map.put("uproductId", bean.getUproductId().get(i) == null ? "" : bean.getUproductId().get(i));
			map.put("uproductName", bean.getUproductName().get(i) == null ? "" : bean.getUproductName().get(i));
			map.put("specialDis", bean.getSpecialDis().get(i) == null ? "" : bean.getSpecialDis().get(i));
			map.put("insEndLimit", bean.getInsEndLimit().get(i) == null ? "" : bean.getInsEndLimit().get(i));
			map.put("receipt", bean.getReceipt() == null ? "N" : bean.getReceipt().get(i));
			map.put("freight", bean.getFreight() == null ? "N" : bean.getFreight().get(i));
			if ("11".equals(bean.getUproductId().get(i)) && "true".equals(bean.getProduct().get(i)))
				map.put("open_cover_no", bean.getOpenCover());
			else {
				map.put("open_cover_no", "");
			}
			commisionDetail.add(map);
			 
		}
		if (count == 0) {
			addActionError(getText("error.product.select"));
		}
		
		/*
		 * for (int i = 0; i < bean.getProduct().size(); i++) {
		 * if("true".equals(bean.getProduct().get(i))){
		 * 
		 * String productId = bean.getUproductId().get(i); //if("3".equals(productId) ||
		 * "11".equals(productId)){ if(("3".equals(productId) ||
		 * "11".equals(productId))){ boolean
		 * cond=service.userisElegile(bean.getUagencyCode(),productId); if(cond){ //
		 * addActionError("This User Does not allowed add  "+("3".equals(productId)
		 * ?"ONE OFF":"OPEN COVER")); } } } }
		 */
		this.commisionDetails = commisionDetail;
	}

	public void validatenewUser(){
    	if("edit".equals(bean.getUstatus())){
	    	if(StringUtils.isEmpty(bean.getUstatus())){
	    		addActionError(getText("error.quotation.status"));
	    	}
    	}if("new".equals(bean.getUstatus())){
    		if(StringUtils.isEmpty(bean.getUtype())){
    			addActionError(getText("error.user.type"));
    		}
    	}if(StringUtils.isEmpty(bean.getBroker())){
    		addActionError(getText("error.policy.report.broker.invalid"));
    	}if(StringUtils.isEmpty(bean.getUfirstname())){
    		addActionError(getText("error.quotation.firstname"));
    	}else if(StringUtils.isNumeric(bean.getUfirstname())){
    		addActionError(getText("error.quotation.firstname.valid"));
    	}if(StringUtils.isEmpty(bean.getUnationality())){
    		addActionError(getText("error.quotation.nationality"));
    	}if(StringUtils.isEmpty(bean.getUcity())){
    		addActionError(getText("error.quotation.emirate"));
    	}if(StringUtils.isEmpty(bean.getUcountry())){
    		addActionError("error.select.country");
    	}if(StringUtils.isEmpty(bean.getUpobox())){
    		addActionError(getText("error.quotation.pobox"));
    	}else if(!StringUtils.isNumeric(bean.getUpobox())){
    		addActionError(getText("error.quotation.pobox.valid"));
    	}if(!StringUtils.isBlank(bean.getUphone()) && !StringUtils.isNumeric(bean.getUphone()))
    		addActionError(getText("error.broker.phone"));
    	if(!StringUtils.isBlank(bean.getUmobile()) && !StringUtils.isNumeric(bean.getUmobile()))
    		addActionError(getText("error.broker.mobile"));
    	if(StringUtils.isEmpty(bean.getUemail()))
    		addActionError(getText("error.quotation.email"));
    	else if(StringUtils.contains(bean.getUemail(), " "))
	 		addActionError(getText("error.email.contains.white.space"));
    	else if("invalid".equalsIgnoreCase(validation.emailValidate(bean.getUemail()))){
    		addActionError(getText("error.quotation.valid.bemail"));
    	}if("new".equals(bean.getMode())){
    		if(StringUtils.isEmpty(bean.getUserId()))
        		addActionError(getText("error.broker.loginid"));
    		else if(StringUtils.contains(bean.getUserId(), " "))
    	 		addActionError("Login Id should not contain white spaces");
        	if(StringUtils.isEmpty(bean.getPassword()))
        		addActionError(getText("error.broker.newpassword"));
        	else if(StringUtils.contains(bean.getPassword(), " "))
    	 		addActionError("Password should not contain white spaces");
        	if(StringUtils.isEmpty(bean.getRepassword())){
        		addActionError(getText("error.broker.repassword"));
        	}else if(!bean.getPassword().equals(bean.getRepassword())){
        		addActionError(getText("error.different"));
        	}else if(!new Validation().validPassword(bean.getPassword())){
        		addActionError(getText("error.invalid"));
        	}else if(cservice.getAdminInfo(bean.getUserId()).size()>0){
        		addActionError(getText("error.loginid.notavailable"));
        	}
    	}
    }
	public void validation() {
		if(bean.getErrors()!=null && bean.getErrors().size()>0) {
			for (int i =0;i<bean.getErrors().size();i++) {
				HashMap<String, Object> map=bean.getErrors().get(i);
				addActionError(map.get("Message").toString());
			}
		}
	}
}