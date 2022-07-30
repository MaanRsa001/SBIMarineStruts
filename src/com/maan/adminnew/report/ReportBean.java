package com.maan.adminnew.report;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ReportBean {
	private String agencyCode;
	private String borganization;
	private String bcode;
	private String firstname;
	private String uagencyCode;
	private String mode;
	private String from;
	private String productID;
	private String reqFrom;
	private String from1;
	private String broker;
	private String proposalNo;
	private String policynumber;
	private String docType;
	private String endtstatus;
	private String docNo;
	private String amendId;
	private String loginId;
	private String startDate;
	private String endDate;
	private String startDate1;
	private String endDate1;
	private String utype;
	private String mode1;
	private String index="0";
	private String searchBy;
	private String searchValue;
	private String commodity;
	private String busType;
	private String orginCountry;
	private String destCountry;
	private String[] orginCountries;
	private String[] destCountries;
	private String transportId;
	private String coverId;
	private String[] rag;
	private String[] brokers;
	private String rags;
	private String reportStatus;
	private String branch;
	private String effDate;
	private String vesselName;
	private String tranId;
	private String loginBranch;
	private String fileName;
	private String downloadType;
	private String mode2;
	private String reportType;
	// for a link in opencoverreport
	private String openCoverNo; 
	private String openCoverBroker;
	List<Object> countrySmartList=new ArrayList<Object>();
	private List<Map<String,Object>> overAllListOne;
	private List<Map<String,Object>> overAllListOpen;
	private List<MarineDashBoardPiv> pivrecords;
	private List<HashMap<String,Object>> errors=new ArrayList<HashMap<String,Object>>();
	private List<Map<String,Object>> integrationFailedList;
	private String applicationNo;
	private String quoteNo;
	private String msgId;
	private String transId;
	private String sourceAppId;
	private String destAppId;
	private String transDesc;
	private String docNumber;
	private String policyType;
	private String effectiveDate;
	private String expiryDate;
	private String declarationNote;
	private String interestName;
	private String shipmentDate;
	private String bankCode;
	private String packageType;
	private String letterCreditNo;
	private String letterCreditAmount;
	private String letterCreditCurrency;
	private String sumInsured;
	private String latestSumInsured;
	private String basicEvaluation;
	private String conveyenceCode;
	private String conveyenceDesc;
	private String riskCategory;
	private String quantity;
	private String deductableNote;
	private String cargoType;
	private String cargoTypeDesc;
	private String loardingPort;
	private String arrivalPort;
	private String sailRoute;
	private String vesselYearBuilt;
	private String vesselNatonality;
	private String vesselClass;
	private String minimumPremium;
	private String netPremiumLc;
	private String grossPremiumLc;
	private String totalFeeLC;
	private String certificateSI;
	private String allcertificateSI;
	private String openCoverSI;
	private String policyNo;
	private String integReq;
	private String integRes;
	private String marinePremium;
	private String warPremium;
	private List<Object>bankList=new ArrayList<Object>();
	private List<Object>packageList=new ArrayList<Object>();
	private List<Object>trnasportList=new ArrayList<Object>();
	private List<Object>saletermList=new ArrayList<Object>();
	private List<Object>commodityList=new ArrayList<Object>();
	private List<Object>countryList=new ArrayList<Object>();
	public String getReportType() {
		return reportType;
	}
	public void setReportType(String reportType) {
		this.reportType = reportType;
	}
	public String getEffDate() {
		return effDate;
	}
	public void setEffDate(String effDate) {
		this.effDate = effDate;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public String getReportStatus() {
		return reportStatus;
	}
	public void setReportStatus(String reportStatus) {
		this.reportStatus = reportStatus;
	}
	public String getFrom1() {
		return from1;
	}
	public void setFrom1(String from1) {
		this.from1 = from1;
	}
	public String getBorganization() {
		return borganization;
	}
	public void setBorganization(String borganization) {
		this.borganization = borganization;
	}
	public String getBcode() {
		return bcode;
	}
	public void setBcode(String bcode) {
		this.bcode = bcode;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getAgencyCode() {
		return agencyCode;
	}
	public void setAgencyCode(String agencyCode) {
		this.agencyCode = agencyCode;
	}
	public String getUagencyCode() {
		return uagencyCode;
	}
	public void setUagencyCode(String uagencyCode) {
		this.uagencyCode = uagencyCode;
	}
	public String getMode() {
		return mode;
	}
	public void setMode(String mode) {
		this.mode = mode;
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getProductID() {
		return productID;
	}
	public void setProductID(String productID) {
		this.productID = productID;
	}
	public String getReqFrom() {
		return reqFrom;
	}
	public void setReqFrom(String reqFrom) {
		this.reqFrom = reqFrom;
	}
	public String getBroker() {
		return broker;
	}
	public void setBroker(String broker) {
		this.broker = broker;
	}
	public String getProposalNo() {
		return proposalNo;
	}
	public void setProposalNo(String proposalNo) {
		this.proposalNo = proposalNo;
	}
	public String getPolicynumber() {
		return policynumber;
	}
	public void setPolicynumber(String policynumber) {
		this.policynumber = policynumber;
	}
	public String getDocType() {
		return docType;
	}
	public void setDocType(String docType) {
		this.docType = docType;
	}
	public String getEndtstatus() {
		return endtstatus;
	}
	public void setEndtstatus(String endtstatus) {
		this.endtstatus = endtstatus;
	}
	public String getDocNo() {
		return docNo;
	}
	public void setDocNo(String docNo) {
		this.docNo = docNo;
	}
	public String getAmendId() {
		return amendId;
	}
	public void setAmendId(String amendId) {
		this.amendId = amendId;
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
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
	public String getStartDate1() {
		return startDate1;
	}
	public void setStartDate1(String startDate1) {
		this.startDate1 = startDate1;
	}
	public String getEndDate1() {
		return endDate1;
	}
	public void setEndDate1(String endDate1) {
		this.endDate1 = endDate1;
	}
	public String getUtype() {
		return utype;
	}
	public void setUtype(String utype) {
		this.utype = utype;
	}
	public String getMode1() {
		return mode1;
	}
	public void setMode1(String mode1) {
		this.mode1 = mode1;
	}
	public String getIndex() {
		return index;
	}
	public void setIndex(String index) {
		this.index = index;
	}
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
	public String getCommodity() {
		return commodity;
	}
	public void setCommodity(String commodity) {
		this.commodity = commodity;
	}
	public String getBusType() {
		return busType;
	}
	public void setBusType(String busType) {
		this.busType = busType;
	}
	public String getOrginCountry() {
		return orginCountry;
	}
	public void setOrginCountry(String orginCountry) {
		this.orginCountry = orginCountry;
	}
	public String getDestCountry() {
		return destCountry;
	}
	public void setDestCountry(String destCountry) {
		this.destCountry = destCountry;
	}
	public String getTransportId() {
		return transportId;
	}
	public void setTransportId(String transportId) {
		this.transportId = transportId;
	}
	public String getCoverId() {
		return coverId;
	}
	public void setCoverId(String coverId) {
		this.coverId = coverId;
	}
	public String[] getRag(){
		return rag;
	}
	public void setRag(String[] rag) {
		this.rag = rag;
	}
	public String getRags() {
		return rags;
	}
	public void setRags(String rags) {
		this.rags = rags;
	}
	public String getVesselName() {
		return vesselName;
	}
	public void setVesselName(String vesselName) {
		this.vesselName = vesselName;
	}
	public String getTranId() {
		return tranId;
	}
	public void setTranId(String tranId) {
		this.tranId = tranId;
	}
	public String getLoginBranch() {
		return loginBranch;
	}
	public void setLoginBranch(String loginBranch) {
		this.loginBranch = loginBranch;
	}
	public String[] getBrokers() {
		return brokers;
	}
	public void setBrokers(String[] brokers) {
		this.brokers = brokers;
	}
	public List<Object> getCountrySmartList() {
		return countrySmartList;
	}
	public void setCountrySmartList(List<Object> countrySmartList) {
		this.countrySmartList = countrySmartList;
	}
	public String[] getOrginCountries() {
		return orginCountries;
	}
	public String[] getDestCountries() {
		return destCountries;
	}
	public void setOrginCountries(String[] orginCountries) {
		this.orginCountries = orginCountries;
	}
	public void setDestCountries(String[] destCountries) {
		this.destCountries = destCountries;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getDownloadType() {
		return downloadType;
	}
	public void setDownloadType(String downloadType) {
		this.downloadType = downloadType;
	}
	public void setOpenCoverNo(String openCoverNo) {
		this.openCoverNo = openCoverNo;
	}
	public String getOpenCoverNo() {
		return openCoverNo;
	}
	public void setOpenCoverBroker(String openCoverBroker) {
		this.openCoverBroker = openCoverBroker;
	}
	public String getOpenCoverBroker() {
		return openCoverBroker;
	}
	public void setOverAllListOne(List<Map<String,Object>> overAllListOne) {
		this.overAllListOne = overAllListOne;
	}
	public List<Map<String,Object>> getOverAllListOne() {
		return overAllListOne;
	}
	public void setOverAllListOpen(List<Map<String,Object>> overAllListOpen) {
		this.overAllListOpen = overAllListOpen;
	}
	public List<Map<String,Object>> getOverAllListOpen() {
		return overAllListOpen;
	}
	public void setMode2(String mode2) {
		this.mode2 = mode2;
	}
	public String getMode2() {
		return mode2;
	}
	public List<MarineDashBoardPiv> getPivrecords() {
		return pivrecords;
	}
	public void setPivrecords(List<MarineDashBoardPiv> pivrecords) {
		this.pivrecords = pivrecords;
	}
	public List<Map<String, Object>> getIntegrationFailedList() {
		return integrationFailedList;
	}
	public void setIntegrationFailedList(List<Map<String, Object>> integrationFailedList) {
		this.integrationFailedList = integrationFailedList;
	}
	public String getQuoteNo() {
		return quoteNo;
	}
	public void setQuoteNo(String quoteNo) {
		this.quoteNo = quoteNo;
	}
	public String getMsgId() {
		return msgId;
	}
	public void setMsgId(String msgId) {
		this.msgId = msgId;
	}
	public String getTransId() {
		return transId;
	}
	public void setTransId(String transId) {
		this.transId = transId;
	}
	public String getSourceAppId() {
		return sourceAppId;
	}
	public void setSourceAppId(String sourceAppId) {
		this.sourceAppId = sourceAppId;
	}
	public String getDestAppId() {
		return destAppId;
	}
	public void setDestAppId(String destAppId) {
		this.destAppId = destAppId;
	}
	public String getTransDesc() {
		return transDesc;
	}
	public void setTransDesc(String transDesc) {
		this.transDesc = transDesc;
	}
	public String getDocNumber() {
		return docNumber;
	}
	public void setDocNumber(String docNumber) {
		this.docNumber = docNumber;
	}
	public String getPolicyType() {
		return policyType;
	}
	public void setPolicyType(String policyType) {
		this.policyType = policyType;
	}
	public String getEffectiveDate() {
		return effectiveDate;
	}
	public void setEffectiveDate(String effectiveDate) {
		this.effectiveDate = effectiveDate;
	}
	public String getExpiryDate() {
		return expiryDate;
	}
	public void setExpiryDate(String expiryDate) {
		this.expiryDate = expiryDate;
	}
	public String getDeclarationNote() {
		return declarationNote;
	}
	public void setDeclarationNote(String declarationNote) {
		this.declarationNote = declarationNote;
	}
	public String getInterestName() {
		return interestName;
	}
	public void setInterestName(String interestName) {
		this.interestName = interestName;
	}
	public String getShipmentDate() {
		return shipmentDate;
	}
	public void setShipmentDate(String shipmentDate) {
		this.shipmentDate = shipmentDate;
	}
	public String getBankCode() {
		return bankCode;
	}
	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}
	public String getPackageType() {
		return packageType;
	}
	public void setPackageType(String packageType) {
		this.packageType = packageType;
	}
	public String getLetterCreditNo() {
		return letterCreditNo;
	}
	public void setLetterCreditNo(String letterCreditNo) {
		this.letterCreditNo = letterCreditNo;
	}
	public String getLetterCreditAmount() {
		return letterCreditAmount;
	}
	public void setLetterCreditAmount(String letterCreditAmount) {
		this.letterCreditAmount = letterCreditAmount;
	}
	public String getLetterCreditCurrency() {
		return letterCreditCurrency;
	}
	public void setLetterCreditCurrency(String letterCreditCurrency) {
		this.letterCreditCurrency = letterCreditCurrency;
	}
	public String getSumInsured() {
		return sumInsured;
	}
	public void setSumInsured(String sumInsured) {
		this.sumInsured = sumInsured;
	}
	public String getLatestSumInsured() {
		return latestSumInsured;
	}
	public void setLatestSumInsured(String latestSumInsured) {
		this.latestSumInsured = latestSumInsured;
	}
	public String getBasicEvaluation() {
		return basicEvaluation;
	}
	public void setBasicEvaluation(String basicEvaluation) {
		this.basicEvaluation = basicEvaluation;
	}
	public String getConveyenceCode() {
		return conveyenceCode;
	}
	public void setConveyenceCode(String conveyenceCode) {
		this.conveyenceCode = conveyenceCode;
	}
	public String getConveyenceDesc() {
		return conveyenceDesc;
	}
	public void setConveyenceDesc(String conveyenceDesc) {
		this.conveyenceDesc = conveyenceDesc;
	}
	public String getRiskCategory() {
		return riskCategory;
	}
	public void setRiskCategory(String riskCategory) {
		this.riskCategory = riskCategory;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	public String getDeductableNote() {
		return deductableNote;
	}
	public void setDeductableNote(String deductableNote) {
		this.deductableNote = deductableNote;
	}
	public String getCargoType() {
		return cargoType;
	}
	public void setCargoType(String cargoType) {
		this.cargoType = cargoType;
	}
	public String getCargoTypeDesc() {
		return cargoTypeDesc;
	}
	public void setCargoTypeDesc(String cargoTypeDesc) {
		this.cargoTypeDesc = cargoTypeDesc;
	}
	public String getLoardingPort() {
		return loardingPort;
	}
	public void setLoardingPort(String loardingPort) {
		this.loardingPort = loardingPort;
	}
	public String getArrivalPort() {
		return arrivalPort;
	}
	public void setArrivalPort(String arrivalPort) {
		this.arrivalPort = arrivalPort;
	}
	public String getSailRoute() {
		return sailRoute;
	}
	public void setSailRoute(String sailRoute) {
		this.sailRoute = sailRoute;
	}
	public String getVesselYearBuilt() {
		return vesselYearBuilt;
	}
	public void setVesselYearBuilt(String vesselYearBuilt) {
		this.vesselYearBuilt = vesselYearBuilt;
	}
	public String getVesselNatonality() {
		return vesselNatonality;
	}
	public void setVesselNatonality(String vesselNatonality) {
		this.vesselNatonality = vesselNatonality;
	}
	public String getVesselClass() {
		return vesselClass;
	}
	public void setVesselClass(String vesselClass) {
		this.vesselClass = vesselClass;
	}
	public String getMinimumPremium() {
		return minimumPremium;
	}
	public void setMinimumPremium(String minimumPremium) {
		this.minimumPremium = minimumPremium;
	}
	public String getNetPremiumLc() {
		return netPremiumLc;
	}
	public void setNetPremiumLc(String netPremiumLc) {
		this.netPremiumLc = netPremiumLc;
	}
	public String getGrossPremiumLc() {
		return grossPremiumLc;
	}
	public void setGrossPremiumLc(String grossPremiumLc) {
		this.grossPremiumLc = grossPremiumLc;
	}
	public String getTotalFeeLC() {
		return totalFeeLC;
	}
	public void setTotalFeeLC(String totalFeeLC) {
		this.totalFeeLC = totalFeeLC;
	}
	public String getCertificateSI() {
		return certificateSI;
	}
	public void setCertificateSI(String certificateSI) {
		this.certificateSI = certificateSI;
	}
	public String getAllcertificateSI() {
		return allcertificateSI;
	}
	public void setAllcertificateSI(String allcertificateSI) {
		this.allcertificateSI = allcertificateSI;
	}
	public String getOpenCoverSI() {
		return openCoverSI;
	}
	public void setOpenCoverSI(String openCoverSI) {
		this.openCoverSI = openCoverSI;
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
	public String getApplicationNo() {
		return applicationNo;
	}
	public void setApplicationNo(String applicationNo) {
		this.applicationNo = applicationNo;
	}
	public String getIntegReq() {
		return integReq;
	}
	public void setIntegReq(String integReq) {
		this.integReq = integReq;
	}
	public String getIntegRes() {
		return integRes;
	}
	public void setIntegRes(String integRes) {
		this.integRes = integRes;
	}
	public List<Object> getBankList() {
		return bankList;
	}
	public void setBankList(List<Object> bankList) {
		this.bankList = bankList;
	}
	public List<Object> getPackageList() {
		return packageList;
	}
	public void setPackageList(List<Object> packageList) {
		this.packageList = packageList;
	}
	public List<Object> getTrnasportList() {
		return trnasportList;
	}
	public void setTrnasportList(List<Object> trnasportList) {
		this.trnasportList = trnasportList;
	}
	public List<Object> getSaletermList() {
		return saletermList;
	}
	public void setSaletermList(List<Object> saletermList) {
		this.saletermList = saletermList;
	}
	public List<Object> getCommodityList() {
		return commodityList;
	}
	public void setCommodityList(List<Object> commodityList) {
		this.commodityList = commodityList;
	}
	public List<Object> getCountryList() {
		return countryList;
	}
	public void setCountryList(List<Object> countryList) {
		this.countryList = countryList;
	}
	public String getMarinePremium() {
		return marinePremium;
	}
	public void setMarinePremium(String marinePremium) {
		this.marinePremium = marinePremium;
	}
	public String getWarPremium() {
		return warPremium;
	}
	public void setWarPremium(String warPremium) {
		this.warPremium = warPremium;
	}
	
}
