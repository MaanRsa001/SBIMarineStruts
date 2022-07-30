package com.maan.NewOpenCover.paymentTerms.Api;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Callable;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.maan.NewConditions.ConditionBean;
import com.maan.NewConditions.Api.ApiForClauses;
import com.maan.NewOpenCover.Api.ApiForSaleTerm;
import com.maan.NewOpenCover.paymentTerms.PaymentTermBean;
import com.maan.common.LogUtil;
import com.maan.common.ApiConfig.ApiConfig;
import com.opensymphony.xwork2.ActionContext;

public class ApiForPaymentTerm extends ApiConfig implements Callable<Object>{
	Map<String, Object> session=ActionContext.getContext().getSession();
	final static Logger logger = LogUtil.getLogger(ApiForClauses.class);
	private PaymentTermBean bean;
	private String requestfor;
	public ApiForPaymentTerm(PaymentTermBean bean,String requestfor) {
		this.bean=bean;
		this.requestfor=requestfor.toLowerCase();
	}
	
	@Override
	public Object call() throws Exception {
		return null;
	}

	@SuppressWarnings("unchecked")
	public List<Object> getPaymentTermsDetails() {
		List<Object> dropdownList = new ArrayList<>();
		JSONObject json = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			hp.put("LoginId", bean.getUserLoginId());
			
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				dropdownList = (JSONArray) json.get("PaymentTermsResponse");
			}	
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		return dropdownList;
	}

	@SuppressWarnings("unchecked")
	public List<Object> getUserSelection() {
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
				dropdownList = (JSONArray) json.get("LoginResponse");
			}	
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		return dropdownList;
	}

	@SuppressWarnings("unchecked")
	public List<Object> getPaymentTerms() {
		List<Object> dropdownList = new ArrayList<>();
		JSONObject json = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			hp.put("LoginId", bean.getUserLoginId());
			hp.put("OpenCoverNo", bean.getOpenCoverNo());
				
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				dropdownList = (JSONArray) json.get("PaymentViewResponse");
			}	
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		return dropdownList;
	}

	@SuppressWarnings("unchecked")
	public List<Object> getOpenCoverNoList() {
		List<Object> dropdownList = new ArrayList<>();
		JSONObject json = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
		
			hp.put("OpenCoverNo", bean.getOpenCoverNo());
				
				
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				dropdownList = (JSONArray) json.get("OpenCoverList");
				if(dropdownList==null) {
					dropdownList = new ArrayList<>();
				}
			}	
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		return dropdownList;
	}

	@SuppressWarnings("unchecked")
	public List<Object> getPaymentTermsList() {
		List<Object> dropdownList = new ArrayList<>();
		JSONObject json = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		List<String>  openCoverNum=new ArrayList<>();
		List<String>  dueamount=new ArrayList<>();
		List<String>  duepercent=new ArrayList<>();
		List<String>  dueDate=new ArrayList<>();
		List<String>  effectiveDate=new ArrayList<>();
		List<String>  dueList=new ArrayList<>();
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			
			hp.put("ProposalNo", bean.getProposalNo());
			hp.put("OpenCoverNo", bean.getOpenCoverNo());
			hp.put("MissippiOpenCoverNo", bean.getMissippiOpenCoverNo());	
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				dropdownList = (JSONArray) json.get("PaymentList");
				if(dropdownList!=null && dropdownList.size()>0) {
					for(int i=0;i<dropdownList.size();i++) {
						JSONObject jsonObj = (JSONObject) dropdownList.get(i);
						dueList.add(jsonObj.get("Sno")==null?"":jsonObj.get("Sno").toString());
						openCoverNum.add(jsonObj.get("MissippiOpenCoverNo")==null?"":jsonObj.get("MissippiOpenCoverNo").toString());
						dueamount.add(jsonObj.get("DueAmount")==null?"":jsonObj.get("DueAmount").toString());
						duepercent.add(jsonObj.get("DuePercentage")==null?"":jsonObj.get("DuePercentage").toString());
						dueDate.add(jsonObj.get("DueDate")==null?"":jsonObj.get("DueDate").toString());
						effectiveDate.add(jsonObj.get("EffectiveDate")==null?"":jsonObj.get("EffectiveDate").toString());
					}
					bean.setDueList(dueList);
					bean.setOpenCoverNum(openCoverNum);
					bean.setDueamount(dueamount);
					bean.setDueDate(dueDate);
					bean.setDuepercent(duepercent);
					bean.setEffectiveDate(effectiveDate);
				}else {
					Map<String,Object> map=new HashMap<String, Object>();
					for(int i=0;i<1;i++){
						map.put("1", "1");
						openCoverNum.add("");
					}
					bean.setOpenCoverNum(openCoverNum);
				}
					
			}	
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		return dropdownList;
	}

	public List<Object> getPaymentDuelist() {
		List<Object> result=new ArrayList<>();
		Map<String,Object> map=new HashMap<String, Object>();
		for(int i=0;i<1;i++){
			map.put("1", "1");
			result.add(map);
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public String addPaymentTerms() {
		String result="";
		try {
			JSONObject json = null;
			JSONObject jo1 = null;
			JSONObject hp = new JSONObject();
			JSONParser parser = new JSONParser();
			JSONArray arr = new JSONArray();
			
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			
			hp.put("BranchCode", bean.getBranchCode());
			hp.put("MissippiOpenCoverNo", bean.getMissippiOpenCoverNo());
			hp.put("OpenCoverNo", bean.getOpenCoverNo());
			hp.put("ProposalNo", bean.getProposalNo());
			hp.put("TotalPremium", bean.getOpenCoverPremium());
			for (int i = 0; i < bean.getOpenCoverNum().size(); i++) {
				JSONObject obj = new JSONObject();
				obj.put("DueAmount", bean.getDueamount().get(i));
				obj.put("DueDate", bean.getDueDate().get(i));
				obj.put("DuePercent", bean.getDuepercent().get(i));
				obj.put("EffectiveDate", bean.getEffectiveDate().get(i));
				obj.put("PolicyNo", bean.getOpenCoverNum().get(i));
				arr.add(obj);
				
			}
			hp.put("DueInfo", arr);
			
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
			
				jo1 = (JSONObject) json.get("PaymentResponse");
				bean.setErrors((JSONArray) jo1.get("Errors"));
			}
			
	
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public String deletePayment() {
		String result="";
		try {
			JSONObject json = null;
			JSONObject hp = new JSONObject();
			JSONParser parser = new JSONParser();
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			hp.put("Sno", bean.getSno());
			hp.put("OpenCoverNo", bean.getOpenCoverNo());
			hp.put("ProposalNo", bean.getProposalNo());
			
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				result= json.get("Status")==null?"":json.get("Status").toString();
			}
	
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public List<Object> getPaymentTermsViewList() {
		List<Object> dropdownList = new ArrayList<>();
		JSONObject json = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		List<String>  openCoverNum=new ArrayList<>();
		List<String>  dueamount=new ArrayList<>();
		List<String>  duepercent=new ArrayList<>();
		List<String>  dueDate=new ArrayList<>();
		List<String>  effectiveDate=new ArrayList<>();
		List<String>  dueList=new ArrayList<>();
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			
			hp.put("ProposalNo", bean.getProposalNo());
			hp.put("OpenCoverNo", bean.getOpenCoverNo());
				
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				dropdownList = (JSONArray) json.get("PaymentList");
				if(dropdownList!=null && dropdownList.size()>0) {
					for(int i=0;i<dropdownList.size();i++) {
						JSONObject jsonObj = (JSONObject) dropdownList.get(i);
						dueList.add(jsonObj.get("Sno")==null?"":jsonObj.get("Sno").toString());
						openCoverNum.add(jsonObj.get("MissippiOpenCoverNo")==null?"":jsonObj.get("MissippiOpenCoverNo").toString());
						dueamount.add(jsonObj.get("DueAmount")==null?"":jsonObj.get("DueAmount").toString());
						duepercent.add(jsonObj.get("DuePercentage")==null?"":jsonObj.get("DuePercentage").toString());
						dueDate.add(jsonObj.get("DueDate")==null?"":jsonObj.get("DueDate").toString());
						effectiveDate.add(jsonObj.get("EffectiveDate")==null?"":jsonObj.get("EffectiveDate").toString());
					}
					bean.setDueList(dueList);
					bean.setOpenCoverNum(openCoverNum);
					bean.setDueamount(dueamount);
					bean.setDueDate(dueDate);
					bean.setDuepercent(duepercent);
					bean.setEffectiveDate(effectiveDate);
				}else {
					Map<String,Object> map=new HashMap<String, Object>();
					for(int i=0;i<1;i++){
						map.put("1", "1");
						openCoverNum.add("");
					}
					bean.setOpenCoverNum(openCoverNum);
				}
					
			}	
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		return dropdownList;
	}
}
