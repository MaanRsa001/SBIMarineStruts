package com.maan.quotation.model;

import com.google.gson.annotations.SerializedName;

public class EndtTypeRes {
	
	
	@SerializedName("Result")
	private String endorsementDesc;
	
	
	
	public String getEndorsementDesc() {
		return endorsementDesc;
	}
	public void setEndorsementDesc(String endorsementDesc) {
		this.endorsementDesc = endorsementDesc;
	}

}
