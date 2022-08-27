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
import org.json.simple.parser.ParseException;

import com.maan.NewOpenCover.OpenCoverBean;
import com.maan.common.LogUtil;
import com.maan.common.ApiConfig.ApiConfig;
import com.opensymphony.xwork2.ActionContext;


public class ApiForSaleTerm extends ApiConfig implements Callable<Object>{
	Map<String, Object> session=ActionContext.getContext().getSession();
	final static Logger logger = LogUtil.getLogger(ApiForSaleTerm.class);
	private OpenCoverBean bean;
	private String requestfor;
	public ApiForSaleTerm(OpenCoverBean bean,String requestfor) {
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
		String saletermId="",saletermName="",authorization="";
		
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
				JSONArray array= (JSONArray) jo.get("SaleTermInfo");
				if(array!=null && array.size()>0) {
					for(int i=0;i<array.size();i++) {
					JSONObject jsonObj = (JSONObject) array.get(i);
					saletermId=saletermId+","+jsonObj.get("SaleTermId");
					saletermName=saletermName+","+jsonObj.get("SaleTermName");
					}
					saletermId=saletermId.replaceFirst(",", "");
					saletermName=saletermName.replaceFirst(",", "");
					bean.setSaletermId(saletermId);
					bean.setSaleTermIds(saletermId);
					bean.setSaleTermName(saletermName);
					//bean.setTotalTransitId(String.valueOf(array.size()));
				}
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	@SuppressWarnings("unchecked")
	public List<Object> getSaleTermList() {
		List<Object> dropdownList = new ArrayList<>();
		JSONObject json = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			 hp.put("BranchCode", bean.getBelongingBranch());
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
	public Object savesaleterm() {
		try {
			JSONObject json = null;
			JSONObject jo1 = null;
			JSONObject hp = new JSONObject();
			JSONParser parser = new JSONParser();
			JSONArray arr = new JSONArray();
			
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			
			hp.put("ProposalNo", bean.getProposalNo());
			if(StringUtils.isNotBlank(bean.getSaletermId())) {
				List<String>saleterm=new ArrayList<String>(Arrays.asList(bean.getSaletermId().split(",")));
				List<String>saletermDes=new ArrayList<String>(Arrays.asList(bean.getSaleTermName().split(",")));
			for (int i = 0; i < saleterm.size(); i++) {
				JSONObject obj = new JSONObject();
				obj.put("SaleTermId", saleterm.get(i));
				obj.put("SaleTermName", saletermDes.get(i));
				arr.add(obj);
				
			}
			hp.put("SaleTermInfo", arr);
			
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				 
				jo1 = (JSONObject) json.get("Result");
				bean.setErrors((JSONArray) jo1.get("ErrorMessage"));
			}
			if(bean.getErrors()==null && StringUtils.isNotBlank(bean.getProposalNo())) {
				ApiForSaleTerm grid=new ApiForSaleTerm(bean,"editsaleterm");	
				grid.call();
			}
		}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
	
	@SuppressWarnings("unchecked")
	public void getIncludeExcludeSaleTermList() {
		JSONObject json = null;
		try {
			JSONObject hp = new JSONObject();
			JSONParser parser = new JSONParser();
			JSONArray arr = new JSONArray();
			List<String>saleterm=null;
			if(StringUtils.isNotBlank(bean.getSaleTermIds())) {
				saleterm=Arrays.asList(bean.getSaleTermIds().split(","));
			}
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
				hp.put("BranchCode", bean.getBelongingBranch());
				if(saleterm!=null) {
					 for(int i=0;i<saleterm.size();i++) {
						 JSONObject abj = new JSONObject();
						 abj.put("SaleTermId", saleterm.get(i));
						 arr.add(abj);
					 }
					
				 }
				hp.put("SaleTermInfo", arr);
			 	String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
				if(responseStr!=null && responseStr.length()>0) {
					json = (JSONObject) parser.parse(responseStr);
					JSONObject jo1=(JSONObject) json.get("Result");
					bean.setIncludeList((JSONArray) jo1.get("SaleTermIncludeResponse"));
					bean.setExcludeList((JSONArray) jo1.get("SaleTermExcludeResponse"));
				}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@SuppressWarnings("unchecked")
	public List<Object> getOptedSaleTermList() {
		List<Object> dropdownList = new ArrayList<>();
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			 hp.put("BranchCode", bean.getBelongingBranch());
			 hp.put("ProposalNo", bean.getProposalNo());
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				JSONObject json = (JSONObject) parser.parse(responseStr);
				dropdownList = (JSONArray) json.get("Result");
			}	
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		return dropdownList;
	}
}
