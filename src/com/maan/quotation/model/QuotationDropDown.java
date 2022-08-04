package com.maan.quotation.model;

import java.util.List;

import com.google.gson.annotations.SerializedName;

public class QuotationDropDown {
	
	@SerializedName("ApplicationId") 
    private String applicationId;
    @SerializedName("BranchCode") 
    private String branchCode;
    @SerializedName("BrokerCode") 
    private String brokerCode;
    @SerializedName("OriginationCountryCode") 
    private String originationCountryCode;
    @SerializedName("DestinationCountryCode") 
    private String destinationCountryCode;
    @SerializedName("LoginId") 
    private String loginId;
    @SerializedName("ModeOfTransportCode") 
    private String modeOfTransportCode;
    @SerializedName("OpenCoverNo") 
    private String openCoverNo;
    @SerializedName("ProductId") 
    private String productId;
    @SerializedName("IncotermCode") 
    private String incotermCode;
    @SerializedName("IncotermPercent") 
    private String incotermPercent;
    @SerializedName("UserType") 
    private String userType;
    @SerializedName("CoverCode") 
    private String coverCode;
    @SerializedName("StateCode") 
    private String stateCode;
	@SerializedName("Result")
	private List<DropDown> dropdownList;
	/**
	 * @return the applicationId
	 */
	public String getApplicationId() {
		return applicationId;
	}
	/**
	 * @param applicationId the applicationId to set
	 */
	public void setApplicationId(String applicationId) {
		this.applicationId = applicationId;
	}
	/**
	 * @return the branchCode
	 */
	public String getBranchCode() {
		return branchCode;
	}
	/**
	 * @param branchCode the branchCode to set
	 */
	public void setBranchCode(String branchCode) {
		this.branchCode = branchCode;
	}
	/**
	 * @return the brokerCode
	 */
	public String getBrokerCode() {
		return brokerCode;
	}
	/**
	 * @param brokerCode the brokerCode to set
	 */
	public void setBrokerCode(String brokerCode) {
		this.brokerCode = brokerCode;
	}
	/**
	 * @return the originationCountryCode
	 */
	public String getOriginationCountryCode() {
		return originationCountryCode;
	}
	/**
	 * @param originationCountryCode the originationCountryCode to set
	 */
	public void setOriginationCountryCode(String originationCountryCode) {
		this.originationCountryCode = originationCountryCode;
	}
	/**
	 * @return the destinationCountryCode
	 */
	public String getDestinationCountryCode() {
		return destinationCountryCode;
	}
	/**
	 * @param destinationCountryCode the destinationCountryCode to set
	 */
	public void setDestinationCountryCode(String destinationCountryCode) {
		this.destinationCountryCode = destinationCountryCode;
	}
	/**
	 * @return the loginId
	 */
	public String getLoginId() {
		return loginId;
	}
	/**
	 * @param loginId the loginId to set
	 */
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	/**
	 * @return the modeOfTransportCode
	 */
	public String getModeOfTransportCode() {
		return modeOfTransportCode;
	}
	/**
	 * @param modeOfTransportCode the modeOfTransportCode to set
	 */
	public void setModeOfTransportCode(String modeOfTransportCode) {
		this.modeOfTransportCode = modeOfTransportCode;
	}
	/**
	 * @return the openCoverNo
	 */
	public String getOpenCoverNo() {
		return openCoverNo;
	}
	/**
	 * @param openCoverNo the openCoverNo to set
	 */
	public void setOpenCoverNo(String openCoverNo) {
		this.openCoverNo = openCoverNo;
	}
	/**
	 * @return the productId
	 */
	public String getProductId() {
		return productId;
	}
	/**
	 * @param productId the productId to set
	 */
	public void setProductId(String productId) {
		this.productId = productId;
	}
	/**
	 * @return the incotermCode
	 */
	public String getIncotermCode() {
		return incotermCode;
	}
	/**
	 * @param incotermCode the incotermCode to set
	 */
	public void setIncotermCode(String incotermCode) {
		this.incotermCode = incotermCode;
	}
	/**
	 * @return the userType
	 */
	public String getUserType() {
		return userType;
	}
	/**
	 * @param userType the userType to set
	 */
	public void setUserType(String userType) {
		this.userType = userType;
	}
	/**
	 * @return the dropdownList
	 */
	public List<DropDown> getDropdownList() {
		return dropdownList;
	}
	/**
	 * @param dropdownList the dropdownList to set
	 */
	public void setDropdownList(List<DropDown> dropdownList) {
		this.dropdownList = dropdownList;
	}
	/**
	 * @return the coverCode
	 */
	public String getCoverCode() {
		return coverCode;
	}
	/**
	 * @param coverCode the coverCode to set
	 */
	public void setCoverCode(String coverCode) {
		this.coverCode = coverCode;
	}
	public String getIncotermPercent() {
		return incotermPercent;
	}
	public void setIncotermPercent(String incotermPercent) {
		this.incotermPercent = incotermPercent;
	}
	public String getStateCode() {
		return stateCode;
	}
	public void setStateCode(String stateCode) {
		this.stateCode = stateCode;
	}
	
}
