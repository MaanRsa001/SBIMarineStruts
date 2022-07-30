package com.maan.adminnew.report;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.google.gson.Gson;
import com.maan.common.LogUtil;
import com.maan.common.Token;
import com.maan.common.ApiConfig.ApiConfig;
import com.maan.common.url.ApiUrl;
import com.maan.quotation.model.CustomerInfoResponse;
import com.maan.quotation.model.DefaultValue;
import com.opensymphony.xwork2.ActionContext;

public class ReportAPI  extends ApiConfig{
	
	
	final static Logger logger = LogUtil.getLogger(ReportAPI.class);
	static ResourceBundle bundle = ResourceBundle.getBundle("webservice");
	HttpServletRequest request = ServletActionContext.getRequest();
	Map<String, Object> session = ActionContext.getContext().getSession();
	String response = "", link = "", token = "";
	Gson jsonConvertor = new Gson();
	public ReportAPI(){
		//token = session.get("TOKEN_SPRING").toString();
	}
	
	private void saveToken(JSONObject json) {
		try {
			if(json!=null) {
				JSONObject dvo = (JSONObject) json.get("AdditionalData");
				if(dvo!=null) {
					DefaultValue dv = new DefaultValue();
					dv.setToken(dvo.get("Token")==null?"":dvo.get("Token").toString());
					Token.save(dv);
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

	@SuppressWarnings("unchecked")
	public List<Object> getBranchReportAPI(ReportBean bean) {
		List<Object> list = new ArrayList<Object>();
		link = getValueFromWebservice("maan.admin.branchreport.result");
		try {
			JSONObject req = new JSONObject();
			req.put("FromDate", bean.getStartDate());
			req.put("ToDate", bean.getEndDate());
			req.put("ProductId", bean.getProductID());
			req.put("BranchCode", bean.getBranch());
			req.put("Status", bean.getReportStatus());
			req.put("LoginId", bean.getLoginId());
			response = callAPI(link, Token.value(), req.toString());
			JSONObject json = new JSONObject();
			JSONParser parser = new JSONParser();
			json = (JSONObject) parser.parse(response);
			saveToken(json);
			list = (JSONArray) json.get("Result");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Object> getOpenCoverListApi(ReportBean bean, String branchCode) {
		List<Object> list = new ArrayList<Object>();
		link = getValueFromWebservice("maan.admin.opencover.report");
		try {
			JSONObject req = new JSONObject();
			req.put("FromDate", bean.getStartDate());
			req.put("ToDate", bean.getEndDate());
			req.put("BrokerCode", bean.getBroker());
			req.put("BranchCode", branchCode);
			response = callAPI(link, Token.value(), req.toString());
			JSONObject json = new JSONObject();
			JSONParser parser = new JSONParser();
			json = (JSONObject) parser.parse(response);
			saveToken(json);
			list = (JSONArray) json.get("Result");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<Object> getCertificatesList(ReportBean bean, String branchCode) {
		List<Object> list = new ArrayList<Object>();
		link = getValueFromWebservice("maan.admin.opencover.certificate.report");
		try {
			JSONObject req = new JSONObject();
			req.put("FromDate", bean.getStartDate());
			req.put("ToDate", bean.getEndDate());
			req.put("BranchCode", branchCode);
			req.put("OpenCoverNo", bean.getOpenCoverNo());
			req.put("ProductId", bean.getProductID());
			req.put("Type", bean.getBroker());
			
			response = callAPI(link, Token.value(), req.toString());
			JSONObject json = new JSONObject();
			JSONParser parser = new JSONParser();
			json = (JSONObject) parser.parse(response);
			saveToken(json);
			list = (JSONArray) json.get("Result");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Object> getUwList(String branchCode) {
		List<Object> list = new ArrayList<Object>();
		link = getValueFromWebservice("maan.admin.report.uwlist");
		try {
			JSONObject req = new JSONObject();
			req.put("BranchCode", branchCode);
			response = callAPI(link, Token.value(), req.toString());
			JSONObject json = new JSONObject();
			JSONParser parser = new JSONParser();
			list = (JSONArray) parser.parse(response);
			//saveToken(json);
			//list = (List<Object>) json;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@SuppressWarnings("unchecked")
	public List<Object> getPolicyReportApi(ReportBean bean) {
		List<Object> list = new ArrayList<Object>();
		if("reportBR".equalsIgnoreCase(bean.getMode1())) {
			link = getValueFromWebservice("maan.admin.opencover.broker.report");
		}else {
			link = getValueFromWebservice("maan.admin.opencover.underwriter.report");
		}
		
		try {
			JSONObject req = new JSONObject();
			req.put("FromDate", bean.getStartDate());
			req.put("ToDate", bean.getEndDate());
			req.put("BranchCode", bean.getBranch());
			req.put("BrokerCode", bean.getBroker());
			req.put("ProductId", bean.getProductID());
			
			response = callAPI(link, Token.value(), req.toString());
			JSONObject json = new JSONObject();
			JSONParser parser = new JSONParser();
			json = (JSONObject) parser.parse(response);
			saveToken(json);
			list = (JSONArray) json.get("Result");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@SuppressWarnings("unchecked")
	public String dashboardInfo(ReportBean bean) {
		link = getValueFromWebservice("maan.admin.report.dashboard");
		try {
			JSONObject req = new JSONObject();
			req.put("BranchCode", "01");
			response = callAPI(link, Token.value(), req.toString());
			//resp=(List<Object>) converter.fromJson(responseStr,type);
			List<MarineDashBoardPiv> pivrecords = (List<MarineDashBoardPiv>)jsonConvertor.fromJson(response, ArrayList.class);;
			bean.setPivrecords(pivrecords);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "retJson";
	}

	@SuppressWarnings("unchecked")
	public String BranchReportdownload(Object[] args) {
		String result="";
		JSONObject json = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			link = getValueFromWebservice("maan.admin.report.branchreport");
			
			hp.put("StartDate",args[0]);
			hp.put("EndDate",args[1]);
			hp.put("BranchCode", args[4]);
			hp.put("ReportStatus",args[3]);
			hp.put("ProductId", args[2]);
			hp.put("LoginId", args[5]);
			hp.put("Type", args[6]);
			
			
			String responseStr=callAPI(link, Token.value(), hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				result=json.get("PdfOutFilePath")==null?"":json.get("PdfOutFilePath").toString(); 
				
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public String openCoverJasper(String startDate, String endDate, String broker, String branchCode,String downloadType) {
		String result="";
		JSONObject json = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			link = getValueFromWebservice("maan.admin.report.opencoverreport");
			
			hp.put("StartDate",startDate);
			hp.put("EndDate",endDate);
			hp.put("BranchCode",branchCode);
			hp.put("LoginId", broker);
			hp.put("Type", downloadType);
			
			
			String responseStr=callAPI(link, Token.value(), hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				result=json.get("PdfOutFilePath")==null?"":json.get("PdfOutFilePath").toString(); 
				
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public String openCoverdetailReport(Object[] arg, String downloadType) {
		String result="";
		JSONObject json = null;
		JSONObject hp = new JSONObject();
		JSONParser parser = new JSONParser();
		try {
			link = getValueFromWebservice("maan.admin.report.opencoverdetailreport");
			
			hp.put("BranchCode", arg[0]);
			hp.put("StartDate", arg[1]);
			hp.put("EndDate", arg[2]);
			hp.put("BrokerLogin", arg[3]);
			hp.put("LoginId", arg[4]);
			hp.put("ProductId", arg[5]);
			hp.put("OpenCoverNo", arg[6]);
			hp.put("Type", downloadType);
			
			
			String responseStr=callAPI(link, Token.value(), hp.toString().replaceAll("\"\"", "null"));
			if(responseStr!=null && responseStr.length()>0) {
				json = (JSONObject) parser.parse(responseStr);
				result=json.get("PdfOutFilePath")==null?"":json.get("PdfOutFilePath").toString(); 
				
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getIntegrationFailedList(ReportBean bean, String branchCode) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		link = getValueFromWebservice("maan.admin.integration.failed.list");
		try {
			JSONObject req = new JSONObject();
			req.put("BranchCode", branchCode);
			req.put("ProductID", bean.getProductID());
			req.put("FromDate", bean.getStartDate());
			req.put("ToDate", bean.getEndDate());
			
			response = callAPI(link, Token.value(), req.toString());
			JSONObject json = new JSONObject();
			JSONParser parser = new JSONParser();
			json = (JSONObject) parser.parse(response);
			saveToken(json); 
			list = (JSONArray) json.get("Result");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@SuppressWarnings("unchecked")
	public String reintegrate(ReportBean bean) {
		String result="",errorDesc="";
		
		link = ApiUrl.getPolicyintegrateapi();
		try {
			JSONObject req = new JSONObject();
			req.put("ApplicationNo", bean.getApplicationNo());
			req.put("ReintegrateStatus", "Y");
			response = callAPI(link, Token.value(), req.toString());
			JSONObject json = new JSONObject();
			JSONParser parser = new JSONParser();
			json = (JSONObject) parser.parse(response);
			saveToken(json); 
			errorDesc=json.get("errorDesc")==null?"":json.get("errorDesc").toString();
			if(StringUtils.isNotBlank(errorDesc)) {
				result="Failed";
			}else {
				result="Success";
				bean.setPolicynumber(json.get("policyNo")==null?"":json.get("policyNo").toString());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	public void editIntegration(ReportBean bean) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		link = getValueFromWebservice("maan.admin.integration.failed.edit");
		try {
			JSONObject req = new JSONObject();
			req.put("QuoteNo", bean.getQuoteNo());
			
			response = callAPI(link, Token.value(), req.toString());
			JSONObject json = new JSONObject();
			JSONParser parser = new JSONParser();
			json = (JSONObject) parser.parse(response);
			saveToken(json); 
			list = (JSONArray) json.get("Result");
			if(list!=null && list.size()>0) {
				Map<String,Object>map=list.get(0);
				bean.setMsgId(map.get("MsgId")==null?"":map.get("MsgId").toString());
				bean.setTransId(map.get("TranId")==null?"":map.get("TranId").toString());
				bean.setSourceAppId(map.get("SourceAppId")==null?"":map.get("SourceAppId").toString());
				bean.setDestAppId(map.get("DestAppId")==null?"":map.get("DestAppId").toString());
				bean.setTransDesc(map.get("TranDesc")==null?"":map.get("TranDesc").toString());
				bean.setDocNumber(map.get("DocNum")==null?"":map.get("DocNum").toString());
				bean.setPolicyType(map.get("Producttype")==null?"":map.get("Producttype").toString());
				bean.setEffectiveDate(map.get("EffecDate")==null?"":map.get("EffecDate").toString());
				bean.setExpiryDate(map.get("ExpiryDate")==null?"":map.get("ExpiryDate").toString());
				bean.setDeclarationNote(map.get("DeclarationNote")==null?"":map.get("DeclarationNote").toString());
				bean.setInterestName(map.get("InterestName")==null?"":map.get("InterestName").toString());
				bean.setShipmentDate(map.get("ShipmentDate")==null?"":map.get("ShipmentDate").toString());
				bean.setBankCode(map.get("BankCode")==null?"":map.get("BankCode").toString());
				bean.setPackageType(map.get("PackingType")==null?"":map.get("PackingType").toString());
				bean.setLetterCreditNo(map.get("LetterCreditNo")==null?"":map.get("LetterCreditNo").toString());
				bean.setLetterCreditAmount(map.get("LetterCreditAmnt")==null?"":map.get("LetterCreditAmnt").toString());
				bean.setLetterCreditCurrency(map.get("LetterCreditCurrency")==null?"":map.get("LetterCreditCurrency").toString());
				bean.setSumInsured(map.get("SumInsured")==null?"":map.get("SumInsured").toString());
				bean.setLatestSumInsured(map.get("LatestSumInsured")==null?"":map.get("LatestSumInsured").toString());
				bean.setBasicEvaluation(map.get("Basicevaluation")==null?"":map.get("Basicevaluation").toString());
				bean.setConveyenceCode(map.get("Conveyance")==null?"":map.get("Conveyance").toString());
				bean.setConveyenceDesc(map.get("ConveyanDesc")==null?"":map.get("ConveyanDesc").toString());
				bean.setRiskCategory(map.get("RiskCategory")==null?"":map.get("RiskCategory").toString());
				bean.setQuantity(map.get("Quantity")==null?"":map.get("Quantity").toString());
				bean.setDeductableNote(map.get("DeducNotes")==null?"":map.get("DeducNotes").toString());
				bean.setCargoType(map.get("CargoTypes")==null?"":map.get("CargoTypes").toString());
				bean.setCargoTypeDesc(map.get("CargoDescription")==null?"":map.get("CargoDescription").toString());
				bean.setLoardingPort(map.get("LoadingPort")==null?"":map.get("LoadingPort").toString());
				bean.setArrivalPort(map.get("ArrivalPort")==null?"":map.get("ArrivalPort").toString());
				bean.setSailRoute(map.get("SailRoute")==null?"":map.get("SailRoute").toString());
				bean.setVesselYearBuilt(map.get("VesselYearBuilt")==null?"":map.get("VesselYearBuilt").toString());
				bean.setVesselNatonality(map.get("VesselNation")==null?"":map.get("VesselNation").toString());
				bean.setVesselClass(map.get("VesselClassification")==null?"":map.get("VesselClassification").toString());
				bean.setVesselName(map.get("VesselName")==null?"":map.get("VesselName").toString());
				bean.setMinimumPremium(map.get("MinPrem")==null?"":map.get("MinPrem").toString());
				bean.setNetPremiumLc(map.get("NetPremiumLc")==null?"":map.get("NetPremiumLc").toString());
				bean.setGrossPremiumLc(map.get("GrossPrem")==null?"":map.get("GrossPrem").toString());
				bean.setTotalFeeLC(map.get("TotalFeesLc")==null?"":map.get("TotalFeesLc").toString());
				bean.setCertificateSI(map.get("CertificateSI")==null?"":map.get("CertificateSI").toString());
				bean.setAllcertificateSI(map.get("AllCertificateSI")==null?"":map.get("AllCertificateSI").toString());
				bean.setOpenCoverSI(map.get("OpenCoverSI")==null?"":map.get("OpenCoverSI").toString());
				bean.setPolicyNo(map.get("PolicyNo")==null?"":map.get("PolicyNo").toString());
				bean.setIntegReq(map.get("Requestsent")==null?"":map.get("Requestsent").toString());
				bean.setIntegRes(map.get("ResponseRecieved")==null?"":map.get("ResponseRecieved").toString());
				bean.setMarinePremium(map.get("MarinePremium")==null?"":map.get("MarinePremium").toString());
				bean.setWarPremium(map.get("WarPremium")==null?"":map.get("WarPremium").toString()); 
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@SuppressWarnings("unchecked")
	public void updateIntegration(ReportBean bean) {
		link = getValueFromWebservice("maan.admin.integration.failed.update");
		try {
			JSONObject req = new JSONObject();
			req.put("Producttype", bean.getPolicyType());
			req.put("EffecDate", bean.getEffectiveDate());
			req.put("ExpiryDate", bean.getExpiryDate());
			req.put("DeclarationNote", bean.getDeclarationNote());
			req.put("InterestName", bean.getInterestName());
			req.put("ShipmentDate", bean.getShipmentDate());
			req.put("BankCode", bean.getBankCode());
			req.put("PackingType", bean.getPackageType());
			req.put("LetterCreditNo", bean.getLetterCreditNo());
			req.put("LetterCreditAmnt", bean.getLetterCreditAmount());
			req.put("LetterCreditCurrency", bean.getLetterCreditCurrency());
			req.put("SumInsured", bean.getSumInsured());
			req.put("LatestSumInsured", bean.getLatestSumInsured());
			
			req.put("Basicevaluation", bean.getBasicEvaluation());
			req.put("Conveyance", bean.getConveyenceCode());
			req.put("ConveyanDesc", bean.getConveyenceDesc());
			req.put("RiskCategory", bean.getRiskCategory());
			req.put("Quantity", bean.getQuantity());
			req.put("DeducNotes", bean.getDeductableNote());
			req.put("CargoTypes", bean.getCargoType());
			
			req.put("CargoDescription", bean.getCargoTypeDesc());
			req.put("LoadingPort", bean.getLoardingPort());
			req.put("ArrivalPort", bean.getArrivalPort());
			req.put("SailRoute", bean.getSailRoute());
			req.put("VesselYearBuilt", bean.getVesselYearBuilt());
			req.put("VesselNation", bean.getVesselNatonality());
			req.put("VesselClassification", bean.getVesselClass());
			req.put("VesselName", bean.getVesselName());
			
			req.put("MinPrem", bean.getMinimumPremium());
			req.put("NetPremiumLc", bean.getNetPremiumLc());
			req.put("GrossPrem", bean.getGrossPremiumLc());
			req.put("TotalFeesLc", bean.getTotalFeeLC());
			req.put("CertificateSI", bean.getCertificateSI());
			
			req.put("AllCertificateSI", bean.getAllcertificateSI());
			req.put("OpenCoverSI", bean.getOpenCoverSI());
			req.put("PolicyNo", bean.getPolicyNo());
			req.put("QuoteNo", bean.getQuoteNo());
			req.put("MarinePremium", bean.getMarinePremium());
			req.put("WarPremium", bean.getWarPremium());
			response = callAPI(link, Token.value(), req.toString());
			JSONObject json = new JSONObject();
			JSONParser parser = new JSONParser();
			json = (JSONObject) parser.parse(response);
			saveToken(json);
			bean.setErrors((JSONArray) json.get("Errors"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	@SuppressWarnings("unchecked")
	public List<Object> getDropDownList(ReportBean bean, String type) {
		List<Object> list = new ArrayList<Object>();
		
		try {
			JSONObject req = new JSONObject();
			if("bank".equals(type)) {
				link = getValueFromWebservice("maan.admin.integration.bank.list");
				req.put("BranchCode", bean.getBranch());
			}else if("package".equals(type)) {
				link = getValueFromWebservice("maan.admin.integration.package.list");
				req.put("BranchCode", bean.getBranch());
			}else if("transport".equals(type)) {
				link = getValueFromWebservice("maan.admin.integration.transport.list");
				req.put("BranchCode", bean.getBranch());
			}else if("saleterm".equals(type)) {
				link = getValueFromWebservice("maan.admin.integration.saleterm.list");
				req.put("BranchCode", bean.getBranch());
			}else if("commodity".equals(type)) {
				link = getValueFromWebservice("maan.admin.integration.commodity.list");
				req.put("BranchCode", bean.getBranch());
			}else if("country".equals(type)) {
				link = getValueFromWebservice("maan.admin.integration.country.list");
				req.put("BranchCode", bean.getBranch());
			}
			response = callAPI(link, Token.value(), req.toString());
			JSONObject json = new JSONObject();
			JSONParser parser = new JSONParser();
			json = (JSONObject) parser.parse(response);
			list = (JSONArray) json.get("Result");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
