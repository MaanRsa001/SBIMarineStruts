package com.maan.NewOpenCover.Api;

import java.util.ArrayList;
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


public class ApiForDropDown extends ApiConfig implements Callable<Object>{
	Map<String, Object> session=ActionContext.getContext().getSession();
	final static Logger logger = LogUtil.getLogger(ApiForDropDown.class);
	private OpenCoverBean bean;
	private String requestfor;
	private String type;
	public ApiForDropDown(OpenCoverBean bean,String requestfor, String type) {
		this.bean=bean;
		this.requestfor=requestfor.toLowerCase();
		this.type=type;
	}
	
	@Override
	public Object call() throws Exception {
		return null;
	}
	
	@SuppressWarnings("unchecked")
	public List<Object> getDropDownList() {
		List<Object> dropdownList = new ArrayList<>();
		JSONObject json = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			if("brokerlist".equalsIgnoreCase(requestfor)) {
				hp.put("BranchCode", bean.getBranchCode());
			}
			else if("declarationlist".equalsIgnoreCase(requestfor)) {
				hp.put("BranchCode", bean.getBelongingBranch());
			}
			else if("executivelist".equalsIgnoreCase(requestfor)) {
			
			}
			else if("businessTypelist".equalsIgnoreCase(requestfor)) {
				//hp.put("CategoryId", "142");
				hp.put("BranchCode", bean.getBelongingBranch());
			}
			else if("opencovertypelist".equalsIgnoreCase(requestfor)) {
				hp.put("BranchCode", bean.getBelongingBranch());
			}
			else if("currencylist".equalsIgnoreCase(requestfor)) {
				hp.put("BranchCode", bean.getBelongingBranch());
			}
			else if("citylist".equalsIgnoreCase(requestfor)) {
				hp.put("BranchCode", bean.getBelongingBranch());
				hp.put("ProductId", "3");
			}
			else if("titlelist".equalsIgnoreCase(requestfor)) {
				hp.put("BranchCode", bean.getBelongingBranch());
				hp.put("ProductId", "3");
			
			}else if("haulierlist".equalsIgnoreCase(requestfor)) {
				hp.put("BranchCode", bean.getBelongingBranch());
			}
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				if("citylist".equalsIgnoreCase(requestfor) || "titlelist".equalsIgnoreCase(requestfor)) {
					dropdownList = (JSONArray) json.get("Result");
				}else {
				dropdownList = (JSONArray) json.get("Result");
				}
			}	
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		return dropdownList;
	}
	@SuppressWarnings("unchecked")
	public String getOpenCoverType() {
		String result="";
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
				result = json.get("OpenCoverType")==null?"":json.get("OpenCoverType").toString();
			}	
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public String getWarSrcYN() {
		String result="";
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
				result = json.get("Result")==null?"":json.get("Result").toString();
			}	
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public String getHaulierType() {
		String result="";
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
				result = json.get("HaulierYn")==null?"":json.get("HaulierYn").toString();
			}	
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		return result;
	}
	
}
