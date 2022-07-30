package com.maan.upload;

import java.io.File;
import java.util.ArrayList;
import java.util.List;


public class UploadBean {
	private String docId;
	private String docSNo;
	private String docName;
	private String docOurName;
	private String docPath;
	private String docDesc;
	private String docUploadBy;
	private String docUploadDate;
	private String docUpdateBy;
	private String docUpdateDate;
	private String status;	
	private File openUpload;
	private String openUploadFileName;
	private List<UploadBean> updDocumentList = new ArrayList<UploadBean>();
	
	
	private List<String> documentIdList;
	private List<String> docDescription;
	private List<String> remarks;
	private List<File> upload;
	
	private List<String> uploadFileName;
	private List<String> exitList;
	private String applicationNo;
	private String uploadType;
	private String quoteNo;
	private String deleteVehicleId;
	private String filePath;
	private String fileName;
	private String mode1;
	private String mode;
	private String isArabic;
	private String contentId;
	private List<Object>transactionList;
	private List<Object>uploadedList;
	private List<Object>errorList;
	private String fileauth;
	private String fileurl;
	private String fileReq;

	
	public String getFileauth() {
		return fileauth;
	}
	public void setFileauth(String fileauth) {
		this.fileauth = fileauth;
	}
	public String getFileurl() {
		return fileurl;
	}
	public void setFileurl(String fileurl) {
		this.fileurl = fileurl;
	}
	public String getFileReq() {
		return fileReq;
	}
	public void setFileReq(String fileReq) {
		this.fileReq = fileReq;
	}
	public List<Object> getUploadedList() {
		return uploadedList;
	}
	public void setUploadedList(List<Object> uploadedList) {
		this.uploadedList = uploadedList;
	}
	public List<Object> getErrorList() {
		return errorList;
	}
	public void setErrorList(List<Object> errorList) {
		this.errorList = errorList;
	}
	public List<Object> getTransactionList() {
		return transactionList;
	}
	public void setTransactionList(List<Object> transactionList) {
		this.transactionList = transactionList;
	}
	public String getContentId() {
		return contentId;
	}
	public void setContentId(String contentId) {
		this.contentId = contentId;
	}
	public List<String> getDocumentIdList() {
		return documentIdList;
	}
	public void setDocumentIdList(List<String> documentIdList) {
		this.documentIdList = documentIdList;
	}
	public List<String> getDocDescription() {
		return docDescription;
	}
	public void setDocDescription(List<String> docDescription) {
		this.docDescription = docDescription;
	}
	public List<String> getRemarks() {
		return remarks;
	}
	public void setRemarks(List<String> remarks) {
		this.remarks = remarks;
	}
	public List<File> getUpload() {
		return upload;
	}
	public void setUpload(List<File> upload) {
		this.upload = upload;
	}
	public List<String> getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(List<String> uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public List<String> getExitList() {
		return exitList;
	}
	public void setExitList(List<String> exitList) {
		this.exitList = exitList;
	}
	public String getApplicationNo() {
		return applicationNo;
	}
	public void setApplicationNo(String applicationNo) {
		this.applicationNo = applicationNo;
	}
	public String getUploadType() {
		return uploadType;
	}
	public void setUploadType(String uploadType) {
		this.uploadType = uploadType;
	}
		
	public String getDocOurName() {
		return docOurName;
	}
	public void setDocOurName(String docOurName) {
		this.docOurName = docOurName;
	}
	public String getDocPath() {
		return docPath;
	}
	public void setDocPath(String docPath) {
		this.docPath = docPath;
	}
	public String getDocUploadBy() {
		return docUploadBy;
	}
	public void setDocUploadBy(String docUploadBy) {
		this.docUploadBy = docUploadBy;
	}
	public String getDocUpdateBy() {
		return docUpdateBy;
	}
	public void setDocUpdateBy(String docUpdateBy) {
		this.docUpdateBy = docUpdateBy;
	}
	public String getDocUpdateDate() {
		return docUpdateDate;
	}
	public void setDocUpdateDate(String docUpdateDate) {
		this.docUpdateDate = docUpdateDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDocId() {
		return docId;
	}
	public void setDocId(String docId) {
		this.docId = docId;
	}
	
	public String getDocSNo() {
		return docSNo;
	}
	public void setDocSNo(String docSNo) {
		this.docSNo = docSNo;
	}
	public List<UploadBean> getUpdDocumentList() {
		return updDocumentList;
	}
	public void setUpdDocumentList(List<UploadBean> updDocumentList) {
		this.updDocumentList = updDocumentList;
	}
	public String getDocUploadDate() {
		return docUploadDate;
	}
	public void setDocUploadDate(String docUploadDate) {
		this.docUploadDate = docUploadDate;
	}
	public String getDocName() {
		return docName;
	}
	public void setDocName(String docName) {
		this.docName = docName;
	}
	public String getDocDesc() {
		return docDesc;
	}
	public void setDocDesc(String docDesc) {
		this.docDesc = docDesc;
	}
	public void setQuoteNo(String quoteNo) {
		this.quoteNo = quoteNo;
	}
	public String getQuoteNo() {
		return quoteNo;
	}
	public void setDeleteVehicleId(String deleteVehicleId) {
		this.deleteVehicleId = deleteVehicleId;
	}
	public String getDeleteVehicleId() {
		return deleteVehicleId;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileName() {
		return fileName;
	}
	public void setMode1(String mode1) {
		this.mode1 = mode1;
	}
	public String getMode1() {
		return mode1;
	}
	public void setMode(String mode) {
		this.mode = mode;
	}
	public String getMode() {
		return mode;
	}
	public void setOpenUpload(File openUpload) {
		this.openUpload = openUpload;
	}
	public File getOpenUpload() {
		return openUpload;
	}
	public void setOpenUploadFileName(String openUploadFileName) {
		this.openUploadFileName = openUploadFileName;
	}
	public String getOpenUploadFileName() {
		return openUploadFileName;
	}
	public void setIsArabic(String isArabic) {
		this.isArabic = isArabic;
	}
	public String getIsArabic() {
		return isArabic;
	}

}
