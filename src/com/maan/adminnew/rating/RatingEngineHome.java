package com.maan.adminnew.rating;

import java.util.List;
import java.util.Map;


import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class RatingEngineHome extends ActionSupport implements ModelDriven<RatingEngineBean>{
	private static final long serialVersionUID = 1L;
	RatingEngineService rservice=new RatingEngineService();
	RatingEngineBean bean=new RatingEngineBean();
	Map<String, Object> session=ActionContext.getContext().getSession();
	String branchCode=(String)session.get("BranchCode");
	private List<Object> transportList;
	private List<Object> conveyanceList;
	private List<Object> countryList;
	private List<Object> bankList;
	private List<Object> materialList;
	private List<Object> warrateList;
	private List<Object> saletermList;
	private List<Object> toleranceList;
	private List<Object> comExList;
	private List<Object> vesselList;
	private List<Object> extraCoverList;
	private List<Object> cityList;
	private List<Object> warrantyList;
	private List<Object> constantList;
	private List<Object> countryDetList;
	private List<Object> coverages;
	private List<Object> covey;
	private List<Object> commodityList;
	private List<Object> currencyList;
	private List<Object> exchangeList;
	private List<Object> coverList;
	private List<Object> exclusionList;
	private List<Object> errorList;
    private List<Object> clauseIDList;
	public List<Object> getExclusionList()
	{
		return exclusionList;
	}
public String getExList()
	{
		exclusionList=rservice.getExclusionList(branchCode);
		return "exclusion";
	}
public String exclusion()
	{
		exclusionList=rservice.getExclusionList(branchCode);
		return "exclusion";
	}

	public List<Object> getCoverList() {
		return coverList;
	}
	public List<Object> getExchangeList() {
		return exchangeList;
	}
	public List<Object> getCurrencyList() {
		return currencyList;
	}
	public List<Object> getCommodityList() {
		return commodityList;
	}
	public List<Object> getCovey() {
		return covey;
	}
	public List getBaserateCountry() {
		return rservice.getBaserateCountry();
	}
	public List getBaserateCommodity() {
		return rservice.getBaserateCommodity(branchCode);	
	}
	public List<Object> getCoverages() {
		return coverages;
	}
	
	public List<Object> getCountryDetList() {
		return countryDetList;
	}
	public List<Object> getConstantList() {
		return constantList;
	}
	public List<Object> getCityList()
	{
		return cityList;
	}
	public List<Object> getExtraCoverList()
	{
		return extraCoverList;
	}
	
	public List<Object> getWarrantyList() {
		return warrantyList;
	}
	public List<Object> getVesselList() {
		return vesselList;
	}
	
	public List<Object> getComExList() {
		return comExList;
	}
	
	public List<Object> getToleranceList() {
		return toleranceList;
	}
	
	public List<Object> getSaletermList() {
		return saletermList;
	}
	
	public List<Object> getWarrateList() {
		return warrateList;
	}
	
    public List<Object> getBankList()
    {
    	return bankList;
    }
    public List<Object> getMaterialList()
    {
    	return materialList;
    }
	
	public List<Object> getCountryList()
	{
		return countryList;
	}
	
	public List<Object> getConveyanceList() {
		return conveyanceList;
	}
	
	public List<Object> getTransportList()
	{
		return transportList;
	}
	public List <String> getConveyance()
	{
		return rservice.getConveyance(branchCode);
	}
	public List <String> getTransports()
	{
		return rservice.getTransports(branchCode);
	}
	
	public List <String> getCategories()
	
	{
		return rservice.getCategories(branchCode);
	}
	public List <String> getCountries()
	{
		return rservice.getCountries(branchCode);
	}
	
	public List<String> getBank()
	{
		return rservice.getBank();
	}
	public List<String> getBranch()
	{
		return rservice.getBranch();
	}
	public List<String> getWarrates()
	{
		return rservice.getWarrates(branchCode);
	}
	public List<String> getMaterials()
	{
		return rservice.getMaterials(branchCode);
	}
	public List<String> getSaleterms()
	{
		return rservice.getSaleterms(branchCode);
	}
	public String conveyance()
	{
		conveyanceList=rservice.getConveyList(branchCode);
		return "conveyanceList";
	}
	public String countrymas()
	{
		countryList=rservice.getCountryList(branchCode);
		return "countryList";
	}
	public String country()
	{
		countryDetList=rservice.getCountryDetList();
		return "country";
	}
	public String commodity()
	{
		Object[] val={branchCode,branchCode};
		commodityList=rservice.getCommodityList(val);
		return "commodity";
	}
	public String bank()
	{
		bankList=rservice.getBankList();
		return "bankList";
	}
	public String material()
	{
		materialList=rservice.getMaterialList(branchCode);
		return "material";
	}
	public String warrate()
	{
		warrateList=rservice.getWarrateList(branchCode);
		return "warrate";
	}
	public String saleterm()
	{
		saletermList=rservice.getSaletermList(branchCode);
		return "saleterm";
	}
	public String tolerance()
	{
		toleranceList=rservice.getToleranceList(branchCode);
		return "tolerance";
	}
	public String commodityexcess()
	{
		comExList=rservice.getComExList(branchCode);
		return "commodityexcess";
	}
	public String vessel()
	{
		vesselList=rservice.getVesselList();
		return "vessel";
	}
	public String setting()
	{
		agentList=rservice.getAgentList(branchCode);
		return "setting";
	}
	public String exchange()
	{
		exchangeList=rservice.getExchangeList();
		return "exchange";
	}
	public String baserate()
	{
		return "baserate";
	}
	public String currency()
	{
		currencyList=rservice.getCurrencyList();
		return "currency";
	}
	public String extracover()
	{
		extraCoverList=rservice.getExtraCoverList(branchCode);
		return "extracover";
	}
	
	public String transport()
	{
		transportList=rservice.getAdminTransportList(branchCode);
		return "transport";
	}
	public String warranty()
	{
		warrantyList=rservice.getWarrantyList(branchCode);
		return "warranty";
	}
	public String constant()
	{
		constantList=rservice.getConstantList(branchCode);
		return "constant";
	}
	
	public String city()
	{
		cityList=rservice.getCityList(bean);
		return "city";
	}
	public String clauseid()
	{
		clauseIDList=rservice.getClauseIDList(branchCode);
		return "clauseid";
	}
	public String cover()
	{
		Object[] val={branchCode,branchCode};
		coverList=rservice.getCoverList(val);
		return "cover";
	}
	public String error()
	{
		errorList=rservice.getErrorList(branchCode);
		return "error";
	}
	public String editTransport()
	{
		return "editTransport";
	}
	public String addError()
	{
		return "addError";
	}
	public String getTransportListAjax(){
    	if("transportLists".equals(bean.getReqFrom())){
    		transportList=rservice.getTransportListAjax(branchCode, bean.getSearchBy(), bean.getSearchValue());
    	}
    	return "adminAjax";
    }
	public String getTList(){
    	transportList=rservice.getAdminTransportList(branchCode);
		
    	return "transportList";
    }
	public String getConveyList()
	{
		conveyanceList=rservice.getConveyList(branchCode);
		return "conveyanceList";
	}
	public String getCList()
	{
		countryList=rservice.getCountryList(branchCode);
		return "countryList";
	}
	public String getBList()
	{
		bankList=rservice.getBankList();
		return "bankList";
	}
	public String getMList()
	{
		materialList=rservice.getMaterialList(branchCode);
		return "material";
	}
	public String getWList()
	{
		warrateList=rservice.getWarrateList(branchCode);
		return "warrate";
	}
	public String getSaleList()
	{
		saletermList=rservice.getSaletermList(branchCode);
		return "saleterm";
	}
	public String getToleList()
	{
		toleranceList=rservice.getToleranceList(branchCode);
		return "tolerance";
	}
	public String getCEList()
	{
		comExList=rservice.getComExList(branchCode);
		return "commodityexcess";
	}
	public String getVList()
	{
		vesselList=rservice.getVesselList();
		return "vessel";
	}
	public String getECoverList()
	{
		extraCoverList=rservice.getExtraCoverList(branchCode);
		return "extracover";
	}
	public String getERRList()
	{
		errorList=rservice.getErrorList(branchCode);
		return "error";
	}
	public String getCitysList()
	{
		cityList=rservice.getCityList(bean);
		return "city";
	}
	public String getWRList()
	{
		warrantyList=rservice.getWarrantyList(branchCode);
		return "warranty";
	}
	public String getCONList()
	{
		constantList=rservice.getConstantList(branchCode);
		return "constant";
	}
	public String getCDList()
	{
		countryDetList=rservice.getCountryDetList();
		return "country";
	}
	public String getComList()
	{
		Object[] val={branchCode,branchCode};
		commodityList=rservice.getCommodityList(val);
		return "commodity";
	}
	public String getCURList()
	{
		currencyList=rservice.getCurrencyList();
		return "currency";
	}
	public String getEXList()
	{
		exchangeList=rservice.getExchangeList();
		return "exchange";
	}
	public String getCOVList()
	{
		Object[] val={branchCode,branchCode};
		coverList=rservice.getCoverList(val);
		return "cover";
	}
private List<Object> agentList;
	
	public List<Object> getAgentList()
	{
		return agentList;
	}


public String getSAgentList()
	{
		agentList=rservice.getAgentList(branchCode);
		return "setting";
	}
	
	public RatingEngineBean getModel() {
		
		return bean;
	}
	public void setClauseIDList(List clauseIDList)
    {
        this.clauseIDList = clauseIDList;
    }

    public List getCoverName()
    {
        throw new Error("Unresolved compilation problem: \n\tType mismatch: cannot convert from List<String> to List<Object>\n");
    }

    public List getClauseIDList()
    {
        return clauseIDList;
    }
    
    public List<Object> getErrorList()
    {
        return errorList;
    }
	

}
