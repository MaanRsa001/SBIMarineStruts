package com.maan.adminnew.report.travel;

 
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;


import com.maan.report.jasper.JasperReport;
import com.maan.report.jasper.TravelJasperReport;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class TravelReportAction extends ActionSupport implements ModelDriven<TravelReportBean> {
 
	private static final long serialVersionUID = 1L;
	final HttpServletRequest request=ServletActionContext.getRequest();
	Map<String, Object> session = ActionContext.getContext().getSession();
	String branchCode = (String) session.get("BranchCode");
	String productId = (String) session.get("product_id");
	TravelReportBean bean =new TravelReportBean();
	TravelReportService service = new TravelReportService();
	private InputStream inputStream;
	private String fileName;
	private ByteArrayOutputStream outputfile;
	
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
	
	public TravelReportBean getModel() {		
		return bean;
	}
	
	public String init(){		
 		return "input";
	}
	public String travel(){
		validateTravelReport();
		if(!hasActionErrors())
			bean.setTravelReportList(service.travelReport(bean));
		return SUCCESS;
	}
	
	private void validateTravelReport() {
		long date = diffInDays(bean.getToDate(),bean.getFromDate());
		if(StringUtils.isEmpty(bean.getFromDate())){
			addActionError(getText("error.fromdate"));
			bean.setReqFrom("");
		}else if(StringUtils.isEmpty(bean.getToDate())){
			addActionError(getText("error.todate"));
			bean.setReqFrom("");
		}else if(date > 0){
			 addActionError(getText("error.diff.date"));
			 bean.setReqFrom("");
		 }
		
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
	
	public String report()throws IOException {
		fileName = "TravelReport";
		JasperReport jr=new TravelJasperReport(session);		
		Object[] param={bean.getFromDate(),bean.getToDate(),bean.getUserName(),bean.getBrokerName(),branchCode};
		ByteArrayOutputStream bos = null;
		if("travelReport".equalsIgnoreCase(bean.getMode())){
			bos =(ByteArrayOutputStream)jr.scheduleWithStream("travelAdminReport", param); 
		}else if("travelDetailReport".equalsIgnoreCase(bean.getMode())){
			bos =(ByteArrayOutputStream)jr.scheduleWithStream("travelDetailReport", param); 
		}
		inputStream=new ByteArrayInputStream(bos.toByteArray());		
		return "excel";
	}
}
