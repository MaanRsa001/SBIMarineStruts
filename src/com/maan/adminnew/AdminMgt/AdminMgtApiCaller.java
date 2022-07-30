package com.maan.adminnew.AdminMgt;

import java.util.Arrays;
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
import com.maan.quotation.model.DefaultValue;
import com.opensymphony.xwork2.ActionContext;

public class AdminMgtApiCaller extends ApiConfig {

	final static Logger logger = LogUtil.getLogger(AdminMgtApiCaller.class);
	static ResourceBundle bundle = ResourceBundle.getBundle("webservice");
	HttpServletRequest request = ServletActionContext.getRequest();
	Map<String, Object> session = ActionContext.getContext().getSession();
	String response = "", link = "", token = "";

	
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
	
	public AdminMgtApiCaller() {
		token = session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString();
	}

	@SuppressWarnings("unchecked")
	public List<Object> getAdminList(AdminMgtBean bean, String branchCode, String appId) {
		List<Object> result = null;
		try {
			link = getValueFromWebservice("maan.admin.adminmgt.list");
			JSONObject req = new JSONObject();
			req.put("BranchCode", branchCode);
			response = callAPI(link, token, req.toString());
			JSONObject json = new JSONObject();
			JSONParser parser = new JSONParser();
			json = (JSONObject) parser.parse(response);
			saveToken(json);
			result = (JSONArray) json.get("Result");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public List<Object> getAdminEditInfo(AdminMgtBean bean, String branchCode, String appId) {
		List<Object> result = null;
		try {
			link = getValueFromWebservice("maan.admin.adminmgt.edit");
			JSONObject req = new JSONObject();
			req.put("BranchCode", branchCode);
			req.put("LoginId", bean.getLoginID());
			response = callAPI(link, token, req.toString());
			JSONObject json = new JSONObject();
			JSONParser parser = new JSONParser();
			json = (JSONObject) parser.parse(response);
			saveToken(json);
			result = (JSONArray) json.get("Result");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public void insertNewAdmin(AdminMgtBean bean, String branchCode, String appId) {
		List<Map<String , Object>> error = null;
		JSONArray prodArr = new JSONArray();
		JSONArray uwArr = new JSONArray();
		JSONArray brokerArr = new JSONArray();
		JSONArray menuArr = new JSONArray();
		JSONArray attachedArr = new JSONArray();
//		List<String>product = bean.getProductID();
		try {
			link = getValueFromWebservice("maan.admin.adminmgt.insert");
			JSONObject req = new JSONObject();
			token = session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString();
			List<String> attachedBranchCode = Arrays.asList(bean.getBranchId().split(","));
			List<String> brokerCode = Arrays.asList(bean.getBroker().split(","));
			List<String> menuId = Arrays.asList(bean.getMid().split(","));
			req.put("LoginId", bean.getLoginID());
			req.put("Password", bean.getPwd());
			req.put("UserType", bean.getUtype());
			req.put("UserName", bean.getUname());
			req.put("RegionCode", bean.getRegionCode());
			req.put("BranchCode", bean.getBranchCodeS());
			if(menuId!=null) {
			for (int i = 0; i < menuId.size(); i++) {
				JSONObject obj = new JSONObject();
				obj.put("MenuId", menuId.get(i));
				menuArr.add(obj);
			}
			}
			req.put("MenuInfo", menuArr);
			if(bean.getProductID()!=null) {
			for (int i = 0; i < bean.getProductID().length; i++) {
				JSONObject obj = new JSONObject();
				obj.put("ProductId", bean.getProductID()[i]);
				prodArr.add(obj);
			}
			}
			req.put("ProductInfo", prodArr);
			if(brokerCode!=null) {
			for (int i = 0; i < brokerCode.size(); i++) {
				JSONObject obj = new JSONObject();
				obj.put("BrokerCode", brokerCode.get(i));
				brokerArr.add(obj);
			}
			}
			req.put("BrokerInfo", brokerArr);
			req.put("Email", bean.getEmail());
			if(bean.getUwgrade()!=null) {
			for (int i = 0; i < bean.getUwgrade().length; i++) {
				JSONObject obj = new JSONObject();
				obj.put("UnderWriter", bean.getUwgrade()[i]);
				uwArr.add(obj);
			}
			}
			req.put("UnderWriterInfo", uwArr);
			if(attachedBranchCode!=null) {
			for (int i = 0; i < attachedBranchCode.size(); i++) {
				JSONObject obj = new JSONObject();
				obj.put("AttachedBranchId", attachedBranchCode.get(i));
				attachedArr.add(obj);
			}
			}
			req.put("AttachedBranchInfo", attachedArr);
			req.put("Mode", bean.getMode());
			req.put("Status", bean.getStatus());
			logger.info(req.toString());
			response = callAPI(link, token, req.toString());
			JSONObject json = new JSONObject();
			JSONParser parser = new JSONParser();
			json = (JSONObject) parser.parse(response);
			bean.setErrors((JSONArray)json.get("Errors"));
			//bean.setErrors(error);
			saveToken(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, String>> getUnderWriterGrade() {
		List<Map<String, String>> result = null;
		try {
			link = getValueFromWebservice("maan.admin.adminmgt.uwgrade");
			token = session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString();
			response = callAPIGet(link, token);
			JSONParser parser = new JSONParser();
			JSONObject jo= (JSONObject) parser.parse(response);
			result = (JSONArray)jo.get("Result");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public Map<String, List<Object>> getProductWiseMenuList(AdminMgtBean bean, String branchCode) {
		Map<String, List<Object>> result = new HashMap<String, List<Object>>();
		JSONArray jsonArr = new JSONArray();
		try {
			link = getValueFromWebservice("maan.admin.adminmgt.menuList");
			JSONObject req = new JSONObject();
			req.put("BranchCode", branchCode);
			String[] product = bean.getSelProducts().split(",");
			JSONArray productArr = new JSONArray();

			for (int i = 0; i < product.length; i++) {
				JSONObject obj = new JSONObject();
				obj.put("ProductId", product[i]);
				productArr.add(obj);
			}
			req.put("ProductInfo", productArr);
			token = session.get("TOKEN_SPRING") == null ? "" : session.get("TOKEN_SPRING").toString();
			response = callAPI(link, token , req.toString());
			JSONObject json = new JSONObject();
			JSONParser parser = new JSONParser();
			json = (JSONObject) parser.parse(response);
			jsonArr =(JSONArray)json.get("Result");
			 for (int i = 0; i < jsonArr.size(); i++) {
				 json =(JSONObject) jsonArr.get(i);
				 List<Object> value= (JSONArray) json.get("MenuInfo");
				 result.put(json.get("ProductName").toString(), value);	
			 } 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public List<Object> getMenuList(String menuid, String belongingBranch, String product) {
		List<Object> result = null;
		JSONObject req = new JSONObject();
		
		JSONArray arr1 = new JSONArray();
		try {
			link = getValueFromWebservice("maan.admin.menu.list");
			String[]menuId=menuid.split(",");
			for(int i =0;i<menuId.length;i++) {
				JSONObject jsonr = new JSONObject();
				jsonr.put("MenuId", menuId[i]);
				arr1.add(jsonr);
			}
			
			req.put("BranchCode", belongingBranch);
			req.put("ProductId", product);
			req.put("MenuInfo", arr1);
			token = session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString();
			response = callAPI(link, token,req.toString());
			JSONParser parser = new JSONParser();
			JSONObject json =  (JSONObject) parser.parse(response);
			result =(JSONArray) json.get("Result");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public List<Object> UtypeList(String branchCode, String appId) {
		List<Object> result = null;
		JSONObject req = new JSONObject();
		
		try {
			link = getValueFromWebservice("maan.admin.adminmgt.usertypelist");
			
			req.put("BranchCode", branchCode);
			req.put("ApplicationId", appId);
			token = session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString();
			response = callAPI(link, token,req.toString());
			JSONParser parser = new JSONParser();
			JSONObject jo= (JSONObject) parser.parse(response);
			result = (JSONArray)jo.get("Result");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
}
