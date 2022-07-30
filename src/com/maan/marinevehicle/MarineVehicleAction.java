package com.maan.marinevehicle;
import java.io.File;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.maan.common.LogUtil;
import com.maan.common.StringHelper;
import com.maan.marinevehicle.service.MarineVehicleService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;


public class MarineVehicleAction extends ActionSupport implements ModelDriven<MarineVehicleBean>
{
	final Logger logger = LogUtil.getLogger(MarineVehicleAction.class);

	HttpServletRequest request=ServletActionContext.getRequest();
	HttpServletResponse response= ServletActionContext.getResponse();
	HttpSession session1 = request.getSession(true);
	Map<String, Object> session=ActionContext.getContext().getSession();
	MarineVehicleService service=new MarineVehicleService();
	ServletContext context=request.getSession().getServletContext();
	public static Map<String,String> deleteTransMap = new HashMap<String, String>();
	private static final long serialVersionUID = 1L;
	private String FILE_PATH=context.getRealPath("/UploadedFiles/XLS/");
	private String CSV_PATH=context.getRealPath("/UploadedFiles/CSV/");
	MarineVehicleBean bean=new MarineVehicleBean();
	private String openCover=getText("OPEN_COVER");
	private String productId=(String) session.get("product_id");
	private String branchCode=(String)session.get("LoginBranchCode");

	private String issuer=(String)session.get("RSAISSUER");
	private String loginID=(String)session.get("user");
	private String error;
	public String getOpenCover() {
		return openCover;
	}
	public void setOpenCover(String openCover) {
		this.openCover = openCover;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getBranchCode() {
		return branchCode;
	}
	public void setBranchCode(String branchCode) {
		this.branchCode = branchCode;
	}
	public String getIssuer() {
		return issuer;
	}
	public void setIssuer(String issuer) {
		this.issuer = issuer;
	}
	public String getLoginID() {
		return loginID;
	}
	public void setLoginID(String loginID) {
		this.loginID = loginID;
	}
	private transient StringBuilder fileName = new StringBuilder("");
	private String filename;

	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getError() {
		return error;
	}
	public void setError(String error) {
		this.error = error;
	}
	public List<Map<String,Object>> getBrokerList(){
		return service.getBrokerList(branchCode);
	}

	public String uploadInit(){
		bean.setMenuBlocker("bulkreport");
		bean.setDisplay("upload");
		bean.setStatus("Y");
		bean.setFileauth("Bearer " + (session.get("TOKEN_SPRING")==null?"":session.get("TOKEN_SPRING").toString()));
		bean.setFileurl(getText("upload.file.url"));
		String requestfor=getText("upload.file.req");
		Map<String,String > hmap=new HashMap<String, String>();
		hmap.put("OpenCoverNo", bean.getOpenCoverNo());
		hmap.put("UploadedBy", (String)session.get("user"));
		
		for (Entry<String, String> entry : hmap.entrySet()) {
			requestfor = requestfor.replaceAll("<"+entry.getKey()+">", String.valueOf(entry.getValue()==null?"":entry.getValue()).replaceAll("\"", " \\\\\\\\\""));
		}
		bean.setFileReq(requestfor);
		return "vehicle";
	}
	public String vehicleInit(){
		bean.setMenuBlocker("bulkreport");
		service.getDetails(bean);
		bean.setStatus("Y");
		bean.setTransDetails(service.getTransDetails(bean.getBaseOpenCoverNo(),bean.getSearchType(),bean.getSearchType(),bean.getStatus()));
		bean.setHaulierDetails(service.getHaulierDetails(bean.getProposalNo()));
		bean.setDisplay("result");
		return "marineVehicle";  
	}
	public String deleteInit(){
		bean.setMenuBlocker("bulkreport");
		service.getDetails(bean);
		bean.setStatus("Y");
		bean.setMarineVehicleDetails(service.getMarinevehicleDeleteDetails(bean.getProposalNo(),bean.getSearchType(),bean.getSearchValue(),bean.getStatus(),bean.getBaseOpenCoverNo()));
		bean.setDisplay("delete");
		return "marineVehicle"; 
	}
	public String activeCount(){
		bean.setMenuBlocker("bulkreport");
		service.getDetails(bean);
		bean.setStatus("Y");
		bean.setMarineVehicleDetails(service.getMarinevehicleDeleteDetails(bean.getProposalNo(),bean.getSearchType(),bean.getSearchValue(),bean.getStatus(),bean.getBaseOpenCoverNo()));

		bean.setDisplay("premium");
		bean.setReqFrom("tran");
		return "marineVehicle"; 
	}
	public String deletedCount(){
		bean.setMenuBlocker("bulkreport");
		service.getDetails(bean);
		bean.setStatus("D");
		bean.setMarineVehicleDetails(service.getMarinevehicleDeleteDetails(bean.getProposalNo(),bean.getSearchType(),bean.getSearchValue(),bean.getStatus(),bean.getBaseOpenCoverNo()));
		bean.setDisplay("premium");
		bean.setReqFrom("tran");
		return "marineVehicle"; 
	}
	private void validateUpload() {
		logger.info("Validation Block");
		if(StringUtils.isEmpty(bean.getUploadFileName()))
		{
			addActionError(getText("error.upload.file"));
		}
	}

	public String upload()
	{
		bean.setMenuBlocker("bulkreport");
		logger.info("Inside upload()");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		try 
		{
			//bean.setBaseOpenCoverNo(quotation.getBaseOpncoverNo(bean.getProposalNo()));
			validateUpload();
			if (!hasActionErrors()){
				Map resultMap=null;
				bean.setTranId(service.getTranactionId());
				bean.setUploadFileName(StringHelper.getFileNameFormat(bean.getUploadFileName(), bean.getTranId()));
				//uploadFileName=StringHelper.getFileNameFormat(bean.getUploadFileName(), bean.getTranId());
				final int eind = bean.getUploadFileName().lastIndexOf(".");
				fileName.append(bean.getUploadFileName().substring(0,eind));	
				fileName.append(".csv");
				filename =fileName+""; 
				File fileToCreate = new File(FILE_PATH, bean.getUploadFileName());
				FileUtils.copyFile(bean.getUpload(), fileToCreate);
				// new com.maan.marinevehicle.CSVConverter().csvConvertion(FILE_PATH+"\\"+uploadFileName, CSV_PATH+"\\"+uploadFileName, "MM/dd/yyyy hh:mm:ss", "\t");
				//CSVConverter.csvConvertion(FILE_PATH+"\\"+bean.getUploadFileName(), CSV_PATH+"\\"+filename, "dd/MM/yyyy", "\t");
				//File csvFile=new File(CSV_PATH+"\\"+filename);
				CSVConverter.csvConvertion(FILE_PATH+"/"+bean.getUploadFileName(), CSV_PATH+"/"+filename, "dd/MM/yyyy", "\t");
				File csvFile=new File(CSV_PATH+"/"+filename);
				if(csvFile.exists() && csvFile.canRead()){
					resultMap=service.insertRecords(csvFile, bean.getTranId(),bean.getUploadFileName(),FILE_PATH,bean.getProposalNo(),bean.getReUpload(),bean.getBaseOpenCoverNo()==null?"":bean.getBaseOpenCoverNo(),bean.getEndtYN(),bean);
					error=(String)resultMap.get("ERROR");
				}
				else
					error=getText("error.upload.conversion");
				if(StringUtils.isNotEmpty(error)){
					addActionError("File upload failed for transaction Id: "+bean.getTranId());
					for(String errors : error.split("~")) {
						addActionError(errors);
					}
				}
				else
				{
					service.getRefundchargableAmount(bean);
					//bean.setVehicletransDetails(service.getVehicleTransDetails(bean.getProposalNo()));
					//service.getPremiumDetails(bean);
					bean.setPremium(bean.getRefundchargeamount());
					bean.setPolicyFee(service.getPolicyFee(bean.getOpenCoverNo()));
					bean.setStatus("Y");
					bean.setConditionDesc(getText("vehicle.addition"));
					bean.setMarineVehicleDetails(service.getMarinevehicleDetails(bean.getTranId(),"Y"));
					bean.setPremiumDetails(service.getPremiumDetailsList(bean));
					bean.setDisplay("premium");
					bean.setReqFrom("premium");
					calculateVatTax(bean.getVatTax(), bean.getPolicyFee());
				}

			}

		}catch (Exception e) 
		{
			addActionError(e.getMessage());
			e.printStackTrace();
		}
		logger.info("upload() - Exit ");
		if(StringUtils.isNotEmpty(error) || hasActionErrors()){
			bean.setDisplay("upload");
			//display="upload";
			return "Upload";
		}
		else{

			return "marineVehicle";
		}
	}
	public String Transaction(){
		bean.setMenuBlocker("bulkreport");
		bean.setVehicletransDetails(service.getVehicleTransDetails(bean.getOpenCoverNo()));
		bean.setDisplay("transaction");
		return "marineVehicle";
	}
	public String process() {
		bean.setMenuBlocker("bulkreport");
		try {
			service.processRecords(bean, loginID, branchCode, issuer, productId);
			if(StringUtils.isNotBlank(bean.getErrorDesc())) {
				addActionError("File upload failed for transaction Id: "+bean.getTranId());
				for(String errors : bean.getErrorDesc().split("~")) {
					addActionError(errors);
				}
				return Transaction();
			}else {
				viewUnapproved();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "marineVehicle";

	}
	public String deleteConf(){
		bean.setDisplay("result");
		return "Upload";
	}
	public String viewUnapproved() {
		bean.setMenuBlocker("bulkreport");
		service.getPremiumDetails(bean);
		bean.setStatus("Y");
		bean.setMarineVehicleDetails(service.getMarinevehicleDetails(bean.getTranId(),"Y"));
		List<String>  dueamount=new ArrayList<>();
		List<String>  duepercent=new ArrayList<>();
		List<String>  dueList=new ArrayList<>();
		dueamount.add(bean.getTotalPremium());
		duepercent.add("100");
		dueList.add("1");
		bean.setDueList(dueList);
		bean.setDueamount(dueamount);
		bean.setDuepercent(duepercent);
		bean.setDisplay("premium");
		bean.setReqFrom("premium");
		return "marineVehicle";
	}
	public String deleteTransaction(){
		bean.setMenuBlocker("bulkreport");
		List<String>sno1=new ArrayList<String>();
		List<String>transNo1=new ArrayList<String>();
		List<String>proposalno1=new ArrayList<String>();
		
			if(bean.getSno()!=null && bean.getSno().size()>0) {

				for(int i=0 ; i<bean.getSno().size() ; i++) {
					if("true".equalsIgnoreCase(bean.getCheckvalue().get(i))) {
						sno1.add(bean.getSno().get(i));
						transNo1.add(bean.getTransNo().get(i));
						proposalno1.add(bean.getProposalno().get(i));
					}

				}
			}
		
			service.deleteTransction(sno1,transNo1,proposalno1,bean);
			if(!hasActionErrors()){
			//bean.setRefundchargeamount(service.getRefundAmount(sno1,transNo1,proposalno1,bean.getBaseOpenCoverNo(),bean.getProposalNo(),bean));
			//bean.setVehicletransDetails(service.getVehicleTransDetails(bean.getProposalNo()));
			bean.setStatus("D");
			//bean.setPolicyFee("0");
			//service.getPremiumDetails(bean);
			bean.setMarineVehicleDetails(service.getMarinevehicleDetails(bean.getTranId(),"Y"));
			//bean.setPremiumDetails(service.getPremiumDetailsList(bean));
			
			//bean.setPremium(bean.getRefundchargeamount());
			//bean.setPolicyFee(service.getPolicyFee(bean.getOpenCoverNo()));
			//bean.setConditionDesc(getText("vehicle.delection"));
			bean.setDisplay("premium");
			bean.setReqFrom("premium");
		}
		else{
			bean.setStatus("Y");
			bean.setDisplay("delete");
			bean.setMarineVehicleDetails(service.getMarinevehicleDeleteDetails(bean.getProposalNo(),bean.getSearchType(),bean.getSearchType(),bean.getStatus(),bean.getBaseOpenCoverNo()));
		}	
		return "marineVehicle";
	}
	private void calculateVatTax(String vatTaxAmt, String policyFee) {
		String vatTaxpre=service.getvatTaxprecent(bean.getOpenCoverNo());
		bean.setVatTaxPrecent(vatTaxpre);
		//double vatAmt=Double.valueOf(StringUtils.isBlank(vatTaxAmt)?"0":vatTaxAmt)+((Double.valueOf(StringUtils.isBlank(policyFee)?"0":"0"))*Double.valueOf(StringUtils.isBlank(vatTaxpre)?"0":vatTaxpre)/100);
		//bean.setVatTax(String.valueOf(vatAmt));
	}
	private void deleteValidation() {
		boolean check=true;
		if(bean.getCheckvalue().contains("true")) {
			check=false;
		}
		if(check){
			addActionError(getText("error.check.value"));
		}
		if(StringUtils.isBlank(bean.getExpiryDate())){
			addActionError(getText("error.expiryDate.value"));
		}else if(service.maxEffectiveDate(bean.getExpiryDate(), bean.getBaseOpenCoverNo())){
			addActionError(getText("error.expiryDate.value.valid"));
		}
	}
	public MarineVehicleBean getModel() {
		return bean;
	}
	public String insertTrans(){
		bean.setMenuBlocker("bulkreport");
		bean.setDisplay("result");
		if(!hasActionErrors()){
			/*bean.setTotal(String.valueOf(!"C".equals(bean.getChargeableYN())?Double.parseDouble(bean.getTotal())*-1:Double.parseDouble(bean.getTotal())));
		bean.setRefundAmt(String.valueOf(!"C".equals(bean.getChargeableYN())?Double.parseDouble(bean.getRefundAmt())*-1:Double.parseDouble(bean.getRefundAmt())));
		bean.setInceptionFeePaid(String.valueOf(!"C".equals(bean.getChargeableYN())?Double.parseDouble(bean.getInceptionFeePaid())*-1:Double.parseDouble(bean.getInceptionFeePaid())));
		bean.setPolicyFeePaid(String.valueOf(!"C".equals(bean.getChargeableYN())?Double.parseDouble(bean.getPolicyFeePaid())*-1:Double.parseDouble(bean.getPolicyFeePaid())));
		double chargeablePercent=(Double.parseDouble(bean.getRefundAmt())/Double.parseDouble(bean.getTotalPremium()))*100;
		bean.setChargeablePercent(String.valueOf(chargeablePercent));*/
			//service.updateMopPremiumDetails(bean);
			vehicleInit();
		}else{
			bean.setVehicletransDetails(service.getVehicleTransDetails(bean.getProposalNo()));
			bean.setDisplay("premium");
		}
		return "marineVehicle";
	}
	public String getTran(){
		bean.setMenuBlocker("bulkreport");
		bean.setMarineVehicleDetails(service.getMarinevehicleDetails(bean.getTranId(),bean.getStatus()));
		if("N".equalsIgnoreCase(bean.getStatus())){
			service.getPremiumDetails(bean);
			bean.setDisplay("premium");
			bean.setReqFrom("premium");
		}else{
			bean.setDisplay("premium");
			bean.setReqFrom("tran");
		}
		
		return "marineVehicle";

	}	
	public String updatePolicy(){
		bean.setMenuBlocker("bulkreport");
		service.policyGenerate(bean,loginID,branchCode,issuer);
		if(bean.getErrors()!=null && bean.getErrors().size()>0) {
			for (Map<String, Object> temp : bean.getErrors()) {
				addActionError(temp.get("Message").toString());
			}
		}
		if (!hasActionErrors()){
			if("Y".equalsIgnoreCase(bean.getGeneratePolicy())){
				bean.setMarineVehicleDetails(service.getMarinevehicleDetails(bean.getTranId(),bean.getStatus()));
				//bean.setPremiumDetails(service.getPremiumDetailsList(bean));
				bean.setDisplay("premium");
				bean.setReqFrom("policy");
			}else {
				vehicleInit();
			}
		}else{
			if("Y".equalsIgnoreCase(bean.getStatus())){
				viewUnapproved();
			}else if("N".equalsIgnoreCase(bean.getStatus())){
				getTran();
			}else{
				/*bean.setVehicletransDetails(service.getVehicleTransDetails(bean.getProposalNo()));
				bean.setStatus("D");
				service.getPremiumDetails(bean);
				bean.setMarineVehicleDetails(service.getMarinevehicleDetails(bean.getTranId(),"D"));
				//bean.setPremiumDetails(service.getPremiumDetailsList(bean));
				
				bean.setPremium(bean.getRefundchargeamount());
				bean.setPolicyFee(service.getPolicyFee(bean.getOpenCoverNo()));
				bean.setConditionDesc(getText("vehicle.delection"));
				bean.setDisplay("premium");
				bean.setReqFrom("premium");*/
			}
		}
		return "marineVehicle";

	}
	public String unApproved(){
		bean.setMenuBlocker("bulkreport");
		service.getDetails(bean);
		bean.setStatus("N");
		bean.setTransDetails(service.getTransDetails(bean.getBaseOpenCoverNo(),bean.getSearchType(),bean.getSearchType(),bean.getStatus()));
		bean.setHaulierDetails(service.getHaulierDetails(bean.getProposalNo()));
		bean.setDisplay("result");
		return "marineVehicle";  
	}
	public String getDuplicate(){

		bean.setMenuBlocker("bulkreport");	
		bean.setMarineVehicleDetails(service.getDuplicateRecords(bean.getTranId(),bean.getStatus()));
		bean.setStatus("R");
		bean.setDisplay("premium");
		bean.setReqFrom("tran");
		return "marineVehicle";  

	}
	
	private void validateUploadPremium() {
		logger.info("Validation validateUploadPremium");
		if(StringUtils.isEmpty(bean.getPremium()))
		{
			addActionError(getText("error.upload.preimum"));
		}
		if(StringUtils.isEmpty(bean.getPolicyFee()))
		{
			addActionError(getText("error.upload.policyfee"));
		}
		/*if(StringUtils.isEmpty(bean.getEffectiveDate()))
		{
			addActionError(getText("Plese choose Policy Effective Date"));
		}*/
	}
	public String delete() {
		
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		List<String>  dueamount=new ArrayList<>();
		List<String>  duepercent=new ArrayList<>();
		List<String>  dueDate=new ArrayList<>();
		List<String>  effectiveDate=new ArrayList<>();
		List<String>  dueList=new ArrayList<>();
		bean.getDueList().remove(bean.getSnoPT());
		for (int i = 0; i < bean.getDueList().size(); i++) {
			Map<String, Object> doubleMap = new HashMap<String, Object>();
			doubleMap.put("one", new Double(1.0));
			result.add(doubleMap);

		}
		int j = 1;
		for (int k = 0; k < bean.getDueList().size(); k++) {
			int value = Integer.parseInt(bean.getSnoPT())-1;
			if (k < value) {
				dueList.add(bean.getDueList().get(k));
				dueamount.add(bean.getDueamount().get(k));
				duepercent.add(bean.getDuepercent().get(k));
				dueDate.add(bean.getDueDate().get(k));
				effectiveDate.add(bean.getEffectiveDatePT().get(k));
			} else {
				dueList.add(bean.getDueList().get(j));
				if (StringUtils.isNotBlank(bean.getDueamount().get(j))) {
					dueamount.add(bean.getDueamount().get(j));
				}
				if (StringUtils.isNotBlank(bean.getDuepercent().get(j))) {
					duepercent.add(bean.getDuepercent().get(j));
				}
				if (StringUtils.isNotBlank(bean.getDueDate().get(j))) {
					dueDate.add(bean.getDueDate().get(j));
				}
				if (StringUtils.isNotBlank(bean.getEffectiveDatePT().get(j))) {
					effectiveDate.add(bean.getEffectiveDatePT().get(j));
				}
				//
			}
			j++;
		}
		bean.setDueList(dueList);
		bean.setDueamount(dueamount);
		bean.setDueDate(dueDate);
		bean.setDuepercent(duepercent);
		bean.setEffectiveDatePT(effectiveDate);
		viewUnapproved();
	return "marineVehicle";
}
	private void validateDueInsert(){
		DecimalFormat f = new DecimalFormat("##.00");
		String premium=f.format(Double.parseDouble(bean.getPremium())+Double.parseDouble(bean.getPolicyFee())+Double.parseDouble(bean.getVatTax()));
		List<String> error =service.validatePaymentTerms(bean.getTranId(), bean.getPolicyNo(), bean.getDueDate(), bean.getDueamount(), bean.getDuepercent(), bean.getEffectiveDatePT(), bean.getDueList(), premium, branchCode);
		for(int i=0; i<error.size();i++){
			addActionError(error.get(i));
			//result="error";
		}

		/*
		for(int i=0; i<bean.getDueList().size();i++){

		

			if(StringUtils.isBlank(bean.getDueamount().get(i))){
				addActionError("Please Enter Due Amount at Row "+ (i+1));
			}
			if(StringUtils.isBlank(bean.getDueDate().get(i))){
				addActionError("Please Select Due Date at Row "+ (i+1));
			}
			if(StringUtils.isBlank(bean.getEffectiveDatePT().get(i))){
				addActionError("Please Select Effective Date at Row "+ (i+1));
			}
			if(StringUtils.isBlank(bean.getDuepercent().get(i))){
				addActionError("Please Select Due Percent at Row "+ (i+1));
			}
		}*/
	}
	private void premiumValidation() {/*
		double refundAmt=Double.parseDouble(StringUtils.isBlank(bean.getRefundAmt())?"0":bean.getRefundAmt());
		double balanceAmt=Double.parseDouble(StringUtils.isBlank(bean.getBalanceAmt())?"0":bean.getBalanceAmt());
		double receviedAmt=Double.parseDouble(StringUtils.isBlank(bean.getPremiumRcvd())?"0":bean.getPremiumRcvd());			
		double inceptionFee =Double.parseDouble(StringUtils.isBlank(bean.getPremiumRcvd())?"0":bean.getPremiumRcvd());Double.parseDouble(bean.getInceptionFee()); 
		double inceptionFeeRcvd = Double.parseDouble(StringUtils.isBlank(bean.getInceptionFeeRcvd())?"0":bean.getInceptionFeeRcvd());
		double inceptionFeePaid=Double.parseDouble(StringUtils.isBlank(bean.getInceptionFeePaid())?"0":bean.getInceptionFeePaid()); 
		double inceptionFeeBal=inceptionFee-inceptionFeeRcvd;

		double policyFee =Double.parseDouble(StringUtils.isBlank(bean.getPolicyFee())?"0":bean.getPolicyFee());
		double policyFeeRcvd =Double.parseDouble(StringUtils.isBlank(bean.getPolicyFeeRcvd())?"0":bean.getPolicyFeeRcvd());
		double policyFeePaid =Double.parseDouble(StringUtils.isBlank(bean.getPolicyFeePaid())?"0":bean.getPolicyFeePaid());
		double policyFeeBal=policyFee-policyFeeRcvd;
			if((policyFeePaid+inceptionFeePaid+refundAmt)==0){
				addActionError("Enter The Vaild Amount");
			} 
			if("R".equals(bean.getChargeableYN())&&"N".equals(bean.getEndtYN())){
				//addActionError("Refund Not Available for Base Policy");
			}else if("R".equals(bean.getChargeableYN())){
				if(Double.valueOf(refundAmt)>Double.valueOf(receviedAmt-inceptionFeeRcvd-policyFeeRcvd)){
					addActionError("Refund Amount Must be less than Paid Amount");
				}
				if(policyFeePaid>policyFeeRcvd){
					addActionError("PolicyFee Less than received PolicyFee");
				} 
				if(inceptionFeePaid>inceptionFeeRcvd){
					addActionError("InceptionFee Less than received InceptionFee");
				}

			}else{
				if(Double.valueOf(refundAmt)>Double.valueOf(balanceAmt))
					addActionError("Please enter valid Chargeable Amount");
				if(policyFeePaid>policyFeeBal){
					addActionError("PolicyFee Less than Balance PolicyFee");
				} 
				if(inceptionFeePaid>inceptionFeeBal){
					addActionError("InceptionFee Less than Balance InceptionFee");
				}
			}

	 */}
}
