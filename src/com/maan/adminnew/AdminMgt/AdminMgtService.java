package com.maan.adminnew.AdminMgt;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.Logger;

import com.maan.common.LogUtil;
import com.maan.common.dao.CommonDAO;

public class AdminMgtService
{	final Logger logger = LogUtil.getLogger(AdminMgtService.class);
	AdminMgtDAO dao=new AdminMgtDAO();
	
	public List<Object>UtypeList(String branchCode,String appId){
		return dao.UtypeList(branchCode, appId);
	}
	public List<Object>getMenuList(final AdminMgtBean bean,String branchCode){
		return dao.getMenuList(bean, branchCode);
	}
	public List<Object>adminList(final AdminMgtBean bean,String branchCode,String appId){
		return dao.adminList(bean, branchCode, appId);
	}
	public void getAdminInfo(final AdminMgtBean bean,String branchCode, String appId){
		dao.getAdminInfo(bean, branchCode, appId);
	}
	public void getMenuInfo(final AdminMgtBean bean,String branchCode){
		dao.getMenuInfo(bean, branchCode);
	}
	public int insNewMenu(final AdminMgtBean bean,String branchCode){
		return dao.insNewMenu(bean, branchCode);
	}
	public int updateMenu(final AdminMgtBean bean,String branchCode){
		return dao.updateMenu(bean, branchCode);
	}
	public int insNewAdmin(final AdminMgtBean bean,String branchCode, String appId){
		return dao.insNewAdmin(bean, branchCode, appId);
	}
	public int updateAdmin(final AdminMgtBean bean,String branchCode, String appId){
		return dao.updateAdmin(bean, branchCode, appId);
	}
	public String getBranch(String branchCode){
		return dao.getBranch(branchCode);
	}
	public List<Object> getDashBoard(String loginId,AdminMgtBean bean,String branchCode) {
		return dao.getDashBoard(loginId,bean,branchCode);
	}
	public void getPopUpList(AdminMgtBean bean,String branchCode) {
		dao.getPopUpList(bean,branchCode);		
	}
	public int saveOptionalCovers(AdminMgtBean bean) {
		return dao.saveOptionalCovers(bean);
	}
	public void getOptionalCoverList(String branchCode, AdminMgtBean bean) {
		dao.getOptionalCoverList(branchCode, bean);
	}
	public List<Map<String,String>> getUwGradeList() {
		 return dao.getUwGradeList();
	}
	public Map<String,List<Object>>  getProductList(AdminMgtBean bean, String branchCode) {
		return dao.getProductList(bean,branchCode);
	}
	public List<Object> getUserSelection(AdminMgtBean bean) {
		return dao.getUserSelection(bean);
	}
	public List<Object> getPaymentTermsDetails(AdminMgtBean bean) {
		return dao. getPaymentTermsDetails(bean);
	}
	public List<Object> getPaymentTermsList(AdminMgtBean bean) {
		return dao. getPaymentTermsList(bean);
	}
	public void insertDueDetails(AdminMgtBean bean) {
		dao.insertDueDetails(bean);
		
	}
	public List<Object> getPaymentTerms(AdminMgtBean bean) {
		return dao.getPaymentTerms(bean);
	}
	public List<Object> getOpenCoverNoList(AdminMgtBean bean) {
		return dao.getOpenCoverNoList(bean);
	}
	public List<Object> getPolicyEffectiveDt(String proposalNo) {
		return dao.getPolicyEffectiveDt(proposalNo);
	}
	public List<String> validatePaymentTerms(String quoteNo, String policyNo, List<String> dueDate, List<String> dueamount,
			List<String> duepercent,List<String> effectiveDatePT, List<String> dueList, 
				String premium, String branchCode) {
		return new CommonDAO().validatePaymentTerms(quoteNo, policyNo, dueDate, dueamount, duepercent, effectiveDatePT, dueList, premium, branchCode);
		
	}
	public String setDefaultDueDetails(AdminMgtBean bean,String proposalNo,String openCoverNo,String orgOpenCoverNo,String totalPremium,String policyFee,String vatTax) {
		String result="";
		List <String>dueamount=new ArrayList<String>();
		List <String>duepercent=new ArrayList<String>();
		List <String>dueDate=new ArrayList<String>();
		List <String>dueList=new ArrayList<String>();
		List <String> effectiveDatePT=new ArrayList<String>();
		List<String>  openCoverNum=new ArrayList<String>();;
		dueList.add("0");
		bean.setDueList(dueList);
		duepercent.add("100");
		bean.setDuepercent(duepercent);
		double premium = Double.parseDouble(StringUtils.isBlank(totalPremium)?"0":totalPremium)+
							Double.parseDouble(StringUtils.isBlank(policyFee)?"0":policyFee )+
								Double.parseDouble(StringUtils.isBlank(vatTax)?"0":vatTax );
		dueamount.add(String.valueOf(premium));
		bean.setDueamount(dueamount);
		openCoverNum.add(openCoverNo);
		bean.setOpenCoverNum(openCoverNum);
		//bean.setOpenCoverNo(orgOpenCoverNo);
		bean.setReqFrom("DefInsert");
		bean.setProposalNo(proposalNo);
		List<Object>  policyEffedate=getPolicyEffectiveDt(proposalNo);
		if(policyEffedate.size()!=0){
			Map<String,Object> temp=(Map<String, Object>) policyEffedate.get(0);
			effectiveDatePT.add(temp.get("POLICY_EFFECTIVE_DATE")==null?"":temp.get("POLICY_EFFECTIVE_DATE").toString());
			bean.setEffectiveDate(effectiveDatePT);
			dueDate.add(temp.get("DUE_DATE")==null?"":temp.get("DUE_DATE").toString());
			bean.setOpenCoverNo(temp.get("OPEN_COVER_NO")==null?orgOpenCoverNo:temp.get("OPEN_COVER_NO").toString());
			bean.setDueDate(dueDate);
		}
		if(premium>0)
			insertDueDetails(bean);
		
		return (premium>0)?bean.getStatus():"Y";
	}
	public void setDefaultDueDetails(AdminMgtBean adminMgtBean,
			String proposalNo, String coverno, String coverno2) {
		 dao.updateCoverNo(proposalNo,coverno);
		
	}
	public void insertNewAdmin(AdminMgtBean bean, String branchCode, String appId) {
		dao.insertNewAdmin(bean,branchCode,appId);
	}
	public void dashboardCharts(String productId, String userType, String branch, String loginId, AdminMgtBean bean) {
		//if("40".equals(productId) || "42".equals(productId)){
			// Quote Prod
			try{
				List<Map<String, Object>> qDashList = dao.dashboardCharts("quoteProd",productId,userType,branch,loginId);
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
				List<Map<String, Object>> pDashList = dao.dashboardCharts("policyProd",productId,userType,branch,loginId);
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
			List<Map<String, Object>> qDashList = dao.dashboardCharts("quote",productId,userType,branch,loginId);
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
			List<Map<String, Object>> pDashList = dao.dashboardCharts("policy",productId,userType,branch,loginId);
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
			List<Map<String, Object>> rpDashList = dao.dashboardCharts("referralPend",productId,userType,branch,loginId);
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
			List<Map<String, Object>> rcDashList = dao.dashboardCharts("referralComp",productId,userType,branch,loginId);
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
			List<Map<String, Object>> rrDashList = dao.dashboardCharts("referralReject",productId,userType,branch,loginId);
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
	public List<Map<String,Object>> dashboardTopBroker(String productId, String loginId, String userType) {
		return dao.dashboardTopBroker(productId,loginId,userType);
	}
	public List<Map<String,Object>> dashboardTopReferrals(String productId, String loginId, String userType) {
		return dao.dashboardTopReferrals(productId, loginId, userType);
	}
	public  List<Object> getMenuList(String menuid, String belongingBranch, String product) {
		return dao.getMenuList( menuid,  belongingBranch,  product);
	}
}