package com.maan.adminnew.report.common;

import java.util.List;
import java.util.Map;

public class ReportBean {
	private String productId;
	private String loginId;
	private String mode;
	private String reqFrom;
	private String branchCode;
	private String subBranch;
	private String belongingBranch;
	private String startDate;
	private String endDate;
	private String brokerCode;
	private String dateType;
	private String fromDate;
	private String toDate;
	private String userBranchCode;
	private String subBranchCode;
	private String userCode;
	private String policyType;
	private String reportType;
	private List<Map<String,Object>> transList;
	
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public String getMode() {
		return mode;
	}
	public void setMode(String mode) {
		this.mode = mode;
	}
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
	public String getSubBranch() {
		return subBranch;
	}
	public void setSubBranch(String subBranch) {
		this.subBranch = subBranch;
	}
	public void setBelongingBranch(String belongingBranch) {
		this.belongingBranch = belongingBranch;
	}
	public String getBelongingBranch() {
		return belongingBranch;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setBrokerCode(String brokerCode) {
		this.brokerCode = brokerCode;
	}
	public String getBrokerCode() {
		return brokerCode;
	}
	public void setDateType(String dateType) {
		this.dateType = dateType;
	}
	public String getDateType() {
		return dateType;
	}
	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}
	public String getFromDate() {
		return fromDate;
	}
	public void setToDate(String toDate) {
		this.toDate = toDate;
	}
	public String getToDate() {
		return toDate;
	}
	public String getUserBranchCode() {
		return userBranchCode;
	}
	public void setUserBranchCode(String userBranchCode) {
		this.userBranchCode = userBranchCode;
	}
	public String getSubBranchCode() {
		return subBranchCode;
	}
	public void setSubBranchCode(String subBranchCode) {
		this.subBranchCode = subBranchCode;
	}
	public String getUserCode() {
		return userCode;
	}
	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}
	public String getPolicyType() {
		return policyType;
	}
	public void setPolicyType(String policyType) {
		this.policyType = policyType;
	}
	public String getReportType() {
		return reportType;
	}
	public void setReportType(String reportType) {
		this.reportType = reportType;
	}
	public void setTransList(List<Map<String,Object>> transList) {
		this.transList = transList;
	}
	public List<Map<String,Object>> getTransList() {
		return transList;
	}
}
