package com.maan.quotation.model;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.google.gson.annotations.SerializedName;

public class QuotationModel {
	@SerializedName("ReferenceNo") 
    private String referenceNo;
    @SerializedName("ProductId") 
    private String productId;
    @SerializedName("BrokerCode") 
    private String brokerCode;
    @SerializedName("OpenCoverNo") 
    private String openCoverNo;
    @SerializedName("ChannelType") 
    private String channelType;
    @SerializedName("BranchCode") 
    private String branchCode;
    @SerializedName("LoginId") 
    private String loginId;
    @SerializedName("Issuer") 
    private String issuer;
    @SerializedName("Executive")
    private String executive;
    @SerializedName("CustomerDetails") 
    private CustomerDetails customerDetails;
    @SerializedName("QuoteDetails") 
    private QuoteDetails quoteDetails;
    @SerializedName("LcBankDetails") 
    private LcBankDetails lcBankDetails;
    
    @SerializedName("AdminReferralRemarks")
	private String adminReferralRemarks;
	@SerializedName("AdminReferralStatus")
	private String adminReferralStatus;
	@SerializedName("AdminRemarks")
	private String adminRemarks;
	@SerializedName("EditClausesYn")
	private String editClausesYn;
	@SerializedName("FinalizeYn")
	private String finalizeYn;
	@SerializedName("IssuerId")
	private String issuerId;
	
	@SerializedName("Remarks")
	private String remarks;
	@SerializedName("Status")
	private String status;
	@SerializedName("SubjectivityName")
	private String subjectivityName;
	@SerializedName("SubjectivityYn")
	private String subjectivityYn;
	@SerializedName("TotalInsuredValue") 
	private double totalInsuredValue;
	@SerializedName("EquivalentInsuredValue") 
    private double equivalentInsuredValue;
	@SerializedName("PremiumDetails")
	private PremiumDetails premiumDetails;
	@SerializedName("Referral")
	private List<Referrals> referrals;

	@SerializedName("EndtYn")
	private String endtYn;
	@SerializedName("EndtTypeId")
	private String endtTypeId;
	@SerializedName("EndtTypeDescription")
	private String endtTypeDescription;
	@SerializedName("FinanceEndtYn")
	private String financeEndtYn;

	@SerializedName("PolicyNo")
	private String policyNo;
	@SerializedName("BrokerName")
	private String brokerName;
	
	@SerializedName("ApplicationNo") 
    private String applicationNo;
	
	@SerializedName("LoginUserType") 
    private String loginUserType;

	
	@SerializedName("QuoteStatus") 
    private String quoteStatus;
	@SerializedName("VesselDeclareYN") 
    private String vesselDeclareYN;
	@SerializedName("ImoNumber") 
    private String imoNumber;
	@SerializedName("VesselSearchBy")
    private String vesselSearchBy;
	@SerializedName("IHSLRORIMO") 
    private String iHSLRORIMO;
	@SerializedName("ShipsCategory") 
    private String shipsCategory;
	@SerializedName("NameString") 
    private String nameString;
	@SerializedName("exshipsCategory") 
    private String ExshipsCategory;
	@SerializedName("exNameString") 
    private String ExNameString;
	@SerializedName("CertClausesYn") 
    private String certClausesYn;
	@SerializedName("PdfBankerAssuredStatus") 
    private String pdfBankerAssuredStatus;
    @SerializedName("PdfBankerStatus") 
    private String pdfBankerStatus;
    @SerializedName("PdfCurrencyStatus") 
    private String pdfCurrencyStatus;
    @SerializedName("PdfExcessStatus") 
    private String pdfExcessStatus;
    @SerializedName("PdfPremiumShowStatus") 
    private String pdfPremiumShowStatus;
    @SerializedName("PdfStampStatus") 
    private String pdfStampStatus;
	/**
	 * @return the referenceNo
	 */
	public String getReferenceNo() {
		return referenceNo;
	}
	/**
	 * @param referenceNo the referenceNo to set
	 */
	public void setReferenceNo(String referenceNo) {
		this.referenceNo = referenceNo;
	}
	/**
	 * @return the productId
	 */
	public String getProductId() {
		return productId;
	}
	/**
	 * @param productId the productId to set
	 */
	public void setProductId(String productId) {
		this.productId = productId;
	}
	/**
	 * @return the brokerCode
	 */
	public String getBrokerCode() {
		return brokerCode;
	}
	/**
	 * @param brokerCode the brokerCode to set
	 */
	public void setBrokerCode(String brokerCode) {
		this.brokerCode = brokerCode;
	}
	/**
	 * @return the openCoverNo
	 */
	public String getOpenCoverNo() {
		return openCoverNo;
	}
	/**
	 * @param openCoverNo the openCoverNo to set
	 */
	public void setOpenCoverNo(String openCoverNo) {
		this.openCoverNo = openCoverNo;
	}
	/**
	 * @return the channelType
	 */
	public String getChannelType() {
		return channelType;
	}
	/**
	 * @param channelType the channelType to set
	 */
	public void setChannelType(String channelType) {
		this.channelType = channelType;
	}
	/**
	 * @return the branchCode
	 */
	public String getBranchCode() {
		return branchCode;
	}
	/**
	 * @param branchCode the branchCode to set
	 */
	public void setBranchCode(String branchCode) {
		this.branchCode = branchCode;
	}
	/**
	 * @return the loginId
	 */
	public String getLoginId() {
		return loginId;
	}
	/**
	 * @param loginId the loginId to set
	 */
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	/**
	 * @return the issuer
	 */
	public String getIssuer() {
		return issuer;
	}
	/**
	 * @param issuer the issuer to set
	 */
	public void setIssuer(String issuer) {
		this.issuer = issuer;
	}
	/**
	 * @return the executive
	 */
	public String getExecutive() {
		return executive;
	}
	/**
	 * @param executive the executive to set
	 */
	public void setExecutive(String executive) {
		this.executive = executive;
	}
	/**
	 * @return the customerDetails
	 */
	public CustomerDetails getCustomerDetails() {
		return customerDetails;
	}
	/**
	 * @param customerDetails the customerDetails to set
	 */
	public void setCustomerDetails(CustomerDetails customerDetails) {
		this.customerDetails = customerDetails;
	}
	/**
	 * @return the quoteDetails
	 */
	public QuoteDetails getQuoteDetails() {
		return quoteDetails;
	}
	/**
	 * @param quoteDetails the quoteDetails to set
	 */
	public void setQuoteDetails(QuoteDetails quoteDetails) {
		this.quoteDetails = quoteDetails;
	}
	/**
	 * @return the lcBankDetails
	 */
	public LcBankDetails getLcBankDetails() {
		return lcBankDetails;
	}
	/**
	 * @param lcBankDetails the lcBankDetails to set
	 */
	public void setLcBankDetails(LcBankDetails lcBankDetails) {
		this.lcBankDetails = lcBankDetails;
	}
	/**
	 * @return the adminReferralRemarks
	 */
	public String getAdminReferralRemarks() {
		return adminReferralRemarks;
	}
	/**
	 * @param adminReferralRemarks the adminReferralRemarks to set
	 */
	public void setAdminReferralRemarks(String adminReferralRemarks) {
		this.adminReferralRemarks = adminReferralRemarks;
	}
	/**
	 * @return the adminReferralStatus
	 */
	public String getAdminReferralStatus() {
		return adminReferralStatus;
	}
	/**
	 * @param adminReferralStatus the adminReferralStatus to set
	 */
	public void setAdminReferralStatus(String adminReferralStatus) {
		this.adminReferralStatus = adminReferralStatus;
	}
	/**
	 * @return the adminRemarks
	 */
	public String getAdminRemarks() {
		return adminRemarks;
	}
	/**
	 * @param adminRemarks the adminRemarks to set
	 */
	public void setAdminRemarks(String adminRemarks) {
		this.adminRemarks = adminRemarks;
	}
	/**
	 * @return the editClausesYn
	 */
	public String getEditClausesYn() {
		return editClausesYn;
	}
	/**
	 * @param editClausesYn the editClausesYn to set
	 */
	public void setEditClausesYn(String editClausesYn) {
		this.editClausesYn = editClausesYn;
	}
	/**
	 * @return the finalizeYn
	 */
	public String getFinalizeYn() {
		return finalizeYn;
	}
	/**
	 * @param finalizeYn the finalizeYn to set
	 */
	public void setFinalizeYn(String finalizeYn) {
		this.finalizeYn = finalizeYn;
	}
	/**
	 * @return the issuerId
	 */
	public String getIssuerId() {
		return issuerId;
	}
	/**
	 * @param issuerId the issuerId to set
	 */
	public void setIssuerId(String issuerId) {
		this.issuerId = issuerId;
	}
	/**
	 * @return the remarks
	 */
	public String getRemarks() {
		return remarks;
	}
	/**
	 * @param remarks the remarks to set
	 */
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	/**
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}
	/**
	 * @param status the status to set
	 */
	public void setStatus(String status) {
		this.status = status;
	}
	/**
	 * @return the subjectivityName
	 */
	public String getSubjectivityName() {
		return subjectivityName;
	}
	/**
	 * @param subjectivityName the subjectivityName to set
	 */
	public void setSubjectivityName(String subjectivityName) {
		this.subjectivityName = subjectivityName;
	}
	/**
	 * @return the subjectivityYn
	 */
	public String getSubjectivityYn() {
		return subjectivityYn;
	}
	/**
	 * @param subjectivityYn the subjectivityYn to set
	 */
	public void setSubjectivityYn(String subjectivityYn) {
		this.subjectivityYn = subjectivityYn;
	}
	/**
	 * @return the premiumDetails
	 */
	public PremiumDetails getPremiumDetails() {
		return premiumDetails;
	}
	/**
	 * @param premiumDetails the premiumDetails to set
	 */
	public void setPremiumDetails(PremiumDetails premiumDetails) {
		this.premiumDetails = premiumDetails;
	}
	/**
	 * @return the referrals
	 */
	public List<Referrals> getReferrals() {
		return referrals;
	}
	/**
	 * @param referrals the referrals to set
	 */
	public void setReferrals(List<Referrals> referrals) {
		this.referrals = referrals;
	}
	/**
	 * @return the endtYn
	 */
	public String getEndtYn() {
		return endtYn;
	}
	/**
	 * @param endtYn the endtYn to set
	 */
	public void setEndtYn(String endtYn) {
		this.endtYn = endtYn;
	}
	/**
	 * @return the endtTypeId
	 */
	public String getEndtTypeId() {
		return endtTypeId;
	}
	/**
	 * @param endtTypeId the endtTypeId to set
	 */
	public void setEndtTypeId(String endtTypeId) {
		this.endtTypeId = endtTypeId;
	}
	/**
	 * @return the endtTypeDescription
	 */
	public String getEndtTypeDescription() {
		return endtTypeDescription;
	}
	/**
	 * @param endtTypeDescription the endtTypeDescription to set
	 */
	public void setEndtTypeDescription(String endtTypeDescription) {
		this.endtTypeDescription = endtTypeDescription;
	}
	/**
	 * @return the financeEndtYn
	 */
	public String getFinanceEndtYn() {
		return financeEndtYn;
	}
	/**
	 * @param financeEndtYn the financeEndtYn to set
	 */
	public void setFinanceEndtYn(String financeEndtYn) {
		this.financeEndtYn = financeEndtYn;
	}
	/**
	 * @return the policyNo
	 */
	public String getPolicyNo() {
		return policyNo;
	}
	/**
	 * @param policyNo the policyNo to set
	 */
	public void setPolicyNo(String policyNo) {
		this.policyNo = policyNo;
	}
	/**
	 * @return the brokerName
	 */
	public String getBrokerName() {
		return brokerName;
	}
	/**
	 * @param brokerName the brokerName to set
	 */
	public void setBrokerName(String brokerName) {
		this.brokerName = brokerName;
	}
	/**
	 * @return the applicationNo
	 */
	public String getApplicationNo() {
		return applicationNo;
	}
	/**
	 * @param applicationNo the applicationNo to set
	 */
	public void setApplicationNo(String applicationNo) {
		this.applicationNo = applicationNo;
	}
	public String getLoginUserType() {
		return loginUserType;
	}
	public void setLoginUserType(String loginUserType) {
		this.loginUserType = loginUserType;
	}
	public String getQuoteStatus() {
		return quoteStatus;
	}
	public void setQuoteStatus(String quoteStatus) {
		this.quoteStatus = quoteStatus;
	}
	/**
	 * @return the vesselDeclareYN
	 */
	public String getVesselDeclareYN() {
		return vesselDeclareYN;
	}
	/**
	 * @param vesselDeclareYN the vesselDeclareYN to set
	 */
	public void setVesselDeclareYN(String vesselDeclareYN) {
		this.vesselDeclareYN = vesselDeclareYN;
	}
	/**
	 * @return the imoNumber
	 */
	public String getImoNumber() {
		return imoNumber;
	}
	/**
	 * @param imoNumber the imoNumber to set
	 */
	public void setImoNumber(String imoNumber) {
		this.imoNumber = imoNumber;
	}
	/**
	 * @return the vesselSearchBy
	 */
	public String getVesselSearchBy() {
		return vesselSearchBy;
	}
	/**
	 * @param vesselSearchBy the vesselSearchBy to set
	 */
	public void setVesselSearchBy(String vesselSearchBy) {
		this.vesselSearchBy = vesselSearchBy;
	}
	/**
	 * @return the iHSLRORIMO
	 */
	public String getiHSLRORIMO() {
		return iHSLRORIMO;
	}
	/**
	 * @param iHSLRORIMO the iHSLRORIMO to set
	 */
	public void setiHSLRORIMO(String iHSLRORIMO) {
		this.iHSLRORIMO = iHSLRORIMO;
	}
	/**
	 * @return the shipsCategory
	 */
	public String getShipsCategory() {
		return shipsCategory;
	}
	/**
	 * @param shipsCategory the shipsCategory to set
	 */
	public void setShipsCategory(String shipsCategory) {
		this.shipsCategory = shipsCategory;
	}
	/**
	 * @return the nameString
	 */
	public String getNameString() {
		return nameString;
	}
	/**
	 * @param nameString the nameString to set
	 */
	public void setNameString(String nameString) {
		this.nameString = nameString;
	}
	/**
	 * @return the exshipsCategory
	 */
	public String getExshipsCategory() {
		return ExshipsCategory;
	}
	/**
	 * @param exshipsCategory the exshipsCategory to set
	 */
	public void setExshipsCategory(String exshipsCategory) {
		ExshipsCategory = exshipsCategory;
	}
	/**
	 * @return the exNameString
	 */
	public String getExNameString() {
		return ExNameString;
	}
	/**
	 * @param exNameString the exNameString to set
	 */
	public void setExNameString(String exNameString) {
		ExNameString = exNameString;
	}
	public String getCertClausesYn() {
		return certClausesYn;
	}
	public void setCertClausesYn(String certClausesYn) {
		this.certClausesYn = certClausesYn;
	}
	public String getPdfBankerAssuredStatus() {
		return pdfBankerAssuredStatus;
	}
	public void setPdfBankerAssuredStatus(String pdfBankerAssuredStatus) {
		this.pdfBankerAssuredStatus = pdfBankerAssuredStatus;
	}
	public String getPdfBankerStatus() {
		return pdfBankerStatus;
	}
	public void setPdfBankerStatus(String pdfBankerStatus) {
		this.pdfBankerStatus = pdfBankerStatus;
	}
	public String getPdfCurrencyStatus() {
		return pdfCurrencyStatus;
	}
	public void setPdfCurrencyStatus(String pdfCurrencyStatus) {
		this.pdfCurrencyStatus = pdfCurrencyStatus;
	}
	public String getPdfExcessStatus() {
		return pdfExcessStatus;
	}
	public void setPdfExcessStatus(String pdfExcessStatus) {
		this.pdfExcessStatus = pdfExcessStatus;
	}
	public String getPdfPremiumShowStatus() {
		return pdfPremiumShowStatus;
	}
	public void setPdfPremiumShowStatus(String pdfPremiumShowStatus) {
		this.pdfPremiumShowStatus = pdfPremiumShowStatus;
	}
	public String getPdfStampStatus() {
		return pdfStampStatus;
	}
	public void setPdfStampStatus(String pdfStampStatus) {
		this.pdfStampStatus = pdfStampStatus;
	}
	public double getTotalInsuredValue() {
		return totalInsuredValue;
	}
	public void setTotalInsuredValue(double totalInsuredValue) {
		this.totalInsuredValue = totalInsuredValue;
	}
	public double getEquivalentInsuredValue() {
		return equivalentInsuredValue;
	}
	public void setEquivalentInsuredValue(double equivalentInsuredValue) {
		this.equivalentInsuredValue = equivalentInsuredValue;
	}
	
}
