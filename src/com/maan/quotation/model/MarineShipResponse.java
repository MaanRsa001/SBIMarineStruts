package com.maan.quotation.model;

import java.util.List;

import com.google.gson.annotations.SerializedName;


public class MarineShipResponse {

	@SerializedName("Result")
	private List<ShipDetailResp> shipDetails;
	@SerializedName("AdditionalData") 
	private DefaultValue defaultValue;
	    
	@SerializedName("ErrorMessage") 
	private List<Errors> errors;

	/**
	 * @return the shipDetails
	 */
	public List<ShipDetailResp> getShipDetails() {
		return shipDetails;
	}

	/**
	 * @param shipDetails the shipDetails to set
	 */
	public void setShipDetails(List<ShipDetailResp> shipDetails) {
		this.shipDetails = shipDetails;
	}

	/**
	 * @return the defaultValue
	 */
	public DefaultValue getDefaultValue() {
		return defaultValue;
	}

	/**
	 * @param defaultValue the defaultValue to set
	 */
	public void setDefaultValue(DefaultValue defaultValue) {
		this.defaultValue = defaultValue;
	}

	/**
	 * @return the errors
	 */
	public List<Errors> getErrors() {
		return errors;
	}

	/**
	 * @param errors the errors to set
	 */
	public void setErrors(List<Errors> errors) {
		this.errors = errors;
	}
	
	
}
