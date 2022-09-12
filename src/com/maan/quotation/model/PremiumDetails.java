package com.maan.quotation.model;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.google.gson.annotations.SerializedName;

public class PremiumDetails {
	

    public double getTotalInsuredValue() {
		return totalInsuredValue;
	}
	public void setTotalInsuredValue(double totalInsuredValue) {
		this.totalInsuredValue = totalInsuredValue;
	}
	public double getEquivalentInsuredValue() {
		return equivalentInsuredValue;
	}
	public void setEquivalentInsuredValue(double equivalentInsuredValue) {
		this.equivalentInsuredValue = equivalentInsuredValue;
	}
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
    
    @SerializedName("IMPORT_PREMIUM")
	private Double importPremium;
	@SerializedName("TOTAL_IMPORT_DUTY")
	private Double totalImportDuty;
	  
	@SerializedName("GSTFLAG")
	private String gstflag;
	@SerializedName("STAMP_DUTY")
	private Double stampduty;
	@SerializedName("GSTTYPE")
	private Double gsttype;
	@SerializedName("CGST")
	private Double cgst;
	@SerializedName("SGST")
	private Double sgst;
	@SerializedName("IGST")
	private Double igst;
	@SerializedName("UTGST")
	private Double utgst;
	@SerializedName("CGST_RATE")
	private Double cgstRate;
	@SerializedName("SGST_RATE")
	private Double sgstRate;
	@SerializedName("IGST_RATE")
	private Double igstRate;
	@SerializedName("UTGST_RATE")
	private Double utgstRate;
    
	@SerializedName("TotalInsuredValue") 
	private double totalInsuredValue;
	@SerializedName("EquivalentInsuredValue") 
    private double equivalentInsuredValue;
	
	public Double getImportPremium() {
		return importPremium;
	}
	public void setImportPremium(Double importPremium) {
		this.importPremium = importPremium;
	}
	public Double getTotalImportDuty() {
		return totalImportDuty;
	}
	public void setTotalImportDuty(Double totalImportDuty) {
		this.totalImportDuty = totalImportDuty;
	}
	public String getGstflag() {
		return gstflag;
	}
	public void setGstflag(String gstflag) {
		this.gstflag = gstflag;
	}
	public Double getStampduty() {
		return stampduty;
	}
	public void setStampduty(Double stampduty) {
		this.stampduty = stampduty;
	}
	public Double getGsttype() {
		return gsttype;
	}
	public void setGsttype(Double gsttype) {
		this.gsttype = gsttype;
	}
	public Double getCgst() {
		return cgst;
	}
	public void setCgst(Double cgst) {
		this.cgst = cgst;
	}
	public Double getSgst() {
		return sgst;
	}
	public void setSgst(Double sgst) {
		this.sgst = sgst;
	}
	public Double getIgst() {
		return igst;
	}
	public void setIgst(Double igst) {
		this.igst = igst;
	}
	public Double getUtgst() {
		return utgst;
	}
	public void setUtgst(Double utgst) {
		this.utgst = utgst;
	}
	public Double getCgstRate() {
		return cgstRate;
	}
	public void setCgstRate(Double cgstRate) {
		this.cgstRate = cgstRate;
	}
	public Double getSgstRate() {
		return sgstRate;
	}
	public void setSgstRate(Double sgstRate) {
		this.sgstRate = sgstRate;
	}
	public Double getIgstRate() {
		return igstRate;
	}
	public void setIgstRate(Double igstRate) {
		this.igstRate = igstRate;
	}
	public Double getUtgstRate() {
		return utgstRate;
	}
	public void setUtgstRate(Double utgstRate) {
		this.utgstRate = utgstRate;
	}
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
