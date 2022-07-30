package com.maan.quotation.model;

import com.google.gson.annotations.SerializedName;

public class BrokerInfoReq {
	@SerializedName("BranchCode")
	private String branchCode;
	@SerializedName("LoginId")
	private String loginId;
	@SerializedName("OpenCoverNo")
	private String openCoverNo;
	@SerializedName("ProductId")
	private String productId;
	@SerializedName("UserType")
	private String userType;
	public String getBranchCode() {
		return branchCode;
	}
	public void setBranchCode(String branchCode) {
		this.branchCode = branchCode;
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public String getOpenCoverNo() {
		return openCoverNo;
	}
	public void setOpenCoverNo(String openCoverNo) {
		this.openCoverNo = openCoverNo;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	

	
}
