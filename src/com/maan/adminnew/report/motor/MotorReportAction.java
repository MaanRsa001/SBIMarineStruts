package com.maan.adminnew.report.motor;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.maan.adminnew.common.CommonService;
import com.maan.adminnew.report.common.ReportDAO;
import com.maan.common.LogUtil;
import com.maan.common.Validation;
import com.maan.report.jasper.JasperReport;
import com.maan.report.jasper.MotorJasperReport;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class MotorReportAction extends ActionSupport implements ModelDriven<MotorReportBean> {
	final Logger logger = LogUtil.getLogger(MotorReportAction.class);
	private static final long serialVersionUID = 1L;
	private MotorReportBean bean=new MotorReportBean();
	final HttpServletRequest request=ServletActionContext.getRequest();
	MotorReportService service=new MotorReportService();
	CommonService cservice=new CommonService();
	Map<String, Object> session=ActionContext.getContext().getSession();
	String branchCode=(String)session.get("BranchCode");
	String loginId=(String)session.get("user"); 
	Validation validation=new Validation();
	String freightStatus=(String)session.get("freightStatus")==null?"":(String)session.get("freightStatus");
	private InputStream inputStream;
	private String fileName;
	//String freightStatus=request.getParameter("freightStatus")==null?"":request.getParameter("freightStatus");

	public String open()
	{
		return "motorReport";
	}
	public String dailySearch()
	{
		return "dailyReport";
	}
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

	public String getMotor(){
		validateDate();
		if(!hasActionErrors())
		bean.setMotorReportList(service.getMotorReport(bean));
		/*if(StringUtils.isNotBlank(bean.getFromDate()))
			bean.setFromDate(dateFormat(bean.getFromDate()));
		if(StringUtils.isNotBlank(bean.getToDate()))
			bean.setToDate(dateFormat(bean.getToDate()));*/
		return "motorReport";
		
	}
	
	public String getDaily(){
		validateDate();
		if(!hasActionErrors()){
			bean.setDailyReportList(service.getDailyReport(bean));
			bean.setMode("dailyList");
		}
			return "dailyReport";
			
	}
	
	private void validateDate(){
		long date = diffInDays(bean.getToDate(),bean.getFromDate());
			if (StringUtils.isEmpty(bean.getFromDate())){
				addActionError(getText("error.startDate"));
			}if (StringUtils.isEmpty(bean.getToDate())){
				addActionError(getText("error.endDate"));
			}else if (date > 0){
				 addActionError(getText("error.diff.date"));
			 }
		
		
	}

	public MotorReportBean getModel() {
		return bean;
	}
	
	public long diffInDays(String startDate,String endDate){
		long result=0;
		if(!StringUtils.isEmpty(startDate)&& !StringUtils.isEmpty(endDate)){
		try{
			Date date = new Date();
	        Calendar cal1 = Calendar.getInstance();
	        Calendar cal2 = Calendar.getInstance();
	        SimpleDateFormat sfd = new SimpleDateFormat("dd/MM/yyyy");
	        cal1.setTime(sfd.parse(startDate));
	        if(StringUtils.isBlank(endDate))
	        	cal2.setTime(sfd.parse(sfd.format(date)));
	        else
	        cal2.setTime(sfd.parse(endDate));
	        long milis1 = cal1.getTimeInMillis();
	        long milis2 = cal2.getTimeInMillis();
	        long diff = milis2 - milis1;
	        result = diff / (24 * 60 * 60 * 1000);
		}catch (Exception e) {
			e.printStackTrace();
		}
		}
		
		return result;
	}
	
	
	public String report()throws IOException
	{
		
		fileName = "MotorReport";		 
		JasperReport jr=new MotorJasperReport(session); 
		
		Object[] param={bean.getFromDate(),bean.getToDate(),bean.getPolicyType()};
		ByteArrayOutputStream report=(ByteArrayOutputStream)jr.scheduleWithStream("motorAdminReport", param); 
		inputStream = new ByteArrayInputStream(report.toByteArray());
		return "excel";
	}
	
	public String dailyReport() throws IOException
	{
		/*String result="excel";
		try{
				fileName = "DailyReport";
				ByteArrayOutputStream bos=new ByteArrayOutputStream();
				Object args[]=new Object[2];
				args[0]=bean.getFromDate();
				args[1]=bean.getToDate();
				new MotorJasperReport(session).DailyReport(args,result,bos);
				inputStream=new ByteArrayInputStream(bos.toByteArray());
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;*/
		logger.info("Enter DailyReport");
		validateReport();
		if(!hasActionErrors()){
		fileName = "DailyReport"+bean.getReportType();
		JasperReport jr=new MotorJasperReport(session);
		Object[] param = {bean.getFromDate(),bean.getToDate(),bean.getReportType(),bean.getPolicyType()};
		ByteArrayOutputStream report = (ByteArrayOutputStream)jr.scheduleWithStream("motorDailyReport",param);
		inputStream = new ByteArrayInputStream(report.toByteArray());
		return "excel";
		}
		else{
		return "dailyReport";}
	}
	

	private void validateReport() {
		if(StringUtils.isBlank(bean.getFromDate())){
			addActionError(getText("Please Select Start Date"));
		}
		if(StringUtils.isBlank(bean.getToDate())){
			addActionError(getText("Please Select End Date"));
		}
		if(StringUtils.isBlank(bean.getReportType())){
			addActionError(getText("Please Select Type"));
		}
		if(StringUtils.isBlank(bean.getPolicyType())){
			addActionError(getText("Please Select Policy Type"));
		}
	
}

	public String dailySummary()
	{
		logger.info("Enter DailySummary");
		fileName = "DailySummary";
		JasperReport jr=new MotorJasperReport(session);
		Object[] param = {bean.getFromDate(),bean.getToDate()};
		ByteArrayOutputStream report = (ByteArrayOutputStream)jr.scheduleWithStream("motorDailySummary",param);
		inputStream = new ByteArrayInputStream(report.toByteArray());
		return "excel";
	}
	
	public String openClaimIntimationReport(){
		return "claimIntimationReport";
	}
	
	public String claimIntimation(){
		validateDate();
		if(!hasActionErrors())
			bean.setClaimIntimateReportList(service.claimIntimateReportList(bean));
		    bean.setClaimIntimateReportTpaList(service.claimIntimateReportTpaList(bean));
		return "claimIntimationReport";
	}
	public String najmReport(){
		bean.setMode("najm");
		return "dailyReport";
	}
	public String najmpendingReport(){
		logger.info("Enter into the NAJM report");
		validateDate();
		if(!hasActionErrors()){
		fileName = "NajmReport";
		JasperReport jr = new MotorJasperReport(session);
		Object[] param = {bean.getFromDate(),bean.getToDate()};
		ByteArrayOutputStream report = (ByteArrayOutputStream)jr.scheduleWithStream("motorNAJMReport",param);
		inputStream = new ByteArrayInputStream(report.toByteArray());
		return "excel";
		}
		else{
		bean.setMode("najm");
		return "dailyReport";
		}
	}
	
}
