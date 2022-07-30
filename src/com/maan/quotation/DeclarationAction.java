package com.maan.quotation;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.maan.adminnew.common.CommonService;
import com.maan.common.LogUtil;
import com.maan.quotation.api.QuotationApiCall;
import com.maan.quotation.model.DefaultValue;
import com.maan.quotation.service.DeclarationService;
import com.maan.quotation.service.PremiumService;
import com.maan.report.jasper.MarineJasperReport;
import com.maan.upload.api.UploadApiCall;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class DeclarationAction extends ActionSupport {
	final static Logger logger = LogUtil.getLogger(DeclarationAction.class);
	HttpServletRequest request = ServletActionContext.getRequest();
	Map<String, Object> session = ActionContext.getContext().getSession();
	DeclarationService service = new DeclarationService();
	private static final long serialVersionUID = 1L;
	private String loginId = (String) session.get("userName");
	private String openCoverNo = (String) session.get("openCoverNo");
	private String issuer = (String) session.get("RSAISSUER");
	private String branchCode = (String) session.get("LoginBranchCode");
	private String productId = (String) session.get("product_id");
	private String brokerCode = session.get("brokerCode").toString();
	private String menuType;
	private String tranId;
	private String policyNo;
	private String applicationNo;
	private String quoteNo;
	private String rubberStamp;
	private String noteType;
	private String paymentMode;
	private String currencyId;
	private String currencyValue;
	private String debitCustomerId;
	private String generatePolicy;
	private String declaredPolicy;
	private List<Object> selectedQuote;
	private List<Object> policyList;
	private List<Object> declarationList;
	private String supplier;
	private String listType;
	private String vessel;
	private String reqFrom;
	private String policyStartDate;
	private List<Object> policyInfoList;
	private String belongingBranch = (String) session.get("BelongingBranch");
	private String policyMode;
	private String scheduleType;
	private String fileName;
	private InputStream inputStream;
	private String selectedAllQuote;
	private String monthOfDeclaration;
	private String yearVal;
	private String totalPremium;
	private List<HashMap<String, Object>> errors = new ArrayList<HashMap<String, Object>>();
	private DefaultValue defaultValue;
	UploadApiCall api = new UploadApiCall();

	/*
	 * PayMent Term added for vehicle upload
	 */
	private List<String> dueamount=new ArrayList<String>();
	private List<String> duepercent=new ArrayList<String>();
	private List<String> dueDate;
	private List<String> dueList=new ArrayList<String>();
	private List<String> effectiveDatePT;
	private List<Object> userSelection;
	private String userLoginId;
	private String snoPT;
	private String policyfee;
	private String vatTax;
	private String vatPercent;

	public String getVatPercent() {
		return vatPercent;
	}

	public void setVatPercent(String vatPercent) {
		this.vatPercent = vatPercent;
	}

	public DefaultValue getDefaultValue() {
		return defaultValue;
	}

	public void setDefaultValue(DefaultValue defaultValue) {
		this.defaultValue = defaultValue;
	}

	public String getBrokerCode() {
		return brokerCode;
	}

	public void setBrokerCode(String brokerCode) {
		this.brokerCode = brokerCode;
	}

	public String getBranchCode() {
		return branchCode;
	}

	public String getIssuer() {
		return issuer;
	}

	public String getLoginId() {
		return loginId;
	}

	public String getProductId() {
		return productId;
	}

	public String getOpenCoverNo() {
		return openCoverNo;
	}

	public String getMonthOfDeclaration() {
		return monthOfDeclaration;
	}

	public List<String> getDueamount() {
		return dueamount;
	}

	public List<String> getDuepercent() {
		return duepercent;
	}

	public List<String> getDueDate() {
		return dueDate;
	}

	public List<String> getDueList() {
		return dueList;
	}

	public List<String> getEffectiveDatePT() {
		return effectiveDatePT;
	}

	public List<Object> getUserSelection() {
		return userSelection;
	}

	public String getUserLoginId() {
		return userLoginId;
	}

	public String getSnoPT() {
		return snoPT;
	}

	public void setDueamount(List<String> dueamount) {
		this.dueamount = dueamount;
	}

	public void setDuepercent(List<String> duepercent) {
		this.duepercent = duepercent;
	}

	public void setDueDate(List<String> dueDate) {
		this.dueDate = dueDate;
	}

	public void setDueList(List<String> dueList) {
		this.dueList = dueList;
	}

	public void setEffectiveDatePT(List<String> effectiveDatePT) {
		this.effectiveDatePT = effectiveDatePT;
	}

	public void setUserSelection(List<Object> userSelection) {
		this.userSelection = userSelection;
	}

	public void setUserLoginId(String userLoginId) {
		this.userLoginId = userLoginId;
	}

	public void setSnoPT(String snoPT) {
		this.snoPT = snoPT;
	}

	public void setMonthOfDeclaration(String monthOfDeclaration) {
		this.monthOfDeclaration = monthOfDeclaration;
	}

	public String getSupplier() {
		return supplier;
	}

	public void setSupplier(String supplier) {
		this.supplier = supplier;
	}

	public String getListType() {
		return listType;
	}

	public void setListType(String listType) {
		this.listType = listType;
	}

	public String getVessel() {
		return vessel;
	}

	public void setVessel(String vessel) {
		this.vessel = vessel;
	}

	public String getReqFrom() {
		return reqFrom;
	}

	public void setReqFrom(String reqFrom) {
		this.reqFrom = reqFrom;
	}

	/**
	 * @return the currencyId
	 */
	public String getCurrencyId() {
		return currencyId;
	}

	/**
	 * @param currencyId
	 *            the currencyId to set
	 */
	public void setCurrencyId(String currencyId) {
		this.currencyId = currencyId;
	}

	/**
	 * @return the currencyValue
	 */
	public String getCurrencyValue() {
		return currencyValue;
	}

	/**
	 * @param currencyValue
	 *            the currencyValue to set
	 */
	public void setCurrencyValue(String currencyValue) {
		this.currencyValue = currencyValue;
	}

	/**
	 * @return the debitCustomerId
	 */
	public String getDebitCustomerId() {
		return debitCustomerId;
	}

	/**
	 * @param debitCustomerId
	 *            the debitCustomerId to set
	 */
	public void setDebitCustomerId(String debitCustomerId) {
		this.debitCustomerId = debitCustomerId;
	}

	/**
	 * @return the commissionStatus
	 */
	public boolean getCommissionStatus() {
		return new PremiumService().getCommissionStatus(loginId, productId, openCoverNo, issuer, applicationNo,
				branchCode);
	}

	/**
	 * @return the accountStatus
	 */
	public boolean getAccountStatus() {
		return new PremiumService().getCustAccountStatus(applicationNo);
	}

	/**
	 * @return the quoteNo
	 */
	public String getQuoteNo() {
		return quoteNo;
	}

	/**
	 * @param quoteNo
	 *            the quoteNo to set
	 */
	public void setQuoteNo(String quoteNo) {
		this.quoteNo = quoteNo;
	}

	/**
	 * @return the rubberStamp
	 */
	public String getRubberStamp() {
		return rubberStamp;
	}

	/**
	 * @param rubberStamp
	 *            the rubberStamp to set
	 */
	public void setRubberStamp(String rubberStamp) {
		rubberStamp = rubberStamp;
	}

	/**
	 * @return the noteType
	 */
	public String getNoteType() {
		return noteType;
	}

	/**
	 * @param noteType
	 *            the noteType to set
	 */
	public void setNoteType(String noteType) {
		this.noteType = noteType;
	}

	/**
	 * @return the paymentMode
	 */
	public String getPaymentMode() {
		return paymentMode;
	}

	/**
	 * @param paymentMode
	 *            the paymentMode to set
	 */
	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}

	/**
	 * @return the generatePolicy
	 */
	public String getGeneratePolicy() {
		return generatePolicy;
	}

	/**
	 * @param generatePolicy
	 *            the generatePolicy to set
	 */
	public void setGeneratePolicy(String generatePolicy) {
		this.generatePolicy = generatePolicy;
	}

	/**
	 * @return the declarationList
	 */
	public List<Object> getDeclarationList() {
		return declarationList;
	}

	/**
	 * @param selectedQuote
	 *            the selectedQuote to set
	 */
	public void setSelectedQuote(List<Object> selectedQuote) {
		this.selectedQuote = selectedQuote;
	}

	/**
	 * @return the tranId
	 */
	public String getTranId() {
		return tranId;
	}

	/**
	 * @param tranId
	 *            the tranId to set
	 */
	public void setTranId(String tranId) {
		this.tranId = tranId;
	}

	/**
	 * @return the menuType
	 */
	public String getMenuType() {
		return menuType;
	}

	/**
	 * @param menuType
	 *            the menuType to set
	 */
	public void setMenuType(String menuType) {
		this.menuType = menuType;
	}

	public List<Object> getPolicyList() {
		return policyList;
	}

	public void setPolicyList(List<Object> policyList) {
		this.policyList = policyList;
	}

	public List<HashMap<String, Object>> getErrors() {
		return errors;
	}

	public void setErrors(List<HashMap<String, Object>> errors) {
		this.errors = errors;
	}

	public String init() {
		try {
			if ("D".equalsIgnoreCase(menuType)) {
				if ("D".equalsIgnoreCase(menuType) || "DT".equalsIgnoreCase(menuType)) {
					if (StringUtils.isNotBlank(tranId) && StringUtils.isNotBlank(vessel)
							&& StringUtils.isNotBlank(supplier)) {
						policyList = service.getDeclarationList(menuType, reqFrom,
								new String[] { branchCode,
										new com.maan.report.service.ReportService().getOriginalPolicyNo(openCoverNo),
										loginId, issuer, tranId, supplier, vessel });
						listType = "details";
					} else if ("result".equals(reqFrom) || "declare".equals(reqFrom)) {
						policyList = service.getDeclarationList(menuType, reqFrom,
								new String[] { branchCode,
										new com.maan.report.service.ReportService().getOriginalPolicyNo(openCoverNo),
										loginId, issuer, tranId });
						if ("declare".equals(reqFrom))
							menuType = "DP";
					} else
						policyList = service.getDeclarationList(menuType, reqFrom, new String[] { openCoverNo });
				} else {
					policyList = service.getDeclarationList(menuType, reqFrom,
							new String[] { openCoverNo, loginId, issuer });
				}
			} else if ("MD".equalsIgnoreCase(menuType)) {

				if (StringUtils.isEmpty(tranId)) {
					policyList = service.getDeclarationList("D", reqFrom,
							new String[] { branchCode,
									new com.maan.report.service.ReportService().getOriginalPolicyNo(openCoverNo),
									loginId, issuer });
				} else if (StringUtils.isNotBlank(tranId) && StringUtils.isNotBlank(vessel)
						&& StringUtils.isNotBlank(supplier)) {
					reqFrom = "result";
					policyList = service.getDeclarationList("D", reqFrom,
							new String[] { branchCode,
									new com.maan.report.service.ReportService().getOriginalPolicyNo(openCoverNo),
									loginId, issuer, tranId, supplier, vessel });
				} /*
					 * { policyList=service.getDeclarationList("DT",new
					 * String[]{branchCode,openCoverNo,loginId,issuer,tranId}); }
					 */
				if (selectedQuote == null || selectedQuote.size() < 2) {
					addActionError("Please select minimum two Quotes");
					menuType = "D";
					listType = "details";
				} else {
					if (policyList != null && !policyList.isEmpty()) {
						declarationList = new ArrayList<Object>();
						Map<String, String> quoteInfo = null;
						for (int i = 0; i < policyList.size(); i++) {
							quoteInfo = (Map<String, String>) policyList.get(i);
							if (selectedQuote != null && !selectedQuote.isEmpty()) {
								for (int j = 0; j < selectedQuote.size(); j++) {
									if (String.valueOf(quoteInfo.get("QUOTE_NO")).equals(selectedQuote.get(j))) {
										declarationList.add(quoteInfo);
									}
								}
							}
						}
					}
				}
			} else if ("DE".equals(menuType)) {
				policyList = service.getDeclarationList("DE", reqFrom,new String[] { loginId, productId, issuer, openCoverNo });
			} else if ("DEQ".equals(menuType)) {
				service.getDeclarationQuote(this);
				validation();
				if(hasActionErrors()) {
					menuType = "DE";
					init();
				}else {
				dueamount.add(getTotalPremium());
				duepercent.add("100");
				dueList.add("1");
				}
					
			} else if ("C".equals(menuType)) {
				declarationList = service.getDeclarationList(menuType, reqFrom, new String[] {
						new com.maan.report.service.ReportService().getOriginalPolicyNo(openCoverNo), loginId });
			}

		} catch (Exception e) {
			logger.debug("EXCEPTION @ " + e);
			e.printStackTrace();
		}
		return SUCCESS;
	}
	public void validation() {
		if(getErrors()!=null && getErrors().size()>0) {
			for (int i =0;i<getErrors().size();i++) {
				HashMap<String, Object> map=getErrors().get(i);
				addActionError(map.get("Message").toString());
			}
		}
	}
	@SuppressWarnings("unchecked")
	public String update() {
		try {
			JSONObject response = api.policyGeneration(this);
			List<Map<String, Object>> err = (JSONArray) response.get("Errors");
			if (StringUtils.isNotBlank(response.get("PolicyNo") == null ? "" : response.get("PolicyNo").toString())) {
				policyNo = response.get("PolicyNo").toString();
				declarationList = service.getDeclarationList(selectedAllQuote);
				menuType = "MC";
			} else if (err != null && err.size() > 0) {
				for (Map<String, Object> temp : err) {
					addActionError(temp.get("Message").toString());
				}
				menuType = "DEQ";
				service.getDeclarationQuote(this);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		if ("C".equalsIgnoreCase(declaredPolicy)) {
			return portfolio();
		} else
			return SUCCESS;
	}

	public String portfolio() {

		return "portfolio";

	}

	public void validateMultiQuotes() {
		List<String> validateFields = service.validateFields(selectedQuote);
		List<String> validateExcessPremium = service.validateExcessPremium(selectedQuote);
		for (int i = 0; i < validateFields.size(); i++) {
			addActionError(getText(validateFields.get(i)));
		}
		for (int i = 0; i < validateExcessPremium.size(); i++) {
			addActionError(getText(validateExcessPremium.get(i)));
		}
		if (StringUtils.isBlank(policyStartDate)) {
			addActionError("Please Choose Date");
		}

	}

	public String getInfo() {
		if (StringUtils.isBlank(policyStartDate)) {
			addActionError("Please Choose Date");
		} else
			policyInfoList = service.getPolicyPrints(policyStartDate, openCoverNo, policyMode, branchCode);
		if (StringUtils.isNotBlank(policyStartDate))
			policyStartDate = dateFormat(policyStartDate);
		return "policyPrint";
	}

	private String dateFormat(String name) {
		String arr[] = name.split("/");
		return arr[0] + "/" + arr[1] + "/" + arr[2];
	}

	public void setPolicyStartDate(String policyStartDate) {
		this.policyStartDate = policyStartDate;
	}

	public String getPolicyStartDate() {
		return policyStartDate;
	}

	public void setPolicyInfoList(List<Object> policyInfoList) {
		this.policyInfoList = policyInfoList;
	}

	public List<Object> getPolicyInfoList() {
		return policyInfoList;
	}

	public String schedule() {

		String basePath = CommonService.getApplicationPath();
		String downloadPath = basePath + "downloadFiles/branchReports/";
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy h.mm.ss a");
		final Calendar cal = Calendar.getInstance();
		String date = sdf.format(cal.getTime());
		String filePath = downloadPath + "schedule" + date + ".pdf";
		String viewPath = "/downloadFiles/branchReports/schedule" + date + ".pdf";
		MarineJasperReport jr = new com.maan.report.jasper.MarineJasperReport(session);
		jr.policyCertificate(branchCode, belongingBranch, filePath, "", policyStartDate,
				(("WL".equalsIgnoreCase(scheduleType)) ? "Y" : "N"), openCoverNo, policyMode, productId);
		try {
			if (StringUtils.isNotBlank(filePath)) {
				File file = new File(filePath);
				if (file.exists()) {
					inputStream = new FileInputStream(file);
					this.fileName = "schedule" + date;
				}
			}
		} catch (Exception exception) {
			logger.debug(exception);
		}
		return "pdf";
	}

	public void setPolicyMode(String policyMode) {
		this.policyMode = policyMode;
	}

	public String getPolicyMode() {
		return policyMode;
	}

	public void setScheduleType(String scheduleType) {
		this.scheduleType = scheduleType;
	}

	public String getScheduleType() {
		return scheduleType;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileName() {
		return fileName;
	}

	public String pdf() {
		return "redirectviewPDF";
	}

	public String viewpdf() {
		String forward = "pdfDeclaration";
		try {

			if (StringUtils.isNotBlank(fileName)) {
				String filePath = (fileName);
				File file = new File(filePath);
				if (file.exists()) {
					// inputStream=new FileInputStream(file);
					this.fileName = fileName;
					forward = "viewPDF";
				}
			}
		} catch (Exception exception) {
			logger.debug(exception);
		}
		return forward;
	}

	private void validateDueInsert() {

		if (dueList != null) {
			List<String> error = service.validatePaymentTerms(quoteNo, policyNo, dueDate, dueamount, duepercent,
					effectiveDatePT, dueList, totalPremium, branchCode);
			for (int i = 0; i < error.size(); i++) {
				addActionError(error.get(i));
				// result="error";
			}
		}
	}

	public String process() {
		setMenuType("D");
		service.processRecords(tranId, loginId, openCoverNo, branchCode, issuer, productId, brokerCode);
		return init();

	}

	public String pInit() {
		return "policyPrint";
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setSelectedAllQuote(String selectedAllQuote) {
		this.selectedAllQuote = selectedAllQuote;
	}

	public String getSelectedAllQuote() {
		return selectedAllQuote;
	}

	public List<Object> getYearDrpDown() {
		List<Object> result = new ArrayList<Object>();
		// Map<String, Object> map = new HashMap<String, Object>();
		try {
			int year = Calendar.getInstance().get(Calendar.YEAR);
			result.add(year - 1);
			result.add(year);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	public void setYearVal(String yearVal) {
		this.yearVal = yearVal;
	}

	public String getYearVal() {
		return yearVal;
	}

	public void setTotalPremium(String totalPremium) {
		this.totalPremium = totalPremium;
	}

	public String getTotalPremium() {
		return totalPremium;
	}

	public void setDeclaredPolicy(String declaredPolicy) {
		this.declaredPolicy = declaredPolicy;
	}

	public String getDeclaredPolicy() {
		return declaredPolicy;
	}

	public void setPolicyfee(String policyfee) {
		this.policyfee = policyfee;
	}

	public String getPolicyfee() {
		return policyfee;
	}

	public void setVatTax(String vatTax) {
		this.vatTax = vatTax;
	}

	public String getVatTax() {
		return vatTax;
	}
	public String delete() {
		
			List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
			List<String>  dueamount=new ArrayList<>();
			List<String>  duepercent=new ArrayList<>();
			List<String>  dueDate=new ArrayList<>();
			List<String>  effectiveDate=new ArrayList<>();
			List<String>  dueList=new ArrayList<>();
			getDueList().remove(getSnoPT());
			for (int i = 0; i < getDueList().size(); i++) {
				Map<String, Object> doubleMap = new HashMap<String, Object>();
				doubleMap.put("one", new Double(1.0));
				result.add(doubleMap);

			}
			int j = 1;
			for (int k = 0; k < getDueList().size(); k++) {
				int value = Integer.parseInt(getSnoPT())-1;
				if (k < value) {
					dueList.add(getDueList().get(k));
					dueamount.add(getDueamount().get(k));
					duepercent.add(getDuepercent().get(k));
					dueDate.add(getDueDate().get(k));
					effectiveDate.add(getEffectiveDatePT().get(k));
				} else {
					dueList.add(getDueList().get(j));
					if (StringUtils.isNotBlank(getDueamount().get(j))) {
						dueamount.add(getDueamount().get(j));
					}
					if (StringUtils.isNotBlank(getDuepercent().get(j))) {
						duepercent.add(getDuepercent().get(j));
					}
					if (StringUtils.isNotBlank(getDueDate().get(j))) {
						dueDate.add(getDueDate().get(j));
					}
					if (StringUtils.isNotBlank(getEffectiveDatePT().get(j))) {
						effectiveDate.add(getEffectiveDatePT().get(j));
					}
					//
				}
				j++;
			}
			setDueList(dueList);
			setDueamount(dueamount);
			setDueDate(dueDate);
			setDuepercent(duepercent);
			setEffectiveDatePT(effectiveDate);
			menuType = "DEQ";
			service.getDeclarationQuote(this);
		return SUCCESS;
	}
}
