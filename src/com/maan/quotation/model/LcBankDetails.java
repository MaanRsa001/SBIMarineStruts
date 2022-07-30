package com.maan.quotation.model;

import com.google.gson.annotations.SerializedName;

public class LcBankDetails{
    @SerializedName("BankCode") 
    private String bankCode;
    @SerializedName("BankName") 
    private String bankName;
    @SerializedName("BankDescription") 
    private String bankDescription;
    @SerializedName("LcNo") 
    private String lcNo;
    @SerializedName("LcDate") 
    private String lcDate;
    @SerializedName("AwbNo") 
    private String awbNo;
    @SerializedName("AwbDate") 
    private String awbDate;
    @SerializedName("SailingDate") 
    private String sailingDate;
    @SerializedName("BankOthers") 
    private String bankOthers;
	/**
	 * @return the bankCode
	 */
	public String getBankCode() {
		return bankCode;
	}
	/**
	 * @param bankCode the bankCode to set
	 */
	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}
	/**
	 * @return the bankName
	 */
	public String getBankName() {
		return bankName;
	}
	/**
	 * @param bankName the bankName to set
	 */
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	/**
	 * @return the bankDescription
	 */
	public String getBankDescription() {
		return bankDescription;
	}
	/**
	 * @param bankDescription the bankDescription to set
	 */
	public void setBankDescription(String bankDescription) {
		this.bankDescription = bankDescription;
	}
	/**
	 * @return the lcNo
	 */
	public String getLcNo() {
		return lcNo;
	}
	/**
	 * @param lcNo the lcNo to set
	 */
	public void setLcNo(String lcNo) {
		this.lcNo = lcNo;
	}
	/**
	 * @return the lcDate
	 */
	public String getLcDate() {
		return lcDate;
	}
	/**
	 * @param lcDate the lcDate to set
	 */
	public void setLcDate(String lcDate) {
		this.lcDate = lcDate;
	}
	/**
	 * @return the awbNo
	 */
	public String getAwbNo() {
		return awbNo;
	}
	/**
	 * @param awbNo the awbNo to set
	 */
	public void setAwbNo(String awbNo) {
		this.awbNo = awbNo;
	}
	/**
	 * @return the awbDate
	 */
	public String getAwbDate() {
		return awbDate;
	}
	/**
	 * @param awbDate the awbDate to set
	 */
	public void setAwbDate(String awbDate) {
		this.awbDate = awbDate;
	}
	/**
	 * @return the sailingDate
	 */
	public String getSailingDate() {
		return sailingDate;
	}
	/**
	 * @param sailingDate the sailingDate to set
	 */
	public void setSailingDate(String sailingDate) {
		this.sailingDate = sailingDate;
	}
	/**
	 * @return the bankOthers
	 */
	public String getBankOthers() {
		return bankOthers;
	}
	/**
	 * @param bankOthers the bankOthers to set
	 */
	public void setBankOthers(String bankOthers) {
		this.bankOthers = bankOthers;
	}
}