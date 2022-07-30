package com.maan.NewConditions.Api;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Callable;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import com.maan.NewConditions.ConditionBean;
import com.maan.common.LogUtil;
import com.maan.common.ApiConfig.ApiConfig;
import com.opensymphony.xwork2.ActionContext;


public class ApiForOthers extends ApiConfig implements Callable<Object>{
	Map<String, Object> session=ActionContext.getContext().getSession();
	final static Logger logger = LogUtil.getLogger(ApiForOthers.class);
	private ConditionBean bean;
	private String requestfor;
	public ApiForOthers(ConditionBean bean,String requestfor) {
		this.bean=bean;
		this.requestfor=requestfor.toLowerCase();
	}
	
	@Override
	public Object call() throws Exception {
		
		return null;
	}
	

	@SuppressWarnings("unchecked")
	public void getEditOthers() {
		JSONObject hp = new JSONObject();
		JSONObject json = null;
		JSONObject jo = null;
		JSONParser parser = new JSONParser();
		List<String>otherscheck=new ArrayList<>();
		List<String>othersId=new ArrayList<>();
		List<String>othersName=new ArrayList<>();
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
					JSONObject jsonObj = (JSONObject) array.get(i);
					String checkOtherId =jsonObj.get("OptedOptional")==null?"":jsonObj.get("OptedOptional").toString();
					otherscheck.add("Y".equalsIgnoreCase(checkOtherId)?"true":"false");
					othersId.add(jsonObj.get("OptionalId")==null?"":jsonObj.get("OptionalId").toString());
					othersName.add(jsonObj.get("OptionalDescription")==null?"":jsonObj.get("OptionalDescription").toString());
					commdityIds.add(jsonObj.get("CommodityIds")==null?"":jsonObj.get("CommodityIds").toString().replace("~", ","));
					commdityNames.add(jsonObj.get("CommodityNames")==null?"":jsonObj.get("CommodityNames").toString().replace("~", ","));
					}
					bean.setOtherscheck(otherscheck);
					bean.setOthersId(othersId);
					bean.setOthersName(othersName);
					bean.setCommodityId(commdityIds);
					bean.setCommodityName(commdityNames);
					
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@SuppressWarnings("unchecked")
	public void addOthers() {
		JSONObject json = null;
		JSONObject jo = null;
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
			for (int i = 0; i < bean.getOthersId().size(); i++) {
				JSONObject obj = new JSONObject();
				if("true".equals(bean.getOtherscheck().get(i))) {
				obj.put("OptionalId", bean.getOthersId().get(i));
				obj.put("OptionalDescription", bean.getOthersName().get(i));
				arr.add(obj);
				
				}
			}
			hp1.put("OptionalInfo", arr);
			hp.put("OptionalDetails", hp1);
			
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				
				jo1 = (JSONObject) json.get("Result");
				bean.setErrors((JSONArray) jo1.get("Errors"));
				bean.setProposalNo(jo1.get("ProposalNo")==null?"":jo1.get("ProposalNo").toString()); 
				
			}
			if(bean.getErrors()==null && StringUtils.isNotBlank(bean.getProposalNo())) {
				ApiForOthers grid=new ApiForOthers(bean,"editothers");	
				grid.getEditOthers();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}


}
