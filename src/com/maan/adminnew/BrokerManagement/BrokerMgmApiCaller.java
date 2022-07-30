package com.maan.adminnew.BrokerManagement;

import java.util.ArrayList;
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

public class BrokerMgmApiCaller extends ApiConfig {

//	String response,token="";
	final static Logger logger = LogUtil.getLogger(BrokerMgmApiCaller.class);
	static ResourceBundle bundle = ResourceBundle.getBundle("webservice");
//	private String auth = getValueFromWebservice("maan.marine.auth");
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
	
	public BrokerMgmApiCaller() {
		token = session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString();
	}

	public List<Object> getCommissiondata(String agencyCode) {
		List<Object> result = new ArrayList<Object>();
		try {
			link = getValueFromWebservice("maan.admin.broker.view");
			JSONObject req = new JSONObject();
			req.put("AgencyCode", agencyCode);
			response = callAPI(link, token, req.toJSONString());
			JSONObject json = new JSONObject();
			JSONParser parser = new JSONParser();
			json = (JSONObject) parser.parse(response);
			saveToken(json);
			result = (JSONArray) json.get("IssuerDetails");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public JSONObject getBrokerDetailsApi(BrokerMgmBean ba, String agencyCode, String branchCode) {
		JSONObject req = new JSONObject();
		JSONObject json = new JSONObject();
		try {
			link = getValueFromWebservice("maan.admin.broker.view");
			req.put("AgencyCode", agencyCode);
			req.put("BranchCode", branchCode);
			token = session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString();
			response = callAPI(link, token, req.toJSONString());
			JSONParser parser = new JSONParser();
			json = (JSONObject) parser.parse(response);
			saveToken(json);
			json = (JSONObject)json.get("Result");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return json;
	}

	@SuppressWarnings("unchecked")
	public JSONObject getBrokerEditApi(BrokerMgmBean bean, String agencyCode, String branchCode) {
		JSONObject req = new JSONObject();
		JSONObject json = new JSONObject();
		try {
			link = getValueFromWebservice("maan.admin.broker.edit");
			req.put("AgencyCode", agencyCode);
			req.put("BranchCode", branchCode);
			token = session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString();
			response = callAPI(link, token, req.toJSONString());
			JSONParser parser = new JSONParser();
			json = (JSONObject) parser.parse(response);
			saveToken(json);
			json = (JSONObject)json.get("Result");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return json;
	}

	@SuppressWarnings("unchecked")
	public void insertBrokerInfoApi(BrokerMgmBean bean) {
		JSONObject req = new JSONObject();
		try {
			link = getValueFromWebservice("maan.admin.broker.insert");
			
			if(!"new".equalsIgnoreCase(bean.getMode())) {
				req.put("CustomerId", bean.getCustomer_id());
				req.put("LoginId", bean.getLogin_Id());
			}else {
				req.put("LoginId", bean.getLoginid());
			}
			req.put("BranchCode", bean.getBranch());
			req.put("AgencyCode", bean.getAgencyCode());
			
			req.put("Title", bean.getTitle());
			req.put("CustFirstName", bean.getFirstname());
			req.put("CustLastName", bean.getLastname());
			req.put("Nationality", bean.getNationality());
			req.put("DateOfBirth", bean.getDob());
			req.put("Gender", bean.getGender());
			req.put("TelephoneNo", bean.getTelephone());
			req.put("MobileNo", bean.getMobile());
			req.put("Fax", bean.getFax());
			req.put("Email", bean.getBemail());
			req.put("Address1", bean.getAddress1());
			req.put("Address2", bean.getAddress2());
			req.put("Occupation", bean.getOccupation());
			req.put("PoBox", bean.getPobox());
			req.put("Country", bean.getCountry());
			req.put("City", bean.getEmirate());
			req.put("ARACC", bean.getARACC());
			req.put("CustomerName", bean.getCustomerName());
			
			req.put("Password", bean.getPassword());
			req.put("RePassword", bean.getRepassword());
			req.put("SubBranch", "");
			req.put("BorkerOrganization", bean.getBorganization());
			req.put("MissippiId",bean.getMissippiId());
			req.put("Approvedby", bean.getApprovedby());
			req.put("BrokerCode", bean.getBcode());
			req.put("Executive", bean.getExecutive());
			req.put("OneOffCommission", bean.getOneOffCommission());
			req.put("OpenCoverCommission", bean.getOpenCoverCommission());
			req.put("PolicyFee", bean.getPolicFee());
			req.put("GovetFee", bean.getGov_fee());
			req.put("EmergencyFund", bean.getEmergencyfund());
			req.put("EmergencyFee", bean.getEmer_fee());
			req.put("TaxApplicable", bean.getApp_for());
			req.put("EffectiveDate", bean.getEffecdate());
			req.put("Status", bean.getStatus());
			req.put("Mode", bean.getMode());
			req.put("RegionCode", bean.getRegionCode());
			
			response = callAPI(link, token, req.toString());
			JSONObject json = new JSONObject();
			JSONParser parser = new JSONParser();
			json = (JSONObject)parser.parse(response);
			saveToken(json);
			bean.setErrors((JSONArray) json.get("ErrorMessage"));
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	@SuppressWarnings("unchecked")
	public void setPassword(BrokerMgmBean bean) {
		try {
			link = getValueFromWebservice("maan.admin.user.password");
			JSONObject req = new JSONObject();

			req.put("AgencyCode", bean.getAgencyCode());
			req.put("Password", bean.getPassword());
			req.put("RePassword", bean.getRpassword());

			token = session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString();
			response = callAPI(link, token, req.toString());
			JSONObject json = new JSONObject();
			JSONParser parser = new JSONParser();
			json = (JSONObject) parser.parse(response);
			saveToken(json);
			bean.setErrors((JSONArray) json.get("Errors"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	@SuppressWarnings("unchecked")
	public void deleteProduct(BrokerMgmBean bean) {
		try {
			link = getValueFromWebservice("maan.admin.broker.deleteProduct");
			JSONObject req = new JSONObject();
			req.put("AgencyCode", bean.getAgencyCode());
			req.put("ProductId", bean.getProductID());
			token = session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString();
			response = callAPI(link, token, req.toString());
			JSONObject json = new JSONObject();
			JSONParser parser = new JSONParser();
			json = (JSONObject) parser.parse(response);
			saveToken(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@SuppressWarnings("unchecked")
	public List<Object> getProductdetail(BrokerMgmBean ba) {
		List<Object> result = new ArrayList<Object>();
		try {
			link = getValueFromWebservice("maan.admin.broker.editproduct");
			JSONObject req = new JSONObject();
			req.put("AgencyCode", ba.getAgencyCode());
			req.put("ProductId", ba.getProductID());
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
	public List<Object> executives() {
		List<Object> result = new ArrayList<Object>();
		try {
			link = getValueFromWebservice("maan.admin.broker.executive");
			token = session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString();
			response = callAPIGet(link, token);
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

}
