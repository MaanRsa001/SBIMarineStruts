package com.maan.quotation.model;

import java.util.List;

import com.google.gson.annotations.SerializedName;

public class PremiumUpdateModel {
	
	    @SerializedName("AdminRemarks") 
	    private String adminRemarks;
	    @SerializedName("ApplicationNo") 
	    private String applicationNo;
	    @SerializedName("BasisValDesc") 
	    private String basisValDesc;
	    @SerializedName("Both") 
	    private String both;
	    @SerializedName("BranchCode") 
	    private String branchCode;
	    @SerializedName("CertClausesYn") 
	    private String certClausesYn;
	    @SerializedName("Commission") 
	    private String commission;
	    @SerializedName("CommissionYn") 
	    private String commissionYn;
	    @SerializedName("CommodityDetails") 
	    public List<CommodityDetail> commodityDetails;
	    @SerializedName("CustomerCode") 
	    private String customerCode;
	    @SerializedName("EditClausesYN") 
	    private String editClausesYN;
	    @SerializedName("FinalizeYN") 
	    private String finalizeYN;
	    @SerializedName("Foreign") 
	    private String foreign;
	    @SerializedName("GeneratePolicyYn") 
	    private String generatePolicyYn;
	    @SerializedName("InceptionDate") 
	    private String inceptionDate;
	    @SerializedName("Issuer") 
	    private String issuer;
	    @SerializedName("LcBankDetail") 
	    private String lcBankDetail;
	    @SerializedName("LoginId") 
	    private String loginId;
	    @SerializedName("LoginUserType") 
	    private String loginUserType;
	    @SerializedName("ModeOfPayment") 
	    private String modeOfPayment;
	    @SerializedName("NoteType") 
	    private String noteType;
	    @SerializedName("OpenCoverNo") 
	    private String openCoverNo;
	    @SerializedName("PolicyFee") 
	    private String policyFee;
	    @SerializedName("PolicyFeeYn") 
	    private String policyFeeYn;
	    @SerializedName("PremiumDetails") 
	    private PremiumDetails premiumDetails;
	    @SerializedName("PremiumYN") 
	    private String premiumYN;
	    @SerializedName("PrerecieptNo") 
	    private String prerecieptNo;
	    @SerializedName("PrintClausesYn") 
	    private String printClausesYn;
	    @SerializedName("ProductId") 
	    private String productId;
	    @SerializedName("QuoteNo") 
	    private String quoteNo;
	    @SerializedName("QuoteStatus") 
	    private String quoteStatus;
	    @SerializedName("QuoteType") 
	    private String quoteType;
	    @SerializedName("ReferenceNo") 
	    private String referenceNo;
	    @SerializedName("ReferralRemarks") 
	    private String referralRemarks;
	    @SerializedName("ReferralStatus") 
	    private String referralStatus;
	    @SerializedName("ReferralUpdateYn") 
	    private String referralUpdateYn;
	    @SerializedName("Remarks") 
	    private String remarks;
	    @SerializedName("RubberStamp") 
	    private String rubberStamp;
	    @SerializedName("SettlingAgent") 
	    private String settlingAgent;
	    @SerializedName("ShowPremiumYn") 
	    private String showPremiumYn;
	    @SerializedName("Status") 
	    private String status;
	    @SerializedName("SubjectivityName") 
	    private String subjectivityName;
	    @SerializedName("SubjectivityYn")
	    private String subjectivityYn;
	    
	    
		public String getAdminRemarks() {
			return adminRemarks;
		}
		public void setAdminRemarks(String adminRemarks) {
			this.adminRemarks = adminRemarks;
		}
		public String getBasisValDesc() {
			return basisValDesc;
		}
		public void setBasisValDesc(String basisValDesc) {
			this.basisValDesc = basisValDesc;
		}
		public String getBoth() {
			return both;
		}
		public void setBoth(String both) {
			this.both = both;
		}
		public String getBranchCode() {
			return branchCode;
		}
		public void setBranchCode(String branchCode) {
			this.branchCode = branchCode;
		}
		public String getCertClausesYn() {
			return certClausesYn;
		}
		public void setCertClausesYn(String certClausesYn) {
			this.certClausesYn = certClausesYn;
		}
		public String getCommission() {
			return commission;
		}
		public void setCommission(String commission) {
			this.commission = commission;
		}
		public String getCommissionYn() {
			return commissionYn;
		}
		public void setCommissionYn(String commissionYn) {
			this.commissionYn = commissionYn;
		}
		public List<CommodityDetail> getCommodityDetails() {
			return commodityDetails;
		}
		public void setCommodityDetails(List<CommodityDetail> commodityDetails) {
			this.commodityDetails = commodityDetails;
		}
		public String getCustomerCode() {
			return customerCode;
		}
		public void setCustomerCode(String customerCode) {
			this.customerCode = customerCode;
		}
		public String getEditClausesYN() {
			return editClausesYN;
		}
		public void setEditClausesYN(String editClausesYN) {
			this.editClausesYN = editClausesYN;
		}
		public String getFinalizeYN() {
			return finalizeYN;
		}
		public void setFinalizeYN(String finalizeYN) {
			this.finalizeYN = finalizeYN;
		}
		public String getForeign() {
			return foreign;
		}
		public void setForeign(String foreign) {
			this.foreign = foreign;
		}
		public String getGeneratePolicyYn() {
			return generatePolicyYn;
		}
		public void setGeneratePolicyYn(String generatePolicyYn) {
			this.generatePolicyYn = generatePolicyYn;
		}
		public String getInceptionDate() {
			return inceptionDate;
		}
		public void setInceptionDate(String inceptionDate) {
			this.inceptionDate = inceptionDate;
		}
		public String getIssuer() {
			return issuer;
		}
		public void setIssuer(String issuer) {
			this.issuer = issuer;
		}
		public String getLcBankDetail() {
			return lcBankDetail;
		}
		public void setLcBankDetail(String lcBankDetail) {
			this.lcBankDetail = lcBankDetail;
		}
		public String getLoginId() {
			return loginId;
		}
		public void setLoginId(String loginId) {
			this.loginId = loginId;
		}
		public String getLoginUserType() {
			return loginUserType;
		}
		public void setLoginUserType(String loginUserType) {
			this.loginUserType = loginUserType;
		}
		public String getModeOfPayment() {
			return modeOfPayment;
		}
		public void setModeOfPayment(String modeOfPayment) {
			this.modeOfPayment = modeOfPayment;
		}
		public String getNoteType() {
			return noteType;
		}
		public void setNoteType(String noteType) {
			this.noteType = noteType;
		}
		public String getOpenCoverNo() {
			return openCoverNo;
		}
		public void setOpenCoverNo(String openCoverNo) {
			this.openCoverNo = openCoverNo;
		}
		public String getPolicyFee() {
			return policyFee;
		}
		public void setPolicyFee(String policyFee) {
			this.policyFee = policyFee;
		}
		public String getPolicyFeeYn() {
			return policyFeeYn;
		}
		public void setPolicyFeeYn(String policyFeeYn) {
			this.policyFeeYn = policyFeeYn;
		}
		public PremiumDetails getPremiumDetails() {
			return premiumDetails;
		}
		public void setPremiumDetails(PremiumDetails premiumDetails) {
			this.premiumDetails = premiumDetails;
		}
		public String getPremiumYN() {
			return premiumYN;
		}
		public void setPremiumYN(String premiumYN) {
			this.premiumYN = premiumYN;
		}
		public String getPrerecieptNo() {
			return prerecieptNo;
		}
		public void setPrerecieptNo(String prerecieptNo) {
			this.prerecieptNo = prerecieptNo;
		}
		public String getPrintClausesYn() {
			return printClausesYn;
		}
		public void setPrintClausesYn(String printClausesYn) {
			this.printClausesYn = printClausesYn;
		}
		public String getProductId() {
			return productId;
		}
		public void setProductId(String productId) {
			this.productId = productId;
		}
		public String getQuoteNo() {
			return quoteNo;
		}
		public void setQuoteNo(String quoteNo) {
			this.quoteNo = quoteNo;
		}
		public String getQuoteStatus() {
			return quoteStatus;
		}
		public void setQuoteStatus(String quoteStatus) {
			this.quoteStatus = quoteStatus;
		}
		public String getQuoteType() {
			return quoteType;
		}
		public void setQuoteType(String quoteType) {
			this.quoteType = quoteType;
		}
		public String getReferenceNo() {
			return referenceNo;
		}
		public void setReferenceNo(String referenceNo) {
			this.referenceNo = referenceNo;
		}
		public String getReferralRemarks() {
			return referralRemarks;
		}
		public void setReferralRemarks(String referralRemarks) {
			this.referralRemarks = referralRemarks;
		}
		public String getReferralStatus() {
			return referralStatus;
		}
		public void setReferralStatus(String referralStatus) {
			this.referralStatus = referralStatus;
		}
		public String getReferralUpdateYn() {
			return referralUpdateYn;
		}
		public void setReferralUpdateYn(String referralUpdateYn) {
			this.referralUpdateYn = referralUpdateYn;
		}
		public String getRemarks() {
			return remarks;
		}
		public void setRemarks(String remarks) {
			this.remarks = remarks;
		}
		public String getRubberStamp() {
			return rubberStamp;
		}
		public void setRubberStamp(String rubberStamp) {
			this.rubberStamp = rubberStamp;
		}
		public String getSettlingAgent() {
			return settlingAgent;
		}
		public void setSettlingAgent(String settlingAgent) {
			this.settlingAgent = settlingAgent;
		}
		public String getShowPremiumYn() {
			return showPremiumYn;
		}
		public void setShowPremiumYn(String showPremiumYn) {
			this.showPremiumYn = showPremiumYn;
		}
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}
		public String getSubjectivityName() {
			return subjectivityName;
		}
		public void setSubjectivityName(String subjectivityName) {
			this.subjectivityName = subjectivityName;
		}
		public String getSubjectivityYn() {
			return subjectivityYn;
		}
		public void setSubjectivityYn(String subjectivityYn) {
			this.subjectivityYn = subjectivityYn;
		}
		public String getApplicationNo() {
			return applicationNo;
		}
		public void setApplicationNo(String applicationNo) {
			this.applicationNo = applicationNo;
		}

}
