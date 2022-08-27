package com.maan.adminnew.AdminMgt;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Aswin
 *
 */
/**
 * @author Aswin
 *
 */
public class AdminMgtBean {
	private String uid;
	private String utype;
	private String uname;
	private String loginID;
	private String pwd;
	private String branch;
	private String product;
	private String mname;
	private String urlPath;
	private String parent;
	private String status;
	private String from;
	private String from1;
	private String fromm1;
	private String fromm2;
	private String reqFrom;
	private String mode;
	private String mode1;
	private String index="0";
	private String mid;
	private String broker;
	private String[] productID;
	private String[] uwgrade; 
	private String[] attachedregion;
	private String searchBy;
	private String searchValue;
	private String email;
	
	private String oneOffPortFolio;
	private String openCoverPortFolio;
	private String oneOffPremium;
	private String openCoverPremium;
	private String oneOffPending;
	private String oneOffAccepted;
	private String oneOffRejected;
	private String openCoverPending;
	private String openCoverAccepted;
	private String openCoverRejected;
	private String noOfQuote;
	private String customerLinkedQuote;
	private String policyAccept;
	private String policyReject;
	private String referralPending;
	private String referralAccepted;
	private String referralRejected;
	
	 
	
	private String clausesType;
	private String clauseId;
	private String branchId;
	private String selProducts; 
	private String selregions;
	private String menuId[];
	 
	private List<Object> optionalCoverList;
	private List<String> optionalId;
	private List<String> optionalDesc;
	private List<Object> dashBoard;

	
	private String effectDate;
	private String coverNo;
	private String proposalNo;
    private List<Object> selectedCovers;
    private String openCoverNo;
    private String missippiOpenCoverNo;
	
	

	private List<Object>  openCoverNoList;
	private List<String>  openCoverNum;
	private List<String>  dueamount;
	private List<String>  duepercent;
	private List<String>  dueDate;
	private List<String>  dueList;
	private List<String>  effectiveDate;
    private List<Object> userSelection;
	private String userLoginId;
	private String sno;
	private String amendId;
	private List<Object> paymentTermsDetails;
	private List<Object> paymentTerms;
	private String regionCode;
	private String branchCodeS;
	
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
	
	private List<HashMap<String,Object>> errors=new ArrayList<HashMap<String,Object>>();
	public List<Object> getPaymentTerms() {
		return paymentTerms;
	}
	public void setPaymentTerms(List<Object> paymentTerms) {
		this.paymentTerms = paymentTerms;
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
	public List<String> getEffectiveDate() {
		return effectiveDate;
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
	public void setEffectiveDate(List<String> effectiveDate) {
		this.effectiveDate = effectiveDate;
	}
	
	public void setDueList(List<String> dueList) {
		this.dueList = dueList;
	}
	public void setAmendId(String amendId) {
		this.amendId = amendId;
	}
	public String getAmendId() {
		return amendId;
	}
	public List<String> getDueList() {
		return dueList;
	}
	
	public void setSno(String sno) {
		this.sno = sno;
	}
	public String getSno() {
		return sno;
	}
	public List<Object> getOptionalCoverList() {
			return optionalCoverList;
	}
	public void setOptionalCoverList(List<Object> optionalCoverList) {
		this.optionalCoverList = optionalCoverList;
	}
	public List<String> getOptionalId() {
		return optionalId;
	}
	public void setOptionalId(List<String> optionalId) {
		this.optionalId = optionalId;
	}
	public List<String> getOptionalDesc() {
		return optionalDesc;
	}
	public void setOptionalDesc(List<String> optionalDesc) {
		this.optionalDesc = optionalDesc;
	}
	public String getEffectDate() {
		return effectDate;
	}
	public void setEffectDate(String effectDate) {
		this.effectDate = effectDate;
	}
	
	public List<Object> getSelectedCovers() {
		return selectedCovers;
	}
	public void setSelectedCovers(List<Object> selectedCovers) {
		this.selectedCovers = selectedCovers;
	}
	
	private List<Map<String,Object>> commodityList;
	public String getClausesType() {
		return clausesType;
	}
	public void setClausesType(String clausesType) {
		this.clausesType = clausesType;
	}
	public String getClauseId() {
		return clauseId;
	}
	public void setClauseId(String clauseId) {
		this.clauseId = clauseId;
	}
	public List<Map<String, Object>> getCommodityList() {
		return commodityList;
	}
	public void setCommodityList(List<Map<String, Object>> commodityList) {
		this.commodityList = commodityList;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUtype() {
		return utype;
	}
	public void setUtype(String utype) {
		this.utype = utype;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getLoginID() {
		return loginID;
	}
	public void setLoginID(String loginID) {
		this.loginID = loginID;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getBranch() {
		return branch;
	}
	public void setBranch(String branch) {
		this.branch = branch;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getUrlPath() {
		return urlPath;
	}
	public void setUrlPath(String urlPath) {
		this.urlPath = urlPath;
	}
	public String getParent() {
		return parent;
	}
	public void setParent(String parent) {
		this.parent = parent;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getFrom1() {
		return from1;
	}
	public void setFrom1(String from1) {
		this.from1 = from1;
	}
	public String getFromm1() {
		return fromm1;
	}
	public void setFromm1(String fromm1) {
		this.fromm1 = fromm1;
	}
	public String getFromm2() {
		return fromm2;
	}
	public void setFromm2(String fromm2) {
		this.fromm2 = fromm2;
	}
	public String getReqFrom() {
		return reqFrom;
	}
	public void setReqFrom(String reqFrom) {
		this.reqFrom = reqFrom;
	}
	public String getMode() {
		return mode;
	}
	public void setMode(String mode) {
		this.mode = mode;
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
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getBroker() {
		return broker;
	}
	public void setBroker(String broker) {
		this.broker = broker;
	}
	public String[] getProductID() {
		return productID;
	}
	public void setProductID(String[] productID) {
		this.productID = productID;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getOneOffPortFolio() {
		return oneOffPortFolio;
	}
	public void setOneOffPortFolio(String oneOffPortFolio) {
		this.oneOffPortFolio = oneOffPortFolio;
	}
	public String getOpenCoverPortFolio() {
		return openCoverPortFolio;
	}
	public void setOpenCoverPortFolio(String openCoverPortFolio) {
		this.openCoverPortFolio = openCoverPortFolio;
	}
	public String getOneOffPremium() {
		return oneOffPremium;
	}
	public void setOneOffPremium(String oneOffPremium) {
		this.oneOffPremium = oneOffPremium;
	}
	public String getOpenCoverPremium() {
		return openCoverPremium;
	}
	public void setOpenCoverPremium(String openCoverPremium) {
		this.openCoverPremium = openCoverPremium;
	}
	public String getOneOffPending() {
		return oneOffPending;
	}
	public void setOneOffPending(String oneOffPending) {
		this.oneOffPending = oneOffPending;
	}
	public String getOneOffAccepted() {
		return oneOffAccepted;
	}
	public void setOneOffAccepted(String oneOffAccepted) {
		this.oneOffAccepted = oneOffAccepted;
	}
	public String getOneOffRejected() {
		return oneOffRejected;
	}
	public void setOneOffRejected(String oneOffRejected) {
		this.oneOffRejected = oneOffRejected;
	}
	public String getOpenCoverPending() {
		return openCoverPending;
	}
	public void setOpenCoverPending(String openCoverPending) {
		this.openCoverPending = openCoverPending;
	}
	public String getOpenCoverAccepted() {
		return openCoverAccepted;
	}
	public void setOpenCoverAccepted(String openCoverAccepted) {
		this.openCoverAccepted = openCoverAccepted;
	}
	public String getOpenCoverRejected() {
		return openCoverRejected;
	}
	public void setOpenCoverRejected(String openCoverRejected) {
		this.openCoverRejected = openCoverRejected;
	}
	public void setProposalNo(String proposalNo) {
		this.proposalNo = proposalNo;
	}
	public String getProposalNo() {
		return proposalNo;
	}
	public void setOpenCoverNo(String openCoverNo) {
		this.openCoverNo = openCoverNo;
	}
	public String getOpenCoverNo() {
		return openCoverNo;
	}
	public void setCoverNo(String coverNo) {
		this.coverNo = coverNo;
	}
	public String getCoverNo() {
		return coverNo;
	}
	public void setUwgrade(String[] uwgrade) {
		this.uwgrade = uwgrade;
	}
	public String[] getUwgrade() {
		return uwgrade;
	}
	public void setBranchId(String branchId) {
		this.branchId = branchId;
	}
	public String getBranchId() {
		return branchId;
	}
	public void setSelProducts(String selProducts) {
		this.selProducts = selProducts;
	}
	public String getSelProducts() {
		return selProducts;
	}
	public void setMenuId(String menuId[]) {
		this.menuId = menuId;
	}
	public String[] getMenuId() {
		return menuId;
	}
	public String getNoOfQuote() {
		return noOfQuote;
	}
	public void setNoOfQuote(String noOfQuote) {
		this.noOfQuote = noOfQuote;
	}
	public String getCustomerLinkedQuote() {
		return customerLinkedQuote;
	}
	public void setCustomerLinkedQuote(String customerLinkedQuote) {
		this.customerLinkedQuote = customerLinkedQuote;
	}
	public String getPolicyAccept() {
		return policyAccept;
	}
	public void setPolicyAccept(String policyAccept) {
		this.policyAccept = policyAccept;
	}
	public String getPolicyReject() {
		return policyReject;
	}
	public void setPolicyReject(String policyReject) {
		this.policyReject = policyReject;
	}
	public String getReferralPending() {
		return referralPending;
	}
	public void setReferralPending(String referralPending) {
		this.referralPending = referralPending;
	}
	public String getReferralAccepted() {
		return referralAccepted;
	}
	public void setReferralAccepted(String referralAccepted) {
		this.referralAccepted = referralAccepted;
	}
	public String getReferralRejected() {
		return referralRejected;
	}
	public void setReferralRejected(String referralRejected) {
		this.referralRejected = referralRejected;
	}
	public void setDashBoard(List<Object> dashBoard) {
		this.dashBoard = dashBoard;
	}
	public List<Object> getDashBoard() {
		return dashBoard;
	}
	public void setPaymentTermsDetails(List<Object> paymentTermsDetails) {
		this.paymentTermsDetails = paymentTermsDetails;
	}
	public List<Object> getPaymentTermsDetails() {
		return paymentTermsDetails;
	}
	public void setUserLoginId(String userLoginId) {
		this.userLoginId = userLoginId;
	}
	public String getUserLoginId() {
		return userLoginId;
	}
	public void setUserSelection(List<Object> userSelection) {
		this.userSelection = userSelection;
	}
	public List<Object> getUserSelection() {
		return userSelection;
	}
	public void setOpenCoverNoList(List<Object> openCoverNoList) {
		this.openCoverNoList = openCoverNoList;
	}
	public List<Object> getOpenCoverNoList() {
		return openCoverNoList;
	}
	public void setOpenCoverNum(List<String> openCoverNum) {
		this.openCoverNum = openCoverNum;
	}
	public List<String> getOpenCoverNum() {
		return openCoverNum;
	}
	public void setMissippiOpenCoverNo(String missippiOpenCoverNo) {
		this.missippiOpenCoverNo = missippiOpenCoverNo;
	}
	public String getMissippiOpenCoverNo() {
		return missippiOpenCoverNo;
	}
	public String getRegionCode() {
		return regionCode;
	}
	public void setRegionCode(String regionCode) {
		this.regionCode = regionCode;
	}
	public String getBranchCodeS() {
		return branchCodeS;
	}
	public void setBranchCodeS(String branchCodeS) {
		this.branchCodeS = branchCodeS;
	}
	public List<HashMap<String, Object>> getErrors() {
		return errors;
	}
	public void setErrors(List<HashMap<String, Object>> errors) {
		this.errors = errors;
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
	public String[] getAttachedregion() {
		return attachedregion;
	}
	public void setAttachedregion(String[] attachedregion) {
		this.attachedregion = attachedregion;
	}
	public String getSelregions() {
		return selregions;
	}
	public void setSelregions(String selregions) {
		this.selregions = selregions;
	}
	
  
}
