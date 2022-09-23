package com.maan.NewOpenCover;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class OpenCoverBean {

	private String springtoken;
	private List<Object> customerSelectionlist;
	private List<Object> includeList;
	private List<Object> excludeList;
	private List<Object> contientList;
	private List<Object>  coverageList;
	private List<Object>  currencyList;
	private List<Object> commodityinList;
	private List<Object> commoditynotinList;
	private List<Object> OrginalInsuranceList; 
	private List<Object> additionalInsuranceList;
	private List<Object> optedTolerance;
	private String warmodeTransSize;
	
	private String loginId;
	private String customerId;
	private String chcustomerIds;
	private String brokerId;
	private String mode;
	private String title;
	private String custName;
	private String custNameAr;
	private String custCode;
	private String address1;
	private String address2;
	private String poBox;
	private String email;
	private String city;
	private String mobileNo;
	private String custVatRegNo;
	private String branchCode;
	private String belongingBranch;
	private String proposalNo;
	private String newproposalNo;
	private String productId;
	private String insuredName;
	private String crossVoyage;
	private String estimateAmount; 
	private String SILimit; 
	private String backDays;
	private String commission;
	private String freeText;
	private String no_ofCompany;
	private String rsaValue;
	private String type;
	private String missippiCode;
	private String businessType;
	private String missisippiOpenPolicyId;
	private String wAndSrc;
	private String expMiniPremium;
	private String opencoverstartdate;
	private String opencoverenddate;
	private String countryRemarks;
	private String currency;
	private String exchangeRate;
	private String issuanceFee;
	private String minPremiumIssuance;
	private String foreignTurnOver;
	private String minPreMulType;
	private String minPreMul;
	private String lossDetail;
	private String claimRatio;
	private String additionalInfo;
	private String proposalStatus;
	private String confirmStatus;
	private String defaultClauses;
	private String executiveId;
	private String debitType;
	private String utilizedAmount;
	private String decType;
	private String noOfvehicles;
	private String haulierPremium;
	private String remarks;
	private String paymentRemarks;
	private String certPremiumYN;
	private String marginYN;
	private String marginPercent;
	private String warLand;
	private String facYN;
	private String certNo;
	private String userType;
	private String customerName;
	
	private String voyageValue;
	private String policyNo;
	private String renNo;
	private String crossMiniPremium;
	private String haulierType;
	private String endorsementFee;
	private String vatTaxPrecent;
	private String warYN;
	private String ajaxId;
	private String commodityIds;
	private String commodityNames;
	private String chkProposalNo;
	private String identify;
	private String countryIds;
	private String saleTermIds;
	private String originalInsured;
	private String toleranceIds;
	private String currencyType;
	private String effectiveDate;
	private String extraCover;
	private String transit_country;
	private String destination_country;
	private String txtarCryRemarkes;
	private String customer;
	private String commodity_TA;
	private String totalCommudity;
	private String saleTermName;
	private String saletermId;
	private String tolerance;
	private String toleranceId;
	private String transit_countryId;
	private String totalTransitId;
	private String destination_countryId;
	private String totalDestinationId;
	private List<String>commditycheck;
	private List<String>commdityId;
	private List<String>commdityName;
	private List<String>commdityNameDesc;
	private List<String>commdityFragile;
	private List<String>commodityTypeId;
	private List<String>chcustomercheck;
	private List<String>chcustomerId;
	private List<String>chcustomerName;
	private List<String>modeTransportcheck;
	private List<String>modeTransportId;
	private List<String>modeTransportName;
	private List<String>covercheck;
	private List<String>modecoverId;
	private List<String>coverId;
	private List<String> coverTypeId;
	private List<String> coverTypeName;
	private List<String>coverName;
	private List<String>currencyId;
	private List<String>currencyName;
	private List<String> currencyValue;
	private List<String>perbottomLimit;
	private List<String>locationLimit;
	private List<String>commodityModeId=new ArrayList<>();
	private List<String>commodityModeName=new ArrayList<>();
	private List<String>commodityCoverId=new ArrayList<>();
	private List<String>commodityCoverName=new ArrayList<>();
	private List<String>commoditybaseRate=new ArrayList<>();
	private List<String>commodityexcessPer=new ArrayList<>();
	private List<String>commodityexcessVal=new ArrayList<>();
	private List<String>commodityexcessDesc=new ArrayList<>();
	private List<Map<String,Object>>commodityRateList;
	private List<Map<String,Object>>modeoftransList;
	private List<Map<String,Object>>coverList;
	private String commodityCode;
	private String coverTypeNames;
	private String coverTypeIds;
	private String modeOfTransport;
	private String modeOfTransportName;
	private String cityCode;
	private String cityName;
	private String warRate;
	private String excoverTypeIds;
	private String conditionId;
	private String conditionName;
	private List<String>clausescheck;
	private List<String>clausesId;
	private List<String>clausesName;
	private List<String>commdityIds;
	private List<String>warcityCode;
	private List<String>warcityName;
	private List<String>warBaseRate;
	private List<String>warmodeTransId;
	private List<String>warcitymodeTransId;
	private List<String>warmodeTransName;
	private List<String>warsno;
	private String deleteId;
	private String psuminsured;
	private String pmarineRate;
	private String pwarRate;
	private String balanceDepositPremium;
	private String utilizedPremium;
	private String totalPremium;
	private String actualPremium;
	private String policyFee;
	private String inceptionFee;
	private String finalPremium;
	
	private String receviedAmt;
	private String policyFeeRcvd;
	private String inceptionFeeRcvd;
	private String premiumRcvd;
	
	private String balanceAmt;
	private String policyFeeBal;
	private String inceptionFeeBal;
	private String receviedTot;
	
	private String chargeableYN;
	private String refundAmt;
	private String policyFeePaid;
	private String inceptionFeePaid;
	private String total;
	private String refundChrgYN;
	private String endtStatus;
	private List<String>noofInsrance;
	private List<String>companyId;
	private List<String>companyName;
	private List<String>shareValue;
	private List<String>leaderYN;
	
	private String openCoverNo;
	private String opencovergenerate;
	private String renewalYN;
	private String endtYN;
	private String policyeffectiveDate;
	private String deposit;
	private String depositPremiumType;
	private String depositType;
	private String depositDate;
	private String debitNoteNo;
	private String creditNoteNo;
	private String installType;
	private String marinePremium;
	private String warPremium;
	private String vatTax;
	private String debitNoteName;
	private String cancelClaus;
	private String ratesYN;
	private String amendedClauseYN;
	private String ppwdays;
	private String openCoverType;
	private List<String>transportId;
	private List<String>conveyanceDesc;
	private List<Object> endtType;
	private String endorsementRemarks;
	private String cancellationDate;
	private String cancellationRemarks;
	private List<String>hauliersno;
	private List<String>haulierCategoryId;
	private List<String>haulierCategory;
	private List<String>startLimit;
	private List<String>endLimit;
	private List<String>premiumVec;
	private List<HashMap<String,Object>> errors=new ArrayList<HashMap<String,Object>>();
	private String cobrokingYn;
	private String noofCobroking;
	private String cobrokinghunYN;
	private String policyType;
	private String importYn;
	private String serviceTaxYN;
	private String rateModifyYN;
	private String ratingType;
	private String exposureValue;
	private String loaddiscountYN;
	private String loadingPercent;
	private String discountPercent;
	private String consolidateGstYN;
	private String globalPolicy;
	private String globalBusiness;
	private String facshare;
	private String inwardfacYN;
	private String underWriterId;
	
	public String getSpringtoken() {
		return springtoken;
	}
	public void setSpringtoken(String springtoken) {
		this.springtoken = springtoken;
	}
	public List<Object> getCustomerSelectionlist() {
		return customerSelectionlist;
	}
	public void setCustomerSelectionlist(List<Object> customerSelectionlist) {
		this.customerSelectionlist = customerSelectionlist;
	}
	public List<Object> getIncludeList() {
		return includeList;
	}
	public void setIncludeList(List<Object> includeList) {
		this.includeList = includeList;
	}
	public List<Object> getExcludeList() {
		return excludeList;
	}
	public void setExcludeList(List<Object> excludeList) {
		this.excludeList = excludeList;
	}
	public List<Object> getContientList() {
		return contientList;
	}
	public void setContientList(List<Object> contientList) {
		this.contientList = contientList;
	}
	public List<Object> getCoverageList() {
		return coverageList;
	}
	public void setCoverageList(List<Object> coverageList) {
		this.coverageList = coverageList;
	}
	public List<Object> getCurrencyList() {
		return currencyList;
	}
	public void setCurrencyList(List<Object> currencyList) {
		this.currencyList = currencyList;
	}
	public List<Object> getCommodityinList() {
		return commodityinList;
	}
	public void setCommodityinList(List<Object> commodityinList) {
		this.commodityinList = commodityinList;
	}
	public List<Object> getCommoditynotinList() {
		return commoditynotinList;
	}
	public void setCommoditynotinList(List<Object> commoditynotinList) {
		this.commoditynotinList = commoditynotinList;
	}
	public List<Object> getOrginalInsuranceList() {
		return OrginalInsuranceList;
	}
	public void setOrginalInsuranceList(List<Object> orginalInsuranceList) {
		OrginalInsuranceList = orginalInsuranceList;
	}
	public List<Object> getAdditionalInsuranceList() {
		return additionalInsuranceList;
	}
	public void setAdditionalInsuranceList(List<Object> additionalInsuranceList) {
		this.additionalInsuranceList = additionalInsuranceList;
	}
	public String getWarmodeTransSize() {
		return warmodeTransSize;
	}
	public void setWarmodeTransSize(String warmodeTransSize) {
		this.warmodeTransSize = warmodeTransSize;
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public String getBrokerId() {
		return brokerId;
	}
	public void setBrokerId(String brokerId) {
		this.brokerId = brokerId;
	}
	public String getMode() {
		return mode;
	}
	public void setMode(String mode) {
		this.mode = mode;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCustName() {
		return custName;
	}
	public void setCustName(String custName) {
		this.custName = custName;
	}
	public String getCustNameAr() {
		return custNameAr;
	}
	public void setCustNameAr(String custNameAr) {
		this.custNameAr = custNameAr;
	}
	public String getCustCode() {
		return custCode;
	}
	public void setCustCode(String custCode) {
		this.custCode = custCode;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getPoBox() {
		return poBox;
	}
	public void setPoBox(String poBox) {
		this.poBox = poBox;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getMobileNo() {
		return mobileNo;
	}
	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}
	public String getCustVatRegNo() {
		return custVatRegNo;
	}
	public void setCustVatRegNo(String custVatRegNo) {
		this.custVatRegNo = custVatRegNo;
	}
	public String getBranchCode() {
		return branchCode;
	}
	public void setBranchCode(String branchCode) {
		this.branchCode = branchCode;
	}
	public String getProposalNo() {
		return proposalNo;
	}
	public void setProposalNo(String proposalNo) {
		this.proposalNo = proposalNo;
	}
	public String getNewproposalNo() {
		return newproposalNo;
	}
	public void setNewproposalNo(String newproposalNo) {
		this.newproposalNo = newproposalNo;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getInsuredName() {
		return insuredName;
	}
	public void setInsuredName(String insuredName) {
		this.insuredName = insuredName;
	}
	public String getCrossVoyage() {
		return crossVoyage;
	}
	public void setCrossVoyage(String crossVoyage) {
		this.crossVoyage = crossVoyage;
	}
	public String getEstimateAmount() {
		return estimateAmount;
	}
	public void setEstimateAmount(String estimateAmount) {
		this.estimateAmount = estimateAmount;
	}
	public String getSILimit() {
		return SILimit;
	}
	public void setSILimit(String sILimit) {
		SILimit = sILimit;
	}
	public String getBackDays() {
		return backDays;
	}
	public void setBackDays(String backDays) {
		this.backDays = backDays;
	}
	public String getCommission() {
		return commission;
	}
	public void setCommission(String commission) {
		this.commission = commission;
	}
	public String getFreeText() {
		return freeText;
	}
	public void setFreeText(String freeText) {
		this.freeText = freeText;
	}
	public String getNo_ofCompany() {
		return no_ofCompany;
	}
	public void setNo_ofCompany(String no_ofCompany) {
		this.no_ofCompany = no_ofCompany;
	}
	public String getRsaValue() {
		return rsaValue;
	}
	public void setRsaValue(String rsaValue) {
		this.rsaValue = rsaValue;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getMissippiCode() {
		return missippiCode;
	}
	public void setMissippiCode(String missippiCode) {
		this.missippiCode = missippiCode;
	}
	public String getBusinessType() {
		return businessType;
	}
	public void setBusinessType(String businessType) {
		this.businessType = businessType;
	}
	public String getMissisippiOpenPolicyId() {
		return missisippiOpenPolicyId;
	}
	public void setMissisippiOpenPolicyId(String missisippiOpenPolicyId) {
		this.missisippiOpenPolicyId = missisippiOpenPolicyId;
	}
	public String getwAndSrc() {
		return wAndSrc;
	}
	public void setwAndSrc(String wAndSrc) {
		this.wAndSrc = wAndSrc;
	}
	public String getExpMiniPremium() {
		return expMiniPremium;
	}
	public void setExpMiniPremium(String expMiniPremium) {
		this.expMiniPremium = expMiniPremium;
	}
	public String getOpencoverstartdate() {
		return opencoverstartdate;
	}
	public void setOpencoverstartdate(String opencoverstartdate) {
		this.opencoverstartdate = opencoverstartdate;
	}
	public String getOpencoverenddate() {
		return opencoverenddate;
	}
	public void setOpencoverenddate(String opencoverenddate) {
		this.opencoverenddate = opencoverenddate;
	}
	public String getCountryRemarks() {
		return countryRemarks;
	}
	public void setCountryRemarks(String countryRemarks) {
		this.countryRemarks = countryRemarks;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	public String getExchangeRate() {
		return exchangeRate;
	}
	public void setExchangeRate(String exchangeRate) {
		this.exchangeRate = exchangeRate;
	}
	public String getIssuanceFee() {
		return issuanceFee;
	}
	public void setIssuanceFee(String issuanceFee) {
		this.issuanceFee = issuanceFee;
	}
	public String getMinPremiumIssuance() {
		return minPremiumIssuance;
	}
	public void setMinPremiumIssuance(String minPremiumIssuance) {
		this.minPremiumIssuance = minPremiumIssuance;
	}
	public String getForeignTurnOver() {
		return foreignTurnOver;
	}
	public void setForeignTurnOver(String foreignTurnOver) {
		this.foreignTurnOver = foreignTurnOver;
	}
	public String getMinPreMulType() {
		return minPreMulType;
	}
	public void setMinPreMulType(String minPreMulType) {
		this.minPreMulType = minPreMulType;
	}
	public String getMinPreMul() {
		return minPreMul;
	}
	public void setMinPreMul(String minPreMul) {
		this.minPreMul = minPreMul;
	}
	public String getLossDetail() {
		return lossDetail;
	}
	public void setLossDetail(String lossDetail) {
		this.lossDetail = lossDetail;
	}
	public String getClaimRatio() {
		return claimRatio;
	}
	public void setClaimRatio(String claimRatio) {
		this.claimRatio = claimRatio;
	}
	public String getAdditionalInfo() {
		return additionalInfo;
	}
	public void setAdditionalInfo(String additionalInfo) {
		this.additionalInfo = additionalInfo;
	}
	public String getProposalStatus() {
		return proposalStatus;
	}
	public void setProposalStatus(String proposalStatus) {
		this.proposalStatus = proposalStatus;
	}
	public String getConfirmStatus() {
		return confirmStatus;
	}
	public void setConfirmStatus(String confirmStatus) {
		this.confirmStatus = confirmStatus;
	}
	public String getDefaultClauses() {
		return defaultClauses;
	}
	public void setDefaultClauses(String defaultClauses) {
		this.defaultClauses = defaultClauses;
	}
	public String getExecutiveId() {
		return executiveId;
	}
	public void setExecutiveId(String executiveId) {
		this.executiveId = executiveId;
	}
	public String getDebitType() {
		return debitType;
	}
	public void setDebitType(String debitType) {
		this.debitType = debitType;
	}
	public String getUtilizedAmount() {
		return utilizedAmount;
	}
	public void setUtilizedAmount(String utilizedAmount) {
		this.utilizedAmount = utilizedAmount;
	}
	public String getDecType() {
		return decType;
	}
	public void setDecType(String decType) {
		this.decType = decType;
	}
	public String getNoOfvehicles() {
		return noOfvehicles;
	}
	public void setNoOfvehicles(String noOfvehicles) {
		this.noOfvehicles = noOfvehicles;
	}
	public String getHaulierPremium() {
		return haulierPremium;
	}
	public void setHaulierPremium(String haulierPremium) {
		this.haulierPremium = haulierPremium;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getPaymentRemarks() {
		return paymentRemarks;
	}
	public void setPaymentRemarks(String paymentRemarks) {
		this.paymentRemarks = paymentRemarks;
	}
	public String getCertPremiumYN() {
		return certPremiumYN;
	}
	public void setCertPremiumYN(String certPremiumYN) {
		this.certPremiumYN = certPremiumYN;
	}
	public String getMarginYN() {
		return marginYN;
	}
	public void setMarginYN(String marginYN) {
		this.marginYN = marginYN;
	}
	public String getMarginPercent() {
		return marginPercent;
	}
	public void setMarginPercent(String marginPercent) {
		this.marginPercent = marginPercent;
	}
	public String getWarLand() {
		return warLand;
	}
	public void setWarLand(String warLand) {
		this.warLand = warLand;
	}
	public String getFacYN() {
		return facYN;
	}
	public void setFacYN(String facYN) {
		this.facYN = facYN;
	}
	public String getCertNo() {
		return certNo;
	}
	public void setCertNo(String certNo) {
		this.certNo = certNo;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getVoyageValue() {
		return voyageValue;
	}
	public void setVoyageValue(String voyageValue) {
		this.voyageValue = voyageValue;
	}
	public String getPolicyNo() {
		return policyNo;
	}
	public void setPolicyNo(String policyNo) {
		this.policyNo = policyNo;
	}
	public String getRenNo() {
		return renNo;
	}
	public void setRenNo(String renNo) {
		this.renNo = renNo;
	}
	public String getCrossMiniPremium() {
		return crossMiniPremium;
	}
	public void setCrossMiniPremium(String crossMiniPremium) {
		this.crossMiniPremium = crossMiniPremium;
	}
	public String getHaulierType() {
		return haulierType;
	}
	public void setHaulierType(String haulierType) {
		this.haulierType = haulierType;
	}
	public String getEndorsementFee() {
		return endorsementFee;
	}
	public void setEndorsementFee(String endorsementFee) {
		this.endorsementFee = endorsementFee;
	}
	public String getVatTaxPrecent() {
		return vatTaxPrecent;
	}
	public void setVatTaxPrecent(String vatTaxPrecent) {
		this.vatTaxPrecent = vatTaxPrecent;
	}
	public String getWarYN() {
		return warYN;
	}
	public void setWarYN(String warYN) {
		this.warYN = warYN;
	}
	public String getAjaxId() {
		return ajaxId;
	}
	public void setAjaxId(String ajaxId) {
		this.ajaxId = ajaxId;
	}
	public String getCommodityIds() {
		return commodityIds;
	}
	public void setCommodityIds(String commodityIds) {
		this.commodityIds = commodityIds;
	}
	public String getCommodityNames() {
		return commodityNames;
	}
	public void setCommodityNames(String commodityNames) {
		this.commodityNames = commodityNames;
	}
	public String getChkProposalNo() {
		return chkProposalNo;
	}
	public void setChkProposalNo(String chkProposalNo) {
		this.chkProposalNo = chkProposalNo;
	}
	public String getIdentify() {
		return identify;
	}
	public void setIdentify(String identify) {
		this.identify = identify;
	}
	public String getCountryIds() {
		return countryIds;
	}
	public void setCountryIds(String countryIds) {
		this.countryIds = countryIds;
	}
	public String getSaleTermIds() {
		return saleTermIds;
	}
	public void setSaleTermIds(String saleTermIds) {
		this.saleTermIds = saleTermIds;
	}
	public String getOriginalInsured() {
		return originalInsured;
	}
	public void setOriginalInsured(String originalInsured) {
		this.originalInsured = originalInsured;
	}
	public String getToleranceIds() {
		return toleranceIds;
	}
	public void setToleranceIds(String toleranceIds) {
		this.toleranceIds = toleranceIds;
	}
	public String getCurrencyType() {
		return currencyType;
	}
	public void setCurrencyType(String currencyType) {
		this.currencyType = currencyType;
	}
	public String getEffectiveDate() {
		return effectiveDate;
	}
	public void setEffectiveDate(String effectiveDate) {
		this.effectiveDate = effectiveDate;
	}
	public String getExtraCover() {
		return extraCover;
	}
	public void setExtraCover(String extraCover) {
		this.extraCover = extraCover;
	}
	public String getTransit_country() {
		return transit_country;
	}
	public void setTransit_country(String transit_country) {
		this.transit_country = transit_country;
	}
	public String getDestination_country() {
		return destination_country;
	}
	public void setDestination_country(String destination_country) {
		this.destination_country = destination_country;
	}
	public String getTxtarCryRemarkes() {
		return txtarCryRemarkes;
	}
	public void setTxtarCryRemarkes(String txtarCryRemarkes) {
		this.txtarCryRemarkes = txtarCryRemarkes;
	}
	public String getCustomer() {
		return customer;
	}
	public void setCustomer(String customer) {
		this.customer = customer;
	}
	public String getCommodity_TA() {
		return commodity_TA;
	}
	public void setCommodity_TA(String commodity_TA) {
		this.commodity_TA = commodity_TA;
	}
	public String getTotalCommudity() {
		return totalCommudity;
	}
	public void setTotalCommudity(String totalCommudity) {
		this.totalCommudity = totalCommudity;
	}
	public String getSaleTermName() {
		return saleTermName;
	}
	public void setSaleTermName(String saleTermName) {
		this.saleTermName = saleTermName;
	}
	public String getSaletermId() {
		return saletermId;
	}
	public void setSaletermId(String saletermId) {
		this.saletermId = saletermId;
	}
	public String getTolerance() {
		return tolerance;
	}
	public void setTolerance(String tolerance) {
		this.tolerance = tolerance;
	}
	public String getToleranceId() {
		return toleranceId;
	}
	public void setToleranceId(String toleranceId) {
		this.toleranceId = toleranceId;
	}
	public String getTransit_countryId() {
		return transit_countryId;
	}
	public void setTransit_countryId(String transit_countryId) {
		this.transit_countryId = transit_countryId;
	}
	public String getTotalTransitId() {
		return totalTransitId;
	}
	public void setTotalTransitId(String totalTransitId) {
		this.totalTransitId = totalTransitId;
	}
	public String getDestination_countryId() {
		return destination_countryId;
	}
	public void setDestination_countryId(String destination_countryId) {
		this.destination_countryId = destination_countryId;
	}
	public String getTotalDestinationId() {
		return totalDestinationId;
	}
	public void setTotalDestinationId(String totalDestinationId) {
		this.totalDestinationId = totalDestinationId;
	}
	public List<String> getCommditycheck() {
		return commditycheck;
	}
	public void setCommditycheck(List<String> commditycheck) {
		this.commditycheck = commditycheck;
	}
	public List<String> getCommdityId() {
		return commdityId;
	}
	public void setCommdityId(List<String> commdityId) {
		this.commdityId = commdityId;
	}
	public List<String> getCommdityName() {
		return commdityName;
	}
	public void setCommdityName(List<String> commdityName) {
		this.commdityName = commdityName;
	}
	public List<String> getCommdityNameDesc() {
		return commdityNameDesc;
	}
	public void setCommdityNameDesc(List<String> commdityNameDesc) {
		this.commdityNameDesc = commdityNameDesc;
	}
	public List<String> getCommdityFragile() {
		return commdityFragile;
	}
	public void setCommdityFragile(List<String> commdityFragile) {
		this.commdityFragile = commdityFragile;
	}
	public List<String> getCommodityTypeId() {
		return commodityTypeId;
	}
	public void setCommodityTypeId(List<String> commodityTypeId) {
		this.commodityTypeId = commodityTypeId;
	}
	public List<String> getChcustomercheck() {
		return chcustomercheck;
	}
	public void setChcustomercheck(List<String> chcustomercheck) {
		this.chcustomercheck = chcustomercheck;
	}
	public List<String> getChcustomerId() {
		return chcustomerId;
	}
	public void setChcustomerId(List<String> chcustomerId) {
		this.chcustomerId = chcustomerId;
	}
	public List<String> getChcustomerName() {
		return chcustomerName;
	}
	public void setChcustomerName(List<String> chcustomerName) {
		this.chcustomerName = chcustomerName;
	}
	public List<String> getModeTransportcheck() {
		return modeTransportcheck;
	}
	public void setModeTransportcheck(List<String> modeTransportcheck) {
		this.modeTransportcheck = modeTransportcheck;
	}
	public List<String> getModeTransportId() {
		return modeTransportId;
	}
	public void setModeTransportId(List<String> modeTransportId) {
		this.modeTransportId = modeTransportId;
	}
	public List<String> getModeTransportName() {
		return modeTransportName;
	}
	public void setModeTransportName(List<String> modeTransportName) {
		this.modeTransportName = modeTransportName;
	}
	public List<String> getCovercheck() {
		return covercheck;
	}
	public void setCovercheck(List<String> covercheck) {
		this.covercheck = covercheck;
	}
	public List<String> getModecoverId() {
		return modecoverId;
	}
	public void setModecoverId(List<String> modecoverId) {
		this.modecoverId = modecoverId;
	}
	public List<String> getCoverId() {
		return coverId;
	}
	public void setCoverId(List<String> coverId) {
		this.coverId = coverId;
	}
	public List<String> getCoverTypeId() {
		return coverTypeId;
	}
	public void setCoverTypeId(List<String> coverTypeId) {
		this.coverTypeId = coverTypeId;
	}
	public List<String> getCoverTypeName() {
		return coverTypeName;
	}
	public void setCoverTypeName(List<String> coverTypeName) {
		this.coverTypeName = coverTypeName;
	}
	public List<String> getCoverName() {
		return coverName;
	}
	public void setCoverName(List<String> coverName) {
		this.coverName = coverName;
	}
	public List<String> getCurrencyId() {
		return currencyId;
	}
	public void setCurrencyId(List<String> currencyId) {
		this.currencyId = currencyId;
	}
	public List<String> getCurrencyName() {
		return currencyName;
	}
	public void setCurrencyName(List<String> currencyName) {
		this.currencyName = currencyName;
	}
	public List<String> getCurrencyValue() {
		return currencyValue;
	}
	public void setCurrencyValue(List<String> currencyValue) {
		this.currencyValue = currencyValue;
	}
	public List<String> getPerbottomLimit() {
		return perbottomLimit;
	}
	public void setPerbottomLimit(List<String> perbottomLimit) {
		this.perbottomLimit = perbottomLimit;
	}
	public List<String> getLocationLimit() {
		return locationLimit;
	}
	public void setLocationLimit(List<String> locationLimit) {
		this.locationLimit = locationLimit;
	}
	public List<String> getCommodityModeId() {
		return commodityModeId;
	}
	public void setCommodityModeId(List<String> commodityModeId) {
		this.commodityModeId = commodityModeId;
	}
	public List<String> getCommodityModeName() {
		return commodityModeName;
	}
	public void setCommodityModeName(List<String> commodityModeName) {
		this.commodityModeName = commodityModeName;
	}
	public List<String> getCommodityCoverId() {
		return commodityCoverId;
	}
	public void setCommodityCoverId(List<String> commodityCoverId) {
		this.commodityCoverId = commodityCoverId;
	}
	public List<String> getCommodityCoverName() {
		return commodityCoverName;
	}
	public void setCommodityCoverName(List<String> commodityCoverName) {
		this.commodityCoverName = commodityCoverName;
	}
	public List<String> getCommoditybaseRate() {
		return commoditybaseRate;
	}
	public void setCommoditybaseRate(List<String> commoditybaseRate) {
		this.commoditybaseRate = commoditybaseRate;
	}
	public List<String> getCommodityexcessPer() {
		return commodityexcessPer;
	}
	public void setCommodityexcessPer(List<String> commodityexcessPer) {
		this.commodityexcessPer = commodityexcessPer;
	}
	public List<String> getCommodityexcessVal() {
		return commodityexcessVal;
	}
	public void setCommodityexcessVal(List<String> commodityexcessVal) {
		this.commodityexcessVal = commodityexcessVal;
	}
	public List<String> getCommodityexcessDesc() {
		return commodityexcessDesc;
	}
	public void setCommodityexcessDesc(List<String> commodityexcessDesc) {
		this.commodityexcessDesc = commodityexcessDesc;
	}
	public List<Map<String, Object>> getCommodityRateList() {
		return commodityRateList;
	}
	public void setCommodityRateList(List<Map<String, Object>> commodityRateList) {
		this.commodityRateList = commodityRateList;
	}
	public List<Map<String, Object>> getModeoftransList() {
		return modeoftransList;
	}
	public void setModeoftransList(List<Map<String, Object>> modeoftransList) {
		this.modeoftransList = modeoftransList;
	}
	public List<Map<String, Object>> getCoverList() {
		return coverList;
	}
	public void setCoverList(List<Map<String, Object>> coverList) {
		this.coverList = coverList;
	}
	public String getCommodityCode() {
		return commodityCode;
	}
	public void setCommodityCode(String commodityCode) {
		this.commodityCode = commodityCode;
	}
	public String getCoverTypeNames() {
		return coverTypeNames;
	}
	public void setCoverTypeNames(String coverTypeNames) {
		this.coverTypeNames = coverTypeNames;
	}
	public String getCoverTypeIds() {
		return coverTypeIds;
	}
	public void setCoverTypeIds(String coverTypeIds) {
		this.coverTypeIds = coverTypeIds;
	}
	public String getModeOfTransport() {
		return modeOfTransport;
	}
	public void setModeOfTransport(String modeOfTransport) {
		this.modeOfTransport = modeOfTransport;
	}
	public String getModeOfTransportName() {
		return modeOfTransportName;
	}
	public void setModeOfTransportName(String modeOfTransportName) {
		this.modeOfTransportName = modeOfTransportName;
	}
	public String getCityCode() {
		return cityCode;
	}
	public void setCityCode(String cityCode) {
		this.cityCode = cityCode;
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	public String getWarRate() {
		return warRate;
	}
	public void setWarRate(String warRate) {
		this.warRate = warRate;
	}
	public String getExcoverTypeIds() {
		return excoverTypeIds;
	}
	public void setExcoverTypeIds(String excoverTypeIds) {
		this.excoverTypeIds = excoverTypeIds;
	}
	public String getConditionId() {
		return conditionId;
	}
	public void setConditionId(String conditionId) {
		this.conditionId = conditionId;
	}
	public String getConditionName() {
		return conditionName;
	}
	public void setConditionName(String conditionName) {
		this.conditionName = conditionName;
	}
	public List<String> getClausescheck() {
		return clausescheck;
	}
	public void setClausescheck(List<String> clausescheck) {
		this.clausescheck = clausescheck;
	}
	public List<String> getClausesId() {
		return clausesId;
	}
	public void setClausesId(List<String> clausesId) {
		this.clausesId = clausesId;
	}
	public List<String> getClausesName() {
		return clausesName;
	}
	public void setClausesName(List<String> clausesName) {
		this.clausesName = clausesName;
	}
	public List<String> getCommdityIds() {
		return commdityIds;
	}
	public void setCommdityIds(List<String> commdityIds) {
		this.commdityIds = commdityIds;
	}
	public List<String> getWarcityCode() {
		return warcityCode;
	}
	public void setWarcityCode(List<String> warcityCode) {
		this.warcityCode = warcityCode;
	}
	public List<String> getWarcityName() {
		return warcityName;
	}
	public void setWarcityName(List<String> warcityName) {
		this.warcityName = warcityName;
	}
	public List<String> getWarBaseRate() {
		return warBaseRate;
	}
	public void setWarBaseRate(List<String> warBaseRate) {
		this.warBaseRate = warBaseRate;
	}
	public List<String> getWarmodeTransId() {
		return warmodeTransId;
	}
	public void setWarmodeTransId(List<String> warmodeTransId) {
		this.warmodeTransId = warmodeTransId;
	}
	public List<String> getWarmodeTransName() {
		return warmodeTransName;
	}
	public void setWarmodeTransName(List<String> warmodeTransName) {
		this.warmodeTransName = warmodeTransName;
	}
	public List<String> getWarsno() {
		return warsno;
	}
	public void setWarsno(List<String> warsno) {
		this.warsno = warsno;
	}
	public String getDeleteId() {
		return deleteId;
	}
	public void setDeleteId(String deleteId) {
		this.deleteId = deleteId;
	}
	public String getPsuminsured() {
		return psuminsured;
	}
	public void setPsuminsured(String psuminsured) {
		this.psuminsured = psuminsured;
	}
	public String getPmarineRate() {
		return pmarineRate;
	}
	public void setPmarineRate(String pmarineRate) {
		this.pmarineRate = pmarineRate;
	}
	public String getPwarRate() {
		return pwarRate;
	}
	public void setPwarRate(String pwarRate) {
		this.pwarRate = pwarRate;
	}
	public String getBalanceDepositPremium() {
		return balanceDepositPremium;
	}
	public void setBalanceDepositPremium(String balanceDepositPremium) {
		this.balanceDepositPremium = balanceDepositPremium;
	}
	public String getUtilizedPremium() {
		return utilizedPremium;
	}
	public void setUtilizedPremium(String utilizedPremium) {
		this.utilizedPremium = utilizedPremium;
	}
	public String getTotalPremium() {
		return totalPremium;
	}
	public void setTotalPremium(String totalPremium) {
		this.totalPremium = totalPremium;
	}
	public String getActualPremium() {
		return actualPremium;
	}
	public void setActualPremium(String actualPremium) {
		this.actualPremium = actualPremium;
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
		return premiumRcvd;
	}
	public void setPremiumRcvd(String premiumRcvd) {
		this.premiumRcvd = premiumRcvd;
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
	public String getRefundChrgYN() {
		return refundChrgYN;
	}
	public void setRefundChrgYN(String refundChrgYN) {
		this.refundChrgYN = refundChrgYN;
	}
	public String getEndtStatus() {
		return endtStatus;
	}
	public void setEndtStatus(String endtStatus) {
		this.endtStatus = endtStatus;
	}
	public List<String> getNoofInsrance() {
		return noofInsrance;
	}
	public void setNoofInsrance(List<String> noofInsrance) {
		this.noofInsrance = noofInsrance;
	}
	public List<String> getCompanyId() {
		return companyId;
	}
	public void setCompanyId(List<String> companyId) {
		this.companyId = companyId;
	}
	public List<String> getCompanyName() {
		return companyName;
	}
	public void setCompanyName(List<String> companyName) {
		this.companyName = companyName;
	}
	public List<String> getShareValue() {
		return shareValue;
	}
	public void setShareValue(List<String> shareValue) {
		this.shareValue = shareValue;
	}
	public List<String> getLeaderYN() {
		return leaderYN;
	}
	public void setLeaderYN(List<String> leaderYN) {
		this.leaderYN = leaderYN;
	}
	public String getOpenCoverNo() {
		return openCoverNo;
	}
	public void setOpenCoverNo(String openCoverNo) {
		this.openCoverNo = openCoverNo;
	}
	public String getOpencovergenerate() {
		return opencovergenerate;
	}
	public void setOpencovergenerate(String opencovergenerate) {
		this.opencovergenerate = opencovergenerate;
	}
	public String getRenewalYN() {
		return renewalYN;
	}
	public void setRenewalYN(String renewalYN) {
		this.renewalYN = renewalYN;
	}
	public String getEndtYN() {
		return endtYN;
	}
	public void setEndtYN(String endtYN) {
		this.endtYN = endtYN;
	}
	public String getPolicyeffectiveDate() {
		return policyeffectiveDate;
	}
	public void setPolicyeffectiveDate(String policyeffectiveDate) {
		this.policyeffectiveDate = policyeffectiveDate;
	}
	public String getDeposit() {
		return deposit;
	}
	public void setDeposit(String deposit) {
		this.deposit = deposit;
	}
	public String getDepositPremiumType() {
		return depositPremiumType;
	}
	public void setDepositPremiumType(String depositPremiumType) {
		this.depositPremiumType = depositPremiumType;
	}
	public String getDepositType() {
		return depositType;
	}
	public void setDepositType(String depositType) {
		this.depositType = depositType;
	}
	public String getDepositDate() {
		return depositDate;
	}
	public void setDepositDate(String depositDate) {
		this.depositDate = depositDate;
	}
	public String getDebitNoteNo() {
		return debitNoteNo;
	}
	public void setDebitNoteNo(String debitNoteNo) {
		this.debitNoteNo = debitNoteNo;
	}
	public String getCreditNoteNo() {
		return creditNoteNo;
	}
	public void setCreditNoteNo(String creditNoteNo) {
		this.creditNoteNo = creditNoteNo;
	}
	public String getInstallType() {
		return installType;
	}
	public void setInstallType(String installType) {
		this.installType = installType;
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
	public String getVatTax() {
		return vatTax;
	}
	public void setVatTax(String vatTax) {
		this.vatTax = vatTax;
	}
	public String getDebitNoteName() {
		return debitNoteName;
	}
	public void setDebitNoteName(String debitNoteName) {
		this.debitNoteName = debitNoteName;
	}
	public String getCancelClaus() {
		return cancelClaus;
	}
	public void setCancelClaus(String cancelClaus) {
		this.cancelClaus = cancelClaus;
	}
	public String getRatesYN() {
		return ratesYN;
	}
	public void setRatesYN(String ratesYN) {
		this.ratesYN = ratesYN;
	}
	public String getAmendedClauseYN() {
		return amendedClauseYN;
	}
	public void setAmendedClauseYN(String amendedClauseYN) {
		this.amendedClauseYN = amendedClauseYN;
	}
	public String getPpwdays() {
		return ppwdays;
	}
	public void setPpwdays(String ppwdays) {
		this.ppwdays = ppwdays;
	}
	public String getOpenCoverType() {
		return openCoverType;
	}
	public void setOpenCoverType(String openCoverType) {
		this.openCoverType = openCoverType;
	}
	public List<String> getTransportId() {
		return transportId;
	}
	public void setTransportId(List<String> transportId) {
		this.transportId = transportId;
	}
	public List<String> getConveyanceDesc() {
		return conveyanceDesc;
	}
	public void setConveyanceDesc(List<String> conveyanceDesc) {
		this.conveyanceDesc = conveyanceDesc;
	}
	public List<Object> getEndtType() {
		return endtType;
	}
	public void setEndtType(List<Object> endtType) {
		this.endtType = endtType;
	}
	public String getEndorsementRemarks() {
		return endorsementRemarks;
	}
	public void setEndorsementRemarks(String endorsementRemarks) {
		this.endorsementRemarks = endorsementRemarks;
	}
	public String getCancellationDate() {
		return cancellationDate;
	}
	public void setCancellationDate(String cancellationDate) {
		this.cancellationDate = cancellationDate;
	}
	public String getCancellationRemarks() {
		return cancellationRemarks;
	}
	public void setCancellationRemarks(String cancellationRemarks) {
		this.cancellationRemarks = cancellationRemarks;
	}
	public List<HashMap<String, Object>> getErrors() {
		return errors;
	}
	public void setErrors(List<HashMap<String, Object>> errors) {
		this.errors = errors;
	}
	public List<String> getWarcitymodeTransId() {
		return warcitymodeTransId;
	}
	public void setWarcitymodeTransId(List<String> warcitymodeTransId) {
		this.warcitymodeTransId = warcitymodeTransId;
	}
	public String getBelongingBranch() {
		return belongingBranch;
	}
	public void setBelongingBranch(String belongingBranch) {
		this.belongingBranch = belongingBranch;
	}
	public List<String> getHaulierCategoryId() {
		return haulierCategoryId;
	}
	public void setHaulierCategoryId(List<String> haulierCategoryId) {
		this.haulierCategoryId = haulierCategoryId;
	}
	public List<String> getHaulierCategory() {
		return haulierCategory;
	}
	public void setHaulierCategory(List<String> haulierCategory) {
		this.haulierCategory = haulierCategory;
	}
	public List<String> getStartLimit() {
		return startLimit;
	}
	public void setStartLimit(List<String> startLimit) {
		this.startLimit = startLimit;
	}
	public List<String> getEndLimit() {
		return endLimit;
	}
	public void setEndLimit(List<String> endLimit) {
		this.endLimit = endLimit;
	}
	public List<String> getPremiumVec() {
		return premiumVec;
	}
	public void setPremiumVec(List<String> premiumVec) {
		this.premiumVec = premiumVec;
	}
	public List<String> getHauliersno() {
		return hauliersno;
	}
	public void setHauliersno(List<String> hauliersno) {
		this.hauliersno = hauliersno;
	}
	public String getChcustomerIds() {
		return chcustomerIds;
	}
	public void setChcustomerIds(String chcustomerIds) {
		this.chcustomerIds = chcustomerIds;
	}
	public List<Object> getOptedTolerance() {
		return optedTolerance;
	}
	public void setOptedTolerance(List<Object> optedTolerance) {
		this.optedTolerance = optedTolerance;
	}
	public String getCobrokingYn() {
		return cobrokingYn;
	}
	public void setCobrokingYn(String cobrokingYn) {
		this.cobrokingYn = cobrokingYn;
	}
	public String getNoofCobroking() {
		return noofCobroking;
	}
	public void setNoofCobroking(String noofCobroking) {
		this.noofCobroking = noofCobroking;
	}
	public String getCobrokinghunYN() {
		return cobrokinghunYN;
	}
	public void setCobrokinghunYN(String cobrokinghunYN) {
		this.cobrokinghunYN = cobrokinghunYN;
	}
	public String getPolicyType() {
		return policyType;
	}
	public void setPolicyType(String policyType) {
		this.policyType = policyType;
	}
	public String getImportYn() {
		return importYn;
	}
	public void setImportYn(String importYn) {
		this.importYn = importYn;
	}
	public String getServiceTaxYN() {
		return serviceTaxYN;
	}
	public void setServiceTaxYN(String serviceTaxYN) {
		this.serviceTaxYN = serviceTaxYN;
	}
	public String getRateModifyYN() {
		return rateModifyYN;
	}
	public void setRateModifyYN(String rateModifyYN) {
		this.rateModifyYN = rateModifyYN;
	}
	public String getRatingType() {
		return ratingType;
	}
	public void setRatingType(String ratingType) {
		this.ratingType = ratingType;
	}
	public String getExposureValue() {
		return exposureValue;
	}
	public void setExposureValue(String exposureValue) {
		this.exposureValue = exposureValue;
	}
	public String getLoadingPercent() {
		return loadingPercent;
	}
	public void setLoadingPercent(String loadingPercent) {
		this.loadingPercent = loadingPercent;
	}
	public String getDiscountPercent() {
		return discountPercent;
	}
	public void setDiscountPercent(String discountPercent) {
		this.discountPercent = discountPercent;
	}
	public String getConsolidateGstYN() {
		return consolidateGstYN;
	}
	public void setConsolidateGstYN(String consolidateGstYN) {
		this.consolidateGstYN = consolidateGstYN;
	}
	public String getGlobalPolicy() {
		return globalPolicy;
	}
	public void setGlobalPolicy(String globalPolicy) {
		this.globalPolicy = globalPolicy;
	}
	public String getGlobalBusiness() {
		return globalBusiness;
	}
	public void setGlobalBusiness(String globalBusiness) {
		this.globalBusiness = globalBusiness;
	}
	public String getFacshare() {
		return facshare;
	}
	public void setFacshare(String facshare) {
		this.facshare = facshare;
	}
	public String getInwardfacYN() {
		return inwardfacYN;
	}
	public void setInwardfacYN(String inwardfacYN) {
		this.inwardfacYN = inwardfacYN;
	}
	public String getUnderWriterId() {
		return underWriterId;
	}
	public void setUnderWriterId(String underWriterId) {
		this.underWriterId = underWriterId;
	}
	public String getLoaddiscountYN() {
		return loaddiscountYN;
	}
	public void setLoaddiscountYN(String loaddiscountYN) {
		this.loaddiscountYN = loaddiscountYN;
	}
	
	
	
	
	
	
	
	
	
	
	
}
