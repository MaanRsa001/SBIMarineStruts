package com.maan.adminnew.report.motor;

import java.util.List;
import java.util.Map;

public class MotorReportBean {

	private String fromDate;
	private String toDate;
	private String policyNo;
	private String policyType;
	private String noOfPolicy;
	private String premium;
	private String mode;
	private String reportType;
	private List<Map<String,Object>> motorReportList;
	private List<Map<String,Object>> claimIntimateReportList;
	private List<Map<String,Object>> claimIntimateReportTpaList;
	private List<Map<String,Object>> dailyReportList;
	
	
	
	
	
	public String getReportType() {
		return reportType;
	}
	public void setReportType(String reportType) {
		this.reportType = reportType;
	}
	public List<Map<String, Object>> getDailyReportList() {
		return dailyReportList;
	}
	public void setDailyReportList(List<Map<String, Object>> dailyReportList) {
		this.dailyReportList = dailyReportList;
	}
	public String getFromDate() {
		return fromDate;
	}
	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}
	public String getToDate() {
		return toDate;
	}
	public void setToDate(String toDate) {
		this.toDate = toDate;
	}
	public void setMotorReportList(List<Map<String,Object>> motorReportList) {
		this.motorReportList = motorReportList;
	}
	public List<Map<String,Object>> getMotorReportList() {
		return motorReportList;
	}
	public String getPolicyType() {
		return policyType;
	}
	public void setPolicyType(String policyType) {
		this.policyType = policyType;
	}
	public String getNoOfPolicy() {
		return noOfPolicy;
	}
	public void setNoOfPolicy(String noOfPolicy) {
		this.noOfPolicy = noOfPolicy;
	}
	public String getPremium() {
		return premium;
	}
	public void setPremium(String premium) {
		this.premium = premium;
	}
	public void setMode(String mode) {
		this.mode = mode;
	}
	public String getMode() {
		return mode;
	}
	public void setPolicyNo(String policyNo) {
		this.policyNo = policyNo;
	}
	public String getPolicyNo() {
		return policyNo;
	}
	public void setClaimIntimateReportList(List<Map<String,Object>> claimIntimateReportList) {
		this.claimIntimateReportList = claimIntimateReportList;
	}
	public List<Map<String,Object>> getClaimIntimateReportList() {
		return claimIntimateReportList;
	}
	public void setClaimIntimateReportTpaList(
			List<Map<String,Object>> claimIntimateReportTpaList) {
		this.claimIntimateReportTpaList = claimIntimateReportTpaList;
	}
	public List<Map<String,Object>> getClaimIntimateReportTpaList() {
		return claimIntimateReportTpaList;
	}
}
