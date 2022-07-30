package com.maan.NewOpenCover.Api;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Callable;

import org.apache.commons.lang3.ArrayUtils;
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


public class ApiForEndorsement extends ApiConfig implements Callable<Object>{
	Map<String, Object> session=ActionContext.getContext().getSession();
	final static Logger logger = LogUtil.getLogger(ApiForEndorsement.class);
	private OpenCoverBean bean;
	private String requestfor;
	public ApiForEndorsement(OpenCoverBean bean,String requestfor) {
		this.bean=bean;
		this.requestfor=requestfor.toLowerCase();
	}
	@Override
	public Object call() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	@SuppressWarnings("unchecked")
	public List<Object> getEndorsementList() {
		List<Object> dropdownList = new ArrayList<>();
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			
			hp.put("ProductId", "11");
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				dropdownList = (JSONArray) parser.parse(responseStr);
			}	
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		return dropdownList;
	}
	@SuppressWarnings("unchecked")
	public void endorsement() {
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
				bean.setEndtYN(json.get("EndorsementYn")==null?"":json.get("EndorsementYn").toString()); 
				bean.setNewproposalNo(json.get("ProposalNo")==null?"":json.get("ProposalNo").toString());
				
			} 
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	@SuppressWarnings("unchecked")
	public void editendorsement() {
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
				String[] ids=json.get("EndorsementType")==null?new String[0]:json.get("EndorsementType").toString().split(",");
				List<Object>endType=new ArrayList<Object>();
				if(ArrayUtils.isNotEmpty(ids)){
					for (int i = 0; i < ids.length; i++) {
						endType.add(ids[i]);
					}
				}
				bean.setEndtType(endType); 
				bean.setPolicyNo(json.get("PolicyNo")==null?"":json.get("PolicyNo").toString());
				bean.setEndtYN(StringUtils.isBlank(bean.getPolicyNo())?"N":"Y");
				bean.setEndtStatus(json.get("EndorsementStatus")==null?"":json.get("EndorsementStatus").toString());
				bean.setEndorsementRemarks(json.get("EndorsementRemarks")==null?"":json.get("EndorsementRemarks").toString());
			} 
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	@SuppressWarnings("unchecked")
	public void updateEndt() {
		JSONObject json = null;
		JSONObject jo = null;
		JSONObject jo1 = null;
		JSONObject hp = new JSONObject();
		JSONArray arr = new JSONArray();
		JSONParser parser = new JSONParser();
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			
			hp.put("ProposalNo", bean.getProposalNo());
			hp.put("CancelDate", bean.getCancellationDate());
			hp.put("CancelRemarks", bean.getCancellationRemarks());
			hp.put("EndtYn", bean.getEndtYN());
			hp.put("EndtRemarks", bean.getEndorsementRemarks());
			if(bean.getEndtType()!=null) {
				 for(int i=0;i<bean.getEndtType().size();i++) {
					 JSONObject abj = new JSONObject();
					 abj.put("EndType", bean.getEndtType().get(i));
					 arr.add(abj);
				 }
				
			 }
			
			hp.put("EndorsementInfo", arr);
			
			
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
	@SuppressWarnings("unchecked")
	public void renew() {
		JSONObject json = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			
			hp.put("ProposalNo", bean.getProposalNo());
			hp.put("OpenCoverNo", bean.getOpenCoverNo());
			
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				bean.setOpenCoverNo(json.get("OpenCoverNo")==null?"":json.get("OpenCoverNo").toString()); 
				bean.setNewproposalNo(json.get("ProposalNo")==null?"":json.get("ProposalNo").toString());
			} 
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
