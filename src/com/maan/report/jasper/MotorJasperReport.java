package com.maan.report.jasper;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;

import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.export.JRXlsExporter;
import net.sf.jasperreports.engine.export.JRXlsExporterParameter;

import com.opensymphony.xwork2.ActionContext;
/*
 *   Created By Shanish 
 *   
 *    Purpose Only Motor Related Jasper's
 * **/
public class MotorJasperReport  extends JasperReport{

	public MotorJasperReport(Map<String, Object> session) {
		super(session);
		// TODO Auto-generated constructor stub
	}

	@Override
	public void scheduleReport(String quoteNo, String productId, String branchCode, String filePath,
			String displayText) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void otherSchedule(String type, Object[] param) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public OutputStream scheduleWithStream(String type, Object[] param) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public OutputStream scheduleWithStream(Map<String, Object> reportJasperParameters) {
		// TODO Auto-generated method stub
		return null;
	}

/*	public MotorJasperReport(Map<String, Object> session) {
		super(session);
	}
	
	*//**
	 * Schedule 
	 * **//*
	@Override
	public void scheduleReport(String quoteNo,String productId, String branchCode, String filePath, String displayText) {
		try{
			final Logger jasperLogger = Logger.getLogger("net.sf.jasperreports");	
			jasperLogger.setLevel(Level.ERROR);
			HashMap<String, Object> jasperParameter = new HashMap<String, Object>();
			jasperParameter.put("PvQuote", quoteNo);
			jasperParameter.put("product",productId);
			jasperParameter.put("Pvbranch", branchCode);
			jasperParameter.put("imagePath", imageURL);
			String jasperPath = motorJasperPath + "/ScheduleTP.jasper";
			JasperPrint jasperPrint = fillReport(jasperPath,jasperParameter);
			JasperExportManager.exportReportToPdfFile(jasperPrint,filePath);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	*//***
	 * Credit Note 	 * 
	 
	@Override
	public void creditReport(String quoteNo, String branchCode, String filePath,String displayText) {
		try{
			final Logger jasperLogger = Logger.getLogger("net.sf.jasperreports");	
			jasperLogger.setLevel(Level.ERROR);
			HashMap<String, Object> jasperParameter = new HashMap<String, Object>();
			jasperParameter.put("PvQuoteno", quoteNo);
			jasperParameter.put("PvBranch", branchCode);
			jasperParameter.put("PvStatus", displayText);
			jasperParameter.put("imagePath", imageURL);			
			String jasperPath = motorJasperPath + "/Credit.jasper";
			JasperPrint jasperPrint = fillReport(jasperPath,jasperParameter);
			JasperExportManager.exportReportToPdfFile(jasperPrint,filePath);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}

	/**
	 * 
	 * Debit Note
	 * *
	@Override
	public void debitReport(String quoteNo, String branchCode, String filePath,String displayText) {
		try{
			final Logger jasperLogger = Logger.getLogger("net.sf.jasperreports");	
			jasperLogger.setLevel(Level.ERROR);
			HashMap<String, Object> jasperParameter = new HashMap<String, Object>();
			jasperParameter.put("PvQuoteno", quoteNo);
			jasperParameter.put("PvBranch", branchCode);
			jasperParameter.put("PvStatus", displayText);
			jasperParameter.put("imagePath", imageURL);			
			String jasperPath = motorJasperPath + "/Debit.jasper";
			JasperPrint jasperPrint = fillReport(jasperPath,jasperParameter);
			JasperExportManager.exportReportToPdfFile(jasperPrint,filePath);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
	}
*//*
	
	 * if Motor Any Other Schedules Without OutputStream  Use this common Method 
	 * 
	@Override
	public void otherSchedule(String type, Object[] param) {
		 if("receipt".equalsIgnoreCase(type)){
			 String quoteNo=(String)param[0];
			 String branchCode=(String)param[1];
			 String filePath=(String)param[2];
			 getReceiptPDF(quoteNo, branchCode, filePath);
		 }else if("bailBond".equalsIgnoreCase(type)) {
			 String quoteNo=(String)param[0];
			 String branchCode=(String)param[1];
			 String filePath=(String)param[2];
			 String vehicleId=(String)param[3];
			 getBailBondPDF(quoteNo, branchCode, filePath,vehicleId);
		 }else if("proposalForm".equalsIgnoreCase(type)) {
			 String quoteNo=(String)param[0];
			 String branchCode=(String)param[1];
			 String filePath=(String)param[2];
			 String productId=(String)param[3];
			 getProposalFormPDF(quoteNo, branchCode, filePath,productId);
		 }else if("MotorFleetSchedule".equalsIgnoreCase(type)){
			 String quoteNo=(String)param[0];
			 String branchCode=(String)param[1];
			 String displayText=(String)param[2];
			 String vehicleId=(String)param[3];
			 String filePath=(String)param[4];
			 getMotorFleetSchedule(quoteNo, branchCode, displayText, vehicleId, filePath);
		 } 
			 
	}

		
	public void getReceiptPDF(String quoteNo,String branchCode,String filePath){
		try{
			final Logger jasperLogger = Logger.getLogger("net.sf.jasperreports");	
			jasperLogger.setLevel(Level.ERROR);
			HashMap<String, Object> jasperParameter = new HashMap<String, Object>();
			jasperParameter.put("PvQuote", quoteNo);		 
			jasperParameter.put("Pvbranch", branchCode);
			jasperParameter.put("imagePath", imageURL);
			String jasperPath = motorJasperPath + "/Receipt.jasper";
			JasperPrint jasperPrint = fillReport(jasperPath,jasperParameter);
			JasperExportManager.exportReportToPdfFile(jasperPrint,filePath);
		}catch (Exception e) {
			e.printStackTrace();
		}
	} 
 
	public void getMotorFleetSchedule(String quoteNo, String branchCode, String displayText, String vehicleId, String filePath) {
		try{
			final Logger jasperLogger = Logger.getLogger("net.sf.jasperreports");	
			jasperLogger.setLevel(Level.ERROR);
			HashMap<String, Object> jasperParameter = new HashMap<String, Object>();
			jasperParameter.put("Quoteno", quoteNo);
			jasperParameter.put("Pvbranch", branchCode);
			jasperParameter.put("Status", displayText);
			jasperParameter.put("PvVechicle", vehicleId);
			jasperParameter.put("imagePath", imageURL);
			
			String jasperPath = motorJasperPath + "/PolicyCertificate.jasper";
			JasperPrint jasperPrint = fillReport(jasperPath,jasperParameter);
			JasperExportManager.exportReportToPdfFile(jasperPrint,filePath);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
 
	public void getBailBondPDF(String quoteNo,String branchCode,String filePath,String vehicleId){
		try{
			final Logger jasperLogger = Logger.getLogger("net.sf.jasperreports");	
			jasperLogger.setLevel(Level.ERROR);
			HashMap<String, Object> jasperParameter = new HashMap<String, Object>();
			jasperParameter.put("PvQuote", quoteNo);		 
			jasperParameter.put("Pvbranch", branchCode);
			jasperParameter.put("imagePath", imageURL);
			jasperParameter.put("PvvehicleId", vehicleId);
			String jasperPath = motorJasperPath + "/BailBond.jasper";
			JasperPrint jasperPrint = fillReport(jasperPath,jasperParameter);
			JasperExportManager.exportReportToPdfFile(jasperPrint,filePath);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void getProposalFormPDF(String quoteNo,String branchCode,String filePath,String productId){
		try{
			final Logger jasperLogger = Logger.getLogger("net.sf.jasperreports");	
			jasperLogger.setLevel(Level.ERROR);
			HashMap<String, Object> jasperParameter = new HashMap<String, Object>();
			jasperParameter.put("PvQuote", quoteNo);		 
			jasperParameter.put("PvBranch", branchCode);
			jasperParameter.put("PvProductCode", productId);
			jasperParameter.put("imagePath", imageURL);
			//jasperParameter.put("PvVehicleId", vehicleId);
			String jasperPath = motorJasperPath + "/MotorProposalForm.jasper";
			JasperPrint jasperPrint = fillReport(jasperPath,jasperParameter);
			JasperExportManager.exportReportToPdfFile(jasperPrint,filePath);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public InputStream motorTranDetails(String tranId,String productId, String branchCode) {
		InputStream is=null;
		try{
			final Logger jasperLogger = Logger.getLogger("net.sf.jasperreports");	
			jasperLogger.setLevel(Level.ERROR);
			HashMap<String, Object> jasperParameter = new HashMap<String, Object>();
			jasperParameter.put("Pvapplication", tranId);
			jasperParameter.put("Pvproduct", productId);
			jasperParameter.put("Pvbranch", branchCode); 
			String jasperPath = motorJasperPath + "/TransactionDetails.jasper";
			is = generateReport("", jasperParameter, jasperPath, "xls", "stream");
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		return is;
	}
	public OutputStream motorAdminReport(String startdate,String enddate,String policytype){
		OutputStream baos=new ByteArrayOutputStream();
		try{
			Map<String, Object> session=ActionContext.getContext().getSession();					
			String branch=(String)session.get("adminBranch");
			String productId=(String)session.get("product_id");		
			final org.apache.log4j.Logger jasperLogger = org.apache.log4j.Logger.getLogger("net.sf.jasperreports");	
			jasperLogger.setLevel(Level.ERROR);
			String jasperPath =motorJasperPath+"MotorReport.jasper";
			Map<String,Object> jasperParameter = new TreeMap<String,Object>(String.CASE_INSENSITIVE_ORDER);    		
			jasperParameter.put("StartDate", startdate); 
			jasperParameter.put("EndDate", enddate);
			jasperParameter.put("Pvpolicytype", policytype);
			jasperParameter.put("BranchCode", branch); 
			System.out.println(jasperParameter);
			JasperPrint jasperPrint = fillReport(jasperPath,jasperParameter);			 
			exporter("excel",jasperPrint,baos);			 
		}
		catch(Exception e){
			logger.debug(e);
			e.printStackTrace();
		}
		return baos;
	}
	
	public OutputStream motorDailyReport(String startdate,String enddate, String returnType,String policyType){
		ByteArrayOutputStream baos=new ByteArrayOutputStream();
		String jasperPath = "";
		try{
			Map<String, Object> session=ActionContext.getContext().getSession();
			final org.apache.log4j.Logger jasperLogger = org.apache.log4j.Logger.getLogger("net.sf.jasperreports");	
			jasperLogger.setLevel(Level.ERROR);
			if("Policy".equalsIgnoreCase(returnType)){
				jasperPath =motorJasperPath+"PolicyGenerationReport.jasper";
			}
			if("BuyQuote".equalsIgnoreCase(returnType)){
				jasperPath =motorJasperPath+"BuyPolicyReport.jasper";
			}
			if("Quote".equalsIgnoreCase(returnType)){
				jasperPath =motorJasperPath+"WTBuyPolicyReport.jasper";
			}
			if("FailedQuote".equalsIgnoreCase(returnType)){
				jasperPath =motorJasperPath+"FailedQuoteReport.jasper";
			}
			if("PaymentFailed".equalsIgnoreCase(returnType)){
				jasperPath =motorJasperPath+"PaymentFailedReport.jasper";
			}
			if("CancelPolicy".equalsIgnoreCase(returnType)){
				jasperPath =motorJasperPath+"CancelPolicyReport.jasper";
			}
			Map<String,Object> jasperParameter = new TreeMap<String,Object>(String.CASE_INSENSITIVE_ORDER);    		
			jasperParameter.put("startDate", startdate); 
			jasperParameter.put("endDate", enddate);
			jasperParameter.put("policyType", policyType);
			System.out.println(jasperParameter);
			JasperPrint jasperPrint = fillReport(jasperPath,jasperParameter);			 
			exporter("excel",jasperPrint,baos);	
			try{
				StreamToFile(filePath, baos);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		catch(Exception e){
			logger.debug(e);
			e.printStackTrace();
		}
		return baos;
	}
	
	public OutputStream motorDailySummary(String startdate,String enddate){
		OutputStream baos=new ByteArrayOutputStream();
		try{
			Map<String, Object> session=ActionContext.getContext().getSession();
			final org.apache.log4j.Logger jasperLogger = org.apache.log4j.Logger.getLogger("net.sf.jasperreports");
			jasperLogger.setLevel(Level.ERROR);
			String jasperPath =motorJasperPath+"DailySummary.jasper";
			Map<String,Object> jasperParameter = new TreeMap<String,Object>(String.CASE_INSENSITIVE_ORDER);    		
			jasperParameter.put("startDate", startdate); 
			jasperParameter.put("endDate", enddate);
			System.out.println(jasperParameter);
			JasperPrint jasperPrint = fillReport(jasperPath,jasperParameter);			 
			exporter("excel",jasperPrint,baos);			 
		}
		catch(Exception e){
			logger.debug(e);
			e.printStackTrace();
		}
		return baos;
		}
	
	public OutputStream paymentreport(String startdate,String enddate,String productId,String branchCode,String msgStatus){
		OutputStream baos=new ByteArrayOutputStream();
		try{
			Map<String, Object> session=ActionContext.getContext().getSession();						
			final org.apache.log4j.Logger jasperLogger = org.apache.log4j.Logger.getLogger("net.sf.jasperreports");	
			jasperLogger.setLevel(Level.ERROR);
			String jasperPath = motorJasperPath+"paymentreport.jasper";
			Map<String,Object> jasperParameter = new TreeMap<String,Object>(String.CASE_INSENSITIVE_ORDER);    		
			jasperParameter.put("startDate", startdate); 
			jasperParameter.put("endDate", enddate);
			jasperParameter.put("productId", productId);
			jasperParameter.put("branchCode", branchCode);
			jasperParameter.put("type", msgStatus);
			System.out.println(jasperParameter);
			JasperPrint jasperPrint = fillReport(jasperPath,jasperParameter);			 
			exporter("excel",jasperPrint,baos);			 
		}
		catch(Exception e){
			logger.debug(e);
			e.printStackTrace();
		}
		return baos;
	}
	
	*//**
	 *  This Method Any Schedules with OutputStream as return  Use this common Method
	 * **//*
	
	@Override
	public OutputStream scheduleWithStream(String type, Object[] param) {
		OutputStream stream=null;
		if("motorAdminReport".equalsIgnoreCase(type)){
			 String startdate=(String)param[0];
			 String enddate=(String)param[1];
			 String policyType=(String)param[2];			 
			 stream=motorAdminReport(startdate, enddate, policyType);
		 }
		else if("paymentreport".equalsIgnoreCase(type)){
			 String startdate=(String)param[0];
			 String enddate=(String)param[1];
			 String productId=(String)param[2];
			 String branchCode=(String)param[3];
			 String msgStatus =(String)param[4];
			 stream=paymentreport(startdate, enddate, productId,branchCode,msgStatus);
		 }
		else if("motorDailyReport".equalsIgnoreCase(type)){
			String startdate=(String)param[0];
			 String enddate=(String)param[1];
			 String returnType=(String)param[2];
			 String policyType=(String)param[3];
			 stream=motorDailyReport(startdate, enddate,returnType,policyType);
		}
		else if("motorNAJMReport".equalsIgnoreCase(type)){
			 String startdate=(String)param[0];
			 String enddate=(String)param[1];
			 stream=motorNAJMReport(startdate, enddate);
		}
		else if("motorDailySummary".equalsIgnoreCase(type)){
			 String startdate=(String)param[0];
			 String enddate=(String)param[1];
			 stream=motorDailySummary(startdate, enddate);
		}
		return stream;
	}
	 
	private OutputStream motorNAJMReport(String startdate, String enddate) {
		// TODO Auto-generated method stub
		OutputStream baos=new ByteArrayOutputStream();
		try{
			Map<String, Object> session=ActionContext.getContext().getSession();
			final org.apache.log4j.Logger jasperLogger = org.apache.log4j.Logger.getLogger("net.sf.jasperreports");
			jasperLogger.setLevel(Level.ERROR);
			String jasperPath =motorJasperPath+"NajmReport.jasper";
			Map<String,Object> jasperParameter = new TreeMap<String,Object>(String.CASE_INSENSITIVE_ORDER);    		
			jasperParameter.put("startDate", startdate); 
			jasperParameter.put("endDate", enddate);
			System.out.println(jasperParameter);
			JasperPrint jasperPrint = fillReport(jasperPath,jasperParameter);			 
			exporter("excel",jasperPrint,baos);			 
		}
		catch(Exception e){
			logger.debug(e);
			e.printStackTrace();
		}
		return baos;
		}
	
	@Override
	public OutputStream scheduleWithStream(Map<String, Object> jasperParameter) {
		OutputStream stream=new ByteArrayOutputStream();
		try{
			jasperParameter.put("imagePath", imageURL);
			String jasperPath ="";
			String exporterType="";
			if("PRODSUMMARY".equalsIgnoreCase(jasperParameter.get("Pvtype")==null?"":jasperParameter.get("Pvtype").toString())){
				jasperPath =motorJasperPath+"ProdctionSummary.jasper";
				exporterType="pdf";
			}else if("PRODUCTION_BOUDREAUX".equalsIgnoreCase(jasperParameter.get("Pvtype")==null?"":jasperParameter.get("Pvtype").toString())){
				jasperPath =motorJasperPath+"PolicyBoudreaux.jasper";
				exporterType="excel";
			}else if("PRODBRANCHES".equalsIgnoreCase(jasperParameter.get("Pvtype")==null?"":jasperParameter.get("Pvtype").toString())){
				jasperPath =motorJasperPath+"ProdctionBranches.jasper";
				exporterType="pdf";
			}else if("USERWISE".equalsIgnoreCase(jasperParameter.get("Pvtype")==null?"":jasperParameter.get("Pvtype").toString())){
				jasperPath =motorJasperPath+"Prodctionuserwise.jasper";
				exporterType="pdf";
			}
			final org.apache.log4j.Logger jasperLogger = org.apache.log4j.Logger.getLogger("net.sf.jasperreports");	
			jasperLogger.setLevel(Level.ERROR);
			System.out.println(jasperParameter);
			JasperPrint jasperPrint = fillReport(jasperPath,jasperParameter);			 
			exporter(exporterType,jasperPrint,stream);		
		}catch (Exception e) {
			e.printStackTrace();
		}
		return stream;
	}
	
	public void DailyReport(Object[] arg, String downloadType, OutputStream os) {

		try {
			final org.apache.log4j.Logger jasperLogger = org.apache.log4j.Logger
					.getLogger("net.sf.jasperreports");
			jasperLogger.setLevel(Level.ERROR);
			String jasperPath =motorJasperPath+"DailyReport.jasper";
			// JasperReport jasperReport;
			JasperPrint jasperPrint;
			HashMap<String, Object> jasperParameter = new HashMap<String, Object>();

			jasperParameter.put("startDate", arg[0]);
			jasperParameter.put("endDate", arg[1]);
			System.out.println(jasperParameter);

			jasperPrint = fillReport(jasperPath, jasperParameter);
			exporter(downloadType, jasperPrint, os);
		} catch (Exception e) {
			logger.debug(e);
			e.printStackTrace();
		}

		LogManager.push("Filling report finished.........");
	}*/
}
