package com.maan.report.api;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;

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
import com.maan.common.util.StringUtil;
import com.maan.quotation.model.DefaultValue;
import com.maan.report.ReportAction;
import com.maan.report.ReportBean;
import com.maan.report.model.EndorsementCategoryList;
import com.maan.report.model.EndorsementInputModel;
import com.maan.report.model.EndorsementOutputModel;

public class ReportApiCaller extends ApiConfig {

	final static Logger logger = LogUtil.getLogger(ReportApiCaller.class);
	static ResourceBundle bundle = ResourceBundle.getBundle("webservice");
	private String apiURL = getValueFromWebservice("maan.quote.report.drop");
	private String tokenURL = getValueFromWebservice("maan.marine.opencover.link");
	String response = "", link = "", token = "";
	Gson jsonConvertor = new Gson();
	
	public String getApiToken() {
		return Token.value();
	}
	
	
	private void saveToken(JSONObject json) {
		try {
			if(json!=null) {
				JSONObject dvo = (JSONObject) json.get("AdditionalData");
				if(dvo!=null) {
					DefaultValue dv = new DefaultValue();
					dv.setToken(dvo.get("Token")==null?"":dvo.get("Token").toString());
					Token.save(dv);
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	@SuppressWarnings("unchecked")
	public List<Object> getUserList(String loginId, String productId, String issuer, String searchBy, String branchCode,
			String menuType, String opencoverNo) {
		List<Object> resultList = new ArrayList<>();
		List<Map<String, Object>> result = null;

		if ("p".equalsIgnoreCase(menuType) || "pc".equalsIgnoreCase(menuType) ||"pf".equalsIgnoreCase(menuType)) {
			link = apiURL + "portfolio/dropdownlist";
		}
		else if ("QE".equalsIgnoreCase(menuType) || "QL".equalsIgnoreCase(menuType)
				|| "L".equalsIgnoreCase(menuType) || "C".equalsIgnoreCase(menuType) || "PE".equalsIgnoreCase(menuType) || "R".equalsIgnoreCase(menuType)) {
			link = apiURL + "quoteregister/dropdownlist";
		} else if ("RA".equalsIgnoreCase(menuType) || "RU".equalsIgnoreCase(menuType) || "RR".equalsIgnoreCase(menuType)) { 
			link = apiURL + "referral/dropdownlist";
		}else {
			link = apiURL + "quoteregister/dropdownlist";
		}
		try {
			token = Token.value();
			JSONObject req = new JSONObject();

			if ("RA".equalsIgnoreCase(menuType) || "RU".equalsIgnoreCase(menuType) || "RR".equalsIgnoreCase(menuType)) {
				req.put("ProductId", productId);
				req.put("ReferralType", menuType);
			} else {
				req.put("ProductId", productId);
				req.put("Type", menuType);
			}
			req.put("ApplicationId", "".equalsIgnoreCase(issuer) ? "1" : issuer);
			if(StringUtil.isBlankOrNull(issuer)) {
				req.put("LoginId", loginId);
			}
			req.put("BranchCode", branchCode);
			logger.info("Link" + link);
			logger.info("GET getUserList Json===>" + req.toString());
			response = callAPI(link, token, req.toString());
			if(StringUtils.isNotBlank(response)) {
			JSONParser parser = new JSONParser();
			JSONObject jo = (JSONObject) parser.parse(response);
			result =(JSONArray) jo.get("Result");
			saveToken(jo);
			if (result.size() > 0) {
				for (int i = 0; i < result.size(); i++) {
					Map<String, Object> tempReturn = new HashMap<String, Object>();
					tempReturn.put("LOGIN_ID", result.get(i).get("LoginId").toString());
					tempReturn.put("USERNAME", result.get(i).get("UserName").toString());
					resultList.add(tempReturn);
				}
			}
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultList;
	}

	@SuppressWarnings("unchecked")
	public String getTokenDetail() {
		String link = "";
		String result = "";
		link = tokenURL + "login/Logincheck";

		JSONObject dropdown = new JSONObject();
		dropdown.put("UserId", "NewBroker");
		dropdown.put("Password", "Admin@01");
		dropdown.put("BranchCode", "01");
		dropdown.put("LoginType", "Broker");

		logger.info("GET getOptionsList Json===>" + dropdown.toString());
		String response = callAPI(link, "", dropdown.toString());
		JSONParser parser = new JSONParser();

		try {
			Object obj = parser.parse(response);
			JSONObject jo = (JSONObject) obj;
			result = jo.get("token") == null ? "" : jo.get("token").toString();

		} catch (Exception e) {
			logger.info("EXCEPTION WHILE getTokenDetail" + e);
			e.printStackTrace();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public List<Object> getReportList(String loginId, String productId, String issuer, String menuType,
			String openCoverNo, String startDate, String endDate, String quoteNo, String policyNo, String searchBy,
			String searchValue, String searchField, String searchString, String searchOper, String branchCode,
			String userLogin, String schemeId, String vehicleId) {
		List<Object> result = new ArrayList<Object>();
		try {
			String url = getValueFromWebservice("maan.quote.report");
			token = Token.value();
			if ("QE".equalsIgnoreCase(menuType)) {
				url += "existing/quote";
			} else if ("L".equalsIgnoreCase(menuType)) {
				url += "rejected/quote";
			} else {
				url += "lapsed/quote";
			}
			if (issuer == null || "".equalsIgnoreCase(issuer)) {
				issuer = "1";
			}
			JSONObject req = new JSONObject();
			req.put("ProductId", productId);
			req.put("ApplicationId", issuer);
			req.put("LoginId", loginId);
			req.put("OpenCoverNo", openCoverNo);
			req.put("BranchCode", branchCode);
			
			response = callAPI(url, token, req.toString());
			JSONParser parser = new JSONParser();
			JSONObject json = null;
			if (response != null) {
				json = (JSONObject) parser.parse(response);
				result =(JSONArray) json.get("Result");
				saveToken(json);
				/*if ("QE".equalsIgnoreCase(menuType)) {
				result = (JSONArray) json.get("ExistingQuoteRegister");
				} else if ("L".equalsIgnoreCase(menuType)) {
					result = (JSONArray) json.get("RejectedQuoteRegister");
				} else {
					result = (JSONArray) json.get("LapsedQuoteRegister");
				}*/
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@SuppressWarnings("unchecked")
	public List<Object> getPortFolio(String loginId, String productId, String issuer, String menuType,
			String openCoverNo, String startDate, String endDate, String quoteNo, String policyNo, String searchBy,
			String searchValue, String searchField, String searchString, String searchOper, String branchCode,
			String userLogin, String schemeId, String vehicleId) {
		List<Object> result = null;
		try {
			String url = getValueFromWebservice("maan.quote.report");
			if("P".equalsIgnoreCase(menuType)) {
				link = url + "portfolio/policy";
			}else if("PC".equalsIgnoreCase(menuType)) {
				link = url + "portfolio/policycancelled";
			}else {
				link = url + "portfolio/policyfailure";
			}
			token = Token.value();
			if (issuer == null || "".equalsIgnoreCase(issuer)) {
				issuer = "1";
			}
			JSONObject req = new JSONObject();
			req.put("ProductId", productId);
			req.put("ApplicationId", "gotherPolicyNo".equals(searchBy)?"":issuer);
			req.put("LoginId", "gotherPolicyNo".equals(searchBy)?"":loginId);
			req.put("OpenCoverNo", openCoverNo);
			req.put("OtherPolicyNo", searchString);
			req.put("BranchCode", branchCode);
			
			response = callAPI(link, token, req.toString());
			JSONObject json = new JSONObject();
			JSONParser parser = new JSONParser();
			if (response != null) {
				json = (JSONObject) parser.parse(response);
				result =(JSONArray) json.get("Result");
				saveToken(json);
				/*if("P".equalsIgnoreCase(menuType)) {
					result = (JSONArray)json.get("PolicyPortFolioResponse");
				}else if("PC".equalsIgnoreCase(menuType)) {
					result = (JSONArray)json.get("PolicyCancelledResponse");
				}else {
					result = (JSONArray)json.get("PolicyFailureResponse");
				}*/
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public List<Object> getReferralList(String loginId, String productId, String issuer, String menuType,
			String openCoverNo, String startDate, String endDate, String quoteNo, String policyNo, String searchBy,
			String searchValue, String searchField, String searchString, String searchOper, String branchCode,
			String userLogin, String schemeId, String vehicleId) {
		List<Object> result = null;
		try {
			String url = getValueFromWebservice("maan.quote.report");
			token = Token.value();
			String key = "";
			if ("RA".equalsIgnoreCase(menuType)) {
				key = "approved";
				link = url + "referral/approvedquote";
			} else if ("RU".equalsIgnoreCase(menuType)) {
				key = "unapproved";
				link = url + "referral/unapprovedquote";
			} else {
				key = "rejected";
				link = url + "referral/rejectedquote";
			}
			if (issuer == null || "".equalsIgnoreCase(issuer)) {
				issuer = "1";
			}

			JSONObject req = new JSONObject();
			req.put("LoginId", loginId);
			req.put("ProductId", productId);
			req.put("ApplicationId", issuer);
			req.put("OpenCoverNo", openCoverNo);
			req.put("BranchCode", branchCode);
			
			response = callAPI(link, token, req.toString());
			if (response != null) {
				JSONObject json = new JSONObject();
				JSONParser parser = new JSONParser();
				json = (JSONObject) parser.parse(response);
				saveToken(json);
				result =(JSONArray) json.get("Result");
				//result = (JSONArray) json.get("ReferralQuoteResponse");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@SuppressWarnings({ "unchecked", "null" })
	public List<Object> getCustomerList(String loginId, String issuer, String branchCode) {
		List<Object> resultList =new ArrayList<Object>();
		try {
			String url = getValueFromWebservice("maan.quote.report");
			link = url + "customerlist";
			JSONObject req = new JSONObject();
			req.put("LoginId", loginId);
			req.put("ApplicationId", issuer);
			req.put("BranchCode", branchCode);
			token = Token.value();
			response = callAPI(link, token, req.toString());
			JSONObject json = new JSONObject();
			JSONParser parser = new JSONParser();
			if (response != null) {
				json = (JSONObject) parser.parse(response);
				saveToken(json);
				resultList =(JSONArray) json.get("Result");
				//resultList = (JSONArray) json.get("CustomerDetails");
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultList;
	}

	@SuppressWarnings("unchecked")
	public List<Object> getEndorsementList(String loginId, String productId, String issuer, String menuType,
			String openCoverNo, String startDate, String endDate, String quoteNo, String policyNo, String searchBy,
			String searchValue, String searchField, String searchString, String searchOper, String branchCode,
			String userLogin, String schemeId, String vehicleId) {
		List<Object> result = new ArrayList<Object>();
		String url = getValueFromWebservice("maan.quote.report");
		link = url + "endorsement/list";
		try {
			JSONObject req = new JSONObject();
			req.put("LoginId", loginId);
			req.put("ProductId", productId);
			req.put("PolicyNo", policyNo);
			req.put("QuoteNo", quoteNo);
			token = Token.value();
			response = callAPI(link, token, req.toString());
			JSONObject json = new JSONObject();
			JSONParser parser = new JSONParser();
			json = (JSONObject) parser.parse(response);
			saveToken(json);
			json = (JSONObject) json.get("Result");
			result = (JSONArray) json.get("EndorsementDetails");
			/*if(resultList != null && resultList.size()>0) {
				for (int i = 0; i < resultList.size(); i++) {
					Map<String, Object> tempReturn = new HashMap<String, Object>();
					tempReturn.put("POLICY_NO", resultList.get(i).get("PolicyNo")==null?"":resultList.get(i).get("PolicyNo").toString());
					tempReturn.put("STATUS", resultList.get(i).get("Status")==null?"":resultList.get(i).get("Status").toString());
					tempReturn.put("EXCESS_PREMIUM", resultList.get(i).get("ExcessPremium")==null?"":resultList.get(i).get("ExcessPremium").toString());
					tempReturn.put("OPEN_COVER_NO", resultList.get(i).get("OpenCoverNo")==null?"":resultList.get(i).get("OpenCoverNo").toString());
					tempReturn.put("LOGIN_ID", resultList.get(i).get("LoginId")==null?"":resultList.get(i).get("LoginId").toString());
					tempReturn.put("ENDT_STATUS", resultList.get(i).get("EndtStatus")==null?"":resultList.get(i).get("EndtStatus").toString());
					tempReturn.put("APPLICATION_NO", resultList.get(i).get("ApplicationNo")==null?"":resultList.get(i).get("ApplicationNo").toString());
					tempReturn.put("QUOTATION_DATE", resultList.get(i).get("QuotationDate")==null?"":resultList.get(i).get("QuotationDate").toString());
					tempReturn.put("CREDIT_NOTE_NO", resultList.get(i).get("CreditNoteNo")==null?"":resultList.get(i).get("CreditNoteNo").toString());
					tempReturn.put("PREMIUM", resultList.get(i).get("Premium")==null?"":resultList.get(i).get("Premium").toString());
					tempReturn.put("CUSTOMER_ID", resultList.get(i).get("CustomerId")==null?"":resultList.get(i).get("CustomerId").toString());
					tempReturn.put("BROKER_NAME", resultList.get(i).get("BrokerName")==null?"":resultList.get(i).get("BrokerName").toString());
					tempReturn.put("QUOTE_NO", resultList.get(i).get("QuoteNo")==null?"":resultList.get(i).get("QuoteNo").toString());
					tempReturn.put("COMPANY_NAME", resultList.get(i).get("CompanyName")==null?"":resultList.get(i).get("CompanyName").toString());
					tempReturn.put("INCEPTION_DATE", resultList.get(i).get("InceptionDate")==null?"":resultList.get(i).get("InceptionDate").toString());
					tempReturn.put("DEBIT_NOTE_NO", resultList.get(i).get("DebitNoteNo")==null?"":resultList.get(i).get("DebitNoteNo").toString());
					tempReturn.put("CUSTOMER_NAME", resultList.get(i).get("CustomerName")==null?"":resultList.get(i).get("CustomerName").toString());
					tempReturn.put("LAST_NAME", resultList.get(i).get("LastName")==null?"":resultList.get(i).get("LastName").toString());
					tempReturn.put("REF_STATUS", resultList.get(i).get("ReferralStatus")==null?"":resultList.get(i).get("ReferralStatus").toString());
					tempReturn.put("ENDT_TYPE", resultList.get(i).get("EndtType")==null?"":resultList.get(i).get("EndtType").toString());
					result.add(tempReturn);
				}
			}*/
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public List<Object> getSearchResult(ReportAction action, String userType, String productId, String searchby, String searchValue) {
		List<Object> result = new ArrayList<Object>();
		List<Map<String,Object>> resultList;
		String url = getValueFromWebservice("maan.quote.report");
		link = url + "search/results";
		try {
			JSONObject req = new JSONObject();
			req.put("LoginId", action.getLoginId());
			req.put("ProductId", productId);
			req.put("Issuer", action.getIssuer());
			req.put("OpenCoverNo", action.getOpenCoverNo());
			req.put("SearchValue", searchValue);
			req.put("SearchBy", searchby);
			req.put("UserType", userType);
			req.put("BranchCode", action.getBranchCode());
			token = Token.value();
			response = callAPI(link, token, req.toString());
			JSONObject json = new JSONObject();
			JSONParser parser = new JSONParser();
			json = (JSONObject) parser.parse(response);
			saveToken(json);
			resultList =(JSONArray) json.get("Result");
			if(resultList!=null) {
			if("custName".equalsIgnoreCase(searchby) || "quoteNo".equalsIgnoreCase(searchby)) {
				if (resultList !=null && resultList.size() > 0) {
					for (int i = 0; i < resultList.size(); i++) {
						Map<String, Object> tempReturn = new HashMap<String, Object>();
						tempReturn.put("QUOTE_NO", resultList.get(i).get("QuoteNo")==null?"":resultList.get(i).get("QuoteNo").toString());
						tempReturn.put("VALIDITY_DATE", resultList.get(i).get("ValidityDate")==null?"":resultList.get(i).get("ValidityDate").toString());
						tempReturn.put("LOGIN_ID", resultList.get(i).get("LoginId")==null?"":resultList.get(i).get("LoginId").toString());
						tempReturn.put("PREMIUM", resultList.get(i).get("Premium")==null?"":resultList.get(i).get("Premium").toString());
						tempReturn.put("CUSTOMER_ID", resultList.get(i).get("CustomerId")==null?"":resultList.get(i).get("CustomerId").toString());
						tempReturn.put("POLICY_NO", resultList.get(i).get("PolicyNo")==null?"":resultList.get(i).get("PolicyNo").toString());
						tempReturn.put("STATUS_TYPE_NAME", resultList.get(i).get("StatusTypeName")==null?"":resultList.get(i).get("StatusTypeName").toString());
						tempReturn.put("COMPANY_NAME", resultList.get(i).get("CompanyName")==null?"":resultList.get(i).get("CompanyName").toString());
						tempReturn.put("CUSTOMER_NAME", resultList.get(i).get("CustomerName")==null?"":resultList.get(i).get("CustomerName").toString());
						tempReturn.put("OPEN_COVER_NO", resultList.get(i).get("OpenCoverNo")==null?"":resultList.get(i).get("OpenCoverNo").toString());
						tempReturn.put("POLICY_START_DATE", resultList.get(i).get("PolicyStartDate")==null?"":resultList.get(i).get("PolicyStartDate").toString());
						tempReturn.put("QUOTATION_DATE", resultList.get(i).get("QuotationDate")==null?"":resultList.get(i).get("QuotationDate").toString());
						tempReturn.put("APPLICATION_NO", resultList.get(i).get("ApplicationNo")==null?"":resultList.get(i).get("ApplicationNo").toString());
						tempReturn.put("STATUS_TYPE", resultList.get(i).get("StatusType")==null?"":resultList.get(i).get("StatusType").toString());
						result.add(tempReturn);
					}
				}
			}else {

				if (resultList !=null && resultList.size() > 0) {
					for (int i = 0; i < resultList.size(); i++) {
						Map<String, Object> tempReturn = new HashMap<String, Object>();
						tempReturn.put("QUOTE_NO", resultList.get(i).get("QuoteNo")==null?"":resultList.get(i).get("QuoteNo").toString());
						tempReturn.put("VALIDITY_DATE", resultList.get(i).get("ValidityDate")==null?"":resultList.get(i).get("ValidityDate").toString());
						tempReturn.put("LOGIN_ID", resultList.get(i).get("LoginId")==null?"":resultList.get(i).get("LoginId").toString());
						tempReturn.put("PREMIUM", resultList.get(i).get("Premium")==null?"":resultList.get(i).get("Premium").toString());
						tempReturn.put("CUSTOMER_ID", resultList.get(i).get("CustomerId")==null?"":resultList.get(i).get("CustomerId").toString());
						tempReturn.put("POLICY_NO", resultList.get(i).get("PolicyNo")==null?"":resultList.get(i).get("PolicyNo").toString());
						tempReturn.put("STATUS_TYPE_NAME", resultList.get(i).get("StatusTypeName")==null?"":resultList.get(i).get("StatusTypeName").toString());
						tempReturn.put("COMPANY_NAME", resultList.get(i).get("CompanyName")==null?"":resultList.get(i).get("CompanyName").toString());
						tempReturn.put("CUSTOMER_NAME", resultList.get(i).get("CustomerName")==null?"":resultList.get(i).get("CustomerName").toString());
						tempReturn.put("OPEN_COVER_NO", resultList.get(i).get("OpenCoverNo")==null?"":resultList.get(i).get("OpenCoverNo").toString());
						tempReturn.put("POLICY_DATE", resultList.get(i).get("PolicyDate")==null?"":resultList.get(i).get("PolicyDate").toString());
						tempReturn.put("QUOTATION_DATE", resultList.get(i).get("QuotationDate")==null?"":resultList.get(i).get("QuotationDate").toString());
						tempReturn.put("APPLICATION_NO", resultList.get(i).get("ApplicationNo")==null?"":resultList.get(i).get("ApplicationNo").toString());
						tempReturn.put("STATUS_TYPE", resultList.get(i).get("StatusType")==null?"":resultList.get(i).get("StatusType").toString());
						
						tempReturn.put("CREDIT_NOTE_NO", resultList.get(i).get("CreditNoteNo")==null?"":resultList.get(i).get("CreditNoteNo").toString());
						tempReturn.put("DEBIT_NOTE_NO", resultList.get(i).get("DebitNoteNo")==null?"":resultList.get(i).get("DebitNoteNo").toString());
						tempReturn.put("LAST_NAME", resultList.get(i).get("LastName")==null?"":resultList.get(i).get("LastName").toString());
						tempReturn.put("OC_CUST_ID", resultList.get(i).get("OcCustId")==null?"":resultList.get(i).get("OcCustId").toString());
						tempReturn.put("INCEPTION_DATE", resultList.get(i).get("InceptionDate")==null?"":resultList.get(i).get("InceptionDate").toString());
						tempReturn.put("BROKER_NAME", resultList.get(i).get("BrokerName")==null?"":resultList.get(i).get("BrokerName").toString());
						tempReturn.put("AMEND_ID", resultList.get(i).get("AmendId")==null?"":resultList.get(i).get("AmendId").toString());
						tempReturn.put("EXCESS_PREMIUM", resultList.get(i).get("ExcessPremium")==null?"":resultList.get(i).get("ExcessPremium").toString());
						tempReturn.put("POLICY_START_DATE", resultList.get(i).get("PolicyStartDate")==null?"":resultList.get(i).get("PolicyStartDate").toString());
						
						result.add(tempReturn);
					}
				}
			}
			}	
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public List<Object> getPolicyReportList(String loginId, String productId, String issuer, String menuType,
			String openCoverNo, String startDate, String endDate, String quoteNo, String policyNo, String searchBy,
			String searchValue, String searchField, String searchString, String searchOper, String branchCode,
			String userLogin, String schemeId, String vehicleId) {
		List<Object> result = new ArrayList<Object>();
		List<Map<String,Object>> resultList;
		String url = getValueFromWebservice("maan.quote.report");
		link = url + "policyreport";
		try {
			JSONObject req = new JSONObject();
			req.put("LoginId", loginId);
			req.put("ProductId", productId);
			req.put("ApplicationId", issuer);
			req.put("OpenCoverNo", openCoverNo);
			req.put("UserLogin", userLogin);
			req.put("EndDate", endDate);
			req.put("StartDate", startDate);
			req.put("BranchCode", branchCode);
			
			token = Token.value();
			
			response = callAPI(link, token, req.toString()) ;
			JSONObject json = new JSONObject();
			JSONParser parser = new JSONParser();
			json = (JSONObject) parser.parse(response);
			saveToken(json);
			resultList = (JSONArray)json.get("Result");
			
			if (resultList.size() > 0) {
				for (int i = 0; i < resultList.size(); i++) {
					Map<String, Object> tempReturn = new HashMap<String, Object>();
					
					tempReturn.put("CARRIER_NAME", resultList.get(i).get("CarrierName")==null?"":resultList.get(i).get("CarrierName").toString());
					tempReturn.put("BASIC_PREMIUM", resultList.get(i).get("BasicPremium")==null?"":resultList.get(i).get("BasicPremium").toString());
					tempReturn.put("POLICY_NO", resultList.get(i).get("PolicyNo")==null?"":resultList.get(i).get("PolicyNo").toString());
					tempReturn.put("SUM_INSURED_LOCAL", resultList.get(i).get("SumInsuredLocal")==null?"":resultList.get(i).get("SumInsuredLocal").toString());
					tempReturn.put("LC_NUMBER", resultList.get(i).get("LcNumber")==null?"":resultList.get(i).get("LcNumber").toString());
					tempReturn.put("EXCESS_DESCRIPTION", resultList.get(i).get("ExcessDescription")==null?"":resultList.get(i).get("ExcessDescription").toString());
					tempReturn.put("FINAL_PREMIUM", resultList.get(i).get("FinalPremium")==null?"":resultList.get(i).get("FinalPremium").toString());
					tempReturn.put("CERTIFICATE_NO", resultList.get(i).get("Certificate")==null?"":resultList.get(i).get("Certificate").toString());
					tempReturn.put("DEST_COUNTRY", resultList.get(i).get("DestCountry")==null?"":resultList.get(i).get("DestCountry").toString());
					tempReturn.put("INSURED_NAME", resultList.get(i).get("InsuredName")==null?"":resultList.get(i).get("InsuredName").toString());
					tempReturn.put("POLICY_FIXEDFEE", resultList.get(i).get("PolicyFixedFee")==null?"":resultList.get(i).get("PolicyFixedFee").toString());
					tempReturn.put("SUM_INSURED_FOREIGN", resultList.get(i).get("SumInsuredForeign")==null?"":resultList.get(i).get("SumInsuredForeign").toString());
					tempReturn.put("EQUIVALENT_USD", resultList.get(i).get("EquivalentUsd")==null?"":resultList.get(i).get("EquivalentUsd").toString());
					tempReturn.put("INCEPTION_DATE", resultList.get(i).get("InceptionDate")==null?"":resultList.get(i).get("InceptionDate").toString());
					tempReturn.put("BL_AWB_DATE", resultList.get(i).get("BlAwbDate")==null?"":resultList.get(i).get("BlAwbDate").toString());
					tempReturn.put("BROKER_NAME", resultList.get(i).get("BrokerName")==null?"":resultList.get(i).get("BrokerName").toString());
					tempReturn.put("SALE_TERM_CHARGES", resultList.get(i).get("SaleTermCharges")==null?"":resultList.get(i).get("SaleTermCharges").toString());
					tempReturn.put("ORIGIN_COUNTRY", resultList.get(i).get("OriginCountry")==null?"":resultList.get(i).get("OriginCountry").toString());
					tempReturn.put("POLICY_FEE", resultList.get(i).get("PolicyFee")==null?"":resultList.get(i).get("PolicyFee").toString());
					tempReturn.put("EQUIVALENT_DH", resultList.get(i).get("EquivalentDH")==null?"":resultList.get(i).get("EquivalentDH").toString());
					tempReturn.put("INSPECTION_FEE", resultList.get(i).get("InspectionFee")==null?"":resultList.get(i).get("InspectionFee").toString());
					tempReturn.put("COVER_NAME", resultList.get(i).get("CoverName")==null?"":resultList.get(i).get("CoverName").toString());
					tempReturn.put("EXCHANGE_RATE", resultList.get(i).get("ExchangeRate")==null?"":resultList.get(i).get("ExchangeRate").toString());
					tempReturn.put("CREDIT_NOTE_NO", resultList.get(i).get("CreditNoteNo")==null?"":resultList.get(i).get("CreditNoteNo").toString());
					tempReturn.put("USER_NAME", resultList.get(i).get("UserName")==null?"":resultList.get(i).get("UserName").toString());
					tempReturn.put("DEBIT_NOTE_NO", resultList.get(i).get("DebitNoteNo")==null?"":resultList.get(i).get("DebitNoteNo").toString());
					tempReturn.put("BL_AWB_NO", resultList.get(i).get("BlAwbNo")==null?"":resultList.get(i).get("BlAwbNo").toString());
					tempReturn.put("WSRCC_PREMIUM", resultList.get(i).get("WsrccPremium")==null?"":resultList.get(i).get("WsrccPremium").toString());
					tempReturn.put("TOTAL_PREMIUM", resultList.get(i).get("TotalPremium")==null?"":resultList.get(i).get("TotalPremium").toString());
					tempReturn.put("VIA", resultList.get(i).get("Via")==null?"":resultList.get(i).get("Via").toString());
					tempReturn.put("MARINE_PREMIUM", resultList.get(i).get("MarinePremium")==null?"":resultList.get(i).get("MarinePremium").toString());
					tempReturn.put("COMMISSION", resultList.get(i).get("Commission")==null?"":resultList.get(i).get("Commission").toString());
					tempReturn.put("POLICY_ISSUE_DATE", resultList.get(i).get("PolicyIssueDate")==null?"":resultList.get(i).get("PolicyIssueDate").toString());
					tempReturn.put("BASIS_OF_VALUATION", resultList.get(i).get("BasisOfValuation")==null?"":resultList.get(i).get("BasisOfValuation").toString());
					tempReturn.put("TOLERANCE_CHARGES", resultList.get(i).get("ToleranceCharges")==null?"":resultList.get(i).get("ToleranceCharges").toString());
					tempReturn.put("FORM_OF_TRANSPORT", resultList.get(i).get("FormOfTransport")==null?"":resultList.get(i).get("FormOfTransport").toString());
					tempReturn.put("CURRENCY_TYPE", resultList.get(i).get("CurrencyType")==null?"":resultList.get(i).get("CurrencyType").toString());
					tempReturn.put("MODE_OF_TRANSPORT", resultList.get(i).get("ModeOfTransport")==null?"":resultList.get(i).get("ModeOfTransport").toString());
					tempReturn.put("GOODS_DESCRIPTION", resultList.get(i).get("GoodsDescription")==null?"":resultList.get(i).get("GoodsDescription").toString());
					tempReturn.put("EXCESS_PREMIUM", resultList.get(i).get("ExcessPremium")==null?"":resultList.get(i).get("ExcessPremium").toString());
					tempReturn.put("LC_DATE", resultList.get(i).get("LcDate")==null?"":resultList.get(i).get("LcDate").toString());
					tempReturn.put("BANK_NAME", resultList.get(i).get("BankName")==null?"":resultList.get(i).get("BankName").toString());
					result.add(tempReturn);
				}
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public void getBulkReportList(ReportBean bean, String branchCode, String adminLoginId, String productId) {
		List<Map<String, Object>> resultList;
		List<Map<String,Object>> listOp =new ArrayList<Map<String,Object>>();
		List<Map<String,Object>> listBr =new ArrayList<Map<String,Object>>();
		String url = getValueFromWebservice("maan.quote.report");
		link = url + "bulkreport";
		try {
			JSONObject req = new JSONObject();
			req.put("ProductId", productId);
			req.put("Mode", bean.getMode());
			req.put("StartDate", bean.getStartDate());
			req.put("EndDate", bean.getEndDate());
			req.put("UserType", "ALL");
			req.put("BranchCode", branchCode);
			req.put("AdminLoginId", adminLoginId);
			token = Token.value();
			response = callAPI(link, token, req.toString());
			JSONObject json = new JSONObject();
			JSONParser parser = new JSONParser();
			json = (JSONObject) parser.parse(response);
			saveToken(json);
			//op
			resultList = (JSONArray)json.get("BulkOpList");
			if(resultList.size()>0) {
				for (int i=0;i<resultList.size();i++) {
					Map<String, Object> tempReturn = new HashMap<String, Object>();
					tempReturn.put("USERNAME", resultList.get(i).get("UserName")==null?"":resultList.get(i).get("UserName").toString());
					tempReturn.put("TOTAL_POLICY", resultList.get(i).get("TotalPolicy")==null?"":resultList.get(i).get("TotalPolicy").toString());
					tempReturn.put("APPLICATION_ID", resultList.get(i).get("ApplicationId")==null?"":resultList.get(i).get("ApplicationId").toString());
					listOp.add(tempReturn);
				}
			}
			bean.setBulkPrintOPList(listOp);
			
			//br
			resultList= (JSONArray)json.get("BulkBrList");
			if(resultList.size()>0) {
				for (int i=0;i<resultList.size();i++) {
					Map<String, Object> tempReturn = new HashMap<String, Object>();
					tempReturn.put("COMPANY_NAME", resultList.get(i).get("UserName")==null?"":resultList.get(i).get("UserName").toString());
					tempReturn.put("TOTAL_POLICY", resultList.get(i).get("TotalPolicy")==null?"":resultList.get(i).get("TotalPolicy").toString());
					tempReturn.put("LOGIN_ID", resultList.get(i).get("LoginId")==null?"":resultList.get(i).get("LoginId").toString());
					listBr.add(tempReturn);
				}
			}
			bean.setBulkPrintBRList(listBr);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	




	public EndorsementCategoryList endorsementCategoryWithList(EndorsementInputModel eim) {
		EndorsementCategoryList ecl = new EndorsementCategoryList();
		try {
			String jsonRequest = jsonConvertor.toJson(eim);
			String jsonResponse = callAPI("endorsementCategoryWithList", ApiUrl.getEndorsementCategoryWithList(), getApiToken(), jsonRequest);
			ecl = jsonConvertor.fromJson(jsonResponse, EndorsementCategoryList.class);
		}catch(Exception e) {
			logger.info("Exception @ QuotationApiCall.endorsementCategoryWithList(): "+e);
			e.printStackTrace();
		}
		return ecl;
	}


	public EndorsementOutputModel saveEndorsement(EndorsementInputModel eim) {
		EndorsementOutputModel eom = new EndorsementOutputModel();
		try {
			String jsonRequest = jsonConvertor.toJson(eim);
			String jsonResponse = callAPI("saveEndorsement", ApiUrl.getSaveEndorsement(), getApiToken(), jsonRequest);
			eom = jsonConvertor.fromJson(jsonResponse, EndorsementOutputModel.class);
		}catch(Exception e) {
			logger.info("Exception @ QuotationApiCall.saveEndorsement(): "+e);
			e.printStackTrace();
		}
		return eom;
	}


	@SuppressWarnings("unchecked")
	public void getShipDetails(ReportBean bean, String userType, String loginId, String issuer,String type) {
		List<Map<String, Object>> resultList;
		JSONObject req = new JSONObject();
		try {
				link = getValueFromWebservice("maan.quote.report.ship."+type);
				req.put("StartDate", bean.getStartDate());
				req.put("EndDate", bean.getEndDate());
				req.put("LoginId", loginId);
				req.put("ApplicationId",StringUtils.isBlank(issuer)?"1":issuer);
				token = Token.value();
			response = callAPI(link, token, req.toString());
			JSONObject json = new JSONObject();
			JSONParser parser = new JSONParser();
			json = (JSONObject) parser.parse(response);
			saveToken(json);
			resultList = (JSONArray)json.get("ShipMapResponse");
			if("completed".equalsIgnoreCase(type)) {
			bean.setShipDetailList(resultList);
			}else {
			bean.setShipPendingList(resultList);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	@SuppressWarnings("unchecked")
	public void getShipTrackDetails(ReportBean bean) {
		List<Map<String, Object>> resultList;
		JSONObject req = new JSONObject();
		try {
				link = getValueFromWebservice("maan.quote.report.ship."+bean.getSearchBy());
				req.put("StartDate", bean.getStartDate());
				req.put("EndDate", bean.getEndDate());
				req.put("SearchValue", bean.getSearchValue());
				token = Token.value();
			response = callAPI(link, token, req.toString());
			JSONObject json = new JSONObject();
			JSONParser parser = new JSONParser();
			json = (JSONObject) parser.parse(response);
			saveToken(json);
			resultList = (JSONArray)json.get("ShipMapResponse");
			bean.setErrors((JSONArray) json.get("ErrorMessage"));
			bean.setShipDetailList(resultList);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}



	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> shipDetails(String startDate, String endDate, String policyNumber,
			String quoteNumber, String imoNumber) {
		List<Map<String, Object>> resultList=new ArrayList<Map<String,Object>>();
		JSONObject req = new JSONObject();
		try {
				link = getValueFromWebservice("maan.quote.report.ship.map");
				req.put("StartDate", startDate);
				req.put("EndDate", endDate);
				req.put("PolicyNo", policyNumber);
				req.put("QuoteNo", quoteNumber);
				req.put("ImoNumber", imoNumber);
				token = Token.value();
			response = callAPI(link, token, req.toString());
			JSONObject json = new JSONObject();
			JSONParser parser = new JSONParser();
			json = (JSONObject) parser.parse(response);
			saveToken(json);
			resultList = (JSONArray)json.get("ShipMapResponse");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultList;
	}


	@SuppressWarnings("unchecked")
	public List<Object> getPolicyEndorsementList(String loginId, String productId, String issuer, String menuType,
			String openCoverNo, String startDate, String endDate, String quoteNo, String policyNo, String searchBy,
			String searchValue, String searchField, String searchString, String searchOper, String branchCode,
			String userLogin, String schemeId, String vehicleId) {
		List<Object> result = new ArrayList<Object>();
		String url = getValueFromWebservice("maan.quote.report");
		link = url + "policy/endorsement";
		try {
			JSONObject req = new JSONObject();
			req.put("LoginId", loginId);
			req.put("ProductId", productId);
			req.put("ApplicationId", issuer);
			req.put("OpenCoverNo", openCoverNo);
			req.put("BranchCode", branchCode);
			token = Token.value();
			response = callAPI(link, token, req.toString());
			JSONObject json = new JSONObject();
			JSONParser parser = new JSONParser();
			json = (JSONObject) parser.parse(response);
			saveToken(json);
			result =(JSONArray) json.get("Result");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


	@SuppressWarnings("unchecked")
	public List<Object> getPolicyReporBrokertList(String loginId, String productId, String issuer, String menuType,
			String openCoverNo, String startDate, String endDate, String quoteNo, String policyNo, String searchBy,
			String searchValue, String searchField, String searchString, String searchOper, String branchCode,
			String userLogin, String schemeId, String userType) {
		
		List<Object> result = new ArrayList<Object>();
		String url = getValueFromWebservice("maan.quote.report.policybranch");
		try {
			JSONObject req = new JSONObject();
			req.put("LoginId", loginId);
			req.put("ProductId", productId);
			req.put("ApplicationId", issuer);
			req.put("UserType", userType);
			req.put("BranchCode", branchCode);
			token = Token.value();
			response = callAPI(url, token, req.toString());
			JSONParser parser = new JSONParser();
			JSONObject jo = (JSONObject) parser.parse(response);
			result =(JSONArray) jo.get("Result");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


	@SuppressWarnings("unchecked")
	public List<Object> getOpenCoverLapsedList(ReportBean bean, String userType, String loginId, String issuer) {
		List<Object> result = new ArrayList<Object>();
		String url = getValueFromWebservice("maan.quote.report.opencover.lasped");
		try {
			JSONObject json = new JSONObject();
			JSONObject req = new JSONObject();
			req.put("LoginId", loginId);
			req.put("LoginIds", bean.getUserSel());
			req.put("PolicyType", bean.getPolicyType());
			req.put("SearchOption", bean.getSearchBy());
			req.put("SearchValue", bean.getSearchValue());
			req.put("UserType", userType);
			token = Token.value();
			response = callAPI(url, token, req.toString());
			JSONParser parser = new JSONParser();
			json = (JSONObject) parser.parse(response);
			saveToken(json);
			result =(JSONArray) json.get("Result");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


	@SuppressWarnings("unchecked")
	public List<Object> getOpenCoverBrokerList(ReportBean bean, String productId, String loginId, String branchCode) {
		List<Object> result = new ArrayList<Object>();
		String url = getValueFromWebservice("maan.quote.report.opencover.broker");
		try {
			JSONObject json = new JSONObject();
			JSONObject req = new JSONObject();
			req.put("BranchCode", branchCode);
			req.put("LoginId", loginId);
			req.put("ProductId", productId);
			
			token = Token.value();
			response = callAPI(url, token, req.toString());
			JSONParser parser = new JSONParser();
			json = (JSONObject) parser.parse(response);
			saveToken(json);
			result =(JSONArray) json.get("Result");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


	@SuppressWarnings("unchecked")
	public List<Object> getOpenCoverCreatedList(ReportBean bean, String userType, String loginId, String issuer,String branchCode) {
		List<Object> result = new ArrayList<Object>();
		
		String url = getValueFromWebservice("maan.quote.report.opencover."+bean.getPolicyType());
		try {
			JSONObject json = new JSONObject();
			JSONObject req = new JSONObject();
			req.put("LoginId", loginId);
			req.put("LoginIds", bean.getUserSel());
			req.put("SearchOption", bean.getSearchBy());
			req.put("SearchValue", bean.getSearchValue());
			req.put("UserType", userType);
			req.put("BranchCode", branchCode);
			token = Token.value();
			response = callAPI(url, token, req.toString());
			JSONParser parser = new JSONParser();
			json = (JSONObject) parser.parse(response);
			saveToken(json);
			result =(JSONArray) json.get("Result");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


	@SuppressWarnings("unchecked")
	public List<Object> getOpenCoverEndorseList(ReportBean bean, String userType, String loginId, String productId,String branchCode) {
		List<Object> result = new ArrayList<Object>();
		String url = getValueFromWebservice("maan.quote.report.opencover.endorse");
		try {
			JSONObject json = new JSONObject();
			JSONObject req = new JSONObject();
			req.put("BranchCode", branchCode);
			req.put("PolicyNo", bean.getSearchPolicyNo());
			req.put("ProductId", productId);
			
			token = Token.value();
			response = callAPI(url, token, req.toString());
			JSONParser parser = new JSONParser();
			json = (JSONObject) parser.parse(response);
			saveToken(json);
			result =(JSONArray) json.get("Result");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> dashboardCharts(String key, String productId, String userType, String issuer,String loginId, String branch, String openCoverNo) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		try{
			String query = "",link="";
			Object args[] = null;
			if("quoteProd".equalsIgnoreCase(key)){
				if("rsaIssuer".equalsIgnoreCase(userType)){
					 link = getValueFromWebservice("maan.quote.report.quoteProd.issuer");
				}else if("broker".equalsIgnoreCase(userType)){
					link = getValueFromWebservice("maan.quote.report.quoteProd.broker");
				}else if("user".equalsIgnoreCase(userType)){
					link = getValueFromWebservice("maan.quote.report.quoteProd.user");
				}else if("admin".equalsIgnoreCase(userType)){
					link = getValueFromWebservice("maan.quote.report.quoteProd.admin");
				}
			}else if("policyProd".equalsIgnoreCase(key)){
				if("rsaIssuer".equalsIgnoreCase(userType)){
					link = getValueFromWebservice("maan.quote.report.policyProd.issuer");
				}else if("broker".equalsIgnoreCase(userType)){
					link = getValueFromWebservice("maan.quote.report.policyProd.broker");
				}else if("user".equalsIgnoreCase(userType)){
					link = getValueFromWebservice("maan.quote.report.policyProd.user");
				}else if("admin".equalsIgnoreCase(userType)){
					link = getValueFromWebservice("maan.quote.report.policyProd.admin");
				}
			}else if("quote".equalsIgnoreCase(key)){
				if("rsaIssuer".equalsIgnoreCase(userType)){
					link = getValueFromWebservice("maan.quote.report.quote.issuer");
				}else if("broker".equalsIgnoreCase(userType)){
					link = getValueFromWebservice("maan.quote.report.quote.broker");
				}else if("user".equalsIgnoreCase(userType)){
					link = getValueFromWebservice("maan.quote.report.quote.user");
				}else if("admin".equalsIgnoreCase(userType)){
					link = getValueFromWebservice("maan.quote.report.quote.admin");
				}
			}else if("policy".equalsIgnoreCase(key)){
				if("rsaIssuer".equalsIgnoreCase(userType)){
					link = getValueFromWebservice("maan.quote.report.policy.issuer");
				}else if("broker".equalsIgnoreCase(userType)){
					link = getValueFromWebservice("maan.quote.report.policy.broker");
				}else if("user".equalsIgnoreCase(userType)){
					link = getValueFromWebservice("maan.quote.report.policy.user");
				}else if("admin".equalsIgnoreCase(userType)){
					link = getValueFromWebservice("maan.quote.report.policy.admin");
				}
			}else if("referralPend".equalsIgnoreCase(key)){
					if("rsaIssuer".equalsIgnoreCase(userType)){
						link = getValueFromWebservice("maan.quote.report.referralpend.issuer");
					}else if("broker".equalsIgnoreCase(userType)){
						link = getValueFromWebservice("maan.quote.report.referralpend.broker");
					}else if("user".equalsIgnoreCase(userType)){
						link = getValueFromWebservice("maan.quote.report.referralpend.user");
					}else if("admin".equalsIgnoreCase(userType)){
						link = getValueFromWebservice("maan.quote.report.referralpend.admin");
					}
				
			}else if("referralComp".equalsIgnoreCase(key)){
					if("rsaIssuer".equalsIgnoreCase(userType)){
						link = getValueFromWebservice("maan.quote.report.referralcomp.issuer");
					}else if("broker".equalsIgnoreCase(userType)){
						link = getValueFromWebservice("maan.quote.report.referralcomp.broker");
					}else if("user".equalsIgnoreCase(userType)){
						link = getValueFromWebservice("maan.quote.report.referralcomp.user");
					}else if("admin".equalsIgnoreCase(userType)){
						link = getValueFromWebservice("maan.quote.report.referralcomp.admin");
					}
			}else if("referralReject".equalsIgnoreCase(key)){
				if("rsaIssuer".equalsIgnoreCase(userType)){
					link = getValueFromWebservice("maan.quote.report.referralreject.issuer");
				}else if("broker".equalsIgnoreCase(userType)){
					link = getValueFromWebservice("maan.quote.report.referralreject.broker");
				}else if("user".equalsIgnoreCase(userType)){
					link = getValueFromWebservice("maan.quote.report.referralreject.user");
				}else if("admin".equalsIgnoreCase(userType)){
					link = getValueFromWebservice("maan.quote.report.referralreject.admin");
				}
			}
			JSONObject req = new JSONObject();
			req.put("ProductId", productId);
			req.put("ApplicationId",issuer);
			req.put("BranchCode", branch);
			req.put("LoginId", loginId);
			req.put("OpenCoverNo", StringUtils.isBlank(openCoverNo)?"":openCoverNo);
			token = Token.value();
			response = callAPI(link, token, req.toString());
			JSONParser parser = new JSONParser();
			JSONObject jo = (JSONObject) parser.parse(response);
			list =(JSONArray) jo.get("Result");
		}catch(Exception e){
			logger.error("Exception @ DC ReportDAO.dashboardCharts() "+e);
			e.printStackTrace();
		}
		return list;
	}


	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> dashboardTopBroker(String productId, String loginId, String userType,String branch, String openCoverNo) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		String link="";
		try{
			if("rsaIssuer".equalsIgnoreCase(userType)){
				link = getValueFromWebservice("maan.quote.report.topbroker.issuer");
			}else if("broker".equalsIgnoreCase(userType)){
				link = getValueFromWebservice("maan.quote.report.topbroker.broker");
			}else if("admin".equalsIgnoreCase(userType)){
				link = getValueFromWebservice("maan.quote.report.topbroker.admin");
			}
			JSONObject req = new JSONObject();
			req.put("ProductId", productId);
			req.put("BranchCode", branch);
			req.put("LoginId", loginId);
			req.put("OpenCoverNo", StringUtils.isBlank(openCoverNo)?"":openCoverNo);
			token = Token.value();
			response = callAPI(link, token, req.toString());
			JSONParser parser = new JSONParser();
			JSONObject jo = (JSONObject) parser.parse(response);
			list =(JSONArray) jo.get("Result");
		}catch (Exception e) {
			logger.error("Exception @ DC ReportDAO.dashboardTopBroker() "+e);
			e.printStackTrace();
		}
		return list;
	}


	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> dashboardTopReferrals(String productId, String loginId, String userType,String branch, String openCoverNo) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		String link="";
		try{
			if("rsaIssuer".equalsIgnoreCase(userType)){
				link = getValueFromWebservice("maan.quote.report.topreferral.issuer");
			}else if("broker".equalsIgnoreCase(userType)){
				link = getValueFromWebservice("maan.quote.report.topreferral.broker");
			}else if("user".equalsIgnoreCase(userType)){
				link = getValueFromWebservice("maan.quote.report.topreferral.user");
			}else if("admin".equalsIgnoreCase(userType)){
				link = getValueFromWebservice("maan.quote.report.topreferral.admin");
			}
			JSONObject req = new JSONObject();
			req.put("ProductId", productId);
			req.put("BranchCode", branch);
			req.put("LoginId", loginId);
			req.put("OpenCoverNo", StringUtils.isBlank(openCoverNo)?"":openCoverNo);
			token = Token.value();
			response = callAPI(link, token, req.toString());
			JSONParser parser = new JSONParser();
			JSONObject jo = (JSONObject) parser.parse(response);
			list =(JSONArray) jo.get("Result");
		}catch (Exception e) {
			logger.error("Exception @ DC ReportDAO.dashboardTopReferrals() "+e);
			e.printStackTrace();
		}
		return list;
	}


	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> dashboardTopCustomer(String productId, String loginId, String userType,String branch, String openCoverNo) {
		String link="";
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		try{
			if("broker".equalsIgnoreCase(userType)){
				link = getValueFromWebservice("maan.quote.report.topcustomer.broker");
			}else if("user".equalsIgnoreCase(userType)){
				link = getValueFromWebservice("maan.quote.report.topcustomer.user");
			}
			
			JSONObject req = new JSONObject();
			req.put("ProductId", productId);
			req.put("BranchCode", branch);
			req.put("LoginId", loginId);
			req.put("OpenCoverNo", StringUtils.isBlank(openCoverNo)?"":openCoverNo);
			token = Token.value();
			response = callAPI(link, token, req.toString());
			JSONParser parser = new JSONParser();
			JSONObject jo = (JSONObject) parser.parse(response);
			list =(JSONArray) jo.get("Result");
		}catch (Exception e) {
			logger.error("Exception @ DC ReportDAO.dashboardTopCustomer() "+e);
			e.printStackTrace();
		}
		return list;
	}


	@SuppressWarnings("unchecked")
	public int activeLapsed(String quoteNo, String productId) {
		String link="";
		JSONObject json = new JSONObject();
		try{
				
			link = getValueFromWebservice("maan.quote.report.activatelapsed");
			
			JSONObject req = new JSONObject();
			req.put("QuoteNo", quoteNo);
			
			token = Token.value();
			response = callAPI(link, token, req.toString());
			JSONParser parser = new JSONParser();
			json = (JSONObject) parser.parse(response);
			saveToken(json);
		}catch (Exception e) {
			logger.error("Exception @ DC ReportDAO.activeLapsed() "+e);
			e.printStackTrace();
		}
		return 0;
	}


	@SuppressWarnings("unchecked")
	public int updateLabsed(String quoteNo, String remarks, String loginId, String productId) {
		String link="";
		JSONObject json = new JSONObject();
		try{
				
			link = getValueFromWebservice("maan.quote.report.updatelapsedresject");
			
			JSONObject req = new JSONObject();
			req.put("QuoteNo", quoteNo);
			req.put("LapsedRemarks", remarks);
			req.put("LapsedUpdatedBy", loginId);
			
			token = Token.value();
			response = callAPI(link, token, req.toString());
			JSONParser parser = new JSONParser();
			json = (JSONObject) parser.parse(response);
			saveToken(json);
		}catch (Exception e) {
			logger.error("Exception @ DC ReportDAO.updateLabsed() "+e);
			e.printStackTrace();
		}
		return 0;
	}


	@SuppressWarnings("unchecked")
	public List<Object> getLapsedQuote(String quoteNo, String productId) {
		List<Object> result = new ArrayList<Object>();
		String url = getValueFromWebservice("maan.quote.report.lapsedQuotelist");
		try {
			JSONObject json = new JSONObject();
			JSONObject req = new JSONObject();
			req.put("QuoteNo", quoteNo);
			
			token = Token.value();
			response = callAPI(url, token, req.toString());
			JSONParser parser = new JSONParser();
			json = (JSONObject) parser.parse(response);
			saveToken(json);
			result =(JSONArray) json.get("Result");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


	@SuppressWarnings("unchecked")
	public List<Object> getLapsedReason(String branchCode) {
		List<Object> result = new ArrayList<Object>();
		String url = getValueFromWebservice("maan.quote.report.lapsedReasonlist");
		try {
			JSONObject req = new JSONObject();
			req.put("BranchCode", branchCode);
			
			token = Token.value();
			response = callAPI(url, token, req.toString());
			JSONParser parser = new JSONParser();
			JSONObject jo = (JSONObject) parser.parse(response);
			result =(JSONArray) jo.get("Result");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


	@SuppressWarnings("unchecked")
	public String schedulePdf(String applicationNo, String branchCode) {
		String result="";
		JSONObject json = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			link = getValueFromWebservice("maan.marine.report.schedule");
			
			hp.put("QuoteNo", applicationNo);
			hp.put("BranchCode", branchCode);
			token = Token.value();
			String responseStr=callAPI(link, token, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				result=json.get("Result")==null?"":json.get("Result").toString(); 
				
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


	@SuppressWarnings("unchecked")
	public String debitcreditpdf(String policyNo, String docType) {
		String result="";
		JSONObject json = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			link = getValueFromWebservice("maan.marine.report.debitcredit");
			
			hp.put("PolicyNo", policyNo);
			hp.put("Type", docType);
			token = Token.value();
			String responseStr=callAPI(link, token, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				result=json.get("Result")==null?"":json.get("Result").toString(); 
				
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


	public String endtSchedule(String applicationNo, String branchCode, String policyNo, String belongingBranch) {
		String result="";
		JSONObject json = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			link = getValueFromWebservice("maan.marine.report.endtschedule");
			
			hp.put("ApplicationNo", applicationNo);
			hp.put("BranchCode", branchCode);
			hp.put("PolicyNo", policyNo);
			hp.put("BelongingBranch", belongingBranch);
			token = Token.value();
			String responseStr=callAPI(link, token, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				result=json.get("Result")==null?"":json.get("Result").toString(); 
				
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


	@SuppressWarnings("unchecked")
	public String clasuesPDF(String applicationNo, String belongingBranch) {
		String result="";
		JSONObject json = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			link = getValueFromWebservice("maan.marine.report.clauses");
			
			hp.put("QuoteNo", applicationNo);
			hp.put("BranchCode", belongingBranch);
			token = Token.value();
			String responseStr=callAPI(link, token, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				result=json.get("Result")==null?"":json.get("Result").toString(); 
				
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


	@SuppressWarnings("unchecked")
	public List<Map<String,Object>> getBasicEndtInfo(String policyNo) {
		List<Map<String,Object>> resultList=null;
		String url = getValueFromWebservice("maan.quote.report");
		link = url + "endorsement/basicinfo";
		try {
			JSONObject req = new JSONObject();
			req.put("PolicyNo", policyNo);
			token = Token.value();
			response = callAPI(link, token, req.toString());
			JSONObject json = new JSONObject();
			JSONParser parser = new JSONParser();
			json = (JSONObject) parser.parse(response);
			saveToken(json);
			resultList = (JSONArray) json.get("Result");
		}catch (Exception e) {
			e.printStackTrace();
		}
		return resultList;
	}


	@SuppressWarnings("unchecked")
	public String getCancalRemarks(String quoteNo) {
		String result="";
		String url = getValueFromWebservice("maan.quote.report");
		link = url + "endorsement/edit";
		try {
			JSONObject req = new JSONObject();
			req.put("QuoteNo", quoteNo);
			token = Token.value();
			response = callAPI(link, token, req.toString());
			JSONObject json = new JSONObject();
			JSONParser parser = new JSONParser();
			json = (JSONObject) parser.parse(response);
			saveToken(json);
			JSONObject jo=(JSONObject) json.get("Result");
			result = jo.get("EndtRemarks")==null?"":jo.get("EndtRemarks").toString();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


	@SuppressWarnings("unchecked")
	public String vehiclePDF(String policyNo, String belongingBranch) {
		String result="";
		JSONObject json = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			link = getValueFromWebservice("maan.marine.report.vehicle");
			
			hp.put("PolicyNo", policyNo);
			hp.put("BranchCode", belongingBranch);
			token = Token.value();
			String responseStr=callAPI(link, token, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				result=json.get("Result")==null?"":json.get("Result").toString(); 
				
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


	@SuppressWarnings("unchecked")
	public String PolicyReportdownload(String policyStartDate, String policyEndDate, String issuer, String downloadType,
			String loginId, String openCoverNo, String branchCode, String productId) {
		String result="";
		JSONObject json = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			link = getValueFromWebservice("maan.marine.report.policyreport");
			
			hp.put("StartDate", policyStartDate);
			hp.put("EndDate", policyEndDate);
			hp.put("BranchCode", branchCode);
			hp.put("LoginId", issuer);
			hp.put("BrokerLogin", loginId);
			hp.put("ProductId", productId);
			hp.put("OpenCoverNo", openCoverNo);
			hp.put("Type", downloadType);
			
			token = Token.value();
			String responseStr=callAPI(link, token, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				result=json.get("Result")==null?"":json.get("Result").toString(); 
				
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


	@SuppressWarnings("unchecked")
	public String declarePDF(String policyNo, String belongingBranch) {
		String result="";
		JSONObject json = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			link = getValueFromWebservice("maan.marine.report.declare");
			
			hp.put("PolicyNo", policyNo);
			hp.put("BranchCode", belongingBranch);
			token = Token.value();
			String responseStr=callAPI(link, token, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				result=json.get("Result")==null?"":json.get("Result").toString(); 
				
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


	@SuppressWarnings("unchecked")
	public String getOriginalPolicyNo(String openCoverNo) {
		String result="";
		JSONObject json = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			link = getValueFromWebservice("maan.marine.report.original.opencover");
			
			hp.put("OpenCoverNo", openCoverNo);
			token = Token.value();
			String responseStr=callAPI(link, token, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				result=json.get("Result")==null?"":json.get("Result").toString(); 
				
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


	@SuppressWarnings("unchecked")
	public String portalPDF(String applicationNo, String branchCode) {
		String result="";
		JSONObject json = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			link = getValueFromWebservice("maan.marine.report.portalpdf");
			
			hp.put("QuoteNo", applicationNo);
			hp.put("BranchCode", branchCode);
			token = Token.value();
			String responseStr=callAPI(link, token, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				result=json.get("Result")==null?"":json.get("Result").toString(); 
				
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
