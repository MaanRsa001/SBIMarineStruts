package com.maan.quotation.model;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.google.gson.annotations.SerializedName;

public class CustomerDetails{
    @SerializedName("Title") 
    private String title;
    @SerializedName("Name") 
    private String name;
    @SerializedName("Code") 
    private String code;
    @SerializedName("CoreAppCode") 
    private String coreAppCode;
    @SerializedName("Address1") 
    private String address1;
    @SerializedName("Address2") 
    private String address2;
    @SerializedName("CityCode") 
    private String cityCode;
    @SerializedName("City") 
    private String cityName;
    @SerializedName("PoBox") 
    private String poBox;
    @SerializedName("MobileNo") 
    private String mobileNo;
    @SerializedName("EmailId") 
    private String emailId;
    @SerializedName("VatRegNo") 
    private String vatRegNo;
    @SerializedName("VatApplicable") 
    private String vatApplicable;
    @SerializedName("StateCode") 
    private String statecode;
    @SerializedName("State") 
    private String state;
    @SerializedName("CustomerType")
	private String customertype;
    @SerializedName("GstIdentityNo")
	private String gstIdentityNo;
    @SerializedName("AadharNo")
	private String aadharNo;
    @SerializedName("EIANumber")
	private String eiaNumber;
    @SerializedName("IANOCode")
	private String ianocode;
	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}
	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return the coreAppCode
	 */
	public String getCoreAppCode() {
		return coreAppCode;
	}
	/**
	 * @param coreAppCode the coreAppCode to set
	 */
	public void setCoreAppCode(String coreAppCode) {
		this.coreAppCode = coreAppCode;
	}
	/**
	 * @return the address1
	 */
	public String getAddress1() {
		return address1;
	}
	/**
	 * @param address1 the address1 to set
	 */
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	/**
	 * @return the address2
	 */
	public String getAddress2() {
		return address2;
	}
	/**
	 * @param address2 the address2 to set
	 */
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	/**
	 * @return the cityCode
	 */
	public String getCityCode() {
		return cityCode;
	}
	/**
	 * @param cityCode the cityCode to set
	 */
	public void setCityCode(String cityCode) {
		this.cityCode = cityCode;
	}
	/**
	 * @return the cityName
	 */
	public String getCityName() {
		return cityName;
	}
	/**
	 * @param cityName the cityName to set
	 */
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	/**
	 * @return the poBox
	 */
	public String getPoBox() {
		return poBox;
	}
	/**
	 * @param poBox the poBox to set
	 */
	public void setPoBox(String poBox) {
		this.poBox = poBox;
	}
	/**
	 * @return the mobileNo
	 */
	public String getMobileNo() {
		return mobileNo;
	}
	/**
	 * @param mobileNo the mobileNo to set
	 */
	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}
	/**
	 * @return the emailId
	 */
	public String getEmailId() {
		return emailId;
	}
	/**
	 * @param emailId the emailId to set
	 */
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	/**
	 * @return the vatRegNo
	 */
	public String getVatRegNo() {
		return vatRegNo;
	}
	/**
	 * @param vatRegNo the vatRegNo to set
	 */
	public void setVatRegNo(String vatRegNo) {
		this.vatRegNo = vatRegNo;
	}
	/**
	 * @return the vatApplicable
	 */
	public String getVatApplicable() {
		return vatApplicable;
	}
	/**
	 * @param vatApplicable the vatApplicable to set
	 */
	public void setVatApplicable(String vatApplicable) {
		this.vatApplicable = vatApplicable;
	}
	/**
	 * @return the code
	 */
	public String getCode() {
		return code;
	}
	/**
	 * @param code the code to set
	 */
	public void setCode(String code) {
		this.code = code;
	}
	public String getStatecode() {
		return statecode;
	}
	public void setStatecode(String statecode) {
		this.statecode = statecode;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCustomertype() {
		return customertype;
	}
	public void setCustomertype(String customertype) {
		this.customertype = customertype;
	}
	public String getGstIdentityNo() {
		return gstIdentityNo;
	}
	public void setGstIdentityNo(String gstIdentityNo) {
		this.gstIdentityNo = gstIdentityNo;
	}
	public String getAadharNo() {
		return aadharNo;
	}
	public void setAadharNo(String aadharNo) {
		this.aadharNo = aadharNo;
	}
	public String getEiaNumber() {
		return eiaNumber;
	}
	public void setEiaNumber(String eiaNumber) {
		this.eiaNumber = eiaNumber;
	}
	public String getIanocode() {
		return ianocode;
	}
	public void setIanocode(String ianocode) {
		this.ianocode = ianocode;
	}
	
}
