package com.maan.report;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.util.CollectionUtils;

import com.maan.adminnew.common.CommonService;
import com.maan.common.LogUtil;
import com.maan.common.Token;
import com.maan.common.Validation;
import com.maan.common.dao.CommonDAO;
import com.maan.common.exception.BaseException;
import com.maan.quotation.model.DefaultValue;
import com.maan.quotation.model.Errors;
import com.maan.quotation.service.PremiumService;
import com.maan.report.jasper.JasperReport;
import com.maan.report.jasper.MarineJasperReport;
import com.maan.report.jasper.MotorJasperReport;
import com.maan.report.model.EndorsementInputModel;
import com.maan.report.model.EndorsementOutputModel;
import com.maan.report.model.EndorsementSave;
import com.maan.report.model.EndorsementTypeModel;
import com.maan.report.service.ReportService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;


public class ReportAction extends ActionSupport  implements ModelDriven<ReportBean> {
	final Logger logger = LogUtil.getLogger(ReportAction.class);
	final HttpServletRequest request=ServletActionContext.getRequest();
	final HttpServletResponse response=ServletActionContext.getResponse();
	Map<String, Object> session=ActionContext.getContext().getSession();
	private static final String defaultError = "Something went wrong. Please try again later";
	ReportService service=new ReportService();
	PremiumService premium=new PremiumService();
	private static final long serialVersionUID = 1L;
	private String oneOff=getText("ONE_OFF");
	private String openCover=getText("OPEN_COVER");
	private List<Object> policyList;
	private List<Object> existingQuote;	
	private String menuType;	
	private String policyNo;
	private List<Object> declarationPolicy;	
	private String openCoverNo;
	private String loginId=StringUtils.defaultIfEmpty((String)session.get("BROKER_LOGIN_ID"), "");
	private String userType=(String)session.get("usertype");
	private String actualBranch=(String)session.get("adminBranch");
	private String productId=(String)session.get("product_id");
	private String openCustomerId;
	private String issuer=(String)session.get("RSAISSUER");
	private String brokerCode;
	private String policyStartDate;
	private String policyEndDate;
	private String userLoginId;
	private String quoteNo;
	private String applicationNo;
	private String refStatus;
	private String linkType;
	private String branchCode=(String)session.get("LoginBranchCode");
	private String belongingBranch=(String)session.get("BelongingBranch");
	private List<Object> lapsedReason;
	private List<Object> lapsedQuote;
	private String lapsedRemarks;
	private String display;
	//private String searchBy;
	//private String searchValue;
	private String quoteStatus;
	private String endStatus;
	private String endTypeId;
	private String custName;
	private List<Object> brokerList;
	private List<Object> endType;
	private String brokerCompany;
	private String searchFrom;
	private InputStream inputStream;
	private Integer page= 0;
	private int id;
	private Integer rows=0;
	private String sord;
	private String sidx;
	private String searchField;
	private String searchString;
	private String searchOper;
	private Integer total= 0;
	private Integer records= 0;
	private String option;
	private String reqFrm;
	private String appNo;
	private String quotationNo;
	private String menuFrom;
	private String referalStatus;
	private String endtStatus;
	private String schemeId=(String)session.get("scheme_id");
	private String contenTypeId=(String)session.get("ContentType");
	private String loginUserType=(String)session.get("usertype");
	private String adminLoginId=(String)session.get("user");
	private String endtLoginId;
	
	ReportBean bean=new ReportBean();
	private String originalOpenCoverNo;
	private String cancelYN;
	private String cancelRemarks;
	private String endtRemarks;
	private String quoteMailIds;
	private String reqFrom;
	private String effectiveDate;
	
	private String downloadType;
	private String fileName;
	private String lcFileName;
	
	//Motor
	private String  vehicleId;
	private String customerName;
	private String email;
	private String mobileNo;
	private String companyRegNo;
	private String otherPolicySearch;
	private String endtView;
	private String curntAppNo;
	
	private String referenceNo;
	
	public String getCancelYN() {
		return cancelYN;
	}
	public void setCancelYN(String cancelYN) {
		this.cancelYN = cancelYN;
	}
	public String getCancelRemarks() {
		return cancelRemarks;
	}
	public void setCancelRemarks(String cancelRemarks) {
		this.cancelRemarks = cancelRemarks;
	}
	public String getOriginalOpenCoverNo() {
		return originalOpenCoverNo;
	}
	public void setOriginalOpenCoverNo(String originalOpenCoverNo) {
		this.originalOpenCoverNo = originalOpenCoverNo;
	}
	public String getSchemeId() {
		return schemeId;
	}
	public void setSchemeId(String schemeId) {
		this.schemeId = schemeId;
	}
	public String getContenTypeId() {
		return contenTypeId;
	}
	public void setContenTypeId(String contenTypeId) {
		this.contenTypeId = contenTypeId;
	}
	public String getBelongingBranch() {
		return belongingBranch;
	}
	public void setBelongingBranch(String belongingBranch) {
		this.belongingBranch = belongingBranch;
	}
	public List<Object> getBasisValList() {
		return premium.getBasisValList(branchCode);
	}
	@org.apache.struts2.json.annotations.JSON(serialize = false)
	public List<Object> getPolicyInformation() {
		return premium.getPolicyInformation(applicationNo);
	}
	public List<Object> getPolicyList1(){
		menuType="R";
		return service.getReportList(loginId,productId,issuer,menuType,openCoverNo,policyStartDate,policyEndDate,quoteNo,policyNo,bean.getSearchBy(),bean.getSearchValue(), searchField, searchString, searchOper,branchCode,loginId,schemeId,userType);
	}
	public String getB2cCustYN(){
		return new CommonDAO().checkUserType(loginId,getText("B2C_AGENCY_CODE"))>0?"Y":"N";
	}
	public String getAppNo() {
		return appNo;
	}

	public void setAppNo(String appNo) {
		this.appNo = appNo;
	}

	public String getQuotationNo() {
		return quotationNo;
	}

	public void setQuotationNo(String quotationNo) {
		this.quotationNo = quotationNo;
	}

	public String getReferalStatus() {
		return referalStatus;
	}

	public void setReferalStatus(String referalStatus) {
		this.referalStatus = referalStatus;
	}
	public String getEndtStatus() {
		return endtStatus;
	}
	public void setEndtStatus(String endtStatus) {
		this.endtStatus = endtStatus;
	}
	public String ReqFrm() {
		return reqFrm;
	}
	public void setReqFrm(String reqFrm) {
		this.reqFrm = reqFrm;
	}
	public InputStream getInputStream() {
		return inputStream;
	}
	public String getSearchFrom() {
		return searchFrom;
	}
	public void setSearchFrom(String searchFrom) {
		this.searchFrom = searchFrom;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
	public String getSord() {
		return sord;
	}
	public void setSord(String sord) {
		this.sord = sord;
	}
	public String getSidx() {
		return sidx;
	}
	public void setSidx(String sidx) {
		this.sidx = sidx;
	}
	public String getSearchField() {
		return searchField;
	}
	public void setSearchField(String searchField) {
		this.searchField = searchField;
	}
	public String getSearchString() {
		return searchString;
	}
	public void setSearchString(String searchString) {
		this.searchString = searchString;
	}
	public String getSearchOper() {
		return searchOper;
	}
	public void setSearchOper(String searchOper) {
		this.searchOper = searchOper;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	public Integer getRecords() {
		return records;
	}
	public void setRecords(Integer records) {
		this.records = records;
	}
	public String getOption() {
		return option;
	}
	public void setOption(String option) {
		this.option = option;
	}
	public String getBrokerCompany() {
		return brokerCompany;
	}
	public void setBrokerCompany(String brokerCompany) {
		this.brokerCompany = brokerCompany;
	}
	public String getCustName() {
		return custName;
	}
	public void setCustName(String custName) {
		this.custName = custName;
	}
	public String getEndStatus() {
		return endStatus;
	}
	public void setEndStatus(String endStatus) {
		this.endStatus = endStatus;
	}
	public String getEndTypeId() {
		return endTypeId;
	}
	public void setEndTypeId(String endTypeId) {
		this.endTypeId = endTypeId;
	}
	@org.apache.struts2.json.annotations.JSON(serialize = false)
	public List<Object> getEndType() {
		String[] ids=endTypeId.split(",");
		endType=new ArrayList<Object>();
		if(ArrayUtils.isNotEmpty(ids)){
			for (int i = 0; i < ids.length; i++) {
				endType.add(ids[i]);
			}
		}
		return endType;
	}
	public void setEndType(List<Object> endType) {
		this.endType = endType;
	}
	@org.apache.struts2.json.annotations.JSON(serialize = false)
	public List<Map<String, Object>> getEndTypeList() {
		//return service.getEndTypeList(oneOff);
		//return service.getEndTypeList("11".equalsIgnoreCase(productId)?oneOff:productId);
		return service.endorsementCategoryWithList("11".equalsIgnoreCase(productId)?oneOff:productId);
	}
	public String getQuoteStatus() {
		return quoteStatus;
	}
	public void setQuoteStatus(String quoteStatus) {
		this.quoteStatus = quoteStatus;
	}
	public List<Object> getBrokerList() {
		return brokerList;
	}
	public String getIssuer() {
		return issuer;
	}
	public void setIssuer(String issuer) {
		this.issuer = issuer;
	}
	public String getDisplay() {
		return display;
	}
	public void setDisplay(String display) {
		this.display = display;
	}
	public String getMenuFrom() {
		return menuFrom;
	}
	public void setMenuFrom(String menuFrom) {
		this.menuFrom = menuFrom;
	}
	public String getLapsedRemarks() {
		return lapsedRemarks;
	}
	public void setLapsedRemarks(String lapsedRemarks) {
		this.lapsedRemarks = lapsedRemarks;
	}
	public String getBranchCode() {
		return branchCode;
	}
	public void setBranchCode(String branchCode) {
		this.branchCode = branchCode;
	}
	public List<Object> getLapsedReason() {
		return lapsedReason;
	}
	public void setLapsedReason(List<Object> lapsedReason) {
		this.lapsedReason = lapsedReason;
	}
	public List<Object> getLapsedQuote() {
		return lapsedQuote;
	}
	public void setLapsedQuote(List<Object> lapsedQuote) {
		this.lapsedQuote = lapsedQuote;
	}
	public String getLinkType() {
		return linkType;
	}
	public void setLinkType(String linkType) {
		this.linkType = linkType;
	}
	public String getApplicationNo() {
		return applicationNo;
	}
	public void setApplicationNo(String applicationNo) {
		this.applicationNo = applicationNo;
	}
	public String getQuoteNo() {
		return quoteNo;
	}
	public void setQuoteNo(String quoteNo) {
		this.quoteNo = quoteNo;
	}
	public String getUserLoginId() {
		return userLoginId;
	}
	public void setUserLoginId(String userLoginId) {
		this.userLoginId = userLoginId;
	}
	public String getPolicyStartDate() {
		return policyStartDate;
	}
	public void setPolicyStartDate(String policyStartDate) {
		this.policyStartDate = policyStartDate;
	}
	public String getPolicyEndDate() {
		return policyEndDate;
	}
	public void setPolicyEndDate(String policyEndDate) {
		this.policyEndDate = policyEndDate;
	}
	public String getBrokerCode() {
		return brokerCode;
	}
	public void setBrokerCode(String brokerCode) {
		session.put("brokerCode", brokerCode);
		this.brokerCode = brokerCode;
	}
	public String getOpenCoverNo() {
		return openCoverNo;
	}
	public void setOpenCoverNo(String openCoverNo) {
		this.openCoverNo = openCoverNo;
		session.put("openCoverNo", openCoverNo);
	}
	public String getOpenCustomerId() {
		return openCustomerId;
	}
	public void setOpenCustomerId(String openCustomerId) {
		this.openCustomerId = openCustomerId;
			session.put("customer_id", openCustomerId);
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
		if("PS".equalsIgnoreCase(request.getParameter("reqFrom"))){
			session.put("product_id", productId);
		}
	}
	public String getMenuType() {
		return menuType;
	}
	public void setMenuType(String menuType) {
		this.menuType = menuType;
	}
	public List<Object> getExistingQuote() {
		return existingQuote;
	}
	public List<Object> getPolicyList() {
		return policyList;
	}
	public void setPolicyList(List<Object> policyList) {
		this.policyList = policyList;
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
		if("BS".equalsIgnoreCase(request.getParameter("searchFrom"))){
			session.put("userName", loginId);
		}
	}
	public String getPolicyNo() {
		return policyNo;
	}
	public void setPolicyNo(String policyNo) {
		this.policyNo = policyNo;
	}
	public List<Object> getDeclarationPolicy() {
		return declarationPolicy;
	}
	public void setDeclarationPolicy(List<Object> declarationPolicy) {
		this.declarationPolicy = declarationPolicy;
	}
	@org.apache.struts2.json.annotations.JSON(serialize = false)
	public List<Object> getUserSelection() {
		return service.getUserList((String)session.get("user"), productId,StringUtils.defaultIfEmpty(issuer, ""), bean.getSearchBy(), branchCode,StringUtils.isBlank(menuType)?"":menuType,openCoverNo);
	}
	@org.apache.struts2.json.annotations.JSON(serialize = false)
	public List<Object> getQuotationInfo() {
		return new PremiumService().getQuotationInformation(applicationNo, branchCode);
	}
	@org.apache.struts2.json.annotations.JSON(serialize = false)
	public String getOriginalPolicyNo(){
		return service.getOriginalPolicyNo(openCoverNo);
	}

	public String init(){
		try{
			if("RA".equals(menuFrom) && "RA".equals(quoteStatus))
				menuType="RA";
			else if("RR".equals(menuFrom) && "RR".equals(quoteStatus))
				menuType="RR";
			if(session.get("MSG")!=null) {
				addActionMessage(session.get("MSG").toString());
				session.remove("MSG");
			}
			if(StringUtils.isNotEmpty(productId)){
				session.put("product_id", "3".equals(productId)?"3":"11");
			}
			
			if("30".equals(productId)){ //
				if(StringUtils.isNotBlank(schemeId)) {
					session.put("scheme_id", schemeId);
				}
				if(StringUtils.isNotBlank(contenTypeId)) {
					session.put("ContentType", contenTypeId);
				}
			}else if("33".equals(productId)){
				if(StringUtils.isNotBlank(schemeId)) {
					session.put("scheme_id", schemeId);
				}
				if(StringUtils.isNotBlank(contenTypeId)) {
					session.put("ContentType", contenTypeId);
				}
			}else {
				session.put("scheme_id", "1");
				session.put("ContentType", "");
			}
			
			if(StringUtils.isNotBlank(getOtherPolicySearch())) {
				searchField = "gotherPolicyNo";
				searchOper = "cn";
				searchString = otherPolicySearch;
				bean.setSearchBy("gotherPolicyNo");
			}
			
			
			if(StringUtils.isEmpty(productId) && StringUtils.isNotEmpty((String)session.get("product_id"))) {
				productId=(String)session.get("product_id");
			}
			issuer=(String)session.get("RSAISSUER")==null?"":(String)session.get("RSAISSUER");
			openCoverNo=(String)session.get("openCoverNo")==null?"":(String)session.get("openCoverNo");
			if(openCover.equalsIgnoreCase(productId) && !"User".equalsIgnoreCase(userType)){
				loginId=(String)session.get("userName");
				session.put("BROKER_LOGIN_ID", loginId);
			}else if("User".equalsIgnoreCase(userType)){
				loginId=(String)session.get("user");
				session.put("BROKER_LOGIN_ID", loginId);
			}
			if("E".equalsIgnoreCase(menuType)) {
				loginId = StringUtils.isNotBlank(endtLoginId)?endtLoginId:loginId;
				List<Map<String,Object>> lsitVal =service.getBasicEndtInfo((StringUtils.isBlank(policyNo)?"":policyNo));
				if(lsitVal!=null && lsitVal.size()>0)
				{
					Map map=(Map)lsitVal.get(0);
					setCurntAppNo(map.get("ApplicationNo")==null?"":map.get("ApplicationNo").toString());
					setBrokerCompany(map.get("CompanyName")==null?"":map.get("CompanyName").toString());
					setCustName(map.get("CustomerName")==null?"":map.get("CustomerName").toString());
				}
			}else if("ET".equalsIgnoreCase(menuType)){
				if("3".equals(productId) || "11".equals(productId)) {
					endtRemarks =service.getCancalRemarks(quoteNo);
				}
			}
			if("PR".equals(menuType)){
				validateFields();
				if(!hasActionErrors()){
					if ("11".equals(productId)) 
						openCoverNo=(String)session.get("openCoverNo")==null?"":(String)session.get("openCoverNo");
					else
						openCoverNo="";
					policyList=service.getReportList(userLoginId,productId,issuer,menuType,openCoverNo,policyStartDate,policyEndDate,quoteNo,policyNo,"","","","","",branchCode,StringUtils.isBlank(issuer)?loginId:issuer,schemeId,vehicleId);
				}else{
					menuType="R";	
					policyList=service.getReportList(loginId,productId,issuer,menuType,openCoverNo,policyStartDate,policyEndDate,quoteNo,policyNo,"","","","","",branchCode,"",schemeId,vehicleId);
				}
				if(StringUtils.isNotBlank(policyStartDate))
					policyStartDate=dateFormat(policyStartDate);
				if(StringUtils.isNotBlank(policyEndDate))
					policyEndDate=dateFormat(policyEndDate);
			}
			if("BQE".equalsIgnoreCase(menuType) || "BP".equalsIgnoreCase(menuType) || "BRU".equalsIgnoreCase(menuType) || "BRA".equalsIgnoreCase(menuType) || "BRR".equalsIgnoreCase(menuType)) {
				loginId = getText("B2C_LOGIN_ID");
			}
			session.put("LANG", "Y");
			
			if(userLoginId==null/*&&(issuer==null||"".equalsIgnoreCase(issuer))*/){
				userLoginId=loginId;
				
			}
			
			try{
				if("chart".equalsIgnoreCase(menuType) && ("3".equals(productId) || "11".equals(productId))){
					service.dashboardCharts(productId, userType, issuer, (String)session.get("user"),(String)session.get("LoginBranchCode"), bean);
				}
			}catch(Exception e){
				logger.debug("Exception @ dashBoardGraph "+e);
				e.printStackTrace();
			}
		}catch(Exception e){
			logger.debug("EXCEPTION @ "+e);
			e.printStackTrace();
		}
		return SUCCESS;		
	}
	
	
	
	
	public String mail() throws BaseException 
	{	
		logger.info("linkType"+linkType);
		if("QUOTEMAIL".equals(linkType)){
			linkType = "MAIL";
			reqFrom = "QUOTEMAIL";
			lapsedQuote=service.getLapsedQuote(quoteNo,productId);
	    	return "links";	
		}
		else if("MAIL".equals(linkType)){
	    	premium.sendMail(applicationNo, (String)session.get("user1"), "");
		    return "links";	
		}else if("LAPSED".equals(linkType)){
			logger.info((String)session.get("BelongingBranch"));
			lapsedReason=service.getLapsedReason((String)session.get("BelongingBranch"));
			lapsedQuote=service.getLapsedQuote(quoteNo,productId);
			return "links";	
		}else if("ACTIVE".equals(linkType)){
			service.activeLapsed(quoteNo,productId);
			return "redirect";
		}else{
			validateRejectMail();
			if(!hasActionErrors())
				service.updateLabsed(quoteNo, lapsedRemarks, loginId, productId);
			else {
				linkType="LAPSED";
				mail();
			}
		}return "links";
	}
	private void validateQuoteMail() {
		Validation validation=new Validation();
		if(StringUtils.isBlank(quoteMailIds)) {
			this.addActionError(getText("error.quotation.email"));
		}
		else if("invalid".equalsIgnoreCase(validation.emailValidate(quoteMailIds))) {
			this.addActionError(getText("error.quotation.email.invalid"));
		}
	}
	private void validateRejectMail(){
		if(StringUtils.isBlank(lapsedRemarks))
			this.addActionError("Please select Rejected Quote Reason");
	}
	
	public String declaration()
	{	
		logger.info("policyNo"+policyNo);
		declarationPolicy=service.getDeclarationPolicyList(policyNo);
		return "declarationPolicy";
	}
	private void validateFields() {
		if(StringUtils.isEmpty(policyStartDate))
			addActionError(getText("error.report.policyStartDate"));
		if(StringUtils.isEmpty(policyEndDate))
			addActionError(getText("error.report.policyEndDate"));
		if(!hasActionErrors()){
			try{
				SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		    	Date sdate = sdf.parse(policyStartDate);
		    	Date edate = sdf.parse(policyEndDate);
		    	if(sdate.after(edate))
		    		addActionError(getText("error.report.startenddate"));
			}catch(Exception e){
				e.printStackTrace();
			}
		} 
		if(!"11".equals(productId)&&StringUtils.isEmpty(userLoginId))
			addActionError(getText("error.report.userBroker"));
	}
	public String initSearch()
	{	
		if(StringUtils.isEmpty(productId) && StringUtils.isNotEmpty((String)session.get("product_id"))) {
			productId=(String)session.get("product_id");
		}
		display="init";
		return "search";
	}
	public String search() {	
		display="search";
		validateSearchFields();
		if(!hasActionErrors()){
			policyList=service.getSearchResult(this, userType, productId,bean.getSearchBy(),bean.getSearchValue());
		}
		return "searchResult";
	}
	public String brokerList()
	{
		request.setAttribute("ELEMENT_NAME", "brokerList");
		brokerList=service.getUserList(loginId, productId,StringUtils.defaultIfEmpty(issuer, ""), bean.getSearchBy(), actualBranch,StringUtils.isBlank(menuType)?"":menuType,(String)session.get("openCoverNo"));
		return "dropdown";
	}
	public String viewQuote()
	{
		return "viewQuote";
	}
	private void validateSearchFields() {
		if((StringUtils.isEmpty(bean.getSearchBy())))
		{
			addActionError(getText("error.searchBy.empty"));
		}
		if(StringUtils.isEmpty(loginId))
		{
			addActionError(getText("error.loginId.empty"));
		}
		if(StringUtils.isEmpty(bean.getSearchValue()))
		{
			addActionError(getText("error.searchValue.empty"));
		}
		if(!(StringUtils.isNumeric(bean.getSearchValue())) &&  StringUtils.isNotEmpty(bean.getSearchValue()) && "quoteNo".equals(bean.getSearchBy()))
		{
			addActionError(getText("error.searchValue.invalid"));
		}
	}
	
	
	public String endorsement() {
		try {
			EndorsementInputModel eim = mapEndorsementInput();
			EndorsementOutputModel eom = service.saveEndorsement(eim);
			mapEndorsementOutput(eom);
			if(!hasActionErrors()) {
				if(!CollectionUtils.isEmpty(endType)) {
					endTypeId=StringUtils.join(endType, ",");
				}
				if("41".equalsIgnoreCase(endTypeId)) {
					return "policyInfo";
				}else {
					return "endorsement";
				}
			}
		}catch(Exception e) {
			addActionError(defaultError);
			logger.info("Exception Occurred @ ReportAction.endorsement(): "+e);
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	private void mapErrors(List<Errors> err) {
		try {
			for(Errors er: err) {
				addActionError(er.getMessage());
			}
		}catch(Exception e) {
			addActionError(defaultError);
			logger.info("Exception @ QuotationAction.mapErrors(): "+e);
			e.printStackTrace();
		}
		
	}

	private void mapEndorsementOutput(EndorsementOutputModel eom) {
		try {
			if(eom.getErrors()!=null && eom.getErrors().size()>0) {
				mapErrors(eom.getErrors());
			}
				if(!hasActionErrors()) {
					EndorsementSave es = eom.getEndorsementInsertResponse();
					setQuoteNo(es.getQuoteNo()==null?"":es.getQuoteNo());
					setPolicyNo(es.getPolicyNo()==null?"":es.getPolicyNo());
					setApplicationNo(es.getReferenceNo()==null?"":es.getReferenceNo());
					setReferenceNo(es.getReferenceNo()==null?"":es.getReferenceNo());
				}
			
		}catch(Exception e) {
			addActionError(defaultError);
			logger.info("Exception Occurred @ ReportAction.mapEndorsementOutput(): "+e);
			e.printStackTrace();
		}
	}
	private EndorsementInputModel mapEndorsementInput() {
		EndorsementInputModel eim = new EndorsementInputModel();
		List<EndorsementTypeModel>edt=new ArrayList<EndorsementTypeModel>();
		try {
			eim.setApplicationId(StringUtils.isBlank(issuer)?"1":issuer);
			eim.setCancelRemarks(cancelRemarks==null?"":cancelRemarks);
			eim.setCancelYN(cancelYN==null?"":cancelYN);
			if(!CollectionUtils.isEmpty(endType)) {
				for(int i=0;i<endType.size();i++) {
					EndorsementTypeModel ety=new EndorsementTypeModel();
					ety.setEndtType(endType.get(i)==null?"":endType.get(i).toString());
					edt.add(ety);
				}
				
			}
			eim.setEndorsementInfo(edt);
			eim.setEndtRemarks(endtRemarks==null?"":endtRemarks);
			eim.setLoginId(loginId==null?"":loginId);
			eim.setLoginUserType(loginUserType==null?"":loginUserType);
			eim.setOpenCoverNo(openCoverNo==null?"":openCoverNo);
			eim.setPolicyNo(policyNo==null?"":policyNo);
			eim.setProductId(productId==null?"":productId);
			eim.setQuoteNo(quoteNo==null?"":quoteNo);
			eim.setEffectiveDate(effectiveDate==null?"":effectiveDate);
		}catch(Exception e) {
			logger.info("Exception Occurred @ ReportAction.mapEndorsementInput(): "+e);
			e.printStackTrace();
		}
		return eim;
	}
	public String document(){
		try {
			String filePath1 = getText("ENDT_SCHEDULE_PATH")+"/"+policyNo.replaceAll("/", "-")+"-Endt.pdf";
			String filePath=this.request.getSession().getServletContext().getRealPath(filePath1);
			//String fontPath = request.getSession().getServletContext().getRealPath("/" + getText("SCHEDULE_FONT_PATH"));
			String url=request.getSession().getServletContext().getRealPath("/"+ getText("IMAGE_PATH"));
			File file=new File(filePath);
			if(!file.exists()){
				/*List<Map<String, Object>> list=service.getEndtPolicyInfo(branchCode, policyNo);
				DocGenerator.writeDebitPDF(fontPath, policyNo, filePath, url, StringUtils.defaultIfEmpty((String)session.get("userLoginMode"), ""), list, CollectionUtils.arrayToList(endTypeId.split(",")), applicationNo, branchCode,belongingBranch);*/
				MarineJasperReport jr=new MarineJasperReport(session); 
				jr.certificateEndt(policyNo, applicationNo, branchCode, belongingBranch, filePath);
			}
			session.put("pdfFilePath",filePath1);
			//inputStream=new FileInputStream(file);
		} catch (Exception e) {
			//inputStream=new ByteArrayInputStream("File Not Found".getBytes());
			logger.debug(e);
		}
		//return "stream";
		return "redirectPDFReport";
	}
	
	public String receipt() {
		try {
			fileName = "/receiptPdf/" + quoteNo + ".pdf";
			String filePath = CommonService.getApplicationPath() + fileName;
			if(!new File(filePath).exists()) {
				JasperReport jr=new MotorJasperReport(session);
				Object []param={quoteNo, branchCode, filePath};
				jr.otherSchedule("receipt", param);
			}
			File file=new File(filePath);
			if(file.exists()){
				inputStream=new FileInputStream(file);
				this.fileName = fileName;
				return "streamPDF";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "viewPDF";	
	}
	
	public String motorFleetSchedule() {
		try {
			fileName = "/fleetSchedule/" + quoteNo + "_" + vehicleId + ".pdf";
			String filePath = CommonService.getApplicationPath() + fileName;
			if(!new File(filePath).exists()) {
				JasperReport jr=new MotorJasperReport(session);
				Object []param={quoteNo,branchCode,"",vehicleId,filePath};
				jr.otherSchedule("MotorFleetSchedule", param);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "viewPDF";	
	}
	
	public String lang() {
		return INPUT;
	}
	
	public List<ReportBean> gridRaja(List<ReportBean> list){
		List<ReportBean>selectedList =  new ArrayList<ReportBean>();
		try{
		    int to = (rows * page);
		    int from = to - rows;
		    records = list.size();
	        if(to > records)
	            to =records;
	        for(int i=from;i<to;i++){
	        	selectedList.add(list.get(i));
	        }
	       /* if (selectedList != null && sord!= null && sord.equalsIgnoreCase("asc")) {
		            Collections.sort(selectedList, null);
		    }
		    if (sord!= null && sord.equalsIgnoreCase("desc")) {
		            Collections.sort(selectedList, null);
		            Collections.reverse(selectedList);
		    }*/
		    total =(int) Math.ceil((double)records / (double)rows);
		}catch(Exception e){
			e.printStackTrace();
		}
		logger.info("hi selectedList===>"+selectedList.size());
		return selectedList;
	}
	
	public String getJson(){
		return SUCCESS;
	}
	
	public List<ReportBean> getGridReport(){
		logger.info("hi grid");
		logger.info("hi grid=>"+policyNo);
		List<ReportBean> policyList=new ArrayList<ReportBean>();
		List<Object> list=new ArrayList<Object>();
		
		if("PR".equals(menuType))
			list=service.getReportList(openCover.equalsIgnoreCase(productId)?loginId:userLoginId,productId,issuer,menuType,openCoverNo,policyStartDate,policyEndDate,quoteNo,policyNo,bean.getSearchBy(),bean.getSearchValue(), searchField, searchString, searchOper,branchCode,"",schemeId,vehicleId);					
		else if(StringUtils.isNotEmpty(bean.getSearchBy())&& StringUtils.isBlank(reqFrm))
			list=service.getReportList(loginId,productId,issuer,menuType,openCoverNo,policyStartDate,policyEndDate,quoteNo,policyNo,bean.getSearchBy(),bean.getSearchValue(),searchField, searchString, searchOper,branchCode,"",schemeId,vehicleId);
		else if(StringUtils.isNotEmpty(loginId)||StringUtils.isNotEmpty(userLoginId))
			list=service.getReportList(userLoginId==null?loginId:userLoginId,productId,issuer,menuType,openCoverNo,policyStartDate,policyEndDate,quoteNo,policyNo,bean.getSearchBy(),bean.getSearchValue(), searchField, searchString, searchOper,branchCode,"",schemeId,vehicleId);
		if(list!=null && list.size()>0){
			for(int i=0; i<list.size(); i++){
				Map map =(Map)list.get(i);
				ReportBean ra=new ReportBean();
				ra.setGapplicationNo(map.get("ApplicationNo")==null?"":map.get("ApplicationNo").toString());
				ra.setGquoteNo(map.get("QuoteNo")==null?"":map.get("QuoteNo").toString());
				ra.setGcustomerId(map.get("CustomerId")==null?"":map.get("CustomerId").toString());
				ra.setGquoteDate(map.get("QuotationDate")==null?"":map.get("QuotationDate").toString());
				ra.setGvalidityDate(map.get("ValidityDate")==null?"":map.get("ValidityDate").toString());
				ra.setGcustName (map.get("CustomerName")==null?"":map.get("CustomerName").toString());
				ra.setGloginId(map.get("LoginId")==null?"":map.get("LoginId").toString());
				ra.setgPolInsDate(map.get("InceptionDate")==null?"":map.get("InceptionDate").toString());
				ra.setGpremium(map.get("Premium")==null?"":map.get("Premium").toString());
				ra.setGbasePremium(map.get("BASE_PREMIUM")==null?"":map.get("BASE_PREMIUM").toString());
				ra.setGedit((map.get("ApplicationNo")==null?"":map.get("ApplicationNo").toString())+","+(map.get("QuoteNo")==null?"":map.get("QuoteNo").toString())+
						",'"+menuType+"','"+(map.get("CustomerId")==null?"":map.get("CustomerId").toString())+"','" + (map.get("CONTENT_TYPE_ID")==null?"":map.get("CONTENT_TYPE_ID").toString()) + "'"
						);
				if("RR".equalsIgnoreCase(menuType)) {
					ra.setGlapsedRemark(map.get("AdminRemarks")==null?"":map.get("AdminRemarks").toString());
				}
				else {
					ra.setGlapsedRemark(map.get("LapsedRemarks")==null?"":map.get("LapsedRemarks").toString());
				}
				ra.setGlapsedDate(map.get("LapsedDate")==null?"":map.get("LapsedDate").toString());
				ra.setGvalidityPeriod(map.get("ValidityPeriod")==null?"":map.get("ValidityPeriod").toString());
				ra.setGstatus(map.get("Status")==null?"":map.get("Status").toString());
				ra.setGpolicyNo(map.get("PolicyNo")==null?"":map.get("PolicyNo").toString());
				ra.setGbrokerName(map.get("BrokerName")==null?"":map.get("BrokerName").toString());
				ra.setGoverAllPremium(map.get("OVERALL_PREMIUM")==null?"":map.get("OVERALL_PREMIUM").toString());
				ra.setGdebitNoteNo(map.get("DebitNoteNo")==null?"":map.get("DebitNoteNo").toString());
				ra.setGcreditNoteNo(map.get("CreditNoteNo")==null?"":map.get("CreditNoteNo").toString());
				ra.setGpolicyWording((map.get("PolicyNo")==null?"":map.get("PolicyNo").toString())
						+"&loginid="+ loginId);
				ra.setGtransactionId(map.get("TRANSACTION_ID")==null?"":map.get("TRANSACTION_ID").toString());
				ra.setGtransactionId1(map.get("TRANSACTION_ID")==null?"":map.get("TRANSACTION_ID").toString());
				ra.setGinvalidRecords(map.get("INVALID_RECORDS")==null?"":map.get("INVALID_RECORDS").toString());
				ra.setGvalidRecords(map.get("VALID_RECORDS")==null?"":map.get("VALID_RECORDS").toString());
				ra.setGocCustName(map.get("OPENCOVER_CUST_NAME")==null?"":map.get("OPENCOVER_CUST_NAME").toString());
				ra.setGfirstName(map.get("FirstName")==null?"":map.get("FirstName").toString());
				ra.setGaddress(map.get("Address")==null?"":map.get("Address").toString());
				ra.setGcustomerCivilId(map.get("CUSTOMER_SOURCE")==null?"":map.get("CUSTOMER_SOURCE").toString());
				ra.setGemail(map.get("Email")==null?"":map.get("Email").toString());
				ra.setGintgError(map.get("IntegrationError")==null?"":map.get("IntegrationError").toString());
				/*if(StringUtils.isNotBlank(ra.getGemail()))
					ra.setGemailSent(((map.get("ApplicationNo")==null?"":map.get("ApplicationNo").toString())+",'MAIL',"+(map.get("QuoteNo")==null?"":map.get("QuoteNo").toString())));
				else
					ra.setGemailSent("");*/
				ra.setGemailSent(((map.get("ApplicationNo")==null?"":map.get("ApplicationNo").toString())+",'QUOTEMAIL',"+(map.get("QuoteNo")==null?"":map.get("QuoteNo").toString())));
				ra.setGmobile(map.get("Mobile")==null?"":map.get("Mobile").toString());
				ra.setGstatus(map.get("Status")==null?"":map.get("Status").toString());
				ra.setGrefSatus(map.get("ReferralStatus")==null?"":map.get("ReferralStatus").toString());
				ra.setGreject(((map.get("ApplicationNo")==null?"":map.get("ApplicationNo").toString())+",'LAPSED',"+(map.get("QuoteNo")==null?"":map.get("QuoteNo").toString())));
				ra.setGreject1(("'','LAPSED',"+(map.get("QuoteNo")==null?"":map.get("QuoteNo").toString())));
				//if("P".equals(ra.getGstatus())) {
					ra.setGschedule(((map.get("PolicyNo")==null?"":map.get("PolicyNo").toString())+"&loginid="+(map.get("LoginId")==null?"":map.get("LoginId").toString())));
				//}
					
				if("P".equals(ra.getGstatus()) ) {
					ra.setGattach(((map.get("VEHICLE_ID")==null?"":map.get("VEHICLE_ID").toString())+"','"+(map.get("ApplicationNo")==null?"":map.get("ApplicationNo").toString())+"','"+(map.get("QuoteNo")==null?"":map.get("QuoteNo").toString())+"','portfolio"));
				}else{
					ra.setGattach(((map.get("VEHICLE_ID")==null?"":map.get("VEHICLE_ID").toString())+"','"+(map.get("ApplicationNo")==null?"":map.get("ApplicationNo").toString())+"','"+(map.get("QuoteNo")==null?"":map.get("QuoteNo").toString())+"','quoteProcess"));
				}
				if("33".equalsIgnoreCase(productId))
					ra.setGendorse(("'ET',"+(map.get("QuoteNo")==null?"":map.get("QuoteNo").toString())+",'"+(map.get("PolicyNo")==null?"":map.get("PolicyNo").toString())+"','"+(map.get("CustomerName")==null?"":map.get("CustomerName").toString())+"','"+(map.get("BrokerName")==null?"":map.get("BrokerName").toString())+ "','" + (map.get("LoginId")==null?"":map.get("LoginId").toString()) + "',''"));
				else 
					ra.setGendorse(("'E',"+(map.get("QuoteNo")==null?"":map.get("QuoteNo").toString())+",'"+(map.get("PolicyNo")==null?"":map.get("PolicyNo").toString())+"','"+(map.get("CustomerName")==null?"":map.get("CustomerName").toString())+"','"+(map.get("BrokerName")==null?"":map.get("BrokerName").toString())+ "','" + (map.get("LoginId")==null?"":map.get("LoginId").toString()) + "',''"));
				ra.setGlcupload(("'"+(map.get("PolicyNo")==null?"":map.get("PolicyNo").toString())+"'"));
				
				ra.setGactive(("'','ACTIVE',"+(map.get("QuoteNo")==null?"":map.get("QuoteNo").toString())));
				ra.setGdeactive(("'','LAPSED',"+(map.get("QuoteNo")==null?"":map.get("QuoteNo").toString())));
				ra.setGview("'"+(map.get("ApplicationNo")==null?"":map.get("ApplicationNo").toString())+"',"+(map.get("QuoteNo")==null?"":map.get("QuoteNo").toString())+",'"+productId+"'");
				ra.setGprint1(("'PdfSummary_Draft.Travel?quoteNo="+(map.get("QuoteNo")==null?"":map.get("QuoteNo").toString())+"'"));
				ra.setGtotalCert("<a type='button' name='count'  href='javascript:void(0);' onclick='declaration(&#39;"+(map.get("PolicyNo")==null?"":map.get("PolicyNo").toString())+"&#39;)'>"+(map.get("POLICY_COUNT")==null?"":map.get("POLICY_COUNT").toString())+"</a>");
				
				if(StringUtils.isNotBlank(ra.getGdebitNoteNo())){
					ra.setGdebit(((map.get("PolicyNo")==null?"":map.get("PolicyNo").toString())+"&loginid="+(map.get("LoginId")==null?"":map.get("LoginId").toString())));
					ra.setGdebit1(map.get("QuoteNo")==null?"":map.get("QuoteNo").toString());
				}else{
					ra.setGdebit("");
					ra.setGdebit1("");
				}
				ra.setGreceipt(map.get("RECEIPT_NO")==null?"":map.get("RECEIPT_NO").toString());
				if(StringUtils.isNotBlank(ra.getGcreditNoteNo()))
					ra.setGcredit(map.get("PolicyNo")==null?"":map.get("PolicyNo").toString());
				else
					ra.setGcredit("");
				
				ra.setGendtStatus(map.get("EndtStatus")==null?"":map.get("EndtStatus").toString());
				ra.setGendtType(map.get("EndtType")==null?"":map.get("EndtType").toString());
				ra.setGrefStatus(map.get("ReferralStatus")==null?"":map.get("ReferralStatus").toString());
				
				if("3".equals(productId) || "11".equals(productId) ){
					String crdr="Y".equalsIgnoreCase(getCreditNoteStatus())?getCreditNoteStatus():Double.parseDouble(StringUtils.isBlank(ra.getGpremium())?"0":ra.getGpremium())>0?"CR":"DR";
					ra.setGendtcrdrStatus(crdr);
				}else{
					ra.setGendtcrdrStatus("Y");
				}
				
				String str=request.getContextPath();
				//if(issuer !=null && issuer.length() > 0){
					//if("E".equals(ra.getGstatus()) && "Y".equals(ra.getGendtStatus())){
					if("E".equals(ra.getGstatus()) && "Y".equals(ra.getGendtStatus()) && !"user".equalsIgnoreCase(userType)){
						ra.setGendtSchedule("<a href='#' type='button' class='btn btn-sm btn-warning' onclick=endorsementType(&#39;ET&#39;,&#39;P&#39;,&#39;"+ra.getGendtType()+"&#39;,&#39;"+ra.getGquoteNo()+"&#39;,&#39;"+ra.getGrefSatus()+"&#39;,&#39;"+ra.getGapplicationNo()+"&#39;)> <i class='glyphicon glyphicon-pencil'> </i> </a>");
						//endtStatus="Y";
					}else if("P".equals(ra.getGstatus()) && "Y".equals(ra.getGendtStatus())){
						ra.setGendtSchedule("<a href='#' type='button' class='btn btn-sm btn-warning' onclick=popUp(&#39;"+str+"/documentpdfReport.action?docType=EndtSchedule&policyNo="+(map.get("PolicyNo")==null?"":map.get("PolicyNo").toString())+"&applicationNo="+ra.getGapplicationNo()+"&endTypeId="+ra.getGendtType()+"&#39;,&#39;1000&#39;,&#39;500&#39;)><i class='glyphicon glyphicon-book'> </i></a>");
						//endtStatus="N";
						quoteNo=ra.getGquoteNo();
						applicationNo=ra.getGapplicationNo();
					}else if("C".equals(ra.getGstatus()) && "Y".equals(ra.getGendtStatus())){
						ra.setGendtSchedule("<a href='#' type='button' class='btn btn-sm btn-warning' onclick=popUp(&#39;"+str+"/documentpdfReport.action?docType=EndtSchedule&policyNo="+(map.get("PolicyNo")==null?"":map.get("PolicyNo").toString())+"&applicationNo="+ra.getGapplicationNo()+"&endTypeId="+ra.getGendtType()+"&#39;,&#39;1000&#39;,&#39;500&#39;)><i class='glyphicon glyphicon-book'> </i></a>");
						//endtStatus="Y";
						quoteNo=ra.getGquoteNo();
						applicationNo=ra.getGapplicationNo();
					}else if("P".equals(ra.getGstatus()) || "C".equals(ra.getGstatus()) || "D".equals(ra.getGstatus()))
						ra.setGendtSchedule("<a href='#' type='button' class='btn btn-sm btn-warning' onclick=popUp(&#39;"+str+"/documentpdfReport.action?docType=EndtSchedule&policyNo="+(map.get("PolicyNo")==null?"":map.get("PolicyNo").toString())+"&applicationNo="+ra.getGapplicationNo()+"&endTypeId="+ra.getGendtType()+"&#39;,&#39;1000&#39;,&#39;500&#39;)><i class='glyphicon glyphicon-book'> </i></a>");
					 
					ra.setGlc_date(map.get("LcDate")==null?"":map.get("LcDate").toString());
					ra.setGlc_number(map.get("LcNumber")==null?"":map.get("LcNumber").toString());
					ra.setGbl_awb_date(map.get("BlAwbDate")==null?"":map.get("BlAwbDate").toString());
					ra.setGbl_awb_no(map.get("BlAwbNo")==null?"":map.get("BlAwbNo").toString());
					ra.setGgood_desc(map.get("GoodsDescription")==null?"":map.get("GoodsDescription").toString());
					ra.setGuserName(map.get("Username")==null?"":map.get("Username").toString());
				
					if("65".equalsIgnoreCase(productId))
						ra.setIsselectedCover(map.get("ISSELECTCOVER")==null?"":map.get("ISSELECTCOVER").toString());
					else
						ra.setIsselectedCover("");
				policyList.add(ra);
			}
		}
		//return gridRaja(policyList);
		return policyList;
	}
	
	public String customerInfo(){
		return "customerInfo";
	}
	
	public String report()throws IOException
	{
		fileName = "PolicyReport";
		//bean.setStarDate(dateFormat(policyStartDate));
		//bean.setEndDate(dateFormat(policyEndDate));
		this.loginId=userLoginId;		
		String filePath ="";
		openCoverNo=(String)session.get("openCoverNo")==null?"":(String)session.get("openCoverNo");
		/*if("33".equalsIgnoreCase(productId) || "65".equalsIgnoreCase(productId)){
			filePath = request.getSession().getServletContext().getRealPath("/"+"/Jasper/travel/mssql/"+fileName+".jasper");
			TravelJasperReport jasperReports = new TravelJasperReport(session);
			ByteArrayOutputStream bos=new ByteArrayOutputStream();
			//jasperReports.export(dateFormat(policyStartDate),dateFormat(policyEndDate),"ALL".equalsIgnoreCase(userLoginId)?loginId:userLoginId,filePath,bos,fileName,downloadType,loginId,StringUtils.isBlank(issuer)?"broker":"RSAIssuer"); 
			inputStream=new ByteArrayInputStream(bos.toByteArray());
		}else if("11".equalsIgnoreCase(productId)){
			filePath = request.getSession().getServletContext().getRealPath("/"+"/Jasper/marine/mssql/"+fileName+".jasper");
			MarineJasperReport jasperReports=new MarineJasperReport(session);
			ByteArrayOutputStream bos=new ByteArrayOutputStream();
			jasperReports.export(dateFormat(policyStartDate),dateFormat(policyEndDate),StringUtils.isBlank(issuer)?"1":issuer,filePath,bos,fileName,downloadType,StringUtils.isBlank(issuer)?loginId:issuer,StringUtils.isBlank(issuer)?"broker":"RSAIssuer",StringUtils.isBlank(openCoverNo)?"":getOriginalPolicyNo()); 
			inputStream=new ByteArrayInputStream(bos.toByteArray());
		}
		else{
			filePath = request.getSession().getServletContext().getRealPath("/"+"/Jasper/"+fileName+".jasper");
			MarineJasperReport jasperReports=new MarineJasperReport(session);
			ByteArrayOutputStream bos=new ByteArrayOutputStream();
			jasperReports.export(dateFormat(policyStartDate),dateFormat(policyEndDate),StringUtils.isBlank(issuer)?"1":issuer,filePath,bos,fileName,downloadType,loginId,StringUtils.isBlank(issuer)?"broker":"RSAIssuer",StringUtils.isBlank(openCoverNo)?"":getOriginalPolicyNo()); 
			inputStream=new ByteArrayInputStream(bos.toByteArray());
		}*/
		filePath=service.PolicyReportdownload(dateFormat(policyStartDate),dateFormat(policyEndDate),StringUtils.isBlank(issuer)?"1":issuer,downloadType,loginId,openCoverNo,branchCode,productId);	
		inputStream=new FileInputStream(filePath);
				  	

		if("excel".equals(downloadType))
		{
			return "excel";
		}
		if("pdf".equals(downloadType))
		{
			return "pdf";
		}
		return "download";
	}
	
	public String clausespdf() {
		try {
			session.put("pdfFilePath","/clauses/"+fileName);
		}
		catch(Exception ex) {
			logger.debug("Exception @ clausespdf() { " + ex + " } ");
		}
		return "redirectPDFReport";
	}
	public String pdf() {
		return "redirectviewPDF";
	}
	public String viewpdf() {
		String forward = "pdfReport";
		try {
			//inputStream = IOUtils.toInputStream("");
			this.fileName = "pdfReport.pdf";
			String fileName = (String)session.get("pdfFilePath");
			//session.remove("pdfFilePath");
			if(StringUtils.isNotBlank(fileName)) {
				String filePath = this.request.getSession().getServletContext().getRealPath(fileName);
				File file=new File(filePath);
				if(file.exists()){
					inputStream=new FileInputStream(file);
					this.fileName = fileName;
					forward = "streamPDF";
					//forward = "viewPDF";
				}
			}
		}
		catch(Exception exception) {
			logger.debug(exception);
		}
		return forward;
	}
	
	private String dateFormat(String name) {
		String arr[]=name.split("/");
		return arr[1]+"/"+arr[0]+"/"+arr[2];
	}
	public String getDownloadType() {
		return downloadType;
	}
	public void setDownloadType(String downloadType) {
		this.downloadType = downloadType;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	private List<File> upload = new ArrayList<File>();
	private List<String> uploadFileName = new ArrayList<String>();
	private List<String> uploadContentType = new ArrayList<String>();
	private List<String> lcdocremarks = new ArrayList<String>();
	private String uploadId;
	private String downloadFileName;
	
	public String getUploadId() {
		return uploadId;
	}
	public void setUploadId(String uploadId) {
		this.uploadId = uploadId;
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
	
	public List<String> getLcdocremarks() {
		return lcdocremarks;
	}
	public void setLcdocremarks(List<String> lcdocremarks) {
		this.lcdocremarks = lcdocremarks;
	}
	public void setLcFileName(String lcFileName) {
		this.lcFileName = lcFileName;
	}
	public String getLcFileName() {
		return lcFileName;
	}
	public void setUploadContentType(List<String> uploadContentType) {
		this.uploadContentType = uploadContentType;
	}
	public List<String> getUploadContentType() {
		return uploadContentType;
	}
	public List<Object> getLcFileList() {
		return service.getLcFileList(policyNo);
	}
	public void setDownloadFileName(String downloadFileName) {
		this.downloadFileName = downloadFileName;
	}
	public String getDownloadFileName() {
		return downloadFileName;
	}
	private String bankName;
	private String lcNo;
	private List lcUploadDetails;
	private List lcUploadPolicy;
	private List lcUploadPloDtls;
	private List allDocumentsList;
	public String lcUpload() {
		lcUploadDetails = service.getLcUploadDetails(policyNo);
		lcUploadPolicy = service.getLcUploadPolicy(policyNo);
		lcUploadPloDtls = service.getLcUploadPloDtls(policyNo);
		return "lcUpload";
	}

	public String lcFileUpload(){
		 try {
			 String polNo=policyNo.replaceAll("/","-")+"_";
			/*String lcFilePath = getText("LC_FILE_UPLOAD_PATH")+"/"+polNo;*/
			 String lcFilePath = request.getSession().getServletContext().getRealPath("/"+"/uploadfile")+"/"+polNo;
			System.out.println("uploadFileName:"+uploadFileName.size());
			File fileToCreate = new File(lcFilePath);
			
			
			if(upload.isEmpty()){
				addActionError(getText("Please Attach The File"));
				lcdocremarks.remove("");
			}/*else if(!("image/jpeg".equals(mimeType) || "application/pdf".equals(mimeType))) {
		    	addActionError(getText("Please Attach Jpeg /PDF files Allowed "));
				lcdocremarks.remove("");
		    }*/else{
				service.insertLcFileDtls(policyNo,loginId=(String)session.get("user"),uploadFileName,fileToCreate,lcdocremarks,lcFilePath,upload);
				getLcdocremarks().clear();
			}
			lcUploadDetails = service.getLcUploadDetails(policyNo);
			lcUploadPolicy = service.getLcUploadPolicy(policyNo);
			lcUploadPloDtls = service.getLcUploadPloDtls(policyNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
			return "lcUpload";
	}
	public String deleteLcFile(){
		try{
			File deleteFile = new File(request.getSession().getServletContext().getRealPath("/"+"/uploadfile")+"/"+lcFileName);
			FileUtils.deleteQuietly(deleteFile);
			service.deleteLcFile(policyNo,uploadId);
			lcUploadDetails = service.getLcUploadDetails(policyNo);
			lcUploadPolicy = service.getLcUploadPolicy(policyNo);
			lcUploadPloDtls = service.getLcUploadPloDtls(policyNo);
			getLcdocremarks().clear();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "lcUpload";
	}
	public String downloadLcFile(){
		String downloadFile = request.getSession().getServletContext().getRealPath("/"+"/uploadfile")+"/"+lcFileName;
		try {
			inputStream = new FileInputStream(downloadFile);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
		return "lcdownload";
	}
	public String viewDocument(){
		allDocumentsList = service.getAllDocuments(policyNo);
		return "viewdocuments";
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getBankName() {
		return bankName;
	}
	public void setLcNo(String lcNo) {
		this.lcNo = lcNo;
	}
	public String getLcNo() {
		return lcNo;
	}
	public void setLcUploadDetails(List lcUploadDetails) {
		this.lcUploadDetails = lcUploadDetails;
	}
	public List getLcUploadDetails() {
		return lcUploadDetails;
	}
	public void setLcUploadPolicy(List lcUploadPolicy) {
		this.lcUploadPolicy = lcUploadPolicy;
	}
	public List getLcUploadPolicy() {
		return lcUploadPolicy;
	}
	public void setLcUploadPloDtls(List lcUploadPloDtls) {
		this.lcUploadPloDtls = lcUploadPloDtls;
	}
	public List getLcUploadPloDtls() {
		return lcUploadPloDtls;
	}
	public void setAllDocumentsList(List allDocumentsList) {
		this.allDocumentsList = allDocumentsList;
	}
	public List getAllDocumentsList() {
		return allDocumentsList;
	}
	public String getCreditNoteStatus(){
		if("User".equalsIgnoreCase(loginUserType)) {
			return premium.getCreditNoteStatus(adminLoginId,productId);
		}
		else {
			return "Y";
		}
	}
	public String getQuoteMailIds() {
		return quoteMailIds;
	}
	public void setQuoteMailIds(String quoteMailIds) {
		this.quoteMailIds = quoteMailIds;
	}
	public String getReqFrom() {
		return reqFrom;
	}
	public void setReqFrom(String reqFrom) {
		this.reqFrom = reqFrom;
	}
	public String getEndtLoginId() {
		return endtLoginId;
	}
	public void setEndtLoginId(String endtLoginId) {
		this.endtLoginId = endtLoginId;
	}
	
	//Motor Vehicle List
	/*@JSON(serialize=false)
	public List<Map<String,Object>> getMultiVehicleDetails() {
		return new com.maan.Motor.Services.MotorService().getMultiVehicleDetails(new com.maan.common.dao.CommonDAO().getHomeApplicationNo(policyNo), productId, branchCode);
	}*/
	public String getVehicleId() {
		return vehicleId;
	}
	public void setVehicleId(String vehicleId) {
		this.vehicleId = vehicleId;
	}
	public String bailBond(){
		fileName ="/bailBond/" + quoteNo +"_"+vehicleId+".pdf";
		String filePath = CommonService.getApplicationPath() + getFileName();
		if(!new File(filePath).exists()) {
			MotorJasperReport jr=new MotorJasperReport(session);
			Object []param={quoteNo, branchCode, filePath,vehicleId};
			jr.otherSchedule("bailBond", param);
		}
		return "viewPDF";	
	}
	
	public String proposalForm(){
		fileName ="/proposalForm/"+quoteNo+".pdf";
		String filePath = CommonService.getApplicationPath() + getFileName();
		//if(!new File(filePath).exists()) {
			MotorJasperReport jr=new MotorJasperReport(session);
			Object []param={quoteNo, branchCode, filePath,productId};
			jr.otherSchedule("proposalForm", param);
		//}
		return "viewPDF";	
	}
	
	public String policyWording(){
		if("65".equals(productId))
			fileName ="/PolicyWord/" +"PolicyWordings.pdf";
		else
			fileName = "/TravelPDFFile/PolicyWording/Travel_Policy.pdf";
		
		String filePath = CommonService.getApplicationPath() + getFileName();
		return "viewPDF";
	}
	
	public String bulkPrint(){
		bean.setMode1("");
		if("3".equalsIgnoreCase(productId)){
		return "bulkPrint";
		}else{
			bean.setMenuBlocker("bulkreport");
			return "bulkPrintOP";
		}
	}
	
	public String bulkPrintOPList() {
		validateDate();
		if (!hasActionErrors()) {
			service.getBulkPrinkList(bean, branchCode, adminLoginId, productId);
			bean.setMode1("count");
		} else {
			bean.setMode1("");
		}
		if ("3".equalsIgnoreCase(productId)) {
			return "bulkPrint";
		} else {
			bean.setMenuBlocker("bulkreport");
			return "bulkPrintOP";
		}
	}

public String bulkPrintBRList(){
	if("brppschedule".equalsIgnoreCase(bean.getReqFrom())){
		bean.setBulkPrintBRList(service.getBulkPrintOPList(bean,productId,"BBDL","ALL",branchCode,"1",bean.getBrloginId()));
	}else{
		bean.setBulkPrintBRList(service.getBulkPrintOPList(bean,productId,"BBDL","ALL",branchCode,bean.getAppId(),""));
	}
	if(!StringUtils.isEmpty(bean.getAppId())){
		bean.setUserName(service.getOPUserName(bean.getAppId()));
	}else{
		bean.setUserName(service.getOPUserName(bean.getBrloginId()));
	}
		bean.setMode1("broker");
		if("3".equalsIgnoreCase(productId)){
			return "bulkPrint";
			}else{
				bean.setMenuBlocker("bulkreport");
				return "bulkPrintOP";
			}
	}

private void validateDate(){
	long date = diffInDays(bean.getEndDate(),bean.getStartDate());
		if (StringUtils.isEmpty(bean.getStartDate())){
			addActionError(getText("error.start.date"));
		}else if (StringUtils.isEmpty(bean.getEndDate())){
			addActionError(getText("error.end.date"));
		}else if (date > 0){
			 addActionError(getText("error.diff.date"));
		 }
	}
public long diffInDays(String startDate,String endDate){
	long result=0;
	if(!StringUtils.isEmpty(startDate)&& !StringUtils.isEmpty(endDate)){
	try{
		Date date = new Date();
        Calendar cal1 = Calendar.getInstance();
        Calendar cal2 = Calendar.getInstance();
        SimpleDateFormat sfd = new SimpleDateFormat("dd/MM/yyyy");
        cal1.setTime(sfd.parse(startDate));
        if(StringUtils.isBlank(endDate))
        	cal2.setTime(sfd.parse(sfd.format(date)));
        else
        cal2.setTime(sfd.parse(endDate));
        long milis1 = cal1.getTimeInMillis();
        long milis2 = cal2.getTimeInMillis();
        long diff = milis2 - milis1;
        result = diff / (24 * 60 * 60 * 1000);
	}catch (Exception e) {
		logger.debug("Exception Occured @ "+e);
		e.printStackTrace();
	}
	}
	
	return result;
}
	public ReportBean getModel() {
		return bean;
	}
	public String Vehicleschedule(){
		String basePath=CommonService.getApplicationPath();
		String downloadPath = basePath + "downloadFiles/branchReports/"; 
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy h.mm.ss a");
		MarineJasperReport jr = new MarineJasperReport(session);
		final Calendar cal = Calendar.getInstance();
		String date = sdf.format(cal.getTime());
		String filePath = downloadPath + "Vechicle"+bean.getReqFrom() + date + ".pdf";
		
		if("schedule".equalsIgnoreCase(bean.getReqFrom())){
			jr.opencoverMarineVehicle(policyNo, "", "Y", "", filePath);
		}else if("debit".equalsIgnoreCase(bean.getReqFrom())){
			jr.debitNote(policyNo, date, filePath, "", "", "", "Y");
		}else {
			jr.creditNote(policyNo, date, filePath, "", "", "", "Y");
		}
		try {
		 	if(StringUtils.isNotBlank(filePath)) {				 
				File file=new File(filePath);
				if(file.exists()){
					inputStream=new FileInputStream(file);
					this.fileName ="Vechicle"+bean.getReqFrom() + date + ".pdf";					 
				}
			}
		}
		catch(Exception exception) {
			logger.debug(exception);
		}
		return "pdf"; 
	}
	public String schedule(){
		
		String basePath=CommonService.getApplicationPath();
		String downloadPath = basePath + "downloadFiles/branchReports/";
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy h.mm.ss a");
		final Calendar cal = Calendar.getInstance();
		String date = sdf.format(cal.getTime());
		String filePath = downloadPath + "schedule" + date + ".pdf";
		String viewPath = "/downloadFiles/branchReports/schedule" + date + ".pdf";
		//pvType, Pvstartdate, PvOpencoverNo, Pvusertype, branchCode,ImageStatus, pvapplicationid, pvenddate, pvlogin, pvproduct
		MarineJasperReport jr = new MarineJasperReport(session);
		if("opschedule".equalsIgnoreCase(bean.getReqFrom())){
		jr.bulkPdfReport(bean.getMode(),bean.getStartDate(),"","ALL",branchCode,"N",bean.getAppId(),bean.getEndDate(),filePath,"",productId);
		}else if("brschedule".equalsIgnoreCase(bean.getReqFrom())){
			jr.bulkPdfReport(bean.getMode(),bean.getStartDate(),"","ALL",branchCode,"N","1",bean.getEndDate(),filePath,bean.getBrloginId(),productId);
		}else if("brppschedule".equalsIgnoreCase(bean.getReqFrom())){
			jr.bulkPdfReport(bean.getMode(),bean.getStartDate(),bean.getOpCoverNo(),"ALL",branchCode,"N","1",bean.getEndDate(),filePath,bean.getBrloginId(),productId);
		}else{
			jr.bulkPdfReport(bean.getMode(),bean.getStartDate(),bean.getOpCoverNo(),"ALL",branchCode,"N",bean.getAppId(),bean.getEndDate(),filePath,bean.getBrloginId(),productId);
		}
		try {
		 	if(StringUtils.isNotBlank(filePath)) {				 
				File file=new File(filePath);
				if(file.exists()){
					inputStream=new FileInputStream(file);
					this.fileName ="schedule" + date;					 
				}
			}
		}
		catch(Exception exception) {
			logger.debug(exception);
		}
		 return "pdf"; 
	}
	
	
	
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMobileNo() {
		return mobileNo;
	}
	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}
	public String getCompanyRegNo() {
		return companyRegNo;
	}
	public void setCompanyRegNo(String companyRegNo) {
		this.companyRegNo = companyRegNo;
	}
	public void setOtherPolicySearch(String otherPolicySearch) {
		this.otherPolicySearch = otherPolicySearch;
	}
	public String getOtherPolicySearch() {
		return otherPolicySearch;
	}
	public void setEndtView(String endtView) {
		this.endtView = endtView;
	}
	public String getEndtView() {
		return endtView;
	}
	public void setCurntAppNo(String curntAppNo) {
		this.curntAppNo = curntAppNo;
	}
	public String getCurntAppNo() {
		return curntAppNo;
	}
	public void setEndtRemarks(String endtRemarks) {
		this.endtRemarks = endtRemarks;
	}
	public String getEndtRemarks() {
		return endtRemarks;
	}
	public void setEffectiveDate(String effectiveDate) {
		this.effectiveDate = effectiveDate;
	}
	public String getEffectiveDate() {
		return effectiveDate;
	}
	/**
	 * @return the referenceNo
	 */
	public String getReferenceNo() {
		return referenceNo;
	}
	/**
	 * @param referenceNo the referenceNo to set
	 */
	public void setReferenceNo(String referenceNo) {
		this.referenceNo = referenceNo;
	}
	public String shipDetails() {
	if("search".equalsIgnoreCase(bean.getMode())) {
		service.getShipDetails(bean ,userType , loginId,issuer,"completed");
		service.getShipDetails(bean , userType, loginId,issuer,"pending");
		validation();
	}
	return "shipDetails";
	}
	public String shipTrackDetails() {
	if("search".equalsIgnoreCase(bean.getMode())) {	
	service.getShipTrackDetails(bean);
	validation();
	}
	return "shipDetails";
	}
	public void validation() {
		if(bean.getErrors()!=null && bean.getErrors().size()>0) {
			for (int i =0;i<bean.getErrors().size();i++) {
				HashMap<String, Object> map=bean.getErrors().get(i);
				addActionError(map.get("Message").toString());
			}
		}
	}
	public List<Object> getOpenCoverLapsedList(){
		return service.getOpenCoverLapsedList(bean,userType,adminLoginId,issuer);
	}
	public List<Object> getOpenCoverBrokerList(){
		return service.getOpenCoverBrokerList(bean,productId,adminLoginId,branchCode);
	}
	public List<Object> getOpenCoverMocCreatedList(){
		bean.setPolicyType("moc");
		return service.getOpenCoverCreatedList(bean,userType,adminLoginId,issuer,branchCode);
	}
	public List<Object> getOpenCoverMopCreatedList(){
		bean.setPolicyType("mop");
		return service.getOpenCoverCreatedList(bean,userType,adminLoginId,issuer,branchCode);
	}
	public List<Object> getOpenCoverLandCreatedList(){
		bean.setPolicyType("land");
		return service.getOpenCoverCreatedList(bean,userType,adminLoginId,issuer,branchCode);
	}
	public List<Object> getOpenCoverLandNonDepositCreatedList(){
		bean.setPolicyType("nondeposit");
		return service.getOpenCoverCreatedList(bean,userType,adminLoginId,issuer,branchCode);
	}
	public List<Object> getOpenCoverEndorseList(){
		return service.getOpenCoverEndorseList(bean,userType,adminLoginId,productId,branchCode);
	}
	public String viewOpenCover() {
		if(StringUtils.isNotBlank(bean.getSelectProd()))
		session.put("product_id","3".equals(bean.getSelectProd())?"3":"11");
		return "viewOpencover";
	}
	public List<Map<String,Object>>getTopBrokerList(){
		return service.dashboardTopBroker(productId,(String)session.get("user"),userType,(String)session.get("LoginBranchCode"));
	}
	public List<Map<String,Object>>getTopReferralsList(){
		return service.dashboardTopReferrals(productId,(String)session.get("user"),userType,(String)session.get("LoginBranchCode"));
	}
	public List<Map<String,Object>>getTopCustomerList(){
		return service.dashboardTopCustomer(productId,(String)session.get("user"),userType,(String)session.get("LoginBranchCode"));
	}
	public String documentpdf() {
		logger.info("Enter document "+bean.getDocType());
		String forward = "streamPDF";
		String filePath="",type="";
		this.quoteNo=new String( Base64.getDecoder().decode(quoteNo));
		bean.setDocType(new String( Base64.getDecoder().decode(bean.getDocType())));
		if(StringUtils.isNotBlank(policyNo))
		this.policyNo=new String( Base64.getDecoder().decode(policyNo));
		try {
			if("draft1".equals(bean.getDocType()) || "print".equals(bean.getDocType()) ) {
				type=quoteNo+bean.getDocType()+".pdf";
				 filePath=service.schedulePdf(quoteNo,branchCode);
			}else if("schedule".equals(bean.getDocType())) {
				type= quoteNo+bean.getDocType()+".pdf";
				 filePath=service.schedulePdf(quoteNo,branchCode);
			}else if("debit".equals(bean.getDocType()) || "credit".equals(bean.getDocType())) {
				type= policyNo+bean.getDocType()+".pdf";
				filePath=service.debitcreditpdf(policyNo,bean.getDocType());
			}else if("EndtSchedule".equals(bean.getDocType())) {
				type=policyNo+"EndtSchedule"+".pdf";
				 filePath=service.endtSchedule(applicationNo,branchCode,policyNo,belongingBranch==null?"01":belongingBranch);
			}else if("clauses".equals(bean.getDocType())) {
				type=policyNo+"clausesPdf"+".pdf";
				 filePath=service.clasuesPDF(quoteNo,belongingBranch==null?"01":belongingBranch);
			}else if("vehicle".equals(bean.getDocType())) {
				type=policyNo+"vehicleSchedule"+".pdf";
				 filePath=service.vehiclePDF(policyNo,belongingBranch==null?"01":belongingBranch);
			}else if("declare".equals(bean.getDocType())) {
				type=policyNo+"DecalarationSchedule"+".pdf";
				 filePath=service.declarePDF(policyNo,belongingBranch==null?"01":belongingBranch);
			}else if("portalPdf".equals(bean.getDocType()) || "draft".equals(bean.getDocType())) {
				type=quoteNo+"PortalSchedule"+".pdf";
				 filePath=service.portalPDF(quoteNo,branchCode);
			}
			logger.info("File Path==>"+filePath);
			if("schedule".equals(bean.getDocType())) {
				String newpath=request.getSession().getServletContext().getRealPath("/"+"/SchedulePdf")+"/"+type;
				FileUtils.copyURLToFile( new URL(filePath), new File(newpath) );
				filePath=newpath;
			}
				inputStream=(new FileInputStream(filePath));
				File file=new File(filePath);
				if(file.exists()){
					logger.info("File Available");
				}else {
					logger.info("File Not Available");
				}
				
				fileName=type;
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("Exit document "+bean.getDocType());
		return forward;
	}
}
