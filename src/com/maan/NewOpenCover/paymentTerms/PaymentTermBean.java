package com.maan.NewOpenCover.paymentTerms;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class PaymentTermBean {

	private String reqFrom;
	private String branchCode;
	private String userType;
	private String proposalNo;
	private String openCoverNo;
	private List<String>  openCoverNum;
	private List<String>  dueamount;
	private List<String>  duepercent;
	private List<String>  dueDate;
	private List<String>  dueList;
	private List<String>  effectiveDate;
	private String sno;
	private String amendId;
	private String userLoginId;
	private String missippiOpenCoverNo;
	private String openCoverPremium;
	private List<Object> paymentTermsDetails;
	private List<Object> paymentTerms;
	private List<Object> paymentTermsList;
	private List<HashMap<String,Object>> errors=new ArrayList<HashMap<String,Object>>();
	
	public String getReqFrom() {
		return reqFrom;
	}
	public void setReqFrom(String reqFrom) {
		this.reqFrom = reqFrom;
	}
	public String getBranchCode() {
		return branchCode;
	}
	public void setBranchCode(String branchCode) {
		this.branchCode = branchCode;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getProposalNo() {
		return proposalNo;
	}
	public void setProposalNo(String proposalNo) {
		this.proposalNo = proposalNo;
	}
	public String getOpenCoverNo() {
		return openCoverNo;
	}
	public void setOpenCoverNo(String openCoverNo) {
		this.openCoverNo = openCoverNo;
	}
	public List<String> getOpenCoverNum() {
		return openCoverNum;
	}
	public void setOpenCoverNum(List<String> openCoverNum) {
		this.openCoverNum = openCoverNum;
	}
	public List<String> getDueamount() {
		return dueamount;
	}
	public void setDueamount(List<String> dueamount) {
		this.dueamount = dueamount;
	}
	public List<String> getDuepercent() {
		return duepercent;
	}
	public void setDuepercent(List<String> duepercent) {
		this.duepercent = duepercent;
	}
	public List<String> getDueDate() {
		return dueDate;
	}
	public void setDueDate(List<String> dueDate) {
		this.dueDate = dueDate;
	}
	public List<String> getDueList() {
		return dueList;
	}
	public void setDueList(List<String> dueList) {
		this.dueList = dueList;
	}
	public List<String> getEffectiveDate() {
		return effectiveDate;
	}
	public void setEffectiveDate(List<String> effectiveDate) {
		this.effectiveDate = effectiveDate;
	}
	public String getSno() {
		return sno;
	}
	public void setSno(String sno) {
		this.sno = sno;
	}
	public String getAmendId() {
		return amendId;
	}
	public void setAmendId(String amendId) {
		this.amendId = amendId;
	}
	public List<Object> getPaymentTermsDetails() {
		return paymentTermsDetails;
	}
	public void setPaymentTermsDetails(List<Object> paymentTermsDetails) {
		this.paymentTermsDetails = paymentTermsDetails;
	}
	public List<Object> getPaymentTerms() {
		return paymentTerms;
	}
	public void setPaymentTerms(List<Object> paymentTerms) {
		this.paymentTerms = paymentTerms;
	}
	public String getUserLoginId() {
		return userLoginId;
	}
	public void setUserLoginId(String userLoginId) {
		this.userLoginId = userLoginId;
	}
	public List<Object> getPaymentTermsList() {
		return paymentTermsList;
	}
	public void setPaymentTermsList(List<Object> paymentTermsList) {
		this.paymentTermsList = paymentTermsList;
	}
	public List<HashMap<String, Object>> getErrors() {
		return errors;
	}
	public void setErrors(List<HashMap<String, Object>> errors) {
		this.errors = errors;
	}
	public String getMissippiOpenCoverNo() {
		return missippiOpenCoverNo;
	}
	public void setMissippiOpenCoverNo(String missippiOpenCoverNo) {
		this.missippiOpenCoverNo = missippiOpenCoverNo;
	}
	public String getOpenCoverPremium() {
		return openCoverPremium;
	}
	public void setOpenCoverPremium(String openCoverPremium) {
		this.openCoverPremium = openCoverPremium;
	}
	
	
}
