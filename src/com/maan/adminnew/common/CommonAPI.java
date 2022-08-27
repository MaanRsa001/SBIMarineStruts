package com.maan.adminnew.common;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.maan.adminnew.BrokerManagement.BrokerMgmBean;
import com.maan.common.LogUtil;
import com.maan.common.Token;
import com.maan.common.ApiConfig.ApiConfig;
import com.maan.quotation.model.DefaultValue;
import com.opensymphony.xwork2.ActionContext;

@SuppressWarnings("unchecked")
public class CommonAPI  extends ApiConfig{
	
	String response="",link="";
	final static Logger logger = LogUtil.getLogger(CommonAPI.class);
	private String tokenURL = getValueFromWebservice("maan.marine.opencover.link");
	HttpServletRequest request = ServletActionContext.getRequest();
	Map<String, Object> session = ActionContext.getContext().getSession();
	String token="";
	
	public CommonAPI(){
//		try {
//			token = session.get("TOKEN").toString();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		if (StringUtil.isBlankOrNull(token)) {
//			token = getTokenDetail();
//			if (token != null)
//				session.put("TOKEN", token);
//		}
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
	
	public List<Map<String, String>> getDropdownValue(String branch, String loginId, String type) {
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		try {
			JSONObject req = new JSONObject();
			req.put("BranchCode", branch);
			req.put("LoginId", loginId);
			
			String url = getValueFromWebservice("maan.marine.opencover.drop.link");
			link = url+"referral/quoteproduct";
			token = session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString();
			response = callAPI(link, token, req.toString());
			
			JSONObject json = new JSONObject();
			JSONObject json1 = new JSONObject();
			JSONParser parser = new JSONParser();
			json = (JSONObject) parser.parse(response);
			json1=(JSONObject) json.get("Result");
			if ("product".equalsIgnoreCase(type)) {
				list = (JSONArray) json1.get("ProductionDetails");
			} else if ("branch".equalsIgnoreCase(type)) {
				list = (JSONArray) json1.get("BranchDetails");
			} else {
				list = (JSONArray) json1.get("RegionsList");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
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

	
	public List<Object> getAdminBrokerList(String branchCode, String appId) {
		List<Object> result = null;
		try {
		link = getValueFromWebservice("maan.admin.broker.list");
		JSONObject req = new JSONObject();
		req.put("BranchCode", branchCode);
		req.put("ApplicationId", appId);
		token = session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString();
		response = callAPI(link, token, req.toString());
		JSONObject json = new JSONObject();
		JSONParser parser = new JSONParser();
		json = (JSONObject) parser.parse(response);
		saveToken(json);
		result = (JSONArray) json.get("Result");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public void addProduct(BrokerMgmBean bean) {
		List<Object> result = null;
		try {
		link = getValueFromWebservice("maan.admin.broker.addProduct");
		JSONObject req = new JSONObject();
			  
		req.put("AgencyCode", bean.getAgencyCode());
		req.put("BackDateAllowed", bean.getBack_Date_Allowed());
		req.put("Commission", bean.getCommission());
		req.put("CustomerId", bean.getCustomer_id());
		req.put("CustomerName", bean.getFirstname());
		req.put("DiscountPremium", bean.getDiscountPremium());
		req.put("Freight", bean.getFreight());
		req.put("InsuranceEndLimit", bean.getInsurance_End_Limit());
		req.put("LoadingPremium", bean.getLoadingPremium());
		req.put("MinPremiumAmount", bean.getMin_Premium_Amount());
		req.put("PayReceipt", bean.getPayReceipt());
		req.put("ProductId", bean.getProductID());
		req.put("Provision", bean.getProvision());
		req.put("Remarks", bean.getRemark());
//		req.put("UserId", bean.getUser_Id_Creation()==null?"":bean.getUser_Id_Creation());
		
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

	public List<Map<String, Object>> getRegionsList() {
		List<Map<String, Object>> result = null;
		try {
		link = getValueFromWebservice("maan.admin.region.list");
		token = session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString();
		response = callAPIGet(link, token);
		JSONParser parser = new JSONParser();
		JSONObject jsn =  (JSONObject) parser.parse(response);
		result=(JSONArray)jsn.get("Result");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public List<Map<String, Object>> getBranchList(String regionCode) {
		List<Map<String, Object>> result = new ArrayList<>();
		try {
			if(StringUtils.isNotBlank(regionCode)) {
			link = getValueFromWebservice("maan.admin.branch.list");
			token = session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString();
			JSONObject req = new JSONObject();
			req.put("RegionCode", regionCode);
			response = callAPI(link, token,req.toString());
			JSONParser parser = new JSONParser();
			result =  (JSONArray) parser.parse(response);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public List<Map<String, String>> getProductsDET(String branchCode, String agencyCode) {
		List<Map<String, String>> result = new ArrayList<>();
		try {
			link = getValueFromWebservice("maan.admin.product.list");
			token = session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString();
			JSONObject req = new JSONObject();
			req.put("AgencyCode", agencyCode);
			req.put("BranchCode", branchCode);
			response = callAPI(link, token,req.toString());
			JSONParser parser = new JSONParser();
			JSONObject jObj =  (JSONObject) parser.parse(response);
			result = (JSONArray) jObj.get("Result");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public List<Object> getTitle(String branchCode) {
		List<Object> list = null;
		JSONObject jObj = new JSONObject();
		try {
			link = getValueFromWebservice("maan.admin.user.title");
			token = session.get("TOKEN_SPRING") == null ? "" : session.get("TOKEN_SPRING").toString();
			JSONObject req = new JSONObject();
			req.put("BranchCode", branchCode);
			response = callAPI(link, token, req.toString());
			JSONParser parser = new JSONParser();
			jObj = (JSONObject) parser.parse(response);
			list = (JSONArray) jObj.get("Result");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Object> getNationalities(String branchCode) {
		List<Object> list = null;
		JSONObject jObj = new JSONObject();
		try {
			link = getValueFromWebservice("maan.admin.user.dropdown");
			token = session.get("TOKEN_SPRING") == null ? "" : session.get("TOKEN_SPRING").toString();
			JSONObject req = new JSONObject();
			req.put("BranchCode", branchCode);
			response = callAPI(link, token, req.toString());
			JSONParser parser = new JSONParser();
			jObj = (JSONObject) parser.parse(response);
			JSONObject jObj1 = (JSONObject) jObj.get("Result");
			list = (JSONArray) jObj1.get("NationalityDetails");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Object> getEmirates(String branchCode) {
		List<Object> list = null;
		JSONObject jObj = new JSONObject();
		try {
			link = getValueFromWebservice("maan.admin.user.dropdown");
			token = session.get("TOKEN_SPRING") == null ? "" : session.get("TOKEN_SPRING").toString();
			JSONObject req = new JSONObject();
			req.put("BranchCode", branchCode);
			response = callAPI(link, token, req.toString());
			JSONParser parser = new JSONParser();
			jObj = (JSONObject) parser.parse(response);
			JSONObject jObj1 = (JSONObject) jObj.get("Result");
			list = (JSONArray) jObj1.get("CityDetails");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Object> getCountries(String branchCode) {
		List<Object> list = null;
		JSONObject jObj = new JSONObject();
		try {
			link = getValueFromWebservice("maan.admin.user.dropdown");
			token = session.get("TOKEN_SPRING") == null ? "" : session.get("TOKEN_SPRING").toString();
			JSONObject req = new JSONObject();
			req.put("BranchCode", branchCode);
			response = callAPI(link, token, req.toString());
			JSONParser parser = new JSONParser();
			jObj = (JSONObject) parser.parse(response);
			JSONObject jObj1 = (JSONObject) jObj.get("Result");
			list = (JSONArray) jObj1.get("CountryDetails");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Object> getPorfolioByDate(String sdate, String edate, String status, String pid, String branchCode,
			String brokerCodes, String freightStatus) {
		List<Object> list = null;
		JSONObject jObj = new JSONObject();

		try {
			if ("c".equalsIgnoreCase(status)) {
				link = getValueFromWebservice("maan.admin.portfolio.pending");
			} else if ("P".equalsIgnoreCase(status)) {
				link = getValueFromWebservice("maan.admin.portfolio.generated");
			} else {
				link = getValueFromWebservice("maan.admin.portfolio.cancelled");
			}
			token = session.get("TOKEN_SPRING") == null ? "" : session.get("TOKEN_SPRING").toString();
			JSONObject req = new JSONObject();
			req.put("BranchCode", branchCode);
			req.put("StartDate", sdate);
			req.put("EndDate", edate);
			req.put("ProductId", "ALL");
			response = callAPI(link, token, req.toString());
			JSONParser parser = new JSONParser();
			jObj = (JSONObject) parser.parse(response);
			list = (JSONArray) jObj.get("Result");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Object> getSearchList(String rep, String productID, String searchBy, String searchValue) {
		List<Object> list = null;
		JSONObject jObj = new JSONObject();
		try {
			JSONObject req = new JSONObject();
			if ("quoteNo".equalsIgnoreCase(rep)) {
				link = getValueFromWebservice("maan.admin.portfolio.quote");
				req.put("QuoteNo", searchValue);
			} else if ("customerName".equalsIgnoreCase(rep)) {
				link = getValueFromWebservice("maan.admin.portfolio.customerName");
				req.put("CustomerName", searchValue);
			} else {
				link = getValueFromWebservice("maan.admin.portfolio.policy");
				req.put("PolicyNo", searchValue);
			}
			token = session.get("TOKEN_SPRING") == null ? "" : session.get("TOKEN_SPRING").toString();
			response = callAPI(link, token, req.toString());
			JSONParser parser = new JSONParser();
			jObj=(JSONObject) parser.parse(response);
			list = (JSONArray) jObj.get("Result");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Map<String, Object>> getBrokerUserDetails(String branch) {
		List<Map<String, Object>> list = null;
		try {
			JSONObject req = new JSONObject();
			link = getValueFromWebservice("maan.marine.broker.branch");
			req.put("AttachedBranchId", branch);
			token = session.get("TOKEN_SPRING") == null ? "" : session.get("TOKEN_SPRING").toString();
			response = callAPI(link, token, req.toString());
			JSONParser parser = new JSONParser();
			list = (JSONArray) parser.parse(response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Map<String, Object>> getAttachedBranchList(String selregions) {
		JSONArray jsonArr = new JSONArray();
		try {
			link = getValueFromWebservice("maan.admin.adminmgt.attachedbranch");
			JSONObject req = new JSONObject();
			String[] region = selregions.split(",");
			JSONArray productArr = new JSONArray();

			for (int i = 0; i < region.length; i++) {
				JSONObject obj = new JSONObject();
				obj.put("RegionCode", region[i]);
				productArr.add(obj);
			}
			req.put("RegionCodeInfo", productArr);
			token = session.get("TOKEN_SPRING") == null ? "" : session.get("TOKEN_SPRING").toString();
			response = callAPI(link, token , req.toString());
			JSONParser parser = new JSONParser();
			jsonArr =(JSONArray)parser.parse(response);
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonArr;
	}

	public List<Map<String, Object>> getAttancedRegion(String agencyCode) {
		JSONArray jsonArr = new JSONArray();
		try {
			link = getValueFromWebservice("maan.admin.adminmgt.attachedregion");
			JSONObject req = new JSONObject();

			req.put("AgencyCode", agencyCode);
			token = session.get("TOKEN_SPRING") == null ? "" : session.get("TOKEN_SPRING").toString();
			response = callAPI(link, token , req.toString());
			JSONParser parser = new JSONParser();
			jsonArr =(JSONArray)parser.parse(response);
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonArr;
	}

	public List<Map<String, Object>> getUserAttachedBranchList(String agencyCode, String selregions) {
		JSONArray jsonArr = new JSONArray();
		try {
			link = getValueFromWebservice("maan.admin.adminmgt.userattachedbranch");
			JSONObject req = new JSONObject();

			req.put("AgencyCode", agencyCode);
			String[] region = selregions.split(",");
			JSONArray productArr = new JSONArray();

			for (int i = 0; i < region.length; i++) {
				JSONObject obj = new JSONObject();
				obj.put("RegionCode", region[i]);
				productArr.add(obj);
			}
			req.put("RegionCodeInfo", productArr);
			token = session.get("TOKEN_SPRING") == null ? "" : session.get("TOKEN_SPRING").toString();
			response = callAPI(link, token , req.toString());
			JSONParser parser = new JSONParser();
			jsonArr =(JSONArray)parser.parse(response);
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonArr;
	}

}
