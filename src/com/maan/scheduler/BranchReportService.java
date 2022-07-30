package com.maan.scheduler;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.Logger;

import com.maan.adminnew.common.CommonService;
import com.maan.common.LogUtil;
import com.maan.report.jasper.MarineJasperReport;

public class BranchReportService {
	final Logger logger = LogUtil.getLogger(BranchReportService.class);
	public void BranchReportMail() {
		try {
			//final MailControllerNew mail = new MailControllerNew();
			BranchReportDAO dao = new BranchReportDAO();
			MarineJasperReport jr=new MarineJasperReport(new HashMap<String,Object>());
			
			final String basePath=CommonService.getApplicationPath();
			final String downloadPath = basePath + "downloadFiles/branchReports/";
			
			logger.info("basePath==>" + basePath);
			logger.info("downloadPath==>" + downloadPath);
			
			final Calendar cal = Calendar.getInstance();
			final SimpleDateFormat oracleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
			final String sysDate = oracleDateFormat.format(cal.getTime());
			
			List<Map<String,Object>> branchDetailsList = dao.getBranchDetailsList();
			 
			for(int i=0; i< branchDetailsList.size() ; i++) {
				try {
					Map<String,Object> branchDeatailsMap = branchDetailsList.get(i);
					String branchCode = branchDeatailsMap.get("BRANCH_CODE")==null?"":branchDeatailsMap.get("BRANCH_CODE").toString();
					final String branchName = branchDeatailsMap.get("BRANCH_NAME")==null?"":branchDeatailsMap.get("BRANCH_NAME").toString();
					
					int branchReportCount = dao.getBranchReportCount(sysDate,sysDate,"P","ALL",branchCode);
					if(branchReportCount>0) {
						
						SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy h.mm.ss a");
						String date = sdf.format(cal.getTime());
						
						String filePath = downloadPath + branchName + date + ".pdf";
						
						jr.dayEndBranchReports(sysDate,sysDate,"P","ALL",branchCode, filePath);

						//mail.BranchReportMail(filePath, branchName, branchCode);
					}
				}
				catch(Exception exception) {
					exception.printStackTrace();
					logger.debug(exception);
				}
			}
		}
		catch(Exception exception) {
			exception.printStackTrace();
			logger.debug(exception);
		}
	}
	public void policyDocumentsMail() {
		try {
			//final MailControllerNew mail = new MailControllerNew();
			BranchReportDAO dao = new BranchReportDAO();
			MarineJasperReport jr=new MarineJasperReport(new HashMap<String,Object>());
			
			final String basePath=CommonService.getApplicationPath();
			final String downloadPath = basePath + "downloadFiles/branchReports/";
			
			logger.info("basePath==>" + basePath);
			logger.info("downloadPath==>" + downloadPath);
			
			final SimpleDateFormat oracleDateFormat = new SimpleDateFormat("dd/MM/yyyy");
			//final String sysDate = oracleDateFormat.format(cal.getTime());
			final Calendar cal = Calendar.getInstance();
			//cal.add(Calendar.DATE, -1);
			final String startDate = oracleDateFormat.format(cal.getTime());
			final String endDate = oracleDateFormat.format(cal.getTime());
			
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy h.mm.ss a");
			String date = sdf.format(cal.getTime());
			
			List<Map<String,Object>> branchDetailsList = dao.getBranchDetailsList();
			String type = "Certificate";
			for(int i=0; i< branchDetailsList.size() ; i++) {
				try {
					Map<String,Object> branchDeatailsMap = branchDetailsList.get(i);
					final String branchCode = branchDeatailsMap.get("BRANCH_CODE")==null?"":branchDeatailsMap.get("BRANCH_CODE").toString();
					final String branchName = branchDeatailsMap.get("BRANCH_NAME")==null?"":branchDeatailsMap.get("BRANCH_NAME").toString();
					final String belongingBranch = branchDeatailsMap.get("BELONGING_BRANCH")==null?"":branchDeatailsMap.get("BELONGING_BRANCH").toString();
					
					List<File> files = new ArrayList<File>();
					int scheduleCount = dao.getScheduleCount(startDate,endDate,branchCode);
					if(scheduleCount>0) {
						String filePath = downloadPath + "schedule" + date + ".pdf";
						files.add(new File(filePath));
						jr.certificateSchedule("", branchCode, belongingBranch, filePath,"", startDate, endDate,"N");
					}
					/*int debitCount = dao.getDebitCount(startDate,endDate,branchCode,type);
					if(debitCount>0) {
						String filePath = downloadPath  + "debit" +  date + ".pdf";
						files.add(new File(filePath));
						jr.debitNote("", branchCode, filePath, type,startDate,endDate,"N");
					}
					int creditCount = dao.getCreditCount(startDate,endDate,branchCode,type);
					if(creditCount>0) {
						String filePath = downloadPath  + "credit" +  date + ".pdf";
						files.add(new File(filePath));
						jr.creditNote("", branchCode, filePath, type, startDate, endDate,"N");
					}*/
					if(files.size()>0) {
						//mail.policyDocumentsMail(files, branchName, branchCode);
					}
				} catch(Exception exception) {
					logger.debug(exception);
				}
			}
		} catch(Exception exception) {
			logger.debug(exception);
		}
	}
}
