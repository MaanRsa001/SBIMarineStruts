package com.maan.quotation.model;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.google.gson.annotations.SerializedName;

public class CommodityDetail{
    @SerializedName("GoodsCategoryCode") 
    private String goodsCategoryCode;
    @SerializedName("GoodsCategoryName") 
    private String goodsCategoryName;
    @SerializedName("GoodsCategoryDescription") 
    private String goodsCategoryDescription;
    @SerializedName("InsuredValue") 
    private double insuredValue;
    @SerializedName("InvoiceNo") 
    private String invoiceNo;
    @SerializedName("InvoiceDate") 
    private String invoiceDate;
    @SerializedName("PoDescription") 
    private String poDescription;
    @SerializedName("ConsignedFrom") 
    private String consignedFrom;
    @SerializedName("ConsignedTo") 
    private String consignedTo;
    @SerializedName("Fragile") 
    private String fragile;
    

    @SerializedName("MarginRate") 
    private double marginRate;
    @SerializedName("MarineWarRate") 
    private double marineWarRate;
    @SerializedName("PolicyExcess") 
    private double policyExcess;
    @SerializedName("PolicyExcessDescription") 
    private String policyExcessDescription;
    @SerializedName("PolicyExcessPercentage") 
    private double policyExcessPercentage;
    @SerializedName("Rate") 
    private double rate;
    @SerializedName("WarRate") 
    private double warRate;
    @SerializedName("WarlandRate") 
    private double warlandRate;
    @SerializedName("ImportDutySumInsured")
	private String importDutySumInsured;
    
    @SerializedName("ImportDutyRate")
	private String importDutyRate;
    @SerializedName("ImportDutyPremium")
	private String importDutyPremium;
    @SerializedName("Rag")
	private String rag;
    @SerializedName("IdentificationNo")
    private String identificationnos;
    
	public String getImportDutyRate() {
		return importDutyRate;
	}
	public void setImportDutyRate(String importDutyRate) {
		this.importDutyRate = importDutyRate;
	}
	public String getImportDutyPremium() {
		return importDutyPremium;
	}
	public void setImportDutyPremium(String importDutyPremium) {
		this.importDutyPremium = importDutyPremium;
	}
	public String getRag() {
		return rag;
	}
	public void setRag(String rag) {
		this.rag = rag;
	}
	/**
	 * @return the insuredValue
	 */
	public double getInsuredValue() {
		return insuredValue;
	}
	/**
	 * @param insuredValue the insuredValue to set
	 */
	public void setInsuredValue(double insuredValue) {
		this.insuredValue = insuredValue;
	}
	/**
	 * @return the policyExcessDescription
	 */
	public String getPolicyExcessDescription() {
		return policyExcessDescription;
	}
	/**
	 * @param policyExcessDescription the policyExcessDescription to set
	 */
	public void setPolicyExcessDescription(String policyExcessDescription) {
		this.policyExcessDescription = policyExcessDescription;
	}
	/**
	 * @return the goodsCategoryCode
	 */
	public String getGoodsCategoryCode() {
		return goodsCategoryCode;
	}
	/**
	 * @param goodsCategoryCode the goodsCategoryCode to set
	 */
	public void setGoodsCategoryCode(String goodsCategoryCode) {
		this.goodsCategoryCode = goodsCategoryCode;
	}
	/**
	 * @return the goodsCategoryName
	 */
	public String getGoodsCategoryName() {
		return goodsCategoryName;
	}
	/**
	 * @param goodsCategoryName the goodsCategoryName to set
	 */
	public void setGoodsCategoryName(String goodsCategoryName) {
		this.goodsCategoryName = goodsCategoryName;
	}
	/**
	 * @return the goodsCategoryDescription
	 */
	public String getGoodsCategoryDescription() {
		return goodsCategoryDescription;
	}
	/**
	 * @param goodsCategoryDescription the goodsCategoryDescription to set
	 */
	public void setGoodsCategoryDescription(String goodsCategoryDescription) {
		this.goodsCategoryDescription = goodsCategoryDescription;
	}
	/**
	 * @return the invoiceNo
	 */
	public String getInvoiceNo() {
		return invoiceNo;
	}
	/**
	 * @param invoiceNo the invoiceNo to set
	 */
	public void setInvoiceNo(String invoiceNo) {
		this.invoiceNo = invoiceNo;
	}
	/**
	 * @return the invoiceDate
	 */
	public String getInvoiceDate() {
		return invoiceDate;
	}
	/**
	 * @param invoiceDate the invoiceDate to set
	 */
	public void setInvoiceDate(String invoiceDate) {
		this.invoiceDate = invoiceDate;
	}
	/**
	 * @return the poDescription
	 */
	public String getPoDescription() {
		return poDescription;
	}
	/**
	 * @param poDescription the poDescription to set
	 */
	public void setPoDescription(String poDescription) {
		this.poDescription = poDescription;
	}
	/**
	 * @return the consignedFrom
	 */
	public String getConsignedFrom() {
		return consignedFrom;
	}
	/**
	 * @param consignedFrom the consignedFrom to set
	 */
	public void setConsignedFrom(String consignedFrom) {
		this.consignedFrom = consignedFrom;
	}
	/**
	 * @return the consignedTo
	 */
	public String getConsignedTo() {
		return consignedTo;
	}
	/**
	 * @param consignedTo the consignedTo to set
	 */
	public void setConsignedTo(String consignedTo) {
		this.consignedTo = consignedTo;
	}
	/**
	 * @return the fragile
	 */
	public String getFragile() {
		return fragile;
	}
	/**
	 * @param fragile the fragile to set
	 */
	public void setFragile(String fragile) {
		this.fragile = fragile;
	}
	/**
	 * @return the marginRate
	 */
	public double getMarginRate() {
		return marginRate;
	}
	/**
	 * @param marginRate the marginRate to set
	 */
	public void setMarginRate(double marginRate) {
		this.marginRate = marginRate;
	}
	/**
	 * @return the marineWarRate
	 */
	public double getMarineWarRate() {
		return marineWarRate;
	}
	/**
	 * @param marineWarRate the marineWarRate to set
	 */
	public void setMarineWarRate(double marineWarRate) {
		this.marineWarRate = marineWarRate;
	}
	/**
	 * @return the policyExcess
	 */
	public double getPolicyExcess() {
		return policyExcess;
	}
	/**
	 * @param policyExcess the policyExcess to set
	 */
	public void setPolicyExcess(double policyExcess) {
		this.policyExcess = policyExcess;
	}
	/**
	 * @return the policyExcessPercentage
	 */
	public double getPolicyExcessPercentage() {
		return policyExcessPercentage;
	}
	/**
	 * @param policyExcessPercentage the policyExcessPercentage to set
	 */
	public void setPolicyExcessPercentage(double policyExcessPercentage) {
		this.policyExcessPercentage = policyExcessPercentage;
	}
	/**
	 * @return the rate
	 */
	public double getRate() {
		return rate;
	}
	/**
	 * @param rate the rate to set
	 */
	public void setRate(double rate) {
		this.rate = rate;
	}
	/**
	 * @return the warRate
	 */
	public double getWarRate() {
		return warRate;
	}
	/**
	 * @param warRate the warRate to set
	 */
	public void setWarRate(double warRate) {
		this.warRate = warRate;
	}
	/**
	 * @return the warlandRate
	 */
	public double getWarlandRate() {
		return warlandRate;
	}
	/**
	 * @param warlandRate the warlandRate to set
	 */
	public void setWarlandRate(double warlandRate) {
		this.warlandRate = warlandRate;
	}
	public String getImportDutySumInsured() {
		return importDutySumInsured;
	}
	public void setImportDutySumInsured(String importDutySumInsured) {
		this.importDutySumInsured = importDutySumInsured;
	}
	public String getIdentificationnos() {
		return identificationnos;
	}
	public void setIdentificationnos(String identificationnos) {
		this.identificationnos = identificationnos;
	}
}