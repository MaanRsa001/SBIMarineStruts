package com.maan.report;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ReportBean{

	private String gquoteNo;
	private String gcustName;
	private String gquoteDate;
	private String goverAllPremium;
	private String gcreditNoteNo;
	private String gvalidityDate;
	private String glapsedRemark;
	private String gvalidityPeriod;
	private String glapsedDate;
	private String gcustomerId;
	private String gbrokerName;
	private String gapplicationNo;
	private String gloginId;
	private String ginsuredName;
	private String gpolicyNo;
	private String gpremium;
	private String gbasePremium;
	private String gcommission;
	private String gmodeofPay;
	private String gpolIssueDate;
	private String gPolInsDate;
	private String gpolExpDate;
	private String gdebitNoteNo;
	private String greceiptNo;
	private String gedit;
	private String gactive;
	private String gdeactive;
	private String gstatus;
	private String gview;
	private String gtransactionId;
	private String gtransactionId1;
	private String ginvalidRecords;
	private String gvalidRecords;
	private String gocCustName;
	private String gfirstName;
	private String gaddress;
	private String gcustomerCivilId;
	private String gemail;
	private String gmobile;
	private String grefSatus;
	private String gemailSent;
	private String greject;
	private String greject1;
	private String gschedule;
	private String gendorse;
	private String gview1;
	private String gprint1;
	private String gdebit1;
	private String greceipt;
	private String gcredit;
	private String gendtStatus;
	private String gendtType;
	private String grefStatus;
	private String gendtSchedule;
	private String gendtcrdrStatus;
	private String gdebit;
	private String gotherPolicyNo;
	private String gtotalCert;
	private String gpolicyWording;
	private String glcupload;
	
	private String glc_date;
	private String glc_number;
	private String gbl_awb_date;
	private String gbl_awb_no;
	private String ggood_desc;
	private String guserName;
	private String mode;
	private String startDate;
	private String endDate;
	private String mode1;
	private String userName;
	private String reqFrom;
	private String brloginId;
	private String appId;
	private String menuBlocker;
	private String opCoverNo;
	private String poNumber;
	private String gattach;
	private String isselectedCover;
	private String lapsedmenu;
	private String searchValue;
	private String searchBy;
	private String userSel;
	private String policyType;
	private String searchPolicyNo;
	private String selectProd;
	private String docType;
	private String gintgError;
	
	public String getGintgError() {
		return gintgError;
	}
	public void setGintgError(String gintgError) {
		this.gintgError = gintgError;
	}
	public String getPoNumber() {
		return poNumber;
	}
	public void setPoNumber(String poNumber) {
		this.poNumber = poNumber;
	}
	private List<Map<String,Object>> bulkPrintOPList;
	private List<Map<String,Object>> bulkPrintBRList;
	private List<Map<String,Object>> shipDetailList;
	private List<Map<String,Object>> shipPendingList;	
	private List<HashMap<String,Object>> errors=new ArrayList<HashMap<String,Object>>();
	
	private String dcQuoteShow;
	private String dcQuoteValues;
	private String dcPolicyShow;
	private String dcPolicyValues;
	private String dcRefPendShow;
	private String dcRefPendValues;
	private String dcRefCompShow;
	private String dcRefCompValues;
	private String dcRefRejectShow;
	private String dcRefRejectValues;
	private String dcQuoteProdShow;
	private String dcQuoteProdValues;
	private String dcPolicyProdShow;
	private String dcPolicyProdValues;
	
	private String dcBQuoteShow;
	private String dcBQuoteBrokerValues;
	private String dcBQuoteCountValues;
	private String dcBQuotePremiumValues;
	private String dcBPolicyShow;
	private String dcBPolicyBrokerValues;
	private String dcBPolicyCountValues;
	private String dcBPolicyPremiumValues;
	private String dcBQuoteProdShow;
	private String dcBQuoteProdValues;
	private String dcBQuoteProdCountValues;
	private String dcBQuoteProdPremiumValues;
	private String dcBPolicyProdShow;
	private String dcBPolicyProdValues;
	private String dcBPolicyProdCountValues;
	private String dcBPolicyProdPremiumValues;
	private String dcBRefPendShow;
	private String dcBRefPendBrokerValues;
	private String dcBRefPendCountValues;
	private String dcBRefCompShow;
	private String dcBRefCompBrokerValues;
	private String dcBRefCompCountValues;
	private String dcBRefRejectShow;
	private String dcBRefRejectBrokerValues;
	private String dcBRefRejectCountValues;
	
	public String getGlc_date() {
		return glc_date;
	}
	public void setGlc_date(String glcDate) {
		glc_date = glcDate;
	}
	public String getGlc_number() {
		return glc_number;
	}
	public void setGlc_number(String glcNumber) {
		glc_number = glcNumber;
	}
	public String getGbl_awb_date() {
		return gbl_awb_date;
	}
	public void setGbl_awb_date(String gblAwbDate) {
		gbl_awb_date = gblAwbDate;
	}
	public String getGbl_awb_no() {
		return gbl_awb_no;
	}
	public void setGbl_awb_no(String gblAwbNo) {
		gbl_awb_no = gblAwbNo;
	}
	public String getGgood_desc() {
		return ggood_desc;
	}
	public void setGgood_desc(String ggoodDesc) {
		ggood_desc = ggoodDesc;
	}
	public String getGlcupload() {
		return glcupload;
	}
	public void setGlcupload(String glcupload) {
		this.glcupload = glcupload;
	}
	public String getGdebit() {
		return gdebit;
	}
	public void setGdebit(String gdebit) {
		this.gdebit = gdebit;
	}
	public String getGquoteNo() {
		return gquoteNo;
	}
	public void setGquoteNo(String gquoteNo) {
		this.gquoteNo = gquoteNo;
	}
	public String getGcustName() {
		return gcustName;
	}
	public void setGcustName(String gcustName) {
		this.gcustName = gcustName;
	}
	public String getGquoteDate() {
		return gquoteDate;
	}
	public void setGquoteDate(String gquoteDate) {
		this.gquoteDate = gquoteDate;
	}
	public String getGoverAllPremium() {
		return goverAllPremium;
	}
	public void setGoverAllPremium(String goverAllPremium) {
		this.goverAllPremium = goverAllPremium;
	}
	public String getGcreditNoteNo() {
		return gcreditNoteNo;
	}
	public void setGcreditNoteNo(String gcreditNoteNo) {
		this.gcreditNoteNo = gcreditNoteNo;
	}
	public String getGvalidityDate() {
		return gvalidityDate;
	}
	public void setGvalidityDate(String gvalidityDate) {
		this.gvalidityDate = gvalidityDate;
	}
	public String getGlapsedRemark() {
		return glapsedRemark;
	}
	public void setGlapsedRemark(String glapsedRemark) {
		this.glapsedRemark = glapsedRemark;
	}
	public String getGvalidityPeriod() {
		return gvalidityPeriod;
	}
	public void setGvalidityPeriod(String gvalidityPeriod) {
		this.gvalidityPeriod = gvalidityPeriod;
	}
	public String getGlapsedDate() {
		return glapsedDate;
	}
	public void setGlapsedDate(String glapsedDate) {
		this.glapsedDate = glapsedDate;
	}
	public String getGcustomerId() {
		return gcustomerId;
	}
	public void setGcustomerId(String gcustomerId) {
		this.gcustomerId = gcustomerId;
	}
	public String getGbrokerName() {
		return gbrokerName;
	}
	public void setGbrokerName(String gbrokerName) {
		this.gbrokerName = gbrokerName;
	}
	public String getGapplicationNo() {
		return gapplicationNo;
	}
	public void setGapplicationNo(String gapplicationNo) {
		this.gapplicationNo = gapplicationNo;
	}
	public String getGloginId() {
		return gloginId;
	}
	public void setGloginId(String gloginId) {
		this.gloginId = gloginId;
	}
	public String getGinsuredName() {
		return ginsuredName;
	}
	public void setGinsuredName(String ginsuredName) {
		this.ginsuredName = ginsuredName;
	}
	public String getGpolicyNo() {
		return gpolicyNo;
	}
	public void setGpolicyNo(String gpolicyNo) {
		this.gpolicyNo = gpolicyNo;
	}
	public String getGpremium() {
		return gpremium;
	}
	public void setGpremium(String gpremium) {
		this.gpremium = gpremium;
	}
	public String getGcommission() {
		return gcommission;
	}
	public void setGcommission(String gcommission) {
		this.gcommission = gcommission;
	}
	public String getGmodeofPay() {
		return gmodeofPay;
	}
	public void setGmodeofPay(String gmodeofPay) {
		this.gmodeofPay = gmodeofPay;
	}
	public String getGpolIssueDate() {
		return gpolIssueDate;
	}
	public void setGpolIssueDate(String gpolIssueDate) {
		this.gpolIssueDate = gpolIssueDate;
	}
	public String getgPolInsDate() {
		return gPolInsDate;
	}
	public void setgPolInsDate(String gPolInsDate) {
		this.gPolInsDate = gPolInsDate;
	}
	public String getGpolExpDate() {
		return gpolExpDate;
	}
	public void setGpolExpDate(String gpolExpDate) {
		this.gpolExpDate = gpolExpDate;
	}
	public String getGdebitNoteNo() {
		return gdebitNoteNo;
	}
	public void setGdebitNoteNo(String gdebitNoteNo) {
		this.gdebitNoteNo = gdebitNoteNo;
	}
	public String getGreceiptNo() {
		return greceiptNo;
	}
	public void setGreceiptNo(String greceiptNo) {
		this.greceiptNo = greceiptNo;
	}
	public String getGedit() {
		return gedit;
	}
	public void setGedit(String gedit) {
		this.gedit = gedit;
	}
	public String getGactive() {
		return gactive;
	}
	public void setGactive(String gactive) {
		this.gactive = gactive;
	}
	public String getGdeactive() {
		return gdeactive;
	}
	public void setGdeactive(String gdeactive) {
		this.gdeactive = gdeactive;
	}
	public String getGstatus() {
		return gstatus;
	}
	public void setGstatus(String gstatus) {
		this.gstatus = gstatus;
	}
	public String getGview() {
		return gview;
	}
	public void setGview(String gview) {
		this.gview = gview;
	}
	public String getGtransactionId() {
		return gtransactionId;
	}
	public void setGtransactionId(String gtransactionId) {
		this.gtransactionId = gtransactionId;
	}
	public String getGtransactionId1() {
		return gtransactionId1;
	}
	public void setGtransactionId1(String gtransactionId1) {
		this.gtransactionId1 = gtransactionId1;
	}
	public String getGinvalidRecords() {
		return ginvalidRecords;
	}
	public void setGinvalidRecords(String ginvalidRecords) {
		this.ginvalidRecords = ginvalidRecords;
	}
	public String getGocCustName() {
		return gocCustName;
	}
	public void setGocCustName(String gocCustName) {
		this.gocCustName = gocCustName;
	}
	public String getGfirstName() {
		return gfirstName;
	}
	public void setGfirstName(String gfirstName) {
		this.gfirstName = gfirstName;
	}
	public String getGaddress() {
		return gaddress;
	}
	public void setGaddress(String gaddress) {
		this.gaddress = gaddress;
	}
	public String getGcustomerCivilId() {
		return gcustomerCivilId;
	}
	public void setGcustomerCivilId(String gcustomerCivilId) {
		this.gcustomerCivilId = gcustomerCivilId;
	}
	public String getGemail() {
		return gemail;
	}
	public void setGemail(String gemail) {
		this.gemail = gemail;
	}
	public String getGmobile() {
		return gmobile;
	}
	public void setGmobile(String gmobile) {
		this.gmobile = gmobile;
	}
	public String getGrefSatus() {
		return grefSatus;
	}
	public void setGrefSatus(String grefSatus) {
		this.grefSatus = grefSatus;
	}
	public String getGemailSent() {
		return gemailSent;
	}
	public void setGemailSent(String gemailSent) {
		this.gemailSent = gemailSent;
	}
	public String getGreject() {
		return greject;
	}
	public void setGreject(String greject) {
		this.greject = greject;
	}
	public String getGreject1() {
		return greject1;
	}
	public void setGreject1(String greject1) {
		this.greject1 = greject1;
	}
	public String getGschedule() {
		return gschedule;
	}
	public void setGschedule(String gschedule) {
		this.gschedule = gschedule;
	}
	public String getGendorse() {
		return gendorse;
	}
	public void setGendorse(String gendorse) {
		this.gendorse = gendorse;
	}
	public String getGview1() {
		return gview1;
	}
	public void setGview1(String gview1) {
		this.gview1 = gview1;
	}
	public String getGprint1() {
		return gprint1;
	}
	public void setGprint1(String gprint1) {
		this.gprint1 = gprint1;
	}
	public String getGdebit1() {
		return gdebit1;
	}
	public void setGdebit1(String gdebit1) {
		this.gdebit1 = gdebit1;
	}
	public String getGreceipt() {
		return greceipt;
	}
	public void setGreceipt(String greceipt) {
		this.greceipt = greceipt;
	}
	public String getGcredit() {
		return gcredit;
	}
	public void setGcredit(String gcredit) {
		this.gcredit = gcredit;
	}
	public String getGendtStatus() {
		return gendtStatus;
	}
	public void setGendtStatus(String gendtStatus) {
		this.gendtStatus = gendtStatus;
	}
	public String getGendtType() {
		return gendtType;
	}
	public void setGendtType(String gendtType) {
		this.gendtType = gendtType;
	}
	public String getGrefStatus() {
		return grefStatus;
	}
	public void setGrefStatus(String grefStatus) {
		this.grefStatus = grefStatus;
	}
	public String getGendtSchedule() {
		return gendtSchedule;
	}
	public void setGendtSchedule(String gendtSchedule) {
		this.gendtSchedule = gendtSchedule;
	}
	public String getGotherPolicyNo() {
		return gotherPolicyNo;
	}
	public void setGotherPolicyNo(String gotherPolicyNo) {
		this.gotherPolicyNo = gotherPolicyNo;
	}
	public String getGtotalCert() {
		return gtotalCert;
	}
	public void setGtotalCert(String gtotalCert) {
		this.gtotalCert = gtotalCert;
	}
	public String getGpolicyWording() {
		return gpolicyWording;
	}
	public void setGpolicyWording(String gpolicyWording) {
		this.gpolicyWording = gpolicyWording;
	}
	public void setGvalidRecords(String gvalidRecords) {
		this.gvalidRecords = gvalidRecords;
	}
	public String getGvalidRecords() {
		return gvalidRecords;
	}
	public void setGuserName(String guserName) {
		this.guserName = guserName;
	}
	public String getGuserName() {
		return guserName;
	}
	public String getMode() {
		return mode;
	}
	public void setMode(String mode) {
		this.mode = mode;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getMode1() {
		return mode1;
	}
	public void setMode1(String mode1) {
		this.mode1 = mode1;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getReqFrom() {
		return reqFrom;
	}
	public void setReqFrom(String reqFrom) {
		this.reqFrom = reqFrom;
	}
	public String getBrloginId() {
		return brloginId;
	}
	public void setBrloginId(String brloginId) {
		this.brloginId = brloginId;
	}
	public String getAppId() {
		return appId;
	}
	public void setAppId(String appId) {
		this.appId = appId;
	}
	public String getMenuBlocker() {
		return menuBlocker;
	}
	public void setMenuBlocker(String menuBlocker) {
		this.menuBlocker = menuBlocker;
	}
	public String getOpCoverNo() {
		return opCoverNo;
	}
	public void setOpCoverNo(String opCoverNo) {
		this.opCoverNo = opCoverNo;
	}
	public List<Map<String, Object>> getBulkPrintOPList() {
		return bulkPrintOPList;
	}
	public void setBulkPrintOPList(List<Map<String, Object>> bulkPrintOPList) {
		this.bulkPrintOPList = bulkPrintOPList;
	}
	public List<Map<String, Object>> getBulkPrintBRList() {
		return bulkPrintBRList;
	}
	public void setBulkPrintBRList(List<Map<String, Object>> bulkPrintBRList) {
		this.bulkPrintBRList = bulkPrintBRList;
	}
	public void setGbasePremium(String gbasePremium) {
		this.gbasePremium = gbasePremium;
	}
	public String getGbasePremium() {
		return gbasePremium;
	}
	public void setGattach(String gattach) {
		this.gattach = gattach;
	}
	public String getGattach() {
		return gattach;
	}
	public void setIsselectedCover(String isselectedCover) {
		this.isselectedCover = isselectedCover;
	}
	public String getIsselectedCover() {
		return isselectedCover;
	}
	public void setGendtcrdrStatus(String gendtcrdrStatus) {
		this.gendtcrdrStatus = gendtcrdrStatus;
	}
	public String getGendtcrdrStatus() {
		return gendtcrdrStatus;
	}
	public String getLapsedmenu() {
		return lapsedmenu;
	}
	public void setLapsedmenu(String lapsedmenu) {
		this.lapsedmenu = lapsedmenu;
	}
	public List<Map<String, Object>> getShipDetailList() {
		return shipDetailList;
	}
	public void setShipDetailList(List<Map<String, Object>> shipDetailList) {
		this.shipDetailList = shipDetailList;
	}
	public List<Map<String, Object>> getShipPendingList() {
		return shipPendingList;
	}
	public void setShipPendingList(List<Map<String, Object>> shipPendingList) {
		this.shipPendingList = shipPendingList;
	}
	public String getSearchValue() {
		return searchValue;
	}
	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
	public String getSearchBy() {
		return searchBy;
	}
	public void setSearchBy(String searchBy) {
		this.searchBy = searchBy;
	}
	public List<HashMap<String, Object>> getErrors() {
		return errors;
	}
	public void setErrors(List<HashMap<String, Object>> errors) {
		this.errors = errors;
	}
	public String getPolicyType() {
		return policyType;
	}
	public void setPolicyType(String policyType) {
		this.policyType = policyType;
	}
	public String getUserSel() {
		return userSel;
	}
	public void setUserSel(String userSel) {
		this.userSel = userSel;
	}
	public String getSearchPolicyNo() {
		return searchPolicyNo;
	}
	public void setSearchPolicyNo(String searchPolicyNo) {
		this.searchPolicyNo = searchPolicyNo;
	}
	public String getSelectProd() {
		return selectProd;
	}
	public void setSelectProd(String selectProd) {
		this.selectProd = selectProd;
	}
	public String getDcQuoteShow() {
		return dcQuoteShow;
	}
	public void setDcQuoteShow(String dcQuoteShow) {
		this.dcQuoteShow = dcQuoteShow;
	}
	public String getDcQuoteValues() {
		return dcQuoteValues;
	}
	public void setDcQuoteValues(String dcQuoteValues) {
		this.dcQuoteValues = dcQuoteValues;
	}
	public String getDcPolicyShow() {
		return dcPolicyShow;
	}
	public void setDcPolicyShow(String dcPolicyShow) {
		this.dcPolicyShow = dcPolicyShow;
	}
	public String getDcPolicyValues() {
		return dcPolicyValues;
	}
	public void setDcPolicyValues(String dcPolicyValues) {
		this.dcPolicyValues = dcPolicyValues;
	}
	public String getDcRefPendShow() {
		return dcRefPendShow;
	}
	public void setDcRefPendShow(String dcRefPendShow) {
		this.dcRefPendShow = dcRefPendShow;
	}
	public String getDcRefPendValues() {
		return dcRefPendValues;
	}
	public void setDcRefPendValues(String dcRefPendValues) {
		this.dcRefPendValues = dcRefPendValues;
	}
	public String getDcRefCompShow() {
		return dcRefCompShow;
	}
	public void setDcRefCompShow(String dcRefCompShow) {
		this.dcRefCompShow = dcRefCompShow;
	}
	public String getDcRefCompValues() {
		return dcRefCompValues;
	}
	public void setDcRefCompValues(String dcRefCompValues) {
		this.dcRefCompValues = dcRefCompValues;
	}
	public String getDcRefRejectShow() {
		return dcRefRejectShow;
	}
	public void setDcRefRejectShow(String dcRefRejectShow) {
		this.dcRefRejectShow = dcRefRejectShow;
	}
	public String getDcRefRejectValues() {
		return dcRefRejectValues;
	}
	public void setDcRefRejectValues(String dcRefRejectValues) {
		this.dcRefRejectValues = dcRefRejectValues;
	}
	public String getDcQuoteProdShow() {
		return dcQuoteProdShow;
	}
	public void setDcQuoteProdShow(String dcQuoteProdShow) {
		this.dcQuoteProdShow = dcQuoteProdShow;
	}
	public String getDcQuoteProdValues() {
		return dcQuoteProdValues;
	}
	public void setDcQuoteProdValues(String dcQuoteProdValues) {
		this.dcQuoteProdValues = dcQuoteProdValues;
	}
	public String getDcPolicyProdShow() {
		return dcPolicyProdShow;
	}
	public void setDcPolicyProdShow(String dcPolicyProdShow) {
		this.dcPolicyProdShow = dcPolicyProdShow;
	}
	public String getDcPolicyProdValues() {
		return dcPolicyProdValues;
	}
	public void setDcPolicyProdValues(String dcPolicyProdValues) {
		this.dcPolicyProdValues = dcPolicyProdValues;
	}
	public String getDcBQuoteShow() {
		return dcBQuoteShow;
	}
	public void setDcBQuoteShow(String dcBQuoteShow) {
		this.dcBQuoteShow = dcBQuoteShow;
	}
	public String getDcBQuoteBrokerValues() {
		return dcBQuoteBrokerValues;
	}
	public void setDcBQuoteBrokerValues(String dcBQuoteBrokerValues) {
		this.dcBQuoteBrokerValues = dcBQuoteBrokerValues;
	}
	public String getDcBQuoteCountValues() {
		return dcBQuoteCountValues;
	}
	public void setDcBQuoteCountValues(String dcBQuoteCountValues) {
		this.dcBQuoteCountValues = dcBQuoteCountValues;
	}
	public String getDcBQuotePremiumValues() {
		return dcBQuotePremiumValues;
	}
	public void setDcBQuotePremiumValues(String dcBQuotePremiumValues) {
		this.dcBQuotePremiumValues = dcBQuotePremiumValues;
	}
	public String getDcBPolicyShow() {
		return dcBPolicyShow;
	}
	public void setDcBPolicyShow(String dcBPolicyShow) {
		this.dcBPolicyShow = dcBPolicyShow;
	}
	public String getDcBPolicyBrokerValues() {
		return dcBPolicyBrokerValues;
	}
	public void setDcBPolicyBrokerValues(String dcBPolicyBrokerValues) {
		this.dcBPolicyBrokerValues = dcBPolicyBrokerValues;
	}
	public String getDcBPolicyCountValues() {
		return dcBPolicyCountValues;
	}
	public void setDcBPolicyCountValues(String dcBPolicyCountValues) {
		this.dcBPolicyCountValues = dcBPolicyCountValues;
	}
	public String getDcBPolicyPremiumValues() {
		return dcBPolicyPremiumValues;
	}
	public void setDcBPolicyPremiumValues(String dcBPolicyPremiumValues) {
		this.dcBPolicyPremiumValues = dcBPolicyPremiumValues;
	}
	public String getDcBQuoteProdShow() {
		return dcBQuoteProdShow;
	}
	public void setDcBQuoteProdShow(String dcBQuoteProdShow) {
		this.dcBQuoteProdShow = dcBQuoteProdShow;
	}
	public String getDcBQuoteProdValues() {
		return dcBQuoteProdValues;
	}
	public void setDcBQuoteProdValues(String dcBQuoteProdValues) {
		this.dcBQuoteProdValues = dcBQuoteProdValues;
	}
	public String getDcBQuoteProdCountValues() {
		return dcBQuoteProdCountValues;
	}
	public void setDcBQuoteProdCountValues(String dcBQuoteProdCountValues) {
		this.dcBQuoteProdCountValues = dcBQuoteProdCountValues;
	}
	public String getDcBQuoteProdPremiumValues() {
		return dcBQuoteProdPremiumValues;
	}
	public void setDcBQuoteProdPremiumValues(String dcBQuoteProdPremiumValues) {
		this.dcBQuoteProdPremiumValues = dcBQuoteProdPremiumValues;
	}
	public String getDcBPolicyProdShow() {
		return dcBPolicyProdShow;
	}
	public void setDcBPolicyProdShow(String dcBPolicyProdShow) {
		this.dcBPolicyProdShow = dcBPolicyProdShow;
	}
	public String getDcBPolicyProdValues() {
		return dcBPolicyProdValues;
	}
	public void setDcBPolicyProdValues(String dcBPolicyProdValues) {
		this.dcBPolicyProdValues = dcBPolicyProdValues;
	}
	public String getDcBPolicyProdCountValues() {
		return dcBPolicyProdCountValues;
	}
	public void setDcBPolicyProdCountValues(String dcBPolicyProdCountValues) {
		this.dcBPolicyProdCountValues = dcBPolicyProdCountValues;
	}
	public String getDcBPolicyProdPremiumValues() {
		return dcBPolicyProdPremiumValues;
	}
	public void setDcBPolicyProdPremiumValues(String dcBPolicyProdPremiumValues) {
		this.dcBPolicyProdPremiumValues = dcBPolicyProdPremiumValues;
	}
	public String getDcBRefPendShow() {
		return dcBRefPendShow;
	}
	public void setDcBRefPendShow(String dcBRefPendShow) {
		this.dcBRefPendShow = dcBRefPendShow;
	}
	public String getDcBRefPendBrokerValues() {
		return dcBRefPendBrokerValues;
	}
	public void setDcBRefPendBrokerValues(String dcBRefPendBrokerValues) {
		this.dcBRefPendBrokerValues = dcBRefPendBrokerValues;
	}
	public String getDcBRefPendCountValues() {
		return dcBRefPendCountValues;
	}
	public void setDcBRefPendCountValues(String dcBRefPendCountValues) {
		this.dcBRefPendCountValues = dcBRefPendCountValues;
	}
	public String getDcBRefCompShow() {
		return dcBRefCompShow;
	}
	public void setDcBRefCompShow(String dcBRefCompShow) {
		this.dcBRefCompShow = dcBRefCompShow;
	}
	public String getDcBRefCompBrokerValues() {
		return dcBRefCompBrokerValues;
	}
	public void setDcBRefCompBrokerValues(String dcBRefCompBrokerValues) {
		this.dcBRefCompBrokerValues = dcBRefCompBrokerValues;
	}
	public String getDcBRefCompCountValues() {
		return dcBRefCompCountValues;
	}
	public void setDcBRefCompCountValues(String dcBRefCompCountValues) {
		this.dcBRefCompCountValues = dcBRefCompCountValues;
	}
	public String getDcBRefRejectShow() {
		return dcBRefRejectShow;
	}
	public void setDcBRefRejectShow(String dcBRefRejectShow) {
		this.dcBRefRejectShow = dcBRefRejectShow;
	}
	public String getDcBRefRejectBrokerValues() {
		return dcBRefRejectBrokerValues;
	}
	public void setDcBRefRejectBrokerValues(String dcBRefRejectBrokerValues) {
		this.dcBRefRejectBrokerValues = dcBRefRejectBrokerValues;
	}
	public String getDcBRefRejectCountValues() {
		return dcBRefRejectCountValues;
	}
	public void setDcBRefRejectCountValues(String dcBRefRejectCountValues) {
		this.dcBRefRejectCountValues = dcBRefRejectCountValues;
	}
	public String getDocType() {
		return docType;
	}
	public void setDocType(String docType) {
		this.docType = docType;
	}
	
}
