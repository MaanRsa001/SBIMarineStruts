package com.maan.copyquote;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.maan.common.LogUtil;
import com.maan.common.Token;
import com.maan.common.ApiConfig.ApiConfig;
import com.maan.common.util.StringUtil;
import com.maan.quotation.model.DefaultValue;
import com.maan.report.api.ReportApiCaller;
import com.opensymphony.xwork2.ActionContext;

public class CopyQuoteApiCaller extends ApiConfig {
	final static Logger logger = LogUtil.getLogger(ReportApiCaller.class);
	static ResourceBundle bundle = ResourceBundle.getBundle("webservice");
	private String apiURL = getValueFromWebservice("maan.quote.report.drop");
	private String tokenURL = getValueFromWebservice("maan.marine.opencover.link");
//	private String auth = getValueFromWebservice("maan.marine.auth");
	HttpServletRequest request = ServletActionContext.getRequest();
	Map<String, Object> session = ActionContext.getContext().getSession();
	String response = "", link = "", token = "";

	public CopyQuoteApiCaller(){
		try {
			token = session.get("TOKEN_SPRING").toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (StringUtil.isBlankOrNull(token)) {
			token = getTokenDetail();
			if (token != null)
				session.put("TOKEN_SPRING", token);
		}
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
	public List<Object> getCopyQuoteSearch(String type, String value, String openCoverNo, String productId, String issuer, String loginID,String branchCode) {
		List<Object> resultList = new ArrayList<Object>();
		List<Map<String, Object>> result = null;
		String url = getValueFromWebservice("maan.quote.report");
		try {
			
			JSONObject req = new JSONObject();
			req.put("LoginId", loginID);
			req.put("ProductId", productId);
			req.put("Issuer", issuer);
			req.put("OpenCoverNo", openCoverNo);
			req.put("SearchValue", value);
			req.put("SearchBy", type);
			//req.put("UserType", userType);
			req.put("BranchCode", branchCode);
			
			
			link = url + "search/results";
			response = callAPI(link, token, req.toString());
			JSONObject json = new JSONObject();
			JSONParser parser = new JSONParser();
			json = (JSONObject) parser.parse(response);
			saveToken(json);
			result = (JSONArray) json.get("Result");
			if (result.size() > 0) {
				for (int i = 0; i < result.size(); i++) {
					Map<String, Object> tempReturn = new HashMap<String, Object>();
					tempReturn.put("QUOTE_NO", result.get(i).get("QuoteNo").toString());
					tempReturn.put("FIRST_NAME", result.get(i).get("CustomerName").toString());
					tempReturn.put("PREMIUM", result.get(i).get("Premium").toString());
					resultList.add(tempReturn);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultList;
	}
	@SuppressWarnings("unchecked")
	public Map<String, Object> copyQuote(String loginId, String quoteNo, String type, String typeId, String issuer) {
//		List<Object> resultList = new ArrayList<Object>();
		Map<String, Object> result = new HashMap<String, Object>();
		String url = getValueFromWebservice("maan.quote.report");
		link = url + "copyquote";
		try {
			JSONObject req = new JSONObject();
			req.put("PvType", type);
			req.put("LoginId", loginId);
			req.put("ApplicationId", issuer);
			req.put("CopyQuoteValue", quoteNo);
			token=session.get("TOKEN_SPRING").toString();
			response = callAPI(link, token, req.toString());
			JSONObject json = new JSONObject();
			JSONParser parser = new JSONParser();
			json = (JSONObject) parser.parse(response);
			saveToken(json);
			String msg = (String) json.get("Result").toString();
			
			result.put("message", msg);
			//result.put("desc", statusDescription); 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
}
