package com.maan.NewOpenCover.reports;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.maan.common.LogUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class ReportRegAction extends ActionSupport implements ModelDriven<ReportRegBean> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	final Logger logger = LogUtil.getLogger(ReportRegAction.class);
	HttpServletRequest request=ServletActionContext.getRequest();
	Map<String, Object> session=ActionContext.getContext().getSession();
	ReportRegBean bean=new ReportRegBean();
	ReportRegService service=new ReportRegService();
	@Override
	public ReportRegBean getModel() {
		bean.setBelongingBranch(session.get("BelongingBranch")==null?"01":session.get("BelongingBranch").toString());
		bean.setBranchCode(session.get("BranchCode")==null?"01":session.get("BranchCode").toString());
		bean.setUserType(session.get("usertype")==null?"01":session.get("usertype").toString());
		return bean;
	}
	private InputStream inputStream;
	
	public InputStream getInputStream() {
		return inputStream;
	}
	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
	public List<Object>getExistingBrokerList(){
		return service.getExistingBrokerList(bean);
	}
	public List<Object>getPortfolioBrokerList(){
		return service.getPortfolioBrokerList(bean);
	}
	public String quoteRegister() {
		if("RSAIssuer".equalsIgnoreCase(bean.getUserType())) {
		bean.setQuoteList(service.getPendingAcceptList(bean));
		}else {
		bean.setQuoteList(service.getQuoteRegisterList(bean));
		}
		return "newquoteRegister";
	}
	public String pendingAccept() {
		bean.setQuoteList(service.getPendingAcceptList(bean));
		return "newpendingAccept";
	}
	public String policyRegister() {
		bean.setQuoteList(service.getPolicyRegisterList(bean));
		return "newpolicyRegister";
	}
	public String renewalPolicy() {
		bean.setQuoteList(service.getRenewalPolicyList(bean));
		return "newrenewalPolicy";
	}
	public String copyQuote() {
		bean.setDisplay("init");
		return "newCopyQuote";
	}
	public String expiredPolicy() {
		bean.setQuoteList(service.getExpiredPolicyList(bean));
		return "newexpiredPolicy";
	}
	public String lapsedPolicy() {
		bean.setQuoteList(service.getLapsedPolicyList(bean));
		return "newlapsedPolicy";
	}
	
	public String copySearch() {
		if("policy".equals(bean.getSearchType())) {
			bean.setSearchResult(service.copySearchPolicy(bean));
		}else {
			bean.setSearchResult(service.copySearch(bean));
		}
		validation();
		if(!hasActionErrors()) {
			bean.setDisplay("search");
		}else {
			bean.setDisplay("init");
		}
		return "newCopyQuote";
	}
	public String openCopy() {
		String result=service.opencoverCopy(bean);
		validation();
		if(!hasActionErrors()) {
			addActionError(result);
			bean.setDisplay("copyquote");
		}else {
			bean.setDisplay("search");
		}
		return "newCopyQuote";
	}
	public void validation() {
		if(bean.getErrors()!=null && bean.getErrors().size()>0) {
			for (int i =0;i<bean.getErrors().size();i++) {
				HashMap<String, Object> map=bean.getErrors().get(i);
				addActionError(map.get("Message").toString());
			}
		}
	}
	public String activeDeactive() {
		service.activeDeactive(bean);
		if("renew".equals(bean.getDisplay())) {
			return renewalPolicy();
		}else if("expiry".equals(bean.getDisplay())) {
			return expiredPolicy();
		}
		return "newrenewalPolicy";
		
	}
	public String document() {
		logger.info("Enter document "+bean.getDocType());
		String forward = "streamPDF";
		String filePath="",type="";
		try {
			if("schedule".equals(bean.getDocType()) || "draft".equals(bean.getDocType())) {
				 type=StringUtils.isBlank(bean.getOpencoverNo())?(bean.getProposalNo()+"Draft"):(bean.getOpencoverNo()+"OpenCover");
				 filePath=service.opencoverschedule(bean);
			}else if("debit".equals(bean.getDocType()) || "credit".equals(bean.getDocType())) {
				 type="debit".equals(bean.getDocType())?(bean.getOpencoverNo()+"debit"):(bean.getOpencoverNo()+"credit");
				 filePath=service.opencoverdebitcredit(bean);
			}else if("EndtReport".equals(bean.getDocType())) {
				type=bean.getOpencoverNo()+"OpencoverEndt";
				 filePath=service.opencoverendt(bean);
			}else if("clauses".equals(bean.getDocType())) {
				type=bean.getOpencoverNo()+"clausesPdf";
				 filePath=service.openClasuesPDF(bean);
			}
				inputStream=(new FileInputStream(filePath));
				File file=new File(filePath);
				if(file.exists()){
					logger.info("File Available");
				}else {
					logger.info("File Not Available");
				}
				
				bean.setFileName(type+".pdf");
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("Exit document "+bean.getDocType());
		return forward;
	}
}
