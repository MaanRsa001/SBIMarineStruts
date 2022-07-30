package com.maan.quotation.model;

import java.util.List;

import com.google.gson.annotations.SerializedName;

public class Conditions {
	
	@SerializedName("Clauses")
	private List<Condition> clauses;
	@SerializedName("Wars")
	private List<Condition> wars;
	@SerializedName("Warranties")
	private List<Condition> warranties;
	@SerializedName("Exclusions")
	private List<Condition> exclusions;
	
	
	/**
	 * @return the clauses
	 */
	public List<Condition> getClauses() {
		return clauses;
	}
	/**
	 * @param clauses the clauses to set
	 */
	public void setClauses(List<Condition> clauses) {
		this.clauses = clauses;
	}
	/**
	 * @return the wars
	 */
	public List<Condition> getWars() {
		return wars;
	}
	/**
	 * @param wars the wars to set
	 */
	public void setWars(List<Condition> wars) {
		this.wars = wars;
	}
	/**
	 * @return the warranties
	 */
	public List<Condition> getWarranties() {
		return warranties;
	}
	/**
	 * @param warranties the warranties to set
	 */
	public void setWarranties(List<Condition> warranties) {
		this.warranties = warranties;
	}
	/**
	 * @return the exclusions
	 */
	public List<Condition> getExclusions() {
		return exclusions;
	}
	/**
	 * @param exclusions the exclusions to set
	 */
	public void setExclusions(List<Condition> exclusions) {
		this.exclusions = exclusions;
	}

}
