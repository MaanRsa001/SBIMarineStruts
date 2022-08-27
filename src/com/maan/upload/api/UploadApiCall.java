package com.maan.upload.api;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.google.gson.Gson;
import com.maan.common.LogUtil;
import com.maan.common.Token;
import com.maan.common.ApiConfig.ApiConfig;
import com.maan.common.url.ApiUrl;
import com.maan.quotation.DeclarationAction;
import com.maan.quotation.model.DefaultValue;
import com.maan.quotation.model.MovementResponse;
import com.maan.quotation.model.QuotationResponse;
import com.opensymphony.xwork2.ActionContext;



public class UploadApiCall extends ApiConfig {
	Map<String, Object> session=ActionContext.getContext().getSession();
	final static Logger logger = LogUtil.getLogger(UploadApiCall.class);
	Gson jsonConvertor = new Gson();
	
	public String getApiToken() {
		return Token.value();
	}

	@SuppressWarnings("unchecked")
	public JSONObject policyGeneration(DeclarationAction bean) {
		JSONParser parser = new JSONParser();
		JSONObject jo=null;
		String jsonResponse ="";
		try {
			JSONObject obj = new JSONObject();
			obj.put("BranchCode", bean.getBranchCode());
			obj.put("CurrencyID", "");
			obj.put("CurrencyValue", "");
			obj.put("DebitCustomerID", "");
			obj.put("DeclarationMonth", bean.getMonthOfDeclaration());
			obj.put("DeclarationYear", bean.getYearVal());
			obj.put("DeclaredPolicy", bean.getDeclaredPolicy());
			obj.put("GeneratePolicy", bean.getGeneratePolicy());
			obj.put("Issuer", bean.getIssuer());
			obj.put("LoginID", bean.getLoginId());
			obj.put("MenuType", bean.getMenuType());
			obj.put("NoteType", bean.getNoteType());
			obj.put("OpenCoverNo", bean.getOpenCoverNo());
			obj.put("PaymentMode", bean.getPaymentMode());
			obj.put("PolicyStartDate", bean.getPolicyStartDate());
			obj.put("ProductID", bean.getProductId());
			obj.put("RubberStamp", bean.getRubberStamp());
			obj.put("TotalPremium", bean.getTotalPremium());
			
			List<String> quotes = new ArrayList<String>();
			String[] quote = bean.getSelectedAllQuote().split(",");
			if(quote.length>0) {
				for(String q:quote) {
					quotes.add(q);
				}
			}
			obj.put("SelectedQuote", quotes);
			List<Map<String,Object>> dueDetails = new ArrayList<Map<String,Object>>();
			if (bean.getDueList().size() > 0) {
				for (int i = 0; i < bean.getDueList().size(); i++) {
					Map<String, Object> tempDue = new HashMap<>();
					tempDue.put("DueAmount", bean.getDueamount()==null?"":(bean.getDueamount().get(i)==null?"":bean.getDueamount().get(i)));
					tempDue.put("DueDate",  bean.getDueDate()==null?"":(bean.getDueDate().get(i)==null?"":bean.getDueDate().get(i)));
					tempDue.put("DuePercent", bean.getDuepercent()==null?"":(bean.getDuepercent().get(i)==null?"":bean.getDuepercent().get(i)));
					tempDue.put("EffectiveDate", bean.getEffectiveDatePT()==null?"":(bean.getEffectiveDatePT().get(i)==null?"":bean.getEffectiveDatePT().get(i)));
					dueDetails.add(tempDue);
				}
			}
			obj.put("DueDetails", dueDetails);
			jsonResponse = callAPI("DeclarationPolicyGeneration", ApiUrl.getPolicyGeneration(), getApiToken(), obj.toJSONString());
			jo = (JSONObject)parser.parse(jsonResponse);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return jo;
	}

	@SuppressWarnings("unchecked")
	public List<Object> getDeclarationList(String option, String reqFrom, String[] args) {
		List<Object> resultList = null;
		JSONObject obj = new JSONObject();
		String jsonResponse = "";
		JSONParser parser = new JSONParser();
		JSONObject jo = null;
		try {
			if ("C".equalsIgnoreCase(option)) {
				obj.put("OpenCoverNo", args[0]);
				obj.put("Broker", args[1]);
				jsonResponse = callAPI("certificateList", ApiUrl.getDeclCertificateList(), getApiToken(), obj.toJSONString());
			} else if ("D".equalsIgnoreCase(option)) {
				obj.put("OpenCoverNo", args[0]);
				jsonResponse = callAPI("declTransactionList", ApiUrl.getDeclTransactionList(), getApiToken(), obj.toJSONString());
			}
			else if("DE".equalsIgnoreCase(option)) {
				obj.put("LoginID", args[0]);
				obj.put("ProductID", args[1]);
				obj.put("ApplicationID", args[2]);
				obj.put("OpenCoverNo", args[3]);
				jsonResponse = callAPI("declMenuList", ApiUrl.getDeclMenuList(), getApiToken(), obj.toJSONString());
			}
			resultList = (JSONArray) parser.parse(jsonResponse);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultList;
	}

	@SuppressWarnings("unchecked")
	public List<Object> getTransactionList(String openCoverNo, String issuerId) {
		List<Object> resultList = null;
		JSONObject obj = new JSONObject();
		String jsonResponse = "";
		JSONParser parser = new JSONParser();
		try {
			obj.put("IssuerID", issuerId);
			obj.put("OpenCoverNo", openCoverNo);
			jsonResponse = callAPI("uploadTransaction", ApiUrl.getUploadTransactionList(), getApiToken(),obj.toJSONString());
			resultList = (JSONArray) parser.parse(jsonResponse);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultList;
	}
	@SuppressWarnings("unchecked")
	public List<Object> getUploadedList(String tranId) {
		List<Object> resultList = null;
		JSONObject obj = new JSONObject();
		String jsonResponse = "";
		JSONParser parser = new JSONParser();
		try {
			obj.put("TranId", tranId);
			jsonResponse = callAPI("uploadedList", ApiUrl.getUploadedList(), getApiToken(),obj.toJSONString());
			resultList = (JSONArray) parser.parse(jsonResponse);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultList;
	}

	@SuppressWarnings("unchecked")
	public List<Object> getErrorList(String tranId) {
		List<Object> resultList = null;
		JSONObject obj = new JSONObject();
		String jsonResponse = "";
		JSONParser parser = new JSONParser();
		try {
			obj.put("TranId", tranId);
			jsonResponse = callAPI("errorList", ApiUrl.getErrorList(), getApiToken(),obj.toJSONString());
			resultList = (JSONArray) parser.parse(jsonResponse);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultList;
	}

	@SuppressWarnings("unchecked")
	public void processRecords(String tranId, String loginId, String openCoverNo, String branchCode, String issuer, String productId, String brokerCode) {
		JSONObject obj = new JSONObject();
		MovementResponse qs=new MovementResponse();
		String jsonResponse = "";
		try {
			obj.put("TranId", tranId);
			obj.put("OpenCoverNo", openCoverNo);
			obj.put("BrokerCode", brokerCode);
			obj.put("LoginId", loginId);
			obj.put("ProductId", productId);
			obj.put("BranchCode", branchCode);
			obj.put("Issuer", issuer);
			
			jsonResponse = callAPI("processRecord", ApiUrl.getProcessRecords(), getApiToken(),obj.toJSONString());
			qs = jsonConvertor.fromJson(jsonResponse, MovementResponse.class);
			DefaultValue dv = qs.getDefaultValue();
			Token.save(dv);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	

	@SuppressWarnings("unchecked")
	public void getDeclarationQuote(DeclarationAction bean) {
		JSONObject obj = new JSONObject();
		JSONObject json = null;
		JSONObject jo = null;
		JSONParser parser = new JSONParser();
		String responseStr = "";
		try {
			obj.put("SelectedQuotes", bean.getSelectedAllQuote());
			
			responseStr = callAPI("declarationQuote", ApiUrl.getDeclarationQuote(), getApiToken(),obj.toJSONString());
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				jo = (JSONObject) json.get("DefaultValue");
				saveToken(json);
				bean.setPolicyList( (JSONArray) json.get("QuoteList"));
				bean.setTotalPremium(json.get("TotalPremium")==null?"":json.get("TotalPremium").toString());
				bean.setVatTax(json.get("VatTax")==null?"":json.get("VatTax").toString());
				bean.setVatPercent(json.get("VatPercent")==null?"":json.get("VatPercent").toString());
				bean.setPolicyfee(json.get("PolicyFee")==null?"":json.get("PolicyFee").toString());
				bean.setErrors((JSONArray) json.get("ErrorMessage"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	private void saveToken(JSONObject json) {
		try {
			if (json != null) {
				JSONObject dvo = (JSONObject) json.get("DefaultValue");
				if (dvo != null) {
					DefaultValue dv = new DefaultValue();
					dv.setToken(dvo.get("Token") == null ? "" : dvo.get("Token").toString());
					Token.save(dv);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@SuppressWarnings("unchecked")
	public List<Object> getDeclarationQuoteList(String selectedAllQuote) {
		List<Object> resultList = null;
		JSONObject obj = new JSONObject();
		String jsonResponse = "";
		JSONParser parser = new JSONParser();
		try {
			obj.put("SelectedQuotes", selectedAllQuote);
			jsonResponse = callAPI("declartaionQuote", ApiUrl.getDeclarationQuoteList(), getApiToken(),obj.toJSONString());
			resultList = (JSONArray) parser.parse(jsonResponse);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultList;
	}
}
