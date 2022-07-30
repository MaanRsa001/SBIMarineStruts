package com.maan.verifyPdf;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;

import org.apache.logging.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.google.gson.Gson;
import com.maan.common.LogUtil;
import com.maan.common.Token;
import com.maan.common.ApiConfig.ApiConfig;
import com.maan.quotation.model.DefaultValue;
import com.maan.report.api.ReportApiCaller;

public class VerifyApiCaller extends ApiConfig {
	final static Logger logger = LogUtil.getLogger(ReportApiCaller.class);
	static ResourceBundle bundle = ResourceBundle.getBundle("webservice");
	String response = "", link = "", token = "";
	Gson jsonConvertor = new Gson();
	
	public String getApiToken() {
		return Token.value();
	}
	
	
	private void saveToken(JSONObject json) {
		try {
			if(json!=null) {
				JSONObject dvo = (JSONObject) json.get("DefaultValue");
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
	public List<Map<String, Object>> getQuoteList(VerifyPdfBean bean) {
		List<Map<String, Object>> resultList=new ArrayList<Map<String,Object>>();
		JSONObject req = new JSONObject();
		try {
			link = getValueFromWebservice("maan.quote.verify.policy");
			req.put("VerifyCode", bean.getCode());
			req.put("PolicyNo", bean.getPolicyNo());
			
			token = Token.value();
			response = callAPI(link, token, req.toString());
			JSONObject json = new JSONObject();
			JSONParser parser = new JSONParser();
			json = (JSONObject) parser.parse(response);
			saveToken(json);
			bean.setErrors((JSONArray) json.get("Errors"));
			resultList = (JSONArray)json.get("VerfiyPolicyResponse");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultList;
	}
}
