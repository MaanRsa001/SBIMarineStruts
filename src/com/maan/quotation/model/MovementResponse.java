package com.maan.quotation.model;

import com.google.gson.annotations.SerializedName;


public class MovementResponse {

	@SerializedName("TranId")
	private String tranId;
	@SerializedName("ProposalNo")
	private String proposalNo;
	@SerializedName("ErrorDesc")
	private String errorDesc;
	@SerializedName("Status")
	private String status;
	@SerializedName("DefaultValue") 
	private DefaultValue defaultValue;
	public String getTranId() {
		return tranId;
	}
	public void setTranId(String tranId) {
		this.tranId = tranId;
	}
	public String getProposalNo() {
		return proposalNo;
	}
	public void setProposalNo(String proposalNo) {
		this.proposalNo = proposalNo;
	}
	public String getErrorDesc() {
		return errorDesc;
	}
	public void setErrorDesc(String errorDesc) {
		this.errorDesc = errorDesc;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public DefaultValue getDefaultValue() {
		return defaultValue;
	}
	public void setDefaultValue(DefaultValue defaultValue) {
		this.defaultValue = defaultValue;
	}
	
	
	    
}
