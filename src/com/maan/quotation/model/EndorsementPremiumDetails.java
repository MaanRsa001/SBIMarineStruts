package com.maan.quotation.model;

import com.google.gson.annotations.SerializedName;

public class EndorsementPremiumDetails {
	
	@SerializedName("AfterEndorsement")
	private PremiumDetails afterEndorsement;
	@SerializedName("BeforeEndorsement")
	private PremiumDetails beforeEndorsement;
	@SerializedName("Difference")
	private PremiumDetails difference;
	
	
	public PremiumDetails getAfterEndorsement() {
		return afterEndorsement;
	}
	public void setAfterEndorsement(PremiumDetails afterEndorsement) {
		this.afterEndorsement = afterEndorsement;
	}
	public PremiumDetails getBeforeEndorsement() {
		return beforeEndorsement;
	}
	public void setBeforeEndorsement(PremiumDetails beforeEndorsement) {
		this.beforeEndorsement = beforeEndorsement;
	}
	public PremiumDetails getDifference() {
		return difference;
	}
	public void setDifference(PremiumDetails difference) {
		this.difference = difference;
	}

}
