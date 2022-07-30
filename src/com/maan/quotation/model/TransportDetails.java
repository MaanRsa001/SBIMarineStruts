package com.maan.quotation.model;

import com.google.gson.annotations.SerializedName;

public class TransportDetails{
    @SerializedName("ModeOfTansportCode") 
    private String modeOfTansportCode;
    @SerializedName("ModeOfTransportName") 
    private String modeOfTransportName;
    @SerializedName("CoverCode") 
    private String coverCode;
    @SerializedName("CoverName") 
    private String coverName;
    @SerializedName("ModeOfCarriageCode") 
    private String modeOfCarriageCode;
    @SerializedName("ModeOfCarriageName") 
    private String modeOfCarriageName;
    @SerializedName("OriginCountryCode") 
    private String originCountryCode;
    @SerializedName("OriginCountryName") 
    private String originCountryName;
    @SerializedName("OriginCityCode") 
    private String originCityCode;
    @SerializedName("OriginCityName") 
    private String originCityName;
    @SerializedName("OriginWarehouseYn") 
    private String originWarehouseYn;
    @SerializedName("DestinationCountryCode") 
    private String destinationCountryCode;
    @SerializedName("DestinationCountryName") 
    private String destinationCountryName;
    @SerializedName("DestinationCityCode") 
    private String destinationCityCode;
    @SerializedName("DestinationCityName") 
    private String destinationCityName;
    @SerializedName("DestinationWarehouseYn") 
    private String destinationWarehouseYn;
    @SerializedName("Via") 
    private String via;
	/**
	 * @return the modeOfTansportCode
	 */
	public String getModeOfTansportCode() {
		return modeOfTansportCode;
	}
	/**
	 * @param modeOfTansportCode the modeOfTansportCode to set
	 */
	public void setModeOfTansportCode(String modeOfTansportCode) {
		this.modeOfTansportCode = modeOfTansportCode;
	}
	/**
	 * @return the modeOfTransportName
	 */
	public String getModeOfTransportName() {
		return modeOfTransportName;
	}
	/**
	 * @param modeOfTransportName the modeOfTransportName to set
	 */
	public void setModeOfTransportName(String modeOfTransportName) {
		this.modeOfTransportName = modeOfTransportName;
	}
	/**
	 * @return the coverCode
	 */
	public String getCoverCode() {
		return coverCode;
	}
	/**
	 * @param coverCode the coverCode to set
	 */
	public void setCoverCode(String coverCode) {
		this.coverCode = coverCode;
	}
	/**
	 * @return the coverName
	 */
	public String getCoverName() {
		return coverName;
	}
	/**
	 * @param coverName the coverName to set
	 */
	public void setCoverName(String coverName) {
		this.coverName = coverName;
	}
	/**
	 * @return the modeOfCarriageCode
	 */
	public String getModeOfCarriageCode() {
		return modeOfCarriageCode;
	}
	/**
	 * @param modeOfCarriageCode the modeOfCarriageCode to set
	 */
	public void setModeOfCarriageCode(String modeOfCarriageCode) {
		this.modeOfCarriageCode = modeOfCarriageCode;
	}
	/**
	 * @return the modeOfCarriageName
	 */
	public String getModeOfCarriageName() {
		return modeOfCarriageName;
	}
	/**
	 * @param modeOfCarriageName the modeOfCarriageName to set
	 */
	public void setModeOfCarriageName(String modeOfCarriageName) {
		this.modeOfCarriageName = modeOfCarriageName;
	}
	/**
	 * @return the originCountryCode
	 */
	public String getOriginCountryCode() {
		return originCountryCode;
	}
	/**
	 * @param originCountryCode the originCountryCode to set
	 */
	public void setOriginCountryCode(String originCountryCode) {
		this.originCountryCode = originCountryCode;
	}
	/**
	 * @return the originCountryName
	 */
	public String getOriginCountryName() {
		return originCountryName;
	}
	/**
	 * @param originCountryName the originCountryName to set
	 */
	public void setOriginCountryName(String originCountryName) {
		this.originCountryName = originCountryName;
	}
	/**
	 * @return the originCityCode
	 */
	public String getOriginCityCode() {
		return originCityCode;
	}
	/**
	 * @param originCityCode the originCityCode to set
	 */
	public void setOriginCityCode(String originCityCode) {
		this.originCityCode = originCityCode;
	}
	/**
	 * @return the originCityName
	 */
	public String getOriginCityName() {
		return originCityName;
	}
	/**
	 * @param originCityName the originCityName to set
	 */
	public void setOriginCityName(String originCityName) {
		this.originCityName = originCityName;
	}
	/**
	 * @return the originWarehouseYn
	 */
	public String getOriginWarehouseYn() {
		return originWarehouseYn;
	}
	/**
	 * @param originWarehouseYn the originWarehouseYn to set
	 */
	public void setOriginWarehouseYn(String originWarehouseYn) {
		this.originWarehouseYn = originWarehouseYn;
	}
	/**
	 * @return the destinationCountryCode
	 */
	public String getDestinationCountryCode() {
		return destinationCountryCode;
	}
	/**
	 * @param destinationCountryCode the destinationCountryCode to set
	 */
	public void setDestinationCountryCode(String destinationCountryCode) {
		this.destinationCountryCode = destinationCountryCode;
	}
	/**
	 * @return the destinationCountryName
	 */
	public String getDestinationCountryName() {
		return destinationCountryName;
	}
	/**
	 * @param destinationCountryName the destinationCountryName to set
	 */
	public void setDestinationCountryName(String destinationCountryName) {
		this.destinationCountryName = destinationCountryName;
	}
	/**
	 * @return the destinationCityCode
	 */
	public String getDestinationCityCode() {
		return destinationCityCode;
	}
	/**
	 * @param destinationCityCode the destinationCityCode to set
	 */
	public void setDestinationCityCode(String destinationCityCode) {
		this.destinationCityCode = destinationCityCode;
	}
	/**
	 * @return the destinationCityName
	 */
	public String getDestinationCityName() {
		return destinationCityName;
	}
	/**
	 * @param destinationCityName the destinationCityName to set
	 */
	public void setDestinationCityName(String destinationCityName) {
		this.destinationCityName = destinationCityName;
	}
	/**
	 * @return the destinationWarehouseYn
	 */
	public String getDestinationWarehouseYn() {
		return destinationWarehouseYn;
	}
	/**
	 * @param destinationWarehouseYn the destinationWarehouseYn to set
	 */
	public void setDestinationWarehouseYn(String destinationWarehouseYn) {
		this.destinationWarehouseYn = destinationWarehouseYn;
	}
	/**
	 * @return the via
	 */
	public String getVia() {
		return via;
	}
	/**
	 * @param via the via to set
	 */
	public void setVia(String via) {
		this.via = via;
	}
}
