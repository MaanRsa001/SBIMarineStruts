package com.maan.report.model;

import com.google.gson.annotations.SerializedName;

public class EndorsementCategory {
	
	@SerializedName("EndtType")
	private String endtType;
	@SerializedName("EndtTypeCategory")
	private String endtTypeCategory;
	@SerializedName("EndtTypeCategoryId")
	private String endtTypeCategoryId;
	@SerializedName("EndtTypeDesc")
	private String endtTypeDesc;
	@SerializedName("EndtTypeId")
	private String endtTypeId;
	
	
	public String getEndtType() {
		return endtType;
	}
	public void setEndtType(String endtType) {
		this.endtType = endtType;
	}
	public String getEndtTypeCategory() {
		return endtTypeCategory;
	}
	public void setEndtTypeCategory(String endtTypeCategory) {
		this.endtTypeCategory = endtTypeCategory;
	}
	public String getEndtTypeCategoryId() {
		return endtTypeCategoryId;
	}
	public void setEndtTypeCategoryId(String endtTypeCategoryId) {
		this.endtTypeCategoryId = endtTypeCategoryId;
	}
	public String getEndtTypeDesc() {
		return endtTypeDesc;
	}
	public void setEndtTypeDesc(String endtTypeDesc) {
		this.endtTypeDesc = endtTypeDesc;
	}
	public String getEndtTypeId() {
		return endtTypeId;
	}
	public void setEndtTypeId(String endtTypeId) {
		this.endtTypeId = endtTypeId;
	}

}
