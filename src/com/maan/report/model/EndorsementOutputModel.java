package com.maan.report.model;

import java.util.List;

import com.google.gson.annotations.SerializedName;
import com.maan.quotation.model.DefaultValue;
import com.maan.quotation.model.Errors;

public class EndorsementOutputModel {
	
	@SerializedName("Result")
	private EndorsementSave endorsementInsertResponse;
    
    @SerializedName("DefaultValue") 
    private DefaultValue defaultValue;
    
    @SerializedName("ErrorMessage") 
    private List<Errors> errors;

	public EndorsementSave getEndorsementInsertResponse() {
		return endorsementInsertResponse;
	}

	public void setEndorsementInsertResponse(EndorsementSave endorsementInsertResponse) {
		this.endorsementInsertResponse = endorsementInsertResponse;
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
