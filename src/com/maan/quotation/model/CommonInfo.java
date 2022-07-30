package com.maan.quotation.model;

import com.google.gson.annotations.SerializedName;

public class CommonInfo {
	@SerializedName("OpenCoverNo")
	private String openCoverNo;
	@SerializedName("BrokerName")
	private String brokerName;
	@SerializedName("CustomerName")
	private String customerName;
	@SerializedName("MissippiOpenCoverNo")
	private String missippiOpenCoverNo;

	@SerializedName("ReferenceNo")
	private String referenceNo;
	@SerializedName("Result")
	private boolean endorsement;
	
	@SerializedName("EndorsementDesc")
	private String endorsementDesc;
	
	
	@SerializedName("QuoteNo")
	private String quoteNo;
	@SerializedName("LoginId")
	private String loginId;
	@SerializedName("ApplicationId")
	private String applicationId;
	@SerializedName("PolicyNo")
	private String policyNo;
	@SerializedName("QuotationDate")
	private String quotationDate;
	@SerializedName("SearchValue")
	private String searchValue;
	
	public String getOpenCoverNo() {
		return openCoverNo;
	}
	public void setOpenCoverNo(String openCoverNo) {
		this.openCoverNo = openCoverNo;
	}
	public String getBrokerName() {
		return brokerName;
	}
	public void setBrokerName(String brokerName) {
		this.brokerName = brokerName;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getMissippiOpenCoverNo() {
		return missippiOpenCoverNo;
	}
	public void setMissippiOpenCoverNo(String missippiOpenCoverNo) {
		this.missippiOpenCoverNo = missippiOpenCoverNo;
	}
	public String getQuoteNo() {
		return quoteNo;
	}
	public void setQuoteNo(String quoteNo) {
		this.quoteNo = quoteNo;
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public String getPolicyNo() {
		return policyNo;
	}
	public void setPolicyNo(String policyNo) {
		this.policyNo = policyNo;
	}
	public String getQuotationDate() {
		return quotationDate;
	}
	public void setQuotationDate(String quotationDate) {
		this.quotationDate = quotationDate;
	}
	public String getReferenceNo() {
		return referenceNo;
	}
	public void setReferenceNo(String referenceNo) {
		this.referenceNo = referenceNo;
	}
	public boolean isEndorsement() {
		return endorsement;
	}
	public void setEndorsement(boolean endorsement) {
		this.endorsement = endorsement;
	}
	public String getEndorsementDesc() {
		return endorsementDesc;
	}
	public void setEndorsementDesc(String endorsementDesc) {
		this.endorsementDesc = endorsementDesc;
	}
	public String getApplicationId() {
		return applicationId;
	}
	public void setApplicationId(String applicationId) {
		this.applicationId = applicationId;
	}
	public String getSearchValue() {
		return searchValue;
	}
	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
	

}
