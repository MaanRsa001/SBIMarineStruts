package com.maan.quotation;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.rmi.RemoteException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.xml.soap.SOAPException;

import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.apache.logging.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.maan.common.ConvertService;
import com.maan.common.DBConstants;
import com.maan.common.LogUtil;
import com.maan.common.Token;
import com.maan.common.Validation;
import com.maan.common.util.EscapeUtils;
import com.maan.quotation.model.CommodityDetail;
import com.maan.quotation.model.CustomerDetails;
import com.maan.quotation.model.DefaultValue;
import com.maan.quotation.model.Errors;
import com.maan.quotation.model.LcBankDetails;
import com.maan.quotation.model.PremiumDetails;
import com.maan.quotation.model.QuotationModel;
import com.maan.quotation.model.QuotationResponse;
import com.maan.quotation.model.QuoteDetails;
import com.maan.quotation.model.Referrals;
import com.maan.quotation.model.TransportDetails;
import com.maan.quotation.model.VesselDetails;
import com.maan.quotation.service.PremiumService;
import com.maan.quotation.service.QuotationService;
import com.maan.vessel.VesselService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class QuotationAction extends ActionSupport{
	final Logger logger = LogUtil.getLogger(QuotationAction.class);
	HttpServletRequest request=ServletActionContext.getRequest();
	Map<String, Object> session=ActionContext.getContext().getSession();
	QuotationService service=new QuotationService();
	Validation validation=new Validation();
	private static final String defaultError = "Something went wrong. Please try again later";
	private static final long serialVersionUID = 1L;
	private static final String DROPDOWN = "dropdown";
	private static final String STREAM = "stream";
	private static final String COMMODITY = "commodity";
	private static final String FIELD = "ELEMENT_NAME";
	private String ADMIN=getText("admin");
	private String oneOff=getText("ONE_OFF");
	private String openCover=getText("OPEN_COVER");
	private String brokerOne=getText("BROKER_ONE");
	private String branchCode=(String)session.get("LoginBranchCode");
	private String belongingBranch=(String)session.get("BelongingBranch");
	private String actualBranch=(String)session.get("adminBranch");
	private String defaultBranch=(String)session.get("LoginBranchCode");
	private String productId=(String) session.get("product_id");
	private String brokerCode=(String) session.get("brokerCode");
	private String loginId=(String)session.get("user");
	private String issuer=(String)session.get("RSAISSUER");
	private String userType=(String)session.get("user1");
	private String orgUserType=(String)session.get("usertype");
	EscapeUtils esc=new EscapeUtils();
	private String applicationNo;
	private String refNo;
	private String openCoverNo=(String)session.get("openCoverNo");
	private String title;
	private String customerName;
	private String coreAppCode;
	private String city;
	private String poBox;
	private String mobileNo;
	private String modeOfTransport;
	private String cover;
	private String conveyance;
	private String originCountry;
	private String originCity;
	private String originWarehouse;
	private String destCountry;
	private String destCity;
	private String destWarehouse;
	private String policyStartDate;
	private String currency;
	private String warSrcc;
	private String commodity;
	private String totalCommodity;
	private String totalSI;
	private String saleTerm;
	private String saleTermPercent;
	private String saleTermDecVal;
	private String tolerance;
	private String lcNo;
	private String lcBank;
	private String lcAmount;
	private String lcDate;
	/*private String lcCurrency;
	private String lcexchageValue;
	private String lcId;*/
	private String blNo;
	private String blDate;
	private String vesselName;
	private String partialShipment;
	private String packageCode;
	private String settlingAgent;
	private String agentOthers;
	private String sailingDate;
	private String brokerOriginCountryId;
	private String quoteType;
	private String originCityName;
	private String destCityName;
	private String quoteNo;
	private String option;
	private String address1;
	private String address2;
	private String email;
	private String customerId;
	private String executive;
	private String custContractNo;
	private String custFmsCaseNo;
	private String custRefNo;
	private String brokerType;
	private String quoteStatus;
	private InputStream inputStream;
	private List<String> selectCommodity;
	private List<String> commodityId;
	private List<String> commodityDesc;
	private List<String> insuredValue;
	private List<String> supplierName;
	private List<String> commodityPackDesc;
	private List<String> invoiceNo;
	private List<String> invoiceDate;
	private Map<Integer, Boolean> fragile;
	private List<Object> commodityList;
	private List<Object> chosenCommList;
	private List<String> consignedFrom;
	private List<String> consignedTo;
	private String countryId;
	private String countrySelect;
	private String searchValue;
	private String openCustomerId;
	private String shipmentExposure;
	private String exposureCurrency;
	private String brokerName;
	private String custArNo;
	private String vesselId;
	private String endTypeId;
	private String fields;
	private String policyNo;
	private String custName;
	private String brokerCompany;
	private String endtType;
	private String searcyFrom;
	private String searchBy;
	private String pid;
	private String consigneeDetail;
	private String specialTerm;
	private String addCustomerName;
	private String promotionalCode;
	private String coreCustomerName;
	private String nameAndCode;
	private String status1;
	private String status2;
	private String commodityCode;
	private String category;
	private String channelType;
	private String coreSearchValue;
	private String exchageValue;
	private String via;
	private String finalizeYN;
	private String editClausesYN;
	private String premiumYN;
	private String rateChange;
	private String searchType;
	private String brokerId;
	private String custVatRegNo;
	private String customerNameAr;
	private String referenceNo;
	private String loginUserType = (String) session.get("usertype");
	private String imoNumber; 
	private String vesselDeclareYN;
	private String vesselSearchBy;
	private String iHSLRORIMO;
	private String shipsCategory;
	private String nameString;
	private String exshipsCategory;
	private String exNameString; 
	private String newSearch;
	private List<String> excessDesc;
	private List<String> poNumber;
	private String exposureValue;
	private String status;
	private String aplicationNo;
	private String state;
	private String customerType;
	private String gstIdentityNo;
	private String aadharNo;
	private String eiaNumber;
	private String ianocode;
	private List<Map<String, Object>> quotationInfo;
	private List<Map<String, Object>> insuredGoodsInfo;
	//private Map<String, Object> policyEndtInfo;
	//private Map<String, Object> openCoverInfo;
	
	private List<Map<String, Object>> policyInformation;
	private List<Object>vesselList;
	
	
	public String getCustomerType() {
		return customerType;
	}
	public void setCustomerType(String customerType) {
		this.customerType = customerType;
	}
	public String getGstIdentityNo() {
		return gstIdentityNo;
	}
	public void setGstIdentityNo(String gstIdentityNo) {
		this.gstIdentityNo = gstIdentityNo;
	}
	public String getAadharNo() {
		return aadharNo;
	}
	public void setAadharNo(String aadharNo) {
		this.aadharNo = aadharNo;
	}
	public String getEiaNumber() {
		return eiaNumber;
	}
	public void setEiaNumber(String eiaNumber) {
		this.eiaNumber = eiaNumber;
	}
	public String getIanocode() {
		return ianocode;
	}
	public void setIanocode(String ianocode) {
		this.ianocode = ianocode;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public List<Object> getVesselList() {
		return vesselList;
	}
	public void setVesselList(List<Object> vesselList) {
		this.vesselList = vesselList;
	}

	List<Object> lcList = new ArrayList<Object>();
	private List<Map<String, Object>> viewList = new ArrayList<Map<String,Object>>();
	
	public String getExposureValue() {
		return exposureValue;
	}
	public void setExposureValue(String exposureValue) {
		this.exposureValue = exposureValue;
	}
	public String getCustVatRegNo() {
		return custVatRegNo;
	}
	public void setCustVatRegNo(String custVatRegNo) {
		this.custVatRegNo = custVatRegNo;
	}
	public String getCoreCustomerName() {
		return coreCustomerName;
	}
	public void setCoreCustomerName(String coreCustomerName) {
		this.coreCustomerName = coreCustomerName;
	}
	public String getNameAndCode() {
		return nameAndCode;
	}
	public void setNameAndCode(String nameAndCode) {
		this.nameAndCode = nameAndCode;
	}
	public String getConsigneeDetail() {
		return consigneeDetail;
	}
	public void setConsigneeDetail(String consigneeDetail) {
		this.consigneeDetail = consigneeDetail;
	}
	public String getSpecialTerm() {
		return specialTerm;
	}
	public void setSpecialTerm(String specialTerm) {
		this.specialTerm = specialTerm;
	}
	public String getAddCustomerName() {
		return addCustomerName;
	}
	public void setAddCustomerName(String addCustomerName) {
		this.addCustomerName = addCustomerName;
	}
	public String getPromotionalCode() {
		return promotionalCode;
	}
	public void setPromotionalCode(String promotionalCode) {
		this.promotionalCode = promotionalCode;
	}
	public String getSearcyFrom() {
		return searcyFrom;
	}
	public void setSearcyFrom(String searcyFrom) {
		this.searcyFrom = searcyFrom;
	}
	public String getSearchBy() {
		return searchBy;
	}
	public void setSearchBy(String searchBy) {
		this.searchBy = searchBy;
	}
	/*public String getLcId() {
		return lcId;
	}
	public void setLcId(String lcId) {
		this.lcId = lcId;
	}*/
	public String getBrokerCompany() {
		return brokerCompany;
	}
	public void setBrokerCompany(String brokerCompany) {
		this.brokerCompany = brokerCompany;
	}
	public String getPolicyNo() {
		return policyNo;
	}
	public void setPolicyNo(String policyNo) {
		this.policyNo = policyNo;
	}
	public String getCustName() {
		return custName;
	}
	public void setCustName(String custName) {
		this.custName = custName;
	}
	public String getFields() {
		if(StringUtils.isNotEmpty(endTypeId)){
			String[] ids=endTypeId.split(",");
			if(ArrayUtils.isNotEmpty(ids)){
				fields=getText("endt")+",";
				for (int i = 0; i < ids.length; i++) {
					fields+=getText("endt"+ids[i])+",";
				}
				fields=fields.substring(0, fields.lastIndexOf(","));
			}
		}
		return fields;
	}
	public String getEndTypeId() {
		return endTypeId;
	}
	public void setEndTypeId(String endTypeId) {
		this.endTypeId = endTypeId;
	}
	public String getCustArNo() {
		return custArNo;
	}
	public void setCustArNo(String custArNo) {
		this.custArNo = custArNo;
	}
	public String getVesselId() {
		return vesselId;
	}
	public void setVesselId(String vesselId) {
		this.vesselId = vesselId;
	}
	public String getBrokerName() {
		return brokerName;
	}
	public void setBrokerName(String brokerName) {
		this.brokerName = brokerName;
	}
	public String getShipmentExposure() {
		return shipmentExposure;
	}
	public void setShipmentExposure(String shipmentExposure) {
		this.shipmentExposure = shipmentExposure;
	}
	public String getExposureCurrency() {
		return exposureCurrency;
	}
	public void setExposureCurrency(String exposureCurrency) {
		this.exposureCurrency = exposureCurrency;
	}
	public String getOpenCustomerId() {
		return openCustomerId;
	}
	public void setOpenCustomerId(String openCustomerId) {
		this.openCustomerId = openCustomerId;
		session.put("customer_id", openCustomerId);
	}
	public String getSearchValue() {
		return searchValue;
	}
	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
	public String getQuoteStatus() {
		return quoteStatus;
	}
	public void setQuoteStatus(String quoteStatus) {
		this.quoteStatus = quoteStatus;
	}
	public String getBranchCode() {
		return branchCode;
	}
	public void setBranchCode(String branchCode) {
		this.branchCode = branchCode;
	}
	public String getCountryId() {
		return countryId;
	}
	public void setCountryId(String countryId) {
		this.countryId = countryId;
	}
	public String getCountrySelect() {
		return countrySelect;
	}
	public void setCountrySelect(String countrySelect) {
		this.countrySelect = countrySelect;
	}
	public String getBrokerOne() {
		return brokerOne;
	}
	public String getIssuer() {
		return issuer;
	}
	public String getExecutive() {
		return executive;
	}
	public void setExecutive(String executive) {
		this.executive = executive;
	}
	public String getCustContractNo() {
		return custContractNo;
	}
	public void setCustContractNo(String custContractNo) {
		this.custContractNo = custContractNo;
	}
	public String getCustFmsCaseNo() {
		return custFmsCaseNo;
	}
	public void setCustFmsCaseNo(String custFmsCaseNo) {
		this.custFmsCaseNo = custFmsCaseNo;
	}
	public String getCustRefNo() {
		return custRefNo;
	}
	public void setCustRefNo(String custRefNo) {
		this.custRefNo = custRefNo;
	}
	public void setLoginId(String loginId) {
		if(!StringUtils.isBlank(loginId)){
			this.loginId = loginId;
		}
	}
	public String getPoBox() {
		return poBox;
	}
	public void setPoBox(String poBox) {
		this.poBox = poBox;
	}
	public String getMobileNo() {
		return mobileNo;
	}
	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}
	public String getModeOfTransport() {
		return modeOfTransport;
	}
	public List<Object> getCustomerSelection() {
		return service.getCustomerSelectionListNew(this);
	}
	public List<Object> getLcSelectionList() {
		return service.lcSelectionList((String)session.get("openCoverNo"), searchValue,"");
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getSaleTermDecVal() {
		return saleTermDecVal;
	}
	public void setSaleTermDecVal(String saleTermDecVal) {
		this.saleTermDecVal = saleTermDecVal;
	}
	public String getRefNo() {
		return refNo;
	}
	public void setRefNo(String refNo) {
		this.refNo = refNo;
	}
	/*public String getLcCurrency() {
		return lcCurrency;
	}
	public void setLcCurrency(String lcCurrency) {
		this.lcCurrency = lcCurrency;
	}*/
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getOption() {
		return option;
	}
	public void setOption(String option) {
		this.option = option;
	}
	public String getLoginId() {
		return loginId;
	}
	public String getOneOff() {
		return oneOff;
	}
	public String getOpenCover() {
		return openCover;
	}
	public String getSaleTermPercent() {
		return saleTermPercent;
	}
	public void setSaleTermPercent(String saleTermPercent) {
		this.saleTermPercent = saleTermPercent;
	}
	public String getTolerance() {
		return tolerance;
	}
	public void setTolerance(String tolerance) {
		this.tolerance = tolerance;
	}
	public String getQuoteNo() {
		return quoteNo;
	}
	public void setQuoteNo(String quoteNo) {
		this.quoteNo = quoteNo;
	}
	public String getOriginCityName() {
		return originCityName;
	}
	public void setOriginCityName(String originCityName) {
		this.originCityName = originCityName;
	}
	public String getDestCityName() {
		return destCityName;
	}
	public void setDestCityName(String destCityName) {
		this.destCityName = destCityName;
	}
	public String getQuoteType() {
		return quoteType;
	}
	public void setQuoteType(String quoteType) {
		this.quoteType = quoteType;
	}
	public String getApplicationNo() {
		return applicationNo;
	}
	public void setApplicationNo(String applicationNo) {
		this.applicationNo = applicationNo;
	}
	public void setCommodityList(List<Object> commodityList) {
		this.commodityList = commodityList;
	}
	public List<String> getSelectCommodity() {
		return selectCommodity;
	}
	public void setSelectCommodity(List<String> selectCommodity) {
		this.selectCommodity = selectCommodity;
	}
	public List<String> getCommodityId() {
		return commodityId;
	}
	public void setCommodityId(List<String> commodityId) {
		this.commodityId = commodityId;
	}
	public List<String> getInsuredValue() {
		return insuredValue;
	}
	public void setInsuredValue(List<String> insuredValue) {
		this.insuredValue = insuredValue;
	}
	public List<String> getSupplierName() {
		return supplierName;
	}
	public void setSupplierName(List<String> supplierName) {
		this.supplierName = supplierName;
	}
	public List<String> getCommodityPackDesc() {
		return commodityPackDesc;
	}
	public void setCommodityPackDesc(List<String> commodityPackDesc) {
		this.commodityPackDesc = commodityPackDesc;
	}
	public List<String> getInvoiceNo() {
		return invoiceNo;
	}
	public void setInvoiceNo(List<String> invoiceNo) {
		this.invoiceNo = invoiceNo;
	}
	public Map<Integer, Boolean> getFragile() {
		return fragile;
	}
	public void setFragile(Map<Integer, Boolean> fragile) {
		this.fragile = fragile;
	}
	public List<String> getCommodityDesc() {
		return commodityDesc;
	}
	public void setCommodityDesc(List<String> commodityDesc) {
		this.commodityDesc = commodityDesc;
	}
	public InputStream getInputStream() {
		return inputStream;
	}
	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
	public String getPackageCode() {
		return packageCode;
	}
	public void setPackageCode(String packageCode) {
		this.packageCode = packageCode;
	}
	public String getBrokerOriginCountryId() {
		return brokerOriginCountryId;
	}
	public void setBrokerOriginCountryId(String brokerOriginCountryId) {
		this.brokerOriginCountryId = brokerOriginCountryId;
	}
	public String getOpenCoverNo() {
		return openCoverNo;
	}
	public void setOpenCoverNo(String openCoverNo) {
		this.openCoverNo = openCoverNo;
		if(StringUtils.isNotEmpty(openCoverNo)){
			session.put("openCoverNo", openCoverNo);
		}
	}
	public String getBrokerCode() {
		return brokerCode;
	}
	public void setBrokerCode(String brokerCode) {
		this.brokerCode = brokerCode;
	}
	public String getProductId() {
		return productId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getCoreAppCode() {
		return coreAppCode;
	}
	public void setCoreAppCode(String coreAppCode) {
		this.coreAppCode = coreAppCode;
	}
	public void setModeOfTransport(String modeOfTransport) {
		this.modeOfTransport = modeOfTransport;
	}
	public String getCover() {
		return cover;
	}
	public void setCover(String cover) {
		this.cover = cover;
	}
	public String getConveyance() {
		return conveyance;
	}
	public void setConveyance(String conveyance) {
		this.conveyance = conveyance;
	}
	public String getOriginCountry() {
		return originCountry;
	}
	public void setOriginCountry(String originCountry) {
		this.originCountry = originCountry;
	}
	public String getOriginCity() {
		return originCity;
	}
	public void setOriginCity(String originCity) {
		this.originCity = originCity;
	}
	public String getOriginWarehouse() {
		return originWarehouse;
	}
	public void setOriginWarehouse(String originWarehouse) {
		this.originWarehouse = originWarehouse;
	}
	public String getDestCountry() {
		return destCountry;
	}
	public void setDestCountry(String destCountry) {
		this.destCountry = destCountry;
	}
	public String getDestCity() {
		return destCity;
	}
	public void setDestCity(String destCity) {
		this.destCity = destCity;
	}
	public String getDestWarehouse() {
		return destWarehouse;
	}
	public void setDestWarehouse(String destWarehouse) {
		this.destWarehouse = destWarehouse;
	}
	public String getPolicyStartDate() {
		return policyStartDate;
	}
	public void setPolicyStartDate(String policyStartDate) {
		this.policyStartDate = policyStartDate;
	}
	public String getCurrency() {
		return currency;
	}
	public void setCurrency(String currency) {
		this.currency = currency;
	}
	public String getWarSrcc() {
		return warSrcc;
	}
	public void setWarSrcc(String warSrcc) {
		this.warSrcc = warSrcc;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public String getCommodity() {
		return commodity;
	}
	public void setCommodity(String commodity) {
		this.commodity = commodity;
	}
	public String getTotalCommodity() {
		return totalCommodity;
	}
	public void setTotalCommodity(String totalCommodity) {
		this.totalCommodity = totalCommodity;
	}
	public String getTotalSI() {
		return totalSI;
	}
	public void setTotalSI(String totalSI) {
		this.totalSI = StringUtils.isBlank(totalSI)?"":totalSI.replaceAll(",", "");
	}
	public String getSaleTerm() {
		return saleTerm;
	}
	public void setSaleTerm(String saleTerm) {
		this.saleTerm = saleTerm;
	}
	public String getLcNo() {
		return lcNo;
	}
	public void setLcNo(String lcNo) {
		this.lcNo = lcNo;
	}
	public String getLcBank() {
		return lcBank;
	}
	public void setLcBank(String lcBank) {
		this.lcBank = lcBank;
	}
	public String getLcAmount() {
		return lcAmount;
	}
	public void setLcAmount(String lcAmount) {
		this.lcAmount = lcAmount;
	}
	public String getLcDate() {
		return lcDate;
	}
	public void setLcDate(String lcDate) {
		this.lcDate = lcDate;
	}
	public String getBlNo() {
		return blNo;
	}
	public void setBlNo(String blNo) {
		this.blNo = blNo;
	}
	public String getBlDate() {
		return blDate;
	}
	public void setBlDate(String blDate) {
		this.blDate = blDate;
	}
	public String getVesselName() {
		return vesselName;
	}
	public void setVesselName(String vesselName) {
		this.vesselName = vesselName;
	}
	public String getPartialShipment() {
		return partialShipment;
	}
	public void setPartialShipment(String partialShipment) {
		this.partialShipment = partialShipment;
	}
	public String getSettlingAgent() {
		return settlingAgent;
	}
	public void setSettlingAgent(String settlingAgent) {
		this.settlingAgent = settlingAgent;
	}
	public String getAgentOthers() {
		return agentOthers;
	}
	public void setBrokerType(String brokerType) {
		this.brokerType = brokerType;
	}
	public void setAgentOthers(String agentOthers) {
		this.agentOthers = agentOthers;
	}
	public String getSailingDate() {
		return sailingDate;
	}
	public void setSailingDate(String sailingDate) {
		this.sailingDate = sailingDate;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public void setLcList(List<Object> lcList) {
		this.lcList = lcList;
	}
	
	public String getImoNumber() {
		return imoNumber;
	}
	public void setImoNumber(String imoNumber) {
		this.imoNumber = imoNumber;
	}
	public String getVesselDeclareYN() {
		return vesselDeclareYN;
	}
	public void setVesselDeclareYN(String vesselDeclareYN) {
		this.vesselDeclareYN = vesselDeclareYN;
	}
	public String getVesselSearchBy() {
		return vesselSearchBy;
	}
	public void setVesselSearchBy(String vesselSearchBy) {
		this.vesselSearchBy = vesselSearchBy;
	}
	public String getiHSLRORIMO() {
		return iHSLRORIMO;
	}
	public void setiHSLRORIMO(String iHSLRORIMO) {
		this.iHSLRORIMO = iHSLRORIMO;
	}
	public String getShipsCategory() {
		return shipsCategory;
	}
	public void setShipsCategory(String shipsCategory) {
		this.shipsCategory = shipsCategory;
	}
	public String getNameString() {
		return nameString;
	}
	public void setNameString(String nameString) {
		this.nameString = nameString;
	}
	public String getExshipsCategory() {
		return exshipsCategory;
	}
	public void setExshipsCategory(String exshipsCategory) {
		this.exshipsCategory = exshipsCategory;
	}
	public String getExNameString() {
		return exNameString;
	}
	public void setExNameString(String exNameString) {
		this.exNameString = exNameString;
	}
	public String getNewSearch() {
		return newSearch;
	}
	public void setNewSearch(String newSearch) {
		this.newSearch = newSearch;
	}
	
	
	public String getWarOption() {
		if(openCover.equals(productId)){
			openCoverNo=StringUtils.isBlank(openCoverNo)?(String)session.get("openCoverNo"):openCoverNo;
			return service.getWarOption(openCoverNo);
		}else{
			return "Y";
		}
	}
	public String getBrokerType() {
		return service.getSingleInfo("brokerType",new String[]{loginId});
	}
	
	public Object[] getParams()
	{
		String userId = issuer==null?loginId:issuer;
		String qStatus = "0".equals(settlingAgent)?"RA":"";
	Object[] objects=new String[]{option,productId,belongingBranch,openCoverNo,modeOfTransport,cover,originCountry,
			destCountry,saleTerm,saleTermPercent,lcBank,issuer,brokerCode,userId,qStatus,state};
		return objects;
	}
	public Object[] getbrokerParams()
	{
		String userId = issuer==null?loginId:issuer;
		String qStatus = "0".equals(settlingAgent)?"RA":"";
	Object[] objects=new String[]{option,productId,branchCode,openCoverNo,modeOfTransport,cover,originCountry,
			destCountry,saleTerm,saleTermPercent,lcBank,issuer,brokerCode,userId,qStatus,state};
		return objects;
	}
	public List<Map<String, Object>> getTitleList(){

		return service.dropDownList("title", getParams());
	}
	public List<Map<String, Object>> getStateList(){

		return service.dropDownList("state", getParams());
	}
	public List<Map<String, Object>> getCityList(){

		return service.dropDownList("city", getParams());
	}
	public List<Map<String, Object>> getCustomerTypeList(){

		return service.dropDownList("customertype", getParams());
	}
	public List<Map<String, Object>> getIrtypeList(){

		return service.dropDownList("irtype", getParams());
	}
	public List<Map<String, Object>> getOrgCityList(){

		return service.dropDownList("originationcity", getParams());
	}
	public List<Map<String, Object>> getDestCityList(){

		return service.dropDownList("destinationcity", getParams());
	}
	public List<Map<String, Object>> getModeList(){

		return service.dropDownList("modeoftransport", getParams());
	}
	public List<Map<String, Object>> getCoverList(){

		return service.dropDownList("cover", getParams());
	}
	public List<Map<String, Object>> getConveyanceList(){

		return service.dropDownList("modeofcarriage", getParams());
	}
	public List<Map<String, Object>> getOriginList(){

		return service.dropDownList("originationcountry", getParams());
	}
	public List<Map<String, Object>> getDestList(){

		return service.dropDownList("destinationcountry", getParams());
	}
	public List<Map<String, Object>> getCurrencyList(){

		return service.dropDownList("currency", getParams());
	}
	public List<Map<String, Object>> getSaleTermList(){

		return service.dropDownList("incoterm", getParams());
	}
	public List<Map<String, Object>> getPercentList(){

		return service.dropDownList("incotermpercentage", getParams());
	}
	public List<Map<String, Object>> getToleranceList(){

		return service.dropDownList("tolerance", getParams());
	}
	public List<Map<String, Object>> getPackageList(){

		return service.dropDownList("package", getParams());
	}
	public List<Map<String, Object>> getLcBankList(){

		return service.dropDownList("lcbank", getParams());
	}
	public List<Map<String, Object>> getAgentList(){
	
		return service.dropDownList("settlingagent", getParams());
	}
	public List<Object> getCommodityList()
	{
		return this.commodityList;
	}
	public List<Object> getLcList()
	{
		return service.getOptionsList("lcNo", getParams());
	}
	public List<Map<String, Object>> getBrokerList(){
		if(StringUtils.isNotBlank(issuer) && "3".equals(productId) && StringUtils.isNotBlank(channelType)) {
			if("broker".equalsIgnoreCase(channelType)) {
				return service.dropDownList("broker", getbrokerParams());
			}else if("cash".equalsIgnoreCase(channelType)){
				return service.dropDownList("cash", getbrokerParams());
			}
		}else if(StringUtils.isNotBlank(issuer) && "11".equals(productId)) {
			return service.dropDownList("broker", getbrokerParams());
		}
		return new ArrayList<Map<String, Object>>();
	}
	public boolean isDubaiTradeStatus(){
		return service.getDubaiTradeStatus(loginId, branchCode);
	}
	public List<Map<String, Object>> getExecutiveList(){
		return service.dropDownList("executive", getParams());
	}
	public Map<String, Object> getPolicyEndtInfo(){
		return service.policyEndtInfo(quoteNo);
	}
	public Map<String, Object> getOpenCoverInfo(){
		return service.openCoverInfo(openCoverNo);
	}
	public String getDirectStatus() {
		String direct="";
		direct=service.getDirectStatus(applicationNo,branchCode);
		return direct;
	}
	public String newQuote()
	{
		service.getBrokerInformation(this);
		/*try {
			CustomerCreateService s=new CustomerCreateService();
			s.createnewcustomer();
		} catch (Exception e) {
			e.printStackTrace();
		}*/
		return INPUT;
	}
	public String editQuote() {
		try {
			if( !"admin".equalsIgnoreCase(userType) && StringUtils.isNotBlank(quoteNo) && StringUtils.isNotBlank(finalizeYN)){
				service.updateFinalizeStatus(finalizeYN,quoteNo);
			}
			if(StringUtils.isNotBlank(referenceNo)) {
				QuotationModel qmi = new QuotationModel();
				qmi.setReferenceNo(referenceNo);
				QuotationResponse qs = service.editQuote(qmi);
				mapQuoteEditOutputs(qs);
			}else {
				throw new Exception("Reference Number is Blank");
			}
		}catch(Exception e) {
			addActionError(defaultError);
			logger.info("Exception @ QuotationAction.editQuote(): "+e);
			e.printStackTrace();
		}
		return INPUT;
	}
	
	private void mapQuoteEditOutputs(QuotationResponse qs) {
		try {
			
				String dateFormatFrom = "yyyy-MM-dd HH:mm:ss";
				String dateFormatTo = "dd/MM/yyyy";
				
				QuotationModel qmo = qs.getQuoteResponse();
				setApplicationNo(qmo.getApplicationNo()==null?"":qmo.getApplicationNo());
				setReferenceNo(qmo.getReferenceNo()==null?"":qmo.getReferenceNo());
				setChannelType(qmo.getChannelType()==null?"":qmo.getChannelType());
				setBrokerCode(qmo.getBrokerCode()==null?"":qmo.getBrokerCode());
				setExecutive(qmo.getExecutive()==null?"":qmo.getExecutive());
				setFinalizeYN(qmo.getFinalizeYn()==null?"":qmo.getFinalizeYn());
				setOpenCoverNo(qmo.getOpenCoverNo()==null?"":qmo.getOpenCoverNo());
				setEndTypeId(qmo.getEndtTypeId()==null?"":qmo.getEndtTypeId());
				
				CustomerDetails cdo = qmo.getCustomerDetails();
				setTitle(cdo.getTitle()==null?"":cdo.getTitle());
				setCustomerName(cdo.getName()==null?"":cdo.getName());
				setCustomerId(cdo.getCode()==null?"":cdo.getCode());
				setCoreAppCode(cdo.getCoreAppCode()==null?"":cdo.getCoreAppCode());
				setAddress1(cdo.getAddress1()==null?"":cdo.getAddress1());
				setAddress2(cdo.getAddress2()==null?"":cdo.getAddress2());
				setCity(cdo.getCityCode()==null?"":cdo.getCityCode());
				setPoBox(cdo.getPoBox()==null?"":cdo.getPoBox());
				setMobileNo(cdo.getMobileNo()==null?"":cdo.getMobileNo());
				setEmail(cdo.getEmailId()==null?"":cdo.getEmailId());
				setCustVatRegNo(cdo.getVatRegNo()==null?"":cdo.getVatRegNo());
				
				QuoteDetails qdo = qmo.getQuoteDetails();
				setQuoteNo(qdo.getQuoteNo()==null?"":qdo.getQuoteNo());
				
				TransportDetails tdo = qdo.getTransportDetails();
				setModeOfTransport(tdo.getModeOfTansportCode()==null?"":tdo.getModeOfTansportCode());
				setCover(tdo.getCoverCode()==null?"":tdo.getCoverCode());
				setConveyance(tdo.getModeOfCarriageCode()==null?"":tdo.getModeOfCarriageCode());
				setOriginCountry(tdo.getOriginCountryCode()==null?"":tdo.getOriginCountryCode());
				setOriginCityName(tdo.getOriginCityName()==null?"":tdo.getOriginCityName());
				setOriginCity(tdo.getOriginCityCode()==null?"":tdo.getOriginCityCode());
				setOriginWarehouse(tdo.getOriginWarehouseYn()==null?"NO":tdo.getOriginWarehouseYn());
				setDestCountry(tdo.getDestinationCountryCode()==null?"":tdo.getDestinationCountryCode());
				setDestCityName(tdo.getDestinationCityName()==null?"":tdo.getDestinationCityName());
				setDestCity(tdo.getDestinationCityCode()==null?"":tdo.getDestinationCityCode());
				setDestWarehouse(tdo.getDestinationWarehouseYn()==null?"NO":tdo.getDestinationWarehouseYn());
				setVia(tdo.getVia()==null?"":tdo.getVia());
				
				setPolicyStartDate(ConvertService.dateFormatConversion(qdo.getInceptionDate()==null?"":qdo.getInceptionDate(), dateFormatFrom, dateFormatTo));
				setCurrency(qdo.getCurrencyCode()==null?"":qdo.getCurrencyCode());
				setExchageValue(qdo.getCurrencyValue()==null?"":qdo.getCurrencyValue());
				setWarSrcc(qdo.getWarAndSrccYn()==null?"YES":qdo.getWarAndSrccYn());
				
				List<CommodityDetail> ctlo = qdo.getCommodityDetails();
				if(ctlo!= null && ctlo.size()>0) {
					List<String> commodityIdList = new ArrayList<String>();
					List<String> commodityDescList = new ArrayList<String>();
					List<String> insuredValueList = new ArrayList<String>();
					List<String> invoiceNoList = new ArrayList<String>();
					List<String> invoiceDateList = new ArrayList<String>();
					List<String> consignedFromList = new ArrayList<String>();
					List<String> consignedToList = new ArrayList<String>();
					List<String> poNumberList = new ArrayList<String>();
					Map<Integer, Boolean> fragileList = new HashMap<Integer, Boolean>();
					List<String> excessDescList = new ArrayList<String>();
					int w=0;
					double totalSiTemp = 0;
					for(CommodityDetail cto : ctlo) {
						if(cto!=null) {
							commodityIdList.add(w, cto.getGoodsCategoryCode()==null?"":cto.getGoodsCategoryCode());
							commodityDescList.add(w, cto.getGoodsCategoryDescription()==null?"":cto.getGoodsCategoryDescription());
							totalSiTemp += cto.getInsuredValue();
							insuredValueList.add(w, String.valueOf(cto.getInsuredValue()));
							invoiceNoList.add(w, cto.getInvoiceNo()==null?"":cto.getInvoiceNo());
							invoiceDateList.add(w, ConvertService.dateFormatConversion(cto.getInvoiceDate()==null?"":cto.getInvoiceDate(), dateFormatFrom, dateFormatTo));
							consignedFromList.add(w, cto.getConsignedFrom()==null?"":cto.getConsignedFrom());
							consignedToList.add(w, cto.getConsignedTo()==null?"":cto.getConsignedTo());
							poNumberList.add(w, cto.getPoDescription()==null?"":cto.getPoDescription());
							fragileList.put(w, (cto.getFragile()!=null && "on".equalsIgnoreCase(cto.getFragile()))?true:false);
							excessDescList.add(w, cto.getPolicyExcessDescription()==null?"":cto.getPolicyExcessDescription());
							w++;
						}
					}
					setCommodityId(commodityIdList);
					setCommodityDesc(commodityDescList);
					setInsuredValue(insuredValueList);
					setInvoiceNo(invoiceNoList);
					setInvoiceDate(invoiceDateList);
					setConsignedFrom(consignedFromList);
					setConsignedTo(consignedToList);
					setPoNumber(poNumberList);
					setFragile(fragileList);
					setExcessDesc(excessDescList);
					setCommodity(StringUtils.join(commodityDescList,","));
					setTotalCommodity(String.valueOf(w));
					setTotalSI(String.valueOf(totalSiTemp));
				}
				
				setSaleTerm(qdo.getIncoTerms()==null?"":qdo.getIncoTerms());
				setSaleTermPercent(qdo.getPercentage()==null?"":qdo.getPercentage());
				setTolerance(qdo.getTolerance()==null?"":qdo.getTolerance());
				setPartialShipment(qdo.getPartialShipmentCode()==null?"":qdo.getPartialShipmentCode());
				setShipmentExposure(qdo.getExposureOfShipment()==null?"":qdo.getExposureOfShipment());
				setExposureCurrency(qdo.getCurrencyOfExposureCode()==null?"":qdo.getCurrencyOfExposureCode());
				
				VesselDetails vdo = qdo.getVesselDetails();
				setVesselId(vdo.getVesselCode()==null?"":vdo.getVesselCode());
				setVesselName(vdo.getVesselName()==null?"":vdo.getVesselName());
				
				setVesselDeclareYN(vdo.getVesselDeclareYN()==null?"":vdo.getVesselDeclareYN());
				setVesselSearchBy(vdo.getVesselSearchBy()==null?"":vdo.getVesselSearchBy());
				setImoNumber(vdo.getImoNumber()==null?"":vdo.getImoNumber());
				setiHSLRORIMO(vdo.getiHSLRORIMO()==null?"":vdo.getiHSLRORIMO());
				setShipsCategory(vdo.getShipsCategory()==null?"":vdo.getShipsCategory());
				setNameString(vdo.getNameString()==null?"":vdo.getNameString());
				setExshipsCategory(vdo.getExshipsCategory()==null?"":vdo.getExshipsCategory());
				setExNameString(vdo.getExNameString()==null?"":vdo.getExNameString());
				
				
				setPackageCode(qdo.getPackageCode()==null?"":qdo.getPackageCode());
				setSettlingAgent(qdo.getSettlingAgentCode()==null?"":qdo.getSettlingAgentCode());
				setAgentOthers(qdo.getSettlingAgentOthers()==null?"":qdo.getSettlingAgentOthers());
				
				LcBankDetails lco = qmo.getLcBankDetails();
				setLcBank(lco.getBankCode()==null?"":lco.getBankCode());
				setLcNo(lco.getLcNo()==null?"":lco.getLcNo());
				setLcDate(ConvertService.dateFormatConversion(lco.getLcDate()==null?"":lco.getLcDate(), dateFormatFrom, dateFormatTo));
				setBlNo(lco.getAwbNo()==null?"":lco.getAwbNo());
				setBlDate(ConvertService.dateFormatConversion(lco.getAwbDate()==null?"":lco.getAwbDate(), dateFormatFrom, dateFormatTo));
				setSailingDate(ConvertService.dateFormatConversion(lco.getSailingDate()==null?"":lco.getSailingDate(), dateFormatFrom, dateFormatTo));
				
		}catch(Exception e) {
			addActionError(defaultError);
			logger.info("Exception @ QuotationAction.mapQuoteEditOutputs(): "+e);
			e.printStackTrace();
		}
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
	
	/*public String getQuote() {
		try {
			QuotationModel qmi1 = mapQuoteSaveInputs();
			QuotationResponse qs1 = service.saveQuote(qmi1);
			mapQuoteSaveOutputs(qs1);
			if(!hasActionErrors()) {
				if(StringUtils.isNotBlank(newSearch) && "new".equals(newSearch)) {
					new VesselService().insertVesselInfo(imoNumber);
				}
				QuotationModel qmi2 = mapQuotePremiumCalcInputs();
				QuotationResponse qs2 = service.quotePremiumCalc(qmi2);
				mapQuotePcOutputs(qs2);
				if(!hasActionErrors()) {
					return SUCCESS;
				}
			}
		}catch(Exception e) {
			addActionError(defaultError);
			logger.info("Exception @ QuotationAction.getQuote(): "+e);
			e.printStackTrace();
		}
		return INPUT;
	}*/
	public String getQuote() {
		try {
			QuotationModel qmi1 = mapQuoteSaveInputs();
			QuotationResponse qs1 = service.saveQuote(qmi1);
			mapQuotePcOutputs(qs1);
			if(!hasActionErrors()) {
				if(StringUtils.isNotBlank(newSearch) && "new".equals(newSearch)) {
					new VesselService().insertVesselInfo(imoNumber);
				}
					return SUCCESS;
			}
		}catch(Exception e) {
			addActionError(defaultError);
			logger.info("Exception @ QuotationAction.getQuote(): "+e);
			e.printStackTrace();
		}
		return INPUT;
	}
	
	private QuotationModel mapQuotePremiumCalcInputs() {
		QuotationModel qmi = new QuotationModel();
		try {
			qmi.setReferenceNo(referenceNo);
			qmi.setFinalizeYn(finalizeYN==null?"":finalizeYN);
			qmi.setQuoteStatus(quoteStatus==null?"":quoteStatus);
		}catch(Exception e) {
			logger.info("Exception @ QuotationAction.mapQuotePremiumCalcInputs(): "+e);
			e.printStackTrace();
		}
		return qmi;
	}
	private void mapQuotePcOutputs(QuotationResponse qs) {
		try {
			if(qs.getErrors()!=null && qs.getErrors().size()>0) {
				mapErrors(qs.getErrors());
			}
				if(!hasActionErrors()){
					QuotationModel qm = qs.getQuoteResponse();
					List<Map<String, Object>> qil = new ArrayList<Map<String, Object>>();
					Map<String,Object> qim = new HashMap<String, Object>();
					
					//Map<String,Object> pei = new HashMap<String, Object>();
					//Map<String,Object> opi = new HashMap<String, Object>();

					setStatus(qm.getStatus()==null?"":qm.getStatus());
					setReferenceNo(qm.getReferenceNo()==null?"":qm.getReferenceNo());
					setApplicationNo(qm.getReferenceNo()==null?"":qm.getReferenceNo());
					//setEndt(qm.getEndtYn()==null?false:("Y".equalsIgnoreCase(qm.getEndtYn())?true:false));
					setEndTypeId(qm.getEndtTypeId()==null?"":qm.getEndtTypeId());
					//setEndtType(qm.getEndtTypeDescription()==null?"":qm.getEndtTypeDescription());
					//setFinancial(qm.getFinanceEndtYn()==null?false:("Y".equalsIgnoreCase(qm.getFinanceEndtYn())?true:false));
					//setFinancialEndt(qm.getFinanceEndtYn()==null?false:("Y".equalsIgnoreCase(qm.getFinanceEndtYn())?true:false));
					
					
					qim.put("ADMIN_REFERRAL_STATUS", qm.getAdminReferralStatus()==null?"":qm.getAdminReferralStatus());
					qim.put("IMO_NUMBER", qm.getImoNumber()==null?"":qm.getImoNumber());
					//qim.put("REFERRAL_DESC", qm.getAdminReferralRemarks()==null?"":qm.getAdminReferralRemarks());
					String referralDesc = "";
					try {
						List<Referrals> rl = qm.getReferrals();
						if(rl!=null && rl.size()>0) {
							List<String> referralDescList = new ArrayList<String>();
							for(Referrals r: rl) {
								if(StringUtils.isNotBlank(r.getReferralName())) {
									referralDescList.add(r.getReferralName());
								}
							}
							referralDesc = StringUtils.join(referralDescList,"~");
						}
					}catch(Exception e) {
						logger.info("Exception @ QuotationAction.mapQuotePcOutputs()--REFERRAL_DESC : "+e);
						e.printStackTrace();
					}
					qim.put("REFERRAL_DESC", referralDesc);
					qim.put("LOGIN_ID", qm.getLoginId()==null?"":qm.getLoginId());
					qim.put("ISSUER", qm.getIssuerId()==null?"":qm.getIssuerId());
					qim.put("STATUS", qm.getStatus()==null?"":qm.getStatus());
					qim.put("CHANNEL_TYPE", qm.getChannelType()==null?"":qm.getChannelType());
					qim.put("ADMIN_REMARKS", qm.getAdminRemarks()==null?"":qm.getAdminRemarks());
					
					//pei.put("POLICY_NO", qm.getPolicyNo()==null?"":qm.getPolicyNo());
					//pei.put("BROKER_NAME", qm.getBrokerName()==null?"":qm.getBrokerName());
					
					//opi.put("OPEN_COVER_NO", openCoverNo);
					//opi.put("BROKER_NAME", qm.getBrokerName()==null?"":qm.getBrokerName());
					LcBankDetails lc=qm.getLcBankDetails();
					if(lc!=null) {
						qim.put("BANK_NAME", lc.getBankName()==null?"":lc.getBankName());
					}
					CustomerDetails cd = qm.getCustomerDetails();
					if(cd != null) {
						qim.put("CUSTOMER_ID", cd.getCode()==null?"":cd.getCode());
						qim.put("CUSTOMER_NAME", cd.getName()==null?"":cd.getName());
					}
					//setPolicyEndtInfo(pei);
					//setOpenCoverInfo(opi);

					QuoteDetails qd = qm.getQuoteDetails();
					if(qd != null) {
						setQuoteNo(qd.getQuoteNo()==null?"":qd.getQuoteNo());
						
						qim.put("QUOTE_NUMBER", qd.getQuoteNo()==null?"":qd.getQuoteNo());
						qim.put("POLICY_START_DATE", qd.getInceptionDate()==null?"":qd.getInceptionDate());
						qim.put("WAR_SRCC", qd.getWarAndSrccYn()==null?"":qd.getWarAndSrccYn());
						qim.put("CURRENCY_NAME", qd.getCurrencyName()==null?"":qd.getCurrencyName());
						qim.put("EXCHANGE_RATE", qd.getCurrencyValue()==null?"":qd.getCurrencyValue());
						qim.put("SALES_TERM", qd.getIncoTermsDescription()==null?"":qd.getIncoTermsDescription());
						qim.put("SETTLING_AGENT_NAME", qd.getSettlingAgentName()==null?"":qd.getSettlingAgentName());
						qim.put("PACKAGE_DESCRIPTION", qd.getPackageName()==null?"":qd.getPackageName());

						TransportDetails td = qd.getTransportDetails();
						if(td != null) {
							qim.put("TRANSPORT_DESCRIPTION", td.getModeOfTransportName()==null?"":td.getModeOfTransportName());
							qim.put("COVER_NAME", td.getCoverName()==null?"":td.getCoverName());
							qim.put("CONVDESC", td.getModeOfCarriageName()==null?"":td.getModeOfCarriageName());
							qim.put("MODE_OF_TRANSPORT", td.getModeOfTansportCode()==null?"":td.getModeOfTansportCode());
							qim.put("COVER_ID", td.getCoverCode()==null?"":td.getCoverCode());
							qim.put("ORIGIN_COUNTRY","YES".equalsIgnoreCase(td.getOriginWarehouseYn())?(td.getOriginCityName() + "," + td.getOriginCountryName()):(td.getOriginCityName() + "," +td.getOriginCountryName()));
							qim.put("DEST_COUNTRY", "YES".equalsIgnoreCase(td.getDestinationWarehouseYn())?(td.getDestinationCityName()  + "," +td.getDestinationCountryName()):(td.getDestinationCityName()  + "," +td.getDestinationCountryName()));				
						}
					}
					
					PremiumDetails pd = qm.getPremiumDetails();
					if(pd != null) {
						qim.put("TOTAL_PREMIUM", pd.getTotalPremium());
						qim.put("MARINE_PREMIUM", pd.getMarinePremium());
						qim.put("WAR_PREMIUM", pd.getWarPremium());
						qim.put("EXCESS_SIGN", pd.getExcessSign()==null?"+":pd.getExcessSign());
						qim.put("ADDITIONAL_PREMIUM", pd.getAdditionalPremium());
						qim.put("GOVT_TAX", pd.getGovernmentTax());
						qim.put("INSPECTION_FEE", pd.getInspectionFee());
						qim.put("POLICYFEEYN", pd.getPolicyFeeYn()==null?"":pd.getPolicyFeeYn());
						qim.put("POLICY_ISSUNCE_FEE", pd.getPolicyIssunceFee());
						qim.put("VAT_TAX_PERCENT", pd.getVatTaxPercentage());
						qim.put("VAT_TAX_AMT", pd.getVatTaxAmount());
						qim.put("NET_PREMIUM", pd.getNetPremium());
						qim.put("DISCOUNT_PREMIUM", pd.getDiscountPremium());
					}
					
					double totalInsued = 0;
					
					List<CommodityDetail> cdll = qd.getCommodityDetails();
					if(cdll != null && cdll.size()>0) {
						List<Map<String, Object>> igil = new ArrayList<Map<String,Object>>();
						for(int i=0;i<cdll.size();i++) {
							CommodityDetail cdlm = cdll.get(i);
							if(cdlm!=null) {
								Map<String, Object> igim = new HashMap<String, Object>();
								igim.put("COMMODITY_NAME", cdlm.getGoodsCategoryName()==null?"":cdlm.getGoodsCategoryName());
								igim.put("COMMODITY_ID", cdlm.getGoodsCategoryCode()==null?"":cdlm.getGoodsCategoryCode());
								igim.put("POLICY_EXCESS", cdlm.getPolicyExcess());
								igim.put("POLICY_EXCESS_PERCENT", cdlm.getPolicyExcessPercentage());
								igim.put("EXCESS_DESCRIPTION", cdlm.getPolicyExcessDescription()==null?"":cdlm.getPolicyExcessDescription());
								igim.put("DESCRIPTION", cdlm.getGoodsCategoryDescription()==null?"":cdlm.getGoodsCategoryDescription());
								igim.put("SUM_INSURED", cdlm.getInsuredValue());
								igim.put("MARINE_WAR_RATE", cdlm.getMarineWarRate());
								igim.put("RATE", cdlm.getRate());
								igim.put("WARRATE", cdlm.getWarRate());
								igim.put("FRAGILE", cdlm.getFragile());
								totalInsued = totalInsued+cdlm.getInsuredValue();
								igil.add(igim);
							}
						}
						setInsuredGoodsInfo(igil);
					}
					
					qim.put("TOTAL_INSURED", qm.getTotalInsuredValue());
					qim.put("EQUIVALENT", qm.getEquivalentInsuredValue());
					qil.add(qim);
					setQuotationInfo(qil);
					setPolicyInformation(qil);
					
				}
			
		}catch(Exception e) {
			addActionError(defaultError);
			logger.info("Exception @ QuotationAction.mapQuotePcOutputs(): "+e);
			e.printStackTrace();
		}
		
	}
	private QuotationModel mapQuoteSaveOutputs(QuotationResponse qs) {
		QuotationModel qmo = new QuotationModel();
		try {
		
				if(qs.getErrors()!=null && qs.getErrors().size()>0) {
					mapErrors(qs.getErrors());
				}
			
				if(!hasActionErrors()) {
					QuotationModel qm = qs.getQuoteResponse();
					if(StringUtils.isNotBlank(qm.getReferenceNo())) {
						referenceNo = qm.getReferenceNo();
						qmo.setReferenceNo(referenceNo);
						
					}else {
						throw new Exception("Reference No is not available in Response");
					}
				}
			
			
		}catch(Exception e) {
			addActionError(defaultError);
			logger.info("Exception @ QuotationAction.mapQuoteSaveOutputs(): "+e);
			e.printStackTrace();
		}
		return qmo;
	}
	
	private QuotationModel mapQuoteSaveInputs() {
		QuotationModel qm = new QuotationModel();
		try {
			
			CustomerDetails cd = new CustomerDetails();
			cd.setTitle(title==null?"":title);
			cd.setName(customerName==null?"":customerName);
			cd.setCoreAppCode(coreAppCode==null?"":coreAppCode);
			cd.setAddress1(address1==null?"":address1);
			cd.setAddress2(address2==null?"":address2);
			cd.setStatecode(state==null?"":state);
			cd.setCityCode(city==null?"":city);
			//cd.setCityName(service.getDropDownDesc(getCityList(),city==null?"":city));
			cd.setPoBox(poBox==null?"":poBox);
			cd.setMobileNo(mobileNo==null?"":mobileNo);
			cd.setEmailId(email==null?"":email);
			cd.setVatRegNo(custVatRegNo==null?"":custVatRegNo);
			cd.setCustomertype(customerType==null?"":customerType);
			cd .setGstIdentityNo(gstIdentityNo==null?"":gstIdentityNo);
			cd.setAadharNo(aadharNo==null?"":aadharNo);
			cd.setEiaNumber(eiaNumber==null?"":eiaNumber);
			cd.setIanocode(ianocode==null?"":ianocode);
			cd.setCode(customerId==null?"":customerId);
			qm.setCustomerDetails(cd);
			
			QuoteDetails qd = new QuoteDetails();
			
			TransportDetails td = new TransportDetails();
			td.setModeOfTansportCode(modeOfTransport==null?"":modeOfTransport);
			//td.setModeOfTransportName(service.getDropDownDesc(getModeList(),modeOfTransport==null?"":modeOfTransport));
			td.setCoverCode(cover==null?"":cover);
			//td.setCoverName(service.getDropDownDesc(getCoverList(),cover==null?"":cover));
			td.setModeOfCarriageCode(conveyance==null?"":conveyance);
			//td.setModeOfCarriageName(service.getDropDownDesc(getConveyanceList(),conveyance==null?"":conveyance));
			td.setOriginCountryCode(originCountry==null?"":originCountry);
			//td.setOriginCountryName(service.getDropDownDesc(getOriginList(),originCountry==null?"":originCountry));
			td.setOriginCityCode(originCity==null?"":originCity);
			td.setOriginCityName("9999".equals(originCity)?originCityName:"");
			td.setOriginWarehouseYn(originWarehouse==null?"":originWarehouse);
			td.setDestinationCountryCode(destCountry==null?"":destCountry);
			//td.setDestinationCountryName(service.getDropDownDesc(getDestList(),destCountry==null?"":destCountry));
			td.setDestinationCityCode(destCity==null?"":destCity);
			td.setDestinationCityName("9999".equals(destCity)?destCityName:"");
			td.setDestinationWarehouseYn(destWarehouse==null?"":destWarehouse);
			td.setVia(via==null?"":via);
			qd.setTransportDetails(td);
			
			if(commodityId!=null && commodityId.size()>0) {
				List<CommodityDetail> cdtl = new ArrayList<CommodityDetail>();
				for(int i=0;i<commodityId.size();i++) {
					CommodityDetail cdt  = new CommodityDetail();
					cdt.setGoodsCategoryCode(commodityId.get(i)==null?"":commodityId.get(i));
					//cdt.setGoodsCategoryName(service.getDropDownDesc(getGoodsCategoryList(),commodityId.get(i)==null?"":commodityId.get(i)));
					cdt.setGoodsCategoryDescription(commodityDesc.get(i)==null?"":commodityDesc.get(i));
					cdt.setInsuredValue(Double.valueOf(StringUtils.isBlank(insuredValue.get(i))?"0":insuredValue.get(i).replace(",", "")));
					cdt.setInvoiceNo(invoiceNo.get(i)==null?"":invoiceNo.get(i));
					cdt.setInvoiceDate(invoiceDate.get(i)==null?"":invoiceDate.get(i));
					cdt.setConsignedFrom(consignedFrom.get(i)==null?"":consignedFrom.get(i));
					cdt.setConsignedTo(consignedTo.get(i)==null?"":consignedTo.get(i));
					cdt.setPoDescription(poNumber.get(i)==null?"":poNumber.get(i));
					cdt.setFragile(fragile.get(i)==null?"off":("true".equalsIgnoreCase(fragile.get(i).toString())?"on":"off"));
					cdt.setPolicyExcessDescription(excessDesc.get(i)==null?"":excessDesc.get(i));
					cdtl.add(i, cdt);
				}
				qd.setCommodityDetails(cdtl);
			}
			
			VesselDetails vd = new VesselDetails();
			vd.setVesselName(vesselName==null?"":vesselName);
			vd.setVesselDeclareYN(vesselDeclareYN==null?"":vesselDeclareYN);
			vd.setImoNumber(imoNumber==null?"":imoNumber);
			vd.setVesselSearchBy(vesselSearchBy==null?"":vesselSearchBy);
			vd.setiHSLRORIMO(iHSLRORIMO==null?"":iHSLRORIMO);
			vd.setShipsCategory(shipsCategory==null?"":shipsCategory);
			vd.setExshipsCategory(exshipsCategory==null?"":exshipsCategory);
			vd.setExNameString(exNameString==null?"":exNameString);
			vd.setVesselCode(vesselId==null?"":vesselId);
			qd.setVesselDetails(vd);
			
			qd.setInceptionDate(policyStartDate==null?"":policyStartDate);
			qd.setCurrencyCode(currency==null?"":currency);
			//qd.setCurrencyName(service.getDropDownDesc(getCurrencyList(), currency==null?"":currency));
			//qd.setCurrencyValue(service.getDropDownValue(getCurrencyList(), currency==null?"":currency));
			qd.setCurrencyValue(exchageValue==null?"":exchageValue);
			qd.setWarAndSrccYn(warSrcc==null?"":warSrcc);
			qd.setIncoTerms(saleTerm==null?"":saleTerm);
			qd.setPercentage(StringUtils.isBlank(saleTermPercent)?(saleTermDecVal):(saleTermPercent));
			qd.setTolerance(tolerance==null?"":tolerance);
			qd.setSettlingAgentCode(settlingAgent==null?"":settlingAgent);
			//qd.setSettlingAgentName(service.getDropDownDesc(getAgentList(), settlingAgent==null?"":settlingAgent));
			qd.setSettlingAgentOthers(agentOthers==null?"":agentOthers);
			qd.setPackageCode(packageCode==null?"":packageCode);
			//qd.setPackageName(service.getDropDownDesc(getPackageList(), packageCode==null?"":packageCode));
			qd.setPartialShipmentCode(partialShipment==null?"":partialShipment);
			qd.setPartialShipmentName("Y".equalsIgnoreCase(partialShipment)?"Partial":("M".equalsIgnoreCase(partialShipment)?"Multiple":"None"));
			qd.setExposureOfShipment(shipmentExposure==null?"":shipmentExposure);
			qd.setCurrencyOfExposureCode(exposureCurrency==null?"":exposureCurrency);
			//qd.setCurrencyOfExposureName(service.getDropDownDesc(getCurrencyList(), exposureCurrency==null?"":exposureCurrency));
			//qd.setCurrencyOfExposureValue(service.getDropDownValue(getCurrencyList(), exposureCurrency==null?"":exposureCurrency));
			qd.setCurrencyOfExposureValue(exposureValue==null?"":exposureValue);
			qd.setFinalizeYn(finalizeYN==null?"":finalizeYN);
			qd.setQuoteStatus(quoteStatus==null?"":quoteStatus);
			qm.setQuoteDetails(qd);
			
			LcBankDetails lc = new LcBankDetails();
			lc.setBankCode(lcBank==null?"":lcBank);
			//lc.setBankName(service.getDropDownDesc(getLcBankList(), lcBank==null?"":lcBank));
			lc.setLcNo(lcNo==null?"":lcNo);
			lc.setLcDate(lcDate==null?"":lcDate);
			lc.setAwbNo(blNo==null?"":blNo);
			lc.setAwbDate(blDate==null?"":blDate);
			lc.setSailingDate(sailingDate==null?"":sailingDate);
			qm.setLcBankDetails(lc);
			
			qm.setReferenceNo(referenceNo==null?"":referenceNo);
			qm.setProductId(productId==null?"":productId);
			qm.setBrokerCode(brokerCode==null?"":brokerCode);
			qm.setOpenCoverNo(openCoverNo==null?"":openCoverNo);
			qm.setChannelType(channelType==null?"":channelType);
			qm.setBranchCode(branchCode==null?"":branchCode);
			qm.setLoginId(loginId==null?"":loginId);
			qm.setIssuer(issuer==null?"":issuer);
			qm.setExecutive(executive==null?"":executive);
			qm.setLoginUserType(loginUserType==null?"":loginUserType);
			
			
		}catch(Exception e) {
			logger.info("Exception @ QuotationAction.mapQuoteSaveInputs(): "+e);
			e.printStackTrace();
		}
		return qm;
	}
	public String cityList()
	{
		request.setAttribute(FIELD, "city");
		return DROPDOWN;
	}
	public String coverList()
	{
		request.setAttribute(FIELD, "cover");
		return DROPDOWN;
	}
	public String conveyanceList()
	{
		request.setAttribute(FIELD, "conveyance");
		return DROPDOWN;
	}
	public String packageList()
	{
		request.setAttribute(FIELD, "package");
		return DROPDOWN;
	}
	public String agentList()
	{
		request.setAttribute(FIELD, "agent"); 
		return DROPDOWN;
	}
	public String percentList()
	{
		request.setAttribute(FIELD, "saleTermPercent"); 
		return DROPDOWN;
	}
	public String toleranceList()
	{
		request.setAttribute(FIELD, "tolerance"); 
		return DROPDOWN;
	}
	public String lcList()
	{
		request.setAttribute(FIELD, "lcNo"); 
		return DROPDOWN;
	}
	public String brokersList()
	{
		request.setAttribute(FIELD, "brokersList"); 
		return DROPDOWN;
	}
	public String executiveList()
	{
		request.setAttribute(FIELD, "executive"); 
		return DROPDOWN;
	}
	public String promotionalList(){
		request.setAttribute(FIELD, "promotionalList"); 
		return DROPDOWN;
	} 
	public String vesselList()
	{
		setVesselList(service.getVesselList(vesselName,belongingBranch));
		//request.setAttribute("vesselList", service.getVesselList(vesselName));
		return "vesselList";	
	}
	public List<Map<String, Object>> getGoodsCategoryList()
	{
		return service.dropDownList("goodscategory", getParams());
	}
	public String countryCityList()
	{
		return "citySelection";
	}
	public String vessel()
	{	
		return "vesselSelection";	
	}
	/*public String commodityList()
	{
		Object params[]=null;
		if(openCover.equals(productId)){
			params=new Object[]{applicationNo, openCoverNo};
		}else{
			params=new Object[]{applicationNo, belongingBranch};
		}
		this.commodityList=service.getOptionsList(openCover.equals(productId)?"commodity_oc":COMMODITY, params);
		return COMMODITY;
	}*/
	public String commodityList()
	{
		/*Object params[]=null;
		if(openCover.equals(productId)){
			params=new Object[]{applicationNo, openCoverNo};
		}else{
			params=new Object[]{applicationNo, branchCode};
		}
		this.commodityList=service.getOptionsList(openCover.equals(productId)?"commodity_oc":COMMODITY, params);
		return COMMODITY;*/


		/*Object params[]=null;
		if(openCover.equals(productId)){
			params=new Object[]{applicationNo, openCoverNo};
		}else{
			params=new Object[]{applicationNo, branchCode};
		}*/
		if(StringUtils.isBlank(applicationNo)){
			this.commodityList=new ArrayList<Object>();
		}else{
			viewList=service.searchList(applicationNo,belongingBranch);
			this.commodityList=new ArrayList<Object>();
			//this.commodityList=service.getOptionsList(openCover.equals(productId)?"commodity_oc":COMMODITY, params);
		}
		return COMMODITY;
	}
	/*public String addCommodity()
	{
		String uploadStatus="";
		String errorShowStatus=getText("error.show.status");
		try {
			if("submit".equalsIgnoreCase(status1) || "addmore".equalsIgnoreCase(status1))
				validateGoods();
		} catch (Exception e) {
			logger.debug("Exception @ "+e);
			e.printStackTrace();
		}
		if(!hasActionErrors())
		{
			if("addmore".equalsIgnoreCase(status1)){
				try{
					if(applicationNo==null || "".equals(applicationNo))
					{
						applicationNo = service.getApplicationNo();
					}
					if(!"RA".equalsIgnoreCase(quoteStatus)){
						uploadStatus=service.addCommodity(applicationNo, StringUtils.defaultIfEmpty(refNo, applicationNo), chosenCommList, branchCode);
						status2="";
					}else{
						uploadStatus=service.updateCommodity(applicationNo, chosenCommList);
						status2="";
					}
					if("Fail".equalsIgnoreCase(uploadStatus) && "YES".equalsIgnoreCase(errorShowStatus)){
						addActionError(getText("error.commodity.change"));
					}
					viewList=service.searchList(applicationNo,belongingBranch);
					this.commodityList=new ArrayList<Object>();
				}catch(Exception e){
					e.printStackTrace();
				}
				return COMMODITY;
			}else if("edit".equalsIgnoreCase(status1)){
				try{
					Object params[]=null;
					if(openCover.equals(productId)){
						params=new Object[]{applicationNo,openCoverNo, commodityCode};
					}else{
						params=new Object[]{applicationNo, commodityCode,belongingBranch};
					}
					if(StringUtils.isBlank(applicationNo)){
						this.commodityList=new ArrayList<Object>();
					}else{
						this.commodityList=new ArrayList<Object>();
						this.commodityList=service.getOptionsList(openCover.equals(productId)?"commodity_oc":COMMODITY, params);

						//category=((Map)commodityList.get(0)).get("commodity_type_id")==null?"":((Map)commodityList.get(0)).get("commodity_type_id").toString();
					}
					viewList=service.searchList(applicationNo,belongingBranch);
					*//***Multiple Commodity Removed -- Start ****//*
					
					status2 = "edit";
					
					*//***Multiple Commodity Removed -- End ****//*
				}catch(Exception e){
					e.printStackTrace();
				}
				return COMMODITY;
			}else if("delete".equalsIgnoreCase(status1)){
				try{
					service.deleteCommodity(applicationNo, commodityCode);
					viewList=service.searchList(applicationNo,belongingBranch);
					this.commodityList=new ArrayList<Object>();
				}catch(Exception e){
					e.printStackTrace();
				}
				return COMMODITY;
			}else{
				String forward=STREAM;
				try{
					if(applicationNo==null || "".equals(applicationNo))
					{
						applicationNo = service.getApplicationNo();
					}
					if(!"RA".equalsIgnoreCase(quoteStatus) || ADMIN.equalsIgnoreCase(userType)){
						uploadStatus=service.addCommodity(applicationNo, StringUtils.defaultIfEmpty(refNo, applicationNo), chosenCommList, branchCode);
						status2="";
					}else{
						uploadStatus=service.updateCommodity(applicationNo, chosenCommList);
						status2="";
					}
					viewList=service.searchList(applicationNo,belongingBranch);
					Map<String, Object> commInfo=null;
					String commodityName="";
					double commoditySi=0.0;
					double totalImportSI=0.0;
					int commodityNo=viewList.size();
					if (viewList != null && !viewList.isEmpty()) {
						for (int i = 0; i < viewList.size(); i++) {
							commInfo=(Map<String, Object>)viewList.get(i);
							//commodityName+=(commInfo.get("COMMODITY_NAME")==null?"":commInfo.get("COMMODITY_NAME").toString())+',';
							//commodityName+= commInfo.get("COMMODITY_DESCRIPTION")==null?"":commInfo.get("COMMODITY_DESCRIPTION").toString()+',';
							commoditySi+=Double.parseDouble(commInfo.get("SUMINSURED")==null?"0.0":commInfo.get("SUMINSURED").toString());
							totalImportSI=totalImportSI+Double.parseDouble(commInfo.get("IMPORT_DUTY_SUMINSURED")==null?"0.0":commInfo.get("IMPORT_DUTY_SUMINSURED").toString());
						}
						PolicyGenerationDAO policyDAO = new PolicyGenerationDAO();
						Map<String,Object> resultMap = policyDAO.getResultMap(DBConstants.COMMODITY_TOTAL, new String[]{StringUtils.defaultIfEmpty(refNo, applicationNo)});
						commodityName = resultMap.get("COMMODITY_DESCRIPTION")==null?"":resultMap.get("COMMODITY_DESCRIPTION").toString().replaceAll("\\n", " ");
					}
					if("Fail".equalsIgnoreCase(uploadStatus) && "YES".equalsIgnoreCase(errorShowStatus)){
						addActionError(getText("error.commodity.change"));
						forward=COMMODITY;
					}
					String value="<script type='text/javascript'>window.opener.quotation.applicationNo.value='"+applicationNo+"';window.opener.quotation.totalCommodity.value='"+(commodityNo==0?"":commodityNo)+"';window.opener.quotation.totalSI.value='"+("0".equals(new DecimalFormat("#.##").format(commoditySi))?"":new DecimalFormat("#.##").format(commoditySi))+"';window.opener.quotation.commodity.value='"+commodityName.replace("\n", " ").replace("\r", " ").replace("'", " ")+"';" +
					(hasActionMessages()?"alert('"+getActionMessages()+"');":"")+"window.close();"						
							+"</script>";
						 
					byte[] byteArray = value.getBytes();
					inputStream=new ByteArrayInputStream(byteArray);
				}catch(Exception e){
					e.printStackTrace();
				}
				return forward;
			}
		}
		else {
			viewList=service.searchList(applicationNo,belongingBranch);
			return COMMODITY;
		}
	}*/
	/*public String addCommodity()
	{
		try {
			validateGoods();
		} catch (Exception e) {
			logger.debug("Exception @ "+e);
			e.printStackTrace();
		}
		if(!hasActionErrors())
		{
			if(applicationNo==null || "".equals(applicationNo))
			{
				applicationNo = service.getApplicationNo();
			}
			if(!"RA".equalsIgnoreCase(quoteStatus)){
				service.addCommodity(applicationNo, StringUtils.defaultIfEmpty(refNo, applicationNo), chosenCommList);
			}else{
				service.updateCommodity(applicationNo, chosenCommList);
			}
			String value="<script type='text/javascript'>window.opener.document.getElementById('applicationNo').value='"+applicationNo+"';window.close();</script>";
			byte[] byteArray = value.getBytes();
			inputStream=new ByteArrayInputStream(byteArray);
			return STREAM;
		}else
		{
			return COMMODITY;
		}
	}*/
	public String coreCustomerSearch()
	{
		return "coreCustomer";
	}
	public String customerSelection()
	{
		logger.info("brokerCode"+brokerCode);		
		if(StringUtils.isNotEmpty(brokerCode)){
			loginId=service.getBrokerLoginId(brokerCode);
		}	
		if(searchValue==null && coreSearchValue==null)
		{
			return "customerSelection";
		}
		else{
			return "customerSearchList";
		}	
	}
	public String lcSelection() {
		logger.info("Enter Method lcSelection");
		if(StringUtils.isBlank(searchValue))
			return "lcSelection";
		else
			return "lcSearchList";
	}
	public String customerPopulate() {
		logger.info("city:"+city);	
		String value="<script type='text/javascript'>window.close();</script>";
		byte[] byteArray = value.getBytes();
		inputStream=new ByteArrayInputStream(byteArray);
		return STREAM;
	}
	
	/*public void validateGoods() throws Exception {
			double total=0.0;
			this.commodityList=new ArrayList<Object>();
			chosenCommList=new ArrayList<Object>();
			Map<String, String> commInfo=null;
			if (selectCommodity==null || selectCommodity.isEmpty() || ((String)selectCommodity.get(0)).equals("false")) {
				addActionError(getText("error.commodity.oneitem"));
			}
			if (commodityId != null && !commodityId.isEmpty()) {
				for (int i = 0; i < commodityId.size(); i++) {
					commInfo=new LinkedHashMap<String, String>();
					commInfo.put("SELECTED", "false");
					commInfo.put("COMMODITY_ID", commodityId.get(i));
					commInfo.put("COMMODITY_NAME", commodityDesc.get(i));
					commInfo.put("SUM_INSURED", insuredValue.get(i));
					commInfo.put("SUPPLIER_NAME", supplierName.get(i));
					commInfo.put("PACKAGE_DESC", commodityPackDesc.get(i));
					commInfo.put("INVOICE_NUMBER", invoiceNo.get(i));
					commInfo.put("FRAGILE", fragile!=null && "true".equals(fragile.get(i)+"")?"on":"off");
					if (selectCommodity!=null && !selectCommodity.isEmpty()) {
						for (int j = 0; j < selectCommodity.size(); j++) {
							if (commodityId.get(i).equals(selectCommodity.get(j))) {
								commInfo.put("SELECTED", "true");
								commInfo.put("FRAGILE_SELECTED", fragile.get(i)+"");
								if(StringUtils.isBlank(commodityDesc.get(i)))
									addActionError(getText("error.commodity.commodityDesc")+" "+(i+1));
								else if(!Validation.nameValidate(commodityDesc.get(i)))
									addActionError(getText("error.commodity.commodityDesc.invalid")+" "+(i+1));
								
								if(insuredValue.get(i).equals("")){
									addActionError(getText("error.commodity.insuredValue")+" "+(i+1));
								}else if(!Validation.decimalValidate(insuredValue.get(i))){
									addActionError(getText("error.commodity.insuredValue.valid")+" "+(i+1));
								}else{
									total+=Double.parseDouble(insuredValue.get(i));
								}if(StringUtils.isNotEmpty(invoiceNo.get(i)) && oneOff.equals(productId) && "TRUE".equals(service.checkExist(invoiceNo.get(i),"INVOICE",applicationNo))){
									addActionError(getText("error.commodity.invoiceNo.exist")+" "+(i+1));
								}
								if(StringUtils.isNotBlank(supplierName.get(i)) && !Validation.nameValidate(supplierName.get(i)))
									addActionError(getText("error.commodity.supplierName.invalid")+" "+(i+1));
								if(StringUtils.isNotBlank(commodityPackDesc.get(i)) && !Validation.addressValidate(commodityPackDesc.get(i)))
									addActionError(getText("error.commodity.commodityPackDesc.invalid")+" "+(i+1));
								if(StringUtils.isNotBlank(invoiceNo.get(i)) && !StringUtils.isNumeric(invoiceNo.get(i)))
									addActionError(getText("error.commodity.invoiceNo.invalid")+" "+(i+1));
								
								chosenCommList.add(commInfo);
							}
						}
					}
					this.commodityList.add(commInfo);
				}
				this.totalSI=total+"";
		}
	}*/
	public void validateGoods() throws Exception
	{
		double total=0.0;
		this.commodityList=new ArrayList<Object>();
		chosenCommList=new ArrayList<Object>();
		Map<String, String> commInfo=null;
		if (selectCommodity==null || selectCommodity.isEmpty() || ((String)selectCommodity.get(0)).equals("false")) {
			addActionError(getText("error.commodity.oneitem"));
		}
		if (commodityId != null && !commodityId.isEmpty()) {
			for (int i = 0; i < commodityId.size(); i++) {
				commInfo=new LinkedHashMap<String, String>();
				commInfo.put("SELECTED", "false");
				commInfo.put("COMMODITY_ID", commodityId.get(i));
				commInfo.put("COMMODITY_NAME", commodityDesc.get(i));
				//commInfo.put("COMMODITY_TYPE_ID", category);
				commInfo.put("PACKAGE_DESC", commodityPackDesc.get(i));
				commInfo.put("SUM_INSURED", insuredValue.get(i));
				commInfo.put("SUPPLIER_NAME", supplierName.get(i));
				commInfo.put("INVOICE_NUMBER", invoiceNo.get(i));
				commInfo.put("INVOICE_DATE", invoiceDate.get(i));
				commInfo.put("FRAGILE", fragile!=null && "true".equals(fragile.get(i)+"")?"on":"off");
				commInfo.put("EXCESS_DESCRIPTION", excessDesc.get(i));
				commInfo.put("PO_NUMBER", getPoNumber().get(i));
				if (selectCommodity!=null && !selectCommodity.isEmpty()) {
					for (int j = 0; j < selectCommodity.size(); j++) {
						if (commodityId.get(i).equals(selectCommodity.get(j))) {
							commInfo.put("SELECTED", "true");
							commInfo.put("FRAGILE_SELECTED", fragile==null?"false":fragile.get(i)+"");
							if(commodityId.get(i).equals(""))
								addActionError(getText("error.commodity.commodity"));

							if(applicationNo!=null && !"".equals(applicationNo) && !"edit".equals(status2)){
								if(service.getCommodityExist(commodityId.get(i), applicationNo)!=0){
									addActionError(getText("error.commodity.exist"));
								}
							}
							if(StringUtils.isBlank(commodityDesc.get(i)))
								addActionError(getText("error.commodity.commodityDesc"));
							/*	if(StringUtils.isBlank(commodityPackDesc.get(i)))
									addActionError(getText("error.commodity.commodityPackDesc"));
								if(StringUtils.isBlank(commodityPackDesc.get(i)))
									addActionError(getText("error.commodity.commodityPackDesc"));
							 */
							if(insuredValue.get(i).equals(""))
								addActionError(getText("error.commodity.insuredValue"));
							else if(!validation.decimalValidate(insuredValue.get(i)) || 0>=Double.valueOf(insuredValue.get(i)))
								addActionError(getText("error.commodity.insuredValue.valid"));
							else
								total+=Double.parseDouble("".equals(insuredValue.get(i))?"0":insuredValue.get(i));
							
							if(StringUtils.isNotEmpty(invoiceNo.get(i)) && StringUtils.isBlank(endTypeId)){
								String result=null;
								result=service.invoicExist(invoiceNo.get(i),openCoverNo,this);
								if(result!= null&&!"".equalsIgnoreCase(result)){
									addActionMessage(getText("error.commodity.validInvoiceNo.exist")+result); 
								}
							}
							/*if(StringUtils.isBlank(invoiceNo.get(i))) {
								addActionError(getText("error.commodity.invoiceNo")); 
							}*/
							/*else if(!StringUtils.isAlphanumeric(invoiceNo.get(i))) {
								addActionError(getText("error.commodity.validInvoiceNo")); 
							}*/
							
							/*if(StringUtils.isBlank(invoiceDate.get(i)) && StringUtils.isBlank(endTypeId)) {
								addActionError(getText("error.commodity.invoiceDate")); 
							}*/
							chosenCommList.add(commInfo);
						}
					}
					/*if (selectCommodity!=null && !selectCommodity.isEmpty()) {
						for (int j = 0; j < selectCommodity.size(); j++) {
							if (commodityId.get(i).equals(selectCommodity.get(j))) {
								commInfo.put("SELECTED", "true");
								commInfo.put("FRAGILE_SELECTED", fragile.get(i)+"");
								if(StringUtils.isBlank(commodityDesc.get(i)))
									addActionError(getText("error.commodity.commodityDesc")+" "+(i+1));
								else if(!Validation.nameValidate(commodityDesc.get(i)))
									addActionError(getText("error.commodity.commodityDesc.invalid")+" "+(i+1));
								if(insuredValue.get(i).equals("")){
									addActionError(getText("error.commodity.insuredValue")+" "+(i+1));
								}else if(!StringUtils.isNumeric(insuredValue.get(i))){
									addActionError(getText("error.commodity.insuredValue.valid")+" "+(i+1));
								}else{
									total+=Double.parseDouble(insuredValue.get(i));
								}if(StringUtils.isNotEmpty(invoiceNo.get(i)) && oneOff.equals(productId) && "TRUE".equals(service.checkExist(invoiceNo.get(i),"INVOICE",applicationNo))){
									addActionError(getText("error.commodity.invoiceNo.exist")+" "+(i+1));
								}
								if(StringUtils.isNotBlank(supplierName.get(i)) && !Validation.nameValidate(supplierName.get(i)))
									addActionError(getText("error.commodity.supplierName.invalid")+" "+(i+1));
								if(StringUtils.isNotBlank(commodityPackDesc.get(i)) && !Validation.addressValidate(commodityPackDesc.get(i)))
									addActionError(getText("error.commodity.commodityPackDesc.invalid")+" "+(i+1));
								if(StringUtils.isNotBlank(invoiceNo.get(i)) && !StringUtils.isAlphanumeric(invoiceNo.get(i)))
									addActionError(getText("error.commodity.invoiceNo.invalid")+" "+(i+1));


								chosenCommList.add(commInfo);
							}
						}*/
				}
				this.commodityList.add(commInfo);
			}
			this.totalSI=total+"";
		}
	}
	public void validateQuoteInfo()
	{
		if(StringUtils.isBlank(title))
			addActionError(getText("error.quotation.title"));
		if(StringUtils.isBlank(customerName))
			addActionError(getText("error.quotation.customerName"));
		/*else if(!Validation.nameValidate(customerName)) {
			addActionError(getText("error.quotation.customerName.invalid"));
		}*/
		//else if(StringUtils.isNotBlank(channelType) && "customer".equalsIgnoreCase(channelType) && StringUtils.isBlank(coreAppCode)) {
		else if(StringUtils.isBlank(coreAppCode) && !"cash".equalsIgnoreCase(channelType)) {
			addActionError(getText("error.quotation.customer.invalid"));
		}
		if(StringUtils.isNotBlank(address1) && !Validation.addressValidate(address1))
			addActionError(getText("error.quotation.address1.invalid"));
		if(StringUtils.isNotBlank(address2) && !Validation.addressValidate(address2))
			addActionError(getText("error.quotation.address2.invalid"));
		if(StringUtils.isBlank(city))
			addActionError(getText("error.quotation.city"));
		if(StringUtils.isBlank(poBox))
			addActionError(getText("error.quotation.poBox"));
		else if(!StringUtils.isNumeric(poBox))
			addActionError(getText("error.quotation.poBox.valid"));
		if(StringUtils.isNotBlank(address2) && !StringUtils.isNumeric(mobileNo))
			addActionError(getText("error.quotation.mobileNo.valid"));
		if(StringUtils.isNotBlank(email) && "invalid".equalsIgnoreCase(validation.emailValidate(email)))
			addActionError(getText("error.quotation.valid.email"));
		if(StringUtils.isBlank(modeOfTransport))
			addActionError(getText("error.quotation.modeOfTransport"));
		if(StringUtils.isBlank(cover))
			addActionError(getText("error.quotation.cover"));
		if(StringUtils.isBlank(conveyance))
			addActionError(getText("error.quotation.conveyance"));
		if(StringUtils.isBlank(originCountry))
			addActionError(getText("error.quotation.originCountry"));
		if(StringUtils.isBlank(originCity) && "YES".equalsIgnoreCase(originWarehouse))
			addActionError(getText("error.quotation.originCity"));
		if(StringUtils.isBlank(destCountry))
			addActionError(getText("error.quotation.destCountry"));
		if(StringUtils.isBlank(destCity) && "YES".equalsIgnoreCase(destWarehouse))
			addActionError(getText("error.quotation.destCity"));
		if(StringUtils.isBlank(policyStartDate))
			addActionError(getText("error.quotation.policyStartDate"));
		if(StringUtils.isBlank(currency))
			addActionError(getText("error.quotation.currency"));
		if(StringUtils.isBlank(commodity))
			addActionError(getText("error.quotation.commodity"));
		if(StringUtils.isBlank(saleTerm))
			addActionError(getText("error.quotation.saleTerm"));
		if(StringUtils.isBlank(saleTermPercent))
			addActionError(getText("error.quotation.percent"));
		if(StringUtils.isBlank(packageCode))
			addActionError(getText("error.quotation.packageDesc"));
		
		if(StringUtils.isNotBlank(saleTerm) && StringUtils.isNotBlank(saleTermPercent)) {
			try {
				double salePercentValue = service.getSaleTermValue(saleTermPercent,belongingBranch);
				double toleranceValue = service.getToleranceValue(tolerance,belongingBranch);
				if(salePercentValue+toleranceValue>30) {
					addActionError(getText("error.quotation.IncotermsLimit"));
				}
			}
			catch(Exception exception) {
				logger.debug(exception);
			}
		}
		/*	if(StringUtils.isBlank(lcBank) 
			&& ( openCover.equals(productId) 
				|| (StringUtils.isBlank(lcBank) && StringUtils.isNotBlank(lcNo)
					) 
				) 
			) {
			addActionError(getText("error.quotation.lcBank"));
		}
		if(StringUtils.isBlank(lcNo) 
			&& ( openCover.equals(productId) 
				|| (StringUtils.isBlank(lcNo) && StringUtils.isNotBlank(lcBank)
					) 
				) 
			) {
			addActionError(getText("error.quotation.lcNo"));
		}
		
		if(StringUtils.isBlank(lcDate) && openCover.equals(productId))
			addActionError(getText("error.quotation.lcDate"));
		if(StringUtils.isBlank(lcCurrency) && openCover.equals(productId))
			addActionError(getText("error.quotation.lcCurrency"));
		if(StringUtils.isBlank(lcAmount) && openCover.equals(productId))
			addActionError(getText("error.quotation.lcAmount"));
		else if(StringUtils.isNotBlank(lcAmount) && !Validation.decimalValidate(lcAmount) && openCover.equals(productId))
			addActionError(getText("error.quotation.invalid.lcAmount"));
		if(StringUtils.isNotBlank(lcNo) && openCover.equals(productId)){
			//String existLcId=service.lcNoExist(lcNo);
			List lcList=service.lcSelectionList((String)session.get("openCoverNo"), lcNo,"Y");
			if(lcList!=null && lcList.size()>0){
				Map map=(Map)lcList.get(0);
				if(StringUtils.isNotBlank(lcAmount) && StringUtils.isNotBlank(lcexchageValue) && (Double.parseDouble(lcAmount)*Double.parseDouble(lcexchageValue)<Double.parseDouble(map.get("LC_BALANCE_AMOUNT").toString())))
					addActionError("LC Amount should be greater than "+map.get("LC_BALANCE_AMOUNT").toString());
			}
			else
		}*/
		if(StringUtils.isNotEmpty(lcNo) && oneOff.equals(productId) && StringUtils.isBlank(endTypeId) && "TRUE".equals(service.checkExist(lcNo,"LCNO",applicationNo,"")))	
			addActionError(getText("error.quotation.lcNo.exist"));
		if(StringUtils.isNotEmpty(lcNo) && openCover.equals(productId) && StringUtils.isBlank(endTypeId) && "TRUE".equals(service.checkExist(lcNo,"LCNOOC",applicationNo,openCoverNo)))	
			addActionError(getText("error.quotation.lcNo.exist"));
		if(("Y".equalsIgnoreCase(partialShipment) || "M".equalsIgnoreCase(partialShipment)) && openCover.equals(productId)){
			Double partialAmt;
			if (StringUtils.isBlank(shipmentExposure))
				addActionError(getText("error.quotation.shipmentExposure"));
			else if(!NumberUtils.isNumber(shipmentExposure))
				addActionError(getText("error.quotation.shipmentExposure.number"));
			else if(shipmentExposure.length() > 0 && ( Double.parseDouble( shipmentExposure ) == 0)){
				addActionError(getText("error.quotation.shipmentExposure.zero"));
				if(!"".equalsIgnoreCase(exposureCurrency) && !"".equalsIgnoreCase(currency)){
					partialAmt=Double.parseDouble(shipmentExposure)*Double.parseDouble(exposureCurrency);
					if(partialAmt > (Double.parseDouble(totalSI)*Double.parseDouble(currency)))
						addActionError(getText("error.quotation.shipmentGrater"));
				}
			}
			if("".equalsIgnoreCase(exposureCurrency))
				addActionError(getText("error.quotation.exposureCurrency"));
		}
		if(StringUtils.isNotBlank(issuer) && "3".equals(productId) && StringUtils.isBlank(channelType))
			addActionError(getText("error.quotation.channel"));
		if(StringUtils.isNotBlank(issuer) && StringUtils.isBlank(brokerCode))
			addActionError(getText("error.quotation.broker"));
		/*if(brokerOne.equals(brokerType) && openCover.equals(productId))
		{
			if(StringUtils.isBlank(custContractNo))
				addActionError(getText("error.quotation.contractNo"));
			if(StringUtils.isBlank(custFmsCaseNo))
				addActionError(getText("error.quotation.fmsCaseNo"));
			if(StringUtils.isBlank(custRefNo))
				addActionError(getText("error.quotation.brokerRefNo"));
		}*/
		/*if(StringUtils.isNotBlank(lcBank) && !Validation.nameValidate(lcBank)&& openCover.equals(productId))
			addActionError(getText("error.quotation.lcBank.invalid"));*/
		/*if(StringUtils.isNotBlank(lcNo) && !Validation.addressValidate(lcNo)&& openCover.equals(productId))
			addActionError(getText("error.quotation.lcNo.invalid"));*/
		if(StringUtils.isNotBlank(blNo) && !Validation.addressValidate(blNo))
			addActionError(getText("error.quotation.blNo.invalid"));
		//else if(!StringUtils.isAlpha(agentOthers))
		if(StringUtils.isBlank(agentOthers) && "0".equalsIgnoreCase(settlingAgent))
			addActionError(getText("error.quotation.agentOthers"));
		/*else if(!StringUtils.isAlphaSpace(agentOthers))
			addActionError(getText("error.quotation.agentOthers.invalid"));*/
		if(StringUtils.isNotBlank(issuer) && StringUtils.isBlank(executive))
			addActionError(getText("error.quotation.executive"));
		if(StringUtils.isNotBlank(promotionalCode) && service.checkValidPromotionalCode(promotionalCode, branchCode)<=0)
			addActionError("Please enter valid Promotional Code");
		if(StringUtils.isBlank(exchageValue))
			addActionError("Please Enter the Exchange Value");
		if(openCover.equalsIgnoreCase(productId) && StringUtils.isNotBlank(policyStartDate)){
			String openCoverExpDate = service.getSingleInfo("GET_OPEN_COVER_EXPIRTY_DATE",new String[]{openCoverNo});
			try{
				SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
				Date date1 = sdf.parse(openCoverExpDate);
				Date date2 = sdf.parse(policyStartDate);
				if(date1.compareTo(date2)<0){
					addActionError(getText("policy.start.date.invalid"));
				}
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		///validate CommodityWise Coverage Referral
		List<Map<String, Object>> importList=service.searchList(applicationNo,belongingBranch);
		if(importList!=null && importList.size()>0){
			for(int i=0;i<importList.size();i++){
				Map<String,Object> temp=(Map<String,Object>)importList.get(i);
				String commodityId=temp.get("COMMODITY_CODE")==null?"0":temp.get("COMMODITY_CODE").toString();
				String commodityName=temp.get("COMMODITY_NAME")==null?"0":temp.get("COMMODITY_NAME").toString();
				if(service.validateCoverReferral(commodityId,belongingBranch,cover)>0&&"3".equalsIgnoreCase(productId)) {
					addActionError(getText("error.quotation.cover.invalid", new String[]{commodityName}));
				}
			}	
		}
		if(hasActionErrors()){
			policyStartDate=StringUtils.isNotBlank(policyStartDate)?dateFormat(policyStartDate):"";
			blDate=StringUtils.isNotBlank(blDate)?dateFormat(blDate):"";
			sailingDate=StringUtils.isNotBlank(sailingDate)?dateFormat(sailingDate):"";
			lcDate=StringUtils.isNotBlank(lcDate)?dateFormat(lcDate):"";
		}
		if(!hasActionErrors()){
			if(StringUtils.isNotEmpty(commodity) && openCover.equalsIgnoreCase(productId) && StringUtils.isBlank(endTypeId)){
				String update = service.updateExcessDesc(cover,applicationNo,openCoverNo);
			}
		}
	}
	public String dateFormat(String name){
		String arr[]=name.split("/");
		 return arr[0]+"/"+arr[1]+"/"+arr[2];
	}
	public String getStatus1() {
		return status1;
	}
	public void setStatus1(String status1) {
		this.status1 = status1;
	}
	public String getStatus2() {
		return status2;
	}
	public void setStatus2(String status2) {
		this.status2 = status2;
	}
	public List<Map<String, Object>> getViewList() {
		return viewList;
	}
	public void setViewList(List<Map<String, Object>> viewList) {
		this.viewList = viewList;
	}
	public String getCommodityCode() {
		return commodityCode;
	}
	public void setCommodityCode(String commodityCode) {
		this.commodityCode = commodityCode;
	}
	public String getFrgile(){
		String result=service.getFragile(getCategory(),openCoverNo);
		 if("off".equalsIgnoreCase(result)){
			request.setAttribute(FIELD, "fragileoff");		
		}else{
			request.setAttribute(FIELD, "fragileon");			
		}		
		return DROPDOWN;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getCategory() {
		return category;
	}
	public List<String> getInvoiceDate() {
		return invoiceDate;
	}
	public void setInvoiceDate(List<String> invoiceDate) {
		this.invoiceDate = invoiceDate;
	}
	public String getChannelType() {
		return channelType;
	}
	public void setChannelType(String channelType) {
		this.channelType = channelType;
	}
	public String getCoreSearchValue() {
		return coreSearchValue;
	}
	public void setCoreSearchValue(String coreSearchValue) {
		this.coreSearchValue = coreSearchValue;
	}
	public void setExchageValue(String exchageValue) {
		this.exchageValue = exchageValue;
	}
	public String getExchageValue() {
		return exchageValue;
	}
	public void setVia(String via) {
		this.via = via;
	}
	public String getVia() {
		return via;
	}
	public void setFinalizeYN(String finalizeYN) {
		this.finalizeYN = finalizeYN;
	}
	public String getFinalizeYN() {
		return  StringUtils.isBlank(finalizeYN)?"N":finalizeYN;
	}
	public void setEditClausesYN(String editClausesYN) {
		this.editClausesYN = editClausesYN;
	}
	public String getEditClausesYN() {
		return editClausesYN;
	}
	public void setPremiumYN(String premiumYN) {
		this.premiumYN = premiumYN;
	}
	public String getPremiumYN() {
		return premiumYN;
	}
	public void setExcessDesc(List<String> excessDesc) {
		this.excessDesc = excessDesc;
	}
	public List<String> getExcessDesc() {
		return excessDesc;
	}
	public void setRateChange(String rateChange) {
		this.rateChange = rateChange;
	}
	public String getRateChange() {
		return rateChange;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getBrokerId() {
		return brokerId;
	}
	public void setBrokerId(String brokerId) {
		this.brokerId = brokerId;
	}
	public void setPoNumber(List<String> poNumber) {
		this.poNumber = poNumber;
	}
	public List<String> getPoNumber() {
		return poNumber;
	}
	public void setCustomerNameAr(String customerNameAr) {
		this.customerNameAr = customerNameAr;
	}
	public String getCustomerNameAr() {
		return customerNameAr;
	}
	/**
	 * @return the consignedFrom
	 */
	public List<String> getConsignedFrom() {
		return consignedFrom;
	}
	/**
	 * @param consignedFrom the consignedFrom to set
	 */
	public void setConsignedFrom(List<String> consignedFrom) {
		this.consignedFrom = consignedFrom;
	}
	/**
	 * @return the consignedTo
	 */
	public List<String> getConsignedTo() {
		return consignedTo;
	}
	/**
	 * @param consignedTo the consignedTo to set
	 */
	public void setConsignedTo(List<String> consignedTo) {
		this.consignedTo = consignedTo;
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
	/**
	 * @return the quotationInfo
	 */
	public List<Map<String, Object>> getQuotationInfo() {
		return quotationInfo;
	}
	/**
	 * @param quotationInfo the quotationInfo to set
	 */
	public void setQuotationInfo(List<Map<String, Object>> quotationInfo) {
		this.quotationInfo = quotationInfo;
	}
	/**
	 * @return the insuredGoodsInfo
	 */
	public List<Map<String, Object>> getInsuredGoodsInfo() {
		return insuredGoodsInfo;
	}
	/**
	 * @param insuredGoodsInfo the insuredGoodsInfo to set
	 */
	public void setInsuredGoodsInfo(List<Map<String, Object>> insuredGoodsInfo) {
		this.insuredGoodsInfo = insuredGoodsInfo;
	}
	/**
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}
	/**
	 * @param status the status to set
	 */
	public void setStatus(String status) {
		this.status = status;
	}
	/**
	 * @return the aplicationNo
	 */
	public String getAplicationNo() {
		return aplicationNo;
	}
	/**
	 * @param aplicationNo the aplicationNo to set
	 */
	public void setAplicationNo(String aplicationNo) {
		this.aplicationNo = aplicationNo;
	}
	/**
	 * @return the loginUserType
	 */
	public String getLoginUserType() {
		return loginUserType;
	}
	/**
	 * @param loginUserType the loginUserType to set
	 */
	public void setLoginUserType(String loginUserType) {
		this.loginUserType = loginUserType;
	}
	/**
	 * @return the policyInformation
	 */
	public List<Map<String, Object>> getPolicyInformation() {
		return policyInformation;
	}
	/**
	 * @param policyInformation the policyInformation to set
	 */
	public void setPolicyInformation(List<Map<String, Object>> policyInformation) {
		this.policyInformation = policyInformation;
	}
	
/*	private void alertmessage (String message) {

		PrintWriter out ;
		HttpServletResponse response = ServletActionContext.getResponse ();
		//response.setCharacterEncoding ("utf-8");
		try {
		out = response.getWriter ();
		out.println ("<script type='text/javascript'>");
		out.println ("alert ('" + message + "');");
		out.println ("</script>");
		//out . flush ();
		} catch (IOException e) {
		e.printStackTrace ();
		}
		}*/
	
	public String getEndtType() {
		return service.selectedEndorsements(applicationNo);
	}

	/**
	 * @return the isEndt
	 */
	public boolean isEndt() {
		//return service.isEndt(applicationNo);
		return new PremiumService().isEndorsement(applicationNo);
	}

	/**
	 * @return the isFinancial
	 */
	public boolean isFinancial() {
		return new PremiumService().isFinancial(applicationNo);
	}
	
	
}
