package com.maan.quotation.model;

import com.google.gson.annotations.SerializedName;

public class EndorsementPremiumModel {
	
	@SerializedName("DefaultValue")
	private DefaultValue defaultValue;
	@SerializedName("Result")
	private EndorsementPremiumDetails endorsementPremiumDetails;
	
	
	public DefaultValue getDefaultValue() {
		return defaultValue;
	}
	public void setDefaultValue(DefaultValue defaultValue) {
		this.defaultValue = defaultValue;
	}
	public EndorsementPremiumDetails getEndorsementPremiumDetails() {
		return endorsementPremiumDetails;
	}
	public void setEndorsementPremiumDetails(EndorsementPremiumDetails endorsementPremiumDetails) {
		this.endorsementPremiumDetails = endorsementPremiumDetails;
	}

}
