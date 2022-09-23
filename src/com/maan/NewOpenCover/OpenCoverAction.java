package com.maan.NewOpenCover;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.maan.common.LogUtil;
import com.maan.quotation.QuotationAction;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class OpenCoverAction extends ActionSupport implements ModelDriven<OpenCoverBean> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	final Logger logger = LogUtil.getLogger(QuotationAction.class);
	HttpServletRequest request=ServletActionContext.getRequest();
	Map<String, Object> session=ActionContext.getContext().getSession();
	OpenCoverBean bean=new OpenCoverBean();
	OpenCoverService service=new OpenCoverService();
	private static final String FIELD = "ELEMENT_NAME";
	private InputStream inputStream;
	
	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	@Override
	public OpenCoverBean getModel() {
		bean.setBelongingBranch(session.get("BelongingBranch")==null?"01":session.get("BelongingBranch").toString());
		bean.setBranchCode(session.get("BranchCode")==null?"01":session.get("BranchCode").toString());
		bean.setUserType(session.get("usertype")==null?"01":session.get("usertype").toString());
		return bean;
	}
	
	public List<Object>getBusinessTypeList(){
		return service.getDropDownList(bean,"businesstypelist");
	}
	public List<Object>getOpenCoverTypeList(){
		return service.getDropDownList(bean,"opencovertypelist");
	}
	public List<Object>getBrokerList(){
		return service.getDropDownList(bean,"brokerlist");
	}
	public List<Object>getExecutiverList(){
		return service.getDropDownList(bean,"executivelist");
	}
	public List<Object>getUnderWriterList(){
		return service.getDropDownList(bean,"uwlist");
	}
	public List<Object>getRatingTypeList(){
		return service.getDropDownList(bean,"ratingtypelist");
	}
	public List<Object>getGlobalCompanyList(){
		return service.getDropDownList(bean,"globalcompanylist");
	}
	public List<Object>getModewarRateList(){
		return service.getModewarRateList(bean);
	}
	
	public List<Object>getDeclarationList(){
		return service.getDropDownList(bean,"declarationlist");
	}
	public List<Object>getCityList(){
		return service.getDropDownList(bean,"citylist");
	}
	public List<Object>getTitleList(){
		return service.getDropDownList(bean,"titlelist");
	}
	public List<Object>getHaulierCategoryList(){
		return service.getDropDownList(bean,"haulierlist");
	}
	public List<Object>getModeOfTransportList(){
		return service.getModeOfTransportList(bean);
	}
	public List<Object>getCovertypeList(){
		return service.getCovertypeList(bean);
	}
	public List<Object>getCoverClausesList(){
		return service.getCoverClausesList(bean);
	}
	public List<Object>getCountryList(){
		return service.getCountryList(bean);
	}
	public List<Object>getWarCityList(){
		return service.getWarCityList(bean);
	}
	public List<Object>getCommodityList(){
		return service.getCommodityList(bean);
	}
	public List<Object>getEditCommodityList(){
		return service.getEditCommodityList(bean);
	}
	public List<Object>getEditModeTransportList(){
		return service.getEditModeTransportList(bean);
	}
	public List<Object>getSaleTermList(){
		return service.getSaleTermList(bean);
	}
	public List<Object>getOptedSaleTermList(){
		return service.getOptedSaleTermList(bean);
	}
	public List<Object>getToleranceList(){
		return service.getToleranceList(bean);
	}
	public List<Object>getConveyanceList(){
		return service.getConveyanceList(bean);
	}
	public List<Object>getDepositList(){
		return service.getDepositList(bean);
	}
	public List<Object>getInstallmentList(){
		return service.getInstallmentList(bean);
	}
	public List<Object>getEndorsementList(){
		return service.getEndorsementList(bean);
	}
	public List<Object>getMopTransactionList(){
		return service.getmoptransactionlist(bean);
	}
	public String getOpenCoverTypeS() {
		return service.getOpenCoverType(bean);
	}
	public String getWarSrcYN() {
		return service.getWarSrcYN(bean);
	}
	public String getHaulierYN() {
		return service.getHaulierType(bean);
	}
	public String newQuote() {
		//String token=service.getTokenDetail(bean);
		//session.put("TOKEN_SPRING", token);
		//bean.setSpringtoken(token);
		bean.setCurrencyList(service.getDropDownList(bean,"currencylist"));
		return "newopenquote";
	}
	
	public String editQuote() {
		bean.setCurrencyList(service.getDropDownList(bean,"currencylist"));
		service.getQuoteInformation(bean);
		return "newopenquote";
	}

	public String quotation() {
		return "newQuotation";
	}
	
	public String premium() {
		return "newPremiumQuote";
	}
	
	public String customerSelection() {
		bean.setCustomerSelectionlist(service.getCustomerList(bean));
		return "newCustomerSelection";
	}
	
	public String addNewCustomer() {
		bean.setMode("add");
		return "newCustomerSelection";
	}
	public String insertCustomerNew() {
		String result = service.insertCustomerApi(bean);
		validation();
		if (!hasActionErrors()) {
			if (result.equalsIgnoreCase("true")) {
				return customerSelection();
			} else {
				return customerSelection();
			}
		} else {
			bean.setMode("add");
		}
		return "newCustomerSelection";
	}
	public String editcustomer() {
		service.editcustomer(bean);
		bean.setMode("add");
		return "newCustomerSelection";
	}
	public String getQuote() {
		String result= service.insertQuoteInfoApi(bean);
		if("true".equalsIgnoreCase(result)) {
			service.getSecondPageInfo(bean);
			return "newQuotation";//next page
		}
		validation();
		bean.setCurrencyList(service.getDropDownList(bean,"currencylist"));
		return "newopenquote";
	}
	
	private void validationCustomer(OpenCoverBean bean) {
		if(StringUtils.isBlank(bean.getTitle())) {
			addActionError("Please Select Title");
		}
		if(StringUtils.isBlank(bean.getCustName())) {
			addActionError("Please Enter Name");
		}
		if(StringUtils.isBlank(bean.getCustNameAr())) {
			addActionError("Please Enter Arabic Name");
		}
		if(StringUtils.isBlank(bean.getPoBox())) {
			addActionError("Please Enter PO Box");
		}
		if(StringUtils.isBlank(bean.getEmail())) {
			addActionError("Please Enter Email-ID");
		}
		if(StringUtils.isBlank(bean.getCity())) {
			addActionError("Please Select City");
		}
		if(StringUtils.isBlank(bean.getMobileNo())) {
			addActionError("Please Enter Mobile No");
		}
	}
	public String getSecondPage() {
		service.getSecondPageInfo(bean);
		return "newQuotation";
	}
	public String getthirdPage() {
		service.getSecondPageInfo(bean);
		return "newModeofTransport";
	}
	
	public String countrypopUp() {
		if("originationcountry".equals(bean.getIdentify())) {
		service.editOrgcountry(bean);
		}else {
		service.editdestcountry(bean);
		}
		bean.setContientList(service.getContientList(bean));
		service.getIncludeExcludeCountryList(bean);
		return "countrypopUp";
	}
	
	public String commoditypopUp() {
		service.editcommodity(bean);
		return "commoditypopUp";
	}
	public String saletermpopUp() {
		service.editsaleterm(bean);
		service.getIncludeExcludeSaleList(bean);
		return "saletermpopUp";
	}
	public String tolerancepopUp() {
		service.edittolerance(bean);
		bean.setOptedTolerance(service.getToleranceList(bean));
		//service.getIncludeExcludeToleranceList(bean);
		return "tolerancepopUp";
	}
	public String chooseCustomer() {
		bean.setCustomerSelectionlist(service.getCustomerList(bean));
		return "chooseCustomer";
	}
	public String savecommodity() {
		String forword="stream";
		service.savecommodity(bean);
		validation();
		if(!hasActionErrors()) {
		String value="<script type='text/javascript'>document.Quotation.commodity_TA.value='"+bean.getCommodity_TA().replace("'", "")+"';document.Quotation.totalCommudity.value='"+bean.getTotalCommudity()+"';"			
						+"</script>";
		byte[] byteArray = value.getBytes();
		inputStream=new ByteArrayInputStream(byteArray);
		}else {
			forword="commoditypopUp";
		}
		return forword;
	}
	public String saveOrgCountry() {
		String forword="stream";
		String value="";
		service.saveOrgcountry(bean);
		validation();
		if(!hasActionErrors()) {
			if("originationcountry".equals(bean.getIdentify())) {
			value="<script type='text/javascript'>document.Quotation.transit_country.value='"+(StringUtils.isBlank(bean.getTransit_country())?"":bean.getTransit_country().replace("'", ""))+"';document.Quotation.totalTransitId.value='"+bean.getTotalTransitId()+"';"			
							+"</script>";
			}
			byte[] byteArray = value.getBytes();
			inputStream=new ByteArrayInputStream(byteArray);
		}else {
			forword="countrypopUp";
		}
		return forword;
	}
	public String saveDestCountry() {
		String forword="stream";
		String value="";
		service.savedestcountry(bean);
		validation();
		if(!hasActionErrors()) {
			value="<script type='text/javascript'>document.Quotation.destination_country.value='"+(StringUtils.isBlank(bean.getDestination_country())?"":bean.getDestination_country().replace("'", ""))+"';document.Quotation.totalDestinationId.value='"+bean.getTotalDestinationId()+"';"			
						+"</script>";
			byte[] byteArray = value.getBytes();
			inputStream=new ByteArrayInputStream(byteArray);
		}else {
			forword="countrypopUp";
		}
		return forword;
	}
	public String saveSaleterm() {
		String forword="stream";
		String value="";
		service.saveSaleterm(bean);
		validation();
		if(!hasActionErrors()) {
			value="<script type='text/javascript'>document.Quotation.saleTermName.value='"+(StringUtils.isBlank(bean.getSaleTermName())?"":bean.getSaleTermName().replace("'", ""))+"';"			
							+"</script>";
			byte[] byteArray = value.getBytes();
			inputStream=new ByteArrayInputStream(byteArray);
		}else {
			forword="saletermpopUp";
		}
		return forword;
	}
	public String saveTolerance() {
		String forword="stream";
		String value="";
		service.saveTolerance(bean);
		validation();
		if(!hasActionErrors()) {
			//value="<script type='text/javascript'>window.opener.Quotation.tolerance.value='"+(StringUtils.isBlank(bean.getTolerance())?"":bean.getTolerance().replace("'", ""))+"';window.close();"
			value="<script type='text/javascript'>document.Quotation.tolerance.value='"+(StringUtils.isBlank(bean.getTolerance())?"":bean.getTolerance().replace("'", ""))+"';document.Quotation.toleranceId.value='"+(StringUtils.isBlank(bean.getToleranceId())?"":bean.getToleranceId().replace("'", ""))+"';$('#tolerancebtn').attr('data-dismiss','modal');"
						+"</script>";
			byte[] byteArray = value.getBytes();
			inputStream=new ByteArrayInputStream(byteArray);
		}else {
			forword="tolerancepopUp";
			bean.setOptedTolerance(service.getToleranceList(bean));
		}
		return forword;
	}
	public String savechcustomer() {
		String forword="stream";
		String value="";
		service.savechcustomer(bean);
		validation();
		if(!hasActionErrors()) {
			value="<script type='text/javascript'>window.opener.document.Quotation.customer.value='"+(StringUtils.isBlank(bean.getCustomer())?"":bean.getCustomer().replace("'", ""))+"';window.opener.document.Quotation.chcustomerIds.value='"+(StringUtils.isBlank(bean.getChcustomerIds())?"":bean.getChcustomerIds().replace("'", ""))+"';window.close();"		
					+"</script>";
			byte[] byteArray = value.getBytes(); 
			inputStream=new ByteArrayInputStream(byteArray);
		}else {
			bean.setCustomerSelectionlist(service.getCustomerList(bean));
			forword="chooseCustomer";
		}
		return forword;
	}
	public String getModeofCover() {
		String forward="newModeofTransport";
		service.getSecondPageValid(bean);
		validation();
		if(hasActionErrors()) {
			forward="newQuotation";
		}else {
		bean.setCoverageList(service.getCoverageList(bean));
		bean.setCurrencyList(service.getDropDownList(bean,"currencylist"));
		service.geteditModeofCover(bean);
		}
		return forward;
	}
	public String insertModeofCover() {
		String forward="newCommodityRate";
		service.insertModeCoverApi(bean);
		validation();
		if(hasActionErrors()) {
			bean.setCoverageList(service.getCoverageList(bean));
			bean.setCurrencyList(service.getDropDownList(bean,"currencylist"));
			forward="newModeofTransport";
		}else {
		commondetail();
		service.getWarRateList(bean);
		service.getVehicleList(bean);
		}
		return forward;
	}
	
	public String getCommodityRateInfo() {
		commondetail();
		service.getWarRateList(bean);
		service.getVehicleList(bean);
		return "newCommodityRate";
	}
	
	public String commodityRate() {
		service.commodityRate(bean);
		request.setAttribute(FIELD, "commodityRate");
		return "opencoverAjax";
	}
	public String addCommodityRate() {
		service.addCommodityRate(bean);
		validation();
		service.getWarRateList(bean);
		service.getVehicleList(bean);
		commondetail();
		return "newCommodityRate";
	}
	public String covertypePopup() {
		return "covertype";
	}
	public String commoditycoverPopup() {
		return "commodityclausePopup";
	}
	public String savevehicleInfo() {
		service.addvehicleInfo(bean);
		commondetail();
		validation();
		if(!hasActionErrors())
			service.getVehicleList(bean);
		return "newCommodityRate";
	}
	public String savemodeWar() {
		service.addWarRate(bean);
		commondetail();
		validation();
		if(!hasActionErrors())
			service.getWarRateList(bean);
		return "newCommodityRate";
	}
	public String deleteWarRate() {
		String output=service.deleteWarRate(bean);
		if("false".equals(output)) {
			List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
			List<String>warmodeTransId=new ArrayList<>();
			List<String>warmodeTransName=new ArrayList<>();
			List<String>warcityCode=new ArrayList<>();
			List<String>warcityName=new ArrayList<>();
			List<String>warBaseRate=new ArrayList<>();
			bean.getWarsno().remove(bean.getDeleteId());
			for (int i = 0; i < bean.getWarsno().size(); i++) {
				Map<String, Object> doubleMap = new HashMap<String, Object>();
				doubleMap.put("one", new Double(1.0));
				result.add(doubleMap);

			}
			int j = 0;
			for (int k = 0; k < bean.getWarsno().size(); k++) {
				int value = Integer.parseInt(bean.getDeleteId())-1;
				if (k < value) {
					warmodeTransId.add(bean.getWarmodeTransId().get(k));
					warmodeTransName.add(bean.getWarmodeTransName().get(k));
					warcityCode.add(bean.getWarcityCode().get(k));
					warcityName.add(bean.getWarcityName().get(k));
					warBaseRate.add(bean.getWarBaseRate().get(k));
				} else {
					//if (StringUtils.isNotBlank(bean.getWarmodeTransId().get(j))) {
						warmodeTransId.add(bean.getWarmodeTransId().get(j));
					//}
					if (StringUtils.isNotBlank(bean.getWarmodeTransName().get(j))) {
						warmodeTransName.add(bean.getWarmodeTransName().get(j));
					}
					if (StringUtils.isNotBlank(bean.getWarcityCode().get(j))) {
						warcityCode.add(bean.getWarcityCode().get(j));
					}
					if (StringUtils.isNotBlank(bean.getWarcityName().get(j))) {
						warcityName.add(bean.getWarcityName().get(j));
					}
					if (StringUtils.isNotBlank(bean.getWarBaseRate().get(j))) {
						warBaseRate.add(bean.getWarBaseRate().get(j));
					}
					//
				}
				j++;
			}
			bean.setWarmodeTransId(warmodeTransId);
			bean.setWarmodeTransName(warmodeTransName);
			bean.setWarcityCode(warcityCode);
			bean.setWarcityName(warcityName);
			bean.setWarBaseRate(warBaseRate);
		}else {
			service.getWarRateList(bean);
		}
		commondetail();
		return "newCommodityRate";
	}
	public String deleteVehicle() {
		String output=service.deleteVehicle(bean);
		if("false".equals(output)) {
			List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
			List<String>haulierCategoryId=new ArrayList<>();
			List<String>haulierCategory=new ArrayList<>();
			List<String>startLimit=new ArrayList<>();
			List<String>endLimit=new ArrayList<>();
			List<String>premiumVec=new ArrayList<>();
			bean.getHauliersno().remove(bean.getDeleteId());
			for (int i = 0; i < bean.getWarsno().size(); i++) {
				Map<String, Object> doubleMap = new HashMap<String, Object>();
				doubleMap.put("one", new Double(1.0));
				result.add(doubleMap);

			}
			int j = 0;
			for (int k = 0; k < bean.getHauliersno().size(); k++) {
				int value = Integer.parseInt(bean.getDeleteId())-1;
				if (k < value) {
					haulierCategoryId.add(bean.getHaulierCategoryId().get(k));
					haulierCategory.add(bean.getHaulierCategory().get(k));
					startLimit.add(bean.getStartLimit().get(k));
					endLimit.add(bean.getEndLimit().get(k));
					premiumVec.add(bean.getPremiumVec().get(k));
				} else {
					//if (StringUtils.isNotBlank(bean.getWarmodeTransId().get(j))) {
					haulierCategoryId.add(bean.getHaulierCategoryId().get(j));
					//}
					if (StringUtils.isNotBlank(bean.getHaulierCategory().get(j))) {
						haulierCategory.add(bean.getHaulierCategory().get(j));
					}
					if (StringUtils.isNotBlank(bean.getStartLimit().get(j))) {
						startLimit.add(bean.getStartLimit().get(j));
					}
					if (StringUtils.isNotBlank(bean.getEndLimit().get(j))) {
						endLimit.add(bean.getEndLimit().get(j));
					}
					if (StringUtils.isNotBlank(bean.getPremiumVec().get(j))) {
						premiumVec.add(bean.getPremiumVec().get(j));
					}
					//
				}
				j++;
			}
			bean.setHaulierCategoryId(haulierCategoryId);
			bean.setHaulierCategory(haulierCategory);
			bean.setStartLimit(startLimit);
			bean.setEndLimit(endLimit);
			bean.setPremiumVec(premiumVec);
		}else {
			service.getVehicleList(bean);
		}
		commondetail();
		return "newCommodityRate";
	}
	public String adddepositInfo() {
		String forward= "depositinfo";
		service.getCommoditySaveValid(bean);
		if(bean.getErrors()==null && "Y".equals(bean.getEndtYN()))
		service.updateEndt(bean);
		validation();
		if(hasActionErrors()) {
			commondetail();
			forward="newCommodityRate";
		}else {
				service.insertpremiuminfo(bean);
				//service.getpremiuminfo(bean);
		}
		service.getpremiuminfo(bean);
		return forward;
	}
	public String depositInfo() {
		String forward= "depositinfo";
		service.getpremiuminfo(bean);
		return forward;
	}
	public String calculatepremium() {
		service.calculatepremium(bean);
		validation();
		service.getpremiuminfo(bean);
		return "depositinfo";
	}
	public String savesharepercent() {
		service.savesharepercent(bean);
		validation();
		service.getWarRateList(bean);
		service.getVehicleList(bean);
		commondetail();
		return "newCommodityRate";
	}
	public void commondetail() {
		service.getCommodityInfo(bean);
		service.getCompanyList(bean);
		service.getEndtEdit(bean);
	}
	public String policygenerate() {
		String forward="newpolicygenerate";
		if("12".equals(getOpenCoverTypeS()) ||"13".equals(getOpenCoverTypeS())) {
			service.calculatepremium(bean);
			//service.getDepositPremiumInfo(bean);
		}else {
			service.getCommoditySaveValid(bean);
			if(bean.getErrors()==null  && "Y".equals(bean.getEndtYN()))
			service.updateEndt(bean);
		}
		validation();
		if(hasActionErrors()) {
			if("12".equals(getOpenCoverTypeS())||"13".equals(getOpenCoverTypeS())) {
				service.getpremiuminfo(bean);
				forward="depositinfo";
			}else {
				//service.getWarRateList(bean);
				commondetail();
				forward="newCommodityRate";
			}
		}else {
			service.getDepositInfo(bean);
			if("12".equals(getOpenCoverTypeS())||"13".equals(getOpenCoverTypeS())) {
				service.getDepositPremiumInfo(bean);
			}
			service.getPolicyGenInfo(bean);
		}
		return forward;
	}
	public String convertPolicy() {
		service.convertPolicy(bean);
		validation();
		if(hasActionErrors()) {
			return "newpolicygenerate";
		}
		return "newpolicyinfo";
	}
	public String endorsement() {
		service.endorsement(bean);
		if(StringUtils.isNotBlank(bean.getNewproposalNo())) {
			bean.setProposalNo(bean.getNewproposalNo());
			bean.setCurrencyList(service.getDropDownList(bean,"currencylist"));
			service.getQuoteInformation(bean);
		}
		return "newopenquote";
		
	}
	public String updateEndt() {
		service.updateEndt(bean);
		return "newopenquote";
	}
	public void validation() {
		if(bean.getErrors()!=null && bean.getErrors().size()>0) {
			for (int i =0;i<bean.getErrors().size();i++) {
				HashMap<String, Object> map=bean.getErrors().get(i);
				addActionError(map.get("Message").toString());
			}
		}
	}
	public String renew() {
		service.renew(bean);
		if(StringUtils.isNotBlank(bean.getNewproposalNo())) {
			bean.setProposalNo(bean.getNewproposalNo());
			bean.setCurrencyList(service.getDropDownList(bean,"currencylist"));
			service.getQuoteInformation(bean);
		}
		return "newopenquote";
		
	}
	
	
}
