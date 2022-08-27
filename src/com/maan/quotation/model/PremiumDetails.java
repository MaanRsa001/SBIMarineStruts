package com.maan.quotation.model;

import com.google.gson.annotations.SerializedName;

public class PremiumDetails {
	

    @SerializedName("AdditionalPremium") 
    private String additionalPremium;
    @SerializedName("DiscountPremium") 
    private double discountPremium;
    @SerializedName("ExcessSign") 
    private String excessSign;
    @SerializedName("ExcessPremium") 
    private double excessPremium;
    @SerializedName("GovernmentTax") 
    private double governmentTax;
    @SerializedName("InspectionFee") 
    private double inspectionFee;
    @SerializedName("MarginPremium") 
    private double marginPremium;
    @SerializedName("MarinePremium") 
    private double marinePremium;
    @SerializedName("NetPremium") 
    private double netPremium;
    @SerializedName("PolicyFeeYn") 
    private String policyFeeYn;
    @SerializedName("PolicyFee") 
    private String policyFee;
    @SerializedName("PolicyIssunceFee") 
    private double policyIssunceFee;
    @SerializedName("PremiumWithoutTax") 
    private double premiumWithoutTax;
    @SerializedName("TotalPremium") 
    private double totalPremium;
    @SerializedName("VatTaxAmount") 
    private double vatTaxAmount;
    @SerializedName("VatTaxPercentage") 
    private double vatTaxPercentage;
    @SerializedName("WarPremium") 
    private double warPremium;
    @SerializedName("WarLandPremium") 
    private double warlandPremium;
    @SerializedName("TotalWarPremium") 
    private double totalWarPremium;
    @SerializedName("VatTax") 
    private double vatTax;
    
	/**
	 * @return the additionalPremium
	 */
	public String getAdditionalPremium() {
		return additionalPremium;
	}
	/**
	 * @param additionalPremium the additionalPremium to set
	 */
	public void setAdditionalPremium(String additionalPremium) {
		this.additionalPremium = additionalPremium;
	}
	/**
	 * @return the discountPremium
	 */
	public double getDiscountPremium() {
		return discountPremium;
	}
	/**
	 * @param discountPremium the discountPremium to set
	 */
	public void setDiscountPremium(double discountPremium) {
		this.discountPremium = discountPremium;
	}
	
	/**
	 * @return the excessSign
	 */
	public String getExcessSign() {
		return excessSign;
	}
	/**
	 * @param excessSign the excessSign to set
	 */
	public void setExcessSign(String excessSign) {
		this.excessSign = excessSign;
	}
	/**
	 * @return the governmentTax
	 */
	public double getGovernmentTax() {
		return governmentTax;
	}
	/**
	 * @param governmentTax the governmentTax to set
	 */
	public void setGovernmentTax(double governmentTax) {
		this.governmentTax = governmentTax;
	}
	/**
	 * @return the inspectionFee
	 */
	public double getInspectionFee() {
		return inspectionFee;
	}
	/**
	 * @param inspectionFee the inspectionFee to set
	 */
	public void setInspectionFee(double inspectionFee) {
		this.inspectionFee = inspectionFee;
	}
	/**
	 * @return the marginPremium
	 */
	public double getMarginPremium() {
		return marginPremium;
	}
	/**
	 * @param marginPremium the marginPremium to set
	 */
	public void setMarginPremium(double marginPremium) {
		this.marginPremium = marginPremium;
	}
	/**
	 * @return the marinePremium
	 */
	public double getMarinePremium() {
		return marinePremium;
	}
	/**
	 * @param marinePremium the marinePremium to set
	 */
	public void setMarinePremium(double marinePremium) {
		this.marinePremium = marinePremium;
	}
	/**
	 * @return the netPremium
	 */
	public double getNetPremium() {
		return netPremium;
	}
	/**
	 * @param netPremium the netPremium to set
	 */
	public void setNetPremium(double netPremium) {
		this.netPremium = netPremium;
	}
	/**
	 * @return the policyFeeYn
	 */
	public String getPolicyFeeYn() {
		return policyFeeYn;
	}
	/**
	 * @param policyFeeYn the policyFeeYn to set
	 */
	public void setPolicyFeeYn(String policyFeeYn) {
		this.policyFeeYn = policyFeeYn;
	}
	/**
	 * @return the policyIssunceFee
	 */
	public double getPolicyIssunceFee() {
		return policyIssunceFee;
	}
	/**
	 * @param policyIssunceFee the policyIssunceFee to set
	 */
	public void setPolicyIssunceFee(double policyIssunceFee) {
		this.policyIssunceFee = policyIssunceFee;
	}
	/**
	 * @return the premiumWithoutTax
	 */
	public double getPremiumWithoutTax() {
		return premiumWithoutTax;
	}
	/**
	 * @param premiumWithoutTax the premiumWithoutTax to set
	 */
	public void setPremiumWithoutTax(double premiumWithoutTax) {
		this.premiumWithoutTax = premiumWithoutTax;
	}
	/**
	 * @return the totalPremium
	 */
	public double getTotalPremium() {
		return totalPremium;
	}
	/**
	 * @param totalPremium the totalPremium to set
	 */
	public void setTotalPremium(double totalPremium) {
		this.totalPremium = totalPremium;
	}
	/**
	 * @return the vatTaxAmount
	 */
	public double getVatTaxAmount() {
		return vatTaxAmount;
	}
	/**
	 * @param vatTaxAmount the vatTaxAmount to set
	 */
	public void setVatTaxAmount(double vatTaxAmount) {
		this.vatTaxAmount = vatTaxAmount;
	}
	/**
	 * @return the vatTaxPercentage
	 */
	public double getVatTaxPercentage() {
		return vatTaxPercentage;
	}
	/**
	 * @param vatTaxPercentage the vatTaxPercentage to set
	 */
	public void setVatTaxPercentage(double vatTaxPercentage) {
		this.vatTaxPercentage = vatTaxPercentage;
	}
	/**
	 * @return the warPremium
	 */
	public double getWarPremium() {
		return warPremium;
	}
	/**
	 * @param warPremium the warPremium to set
	 */
	public void setWarPremium(double warPremium) {
		this.warPremium = warPremium;
	}
	/**
	 * @return the warlandPremium
	 */
	public double getWarlandPremium() {
		return warlandPremium;
	}
	/**
	 * @param warlandPremium the warlandPremium to set
	 */
	public void setWarlandPremium(double warlandPremium) {
		this.warlandPremium = warlandPremium;
	}
	public double getTotalWarPremium() {
		return totalWarPremium;
	}
	public void setTotalWarPremium(double totalWarPremium) {
		this.totalWarPremium = totalWarPremium;
	}
	public double getVatTax() {
		return vatTax;
	}
	public void setVatTax(double vatTax) {
		this.vatTax = vatTax;
	}
	public String getPolicyFee() {
		return policyFee;
	}
	public void setPolicyFee(String policyFee) {
		this.policyFee = policyFee;
	}
	public double getExcessPremium() {
		return excessPremium;
	}
	public void setExcessPremium(double excessPremium) {
		this.excessPremium = excessPremium;
	}

}
