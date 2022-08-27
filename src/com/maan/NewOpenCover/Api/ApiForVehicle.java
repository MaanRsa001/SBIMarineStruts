package com.maan.NewOpenCover.Api;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Callable;

import org.apache.logging.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import com.maan.NewOpenCover.OpenCoverBean;
import com.maan.common.LogUtil;
import com.maan.common.ApiConfig.ApiConfig;
import com.opensymphony.xwork2.ActionContext;


public class ApiForVehicle extends ApiConfig implements Callable<Object>{
	Map<String, Object> session=ActionContext.getContext().getSession();
	final static Logger logger = LogUtil.getLogger(ApiForVehicle.class);
	private OpenCoverBean bean;
	private String requestfor;
	public ApiForVehicle(OpenCoverBean bean,String requestfor) {
		this.bean=bean;
		this.requestfor=requestfor.toLowerCase();
	}
	
	@Override
	public Object call() throws Exception {
	
		return null;
	}
	
	

	@SuppressWarnings("unchecked")
	public void addvehicleInfo() {
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
			if(bean.getHaulierCategoryId()!=null && bean.getHaulierCategoryId().size()>0) {
			for(int i=0;i<bean.getHaulierCategoryId().size();i++) {
				JSONObject obj = new JSONObject();
				obj.put("HaulierCategoryId", bean.getHaulierCategoryId().get(i));
				obj.put("HaulierCategory", bean.getHaulierCategory().get(i));
				obj.put("StartLimt", bean.getStartLimit().get(i));
				obj.put("EndLimit", bean.getEndLimit().get(i));
				obj.put("PremiumVec", bean.getPremiumVec().get(i));
				
				arr.add(obj);
				}
			}
			
			hp.put("VehicleRange", arr);
			
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				
				jo1 = (JSONObject) json.get("Result");
				bean.setErrors((JSONArray) jo1.get("ErrorMessage")); 
				bean.setProposalNo(jo1.get("ProposalNo")==null?"":jo1.get("ProposalNo").toString()); 
				
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@SuppressWarnings("unchecked")
	public void getVehicleList() {
		JSONObject hp = new JSONObject();
		JSONObject json = null;
		JSONObject jo = null;
		JSONParser parser = new JSONParser();
		List<String>haulierCategoryId=new ArrayList<>();
		List<String>haulierCategory=new ArrayList<>();
		List<String>startLimit=new ArrayList<>();
		List<String>endLimit=new ArrayList<>();
		List<String>premiumVec=new ArrayList<>();
		
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			hp.put("ProposalNo", bean.getProposalNo());
			
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				
				JSONArray array= (JSONArray) json.get("Result");
				if(array!=null && array.size()>0) {
					for(int i=0;i<array.size();i++) {
					JSONObject jsonObj = (JSONObject) array.get(i);
					haulierCategoryId.add(jsonObj.get("HaulierCategoryId")==null?"":jsonObj.get("HaulierCategoryId").toString());
					haulierCategory.add(jsonObj.get("HaulierCategory")==null?"":jsonObj.get("HaulierCategory").toString());
					startLimit.add(jsonObj.get("StartLimt")==null?"":jsonObj.get("StartLimt").toString());
					endLimit.add(jsonObj.get("EndLimit")==null?"":jsonObj.get("EndLimit").toString());
					premiumVec.add(jsonObj.get("PremiumVec")==null?"":jsonObj.get("PremiumVec").toString());
					
					//bean.setWarmodeTransSize(String.valueOf(array2.size()));
					}
					bean.setHaulierCategoryId(haulierCategoryId);
					bean.setHaulierCategory(haulierCategory);
					bean.setStartLimit(startLimit);
					bean.setEndLimit(endLimit);
					bean.setPremiumVec(premiumVec);
					
				}else {
					List<String>result=new ArrayList<>();
					for(int i=0;i<1;i++){
						result.add("");
					}
					bean.setHaulierCategoryId(result);
					//bean.setWarmodeTransSize(String.valueOf(result.size()));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@SuppressWarnings("unchecked")
	public void editWarRate() {
		JSONObject hp = new JSONObject();
		JSONObject json = null;
		JSONObject jo = null;
		JSONObject jo1 = null;
		JSONParser parser = new JSONParser();
		List<String>warmodeTransId=new ArrayList<>();
		List<String>warmodeTransName=new ArrayList<>();
		List<String>warcityCode=new ArrayList<>();
		List<String>warcityName=new ArrayList<>();
		List<String>warBaseRate=new ArrayList<>();
		
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			hp.put("ProposalNo", bean.getProposalNo());
			hp.put("ModeOfTransport", bean.getProposalNo());
			hp.put("ProposalNo", bean.getProposalNo());
			
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				
				jo1 = (JSONObject) json.get("Result");
				JSONArray array= (JSONArray) jo1.get("TransportInfo");
				if(array!=null && array.size()>0) {
					for(int i=0;i<array.size();i++) {
					JSONObject jsonObj = (JSONObject) array.get(i);
					String modeId="",modeName="";
					modeId=jsonObj.get("ModeOfTransport")==null?"":jsonObj.get("ModeOfTransport").toString();
					modeName=jsonObj.get("ModeOfTransportName")==null?"":jsonObj.get("ModeOfTransportName").toString();
					JSONArray array2= (JSONArray) jsonObj.get("CityInfo");
					if(array2!=null && array2.size()>0) {
						for(int j=0;j<array2.size();j++) {
						JSONObject jsonObj1 = (JSONObject) array2.get(j);
						warmodeTransId.add(modeId);
						warmodeTransName.add(modeName);
						warcityCode.add(jsonObj1.get("CityCode")==null?"":jsonObj1.get("CityCode").toString());
						warcityName.add(jsonObj1.get("CityName")==null?"":jsonObj1.get("CityName").toString());
						warBaseRate.add(jsonObj1.get("WarRate")==null?"":jsonObj1.get("WarRate").toString());
						}
					}
					
					}
					bean.setWarmodeTransId(warmodeTransId);
					bean.setWarmodeTransName(warmodeTransName);
					bean.setWarcityCode(warcityCode);
					bean.setWarcityName(warcityName);
					bean.setWarBaseRate(warBaseRate);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@SuppressWarnings("unchecked")
	public String deleteWarRate() {
		String result="false";
		JSONObject json = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			
			hp.put("ProposalNo", bean.getProposalNo());
			hp.put("ModeOfTransport", bean.getModeOfTransport());
			hp.put("CityCode", bean.getCityCode());
			
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
	public String deleteVehicle() {
		String result="false";
		JSONObject json = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			
			hp.put("ProposalNo", bean.getProposalNo());
			hp.put("Sno", Integer.parseInt(bean.getDeleteId())+1);
			
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

	
	
	
}
