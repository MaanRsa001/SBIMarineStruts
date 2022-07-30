package com.maan.quotation.model;

import com.google.gson.annotations.SerializedName;




public class customerInfoResp {

	@SerializedName("FirstName")
	private String firstName;
	@SerializedName("Email")
	private String email;
	@SerializedName("PoBox")
	private String poBox;
	@SerializedName("Mobile")
	private String mobile;
	@SerializedName("CityName")
	private String cityName;
	@SerializedName("CityCode")
	private String cityCode;
	@SerializedName("CustomerId")
	private String customerId;
	@SerializedName("MissippiCustomerCode")
	private String missippiCustomerCode;
	@SerializedName("Title")
	private String title;
	@SerializedName("Address1")
	private String address1;
	@SerializedName("Address2")
	private String address2;
	@SerializedName("Address")
	private String address;
	@SerializedName("CustomerArNo")
	private String customerArNo;
	@SerializedName("CustomerName")
	private String customerName;
	@SerializedName("VatRegNo ")
	private String vatRegNo;
	@SerializedName("CustomerArabicName")
	private String customerArabicName;
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPoBox() {
		return poBox;
	}
	public void setPoBox(String poBox) {
		this.poBox = poBox;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	public String getCityCode() {
		return cityCode;
	}
	public void setCityCode(String cityCode) {
		this.cityCode = cityCode;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public String getMissippiCustomerCode() {
		return missippiCustomerCode;
	}
	public void setMissippiCustomerCode(String missippiCustomerCode) {
		this.missippiCustomerCode = missippiCustomerCode;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCustomerArNo() {
		return customerArNo;
	}
	public void setCustomerArNo(String customerArNo) {
		this.customerArNo = customerArNo;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getVatRegNo() {
		return vatRegNo;
	}
	public void setVatRegNo(String vatRegNo) {
		this.vatRegNo = vatRegNo;
	}
	public String getCustomerArabicName() {
		return customerArabicName;
	}
	public void setCustomerArabicName(String customerArabicName) {
		this.customerArabicName = customerArabicName;
	}
	
	
}
