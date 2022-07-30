package com.maan.quotation.model;

import com.google.gson.annotations.SerializedName;




public class ShipDetailResp {

	@SerializedName("ImoNumber")
	private String imoNumber;
	@SerializedName("ShipName")
	private String shipName;
	@SerializedName("ShipStatus")
	private String shipStatus;
	@SerializedName("LegalOverall")
	private String legalOverall;
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
	 * @return the shipName
	 */
	public String getShipName() {
		return shipName;
	}
	/**
	 * @param shipName the shipName to set
	 */
	public void setShipName(String shipName) {
		this.shipName = shipName;
	}
	/**
	 * @return the shipStatus
	 */
	public String getShipStatus() {
		return shipStatus;
	}
	/**
	 * @param shipStatus the shipStatus to set
	 */
	public void setShipStatus(String shipStatus) {
		this.shipStatus = shipStatus;
	}
	/**
	 * @return the legalOverall
	 */
	public String getLegalOverall() {
		return legalOverall;
	}
	/**
	 * @param legalOverall the legalOverall to set
	 */
	public void setLegalOverall(String legalOverall) {
		this.legalOverall = legalOverall;
	}
	
	
}
