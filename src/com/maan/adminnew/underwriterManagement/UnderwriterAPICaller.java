package com.maan.adminnew.underwriterManagement;

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

@SuppressWarnings("unchecked")
public class UnderwriterAPICaller extends ApiConfig{

//	String response,token="";
	final static Logger logger = LogUtil.getLogger(UnderwriterAPICaller.class);
	static ResourceBundle bundle = ResourceBundle.getBundle("webservice");
//	private String auth = getValueFromWebservice("maan.marine.auth");
	HttpServletRequest request = ServletActionContext.getRequest();
	Map<String, Object> session = ActionContext.getContext().getSession();
	String response = "", link = "", token = "";
	
	public UnderwriterAPICaller(){
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
	
	@SuppressWarnings({ "unchecked" })
	public List<Object> getAdminUnderwriterList(UnderwriterMgtBean ba, String agencyCode, String mode1,
			String branchCode) {
		List<Object> result = new ArrayList<Object>();
		try {
			link = getValueFromWebservice("maan.admin.issuer.list");
			JSONObject req = new JSONObject();
			req.put("BranchCode", branchCode);
			token=session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString();
			response = callAPI(link, token, req.toJSONString());
			JSONObject json = new JSONObject();
			JSONParser parser = new JSONParser();
			json = (JSONObject) parser.parse(response);
			saveToken(json);
			result =(JSONArray)json.get("Result");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public List<Object> getUnderWriterInfo(UnderwriterMgtBean ba, String branchCode, String issurName) {
		List<Object> result = new ArrayList<Object>();
		try {
			link = getValueFromWebservice("maan.admin.issuer.details");
			JSONObject req = new JSONObject();
			req.put("BranchCode", branchCode);
			req.put("LoginId", ba.getLoginId());
			token=session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString();
			response = callAPI(link, token, req.toJSONString());
			JSONObject json = new JSONObject();
			JSONParser parser = new JSONParser();
			json = (JSONObject) parser.parse(response);
			saveToken(json);
			result =(JSONArray)json.get("Result");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public void UpdateUnderWriter(UnderwriterMgtBean bean) {
		try {
			JSONArray arr = new JSONArray();
			JSONArray arr1 = new JSONArray();
			List<String> branch = Arrays.asList(bean.getBranchId().split(","));
			link = getValueFromWebservice("maan.admin.issuer.update");
			JSONObject req = new JSONObject();
			req.put("BranchCode", bean.getBranchCodeS());
			req.put("RegionCode", bean.getRegionCode());
			req.put("LoginUserType", "Admin");
			req.put("LoginId", bean.getLoginId());
			
			req.put("Password", bean.getPassword());
			req.put("Status", bean.getUstatus());
			req.put("IssuerName", bean.getIssurName());
			req.put("CoreLoginId", bean.getCoreLoginId());
			req.put("EmailId", bean.getEmailId());
			req.put("EffectiveDate", bean.getEffecdate());
			req.put("BrokerLinkLocation", bean.getBroLinkLoc());
			req.put("OptionMode", bean.getOptionMode());
			for(int i=0;i<branch.size();i++) {
				JSONObject obj = new JSONObject();
				obj.put("AttachedBranchId", branch.get(i));
				arr.add(obj);
			}
			req.put("AttachedBranchInfo", arr);
			for(int i=0;i<bean.getProducts().size();i++) {
				JSONObject obj = new JSONObject();
				obj.put("ProductId", bean.getProducts().get(i));
				arr1.add(obj);
			}
			req.put("ProductInfo", arr1);

			token=session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString();
			response = callAPI(link, token, req.toJSONString());
			JSONObject json = new JSONObject();
			JSONParser parser = new JSONParser();
			json = (JSONObject) parser.parse(response);
			bean.setErrors((JSONArray)json.get("Errors"));
			saveToken(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@SuppressWarnings("unchecked")
	public List<Object> getIncludeIssuerDetail(UnderwriterMgtBean ba) {
		List<Object> result = null;
		try {
			link = getValueFromWebservice("maan.admin.issuer.includeList");
			JSONObject req = new JSONObject();
			req.put("LoginId", ba.getLoginId());
			token=session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString();
			response = callAPI(link, token, req.toJSONString());
			JSONObject json = new JSONObject();
			JSONParser parser = new JSONParser();
			json = (JSONObject) parser.parse(response);
			saveToken(json);
			result = (JSONArray)json.get("Result");
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	

	@SuppressWarnings("unchecked")
	public List<Object> getExcludeIssuerDetail(UnderwriterMgtBean ba) {
		List<Object> result = null;
		try {
			link = getValueFromWebservice("maan.admin.issuer.excludeList");
			JSONObject req = new JSONObject();
			req.put("LoginId", ba.getLoginId());
			token=session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString();
			response = callAPI(link, token, req.toJSONString());
			JSONObject json = new JSONObject();
			JSONParser parser = new JSONParser();
			json = (JSONObject) parser.parse(response);
			saveToken(json);
			result = (JSONArray)json.get("Result");
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public void updateIssuerPassword(UnderwriterMgtBean bean) {
		try {
			link = getValueFromWebservice("maan.admin.issuer.updatePassword");
			JSONObject req = new JSONObject();
			req.put("LoginId", bean.getLoginId());
			req.put("Password", bean.getPassword());
			req.put("RePassword", bean.getPassword());
//			"AgencyCode": "string",
			
			token=session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString();
			response = callAPI(link, token, req.toJSONString());
			JSONObject json = new JSONObject();
			JSONParser parser = new JSONParser();
			json = (JSONObject) parser.parse(response);
			saveToken(json);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	public void updateIncludeBrokers(UnderwriterMgtBean bean) {
		List<Map<String, Object>> brokerInfo = new ArrayList<Map<String, Object>>();
		JSONArray arr = new JSONArray();
		try {
			link = getValueFromWebservice("maan.admin.issuer.includeToExclude");
			JSONObject req = new JSONObject();
			

			for (int i = 0; i < bean.getStatus().size(); i++) {
				if ("exclude".equalsIgnoreCase(bean.getStatus().get(i))) {
					List<String>product=Arrays.asList(bean.getProductId().get(i).split(","));
					Map<String, Object> brokerMap = new HashMap<String, Object>();
					brokerMap.put("BrokerCode", bean.getBrokerCode().get(i));
					for(int j=0;j<product.size();j++) {
						JSONObject obj = new JSONObject();
						obj.put("ProductId", product.get(j));
						arr.add(obj);
					}
					brokerMap.put("ProductInfo", arr);
					brokerInfo.add(brokerMap);
				}
			}

			req.put("BranchCode", session.get("BranchCode").toString());
			req.put("BrokerInfo", brokerInfo);
			req.put("LoginId", bean.getLoginId());
			token = session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString();
			response = callAPI(link, token, req.toJSONString());
			JSONObject json = new JSONObject();
			JSONParser parser = new JSONParser();
			json = (JSONObject) parser.parse(response);
			saveToken(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	public void updateExcludedBrokers(UnderwriterMgtBean bean) {
		JSONArray arr = new JSONArray();
		try {
			link = getValueFromWebservice("maan.admin.issuer.excludeDelete");
			JSONObject req = new JSONObject();
			for (int i = 0; i < bean.getStatus().size(); i++) {
				if ("include".equalsIgnoreCase(bean.getStatus().get(i))) {
					JSONObject obj = new JSONObject();
					obj.put("BrokerCode", bean.getBrokerCode().get(i));
					arr.add(obj);
				}
				req.put("BrokerInfo", arr);
			}
			req.put("LoginId", bean.getLoginId());
			
			token=session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString();
			response = callAPI(link, token, req.toJSONString());
			JSONObject json = new JSONObject();
			JSONParser parser = new JSONParser();
			json = (JSONObject) parser.parse(response);
			saveToken(json);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
