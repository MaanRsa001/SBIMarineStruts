package com.maan.verifyPdf;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class VerifyPdfAction extends ActionSupport implements ModelDriven<VerifyPdfBean> {
	VerifyPdfService service = new VerifyPdfService();
	VerifyPdfBean bean = new VerifyPdfBean();
	//JasperReports jr = new JasperReports();
	HttpServletRequest request = ServletActionContext.getRequest();
	
	private InputStream inputStream; 
	
	
	@Override
	public VerifyPdfBean getModel() {
		return bean;
	}
	
	public String getCode() {
		return "verifyCode";
	}
	
	public String checkCode() {
		bean.setQuoteList(service.getQuotelist(bean));
		validation();
		if(!hasActionErrors()) {
			if(bean.getQuoteList().size()==0) {
				addActionError("No policy Found for this Policy Number :" +bean.getPolicyNo()+ " &  Verification Code :" + bean.getCode());
			}
		}
		return "verifyCode";
	}
	
	private void validation() {
		if(bean.getErrors()!=null && bean.getErrors().size()>0) {
			for (int i =0;i<bean.getErrors().size();i++) {
				HashMap<String, Object> map=bean.getErrors().get(i);
				addActionError(map.get("Message").toString());
			}
		}
		/*if(StringUtils.isBlank(bean.getCode())) {
			addActionError("Please Enter Verification Code");
		}
		if(StringUtils.isBlank(bean.getPolicyNo())) {
			addActionError("Please Enter Policy Number");
		}*/
	}

	public String getSchedule() {
		
		/*bean.setFileName("/"+"/OriginalPdf/"+bean.getQuoteNo()+".pdf");
		ByteArrayOutputStream bos=new ByteArrayOutputStream();
		String filePath= request.getSession().getServletContext().getRealPath("/"+"/OriginalPdf/"+bean.getQuoteNo()+".pdf");
		if("3".equalsIgnoreCase(bean.getProductId()) || "11".equalsIgnoreCase(bean.getProductId())) {
			jr.certificateSchedule(bean.getApplicationNo(), "01", "01",  filePath,"", "", "", "Y");
		}else {
			jr.yachtSchedule(bean.getQuoteNo(), bean.getProductId(), filePath, "P");
		}
		inputStream=new ByteArrayInputStream(bos.toByteArray());*/
		return "viewPDF";
	}
	public String initclaim() {
		return "claim";
	}
}
