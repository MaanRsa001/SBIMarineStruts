package com.maan.adminnew.report;

import java.util.List;
import java.util.Map;

public class ReportService
{	
	ReportDAO dao=new ReportDAO();
	
	public Map<Object, Object> schedule(final String broker){
    	return dao.schedule(broker);
    }
	public List<Object> getPolicyReport(final Object[] obj){
    	return dao.getPolicyReport(obj);
    }
	public List<Object> getUwList(String branchCode){
		return dao.getUwList(branchCode);
	}
	public List<Object> getLcSmartList(final ReportBean bean){
		return dao.getLcSmartList(bean);
	}
	public List<Object> getCommodityList(final String branchCode){
		return dao.getCommodityList(branchCode);
	}
	public List<Object> getCoverList(final String branchCode){
		return dao.getCoverList(branchCode);
	}
	public List<Object> getTransportModeList(final String branchCode){
		return dao.getTransportModeList(branchCode);
	}
	public List<Object> getSmartList(final Object[] obj){
		return dao.getSmartList(obj);
	}
	public List<Object> getBranchReport(ReportBean bean){
		return dao.getBranchReport(bean);
	}
	public List<Object> getExchangeReport(ReportBean bean){
    	return dao.getExchangeReport(bean);
    }
	public List<Object> getBranchName(String branchCode,String loginId){
    	return dao.getBranchName(branchCode,loginId);
    }
	public List<Object> getOpenCoverList(ReportBean bean, String branchCode){
    	return dao.getOpenCoverList(bean, branchCode);
    }
	public List<Object> getConsigneeList(ReportBean bean, String branchCode){
    	return dao.getConsigneeList(bean, branchCode);
    }
	public List <Object> getAdminBrokerList(String branchCode, String appId){
    	return dao.getAdminBrokerList(branchCode, appId);
    }
	public List <Object> getCountrySmartList(){
    	return dao.getCountrySmartList();
    }
	public List<Object> getCertificatesList(ReportBean bean, String branchCode) {
		return dao.getCertificatesList(bean,branchCode);
	}
	public String getBrokerLoginId(ReportBean bean) {
		return dao.getBrokerLoginId(bean);
	}
	public List<Map<String,Object>> getOverAll(ReportBean bean,String branchCode,String product){
    	return dao.getOverAll(bean,branchCode,product);
    }
	public List<Map<String, Object>> getOAROne(ReportBean bean,String branchCode,String product){
		return dao.getOverAll(bean,branchCode,product);
	}
	public List<Map<String, Object>> getOAROpen(ReportBean bean,String branchCode,String product){
		return dao.getOverAll(bean,branchCode,product);
	}
	/*public String overallreport(ReportBean bean) {
		return dao.overallreport(bean);
	}*/
	public List<Object> getIntegratedList(ReportBean bean) {
		return dao.getIntegratedList(bean);
	}
	public List<Object> getIntegratedNewList(ReportBean bean) {
		// TODO Auto-generated method stub
		return dao.getIntegratedNewList( bean);
	}
	public List<Object> getmarinereport(ReportBean bean) {
		// TODO Auto-generated method stub
		return dao.getmarinereport(bean);
	}
	public List<Map<String, Object>> getUploadDocList(String policyno) {
		return dao.getUploadDocList( policyno);
	}
	public List<Object> getBranchReportAPI(ReportBean bean) {
		return dao.getBranchReportAPI(bean);
	}
	public List<Object> getOpenCoverListApi(ReportBean bean, String branchCode) {
		return dao.getOpenCoverListApi(bean,branchCode);
	}
	public List<Object> getPolicyReportApi(ReportBean bean) {
		return dao.getPolicyReportApi( bean);
	}
	public String dashboardInfo(ReportBean bean) {
		return dao.dashboardInfo(bean);
	}
	public String BranchReportdownload(Object[] args) {
		return dao.BranchReportdownload(args);
		
	}
	public String openCoverJasper(String startDate, String endDate, String broker, String branchCode,String downloadType) {
		return dao.openCoverJasper( startDate,  endDate,  broker,  branchCode, downloadType) ;
	}
	public String openCoverdetailReport(Object[] args, String downloadType) {
		return dao.openCoverdetailReport(args, downloadType);
	}
	public List<Map<String, Object>> getIntegrationFailedList(ReportBean bean, String branchCode) {
		return dao.getIntegrationFailedList(bean,branchCode);
	}
	public String reintegrate(ReportBean bean) {
		return dao.reintegrate(bean);
	}
	public void editIntegration(ReportBean bean) {
		dao.editIntegration(bean);
	}
	public void updateIntegration(ReportBean bean) {
		dao.updateIntegration(bean);
	}

	public List<Object> getDropDownList(ReportBean bean, String type) {
		return dao.getDropDownList(bean,  type);
	}
}