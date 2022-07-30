package com.maan.report.jasper;

import java.io.ByteArrayOutputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperPrint;

import com.opensymphony.xwork2.ActionContext;
/*
 * 				Travel Related Jasper
 * */
public class TravelJasperReport extends JasperReport {

	public TravelJasperReport(Map<String, Object> session) {
		super(session);
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

	/*@Override
	public void creditReport(String quoteNo, String branchCode, String filePath,String displayText) {
	
	}
	
	public void creditNote(String quoteNo, String branchCode, String filePath, String pvType, String startDate, String endDate, String imageStatus) {
		 
		try{
			final Logger jasperLogger = Logger.getLogger("net.sf.jasperreports");	
			jasperLogger.setLevel(Level.ERROR);
			HashMap<String, Object> jasperParameter = new HashMap<String, Object>();
			jasperParameter.put("pvQuote",quoteNo);
			jasperParameter.put("pvBranch", branchCode);	
			jasperParameter.put("imagePath", imageURL);
			//jasperParameter.put("pvType", pvType);
			//jasperParameter.put("Pvstartdate", startDate);
			//jasperParameter.put("pvenddate", endDate);
			//jasperParameter.put("ImageStatus", imageStatus);
			String jasperPath="";
			jasperPath = travelJasperPath + "/Credit.jasper";
			JasperPrint jasperPrint = fillReport(jasperPath,jasperParameter);
			JasperExportManager.exportReportToPdfFile(jasperPrint,filePath);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	@Override
	public void debitReport(String quoteNo, String branchCode, String filePath,String displayText) {
		try{
			final Logger jasperLogger = Logger.getLogger("net.sf.jasperreports");	
			jasperLogger.setLevel(Level.ERROR);
			HashMap<String, Object> jasperParameter = new HashMap<String, Object>();
			jasperParameter.put("pvQuote",quoteNo);
			jasperParameter.put("pvBranch", branchCode);	
			jasperParameter.put("imagePath", imageURL);			
			String jasperPath = travelJasperPath + "/Debit.jasper";
			JasperPrint jasperPrint = fillReport(jasperPath,jasperParameter);
			JasperExportManager.exportReportToPdfFile(jasperPrint,filePath);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
	}

	@Override
	public void otherSchedule(String type, Object[] param) {
	
	}

	@Override
	public void scheduleReport(String quoteNo, String productId,String branchCode, String filePath,String displayText) {
		try{
			final Logger jasperLogger = Logger.getLogger("net.sf.jasperreports");	
			jasperLogger.setLevel(Level.ERROR);
			HashMap<String, Object> jasperParameter = new HashMap<String, Object>();
			jasperParameter.put("quoteNo", quoteNo);
			jasperParameter.put("branchCode", branchCode);
			jasperParameter.put("imagePath", imageURL);
			jasperParameter.put("status", displayText);
			String jasperPath = travelJasperPath+ "/PolicySchedule.jasper";
			JasperPrint jasperPrint = fillReport(jasperPath,jasperParameter);
			JasperExportManager.  exportReportToPdfFile(jasperPrint,filePath);
		}catch (Exception e) {
			LogManager.info("Exception Occured @ Travel Schedule"+e);
			e.printStackTrace();
		}
	}
	public OutputStream travelAdminReport(String startdate,String enddate, String userName, String brokerName, String branchCode){
		OutputStream baos=new ByteArrayOutputStream();
		try{
			Map<String, Object> session=ActionContext.getContext().getSession();					
			String branch=(String)session.get("adminBranch");
			String product=(String)session.get("product_id");		
			final org.apache.log4j.Logger jasperLogger = org.apache.log4j.Logger.getLogger("net.sf.jasperreports");	
			jasperLogger.setLevel(Level.ERROR);
			HashMap<String,Object> jasperParameter = new HashMap<String,Object>();    		
			jasperParameter.put("Pvstartdate", startdate);
			jasperParameter.put("Pvenddate", enddate);		
			jasperParameter.put("Pvbranch", branch);
			jasperParameter.put("BrokerLogin", brokerName);
			jasperParameter.put("Pvloginid", userName);
			System.out.println(jasperParameter);
			String jasperpath = travelJasperPath+"TravelReport.jasper";
			JasperPrint jasperPrint = fillReport(jasperpath,jasperParameter);
			exporter("excel", jasperPrint, baos);
		}
		catch(Exception e){
			logger.debug(e);
			e.printStackTrace();
		}
		return baos;
	}
	public OutputStream travelDetailReport(String startdate,String enddate, String userName, String brokerName, String branchCode){
		OutputStream baos=new ByteArrayOutputStream();
		try{
			Map<String, Object> session=ActionContext.getContext().getSession();					
			String branch=(String)session.get("adminBranch");
			String product=(String)session.get("product_id");		
			final org.apache.log4j.Logger jasperLogger = org.apache.log4j.Logger.getLogger("net.sf.jasperreports");	
			jasperLogger.setLevel(Level.ERROR);
			HashMap<String,Object> jasperParameter = new HashMap<String,Object>();    		
			jasperParameter.put("BrokerLogin", brokerName);
			jasperParameter.put("Pvloginid", userName);
			jasperParameter.put("Pvstartdate", startdate);
			jasperParameter.put("Pvenddate", enddate);			 
			jasperParameter.put("Pvbranch", branch);
			jasperParameter.put("Pvpolicy", "ALL");
			System.out.println(jasperParameter);
			String jasperpath = travelJasperPath+"TravelDetailReport.jasper";
			JasperPrint jasperPrint = fillReport(jasperpath,jasperParameter);
			exporter("excel", jasperPrint, baos);
		}
		catch(Exception e){
			logger.debug(e);
			e.printStackTrace();
		}
		return baos;
	}

	@Override
	public OutputStream scheduleWithStream(String type, Object[] param) {
		OutputStream result=null;
		if("travelAdminReport".equalsIgnoreCase(type)){
			String startdate=(String)param[0];
			String enddate=(String)param[1];
			String userName =(String)param[2];
			String brokerName =(String)param[3];
			String branchCode =(String)param[4];
			result=travelAdminReport(startdate, enddate,userName,brokerName,branchCode);
		}else if("travelDetailReport".equalsIgnoreCase(type)){
			String startdate=(String)param[0];
			String enddate=(String)param[1];
			String userName =(String)param[2];
			String brokerName =(String)param[3];
			String branchCode =(String)param[4];
			result=travelDetailReport(startdate, enddate,userName,brokerName,branchCode);
		}
		return result; 
	}
	public void export(String startDate,String endDate, String loginId ,String jasperPath,OutputStream os,String fileName,String downloadType, String loginId2, String type){
		 
		try{					
			String actualBranch=(String)session.get("adminBranch");
			String productId=(String)session.get("product_id");		
			final org.apache.log4j.Logger jasperLogger = org.apache.log4j.Logger.getLogger("net.sf.jasperreports");	
			jasperLogger.setLevel(Level.ERROR);

			HashMap<String,Object> jasperParameter = new HashMap<String,Object>();    		
			jasperParameter.put("startDate", startDate); 
			jasperParameter.put("endDate", endDate);
			jasperParameter.put("loginid", loginId); 
			jasperParameter.put("product", productId);	
			jasperParameter.put("imagePath", imageURL);		
			System.out.println(jasperParameter);
			JasperPrint jasperPrint = fillReport(jasperPath,jasperParameter);
			exporter(downloadType, jasperPrint, os);
		}
		catch(Exception e){
			logger.debug(e);
			e.printStackTrace();
		}

		LogManager.push("Filling report finished.........");	
	}

	@Override
	public OutputStream scheduleWithStream(Map<String, Object> jasperParameter) {
		OutputStream stream=new ByteArrayOutputStream();
		try{
			jasperParameter.put("imagePath", imageURL);
			String jasperPath ="";
			String exporterType="";
			if("PRODSUMMARY".equalsIgnoreCase(jasperParameter.get("Pvtype")==null?"":jasperParameter.get("Pvtype").toString())){
				jasperPath =travelJasperPath+"ProdctionSummary.jasper";
				exporterType="pdf";
			}else if("PRODUCTION_BOUDREAUX".equalsIgnoreCase(jasperParameter.get("Pvtype")==null?"":jasperParameter.get("Pvtype").toString())){
				jasperPath =travelJasperPath+"PolicyBoudreaux.jasper";
				exporterType="excel";
			}else if("PRODBRANCHES".equalsIgnoreCase(jasperParameter.get("Pvtype")==null?"":jasperParameter.get("Pvtype").toString())){
				jasperPath =travelJasperPath+"ProdctionBranches.jasper";
				exporterType="pdf";
			}else if("USERWISE".equalsIgnoreCase(jasperParameter.get("Pvtype")==null?"":jasperParameter.get("Pvtype").toString())){
				jasperPath =travelJasperPath+"Prodctionuserwise.jasper";
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
		
	}*/
}
