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


public class ApiForCommodity extends ApiConfig implements Callable<Object>{
	Map<String, Object> session=ActionContext.getContext().getSession();
	final static Logger logger = LogUtil.getLogger(ApiForCommodity.class);
	private OpenCoverBean bean;
	private String requestfor;
	public ApiForCommodity(OpenCoverBean bean,String requestfor) {
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
		List<String>commditycheck=new ArrayList<>();
		List<String>commdityId=new ArrayList<>();
		List<String>commdityName=new ArrayList<>();
		List<String>commdityNameDesc=new ArrayList<>();
		List<String>commdityFragile=new ArrayList<>();
		List<String>commodityTypeId=new ArrayList<>();
		String commodityName="",authorization="";
		int count=0;
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			if(StringUtils.isNotBlank(bean.getSpringtoken())) {
				authorization= "Bearer " + bean.getSpringtoken();
			}else {
				authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			}
			hp.put("ProposalNo", bean.getProposalNo());
			hp.put("BranchCode", bean.getBelongingBranch());
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				
				jo = (JSONObject) json.get("Result");
				JSONArray array= (JSONArray) jo.get("CommodityInfo");
				if(array!=null && array.size()>0) {
					for(int i=0;i<array.size();i++) {
					JSONObject jsonObj = (JSONObject) array.get(i);
					String checkcommodity =jsonObj.get("OptedCommodity")==null?"":jsonObj.get("OptedCommodity").toString();
					commditycheck.add("Y".equalsIgnoreCase(checkcommodity)?"true":"false");
					commdityId.add(jsonObj.get("CommodityId")==null?"":jsonObj.get("CommodityId").toString());
					commdityName.add(jsonObj.get("CommodityName")==null?"":jsonObj.get("CommodityName").toString());
					commdityNameDesc.add(jsonObj.get("CommodityDescription")==null?"":jsonObj.get("CommodityDescription").toString());
					commdityFragile.add(jsonObj.get("Fragile")==null?"":("on".equals(jsonObj.get("Fragile"))?"true":"false"));
					commodityTypeId.add(jsonObj.get("CommodityTypeId")==null?"":jsonObj.get("CommodityTypeId").toString());
					if("Y".equalsIgnoreCase(checkcommodity)) {
					commodityName=commodityName+","+jsonObj.get("CommodityDescription");
					count=count+1;
					}
					}
					bean.setCommditycheck(commditycheck);
					bean.setCommdityId(commdityId);
					bean.setCommdityName(commdityName);
					bean.setCommdityNameDesc(commdityNameDesc);
					bean.setCommdityFragile(commdityFragile);
					commodityName=commodityName.replaceFirst(",", "");
					bean.setCommodity_TA(commodityName);
					bean.setTotalCommudity(String.valueOf(count));
				}
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	@SuppressWarnings("unchecked")
	public Object savecommodity() {
		JSONObject json = null;
		JSONObject jo1 = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		JSONArray arr = new JSONArray();
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			
			hp.put("ProposalNo", bean.getProposalNo());
			hp.put("OpenCoverNo", "");
			for (int i = 0; i < bean.getCommdityId().size(); i++) {
				JSONObject obj = new JSONObject();
				if("true".equals(bean.getCommditycheck().get(i))) {
				obj.put("CommodityId", bean.getCommdityId().get(i));
				obj.put("CommodityName", bean.getCommdityName().get(i));
				obj.put("CommodityDescription", bean.getCommdityNameDesc().get(i));
				obj.put("Fragile", "true".equals(bean.getCommdityFragile().get(i))?"on":"off");
				obj.put("CommodityTypeId", bean.getCommodityTypeId().get(i));
				arr.add(obj);
				}
			}
			
			hp.put("CommodityInfo", arr);
			
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				
				jo1 = (JSONObject) json.get("Result");
				bean.setErrors((JSONArray) jo1.get("ErrorMessage"));
				bean.setProposalNo(jo1.get("ProposalNo")==null?"":jo1.get("ProposalNo").toString()); 
				
			}
			if(bean.getErrors()==null && StringUtils.isNotBlank(bean.getProposalNo())) {
				ApiForCommodity grid=new ApiForCommodity(bean,"editcommodity");	
				grid.call();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
	@SuppressWarnings("unchecked")
	public List<Object> getCommodityList() {
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
	public List<Object> getEditCommodityList() {
		List<Object> dropdownList = new ArrayList<>();
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
				dropdownList = (JSONArray) json.get("Result");
				
			}	
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		return dropdownList;
	}

	@SuppressWarnings("unchecked")
	public void editcommodityRate() {
		JSONObject hp = new JSONObject();
		JSONObject json = null;
		JSONParser parser = new JSONParser();
		List<String>commdityId=new ArrayList<>();
		List<String>commdityName=new ArrayList<>();
		List<String>commdityNameDesc=new ArrayList<>();
		List<String>commodityModeId=new ArrayList<>();
		List<String>commodityModeName=new ArrayList<>();
		List<String>commodityCoverId=new ArrayList<>();
		List<String>commodityCoverName=new ArrayList<>();
		List<String>commoditybaseRate=new ArrayList<>();
		List<String>commodityexcessPer=new ArrayList<>();
		List<String>commodityexcessVal=new ArrayList<>();
		List<String>commodityexcessDesc=new ArrayList<>();
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			hp.put("ProposalNo", bean.getProposalNo());
			hp.put("CommodityCode", bean.getCommodityCode());
			hp.put("BranchCode", bean.getBranchCode());
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				
				JSONArray array= (JSONArray) json.get("Result");
				if(array!=null && array.size()>0) {
					for(int i=0;i<array.size();i++) {
					JSONObject jsonObj = (JSONObject) array.get(i);
					commdityId.add(jsonObj.get("CommodityId")==null?"":jsonObj.get("CommodityId").toString());
					commdityName.add(jsonObj.get("CommodityName")==null?"":jsonObj.get("CommodityName").toString());
					commdityNameDesc.add(jsonObj.get("CommodityDesc")==null?"":jsonObj.get("CommodityDesc").toString());
					commodityModeId.add(jsonObj.get("ModeOfTransport")==null?"":jsonObj.get("ModeOfTransport").toString());
					commodityModeName.add(jsonObj.get("ModeOfTransportDesc")==null?"":jsonObj.get("ModeOfTransportDesc").toString());
					commodityCoverId.add(jsonObj.get("CoverId")==null?"":jsonObj.get("CoverId").toString());
					commodityCoverName.add(jsonObj.get("CoverName")==null?"":jsonObj.get("CoverName").toString());
					commoditybaseRate.add(jsonObj.get("CommodityBaseRate")==null?"":jsonObj.get("CommodityBaseRate").toString());
					commodityexcessPer.add(jsonObj.get("DiscountPercent")==null?"":jsonObj.get("DiscountPercent").toString());
					commodityexcessVal.add(jsonObj.get("DiscountValue")==null?"":jsonObj.get("DiscountValue").toString());
					commodityexcessDesc.add(jsonObj.get("DiscountDesc")==null?"":jsonObj.get("DiscountDesc").toString());
					}
					bean.setCommdityId(commdityId);
					bean.setCommdityName(commdityName);
					bean.setCommdityNameDesc(commdityNameDesc);
					bean.setCommodityModeId(commodityModeId);
					bean.setCommodityModeName(commodityModeName);
					bean.setCommodityCoverId(commodityCoverId);
					bean.setCommodityCoverName(commodityCoverName);
					bean.setCommoditybaseRate(commoditybaseRate);
					bean.setCommodityexcessPer(commodityexcessPer);
					bean.setCommodityexcessVal(commodityexcessVal);
					bean.setCommodityexcessDesc(commodityexcessDesc);
					bean.setCommodityRateList(array);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@SuppressWarnings("unchecked")
	public void addCommodityRate() {
		JSONObject json = null;
		JSONObject jo1 = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		JSONArray arr = new JSONArray();
		JSONArray arr1 = new JSONArray();
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			
			hp.put("ProposalNo", bean.getProposalNo());
			if(bean.getCommdityId()!=null && bean.getCommdityId().size()>0) {
				JSONObject obj = new JSONObject();
				obj.put("CommodityId", bean.getCommdityId().get(0));
				obj.put("CommodityName", bean.getCommdityName().get(0));
				obj.put("CommodityDescription", bean.getCommdityNameDesc().get(0));
				for(int i=0;i<bean.getCommdityId().size();i++) {
					JSONObject obj1 = new JSONObject();
					obj1.put("ModeOfTransport", bean.getCommodityModeId().get(i));
					obj1.put("ModeOfTransportName", bean.getCommodityModeName().get(i));
					obj1.put("CoverId", bean.getCommodityCoverId().get(i));
					obj1.put("CoverName", bean.getCommodityCoverName().get(i));
					obj1.put("BaseRate", bean.getCommoditybaseRate().get(i));
					obj1.put("ExcessPercent", bean.getCommodityexcessPer().get(i));
					obj1.put("ExcessValue", bean.getCommodityexcessVal().get(i));
					obj1.put("ExcessDescription", bean.getCommodityexcessDesc().get(i));
					arr1.add(obj1);
				}
				obj.put("CommodityRateInfo", arr1);
				arr.add(obj);
			}
			
			hp.put("CommodityDetails", arr);
			
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);

				jo1 = (JSONObject) json.get("Result");
				bean.setErrors((JSONArray) jo1.get("ErrorMessage"));
				bean.setProposalNo(jo1.get("ProposalNo")==null?"":jo1.get("ProposalNo").toString()); 
				
			}
			if(bean.getErrors()==null && StringUtils.isNotBlank(bean.getProposalNo())) {
				ApiForCommodity grid=new ApiForCommodity(bean,"editcommodityrate");	
				grid.editcommodityRate();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@SuppressWarnings("unchecked")
	public void getCommodityInfo() {
		JSONObject json = null;
		try {
			JSONObject hp = new JSONObject();
			JSONParser parser = new JSONParser();
			
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
				hp.put("ProposalNo", bean.getProposalNo());
			 	
			 	String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
				if(responseStr!=null && responseStr.length()>0) {
					json = (JSONObject) parser.parse(responseStr);
					JSONObject jo1=(JSONObject) json.get("Result");
					bean.setCommodityinList((JSONArray) jo1.get("CommodityInResponse"));
					bean.setCommoditynotinList((JSONArray) jo1.get("CommodityNotInResponse"));
					if(bean.getCommodityinList()!=null && bean.getCommodityinList().size()>0) {
						Map<String,Object>map=(Map<String, Object>) bean.getCommodityinList().get(0);
						if(StringUtils.isBlank(bean.getCommodityCode()))
						bean.setCommodityCode(map.get("CommodityId")==null?"":map.get("CommodityId").toString());
					}else if(bean.getCommoditynotinList()!=null && bean.getCommoditynotinList().size()>0) {
						Map<String,Object>map=(Map<String, Object>) bean.getCommoditynotinList().get(0);
						if(StringUtils.isBlank(bean.getCommodityCode()))
						bean.setCommodityCode(map.get("CommodityId")==null?"":map.get("CommodityId").toString());
					}
				}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	
	
}
