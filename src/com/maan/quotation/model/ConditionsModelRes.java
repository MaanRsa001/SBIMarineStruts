package com.maan.quotation.model;

import java.util.List;

import com.google.gson.annotations.SerializedName;

public class ConditionsModelRes {
	
	
	@SerializedName("Result")
	private List<Condition> conditions;
	@SerializedName("ConditionsType")
	private String conditionsType;
  
	
	public String getConditionsType() {
		return conditionsType;
	}
	public void setConditionsType(String conditionsType) {
		this.conditionsType = conditionsType;
	}
	public List<Condition> getConditions() {
		return conditions;
	}
	public void setConditions(List<Condition> conditions) {
		this.conditions = conditions;
	}
	

}
