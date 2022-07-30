package com.maan.adminnew.portfolio;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

import com.opensymphony.xwork2.ActionContext;

public class PortfolioBean {
	Map<String, Object> session=ActionContext.getContext().getSession();	 
	private String fromdate;
	private String todate;
	private String fromdate1;
	private String todate1;
	private String productID=(String)session.get("product_id");
	private String rep;
	private String reqFrom;
	private String viewdate;
	private String test;
	private String quoteno;
	private List<String> status;
	private List<String> policyNo;
	private String optionMode;
	private String rsaBranch;
	private String brokerLogin;
	private String openCover;
	private String polNo;
	private String reqFrom1;
	private String riCode;
	private String riCodeValue;
	private List<Object> facultativeList;
	private List<Object> commodityList;
	private List<String> riInsCode;
	private List<String> riInsName;
	private List<String> riInsCommRate;
	private List<String> riInsShare;
	private List<Object> riInsList;
	private List<String> riInsSI;
	private List<String> riInsNetPrem;
	private List<String> riInsCommission;
	private List<String> riInsTax;
	private List<String> riInsFixedStamp;
	private List<String> riInsSlipAmt;
	private List<Object> riList;
	private String yearVal;
	private String crt;
	private String dateVal;
	private String compRetentShare;
	private String quotaShare;
	private String fsurPlus;
	private String ssurPlus;
	private String totalSI;
	private String totalNetPrem;
	private String commission;
	private String compRetentSI;
	private String quotaSI;
	private String compRetentCumSI;
	private String quotaCumSI;
	private String fsurPlusSI;
	private String ssurPlusSI;
	private String fsurPlusCumSI;
	private String ssurPlusCumSI;
	private String compRetentNetPrem;
	private String quotaNetPrem;
	private String fsurPlusNetPrem;
	private String ssurPlusNetPrem;
	private String faculativeSI;
	private String faculativeCumSI;
	private String faculativeNetPrem;
	private String validYN;
	private String issuingDate;
	private String inceptionDate;
	private String searchBy;
	private String searchValue;
	private String branchId;
	private String regionCode;
	public String getSearchBy() {
		return searchBy;
	}
	public void setSearchBy(String searchBy) {
		this.searchBy = searchBy;
	}
	public String getSearchValue() {
		return searchValue;
	}
	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
	public String getReqFrom1() {
		return reqFrom1;
	}
	public void setReqFrom1(String reqFrom1) {
		this.reqFrom1 = reqFrom1;
	}
	public String getRsaBranch() {
		return rsaBranch;
	}
	public void setRsaBranch(String rsaBranch) {
		this.rsaBranch = rsaBranch;
	}
	public String getOptionMode() {
		return optionMode;
	}
	public void setOptionMode(String optionMode) {
		this.optionMode = optionMode;
	}
	public List<String> getPolicyNo() {
		return policyNo;
	}
	public void setPolicyNo(List<String> policyNo) {
		this.policyNo = policyNo;
	}
	public List<String> getStatus() {
		return status;
	}
	public void setStatus(List<String> status) {
		this.status = status;
	}
	public String getQuoteno() {
		return quoteno;
	}
	public void setQuoteno(String quoteno) {
		this.quoteno = quoteno;
	}
	public String getTest() {
		return test;
	}
	public void setTest(String test) {
		this.test = test;
	}
	public String getViewdate() {
		return viewdate;
	}
	public void setViewdate(String viewdate) {
		this.viewdate = viewdate;
	}
	public String getFromdate() {
		return fromdate;
	}
	public void setFromdate(String fromdate) {
		this.fromdate = fromdate;
	}
	public String getTodate() {
		return todate;
	}
	public void setTodate(String todate) {
		this.todate = todate;
	}
	public String getProductID() {
		return StringUtils.isBlank(this.productID)?(String)session.get("product_id"):this.productID;
	}
	public void setProductID(String productID) {
		this.productID = productID;
	}
	public String getRep() {
		return rep;
	}
	public void setRep(String rep) {
		this.rep = rep;
	}
	public String getReqFrom() {
		return reqFrom;
	}
	public void setReqFrom(String reqFrom) {
		this.reqFrom = reqFrom;
	}
	public String getBrokerLogin() {
		return brokerLogin;
	}
	public String getOpenCover() {
		return openCover;
	}
	public String getPolNo() {
		return polNo;
	}
	public void setBrokerLogin(String brokerLogin) {
		this.brokerLogin = brokerLogin;
	}
	public void setOpenCover(String openCover) {
		this.openCover = openCover;
	}
	public void setPolNo(String polNo) {
		this.polNo = polNo;
	}
	public String getRiCode() {
		return riCode;
	}
	public String getRiCodeValue() {
		return riCodeValue;
	}
	public void setRiCode(String riCode) {
		this.riCode = riCode;
	}
	public void setRiCodeValue(String riCodeValue) {
		this.riCodeValue = riCodeValue;
	}
	public List<Object> getFacultativeList() {
		return facultativeList;
	}
	public void setFacultativeList(List<Object> facultativeList) {
		this.facultativeList = facultativeList;
	}
	public List<Object> getCommodityList() {
		return commodityList;
	}
	public void setCommodityList(List<Object> commodityList) {
		this.commodityList = commodityList;
	}
	public List<String> getRiInsCode() {
		return riInsCode;
	}
	public List<String> getRiInsCommRate() {
		return riInsCommRate;
	}
	public List<String> getRiInsShare() {
		return riInsShare;
	}
	public List<Object> getRiInsList() {
		return riInsList;
	}
	public void setRiInsCode(List<String> riInsCode) {
		this.riInsCode = riInsCode;
	}
	public void setRiInsCommRate(List<String> riInsCommRate) {
		this.riInsCommRate = riInsCommRate;
	}
	public void setRiInsShare(List<String> riInsShare) {
		this.riInsShare = riInsShare;
	}
	public void setRiInsList(List<Object> riInsList) {
		this.riInsList = riInsList;
	}
	public List<Object> getRiList() {
		return riList;
	}
	public void setRiList(List<Object> riList) {
		this.riList = riList;
	}
	public String getYearVal() {
		return yearVal;
	}
	public String getCrt() {
		return crt;
	}
	public String getDateVal() {
		return dateVal;
	}
	public String getQuotaShare() {
		return quotaShare;
	}
	public String getFsurPlus() {
		return fsurPlus;
	}
	public String getSsurPlus() {
		return ssurPlus;
	}
	public void setYearVal(String yearVal) {
		this.yearVal = yearVal;
	}
	public void setCrt(String crt) {
		this.crt = crt;
	}
	public void setDateVal(String dateVal) {
		this.dateVal = dateVal;
	}
	public void setQuotaShare(String quotaShare) {
		this.quotaShare = quotaShare;
	}
	public void setFsurPlus(String fsurPlus) {
		this.fsurPlus = fsurPlus;
	}
	public void setSsurPlus(String ssurPlus) {
		this.ssurPlus = ssurPlus;
	}
	public String getTotalSI() {
		return totalSI;
	}
	public String getTotalNetPrem() {
		return totalNetPrem;
	}
	public void setTotalSI(String totalSI) {
		this.totalSI = totalSI;
	}
	public void setTotalNetPrem(String totalNetPrem) {
		this.totalNetPrem = totalNetPrem;
	}
	public String getCommission() {
		return commission;
	}
	public void setCommission(String commission) {
		this.commission = commission;
	}
	public List<String> getRiInsSI() {
		return riInsSI;
	}
	public List<String> getRiInsNetPrem() {
		return riInsNetPrem;
	}
	public List<String> getRiInsCommission() {
		return riInsCommission;
	}
	public void setRiInsSI(List<String> riInsSI) {
		this.riInsSI = riInsSI;
	}
	public void setRiInsNetPrem(List<String> riInsNetPrem) {
		this.riInsNetPrem = riInsNetPrem;
	}
	public void setRiInsCommission(List<String> riInsCommission) {
		this.riInsCommission = riInsCommission;
	}
	public List<String> getRiInsTax() {
		return riInsTax;
	}
	public List<String> getRiInsFixedStamp() {
		return riInsFixedStamp;
	}
	public List<String> getRiInsSlipAmt() {
		return riInsSlipAmt;
	}
	public void setRiInsTax(List<String> riInsTax) {
		this.riInsTax = riInsTax;
	}
	public void setRiInsFixedStamp(List<String> riInsFixedStamp) {
		this.riInsFixedStamp = riInsFixedStamp;
	}
	public void setRiInsSlipAmt(List<String> riInsSlipAmt) {
		this.riInsSlipAmt = riInsSlipAmt;
	}
	public String getCompRetentShare() {
		return compRetentShare;
	}
	public String getCompRetentSI() {
		return compRetentSI;
	}
	public String getQuotaSI() {
		return quotaSI;
	}
	public String getCompRetentCumSI() {
		return compRetentCumSI;
	}
	public String getQuotaCumSI() {
		return quotaCumSI;
	}
	public String getFsurPlusCumSI() {
		return fsurPlusCumSI;
	}
	public String getSsurPlusCumSI() {
		return ssurPlusCumSI;
	}
	public String getCompRetentNetPrem() {
		return compRetentNetPrem;
	}
	public String getQuotaNetPrem() {
		return quotaNetPrem;
	}
	public String getFsurPlusNetPrem() {
		return fsurPlusNetPrem;
	}
	public String getSsurPlusNetPrem() {
		return ssurPlusNetPrem;
	}
	public void setCompRetentShare(String compRetentShare) {
		this.compRetentShare = compRetentShare;
	}
	public void setCompRetentSI(String compRetentSI) {
		this.compRetentSI = compRetentSI;
	}
	public void setQuotaSI(String quotaSI) {
		this.quotaSI = quotaSI;
	}
	public void setCompRetentCumSI(String compRetentCumSI) {
		this.compRetentCumSI = compRetentCumSI;
	}
	public void setQuotaCumSI(String quotaCumSI) {
		this.quotaCumSI = quotaCumSI;
	}
	public void setFsurPlusCumSI(String fsurPlusCumSI) {
		this.fsurPlusCumSI = fsurPlusCumSI;
	}
	public void setSsurPlusCumSI(String ssurPlusCumSI) {
		this.ssurPlusCumSI = ssurPlusCumSI;
	}
	public void setCompRetentNetPrem(String compRetentNetPrem) {
		this.compRetentNetPrem = compRetentNetPrem;
	}
	public void setQuotaNetPrem(String quotaNetPrem) {
		this.quotaNetPrem = quotaNetPrem;
	}
	public void setFsurPlusNetPrem(String fsurPlusNetPrem) {
		this.fsurPlusNetPrem = fsurPlusNetPrem;
	}
	public void setSsurPlusNetPrem(String ssurPlusNetPrem) {
		this.ssurPlusNetPrem = ssurPlusNetPrem;
	}
	public String getFaculativeSI() {
		return faculativeSI;
	}
	public String getFaculativeCumSI() {
		return faculativeCumSI;
	}
	public String getFaculativeNetPrem() {
		return faculativeNetPrem;
	}
	public void setFaculativeSI(String faculativeSI) {
		this.faculativeSI = faculativeSI;
	}
	public void setFaculativeCumSI(String faculativeCumSI) {
		this.faculativeCumSI = faculativeCumSI;
	}
	public void setFaculativeNetPrem(String faculativeNetPrem) {
		this.faculativeNetPrem = faculativeNetPrem;
	}
	public List<String> getRiInsName() {
		return riInsName;
	}
	public void setRiInsName(List<String> riInsName) {
		this.riInsName = riInsName;
	}
	public String getValidYN() {
		return validYN;
	}
	public void setValidYN(String validYN) {
		this.validYN = validYN;
	}
	public String getFsurPlusSI() {
		return fsurPlusSI;
	}
	public String getSsurPlusSI() {
		return ssurPlusSI;
	}
	public void setFsurPlusSI(String fsurPlusSI) {
		this.fsurPlusSI = fsurPlusSI;
	}
	public void setSsurPlusSI(String ssurPlusSI) {
		this.ssurPlusSI = ssurPlusSI;
	}
	public String getIssuingDate() {
		return issuingDate;
	}
	public String getInceptionDate() {
		return inceptionDate;
	}
	public void setIssuingDate(String issuingDate) {
		this.issuingDate = issuingDate;
	}
	public void setInceptionDate(String inceptionDate) {
		this.inceptionDate = inceptionDate;
	}
	public void setBranchId(String branchId) {
		this.branchId = branchId;
	}
	public String getBranchId() {
		return branchId;
	}
	public void setTodate1(String todate1) {
		this.todate1 = todate1;
	}
	public String getTodate1() {
		return todate1;
	}
	public void setFromdate1(String fromdate1) {
		this.fromdate1 = fromdate1;
	}
	public String getFromdate1() {
		return fromdate1;
	}
	public String getRegionCode() {
		return regionCode;
	}
	public void setRegionCode(String regionCode) {
		this.regionCode = regionCode;
	}
	
}

