package com.maan.NewOpenCover.Api;

import java.util.Map;
import java.util.concurrent.Callable;

import org.apache.logging.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import com.maan.NewOpenCover.OpenCoverBean;
import com.maan.common.LogUtil;
import com.maan.common.ApiConfig.ApiConfig;
import com.opensymphony.xwork2.ActionContext;


public class ApiForQuotationinfo extends ApiConfig implements Callable<Object>{
	Map<String, Object> session=ActionContext.getContext().getSession();
	final static Logger logger = LogUtil.getLogger(ApiForQuotationinfo.class);
	private OpenCoverBean bean;
	private String requestfor;
	public ApiForQuotationinfo(OpenCoverBean bean,String requestfor) {
		this.bean=bean;
		this.requestfor=requestfor.toLowerCase();
	}
	
	@Override
	public Object call() throws Exception {
		return null;
	}
	@SuppressWarnings("unchecked")
	public String insertQuoteInfoApi() {
		JSONObject json = null;
		JSONObject jo = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		String result="";
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			
			hp.put("ProposalNo", bean.getProposalNo());
			hp.put("ProductId", "11");
			hp.put("BrokerId", bean.getBrokerId());
			hp.put("InsuredName", bean.getCustomerName());
			hp.put("CustomerId", bean.getCustomerId());
			hp.put("LoginBranchCode", bean.getBranchCode());
			hp.put("CrossVoyage", bean.getCrossVoyage());
			hp.put("EstimateAmount", bean.getEstimateAmount());
			hp.put("SumInsuredLmit", bean.getSILimit());
			hp.put("BackDays", bean.getBackDays());
			hp.put("Commission", bean.getCommission());
			hp.put("FreeText", bean.getFreeText());
			hp.put("NoOfCompany", bean.getNo_ofCompany());
			hp.put("RsaValue", bean.getRsaValue());

			hp.put("Type", bean.getType());
			hp.put("MissippiCode", bean.getMissippiCode());
			hp.put("BusinessType", bean.getBusinessType());
			hp.put("MissippiOpenPolicyId", bean.getMissisippiOpenPolicyId());
			hp.put("W&Src", bean.getwAndSrc());
			hp.put("MinPremium", bean.getExpMiniPremium());
			hp.put("PolicyStartDate", bean.getOpencoverstartdate());
			hp.put("PolicyEndDate", bean.getOpencoverenddate());
			hp.put("CountryRemarks", bean.getCountryRemarks());
			hp.put("Currency", bean.getCurrency());
			hp.put("ExchangeRate", bean.getExchangeRate());

			hp.put("IssuanceFee", bean.getIssuanceFee());
			hp.put("MinPremiumIssuance", bean.getMinPremiumIssuance());
			hp.put("ForeignTurnOver", bean.getForeignTurnOver());
			hp.put("MinPreMulType", bean.getMinPreMulType());
			hp.put("MinPreMul", bean.getMinPreMul());
			hp.put("LossDetail", bean.getLossDetail());
			hp.put("ClaimRatio", bean.getClaimRatio());
			hp.put("AdditionalInfo", bean.getAdditionalInfo());
			hp.put("ProposalStatus", bean.getProposalStatus());
			hp.put("ConfirmStatus", bean.getConfirmStatus());
			hp.put("LoginId", bean.getBrokerId());
			hp.put("DefaultClauses", bean.getDefaultClauses());
			hp.put("ExecutiveId", bean.getExecutiveId());
			hp.put("DebitType", bean.getDebitType());
			hp.put("UtilizedAmount", bean.getUtilizedAmount());

			hp.put("DecType", bean.getDecType());
			hp.put("NoOfVehicles", bean.getNoOfvehicles());
			hp.put("HaulierPremium", bean.getHaulierPremium());
			hp.put("Remarks", bean.getRemarks());
			hp.put("PaymentRemarks", bean.getPaymentRemarks());
			hp.put("VatTaxPercent", bean.getVatTaxPrecent());
			hp.put("CertPremiumYN", bean.getCertPremiumYN());
			hp.put("MarginYN", bean.getMarginYN());

			hp.put("MarginPercent", bean.getMarginPercent());
			hp.put("Warland", bean.getWarLand());
			hp.put("FacYN", bean.getFacYN());
			hp.put("CertNo", bean.getCertNo());
			hp.put("UserType", bean.getUserType());
			hp.put("PolicyNo", bean.getPolicyNo());
			hp.put("RefNo", bean.getRenNo());
			hp.put("EndorsementFee", bean.getEndorsementFee());
			hp.put("VoyageValue", bean.getVoyageValue());
			hp.put("W&Srcc", bean.getWarYN());
			hp.put("HaulierType", bean.getHaulierType());
			hp.put("EffectiveDate", bean.getEffectiveDate());
			hp.put("CountryRemarks", bean.getTxtarCryRemarkes());
			hp.put("MarginYN", bean.getMarginYN());
			hp.put("MarginPercent", bean.getMarginPercent());
			hp.put("Warland", bean.getWarLand());
			hp.put("FacYN", bean.getFacYN());
			hp.put("PolicyFee", bean.getPolicyFee());
			
			hp.put("UnderWriterId", bean.getUnderWriterId());
			hp.put("CoBrokerYN", bean.getCobrokingYn());
			hp.put("NoOfCobroker", bean.getNoofCobroking());
			hp.put("CobrokerHunYN", bean.getCobrokinghunYN());
			hp.put("PolicyType", bean.getPolicyType());
			hp.put("RateModifyYN", bean.getRateModifyYN());
			hp.put("Ratingtype", bean.getRatingType());
			hp.put("ExposureValue", bean.getExposureValue());
			hp.put("ImportYN", bean.getImportYn());
			hp.put("LoadDiscountYN", bean.getLoaddiscountYN());
			hp.put("LoadingPercent", bean.getLoadingPercent());
			hp.put("DiscountPercent", bean.getDiscountPercent());
			hp.put("ServiceTaxYN", bean.getServiceTaxYN());
			hp.put("ConsolidateYN", bean.getConsolidateGstYN());
			hp.put("GlobalStatus", bean.getGlobalPolicy());
			hp.put("GlobalType", bean.getGlobalBusiness());
			hp.put("FacShare", bean.getFacshare());
			hp.put("InwardFacYn", bean.getInwardfacYN());
			
			
			
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				
				jo = (JSONObject) json.get("Result");
				bean.setErrors((JSONArray) jo.get("ErrorMessage"));
				result = jo.get("Status") == null ? "" : jo.get("Status").toString();
				bean.setProposalNo(jo.get("ProposalNo") == null ? "" : jo.get("ProposalNo").toString());
			} 
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
		
	}
	@SuppressWarnings("unchecked")
	public void getQuoteInformation() {
		JSONObject json = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			
			hp.put("ProposalNo", bean.getProposalNo());
			
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				
				JSONObject quoteinfo = (JSONObject) json.get("Result");
				bean.setBusinessType(quoteinfo.get("BusinessType")==null?"":quoteinfo.get("BusinessType").toString());
				bean.setType(quoteinfo.get("Type")==null?"":quoteinfo.get("Type").toString());
				bean.setExecutiveId(quoteinfo.get("ExecutiveId")==null?"":quoteinfo.get("ExecutiveId").toString());
				bean.setCustomerName(quoteinfo.get("InsuredName")==null?"":quoteinfo.get("InsuredName").toString());
				bean.setCustomerId(quoteinfo.get("CustomerId")==null?"":quoteinfo.get("CustomerId").toString());
				bean.setDebitType(quoteinfo.get("DebitType")==null?"":quoteinfo.get("DebitType").toString());
				bean.setOpencoverstartdate(quoteinfo.get("PolicyStartDate")==null?"":quoteinfo.get("PolicyStartDate").toString());
				bean.setOpencoverenddate(quoteinfo.get("PolicyEndDate")==null?"":quoteinfo.get("PolicyEndDate").toString());
				bean.setEstimateAmount(quoteinfo.get("EstimateAmount")==null?"":quoteinfo.get("EstimateAmount").toString());
				bean.setUtilizedAmount(quoteinfo.get("UtilizedAmount")==null?"":quoteinfo.get("UtilizedAmount").toString());
				bean.setCurrency(quoteinfo.get("Currency")==null?"":quoteinfo.get("Currency").toString());
				bean.setExchangeRate(quoteinfo.get("ExchangeRate")==null?"":quoteinfo.get("ExchangeRate").toString());
				bean.setCrossVoyage(quoteinfo.get("CrossVoyage")==null?"":quoteinfo.get("CrossVoyage").toString());
				bean.setVoyageValue(quoteinfo.get("VoyageValue")==null?"":quoteinfo.get("VoyageValue").toString());
				bean.setFreeText(quoteinfo.get("FreeText")==null?"":quoteinfo.get("FreeText").toString());
				bean.setCommission(quoteinfo.get("Commission")==null?"":quoteinfo.get("Commission").toString());
				bean.setExpMiniPremium(quoteinfo.get("MinPremium")==null?"":quoteinfo.get("MinPremium").toString());
				bean.setIssuanceFee(quoteinfo.get("IssuanceFee")==null?"":quoteinfo.get("IssuanceFee").toString());
				bean.setBackDays(quoteinfo.get("BackDays")==null?"":quoteinfo.get("BackDays").toString());
				bean.setDefaultClauses(quoteinfo.get("DefaultClauses")==null?"":quoteinfo.get("DefaultClauses").toString());
				bean.setDecType(quoteinfo.get("DecType")==null?"":quoteinfo.get("DecType").toString());
				bean.setCertNo(quoteinfo.get("CertNo")==null?"":quoteinfo.get("CertNo").toString());
				bean.setHaulierType(quoteinfo.get("HaulierType")==null?"":quoteinfo.get("HaulierType").toString());
				bean.setVatTaxPrecent(quoteinfo.get("VatTaxPercent")==null?"":quoteinfo.get("VatTaxPercent").toString());
				bean.setMinPremiumIssuance(quoteinfo.get("MinPremiumIssuance")==null?"":quoteinfo.get("MinPremiumIssuance").toString());
				bean.setPolicyNo(quoteinfo.get("PolicyNo")==null?"":quoteinfo.get("PolicyNo").toString());
				bean.setRenNo(quoteinfo.get("RefNo")==null?"":quoteinfo.get("RefNo").toString());
				bean.setEndorsementFee(quoteinfo.get("EndorsementFee")==null?"":quoteinfo.get("EndorsementFee").toString());
				bean.setWarYN(quoteinfo.get("W&Srcc")==null?"":quoteinfo.get("W&Srcc").toString());
				bean.setEffectiveDate(quoteinfo.get("EffectiveDate")==null?"":quoteinfo.get("EffectiveDate").toString());
				bean.setTxtarCryRemarkes(quoteinfo.get("CountryRemarks")==null?"":quoteinfo.get("CountryRemarks").toString());
				bean.setMarginYN(quoteinfo.get("MarginYN")==null?"":quoteinfo.get("MarginYN").toString());
				bean.setMarginPercent(quoteinfo.get("MarginPercent")==null?"":quoteinfo.get("MarginPercent").toString());
				bean.setWarLand(quoteinfo.get("Warland")==null?"":quoteinfo.get("Warland").toString());
				bean.setFacYN(quoteinfo.get("FacYN")==null?"":quoteinfo.get("FacYN").toString());
				bean.setMissippiCode(quoteinfo.get("MissippiCode")==null?"":quoteinfo.get("MissippiCode").toString());
				bean.setBrokerId(quoteinfo.get("BrokerId")==null?"":quoteinfo.get("BrokerId").toString());
				bean.setPolicyFee(quoteinfo.get("PolicyFee")==null?"":quoteinfo.get("PolicyFee").toString());
				 
				bean.setUnderWriterId(quoteinfo.get("UnderWriterId")==null?"":quoteinfo.get("UnderWriterId").toString());
				bean.setCobrokingYn(quoteinfo.get("CoBrokerYN")==null?"":quoteinfo.get("CoBrokerYN").toString());
				bean.setNoofCobroking(quoteinfo.get("NoOfCobroker")==null?"":quoteinfo.get("NoOfCobroker").toString());
				bean.setCobrokinghunYN(quoteinfo.get("CobrokerHunYN")==null?"":quoteinfo.get("CobrokerHunYN").toString());
				bean.setPolicyType(quoteinfo.get("PolicyType")==null?"":quoteinfo.get("PolicyType").toString());
				bean.setRateModifyYN(quoteinfo.get("RateModifyYN")==null?"":quoteinfo.get("RateModifyYN").toString());
				bean.setRatingType(quoteinfo.get("Ratingtype")==null?"":quoteinfo.get("Ratingtype").toString());
				bean.setExposureValue(quoteinfo.get("ExposureValue")==null?"":quoteinfo.get("ExposureValue").toString());
				bean.setImportYn(quoteinfo.get("ImportYN")==null?"":quoteinfo.get("ImportYN").toString());
				bean.setLoaddiscountYN(quoteinfo.get("LoadDiscountYN")==null?"":quoteinfo.get("LoadDiscountYN").toString());
				bean.setLoadingPercent(quoteinfo.get("LoadingPercent")==null?"":quoteinfo.get("LoadingPercent").toString());
				bean.setDiscountPercent(quoteinfo.get("DiscountPercent")==null?"":quoteinfo.get("DiscountPercent").toString());
				bean.setServiceTaxYN(quoteinfo.get("ServiceTaxYN")==null?"":quoteinfo.get("ServiceTaxYN").toString());
				bean.setConsolidateGstYN(quoteinfo.get("ConsolidateYN")==null?"":quoteinfo.get("ConsolidateYN").toString());
				bean.setGlobalPolicy(quoteinfo.get("GlobalStatus")==null?"":quoteinfo.get("GlobalStatus").toString());
				bean.setGlobalBusiness(quoteinfo.get("GlobalType")==null?"":quoteinfo.get("GlobalType").toString());
				bean.setFacshare(quoteinfo.get("FacShare")==null?"":quoteinfo.get("FacShare").toString());
				bean.setInwardfacYN(quoteinfo.get("InwardFacYn")==null?"":quoteinfo.get("InwardFacYn").toString());
				
				
			} 
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	
}
