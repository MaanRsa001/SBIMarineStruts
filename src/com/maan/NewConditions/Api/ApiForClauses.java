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


public class ApiForClauses extends ApiConfig implements Callable<Object>{
	Map<String, Object> session=ActionContext.getContext().getSession();
	final static Logger logger = LogUtil.getLogger(ApiForClauses.class);
	private ConditionBean bean;
	private String requestfor;
	public ApiForClauses(ConditionBean bean,String requestfor) {
		this.bean=bean;
		this.requestfor=requestfor.toLowerCase();
	}
	
	@Override
	public Object call() throws Exception {
		
		return null;
	}
	@SuppressWarnings("unchecked")
	public void getEditClauses() {
		JSONObject hp = new JSONObject();
		JSONObject json = null;
		JSONParser parser = new JSONParser();
		List<String>clausescheck=new ArrayList<>();
		List<String>clausesId=new ArrayList<>();
		List<String>clausesName=new ArrayList<>();
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
					String checkClausesId =jsonObj.get("OptedClauses")==null?"":jsonObj.get("OptedClauses").toString();
					clausescheck.add("Y".equalsIgnoreCase(checkClausesId)?"true":"false");
					clausesId.add(jsonObj.get("ClausesId")==null?"":jsonObj.get("ClausesId").toString());
					clausesName.add(jsonObj.get("ClausesDescription")==null?"":jsonObj.get("ClausesDescription").toString());
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
					bean.setClausescheck(clausescheck);
					bean.setClausesId(clausesId);
					bean.setClausesName(clausesName);
					bean.setCommodityId(commdityIds);
					bean.setCommodityName(commdityNames);
					
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@SuppressWarnings("unchecked")
	public void addClauses() {
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
			for (int i = 0; i < bean.getClausesId().size(); i++) {
				JSONObject obj = new JSONObject();
				if("true".equals(bean.getClausescheck().get(i))) {
				JSONArray arr1 = new JSONArray();
				obj.put("ClausesId", bean.getClausesId().get(i));
				obj.put("ClausesDescription", bean.getClausesName().get(i));
				
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
			hp1.put("ClausesInfo", arr);
			hp.put("ClausesDetails", hp1);
			
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				
				jo1 = (JSONObject) json.get("Result");
				bean.setErrors((JSONArray) jo1.get("ErrorMessage"));
				bean.setProposalNo(jo1.get("ProposalNo")==null?"":jo1.get("ProposalNo").toString()); 
				
			}
			if(bean.getErrors()==null && StringUtils.isNotBlank(bean.getProposalNo())) {
				ApiForClauses grid=new ApiForClauses(bean,"editclauses");	
				grid.getEditClauses();
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
				dropdownList = (JSONArray) json.get("Result");
			}	
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		return dropdownList;
	}
	
	
}
