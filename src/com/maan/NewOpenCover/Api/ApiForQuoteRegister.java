package com.maan.NewOpenCover.Api;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Callable;

import org.apache.logging.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.maan.NewOpenCover.reports.ReportRegBean;
import com.maan.common.LogUtil;
import com.maan.common.ApiConfig.ApiConfig;
import com.opensymphony.xwork2.ActionContext;


public class ApiForQuoteRegister extends ApiConfig implements Callable<Object>{
	Map<String, Object> session=ActionContext.getContext().getSession();
	final static Logger logger = LogUtil.getLogger(ApiForQuoteRegister.class);
	private ReportRegBean bean;
	private String requestfor;
	public ApiForQuoteRegister(ReportRegBean bean,String requestfor) {
		this.bean=bean;
		this.requestfor=requestfor.toLowerCase();
	}
	
	@Override
	public Object call() throws Exception {
		return null;
	}
	
	@SuppressWarnings("unchecked")
	public List<Object> getQuoteRegisterList() {
		List<Object> result = new ArrayList<>();
		JSONObject json = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			hp.put("LoginId", bean.getBrokerId());
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				
				result = (JSONArray) json.get("Result");
			}	
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public List<Object> getPolicyRegisterList() {
		List<Object> result = new ArrayList<>();
		JSONObject json = null;
		JSONObject jo = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			hp.put("LoginId", bean.getBrokerId());
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				
				result =  (JSONArray) json.get("Result");
			}	
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		return result;
	}
	@SuppressWarnings("unchecked")
	public List<Object> getRenewalPolicyList() {
		List<Object> result = new ArrayList<>();
		JSONObject json = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			hp.put("LoginId", bean.getBrokerId());
			
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				
				result = (JSONArray) json.get("Result");
			}	
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public List<Object> getPendingAcceptList() {
		List<Object> result = new ArrayList<>();
		JSONObject json = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			hp.put("LoginId", bean.getBrokerId());
			hp.put("Status", bean.getStatus());
			hp.put("UserType", bean.getUserType());
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				
				result = (JSONArray) json.get("Result");
			}	
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public List<Object> getExpiredPolicyList() {
		List<Object> result = new ArrayList<>();
		JSONObject json = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			hp.put("LoginId", bean.getBrokerId());
			hp.put("PolicyNo", bean.getPolicyNo());
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				
				result = (JSONArray) json.get("Result");
			}	
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public List<Object> getLapsedPolicyList() {
		List<Object> result = new ArrayList<>();
		JSONObject json = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			hp.put("LoginId", bean.getBrokerId());
			hp.put("PolicyNo", bean.getPolicyNo());
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				
				result = (JSONArray) json.get("Result");
			}	
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public List<Object> getBrokerList() {
		List<Object> dropdownList = new ArrayList<>();
		JSONObject json = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			hp.put("BranchCode", "01");
			
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				dropdownList = (JSONArray) json.get("Result");
			}	
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		return dropdownList;
	}

	@SuppressWarnings("unchecked")
	public void activeDeactive() {
		String result="";
		JSONObject json = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			
			hp.put("ProposalNo", bean.getProposalNo());
			
			
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
			
				result=json.get("Message")==null?"":json.get("Message").toString(); 
				
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	@SuppressWarnings("unchecked")
	public List<Object> getExistingBrokerList() {
		List<Object> dropdownList = new ArrayList<>();
		JSONObject json = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			hp.put("BranchCode", bean.getBranchCode());
			
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				dropdownList = (JSONArray) json.get("Result");
			}	
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		return dropdownList;
	}

	@SuppressWarnings("unchecked")
	public List<Object> getPortfolioBrokerList() {
		List<Object> dropdownList = new ArrayList<>();
		JSONObject json = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			hp.put("BranchCode", bean.getBranchCode());
			
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				dropdownList = (JSONArray) json.get("Result");
			}	
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		return dropdownList;
	}
	
}
