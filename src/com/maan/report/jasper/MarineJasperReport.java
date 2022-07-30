package com.maan.report.jasper;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperPrint;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.Logger;

import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.pdf.PdfContentByte;
import com.lowagie.text.pdf.PdfImportedPage;
import com.lowagie.text.pdf.PdfReader;
import com.lowagie.text.pdf.PdfWriter;
import com.maan.common.LogUtil;
import com.maan.report.dao.ReportDAO;

public class MarineJasperReport extends JasperReport {
	final Logger logger = LogUtil.getLogger(JasperReport.class);
	public MarineJasperReport(Map<String, Object> session) {
		super(session);
	}

	@Override
	public void otherSchedule(String type, Object[] param) {
		// TODO Auto-generated method stub

	}

	@Override
	public void scheduleReport(String quoteNo, String productId,
			String branchCode, String filePath, String displayText) {
		// TODO Auto-generated method stub

	}

	public void export(String startDate, String endDate, String loginId,
			String jasperPath, OutputStream os, String fileName,
			String downloadType, String loginId2, String type,
			String openCoverNo) {

		try {
			String actualBranch = (String) session.get("adminBranch");
			String productId = (String) session.get("product_id");
			

			HashMap<String, Object> jasperParameter = new HashMap<String, Object>();
			jasperParameter.put("startDate", startDate);
			jasperParameter.put("endDate", endDate);
			jasperParameter.put("loginid", loginId2);
			jasperParameter.put("product", productId);
			jasperParameter.put("branch", actualBranch);
			jasperParameter.put("opencoverno", openCoverNo);
			jasperParameter.put("type", type);
			jasperParameter.put("userLoginId", loginId);
			jasperParameter.put("imagePath", imageURL);
			System.out.println(jasperParameter);
			jasperPath = marineJasperPath + "/" + fileName + ".jasper";
			JasperPrint jasperPrint = fillReport(jasperPath, jasperParameter);
			exporter(downloadType, jasperPrint, os);
		} catch (Exception e) {
			logger.debug(e);
			e.printStackTrace();
		}

		logger.info("Filling report finished.........");
	}

	public void opencoverSchedule(String proposalNo, String openCoverNo,
			String endtstatus, String branchcode, String filePath) {
		try {
			
			HashMap<String, Object> jasperParameter = new HashMap<String, Object>();
			
			jasperParameter.put("proposalNo", proposalNo);
			jasperParameter.put("openCoverNo", openCoverNo);
			jasperParameter.put("endtStatus", endtstatus);
			jasperParameter.put("branchCode", branchcode);
			jasperParameter.put("imagePath", imageURL);
			String jasperPath = marineJasperPath + "/OpenCover.jasper";

			JasperPrint jasperPrint = fillReport(jasperPath, jasperParameter);
			JasperExportManager.exportReportToPdfFile(jasperPrint, filePath);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}

	public void certificateSchedule(String applicationNo, String branchCode,
			String belongingBranch, String filePath, String displayText,
			String startDate, String endDate, String imageStatus) {
		try {
			
			HashMap<String, Object> jasperParameter = new HashMap<String, Object>();
			jasperParameter.put("PvapplicationNo", applicationNo);
			jasperParameter.put("PvbranchCode", branchCode);
			jasperParameter.put("belongingBranchCode", belongingBranch);
			jasperParameter.put("PvimagePath", imageURL);
			jasperParameter.put("Pvstatus", "");
			jasperParameter.put("Pvstartdate", startDate);
			jasperParameter.put("pvenddate", endDate);
			jasperParameter.put("ImageStatus", imageStatus);
			if(!"draft".equalsIgnoreCase(displayText))
				displayText="";
			String jasperPath = "";
			String jasperFileName = "";
			String productId = "";
			if (StringUtils.isNotBlank(applicationNo)) {
				productId = new com.maan.common.dao.CommonDAO()
						.getProductIdByAppNo(applicationNo);
			}
			if ("3".equals(productId)) {
				jasperFileName = "Certificate.jasper";
			} else if ("11".equals(productId)) {
				jasperFileName = "Certificate.jasper";
			} else {
				jasperFileName = "Declaration.jasper";
			}
			jasperPath = marineJasperPath + jasperFileName;

			JasperPrint jasperPrint = fillReport(jasperPath, jasperParameter);
			JasperExportManager.exportReportToPdfFile(jasperPrint, filePath);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}

	public void certificatePrint(String applicationNo, String branchCode,
			String belongingBranch, String filePath, String productId,
			String displayText) {

		if ("11".equals(productId)) {
			certificateSchedule(applicationNo, branchCode, belongingBranch,
					filePath, displayText, "", "", "Y");
		} else {
			try {
				if(!"draft".equalsIgnoreCase(displayText))
					displayText="";
				
				HashMap<String, Object> jasperParameter = new HashMap<String, Object>();
				jasperParameter.put("PvapplicationNo", applicationNo);
				jasperParameter.put("PvbranchCode", branchCode);
				jasperParameter.put("belongingBranch", belongingBranch);
				jasperParameter.put("PvimagePath", imageURL);
				jasperParameter.put("brokerImagePath", imageURL);
				jasperParameter.put("Pvstatus", displayText);
				String jasperPath = "";
				jasperPath = marineJasperPath + "/Certificate.jasper";

				JasperPrint jasperPrint = fillReport(jasperPath,
						jasperParameter);
				JasperExportManager
						.exportReportToPdfFile(jasperPrint, filePath);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
	}

	public void certificateEndt(String policyNo, String applicationNo,
			String branchCode, String belongingBranch, String filePath) {

		try {
			
			HashMap<String, Object> jasperParameter = new HashMap<String, Object>();
			jasperParameter.put("policyNo", policyNo);
			jasperParameter.put("applicationNo", applicationNo);
			jasperParameter.put("branchCode", branchCode);
			jasperParameter.put("imagePath", imageURL);
			jasperParameter.put("belongingBranch", belongingBranch);
			String jasperPath = "";
			jasperPath = marineJasperPath + "/CargoEndtCertificate.jasper";

			JasperPrint jasperPrint = fillReport(jasperPath, jasperParameter);
			JasperExportManager.exportReportToPdfFile(jasperPrint, filePath);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}

	public void debitNote(String PolicyNo, String branchCode, String filePath,
			String pvType, String startDate, String endDate, String imageStatus) {
		try {
			boolean vatApplicable =false;
			if(session != null&& !"Opencover".equalsIgnoreCase(pvType)){
				pvType=session.get("pvType")==null?"":session.get("pvType").toString();
			}
			 vatApplicable=new ReportDAO().getVatStatus(PolicyNo,pvType);
			
			/*if(vatApplicable){
				debitNoteVat(PolicyNo, branchCode, filePath, pvType, startDate, endDate, imageStatus);
			}else{
				debitNoteold(PolicyNo, branchCode, filePath, pvType, startDate, endDate, imageStatus);
			}*/
			debitNoteVat(PolicyNo, branchCode, filePath, pvType, startDate, endDate, imageStatus);
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void debitNoteVat(String PolicyNo, String branchCode, String filePath,
			String pvType, String startDate, String endDate, String imageStatus) throws Exception {
		
		HashMap<String, Object> jasperParameter = new HashMap<String, Object>();
		/*
		 * String applicationNo = finalBean.getApplicationNo(PolicyNo);
		 * if(StringUtils.isBlank(applicationNo)){ applicationNo =
		 * finalBean.getApplicationNo1(PolicyNo); }
		 */
		jasperParameter.put("Pvpolicy", PolicyNo);
		// jasperParameter.put("branchCode", branchCode);
		jasperParameter.put("PvimagePath", imageURL);
		jasperParameter.put("Pvtype", "DR");
		jasperParameter.put("SUBREPORT_DIR", marineJasperPath);
		// jasperParameter.put("Pvstartdate", startDate);
		// jasperParameter.put("pvenddate", endDate);
		jasperParameter.put("ImageStatus", imageStatus);

		String jasperPath = "";
		jasperPath = marineJasperPath + "/DebitNote.jasper";
		//jasperPath = marineJasperPath + "/CargoCredit_subreport1.jasper";
		compileReportToFile(jasperPath);
		

		JasperPrint jasperPrint = fillReport(jasperPath, jasperParameter);
		JasperExportManager.exportReportToPdfFile(jasperPrint, filePath);
}

	public void debitNoteold(String PolicyNo, String branchCode, String filePath,
			String pvType, String startDate, String endDate, String imageStatus) {

		try {
			
			HashMap<String, Object> jasperParameter = new HashMap<String, Object>();
			/*
			 * String applicationNo = finalBean.getApplicationNo(PolicyNo);
			 * if(StringUtils.isBlank(applicationNo)){ applicationNo =
			 * finalBean.getApplicationNo1(PolicyNo); }
			 */
			jasperParameter.put("policyNumber", PolicyNo);
			// jasperParameter.put("branchCode", branchCode);
			jasperParameter.put("imagePath", imageURL);
			jasperParameter.put("pvType", "DR");
			jasperParameter.put("SUBREPORT_DIR", marineJasperPath);
			// jasperParameter.put("Pvstartdate", startDate);
			// jasperParameter.put("pvenddate", endDate);
			jasperParameter.put("ImageStatus", imageStatus);

			String jasperPath = "";
			jasperPath = marineJasperPath + "/CargoCredit_subreport1.jasper";
			 compileReportToFile(jasperPath);
			jasperPath = marineJasperPath + "/CargoCredit.jasper";

			JasperPrint jasperPrint = fillReport(jasperPath, jasperParameter);
			JasperExportManager.exportReportToPdfFile(jasperPrint, filePath);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
	public void creditNote(String PolicyNo, String branchCode, String filePath,
			String pvType, String startDate, String endDate, String imageStatus) {

		try {
			if(session != null&& !"Opencover".equalsIgnoreCase(pvType)){
				pvType=session.get("pvType")==null?"":session.get("pvType").toString();
			}
			boolean vatApplicable =false;
			 vatApplicable=new ReportDAO().getVatStatus(PolicyNo,pvType);
			
			/*if(vatApplicable){
				creditNoteVat(PolicyNo, branchCode, filePath, pvType, startDate, endDate, imageStatus);
			}else{
				creditNoteOld(PolicyNo, branchCode, filePath, pvType, startDate, endDate, imageStatus);
			}*/
			creditNoteVat(PolicyNo, branchCode, filePath, pvType, startDate, endDate, imageStatus);
		
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void creditNoteVat(String PolicyNo, String branchCode, String filePath,
			String pvType, String startDate, String endDate, String imageStatus) {

		try {
			
			HashMap<String, Object> jasperParameter = new HashMap<String, Object>();
			jasperParameter.put("Pvpolicy", PolicyNo);
			// jasperParameter.put("branchCode", branchCode);
			jasperParameter.put("PvimagePath", imageURL);
			jasperParameter.put("Pvtype", "CR");
			jasperParameter.put("SUBREPORT_DIR", marineJasperPath);
			// jasperParameter.put("Pvstartdate", startDate);
			// jasperParameter.put("pvenddate", endDate);
			jasperParameter.put("ImageStatus", imageStatus);

			String jasperPath = "";
			jasperPath = marineJasperPath + "/DebitNote.jasper";

			JasperPrint jasperPrint = fillReport(jasperPath, jasperParameter);
			JasperExportManager.exportReportToPdfFile(jasperPrint, filePath);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void creditNoteOld(String PolicyNo, String branchCode, String filePath,
			String pvType, String startDate, String endDate, String imageStatus) {

		try {
			
			HashMap<String, Object> jasperParameter = new HashMap<String, Object>();
			jasperParameter.put("policyNumber", PolicyNo);
			// jasperParameter.put("branchCode", branchCode);
			jasperParameter.put("imagePath", imageURL);
			jasperParameter.put("pvType", "CR");
			// jasperParameter.put("Pvstartdate", startDate);
			// jasperParameter.put("pvenddate", endDate);
			jasperParameter.put("SUBREPORT_DIR", marineJasperPath);
			jasperParameter.put("ImageStatus", imageStatus);

			String jasperPath = "";
			jasperPath = marineJasperPath + "/CargoCredit_subreport1.jasper";
			 compileReportToFile(jasperPath);
			jasperPath = marineJasperPath + "/CargoCredit.jasper";

			JasperPrint jasperPrint = fillReport(jasperPath, jasperParameter);
			JasperExportManager.exportReportToPdfFile(jasperPrint, filePath);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}


	public void LCSmartReport(String loginId, String branchCode, String type,
			String value, String downloadType, OutputStream os) {

		try {
			
			String jasperPath = marineJasperPath + "/LCSmartReport.jasper";
			HashMap<String, Object> jasperParameter = new HashMap<String, Object>();

			jasperParameter.put("loginId", loginId);
			jasperParameter.put("branchCode", branchCode);
			jasperParameter.put("type", type);
			jasperParameter.put("value", value);

			JasperPrint jasperPrint = fillReport(jasperPath, jasperParameter);
			exporter(downloadType, jasperPrint, os);
		} catch (Exception e) {
			logger.debug(e);
			e.printStackTrace();
		}

		logger.info("Filling report finished.........");
	}

	public void openCoverReport(String startDate, String endDate,
			String loginId, String branchCode, String downloadType,
			OutputStream os) {

		try {
			
			String jasperPath = marineJasperPath + "/OpenCoverReport.jasper";
			HashMap<String, Object> jasperParameter = new HashMap<String, Object>();

			jasperParameter.put("startDate", startDate);
			jasperParameter.put("endDate", endDate);
			jasperParameter.put("loginId", loginId);
			jasperParameter.put("branchCode", branchCode);

			JasperPrint jasperPrint = fillReport(jasperPath, jasperParameter);
			exporter(downloadType, jasperPrint, os);

		} catch (Exception e) {
			logger.debug(e);
			e.printStackTrace();
		}

		logger.info("Filling report finished.........");
	}

	public void openCoverdetailReport(Object[] arg, String downloadType,
			OutputStream os) {

		try {
			
			String jasperPath = marineJasperPath
					+ "/OpenCoverDetailReport.jasper";
			HashMap<String, Object> jasperParameter = new HashMap<String, Object>();

			jasperParameter.put("branchCode", arg[0]);
			jasperParameter.put("startDate", arg[1]);
			jasperParameter.put("endDate", arg[2]);
			jasperParameter.put("brokerLogin", arg[3]);
			jasperParameter.put("loginId", arg[4]);
			jasperParameter.put("productId", arg[5]);
			jasperParameter.put("openCover", arg[6]);

			JasperPrint jasperPrint = fillReport(jasperPath, jasperParameter);
			exporter(downloadType, jasperPrint, os);

		} catch (Exception e) {
			logger.debug(e);
			e.printStackTrace();
		}

		logger.info("Filling report finished.........");
	}

	public void branchReports(String startDate, String endDate, String status,
			String productId, String branchCode, String filePath) {
		try {
			
			HashMap<String, Object> jasperParameter = new HashMap<String, Object>();
			jasperParameter.put("startDate", startDate);
			jasperParameter.put("endDate", endDate);
			jasperParameter.put("status", status);
			jasperParameter.put("productId", productId);
			jasperParameter.put("branchCode", branchCode);
			String jasperPath = "";
			jasperPath = marineJasperPath + "/BranchReports.jasper";

			JasperPrint jasperPrint = fillReport(jasperPath, jasperParameter);
			JasperExportManager.exportReportToPdfFile(jasperPrint, filePath);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}

	public void dayEndBranchReports(String startDate, String endDate,
			String status, String productId, String branchCode, String filePath) {
		try {
			
			HashMap<String, Object> jasperParameter = new HashMap<String, Object>();
			jasperParameter.put("startDate", startDate);
			jasperParameter.put("endDate", endDate);
			jasperParameter.put("status", status);
			jasperParameter.put("branchCode", branchCode);
			String jasperPath = "";
			jasperPath = marineJasperPath + "/DayEndBranchReports.jasper";

			JasperPrint jasperPrint = fillReport(jasperPath, jasperParameter);

			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			exporter("excel", jasperPrint, baos);
			StreamToFile(filePath, baos);
			logger.info("Filling report finished.........");
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}

	public void BranchReport(Object[] arg, String downloadType, OutputStream os) {

		try {
			
			String jasperPath = marineJasperPath + "/BranchReports.jasper";
			// JasperReport jasperReport;
			JasperPrint jasperPrint;
			HashMap<String, Object> jasperParameter = new HashMap<String, Object>();

			jasperParameter.put("startDate", arg[0]);
			jasperParameter.put("endDate", arg[1]);
			jasperParameter.put("productId", arg[2]);
			jasperParameter.put("status", arg[3]);
			jasperParameter.put("branchCode", arg[4]);
			jasperParameter.put("application", arg[5]);
			System.out.println(jasperParameter);

			jasperPrint = fillReport(jasperPath, jasperParameter);
			exporter(downloadType, jasperPrint, os);
		} catch (Exception e) {
			logger.debug(e);
			e.printStackTrace();
		}

		logger.info("Filling report finished.........");
	}

	/**
	 * This Method for Bind all Schedules of Specified Brokers/User
	 * */
	public void policyCertificate(String branchCode, String belongingBranch,
			String filePath, String displayText, String startDate,
			String imageStatus, String openCoverNo, String userType,
			String productId) {

		try {
			
			HashMap<String, Object> jasperParameter = new HashMap<String, Object>();

			jasperParameter.put("branchCode", branchCode);
			jasperParameter.put("belongingBranchCode", belongingBranch);
			jasperParameter.put("imagePath", imageURL);
			jasperParameter.put("status", displayText);
			jasperParameter.put("Pvstartdate", startDate);
			jasperParameter.put("Pvusertype", userType);
			jasperParameter.put("OpencoverNo", openCoverNo);
			jasperParameter.put("ImageStatus", imageStatus);

			String jasperPath = "";
			String jasperFileName = "";
			if ("3".equals(productId)) {
				jasperFileName = "PolicyCertificate.jasper";
			} else {
				jasperFileName = "PolicyOpenCoverCertificate.jasper";
			}

			jasperPath = marineJasperPath + jasperFileName;

			JasperPrint jasperPrint = fillReport(jasperPath, jasperParameter);
			JasperExportManager.exportReportToPdfFile(jasperPrint, filePath);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}

	public void uwBranchReport(Object[] arg, String downloadType,
			OutputStream os) {

		try {
			
			String jasperPath = marineJasperPath + "/UWBrokerReport.jasper";
			JasperPrint jasperPrint;
			HashMap<String, Object> jasperParameter = new HashMap<String, Object>();

			jasperParameter.put("startDate", arg[0]);
			jasperParameter.put("endDate", arg[1]);
			jasperParameter.put("productId", arg[2]);
			jasperParameter.put("status", arg[3]);
			jasperParameter.put("branchCode", arg[4]);
			jasperParameter.put("application", arg[5]);
			jasperParameter.put("loginId", arg[6]);
			System.out.println(jasperParameter);
			jasperPrint = fillReport(jasperPath, jasperParameter);
			exporter(downloadType, jasperPrint, os);
		} catch (Exception e) {
			logger.debug(e);
			e.printStackTrace();
		}

		logger.info("Filling report finished.........");
	}

	@Override
	public OutputStream scheduleWithStream(String type, Object[] param) {
		// TODO Auto-generated method stub
		return null;
	}

	public void overAllReports(Object[] arg, String downloadType,
			OutputStream os) {
		try {
			
			String jasperPath = marineJasperPath + "/overallreport.jasper";
			JasperPrint jasperPrint;
			HashMap<String, Object> jp = new HashMap<String, Object>();
			jp.put("Pvtype", arg[0]);
			jp.put("pvstartdate", arg[1]);
			jp.put("pvenddate", arg[2]);
			jp.put("pvProduct", arg[3]);
			jp.put("Pvbranch", arg[4]);
			System.out.println(jp);
			jasperPrint = fillReport(jasperPath, jp);
			exporter(downloadType, jasperPrint, os);
		} catch (Exception e) {
			logger.debug(e);
			e.printStackTrace();
		}

		logger.info("Filling report finished.........");
	}

	public void DeclarationScdule(String policyNo, String filePath) {
		try {
			//final Logger jasperLogger = Logger .getLogger("net.sf.jasperreports");
			//jasperLogger.setLevel(Level.ERROR);
			HashMap<String, Object> jasperParameter = new HashMap<String, Object>();
			jasperParameter.put("Pvpolicy", policyNo);
			jasperParameter.put("imagePath", imageURL);

			
			String jasperPath = marineJasperPath + "/Declarationwalaa.jasper";

			JasperPrint jasperPrint = fillReport(jasperPath, jasperParameter);
			JasperExportManager.exportReportToPdfFile(jasperPrint, filePath);
		
		} catch (Exception e) {
			logger.debug(e);
			e.printStackTrace();
		}

	}

	@Override
	public OutputStream scheduleWithStream(Map<String, Object> jasperParameter) {
		OutputStream stream = new ByteArrayOutputStream();
		try {
			jasperParameter.put("imagePath", imageURL);
			String jasperPath = "";
			String exporterType = "";
			if ("PRODSUMMARY"
					.equalsIgnoreCase(jasperParameter.get("Pvtype") == null ? ""
							: jasperParameter.get("Pvtype").toString())) {
				jasperPath = marineJasperPath + "ProdctionSummary.jasper";
				exporterType = "pdf";
			} else if ("PRODUCTION_BOUDREAUX".equalsIgnoreCase(jasperParameter
					.get("Pvtype") == null ? "" : jasperParameter.get("Pvtype")
					.toString())) {
				jasperPath = marineJasperPath + "PolicyBoudreaux.jasper";
				exporterType = "excel";
			} else if ("PRODBRANCHES".equalsIgnoreCase(jasperParameter
					.get("Pvtype") == null ? "" : jasperParameter.get("Pvtype")
					.toString())) {
				jasperPath = marineJasperPath + "ProdctionBranches.jasper";
				exporterType = "pdf";
			} else if ("USERWISE".equalsIgnoreCase(jasperParameter
					.get("Pvtype") == null ? "" : jasperParameter.get("Pvtype")
					.toString())) {
				jasperPath = marineJasperPath + "Prodctionuserwise.jasper";
				exporterType = "pdf";
			}
			
			System.out.println(jasperParameter);
			JasperPrint jasperPrint = fillReport(jasperPath, jasperParameter);
			exporter(exporterType, jasperPrint, stream);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return stream;
	}

	public void opencoverMarineVehicle(String proposalNo, String openCoverNo,
			String endtstatus, String attribute, String filePath) {

		try {
			
			HashMap<String, Object> jasperParameter = new HashMap<String, Object>();
			jasperParameter.put("Pvproposalno", proposalNo);
			jasperParameter.put("PvTranId", openCoverNo);
			jasperParameter.put("imagePath", imageURL);

			String jasperPath = marineJasperPath+ "/MarineVehicleDetails.jasper";

			JasperPrint jasperPrint = fillReport(jasperPath, jasperParameter);
			JasperExportManager.exportReportToPdfFile(jasperPrint, filePath);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}

	public void bulkPdfReport(String type, String startDate,
			String openCoverNo1, String userType, String branchCode,
			String imageStatus, String issuer, String endDate, String filePath,
			String loginId, String productId) {
		try {
			if (session != null) {
				session.remove("pdfFilePath");
			}
			// boolean isSchedule=("WL".equalsIgnoreCase(choice) ||
			// "WOL".equalsIgnoreCase(choice))?true:false;
			boolean isSchedule = ("schedule".equalsIgnoreCase(type)) ? true
					: false;
			//final Logger jasperLogger = Logger
					//.getLogger("net.sf.jasperreports");
			//jasperLogger.setLevel(Level.ERROR);
			HashMap<String, Object> jasperParameter = new HashMap<String, Object>();
			String jasperFileName = "";
			if (isSchedule) {
				// String imageStatus=("WL".equalsIgnoreCase(choice))?"Y":"N";
				if ("3".equals(productId)) {
					jasperFileName = "BulkCertificate.jasper";
				} else {
					jasperFileName = "BulkCertificate.jasper";
				}
				
				
				jasperParameter.put("PvbranchCode", branchCode);
				jasperParameter.put("PvimagePath", imageURL);
				jasperParameter.put("Pvstartdate", startDate);
				jasperParameter.put("Pvusertype", userType);
				jasperParameter.put("PvopencoverNo", openCoverNo1);
				jasperParameter.put("Pvenddate", endDate);
				jasperParameter.put("PvLogin", loginId);
				jasperParameter.put("PvproductId", productId);
				jasperParameter.put("PvappNo", issuer);
				
			} else {
				if ("debit".equalsIgnoreCase(type)) {
					jasperFileName = "BulkDebitNote.jasper";
				} else {
					jasperFileName = "BulkDebitNote.jasper";
				}
				jasperParameter.put("PvType", "debit".equalsIgnoreCase(type)?"DR":"CR");
				jasperParameter.put("PvbranchCode", branchCode);
				jasperParameter.put("PvimagePath", imageURL);
				jasperParameter.put("Pvstartdate", startDate);
				jasperParameter.put("Pvusertype", userType);
				jasperParameter.put("PvopencoverNo", openCoverNo1);
				jasperParameter.put("Pvenddate", endDate);
				jasperParameter.put("PvLogin", loginId);
				jasperParameter.put("PvproductId", productId);
				jasperParameter.put("PvappNo", issuer);

			}
			String jasperPath = "";
			jasperPath = marineJasperPath + jasperFileName;
			logger.info("jasper Param" + jasperParameter);
			JasperPrint jasperPrint = fillReport(jasperPath, jasperParameter);
			JasperExportManager.exportReportToPdfFile(jasperPrint, filePath);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}

	public void endtReport(String proposalNo, String filePath) {
		
		try {
			if (session != null) {
				session.remove("pdfFilePath");
			}
			
			HashMap<String, Object> jasperParameter = new HashMap<String, Object>();

			jasperParameter.put("proposalNo", proposalNo);
			jasperParameter.put("imagePath", imageURL);
			jasperParameter.put("ImageStatus", "Y");
			String jasperPath = "";
			jasperPath = marineJasperPath
					+ "/CargoOpenCoverEndtSchedule.jasper";

			JasperPrint jasperPrint = fillReport(jasperPath, jasperParameter);
			JasperExportManager.exportReportToPdfFile(jasperPrint, filePath);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	public void integrationReport(Object[] arg, String downloadType, OutputStream os) {

		try {
			
			String jasperPath = marineJasperPath + "/ImportExportReport.jasper";
			// JasperReport jasperReport;
			JasperPrint jasperPrint;
			HashMap<String, Object> jasperParameter = new HashMap<String, Object>();

			jasperParameter.put("pvStatrtDate", arg[0]);
			jasperParameter.put("pvEndDate", arg[1]);
			jasperParameter.put("pvType", arg[2]);
			jasperParameter.put("pvBranchCode", arg[3]);
			System.out.println(jasperParameter);

			jasperPrint = fillReport(jasperPath, jasperParameter);
			exporter(downloadType, jasperPrint, os);
		} catch (Exception e) {
			logger.debug(e);
			e.printStackTrace();
		}

		logger.info("Filling report finished.........");
	}

	public void motorPaymentReport(String startDate, String endDate,
			String downloadType, ByteArrayOutputStream bos) {
		// TODO Auto-generated method stub
		try {
			
			String jasperPath = marineJasperPath + "/MarinePaymentReport.jasper";
			HashMap<String, Object> jasperParameter = new HashMap<String, Object>();

			jasperParameter.put("startDate", startDate);
			jasperParameter.put("endDate", endDate);

			JasperPrint jasperPrint = fillReport(jasperPath, jasperParameter);
			exporter(downloadType, jasperPrint, bos);

		} catch (Exception e) {
			logger.debug(e);
			e.printStackTrace();
		}

		logger.info("Filling report finished.........");
	}

	public void motorProductionReport(String startDate, String endDate,
			String downloadType, ByteArrayOutputStream bos) {
		// TODO Auto-generated method stub
		try {
			
			String jasperPath = marineJasperPath + "/MarineProductionReport.jasper";
			HashMap<String, Object> jasperParameter = new HashMap<String, Object>();

			jasperParameter.put("startDate", startDate);
			jasperParameter.put("endDate", endDate);

			JasperPrint jasperPrint = fillReport(jasperPath, jasperParameter);
			exporter(downloadType, jasperPrint, bos);

		} catch (Exception e) {
			logger.debug(e);
			e.printStackTrace();
		}

		logger.info("Filling report finished.........");
	}
	private   void doMerge(List<InputStream> list, OutputStream outputStream)
	throws DocumentException, IOException {
		Document document = new Document();
		PdfWriter writer = PdfWriter.getInstance(document, outputStream);
		document.open();
		PdfContentByte cb = writer.getDirectContent();

		for ( InputStream in : list) {
		 	PdfReader reader = new PdfReader(in);
			for (int i = 1; i <= reader.getNumberOfPages(); i++) {
				document.newPage();
				PdfImportedPage page = writer.getImportedPage(reader, i);
				cb.addTemplate(page, 0, 0);
			}
		}

		outputStream.flush();
		document.close();
		outputStream.close();
	}

	public void DeclarationWalaa(String policyNo, String filePath) {
		try {
			
			HashMap<String, Object> jasperParameter = new HashMap<String, Object>();
			jasperParameter.put("Pvpolicy", policyNo);
			jasperParameter.put("imagePath", imageURL);

			String jasperPath = marineJasperPath + "/WalaaDeclaration.jasper";

			JasperPrint jasperPrint = fillReport(jasperPath, jasperParameter);
			JasperExportManager.exportReportToPdfFile(jasperPrint, filePath);
			
		} catch (Exception e) {
			logger.debug(e);
			e.printStackTrace();
		}
		
	}
}
