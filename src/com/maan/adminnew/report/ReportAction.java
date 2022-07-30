package com.maan.adminnew.report;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import com.maan.adminnew.common.CommonService;
import com.maan.common.LogUtil;
import com.maan.common.Validation;
import com.maan.common.dao.CommonDAO;

import com.maan.report.jasper.MarineJasperReport;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class ReportAction extends ActionSupport implements ModelDriven<ReportBean>
{
	final Logger logger = LogUtil.getLogger(ReportAction.class);
	private static final long serialVersionUID = 1L;
	private ReportBean bean = new ReportBean();
	Validation validation=new Validation();
	ReportService service=new ReportService();
	final CommonService cservice=new CommonService();
	Map<String, Object> session=ActionContext.getContext().getSession();
	HttpServletRequest request= ServletActionContext.getRequest();
	HttpServletResponse responce= ServletActionContext.getResponse();
	List<Object> transDetList=null;
	ServletContext context=request.getSession().getServletContext();
	String branchCode=(String)session.get("BranchCode");
	String belongingBranch = (String)session.get("BelongingBranch");
	String login_id=(String)session.get("user");
	String appId=(String)session.get("AppId");
	List<Object> branchName=new ArrayList<Object>();
	List<Object> policyList=new ArrayList<Object>();
	List<Map<String,String>> productList=new ArrayList<Map<String,String>>();
	List<Object> uwList=new ArrayList<Object>();
	List<Object> brokerList=new ArrayList<Object>();
	List<Object> lcsmartList=new ArrayList<Object>();
	List<Object> coverList=new ArrayList<Object>();
	List<Object> smartList=new ArrayList<Object>();
	List<Object> branchList=new ArrayList<Object>();
	List<Object> exchangeList=new ArrayList<Object>();
	List<Object> consigneeList=new ArrayList<Object>();
	List<Object> integratedList=new ArrayList<Object>();
	List<Object> productionList=new ArrayList<Object>();
	List<Object> paymentList=new ArrayList<Object>();
	//for link in opencoverReport
	private List<Object> certificateList=new ArrayList<Object>();
	private InputStream inputStream;
	private List<Map<String, Object>> uploadDocList;
	
	
	
	
	public List<Object> getProductionList() {
		return productionList;
	}
	public void setProductionList(List<Object> productionList) {
		this.productionList = productionList;
	}
	public List<Object> getPaymentList() {
		return paymentList;
	}
	public void setPaymentList(List<Object> paymentList) {
		this.paymentList = paymentList;
	}
	public List<Object> getExchangeList() {
		return exchangeList;
	}
	public void setExchangeList(List<Object> exchangeList) {
		this.exchangeList = exchangeList;
	}
	public List<Object> getBranchName() {
		return branchName;
	}
	public void setBranchName(List<Object> branchName) {
		this.branchName = branchName;
	}
	public List<Object> getBranchList() {
		return branchList;
	}
	public void setBranchList(List<Object> branchList) {
		this.branchList = branchList;
	}
	public void setCoverList(List<Object> coverList) {
		this.coverList = coverList;
	}
	public List<Object> getPolicyList() {
		return policyList;
	}
	public void setPolicyList(List<Object> policyList) {
		this.policyList = policyList;
	}
	public List<Map<String,String>> getProductList() {
		return productList;
	}
	public void setProductList(List<Map<String,String>> productList) {
		this.productList = productList;
	}
	public List<Object> getConsigneeList() {
		return consigneeList;
	}
	public void setConsigneeList(List<Object> consigneeList) {
		this.consigneeList = consigneeList;
	}
	public List <Object> getCountryList(){
    	return cservice.getCountries(branchCode);
    }
	public List<Object> getUwList() {
		return uwList;
	}
	public void setUwList(List<Object> uwList) {
		this.uwList = uwList;
	}
	public List<Object> getBrokerList() {
		return brokerList;
	}
	public void setBrokerList(List<Object> brokerList) {
		this.brokerList = brokerList;
	}
	public List<Object> getCommodityList(){
		return service.getCommodityList(belongingBranch);
	}
	public List<Object> getCoverList(){
		return coverList;
	}
	public List<Object> getTransportModeList(){
		return service.getTransportModeList(belongingBranch);
	}
	public List<Map<String, Object>> getOAROne(){
		bean.setMode("OverallCount");
		return service.getOAROne(bean, branchCode, "3");
	}
	public List<Map<String, Object>> getOAROpen(){
		bean.setMode("OverallCount");
		return service.getOAROpen(bean, branchCode, "11");
	}

	/*public String schedule(){
    	logger.info("schedule()===>Enter");
		String returnResult="schedule";
		scheduleMap=service.schedule(bean.getBroker());
    	logger.info("schedule()===>Exit");
		return returnResult;
	}*/
	
	public List<Object> getLcsmartList() {
		return lcsmartList;
	}
	public void setLcsmartList(List<Object> lcsmartList) {
		this.lcsmartList = lcsmartList;
	}
	public List<Object> getSmartList() {
		return smartList;
	}
	public void setSmartList(List<Object> smartList) {
		this.smartList = smartList;
	}
	public String policy(){
		uwList=service.getUwList(branchCode);
		productList=cservice.getProductsDET(branchCode,"");
		brokerList=cservice.getAdminBrokerList(branchCode, appId);
		return "policy";
	}
	
	public String lcSmart(){
		String returnResult="lcsmart";
		brokerList=cservice.getAdminBrokerList(branchCode, appId);
		if(bean.getReqFrom()!=null && bean.getBroker()!=null){
			bean.setBcode(branchCode);
			lcsmartList=service.getLcSmartList(bean);
			if(bean.getReqFrom()!=null && !"".equals(bean.getReqFrom()))
				returnResult="ajax";
			if("ajax".equals(bean.getFrom1()))
				returnResult="lcsmart";
		}return returnResult;
	}
	
	public String lcSmartJasper() {
		try {
			bean.setFileName("LCSmartReport");
			MarineJasperReport jr = new MarineJasperReport(session);
			String type = "";
			if("ocm.MISSIPPI_OPENCOVER_NO".equalsIgnoreCase(bean.getSearchBy())) {
				type = "OPENCOVER";
			}
			else if("oclm.LC_NUMBER".equalsIgnoreCase(bean.getSearchBy())) {
				type = "LCNUMBER";
			}
			ByteArrayOutputStream bos=new ByteArrayOutputStream();
			jr.LCSmartReport(bean.getBroker(), branchCode, type, bean.getSearchValue(), bean.getDownloadType(), bos);
			inputStream=new ByteArrayInputStream(bos.toByteArray());
		}
		catch(Exception exception) {
			logger.debug("Exception @ lcSmartJasper { " + exception + " } ");
		}
		if("excel".equals(bean.getDownloadType()))
		{
			return "excel";
		}
		if("pdf".equals(bean.getDownloadType()))
		{
			return "pdf";
		}
		return "download";
	}
	
	public String smart(){
		String returnResult="smart";
		brokerList=service.getAdminBrokerList(branchCode, appId);
		productList=cservice.getProductsDET(branchCode,"");
		coverList=service.getCoverList(branchCode);
		bean.setCountrySmartList(service.getCountrySmartList());
		if(StringUtils.isNotBlank(bean.getBroker()))
			bean.setBrokers(bean.getBroker().split(","));
		if(StringUtils.isNotBlank(bean.getRags()))
			bean.setRag(bean.getRags().split(","));
		if(StringUtils.isNotBlank(bean.getOrginCountry())){
			bean.setOrginCountry(bean.getOrginCountry().replaceAll(", ", ","));
			bean.setOrginCountry(bean.getOrginCountry().replaceAll(" ,", ","));
			bean.setOrginCountries(bean.getOrginCountry().split(","));
		}if(StringUtils.isNotBlank(bean.getDestCountry())){
			bean.setDestCountry(bean.getDestCountry().replaceAll(", ", ","));
			bean.setDestCountry(bean.getDestCountry().replaceAll(" ,", ","));
			bean.setDestCountries(bean.getDestCountry().split(","));
		}
		return returnResult;
	}
	
	public String getRePolicy(){
    	logger.info("policy()===>Enter");
		String returnResult="ajax";
    	if("reportBR".equals(bean.getMode1())){
    		bean.setReqFrom("policylistBR");
    		bean.setIndex("1");
    	}else{
    		bean.setIndex("0");
    		bean.setReqFrom("policylistUW");
    	}
    	bean.setBranch(branchCode);
		validatepolicy();
		try{
			if(!hasActionErrors()){
				//Object obj[]=new Object[]{bean.getProductID(),bean.getStartDate(), bean.getEndDate(), bean.getBroker(), bean.getMode1(),branchCode};
				policyList=service.getPolicyReportApi(bean);
				bean.setReqFrom("policylist");
				if("ajax".equals(bean.getFrom1())){
					uwList=service.getUwList(branchCode);
					productList=cservice.getProductsDET(branchCode,"");
					brokerList=cservice.getAdminBrokerList(branchCode, appId);
					returnResult="policy";
				}
			}else{
				uwList=service.getUwList(branchCode);
				productList=cservice.getProductsDET(branchCode,"");
				brokerList=cservice.getAdminBrokerList(branchCode, appId);
			}
			logger.info("policy()===>Exit");
		}catch(Exception e){
			e.printStackTrace();
		}
		return returnResult;
	}
	

	public String smartlist(){
		//String rags="";
		String returnResult="";
		if(bean.getOrginCountries().length<=0) {
			bean.setOrginCountries(new String[]{"0"}); 
		}
		validatesmart();
		if(!hasActionErrors()){
			if(Arrays.asList(bean.getBrokers()).contains("ALL"))
				bean.setBroker("ALL");
			else
				bean.setBroker(StringUtils.join(bean.getBrokers(), ","));
			bean.setRags(StringUtils.join(bean.getRag(),","));
			if(Arrays.asList(bean.getOrginCountries()).contains("0"))
				bean.setOrginCountry("ALL");
			else
				bean.setOrginCountry(StringUtils.join(bean.getOrginCountries(),","));
			if(Arrays.asList(bean.getDestCountries()).contains("0"))
				bean.setDestCountry("ALL");
			else
				bean.setDestCountry(StringUtils.join(bean.getDestCountries(),","));
			
			/*Object obj[]=new Object[]{bean.getBroker(),bean.getTransportId().replaceAll(" ", ""), StringUtils.isBlank(bean.getCoverId())?"":bean.getCoverId().replaceAll(" ", "") , bean.getBusType(), bean.getCommodity(), bean.getRags(), 
									bean.getStartDate(), bean.getEndDate(), bean.getProductID(), branchCode, bean.getOrginCountry(), bean.getDestCountry()};*/
			Object obj[]=new Object[]{bean.getBroker(),bean.getTransportId().replaceAll(" ", ""), StringUtils.isBlank(bean.getCoverId())?"":bean.getCoverId().replaceAll(" ", "") , bean.getCommodity(), 
					bean.getStartDate(), bean.getEndDate(), bean.getProductID(), branchCode, bean.getOrginCountry(), bean.getDestCountry()};
			
			/*
			if("all".equals(bean.getOrginCountry()))
				bean.setOrginCountry("select distinct country_id from country_master");
			if("all".equals(bean.getDestCountry()))
				bean.setDestCountry("select distinct country_id from country_master");
			if(bean.getRags()!=null && bean.getRags().length()>0)
				bean.setRags(" and mrd.rag in ('"+bean.getRags().replaceAll(",", "','")+"')");
			else bean.setRags("");
			bean.setTransportId(" and md.mode_of_transport in ('"+bean.getTransportId().replaceAll(",", "','")+"')");
			bean.setCoverId(" and md.cover_id in ('"+bean.getCoverId().replaceAll(",", "','")+"')");
			bean.setCommodity(" and mrd.commodity_id in ('"+bean.getCommodity().replaceAll(",", "','")+"')");
			if(!"all".equals(bean.getBroker())){
				bean.setBroker(bean.getBroker().replaceAll(" ,",","));
				bean.setBroker(bean.getBroker().replaceAll(", ",","));
				bean.setBroker(bean.getBroker().trim());
				bean.setBroker(" and log.LOGIN_ID in ('"+bean.getBroker().replaceAll(",","','").trim()+"')");
			}*/
			
			//Object obj[]=new Object[]{branchCode, branchCode, bean.getBroker(), bean.getProductID(), bean.getTransportId(), bean.getCoverId(), bean.getBusType(), bean.getOrginCountry(), bean.getDestCountry(), bean.getCommodity(), bean.getRags(), "'"+bean.getStartDate()+"'", "'"+bean.getEndDate()+"'"};
			
			smartList=service.getSmartList(obj);
			returnResult="smartList";
		}else 
			returnResult=smart();
		return returnResult;
	}
	
	public String branch(){
		String returnResult="branch";
		productList=cservice.getProductsDET(branchCode,"");
		branchName=service.getBranchName(branchCode,login_id);
		return returnResult;
	}
	public String branchResult(){
		String returnResult="branch";
		validbranch();
		if(!hasActionErrors()){
			//bean.setBranch(branchCode);
			//bean.setLoginBranch(branchCode);
			branchList=service.getBranchReportAPI(bean);
//			branchList=service.getBranchReport(bean);
			bean.setReqFrom("branchlist");
		}else{
			productList=cservice.getProductsDET(branchCode,"");
			branchName=service.getBranchName(branchCode,login_id);
			bean.setReqFrom(null);
		}
		return returnResult;
	}
	
	public String exchange(){
		String returnResult="exchange";
		return returnResult;
	}
	public String exchangeResult(){
		String returnResult="exchange";
		validateexchange();
		if(!hasActionErrors()){
			exchangeList=service.getExchangeReport(bean);
			bean.setReqFrom("exchangelist");
		}
		return returnResult;
	}
	public String branchReportJasper(){
		String result=StringUtils.isBlank(bean.getDownloadType())?"excel":bean.getDownloadType();
		String filePath="";
		try{
			bean.setFileName("BranchReports");
			if("reportBR".equals(bean.getMode1()) || "reportUW".equals(bean.getMode1())){
				uwbranchReportJasper();
			}else {
				Object args[]=new Object[7];
				args[0]=bean.getStartDate();
				args[1]=bean.getEndDate();
				args[2]=bean.getProductID();
				args[3]=bean.getReportStatus();
				args[4]=StringUtils.isBlank(bean.getBranch())?branchCode:bean.getBranch();
				args[5]=StringUtils.isBlank(bean.getLoginId())?"ALL":bean.getLoginId(); 
				args[6]=bean.getDownloadType();
				filePath=service.BranchReportdownload(args);
				inputStream=(new FileInputStream(filePath));
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public String uwbranchReportJasper(){
		String result=StringUtils.isBlank(bean.getDownloadType())?"excel":bean.getDownloadType();
		try{
			bean.setFileName("BranchReports");
			ByteArrayOutputStream bos=new ByteArrayOutputStream();
			Object args[]=new Object[7];
			args[0]=bean.getStartDate();
			args[1]=bean.getEndDate();
			args[2]=bean.getProductID();
			args[3]=bean.getReportStatus();
			if("overallreport".equalsIgnoreCase(bean.getMode())){
				args[4]=bean.getBranch();
			}
			else{
				args[4]=branchCode;
			}
			args[5]=("reportUW".equalsIgnoreCase(bean.getMode1()) || "reportBR".equalsIgnoreCase(bean.getMode1()))?bean.getLoginId():"ALL";			
			if(StringUtils.isNotBlank(login_id) && !"reportUW".equalsIgnoreCase(bean.getMode1())){
				args[6]=bean.getLoginId();
			}else if(StringUtils.isNotBlank(bean.getBroker()) && !"ALL".equals(bean.getBroker()) &&  "reportUW".equalsIgnoreCase(bean.getMode1())){
				args[6]=bean.getBroker();
			}
			new MarineJasperReport(session).uwBranchReport(args,result,bos);
			inputStream=new ByteArrayInputStream(bos.toByteArray());
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public String commoditySelect(){
		return "commoditySelect";
	}
	
	public ReportBean getModel() {
		bean.setBranch(belongingBranch);
		return bean;
	}
	public void validatepolicy() {
		 if(StringUtils.isBlank(bean.getStartDate())){
    		addActionError(getText("error.policy.report.startdate.invalid"));
    	}if(StringUtils.isBlank(bean.getEndDate())){
    		addActionError(getText("error.policy.report.enddate.invalid"));
    	}if(StringUtils.isBlank(bean.getBroker())){
    		if("reportBR".equals(bean.getMode1()))
    			addActionError(getText("error.policy.report.broker.invalid"));
    		else addActionError(getText("error.policy.report.uw.invalid"));
    	}else
        	bean.setBroker(bean.getBroker().substring(bean.getBroker().charAt(0)==','?1:0));
    	if(StringUtils.isBlank(bean.getProductID())){
    		addActionError(getText("error.policy.report.product.invalid"));
    	}if(!hasActionErrors()){
			try{
				SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		    	Date sdate = sdf.parse(bean.getStartDate());
		    	Date edate = sdf.parse(bean.getEndDate());
		    	if(sdate.after(edate))
		    		addActionError("End date should be greater than or equal to Start Date");
			}catch(Exception e){
				e.printStackTrace();
			}
		} 
    }
	
	public void validatesmart() {
		 if(StringUtils.isBlank(bean.getStartDate()))
			 addActionError(getText("error.policy.report.startdate.invalid"));
		 if(StringUtils.isBlank(bean.getEndDate()))
			 addActionError(getText("error.policy.report.enddate.invalid"));
		 if(StringUtils.isBlank(bean.getProductID()))
  			 addActionError(getText("error.policy.report.product.invalid"));
		 if(bean.getBrokers().length<=0)
  			 addActionError(getText("error.policy.report.broker.invalid"));
		 if(StringUtils.isBlank(bean.getCommodity()))
  			 addActionError(getText("error.policy.report.commodity.invalid"));
		 if(StringUtils.isBlank(bean.getBusType()))
  			 addActionError(getText("error.policy.report.bustype.invalid"));
		 if(bean.getOrginCountries().length<=0)
  			 addActionError(getText("error.policy.report.origincountry.invalid"));
		 if(bean.getDestCountries().length<=0)
  			 addActionError(getText("error.policy.report.destcountry.invalid"));
		 if(StringUtils.isBlank(bean.getTransportId()) && StringUtils.isBlank(bean.getCoverId()))
  			 addActionError(getText("error.policy.report.coverid.invalid"));
		 if(!hasActionErrors()){
			try{
				SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		    	Date sdate = sdf.parse(bean.getStartDate());
		    	Date edate = sdf.parse(bean.getEndDate());
		    	if(sdate.after(edate))
		    		addActionError("End date should be greater than or equal to Start Date");
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	public void validbranch() {
		if(StringUtils.isBlank(bean.getStartDate())){
			addActionError(getText("error.policy.report.startdate.invalid"));
		}if(StringUtils.isBlank(bean.getEndDate())){
			addActionError(getText("error.policy.report.enddate.invalid"));
		}if(!hasActionErrors()){
			try{
				SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		    	Date sdate = sdf.parse(bean.getStartDate());
		    	Date edate = sdf.parse(bean.getEndDate());
		    	if(sdate.after(edate))
		    		addActionError("End date should be greater than or equal to Start Date");
			}catch(Exception e){
				e.printStackTrace();
			}
		}if(StringUtils.isBlank(bean.getProductID())){
			addActionError(getText("error.policy.report.product.invalid"));
		}if(StringUtils.isBlank(bean.getBranch())){
			addActionError(getText("error.policy.report.branch.invalid"));
		}
	}
	
	public void validateexchange() {
	 if(StringUtils.isBlank(bean.getEffDate())){
    		addActionError(getText("error.policy.report.startdate.invalid"));
    	}
	}
	
	public String openCover() {
		String returnResult = "opencover";
		try {
			if ("result".equals(bean.getReqFrom())) {
				validOpenCover("opencover");
				if (!hasActionErrors()) {
//					coverList=service.getOpenCoverList(bean, branchCode);
					coverList = service.getOpenCoverListApi(bean, branchCode);
				} else {
					brokerList = cservice.getAdminBrokerList(branchCode, appId);
					bean.setReqFrom("");
				}
			} else {
				brokerList = cservice.getAdminBrokerList(branchCode, appId);
				bean.setReqFrom("");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return returnResult;
	}
	
	public String openCoverJasper() {
		String filePath="";
		try {
			bean.setFileName("OpenCoverReport");
			filePath=service.openCoverJasper(bean.getStartDate(), bean.getEndDate(), bean.getBroker(), branchCode, bean.getDownloadType());
			inputStream=(new FileInputStream(filePath));
			/*MarineJasperReport jr = new MarineJasperReport(session);
			ByteArrayOutputStream bos=new ByteArrayOutputStream();
			jr.openCoverReport(bean.getStartDate(), bean.getEndDate(), bean.getBroker(), branchCode, bean.getDownloadType(), bos);
			inputStream=new ByteArrayInputStream(bos.toByteArray());*/
		}
		catch(Exception exception) {
			logger.debug("Exception @ openCoverJasper { " + exception + " } ");
		}
		if("excel".equals(bean.getDownloadType()))
		{
			return "excel";
		}
		if("pdf".equals(bean.getDownloadType()))
		{
			return "pdf";
		}
		return "download";
	}
	public String motorpaymentJasper() {
		try {
			bean.setFileName("MarinePaymentReport");
			MarineJasperReport jr = new MarineJasperReport(session);
			ByteArrayOutputStream bos=new ByteArrayOutputStream();
			jr.motorPaymentReport(bean.getStartDate(), bean.getEndDate(),"excel", bos);
			inputStream=new ByteArrayInputStream(bos.toByteArray());
		}
		catch(Exception exception) {
			logger.debug("Exception @ openCoverJasper { " + exception + " } ");
		}
		return "excel";
	}
	public String motorproductionJasper() {
		try {
			bean.setFileName("MarineProductionReport");
			MarineJasperReport jr = new MarineJasperReport(session);
			ByteArrayOutputStream bos=new ByteArrayOutputStream();
			jr.motorProductionReport(bean.getStartDate(), bean.getEndDate(),"excel", bos);
			inputStream=new ByteArrayInputStream(bos.toByteArray());
		}
		catch(Exception exception) {
			logger.debug("Exception @ openCoverJasper { " + exception + " } ");
		}
		return "excel";
	}
	public String openCoverdetailJasper() {
		try {
			String brokerLoginId="",filepath="";
			bean.setFileName("OpenCoverReport");
			MarineJasperReport jr = new MarineJasperReport(session);
			ByteArrayOutputStream bos=new ByteArrayOutputStream();
    		//brokerLoginId=service.getBrokerLoginId(bean);
    		
			Object args[]=new Object[7];
			args[0]=branchCode;
			args[1]=bean.getStartDate();
			args[2]=bean.getEndDate();
			args[3]=bean.getOpenCoverBroker();
			args[4]="ALL";
			args[5]=(!StringUtils.isEmpty(bean.getProductID()))?bean.getProductID():"11";
			args[6]=bean.getOpenCoverNo();
			filepath=service.openCoverdetailReport(args, bean.getDownloadType());
			inputStream=(new FileInputStream(filepath));
			//jr.openCoverdetailReport(args, bean.getDownloadType(), bos);
			//inputStream=new ByteArrayInputStream(bos.toByteArray());
		}
		catch(Exception exception) {
			logger.debug("Exception @ openCoverJasper { " + exception + " } ");
		}
		if("excel".equals(bean.getDownloadType()))
		{
			return "excel";
		}
		if("pdf".equals(bean.getDownloadType()))
		{
			return "pdf";
		}
		return "download";
	}
	
	public void validOpenCover(String cond){
		if(StringUtils.isBlank(bean.getStartDate()))
			addActionError("Please select Start Date");
		if(StringUtils.isBlank(bean.getEndDate()))
			addActionError("Please select End Date");
		if(StringUtils.isBlank(bean.getBroker()) && "opencover".equals(cond))
			addActionError("Please select Broker");
		/*if(StringUtils.isBlank(bean.getReportStatus()) && "consignee".equals(cond))
			addActionError("Please select Report Type")*/;
		if(!hasActionErrors()){
			try{
				SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		    	Date sdate = sdf.parse(bean.getStartDate());
		    	Date edate = sdf.parse(bean.getEndDate());
		    	if(sdate.after(edate))
		    		addActionError("End date should be greater than or equal to Start Date");
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	
	public String consignee(){
		String returnResult="consignee";
		try{
			if("result".equals(bean.getReqFrom())){
				validOpenCover("consignee");
				if(!hasActionErrors()){
					consigneeList=service.getConsigneeList(bean, branchCode);
				}else
					bean.setReqFrom("");
			}else if("result1".equals(bean.getReqFrom())){
				consigneeList=service.getConsigneeList(bean, branchCode);
			}else if("policyDetail".equals(bean.getReqFrom())){
				consigneeList=service.getConsigneeList(bean, branchCode);
			}else{
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return returnResult;
	}
	public InputStream getInputStream() {
		return inputStream;
	}
	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
	public String openCoverCertificate(){
		try{
		  setCertificateList(service.getCertificatesList(bean,branchCode));
		}catch (Exception e) {
            e.printStackTrace();
		}
		return "opencover";
	}
	public void setCertificateList(List<Object> certificateList) {
		this.certificateList = certificateList;
	}
	public List<Object> getCertificateList() {
		return certificateList;
	}
	
	public String overall() {
		bean.setMode2("View");
		return "overallReports";
	}
	
	public String overAllDetail(){
		validateDate();
		if(!hasActionErrors()){
		if("Certificate".equalsIgnoreCase(bean.getMode2())){
		/*service.overallreport(bean);*/
				bean.setOverAllListOne(service.getOverAll(bean,branchCode,"3"));
				bean.setOverAllListOpen(service.getOverAll(bean,branchCode,"11"));
			}
		else if("BrokerCnt".equalsIgnoreCase(bean.getMode2())){
		bean.setOverAllListOne(service.getOverAll(bean,bean.getBranch(),bean.getProductID()));
		}
		}
		else{
			overall();
		}
		return "overallReports";
	}
	
	public void validateDate(){
		if(StringUtils.isEmpty(bean.getStartDate()))
			addActionError(getText("error.startdate"));
		if(StringUtils.isEmpty(bean.getEndDate()))
			addActionError(getText("error.enddate"));
		if(!hasActionErrors()){
			try{
				SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		    	Date sdate = sdf.parse(bean.getStartDate());
		    	Date edate = sdf.parse(bean.getEndDate());
		    	if(sdate.after(edate))
		    		addActionError(getText( "error.diff.date1"));
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	
	public String overAllReportJasper(){
		try{
			bean.setFileName("OverAllReport");
				ByteArrayOutputStream bos=new ByteArrayOutputStream();
				Object args[]=new Object[5];
				args[0]="Certificate";
				args[1]=bean.getStartDate();
				args[2]=bean.getEndDate();
				args[3]="11";
				args[4]="01";
				//new MarineJasperReport(session).overAllReports(args,bean.getDownloadType(),bos);
				inputStream=new ByteArrayInputStream(bos.toByteArray());
		}catch (Exception e) {
			e.printStackTrace();
		}
		if("excel".equals(bean.getDownloadType()))
		{
			return "excel";
		}
		if("pdf".equals(bean.getDownloadType()))
		{
			return "pdf";
		}
		return "download";
	}
	public String integration() {
		//bean.setProductID((String) session.get("product_id"));
		productList=cservice.getProductsDET(branchCode,"");
		return "integrationList";
	}
	public String integrationList() {
		if(StringUtils.isBlank(bean.getProductID())) {
			addActionError("Please Select Product");
		}
		if(StringUtils.isBlank(bean.getStartDate())) {
			addActionError("Please Select Start Date");
		}if(StringUtils.isBlank(bean.getEndDate())) {
			addActionError("Please Select End Date");
		}
		if(!hasActionErrors()) {
			bean.setIntegrationFailedList(service.getIntegrationFailedList(bean,branchCode));
			if(bean.getIntegrationFailedList().size()==0){
				addActionError("No Record Found");
			}
		}
		productList=cservice.getProductsDET(branchCode,"");
		return "integrationList";
	}
	public String integrationNew(){
		String returnResult="editintegration";
		service.editIntegration(bean);
		integDropDown();
		return returnResult;
	}
	public String updateInteg() {
		String returnResult="editintegration";
		service.updateIntegration(bean);
		validation();
		if(hasActionErrors()) {
			integDropDown();
		}else {
			integrationList();
			addActionError("Updated Successfully");
			returnResult="integrationList";
		}
		return returnResult;
	}
	public String integrationStatus(){
		String returnResult="integrationStatus";
		branchName=service.getBranchName(branchCode,login_id);
		
		return returnResult;
	}
	
	public String integrationNewResult(){
		validateDate();
		 if(StringUtils.isBlank(bean.getBranch()))
			 addActionError("Plese Select Branch");
		String returnResult="integrationStatus";
		if(!hasActionErrors()){
			integratedList=service.getIntegratedNewList(bean);
		}else{
			branchName=service.getBranchName(branchCode,login_id);
			bean.setReqFrom("");
		}
			
		
		return returnResult;
	}
	
	public String reintegrate(){
		String status=service.reintegrate(bean);
		if("Success".equals(status))
		status="Policy/Certificate No "+bean.getPolicynumber() + " was "+status +" To integrate ";
		else
			status="Integration Failed ";	
		addActionError(status);
		bean.setIntegrationFailedList(service.getIntegrationFailedList(bean,branchCode));
		productList=cservice.getProductsDET(branchCode,"");
		return "integrationList";
	}
	
	public String initIntegration(){
		if("result".equalsIgnoreCase(bean.getReqFrom())){
			validatemarineparam();
			if(!hasActionErrors()){
			if("Payment".equalsIgnoreCase(bean.getReportType())){
				paymentList = service.getmarinereport(bean);
				bean.setMode("payreport");
			}else if("Production".equalsIgnoreCase(bean.getReportType())){
				productionList = service.getmarinereport(bean);
				bean.setMode("prodreport");
			}}
		}
		return "marinereport";
	}
	
	private void validatemarineparam() {
		// TODO Auto-generated method stub
		if(StringUtils.isBlank(bean.getStartDate()))
			addActionError("Please Choose Start Date");
		if(StringUtils.isBlank(bean.getEndDate()))
			addActionError("Please Choose End Date");
		if(StringUtils.isBlank(bean.getReportType()))
			addActionError("Please select the Report Type");
	}
	public String integrationResult(){
		validateDate();
		 if(StringUtils.isBlank(bean.getBranch()))
			 addActionError("Plese Select Branch");
		String returnResult="integration";
		if(!hasActionErrors()){
			integratedList=service.getIntegratedList(bean);
		}else{
			branchName=service.getBranchName(branchCode,login_id);
			bean.setReqFrom("");
		}
			
		
		return returnResult;
	}
	
	public String integrationJasperReport(){
		String result=StringUtils.isBlank(bean.getDownloadType())?"excel":bean.getDownloadType();
		try{
			bean.setFileName("integrationReports");
				ByteArrayOutputStream bos=new ByteArrayOutputStream();
				Object args[]=new Object[5];
				args[0]=bean.getStartDate();
				args[1]=bean.getEndDate();
				args[2]=bean.getProductID();
				args[3]= bean.getBranch();
				new MarineJasperReport(session).integrationReport(args,result,bos);
				inputStream=new ByteArrayInputStream(bos.toByteArray());
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public List<Object> getIntegratedList() {
		return integratedList;
	}
	public void setIntegratedList(List<Object> integratedList) {
		this.integratedList = integratedList;
	}
	
	public List<Map<String, Object>> getUploadDocList() {
		return uploadDocList;
	}
	public void setUploadDocList(List<Map<String, Object>> uploadDocList) {
		this.uploadDocList = uploadDocList;
	}
	public String documentUpload() {
		uploadDocList=service.getUploadDocList(bean.getPolicynumber());
		return "documentUpload";
	}
	public String dashboard() {
		
		return "dashboard";
		
	}
	public String dashboardInfo() {
		return service.dashboardInfo(bean);
	}
	
	public void validation() {
		if(bean.getErrors()!=null && bean.getErrors().size()>0) {
			for (int i =0;i<bean.getErrors().size();i++) {
				HashMap<String, Object> map=bean.getErrors().get(i);
				addActionError(map.get("Message")==null?"":map.get("Message").toString());
			}
		}
	}
	
	public void integDropDown() {
		bean.setBankList(service.getDropDownList(bean,"bank"));
		bean.setPackageList(service.getDropDownList(bean,"package"));
		bean.setTrnasportList(service.getDropDownList(bean,"transport"));
		bean.setSaletermList(service.getDropDownList(bean,"saleterm"));
		bean.setCommodityList(service.getDropDownList(bean,"commodity"));
		bean.setCountryList(service.getDropDownList(bean,"country"));
	}
}

	