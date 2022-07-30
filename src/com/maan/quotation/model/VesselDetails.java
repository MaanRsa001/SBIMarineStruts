package com.maan.quotation.model;

import com.google.gson.annotations.SerializedName;

public class VesselDetails{
    @SerializedName("VesselCode") 
    private String vesselCode;
    @SerializedName("VesselName") 
    private String vesselName;
    @SerializedName("VesselType") 
    private String vesselType;
    @SerializedName("VesselClass") 
    private String vesselClass;
    @SerializedName("ManufactureYear") 
    private String manufactureYear;
    @SerializedName("VesselDeclareYN") 
    private String vesselDeclareYN;
    @SerializedName("ImoNumber") 
    private String imoNumber;
    @SerializedName("VesselSearchBy")
    private String vesselSearchBy;
    @SerializedName("IHSLRORIMO") 
    private String iHSLRORIMO;
    @SerializedName("ShipsCategory") 
    private String shipsCategory;
    @SerializedName("NameString") 
    private String nameString;
    @SerializedName("exshipsCategory") 
    private String ExshipsCategory;
    @SerializedName("exNameString") 
    private String ExNameString;
	/**
	 * @return the vesselCode
	 */
	public String getVesselCode() {
		return vesselCode;
	}
	/**
	 * @param vesselCode the vesselCode to set
	 */
	public void setVesselCode(String vesselCode) {
		this.vesselCode = vesselCode;
	}
	/**
	 * @return the vesselName
	 */
	public String getVesselName() {
		return vesselName;
	}
	/**
	 * @param vesselName the vesselName to set
	 */
	public void setVesselName(String vesselName) {
		this.vesselName = vesselName;
	}
	/**
	 * @return the vesselType
	 */
	public String getVesselType() {
		return vesselType;
	}
	/**
	 * @param vesselType the vesselType to set
	 */
	public void setVesselType(String vesselType) {
		this.vesselType = vesselType;
	}
	/**
	 * @return the vesselClass
	 */
	public String getVesselClass() {
		return vesselClass;
	}
	/**
	 * @param vesselClass the vesselClass to set
	 */
	public void setVesselClass(String vesselClass) {
		this.vesselClass = vesselClass;
	}
	/**
	 * @return the manufactureYear
	 */
	public String getManufactureYear() {
		return manufactureYear;
	}
	/**
	 * @param manufactureYear the manufactureYear to set
	 */
	public void setManufactureYear(String manufactureYear) {
		this.manufactureYear = manufactureYear;
	}
	
	/**
	 * @return the vesselDeclareYN
	 */
	public String getVesselDeclareYN() {
		return vesselDeclareYN;
	}
	/**
	 * @param vesselDeclareYN the vesselDeclareYN to set
	 */
	public void setVesselDeclareYN(String vesselDeclareYN) {
		this.vesselDeclareYN = vesselDeclareYN;
	}
	/**
	 * @return the imoNumber
	 */
	public String getImoNumber() {
		return imoNumber;
	}
	/**
	 * @param imoNumber the imoNumber to set
	 */
	public void setImoNumber(String imoNumber) {
		this.imoNumber = imoNumber;
	}
	/**
	 * @return the vesselSearchBy
	 */
	public String getVesselSearchBy() {
		return vesselSearchBy;
	}
	/**
	 * @param vesselSearchBy the vesselSearchBy to set
	 */
	public void setVesselSearchBy(String vesselSearchBy) {
		this.vesselSearchBy = vesselSearchBy;
	}
	/**
	 * @return the iHSLRORIMO
	 */
	public String getiHSLRORIMO() {
		return iHSLRORIMO;
	}
	/**
	 * @param iHSLRORIMO the iHSLRORIMO to set
	 */
	public void setiHSLRORIMO(String iHSLRORIMO) {
		this.iHSLRORIMO = iHSLRORIMO;
	}
	/**
	 * @return the shipsCategory
	 */
	public String getShipsCategory() {
		return shipsCategory;
	}
	/**
	 * @param shipsCategory the shipsCategory to set
	 */
	public void setShipsCategory(String shipsCategory) {
		this.shipsCategory = shipsCategory;
	}
	/**
	 * @return the nameString
	 */
	public String getNameString() {
		return nameString;
	}
	/**
	 * @param nameString the nameString to set
	 */
	public void setNameString(String nameString) {
		this.nameString = nameString;
	}
	/**
	 * @return the exshipsCategory
	 */
	public String getExshipsCategory() {
		return ExshipsCategory;
	}
	/**
	 * @param exshipsCategory the exshipsCategory to set
	 */
	public void setExshipsCategory(String exshipsCategory) {
		ExshipsCategory = exshipsCategory;
	}
	/**
	 * @return the exNameString
	 */
	public String getExNameString() {
		return ExNameString;
	}
	/**
	 * @param exNameString the exNameString to set
	 */
	public void setExNameString(String exNameString) {
		ExNameString = exNameString;
	}
	
}
