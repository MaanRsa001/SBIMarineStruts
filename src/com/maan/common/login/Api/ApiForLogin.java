package com.maan.common.login.Api;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Callable;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.maan.NewOpenCover.OpenCoverBean;
import com.maan.common.LogUtil;
import com.maan.common.ApiConfig.ApiConfig;
import com.maan.common.login.CommonBean;
import com.opensymphony.xwork2.ActionContext;


public class ApiForLogin extends ApiConfig implements Callable<Object>{
	Map<String, Object> session=ActionContext.getContext().getSession();
	final static Logger logger = LogUtil.getLogger(ApiForLogin.class);
	private CommonBean bean;
	private String requestfor;
	public ApiForLogin(CommonBean bean,String requestfor) {
		this.bean=bean;
		this.requestfor=requestfor.toLowerCase();
	}
	
	@Override
	public Object call() throws Exception {
		return null;
	}
	@SuppressWarnings("unchecked")
	public String getTokenDetail(CommonBean bean) {
		String result="";
		String link=getValueFromWebservice("maan.marine.login."+requestfor);
		
		JSONObject dropdown = new JSONObject();
		dropdown.put("UserId", bean.getLoginId());
		dropdown.put("Password",  bean.getPwd());
		dropdown.put("BranchCode", bean.getBranch());
		dropdown.put("LoginType",  bean.getUserType());
		
	
		logger.info("GET getOptionsList Json===>" + dropdown.toString());
		String response = callAPI(link, "", dropdown.toString());
		JSONParser parser = new JSONParser();
		
		try {
			Object obj = parser.parse(response);
			JSONObject jo = (JSONObject) obj;
			result=jo.get("token")==null?"":jo.get("token").toString();
			
		} catch (Exception e) {
			logger.info("EXCEPTION WHILE getTokenDetail" + e);
			e.printStackTrace();
			
		}
		return result;
	}
	
	
}
