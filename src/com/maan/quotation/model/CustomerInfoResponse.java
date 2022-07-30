package com.maan.quotation.model;

import java.util.List;

import com.google.gson.annotations.SerializedName;


public class CustomerInfoResponse {

	@SerializedName("Result")
	private List<customerInfoResp> customerInformation;
	@SerializedName("AdditionalData") 
	private DefaultValue defaultValue;
	@SerializedName("Errors") 
	private List<Errors> errors;
	public List<customerInfoResp> getCustomerInformation() {
		return customerInformation;
	}
	public void setCustomerInformation(List<customerInfoResp> customerInformation) {
		this.customerInformation = customerInformation;
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
