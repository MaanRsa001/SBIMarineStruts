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


public class ApiForSharePercent extends ApiConfig implements Callable<Object>{
	Map<String, Object> session=ActionContext.getContext().getSession();
	final static Logger logger = LogUtil.getLogger(ApiForSharePercent.class);
	private OpenCoverBean bean;
	private String requestfor;
	public ApiForSharePercent(OpenCoverBean bean,String requestfor) {
		this.bean=bean;
		this.requestfor=requestfor.toLowerCase();
	}
	
	@Override
	public Object call() throws Exception {
		
		return null;
	}
	@SuppressWarnings("unchecked")
	public Object savesharepercent() {
		JSONObject json = null;
		JSONObject jo = null;
		JSONObject jo1 = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		JSONArray arr = new JSONArray();
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			
			hp.put("ProposalNo", bean.getProposalNo());
			for (int i = 0; i < bean.getCompanyId().size(); i++) {
				JSONObject obj = new JSONObject();
				obj.put("InsuranceCompanyCode", bean.getCompanyId().get(i));
				obj.put("InsuranceCompanyName", bean.getCompanyName().get(i));
				obj.put("SharePercentage", bean.getShareValue().get(i));
				obj.put("LeadershipYn", bean.getLeaderYN().get(i));
				arr.add(obj);
				
			}
			
			hp.put("InsuranceCompanyInfo", arr);
			
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				
				jo1 = (JSONObject) json.get("Result");
				bean.setErrors((JSONArray) jo1.get("Errors"));
				bean.setProposalNo(jo1.get("ProposalNo")==null?"":jo1.get("ProposalNo").toString()); 
				
			}
			if(bean.getErrors()==null && StringUtils.isNotBlank(bean.getProposalNo())) {
				ApiForSharePercent grid=new ApiForSharePercent(bean,"editcompanydetail");	
				grid.editcompanydetail();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
	@SuppressWarnings("unchecked")
	public List<Object> getCompanyList() {
		List<Object> dropdownList = new ArrayList<>();
		JSONObject json = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		List<String>companyId=new ArrayList<>();
		List<String>companyName=new ArrayList<>();
		List<String>shareValue=new ArrayList<>();
		List<String>leaderYN=new ArrayList<>();
		List<String>noofInsrance=new ArrayList<>();
		
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
				   hp.put("ProposalNo", bean.getProposalNo());
				   hp.put("ProductId", "11");
				
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				JSONObject jo1 = (JSONObject) json.get("Result");
				bean.setOrginalInsuranceList((JSONArray) jo1.get("OrginalInsuranceResponse"));
				bean.setAdditionalInsuranceList((JSONArray) jo1.get("AdditonalInsuranceResponse"));
				ApiForSharePercent grid=new ApiForSharePercent(bean,"editcompanydetail");	
				grid.editcompanydetail();
				
				if(bean.getOrginalInsuranceList()!=null && bean.getOrginalInsuranceList().size()>0 ) {
					Map<String,Object>map=(Map<String, Object>) bean.getOrginalInsuranceList().get(0);
					noofInsrance.add(map.get("NoofInsuranceCompany")==null?"":map.get("NoofInsuranceCompany").toString());
					if("0".equals(noofInsrance.get(0))) {
						shareValue.add(map.get("SharedPercentage")==null?"":map.get("SharedPercentage").toString());
					}
					if(bean.getCompanyId()==null) {
					companyId.add(map.get("InsuranceCompanyId")==null?"":map.get("InsuranceCompanyId").toString());
					companyName.add(map.get("InsuranceCompanyName")==null?"":map.get("InsuranceCompanyName").toString());
					leaderYN.add(map.get("LeadershipYn")==null?"":map.get("LeadershipYn").toString());
					
					bean.setCompanyId(companyId);
					bean.setCompanyName(companyName);
					bean.setShareValue(shareValue);
					bean.setLeaderYN(leaderYN);
					}
					bean.setNoofInsrance(noofInsrance);
					bean.setShareValue(shareValue);
				}
				
			}	
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		return dropdownList;
	}

	

	@SuppressWarnings("unchecked")
	public void editcompanydetail() {
		JSONObject hp = new JSONObject();
		JSONObject json = null;
		JSONObject jo1 = null;
		JSONParser parser = new JSONParser();
		List<String>companyId=new ArrayList<>();
		List<String>companyName=new ArrayList<>();
		List<String>shareValue=new ArrayList<>();
		List<String>leaderYN=new ArrayList<>();
		
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			hp.put("ProposalNo", bean.getProposalNo());
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				
				jo1 = (JSONObject) json.get("SharePercentageResponse");
				JSONArray array= (JSONArray) jo1.get("InsuranceCompanyInfo");
				if(array!=null && array.size()>0) {
					for(int i=0;i<array.size();i++) {
					JSONObject jsonObj = (JSONObject) array.get(i);
					companyId.add(jsonObj.get("InsuranceCompanyCode")==null?"":jsonObj.get("InsuranceCompanyCode").toString());
					companyName.add(jsonObj.get("InsuranceCompanyName")==null?"":jsonObj.get("InsuranceCompanyName").toString());
					shareValue.add(jsonObj.get("SharePercentage")==null?"":jsonObj.get("SharePercentage").toString());
					leaderYN.add(jsonObj.get("LeadershipYn")==null?"":jsonObj.get("LeadershipYn").toString());
					
					}
					bean.setCompanyId(companyId);
					bean.setCompanyName(companyName);
					bean.setShareValue(shareValue);
					bean.setLeaderYN(leaderYN);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	
}
