package com.maan.quotation.api;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.google.gson.Gson;
import com.maan.common.LogUtil;
import com.maan.common.Token;
import com.maan.common.ApiConfig.ApiConfig;
import com.maan.common.url.ApiUrl;
import com.maan.quotation.DeclarationAction;
import com.maan.quotation.model.BrokerInfoReq;
import com.maan.quotation.model.BrokerInfoResponse;
import com.maan.quotation.model.CommonInfo;
import com.maan.quotation.model.CommonModel;
import com.maan.quotation.model.ConditionsModel;
import com.maan.quotation.model.ConditionsModelRes;
import com.maan.quotation.model.ConditionsModelResp;
import com.maan.quotation.model.CustomerInfoResponse;
import com.maan.quotation.model.DropDown;
import com.maan.quotation.model.EndorsementPremiumModel;
import com.maan.quotation.model.EndtTypeRes;
import com.maan.quotation.model.GeneratePolicy;
import com.maan.quotation.model.MarineShipResponse;
import com.maan.quotation.model.PremiumUpdateModel;
import com.maan.quotation.model.PremiumUpdateResponse;
import com.maan.quotation.model.QuotationDropDown;
import com.maan.quotation.model.QuotationModel;
import com.maan.quotation.model.QuotationResponse;
import com.maan.quotation.model.QuoteDetails;
import com.maan.quotation.model.VesselInfo;

import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;



public class QuotationApiCall extends ApiConfig {
	final static Logger logger = LogUtil.getLogger(QuotationApiCall.class);
	Gson jsonConvertor = new Gson();
	Cache certdrpdwnCache = CacheManager.getInstance().getCache("certificateDropDown");
	
	public String getApiToken() {
		return Token.value();
	}

	public List<Map<String, Object>> dropDownList(String key, Object[] args) {
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		String jsonResponse ="";
		QuotationDropDown qddRes=null;
		try {
			QuotationDropDown qddReq = new QuotationDropDown();
			
			qddReq.setProductId(args[1]==null?"":args[1].toString());
			qddReq.setBranchCode(args[2]==null?"":args[2].toString());
			qddReq.setOpenCoverNo(args[3]==null?"":args[3].toString());
			qddReq.setModeOfTransportCode(args[4]==null?"":args[4].toString());
			qddReq.setCoverCode(args[5]==null?"":args[5].toString());
			qddReq.setOriginationCountryCode(args[6]==null?"":args[6].toString());
			qddReq.setDestinationCountryCode(args[7]==null?"":args[7].toString());
			qddReq.setIncotermCode(args[8]==null?"":args[8].toString());
			qddReq.setIncotermPercent(args[9]==null?"":args[9].toString());
			qddReq.setBrokerCode(args[12]==null?"":args[12].toString());
			qddReq.setLoginId(args[13]==null?"":args[13].toString());
			qddReq.setStateCode(args[15]==null?"":args[15].toString());
			
			String jsonRequest = jsonConvertor.toJson(qddReq);
			/*String cacheKey = key+jsonRequest;
			if(certdrpdwnCache.get(cacheKey)!=null && certdrpdwnCache.isKeyInCache(cacheKey) == true && ApiUrl.isCertDrpDwnCache()){
				Element element =  certdrpdwnCache.get(cacheKey);
				list = (List<Map<String, Object>>) element.getObjectValue();
			}else{*/
			if("state".equalsIgnoreCase(key) || "customertype".equalsIgnoreCase(key) ||"irtype".equalsIgnoreCase(key)) {
				jsonResponse = callAPIGet(ApiUrl.getQuoteDropDown()+key, getApiToken());
				qddRes = jsonConvertor.fromJson(jsonResponse, QuotationDropDown.class);
			}else {
				jsonResponse = callAPI(key, ApiUrl.getQuoteDropDown()+key, getApiToken(), jsonRequest);
				qddRes = jsonConvertor.fromJson(jsonResponse, QuotationDropDown.class);
			}
				List<DropDown> ddRes = qddRes.getDropdownList();
				if(ddRes != null && ddRes.size()>0) {
					for(DropDown dd :ddRes) {
						Map<String, Object> map = new HashMap<String, Object>();
						map.put("CODE", dd.getCode());
						map.put("CODEDESC", dd.getCodeDesc());
						map.put("CODEVALUE", dd.getCodeValue());
						list.add(map);
					}
				/*}
				certdrpdwnCache.put(new Element(cacheKey, list));*/
			}
		}catch(Exception e) {
			logger.info(key+" Exception @ QuotationApiCall.dropDownList(): "+e);
			e.printStackTrace();
		}
		return list;
	}

	public QuotationResponse saveQuote(QuotationModel qmi) {
		QuotationResponse qs = new QuotationResponse();
		try {
			String jsonRequest = jsonConvertor.toJson(qmi);
			String jsonResponse = callAPI("saveQuote", ApiUrl.getQuoteSave(), getApiToken(), jsonRequest);
			qs = jsonConvertor.fromJson(jsonResponse, QuotationResponse.class);
		}catch(Exception e) {
			logger.info("Exception @ QuotationApiCall.saveQuote(): "+e);
			e.printStackTrace();
		}
		return qs;
	}

	public QuotationResponse quotePremiumCalc(QuotationModel qmi) {
		QuotationResponse qs = new QuotationResponse();
		try {
			String jsonRequest = jsonConvertor.toJson(qmi);
			String jsonResponse = callAPI("premiumCalc", ApiUrl.getQuotePremiumCalc(), getApiToken(), jsonRequest);
			qs = jsonConvertor.fromJson(jsonResponse, QuotationResponse.class);
		}catch(Exception e) {
			logger.info("Exception @ QuotationApiCall.quotePremiumCalc(): "+e);
			e.printStackTrace();
		}
		return qs;
	}

	public ConditionsModelResp getConditions(ConditionsModel cmi) {
		ConditionsModelResp cmo = new ConditionsModelResp();
		try {
			String jsonRequest = jsonConvertor.toJson(cmi);
			String condition = "view";
			String url = ApiUrl.getQuoteConditionsView();
			
			String jsonResponse = callAPI(condition+"Conditions", url, getApiToken(), jsonRequest);
			cmo = jsonConvertor.fromJson(jsonResponse, ConditionsModelResp.class);
		}catch(Exception e) {
			logger.info("Exception @ QuotationApiCall.getConditions(): "+e);
			e.printStackTrace();
		}
		return cmo;
	}
	public ConditionsModelRes getAddConditions(ConditionsModel cmi) {
		ConditionsModelRes cmo = new ConditionsModelRes();
		try {
			String jsonRequest = jsonConvertor.toJson(cmi);
			String condition = "";
			String url = "";
			if(StringUtils.isNotBlank(cmi.getConditionsType())) {
				if("1".equalsIgnoreCase(cmi.getConditionsType())) {
					condition = "clausesNew";
					url = ApiUrl.getQuoteConditionsNew()+"clauses";
				}else if("2".equalsIgnoreCase(cmi.getConditionsType())) {
					condition = "warNew";
					url = ApiUrl.getQuoteConditionsNew()+"war";
				}else if("3".equalsIgnoreCase(cmi.getConditionsType())) {
					condition = "exclusionNew";
					url = ApiUrl.getQuoteConditionsNew()+"exclusion";
				}else if("4".equalsIgnoreCase(cmi.getConditionsType())) {
					condition = "warrantyNew";
					url = ApiUrl.getQuoteConditionsNew()+"warranty";
				}
			}
			String jsonResponse = callAPI(condition+"Conditions", url, getApiToken(), jsonRequest);
			cmo = jsonConvertor.fromJson(jsonResponse, ConditionsModelRes.class);
		}catch(Exception e) {
			logger.info("Exception @ QuotationApiCall.getConditions(): "+e);
			e.printStackTrace();
		}
		return cmo;
	}

	public QuotationResponse editQuote(QuotationModel qmi) {
		QuotationResponse qs = new QuotationResponse();
		try {
			String jsonRequest = jsonConvertor.toJson(qmi);
			String jsonResponse = callAPI("editQuote", ApiUrl.getQuoteEdit(), getApiToken(), jsonRequest);
			qs = jsonConvertor.fromJson(jsonResponse, QuotationResponse.class);
		}catch(Exception e) {
			logger.info("Exception @ QuotationApiCall.editQuote(): "+e);
			e.printStackTrace();
		}
		return qs;
	}

	public PremiumUpdateResponse premiumUpdate(PremiumUpdateModel pum) {
		PremiumUpdateResponse pur = new PremiumUpdateResponse();
		try {
			String jsonRequest = jsonConvertor.toJson(pum);
			String jsonResponse = callAPI("premiumUpdate", ApiUrl.getQuotePremiumUpdate(), getApiToken(), jsonRequest);
			pur = jsonConvertor.fromJson(jsonResponse, PremiumUpdateResponse.class);
		}catch(Exception e) {
			logger.info("Exception @ QuotationApiCall.premiumUpdate(): "+e);
			e.printStackTrace();
		}
		return pur;
	}

	public PremiumUpdateResponse generatePolicy(GeneratePolicy gp) {
		PremiumUpdateResponse pur = new PremiumUpdateResponse();
		try {
			String jsonRequest = jsonConvertor.toJson(gp);
			String jsonResponse = callAPI("generatePolicy", ApiUrl.getQuotePolicyGenerate(), getApiToken(), jsonRequest);
			pur = jsonConvertor.fromJson(jsonResponse, PremiumUpdateResponse.class);
		}catch(Exception e) {
			logger.info("Exception @ QuotationApiCall.generatePolicy(): "+e);
			e.printStackTrace();
		}
		return pur;
	}

	public QuotationResponse premiumResponse(QuotationModel qm) {
		QuotationResponse qs = new QuotationResponse();
		try {
			String jsonRequest = jsonConvertor.toJson(qm);
			String jsonResponse = callAPI("premiumResponse", ApiUrl.getQuotePremiumResponse(), getApiToken(), jsonRequest);
			qs = jsonConvertor.fromJson(jsonResponse, QuotationResponse.class);
		}catch(Exception e) {
			logger.info("Exception @ QuotationApiCall.premiumResponse(): "+e);
			e.printStackTrace();
		}
		return qs;
	}

	public QuotationResponse premiumCalculate(PremiumUpdateModel pum) {
		QuotationResponse qs = new QuotationResponse();
		try {
			String jsonRequest = jsonConvertor.toJson(pum);
			String jsonResponse = callAPI("premiumCalculate", ApiUrl.getQuotePremiumCalculate(), getApiToken(), jsonRequest);
			qs = jsonConvertor.fromJson(jsonResponse, QuotationResponse.class);
		}catch(Exception e) {
			logger.info("Exception @ QuotationApiCall.premiumCalculate(): "+e);
			e.printStackTrace();
		}
		return qs;
	}

	public ConditionsModel modifyConditions(ConditionsModel cmi) {
		ConditionsModel cmo = new ConditionsModel();
		try {
			String jsonRequest = jsonConvertor.toJson(cmi);
			String jsonResponse = callAPI((StringUtils.isNotBlank(cmi.getConditionsType())?"add":"modify")+"Conditions", StringUtils.isNotBlank(cmi.getConditionsType())?ApiUrl.getQuoteConditionsAdd():ApiUrl.getQuoteConditionsModify(), getApiToken(), jsonRequest);
			cmo = jsonConvertor.fromJson(jsonResponse, ConditionsModel.class);
		}catch(Exception e) {
			logger.info("Exception @ QuotationApiCall.modifyConditions(): "+e);
			e.printStackTrace();
		}
		return cmo;
	}

	public ConditionsModel addConditions(ConditionsModel cmi) {
		ConditionsModel cmo = new ConditionsModel();
		try {
			String jsonRequest = jsonConvertor.toJson(cmi);
			String jsonResponse = callAPI("addConditions", ApiUrl.getQuoteConditionsAdd(), getApiToken(), jsonRequest);
			cmo = jsonConvertor.fromJson(jsonResponse, ConditionsModel.class);
		}catch(Exception e) {
			logger.info("Exception @ QuotationApiCall.addConditions(): "+e);
			e.printStackTrace();
		}
		return cmo;
	}

	public CommonModel policyEndtInfo(CommonInfo cmi) {
		CommonModel cmo = new CommonModel();
		try {
			String jsonRequest = jsonConvertor.toJson(cmi);
			String jsonResponse = callAPI("policyEndtInfo", ApiUrl.getPolicyEndtInfo(), getApiToken(), jsonRequest);
			cmo = jsonConvertor.fromJson(jsonResponse, CommonModel.class);
		}catch(Exception e) {
			logger.info("Exception @ QuotationApiCall.policyEndtInfo(): "+e);
			e.printStackTrace();
		}
		return cmo;
	}

	public CommonModel openCoverInfo(CommonInfo cmi) {
		CommonModel cmo = new CommonModel();
		try {
			String jsonRequest = jsonConvertor.toJson(cmi);
			String jsonResponse = callAPI("openCoverInfo", ApiUrl.getOpenCoverInfo(), getApiToken(), jsonRequest);
			cmo = jsonConvertor.fromJson(jsonResponse, CommonModel.class);
		}catch(Exception e) {
			logger.info("Exception @ QuotationApiCall.openCoverInfo(): "+e);
			e.printStackTrace();
		}
		return cmo;
	}

	public EndorsementPremiumModel endtPremiumDetails(QuoteDetails qd) {
		EndorsementPremiumModel epm = new EndorsementPremiumModel();
		try {
			String jsonRequest = jsonConvertor.toJson(qd);
			String jsonResponse = callAPI("endtPremiumDetails", ApiUrl.getEndorsementPremiumDetails(), getApiToken(), jsonRequest);
			epm = jsonConvertor.fromJson(jsonResponse, EndorsementPremiumModel.class);
		}catch(Exception e) {
			logger.info("Exception @ QuotationApiCall.endtPremiumDetails(): "+e);
			e.printStackTrace();
		}
		return epm;
	}

	public CommonInfo isEndorsement(CommonInfo cii) {
		CommonInfo cio = new CommonInfo();
		try {
			String jsonRequest = jsonConvertor.toJson(cii);
			String jsonResponse = callAPI("isEndorsement", ApiUrl.getEndorsementCheck(), getApiToken(), jsonRequest);
			cio = jsonConvertor.fromJson(jsonResponse, CommonInfo.class);
		}catch(Exception e) {
			logger.info("Exception @ QuotationApiCall.isEndorsement(): "+e);
			e.printStackTrace();
		}
		return cio;
	}

	public CommonInfo isFinancialEndorsement(CommonInfo cii) {
		CommonInfo cio = new CommonInfo();
		try {
			String jsonRequest = jsonConvertor.toJson(cii);
			String jsonResponse = callAPI("isFinancialEndorsement", ApiUrl.getFinancialEndorsementCheck(), getApiToken(), jsonRequest);
			cio = jsonConvertor.fromJson(jsonResponse, CommonInfo.class);
		}catch(Exception e) {
			logger.info("Exception @ QuotationApiCall.isFinancialEndorsement(): "+e);
			e.printStackTrace();
		}
		return cio;
	}

	public CommonInfo isFinancial(CommonInfo cii) {
		CommonInfo cio = new CommonInfo();
		try {
			String jsonRequest = jsonConvertor.toJson(cii);
			String jsonResponse = callAPI("isFinancial", ApiUrl.getFinancialCheck(), getApiToken(), jsonRequest);
			cio = jsonConvertor.fromJson(jsonResponse, CommonInfo.class);
		}catch(Exception e) {
			logger.info("Exception @ QuotationApiCall.isFinancial(): "+e);
			e.printStackTrace();
		}
		return cio;
	}

	public EndtTypeRes selectedEndorsements(CommonInfo cii) {
		EndtTypeRes cio = new EndtTypeRes();
		try {
			String jsonRequest = jsonConvertor.toJson(cii);
			String jsonResponse = callAPI("selectedEndorsements", ApiUrl.getEndorsementSelectedDesc(), getApiToken(), jsonRequest);
			cio = jsonConvertor.fromJson(jsonResponse, EndtTypeRes.class);
		}catch(Exception e) {
			logger.info("Exception @ QuotationApiCall.selectedEndorsements(): "+e);
			e.printStackTrace();
		}
		return cio;
	}

	public MarineShipResponse shipsDetailResponse(QuotationModel qm) {
		MarineShipResponse qs = new MarineShipResponse();
		try {
			String jsonRequest = jsonConvertor.toJson(qm);
			String jsonResponse = callAPI("shipDetailResponse", ApiUrl.getShipDetailResponse(), getApiToken(), jsonRequest);
			qs = jsonConvertor.fromJson(jsonResponse, MarineShipResponse.class);
		}catch(Exception e) {
			logger.info("Exception @ QuotationApiCall.shipsDetailResponse(): "+e);
			e.printStackTrace();
		}
		return qs;
	}

	public CustomerInfoResponse getOpenCustomerInfo(String openCoverNo) {
		CustomerInfoResponse qs=new CustomerInfoResponse();
		try {
			CommonInfo cmi = new CommonInfo();
			cmi.setOpenCoverNo(openCoverNo);
			String jsonRequest = jsonConvertor.toJson(cmi);
			String jsonResponse = callAPI("opencoverCustResponse", ApiUrl.getOcCustomerInfoResponse(), getApiToken(), jsonRequest);
			qs = jsonConvertor.fromJson(jsonResponse, CustomerInfoResponse.class);
		}catch(Exception e) {
			logger.info("Exception @ QuotationApiCall.getOpenCustomerInfo(): "+e);
			e.printStackTrace();
		}
		return qs;
	}

	public BrokerInfoResponse getBrokerInformation(BrokerInfoReq br) {
		BrokerInfoResponse qs=new BrokerInfoResponse();
		try {
		
			String jsonRequest = jsonConvertor.toJson(br);
			String jsonResponse = callAPI("brokerResponse", ApiUrl.getBrokerInfoResponse(), getApiToken(), jsonRequest);
			qs = jsonConvertor.fromJson(jsonResponse, BrokerInfoResponse.class);
		}catch(Exception e) {
			logger.info("Exception @ QuotationApiCall.getBrokerInformation(): "+e);
			e.printStackTrace();
		}
		return qs;
	}

	public CustomerInfoResponse getCustomerSelectionInfo(CommonInfo cmi) {
		CustomerInfoResponse qs=new CustomerInfoResponse();
		try {
			
			String jsonRequest = jsonConvertor.toJson(cmi);
			String jsonResponse = callAPI("CustResponse", ApiUrl.getCustomerInfoResponse(), getApiToken(), jsonRequest);
			qs = jsonConvertor.fromJson(jsonResponse, CustomerInfoResponse.class);
		}catch(Exception e) {
			logger.info("Exception @ QuotationApiCall.getCustomerSelectionInfo(): "+e);
			e.printStackTrace();
		}
		return qs;
	}

	public CustomerInfoResponse getCustomerSearchSelectionInfo(CommonInfo cmi, String searchType) {
		CustomerInfoResponse qs=new CustomerInfoResponse();
		String jsonResponse ="";
		try {
			String jsonRequest = jsonConvertor.toJson(cmi);
			if("nationalId".equalsIgnoreCase(searchType)) {
				jsonResponse = callAPI("CustResponse", ApiUrl.getCustomerNationalIdResponse(), getApiToken(), jsonRequest);
			}else if("employeeId".equalsIgnoreCase(searchType)) {
				jsonResponse = callAPI("CustResponse", ApiUrl.getCustomerEmpIdResponse(), getApiToken(), jsonRequest);
			}else if("mobileNo".equalsIgnoreCase(searchType)) {
				jsonResponse = callAPI("CustResponse", ApiUrl.getCustomerMobileNoResponse(), getApiToken(), jsonRequest);
			}else if("vatRegNo".equalsIgnoreCase(searchType)) {
				jsonResponse = callAPI("CustResponse", ApiUrl.getCustomerVatRegNoResponse(), getApiToken(), jsonRequest);
			}else if("customerNo".equalsIgnoreCase(searchType)) {
				jsonResponse = callAPI("CustResponse", ApiUrl.getCustomerNoResponse(), getApiToken(), jsonRequest);
			}
			 
			qs = jsonConvertor.fromJson(jsonResponse, CustomerInfoResponse.class);
		}catch(Exception e) {
			logger.info("Exception @ QuotationApiCall.getCustomerSearchSelectionInfo(): "+e);
			e.printStackTrace();
		}
		return qs;
	}

	public String getWarOption(String openCoverNo) {
		String qs="";
		JSONParser parser = new JSONParser();
		try {
			CommonInfo cmi = new CommonInfo();
			cmi.setOpenCoverNo(openCoverNo);
			String jsonRequest = jsonConvertor.toJson(cmi);
			String jsonResponse = callAPI("warsrcResponse", ApiUrl.getWarsrcResponse(), getApiToken(), jsonRequest);
			Object obj = parser.parse(jsonResponse);
			JSONObject jo = (JSONObject) obj;
			qs = jo.get("WarSrccYn") == null ? "" : jo.get("WarSrccYn").toString();
		}catch(Exception e) {
			logger.info("Exception @ QuotationApiCall.getOpenCustomerInfo(): "+e);
			e.printStackTrace();
		}
		return qs;
	}

	public List<Object> getVesselList(String vesselName, String branchCode) {
		JSONParser parser = new JSONParser();
		List<Object> result=new ArrayList<>();
		try {
			VesselInfo cmi = new VesselInfo();
			cmi.setVesselName(vesselName);
			cmi.setBranchCode(branchCode);
			String jsonRequest = jsonConvertor.toJson(cmi);
			String jsonResponse = callAPI("vesselsearchRes", ApiUrl.getVesselSearch(), getApiToken(), jsonRequest);
			Object obj = parser.parse(jsonResponse);
			result = (JSONArray) obj;
		}catch(Exception e) {
			logger.info("Exception @ QuotationApiCall.getVesselList(): "+e);
			e.printStackTrace();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public void updateFinalizeStatus(String finalizeYN, String quoteNo) {
		try {
			JSONObject obj=new JSONObject();
			obj.put("FinalizeYn", finalizeYN);
			obj.put("QuoteNo", quoteNo);
			String jsonResponse = callAPI("finalize", ApiUrl.getFinalizecheck(), getApiToken(), obj.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
}
