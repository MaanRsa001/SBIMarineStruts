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


public class ApiForPremiumCal extends ApiConfig implements Callable<Object>{
	Map<String, Object> session=ActionContext.getContext().getSession();
	final static Logger logger = LogUtil.getLogger(ApiForPremiumCal.class);
	private OpenCoverBean bean;
	private String requestfor;
	public ApiForPremiumCal(OpenCoverBean bean,String requestfor) {
		this.bean=bean;
		this.requestfor=requestfor.toLowerCase();
	}
	
	@Override
	public Object call() throws Exception {
		
		return null;
	}
	@SuppressWarnings("unchecked")
	public Object insertpremiuminfo() {
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
		return null;
		
	}
	@SuppressWarnings("unchecked")
	public void getPremiumInformation() {
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
				
				JSONArray array= (JSONArray) json.get("Result");
				JSONObject jsonObj = (JSONObject) array.get(0);
				bean.setPsuminsured(jsonObj.get("SumInsured")==null?"0":jsonObj.get("SumInsured").toString());
				bean.setPmarineRate(jsonObj.get("MarineRate")==null?"":jsonObj.get("MarineRate").toString());
				bean.setPwarRate(jsonObj.get("WarRate")==null?"":jsonObj.get("WarRate").toString());
				bean.setBalanceDepositPremium(jsonObj.get("ReceivedTilDate")==null?"0":jsonObj.get("ReceivedTilDate").toString());
			
				if(bean.getErrors()==null || bean.getErrors().size()==0) {
				bean.setTotalPremium(jsonObj.get("TotalPremium")==null?"0":jsonObj.get("TotalPremium").toString());
				bean.setActualPremium(jsonObj.get("TotalPremium")==null?"0":jsonObj.get("TotalPremium").toString());
				bean.setPolicyFee((jsonObj.get("PolicyFee")==null ||"".equals(jsonObj.get("PolicyFee"))) ?"0":jsonObj.get("PolicyFee").toString());
				
				bean.setInceptionFee(jsonObj.get("InspectionFee")==null?"0":jsonObj.get("InspectionFee").toString());
				bean.setFinalPremium(jsonObj.get("FinalPremium")==null?"0":jsonObj.get("FinalPremium").toString());
				bean.setReceviedAmt(jsonObj.get("ReceivedTilDate")==null?"0":jsonObj.get("ReceivedTilDate").toString());
				bean.setPolicyFeeRcvd(jsonObj.get("PolicyFeeReceived")==null?"0":jsonObj.get("PolicyFeeReceived").toString());
				bean.setInceptionFeeRcvd(jsonObj.get("InspectionFeeReceived")==null?"0":jsonObj.get("InspectionFeeReceived").toString());
				
				bean.setPremiumRcvd(jsonObj.get("PremiumReceived")==null?"0":jsonObj.get("PremiumReceived").toString());
				bean.setBalanceAmt(jsonObj.get("BalanceAmount")==null?"0":jsonObj.get("BalanceAmount").toString());
				bean.setPolicyFeeBal(jsonObj.get("PolicyFeeBalance")==null?"0":jsonObj.get("PolicyFeeBalance").toString());
				bean.setInceptionFeeBal(jsonObj.get("InsceptionFeeBalance")==null?"0":jsonObj.get("InsceptionFeeBalance").toString());
				bean.setReceviedTot(jsonObj.get("ReceivedTotal")==null?"0":jsonObj.get("ReceivedTotal").toString());
				
				bean.setChargeableYN(jsonObj.get("PayableYn")==null?"":jsonObj.get("PayableYn").toString());
				bean.setRefundAmt(jsonObj.get("PayableMarinePremium")==null?"0":jsonObj.get("PayableMarinePremium").toString());
				bean.setPolicyFeePaid(jsonObj.get("PolicyFeePaid")==null?"0":jsonObj.get("PolicyFeePaid").toString());
				bean.setInceptionFeePaid(jsonObj.get("InspectionFeePaid")==null?"0":jsonObj.get("InspectionFeePaid").toString());
				bean.setTotal(jsonObj.get("Total")==null?"0":jsonObj.get("Total").toString());
				bean.setRefundChrgYN(getRefundChrgYN());
				if("N".equals(bean.getRefundChrgYN())) {
					bean.setRefundAmt("0");
					bean.setPolicyFeePaid("0");
					bean.setInceptionFeePaid("0");
					bean.setTotal("0");
				}
				}
				
			} 
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@SuppressWarnings("unchecked")
	public void calculatepremium() {
		JSONObject json = null;
		JSONObject jo1 = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			
			hp.put("ProposalNo", bean.getProposalNo());
			hp.put("EndorsementStatus", bean.getEndtStatus());
			hp.put("ActualPremium", bean.getActualPremium());
			hp.put("RefundAmount", bean.getRefundAmt());
			hp.put("BalanceAmount", bean.getBalanceAmt());
			hp.put("PremiumRcvd", bean.getPremiumRcvd());
			hp.put("TotalPremium",bean.getTotalPremium());
			hp.put("TotalAmount", bean.getTotal());
			hp.put("InceptionFee", bean.getInceptionFee());
			hp.put("PolicyFee", bean.getPolicyFee());
			hp.put("PolicyFeeRcvd", bean.getPolicyFeeRcvd());
			hp.put("InceptionFeePaid", bean.getInceptionFeePaid());
			hp.put("PolicyFeePaid", bean.getPolicyFeePaid());
			hp.put("ChargeableYN", bean.getChargeableYN());
			hp.put("RefundChargeYN", bean.getRefundChrgYN());
			hp.put("LoginBranchCode", bean.getBranchCode());
			
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
	public List<Object> getmoptransactionlist() {
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

	@SuppressWarnings("unchecked")
	public void getCommoditySaveValid() {
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
	@SuppressWarnings("unchecked")
	public String getRefundChrgYN() {
		String result="";
		JSONObject json = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			String link=getValueFromWebservice("maan.client.opencover.refundstatus");
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
	
	
	
}
