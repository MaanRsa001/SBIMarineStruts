package com.maan.adminnew.userManagement;

import java.util.ArrayList;
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

public class userMgtApiCaller extends ApiConfig {

	final static Logger logger = LogUtil.getLogger(userMgtApiCaller.class);
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
	
	public userMgtApiCaller(){
		token = session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString();
	}

	@SuppressWarnings("unchecked")
	public List<Object> getAdminUserList(UserMgtBean ba, String agencyCode, String mode1, String branchCode) {
		List<Object> result = new ArrayList<Object>();
		try {
			link = getValueFromWebservice("maan.admin.user.list");
			JSONObject req = new JSONObject();
			req.put("BranchCode", branchCode);
			token = session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString();
			response = callAPI(link, token, req.toJSONString());
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
	public List getUserDetails(UserMgtBean ba, String uagencyCode) {
		List<Object> result = new ArrayList<Object>();
		try {
			link = getValueFromWebservice("maan.admin.user.edit");
			JSONObject req = new JSONObject();
			req.put("AgencyCode", uagencyCode);
			token = session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString();
			response = callAPI(link, token, req.toJSONString());
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
	public void newUserInsertOrUpdate(UserMgtBean bean,String branchCode) {
		try {
			link = getValueFromWebservice("maan.admin.user.insert");
			JSONObject req = new JSONObject();
			
			req.put("CustomerId", bean.getCustomerId());
			req.put("Title", bean.getUtitle());
			req.put("BranchCode", branchCode);
			req.put("AgencyCode", bean.getBroker());
			req.put("CustFirstName", bean.getUfirstname());
			req.put("CustLastName", bean.getUlastname());
			req.put("Nationality", bean.getUnationality());
			req.put("DateOfBirth", bean.getUdob());
			req.put("Gender", bean.getUgender());
			req.put("TelephoneNo", bean.getUphone());
			req.put("MobileNo", bean.getUmobile());
			req.put("Fax", bean.getUfax());
			req.put("Email", bean.getUemail());
			req.put("Address1", bean.getUaddress1());
			req.put("Address2", bean.getUaddress2());
			req.put("Occupation", bean.getUoccupation());
			req.put("PoBox", bean.getUpobox());
			req.put("Country", bean.getUcountry());
			req.put("City", bean.getUcity());
			req.put("LoginId", bean.getUserId());
			req.put("Password", bean.getPassword());
			req.put("RePassword", bean.getRepassword());
			req.put("Status", bean.getUstatus());
			req.put("UserAgencyCode", bean.getUagencyCode());
			req.put("SubBranch", bean.getBroLinkLoc());
			req.put("Mode", bean.getMode());
			req.put("UserType", "User");
			
			logger.info(req.toString());
			token = session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString();
			response = callAPI(link, token, req.toString());
			if(response!=null) {
				JSONObject json = new JSONObject();
				JSONParser parser = new JSONParser();
				json = (JSONObject) parser.parse(response);
				saveToken(json);
				bean.setErrors((JSONArray) json.get("Errors"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	@SuppressWarnings("unchecked")
	public List<Object> getCommissionData(String uagencyCode, String agencyCode, String branchCode) {
		List<Object> result = new ArrayList<Object>();
		List<Map<String , Object>> res = new ArrayList<Map<String,Object>>();
		Map<String,Object> map = new HashMap<String, Object>();
		try {
			link = getValueFromWebservice("maan.admin.user.product.edit");
			JSONObject req = new JSONObject();
			req.put("BranchCode", branchCode);
			req.put("AgencyCode", agencyCode);
			req.put("UserAgencyCode", uagencyCode);
			token = session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString();
			response = callAPI(link, token, req.toString());
			JSONObject json = new JSONObject();
			JSONParser parser = new JSONParser();
			json = (JSONObject) parser.parse(response);
			saveToken(json);
			JSONObject jo=(JSONObject) json.get("Result");
			res = (JSONArray) jo.get("CommisionResponse");
			if(res!=null && res.size()>0) {
				for (int i = 0; i < res.size(); i++) {
					Map<String,Object> tempMap = new HashMap<String, Object>();
					map = res.get(i);
					tempMap.put("open_cover_no", map.get("OpenCoverNo")==null?"":map.get("OpenCoverNo").toString());
					tempMap.put("receipt", map.get("Receipt")==null?"":map.get("Receipt").toString());
					tempMap.put("uproductName", map.get("ProductName")==null?"":map.get("ProductName").toString());
					tempMap.put("PRODUCT", map.get("ProductYN")==null?"":map.get("ProductYN").toString());
					tempMap.put("insEndLimit", map.get("InsuranceEndLimit")==null?"":map.get("InsuranceEndLimit").toString());
					tempMap.put("specialDis", map.get("SpecialDiscount")==null?"":map.get("SpecialDiscount").toString());
					tempMap.put("uproductId",map.get("ProductId")==null?"": map.get("ProductId").toString());
					tempMap.put("freight", map.get("Freight")==null?"":map.get("Freight").toString());
					result.add(tempMap);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public void setPassword(UserMgtBean bean) {
		try {
			link = getValueFromWebservice("maan.admin.user.password");
			JSONObject req = new JSONObject();
			
			req.put("AgencyCode", bean.getUagencyCode());
			req.put("Password", bean.getPassword());
			req.put("RePassword", bean.getRepassword());
			
			token = session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString();
			response = callAPI(link, token, req.toString());
			JSONObject json = new JSONObject();
			JSONParser parser = new JSONParser();
			json = (JSONObject) parser.parse(response);
			saveToken(json);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void addProduct(UserMgtBean bean, List<Object> comm) {
		JSONArray openCovArr = new JSONArray();
		try {
			link = getValueFromWebservice("maan.admin.user.product.insert");
			JSONObject req = new JSONObject();
			List<Map<String,Object>> productInfo = new ArrayList<>();
			
			for(int i=0;i<comm.size() ;i++) {
				Map<String,Object> data = new HashMap<String, Object>();
				Map map = (Map) comm.get(i);
				data.put("InsuranceEndLimit", map.get("insEndLimit")==null?"":map.get("insEndLimit").toString());
				data.put("PayReceipt", map.get("receipt")==null?"":map.get("receipt").toString());
				data.put("ProductId", map.get("uproductId")==null?"":map.get("uproductId").toString());
				data.put("ProductYN", map.get("product")==null?"":map.get("product").toString());
				data.put("SpecialDiscount", map.get("specialDis")==null?"":map.get("specialDis").toString());
				data.put("UserFreight", map.get("freight")==null?"":map.get("freight").toString());
				if("3".equalsIgnoreCase(map.get("uproductId").toString())) {
					data.put("ProductName", "ONE OFF POLICY");
				}else {
					data.put("ProductName", "OPEN COVER");
				}
				productInfo.add(data);
			}
			req.put("AgencyCode", bean.getAgencyCode());
			req.put("CustomerName", bean.getUfirstname());
			
			List<String> openCoverList = Arrays.asList(bean.getOpenCover().split(","));
			for (int i = 0; i < openCoverList.size(); i++) {
				JSONObject obj = new JSONObject();
				obj.put("OpenCoverNo", openCoverList.get(i));
				openCovArr.add(obj);
			}
			req.put("OpenCoverInfo", openCovArr);
			
			req.put("ProductInfo", productInfo);
			req.put("UserAgencyCode", bean.getUagencyCode());
			
			token = session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString();
			response = callAPI(link, token, req.toString());
			if(response!=null) {
				JSONObject json = new JSONObject();
				JSONParser parser = new JSONParser();
				json = (JSONObject) parser.parse(response);
				saveToken(json);
				bean.setErrors((JSONArray) json.get("Errors"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	public List<Object> getOccCertificate(String agencyCode) {
		List<Object> result = null;
		try {
			link = getValueFromWebservice("maan.admin.user.product.getOccertificate");
			JSONObject req = new JSONObject();
			req.put("AgencyCode", agencyCode);
			token = session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString();
			response = callAPI(link, token, req.toString());
			if(response!=null) {
				JSONObject json = new JSONObject();
				JSONParser parser = new JSONParser();
				json = (JSONObject) parser.parse(response);
				saveToken(json);
				result = (JSONArray) json.get("Result");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
