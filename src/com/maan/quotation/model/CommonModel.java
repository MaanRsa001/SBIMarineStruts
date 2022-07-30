package com.maan.quotation.model;

import com.google.gson.annotations.SerializedName;

public class CommonModel {
	@SerializedName("Result")
	private CommonInfo openCoverResponse;
	@SerializedName("EndorsementResponse")
	private CommonInfo endorsementResponse;
    @SerializedName("AdditionalData") 
    private DefaultValue defaultValue;
	
	
	public CommonInfo getOpenCoverResponse() {
		return openCoverResponse;
	}
	public void setOpenCoverResponse(CommonInfo openCoverResponse) {
		this.openCoverResponse = openCoverResponse;
	}
	public CommonInfo getEndorsementResponse() {
		return endorsementResponse;
	}
	public void setEndorsementResponse(CommonInfo endorsementResponse) {
		this.endorsementResponse = endorsementResponse;
	}
	public DefaultValue getDefaultValue() {
		return defaultValue;
	}
	public void setDefaultValue(DefaultValue defaultValue) {
		this.defaultValue = defaultValue;
	}
	
}
