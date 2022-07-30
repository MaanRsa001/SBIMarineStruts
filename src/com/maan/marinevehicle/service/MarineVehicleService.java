package com.maan.marinevehicle.service;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.Logger;

import com.maan.common.LogUtil;
import com.maan.common.dao.CommonDAO;
import com.maan.common.exception.BaseException;
import com.maan.marinevehicle.MarineVehicleApiCaller;
import com.maan.marinevehicle.MarineVehicleBean;
import com.maan.marinevehicle.dao.MarineVehicleDAO;

public class MarineVehicleService {
	final static Logger logger = LogUtil.getLogger(MarineVehicleService.class);
	MarineVehicleDAO dao=new MarineVehicleDAO();
	MarineVehicleApiCaller api=new MarineVehicleApiCaller();
	
	public List<Map<String, Object>> getMarinevehicleDetails(String tranId, String status) {
		return api.getMarinevehicleDetails(tranId,status);
	}
	public Map insertRecords( File file, String tranId,String fileName,String filePath,String proposalNo, String reUpload, String baseOpenCoverNo,String endtYN, MarineVehicleBean bean) throws BaseException
	{
		logger.info("insertRecords - Enter");
		String error="";
		Map resultMap=null;
		try
		{
			resultMap=getRecordsList(file, dao.getDBColumns(""), proposalNo,  endtYN);
			
			//resultMap.put("ERROR", result);
			error=(String)resultMap.get("ERROR");
			if(StringUtils.isEmpty(error))
			{
				error=dao.insertRawData((String)resultMap.get("FIELDS"), (List)resultMap.get("RECORDS"), tranId, fileName, filePath, proposalNo,reUpload,baseOpenCoverNo,endtYN,bean.getOpenCoverNo());
				if(error.equals(""))
				{	
					dao.moveToMaster(tranId);
					resultMap.put("ERROR", dao.getRawCount(tranId,bean));
				}
				else
					resultMap.put("ERROR", error);
			}
		}catch(Exception e) { e.printStackTrace(); }
		logger.info("insertRecords - Exit || Error: "+error);
		return resultMap;	
	}
	public  Map getRecordsList(File inputFile, List dbColumns, String proposalNo,String endtYN)
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
			in = new BufferedReader(new FileReader(inputFile));
			while ((record = in.readLine()) != null && cont) 
			{
				logger.info("status----->" + record);
				totalLinesProcessed++;
				if (totalLinesProcessed == 1) 
				{
					record=record.replaceAll("[^A-Za-z0-9_\t/.() *]", "");
					//to Use Col As it is
					//record=record.replaceAll("[^A-Z0-9_\t]", "");
					excelHeaders = record.split("\t");
					excelHeaders = removeDupColumns(excelHeaders, dbColumns);
					resultMap = matchColumns(excelHeaders, dbColumns);
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
				record = record.replaceAll("\"", "");record = record.replaceAll("[*]", "");
				if((record.trim()).length()==0)
				break;
				record = record.replaceAll("\t", "'\t'");
				//record = record.replaceAll("\t", "");
				//record = record.replaceAll("", "','");
				if (totalLinesProcessed != 1) 
				{
					record=formatValues((String[][])resultMap.get("COLUMN_INFO"), record);
					recordsList.add(record);
				}
			}
		/*	if(!"Y".equalsIgnoreCase(endtYN)||endtYN==null){
				int count=dao.getCountNoOfVehicle(proposalNo);
				if(count<recordsList.size()){
					result+="No of vehicle in upload file and haulier mismatch";
				}
			}*/
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
	public static String[] removeDupColumns(String xlcolumn[], List dbColumns) {

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

				if (!dupColContain) // if val not exist in array list
				{
					list.add(colname);
					dupColumnSts = false;
				} else {
					colname = (xlcolumn[i] + "_" + s).toUpperCase();
					s++;
					dupColumnSts = true;
				}// else
			}// while

		}// for

		String[] newXlcolumn = (String[]) list.toArray(new String[0]);
		// System.out.println("Array of String has lengthh " +
		// newXlcolumn.length);
		/*
		 * for( int i=0;i<newXlcolumn.length;i++) { System.out.println("Array
		 * of String has length1 " + newXlcolumn[i]); }
		 */
		return newXlcolumn;
	}
	public static String formatValues(String[][] columnInfoList, String record)
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
				value=(String)values[i].replaceAll("'", "");
				if("DECIMALS".equalsIgnoreCase(dataType)){
					if(!(value.isEmpty() || value==null)){
						value=value.replaceAll(",", "");
					}
				}			
				if("DATE".equalsIgnoreCase(dataType)){
						if(!(value.isEmpty() || value==null)){
							value=value.substring(0,value.indexOf(" "));
						}
					}
				if("DATE".equalsIgnoreCase(dataType)){ 
					if(StringUtils.isEmpty(finalValues))
						finalValues=finalValues+"to_date('"+value+"','mm/dd/yy'),'";
					else
					finalValues=finalValues.substring(0, finalValues.length()-1)+ "to_date('"+value+"','mm/dd/yy'),'";
				}else {
				finalValues+=StringUtils.trim(value)+"','";
				}
			}

		}
		finalValues=finalValues.substring(0,finalValues.length()-2);	
		return finalValues;
	}
	public static Map matchColumns(String[] excelColumns, List dbColumns) 
	{
		logger.info("matchColumns() - Enter");
		String[][] columnInfoList = new String[dbColumns.size()][4];
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
						fieldName=(String)columnInfo.get("DB_COLUMN_NAME");
						matchedColumns+=fieldName+",";
						matchedHeaders+=excelHeader+",";
						columnInfoList[k][0]=fieldName;
						columnInfoList[k][1]=(String)columnInfo.get("DATA_TYPE")==null?"":columnInfo.get("DATA_TYPE").toString();
						columnInfoList[k][2]=excelHeader;
						//columnInfoList[k][3]=(String)columnInfo.get("REMARKS")==null?"":columnInfo.get("REMARKS").toString(); 
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
	 public List<Map<String,Object>> getDeletedList(){
		 return dao.getDeletedList();
	 }
	 public String getTranactionId()
	 {
	 	return dao.getTransactionId();
	 }
	public List<Map<String, Object>> getOpenCoverList(String brokerId) {
		return dao.getOpenCoverList(brokerId);
	}
	/*public void deleteTransction(Map<String, String> deleteTransMap) {
		dao.deleteTransction(deleteTransMap);
		
	}*/
	public void deleteTransction(List<String> sno1, List<String> transNo1, List<String> proposalno1, MarineVehicleBean bean) {
		api.deleteTransction( sno1,transNo1,proposalno1,bean);
		
	}
	public List<Map<String, Object>> getBrokerList(String branchCode) {
		return dao.getBrokerList(branchCode);
	}
	public List<Map<String, Object>> getMarinevehicleDeleteDetails( String proposalNo, String searchType, String searchValue, String status, String baseOpenCoverNo) {
		return api.getMarineVehicleDeleteDetails(proposalNo,searchType,searchValue,status,baseOpenCoverNo);
	}
	public String getRefundchargableAmount(MarineVehicleBean bean) {
		
		return dao.getRefundchargableAmount(bean);
	}
	public String getRefundAmount(List<String> sno1, List<String> transNo1, List<String> proposalno1, String baseOpenCoverNo, String proposalNo, MarineVehicleBean bean) {
		
		return dao.getRefundAmount(sno1,transNo1,proposalno1,baseOpenCoverNo,proposalNo,bean);
	}
	public String getProposalNo(String openCoverNo) {
		return dao.getProposalNo(openCoverNo);
	}
	public List<Map<String, Object>> getTransDetails(String proposalNo,
			String searchType, String searchValue, String status) {
		return 	api.getTransDetails(proposalNo,status);
	}
	public List<Map<String, Object>> getHaulierDetails(String proposalNo) {
		return 	api.getHaulierDetails(proposalNo);
	}
	public List<Map<String, Object>> getVehicleTransDetails(String opencoverNo) {
		return api.getVehicleTransDetails(opencoverNo);
	}
	public void getPremiumDetails(MarineVehicleBean bean) {
		api.getPremiumDetails(bean);
	}
	public void updateMopPremiumDetails(MarineVehicleBean bean) {
		dao.updateMopPremiumDetails(bean);
	}
	public void getOpenCoverDetails(MarineVehicleBean bean) {
		dao.getOpenCoverDetails(bean);
		
	}
	public void updatePremiumDetails(String type,String branchCode, String issuer, MarineVehicleBean bean) {
		dao.updatePremiumDetails(type,branchCode,issuer,bean);
		
	}
	public List<Map<String, Object>> getPremiumDetailsList(
			MarineVehicleBean bean) {
		return dao.getPremiumDetailsList(bean);
	}
	public boolean maxEffectiveDate(String effectiveDate,String BaseOC){
		return dao.maxEffectiveDate(effectiveDate,BaseOC);
		
	}
	public void updateStatus(MarineVehicleBean bean) {
		dao.updateStatus(bean);
		
	}
	public String getPolicyFee(String openCoverNo) {
		return dao.getPolicyFee(openCoverNo);
	}
	public List<Map<String, Object>> getDuplicateRecords(String tranId,
			String status) {
		return dao.getDuplicateRecords(tranId,status);
	}
	public void insertDueDetails(MarineVehicleBean bean) {
		new CommonDAO().insertDueDetails(bean.getTranId(),bean.getPolicyNo(), bean.getDueDate(), bean.getDueamount(), bean.getDuepercent(), bean.getEffectiveDatePT(), bean.getDueList(), "addNew", bean.getSnoPT(), bean.getAmendId(), "13T");
		
	}
public String validateImsDate(String effectiveDate,String branchCode){
		
		return  dao.validateImsDate( effectiveDate,branchCode);
		
	}
public String getvatTaxprecent(String openCoverNo) {
	// TODO Auto-generated method stub
	return dao.getvatTaxprecent(openCoverNo);
}
public List<String> validatePaymentTerms(String quoteNo, String policyNo, List<String> dueDate, List<String> dueamount,
		List<String> duepercent,List<String> effectiveDatePT, List<String> dueList, 
			String premium, String branchCode) {
	return new CommonDAO().validatePaymentTerms(quoteNo, policyNo, dueDate, dueamount, duepercent, effectiveDatePT, dueList, premium, branchCode);
	
}

	public void getDetails(MarineVehicleBean bean) {
		api.getDetails(bean);
	}

	public void processRecords(MarineVehicleBean bean, String loginID, String branchCode, String issuer,String productId) {
		api.processRecords( bean,  loginID,  branchCode,  issuer, productId) ;
		
	}
	public void policyGenerate(MarineVehicleBean bean, String loginId, String branchCode, String issuer) {
		api.policyGenerate(bean, loginId,  branchCode,  issuer);
	}
}
