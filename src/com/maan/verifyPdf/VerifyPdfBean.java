package com.maan.verifyPdf;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class VerifyPdfBean {
	
	private String code;
	private List<Map<String,Object>> quoteList;
	private String quoteNo;
	private String productId;
	private String fileName;
	private String policyNo;
	private String applicationNo;
	private List<HashMap<String,Object>> errors=new ArrayList<HashMap<String,Object>>();
	public String getApplicationNo() {
		return applicationNo;
	}
	public void setApplicationNo(String applicationNo) {
		this.applicationNo = applicationNo;
	}
	public String getQuoteNo() {
		return quoteNo;
	}
	public void setQuoteNo(String quoteNo) {
		this.quoteNo = quoteNo;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public List<Map<String, Object>> getQuoteList() {
		return quoteList;
	}
	public void setQuoteList(List<Map<String, Object>> quoteList) {
		this.quoteList = quoteList;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getPolicyNo() {
		return policyNo;
	}
	public void setPolicyNo(String policyNo) {
		this.policyNo = policyNo;
	}
	public List<HashMap<String, Object>> getErrors() {
		return errors;
	}
	public void setErrors(List<HashMap<String, Object>> errors) {
		this.errors = errors;
	}

}
