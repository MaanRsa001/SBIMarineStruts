package com.maan.quotation.model;

import java.util.List;

import com.google.gson.annotations.SerializedName;

public class QuotationResponse {
	
    @SerializedName("Result")
    private QuotationModel quoteResponse;
    
    @SerializedName("AdditionalData") 
    private DefaultValue defaultValue;
    
    @SerializedName("ErrorMessage") 
    private List<Errors> errors;
    
	/**
	 * @return the quoteResponse
	 */
	public QuotationModel getQuoteResponse() {
		return quoteResponse;
	}
	/**
	 * @param quoteResponse the quoteResponse to set
	 */
	public void setQuoteResponse(QuotationModel quoteResponse) {
		this.quoteResponse = quoteResponse;
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
	public List<Errors> getErrors() {
		return errors;
	}
	public void setErrors(List<Errors> errors) {
		this.errors = errors;
	}

}
