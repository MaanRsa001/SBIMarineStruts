package com.maan.NewOpenCover.Api;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Callable;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import com.maan.NewOpenCover.OpenCoverBean;
import com.maan.common.LogUtil;
import com.maan.common.ApiConfig.ApiConfig;
import com.opensymphony.xwork2.ActionContext;
import com.sun.codemodel.JArray;


public class ApiForOrgCountry extends ApiConfig implements Callable<Object>{
	Map<String, Object> session=ActionContext.getContext().getSession();
	final static Logger logger = LogUtil.getLogger(ApiForOrgCountry.class);
	private OpenCoverBean bean;
	private String requestfor;
	public ApiForOrgCountry(OpenCoverBean bean,String requestfor) {
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
		String orgcountryId="",orgcountryName="", authorization="";
		
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
				JSONArray array= (JSONArray) jo.get("OriginationCountryInfo");
				if(array!=null && array.size()>0) {
					for(int i=0;i<array.size();i++) {
					JSONObject jsonObj = (JSONObject) array.get(i);
					orgcountryId=orgcountryId+","+jsonObj.get("CountryId");
					orgcountryName=orgcountryName+","+jsonObj.get("CountryName");
					}
					orgcountryId=orgcountryId.replaceFirst(",", "");
					orgcountryName=orgcountryName.replaceFirst(",", "");
					bean.setTransit_countryId(orgcountryId);
					bean.setCountryIds(orgcountryId);
					bean.setTransit_country(orgcountryName);
					bean.setTotalTransitId(String.valueOf(array.size()));
				}
		
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	@SuppressWarnings("unchecked")
	public List<Object> getCountryList() {
		List<Object> dropdownList = new ArrayList<>();
		JSONObject json = null;
		try {
			
			JSONObject hp = new JSONObject();
			JSONParser parser = new JSONParser();
			
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			hp.put("BranchCode", bean.getBelongingBranch());
				
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				dropdownList = (JSONArray) json.get("Result");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return dropdownList;
	}
	@SuppressWarnings("unchecked")
	public List<Object> getContinentList() {
		List<Object> dropdownList = new ArrayList<>();
		JSONObject json = null;
		try {
			
			JSONObject hp = new JSONObject();
			JSONParser parser = new JSONParser();
			
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			
			hp.put("BranchCode", bean.getBelongingBranch());
				
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				dropdownList = (JSONArray) json.get("Result");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return dropdownList;
	}
	@SuppressWarnings("unchecked")
	public void getIncludeExcludeCountryList() {
		JSONObject json = null;
		try {
			
			JSONArray arr = new JSONArray();
			JSONParser parser = new JSONParser();
			List<String>country=null;
			if(StringUtils.isNotBlank(bean.getCountryIds())) {
			country=Arrays.asList(bean.getCountryIds().split(","));
			}
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
				 if(country!=null) {
					 for(int i=0;i<country.size();i++) {
						 JSONObject hp = new JSONObject();
						 hp.put("CountryId", country.get(i));
						 arr.add(hp);
					 }
					 
				 }
			 	
			 	String responseStr=callAPIPost(link, authorization, arr.toString().replaceAll("\"\"", "null"));
				if(responseStr!=null && responseStr.length()>0) {
					json = (JSONObject) parser.parse(responseStr);
					JSONObject jo1=(JSONObject) json.get("Result");
					bean.setIncludeList((JSONArray) jo1.get("IncludeResponse"));
					bean.setExcludeList((JSONArray) jo1.get("ExcludeResponse"));
				}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@SuppressWarnings("unchecked")
	public Object saveorgcountry() {
		try {
			JSONObject json,jo,jo1 = null;
			JSONObject hp = new JSONObject();
			JSONParser parser = new JSONParser();
			JSONArray arr = new JSONArray();
			
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			
			hp.put("ProposalNo", bean.getProposalNo());
			if(StringUtils.isNotBlank(bean.getTransit_countryId())) {
			List<String>country=new ArrayList<String>(Arrays.asList(bean.getTransit_countryId().split(",")));
			List<String>countryDes=new ArrayList<String>(Arrays.asList(bean.getTransit_country().split(",")));
			for (int i = 0; i < country.size(); i++) {
				JSONObject obj = new JSONObject();
				obj.put("CountryId", country.get(i));
				obj.put("CountryName", countryDes.get(i));
				arr.add(obj);
				
			}
			}
			
			hp.put("OriginationCountryInfo", arr);
			
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				
				jo1 = (JSONObject) json.get("Result");
				bean.setErrors((JSONArray) jo1.get("ErrorMessage"));
			}
			if(bean.getErrors()==null && StringUtils.isNotBlank(bean.getProposalNo())) {
				ApiForOrgCountry editorgcountry=new ApiForOrgCountry(bean,"editorgcountry");
				editorgcountry.call();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
	
	@SuppressWarnings("unchecked")
	public List<Object> getWarCityList() {
		List<Object> dropdownList = new ArrayList<>();
		JSONObject json = null;
		try {
			
			JSONParser parser = new JSONParser();
			
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			
				
			String responseStr=callAPIGet(link, authorization);
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				dropdownList = (JSONArray) json.get("Result");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return dropdownList;
	}
	
}
