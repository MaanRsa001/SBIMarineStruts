package com.maan.NewOpenCover.Api;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Callable;

import org.apache.logging.log4j.Logger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.maan.NewOpenCover.OpenCoverBean;
import com.maan.common.LogUtil;
import com.maan.common.ApiConfig.ApiConfig;
import com.opensymphony.xwork2.ActionContext;


public class ApiForCover extends ApiConfig implements Callable<Object>{
	Map<String, Object> session=ActionContext.getContext().getSession();
	final static Logger logger = LogUtil.getLogger(ApiForCover.class);
	private OpenCoverBean bean;
	private String requestfor;
	public ApiForCover(OpenCoverBean bean,String requestfor) {
		this.bean=bean;
		this.requestfor=requestfor.toLowerCase();
	}
	
	@Override
	public Object call() throws Exception {
		return null;
	}
	@SuppressWarnings("unchecked")
	public Object savemodeoftransort() {
		JSONObject json = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			
			hp.put("Type", bean.getIdentify());
			hp.put("ProposalNo", bean.getProposalNo());
			hp.put("TransitCountryId", new ArrayList<String>(Arrays.asList(bean.getTransit_countryId().split(","))));
			hp.put("DestinationCountryId",  new ArrayList<String>(Arrays.asList(bean.getDestination_countryId().split(","))));
			
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
			} 
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
	}
	@SuppressWarnings("unchecked")
	public List<Object> getCoverageList() {
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
	public List<Object> getCovertypeList() {
		List<Object> dropdownList = new ArrayList<>();
		JSONObject json = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			hp.put("ModeOfTransportCode", bean.getModeOfTransport());
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

	public void addClauses() {
		// TODO Auto-generated method stub
		
	}
	
}
