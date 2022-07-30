package com.maan.quotation.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.Logger;

import com.maan.common.LogUtil;
import com.maan.common.Token;
import com.maan.common.dao.CommonDAO;
import com.maan.quotation.QuotationAction;
import com.maan.quotation.api.QuotationApiCall;
import com.maan.quotation.dao.QuotationDAO;
import com.maan.quotation.model.CommonInfo;
import com.maan.quotation.model.CommonModel;
import com.maan.quotation.model.EndtTypeRes;
import com.maan.quotation.model.QuotationModel;
import com.maan.quotation.model.QuotationResponse;
import com.maan.webservice.PolicyGenerationAction;
import com.maan.webservice.dao.PolicyGenerationDAO;

public class QuotationService {
	final Logger logger = LogUtil.getLogger(QuotationService.class);
	QuotationDAO quoteDAO=new QuotationDAO();	
	PolicyGenerationDAO policyDAO=new PolicyGenerationDAO();
	QuotationApiCall qac = new QuotationApiCall();
	
	public List<Map<String, Object>> dropDownList(String key, Object[] args){
		return qac.dropDownList(key, args);
	}
	
	public String getDropDownCode(List<Map<String, Object>> list, String id) {
		try {
			if(list!=null && list.size()>0 && StringUtils.isNotBlank(id)) {
				String str = list.stream().filter(a -> id.equalsIgnoreCase(a.get("CODEDESC")==null?"":a.get("CODEDESC").toString())).collect(Collectors.toList()).get(0).get("CODE").toString();
				return str;
			}
		}catch(Exception e) {
			logger.info("Exception @ QuotationService.getDropDownCode(): "+e);
			e.printStackTrace();
		}
		return "";
	}
	
	public String getDropDownDesc(List<Map<String, Object>> list, String id) {
		try {
			if(list!=null && list.size()>0 && StringUtils.isNotBlank(id)) {
				String str = list.stream().filter(a -> id.equalsIgnoreCase(a.get("CODE")==null?"":a.get("CODE").toString())).collect(Collectors.toList()).get(0).get("CODEDESC").toString();
				return str;
			}
		}catch(Exception e) {
			logger.info("Exception @ QuotationService.getDropDownDesc(): "+e);
			e.printStackTrace();
		}
		return "";
	}
	
	public String getDropDownValue(List<Map<String, Object>> list, String id) {
		try {
			if(list!=null && list.size()>0 && StringUtils.isNotBlank(id)) {
				String str = list.stream().filter(a -> id.equalsIgnoreCase(a.get("CODE")==null?"":a.get("CODE").toString())).collect(Collectors.toList()).get(0).get("CODEVALUE").toString();
				return str;
			}
		}catch(Exception e) {
			logger.info("Exception @ QuotationService.getDropDownValue(): "+e);
			e.printStackTrace();
		}
		return "";
	}
	
	public QuotationResponse saveQuote(QuotationModel qmi) {
		return qac.saveQuote(qmi);
	}

	public QuotationResponse quotePremiumCalc(QuotationModel qmi2) {
		return qac.quotePremiumCalc(qmi2);
	}

	public QuotationResponse editQuote(QuotationModel qmi) {
		return qac.editQuote(qmi);
	}

	public Map<String, Object> policyEndtInfo(String quoteNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			CommonInfo cmi = new CommonInfo();
			cmi.setQuoteNo(quoteNo);
			CommonModel cmo = qac.policyEndtInfo(cmi);
				CommonInfo ci = cmo.getOpenCoverResponse();
				if(ci != null) {
					map.put("POLICY_NO", ci.getPolicyNo()==null?"":ci.getPolicyNo());
					map.put("BROKER_NAME", ci.getBrokerName()==null?"":ci.getBrokerName());
					map.put("CUSTOMER_NAME", ci.getCustomerName()==null?"":ci.getCustomerName());
				}
		}catch(Exception e) {
			logger.info("Exception @ QuotationService.policyEndtInfo(): "+e);
			e.printStackTrace();
		}
		return map;
	}

	public Map<String, Object> openCoverInfo(String openCoverNo) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			CommonInfo cmi = new CommonInfo();
			cmi.setOpenCoverNo(openCoverNo);
			CommonModel cmo = qac.openCoverInfo(cmi);
			//if(Token.save(cmo.getDefaultValue())) {
				CommonInfo ci = cmo.getOpenCoverResponse();
				if(ci != null) {
					map.put("OPEN_COVER_NO", ci.getOpenCoverNo()==null?"":ci.getOpenCoverNo());
					map.put("BROKER_NAME", ci.getBrokerName()==null?"":ci.getBrokerName());
					map.put("CUSTOMER_NAME", ci.getCustomerName()==null?"":ci.getCustomerName());
				}
			//}
		}catch(Exception e) {
			logger.info("Exception @ QuotationService.openCoverInfo(): "+e);
			e.printStackTrace();
		}
		return map;
	}

	public String selectedEndorsements(String applicationNo) {
		try {
			CommonInfo cmi = new CommonInfo();
			cmi.setReferenceNo(applicationNo);
			EndtTypeRes cmo = qac.selectedEndorsements(cmi);
			if(cmo!=null) {
				return cmo.getEndorsementDesc()==null?"":cmo.getEndorsementDesc();
			}
		}catch(Exception e) {
			logger.info("Exception @ QuotationService.selectedEndorsements(): "+e);
			e.printStackTrace();
		}
		return "";
	}
	
	
	
	public List<Object> getOptionsList(String option, Object[] objects)
	{
		return quoteDAO.getOptionsList( option, objects);
	}
	public Map<String, Object> getBranchInfo(String branchCode)
	{
		return quoteDAO.getBranchInfo(branchCode);
	}
	public List<String> getQuoteInfo(QuotationAction action)
	{
		return quoteDAO.getQuoteInfo(action);
	}
	public String addCommodity(String applicationNo,String refNo, List<Object> commList)
	{
		return quoteDAO.addCommodity(applicationNo, refNo, commList);
	}
	public String updateCommodity(String applicationNo, List<Object> commList)
	{
		return quoteDAO.updateCommodity(applicationNo, commList);
	}
	public String getQuote(String applicationNo, Object[] args, String quoteType, String status, String userType, String refNo,String loginUserType,String finalizeYN)
	{
		quoteDAO.insertOrUpdateQuote(applicationNo,args,quoteType);
		if(!"RA".equalsIgnoreCase(status) && !"Y".equalsIgnoreCase(finalizeYN)){
			return new PolicyGenerationAction(refNo, userType,loginUserType).quoteGeneration();
		}else{
			return new PolicyGenerationAction(refNo).update();
		}
	}
	public String getApplicationNo()
	{
		return new PolicyGenerationDAO().getMaxApplicationNo();
	}
	public List<Object> getCustomerSelectionList(String loginId,String searchValue,String openCoverNo, String searchType)
	{
		return quoteDAO.getCustomerSelectionList(loginId,searchValue,openCoverNo,searchType);
	}
	public List<Object> getCoreCustomerSearch(String searchValue, String searchType) {
		return quoteDAO.getCoreCustomerSearch(searchValue, searchType);
	}
	public String getSingleInfo(String option, String[] args)
	{
		return quoteDAO.getSingleInfo(option,args);
	}
	public List<Object> getVesselList(String vesselName, String branchCode)
	{
		return qac.getVesselList(vesselName,branchCode);
	}
	public String checkExist(String dataValue,String datatype,String applicationNo,String ocNO)
	{
		return quoteDAO.checkExist(dataValue, datatype,applicationNo,ocNO);
	}
	public String getBrokerLoginId(String brokerCode)
	{
		return quoteDAO.getBrokerLoginId(brokerCode);	
	}
	/*public String getPolicyEndtType(String applicationNo)
	{
		return quoteDAO.getPolicyEndtType(applicationNo);	
	}*/
	/*public Map<String, Object> getPolicyEndtInfo(String quoteNo)
	{
		return policyDAO.getResultMap("GET_ENDT_POL_INFO", new String[]{quoteNo});	
	}*/
	/*public Map<String, Object> getOpenCoverInfo(String openCoverNo)
	{
		return policyDAO.getResultMap("GET_OC_INFO", new String[]{openCoverNo});	
	}*/
	public String getQuoteIssuer(String applicationNo)
	{
		return policyDAO.getValue("GET_QUOTE_ISSUER", new String[]{applicationNo});	
	}
	public String getDirectStatus(String applicationNo,String branchCode)
	{
		return new CommonDAO().getDirectStatus(applicationNo,branchCode);
	}
	public String getbranchWiseCountry(String branchCode)
	{
		return quoteDAO.getbranchWiseCountry(branchCode);
	}
	public boolean getDubaiTradeStatus(String brokerCode,String branchCode)
	{
		return quoteDAO.getDubaiTradeStatus(brokerCode,branchCode);
	}
	public List<Object> lcSelectionList(String ocNo, String searchValue, String exact) {
		return quoteDAO.lcSelectionList(ocNo, searchValue, exact);
	}
	public int lcNoExist(String lcNo, String ocNo){
		return quoteDAO.lcNoExist(lcNo, ocNo);
	}
	public int checkValidPromotionalCode(String promotionalCode, String branchCode) {
		return quoteDAO.checkValidPromotionalCode(promotionalCode, branchCode);
	}
	public void updateWSMarineQuote(String[] args){
		quoteDAO.updateWSMarineQuote(args);
	}
	public List<Map<String, Object>> searchList(String applicationNo,String branchCode) {
		return quoteDAO.searchList(applicationNo,branchCode);
	}
	public String addCommodity(String applicationNo,String refNo, List<Object> commList, String branchCode) {
		return quoteDAO.addCommodity(applicationNo, refNo, commList, branchCode);
	}
	public String deleteCommodity(String applicationNo,String commodityCode) {
		return quoteDAO.deleteCommodity(applicationNo, commodityCode);
	}
	public int getCommodityExist(String commodityId, String applicationno){
		 return quoteDAO.getCommodityExist(commodityId, applicationno);
	}
	public String getFragile(String category,String appNo) {
		 return quoteDAO.getFragile(category,appNo);
		
	}
	public double getSaleTermValue(String saleTermPercent, String branchCode) {
		return quoteDAO.getSaleTermValue(saleTermPercent,branchCode);
	}
	public double getToleranceValue(String tolerance, String branchCode) {
		return quoteDAO.getToleranceValue(tolerance,branchCode);
	}
	public void setOpenCustomerInfo(QuotationAction bean, String openCoverNo) {
		quoteDAO.setOpenCustomerInfo(bean, openCoverNo);
	}
	public String updateExcessDesc(String cover,String applicationNo,String openCoverNo) {
		return quoteDAO.updateExcessDesc(cover,applicationNo,openCoverNo);
	}
	public int validateCoverReferral(String commodityId,String branchCode, String coverId) {
		return quoteDAO.validateCoverReferral(commodityId,branchCode,coverId);
	}
	public String invoicExist(String invoiceNo,String ocNo,QuotationAction bean) {
		return quoteDAO.invoicExist(invoiceNo,ocNo, bean);
	}

	public void getBrokerInformation(QuotationAction bean) {
		quoteDAO.getBrokerInformation(bean);
	}
	public List<Object> getCustomerSelectionListNew(QuotationAction bean) {
		return quoteDAO.getCustomerSelectionListNew(bean);
	}

	public String getWarOption(String openCoverNo) {
		return quoteDAO.getWarOption( openCoverNo);
	}

	public void updateFinalizeStatus(String finalizeYN, String quoteNo) {
		quoteDAO.updateFinalizeStatus( finalizeYN,  quoteNo);
	}
}