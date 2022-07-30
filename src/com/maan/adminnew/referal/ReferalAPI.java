package com.maan.adminnew.referal;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.maan.common.LogUtil;
import com.maan.common.Token;
import com.maan.common.ApiConfig.ApiConfig;
import com.maan.quotation.model.DefaultValue;
import com.opensymphony.xwork2.ActionContext;

public class ReferalAPI extends ApiConfig {

	String link="",response="",token="";
	final static Logger logger = LogUtil.getLogger(ReferalAPI.class);
	private String tokenURL = getValueFromWebservice("maan.marine.opencover.link");
	
	HttpServletRequest request = ServletActionContext.getRequest();
	Map<String, Object> session = ActionContext.getContext().getSession();
	
	public ReferalAPI(){
		token = session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString();
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
	public List<Object> getOcListApi(String reqFrom, String productID, String branchId, String agencyCode,
			String login_id, String attched_Branch) {
		List<Object>resultList= new ArrayList<Object>();
		if("approved".equalsIgnoreCase(reqFrom)) {
			link = getValueFromWebservice("maan.admin.referral.approved");
		}else if("pending".equalsIgnoreCase(reqFrom)) {
			link = getValueFromWebservice("maan.admin.referral.pending");
		}else {
			link = getValueFromWebservice("maan.admin.referral.rejected");
		}
		try {
			JSONObject req = new JSONObject();
			req.put("LoginId", login_id);
			req.put("ProductId", productID);
			req.put("BranchCode", branchId);
			response = callAPI(link, token, req.toString());
			JSONParser parser = new JSONParser();
			JSONObject json = new JSONObject();
			json =(JSONObject) parser.parse(response);
			saveToken(json);
			resultList = (JSONArray)json.get("Result");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return resultList;
	}

	@SuppressWarnings("unchecked")
	public List<Object> getSearchReferalAPI(String branchId, String searchQuote, String productID) {
		List<Object> resultList = new ArrayList<Object>();
		Map<String, Object> map = new HashMap<>();
		link = getValueFromWebservice("maan.admin.referral.searchQuote");
		try {
			JSONObject req = new JSONObject();
			req.put("QuoteNo", searchQuote);
			response = callAPI(link, token, req.toString());
			JSONParser parser = new JSONParser();
			JSONObject json = new JSONObject();
			json = (JSONObject) parser.parse(response);
			saveToken(json);
			json = (JSONObject) json.get("Result");
			map.put("QUOTE_CREATED", json.get("QuoteCreated") == null ? "" : json.get("QuoteCreated").toString());
			map.put("APPLICATION_NO", json.get("ApplicationNo") == null ? "" : json.get("ApplicationNo").toString());
			map.put("LOGIN_ID", json.get("LoginId") == null ? "" : json.get("LoginId").toString());
			map.put("QUOTE_NO", json.get("QuoteNo") == null ? "" : json.get("QuoteNo").toString());
			map.put("REMARKS", json.get("Remarks") == null ? "" : json.get("Remarks").toString());
			map.put("APPLICATION_ID", json.get("ApplicationId") == null ? "" : json.get("ApplicationId").toString());
			map.put("STATUS", json.get("Status") == null ? "" : json.get("Status").toString());
			map.put("CUSTOMER_ID", json.get("CustomerId") == null ? "" : json.get("CustomerId").toString());
			map.put("CUST_NAME", json.get("CustomerName") == null ? "" : json.get("CustomerName").toString());
			map.put("BROKERNAME", json.get("BrokerName") == null ? "" : json.get("BrokerName").toString());
			map.put("PRODUCT_ID", json.get("ProductId") == null ? "" : json.get("ProductId").toString());
			resultList.add(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultList;
	}
	
	
}
