package com.maan.quotation.model;

import java.util.List;

import com.google.gson.annotations.SerializedName;


public class BrokerInfoResponse {

	@SerializedName("Result")
	private BrokerInfoResp brokerInformation;
	@SerializedName("AdditionalData") 
	private DefaultValue defaultValue;
	@SerializedName("ErrorMessage") 
	private List<Errors> errors;
	public BrokerInfoResp getBrokerInformation() {
		return brokerInformation;
	}
	public void setBrokerInformation(BrokerInfoResp brokerInformation) {
		this.brokerInformation = brokerInformation;
	}
	public DefaultValue getDefaultValue() {
		return defaultValue;
	}
	public void setDefaultValue(DefaultValue defaultValue) {
		this.defaultValue = defaultValue;
	}
	public List<Errors> getErrors() {
		return errors;
	}
	public void setErrors(List<Errors> errors) {
		this.errors = errors;
	}
	

	
	
	
}
