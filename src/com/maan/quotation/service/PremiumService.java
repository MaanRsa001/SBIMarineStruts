package com.maan.quotation.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.Logger;

import com.maan.common.LogUtil;
import com.maan.common.Token;
import com.maan.common.dao.CommonDAO;
import com.maan.common.exception.BaseException;
import com.maan.quotation.PremiumAction;
import com.maan.quotation.api.QuotationApiCall;
import com.maan.quotation.dao.PremiumDAO;
import com.maan.quotation.model.CommonInfo;
import com.maan.quotation.model.Condition;
import com.maan.quotation.model.Conditions;
import com.maan.quotation.model.ConditionsModel;
import com.maan.quotation.model.ConditionsModelRes;
import com.maan.quotation.model.ConditionsModelResp;
import com.maan.quotation.model.DefaultValue;
import com.maan.quotation.model.EndorsementPremiumDetails;
import com.maan.quotation.model.EndorsementPremiumModel;
import com.maan.quotation.model.GeneratePolicy;
import com.maan.quotation.model.MarineShipResponse;
import com.maan.quotation.model.PremiumDetails;
import com.maan.quotation.model.PremiumUpdateModel;
import com.maan.quotation.model.PremiumUpdateResponse;
import com.maan.quotation.model.QuotationModel;
import com.maan.quotation.model.QuotationResponse;
import com.maan.quotation.model.QuoteDetails;
import com.maan.webservice.PolicyGenerationAction;
import com.maan.webservice.VatPremiumCalc;
import com.maan.webservice.dao.PolicyGenerationDAO;



public class PremiumService {
	final static Logger logger = LogUtil.getLogger(PremiumService.class);
	private static final String defaultError = "Something went wrong. Please try again later";
	final static transient private String NOTHING = "NOTHING";
	PremiumDAO premiumDAO=new PremiumDAO();	
	PolicyGenerationDAO policyDAO=new PolicyGenerationDAO();
	QuotationApiCall qac = new QuotationApiCall();	

	public Map<String, Object> getconditions(PremiumAction pa) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			ConditionsModel cmi = new ConditionsModel();
			cmi.setApplicationNo(pa.getApplicationNo()==null?"":pa.getApplicationNo());
			cmi.setBranchCode(pa.getBelongingBranch()==null?"":pa.getBelongingBranch());
			if("add".equalsIgnoreCase((pa.getCondStatus()==null?"":pa.getCondStatus()))) {
				cmi.setCoverId(pa.getCoverId()==null?"":pa.getCoverId());
				cmi.setConditionsType(pa.getConditionType()==null?"":pa.getConditionType());
			
			ConditionsModelRes cmo = qac.getAddConditions(cmi);
				if("1".equalsIgnoreCase(cmi.getConditionsType())) {
					List<Condition> clauses = cmo.getConditions();
					if(clauses != null) {
					map.put("clausesDesc", conditionList(clauses));
					}
				}else if("2".equalsIgnoreCase(cmi.getConditionsType())) {
					List<Condition> wars = cmo.getConditions();
					if(wars != null) {
						map.put("extraClausesDesc", conditionList(wars));
					}
				}else if("3".equalsIgnoreCase(cmi.getConditionsType())) {
					List<Condition> exclusions = cmo.getConditions();
					if(exclusions != null) {
						map.put("exclusionsDesc", conditionList(exclusions));
					}
				}else if("4".equalsIgnoreCase(cmi.getConditionsType())) {
					List<Condition> warranties = cmo.getConditions();
					if(warranties != null) {
						map.put("warrantyDesc", conditionList(warranties));
					}
				}
			}else {
				ConditionsModelResp cmo = qac.getConditions(cmi);
					Conditions cdts = cmo.getConditions();
					if(cdts != null) {
						List<Condition> clauses = cdts.getClauses();
						map.put("clausesDesc", conditionList(clauses));
						List<Condition> wars = cdts.getWars();
						map.put("extraClausesDesc", conditionList(wars));
						List<Condition> warranties = cdts.getWarranties();
						map.put("warrantyDesc", conditionList(warranties));
						List<Condition> exclusions = cdts.getExclusions();
						map.put("exclusionsDesc", conditionList(exclusions));
					} 
				
				
			}
		}catch(Exception e) {
			logger.info("Exception Occurred @ PremiumService.getconditions(): "+e);
			e.printStackTrace();
		}
		return map;
	}
	
	private List<Map<String, Object>> conditionList(List<Condition> cnlt){
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		try {
			if(cnlt!=null) {
				for(Condition cn: cnlt) {
					if(cn != null) {
						Map<String, Object> map = new HashMap<String, Object>();
						map.put("CODE", cn.getCode()==null?"":cn.getCode());
						map.put("CODEDESC", cn.getCodeDesc()==null?"":cn.getCodeDesc());
						map.put("CODESTATUS", cn.getCodeStatus()==null?"":cn.getCodeStatus());
					    list.add(map);
					}
				}
			}
		}catch(Exception e) {
			logger.info("Exception Occurred @ PremiumService.conditionList(): "+e);
			e.printStackTrace();
		}
		return list;
	}

	public PremiumUpdateResponse premiumUpdate(PremiumUpdateModel pum) {
		return qac.premiumUpdate(pum);
	}

	public PremiumUpdateResponse generatePolicy(GeneratePolicy gp) {
		return qac.generatePolicy(gp);
	}

	public QuotationResponse premiumResponse(QuotationModel qm) {
		return qac.premiumResponse(qm);
	}

	public QuotationResponse premiumCalculate(PremiumUpdateModel pum) {
		return qac.premiumCalculate(pum);
	}

	public String modifyConditions(PremiumAction pa) {
		String error = "";
		try {
			ConditionsModel cmi = mapModifyConditionsInputs(pa);
			ConditionsModel cmo = qac.modifyConditions(cmi);
			//error = mapModifyConditionsOutputs(cmo);
		}catch(Exception e) {
			error = "Somethiing Went Wrong.";
			logger.info("Exception Occurred @ PremiumService.updateConditions(): "+e);
			e.printStackTrace();
		}
		return error;
	}
	
	private String mapModifyConditionsOutputs(ConditionsModel cmo) {
		String error = "";
		try {
			DefaultValue dv = cmo.getDefaultValue();
			if(Token.save(dv)) {
				if("success".equalsIgnoreCase(dv.getStatusCode())) {
				}else{
					error = dv.getStatusDescription();
				}
			}else {
				throw new Exception("Token is not available in Response");
			}
		}catch(Exception e) {
			error = "Somethiing Went Wrong.";
			logger.info("Exception Occurred @ PremiumService.mapModifyConditionsOutputs(): "+e);
			e.printStackTrace();
		}
		return error;
	}

	private ConditionsModel mapModifyConditionsInputs(PremiumAction pa) {
		ConditionsModel cm = new ConditionsModel();
		try {
			cm.setApplicationNo(pa.getApplicationNo()==null?"":pa.getApplicationNo());
			cm.setQuoteNo(pa.getQuoteNo()==null?"":pa.getQuoteNo());
			cm.setBranchCode(pa.getBelongingBranch()==null?"":pa.getBelongingBranch());
			if("add".equalsIgnoreCase((pa.getCondStatus()==null?"":pa.getCondStatus()))) {
				cm.setCoverId(pa.getCoverId()==null?"":pa.getCoverId());
				cm.setConditionsType(pa.getConditionType()==null?"":pa.getConditionType());
			}
			Conditions c = new Conditions();
			c.setClauses(mapConditionsInputs(pa.getClausesId(), pa.getClausesDesc()));
			c.setWars(mapConditionsInputs(pa.getWarId(), pa.getWarDesc()));
			c.setWarranties(mapConditionsInputs(pa.getWarrantyId(), pa.getWarrantyDesc()));
			c.setExclusions(mapConditionsInputs(pa.getExclusionId(), pa.getExclusionDesc()));
			cm.setConditions(c);
		}catch(Exception e) {
			logger.info("Exception Occurred @ PremiumService.mapModifyConditionsInputs(): "+e);
			e.printStackTrace();
		}
		return cm;
	}

	private List<Condition> mapConditionsInputs(List<Object> idList, List<Object> DescList) {
		List<Condition> conditions = new ArrayList<Condition>();
		try {
			if(idList != null && idList.size()>0 && DescList != null && DescList.size()>0) {
				for(int i=0;i<idList.size();i++) {
					if(StringUtils.isNotBlank(DescList.get(i).toString()) && !DescList.get(i).toString().contains("java.lang.Object")) {
						Condition c = new Condition();
						c.setCode(idList.get(i)==null?"":idList.get(i).toString());
						c.setCodeDesc(DescList.get(i)==null?"":DescList.get(i).toString());
						conditions.add(c);
					}
				}
			}
		}catch(Exception e) {
			logger.info("Exception Occurred @ PremiumService.mapConditionsInputs(): "+e);
			e.printStackTrace();
		}
		return conditions;
	}

	public Map<String, Object> endtPremiumDetails(String quoteNo) {
		Map<String,Object> map = new HashMap<String, Object>();
		try {
			QuoteDetails qd = new QuoteDetails();
			qd.setQuoteNo(quoteNo);
			EndorsementPremiumModel epm = qac.endtPremiumDetails(qd);
			if(epm!=null) {
				
					EndorsementPremiumDetails epd = epm.getEndorsementPremiumDetails();
					if(epd!=null) {
						PremiumDetails be = epd.getBeforeEndorsement();
						if(be!=null) {
							map.put("MARINE_PREMIUM_PREV", be.getMarinePremium());
							map.put("WAR_PREMIUM_PREV", be.getWarPremium());
							map.put("EXCESS_PREMIUM_PREV", be.getExcessPremium());
							map.put("GOVT_TAX_PREV", be.getGovernmentTax());
							map.put("POLICY_FEE_PREV", be.getPolicyFee());
							map.put("PREMIUM_PREV", be.getTotalPremium());
						}
						PremiumDetails ae = epd.getAfterEndorsement();
						if(ae!=null) {
							map.put("MARINE_PREMIUM", ae.getMarinePremium());
							map.put("WAR_PREMIUM", ae.getWarPremium());
							map.put("EXCESS_PREMIUM", ae.getExcessPremium());
							map.put("GOVT_TAX", ae.getGovernmentTax());
							map.put("POLICY_FEE", ae.getPolicyFee());
							map.put("PREMIUM", ae.getTotalPremium());
						}
						PremiumDetails de = epd.getDifference();
						if(de!=null) {
							map.put("MARINE_PREMIUM_DIFF", de.getMarinePremium());
							map.put("WAR_PREMIUM_DIFF", de.getWarPremium());
							map.put("EXCESS_PREMIUM_DIFF", de.getExcessPremium());
							map.put("GOVT_TAX_DIFF", de.getGovernmentTax());
							map.put("POLICY_FEE_DIFF", de.getPolicyFee());
							map.put("PREMIUM_DIFF", de.getTotalPremium());
						}
					}
			}
		}catch(Exception e) {
			logger.info("Exception Occurred @ PremiumService.EndtPremiumDetails(): "+e);
			e.printStackTrace();
		}
		return map;
	}

	public boolean isFinancialEndorsement(String applicationNo) {
		try {
			CommonInfo cii = new CommonInfo();
			cii.setReferenceNo(applicationNo);
			CommonInfo cio = qac.isFinancialEndorsement(cii);
			if(cio!=null) {
				return cio.isEndorsement();
			}
		}catch(Exception e) {
			logger.info("Exception Occurred @ PremiumService.isFinancialEndorsement(): "+e);
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean isFinancial(String applicationNo) {
		try {
			CommonInfo cii = new CommonInfo();
			cii.setReferenceNo(applicationNo);
			CommonInfo cio = qac.isFinancial(cii);
			if(cio!=null) {
				return cio.isEndorsement();
			}
		}catch(Exception e) {
			logger.info("Exception Occurred @ PremiumService.isFinancial(): "+e);
			e.printStackTrace();
		}
		return false;
	}

	public boolean isEndorsement(String applicationNo) {
		return policyDAO.isEndt(applicationNo);
	}
	
	

	public List<Object> getQuotationInformation(String applicationNo,String branchCode){
		return premiumDAO.getQuotationInformation(applicationNo,branchCode);
	}
	 public List<Object> getQuotationInsuredValue(String applicationNo,String branchCode){
		 return premiumDAO.getQuotationInsuredValue(applicationNo,branchCode);
	 }
	 public int updatePolicyInformation(PremiumAction premiumAction)throws  BaseException{
		 return premiumDAO.updatePolicyInformation(premiumAction);
	 }
	 public int updatePolicyInformationReferral(PremiumAction premiumAction) throws  BaseException{
		 return premiumDAO.updatePolicyInformationReferral(premiumAction);
	 }
	 public Map<String, Object> calculatePremium(String refNo, String[][] commoidty)throws  BaseException{
		 return new PolicyGenerationAction(refNo).calculate(commoidty);
	 }
	 public String updatePremiumInfo(String applicationNo, String totalPremium, String excessPremium, String policyFee,String totalWarPremium, String govtTax,String inceptionFee,String editPolicyFee, String vatTax)throws  BaseException{
		 String finalPremium= String.valueOf(Double.parseDouble(totalPremium)+Double.parseDouble(policyFee)+Double.parseDouble(govtTax)+Double.parseDouble(inceptionFee)+Double.parseDouble(vatTax));
		 return this.premiumDAO.updatePremiumInfo(applicationNo, totalPremium, excessPremium, policyFee, totalWarPremium, finalPremium, govtTax,inceptionFee, editPolicyFee);
	 }
	 public void updateReferralInfo(String applicationNo,String refStatus, String adminRefRemarks, String commission, String adminLogin, String stat)throws  BaseException{
		 premiumDAO.updateAdminReferralInfo(applicationNo, refStatus, adminRefRemarks, commission, adminLogin, stat);
	 }
	 public List<Object> getPolicyInformation(String applicationNo)
	 {
		 return premiumDAO.getPolicyInformation(applicationNo);
	 }
	 /*public Map<String, Object> getConditionsInfo(String applicationNo, String branchCode)throws  BaseException{
		 return premiumDAO.getConditions(applicationNo, branchCode);
	 }*/
	 public String convertConditions(List<Object> idList, List<Object> valueList)throws  BaseException
	 {
		 String result="";
		 if(idList!=null && !idList.isEmpty())	
			{
				for (int i = 0; i < idList.size(); i++) {
					if(StringUtils.isNotEmpty(valueList.get(i).toString()))
					result+=idList.get(i)+"~"+valueList.get(i)+"#";
				}
				if ("".equals(result)) {
					result = NOTHING;
				} else {
					result = result.substring(0, result.length() - 1);
				}
			}
		 return result;
	 }
	 public String policyGeneration(String refNo)
	 {
		 return new PolicyGenerationAction(refNo).policyGeneration();
	 }
	 public boolean getCommissionStatus(String loginId, String productId, String openCoverNo, String issuer, String applicationNo, String branchCode)
	 {
		 String commission=policyDAO.getCommissionPercent(loginId, productId, openCoverNo, issuer, applicationNo, branchCode);
		 return Double.parseDouble(commission)>0;
	 }
	 public boolean getCustAccountStatus(String applicationNo)
	 {
		 return premiumDAO.getCustAccountStatus(applicationNo);
	 }
	 public void updateClausesInfo(String args[])
	 {
		 premiumDAO.updateClausesInfo(args);
	 }
	 public List<Object> getExistingConditions(String option, String branchCode, String coverId, List<String> id)
	 {
		 return premiumDAO.getExistingConditions(option, branchCode, coverId, id);
	 }
	 public void addConditionsInfo(String args[],String editClausesYN)
	 {
		 premiumDAO.addConditionsInfo(args,editClausesYN);
	 }
	 public void sendMail(String refNo, String userType, String refStatus)throws  BaseException{
		 refStatus="A".equals(refStatus)?"accept":("R".equals(refStatus)?"reject":"none");
		 //new PolicyGenerationAction(refNo, userType,userType).mailGeneration(refStatus);
	 }
	 public void quoteMail(String refNo, String userType, String refStatus, String toMailAddress)throws  BaseException{
		 refStatus="A".equals(refStatus)?"accept":("R".equals(refStatus)?"reject":"none");
		// new PolicyGenerationAction(refNo, userType,userType).guoteMailGeneration(refStatus,toMailAddress);
	 }
	 public void referralResponseMail(String refNo, String userType, String refStatus)throws  BaseException{
		 refStatus="A".equals(refStatus)?"accepted":("R".equals(refStatus)?"rejected":"pending");
		// new PolicyGenerationAction(refNo, userType,userType).referralResponseMailGeneration(refStatus);
	 }
	 public boolean getOpenCoverCustomer(String openCoverNo)
	 {
		 return premiumDAO.getOpenCoverCustomer(openCoverNo);
	 }
	 public List<Object> getBasisValList(String branchCode){
		 return premiumDAO.getBasisValList(branchCode);
	 }
	 public Map<String, Object> getPremiumLoadDisc(String loginId)throws  BaseException{
		 return new PolicyGenerationDAO().getResultMap("GET_PREM_LOAD_DISC", new String[]{loginId});
	 }
	 public String getBrokerType(String loginId)
	 {
		 return policyDAO.getValue("brokerType", new String[]{loginId});
	 }
	 public String getLoginId(String applicationNo)
	 {
		 return policyDAO.getValue("GET_LOGIN_ID", new String[]{applicationNo});
	 }
	 public void updateEndtPremium(String quoteNo){
		 policyDAO.updateEndtPremium(quoteNo);
	 }
	 /*public Map<String, Object> getEndtPremiumInfo(String quoteNo){
		 return premiumDAO.getEndtPremiumInfo(quoteNo);
	 }*/
	 /*public boolean isEndt(String applicationNo) {
		 return policyDAO.isEndt(applicationNo);
	 }*/
	 /*public boolean isFinancial(String applicationNo) {
		 return policyDAO.isFinancial(applicationNo);
	 }*/
	 public boolean endtPolicyFee(String applicationNo) {
			return policyDAO.endtPolicyFee(applicationNo);
	 }
	 public void updateEndtPolicyFee(String applicationNo, String policyFee, String govtTax){
		 policyDAO.updateEndtPolicyFee(applicationNo, policyFee, govtTax);
	 }
	 public List<Object> getPolicyDeductibles(String applicationNo)
	 {
		 return premiumDAO.getPolicyDeductibles(applicationNo);
	 }
	 public String getNoteTypeInfo(String applicationNo)
	 {
		 return policyDAO.getNoteTypeInfo(applicationNo);
	 }
	 public String getPaymentModeInfo(String applicationNo)
	 {
		 return policyDAO.getPaymentModeInfo(applicationNo);
	 }
	 public Map<String,Object> getExistingCustInfo(String customerId) {
		 return premiumDAO.getExistingCustInfo(customerId);
	 }
	 public String getCreditNoteStatus(String loginId,String productId){
		 return premiumDAO.getCreditNoteStatus(loginId,productId);
	 }
	 public String validateSumInsured(String applicationNo, String openCoverNo) {
		 return policyDAO.validateSumInsured(applicationNo,openCoverNo);
	 }
	 public void updatePremiumYN(String premiumYN,String finalizeYN,String editClausesYN, String applicationNo,String basicVal) {
	     premiumDAO.updatePremiumYN(premiumYN,finalizeYN,editClausesYN,applicationNo,basicVal);	
	}
	public void updateExcessDescp(String desc, String applicationNo,String excessprecent) {
		premiumDAO.updateExcessDescp(desc,applicationNo,excessprecent);
		
	}
	public void updateEndtEffDate(String effectiveDate,String quoteNo,String type) {
		premiumDAO. updateEndtEffDate( effectiveDate,quoteNo,type);
		
	}
	public void insertDueDetails(String quoteNo, String policyNo, List<String> dueDate, List<String> dueamount,
			List<String> duepercent,List<String> effectiveDatePT, List<String> dueList, 
				String reqFrom, String snoPT, String amendId, String product) {
		new CommonDAO().insertDueDetails(quoteNo, policyNo, dueDate, dueamount, duepercent, effectiveDatePT, dueList, reqFrom, snoPT, amendId, product);
		
	}
	
	public List<String> validatePaymentTerms(String quoteNo, String policyNo, List<String> dueDate, List<String> dueamount,
			List<String> duepercent,List<String> effectiveDatePT, List<String> dueList, 
				String premium, String branchCode) {
		return new CommonDAO().validatePaymentTerms(quoteNo, policyNo, dueDate, dueamount, duepercent, effectiveDatePT, dueList, premium, branchCode);
		
	}
	public List<Object> getPolicyEffectiveDt(String policyNo) {
		return premiumDAO.getPolicyEffectiveDt(policyNo);
	}
	public String validateImsDate(String effectiveDate,String branchCode){
		
		return  premiumDAO.validateImsDate( effectiveDate,branchCode);
		
	}
	public List<Object> getPaymentTermsDetails( String type,String searchValue, String productId, String openCoverNo) {
		return  premiumDAO.getPaymentTermsDetails(type,searchValue,productId,openCoverNo );
	}
	public void updateMarineVatinfo(String quoteNo, String branchCode,String productId) {
		new VatPremiumCalc().updateMarineVatinfo(quoteNo,branchCode,productId);
		
	}
	public void updatePolicyNoDue(String quoteNo, String policyNo) {
		  premiumDAO.updatePolicyNoDue( quoteNo,  policyNo);		
	}
	public List<Map<String, Object>> getDueData(String quoteNo) {
		// TODO Auto-generated method stub
		return premiumDAO.getDueData( quoteNo);
	}
	public String getWarShowYN(String openCoverNo) {
		return premiumDAO.getWarShowYN( openCoverNo);
	}

	public MarineShipResponse shipsDetailResponse(QuotationModel qm) {
		return qac.shipsDetailResponse(qm);
	}
}
