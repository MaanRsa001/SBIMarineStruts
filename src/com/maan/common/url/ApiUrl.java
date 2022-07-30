package com.maan.common.url;

import java.util.ResourceBundle;

public class ApiUrl {
	
	private ApiUrl() {
	}

	private static ApiUrl instance;
	
	public static ApiUrl getInstance() {
		if(instance ==null) {
			instance = new ApiUrl();
		}
		return instance;
	}
	
	private static String base;
	private static String quoteDropDown;
	private static String quoteSave;
	private static String quotePremiumCalc;
	private static String quoteConditionsView;
	private static String quoteConditionsNew;
	private static String quoteConditionsModify;
	private static String quoteConditionsAdd;
	private static String quoteEdit;
	private static String quotePremiumCalculate;
	private static String quotePremiumUpdate;
	private static String quotePolicyGenerate;
	private static String quotePremiumResponse;
	
	private static String policyEndtInfo;
	private static String openCoverInfo;
	
	private static String endorsementCategoryWithList;
	private static String saveEndorsement;
	private static String endorsementPremiumDetails;
	private static String endorsementCheck;
	private static String financialCheck;
	private static String financialEndorsementCheck;
	private static String endorsementSelectedDesc;
	private static String shipDetailResponse;
	private static String brokerInfoResponse;
	private static String customerInfoResponse;
	private static String ocCustomerInfoResponse;
	private static String customerNationalIdResponse;
	private static String customerEmpIdResponse;
	private static String customerMobileNoResponse;
	private static String customerVatRegNoResponse;
	private static String customerNoResponse;
	private static String warsrcResponse;
	private static boolean certDrpDwnCache;
	
	private static String policyGeneration;
	private static String declCertificateList;
	private static String declTransactionList;
	private static String declMenuList;
	private static String uploadTransactionList;
	private static String vehicleOpCoverDetail;
	private static String transactionDetails;
	private static String unapprovedtransactionDetails;
	private static String haulierDetails;
	private static String vehicleDeleteTransaction;
	private static String vehicleActiveTransaction;
	private static String vehicleSearchByTranId;
	private static String vehicleSearchByAssetNo;
	private static String vehicleSearchByPlateNo;
	private static String vehicleSearchByChaseNo;
	private static String uploadedList;
	private static String errorList;
	private static String processRecords;
	private static String declarationQuote;
	private static String declarationQuoteList;
	private static String transactionList;
	private static String processVehicleRecords;
	private static String marineveicleDetails;
	private static String marineveicleDetailsInactive;
	private static String marineveicleDetailsdelete;
	private static String premiumDetail; 
	private static String vehiclepolicygen; 
	private static String deleteVehicle;
	private static String vesselSearch;
	private static String policyintegrateapi; 
	private static String finalizecheck;
	static {
		try {
			String baseurl = getValue("api.base.url");
			setBase(baseurl);
			setQuoteDropDown(baseurl+getValue("quotation.dropdown.url"));
			setQuoteSave(baseurl+getValue("quotation.save.url"));
			setQuotePremiumCalc(baseurl+getValue("quotation.premiumCalc.url"));
			setQuoteConditionsView(baseurl+getValue("quotation.conditions.view.url"));
			setQuoteConditionsNew(baseurl+getValue("quotation.conditions.new.url"));
			setQuoteConditionsModify(baseurl+getValue("quotation.conditions.modify.url"));
			setQuoteConditionsAdd(baseurl+getValue("quotation.conditions.add.url"));
			setQuoteEdit(baseurl+getValue("quotation.edit.url"));
			setQuotePremiumCalculate(baseurl+getValue("quotation.premium.calculate.url"));
			setQuotePremiumUpdate(baseurl+getValue("quotation.premium.update.url"));
			setQuotePolicyGenerate(baseurl+getValue("quotation.policy.generate.url"));
			setQuotePremiumResponse(baseurl+getValue("quotation.premium.response.url"));
			
			setPolicyEndtInfo(baseurl+getValue("quotation.policy.endt.info"));
			setOpenCoverInfo(baseurl+getValue("quotation.opencover.info"));
			
			setEndorsementCategoryWithList(baseurl+getValue("endorsement.category.list.url"));
			setSaveEndorsement(baseurl+getValue("endorsement.save.url"));
			setEndorsementPremiumDetails(baseurl+getValue("endorsement.premium.details.url"));
			setEndorsementCheck(baseurl+getValue("endorsement.check.url"));
			setFinancialCheck(baseurl+getValue("financial.check.url"));
			setFinancialEndorsementCheck(baseurl+getValue("financial.endorsement.check.url"));
			setEndorsementSelectedDesc(baseurl+getValue("endorsement.selected.desc.url"));
			setShipDetailResponse(baseurl+getValue("ship.deatil.url"));
			setBrokerInfoResponse(baseurl+getValue("broker.branch.info.url"));
			setCustomerInfoResponse(baseurl+getValue("customer.selection.url"));
			setOcCustomerInfoResponse(baseurl+getValue("oc.customer.info.url"));
			setCertDrpDwnCache("Yes".equalsIgnoreCase(getValue("quotation.dropdown.cache")));
			setCustomerNationalIdResponse(baseurl+getValue("customer.info.nationalid.url"));
			setCustomerEmpIdResponse(baseurl+getValue("customer.info.empid.url"));
			setCustomerMobileNoResponse(baseurl+getValue("customer.info.mobileno.url"));
			setCustomerVatRegNoResponse(baseurl+getValue("customer.info.vatregno.url"));
			setCustomerNoResponse(baseurl+getValue("customer.info.customerNo.url"));
			setWarsrcResponse(baseurl+getValue("open.cover.warsrc.url"));
			setPolicyGeneration(baseurl+getValue("declaration.policy.generation"));
			setDeclCertificateList(baseurl+getValue("declaration.certficate.list"));
			setDeclTransactionList(baseurl+getValue("declaration.transaction.list"));
			setDeclMenuList(baseurl+getValue("declaration.menu.list"));
			setUploadTransactionList(baseurl+getValue("upload.transaction.list"));

			setVehicleOpCoverDetail(baseurl+getValue("vehicle.opencover.detail"));
			setTransactionDetails(baseurl+getValue("vehicle.transaction.detail"));
			setHaulierDetails(baseurl+getValue("vehicle.haulier.detail"));
			

			

			setUploadedList(baseurl+getValue("declaration.uploaded.list"));
			setErrorList(baseurl+getValue("declaration.error.list"));
			setProcessRecords(baseurl+getValue("process.uploaded.record"));
			setDeclarationQuote(baseurl+getValue("declaration.quote.record"));
			setDeclarationQuoteList(baseurl+getValue("declaration.quote.list"));

			setVehicleDeleteTransaction(baseurl+getValue("vehicle.delete.details"));
			setVehicleActiveTransaction(baseurl+getValue("vehicle.active.details"));
			setVehicleSearchByAssetNo(baseurl+getValue("vehicle.searchBy.asset"));
			setVehicleSearchByTranId(baseurl+getValue("vehicle.searchBy.tranid"));
			setVehicleSearchByPlateNo(baseurl+getValue("vehicle.searchBy.plate"));
			setVehicleSearchByChaseNo(baseurl+getValue("vehicle.searchBy.chase"));
			setTransactionList(baseurl+getValue("vehicle.transaction.list"));
			setProcessVehicleRecords(baseurl+getValue("process.vehicle.record"));
			setMarineveicleDetails(baseurl+getValue("marine.vehicle.detail.active"));
			setMarineveicleDetailsInactive(baseurl+getValue("marine.vehicle.detail.inactive"));
			setUnapprovedtransactionDetails(baseurl+getValue("vehicle.unapproved.transaction.detail"));
			setPremiumDetail(baseurl+getValue("vehicle.premium.detail"));
			setVehiclepolicygen(baseurl+getValue("vehicle.policy.generate"));
			setDeleteVehicle(baseurl+getValue("delete.vehicle.info"));
			setMarineveicleDetailsdelete(baseurl+getValue("marine.vehicle.detail.delete"));
			setVesselSearch(baseurl+getValue("marine.vessel.search"));
			setPolicyintegrateapi(getValue("quotation.policy.integrate.url"));
			setFinalizecheck(baseurl+getValue("finalize.check.url"));
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static String getPolicyintegrateapi() {
		return policyintegrateapi;
	}

	public static void setPolicyintegrateapi(String policyintegrateapi) {
		ApiUrl.policyintegrateapi = policyintegrateapi;
	}

	public static String getVesselSearch() {
		return vesselSearch;
	}

	public static void setVesselSearch(String vesselSearch) {
		ApiUrl.vesselSearch = vesselSearch;
	}

	public static String getMarineveicleDetailsdelete() {
		return marineveicleDetailsdelete;
	}

	public static void setMarineveicleDetailsdelete(String marineveicleDetailsdelete) {
		ApiUrl.marineveicleDetailsdelete = marineveicleDetailsdelete;
	}

	public static String getDeleteVehicle() {
		return deleteVehicle;
	}

	public static void setDeleteVehicle(String deleteVehicle) {
		ApiUrl.deleteVehicle = deleteVehicle;
	}

	public static String getVehiclepolicygen() {
		return vehiclepolicygen;
	}

	public static void setVehiclepolicygen(String vehiclepolicygen) {
		ApiUrl.vehiclepolicygen = vehiclepolicygen;
	}

	public static String getPremiumDetail() {
		return premiumDetail;
	}

	public static void setPremiumDetail(String premiumDetail) {
		ApiUrl.premiumDetail = premiumDetail;
	}

	public static String getUnapprovedtransactionDetails() {
		return unapprovedtransactionDetails;
	}

	public static void setUnapprovedtransactionDetails(String unapprovedtransactionDetails) {
		ApiUrl.unapprovedtransactionDetails = unapprovedtransactionDetails;
	}

	public static String getMarineveicleDetailsInactive() {
		return marineveicleDetailsInactive;
	}

	public static void setMarineveicleDetailsInactive(String marineveicleDetailsInactive) {
		ApiUrl.marineveicleDetailsInactive = marineveicleDetailsInactive;
	}

	public static String getMarineveicleDetails() {
		return marineveicleDetails;
	}

	public static void setMarineveicleDetails(String marineveicleDetails) {
		ApiUrl.marineveicleDetails = marineveicleDetails;
	}

	public static String getProcessVehicleRecords() {
		return processVehicleRecords;
	}

	public static void setProcessVehicleRecords(String processVehicleRecords) {
		ApiUrl.processVehicleRecords = processVehicleRecords;
	}

	public static String getTransactionList() {
		return transactionList;
	}

	public static void setTransactionList(String transactionList) {
		ApiUrl.transactionList = transactionList;
	}

	public static String getVehicleActiveTransaction() {
		return vehicleActiveTransaction;
	}

	public static void setVehicleActiveTransaction(String vehicleActiveTransaction) {
		ApiUrl.vehicleActiveTransaction = vehicleActiveTransaction;
	}

	public static String getDeclarationQuoteList() {
		return declarationQuoteList;
	}

	public static void setDeclarationQuoteList(String declarationQuoteList) {
		ApiUrl.declarationQuoteList = declarationQuoteList;
	}

	public static String getDeclarationQuote() {
		return declarationQuote;
	}

	public static void setDeclarationQuote(String declarationQuote) {
		ApiUrl.declarationQuote = declarationQuote;
	}

	public static String getProcessRecords() {
		return processRecords;
	}

	public static void setProcessRecords(String processRecords) {
		ApiUrl.processRecords = processRecords;
	}

	public static String getUploadedList() {
		return uploadedList;
	}

	public static void setUploadedList(String uploadedList) {
		ApiUrl.uploadedList = uploadedList;
	}

	public static String getErrorList() {
		return errorList;
	}

	public static void setErrorList(String errorList) {
		ApiUrl.errorList = errorList;
	}

	public static String getDeclTransactionList() {
		return declTransactionList;
	}

	public static void setDeclTransactionList(String declTransactionList) {
		ApiUrl.declTransactionList = declTransactionList;
	}

	private static String getValue(String str) {
		try {
			return ResourceBundle.getBundle("webservice").getString(str);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	/**
	 * @return the quoteDropDown
	 */
	public static String getQuoteDropDown() {
		return quoteDropDown;
	}

	/**
	 * @param quoteDropDown the quoteDropDown to set
	 */
	public static void setQuoteDropDown(String quoteDropDown) {
		ApiUrl.quoteDropDown = quoteDropDown;
	}

	/**
	 * @return the base
	 */
	public static String getBase() {
		return base;
	}

	/**
	 * @param base the base to set
	 */
	public static void setBase(String base) {
		ApiUrl.base = base;
	}

	/**
	 * @return the quoteSave
	 */
	public static String getQuoteSave() {
		return quoteSave;
	}

	/**
	 * @param quoteSave the quoteSave to set
	 */
	public static void setQuoteSave(String quoteSave) {
		ApiUrl.quoteSave = quoteSave;
	}

	/**
	 * @return the quotePremiumCalc
	 */
	public static String getQuotePremiumCalc() {
		return quotePremiumCalc;
	}

	/**
	 * @param quotePremiumCalc the quotePremiumCalc to set
	 */
	public static void setQuotePremiumCalc(String quotePremiumCalc) {
		ApiUrl.quotePremiumCalc = quotePremiumCalc;
	}

	/**
	 * @return the certDrpDwnCache
	 */
	public static boolean isCertDrpDwnCache() {
		return certDrpDwnCache;
	}

	/**
	 * @param certDrpDwnCache the certDrpDwnCache to set
	 */
	public static void setCertDrpDwnCache(boolean certDrpDwnCache) {
		ApiUrl.certDrpDwnCache = certDrpDwnCache;
	}

	/**
	 * @return the quoteEdit
	 */
	public static String getQuoteEdit() {
		return quoteEdit;
	}

	/**
	 * @param quoteEdit the quoteEdit to set
	 */
	public static void setQuoteEdit(String quoteEdit) {
		ApiUrl.quoteEdit = quoteEdit;
	}

	public static String getQuotePremiumUpdate() {
		return quotePremiumUpdate;
	}

	public static void setQuotePremiumUpdate(String quotePremiumUpdate) {
		ApiUrl.quotePremiumUpdate = quotePremiumUpdate;
	}

	public static String getQuotePolicyGenerate() {
		return quotePolicyGenerate;
	}

	public static void setQuotePolicyGenerate(String quotePolicyGenerate) {
		ApiUrl.quotePolicyGenerate = quotePolicyGenerate;
	}

	/**
	 * @return the quotePremiumResponse
	 */
	public static String getQuotePremiumResponse() {
		return quotePremiumResponse;
	}

	/**
	 * @param quotePremiumResponse the quotePremiumResponse to set
	 */
	public static void setQuotePremiumResponse(String quotePremiumResponse) {
		ApiUrl.quotePremiumResponse = quotePremiumResponse;
	}

	public static String getQuotePremiumCalculate() {
		return quotePremiumCalculate;
	}

	public static void setQuotePremiumCalculate(String quotePremiumCalculate) {
		ApiUrl.quotePremiumCalculate = quotePremiumCalculate;
	}

	public static String getQuoteConditionsView() {
		return quoteConditionsView;
	}

	public static void setQuoteConditionsView(String quoteConditionsView) {
		ApiUrl.quoteConditionsView = quoteConditionsView;
	}

	public static String getQuoteConditionsModify() {
		return quoteConditionsModify;
	}

	public static void setQuoteConditionsModify(String quoteConditionsModify) {
		ApiUrl.quoteConditionsModify = quoteConditionsModify;
	}

	public static String getQuoteConditionsAdd() {
		return quoteConditionsAdd;
	}

	public static void setQuoteConditionsAdd(String quoteConditionsAdd) {
		ApiUrl.quoteConditionsAdd = quoteConditionsAdd;
	}

	/**
	 * @return the quoteConditionsNew
	 */
	public static String getQuoteConditionsNew() {
		return quoteConditionsNew;
	}

	/**
	 * @param quoteConditionsNew the quoteConditionsNew to set
	 */
	public static void setQuoteConditionsNew(String quoteConditionsNew) {
		ApiUrl.quoteConditionsNew = quoteConditionsNew;
	}

	public static String getPolicyEndtInfo() {
		return policyEndtInfo;
	}

	public static void setPolicyEndtInfo(String policyEndtInfo) {
		ApiUrl.policyEndtInfo = policyEndtInfo;
	}

	public static String getOpenCoverInfo() {
		return openCoverInfo;
	}

	public static void setOpenCoverInfo(String openCoverInfo) {
		ApiUrl.openCoverInfo = openCoverInfo;
	}

	public static String getEndorsementCategoryWithList() {
		return endorsementCategoryWithList;
	}

	public static void setEndorsementCategoryWithList(String endorsementCategoryWithList) {
		ApiUrl.endorsementCategoryWithList = endorsementCategoryWithList;
	}

	/**
	 * @return the saveEndorsement
	 */
	public static String getSaveEndorsement() {
		return saveEndorsement;
	}

	/**
	 * @param saveEndorsement the saveEndorsement to set
	 */
	public static void setSaveEndorsement(String saveEndorsement) {
		ApiUrl.saveEndorsement = saveEndorsement;
	}

	public static String getEndorsementPremiumDetails() {
		return endorsementPremiumDetails;
	}

	public static void setEndorsementPremiumDetails(String endorsementPremiumDetails) {
		ApiUrl.endorsementPremiumDetails = endorsementPremiumDetails;
	}

	/**
	 * @return the endorsementCheck
	 */
	public static String getEndorsementCheck() {
		return endorsementCheck;
	}

	/**
	 * @param endorsementCheck the endorsementCheck to set
	 */
	public static void setEndorsementCheck(String endorsementCheck) {
		ApiUrl.endorsementCheck = endorsementCheck;
	}

	public static String getFinancialCheck() {
		return financialCheck;
	}

	public static void setFinancialCheck(String financialCheck) {
		ApiUrl.financialCheck = financialCheck;
	}

	public static String getFinancialEndorsementCheck() {
		return financialEndorsementCheck;
	}

	public static void setFinancialEndorsementCheck(String financialEndorsementCheck) {
		ApiUrl.financialEndorsementCheck = financialEndorsementCheck;
	}

	/**
	 * @return the endorsementSelectedDesc
	 */
	public static String getEndorsementSelectedDesc() {
		return endorsementSelectedDesc;
	}

	/**
	 * @param endorsementSelectedDesc the endorsementSelectedDesc to set
	 */
	public static void setEndorsementSelectedDesc(String endorsementSelectedDesc) {
		ApiUrl.endorsementSelectedDesc = endorsementSelectedDesc;
	}

	/**
	 * @return the shipDetailResponse
	 */
	public static String getShipDetailResponse() {
		return shipDetailResponse;
	}

	/**
	 * @param shipDetailResponse the shipDetailResponse to set
	 */
	public static void setShipDetailResponse(String shipDetailResponse) {
		ApiUrl.shipDetailResponse = shipDetailResponse;
	}

	public static String getBrokerInfoResponse() {
		return brokerInfoResponse;
	}

	public static void setBrokerInfoResponse(String brokerInfoResponse) {
		ApiUrl.brokerInfoResponse = brokerInfoResponse;
	}

	public static String getCustomerInfoResponse() {
		return customerInfoResponse;
	}

	public static void setCustomerInfoResponse(String customerInfoResponse) {
		ApiUrl.customerInfoResponse = customerInfoResponse;
	}

	public static String getOcCustomerInfoResponse() {
		return ocCustomerInfoResponse;
	}

	public static void setOcCustomerInfoResponse(String ocCustomerInfoResponse) {
		ApiUrl.ocCustomerInfoResponse = ocCustomerInfoResponse;
	}

	public static String getCustomerNationalIdResponse() {
		return customerNationalIdResponse;
	}

	public static void setCustomerNationalIdResponse(String customerNationalIdResponse) {
		ApiUrl.customerNationalIdResponse = customerNationalIdResponse;
	}

	public static String getCustomerEmpIdResponse() {
		return customerEmpIdResponse;
	}

	public static void setCustomerEmpIdResponse(String customerEmpIdResponse) {
		ApiUrl.customerEmpIdResponse = customerEmpIdResponse;
	}

	public static String getCustomerMobileNoResponse() {
		return customerMobileNoResponse;
	}

	public static void setCustomerMobileNoResponse(String customerMobileNoResponse) {
		ApiUrl.customerMobileNoResponse = customerMobileNoResponse;
	}

	public static String getCustomerVatRegNoResponse() {
		return customerVatRegNoResponse;
	}

	public static void setCustomerVatRegNoResponse(String customerVatRegNoResponse) {
		ApiUrl.customerVatRegNoResponse = customerVatRegNoResponse;
	}

	public static String getWarsrcResponse() {
		return warsrcResponse;
	}

	public static void setWarsrcResponse(String warsrcResponse) {
		ApiUrl.warsrcResponse = warsrcResponse;
	}

	public static String getPolicyGeneration() {
		return policyGeneration;
	}

	public static void setPolicyGeneration(String policyGeneration) {
		ApiUrl.policyGeneration = policyGeneration;
	}

	public static String getDeclCertificateList() {
		return declCertificateList;
	}

	public static void setDeclCertificateList(String declCertificateList) {
		ApiUrl.declCertificateList = declCertificateList;
	}

	public static String getDeclMenuList() {
		return declMenuList;
	}

	public static void setDeclMenuList(String declMenuList) {
		ApiUrl.declMenuList = declMenuList;
	}

	public static String getUploadTransactionList() {
		return uploadTransactionList;
	}

	public static void setUploadTransactionList(String uploadTransactionList) {
		ApiUrl.uploadTransactionList = uploadTransactionList;
	}

	public static String getVehicleOpCoverDetail() {
		return vehicleOpCoverDetail;
	}

	public static void setVehicleOpCoverDetail(String vehicleOpCoverDetail) {
		ApiUrl.vehicleOpCoverDetail = vehicleOpCoverDetail;
	}
	
	public static String getTransactionDetails() {
		return transactionDetails;
	}

	public static void setTransactionDetails(String transactionDetails) {
		ApiUrl.transactionDetails = transactionDetails;
	}

	public static String getHaulierDetails() {
		return haulierDetails;
	}

	public static void setHaulierDetails(String haulierDetails) {
		ApiUrl.haulierDetails = haulierDetails;
	}
	

	public static String getVehicleDeleteTransaction() {
		return vehicleDeleteTransaction;
	}

	public static void setVehicleDeleteTransaction(String vehicleDeleteTransaction) {
		ApiUrl.vehicleDeleteTransaction = vehicleDeleteTransaction;
	}

	public static String getVehicleSearchByTranId() {
		return vehicleSearchByTranId;
	}

	public static void setVehicleSearchByTranId(String vehicleSearchByTranId) {
		ApiUrl.vehicleSearchByTranId = vehicleSearchByTranId;
	}

	public static String getVehicleSearchByAssetNo() {
		return vehicleSearchByAssetNo;
	}

	public static void setVehicleSearchByAssetNo(String vehicleSearchByAssetNo) {
		ApiUrl.vehicleSearchByAssetNo = vehicleSearchByAssetNo;
	}

	public static String getVehicleSearchByPlateNo() {
		return vehicleSearchByPlateNo;
	}

	public static void setVehicleSearchByPlateNo(String vehicleSearchByPlateNo) {
		ApiUrl.vehicleSearchByPlateNo = vehicleSearchByPlateNo;
	}

	public static String getVehicleSearchByChaseNo() {
		return vehicleSearchByChaseNo;
	}

	public static void setVehicleSearchByChaseNo(String vehicleSearchByChaseNo) {
		ApiUrl.vehicleSearchByChaseNo = vehicleSearchByChaseNo;
	}

	public static String getFinalizecheck() {
		return finalizecheck;
	}

	public static void setFinalizecheck(String finalizecheck) {
		ApiUrl.finalizecheck = finalizecheck;
	}

	public static String getCustomerNoResponse() {
		return customerNoResponse;
	}

	public static void setCustomerNoResponse(String customerNoResponse) {
		ApiUrl.customerNoResponse = customerNoResponse;
	}

}
