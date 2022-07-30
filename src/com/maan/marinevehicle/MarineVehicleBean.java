package com.maan.marinevehicle;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MarineVehicleBean {
	private File upload;
	private String uploadFileName;
	private String uploadContentType;
	private String display;
	
	private String tranId;
	private String deleteStatus;
	private String searchType;
	private String searchValue;
	private String openCoverNo;
	private String proposalNo;
	private String customerName;
	private String startDate;
	private String endDate;
	private String endtYN;
	private String expiryDate;
	private String effectiveDate;
	private String status;
	private String reUpload;
	private List<Map<String,Object>>marineVehicleDetails;
	private List<Map<String,Object>>opencoverDetails;
	private List<Map<String,Object>>transDetails;
	private List<Map<String,Object>> haulierDetails;
	private List<Map<String,Object>>vehicletransDetails;
	private List<Map<String,Object>>premiumDetails;
	private List<Map<String, Object>> dellist;
	private List<String> checkvalue;
	private List<String> transNo;
	private List<String> sno;
	private List<String> proposalno;
	private String baseOpenCoverNo;
	private String refundchargeamount;
	private String brokerId;
	private String totalPremium;
	private String policyFee;
	private String inceptionFee;
	private String finalPremium;
	private String receviedAmt;
	private String policyFeeRcvd;
	private String inceptionFeeRcvd;
	private String PremiumRcvd;
	private String balanceAmt;
	private String policyFeeBal;
	private String inceptionFeeBal;
	private String receviedTot;
	private String chargeableYN;
	private String menuBlocker;
	private String refundAmt;
	private String policyFeePaid;
	private String inceptionFeePaid;
	private String total;
	private String chargeablePercent;
	private String refundChrgYN;
	private String reqFrom;
	private String premium;
	private String conditionDesc;
	private String policyNo;
	private String creditNoteNo;
	private String debitNoteNo;
	/*
	 * PayMent Term added for vehicle upload
	 */
	private List<String>  dueamount;
	private List<String>  duepercent;
	private List<String>  dueDate;
	private List<String>  dueList;
	private List<String>  effectiveDatePT;
    private List<Object> userSelection;
	private String userLoginId;
	private String snoPT;
	private String lapsedStatus;
	
	private String vatTax;
	private String vatTaxPrecent;
	private String fileauth;
	private String fileurl;
	private String fileReq;
	private String errorDesc;
	private List<HashMap<String,Object>> errors=new ArrayList<HashMap<String,Object>>();
	
	
	public String getCreditNoteNo() {
		return creditNoteNo;
	}
	public void setCreditNoteNo(String creditNoteNo) {
		this.creditNoteNo = creditNoteNo;
	}
	public String getDebitNoteNo() {
		return debitNoteNo;
	}
	public void setDebitNoteNo(String debitNoteNo) {
		this.debitNoteNo = debitNoteNo;
	}
	public List<HashMap<String, Object>> getErrors() {
		return errors;
	}
	public void setErrors(List<HashMap<String, Object>> errors) {
		this.errors = errors;
	}
	public String getErrorDesc() {
		return errorDesc;
	}
	public void setErrorDesc(String errorDesc) {
		this.errorDesc = errorDesc;
	}
	public String getFileauth() {
		return fileauth;
	}
	public void setFileauth(String fileauth) {
		this.fileauth = fileauth;
	}
	public String getFileurl() {
		return fileurl;
	}
	public void setFileurl(String fileurl) {
		this.fileurl = fileurl;
	}
	public String getFileReq() {
		return fileReq;
	}
	public void setFileReq(String fileReq) {
		this.fileReq = fileReq;
	}
	public List<String> getDueamount() {
		return dueamount;
	}
	public List<String> getDuepercent() {
		return duepercent;
	}
	public List<String> getDueDate() {
		return dueDate;
	}
	public List<String> getDueList() {
		return dueList;
	}
	public List<String> getEffectiveDatePT() {
		return effectiveDatePT;
	}
	public List<Object> getUserSelection() {
		return userSelection;
	}
	public String getUserLoginId() {
		return userLoginId;
	}
	public String getSnoPT() {
		return snoPT;
	}
	public String getAmendId() {
		return amendId;
	}
	public void setDueamount(List<String> dueamount) {
		this.dueamount = dueamount;
	}
	public void setDuepercent(List<String> duepercent) {
		this.duepercent = duepercent;
	}
	public void setDueDate(List<String> dueDate) {
		this.dueDate = dueDate;
	}
	public void setDueList(List<String> dueList) {
		this.dueList = dueList;
	}
	public void setEffectiveDatePT(List<String> effectiveDatePT) {
		this.effectiveDatePT = effectiveDatePT;
	}
	public void setUserSelection(List<Object> userSelection) {
		this.userSelection = userSelection;
	}
	public void setUserLoginId(String userLoginId) {
		this.userLoginId = userLoginId;
	}
	public void setSnoPT(String snoPT) {
		this.snoPT = snoPT;
	}
	public void setAmendId(String amendId) {
		this.amendId = amendId;
	}
	private String amendId;
	
	public String getPremium() {
		return premium;
	}
	public void setPremium(String premium) {
		this.premium = premium;
	}
	private String generatePolicy;
	public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public String getUploadContentType() {
		return uploadContentType;
	}
	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}
	public String getDisplay() {
		return display;
	}
	public void setDisplay(String display) {
		this.display = display;
	}
	public String getTranId() {
		return tranId;
	}
	public void setTranId(String tranId) {
		this.tranId = tranId;
	}
	public String getDeleteStatus() {
		return deleteStatus;
	}
	public void setDeleteStatus(String deleteStatus) {
		this.deleteStatus = deleteStatus;
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
	public String getOpenCoverNo() {
		return openCoverNo;
	}
	public void setOpenCoverNo(String openCoverNo) {
		this.openCoverNo = openCoverNo;
	}
	public String getProposalNo() {
		return proposalNo;
	}
	public void setProposalNo(String proposalNo) {
		this.proposalNo = proposalNo;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
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
	public String getEndtYN() {
		return endtYN;
	}
	public void setEndtYN(String endtYN) {
		this.endtYN = endtYN;
	}
	public String getExpiryDate() {
		return expiryDate;
	}
	public void setExpiryDate(String expiryDate) {
		this.expiryDate = expiryDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getReUpload() {
		return reUpload;
	}
	public void setReUpload(String reUpload) {
		this.reUpload = reUpload;
	}
	public List<Map<String, Object>> getMarineVehicleDetails() {
		return marineVehicleDetails;
	}
	public void setMarineVehicleDetails(
			List<Map<String, Object>> marineVehicleDetails) {
		this.marineVehicleDetails = marineVehicleDetails;
	}
	public List<Map<String, Object>> getOpencoverDetails() {
		return opencoverDetails;
	}
	public void setOpencoverDetails(List<Map<String, Object>> opencoverDetails) {
		this.opencoverDetails = opencoverDetails;
	}
	public List<Map<String, Object>> getTransDetails() {
		return transDetails;
	}
	public void setTransDetails(List<Map<String, Object>> transDetails) {
		this.transDetails = transDetails;
	}
	public List<Map<String, Object>> getHaulierDetails() {
		return haulierDetails;
	}
	public void setHaulierDetails(List<Map<String, Object>> haulierDetails) {
		this.haulierDetails = haulierDetails;
	}
	public List<Map<String, Object>> getVehicletransDetails() {
		return vehicletransDetails;
	}
	public void setVehicletransDetails(List<Map<String, Object>> vehicletransDetails) {
		this.vehicletransDetails = vehicletransDetails;
	}
	public List<Map<String, Object>> getPremiumDetails() {
		return premiumDetails;
	}
	public void setPremiumDetails(List<Map<String, Object>> premiumDetails) {
		this.premiumDetails = premiumDetails;
	}
	public List<Map<String, Object>> getDellist() {
		return dellist;
	}
	public void setDellist(List<Map<String, Object>> dellist) {
		this.dellist = dellist;
	}
	public List<String> getCheckvalue() {
		return checkvalue;
	}
	public void setCheckvalue(List<String> checkvalue) {
		this.checkvalue = checkvalue;
	}
	public List<String> getTransNo() {
		return transNo;
	}
	public void setTransNo(List<String> transNo) {
		this.transNo = transNo;
	}
	public List<String> getSno() {
		return sno;
	}
	public void setSno(List<String> sno) {
		this.sno = sno;
	}
	public List<String> getProposalno() {
		return proposalno;
	}
	public void setProposalno(List<String> proposalno) {
		this.proposalno = proposalno;
	}
	public String getBaseOpenCoverNo() {
		return baseOpenCoverNo;
	}
	public void setBaseOpenCoverNo(String baseOpenCoverNo) {
		this.baseOpenCoverNo = baseOpenCoverNo;
	}
	public String getRefundchargeamount() {
		return refundchargeamount;
	}
	public void setRefundchargeamount(String refundchargeamount) {
		this.refundchargeamount = refundchargeamount;
	}
	public String getBrokerId() {
		return brokerId;
	}
	public void setBrokerId(String brokerId) {
		this.brokerId = brokerId;
	}
	public String getTotalPremium() {
		return totalPremium;
	}
	public void setTotalPremium(String totalPremium) {
		this.totalPremium = totalPremium;
	}
	public String getPolicyFee() {
		return policyFee;
	}
	public void setPolicyFee(String policyFee) {
		this.policyFee = policyFee;
	}
	public String getInceptionFee() {
		return inceptionFee;
	}
	public void setInceptionFee(String inceptionFee) {
		this.inceptionFee = inceptionFee;
	}
	public String getFinalPremium() {
		return finalPremium;
	}
	public void setFinalPremium(String finalPremium) {
		this.finalPremium = finalPremium;
	}
	public String getReceviedAmt() {
		return receviedAmt;
	}
	public void setReceviedAmt(String receviedAmt) {
		this.receviedAmt = receviedAmt;
	}
	public String getPolicyFeeRcvd() {
		return policyFeeRcvd;
	}
	public void setPolicyFeeRcvd(String policyFeeRcvd) {
		this.policyFeeRcvd = policyFeeRcvd;
	}
	public String getInceptionFeeRcvd() {
		return inceptionFeeRcvd;
	}
	public void setInceptionFeeRcvd(String inceptionFeeRcvd) {
		this.inceptionFeeRcvd = inceptionFeeRcvd;
	}
	public String getPremiumRcvd() {
		return PremiumRcvd;
	}
	public void setPremiumRcvd(String premiumRcvd) {
		PremiumRcvd = premiumRcvd;
	}
	public String getBalanceAmt() {
		return balanceAmt;
	}
	public void setBalanceAmt(String balanceAmt) {
		this.balanceAmt = balanceAmt;
	}
	public String getPolicyFeeBal() {
		return policyFeeBal;
	}
	public void setPolicyFeeBal(String policyFeeBal) {
		this.policyFeeBal = policyFeeBal;
	}
	public String getInceptionFeeBal() {
		return inceptionFeeBal;
	}
	public void setInceptionFeeBal(String inceptionFeeBal) {
		this.inceptionFeeBal = inceptionFeeBal;
	}
	public String getReceviedTot() {
		return receviedTot;
	}
	public void setReceviedTot(String receviedTot) {
		this.receviedTot = receviedTot;
	}
	public String getChargeableYN() {
		return chargeableYN;
	}
	public void setChargeableYN(String chargeableYN) {
		this.chargeableYN = chargeableYN;
	}
	public String getMenuBlocker() {
		return menuBlocker;
	}
	public void setMenuBlocker(String menuBlocker) {
		this.menuBlocker = menuBlocker;
	}
	public String getRefundAmt() {
		return refundAmt;
	}
	public void setRefundAmt(String refundAmt) {
		this.refundAmt = refundAmt;
	}
	public String getPolicyFeePaid() {
		return policyFeePaid;
	}
	public void setPolicyFeePaid(String policyFeePaid) {
		this.policyFeePaid = policyFeePaid;
	}
	public String getInceptionFeePaid() {
		return inceptionFeePaid;
	}
	public void setInceptionFeePaid(String inceptionFeePaid) {
		this.inceptionFeePaid = inceptionFeePaid;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public String getChargeablePercent() {
		return chargeablePercent;
	}
	public void setChargeablePercent(String chargeablePercent) {
		this.chargeablePercent = chargeablePercent;
	}
	public String getRefundChrgYN() {
		return refundChrgYN;
	}
	public void setRefundChrgYN(String refundChrgYN) {
		this.refundChrgYN = refundChrgYN;
	}
	public void setReqFrom(String reqFrom) {
		this.reqFrom = reqFrom;
	}
	public String getReqFrom() {
		return reqFrom;
	}
	public void setGeneratePolicy(String generatePolicy) {
		this.generatePolicy = generatePolicy;
	}
	public String getGeneratePolicy() {
		return generatePolicy;
	}
	public void setConditionDesc(String conditionDesc) {
		this.conditionDesc = conditionDesc;
	}
	public String getConditionDesc() {
		return conditionDesc;
	}
	public void setEffectiveDate(String effectiveDate) {
		this.effectiveDate = effectiveDate;
	}
	public String getEffectiveDate() {
		return effectiveDate;
	}
	public void setPolicyNo(String policyNo) {
		this.policyNo = policyNo;
	}
	public String getPolicyNo() {
		return policyNo;
	}
	public void setLapsedStatus(String lapsedStatus) {
		this.lapsedStatus = lapsedStatus;
	}
	public String getLapsedStatus() {
		return lapsedStatus;
	}
	public void setVatTax(String vatTax) {
		this.vatTax = vatTax;
	}
	public String getVatTax() {
		return vatTax;
	}
	public void setVatTaxPrecent(String vatTaxPrecent) {
		this.vatTaxPrecent = vatTaxPrecent;
	}
	public String getVatTaxPrecent() {
		return vatTaxPrecent;
	}
	
	
	
}
