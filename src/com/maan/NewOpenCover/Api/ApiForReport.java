package com.maan.NewOpenCover.Api;

import java.util.Map;
import java.util.concurrent.Callable;

import org.apache.logging.log4j.Logger;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import com.maan.NewOpenCover.reports.ReportRegBean;
import com.maan.common.LogUtil;
import com.maan.common.ApiConfig.ApiConfig;
import com.opensymphony.xwork2.ActionContext;


public class ApiForReport extends ApiConfig implements Callable<Object>{
	Map<String, Object> session=ActionContext.getContext().getSession();
	final static Logger logger = LogUtil.getLogger(ApiForReport.class);
	private ReportRegBean bean;
	private String requestfor;
	public ApiForReport(ReportRegBean bean,String requestfor) {
		this.bean=bean;
		this.requestfor=requestfor.toLowerCase();
	}
	
	@Override
	public Object call() throws Exception {
	
		return null;
	}
	
	@SuppressWarnings("unchecked")
	public String opencoverschedule() {
		String result="";
		JSONObject json = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			
			hp.put("BranchCode", bean.getBranchCode());
			hp.put("EndtStatus", bean.getEndtstatus());
			hp.put("ImageStatus", "Y");
			hp.put("OpenCoverNo", bean.getOpencoverNo());
			hp.put("ProposalNo", bean.getProposalNo());
			hp.put("Status", "Y");
			
			
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				result=json.get("Result")==null?"":json.get("Result").toString(); 
				
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public String opencoverdebitcredit() {
		String result="";
		JSONObject json = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			
	
			hp.put("PolicyNo", bean.getOpencoverNo());
			hp.put("Type", bean.getDocType());
			
			
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				result=json.get("Result")==null?"":json.get("Result").toString(); 
				
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public String opencoverendt() {
		String result="";
		JSONObject json = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			
			hp.put("ImageStatus", "Y");
			hp.put("OpenCoverNo", bean.getOpencoverNo());
			hp.put("ProposalNo", bean.getProposalNo());
			
			
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				result=json.get("Result")==null?"":json.get("Result").toString(); 
				
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public String opencoverclausespdf() {
		String result="";
		JSONObject json = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			
			hp.put("OpenCoverNo", bean.getOpencoverNo());
			hp.put("BranchCode", "01");
			hp.put("ProposalNo", bean.getProposalNo());
			
			
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				result=json.get("Result")==null?"":json.get("Result").toString(); 
				
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	

	
	
}
