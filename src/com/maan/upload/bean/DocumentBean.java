package com.maan.upload.bean;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class DocumentBean {
	private String policyNo;
	private String uploadId;
	private String lcFileName;
	private String downloadFileName;
	
	private List<File> upload = new ArrayList<File>();
	private List<String> uploadFileName = new ArrayList<String>();
	private List<String> uploadContentType = new ArrayList<String>();
	private List<String> lcdocremarks = new ArrayList<String>();

	public String getPolicyNo() {
		return policyNo;
	}
	public void setPolicyNo(String policyNo) {
		this.policyNo = policyNo;
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
	public List<String> getUploadContentType() {
		return uploadContentType;
	}
	public void setUploadContentType(List<String> uploadContentType) {
		this.uploadContentType = uploadContentType;
	}
	public List<String> getLcdocremarks() {
		return lcdocremarks;
	}
	public void setLcdocremarks(List<String> lcdocremarks) {
		this.lcdocremarks = lcdocremarks;
	}
	public String getLcFileName() {
		return lcFileName;
	}
	public void setLcFileName(String lcFileName) {
		this.lcFileName = lcFileName;
	}
	public String getDownloadFileName() {
		return downloadFileName;
	}
	public void setDownloadFileName(String downloadFileName) {
		this.downloadFileName = downloadFileName;
	}
	public String getUploadId() {
		return uploadId;
	}
	public void setUploadId(String uploadId) {
		this.uploadId = uploadId;
	}

}
