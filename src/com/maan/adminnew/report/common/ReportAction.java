package com.maan.adminnew.report.common;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.swing.JApplet;

import net.sf.jasperreports.engine.JasperPrint;

import org.apache.commons.lang3.StringUtils;
import com.maan.report.jasper.JasperReport;
import com.maan.report.jasper.MarineJasperReport;
import com.maan.report.jasper.MotorJasperReport;
import com.maan.report.jasper.TravelJasperReport;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import freemarker.template.SimpleDate;

/*
 * Common Reports For Motor, Travel and Marine
 */
public class ReportAction extends ActionSupport implements ModelDriven<ReportBean>{
	private ReportBean bean = new ReportBean();
	ReportService service=new ReportService();
	Map<String, Object> session=ActionContext.getContext().getSession();
	String appId=(String)session.get("AppId");
	private InputStream inputStream;
	private String fileName;
	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
	public InputStream getInputStream() {
		return inputStream;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public ReportBean getModel() {
		bean.setLoginId((String)session.get("user"));
		bean.setBranchCode((String)session.get("BranchCode"));
		bean.setBelongingBranch((String)session.get("BelongingBranch"));
		bean.setProductId((String)session.get("product_id"));
		return bean;
	}
	public List<Map<String,Object>> getBrokerList(){
		return service.getBrokerList(bean);
	}
	public List<Map<String,Object>> getUserNameList(){
		return service.getUserList(bean); 
	}
	public List<Map<String,String>> getBranchList(){
		return service.getBranchList(bean);
	}
	public List<Map<String,Object>> getSubBranchCodeList(){
		return service.getSubBranchList(bean);
	}
	public List<Map<String,Object>> getPolicyTypeList(){
		return service.getPolicyTypeList(bean);
	}
	public List<Map<String,Object>> getReportList(){
		return service.getReportList(bean);
	}
	public String init(){
		return "commonReport";
	}
	public String userAjax(){
		bean.setReqFrom("userListReport");
		return "adminComboAjax";
	}
	public String viewReport(){
		validateReportsDetails();
		if(!hasActionErrors()){
			bean.setMode("view");
		}
		return "commonReport";
	}
	private void validateReportsDetails() {
		try{
			if(StringUtils.isBlank(bean.getDateType())){
				addActionError(getText("Please Choose Do You Want"));
			}
			if(StringUtils.isBlank(bean.getFromDate())){
				addActionError(getText("error.common.report.choose.from.date"));
			}
			if(StringUtils.isBlank(bean.getToDate())){
				addActionError(getText("error.common.report.choose.to.date"));
			} 
			if(StringUtils.isNotBlank(bean.getFromDate()) && StringUtils.isNotBlank(bean.getToDate())){
				SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
				Date d1=sdf.parse(bean.getFromDate());
				Date d2=sdf.parse(bean.getToDate());
				if(d2.before(d1)){
					addActionError(getText("error.common.report.to.date.must.greater.from.date"));
				}
			}
			if(StringUtils.isBlank(bean.getBrokerCode())){
				addActionError(getText("error.common.report.choose.broker.code"));
			}
			if(StringUtils.isBlank(bean.getReportType())){
				addActionError(getText("error.common.report.choose.report.type"));
			}else{
				
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public String reportTran(){
		bean.setTransList(service.getTranReportList(bean));
		return "TranJSON";
	}
	public String download(){
		try{
			if("1".equals(bean.getReportType())){
				fileName = "PRODUCTION_SUMMARY_"+bean.getFromDate()+" to "+bean.getToDate()+".pdf";
			}else if("2".equals(bean.getReportType())){
				fileName = "PRODUCTION_BOUDREAUX_"+bean.getFromDate()+" to "+bean.getToDate()+".xls";
			}else if("3".equals(bean.getReportType())){
				fileName = "PRODUCTION_BRANCH_WISE_"+bean.getFromDate()+" to "+bean.getToDate()+".pdf";
			}else if("4".equals(bean.getReportType())){
				fileName = "PRODUCTION_USER_WISE_"+bean.getFromDate()+" to "+bean.getToDate()+".pdf";
			}
			JasperReport jr = null;
			if("3".equals(bean.getProductId())){
				jr=new MarineJasperReport(session); 
			}
			if("11".equals(bean.getProductId())){
				jr=new MarineJasperReport(session); 
			}
			if("33".equals(bean.getProductId())){
				jr=new TravelJasperReport(session); 
			}
			if("65".equals(bean.getProductId())){
				jr=new MotorJasperReport(session); 
			}
			
			ByteArrayOutputStream report=(ByteArrayOutputStream)jr.scheduleWithStream(service.getReportJasperParameters(bean)); 
			inputStream = new ByteArrayInputStream(report.toByteArray());
		}catch(Exception e){
			e.printStackTrace();
		}
		return "stream";
	}
}