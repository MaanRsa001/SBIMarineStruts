package com.maan.report.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List; 
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.Logger;

import com.maan.common.LogUtil;
import com.maan.common.Token;
import com.maan.report.ReportAction;
import com.maan.report.ReportBean;
import com.maan.report.api.ReportApiCaller;
import com.maan.report.dao.ReportDAO;
import com.maan.report.model.EndorsementCategory;
import com.maan.report.model.EndorsementCategoryList;
import com.maan.report.model.EndorsementInputModel;
import com.maan.report.model.EndorsementOutputModel;

public class ReportService {
	final Logger logger = LogUtil.getLogger(ReportService.class);
	ReportDAO report=new ReportDAO();
	ReportApiCaller apiService = new ReportApiCaller();
	

	public List<Map<String, Object>> endorsementCategoryWithList(String productId) {
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		try {
			EndorsementInputModel eim = new EndorsementInputModel();
			eim.setProductId(productId==null?"":productId);
			EndorsementCategoryList eclo = apiService.endorsementCategoryWithList(eim);
			if(eclo!=null) {
					List<EndorsementCategory> ecl = eclo.getEndorsementResponse();
					if(ecl!=null && ecl.size()>0) {
						for(EndorsementCategory ec: ecl) {
							Map<String, Object> map = new HashMap<String, Object>();
							map.put("ENDT_TYPE_ID", ec.getEndtTypeId()==null?"":ec.getEndtTypeId());
							map.put("ENDT_TYPE", ec.getEndtType()==null?"":ec.getEndtType());
							map.put("ENDT_TYPE_DESC", ec.getEndtTypeDesc()==null?"":ec.getEndtTypeDesc());
							map.put("ENDT_TYPE_CATEGORY_ID", ec.getEndtTypeCategoryId()==null?"": ec.getEndtTypeCategoryId());
							map.put("ENDT_TYPE_CATEGORY", ec.getEndtTypeCategory()==null?"":ec.getEndtTypeCategory());
							list.add(map);
						}
					}
				}

		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public EndorsementOutputModel saveEndorsement(EndorsementInputModel eim) {
		return apiService.saveEndorsement(eim);
	}
	public List<Object> getReportList(String loginId,String productId,String issuer,String menuType,String openCoverNo,String startDate,String endDate, String quoteNo, String policyNo,String searchBy,String searchValue, String searchField,String searchString,String searchOper, String branchCode, String userLogin, String schemeId,String vehicleId)
	{
		return report.getReportList(loginId, productId, issuer, menuType,openCoverNo,startDate,endDate, quoteNo, policyNo,searchBy,searchValue, searchField, searchString, searchOper, branchCode,userLogin,schemeId,vehicleId);
	}
	public List<Object> getUserList(String loginId,String productId,String issuer, String searchBy, String branchCode,String menuType,String opencoverNo)	
	{
		return report.getUserList(loginId, productId, issuer, searchBy, branchCode,menuType,opencoverNo);
	}
	public List<Object> getDeclarationPolicyList(String policyNo)	
	{
		return report.getDeclarationPolicyList(policyNo);
	}
	public List<Object> getLapsedReason(String branchCode)	
	{
		return report.getLapsedReason(branchCode);
	}
	public List<Object> getLapsedQuote(String quoteNo,String productId)	
	{
		return report.getLapsedQuote(quoteNo,productId);
	}
	public int updateLabsed(String quoteNo,String remarks,String loginId,String productId)
	{
		return report.updateLabsed(quoteNo, remarks, loginId,productId);
	}
	public int activeLapsed(String quoteNo, String productId)	
	{
		return report.activeLapsed(quoteNo,productId);
	}
	public List<Object> getSearchResult(ReportAction action, String userType, String productId, String searchby, String searchValue)	
	{
		return report.getSearchResult(action, userType, productId, searchby, searchValue);
	}
	/*public List<Object> getEndTypeList(String productId)	
	{
		return report.getEndTypeList(productId);
	}*/
	public List<Object> getConstantList(String categoryId, String branchCode)	
	{
		return report.getConstantList(categoryId, branchCode);
	}
	public List<Map<String, Object>> getEndtPolicyInfo(String branchCode, String policyNo)	
	{
		return report.getEndtPolicyInfo(branchCode, policyNo);
	}
	public List<Object> getPolicyEndtTypeList(String endtType)	
	{
		return report.getPolicyEndtTypeList(endtType);
	}
	public String getOriginalPolicyNo(String openCoverNo){
		return report.getOriginalPolicyNo(openCoverNo);
	}
	public int[] getTRPortfolio(String loginId,String productId,String issuer,String openCoverNo, String schemeId){
		return report.getTRPortfolio(loginId,productId,issuer,openCoverNo,schemeId);
	}
	public int[] getTRLapsed(String loginId,String productId,String issuer,String openCoverNo,String schemeId){
		return report.getTRLapsed(loginId,productId,issuer,openCoverNo,schemeId);
	}
	public int[] getTRExisting(String loginId,String productId,String issuer,String openCoverNo,String schemeId){
		return report.getTRExisting(loginId,productId,issuer,openCoverNo,schemeId);
	}
	public int[] getTRUnapproved(String loginId,String productId,String issuer,String openCoverNo,String schemeId){
		return report.getTRUnapproved(loginId,productId,issuer,openCoverNo,schemeId);
	}
	public int[] getTRApproved(String loginId,String productId,String issuer,String openCoverNo,String schemeId){
		return report.getTRApproved(loginId,productId,issuer,openCoverNo,schemeId);
	}
	public int[] getTRReject(String loginId,String productId,String issuer,String openCoverNo,String schemeId){
		return report.getTRReject(loginId,productId,issuer,openCoverNo,schemeId);
	}
	public List getSingleInfo(String option, String[] args) {
		return report.getSingleInfo(option,args);
	}
	public String getEndtQuoteNo(String quoteNo) {
		return report.getEndtQuoteNo(quoteNo);
	}
	public Map<String ,Object> getQuoteInfo(String quoteNo) {
		return report.getQuoteInfo(quoteNo);
	}
	public void getUpdateEndtStatus(String quoteNo, String cancelRemarks,String effectiveDate) {
		report.getUpdateEndtStatus(quoteNo, cancelRemarks,effectiveDate);
	}
	public List getLcUploadDetails(String policyNo) {
		return report.getLcUploadDetails(policyNo);
	}
	public void insertLcFileDtls(String policyNo,String loginId,List<String> uploadFileName,File fileToCreate,List<String> lcdocremarks,String lcFilePath,List<File> upload){
		report.insertLcFileDtls(policyNo,loginId,uploadFileName,fileToCreate,lcdocremarks,lcFilePath,upload);
	}
	public List<Object> getLcFileList(String policyNo){
		return report.getLcFileList(policyNo);
	}
	public void deleteLcFile(String policyNo,String uploadId){
		report.deleteLcFile(policyNo,uploadId);
	}
	public List getLcUploadPolicy(String policyNo) {
		return report.getLcUploadPolicy(policyNo);
	}
	public List getLcUploadPloDtls(String policyNo) {
		return report.getLcUploadPloDtls(policyNo);
	}
	public List<Object> getAllDocuments(String policyNo) {
		return report.getAllDocuments(policyNo);
	}
	public String getCancalRemarks(String quoteNo) {		 
		return report.getCancalRemarks(quoteNo);
	}
	public void updateEndtStatus(String quoteNo, String cancelRemarks) {
		 report.updateEndtStatus(quoteNo,cancelRemarks);
		
	}
	public List<Map<String, Object>> getBulkPrintOPList(ReportBean bean, String productId, String reqFrom, String userType, String branchCode, String appId, String loginId) {
		return report.getBulkPrintOPList(bean,productId,reqFrom,userType,branchCode,appId,loginId);
	}
	public String getOPUserName(String adminLoginId) {
		return report.getOPUserName(adminLoginId);
	}
	public String getCancelReissue(String quoteNo){
		 return report.getCancelReissue(quoteNo);
	 }
	
	public void getBulkPrinkList(ReportBean bean, String branchCode, String adminLoginId, String productId) {
		report.getBulkReportList(bean,branchCode,adminLoginId,productId);
	}

	public void getShipDetails(ReportBean bean, String userType, String loginId, String issuer, String type) {
		 report.getShipDetails(bean, userType,loginId,issuer,type);
	}

	public void getShipTrackDetails(ReportBean bean) {
		report.getShipTrackDetails( bean);
		
	}

	public List<Object> getOpenCoverLapsedList(ReportBean bean, String userType, String loginId, String issuer) {
		return report.getOpenCoverLapsedList(bean, userType,  loginId,  issuer);
		
	}

	public List<Object> getOpenCoverBrokerList(ReportBean bean, String productId, String adminLoginId, String branchCode) {
		return report.getOpenCoverBrokerList(bean,productId,adminLoginId,branchCode);
	}

	public List<Object> getOpenCoverCreatedList(ReportBean bean, String userType, String adminLoginId, String issuer,String branchCode) {
		return report.getOpenCoverCreatedList( bean,  userType,  adminLoginId,  issuer, branchCode);
	}

	public List<Object> getOpenCoverEndorseList(ReportBean bean, String userType, String adminLoginId, String issuer,String branchCode) {
		return report.getOpenCoverEndorseList(bean,  userType,  adminLoginId,  issuer, branchCode);
	}

	public void dashboardCharts(String productId, String userType, String issuer, String loginId, String branch, ReportBean bean, String openCoverNo) {
			// Quote Prod
			try{
				List<Map<String, Object>> qDashList = report.dashboardCharts("quoteProd",productId,userType,issuer,loginId,branch,openCoverNo);
				bean.setDcQuoteProdShow("No");
				bean.setDcBQuoteProdShow("No");
				if(qDashList != null && qDashList.size()>0){
					String dcQuoteValue = "";
					String[] nameArr = new String [qDashList.size()];
					String[] countArr = new String [qDashList.size()];
					String[] premiumArr = new String [qDashList.size()];
					for(int a=0;a<qDashList.size();a++){
						Map<String, Object> qDashMap = qDashList.get(a);
						if(qDashMap != null && qDashMap.size()>0){
							String name = qDashMap.get("Name")==null?"":qDashMap.get("Name").toString().trim();
							String count = qDashMap.get("Count")==null?"0":qDashMap.get("Count").toString().trim();
							String premium = qDashMap.get("Premium")==null?"0":qDashMap.get("Premium").toString().trim();
							dcQuoteValue += "{name:'"+name+"',y:"+count+",premium:"+premium+"}";
							if(a<qDashList.size()-1){
								dcQuoteValue += ",";
							}
							bean.setDcQuoteProdShow("Yes");
							nameArr[a] = name;
							countArr[a] = count;
							premiumArr[a] = premium;
							bean.setDcBQuoteProdShow("Yes");
						}
					}
					bean.setDcQuoteProdValues(dcQuoteValue);
					logger.info("DC Quote Prod Value : "+dcQuoteValue);
					bean.setDcBQuoteProdValues("['"+StringUtils.join(nameArr,"','")+"']");
					bean.setDcBQuoteProdCountValues("["+StringUtils.join(countArr,",")+"]");
					bean.setDcBQuoteProdPremiumValues("["+StringUtils.join(premiumArr,",")+"]");
					logger.info("DCB Quote Prod Value : "+bean.getDcBQuoteProdValues());
					logger.info("DCB Quote Prod Count Value : "+bean.getDcBQuoteProdCountValues());
					logger.info("DCB Quote Prod Premium Value : "+bean.getDcBQuoteProdPremiumValues());
				}
			}catch(Exception e){
				bean.setDcQuoteProdShow("No");
				bean.setDcBQuoteProdShow("No");
				logger.info("Exception @ DC Quote Prod ReportService.dashboardCharts() : "+e);
				e.printStackTrace();
			}
			
			// Policy Prod
			try{
				List<Map<String, Object>> pDashList = report.dashboardCharts("policyProd",productId,userType,issuer,loginId,branch, openCoverNo);
				bean.setDcPolicyProdShow("No");
				bean.setDcBPolicyProdShow("No");
				if(pDashList != null && pDashList.size()>0){
					String dcPolicyValue = "";
					String[] nameArr = new String [pDashList.size()];
					String[] countArr = new String [pDashList.size()];
					String[] premiumArr = new String [pDashList.size()];
					for(int a=0;a<pDashList.size();a++){
						Map<String, Object> pDashMap = pDashList.get(a);
						if(pDashMap != null && pDashMap.size()>0){
							String name = pDashMap.get("Name")==null?"":pDashMap.get("Name").toString().trim();
							String count = pDashMap.get("Count")==null?"0":pDashMap.get("Count").toString().trim();
							String premium = pDashMap.get("Premium")==null?"0":pDashMap.get("Premium").toString().trim();
							dcPolicyValue += "{name:'"+name+"',y:"+count+",premium:"+premium+"}";
							if(a<pDashList.size()-1){
								dcPolicyValue += ",";
							}
							bean.setDcPolicyProdShow("Yes");
							nameArr[a] = name;
							countArr[a] = count;
							premiumArr[a] = premium;
							bean.setDcBPolicyProdShow("Yes");
						}
					}
					bean.setDcPolicyProdValues(dcPolicyValue);
					logger.info("DC Policy Prod Value : "+dcPolicyValue);
					bean.setDcBPolicyProdValues("['"+StringUtils.join(nameArr,"','")+"']");
					bean.setDcBPolicyProdCountValues("["+StringUtils.join(countArr,",")+"]");
					bean.setDcBPolicyProdPremiumValues("["+StringUtils.join(premiumArr,",")+"]");
					logger.info("DCB Policy Prod Broker Value : "+bean.getDcBPolicyProdValues());
					logger.info("DCB Policy Prod Count Value : "+bean.getDcBPolicyProdCountValues());
					logger.info("DCB Policy Prod Premium Value : "+bean.getDcBPolicyProdPremiumValues());
				}
			}catch(Exception e){
				bean.setDcPolicyProdShow("No");
				bean.setDcBPolicyProdShow("No");
				logger.info("Exception @ DC Policy Prod ReportService.dashboardCharts() : "+e);
				e.printStackTrace();
			}
		//}
		// Quote
		try{
			List<Map<String, Object>> qDashList = report.dashboardCharts("quote",productId,userType,issuer,loginId,branch, openCoverNo);
			bean.setDcQuoteShow("No");
			bean.setDcBQuoteShow("No");
			if(qDashList != null && qDashList.size()>0){
				String dcQuoteValue = "";
				String[] nameArr = new String [qDashList.size()];
				String[] countArr = new String [qDashList.size()];
				String[] premiumArr = new String [qDashList.size()];
				for(int a=0;a<qDashList.size();a++){
					Map<String, Object> qDashMap = qDashList.get(a);
					if(qDashMap != null && qDashMap.size()>0){
						String name = qDashMap.get("Name")==null?"":qDashMap.get("Name").toString().trim();
						String count = qDashMap.get("Count")==null?"0":qDashMap.get("Count").toString().trim();
						String premium = qDashMap.get("Premium")==null?"0":qDashMap.get("Premium").toString().trim();
						dcQuoteValue += "{name:'"+name+"',y:"+count+",premium:"+premium+"}";
						if(a<qDashList.size()-1){
							dcQuoteValue += ",";
						}
						bean.setDcQuoteShow("Yes");
						nameArr[a] = name;
						countArr[a] = count;
						premiumArr[a] = premium;
						bean.setDcBQuoteShow("Yes");
					}
				}
				bean.setDcQuoteValues(dcQuoteValue);
				logger.info("DC Quote Value : "+dcQuoteValue);
				bean.setDcBQuoteBrokerValues("['"+StringUtils.join(nameArr,"','")+"']");
				bean.setDcBQuoteCountValues("["+StringUtils.join(countArr,",")+"]");
				bean.setDcBQuotePremiumValues("["+StringUtils.join(premiumArr,",")+"]");
				logger.info("DCB Quote Broker Value : "+bean.getDcBQuoteBrokerValues());
				logger.info("DCB Quote Count Value : "+bean.getDcBQuoteCountValues());
				logger.info("DCB Quote Premium Value : "+bean.getDcBQuotePremiumValues());
			}
		}catch(Exception e){
			bean.setDcQuoteShow("No");
			bean.setDcBQuoteShow("No");
			logger.info("Exception @ DC Quote ReportService.dashboardCharts() : "+e);
			e.printStackTrace();
		}
		
		// Policy
		try{
			List<Map<String, Object>> pDashList = report.dashboardCharts("policy",productId,userType,issuer,loginId,branch, openCoverNo);
			bean.setDcPolicyShow("No");
			bean.setDcBPolicyShow("No");
			if(pDashList != null && pDashList.size()>0){
				String dcPolicyValue = "";
				String[] nameArr = new String [pDashList.size()];
				String[] countArr = new String [pDashList.size()];
				String[] premiumArr = new String [pDashList.size()];
				for(int a=0;a<pDashList.size();a++){
					Map<String, Object> pDashMap = pDashList.get(a);
					if(pDashMap != null && pDashMap.size()>0){
						String name = pDashMap.get("Name")==null?"":pDashMap.get("Name").toString().trim();
						String count = pDashMap.get("Count")==null?"0":pDashMap.get("Count").toString().trim();
						String premium = pDashMap.get("Premium")==null?"0":pDashMap.get("Premium").toString().trim();
						dcPolicyValue += "{name:'"+name+"',y:"+count+",premium:"+premium+"}";
						if(a<pDashList.size()-1){
							dcPolicyValue += ",";
						}
						bean.setDcPolicyShow("Yes");
						nameArr[a] = name;
						countArr[a] = count;
						premiumArr[a] = premium;
						bean.setDcBPolicyShow("Yes");
					}
				}
				bean.setDcPolicyValues(dcPolicyValue);
				logger.info("DC Policy Value : "+dcPolicyValue);
				bean.setDcBPolicyBrokerValues("['"+StringUtils.join(nameArr,"','")+"']");
				bean.setDcBPolicyCountValues("["+StringUtils.join(countArr,",")+"]");
				bean.setDcBPolicyPremiumValues("["+StringUtils.join(premiumArr,",")+"]");
				logger.info("DCB Policy Broker Value : "+bean.getDcBPolicyBrokerValues());
				logger.info("DCB Policy Count Value : "+bean.getDcBPolicyCountValues());
				logger.info("DCB Policy Premium Value : "+bean.getDcBPolicyPremiumValues());
			}
		}catch(Exception e){
			bean.setDcPolicyShow("No");
			bean.setDcBPolicyShow("No");
			logger.info("Exception @ DC Policy ReportService.dashboardCharts() : "+e);
			e.printStackTrace();
		}
			
		// Referral Pending
		try{
			List<Map<String, Object>> rpDashList = report.dashboardCharts("referralPend",productId,userType,issuer,loginId,branch, openCoverNo);
			bean.setDcRefPendShow("No");
			bean.setDcBRefPendShow("No");
			if(rpDashList != null && rpDashList.size()>0){
				String dcRefPendValue = "";
				String[] nameArr = new String [rpDashList.size()];
				String[] countArr = new String [rpDashList.size()];
				for(int a=0;a<rpDashList.size();a++){
					Map<String, Object> rpDashMap = rpDashList.get(a);
					if(rpDashMap != null && rpDashMap.size()>0){
						String name = rpDashMap.get("Name")==null?"":rpDashMap.get("Name").toString().trim();
						String count = rpDashMap.get("Count")==null?"0":rpDashMap.get("Count").toString().trim();
						String premium = rpDashMap.get("Premium")==null?"0":rpDashMap.get("Premium").toString().trim();
						dcRefPendValue += "{name:'"+name+"',y:"+count+",premium:"+premium+"}";
						if(a<rpDashList.size()-1){
							dcRefPendValue += ",";
						}
						bean.setDcRefPendShow("Yes");
						nameArr[a] = name;
						countArr[a] = count;
						bean.setDcBRefPendShow("Yes");
					}
				}
				bean.setDcRefPendValues(dcRefPendValue);
				logger.info("DC Referral Pending Value : "+dcRefPendValue);
				bean.setDcBRefPendBrokerValues("['"+StringUtils.join(nameArr,"','")+"']");
				bean.setDcBRefPendCountValues("["+StringUtils.join(countArr,",")+"]");
				logger.info("DCB Referral Pending Broker Value : "+bean.getDcBRefPendBrokerValues());
				logger.info("DCB Referral Pending Count Value : "+bean.getDcBRefPendCountValues());
			}
		}catch(Exception e){
			bean.setDcRefPendShow("No");
			bean.setDcBRefPendShow("No");
			logger.info("Exception @ DC  Referral Pending ReportService.dashboardCharts() : "+e);
			e.printStackTrace();
		}
				
		// Referral Completed
		try{
			List<Map<String, Object>> rcDashList = report.dashboardCharts("referralComp",productId,userType,issuer,loginId,branch, openCoverNo);
			bean.setDcRefCompShow("No");
			bean.setDcBRefCompShow("No");
			if(rcDashList != null && rcDashList.size()>0){
				String dcRefCompValue = "";
				String[] nameArr = new String [rcDashList.size()];
				String[] countArr = new String [rcDashList.size()];
				for(int a=0;a<rcDashList.size();a++){
					Map<String, Object> rcDashMap = rcDashList.get(a);
					if(rcDashMap != null && rcDashMap.size()>0){
						String name = rcDashMap.get("Name")==null?"":rcDashMap.get("Name").toString().trim();
						String count = rcDashMap.get("Count")==null?"0":rcDashMap.get("Count").toString().trim();
						String premium = rcDashMap.get("Premium")==null?"0":rcDashMap.get("Premium").toString().trim();
						dcRefCompValue += "{name:'"+name+"',y:"+count+",premium:"+premium+"}";
						if(a<rcDashList.size()-1){
							dcRefCompValue += ",";
						}
						bean.setDcRefCompShow("Yes");
						nameArr[a] = name;
						countArr[a] = count;
						bean.setDcBRefCompShow("Yes");
					}
				}
				bean.setDcRefCompValues(dcRefCompValue);
				logger.info("DC Referral Completed Value : "+dcRefCompValue);
				bean.setDcBRefCompBrokerValues("['"+StringUtils.join(nameArr,"','")+"']");
				bean.setDcBRefCompCountValues("["+StringUtils.join(countArr,",")+"]");
				logger.info("DCB Referral Completed Broker Value : "+bean.getDcBRefCompBrokerValues());
				logger.info("DCB Referral Completed Count Value : "+bean.getDcBRefCompCountValues());
			}
		}catch(Exception e){
			bean.setDcRefCompShow("No");
			bean.setDcBRefCompShow("No");
			logger.info("Exception @ DC Referral Completed ReportService.dashboardCharts() : "+e);
			e.printStackTrace();
		}
					
		// Referral Rejected
		try{
			List<Map<String, Object>> rrDashList = report.dashboardCharts("referralReject",productId,userType,issuer,loginId,branch, openCoverNo);
			bean.setDcRefRejectShow("No");
			bean.setDcBRefRejectShow("No");
			if(rrDashList != null && rrDashList.size()>0){
				String dcRefRejectValue = "";
				String[] nameArr = new String [rrDashList.size()];
				String[] countArr = new String [rrDashList.size()];
				for(int a=0;a<rrDashList.size();a++){
					Map<String, Object> rrDashMap = rrDashList.get(a);
					if(rrDashMap != null && rrDashMap.size()>0){
						String name = rrDashMap.get("Name")==null?"":rrDashMap.get("Name").toString().trim();
						String count = rrDashMap.get("Count")==null?"0":rrDashMap.get("Count").toString().trim();
						String premium = rrDashMap.get("Premium")==null?"0":rrDashMap.get("Premium").toString().trim();
						dcRefRejectValue += "{name:'"+name+"',y:"+count+",premium:"+premium+"}";
						if(a<rrDashList.size()-1){
							dcRefRejectValue += ",";
						}
						bean.setDcRefRejectShow("Yes");
						nameArr[a] = name;
						countArr[a] = count;
						bean.setDcBRefRejectShow("Yes");
					}
				}
				bean.setDcRefRejectValues(dcRefRejectValue);
				logger.info("DC Referral Rejected Value : "+dcRefRejectValue);
				bean.setDcBRefRejectBrokerValues("['"+StringUtils.join(nameArr,"','")+"']");
				bean.setDcBRefRejectCountValues("["+StringUtils.join(countArr,",")+"]");
				logger.info("DCB Referral Rejected Broker Value : "+bean.getDcBRefRejectBrokerValues());
				logger.info("DCB Referral Rejected Count Value : "+bean.getDcBRefRejectCountValues());
			}
		}catch(Exception e){
			bean.setDcRefRejectShow("No");
			bean.setDcBRefRejectShow("No");
			logger.info("Exception @ DC Referral Rejected ReportService.dashboardCharts() : "+e);
			e.printStackTrace();
		}
	}

	public List<Map<String,Object>> dashboardTopBroker(String productId, String loginId, String userType,String branch, String opencoverno) {
		return report.dashboardTopBroker(productId,loginId,userType,branch,opencoverno);
	}
	public List<Map<String,Object>> dashboardTopReferrals(String productId, String loginId, String userType,String branch, String opencoverno) {
		return report.dashboardTopReferrals(productId, loginId, userType,branch,opencoverno);
	}
	public List<Map<String, Object>> dashboardTopCustomer(String productId, String loginId, String userType,String branch, String opencoverno) {
		return report.dashboardTopCustomer(productId, loginId, userType,branch,opencoverno);
	}

	public String schedulePdf(String applicationNo, String branchCode) {
		return report.schedulePdf( applicationNo,  branchCode);
	}

	public String debitcreditpdf(String policyNo, String docType) {
		return report.debitcreditpdf( policyNo,  docType);
	}

	public String endtSchedule(String applicationNo, String branchCode, String policyNo, String belongingBranch) {
		return report.endtSchedule( applicationNo,  branchCode,  policyNo,  belongingBranch);
	}

	public String clasuesPDF(String applicationNo, String belongingBranch) {
		return report.clasuesPDF( applicationNo,  belongingBranch);
	}

	public List<Map<String,Object>> getBasicEndtInfo(String  policyNo) {
		return report.getBasicEndtInfo( policyNo);
	}

	public String vehiclePDF(String policyNo, String belongingBranch) {
		return report.vehiclePDF( policyNo,  belongingBranch);
	}

	public String PolicyReportdownload(String policyStartDate, String policyEndDate, String issuer , String downloadType,
			String loginId, String openCoverNo, String branchCode, String productId) {
		return report.PolicyReportdownload(policyStartDate, policyEndDate, issuer, downloadType,loginId, openCoverNo,branchCode,productId);
	}

	public String declarePDF(String policyNo, String belongingBranch) {
		return report.declarePDF( policyNo,  belongingBranch);
	}

	public String portalPDF(String quoteNo, String belongingBranch) {
		return report.portalPDF( quoteNo, belongingBranch);
	}
	
}
