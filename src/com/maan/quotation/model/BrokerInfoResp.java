package com.maan.quotation.model;

import com.google.gson.annotations.SerializedName;




public class BrokerInfoResp {

	@SerializedName("BrokerCode")
	private String brokerCode;
	@SerializedName("DestCountryId")
	private String destCountryId;
	@SerializedName("ExecutiveId")
	private String executiveId;
	@SerializedName("OrigCountryId")
	private String origCountryId;
	public String getBrokerCode() {
		return brokerCode;
	}
	public void setBrokerCode(String brokerCode) {
		this.brokerCode = brokerCode;
	}
	public String getDestCountryId() {
		return destCountryId;
	}
	public void setDestCountryId(String destCountryId) {
		this.destCountryId = destCountryId;
	}
	public String getExecutiveId() {
		return executiveId;
	}
	public void setExecutiveId(String executiveId) {
		this.executiveId = executiveId;
	}
	public String getOrigCountryId() {
		return origCountryId;
	}
	public void setOrigCountryId(String origCountryId) {
		this.origCountryId = origCountryId;
	}
	
	
	
}
