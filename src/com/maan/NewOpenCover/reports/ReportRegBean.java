package com.maan.NewOpenCover.reports;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class ReportRegBean {

	private String branchCode;
	private String belongingBranch;
	private String brokerId;
	private List<Object> quoteList;
	
	private String display;
	private String searchType;
	private String searchValue;
	private List<Object> searchResult;
	private String copyQuoteValue;
	private List<HashMap<String,Object>> errors=new ArrayList<HashMap<String,Object>>();
	private String policyNo;
	private String status;
	private String userType;
	private String proposalNo;
	private String deactive;
	private String fileName;
	private String opencoverNo;
	private String docType;
	private String loginId;
	private String docNo;
	private String endtstatus;
	public String getBranchCode() {
		return branchCode;
	}

	public void setBranchCode(String branchCode) {
		this.branchCode = branchCode;
	}

	public String getBrokerId() {
		return brokerId;
	}

	public void setBrokerId(String brokerId) {
		this.brokerId = brokerId;
	}

	public List<Object> getQuoteList() {
		return quoteList;
	}

	public void setQuoteList(List<Object> quoteList) {
		this.quoteList = quoteList;
	}

	public String getDisplay() {
		return display;
	}

	public void setDisplay(String display) {
		this.display = display;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

	public List<Object> getSearchResult() {
		return searchResult;
	}

	public void setSearchResult(List<Object> searchResult) {
		this.searchResult = searchResult;
	}

	public String getCopyQuoteValue() {
		return copyQuoteValue;
	}

	public void setCopyQuoteValue(String copyQuoteValue) {
		this.copyQuoteValue = copyQuoteValue;
	}

	public List<HashMap<String, Object>> getErrors() {
		return errors;
	}

	public void setErrors(List<HashMap<String, Object>> errors) {
		this.errors = errors;
	}

	public String getPolicyNo() {
		return policyNo;
	}

	public void setPolicyNo(String policyNo) {
		this.policyNo = policyNo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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

	public String getDeactive() {
		return deactive;
	}

	public void setDeactive(String deactive) {
		this.deactive = deactive;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getOpencoverNo() {
		return opencoverNo;
	}

	public void setOpencoverNo(String opencoverNo) {
		this.opencoverNo = opencoverNo;
	}

	public String getDocType() {
		return docType;
	}

	public void setDocType(String docType) {
		this.docType = docType;
	}

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getDocNo() {
		return docNo;
	}

	public void setDocNo(String docNo) {
		this.docNo = docNo;
	}

	public String getEndtstatus() {
		return endtstatus;
	}

	public void setEndtstatus(String endtstatus) {
		this.endtstatus = endtstatus;
	}

	public String getBelongingBranch() {
		return belongingBranch;
	}

	public void setBelongingBranch(String belongingBranch) {
		this.belongingBranch = belongingBranch;
	}
	
	
}
