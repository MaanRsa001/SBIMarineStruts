package com.maan.quotation.model;

import java.util.List;

import com.google.gson.annotations.SerializedName;

public class ConditionsModel {
	
	@SerializedName("ApplicationNo")
	private String applicationNo;
	@SerializedName("QuoteNo")
	private String quoteNo;
	@SerializedName("BranchCode")
	private String branchCode;
	@SerializedName("CoverId")
	private String coverId;
	@SerializedName("Conditions")
	private Conditions conditions;
	@SerializedName("Clauses")
	private List<Condition> clauses;
	@SerializedName("Wars")
	private List<Condition> wars;
	@SerializedName("Warranties")
	private List<Condition> warranties;
	@SerializedName("Exclusions")
	private List<Condition> exclusions;
	@SerializedName("ConditionsType")
	private String conditionsType;
    @SerializedName("AdditionalData") 
    private DefaultValue defaultValue;
	
	
	public String getApplicationNo() {
		return applicationNo;
	}
	public void setApplicationNo(String applicationNo) {
		this.applicationNo = applicationNo;
	}
	public String getQuoteNo() {
		return quoteNo;
	}
	public void setQuoteNo(String quoteNo) {
		this.quoteNo = quoteNo;
	}
	public String getBranchCode() {
		return branchCode;
	}
	public void setBranchCode(String branchCode) {
		this.branchCode = branchCode;
	}
	public Conditions getConditions() {
		return conditions;
	}
	public void setConditions(Conditions conditions) {
		this.conditions = conditions;
	}
	public DefaultValue getDefaultValue() {
		return defaultValue;
	}
	public void setDefaultValue(DefaultValue defaultValue) {
		this.defaultValue = defaultValue;
	}
	public String getCoverId() {
		return coverId;
	}
	public void setCoverId(String coverId) {
		this.coverId = coverId;
	}
	public String getConditionsType() {
		return conditionsType;
	}
	public void setConditionsType(String conditionsType) {
		this.conditionsType = conditionsType;
	}
	public List<Condition> getClauses() {
		return clauses;
	}
	public void setClauses(List<Condition> clauses) {
		this.clauses = clauses;
	}
	public List<Condition> getWars() {
		return wars;
	}
	public void setWars(List<Condition> wars) {
		this.wars = wars;
	}
	public List<Condition> getWarranties() {
		return warranties;
	}
	public void setWarranties(List<Condition> warranties) {
		this.warranties = warranties;
	}
	public List<Condition> getExclusions() {
		return exclusions;
	}
	public void setExclusions(List<Condition> exclusions) {
		this.exclusions = exclusions;
	}

}
