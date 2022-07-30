package com.maan.report.jasper;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;

import org.apache.logging.log4j.Logger;

import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.export.JRHtmlExporter;
import net.sf.jasperreports.engine.export.JRHtmlExporterParameter;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.export.JRXlsAbstractExporterParameter;
import net.sf.jasperreports.engine.export.JRXlsExporter;
import net.sf.jasperreports.engine.export.JRXlsExporterParameter;

import com.maan.DBCon.DBConnection;
import com.maan.adminnew.common.CommonService;
import com.maan.common.LogUtil;
import com.maan.common.ResourceLocator;
import com.maan.quotation.QuotationAction;

public abstract class JasperReport  {
	final Logger logger = LogUtil.getLogger(JasperReport.class);
	private static final String applicationPath = CommonService.getApplicationPath();
	private final String source=ResourceLocator.getInstance().getSource().equals("ORACLE")?"":"mssql/"; 
	private final String jasperBasePath = applicationPath + "/Jasper/";
	protected final String motorJasperPath = jasperBasePath + "/motor/"+source;
	protected final String travelJasperPath = jasperBasePath + "/travel/"+source;
	protected final String marineJasperPath = jasperBasePath + "/marine/"+source;
	protected static final String imageURL = applicationPath + "/images/"; 
	protected Map<String, Object> session;
	public JasperReport(Map<String, Object> session){
		 this.session=session;		 
	}
	
	 /****** Common Document Writing *******/
	 protected JasperPrint fillReport(String jasperPath, Map<String,Object> jasperParameter) throws Exception {
		 compileReportToFile(jasperPath);
		 Connection connection=DBConnection.getInstance().getDBConnection();
		 logger.info("Filling report started.........");
		 JasperPrint jasperPrint = JasperFillManager.fillReport(jasperPath,jasperParameter, connection);
		 logger.info("Filling report ended.........");
		 return jasperPrint;
	 }
	 protected JasperPrint fillReport(String jasperPath, List<String> subJasperPath, Map<String,Object> jasperParameter) throws Exception {
		 compileReportToFile(jasperPath);
		 for(int i=0 ; i< subJasperPath.size() ; i++) {
			 compileReportToFile(subJasperPath.get(i));
		 }
		 Connection connection=DBConnection.getInstance().getDBConnection();
		 logger.info("Filling report started.........");
		 JasperPrint jasperPrint = JasperFillManager.fillReport(jasperPath,jasperParameter, connection);
		 logger.info("Filling report ended.........");
		 return jasperPrint;
	 }
	 protected void compileReportToFile(String jasperPath) throws Exception {
		 File jasperFile = new File(jasperPath);
		 if(!jasperFile.exists()){
			 String path=jasperFile.getAbsolutePath().replace(".jasper", ".jrxml");
			 String temp = JasperCompileManager.compileReportToFile(path);
			 logger.info("Compiled File "+temp);
		 }
	 }
	 protected void exporter(String downloadType, JasperPrint jasperPrint, OutputStream os) throws Exception {
		 if("excel".equals(downloadType))
		 {
			 JRXlsExporter exporter = new JRXlsExporter();
			 exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
			 exporter.setParameter(JRExporterParameter.OUTPUT_STREAM,os);
			 exporter.setParameter(JRXlsAbstractExporterParameter.IS_COLLAPSE_ROW_SPAN, Boolean.TRUE);
			 exporter.setParameter(JRXlsAbstractExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_COLUMNS, Boolean.TRUE);
			 exporter.setParameter(JRXlsAbstractExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS, Boolean.TRUE);
			 exporter.setParameter(JRXlsAbstractExporterParameter.IS_ONE_PAGE_PER_SHEET, Boolean.FALSE);
			 exporter.setParameter(JRXlsAbstractExporterParameter.IS_DETECT_CELL_TYPE, Boolean.TRUE);
			 exporter.setParameter(JRXlsAbstractExporterParameter.IS_WHITE_PAGE_BACKGROUND, Boolean.FALSE);
			 //exporter.setParameter(JRXlsAbstractExporterParameter.IS_IGNORE_GRAPHICS, Boolean.TRUE);
			 //exporter.setParameter(JRXlsAbstractExporterParameter.IS_IGNORE_GRAPHICS, Boolean.TRUE);
			 exporter.exportReport();
		 }			
		 else if("pdf".equals(downloadType))
		 {
			 JRPdfExporter exporter = new JRPdfExporter();
			 exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);					
			 exporter.setParameter(JRExporterParameter.OUTPUT_STREAM,os);							
			 exporter.exportReport();				
		 }			
		 else
		 {

			 JRHtmlExporter exporter = new JRHtmlExporter();
			 exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
			 exporter.setParameter(JRExporterParameter.OUTPUT_STREAM,os);	

			 exporter.setParameter(JRHtmlExporterParameter.IS_WHITE_PAGE_BACKGROUND, false);
			 exporter.setParameter(JRHtmlExporterParameter.IGNORE_PAGE_MARGINS, true);
			 exporter.setParameter(JRHtmlExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS, true);
			 exporter.setParameter(JRHtmlExporterParameter.ZOOM_RATIO, 1.3F);
			 exporter.setParameter(JRHtmlExporterParameter.BETWEEN_PAGES_HTML, "");
			 exporter.setParameter(JRHtmlExporterParameter.FRAMES_AS_NESTED_TABLES,true);	
			 exporter.exportReport();			
		 }
	 }
	 protected void StreamToFile(String filePath, ByteArrayOutputStream baos) throws IOException {
		 FileOutputStream fos = null;
		 try {
			 fos = new FileOutputStream (filePath);
			 baos.writeTo(fos);
		 } catch(IOException ioe) {
			 // Handle exception here
			 ioe.printStackTrace();
		 } finally {
			 fos.close();
		 }
	 }
	 protected InputStream generateReport(String filePath1, Map<String, Object> jasperParameter,String jasperPath,String type,String format){
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			InputStream is=null;
			try{
				//final Logger jasperLogger = Logger.getLogger("net.sf.jasperreports");	
				//jasperLogger.setLevel(Level.ERROR);
				JasperPrint jasperPrint=null;

				jasperPrint = fillReport(jasperPath,jasperParameter);

				if("pdf".equalsIgnoreCase(type)){
					if("file".equalsIgnoreCase(format)){
						JasperExportManager.exportReportToPdfFile(jasperPrint,filePath1);
					}else{
						JasperExportManager.exportReportToPdfStream(jasperPrint, baos);
						is= new ByteArrayInputStream(baos.toByteArray()); 
					}
				}else{
					JRXlsExporter exporterXLS = new JRXlsExporter();
					exporterXLS.setParameter(JRXlsExporterParameter.JASPER_PRINT, jasperPrint);
					if("file".equalsIgnoreCase(format)){
						exporterXLS.setParameter(JRXlsExporterParameter.OUTPUT_FILE_NAME  , filePath1);
					}else{
						exporterXLS.setParameter(JRXlsExporterParameter.OUTPUT_STREAM  , baos);	
					}
					exporterXLS.setParameter(JRXlsExporterParameter.IS_ONE_PAGE_PER_SHEET, Boolean.FALSE);
					exporterXLS.setParameter(JRXlsExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_COLUMNS, Boolean.TRUE);
					exporterXLS.setParameter(JRXlsExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS, Boolean.TRUE);
					exporterXLS.setParameter(JRXlsExporterParameter.IS_DETECT_CELL_TYPE, Boolean.TRUE);
					exporterXLS.setParameter(JRXlsExporterParameter.IS_WHITE_PAGE_BACKGROUND, Boolean.FALSE);
					exporterXLS.exportReport();
					if(!"file".equalsIgnoreCase(format))
						is= new ByteArrayInputStream(baos.toByteArray());
				}
			} catch (Exception e1) {
				e1.printStackTrace();
			} 
			return is;
		}
	 public abstract void scheduleReport(String quoteNo,String productId, String branchCode, String filePath,String displayText);
	 public void debitReport(String quoteNo, String branchCode, String filePath,String displayText){}
	 public void creditReport(String quoteNo, String branchCode, String filePath,String displayText){}
	 public abstract void otherSchedule(String type,Object[] param);
	 public abstract OutputStream scheduleWithStream(String type,Object[] param);
	 public abstract OutputStream scheduleWithStream(Map<String, Object> reportJasperParameters);
}
