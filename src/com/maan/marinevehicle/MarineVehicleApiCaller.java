package com.maan.marinevehicle;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.google.gson.Gson;
import com.maan.common.Token;
import com.maan.common.ApiConfig.ApiConfig;
import com.maan.common.url.ApiUrl;
import com.maan.quotation.model.DefaultValue;
import com.maan.quotation.model.MovementResponse;

public class MarineVehicleApiCaller extends ApiConfig {
	Gson jsonConvertor = new Gson();
	@SuppressWarnings("unchecked")
	public void getDetails(MarineVehicleBean bean) {
		JSONObject obj = new JSONObject();
		String jsonResponse = "";
		JSONParser parser = new JSONParser();
		try {
			obj.put("OpenCoverNo", bean.getOpenCoverNo());
			jsonResponse = callAPI("uploadTransaction", ApiUrl.getVehicleOpCoverDetail(), getApiToken(), obj.toJSONString());
			obj = (JSONObject) parser.parse(jsonResponse);
			bean.setProposalNo(obj.get("ProposalNo").toString());
			bean.setBaseOpenCoverNo(obj.get("BasePolicyNo").toString());
			bean.setEndtYN(obj.get("EndtStatus").toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String getApiToken() {
		return Token.value();
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getMarineVehicleDeleteDetails(String proposalNo, String searchType, String searchValue, String status, String baseOpenCoverNo) {
		JSONObject obj = new JSONObject();
		String jsonResponse = "";
		JSONParser parser = new JSONParser();
		List<Map<String,Object>> result=null;
		try {
			if (searchType == null) {
				obj.put("BaseOpenCoverNo", baseOpenCoverNo);
				if("D".equals(status)) {
					jsonResponse = callAPI("transactionDetails", ApiUrl.getVehicleDeleteTransaction(), getApiToken(), obj.toJSONString());
				}else {
					jsonResponse = callAPI("transactionDetails", ApiUrl.getVehicleActiveTransaction(), getApiToken(), obj.toJSONString());
				}
			} else {
				if (searchType.equals("tranId")) {
					obj.put("OpenCoverNo", baseOpenCoverNo);
					obj.put("TranId", searchValue);
					jsonResponse = callAPI("transactionDetails", ApiUrl.getVehicleSearchByTranId(), getApiToken(), obj.toJSONString());
				}
				if (searchType.equals("assetNo")) {
					obj.put("OpenCoverNo", baseOpenCoverNo);
					obj.put("AssetId", searchValue);
					jsonResponse = callAPI("transactionDetails", ApiUrl.getVehicleSearchByAssetNo(), getApiToken(), obj.toJSONString());
				}
				if (searchType.equals("plateNo")) {
					obj.put("OpenCoverNo", baseOpenCoverNo);
					obj.put("PlateNo", searchValue);
					jsonResponse = callAPI("transactionDetails", ApiUrl.getVehicleSearchByPlateNo(), getApiToken(), obj.toJSONString());
				}
				if (searchType.equals("chaseNo")) {
					obj.put("OpenCoverNo", baseOpenCoverNo);
					obj.put("ChassisNO", searchValue);
					jsonResponse = callAPI("transactionDetails", ApiUrl.getVehicleSearchByChaseNo(), getApiToken(), obj.toJSONString());
				}
			}
			obj = (JSONObject) parser.parse(jsonResponse);
			result = (JSONArray) obj.get("VehicleDeletTransctionRes");
			saveToken(obj);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getTransDetails(String baseOpenCoverNo, String status) {
		List<Map<String, Object>> result = null;
		JSONObject obj = new JSONObject();
		String jsonResponse = "";
		JSONParser parser = new JSONParser();
		try {
			obj.put("OpenCoverNo", baseOpenCoverNo);
			if("N".equals(status)) {
			jsonResponse = callAPI("transactionDetails", ApiUrl.getUnapprovedtransactionDetails(), getApiToken(), obj.toJSONString());
			}else {
			jsonResponse = callAPI("transactionDetails", ApiUrl.getTransactionDetails(), getApiToken(), obj.toJSONString());	
			}
			obj = (JSONObject) parser.parse(jsonResponse);
			result = (JSONArray) obj.get("TransDetailRes");
			saveToken(obj);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getHaulierDetails(String proposalNo) {
		List<Map<String, Object>> result = null;
		JSONObject obj = new JSONObject();
		String jsonResponse = "";
		JSONParser parser = new JSONParser();
		try {
			obj.put("ProposalNo", proposalNo);
			jsonResponse = callAPI("transactionDetails", ApiUrl.getHaulierDetails(), getApiToken(), obj.toJSONString());
			obj = (JSONObject) parser.parse(jsonResponse);
			result = (JSONArray) obj.get("OpenCoverDetailRes");
			saveToken(obj);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	private void saveToken(JSONObject json) {
		try {
			if (json != null) {
				JSONObject dvo = (JSONObject) json.get("DefaultValue");
				if (dvo != null) {
					DefaultValue dv = new DefaultValue();
					dv.setToken(dvo.get("Token") == null ? "" : dvo.get("Token").toString());
					Token.save(dv);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getVehicleTransDetails(String opencoverNo) {
		List<Map<String, Object>> result = null;
		JSONObject obj = new JSONObject();
		String jsonResponse = "";
		JSONParser parser = new JSONParser();
		try {
			obj.put("OpenCoverNo", opencoverNo);
			jsonResponse = callAPI("transactionDetails", ApiUrl.getTransactionList(), getApiToken(), obj.toJSONString());
			obj = (JSONObject) parser.parse(jsonResponse);
			result = (JSONArray) obj.get("TransDetailRes");
			saveToken(obj);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


	@SuppressWarnings("unchecked")
	public void processRecords(MarineVehicleBean bean, String loginId, String branchCode, String issuer,			String productId) {
		JSONObject obj = new JSONObject();
		MovementResponse qs=new MovementResponse();
		String jsonResponse = "";
		try {
			obj.put("TranId", bean.getTranId());
			obj.put("OpenCoverNo", bean.getOpenCoverNo());
			obj.put("LoginId", loginId);
			obj.put("ProductId", productId);
			obj.put("BranchCode", branchCode);
			obj.put("Issuer", issuer);
			
			jsonResponse = callAPI("processRecord", ApiUrl.getProcessVehicleRecords(), getApiToken(),obj.toJSONString());
			qs = jsonConvertor.fromJson(jsonResponse, MovementResponse.class);
			DefaultValue dv = qs.getDefaultValue();
			bean.setErrorDesc(qs.getErrorDesc());
			Token.save(dv);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getMarinevehicleDetails(String tranId, String status) {
		JSONObject obj = new JSONObject();
		String jsonResponse = "";
		JSONParser parser = new JSONParser();
		List<Map<String,Object>> result=null;
		try {
			obj.put("TranId", tranId);
			if("Y".equals(status)) {
				jsonResponse = callAPI("vehicleDetails", ApiUrl.getMarineveicleDetails(), getApiToken(), obj.toJSONString());
			}else if("N".equals(status)) {
				jsonResponse = callAPI("vehicleDetails", ApiUrl.getMarineveicleDetailsInactive(), getApiToken(), obj.toJSONString());
			}else {
				jsonResponse = callAPI("vehicleDetails", ApiUrl.getMarineveicleDetailsdelete(), getApiToken(), obj.toJSONString());
			}
			obj = (JSONObject) parser.parse(jsonResponse);
			result = (JSONArray) obj.get("VehicleDeletTransctionRes");
			saveToken(obj);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public void getPremiumDetails(MarineVehicleBean bean) {
		JSONObject obj = new JSONObject();
		JSONObject json = null;
		JSONParser parser = new JSONParser();
		String responseStr = "";
		try {
			obj.put("OpenCoverNo", bean.getOpenCoverNo());
			obj.put("TranId", bean.getTranId());
			
			responseStr = callAPI("premiumDetail", ApiUrl.getPremiumDetail(), getApiToken(),obj.toJSONString());
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				saveToken(json);
				bean.setPremium(json.get("Premium")==null?"":json.get("Premium").toString());
				bean.setTotalPremium(json.get("TotalPremium")==null?"":json.get("TotalPremium").toString());
				bean.setVatTax(json.get("VatAmount")==null?"":json.get("VatAmount").toString());
				bean.setVatTaxPrecent(json.get("VatPercent")==null?"":json.get("VatPercent").toString());
				bean.setPolicyFee(json.get("PolicyFee")==null?"":json.get("PolicyFee").toString());
				bean.setConditionDesc(json.get("ConditionDesc")==null?"":json.get("ConditionDesc").toString());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@SuppressWarnings("unchecked")
	public void policyGenerate(MarineVehicleBean bean, String loginId, String branchCode, String issuer) {
		JSONObject obj = new JSONObject();
		JSONObject json = null;
		JSONParser parser = new JSONParser();
		String responseStr = "";
		try {
			obj.put("OpenCoverNo", bean.getOpenCoverNo());
			obj.put("TranId", bean.getTranId());
			obj.put("Status", bean.getStatus());
			obj.put("BranchCode", branchCode);
			obj.put("Issuer", issuer);
			obj.put("LoginId", loginId);
			obj.put("EffectivDate", bean.getEffectiveDate());
			obj.put("GeneratePolicy", bean.getGeneratePolicy());
			obj.put("ConditionDesc", bean.getConditionDesc());
			obj.put("TotalPremium", bean.getTotalPremium());
			obj.put("Premium", bean.getPremium());
			obj.put("VatAmount", bean.getVatTax());
			obj.put("PolicyFee", bean.getPolicyFee());
			
			List<Map<String,Object>> dueDetails = new ArrayList<Map<String,Object>>();
			if (bean.getDueList().size() > 0) {
				for (int i = 0; i < bean.getDueList().size(); i++) {
					Map<String, Object> tempDue = new HashMap<>();
					tempDue.put("DueAmount", bean.getDueamount()==null?"":(bean.getDueamount().get(i)==null?"":bean.getDueamount().get(i)));
					tempDue.put("DueDate",  bean.getDueDate()==null?"":(bean.getDueDate().get(i)==null?"":bean.getDueDate().get(i)));
					tempDue.put("DuePercent", bean.getDuepercent()==null?"":(bean.getDuepercent().get(i)==null?"":bean.getDuepercent().get(i)));
					tempDue.put("EffectiveDate", bean.getEffectiveDatePT()==null?"":(bean.getEffectiveDatePT().get(i)==null?"":bean.getEffectiveDatePT().get(i)));
					dueDetails.add(tempDue);
				}
			}
			obj.put("DueDetails", dueDetails);
			
			responseStr = callAPI("premiumDetail", ApiUrl.getVehiclepolicygen(), getApiToken(),obj.toJSONString());
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				saveToken(json);
				bean.setPolicyNo(json.get("PolicyNo")==null?"":json.get("PolicyNo").toString());
				bean.setCreditNoteNo(json.get("CreditNoteNo")==null?"":json.get("CreditNoteNo").toString());
				bean.setDebitNoteNo(json.get("DebitNoteNo")==null?"":json.get("DebitNoteNo").toString());
				bean.setErrors((JSONArray) json.get("Errors"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@SuppressWarnings("unchecked")
	public void deleteTransction(List<String> sno1, List<String> transNo1, List<String> proposalno1,MarineVehicleBean bean) {
		JSONObject obj = new JSONObject();
		JSONObject json = null;
		JSONParser parser = new JSONParser();
		String responseStr = "";
		try {
			obj.put("OpenCoverNo", bean.getOpenCoverNo());
			obj.put("ExpiryDate", bean.getExpiryDate());
		
			List<Map<String,Object>> deleteDetails = new ArrayList<Map<String,Object>>();
			if (sno1.size() > 0) {
				for (int i = 0; i < sno1.size(); i++) {
					Map<String, Object> tempDue = new HashMap<>();
					tempDue.put("Sno",sno1==null?"":(sno1.get(i)==null?"":sno1.get(i)));
					tempDue.put("TranId",  transNo1==null?"":(transNo1.get(i)==null?"":transNo1.get(i)));
					tempDue.put("ProposalNo", proposalno1==null?"":(proposalno1.get(i)==null?"":proposalno1.get(i)));
					deleteDetails.add(tempDue);
				}
			}
			obj.put("DeleteDetails", deleteDetails);
			
			responseStr = callAPI("premiumDetail", ApiUrl.getDeleteVehicle(), getApiToken(),obj.toJSONString());
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				saveToken(json);
				bean.setPremium(json.get("Premium")==null?"":json.get("Premium").toString());
				bean.setTotalPremium(json.get("TotalPremium")==null?"":json.get("TotalPremium").toString());
				bean.setVatTax(json.get("VatAmount")==null?"":json.get("VatAmount").toString());
				bean.setVatTaxPrecent(json.get("VatPercent")==null?"":json.get("VatPercent").toString());
				bean.setPolicyFee(json.get("PolicyFee")==null?"":json.get("PolicyFee").toString());
				bean.setConditionDesc(json.get("ConditionDesc")==null?"":json.get("ConditionDesc").toString());
				bean.setTranId(json.get("TranId")==null?"":json.get("TranId").toString());
				bean.setErrors((JSONArray) json.get("Errors"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}