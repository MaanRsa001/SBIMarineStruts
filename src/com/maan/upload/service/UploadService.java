package com.maan.upload.service;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.Logger;

import com.maan.adminnew.common.CommonService;
import com.maan.common.LogUtil;
import com.maan.common.UploadMasterMovement;
import com.maan.common.dao.CommonDAO;
import com.maan.common.exception.BaseException;
import com.maan.upload.UploadAction;
import com.maan.upload.dao.UploadDAO;


public class UploadService  {

	final static Logger logger = LogUtil.getLogger(UploadService.class);
	private String loginId="";
	private String brokerCode = "";
	private String tranId = "";
	private String openCoverNo = "";
	private FileItem item ;
	private String transactionDesc="";
	UploadDAO upload=new UploadDAO();
	public String getTransactionDesc() {
		return transactionDesc;
	}
	public void setTransactionDesc(String transactionDesc) {
		this.transactionDesc = transactionDesc;
	}
	public FileItem getItem() {
		return item;
	}
	public void setItem(FileItem item) {
		this.item = item;
	}
	public String getOpenCoverNo() {
		return openCoverNo;
	}
	public void setOpenCoverNo(String openCoverNo) {
		this.openCoverNo = openCoverNo;
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public String getBrokerCode() {
		return brokerCode;
	}
	public void setBrokerCode(String brokerCode) {
		this.brokerCode = brokerCode;
	}
	public String getTranId() {
		return tranId;
	}
	public void setTranId(String tranId) {
		this.tranId = tranId;
	}
	
	public Map insertRecords(String typeId, File file, String movementDetailId,String campaignId, String partnerId, String transId) throws BaseException
	{
	logger.info("insertRecords - Enter || typeId: "+typeId);
	String error="";
	Map resultMap=null;
	try
	{ 
		resultMap=getRecordsList(file, upload.getDBColumns(movementDetailId), typeId);
		error=(String)resultMap.get("ERROR");
		if("".equalsIgnoreCase(error))
		{ 
		  	List typeInfo=  new CommonDAO().getTypeInfo(typeId,campaignId,partnerId);
			Map result =upload.insertRawData(typeId, (String)((Map)typeInfo.get(0)).get("DESTINATION_TABLE"), (String)resultMap.get("FIELDS"), (List)resultMap.get("RECORDS"), movementDetailId,(String)resultMap.get("TRANSACTION_INDEX"),transId,(String)resultMap.get("SNO_INDEX"),(String)resultMap.get("HEADERS"),(String)resultMap.get("FINAL_HEADERS"));
		
			resultMap.put("ERROR", result.get("error").toString());
			resultMap.put("TRANID",  result.get("tranid").toString());
		}
	}catch(Exception e) { e.printStackTrace(); }
	logger.info("insertRecords - Exit || Error: "+error);
	return resultMap;	
}
public void  moveMasterRecords(String movementDetailId,String tranId,String brokerCode,String loginId,String issuer, String openCoverNo,Map<Object,String> info) throws BaseException
{
	logger.info("moveMasterRecords - Enter || movementDetailId: "+movementDetailId);
	String error="";
	
	try
	{   UploadMasterMovement move = new UploadMasterMovement();
		move.moveMasterRecords(movementDetailId,tranId,brokerCode,loginId,issuer,openCoverNo,info);
		//resultMap.put("UPLOAD_RESULT", upload.moveRecordsToMaster(tranId, typeId));
	
	}catch(Exception e) { e.printStackTrace(); }
	logger.info("moveMasterRecords - Exit || movementDetailId: "+error);
	//return resultMap;	
}

public void  removeTempRecords(String movementDetailId,String tranId) throws BaseException
{
	logger.info("removeTempRecords - Enter || movementDetailId: "+movementDetailId);
	String error="";
	
	try
	{   UploadMasterMovement move = new UploadMasterMovement();
		move.removeTempRecords(movementDetailId,tranId);
		
	}catch(Exception e) { e.printStackTrace(); }
	logger.info("removeTempRecords - Exit || movementDetailId: "+error);
	//return resultMap;	
}
public void archiveRecords(String movementDetailId, String tranId,String user) throws BaseException
{
	logger.info("archiveRecords - Enter || tranId: "+tranId);
	String error="";
	
	try
	{
		upload.archiveRawData(movementDetailId,tranId,user);
	
	}catch(Exception e) { e.printStackTrace(); }
	logger.info("archiveRecords - Exit || Error: "+error);
		
}
public static Map getRecordsList(File inputFile, List dbColumns, String typeId)
{
	List recordsList=new ArrayList();
	String record="", result="", unmatched="";
	long totalLinesProcessed = 0l;
	String[] excelHeaders=null;
	Map resultMap=null;
	boolean cont = true;
	BufferedReader in=null;
	int headerLength = 0;
	try
	{
		in = new BufferedReader(new FileReader(inputFile));
		while ((record = in.readLine()) != null && cont) 
		{
			logger.info("status----->" + record);
			totalLinesProcessed++;
			if (totalLinesProcessed == 1) 
			{
				record=record.toUpperCase().replaceAll("\t", "~");
				record=record.toUpperCase().replaceAll("[^A-Z0-9_~]", "");
				//record=record.toUpperCase();
				excelHeaders = record.split("~");
				excelHeaders = removeDupColumns(excelHeaders, dbColumns);
				resultMap = matchColumns(excelHeaders, dbColumns);
				/*if(!resultMap.isEmpty())
				{
					unmatched=(String)resultMap.get("UNMATCHED");
					if(unmatched!=null && unmatched.length()>0)
					{
						result+="Unknown Columns Found ["+unmatched+"]";
						cont=false;
						break;
					}
				}*/
				headerLength = excelHeaders.length;
			}
			record = record.replaceAll("\'", "");
			record = record.replaceAll("\"", "");
			record = record.replaceAll("\t", "~");
			//String[] valuestemp = record.split("~");
			String[] valuestemp;
			
			String Delimiter = record + "~S";
		    String[] getValues = Delimiter.split("~");
		    
		    valuestemp = new String[getValues.length-1];
		    for( int i =0; i<getValues.length-1; i++)
		    {
		    	valuestemp[i] = getValues [i].trim();
		         //values[i] = getValues [i];
		    }
			  
			if(valuestemp.length==0){
				record ="";
			}
			else{
				record = "";
				for(int i =0;i<headerLength;i++)
			    {
			    	record = record+valuestemp[i]+((i==(headerLength-1))?"":"~");
			    	System.out.println(i);
			    }
			}
			
			if((record.trim()).length()==0)
			break;
			
			record = record.replaceAll("~", "'~'");
			if (totalLinesProcessed != 1) 
			{
				
				record=formatValues((String[][])resultMap.get("COLUMN_INFO"), record);
				if(!record.trim().equalsIgnoreCase("")){
				System.out.println("RECORDS::::>>"+record);
				recordsList.add(record);
				}
			}
		}
	}catch(Exception e){e.printStackTrace();}
	finally
	{
		try {
			in.close();
		} catch (IOException e) 
		{
			e.printStackTrace();
		}
	}
	resultMap.put("ERROR", result);
	resultMap.put("RECORDS", recordsList);
	return resultMap;
}

public static String formatValues(String[][] columnInfoList, String record)
{
	String[] values;
	
	String Delimiter = record + "~S";
    String[] getValues = Delimiter.split("~");
    
    values = new String[getValues.length-1];
    for( int i =0; i<getValues.length-1; i++)
    {
         values[i] = getValues [i].trim();
         //values[i] = getValues [i];
    }
	
	String mandatoryYN="",dataType="",columnName="", value="", error="", finalValues="";
	
		if(columnInfoList!=null)
		{
			for(int i=0; i<values.length; i++)
			{
				value=(String)values[i].replaceAll("'", "");
				if(i!=values.length-1)
				finalValues+=value+"','";	
				else
				finalValues+=value+"'";	
			}
			
			finalValues+=error;
		}
	
	return finalValues;	
}

public static Map matchColumns(String[] excelColumns, List dbColumns) 
{
	logger.info("matchColumns() - Enter");
	String[][] columnInfoList = new String[dbColumns.size()][5];
	String matchedColumns = "",finalHeaders="",headers="", unmatchedHeaders="", excelHeader="", matchedHeaders="", mobileNoColumns="", fieldName="";
	HashMap columns = new HashMap();
	Map columnInfo=null;
	int k=0;
	String transactionIndex="0";
	String referenceIndex="0";
	try 
	{
		for (int i = 0; i < excelColumns.length; i++) 
		{
			int flag = 0;
			for (int j = 0; j < dbColumns.size(); j++) 
			{
				columnInfo=(Map)dbColumns.get(j);
				excelHeader=(String)columnInfo.get("SOURCE_FIELD");
				excelHeader=excelHeader.toUpperCase().replaceAll("[^A-Z0-9_~]", "");
				if (((excelColumns[i].trim()).equalsIgnoreCase(excelHeader)))
				{
					flag = 1;
					fieldName=(String)columnInfo.get("DEST_FIELD");
					if(fieldName.equalsIgnoreCase("TRANSACTION_ID")){
						transactionIndex = i+"";
					}
					if(fieldName.equalsIgnoreCase("SNO")){
						referenceIndex = i+"";
					}
					matchedColumns+=fieldName+",";
					matchedHeaders+=excelHeader+",";
					columnInfoList[k][0]=fieldName;
					columnInfoList[k][1]=excelHeader;
					finalHeaders+=((String)excelColumns[i]).toUpperCase().replaceAll("[^A-Z0-9_~]", "")+",";
					k++;
					break;
				}
			}
			if (flag == 0) 
			{
				unmatchedHeaders+=(String)excelColumns[i]+", ";
			}
			headers+= ((String)excelColumns[i]).toUpperCase().replaceAll("[^A-Z0-9_~]", "")+((excelColumns.length-1==i)?"":", ");
		}
		if(unmatchedHeaders.length()>1)
			unmatchedHeaders=unmatchedHeaders.substring(0, unmatchedHeaders.length()-2);
		if(matchedHeaders.length()>0)
			matchedHeaders=matchedHeaders.substring(0, matchedHeaders.length()-1);
		if(matchedColumns.length()>0)
			matchedColumns=matchedColumns.substring(0, matchedColumns.length()-1);
			
		columns.put("MATCHED",matchedHeaders);
		columns.put("UNMATCHED", unmatchedHeaders);
		columns.put("FIELDS", matchedColumns);
		columns.put("COLUMN_INFO",columnInfoList);
		columns.put("TRANSACTION_INDEX",transactionIndex );
		columns.put("SNO_INDEX",referenceIndex );
		columns.put("HEADERS", headers);
		columns.put("FINAL_HEADERS",finalHeaders );
	} catch (Exception e) 
	{
		e.printStackTrace();
	}
	logger.info("matchColumns() - Exit || UnMatched: "+unmatchedHeaders);
	return columns;
}
public static String[] removeDupColumns(String columns[], List dbColumns) 
{
	int count=0, index=0;
	String temp="";
	String[] modifiedColumns=(String[])columns.clone();
	Map columnInfo=getListAsMap(dbColumns, "EXCEL_HEADER_NAME", "HEADER_TYPE");
	for (int i = 0; i < columns.length; i++) 
	{
		count=0;
		for (int j = i; j < modifiedColumns.length; j++) 
		{
			if(columns[i].equals(modifiedColumns[j]))
			{
				count++;
				if("R".equals(columnInfo.get(modifiedColumns[j]+count)))
				{
					if(count==1)
					{
						index=j;
						temp=columns[j];
					}else
					{
						if(count==2)
							modifiedColumns[index]=temp+(count-1);
						modifiedColumns[j]=columns[j]+count;
					}
				}
			}
		}
	}
	return modifiedColumns;
}

public static Map getListAsMap(List dbColumns, String key, String value)
{
	Map map=new LinkedHashMap();
	Map temp=new LinkedHashMap();
	
	if(!dbColumns.isEmpty())
	{
		for (int i = 0; i < dbColumns.size(); i++) 
		{
			temp=(Map)dbColumns.get(i);
			map.put(temp.get(key), temp.get(value));
		}
	}
	return map;
}

public String getTransactionId(String loginId, String fileName, String folderPath,  String movementDetailId, String tranId,String openCoverNo, String transactionDesc, String issuer)
{
	return new CommonDAO().insertTransactionDetails(loginId, fileName, folderPath, movementDetailId,tranId,openCoverNo,transactionDesc,issuer);
}
public List getMovements(String product, String partner, String campaign) {
	
	return new CommonDAO().getMovements(product,partner,campaign);

}

public List getExcelMovement(String product, String partner, String campaign) {
	
	return new CommonDAO().getExcelMovement(product,partner,campaign);

}
public void updateOpenCoverDetail(String brokerCode, String openCoverNo,
		String tranId) {
	upload.updateOpenCoverDetail(brokerCode,openCoverNo,tranId);
	
}
public void generateQuotations(String tranId) {
	
	upload.generateQuotations(tranId);
}

public void getResult(String tranId, String movementDetailId) {
	
	
	 upload.getResult(tranId,movementDetailId);
}
public List getResult2(String tranId, String movementDetailId) {
	
	
	return upload.getResult2(tranId,movementDetailId);
}
public List<Object> getErrorList(String sno, String tranId) {
	return upload.getErrorList(sno, tranId);
}
public List<Object> getUploadedList(String tranId) {
	
	return upload.getUploadedList(tranId);
}
public String getBrokerId(String  loginId) {
	
	
	return upload.getBrokerId(loginId);
}
public String getcustomerId(String openCoverNo) {
	
	return upload.getcustomerId(openCoverNo);
}
public List getTransactions(String openCoverNo, String issuerId) {
	
	return upload.getTransactions(openCoverNo,issuerId);
}
public String getTransDesc(String transId) {
	
	return upload.getTransDesc(transId);
}
public List getDBColumns(String movementDetailId){
	return upload.getDBColumns(movementDetailId);
}
public List<Object> getCommodityList(String openCover) {
	return upload.getCommodityList(openCover);
}
public void reuploadSave(final UploadAction up, String bcode) {
	upload.reuploadSave(up, bcode);
}
public String getWarYNOC(String openCoverNo) {
	return upload.getWarYNOC(openCoverNo);
}

private static final String DOCUMENT_FILE_PATH = CommonService.getApplicationPath() + "documents/";

public List<String> insertDocumentDetails(List<String> documentIdList, List<String> docDescription, List<String> uploadFileName, List<File> uploadFile, String quoteNo, String vehicleId, String productId, String uploadFileStr, String deviceType,String uploadType) throws IOException {
	List<String> errorList = new ArrayList<String>();
	int j=0;
	for(int i=0 ; i< documentIdList.size() ; i++) {
		if(documentIdList.get(i) != null && StringUtils.isNotBlank(documentIdList.get(i)) && uploadFileName.get(j) != null && StringUtils.isNotBlank(uploadFileName.get(j))){
			if((uploadFile.get(j).length()/1024)>2048) {
				errorList.add(" File Size Must Be Less Then 2MB at row "+ (i+1));
			} else {
				SimpleDateFormat sdf = new SimpleDateFormat("'on'ddMMMyyyy_h-mm-ss-SSSSSS_a");
				Calendar cal = Calendar.getInstance();
				String date = sdf.format(cal.getTime());
				String documentPath = DOCUMENT_FILE_PATH + quoteNo + "_"+vehicleId+"_" + j + "_" + documentIdList.get(i) + date + "." +FilenameUtils.getExtension(uploadFileName.get(j));
				//System.out.println(bean.getUpload().get(j).length());
				FileUtils.copyFile(uploadFile.get(j), new File(documentPath));
				uploadType=upload.getUploadType(documentIdList.get(i));
				upload.insertDocumentDetails(quoteNo,documentIdList.get(i),documentPath, docDescription.get(i),uploadFileName.get(j),productId,vehicleId,uploadType,Integer.toString(i));
				j++;
			}
		}
	}
	return errorList;
}
public void deleteDocument(String filePath) throws Exception {
	FileUtils.deleteQuietly(new File(filePath));
	upload.deleteDocument(filePath);
}
public List<Map<String, Object>> getUploadDocList(String productId,String quoteNo, String vehicleId) {	 
	return upload.getUploadDocList(productId, quoteNo, vehicleId);
}

public String getTranactionId()
{
	return upload.getTransactionId();
}

public void insertTransaction(String tranId, String fileName, String typeId){
	upload.insertTransaction(tranId, fileName, typeId);
}

public List<Object>  getTypeList() {
    return upload.getTypeList();
}
/*public void renewalTime(String tranId, String status) {
	upload.renewalTime(tranId,status);
	
}*/
public int updateMovement(String status, String tranId, String error) {
	return upload.updateMovement(status, tranId, error);
}
public Map insertRecords( File file, String tranId,String fileName,String filePath,String fileType,String typeId, String mfrType) throws BaseException
{
	logger.info("insertRecords - Enter");
	String error="";
	Map resultMap=null;
	try
	{
		resultMap=getexRecordsList(file, upload.getDBColumnHeader(typeId), "");
		error=(String)resultMap.get("ERROR");
		if(StringUtils.isEmpty(error))
		{
			List typeInfo=upload.getTypeInfo(typeId);
			if(typeInfo!=null && typeInfo.size()>0) {
			//error=upload.insertRawData(typeId, (String)((Map)typeInfo.get(0)).get("RAW_TABLE_NAME"), (String)resultMap.get("FIELDS"), (List)resultMap.get("RECORDS"), tranId, tpaCode, cityId, purposeId,callListId,purposeDesc);
			resultMap.put("RAW", ((Map)typeInfo.get(0)).get("RAW_TABLE_NAME").toString());
			resultMap.put("MASTER", ((Map)typeInfo.get(0)).get("TABLE_NAME").toString());
			error=upload.insertRawData((String)resultMap.get("FIELDS"), (List)resultMap.get("RECORDS"), tranId, fileName, filePath, fileType,((Map)typeInfo.get(0)).get("RAW_TABLE_NAME").toString(),typeId, mfrType);
			if(error.equals(""))
			{	
				 resultMap.put("UPLOAD_RESULT", upload.moveToMaster(tranId,typeId));
			}
			else
				resultMap.put("ERROR", error);
		} else
			resultMap.put("ERROR", "TypeInfo Not found");
		}
	}catch(Exception e) 
	{ 
		e.printStackTrace(); 
		resultMap.put("ERROR", e.toString());
	}
	logger.info("insertRecords - Exit || Error: "+error);
	return resultMap;	
}
public List<Map<String,Object>>getTransactionDetails(String tran_id) {
	return upload.TransactionDetails(tran_id);
	
}
public List<Map<String, Object>> getTransactionList(String tran_id) {
	return upload.getTransactionList(tran_id);
}
public List<Map<String, Object>> getUploadList(String tranId,String typeId) {
	return upload.getUploadList(tranId,typeId);
}
public List<Map<String, Object>> getDupList(String tranId, String typeId) {
	return upload.getDupList(tranId,typeId);
}
public static Map getexRecordsList(File inputFile, List dbColumns, String typeId)
{
	List recordsList=new ArrayList();
	String record="", result="", unmatched="";
	long totalLinesProcessed = 0l;
	String[] excelHeaders=null;
	Map resultMap=null;
	boolean cont = true;
	BufferedReader in=null;
	try
	{
		//in = new BufferedReader(new FileReader(inputFile));
		Reader reader = new InputStreamReader(new FileInputStream(inputFile), "UTF-8");
        in = new BufferedReader(reader);
		while ((record = in.readLine()) != null && cont) 
		{
			totalLinesProcessed++;
			if (totalLinesProcessed == 1) 
			{
				record=record.replaceAll("[^A-Za-z0-9_\t*]", "");
				excelHeaders = record.split("\t");
				excelHeaders = exremoveDupColumns(excelHeaders, dbColumns);
				resultMap = exmatchColumns(excelHeaders, dbColumns);
				if(!resultMap.isEmpty())
				{
					 
					unmatched=(String)resultMap.get("UNMATCHED");
					if(unmatched!=null && unmatched.length()>0)
					{
						result+="Unknown Columns Found ["+unmatched+"]";
						cont=false;
 					}
					unmatched=(String)resultMap.get("Missed_Columns");
					if(unmatched!=null && unmatched.length()>0)
					{
						result+=" Missed Columns Found ["+unmatched+"]";
						cont=false;
 
					}
					if(!cont) break;
					
				}
			}
			 
			record = record.replaceAll("\'", "");
			record = record.replaceAll("\"", "");
			record = record.replaceAll("[*]", "");
			record = record.replaceAll("NULL", "");
			record = record.replaceAll("null", "");
			record = record.replaceAll("`", "");
			if((record.trim()).length()==0)
			break;
			record = record.replaceAll("\t", "'\t'");
			if (totalLinesProcessed != 1) 
			{
				record=exformatValues((String[][])resultMap.get("COLUMN_INFO"), record);
				recordsList.add(record);
			}
		}
	}catch(Exception e)
		{
			e.printStackTrace();
			result=e.toString();
		}
	finally
	{
		try {
			in.close();
		} catch (IOException e) 
		{
			e.printStackTrace();
			result=e.toString();
		}
	}
	resultMap.put("ERROR", result);
	resultMap.put("RECORDS", recordsList);
	return resultMap;
}
public static String exformatValues(String[][] columnInfoList, String record)
{ 
	String[] values=record.split("~");	 
	String mobileNoYN="",mandatoryYN="",dataType="",columnName="", value="", error="", finalValues="",isFormula="";
	boolean mobileNoFlag=false;
	
	if(columnInfoList!=null)
	{
		for(int i=0; i<values.length; i++)
		{
			dataType=(String)columnInfoList[i][1];
			columnName=(String)columnInfoList[i][2];
			isFormula=(String)columnInfoList[i][3];
			mandatoryYN=(String)columnInfoList[i][4];
			value=(String)values[i].replaceAll("'", "").trim();
			/*if("NVARCHAR".equalsIgnoreCase(dataType) && !(value.isEmpty() || value==null)){
				value= "N"+value;
			}*/
			if("DECIMALS".equalsIgnoreCase(dataType)){
				if(!(value.isEmpty() || value==null)){
					value=value.replaceAll(",", "");
				}
			}
			if("int".equalsIgnoreCase(dataType)){
				value = String.valueOf(Math.round(Double.parseDouble(StringUtils.isBlank(value)?"0":value)));
						
			}
		/*	if("DATE".equalsIgnoreCase(dataType)){
					if(!(value.isEmpty() || value==null)){
						value=value.substring(0,value.indexOf(" "));
					}
				}*/
			if("DATE".equalsIgnoreCase(dataType)){ 
				if(!(value.isEmpty() || value==null)){
				if(StringUtils.isEmpty(finalValues))
					finalValues=finalValues+"to_date('"+value+"','dd-mm-yyyy'),'";
				else
				finalValues=finalValues.substring(0, finalValues.length()-1)+ "to_date('"+value+"','dd-mm-yyyy'),'";
				}
				else 
					value=value.substring(0,value.indexOf(" "));
			}
			else {
				if("NVARCHAR".equalsIgnoreCase(dataType)){
					finalValues+="N'"+StringUtils.trim(value)+"',";
					}else{
					if(!"int".equalsIgnoreCase(dataType)){
						finalValues+="'"+StringUtils.trim(value)+"',";
					}
					else{
						finalValues+=StringUtils.trim(value)+",";
					}
					}
			
			}
			if("Y".equalsIgnoreCase(mandatoryYN) && "".equals(value))
				error+="~"+columnName+" Not available";
		}
	}
	//finalValues=finalValues.substring(0,finalValues.length()-2);
	//finalValues=finalValues+error+"'";
	return finalValues.substring(0, finalValues.length()-1);
}
public static Map exmatchColumns(String[] excelColumns, List dbColumns) 
{
	logger.info("matchColumns() - Enter");
	String[][] columnInfoList = new String[dbColumns.size()][5];
	String matchedColumns = "", unmatchedHeaders="", excelHeader="", matchedHeaders="", mobileNoColumns="", fieldName="",misMatched="";
	HashMap columns = new HashMap();
	Map columnInfo=null;
	int k=0;
	try 
	{
		for (int i = 0; i < excelColumns.length; i++) 
		{
			int flag = 0; 
			for (int j = 0; j < dbColumns.size(); j++) 
			{
				columnInfo=(Map)dbColumns.get(j);
				excelHeader=(String)columnInfo.get("EXCEL_HEADER_NAME");
				if (((excelColumns[i].trim()).equalsIgnoreCase(excelHeader.trim())))
				{
					flag = 1;
					fieldName=(String)columnInfo.get("DATABASE_FIELD_NAME");
					matchedColumns+=fieldName+",";
					matchedHeaders+=excelHeader+",";
					columnInfoList[k][0]=fieldName;
					columnInfoList[k][1]=(String)columnInfo.get("DATATYPE")==null?"":columnInfo.get("DATATYPE").toString();
					columnInfoList[k][2]=excelHeader;
					columnInfoList[k][3]=(String)columnInfo.get("REMARKS")==null?"":columnInfo.get("REMARKS").toString(); 
					columnInfoList[k][4]=(String)columnInfo.get("MANDATORY_YN");
					k++;
					break;
				} 
			}
			if (flag == 0) 
			{
				unmatchedHeaders+=(String)excelColumns[i]+", ";
			}
		}
		if(excelColumns.length<dbColumns.size())
		{			 
			List<String> asList = Arrays.asList(excelColumns);
			for(int i=0;i<dbColumns.size();i++){
				Map columnInfo1 = (Map)dbColumns.get(i);
				String excelHeader1 = (String)columnInfo1.get("EXCEL_HEADER_NAME");
					if(Collections.frequency(asList,excelHeader1)==0){
						misMatched+=excelHeader1+", ";
				} 
			}
		}
		
		if(unmatchedHeaders.length()>1)
			unmatchedHeaders=unmatchedHeaders.substring(0, unmatchedHeaders.length()-2);
		if(matchedHeaders.length()>0)
			matchedHeaders=matchedHeaders.substring(0, matchedHeaders.length()-1);
		if(matchedColumns.length()>0)
			matchedColumns=matchedColumns.substring(0, matchedColumns.length()-1);
		if(mobileNoColumns.length()>0)
			mobileNoColumns=mobileNoColumns.substring(0, mobileNoColumns.length()-1);
			
		columns.put("MATCHED",matchedHeaders);
		columns.put("UNMATCHED", unmatchedHeaders);
		columns.put("FIELDS", matchedColumns);
		columns.put("COLUMN_INFO",columnInfoList);
		columns.put("MOBILE_FIELDS", mobileNoColumns);
		columns.put("Missed_Columns", misMatched);
	} catch (Exception e) 
	{
		e.printStackTrace();
	}
	logger.info("matchColumns() - Exit || UnMatched: "+unmatchedHeaders);
	return columns;
}
public static String[] exremoveDupColumns(String xlcolumn[], List dbColumns) {

	ArrayList list = new ArrayList();
	String colname = "";

	for (int i = 0; i < xlcolumn.length; i++) {
		boolean dupColumnSts = true;
		int s = 1;
		colname = xlcolumn[i].toUpperCase();

		while (dupColumnSts) {
			if (i == 0) {
				list.add(colname);
				break;
			}

			boolean dupColContain = list.contains(colname);

			if (!dupColContain) 
			{
				list.add(colname);
				dupColumnSts = false;
			} else {
				colname = (xlcolumn[i] + "_" + s).toUpperCase();
				s++;
				dupColumnSts = true;
			}
		}
	}
	String[] newXlcolumn = (String[]) list.toArray(new String[0]);
	
	return newXlcolumn;
}
public List<Map<String, Object>> getAttachmentDocList(String productId, String contentId) {
	return upload.getAttachmentDocList(productId,contentId);
}
public void deleteAttachment(String filePath,String docId) throws Exception {
	FileUtils.deleteQuietly(new File(filePath));
	upload.deleteAttachment(filePath,docId);
}
public List<String> insertAttachmentDetails(String contentId,List<String> docDescription, List<String> uploadFileName, List<File> uploadFile,List<String> remarks,String productId, String uploadFileStr, String deviceType) throws IOException {
	List<String> errorList = new ArrayList<String>();
	int j=0;
	for(int i=0 ; i< docDescription.size() ; i++) {
		if(docDescription.get(i) != null && uploadFileName.get(i) != null){
			if((uploadFile.get(j).length()/1024)>2048) {
				errorList.add(" File Size Must Be Less Then 2MB at row "+ (i+1));
			} else {
				SimpleDateFormat sdf = new SimpleDateFormat("'on'ddMMMyyyy_h-mm-ss-SSSSSS_a");
				Calendar cal = Calendar.getInstance();
				String date = sdf.format(cal.getTime());
				String documentPath = DOCUMENT_FILE_PATH +contentId + "_" + j + "_" + docDescription.get(i) + date + "." +FilenameUtils.getExtension(uploadFileName.get(j));
				//System.out.println(bean.getUpload().get(j).length());
					FileUtils.copyFile(uploadFile.get(j), new File(documentPath));
				upload.insertAttachmentDetails(contentId,documentPath, docDescription.get(i),uploadFileName.get(j),productId,remarks.get(j));
				j++;
			}
		}
	}
	return errorList;
}

}
