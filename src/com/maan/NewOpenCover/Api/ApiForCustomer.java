package com.maan.NewOpenCover.Api;

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
import com.opensymphony.xwork2.ActionContext;


public class ApiForCustomer extends ApiConfig implements Callable<Object>{
	Map<String, Object> session=ActionContext.getContext().getSession();
	final static Logger logger = LogUtil.getLogger(ApiForCustomer.class);
	private OpenCoverBean bean;
	private String requestfor;
	public ApiForCustomer(OpenCoverBean bean,String requestfor) {
		this.bean=bean;
		this.requestfor=requestfor.toLowerCase();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Object call() throws Exception {
		JSONObject hp = new JSONObject();
		JSONObject json = null;
		JSONObject jo = null;
		JSONParser parser = new JSONParser();
		List<String>chcustomercheck=new ArrayList<>();
		List<String>chcustomerId=new ArrayList<>();
		List<String>chcustomerName=new ArrayList<>();
		
		String customerId="",customerName="",authorization="";
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			if(StringUtils.isNotBlank(bean.getSpringtoken())) {
				authorization= "Bearer " + bean.getSpringtoken();
			}else {
				authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			}
			hp.put("ProposalNo", bean.getProposalNo());
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				
				jo = (JSONObject) json.get("Result");
				JSONArray array= (JSONArray) jo.get("InsuredInfo");
				if(array!=null && array.size()>0) {
					for(int i=0;i<array.size();i++) {
					JSONObject jsonObj = (JSONObject) array.get(i);
					chcustomercheck.add("true");
					chcustomerId.add(jsonObj.get("AdditionalInsured")==null?"":jsonObj.get("AdditionalInsured").toString());
					chcustomerName.add(jsonObj.get("AdditionalInsuredName")==null?"":jsonObj.get("AdditionalInsuredName").toString());
					
					customerName=customerName+","+jsonObj.get("AdditionalInsuredName");
					customerId=customerId+","+jsonObj.get("AdditionalInsured");
					}
					bean.setChcustomercheck(chcustomercheck);
					bean.setChcustomerId(chcustomerId);
					bean.setChcustomerName(chcustomerName);
					customerName=customerName.replaceFirst(",", "");
					bean.setCustomer(customerName);
					bean.setChcustomerIds(customerId.replaceFirst(",", ""));
					//bean.setTotalCommudity(String.valueOf(array.size()));
				}
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	@SuppressWarnings("unchecked")
	public String insertCustomerApi() {
		JSONObject json = null;
		JSONObject jo = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		String result="";
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			
			hp.put("Title", bean.getTitle());
			hp.put("CustFirstName",  bean.getCustName());
			hp.put("CustomerArabicName", bean.getCustNameAr());
			hp.put("CustomerCode",  bean.getCustCode());
			hp.put("Address1",  bean.getAddress1());
			hp.put("Address2",  bean.getAddress2());
			hp.put("PoBox",  bean.getPoBox());
			hp.put("Email",  bean.getEmail());
			hp.put("CityCode",  bean.getCityCode());
			hp.put("CityName",  bean.getCityName());
			hp.put("MobileNo",  bean.getMobileNo());
			hp.put("CustVatRegNo",  bean.getCustVatRegNo());
			hp.put("LoginId",  bean.getBrokerId());
			hp.put("LoginBranchCode",  bean.getBranchCode());
			hp.put("ApplicationId",  "1");
			hp.put("CustomerId",  bean.getCustomerId());
			
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				bean.setErrors((JSONArray) json.get("Errors"));
				
			} 
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
		
	}
	
	@SuppressWarnings("unchecked")
	public List<Object> getCustomerList() {
		List<Object> dropdownList = new ArrayList<>();
		JSONObject json = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			hp.put("LoginId", bean.getBrokerId());
			hp.put("CustomerId", bean.getCustomerId());
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				JSONObject	jo = (JSONObject) json.get("Result");
				dropdownList = (JSONArray) jo.get("CustomerResponse");
			}	
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		return dropdownList;
	}

	@SuppressWarnings("unchecked")
	public void savechcustomer() {
		JSONObject json = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		JSONArray arr = new JSONArray();
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			
			hp.put("ProposalNo", bean.getProposalNo());
			for (int i = 0; i < bean.getChcustomerId().size(); i++) {
				JSONObject obj = new JSONObject();
				if("true".equals(bean.getChcustomercheck().get(i))) {
				obj.put("AdditionalInsured", bean.getChcustomerId().get(i));
				obj.put("AdditionalInsuredName", bean.getChcustomerName().get(i));
			
				arr.add(obj);
				}
			}
			
			hp.put("InsuredInfo", arr);
			
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				
				bean.setErrors((JSONArray) json.get("Errors"));
				bean.setProposalNo(json.get("ProposalNo")==null?"":json.get("ProposalNo").toString()); 
				
			}
			if(bean.getErrors()==null && StringUtils.isNotBlank(bean.getProposalNo())) {
				ApiForCustomer grid=new ApiForCustomer(bean,"editchcustomer");	
				grid.call();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@SuppressWarnings("unchecked")
	public void editcustomer() {
		JSONObject json = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			
			hp.put("CustomerId", bean.getCustomerId());
			
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				
				JSONObject quoteinfo = (JSONObject) json.get("Result");
			
				bean.setTitle(quoteinfo.get("Title")==null?"":quoteinfo.get("Title").toString());
				bean.setCustomerId(quoteinfo.get("CustomerId")==null?"":quoteinfo.get("CustomerId").toString());
				bean.setCustName(quoteinfo.get("CustFirstName")==null?"":quoteinfo.get("CustFirstName").toString());
				bean.setCustNameAr(quoteinfo.get("CustomerArabicName")==null?"":quoteinfo.get("CustomerArabicName").toString());
				bean.setCustCode(quoteinfo.get("CustomerCode")==null?"":quoteinfo.get("CustomerCode").toString());
				bean.setAddress1(quoteinfo.get("Address1")==null?"":quoteinfo.get("Address1").toString());
				bean.setAddress2(quoteinfo.get("Address2")==null?"":quoteinfo.get("Address2").toString());
				bean.setPoBox(quoteinfo.get("PoBox")==null?"":quoteinfo.get("PoBox").toString());
				bean.setEmail(quoteinfo.get("Email")==null?"":quoteinfo.get("Email").toString());
				bean.setCityCode(quoteinfo.get("CityCode")==null?"":quoteinfo.get("CityCode").toString());
				bean.setCityName(quoteinfo.get("CityName")==null?"":quoteinfo.get("CityName").toString());
				bean.setMobileNo(quoteinfo.get("MobileNo")==null?"":quoteinfo.get("MobileNo").toString());
				bean.setCustVatRegNo(quoteinfo.get("CustVatRegNo")==null?"":quoteinfo.get("CustVatRegNo").toString());
				
			} 
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
}
