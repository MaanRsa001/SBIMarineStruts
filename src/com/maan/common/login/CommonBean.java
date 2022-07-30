package com.maan.common.login;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.maan.common.util.EscapeUtils;

public class CommonBean{
	private String loginId;
	private String pwd;
	private String utype;
	private String userId;
	private String userPwd;
	private String status;
	private String newpwd;
	private String repwd;
	private String mailId;
	private String pwdMsg;
	private int swidth;
	private String branch;
	private String bloginId;
	private String loginType;
	private String bpwd;
	private String aloginId;
	private String apwd;
	private String product;
	/*** For Walaa Portal*/
	private String menuType;
	private String customerName;	
	private String email;
	private String mobileNo;
	private String companyRegNo;
	private String request_local;
	private String driverId;
	private String driverDob;
	private String errStatus;
	private String userType;
	private String otp;
	private String otpId;
	private String otpExpiry;
	private String otpStatus;
	private String display;
	private List<Map<String, Object>> otpList;
	
	private String ologinId;
	private String opwd;
	private String isArabic;
	private String belongingBranch;
	private String fori18nLink;
	private String productId;
	private String request_locale;
	private String reOtpYN;
	private String region;
	private List<HashMap<String,Object>> errors=new ArrayList<HashMap<String,Object>>();
	private String menuId;
	private String countryId;
	// For Walaa
	
	private List<Map<String,Object>> productList;
	
	public String getDefaultSearch(){
		return "Policy No";
	}
	public String getLoginId() {
		return EscapeUtils.escapeHtml((loginId==null?"":loginId));
	}
	public void setLoginId(String loginId) {
		this.loginId = EscapeUtils.escapeHtml((loginId==null?"":loginId));
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getUtype() {
		return utype;
	}
	public void setUtype(String utype) {
		this.utype = utype;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getStatus() {
		return EscapeUtils.escapeHtml((status==null?"":status));
	}
	public void setStatus(String status) {
		this.status = EscapeUtils.escapeHtml((status==null?"":status));
	}
	public String getNewpwd() {
		return newpwd;
	}
	public void setNewpwd(String newpwd) {
		this.newpwd = newpwd;
	}
	public String getRepwd() {
		return repwd;
	}
	public void setRepwd(String repwd) {
		this.repwd = repwd;
	}
	public String getMailId() {
		return mailId;
	}
	public void setMailId(String mailId) {
		this.mailId = mailId;
	}
	public String getPwdMsg() {
		return (pwdMsg==null?"":pwdMsg);
	}
	public void setPwdMsg(String pwdMsg) {
		this.pwdMsg = (pwdMsg==null?"":pwdMsg);
	}
	public int getSwidth() {
		return Integer.valueOf(EscapeUtils.escapeHtml((String.valueOf(swidth)==null?"":String.valueOf(swidth))));
	}
	public void setSwidth(int swidth) {
		this.swidth = Integer.valueOf(EscapeUtils.escapeHtml((String.valueOf(swidth)==null?"":String.valueOf(swidth))));
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public String getBranch() {
		return branch;
	}
	public String getBloginId() {
		return bloginId;
	}
	public void setBloginId(String bloginId) {
		this.bloginId = bloginId;
	}
	public String getBpwd() {
		return bpwd;
	}
	public void setBpwd(String bpwd) {
		this.bpwd = bpwd;
	}
	public String getAloginId() {
		return aloginId;
	}
	public void setAloginId(String aloginId) {
		this.aloginId = aloginId;
	}
	public String getApwd() {
		return apwd;
	}
	public void setApwd(String apwd) {
		this.apwd = apwd;
	}
	public void setLoginType(String loginType) {
		this.loginType = EscapeUtils.escapeHtml((loginType==null?"":loginType));
	}
	public String getLoginType() {
		return EscapeUtils.escapeHtml((loginType==null?"":loginType));
	}
	public void setProduct(String product) {
		this.product = EscapeUtils.escapeHtml((product==null?"":product));
	}
	public String getProduct() {
		return EscapeUtils.escapeHtml((product==null?"":product));
	}
	public void setMenuType(String menuType) {
		this.menuType = EscapeUtils.escapeHtml((menuType==null?"":menuType));
	}
	public String getMenuType() {
		return EscapeUtils.escapeHtml((menuType==null?"":menuType));
	}
	public String getCustomerName() {
		return EscapeUtils.escapeHtml((customerName==null?"":customerName));
	}
	public void setCustomerName(String customerName) {
		this.customerName = EscapeUtils.escapeHtml((customerName==null?"":customerName));
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobileNo() {
		return mobileNo;
	}
	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}
	public String getCompanyRegNo() {
		return companyRegNo;
	}
	public void setCompanyRegNo(String companyRegNo) {
		this.companyRegNo = companyRegNo;
	}
	public void setRequest_local(String request_local) {
		this.request_local = request_local;
	}
	public String getRequest_local() {
		return request_local;
	}
	public void setDriverId(String driverId) {
		this.driverId = driverId;
	}
	public String getDriverId() {
		return driverId;
	}
	public void setDriverDob(String driverDob) {
		this.driverDob = driverDob;
	}
	public String getDriverDob() {
		return driverDob;
	}
	public void setErrStatus(String errStatus) {
		this.errStatus = errStatus;
	}
	public String getErrStatus() {
		return errStatus;
	}
	public void setProductList(List<Map<String,Object>> productList) {
		this.productList = productList;
	}
	public List<Map<String,Object>> getProductList() {
		return productList;
	}
	public void setOtpList(List<Map<String, Object>> otpList) {
		this.otpList = otpList;
	}
	public List<Map<String, Object>> getOtpList() {
		return otpList;
	}
	public void setOtp(String otp) {
		this.otp = otp;
	}
	public String getOtp() {
		return otp;
	}
	public void setOtpId(String otpId) {
		this.otpId = otpId;
	}
	public String getOtpId() {
		return otpId;
	}
	public void setOtpExpiry(String otpExpiry) {
		this.otpExpiry = otpExpiry;
	}
	public String getOtpExpiry() {
		return otpExpiry;
	}
	public void setOtpStatus(String otpStatus) {
		this.otpStatus = otpStatus;
	}
	public String getOtpStatus() {
		return otpStatus;
	}
	public void setOloginId(String ologinId) {
		this.ologinId = EscapeUtils.escapeHtml((ologinId==null?"":ologinId));
	}
	public String getOloginId() {
		return EscapeUtils.escapeHtml((ologinId==null?"":ologinId));
	}
	public void setOpwd(String opwd) {
		this.opwd = opwd;
	}
	public String getOpwd() {
		return opwd;
	}
	public void setIsArabic(String isArabic) {
		this.isArabic = EscapeUtils.escapeHtml((isArabic==null?"":isArabic));
	}
	public String getIsArabic() {
		return EscapeUtils.escapeHtml((isArabic==null?"":isArabic));
	}
	public String getBelongingBranch() {
		return belongingBranch;
	}
	public void setBelongingBranch(String belongingBranch) {
		this.belongingBranch = belongingBranch;
	}
	public void setFori18nLink(String fori18nLink) {
		this.fori18nLink = fori18nLink;
	}
	public String getFori18nLink() {
		return fori18nLink;
	}
	public void setDisplay(String display) {
		this.display = EscapeUtils.escapeHtml((display==null?"":display));
	}
	public String getDisplay() {
		return EscapeUtils.escapeHtml((display==null?"":display));
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getProductId() {
		return productId;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getUserType() {
		return userType;
	}
	public void setRequest_locale(String request_locale) {
		this.request_locale = EscapeUtils.escapeHtml((request_locale==null?"":request_locale));
	}
	public String getRequest_locale() {
		return EscapeUtils.escapeHtml((request_locale==null?"":request_locale));
	}
	public void setReOtpYN(String reOtpYN) {
		this.reOtpYN = reOtpYN;
	}
	public String getReOtpYN() {
		return reOtpYN;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public List<HashMap<String,Object>> getErrors() {
		return errors;
	}
	public void setErrors(List<HashMap<String,Object>> errors) {
		this.errors = errors;
	}
	public String getMenuId() {
		return menuId;
	}
	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}
	public String getCountryId() {
		return countryId;
	}
	public void setCountryId(String countryId) {
		this.countryId = countryId;
	}
	
}
