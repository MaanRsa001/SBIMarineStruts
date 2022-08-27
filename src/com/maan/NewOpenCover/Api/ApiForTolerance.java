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


public class ApiForTolerance extends ApiConfig implements Callable<Object>{
	Map<String, Object> session=ActionContext.getContext().getSession();
	final static Logger logger = LogUtil.getLogger(ApiForTolerance.class);
	private OpenCoverBean bean;
	private String requestfor;
	public ApiForTolerance(OpenCoverBean bean,String requestfor) {
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
		String toleranceId="",toleranceName="",authorization="";
		
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
				JSONArray array1= (JSONArray) jo.get("ToleranceInfo");
				if(array1!=null && array1.size()>0) {
					for(int i=0;i<array1.size();i++) {
					JSONObject jsonObj = (JSONObject) array1.get(i);
					toleranceId=toleranceId+","+jsonObj.get("ToleranceId");
					toleranceName=toleranceName+","+jsonObj.get("ToleranceName");
					}
					toleranceId=toleranceId.replaceFirst(",", "");
					toleranceName=toleranceName.replaceFirst(",", "");
					bean.setToleranceId(toleranceId);
					bean.setToleranceIds(toleranceId);
					bean.setTolerance(toleranceName);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	@SuppressWarnings("unchecked")
	public List<Object> getToleranceList() {
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
	public Object savetolerance() {
		try {
			JSONObject json,jo,jo1 = null;
			JSONObject hp = new JSONObject();
			JSONParser parser = new JSONParser();
			JSONArray arr = new JSONArray();
			//String toleranceId="",toleranceName="";
			
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			
			hp.put("ProposalNo", bean.getProposalNo());
			
			if(StringUtils.isNotBlank(bean.getToleranceId())) {
				List<String>tolerance=new ArrayList<String>(Arrays.asList(bean.getToleranceId().split(",")));
				List<String>toleranceDes=new ArrayList<String>(Arrays.asList(bean.getTolerance().split(",")));
				for (int i = 0; i < tolerance.size(); i++) {
					JSONObject obj = new JSONObject();
					obj.put("ToleranceId", tolerance.get(i));
					obj.put("ToleranceName", toleranceDes.get(i));
					arr.add(obj);
					
				}
			}
			hp.put("ToleranceInfo", arr);
			
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				
				jo1 = (JSONObject) json.get("Result");
				bean.setErrors((JSONArray) jo1.get("ErrorMessage"));
			}
			if(bean.getErrors()==null && StringUtils.isNotBlank(bean.getProposalNo())) {
				ApiForTolerance grid=new ApiForTolerance(bean,"edittolerance");	
					grid.call();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
	@SuppressWarnings("unchecked")
	public void getIncludeExcludeToleranceList() {
		JSONObject json = null;
		try {
			JSONObject hp = new JSONObject();
			JSONParser parser = new JSONParser();
			JSONArray arr = new JSONArray();
			List<String>tolerance=null;
			if(StringUtils.isNotBlank(bean.getToleranceIds())) {
				tolerance=Arrays.asList(bean.getToleranceIds().split(","));
			}
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
				hp.put("BranchCode", bean.getBelongingBranch());
				if(tolerance!=null) {
					 for(int i=0;i<tolerance.size();i++) {
						 JSONObject abj = new JSONObject();
						 abj.put("ToleranceId", tolerance.get(i));
						 arr.add(abj);
					 }
					
				 }
				hp.put("ToleranceInfo", arr);
			 	String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
				if(responseStr!=null && responseStr.length()>0) {
					json = (JSONObject) parser.parse(responseStr);
					bean.setIncludeList((JSONArray) json.get("ToleranceIncludeResponse"));
					bean.setExcludeList((JSONArray) json.get("ToleranceExcludeResponse"));
				}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
