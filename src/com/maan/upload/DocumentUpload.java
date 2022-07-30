package com.maan.upload;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.maan.report.service.ReportService;
import com.maan.upload.bean.DocumentBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class DocumentUpload extends ActionSupport implements ModelDriven<DocumentBean> {
	private static final long serialVersionUID = 1L;
	Map<String, Object> session=ActionContext.getContext().getSession();
	final HttpServletRequest request=ServletActionContext.getRequest();
	private DocumentBean bean = new DocumentBean();
	private ReportService service = new ReportService();
	
	private final String uploadBasePath = getText("LC_FILE_UPLOAD_PATH")+"/openCover/";
	
	private InputStream inputStream;

	public DocumentBean getModel() {
		return bean;
	}
	
	public String upload() {
		return INPUT;
	}

	public String submit(){
		try {
			String lcFilePath = request.getSession().getServletContext().getRealPath("/"+"/uploadfile") +"/"+ bean.getPolicyNo().replaceAll("/", "-")+"_";
			File fileToCreate = new File(lcFilePath);
			if(bean.getUpload().isEmpty()){
				addActionError(getText("Please Attach The File"));
				bean.getLcdocremarks().remove("");
			} else {
				service.insertLcFileDtls(bean.getPolicyNo(),(String)session.get("user"),bean.getUploadFileName(),fileToCreate,bean.getLcdocremarks(),lcFilePath,bean.getUpload());
				bean.getLcdocremarks().clear();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return INPUT;
	}
	
	public String download(){
		String downloadFile = request.getSession().getServletContext().getRealPath("/"+"/uploadfile") +"/"+  bean.getLcFileName();
		try {
			inputStream = new FileInputStream(downloadFile);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		return "download";
	}

	public String delete() {
		try{
			File deleteFile = new File(request.getSession().getServletContext().getRealPath("/"+"/uploadfile") +"/"+  bean.getLcFileName());
			FileUtils.deleteQuietly(deleteFile);
			service.deleteLcFile(bean.getPolicyNo(),bean.getUploadId());
			bean.getLcdocremarks().clear();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return INPUT;
	}
	
	public List<Object> getDocumentList() {
		return service.getLcFileList(bean.getPolicyNo());
	}

	public InputStream getInputStream() {
		return inputStream;
	}

}
