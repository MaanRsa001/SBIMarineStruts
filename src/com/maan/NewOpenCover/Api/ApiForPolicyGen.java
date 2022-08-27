package com.maan.NewOpenCover.Api;

import java.util.ArrayList;
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


public class ApiForPolicyGen extends ApiConfig implements Callable<Object>{
	Map<String, Object> session=ActionContext.getContext().getSession();
	final static Logger logger = LogUtil.getLogger(ApiForPolicyGen.class);
	private OpenCoverBean bean;
	private String requestfor;
	public ApiForPolicyGen(OpenCoverBean bean,String requestfor) {
		this.bean=bean;
		this.requestfor=requestfor.toLowerCase();
	}
	@Override
	public Object call() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	@SuppressWarnings("unchecked")
	public List<Object> getConveyanceList() {
		List<Object> dropdownList = new ArrayList<>();
		JSONObject json = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			
			hp.put("ProposalNo", bean.getProposalNo());
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
	public List<Object> getDepositList() {
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
	public List<Object> getInstallmentList() {
		List<Object> dropdownList = new ArrayList<>();
		JSONObject json = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			
			
			String responseStr=callAPIGet(link, authorization);
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
	public void getDepositInfo() {
		JSONObject json = null;
		JSONObject jo = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			
			hp.put("ProposalNo", bean.getProposalNo());
			
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				
				JSONArray array = (JSONArray) json.get("Result");
				if(array!=null && array.size()>0) {
					JSONObject quoteinfo = (JSONObject) array.get(0);
					bean.setDepositPremiumType(quoteinfo.get("DepositPremiumYn")==null?"":quoteinfo.get("DepositPremiumYn").toString());
					bean.setDepositType(quoteinfo.get("DepositType")==null?"":quoteinfo.get("DepositType").toString());
					bean.setInstallType(quoteinfo.get("InstallmentType")==null?"":quoteinfo.get("InstallmentType").toString());
					bean.setDebitNoteNo(quoteinfo.get("DebitNoteNo")==null?"":quoteinfo.get("DebitNoteNo").toString());
					bean.setCreditNoteNo(quoteinfo.get("CreditNoteNo")==null?"":quoteinfo.get("CreditNoteNo").toString());
					bean.setMarinePremium(quoteinfo.get("MarinePremium")==null?"0":quoteinfo.get("MarinePremium").toString());
					bean.setWarPremium(quoteinfo.get("WarPremium")==null?"0":quoteinfo.get("WarPremium").toString());
					bean.setDepositDate(quoteinfo.get("DebitNoteDate")==null?"":quoteinfo.get("DebitNoteDate").toString());
					bean.setRemarks(quoteinfo.get("Remarks")==null?"":quoteinfo.get("Remarks").toString());
					bean.setVatTax(quoteinfo.get("VatTaxAmount")==null?"0":quoteinfo.get("VatTaxAmount").toString());
					bean.setVatTaxPrecent(quoteinfo.get("VatTaxPercent")==null?"":quoteinfo.get("VatTaxPercent").toString());
					bean.setOpenCoverType(quoteinfo.get("Type")==null?"":quoteinfo.get("Type").toString());
				}
			
			} 
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	@SuppressWarnings("unchecked")
	public void getDepositPremiumInfo() {
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
				bean.setDepositPremiumType(jsonObj.get("DepositPremiumYn")==null?"Y":jsonObj.get("DepositPremiumYn").toString());
				bean.setDeposit(jsonObj.get("DepositPremiumYn")==null?"Y":jsonObj.get("DepositPremiumYn").toString());
				bean.setDepositType(jsonObj.get("DepositType")==null?"":jsonObj.get("DepositType").toString());
				bean.setWarPremium(jsonObj.get("PolicyInsceptionFeePaid")==null?"0":jsonObj.get("PolicyInsceptionFeePaid").toString());
				bean.setMarinePremium(jsonObj.get("PayableMarinePremium")==null?"0":jsonObj.get("PayableMarinePremium").toString());
				bean.setVatTax(jsonObj.get("VatTaxAmount")==null?"0":jsonObj.get("VatTaxAmount").toString());
				
			} 
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	@SuppressWarnings("unchecked")
	public void convertPolicy() {
		JSONObject json = null;
		JSONObject jo1 = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		JSONArray arr = new JSONArray();
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			
			hp.put("ProposalNo", bean.getProposalNo());
			hp.put("OpenCoverNo", bean.getOpenCoverNo());
			hp.put("OpenCoverYN", bean.getOpencovergenerate());
			hp.put("RenewalYN", bean.getRenewalYN());
			hp.put("EndtYN", bean.getEndtYN());
			hp.put("EffectiveDate", bean.getPolicyeffectiveDate());
			hp.put("Deposit", bean.getDeposit());
			hp.put("DepositDate", bean.getDepositDate());
			hp.put("DebitNoteNo",bean.getDebitNoteNo());
			hp.put("CreditNoteNo", bean.getCreditNoteNo());
			hp.put("DepositType", bean.getDepositType());
			hp.put("InstallType", bean.getInstallType());
			hp.put("MarinePremium", bean.getMarinePremium());
			hp.put("WarPremium", bean.getWarPremium());
			hp.put("VatTax", bean.getVatTax());
			hp.put("Remarks", bean.getRemarks());
			hp.put("DebitNoteName", bean.getDebitNoteName());
			hp.put("CancelClauses", bean.getCancelClaus());
			hp.put("RatesYN", bean.getRatesYN());
			hp.put("AmendedClausesYN", bean.getAmendedClauseYN());
			hp.put("PPWDays", bean.getPpwdays());
			hp.put("BranchCode", bean.getBranchCode());
			hp.put("PolicyFee", bean.getPolicyFee());
			hp.put("ProductId", "11");
			hp.put("UserType", bean.getUserType());
			
			hp.put("RefundAmount", "0");
			hp.put("InceptionFeePaid", "0");
			hp.put("PolicyFeePaid", "0");
			
			//hp.put("IssuanceFee", bean.getRefundChrgYN());
			//hp.put("MissippiCode", bean.getBranchCode());
			if(bean.getTransportId()!=null && bean.getTransportId().size()>0) {
				for (int i=0;i<bean.getTransportId().size();i++) {
					JSONObject obj = new JSONObject();
					obj.put("TransportId", bean.getTransportId().get(i));
					obj.put("ConveyanceDesc", bean.getConveyanceDesc().get(i));
					arr.add(obj);
				}
			}
			
			hp.put("ConveyanceInfo", arr);
			
			
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				
				jo1 = (JSONObject) json.get("Result");
				bean.setErrors((JSONArray) jo1.get("ErrorMessage"));
				bean.setProposalNo(jo1.get("ProposalNo")==null?"":jo1.get("ProposalNo").toString()); 
				bean.setOpenCoverNo(jo1.get("OpenCoverNo")==null?"":jo1.get("OpenCoverNo").toString()); 
				bean.setDebitNoteNo(jo1.get("DebitNoteNo")==null?"":jo1.get("DebitNoteNo").toString()); 
				bean.setCreditNoteNo(jo1.get("CreditNoteNo")==null?"":jo1.get("CreditNoteNo").toString()); 
				
			} 
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	@SuppressWarnings("unchecked")
	public void getPolicyGenInfo() {
		JSONObject json = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			String link=getValueFromWebservice("maan.client.opencover."+requestfor);
			String authorization= "Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString());
			
			hp.put("ProposalNo", bean.getProposalNo());
			hp.put("BranchCode", bean.getBranchCode());
			hp.put("ProductId", "11");
			
			String responseStr=callAPIPost(link, authorization, hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				 json = (JSONObject) parser.parse(responseStr);
				JSONObject quoteinfo=(JSONObject) json.get("Result");
				
					bean.setCancelClaus(quoteinfo.get("CancellationClauses")==null?"":quoteinfo.get("CancellationClauses").toString());
					bean.setPpwdays(quoteinfo.get("Ppwdays")==null?"":quoteinfo.get("Ppwdays").toString());
					bean.setPolicyFee(quoteinfo.get("PolicyFee")==null?"":quoteinfo.get("PolicyFee").toString());
					bean.setRatesYN(quoteinfo.get("RatePrintStatus")==null?"":quoteinfo.get("RatePrintStatus").toString());
					bean.setAmendedClauseYN(quoteinfo.get("AmendedClausePrintStatus")==null?"":quoteinfo.get("AmendedClausePrintStatus").toString());
					bean.setType(quoteinfo.get("Type")==null?"":quoteinfo.get("Type").toString());
					bean.setRenewalYN(quoteinfo.get("RenewalStatus")==null?"0":quoteinfo.get("RenewalStatus").toString());
					bean.setPolicyeffectiveDate(quoteinfo.get("PolicyEffectiveDate")==null?"":quoteinfo.get("PolicyEffectiveDate").toString());
					String endtType=quoteinfo.get("EndorsementType")==null?"":quoteinfo.get("EndorsementType").toString();
					bean.setEndtYN(StringUtils.isBlank(endtType)?"N":"Y");
					
			
			} 
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
}
