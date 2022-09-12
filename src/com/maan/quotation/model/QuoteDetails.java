package com.maan.quotation.model;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.google.gson.annotations.SerializedName;
 

public class QuoteDetails{
    @SerializedName("TransportDetails") 
    private TransportDetails transportDetails;
    @SerializedName("CommodityDetails") 
    private List<CommodityDetail> commodityDetails;
    @SerializedName("VesselDetails") 
    private VesselDetails vesselDetails;
    @SerializedName("InceptionDate") 
    private String inceptionDate;
    @SerializedName("ExpiryDate") 
    private String expiryDate;
    @SerializedName("CurrencyCode") 
    private String currencyCode;
    @SerializedName("CurrencyName") 
    private String currencyName;
    @SerializedName("CurrencyValue") 
    private String currencyValue;
    @SerializedName("WarAndSrccYn") 
    private String warAndSrccYn;
    @SerializedName("IncoTerms") 
    private String incoTerms;
    @SerializedName("IncoTermsDescription") 
    private String incoTermsDescription;
    @SerializedName("Percentage") 
    private String percentage;
    @SerializedName("Tolerance") 
    private String tolerance;
    @SerializedName("SettlingAgentCode") 
    private String settlingAgentCode;
    @SerializedName("SettlingAgentName") 
    private String settlingAgentName;
    @SerializedName("SettlingAgentOthers") 
    private String settlingAgentOthers;
    @SerializedName("PackageCode") 
    private String packageCode;
    @SerializedName("PackageName") 
    private String packageName;
    @SerializedName("VoyageNo") 
    private String voyageNo;
    @SerializedName("WarOnLandYn") 
    private String warOnLandYn;
    @SerializedName("PartialShipmentCode") 
    private String partialShipmentCode;
    @SerializedName("PartialShipmentName") 
    private String partialShipmentName;
    @SerializedName("ExposureOfShipment") 
    private String exposureOfShipment;
    @SerializedName("CurrencyOfExposureCode") 
    private String currencyOfExposureCode;
    @SerializedName("CurrencyOfExposureName") 
    private String currencyOfExposureName;
    @SerializedName("CurrencyOfExposureValue") 
    private String currencyOfExposureValue;
    @SerializedName("QuoteStatus") 
    private String quoteStatus;
    @SerializedName("FinalizeYn")
	private String finalizeYn;

    @SerializedName("QuoteNo") 
    private String quoteNo;


		/**
	 * @return the transportDetails
	 */
	public TransportDetails getTransportDetails() {
		return transportDetails;
	}



	/**
	 * @param transportDetails the transportDetails to set
	 */
	public void setTransportDetails(TransportDetails transportDetails) {
		this.transportDetails = transportDetails;
	}



	/**
	 * @return the commodityDetails
	 */
	public List<CommodityDetail> getCommodityDetails() {
		return commodityDetails;
	}



	/**
	 * @param commodityDetails the commodityDetails to set
	 */
	public void setCommodityDetails(List<CommodityDetail> commodityDetails) {
		this.commodityDetails = commodityDetails;
	}



	/**
	 * @return the vesselDetails
	 */
	public VesselDetails getVesselDetails() {
		return vesselDetails;
	}



	/**
	 * @param vesselDetails the vesselDetails to set
	 */
	public void setVesselDetails(VesselDetails vesselDetails) {
		this.vesselDetails = vesselDetails;
	}



	/**
	 * @return the inceptionDate
	 */
	public String getInceptionDate() {
		return inceptionDate;
	}



	/**
	 * @param inceptionDate the inceptionDate to set
	 */
	public void setInceptionDate(String inceptionDate) {
		this.inceptionDate = inceptionDate;
	}



	/**
	 * @return the expiryDate
	 */
	public String getExpiryDate() {
		return expiryDate;
	}



	/**
	 * @param expiryDate the expiryDate to set
	 */
	public void setExpiryDate(String expiryDate) {
		this.expiryDate = expiryDate;
	}



	/**
	 * @return the currencyCode
	 */
	public String getCurrencyCode() {
		return currencyCode;
	}



	/**
	 * @param currencyCode the currencyCode to set
	 */
	public void setCurrencyCode(String currencyCode) {
		this.currencyCode = currencyCode;
	}



	/**
	 * @return the currencyName
	 */
	public String getCurrencyName() {
		return currencyName;
	}



	/**
	 * @param currencyName the currencyName to set
	 */
	public void setCurrencyName(String currencyName) {
		this.currencyName = currencyName;
	}



	/**
	 * @return the currencyValue
	 */
	public String getCurrencyValue() {
		return currencyValue;
	}



	/**
	 * @param currencyValue the currencyValue to set
	 */
	public void setCurrencyValue(String currencyValue) {
		this.currencyValue = currencyValue;
	}



	/**
	 * @return the warAndSrccYn
	 */
	public String getWarAndSrccYn() {
		return warAndSrccYn;
	}



	/**
	 * @param warAndSrccYn the warAndSrccYn to set
	 */
	public void setWarAndSrccYn(String warAndSrccYn) {
		this.warAndSrccYn = warAndSrccYn;
	}



	/**
	 * @return the incoTerms
	 */
	public String getIncoTerms() {
		return incoTerms;
	}



	/**
	 * @param incoTerms the incoTerms to set
	 */
	public void setIncoTerms(String incoTerms) {
		this.incoTerms = incoTerms;
	}



	/**
	 * @return the incoTermsDescription
	 */
	public String getIncoTermsDescription() {
		return incoTermsDescription;
	}



	/**
	 * @param incoTermsDescription the incoTermsDescription to set
	 */
	public void setIncoTermsDescription(String incoTermsDescription) {
		this.incoTermsDescription = incoTermsDescription;
	}



	/**
	 * @return the percentage
	 */
	public String getPercentage() {
		return percentage;
	}



	/**
	 * @param percentage the percentage to set
	 */
	public void setPercentage(String percentage) {
		this.percentage = percentage;
	}



	/**
	 * @return the tolerance
	 */
	public String getTolerance() {
		return tolerance;
	}



	/**
	 * @param tolerance the tolerance to set
	 */
	public void setTolerance(String tolerance) {
		this.tolerance = tolerance;
	}



	/**
	 * @return the settlingAgentCode
	 */
	public String getSettlingAgentCode() {
		return settlingAgentCode;
	}



	/**
	 * @param settlingAgentCode the settlingAgentCode to set
	 */
	public void setSettlingAgentCode(String settlingAgentCode) {
		this.settlingAgentCode = settlingAgentCode;
	}



	/**
	 * @return the settlingAgentName
	 */
	public String getSettlingAgentName() {
		return settlingAgentName;
	}



	/**
	 * @param settlingAgentName the settlingAgentName to set
	 */
	public void setSettlingAgentName(String settlingAgentName) {
		this.settlingAgentName = settlingAgentName;
	}



	/**
	 * @return the settlingAgentOthers
	 */
	public String getSettlingAgentOthers() {
		return settlingAgentOthers;
	}



	/**
	 * @param settlingAgentOthers the settlingAgentOthers to set
	 */
	public void setSettlingAgentOthers(String settlingAgentOthers) {
		this.settlingAgentOthers = settlingAgentOthers;
	}



	/**
	 * @return the packageCode
	 */
	public String getPackageCode() {
		return packageCode;
	}



	/**
	 * @param packageCode the packageCode to set
	 */
	public void setPackageCode(String packageCode) {
		this.packageCode = packageCode;
	}



	/**
	 * @return the packageName
	 */
	public String getPackageName() {
		return packageName;
	}



	/**
	 * @param packageName the packageName to set
	 */
	public void setPackageName(String packageName) {
		this.packageName = packageName;
	}



	/**
	 * @return the voyageNo
	 */
	public String getVoyageNo() {
		return voyageNo;
	}



	/**
	 * @param voyageNo the voyageNo to set
	 */
	public void setVoyageNo(String voyageNo) {
		this.voyageNo = voyageNo;
	}



	/**
	 * @return the warOnLandYn
	 */
	public String getWarOnLandYn() {
		return warOnLandYn;
	}



	/**
	 * @param warOnLandYn the warOnLandYn to set
	 */
	public void setWarOnLandYn(String warOnLandYn) {
		this.warOnLandYn = warOnLandYn;
	}



	/**
	 * @return the partialShipmentCode
	 */
	public String getPartialShipmentCode() {
		return partialShipmentCode;
	}



	/**
	 * @param partialShipmentCode the partialShipmentCode to set
	 */
	public void setPartialShipmentCode(String partialShipmentCode) {
		this.partialShipmentCode = partialShipmentCode;
	}



	/**
	 * @return the partialShipmentName
	 */
	public String getPartialShipmentName() {
		return partialShipmentName;
	}



	/**
	 * @param partialShipmentName the partialShipmentName to set
	 */
	public void setPartialShipmentName(String partialShipmentName) {
		this.partialShipmentName = partialShipmentName;
	}



	/**
	 * @return the exposureOfShipment
	 */
	public String getExposureOfShipment() {
		return exposureOfShipment;
	}



	/**
	 * @param exposureOfShipment the exposureOfShipment to set
	 */
	public void setExposureOfShipment(String exposureOfShipment) {
		this.exposureOfShipment = exposureOfShipment;
	}



	/**
	 * @return the currencyOfExposureCode
	 */
	public String getCurrencyOfExposureCode() {
		return currencyOfExposureCode;
	}



	/**
	 * @param currencyOfExposureCode the currencyOfExposureCode to set
	 */
	public void setCurrencyOfExposureCode(String currencyOfExposureCode) {
		this.currencyOfExposureCode = currencyOfExposureCode;
	}



	/**
	 * @return the currencyOfExposureName
	 */
	public String getCurrencyOfExposureName() {
		return currencyOfExposureName;
	}



	/**
	 * @param currencyOfExposureName the currencyOfExposureName to set
	 */
	public void setCurrencyOfExposureName(String currencyOfExposureName) {
		this.currencyOfExposureName = currencyOfExposureName;
	}



	/**
	 * @return the currencyOfExposureValue
	 */
	public String getCurrencyOfExposureValue() {
		return currencyOfExposureValue;
	}



	/**
	 * @param currencyOfExposureValue the currencyOfExposureValue to set
	 */
	public void setCurrencyOfExposureValue(String currencyOfExposureValue) {
		this.currencyOfExposureValue = currencyOfExposureValue;
	}



	/**
	 * @return the quoteNo
	 */
	public String getQuoteNo() {
		return quoteNo;
	}



	/**
	 * @param quoteNo the quoteNo to set
	 */
	public void setQuoteNo(String quoteNo) {
		this.quoteNo = quoteNo;
	}



	public String getQuoteStatus() {
		return quoteStatus;
	}



	public void setQuoteStatus(String quoteStatus) {
		this.quoteStatus = quoteStatus;
	}



	public String getFinalizeYn() {
		return finalizeYn;
	}



	public void setFinalizeYn(String finalizeYn) {
		this.finalizeYn = finalizeYn;
	}
	
}
