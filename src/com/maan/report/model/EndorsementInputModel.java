package com.maan.report.model;

import java.util.List;

import com.google.gson.annotations.SerializedName;

public class EndorsementInputModel {
	
	@SerializedName("ProductId")
	private String productId;
	@SerializedName("ApplicationId")
	private String applicationId;
	@SerializedName("CancelRemarks")
	private String cancelRemarks;
	@SerializedName("CancelYN")
	private String cancelYN;
	@SerializedName("EndtRemarks")
	private String endtRemarks;
	@SerializedName("LoginId")
	private String loginId;
	@SerializedName("LoginUserType")
	private String loginUserType;
	@SerializedName("OpenCoverNo")
	private String openCoverNo;
	@SerializedName("PolicyNo")
	private String policyNo;
	@SerializedName("QuoteNo")
	private String quoteNo;
	@SerializedName("EndorsementInfo")
	private List<EndorsementTypeModel> endorsementInfo;
	@SerializedName("EffectiveDate")
	private String effectiveDate;
	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getApplicationId() {
		return applicationId;
	}

	public void setApplicationId(String applicationId) {
		this.applicationId = applicationId;
	}

	public String getCancelRemarks() {
		return cancelRemarks;
	}

	public void setCancelRemarks(String cancelRemarks) {
		this.cancelRemarks = cancelRemarks;
	}

	public String getCancelYN() {
		return cancelYN;
	}

	public void setCancelYN(String cancelYN) {
		this.cancelYN = cancelYN;
	}

	public String getEndtRemarks() {
		return endtRemarks;
	}

	public void setEndtRemarks(String endtRemarks) {
		this.endtRemarks = endtRemarks;
	}

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getLoginUserType() {
		return loginUserType;
	}

	public void setLoginUserType(String loginUserType) {
		this.loginUserType = loginUserType;
	}

	public String getOpenCoverNo() {
		return openCoverNo;
	}

	public void setOpenCoverNo(String openCoverNo) {
		this.openCoverNo = openCoverNo;
	}

	public String getPolicyNo() {
		return policyNo;
	}

	public void setPolicyNo(String policyNo) {
		this.policyNo = policyNo;
	}

	public String getQuoteNo() {
		return quoteNo;
	}

	public void setQuoteNo(String quoteNo) {
		this.quoteNo = quoteNo;
	}

	public List<EndorsementTypeModel> getEndorsementInfo() {
		return endorsementInfo;
	}

	public void setEndorsementInfo(List<EndorsementTypeModel> endorsementInfo) {
		this.endorsementInfo = endorsementInfo;
	}

	public String getEffectiveDate() {
		return effectiveDate;
	}

	public void setEffectiveDate(String effectiveDate) {
		this.effectiveDate = effectiveDate;
	}
	
}
