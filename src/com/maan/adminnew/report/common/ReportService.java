package com.maan.adminnew.report.common;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import com.maan.adminnew.common.CommonDAO;
import com.maan.report.jasper.MotorJasperReport;



public class ReportService
{	
	ReportDAO dao=new ReportDAO();

	public List<Map<String, Object>> getBrokerList(ReportBean bean) {
		return dao.getBrokerList(bean);
	}

	public List<Map<String, Object>> getUserList(ReportBean bean) {
		return dao.getUserList(bean);
	}

	public List<Map<String, String>> getBranchList(ReportBean bean) {
		return new CommonDAO().getBranchDetails(bean.getLoginId());
	}

	public List<Map<String, Object>> getSubBranchList(ReportBean bean) {
		return dao.getSubBranchList(bean);
	}

	public List<Map<String, Object>> getPolicyTypeList(ReportBean bean) {
		return dao.getPolicyTypeList(bean);
	}

	public List<Map<String, Object>> getReportList(ReportBean bean) {
		return dao.getReportList(bean);
	}

	public List<Map<String,Object>> getTranReportList(ReportBean bean) {
		return dao.getTranReportList(bean);
	}
	public Map<String, Object> getReportJasperParameters(ReportBean bean) {
		Map<String,Object> jasperParameter = new TreeMap<String,Object>(String.CASE_INSENSITIVE_ORDER);
		try{
			if("1".equals(bean.getReportType())){
				jasperParameter.put("Pvtype","PRODSUMMARY"); 
				jasperParameter.put("Pvstartdate", bean.getFromDate());
				jasperParameter.put("Pvenddate", bean.getToDate());
				jasperParameter.put("Pvbranch", bean.getBranchCode()); 
				jasperParameter.put("Pvagencycode", bean.getBrokerCode());
				jasperParameter.put("Pvpolicytype", bean.getPolicyType());
				jasperParameter.put("Pvsubbranch", bean.getSubBranchCode());
				jasperParameter.put("Pvusername", bean.getUserCode());
				jasperParameter.put("Pvdatetype", bean.getDateType());
				jasperParameter.put("PvproductId", bean.getProductId());
			}else if("2".equals(bean.getReportType())){
				jasperParameter.put("Pvtype","PRODUCTION_BOUDREAUX"); 
				jasperParameter.put("pvstartdate", bean.getFromDate());
				jasperParameter.put("pvenddate", bean.getToDate());
				jasperParameter.put("pvbranch", bean.getBranchCode()); 
				jasperParameter.put("PVbroker", bean.getBrokerCode());
				jasperParameter.put("pvpolicytype", bean.getPolicyType());
				jasperParameter.put("pvsubbranch", bean.getSubBranchCode());
				jasperParameter.put("userCode", bean.getUserCode());
				jasperParameter.put("Pvdatetype", bean.getDateType());
				jasperParameter.put("pvproductid", bean.getProductId()); 
			}else if("3".equals(bean.getReportType())){
				jasperParameter.put("Pvtype","PRODBRANCHES"); 
				jasperParameter.put("Pvstartdate", bean.getFromDate());
				jasperParameter.put("Pvenddate", bean.getToDate());
				jasperParameter.put("Pvbranch", bean.getBranchCode()); 
				jasperParameter.put("Pvagencycode", bean.getBrokerCode());
				jasperParameter.put("Pvpolicytype", bean.getPolicyType());
				jasperParameter.put("Pvsubbranch", bean.getSubBranchCode());
				jasperParameter.put("Pvusername", bean.getUserCode());
				jasperParameter.put("Pvdatetype", bean.getDateType());
				jasperParameter.put("PvproductId", bean.getProductId());
			}else if("4".equals(bean.getReportType())){
				jasperParameter.put("Pvtype","USERWISE"); 
				jasperParameter.put("Pvstartdate", bean.getFromDate());
				jasperParameter.put("Pvenddate", bean.getToDate());
				jasperParameter.put("Pvbranch", bean.getBranchCode()); 
				jasperParameter.put("Pvagencycode", bean.getBrokerCode());
				jasperParameter.put("Pvpolicytype", bean.getPolicyType());
				jasperParameter.put("Pvsubbranch", bean.getSubBranchCode());
				jasperParameter.put("Pvusername", bean.getUserCode());
				jasperParameter.put("Pvdatetype", bean.getDateType());
				jasperParameter.put("PvproductId", bean.getProductId());
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return jasperParameter;
	}

}