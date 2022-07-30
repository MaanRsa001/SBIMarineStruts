package com.maan.quotation.model;

import com.google.gson.annotations.SerializedName;

public class DropDown {

	@SerializedName("Code")
	private String code;
	@SerializedName("CodeDescription")
	private String codeDesc;
	@SerializedName("CodeValue")
	private String codeValue;
	
	
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
	 * @return the codeValue
	 */
	public String getCodeValue() {
		return codeValue;
	}
	/**
	 * @param codeValue the codeValue to set
	 */
	public void setCodeValue(String codeValue) {
		this.codeValue = codeValue;
	}
}
