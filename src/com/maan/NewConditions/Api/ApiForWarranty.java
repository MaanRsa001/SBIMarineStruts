package com.maan.NewConditions.Api;

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

import com.maan.NewConditions.ConditionBean;
import com.maan.common.LogUtil;
import com.maan.common.ApiConfig.ApiConfig;
import com.opensymphony.xwork2.ActionContext;


public class ApiForWarranty extends ApiConfig implements Callable<Object>{
	Map<String, Object> session=ActionContext.getContext().getSession();
	final static Logger logger = LogUtil.getLogger(ApiForWarranty.class);
	private ConditionBean bean;
	private String requestfor;
	public ApiForWarranty(ConditionBean bean,String requestfor) {
		this.bean=bean;
		this.requestfor=requestfor.toLowerCase();
	}
	
	@Override
	public Object call() throws Exception {
		
		return null;
	}
	

	@SuppressWarnings("unchecked")
	public void getEditWarranty() {
		JSONObject hp = new JSONObject();
		JSONObject json = null;
		JSONParser parser = new JSONParser();
		List<String>warrantycheck=new ArrayList<>();
		List<String>warrantyId=new ArrayList<>();
		List<String>warrantyName=new ArrayList<>();
		List<String>commdityIds=new ArrayList<>();
		List<String>commdityNames=new ArrayList<>();
		
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			hp.put("ProposalNo", bean.getProposalNo());
			hp.put("CoverId", bean.getCoverId());
			hp.put("BranchCode", bean.getBelongingBranch());
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				
				JSONArray array= (JSONArray) json.get("Result");
				if(array!=null && array.size()>0) {
					for(int i=0;i<array.size();i++) {
					String commodityId="",commodityName="";
					JSONObject jsonObj = (JSONObject) array.get(i);
					String checkwarrntyId =jsonObj.get("OptedWarranty")==null?"":jsonObj.get("OptedWarranty").toString();
					warrantycheck.add("Y".equalsIgnoreCase(checkwarrntyId)?"true":"false");
					warrantyId.add(jsonObj.get("WarrantyId")==null?"":jsonObj.get("WarrantyId").toString());
					warrantyName.add(jsonObj.get("WarrantyDescription")==null?"":jsonObj.get("WarrantyDescription").toString());
					JSONArray array1= (JSONArray) jsonObj.get("CommodityInfo");
					if(array1!=null && array1.size()>0) {
						for(int j=0;j<array1.size();j++) {
						JSONObject jsonObj1 = (JSONObject) array1.get(j);
						commodityId=commodityId+","+(jsonObj1.get("CommodityId")==null?"":jsonObj1.get("CommodityId").toString());
						commodityName=commodityName+","+(jsonObj1.get("CommodityName")==null?"":jsonObj1.get("CommodityName").toString());
						}
					}
					commdityIds.add(commodityId.replaceFirst(",", ""));
					commdityNames.add(commodityName.replaceFirst(",", ""));
					}
					bean.setWarrantycheck(warrantycheck);
					bean.setWarrantyId(warrantyId);
					bean.setWarrantyName(warrantyName);
					bean.setCommodityId(commdityIds);
					bean.setCommodityName(commdityNames);
					
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@SuppressWarnings("unchecked")
	public void addWarranty() {
		JSONObject json = null;
		JSONObject jo1 = null;
		JSONObject hp = new JSONObject();
		JSONObject hp1 = new JSONObject();
		JSONParser parser = new JSONParser();
		JSONArray arr = new JSONArray();
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			
			hp.put("ProposalNo", bean.getProposalNo());
			hp1.put("ModeOfTransport", bean.getModeOfTransport());
			hp1.put("ModeOfTransportName", bean.getModeOfTransportName());
			hp1.put("CoverId", bean.getCoverId());
			hp1.put("CoverName", bean.getCoverName());
			for (int i = 0; i < bean.getWarrantyId().size(); i++) {
				JSONObject obj = new JSONObject();
				if("true".equals(bean.getWarrantycheck().get(i))) {
				JSONArray arr1 = new JSONArray();
				obj.put("WarrantyId", bean.getWarrantyId().get(i));
				obj.put("WarrantyDescription", bean.getWarrantyName().get(i));
				
				List<String>commodityId=new ArrayList<String>(Arrays.asList(bean.getCommodityId().get(i).split(",")));
				List<String>commodityName=new ArrayList<String>(Arrays.asList(bean.getCommodityName().get(i).split(",")));
				if(commodityId!=null && commodityId.size()>0) {
				for (int k = 0; k < commodityId.size(); k++) {
					
					JSONObject obj1 = new JSONObject();
					obj1.put("CommodityId", commodityId.get(k));
					obj1.put("CommodityName", commodityName.get(k));
					arr1.add(obj1);
				}
				}
				obj.put("CommodityDetails", arr1);
				arr.add(obj);
				}
			}
			hp1.put("WarrantyInfo", arr);
			hp.put("WarrantyDetails", hp1);
			
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				
				jo1 = (JSONObject) json.get("Result");
				bean.setErrors((JSONArray) jo1.get("ErrorMessage"));
				bean.setProposalNo(jo1.get("ProposalNo")==null?"":jo1.get("ProposalNo").toString()); 
				
			}
			if(bean.getErrors()==null && StringUtils.isNotBlank(bean.getProposalNo())) {
				ApiForWarranty grid=new ApiForWarranty(bean,"editwarranty");	
				grid.getEditWarranty();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@SuppressWarnings("unchecked")
	public List<Object> getCoverClausesList() {
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
				dropdownList = (JSONArray) json.get("Response");
			}	
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		return dropdownList;
	}
	
	
}
