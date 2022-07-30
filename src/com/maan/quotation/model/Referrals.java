package com.maan.quotation.model;

import com.google.gson.annotations.SerializedName;

public class Referrals {
	
    @SerializedName("ReferralCode") 
    private String referralCode;
    @SerializedName("ReferralName") 
    private String referralName;
    
	/**
	 * @return the referralCode
	 */
	public String getReferralCode() {
		return referralCode;
	}
	/**
	 * @param referralCode the referralCode to set
	 */
	public void setReferralCode(String referralCode) {
		this.referralCode = referralCode;
	}
	/**
	 * @return the referralName
	 */
	public String getReferralName() {
		return referralName;
	}
	/**
	 * @param referralName the referralName to set
	 */
	public void setReferralName(String referralName) {
		this.referralName = referralName;
	}

}
