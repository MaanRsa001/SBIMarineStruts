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


public class ApiForWar extends ApiConfig implements Callable<Object>{
	Map<String, Object> session=ActionContext.getContext().getSession();
	final static Logger logger = LogUtil.getLogger(ApiForWar.class);
	private ConditionBean bean;
	private String requestfor;
	public ApiForWar(ConditionBean bean,String requestfor) {
		this.bean=bean;
		this.requestfor=requestfor.toLowerCase();
	}
	
	@Override
	public Object call() throws Exception {
		
		return null;
	}
	

	@SuppressWarnings("unchecked")
	public void getEditWar() {
		JSONObject hp = new JSONObject();
		JSONObject json = null;
		JSONObject jo = null;
		JSONParser parser = new JSONParser();
		List<String>warcheck=new ArrayList<>();
		List<String>warrId=new ArrayList<>();
		List<String>warName=new ArrayList<>();
		List<String>warcoverId=new ArrayList<>();
		List<String>warcoverName=new ArrayList<>();
		List<String>commdityIds=new ArrayList<>();
		List<String>commdityNames=new ArrayList<>();
		
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			hp.put("ProposalNo", bean.getProposalNo());
			hp.put("BranchCode", bean.getBelongingBranch());
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				
				JSONArray array= (JSONArray) json.get("Result");
				if(array!=null && array.size()>0) {
					for(int i=0;i<array.size();i++) {
					JSONObject jsonObj = (JSONObject) array.get(i);
					String checkwarId =jsonObj.get("OptedWar")==null?"":jsonObj.get("OptedWar").toString();
					warcheck.add("Y".equalsIgnoreCase(checkwarId)?"true":"false");
					warrId.add(jsonObj.get("WarId")==null?"":jsonObj.get("WarId").toString());
					warName.add(jsonObj.get("WarDescription")==null?"":jsonObj.get("WarDescription").toString());
					warcoverId.add(jsonObj.get("CoverId")==null?"":jsonObj.get("CoverId").toString());
					warcoverName.add(jsonObj.get("CoverName")==null?"":jsonObj.get("CoverName").toString());
					commdityIds.add(jsonObj.get("CommodityIds")==null?"":jsonObj.get("CommodityIds").toString().replace("~", ","));
					commdityNames.add(jsonObj.get("CommodityNames")==null?"":jsonObj.get("CommodityNames").toString().replace("~", ","));
					}
					bean.setWarcheck(warcheck);
					bean.setWarrId(warrId);
					bean.setWarName(warName);
					bean.setWarcoverId(warcoverId);
					bean.setWarcoverName(warcoverName);
					bean.setCommodityId(commdityIds);
					bean.setCommodityName(commdityNames);
					
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@SuppressWarnings("unchecked")
	public void addWar() {
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
			hp.put("BranchCode", bean.getBranchCode());
			
			for (int i = 0; i < bean.getWarrId().size(); i++) {
				JSONObject obj = new JSONObject();
				if("true".equals(bean.getWarcheck().get(i))) {
				obj.put("WarId", bean.getWarrId().get(i));
				obj.put("WarDescription", bean.getWarName().get(i));
				obj.put("CoverId", bean.getWarcoverId().get(i));
				obj.put("CoverName", bean.getWarcoverName().get(i));
				arr.add(obj);
				}
			}
			hp.put("WarInfo", arr);
			
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				
				jo1 = (JSONObject) json.get("Result");
				bean.setErrors((JSONArray) jo1.get("Errors"));
				bean.setProposalNo(jo1.get("ProposalNo")==null?"":jo1.get("ProposalNo").toString()); 
				
			}
			if(bean.getErrors()==null && StringUtils.isNotBlank(bean.getProposalNo())) {
				ApiForWar grid=new ApiForWar(bean,"editwar");	
				grid.getEditWar();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
