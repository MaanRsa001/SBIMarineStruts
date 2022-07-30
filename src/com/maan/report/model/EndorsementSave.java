package com.maan.report.model;

import java.util.List;

import com.google.gson.annotations.SerializedName;
import com.maan.quotation.model.Errors;

public class EndorsementSave {
    	
    	@SerializedName("ApplicationId")
    	private String applicationId;
    	@SerializedName("CancelYN")
		private String cancelYN;
    	@SerializedName("LoginUserType")
		private String loginUserType;
    	@SerializedName("PolicyNo")
		private String policyNo;
    	@SerializedName("QuoteNo")
		private String quoteNo;
    	@SerializedName("ReferenceNo")
		private String referenceNo;

		public String getApplicationId() {
			return applicationId;
		}

		public void setApplicationId(String applicationId) {
			this.applicationId = applicationId;
		}

		public String getCancelYN() {
			return cancelYN;
		}

		public void setCancelYN(String cancelYN) {
			this.cancelYN = cancelYN;
		}

		public String getLoginUserType() {
			return loginUserType;
		}

		public void setLoginUserType(String loginUserType) {
			this.loginUserType = loginUserType;
		}

		public String getPolicyNo() {
			return policyNo;
		}

		public void setPolicyNo(String policyNo) {
			this.policyNo = policyNo;
		}

		public String getQuoteNo() {
			return quoteNo;
		}

		public void setQuoteNo(String quoteNo) {
			this.quoteNo = quoteNo;
		}

		public String getReferenceNo() {
			return referenceNo;
		}

		public void setReferenceNo(String referenceNo) {
			this.referenceNo = referenceNo;
		}



}
