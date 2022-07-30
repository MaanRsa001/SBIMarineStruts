package com.maan.report.model;

import java.util.List;

import com.google.gson.annotations.SerializedName;
import com.maan.quotation.model.DefaultValue;

public class EndorsementCategoryList {
	
	@SerializedName("Result")
	private List<EndorsementCategory> endorsementResponse;
    @SerializedName("DefaultValue") 
    private DefaultValue defaultValue;

	public List<EndorsementCategory> getEndorsementResponse() {
		return endorsementResponse;
	}

	public void setEndorsementResponse(List<EndorsementCategory> endorsementResponse) {
		this.endorsementResponse = endorsementResponse;
	}

	public DefaultValue getDefaultValue() {
		return defaultValue;
	}

	public void setDefaultValue(DefaultValue defaultValue) {
		this.defaultValue = defaultValue;
	}

}
