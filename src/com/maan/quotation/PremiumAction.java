package com.maan.quotation;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.maan.common.LogUtil;
import com.maan.common.Token;
import com.maan.common.url.ApiUrl;
import com.maan.quotation.model.CommodityDetail;
import com.maan.quotation.model.CustomerDetails;
import com.maan.quotation.model.DefaultValue;
import com.maan.quotation.model.Errors;
import com.maan.quotation.model.GeneratePolicy;
import com.maan.quotation.model.LcBankDetails;
import com.maan.quotation.model.MarineShipResponse;
import com.maan.quotation.model.PremiumDetails;
import com.maan.quotation.model.PremiumResponse;
import com.maan.quotation.model.PremiumUpdateModel;
import com.maan.quotation.model.PremiumUpdateResponse;
import com.maan.quotation.model.QuotationModel;
import com.maan.quotation.model.QuotationResponse;
import com.maan.quotation.model.QuoteDetails;
import com.maan.quotation.model.Referrals;
import com.maan.quotation.model.ShipDetailResp;
import com.maan.quotation.model.TransportDetails;
import com.maan.quotation.service.PremiumService;
import com.maan.quotation.service.QuotationService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class PremiumAction extends ActionSupport {
	final static Logger logger = LogUtil.getLogger(PremiumAction.class);
	Gson jsonConvertor = new Gson();
	HttpServletRequest request = ServletActionContext.getRequest();
	Map<String, Object> session = ActionContext.getContext().getSession();
	PremiumService service = new PremiumService();
	private static final long serialVersionUID = 1L;
	private static final String defaultError = "Something went wrong. Please try again later";
	private String openCover = getText("OPEN_COVER");
	private String ADMIN = getText("admin");
	private String adminLoginId = (String) session.get("user");
	private String userType = (String) session.get("user1");
	private String applicationNo;
	private String referenceNo;
	private String subjectivityYn;
	private String subjectivityName;
	private String refNo;
	private String quoteNo;
	private String policyNo;
	private String premiumYN;
	private String banker;
	private String both;
	private String foreign;
	private String excess;
	private String rubberStamp;
	private String branchCode = (String) session.get("LoginBranchCode");
	private String branchCode1 = (String) session.get("LoginBranchCode1");
	private String belongingBranch = (String) session.get("BelongingBranch");
	private String generatePolicy;
	private String referralComment;
	private String referralUpdate;
	private String quoteType;
	private String referralStatus;
	private String commissionYN;
	private String commission;
	private String adminRemarks;
	private String additionalPremium;
	private String totalPremium;
	private String totalWarPremium;
	private String premiumOption;
	private String policyFee;
	private String policyFeeStatus;
	private String editPolicyFee;
	private String loginId;
	private String issuer;
	private String productId = (String) session.get("product_id");
	private String openCoverNo = (String) session.get("openCoverNo");
	private String status;
	private String customerId;
	private String noteType;
	private String paymentMode;
	private String basisValDesc;
	private String coverId;
	private String warCoverId;
	private String modeOfTransport;
	private String settlingAgent;
	private String packDesc;
	private String quoteStatus;
	private String conditionType;
	private String clauses;
	private String warClauses;
	private String exclusions;
	private String warranties;
	private String addClauses;
	private String addWarClauses;
	private String addExclusions;
	private String addWarranties;
	private String certClausesYN;
	private List<String> commodityId;
	private List<String> commodityRate;
	private List<String> commodityWarRate;
	private List<String> commodityImportRate;
	private List<Object> warehouseRate;
	private List<String> policyExcess;
	private List<String> policyExcessPercent;
	private List<String> excessDesc;

	private Map<String, Object> conditionsList;
	private Map<String, Object> taxInfo;
	private List<Object> clausesId;
	private List<Object> warId;
	private List<Object> exclusionId;
	private List<Object> warrantyId;
	private List<Object> clausesDesc;
	private List<Object> warDesc;
	private List<Object> exclusionDesc;
	private List<Object> warrantyDesc;
	private List<Object> conditions;
	private String endTypeId;
	private String fields;
	private String custName;
	private String brokerCompany;
	private String updateClauses;
	private String searcyFrom;
	private String searcyBy;
	private String searcyValue;
	private String showpremiumYN;
	private String printClausesYN;
	private String channelType;
	private String loginUserType = (String) session.get("usertype");
	private List<Object> adminuwList;
	private String inspectionFee;
	private String editClausesYN;
	private String editStatus;
	private String finalizeYN;
	private String rateChange;
	private String effectiveDate;
	List<String> originalCommodityRate = new ArrayList<String>();
	List<String> originalCommodityWarRate = new ArrayList<String>();

	/*
	 * PayMent Term added for vehicle upload
	 */
	private List<String> dueamount;
	private List<String> duepercent;
	private List<String> dueDate;
	private List<String> dueList;
	private List<String> effectiveDatePT;
	private List<Object> userSelection;
	private String userLoginId;
	private List<Object> paymentTermsDetails;
	private List<Object> paymentTerms;
	private String snoPT;
	private String reqFrom;
	private String searchValue;
	private String amendId;
	private String menuBlocker;
	private String vatTax;
	private String netPremium;
	private List<Map<String, Object>> quotationInfo;
	private List<Map<String, Object>> insuredGoodsInfo;
	private List<ShipDetailResp>shipdetail;
	private String condStatus;
	private String endtView;
	private String policygenerateReq;
	private String policyapiURL;
	private String policyapiauth;
	private String searchBy;
	
	
	
	public String getSearchBy() {
		return searchBy;
	}

	public void setSearchBy(String searchBy) {
		this.searchBy = searchBy;
	}

	public String getPolicyapiauth() {
		return policyapiauth;
	}

	public void setPolicyapiauth(String policyapiauth) {
		this.policyapiauth = policyapiauth;
	}

	public String getPolicygenerateReq() {
		return policygenerateReq;
	}

	public void setPolicygenerateReq(String policygenerateReq) {
		this.policygenerateReq = policygenerateReq;
	}

	public String getPolicyapiURL() {
		return policyapiURL;
	}

	public void setPolicyapiURL(String policyapiURL) {
		this.policyapiURL = policyapiURL;
	}

	public String getEndtView() {
		return endtView;
	}

	public void setEndtView(String endtView) {
		this.endtView = endtView;
	}

	private List<Map<String, Object>> policyInformation;

	public String getAmendId() {
		return amendId;
	}

	public String getNetPremium() {
		return netPremium;
	}

	public void setNetPremium(String netPremium) {
		this.netPremium = netPremium;
	}

	public void setAmendId(String amendId) {
		this.amendId = amendId;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	public PremiumService getService() {
		return service;
	}

	

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getADMIN() {
		return ADMIN;
	}

	public String getAdminLoginId() {
		return adminLoginId;
	}

	public String getUserType() {
		return userType;
	}

	public String getBelongingBranch() {
		return belongingBranch;
	}

	public String getPolicyFeeStatus() {
		return policyFeeStatus;
	}

	public Map<String, Object> getTaxInfo() {
		return taxInfo;
	}

	public String getLoginUserType() {
		return loginUserType;
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

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public void setService(PremiumService service) {
		this.service = service;
	}


	public void setOpenCover(String openCover) {
		this.openCover = openCover;
	}

	public void setADMIN(String aDMIN) {
		ADMIN = aDMIN;
	}

	public void setAdminLoginId(String adminLoginId) {
		this.adminLoginId = adminLoginId;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public void setBelongingBranch(String belongingBranch) {
		this.belongingBranch = belongingBranch;
	}

	public void setPolicyFeeStatus(String policyFeeStatus) {
		this.policyFeeStatus = policyFeeStatus;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public void setConditionsList(Map<String, Object> conditionsList) {
		this.conditionsList = conditionsList;
	}

	public void setTaxInfo(Map<String, Object> taxInfo) {
		this.taxInfo = taxInfo;
	}

	public void setConditions(List<Object> conditions) {
		this.conditions = conditions;
	}

	public void setLoginUserType(String loginUserType) {
		this.loginUserType = loginUserType;
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

	/**
	 * @return the excess
	 */
	public String getExcess() {
		return excess;
	}

	/**
	 * @param excess
	 *            the excess to set
	 */
	public void setExcess(String excess) {
		this.excess = excess;
	}

	/**
	 * @return the showpremiumYN
	 */
	public String getShowpremiumYN() {
		return showpremiumYN;
	}

	/**
	 * @param showpremiumYN
	 *            the showpremiumYN to set
	 */
	public void setShowpremiumYN(String showpremiumYN) {
		this.showpremiumYN = showpremiumYN;
	}

	/**
	 * @return the printClausesYN
	 */
	public String getPrintClausesYN() {
		return printClausesYN;
	}

	/**
	 * @param printClausesYN
	 *            the printClausesYN to set
	 */
	public void setPrintClausesYN(String printClausesYN) {
		this.printClausesYN = printClausesYN;
	}

	/**
	 * @return the searcyFrom
	 */
	public String getSearcyFrom() {
		return searcyFrom;
	}

	/**
	 * @param searcyFrom
	 *            the searcyFrom to set
	 */
	public void setSearcyFrom(String searcyFrom) {
		this.searcyFrom = searcyFrom;
	}

	/**
	 * @return the searcyBy
	 */
	public String getSearcyBy() {
		return searcyBy;
	}

	/**
	 * @param searcyBy
	 *            the searcyBy to set
	 */
	public void setSearcyBy(String searcyBy) {
		this.searcyBy = searcyBy;
	}

	/**
	 * @return the searcyValue
	 */
	public String getSearcyValue() {
		return searcyValue;
	}

	/**
	 * @param searcyValue
	 *            the searcyValue to set
	 */
	public void setSearcyValue(String searcyValue) {
		this.searcyValue = searcyValue;
	}

	/**
	 * @return the updateClauses
	 */
	public String getUpdateClauses() {
		return updateClauses;
	}

	/**
	 * @param updateClauses
	 *            the updateClauses to set
	 */
	public void setUpdateClauses(String updateClauses) {
		this.updateClauses = updateClauses;
	}

	/**
	 * @return the isEndt
	 */
	public boolean isEndt() {
		//return service.isEndt(applicationNo);
		return service.isEndorsement(applicationNo);
	}

	/**
	 * @return the isFinancial
	 */
	public boolean isFinancial() {
		return service.isFinancial(applicationNo);
	}

	/**
	 * @return the brokerCompany
	 */
	public String getBrokerCompany() {
		return brokerCompany;
	}

	/**
	 * @param brokerCompany
	 *            the brokerCompany to set
	 */
	public void setBrokerCompany(String brokerCompany) {
		this.brokerCompany = brokerCompany;
	}

	/**
	 * @return the custName
	 */
	public String getCustName() {
		return custName;
	}

	/**
	 * @param custName
	 *            the custName to set
	 */
	public void setCustName(String custName) {
		this.custName = custName;
	}

	/**
	 * @return the fields
	 */
	public String getFields() {
		return fields;
	}

	/**
	 * @param fields
	 *            the fields to set
	 */
	public void setFields(String fields) {
		this.fields = fields;
	}

	/**
	 * @return the endTypeId
	 */
	public String getEndTypeId() {
		return endTypeId;
	}

	/**
	 * @param endTypeId
	 *            the endTypeId to set
	 */
	public void setEndTypeId(String endTypeId) {
		this.endTypeId = endTypeId;
	}

	/**
	 * @return the productId
	 */
	public String getProductId() {
		return productId;
	}

	/**
	 * @return the refNo
	 */
	public String getRefNo() {
		return refNo;
	}

	/**
	 * @param refNo
	 *            the refNo to set
	 */
	public void setRefNo(String refNo) {
		this.refNo = refNo;
	}

	/**
	 * @return the totalWarPremium
	 */
	public String getTotalWarPremium() {
		return totalWarPremium;
	}

	/**
	 * @param totalWarPremium
	 *            the totalWarPremium to set
	 */
	public void setTotalWarPremium(String totalWarPremium) {
		this.totalWarPremium = totalWarPremium;
	}

	/**
	 * @return the issuer
	 */
	public String getIssuer() {
		return issuer;
	}

	/**
	 * @param issuer
	 *            the issuer to set
	 */
	public void setIssuer(String issuer) {
		this.issuer = issuer;
	}

	/**
	 * @return the certClausesYN
	 */
	public String getCertClausesYN() {
		return certClausesYN;
	}

	/**
	 * @param certClausesYN
	 *            the certClausesYN to set
	 */
	public void setCertClausesYN(String certClausesYN) {
		this.certClausesYN = certClausesYN;
	}

	/**
	 * @return the addClauses
	 */
	public String getAddClauses() {
		return addClauses;
	}

	/**
	 * @param addClauses
	 *            the addClauses to set
	 */
	public void setAddClauses(String addClauses) {
		this.addClauses = addClauses;
	}

	/**
	 * @return the addWarClauses
	 */
	public String getAddWarClauses() {
		return addWarClauses;
	}

	/**
	 * @param addWarClauses
	 *            the addWarClauses to set
	 */
	public void setAddWarClauses(String addWarClauses) {
		this.addWarClauses = addWarClauses;
	}

	/**
	 * @return the addExclusions
	 */
	public String getAddExclusions() {
		return addExclusions;
	}

	/**
	 * @param addExclusions
	 *            the addExclusions to set
	 */
	public void setAddExclusions(String addExclusions) {
		this.addExclusions = addExclusions;
	}

	/**
	 * @return the addWarranties
	 */
	public String getAddWarranties() {
		return addWarranties;
	}

	/**
	 * @param addWarranties
	 *            the addWarranties to set
	 */
	public void setAddWarranties(String addWarranties) {
		this.addWarranties = addWarranties;
	}

	/**
	 * @return the conditions
	 */
	public List<Object> getConditions() {
		return conditions;
	}

	/**
	 * @return the conditionType
	 */
	public String getConditionType() {
		return conditionType;
	}

	/**
	 * @param conditionType
	 *            the conditionType to set
	 */
	public void setConditionType(String conditionType) {
		this.conditionType = conditionType;
	}

	/**
	 * @return the openCover
	 */
	public String getOpenCover() {
		return openCover;
	}

	/**
	 * @return the quoteStatus
	 */
	public String getQuoteStatus() {
		return quoteStatus;
	}

	/**
	 * @param quoteStatus
	 *            the quoteStatus to set
	 */
	public void setQuoteStatus(String quoteStatus) {
		this.quoteStatus = quoteStatus;
	}

	/**
	 * @return the settlingAgent
	 */
	public String getSettlingAgent() {
		return settlingAgent;
	}

	/**
	 * @param settlingAgent
	 *            the settlingAgent to set
	 */
	public void setSettlingAgent(String settlingAgent) {
		this.settlingAgent = settlingAgent;
	}

	/**
	 * @return the packDesc
	 */
	public String getPackDesc() {
		return packDesc;
	}

	/**
	 * @param packDesc
	 *            the packDesc to set
	 */
	public void setPackDesc(String packDesc) {
		this.packDesc = packDesc;
	}

	/**
	 * @return the coverId
	 */
	public String getCoverId() {
		return coverId;
	}

	/**
	 * @param coverId
	 *            the coverId to set
	 */
	public void setCoverId(String coverId) {
		this.coverId = coverId;
	}

	/**
	 * @return the warCoverId
	 */
	public String getWarCoverId() {
		return warCoverId;
	}

	/**
	 * @param warCoverId
	 *            the warCoverId to set
	 */
	public void setWarCoverId(String warCoverId) {
		this.warCoverId = warCoverId;
	}

	/**
	 * @return the modeOfTransport
	 */
	public String getModeOfTransport() {
		return modeOfTransport;
	}

	/**
	 * @param modeOfTransport
	 *            the modeOfTransport to set
	 */
	public void setModeOfTransport(String modeOfTransport) {
		this.modeOfTransport = modeOfTransport;
	}

	/**
	 * @return the noteType
	 */
	public String getNoteType() {
		if (isEndt())
			return service.getNoteTypeInfo(applicationNo);
		else
			return noteType;
	}

	/**
	 * @param noteType
	 *            the noteType to set
	 */
	public void setNoteType(String noteType) {
		this.noteType = noteType;
	}

	/**
	 * @return the paymentMode
	 */
	public String getPaymentMode() {
		if (isEndt())
			return service.getPaymentModeInfo(applicationNo);
		else
			return paymentMode;
	}

	/**
	 * @param paymentMode
	 *            the paymentMode to set
	 */
	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}

	/**
	 * @return the basisValDesc
	 */
	public String getBasisValDesc() {
		return basisValDesc;
	}

	/**
	 * @param basisValDesc
	 *            the basisValDesc to set
	 */
	public void setBasisValDesc(String basisValDesc) {
		this.basisValDesc = basisValDesc;
	}

	/**
	 * @return the clauses
	 */
	public String getClauses() {
		return clauses;
	}

	/**
	 * @param clauses
	 *            the clauses to set
	 */
	public void setClauses(String clauses) {
		this.clauses = clauses;
	}

	/**
	 * @return the warClauses
	 */
	public String getWarClauses() {
		return warClauses;
	}

	/**
	 * @param warClauses
	 *            the warClauses to set
	 */
	public void setWarClauses(String warClauses) {
		this.warClauses = warClauses;
	}

	/**
	 * @return the exclusions
	 */
	public String getExclusions() {
		return exclusions;
	}

	/**
	 * @param exclusions
	 *            the exclusions to set
	 */
	public void setExclusions(String exclusions) {
		this.exclusions = exclusions;
	}

	/**
	 * @return the warranties
	 */
	public String getWarranties() {
		return warranties;
	}

	/**
	 * @param warranties
	 *            the warranties to set
	 */
	public void setWarranties(String warranties) {
		this.warranties = warranties;
	}

	/**
	 * @return the clausesId
	 */
	public List<Object> getClausesId() {
		return clausesId;
	}

	/**
	 * @param clausesId
	 *            the clausesId to set
	 */
	public void setClausesId(List<Object> clausesId) {
		this.clausesId = clausesId;
	}

	/**
	 * @return the warId
	 */
	public List<Object> getWarId() {
		return warId;
	}

	/**
	 * @param warId
	 *            the warId to set
	 */
	public void setWarId(List<Object> warId) {
		this.warId = warId;
	}

	/**
	 * @return the exclusionId
	 */
	public List<Object> getExclusionId() {
		return exclusionId;
	}

	/**
	 * @param exclusionId
	 *            the exclusionId to set
	 */
	public void setExclusionId(List<Object> exclusionId) {
		this.exclusionId = exclusionId;
	}

	/**
	 * @return the warrantyId
	 */
	public List<Object> getWarrantyId() {
		return warrantyId;
	}

	/**
	 * @param warrantyId
	 *            the warrantyId to set
	 */
	public void setWarrantyId(List<Object> warrantyId) {
		this.warrantyId = warrantyId;
	}

	/**
	 * @return the clausesDesc
	 */
	public List<Object> getClausesDesc() {
		return clausesDesc;
	}

	/**
	 * @param clausesDesc
	 *            the clausesDesc to set
	 */
	public void setClausesDesc(List<Object> clausesDesc) {
		this.clausesDesc = clausesDesc;
	}

	/**
	 * @return the warDesc
	 */
	public List<Object> getWarDesc() {
		return warDesc;
	}

	/**
	 * @param warDesc
	 *            the warDesc to set
	 */
	public void setWarDesc(List<Object> warDesc) {
		this.warDesc = warDesc;
	}

	/**
	 * @return the exclusionDesc
	 */
	public List<Object> getExclusionDesc() {
		return exclusionDesc;
	}

	/**
	 * @param exclusionDesc
	 *            the exclusionDesc to set
	 */
	public void setExclusionDesc(List<Object> exclusionDesc) {
		this.exclusionDesc = exclusionDesc;
	}

	/**
	 * @return the warrantyDesc
	 */
	public List<Object> getWarrantyDesc() {
		return warrantyDesc;
	}

	/**
	 * @param warrantyDesc
	 *            the warrantyDesc to set
	 */
	public void setWarrantyDesc(List<Object> warrantyDesc) {
		this.warrantyDesc = warrantyDesc;
	}

	/**
	 * @return the openCoverNo
	 */
	public String getOpenCoverNo() {
		return openCoverNo;
	}

	/**
	 * @param openCoverNo
	 *            the openCoverNo to set
	 */
	public void setOpenCoverNo(String openCoverNo) {
		this.openCoverNo = openCoverNo;
	}

	/**
	 * @return the policyNo
	 */
	public String getPolicyNo() {
		return policyNo;
	}

	/**
	 * @param policyNo
	 *            the policyNo to set
	 */
	public void setPolicyNo(String policyNo) {
		this.policyNo = policyNo;
	}

	/**
	 * @return the policyInfo
	 */
	/*public List<Object> getPolicyInformation() {
		return service.getPolicyInformation(applicationNo);
	}*/

	/**
	 * @return the customerId
	 */
	public String getCustomerId() {
		return customerId;
	}

	/**
	 * @param customerId
	 *            the customerId to set
	 */
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	/**
	 * @return the commissionStatus
	 */
	public boolean getCommissionStatus() {
		return service.getCommissionStatus(service.getLoginId(applicationNo), productId, openCoverNo, issuer,
				applicationNo, branchCode);
	}

	/**
	 * @return the accountStatus
	 */
	public boolean getAccountStatus() {
		return service.getCustAccountStatus(applicationNo);
	}

	/**
	 * @return the conditionsList
	 */
	public Map<String, Object> getConditionsList() {
		return conditionsList;
	}

	/**
	 * @return the basisValList
	 */
	public List<Object> getBasisValList() {
		return service.getBasisValList(belongingBranch);
	}

	/**
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}

	/**
	 * @param status
	 *            the status to set
	 */
	public void setStatus(String status) {
		this.status = status;
	}

	/**
	 * @return the loginId
	 */
	public String getLoginId() {
		return loginId;
	}

	/**
	 * @param loginId
	 *            the loginId to set
	 */
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	/**
	 * @return the editPolicyFee
	 */
	public String getEditPolicyFee() {
		return editPolicyFee;
	}

	/**
	 * @param editPolicyFee
	 *            the editPolicyFee to set
	 */
	public void setEditPolicyFee(String editPolicyFee) {
		this.editPolicyFee = editPolicyFee;
	}

	/**
	 * @return the totalPremium
	 */
	public String getTotalPremium() {
		return totalPremium;
	}

	/**
	 * @param totalPremium
	 *            the totalPremium to set
	 */
	public void setTotalPremium(String totalPremium) {
		this.totalPremium = totalPremium;
	}

	/**
	 * @return the policyFee
	 */
	public String getPolicyFee() {
		return policyFee;
	}

	/**
	 * @param policyFee
	 *            the policyFee to set
	 */
	public void setPolicyFee(String policyFee) {
		this.policyFee = policyFee;
	}

	/**
	 * @return the premiumOption
	 */
	public String getPremiumOption() {
		return premiumOption;
	}

	/**
	 * @param premiumOption
	 *            the premiumOption to set
	 */
	public void setPremiumOption(String premiumOption) {
		this.premiumOption = premiumOption;
	}

	/**
	 * @return the referralStatus
	 */
	public String getReferralStatus() {
		return referralStatus;
	}

	/**
	 * @param referralStatus
	 *            the referralStatus to set
	 */
	public void setReferralStatus(String referralStatus) {
		this.referralStatus = referralStatus;
	}

	/**
	 * @return the commissionYN
	 */
	public String getCommissionYN() {
		return commissionYN;
	}

	/**
	 * @param commissionYN
	 *            the commissionYN to set
	 */
	public void setCommissionYN(String commissionYN) {
		this.commissionYN = commissionYN;
	}

	/**
	 * @return the commission
	 */
	public String getCommission() {
		return commission;
	}

	/**
	 * @param commission
	 *            the commission to set
	 */
	public void setCommission(String commission) {
		this.commission = commission;
	}

	/**
	 * @return the adminRemarks
	 */
	public String getAdminRemarks() {
		return adminRemarks;
	}

	/**
	 * @param adminRemarks
	 *            the adminRemarks to set
	 */
	public void setAdminRemarks(String adminRemarks) {
		this.adminRemarks = adminRemarks;
	}

	/**
	 * @return the additionalPremium
	 */
	public String getAdditionalPremium() {
		return additionalPremium;
	}

	/**
	 * @param additionalPremium
	 *            the additionalPremium to set
	 */
	public void setAdditionalPremium(String additionalPremium) {
		this.additionalPremium = additionalPremium;
	}

	/**
	 * @return the commodityId
	 */
	public List<String> getCommodityId() {
		return commodityId;
	}

	/**
	 * @param commodityId
	 *            the commodityId to set
	 */
	public void setCommodityId(List<String> commodityId) {
		this.commodityId = commodityId;
	}

	/**
	 * @return the commodityRate
	 */
	public List<String> getCommodityRate() {
		return commodityRate;
	}

	/**
	 * @param commodityRate
	 *            the commodityRate to set
	 */
	public void setCommodityRate(List<String> commodityRate) {
		this.commodityRate = commodityRate;
	}

	/**
	 * @return the commodityWarRate
	 */
	public List<String> getCommodityWarRate() {
		return commodityWarRate;
	}

	/**
	 * @param commodityWarRate
	 *            the commodityWarRate to set
	 */
	public void setCommodityWarRate(List<String> commodityWarRate) {
		this.commodityWarRate = commodityWarRate;
	}

	/**
	 * @return the policyExcess
	 */
	public List<String> getPolicyExcess() {
		return policyExcess;
	}

	/**
	 * @param policyExcess
	 *            the policyExcess to set
	 */
	public void setPolicyExcess(List<String> policyExcess) {
		this.policyExcess = policyExcess;
	}

	/**
	 * @return the warehouseRate
	 */
	public List<Object> getWarehouseRate() {
		return warehouseRate;
	}

	/**
	 * @param warehouseRate
	 *            the warehouseRate to set
	 */
	public void setWarehouseRate(List<Object> warehouseRate) {
		this.warehouseRate = warehouseRate;
	}

	/**
	 * @return the quoteType
	 */
	public String getQuoteType() {
		return quoteType;
	}

	/**
	 * @param quoteType
	 *            the quoteType to set
	 */
	public void setQuoteType(String quoteType) {
		this.quoteType = quoteType;
	}

	public String getReferralUpdate() {
		return referralUpdate;
	}

	public void setReferralUpdate(String referralUpdate) {
		this.referralUpdate = referralUpdate;
	}

	public String getGeneratePolicy() {
		return generatePolicy;
	}

	public void setGeneratePolicy(String generatePolicy) {
		this.generatePolicy = generatePolicy;
	}

	public String getReferralComment() {
		return referralComment;
	}

	public void setReferralComment(String referralComment) {
		this.referralComment = referralComment;
	}

	/**
	 * @return the premiumYN
	 */
	public String getPremiumYN() {
		return premiumYN;
	}

	/**
	 * @param premiumYN
	 *            the premiumYN to set
	 */
	public void setPremiumYN(String premiumYN) {
		this.premiumYN = premiumYN;
	}

	public String getBanker() {
		return banker;
	}

	public void setBanker(String banker) {
		this.banker = banker;
	}

	public String getBoth() {
		return both;
	}

	public void setBoth(String both) {
		this.both = both;
	}

	public String getForeign() {
		return foreign;
	}

	public void setForeign(String foreign) {
		this.foreign = foreign;
	}

	public String getRubberStamp() {
		return rubberStamp;
	}

	public void setRubberStamp(String rubberStamp) {
		this.rubberStamp = rubberStamp;
	}

	public String getBranchCode() {
		return branchCode;
	}

	public void setBranchCode(String branchCode) {
		this.branchCode = branchCode;
	}

	public String getQuoteNo() {
		return quoteNo;
	}

	public void setQuoteNo(String quoteNo) {
		this.quoteNo = quoteNo;
	}

	public String getApplicationNo() {
		return applicationNo;
	}

	public void setApplicationNo(String applicationNo) {
		this.applicationNo = applicationNo;
	}

	/*public List<Object> getQuotationInfo() {
		// return service.getQuotationInformation(applicationNo,branchCode);
		return service.getQuotationInformation(applicationNo, belongingBranch);
	}

	public List<Object> getInsuredGoodsInfo() {
		DecimalFormat df = new DecimalFormat("#.####");
		List<Object> insuredGoods = service.getQuotationInsuredValue(applicationNo, belongingBranch);
		return insuredGoods;
	}*/

	/**
	 * @return the endtType
	 */
	public String getEndtType() {
		//return new QuotationService().getPolicyEndtType(applicationNo);
		return new QuotationService().selectedEndorsements(applicationNo);
	}

	public String getViewClausesOption() {
		if (openCover.equals(productId)) {
			return "N";
			// new QuotationService().getSingleInfo("VIEW_CLAUSES_OPTION",new
			// String[]{openCoverNo,openCoverNo});
		} else {
			return "N";
		}
	}

	/**
	 * @return the endtPremiumInfo
	 */
	public Map<String, Object> getEndtPremiumInfo() {
		//return service.getEndtPremiumInfo(quoteNo);
		return service.endtPremiumDetails(quoteNo);
	}

	public Map<String, Object> getPolicyEndtInfo() {
		return new QuotationService().policyEndtInfo(quoteNo);
	}

	public Map<String, Object> getOpenCoverInfo() {
		return new QuotationService().openCoverInfo(openCoverNo);
	}

	public boolean getArInsuredStatus() {
		boolean status = false;
		if (openCover.equals(productId)) {
			status = service.getOpenCoverCustomer(openCoverNo);
		}
		return status;
	}

	public String getDirectStatus() {
		return new QuotationService().getDirectStatus(applicationNo, branchCode);
	}
	public String getWarShowYN() {
		String status = "Y";
		if (openCover.equals(productId)) {
			status = service.getWarShowYN(openCoverNo);
		}
		return status;
	}
	public String init() {
		if(StringUtils.isBlank(referenceNo)) {
			setReferenceNo(applicationNo==null?"":applicationNo);
		}
		inet();
		/*Map<String, Object> ClausesStatus = policyService.getResultMap("QUOTE_FINALIZE_YN",
				new String[] { applicationNo });
		if (ClausesStatus != null) {
			editClausesYN = ClausesStatus.get("EDIT_CLAUSES_YN") == null ? "N"
					: ClausesStatus.get("EDIT_CLAUSES_YN").toString();
			finalizeYN = ClausesStatus.get("finalize_yn") == null ? "N" : ClausesStatus.get("finalize_yn").toString();
			basisValDesc = ClausesStatus.get("BASIS_VAL") == null ? "" : ClausesStatus.get("BASIS_VAL").toString();
		}*/
		return SUCCESS;
	}
	public String viewQuote()
	{
		inet();
		return "viewQuote";
	}
	public String clauses() {
		try {
			//conditionsList = service.getConditionsInfo(applicationNo, belongingBranch);
			conditionsList = service.getconditions(this);
		} catch (Exception e) {
			logger.debug("Exception Occurred @ PremiumAction.clauses(): "+e);
			e.printStackTrace();
		}
		return INPUT;
	}

	public String updateConditions() {
		try {
			//clauses = service.convertConditions(clausesId, clausesDesc);
			//warClauses = service.convertConditions(warId, warDesc);
			//exclusions = service.convertConditions(exclusionId, exclusionDesc);
			//warranties = service.convertConditions(warrantyId, warrantyDesc);
			//service.updateClausesInfo(new String[] { clauses, warranties, exclusions, warClauses, applicationNo });
			//addActionMessage(getText("conditions.update.success"));
			String error = service.modifyConditions(this);
			if(StringUtils.isNotBlank(error)) {
				addActionError(error);
			}else {
				if("modify".equalsIgnoreCase(condStatus==null?"":condStatus)) {
					addActionMessage("Conditions Modified Successfully");
				}else if("add".equalsIgnoreCase(condStatus==null?"":condStatus)) {
					addActionMessage("Conditions Added Successfully");
				}
			}
		} catch (Exception e) {
			logger.debug("Exception Occurred @ PremiumAction.updateConditions(): "+e);
			e.printStackTrace();
		}
		return clauses();
	}

	@SuppressWarnings("unchecked")
	public String update() {
		try {
			PremiumUpdateModel pum = mapPremiumUpdateInputs();
			PremiumUpdateResponse pur = service.premiumUpdate(pum);
			GeneratePolicy gpi=null;
			mapPremiumUpdateOutputs(pur);
			if(!hasActionErrors()) {
				if (ADMIN.equalsIgnoreCase(userType)) {
					return "referralStatusInfo";
				}else {
					if("N".equalsIgnoreCase(status)) {
						gpi = mapGeneratePolicyInputs();
						PremiumUpdateResponse pur1 = service.generatePolicy(gpi);
						mapPremiumUpdateOutputs(pur1);
					}
					if(!hasActionErrors()) {
						JSONObject req = new JSONObject();
						req.put("ApplicationNo", applicationNo);
						setPolicygenerateReq(req.toString());
						setPolicyapiURL(ApiUrl.getPolicyintegrateapi());
						setPolicyapiauth("Bearer "+Token.value());
						return "policyInfo";
					}
				}
			}
		}catch(Exception e) {
			addActionError(defaultError);
			logger.info("Exception @ PremiumAction.update(): "+e);
			e.printStackTrace();
		}finally {
			if(hasActionErrors()) {
				return inet();
			}
		}
		return SUCCESS;
	}
	
	private GeneratePolicy mapGeneratePolicyInputs() {
		GeneratePolicy gp = new GeneratePolicy();
		try {
			gp.setApplicationNo(applicationNo==null?"":applicationNo);
			gp.setBasisValDesc(basisValDesc==null?"":basisValDesc);
			gp.setBoth(both==null?"":both);
			gp.setBranchCode(belongingBranch==null?"":belongingBranch);
			gp.setCertClausesYn(certClausesYN==null?"":certClausesYN);
			gp.setCustomerCode(customerId==null?"":customerId);
			gp.setForeign(foreign==null?"":foreign);
			gp.setGeneratePolicyYn(generatePolicy==null?"":generatePolicy);
			gp.setLcBankDetail("");
			gp.setLoginUserType(loginUserType==null?"":loginUserType);
			gp.setModeOfPayment(paymentMode==null?"":paymentMode);
			gp.setNoteType(noteType==null?"":noteType);
			gp.setOpenCoverNo(openCoverNo==null?"":openCoverNo);
			gp.setPolicyExcess(excess==null?"":excess);
			gp.setPremiumYN(premiumYN==null?"":premiumYN);
			gp.setPrerecieptNo("");
			gp.setPrintClausesYn(printClausesYN==null?"":printClausesYN);
			gp.setProductId(productId==null?"":productId);
			gp.setQuoteNo(quoteNo==null?"":quoteNo);
			gp.setQuoteStatus(quoteStatus==null?"":quoteStatus);
			gp.setReferralRemarks(referralComment==null?"":referralComment);
			gp.setReferralStatus(referralStatus==null?"":referralStatus);
			gp.setReferralUpdateYn(referralUpdate==null?"":referralUpdate);
			gp.setRubberStamp(rubberStamp==null?"":rubberStamp);
			gp.setSettlingAgent(settlingAgent==null?"":settlingAgent);
			gp.setShowPremiumYn(showpremiumYN==null?"":showpremiumYN);
			gp.setTotalPremium(totalPremium==null?"":totalPremium);
		}catch(Exception e) {
			logger.info("Exception @ PremiumAction.mapPremiumUpdateInputs(): "+e);
			e.printStackTrace();
		}
		return gp;
	}

	private void mapPremiumUpdateOutputs(PremiumUpdateResponse pur) {
		try {
				if(pur.getErrors()!=null && pur.getErrors().size()>0) {
					mapErrors(pur.getErrors());
				}
				if(!hasActionErrors()) {
					List<Map<String, Object>> pil = new ArrayList<Map<String, Object>>();
					Map<String, Object> pim = new HashMap<String, Object>();
					
					PremiumResponse pum = pur.getPremiumResponse();
					if(pum==null) {
						pum = pur.getPremiumResponse();
					}
					pim.put("POLICY_NO", pum.getPolicyNo());
					pim.put("QUOTE_NO", pum.getQuoteNo());
					pim.put("POL_DATE", pum.getQuoteDate());
					pim.put("QUOTE_DATE", pum.getQuoteDate());
					pim.put("PROPOSER_NAME", pum.getProposerName());
					pim.put("COVER_START_DATE", pum.getInceptionDate());
					pim.put("COVER_END_PERIODS", pum.getExpiryDate());
					pim.put("STATUS", pum.getStatus());
					pim.put("REFERRAL_DESC", pum.getReferralCommend());
					pim.put("PREMIUM", pum.getPremium());
					pim.put("EQUIVALENT", pum.getEquivalent());
					pim.put("LOGIN_ID", pum.getLoginId());
					pim.put("PDF_PRE_SHOW_STATUS", pum.getPdfPremiumShowStatus());
					pim.put("PDF_BANKER_STATUS", pum.getPdfBankerStatus());
					pim.put("PDF_BANKER_ASSURED_STATUS", pum.getPdfBankerAssuredStatus());
					pim.put("PDF_CURRENCY_STATUS", pum.getPdfCurrencyStatus());
					pim.put("PDF_STAMP_STATUS", pum.getPdfStampStatus());
					pim.put("PDF_EXCESS_STATUS", pum.getPdfExcessStatus());
					pim.put("SHOW_STATUS", "Y");
					pim.put("ISSELECTCOVER", "");
					pim.put("DEBIT_NOTE_NO", pum.getDebitNoteNo());
					pim.put("CREDIT_NOTE_NO", pum.getCreditNoteNo());
					pil.add(pim);
					setPolicyInformation(pil);
					
					setReferenceNo(referenceNo==null?"":referenceNo);
				}
			
		}catch(Exception e) {
			addActionError(defaultError);
			logger.info("Exception @ PremiumAction.mapPremiumUpdateOutputs(): "+e);
			e.printStackTrace();
		}
	}

	private void mapErrors(List<Errors> err) {
		try {
			for(Errors er: err) {
				addActionError(er.getMessage());
			}
		}catch(Exception e) {
			addActionError(defaultError);
			logger.info("Exception @ PremiumAction.mapErrors(): "+e);
			e.printStackTrace();
		}
	}

	private PremiumUpdateModel mapPremiumUpdateInputs() {
		PremiumUpdateModel pum = new PremiumUpdateModel();
		try {
			pum.setAdminRemarks(adminRemarks==null?"":adminRemarks);
			pum.setApplicationNo(applicationNo==null?"":applicationNo);
			pum.setBranchCode(branchCode==null?"":branchCode);
			pum.setCommission(commission==null?"":commission);
			pum.setCommissionYn(commissionYN==null?"":commissionYN);
			pum.setCustomerCode(customerId==null?"":customerId);
			pum.setEditClausesYN(editClausesYN==null?"":editClausesYN);
			pum.setFinalizeYN(finalizeYN==null?"":finalizeYN);
			pum.setIssuer(issuer==null?"":issuer);
			pum.setLoginId(loginId==null?"":loginId);
			pum.setLoginUserType(loginUserType==null?"":loginUserType);
			pum.setOpenCoverNo(openCoverNo==null?"":openCoverNo);
			pum.setPolicyFee(policyFee==null?"":policyFee);
			pum.setPolicyFeeYn(editPolicyFee==null?"":editPolicyFee);
			pum.setPremiumYN(premiumYN==null?"":premiumYN);
			pum.setProductId(productId==null?"":productId);
			pum.setQuoteNo(quoteNo==null?"":quoteNo);
			pum.setQuoteStatus(quoteStatus==null?"":quoteStatus);
			pum.setReferenceNo(referenceNo==null?"":referenceNo);
			pum.setReferralRemarks(referralComment==null?"":referralComment);
			pum.setReferralStatus(referralStatus==null?"":referralStatus);
			pum.setReferralUpdateYn(referralUpdate==null?"":referralUpdate);
			pum.setStatus(status==null?"":status);
			pum.setSubjectivityName(subjectivityName==null?"":subjectivityName);
			pum.setSubjectivityYn(subjectivityYn==null?"":subjectivityYn);
			pum.setGeneratePolicyYn(generatePolicy==null?"N":generatePolicy);
			
			List<CommodityDetail> commodityDetails = new ArrayList<CommodityDetail>();
			if(policyExcess!=null && policyExcess.size()>0) {
				for(int i=0;i<policyExcess.size();i++) {
					CommodityDetail cd = new CommodityDetail();
					cd.setRate(Double.valueOf(StringUtils.isBlank(commodityRate.get(i))?"0":commodityRate.get(i)));
					cd.setWarRate(Double.valueOf(StringUtils.isBlank(commodityWarRate.get(i))?"0":commodityWarRate.get(i)));
					cd.setPolicyExcess(Double.valueOf(StringUtils.isBlank(policyExcess.get(i))?"0":policyExcess.get(i)));
					cd.setPolicyExcessDescription(StringUtils.isBlank(excessDesc.get(i))?"":excessDesc.get(i));
					cd.setPolicyExcessPercentage(Double.valueOf(StringUtils.isBlank(policyExcessPercent.get(i))?"0":policyExcessPercent.get(i)));
					commodityDetails.add(cd);
				}
			}
			pum.setCommodityDetails(commodityDetails);
			
			PremiumDetails pd = new PremiumDetails();
			pd.setAdditionalPremium(StringUtils.isBlank(additionalPremium)?"0":additionalPremium);
			pd.setExcessSign(premiumOption==null?"+":premiumOption);
			pd.setInspectionFee(Double.valueOf(StringUtils.isBlank(inspectionFee)?"0":inspectionFee));
			pd.setTotalPremium(Double.valueOf(StringUtils.isBlank(totalPremium)?"0":totalPremium));
			pd.setNetPremium(Double.valueOf(StringUtils.isBlank(netPremium)?"0":netPremium));
			pd.setTotalWarPremium(Double.valueOf(StringUtils.isBlank(totalWarPremium)?"0":totalWarPremium));
			pd.setVatTax(Double.valueOf(StringUtils.isBlank(vatTax)?"0":vatTax));
			pum.setPremiumDetails(pd);
		}catch(Exception e) {
			logger.info("Exception @ PremiumAction.mapPremiumUpdateInputs(): "+e);
			e.printStackTrace();
		}
		return pum;
	}
	
	public String inet() {
		try {
			QuotationModel qm = mapPremiumResponseInputs();
			QuotationResponse qr = service.premiumResponse(qm);
			mapPremiumResponseOutputs(qr);
			GetShipDetail();
		}catch(Exception e) {
			addActionError(defaultError);
			logger.info("Exception @ PremiumAction.inet(): "+e);
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	private void mapPremiumResponseOutputs(QuotationResponse qs) {
		try {
		
			if(qs.getErrors()!=null && qs.getErrors().size()>0) {
				mapErrors(qs.getErrors());
			}
				QuotationModel qm = qs.getQuoteResponse();
				if(!hasActionErrors() || qm != null){
					List<Map<String, Object>> qil = new ArrayList<Map<String, Object>>();
					Map<String,Object> qim = new HashMap<String, Object>();
					
					//Map<String,Object> pei = new HashMap<String, Object>();
					//Map<String,Object> opi = new HashMap<String, Object>();

					setStatus(qm.getStatus()==null?"":qm.getStatus());
					setReferenceNo(qm.getReferenceNo()==null?"":qm.getReferenceNo());
					setApplicationNo(qm.getReferenceNo()==null?"":qm.getReferenceNo());
					//setEndt(qm.getEndtYn()==null?false:("Y".equalsIgnoreCase(qm.getEndtYn())?true:false));
					setEndTypeId(qm.getEndtTypeId()==null?"":qm.getEndtTypeId());
					//setEndtType(qm.getEndtTypeDescription()==null?"":qm.getEndtTypeDescription());
					//setFinancial(qm.getFinanceEndtYn()==null?false:("Y".equalsIgnoreCase(qm.getFinanceEndtYn())?true:false));
					//setFinancialEndt(qm.getFinanceEndtYn()==null?false:("Y".equalsIgnoreCase(qm.getFinanceEndtYn())?true:false));
					setFinalizeYN(qm.getFinalizeYn()==null?"":qm.getFinalizeYn());
					
					qim.put("ADMIN_REFERRAL_STATUS", qm.getAdminReferralStatus()==null?"":qm.getAdminReferralStatus());
					qim.put("IMO_NUMBER", qm.getImoNumber()==null?"":qm.getImoNumber());
					//qim.put("REFERRAL_DESC", qm.getAdminReferralRemarks()==null?"":qm.getAdminReferralRemarks());
					String referralDesc = "";
					try {
						List<Referrals> rl = qm.getReferrals();
						if(rl!=null && rl.size()>0) {
							List<String> referralDescList = new ArrayList<String>();
							for(Referrals r: rl) {
								if(StringUtils.isNotBlank(r.getReferralName())) {
									referralDescList.add(r.getReferralName());
								}
							}
							referralDesc = StringUtils.join(referralDescList,"~");
						}
					}catch(Exception e) {
						logger.info("Exception @ PremiumAction.mapPremiumResponseOutputs()--REFERRAL_DESC : "+e);
						e.printStackTrace();
					}
					qim.put("REFERRAL_DESC", referralDesc);
					qim.put("LOGIN_ID", qm.getLoginId()==null?"":qm.getLoginId());
					qim.put("ISSUER", qm.getIssuerId()==null?"":qm.getIssuerId());
					qim.put("STATUS", qm.getStatus()==null?"":qm.getStatus());
					qim.put("CHANNEL_TYPE", qm.getChannelType()==null?"":qm.getChannelType());
					qim.put("ADMIN_REMARKS", qm.getAdminRemarks()==null?"":qm.getAdminRemarks());
					
					qim.put("PDF_PRE_SHOW_STATUS", qm.getPdfPremiumShowStatus());
					qim.put("PDF_BANKER_STATUS", qm.getPdfBankerStatus());
					qim.put("PDF_BANKER_ASSURED_STATUS", qm.getPdfBankerAssuredStatus());
					qim.put("PDF_CURRENCY_STATUS", qm.getPdfCurrencyStatus());
					qim.put("PDF_STAMP_STATUS", qm.getPdfStampStatus());
					qim.put("PDF_EXCESS_STATUS", qm.getPdfExcessStatus());
					
					//pei.put("POLICY_NO", qm.getPolicyNo()==null?"":qm.getPolicyNo());
					//pei.put("BROKER_NAME", qm.getBrokerName()==null?"":qm.getBrokerName());
					
					//opi.put("OPEN_COVER_NO", openCoverNo);
					//opi.put("BROKER_NAME", qm.getBrokerName()==null?"":qm.getBrokerName());
					LcBankDetails lc=qm.getLcBankDetails();
					if(lc!=null) {
						qim.put("BANK_NAME", lc.getBankName()==null?"":lc.getBankName());
					}
					CustomerDetails cd = qm.getCustomerDetails();
					if(cd != null) {
						qim.put("CUSTOMER_ID", cd.getCode()==null?"":cd.getCode());
						qim.put("CUSTOMER_NAME", cd.getName()==null?"":cd.getName());
					}
					//setPolicyEndtInfo(pei);
					//setOpenCoverInfo(opi);

					QuoteDetails qd = qm.getQuoteDetails();
					if(qd != null) {
						qim.put("QUOTE_NUMBER", qd.getQuoteNo()==null?"":qd.getQuoteNo());
						qim.put("POLICY_START_DATE", qd.getInceptionDate()==null?"":qd.getInceptionDate());
						qim.put("WAR_SRCC", qd.getWarAndSrccYn()==null?"":qd.getWarAndSrccYn());
						qim.put("CURRENCY_NAME", qd.getCurrencyName()==null?"":qd.getCurrencyName());
						qim.put("EXCHANGE_RATE", qd.getCurrencyValue()==null?"":qd.getCurrencyValue());
						qim.put("SALES_TERM", qd.getIncoTermsDescription()==null?"":qd.getIncoTermsDescription());
						qim.put("SETTLING_AGENT_NAME", qd.getSettlingAgentName()==null?"":qd.getSettlingAgentName());
						qim.put("PACKAGE_DESCRIPTION", qd.getPackageName()==null?"":qd.getPackageName());

						TransportDetails td = qd.getTransportDetails();
						if(td != null) {
							qim.put("TRANSPORT_DESCRIPTION", td.getModeOfTransportName()==null?"":td.getModeOfTransportName());
							qim.put("COVER_NAME", td.getCoverName()==null?"":td.getCoverName());
							qim.put("CONVDESC", td.getModeOfCarriageName()==null?"":td.getModeOfCarriageName());
							qim.put("MODE_OF_TRANSPORT", td.getModeOfTansportCode()==null?"":td.getModeOfTansportCode());
							qim.put("COVER_ID", td.getCoverCode()==null?"":td.getCoverCode());
							qim.put("ORIGIN_COUNTRY","YES".equalsIgnoreCase(td.getOriginWarehouseYn())?(td.getOriginCityName()+","+td.getOriginCountryName()+", WAREHOUSE"):(td.getOriginCityName()+","+td.getOriginCountryName()+", ANY PORT"));
							qim.put("DEST_COUNTRY", "YES".equalsIgnoreCase(td.getDestinationWarehouseYn())?(td.getDestinationCityName()+","+td.getDestinationCountryName()+", WAREHOUSE"):(td.getDestinationCityName()+","+td.getDestinationCountryName()+", ANY PORT"));
						}
					}
					
					PremiumDetails pd = qm.getPremiumDetails();
					if(pd != null) {
						//qim.put("EQUIVALENT", pd.getEquivalentInsuredValue());
						qim.put("TOTAL_PREMIUM", pd.getTotalPremium());
						qim.put("MARINE_PREMIUM", pd.getMarinePremium());
						qim.put("WAR_PREMIUM", pd.getWarPremium());
						qim.put("WAR_PREMIUM", pd.getWarPremium());
						qim.put("EXCESS_SIGN", pd.getExcessSign()==null?"+":pd.getExcessSign());
						qim.put("ADDITIONAL_PREMIUM", pd.getAdditionalPremium());
						qim.put("GOVT_TAX", pd.getGovernmentTax());
						qim.put("INSPECTION_FEE", pd.getInspectionFee());
						qim.put("POLICYFEEYN", pd.getPolicyFeeYn()==null?"":pd.getPolicyFeeYn());
						qim.put("POLICY_ISSUNCE_FEE", pd.getPolicyIssunceFee());
						qim.put("VAT_TAX_PERCENT", pd.getVatTaxPercentage());
						qim.put("VAT_TAX_AMT", pd.getVatTaxAmount());
						qim.put("NET_PREMIUM", pd.getNetPremium());
						qim.put("TOTAL_WAR_PREMIUM", pd.getTotalWarPremium());
						qim.put("DISCOUNT_PREMIUM", pd.getDiscountPremium());
						
						
						qim.put("GSTFLAG", pd.getGstflag());
						qim.put("CGST", pd.getCgst());
						qim.put("SGST", pd.getSgst());
						qim.put("IGST", pd.getIgst());
						qim.put("UTGST", pd.getUtgst());
						qim.put("CGST_RATE", pd.getCgstRate());
						qim.put("SGST_RATE", pd.getSgstRate());
						qim.put("IGST_RATE", pd.getIgstRate());
						qim.put("UTGST_RATE", pd.getUtgstRate());
						qim.put("STAMP_DUTY", pd.getStampduty());
						qim.put("IMPORT_PREMIUM", pd.getImportPremium());
						
						qim.put("TOTAL_INSURED", pd.getTotalInsuredValue());
						qim.put("EQUIVALENT", pd.getEquivalentInsuredValue());
					}
					
					double totalInsued = 0;
					
					List<CommodityDetail> cdll = qd.getCommodityDetails();
					if(cdll != null && cdll.size()>0) {
						List<Map<String, Object>> igil = new ArrayList<Map<String,Object>>();
						for(int i=0;i<cdll.size();i++) {
							CommodityDetail cdlm = cdll.get(i);
							if(cdlm!=null) {
								Map<String, Object> igim = new HashMap<String, Object>();
								igim.put("COMMODITY_NAME", cdlm.getGoodsCategoryName()==null?"":cdlm.getGoodsCategoryName());
								igim.put("COMMODITY_ID", cdlm.getGoodsCategoryCode()==null?"":cdlm.getGoodsCategoryCode());
								igim.put("POLICY_EXCESS", cdlm.getPolicyExcess());
								igim.put("POLICY_EXCESS_PERCENT", cdlm.getPolicyExcessPercentage());
								igim.put("EXCESS_DESCRIPTION", cdlm.getPolicyExcessDescription()==null?"":cdlm.getPolicyExcessDescription());
								igim.put("DESCRIPTION", cdlm.getGoodsCategoryDescription()==null?"":cdlm.getGoodsCategoryDescription());
								igim.put("SUM_INSURED", cdlm.getInsuredValue());
								igim.put("MARINE_WAR_RATE", cdlm.getMarineWarRate());
								igim.put("RATE", cdlm.getRate());
								igim.put("WARRATE", cdlm.getWarRate());
								igim.put("FRAGILE", cdlm.getFragile());
								
								igim.put("DUTY_SI", cdlm.getImportDutySumInsured()==null?"0":cdlm.getImportDutySumInsured());
								igim.put("RAG", cdlm.getRag());
								igim.put("IMPORT_RATE", pd.getTotalImportDuty());
								totalInsued = totalInsued+cdlm.getInsuredValue();
								igil.add(igim);
							}
						}
						setInsuredGoodsInfo(igil);
					}
					
					/*qim.put("TOTAL_INSURED", qm.getTotalInsuredValue());
					qim.put("EQUIVALENT", qm.getEquivalentInsuredValue());*/
					qil.add(qim);
					setQuotationInfo(qil);
					setPolicyInformation(qil);
					
				}
			
		}catch(Exception e) {
			addActionError(defaultError);
			logger.info("Exception @ PremiumAction.mapPremiumResponseOutputs(): "+e);
			e.printStackTrace();
		}
		
	}

	private QuotationModel mapPremiumResponseInputs() {
		QuotationModel qm = new QuotationModel();
		try {
			qm.setBranchCode(belongingBranch==null?"01":belongingBranch);
			qm.setReferenceNo(referenceNo==null?"":referenceNo);
		}catch(Exception e) {
			logger.info("Exception @ PremiumAction.mapPremiumResponseInputs(): "+e);
			e.printStackTrace();
		}
		return qm;
	}

	public String calculate() {
		try {
			PremiumUpdateModel pum = mapPremiumUpdateInputs();
			QuotationResponse qr = service.premiumCalculate(pum);
			mapPremiumResponseOutputs(qr);
			GetShipDetail();
		}catch(Exception e) {
			addActionError(defaultError);
			logger.info("Exception @ PremiumAction.calculate(): "+e);
			e.printStackTrace();
		} /*
			 * finally { if(hasActionErrors()) { return inet(); } }
			 */
		return SUCCESS;
	}

	
	public String policyInfo() {
		return "policyInfo";
	}

	@SuppressWarnings("unchecked")
	public String addClauses() {

		try {
			clauses();
			List<Object> tempList = new ArrayList<Object>();
			ArrayList<String> list = new ArrayList<String>();
			if (conditionsList != null && !conditionsList.isEmpty()) {
				if ("1".equals(conditionType)) {
					tempList = (List<Object>) conditionsList.get("clausesDesc");
					for (Iterator iterator = tempList.iterator(); iterator.hasNext();) {
						list.add(((Map<String, Object>) iterator.next()).get("CODE").toString());
					}
				} else if ("2".equals(conditionType)) {
					tempList = (List<Object>) conditionsList.get("extraClausesDesc");
					for (Iterator iterator = tempList.iterator(); iterator.hasNext();) {
						list.add(((Map<String, Object>) iterator.next()).get("CODE").toString());
					}
				} else if ("3".equals(conditionType)) {
					tempList = (List<Object>) conditionsList.get("exclusionsDesc");
					for (Iterator iterator = tempList.iterator(); iterator.hasNext();) {
						list.add(((Map<String, Object>) iterator.next()).get("CODE").toString());
					}
				} else if ("4".equals(conditionType)) {
					tempList = (List<Object>) conditionsList.get("warrantyDesc");
					for (Iterator iterator = tempList.iterator(); iterator.hasNext();) {
						list.add(((Map<String, Object>) iterator.next()).get("CODE").toString());
					}
				}
				if (list.isEmpty()) {
					list.add(0, "0");
				}
				conditions = service.getExistingConditions(conditionType, belongingBranch, coverId, list);
			}
		} catch (Exception e) {
			logger.debug("Exception @ " + e);
			e.printStackTrace();
		}
		return "addConditions";
	}

	@SuppressWarnings("unchecked")
	public void updateConditionsInfo() {
		clauses();
		List<Object> tempList = new ArrayList<Object>();
		Map<String, Object> map = null;
		if (conditionsList != null && !conditionsList.isEmpty()) {
			clausesId = new ArrayList<Object>();
			clausesDesc = new ArrayList<Object>();
			warId = new ArrayList<Object>();
			warDesc = new ArrayList<Object>();
			warrantyId = new ArrayList<Object>();
			warrantyDesc = new ArrayList<Object>();
			exclusionId = new ArrayList<Object>();
			exclusionDesc = new ArrayList<Object>();
			tempList = (List<Object>) conditionsList.get("clausesDesc");
			for (Iterator iterator = tempList.iterator(); iterator.hasNext();) {
				map = (Map<String, Object>) iterator.next();
				clausesId.add(map.get("CODE").toString());
				clausesDesc.add(map.get("CODEDESC").toString());
			}
			tempList = (List<Object>) conditionsList.get("extraClausesDesc");
			for (Iterator iterator = tempList.iterator(); iterator.hasNext();) {
				map = (Map<String, Object>) iterator.next();
				warId.add(map.get("CODE").toString());
				warDesc.add(map.get("CODEDESC").toString());
			}
			tempList = (List<Object>) conditionsList.get("exclusionsDesc");
			for (Iterator iterator = tempList.iterator(); iterator.hasNext();) {
				map = (Map<String, Object>) iterator.next();
				exclusionId.add(map.get("CODE").toString());
				exclusionDesc.add(map.get("CODEDESC").toString());
			}
			tempList = (List<Object>) conditionsList.get("warrantyDesc");
			for (Iterator iterator = tempList.iterator(); iterator.hasNext();) {
				map = (Map<String, Object>) iterator.next();
				warrantyId.add(map.get("CODE").toString());
				warrantyDesc.add(map.get("CODEDESC").toString());
			}
			updateConditions();
		}
	}

	public String getChannelType() {
		return channelType;
	}

	public void setChannelType(String channelType) {
		this.channelType = channelType;
	}

	public String getCreditNoteStatus() {
		if ("User".equalsIgnoreCase(loginUserType)) {
			return service.getCreditNoteStatus(adminLoginId, productId);
		} else {
			return "Y";
		}
	}

//	private String calculateGovtTax() {
//		String govtTax = "0";
//		taxInfo = policyService.getTaxInfo(branchCode, loginId, issuer);
//		if (!CollectionUtils.isEmpty(taxInfo)) {
//			govtTax = policyService.calculateGovernmentTax(Double.parseDouble(totalPremium), additionalPremium, loginId,
//					openCoverNo);
//		}
//		return StringUtils.isBlank(govtTax) ? "0" : govtTax;
//	}

	/*public String getPremiumInfoReferralMsg() {
		try {
			adminuwList = new PolicyGenerationDAO().getResultList("GET_UW_REFLIST",
					new String[] { applicationNo, branchCode1 });
		} catch (Exception e) {
			e.printStackTrace();
		}
		Object args[] = new Object[1];
		if (adminuwList != null && adminuwList.size() > 1) {
			args[0] = "One of the following ";
		} else if (adminuwList != null && adminuwList.size() == 1) {
			args[0] = "Following ";
		} else {
			args[0] = "";
		}
		return "";
		// LocalizedTextUtil.findDefaultText("premiumInfo.referralMsg", Locale.ENGLISH,
		// args);
	}*/

	public void setAdminuwList(List<Object> adminuwList) {
		this.adminuwList = adminuwList;
	}

	public List<Object> getAdminuwList() {
		return adminuwList;
	}

	public void setInspectionFee(String inspectionFee) {
		this.inspectionFee = inspectionFee;
	}

	public String getInspectionFee() {
		return inspectionFee;
	}

	public void setEditClausesYN(String editClausesYN) {
		this.editClausesYN = editClausesYN;
	}

	public String getEditClausesYN() {
		return StringUtils.isBlank(editClausesYN) ? "N" : editClausesYN;
	}

	public void setEditStatus(String editStatus) {
		this.editStatus = editStatus;
	}

	public String getEditStatus() {
		return editStatus;
	}

	public void setFinalizeYN(String finalizeYN) {
		this.finalizeYN = finalizeYN;
	}

	public String getFinalizeYN() {
		return StringUtils.isBlank(finalizeYN) ? "N" : finalizeYN;
	}

	public void setPolicyExcessPercent(List<String> policyExcessPercent) {
		this.policyExcessPercent = policyExcessPercent;
	}

	public List<String> getPolicyExcessPercent() {
		return policyExcessPercent;
	}

	public String getRateChange() {
		return rateChange;
	}

	public void setRateChange(String rateChange) {
		this.rateChange = rateChange;
	}

	public List<String> getOriginalCommodityRate() {
		return originalCommodityRate;
	}

	public void setOriginalCommodityRate(List<String> originalCommodityRate) {
		this.originalCommodityRate = originalCommodityRate;
	}

	public List<String> getOriginalCommodityWarRate() {
		return originalCommodityWarRate;
	}

	public void setOriginalCommodityWarRate(List<String> originalCommodityWarRate) {
		this.originalCommodityWarRate = originalCommodityWarRate;
	}

	/*public boolean isFinancialEndt() {
		boolean financialEndt = true;
		String endtIds = policyService.getEndtYype(applicationNo);
		System.out.println("endtIds=====>" + endtIds);
		if (StringUtils.isNotBlank(endtIds))
			financialEndt = policyService.checkFinancialEndtCategory(endtIds);
		return !financialEndt;
	}*/
	
	public boolean isFinancialEndt() {
		return service.isFinancialEndorsement(applicationNo);
	}

	private String validateDueInsert(String type) {
		String result = "success";
		/*if ("quote".equalsIgnoreCase(type)) {
			if (dueList != null) {
				List<String> error = service.validatePaymentTerms(quoteNo, policyNo, dueDate, dueamount, duepercent,
						effectiveDatePT, dueList, String.valueOf(netPremium), branchCode);
				for (int i = 0; i < error.size(); i++) {
					addActionError(error.get(i));
					result = "error";
				}

				
				 * for(int i=0; i<dueList.size();i++){/*
				 * 
				 * if(StringUtils.isBlank(bean.getOpenCoverNum().get(i))){
				 * addActionError("Please Select Open Cover No at Row "+ (i+1)); }
				 * 
				 * if(StringUtils.isBlank(getDueamount().get(i))){
				 * addActionError("Please Enter Due Amount at Row "+ (i+1)); }
				 * if(StringUtils.isBlank(getDueDate().get(i))){
				 * addActionError("Please Select Due Date at Row "+ (i+1)); }
				 * if(StringUtils.isBlank(getEffectiveDatePT().get(i))){
				 * addActionError("Please Select Effective Date at Row "+ (i+1)); }
				 * if(StringUtils.isBlank(getDuepercent().get(i))){
				 * addActionError("Please Select Due Percent at Row "+ (i+1)); } }
				 
			}
		} else if ("policy".equalsIgnoreCase(type)) {
			String totDuePre = "0";
			String totdueAmt = "0";
			List<Map<String, Object>> dueData = service.getDueData(quoteNo);
			if (dueData.size() > 0) {

				for (int i = 0; i < dueData.size(); i++) {
					Map<String, Object> map = dueData.get(i);
					totdueAmt = map.get("DUE_AMOUNT") == null ? "" : map.get("DUE_AMOUNT").toString();
					totDuePre = map.get("DUE_PERCENTAGE") == null ? "" : map.get("DUE_PERCENTAGE").toString();
				}
				double premium = 0;
				// if(isEndt()){
				// premium=Double.parseDouble(netPremium);

				// }else{
				premium = Double.parseDouble(netPremium);

				// }
				if (Double.parseDouble(totDuePre) != 100) {
					addActionError("Total Due % should be equal to 100.Kindly Re Submit");
					result = "error";
				}

				if (Math.round(Double.parseDouble(totdueAmt)) != Math.round(premium)) {
					addActionError("Total Due amount should be equal to " + premium + " .Kindly Re Submit");
					result = "error";
				}

			} else {
				if (Double.parseDouble(netPremium) > 0) {
					addActionError("Error in Payment Terms insert");
					result = "error";
				}
			}
		}*/
		return result;
	}

	private void validateDueEdit() {

		if (StringUtils.isBlank(getDueamount().get(0))) {
			addActionError("Please Enter Due Amount");
		}
		if (StringUtils.isBlank(getDueDate().get(0))) {
			addActionError("Please Select Due Date");
		}
		if (StringUtils.isBlank(getEffectiveDatePT().get(0))) {
			addActionError("Please Select Effective Date");
		}
		if (StringUtils.isBlank(getDuepercent().get(0))) {
			addActionError("Please Select Due Percent");
		}
	}

	public String paymentTerms() {
		if (reqFrom == null) {
			setReqFrom("search");
		} else if ("paymentTermsNew".equalsIgnoreCase(reqFrom)) {
			setPaymentTermsDetails(service.getPaymentTermsDetails("Due", policyNo, productId, openCoverNo));
		} else if ("display".equalsIgnoreCase(reqFrom)) {
			setPaymentTermsDetails(
					service.getPaymentTermsDetails("bulkreport".equalsIgnoreCase(menuBlocker) ? "vehicle" : "Policy",
							searchValue, productId, openCoverNo));
		}

		return "paymentTermsNew";
	}

	public String updateDue() {
		if ("addNew".equalsIgnoreCase(reqFrom)) {
			validateDueInsert("update");
		} else
			validateDueEdit();
		if (!hasActionErrors()) {
			String product = ("bulkreport".equalsIgnoreCase(menuBlocker)) ? "13T"
					: "3".equalsIgnoreCase(productId) ? "3C" : "11C";
			service.insertDueDetails(quoteNo, policyNo, dueDate, dueamount, duepercent, effectiveDatePT, dueList,
					reqFrom, snoPT, amendId, product);
		}
		setReqFrom("paymentTermsNew");
		setPaymentTermsDetails(service.getPaymentTermsDetails("Due", policyNo, productId, openCoverNo));
		return "paymentTermsNew";

	}

	/*
	 * public String searchPT() {
	 * 
	 * setReqFrom("display"); return "paymentTermsNew"; }
	 */
	public List<String> getExcessDesc() {
		return excessDesc;
	}

	public void setExcessDesc(List<String> excessDesc) {
		this.excessDesc = excessDesc;
	}

	public void setEffectiveDate(String effectiveDate) {
		this.effectiveDate = effectiveDate;
	}

	public String getEffectiveDate() {
		return effectiveDate;
	}

	public void setBranchCode1(String branchCode1) {
		this.branchCode1 = branchCode1;
	}

	public String getBranchCode1() {
		return branchCode1;
	}

	public void setPaymentTermsDetails(List<Object> paymentTermsDetails) {
		this.paymentTermsDetails = paymentTermsDetails;
	}

	public List<Object> getPaymentTermsDetails() {
		return paymentTermsDetails;
	}

	public void setPaymentTerms(List<Object> paymentTerms) {
		this.paymentTerms = paymentTerms;
	}

	public List<Object> getPaymentTerms() {
		return paymentTerms;
	}

	public void setReqFrom(String reqFrom) {
		this.reqFrom = reqFrom;
	}

	public String getReqFrom() {
		return reqFrom;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

	public void setMenuBlocker(String menuBlocker) {
		this.menuBlocker = menuBlocker;
	}

	public String getMenuBlocker() {
		return menuBlocker;
	}

	public void setVatTax(String vatTax) {
		this.vatTax = vatTax;
	}

	public String getVatTax() {
		return vatTax;
	}

	/**
	 * @return the quotationInfo
	 */
	public List<Map<String, Object>> getQuotationInfo() {
		return quotationInfo;
	}

	/**
	 * @param quotationInfo the quotationInfo to set
	 */
	public void setQuotationInfo(List<Map<String, Object>> quotationInfo) {
		this.quotationInfo = quotationInfo;
	}

	/**
	 * @return the insuredGoodsInfo
	 */
	public List<Map<String, Object>> getInsuredGoodsInfo() {
		return insuredGoodsInfo;
	}

	/**
	 * @param insuredGoodsInfo the insuredGoodsInfo to set
	 */
	public void setInsuredGoodsInfo(List<Map<String, Object>> insuredGoodsInfo) {
		this.insuredGoodsInfo = insuredGoodsInfo;
	}

	public String getReferenceNo() {
		return referenceNo;
	}

	public void setReferenceNo(String referenceNo) {
		this.referenceNo = referenceNo;
	}

	public String getSubjectivityYn() {
		return subjectivityYn;
	}

	public void setSubjectivityYn(String subjectivityYn) {
		this.subjectivityYn = subjectivityYn;
	}

	public String getSubjectivityName() {
		return subjectivityName;
	}

	public void setSubjectivityName(String subjectivityName) {
		this.subjectivityName = subjectivityName;
	}

	/**
	 * @return the policyInformation
	 */
	public List<Map<String, Object>> getPolicyInformation() {
		return policyInformation;
	}

	/**
	 * @param policyInformation the policyInformation to set
	 */
	public void setPolicyInformation(List<Map<String, Object>> policyInformation) {
		this.policyInformation = policyInformation;
	}

	/**
	 * @return the condStatus
	 */
	public String getCondStatus() {
		return condStatus;
	}

	/**
	 * @param condStatus the condStatus to set
	 */
	public void setCondStatus(String condStatus) {
		this.condStatus = condStatus;
	}

	
	/**
	 * @return the shipdetail
	 */
	public List<ShipDetailResp> getShipdetail() {
		return shipdetail;
	}

	/**
	 * @param shipdetail the shipdetail to set
	 */
	public void setShipdetail(List<ShipDetailResp> shipdetail) {
		this.shipdetail = shipdetail;
	}

	public void GetShipDetail() {
		try {
			QuotationModel qm = mapPremiumResponseInputs();
			MarineShipResponse qr = service.shipsDetailResponse(qm);
			mapshipResponseOutputs(qr);
		}catch(Exception e) {
			addActionError(defaultError);
			logger.info("Exception @ PremiumAction.inet(): "+e);
			e.printStackTrace();
		}
	}

	private void mapshipResponseOutputs(MarineShipResponse qs) {
		try {
			
			if(qs.getErrors()!=null && qs.getErrors().size()>0) {
					mapErrors(qs.getErrors());
				}
				List<ShipDetailResp> qm = qs.getShipDetails();
				if(!hasActionErrors() || qm != null){
					setShipdetail(qm);
				}
		}catch(Exception e) {
			addActionError(defaultError);
			logger.info("Exception @ PremiumAction.mapPremiumResponseOutputs(): "+e);
			e.printStackTrace();
		}
	}

	public List<String> getCommodityImportRate() {
		return commodityImportRate;
	}

	public void setCommodityImportRate(List<String> commodityImportRate) {
		this.commodityImportRate = commodityImportRate;
	}
	
}
