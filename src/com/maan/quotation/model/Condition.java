package com.maan.quotation.model;

import com.google.gson.annotations.SerializedName;

public class Condition {
	
	@SerializedName("Code")
	private String code;
	@SerializedName("CodeDesc")
	private String codeDesc;
	@SerializedName("CodeStatus")
	private String codeStatus;
	
	
	/**
	 * @return the code
	 */
	public String getCode() {
		return code;
	}
	/**
	 * @param code the code to set
	 */
	public void setCode(String code) {
		this.code = code;
	}
	/**
	 * @return the codeDesc
	 */
	public String getCodeDesc() {
		return codeDesc;
	}
	/**
	 * @param codeDesc the codeDesc to set
	 */
	public void setCodeDesc(String codeDesc) {
		this.codeDesc = codeDesc;
	}
	/**
	 * @return the codeStatus
	 */
	public String getCodeStatus() {
		return codeStatus;
	}
	/**
	 * @param codeStatus the codeStatus to set
	 */
	public void setCodeStatus(String codeStatus) {
		this.codeStatus = codeStatus;
	}

}
