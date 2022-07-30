package com.maan.common.login;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.maan.common.LogUtil;
import com.maan.common.ApiConfig.ApiConfig;
import com.maan.common.url.ApiUrl;

public class LoginApi extends ApiConfig {
	final static Logger logger = LogUtil.getLogger(LoginApi.class);
	private String loginId;
	private String password;
	private String branch;
	private String userType;
	private String region;
	String link = "";
	
	public LoginApi(String loginId, String password, String branch, String region, String userType) {
		this.loginId=loginId;
		this.password=password;
		this.branch=branch;
		this.userType=userType;
		this.region=region;
	}

	public LoginApi() {
		// TODO Auto-generated constructor stub
	}

	@SuppressWarnings("unchecked")
	public String getLoginToken(CommonBean bean) {
		List<HashMap<String, Object>> errors = new ArrayList<HashMap<String, Object>>();
		String result = "";
		String key = "login";
		link = ApiUrl.getBase() + "/login/Logincheck";
		JSONObject dropdown = new JSONObject();
		dropdown.put("UserId", loginId);
		dropdown.put("Password", password);
		dropdown.put("BranchCode", branch);
		dropdown.put("LoginType", userType);
		dropdown.put("RegionCode", region);
		logger.info(key + " Link" + dropdown.toString());
		logger.info(key + " Request" + dropdown.toString());
		String response = callAPI(key, link, "", dropdown.toString());
		logger.info(key + " Response" + dropdown.toString());
		JSONParser parser = new JSONParser();
		try {
			Object obj = parser.parse(response);
			JSONObject jo = (JSONObject) obj;
			errors = (JSONArray) jo.get("Errors");
			bean.setErrors(errors);
			jo = (JSONObject) jo.get("LoginResponse");
			if(jo!=null) {
//				result = jo.get("Token") == null ? "" : jo.get("Token").toString();
				bean.setStatus(jo.get("Status") == null ? "" : jo.get("Status").toString());
				bean.setMenuId(jo.get("MenuId") == null ? "" : jo.get("MenuId").toString());
				bean.setUserType(jo.get("UserType") == null ? "" : jo.get("UserType").toString());
				bean.setPwdMsg(jo.get("PasswordMsg") == null ? "" : jo.get("PasswordMsg").toString());
			}
		} catch (Exception e) {
			logger.info(key + " Exception @ LoginApi.getTokenDetail()" + e);
			e.printStackTrace();
		}
		return response;
	}
	
//	getChangePwd
	@SuppressWarnings("unchecked")
	public String changePassword(String loginId, String newpwd, String repwd) {
		link = ApiUrl.getBase() + "/login/LoginChangePassword";
		JSONObject obj = new JSONObject();
		obj.put("LoginId", loginId);
		obj.put("Password", newpwd);
		obj.put("RePassword", repwd);
		String response = callAPI(link, "", obj.toString());
		return response;
	}

	@SuppressWarnings({ "unchecked", "unused" })
	public void getForgotPassword(CommonBean bean) {
		List<HashMap<String, Object>> errors = new ArrayList<HashMap<String, Object>>();
		try {
			link = ApiUrl.getBase() + "/login/getForgotPassword";
			JSONObject obj = new JSONObject();
			obj.put("UserId", bean.getLoginId());
			obj.put("MailId", bean.getMailId());
			String response = callAPI(link, "", obj.toString());
			JSONParser parser = new JSONParser();
			JSONObject jo = (JSONObject) parser.parse(response);
			errors = (JSONArray) jo.get("Errors");
			bean.setErrors(errors);
			bean.setStatus(jo.get("Message").toString());
			bean.setLoginId(jo.get("LoginId").toString());

		} catch (Exception e) {
			e.printStackTrace();
		}
//		return response;
	}

	@SuppressWarnings("unchecked")
	public void checkChangePassword(CommonBean bean) {
		List<HashMap<String, Object>> errors = new ArrayList<HashMap<String, Object>>();
		try {
			link = ApiUrl.getBase() + "/login/CheckChangePassword";
			JSONObject obj = new JSONObject();
			obj.put("BranchCode", bean.getBranch());
			obj.put("LoginType", bean.getLoginType());
			obj.put("Password", bean.getPwd());
			obj.put("RegionCode", bean.getRegion());
			obj.put("UserId", bean.getLoginId());

			String response = callAPI(link, "", obj.toString());
			JSONParser parser = new JSONParser();
			JSONObject jo = (JSONObject) parser.parse(response);
			errors = (JSONArray) jo.get("Errors");
			bean.setErrors(errors);
			bean.setStatus(jo.get("Message") == null ? "" : jo.get("Message").toString());
			bean.setLoginId(jo.get("LoginId") == null ? "" : jo.get("LoginId").toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getRegionList() {
		List<Map<String, Object>> resultList = null;
		try {
			link = ApiUrl.getBase() + "/admin/region/list";
			String response = callAPIGet(link, "");
			JSONParser parser = new JSONParser();
			JSONObject jo = (JSONObject) parser.parse(response);
			resultList =(JSONArray) jo.get("Result");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultList;
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getBranchList(String regionCode) {
		List<Map<String, Object>> resultList = null;
		try {
			link = ApiUrl.getBase() + "/login/getBranchDetail";
			JSONObject obj = new JSONObject();
			obj.put("RegionCode", regionCode);
			String response = callAPI(link, "",obj.toString());
			JSONParser parser = new JSONParser();
			resultList = (JSONArray) parser.parse(response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultList;
	}

}
