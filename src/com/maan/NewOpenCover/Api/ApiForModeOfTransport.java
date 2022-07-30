package com.maan.NewOpenCover.Api;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
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


public class ApiForModeOfTransport extends ApiConfig implements Callable<Object>{
	Map<String, Object> session=ActionContext.getContext().getSession();
	final static Logger logger = LogUtil.getLogger(ApiForModeOfTransport.class);
	private OpenCoverBean bean;
	private String requestfor;
	public ApiForModeOfTransport(OpenCoverBean bean,String requestfor) {
		this.bean=bean;
		this.requestfor=requestfor.toLowerCase();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Object call() throws Exception {
		List<Object>result=new ArrayList<>();
		JSONObject hp = new JSONObject();
		JSONObject json = null;
		JSONObject jo = null;
		JSONParser parser = new JSONParser();
		List<String>modeTransportcheck=new ArrayList<>();
		List<String>modeTransportId=new ArrayList<>();
		List<String>modeTransportName=new ArrayList<>();
		List<String>covercheck=new ArrayList<>();
		List<String>modecoverId=new ArrayList<>();
		List<String>coverId=new ArrayList<>();
		List<String> coverTypeId=new ArrayList<>();
		List<String> coverTypeName=new ArrayList<>();
		List<String>coverName=new ArrayList<>();
		List<String>currencyId=new ArrayList<>();
		List<String>currencyName=new ArrayList<>();
		List<String>currencyValue=new ArrayList<>();
		
		List<String>perbottomLimit=new ArrayList<>();
		List<String>locationLimit=new ArrayList<>();

		String authorization="";
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
				JSONArray array= (JSONArray) jo.get("TransportDetails");
				
					
				if(array!=null && array.size()>0) {
					for(int i=0;i<array.size();i++) {
					JSONObject jsonObj = (JSONObject) array.get(i);
					String modeoftranscheck=jsonObj.get("ModeOfCheck")==null?"":jsonObj.get("ModeOfCheck").toString();
					modeTransportcheck.add(StringUtils.isBlank(modeoftranscheck)?"false":"true");
					modeTransportId.add(jsonObj.get("ModeOfTransport")==null?"":jsonObj.get("ModeOfTransport").toString());
					modeTransportName.add(jsonObj.get("ModeOfTransportName")==null?"":jsonObj.get("ModeOfTransportName").toString());
					currencyId.add(jsonObj.get("CurrencyId")==null?"":jsonObj.get("CurrencyId").toString());
					currencyName.add(jsonObj.get("CurrencyName")==null?"":jsonObj.get("CurrencyName").toString());
					currencyValue.add(jsonObj.get("CurrencyValue")==null?"":jsonObj.get("CurrencyValue").toString());
					perbottomLimit.add(jsonObj.get("PerBottomLimit")==null?"":jsonObj.get("PerBottomLimit").toString());
					locationLimit.add(jsonObj.get("LocationLimit")==null?"":jsonObj.get("LocationLimit").toString());
					
					JSONArray array1= (JSONArray) jsonObj.get("CoverInfo");
					if(array1!=null && array1.size()>0) {
						for(int j=0;j<array1.size();j++) {
							JSONObject jsonObj1 = (JSONObject) array1.get(j);
							String coverIdcheck=jsonObj1.get("CoverCheck")==null?"":jsonObj1.get("CoverCheck").toString();
							covercheck.add(StringUtils.isBlank(coverIdcheck)?"false":"true");
							coverId.add(jsonObj1.get("CoverId")==null?"":jsonObj1.get("CoverId").toString());
							coverName.add(jsonObj1.get("CoverName")==null?"":jsonObj1.get("CoverName").toString());
							modecoverId.add(jsonObj1.get("ModeOfTransport")==null?"":jsonObj1.get("ModeOfTransport").toString());
							JSONArray array2= (JSONArray) jsonObj1.get("CoverTypeInfo");
							if(array2!=null && array2.size()>0) {
								String coverTypeIds="",coverTypeNames="";
								for(int k=0;k<array2.size();k++) {
									JSONObject jsonObj2 = (JSONObject) array2.get(k);
									coverTypeIds=coverTypeIds+","+jsonObj2.get("CoverTypeId");
									coverTypeNames=coverTypeNames+","+jsonObj2.get("CoverTypeName");
								}
								coverTypeId.add(coverTypeIds.replaceFirst(",", ""));
								coverTypeName.add(coverTypeNames.replaceFirst(",", ""));
							}else {
								coverTypeId.add("");
								coverTypeName.add("");
							}
							
						}
					}
							
					}
					bean.setModeTransportcheck(modeTransportcheck);
					bean.setModeTransportId(modeTransportId);
					bean.setModeTransportName(modeTransportName);
					bean.setCovercheck(covercheck);
					bean.setModecoverId(modecoverId);
					bean.setCoverId(coverId);
					bean.setCoverName(coverName);
					bean.setCoverTypeId(coverTypeId);
					bean.setCoverTypeName(coverTypeName);
					bean.setCurrencyId(currencyId);
					bean.setCurrencyName(currencyName);
					bean.setCurrencyValue(currencyValue);
					bean.setPerbottomLimit(perbottomLimit);
					bean.setLocationLimit(locationLimit);
					bean.setModeoftransList(array);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	@SuppressWarnings("unchecked")
	public Object insertmodecover() {
		JSONObject json = null;
		JSONObject jo = null;
		JSONObject jo1 = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		JSONArray arr = new JSONArray();
		JSONArray arr1 = new JSONArray();
		JSONArray arr2 = new JSONArray();
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			
			hp.put("ProposalNo", bean.getProposalNo());
			for (int i = 0; i < bean.getModeTransportId().size(); i++) {
				JSONObject obj = new JSONObject();
				if("true".equals(bean.getModeTransportcheck().get(i))) {
					arr1 = new JSONArray();
					obj.put("ModeOfTransport", bean.getModeTransportId().get(i));
					obj.put("ModeOfTransportName", bean.getModeTransportName().get(i));
					for (int j = 0; j < bean.getCoverId().size(); j++) {
						if(bean.getModeTransportId().get(i).equals(bean.getModecoverId().get(j))) {
							if("true".equals(bean.getCovercheck().get(j))) {
								arr2 = new JSONArray();
								JSONObject obj1 = new JSONObject();
								List<String>coverTypeId=new ArrayList<String>(Arrays.asList(bean.getCoverTypeId().get(j).split(",")));
								List<String>coverTypeDesc=new ArrayList<String>(Arrays.asList(bean.getCoverTypeName().get(j).split(",")));
								obj1.put("CoverId", bean.getCoverId().get(j));
								obj1.put("CoverName", bean.getCoverName().get(j));
								for (int k = 0; k < coverTypeId.size(); k++) {
									
									JSONObject obj2 = new JSONObject();
									obj2.put("CoverTypeId", coverTypeId.get(k));
									obj2.put("CoverTypeName", coverTypeDesc.get(k));
									arr2.add(obj2);
								}
								obj1.put("CoverTypeInfo", arr2);
								arr1.add(obj1);
							}
						}
					}
					obj.put("CoverInfo", arr1);
					obj.put("CurrencyId", bean.getCurrencyId().get(i));
					obj.put("CurrencyName", bean.getCurrencyName().get(i));
					obj.put("CurrencyValue", bean.getCurrencyValue().get(i));
					obj.put("PerBottomLimit", bean.getPerbottomLimit().get(i));
					obj.put("LocationLimit", bean.getLocationLimit().get(i));
					arr.add(obj);
				}
			}
			hp.put("TransportDetails", arr);
			
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
			
				jo1 = (JSONObject) json.get("Result");
				bean.setErrors((JSONArray) jo1.get("Errors"));
				bean.setProposalNo(jo1.get("ProposalNo")==null?"":jo1.get("ProposalNo").toString()); 
				
			} 
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
	@SuppressWarnings("unchecked")
	public List<Object> getModeOfTransportList() {
		List<Object> dropdownList = new ArrayList<>();
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			hp.put("BranchCode", bean.getBranchCode());
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				dropdownList = (JSONArray) parser.parse(responseStr);
			}	
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		return dropdownList;
	}

	@SuppressWarnings("unchecked")
	public List<Object> getEditModeTransportList() {
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

	public List<Object> getModewarRateList() {
		List<Object> result=new ArrayList<>();
		Map<String,Object> map=new HashMap<String, Object>();
		for(int i=0;i<1;i++){
			map.put("1", "1");
			result.add(map);
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public void getSecondPageValid() {
		JSONObject json = null;
		JSONObject jo1 = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();

		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			
			hp.put("ProposalNo", bean.getProposalNo());
			
			
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				
				jo1 = (JSONObject) json.get("Result");
				bean.setErrors((JSONArray) jo1.get("Errors"));
				bean.setProposalNo(jo1.get("ProposalNo")==null?"":jo1.get("ProposalNo").toString()); 
				
			} 
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
