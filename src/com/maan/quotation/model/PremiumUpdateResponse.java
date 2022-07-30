package com.maan.quotation.model;

import java.util.List;

import com.google.gson.annotations.SerializedName;

public class PremiumUpdateResponse {
	
		@SerializedName("Result") 
	    private PremiumResponse premiumResponse;

	    @SerializedName("AdditionalData") 
	    private DefaultValue defaultValue;
	    
	    @SerializedName("ErrorMessage") 
	    private List<Errors> errors;

		public PremiumResponse getPremiumResponse() {
			return premiumResponse;
		}

		public void setPremiumResponse(PremiumResponse premiumResponse) {
			this.premiumResponse = premiumResponse;
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
