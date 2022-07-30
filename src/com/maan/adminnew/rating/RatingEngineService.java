package com.maan.adminnew.rating;

import java.util.List;
import java.util.Map;

public class RatingEngineService {

	RatingEngineDAO dao=new RatingEngineDAO();

	public void getTransportMode(Object[] val)
	{
		dao.getTransportMode(val);
	}
	public void getUpdateTransportMode(Object[] val)
	{
		dao.getUpdateTransportMode(val);
	}
	public List <String> getTransports(String branchCode)
	{
		return dao.getTransports(branchCode);
	}
	public List <String> getCommcategList(String branchCode)
	{
		return dao.getCommcategList(branchCode);
	}
	public List <String> getProductsDET(String branchCode)
	{
		return dao.getProductsDET(branchCode);
	}
	public List <String> getStage()
	{
		return dao.getStage();
	}
	public void getSeletedTransport(RatingEngineBean bean)
	{
		dao.getSeletedTransport(bean);
	}
	public void getNewError(Object[] val)
	{
		dao.getNewError(val);
	}
	public void getNewConveyance(Object[] val)
	{
		dao.getNewConveyance(val);

	}
	public List<String> getConveyance(String branchCode)
	{

		return dao.getConveyance(branchCode);
	}
	public void getSeletedConveyance(RatingEngineBean bean)
	{
		dao.getSeletedConveyance(bean);

	}
	public void getUpdateConveyance(Object[] val,String string)
	{
		dao.getUpdateConveyance(val,string);

	}
	public void getAddCountry(Object[] val)
	{
		dao.getAddCountry(val);

	}

	public void getSelectedCountry(RatingEngineBean bean) 
	{
		dao.getSeletedCountry(bean);


	}
	public void getUpdateCountry(Object[] val,String string) {
		dao.getUpdateCountry(val,string);

	}
	public void getAddBank(Object[] val) {
		dao.getAddBank(val);

	}
	public List<String> getBank() {

		return dao.getBank();
	}
	public List<String> getBranch()
	{
		return dao.getBranch();
	}
	/*public void getSelectBank(RatingEngineBean bean) {
		dao.getSelectedBank(bean);

	}*/
	public void getSelectBank(RatingEngineBean bean, String branchCode) {
		dao.getSelectedBank(bean,branchCode);

	}
	public void getSelectedMaterial(RatingEngineBean bean)
	{
		dao.getSeletedMaterial(bean);
	}
	public void getUpdateBank(Object[] val,String string) {
		dao.getUpdateBank(val,string);

	}
	public List<String> getMaterials(String branchCode)
	{
		return dao.getMaterials(branchCode);
	}
	public void getNewMaterial(Object[] val)
	{
		dao.getNewMaterial(val);
	}
	public void getUpdateMaterial(Object[] val,String string)
	{
		dao.getUpdateMaterial(val,string);
	}
	public void getNewWar(Object[] val) {
		dao.getNewWar(val);

	}
	public List<String> getWarrates(String branchCode)
	{
		return dao.getWarrates(branchCode);
	}
	public void getSelectedWar(RatingEngineBean bean) {
		dao.getSelectedWar(bean);

	}
	public void getSelectedCat(RatingEngineBean bean) {
		dao.getSelectedCat(bean);

	}
	public void getSelectedCovercomm(RatingEngineBean bean) {
		dao.getSelectedCovercomm(bean);

	}
	public void getUpdateWar(Object[] val,String string) {
		dao.getUpdateWar(val,string);

	}
	public List<String> getSaleterms(String branchCode)
	{
		return dao.getSaleterms(branchCode);
	}


	public List <Object> getAdminTransportList(String branchCode){
		return dao.getAdminTransportList(branchCode);
	}
	public List<Object> getTransportListAjax(String branchCode, String searchBy, String searchValue){
		return dao.getTransportListAjax(branchCode, searchBy, searchValue);
	}
	public List<Object> getConveyList(String branchCode)
	{
		return dao.getConveyList(branchCode);
	}
	public List<RatingEngineBean>getConveyList(String branchCode,String searchField,String searchString,String searchOper)
	{
		return dao.getConveyList(branchCode,searchField,searchString,searchOper);
	}
	/*public List<Object> getConveyListAjax(String branchCode, String searchBy, String searchValue)
	{
		return dao.getConveyListAjax(branchCode, searchBy, searchValue);
	}*/
	public List<Object> getConveyModeListAjax(String branchCode, String mode)
	{
		return dao.getConveyModeListAjax(branchCode,mode);
	}
	public List<Object> getCountryList(String branchCode)
	{
		return dao.getCountry(branchCode);
	}
	public List<RatingEngineBean> getCountryList(String searchField,String searchString,String searchOper)
	{
		return dao.getCountryList(searchField,searchString,searchOper);
	}
	public List<Object> getCountryListAjax(String searchBy, String searchValue) {
		return dao.getCountryListAjax(searchBy, searchValue);
	}
	public List<Object> getBankList()
	{
		return dao.getBankList();
	}
	public List<Object> getBankListAjax(String searchBy, String searchValue)
	{
		return dao.getBankListAjax(searchBy, searchValue);
	}
	public List<String> getCountries(String branchCode)
	{
		return dao.getCountries(branchCode);
	}
	public List<Object> getMaterialList(String branchCode)
	{
		return dao.getMaterialList(branchCode);
	}
	public List<RatingEngineBean> getMaterialsList(String branchCode)
	{
		return dao.getMaterialsList(branchCode);
	}
	public List<Object> getMaterialListAjax(String branchCode,String searchBy,String searchValue)
	{
		return dao.getMaterialListAjax(branchCode,searchBy,searchValue);
	}
	public List<Object> getWarrateList(String branchCode) {
		return dao.getWarrateList(branchCode);

	}
	public List<Object> getWarrateListAjax(String branchCode, String searchBy,
			String searchValue) {
		return dao.getWarrateListAjax(branchCode,searchBy,searchValue);
	}
	public List<Object> getSaletermList(String branchCode) {
		return dao.getSaletermList(branchCode);

	}
	public List<Object> getSaletermListAjax(String branchCode, String searchBy,
			String searchValue) {
		return dao.getSaletermListAjax(branchCode,searchBy,searchValue);
	}
	public void getNewSale(Object[] val)
	{
		dao.getNewSale(val);
	}
	public void getSelectedSale(RatingEngineBean bean)
	{
		dao.getSelectedSale(bean);
	}
	public void getUpdateSale(Object[] val)
	{
		dao.getUpdateSale(val);
	}
	public void getAddTole(Object[] val)
	{
		dao.getAddTole(val);
	}
	public List<Object> getToleranceList(String branchCode)
	{
		return dao.getToleranceList(branchCode);
	}
	public void getSelectedTole(RatingEngineBean bean)
	{
		dao.getSelectedTole(bean);
	}
	public List<Object> getToleranceListAjax(String branchCode,
			String searchBy, String searchValue) {
		return dao.getToleranceListAjax(branchCode,searchBy,searchValue);
	}
	public int getDateExist(Object[] val,String str)
	{
		return dao.getDateExist(val, str);
	}
	public int getNameExist(Object[] val,String str)
	{
		return dao.getNameExist(val, str);
	}
	public void getUpdateTole(Object[] val)
	{
		dao.getUpdateTole(val);
	}
	public List <Object> getComExList(String branchCode)
	{
		return dao.getComExList(branchCode);
	}
	public List<Object> getComExListAjax(String branchCode, String searchBy,
			String searchValue) {
		return dao.getComExListAjax(branchCode,searchBy,searchValue);
	}
	public void getAddComEx(Object[] val) {
		dao.getAddComEx(val);

	}
	public void getUpdateComEx(Object[] val,String string) {
		dao.getUpdateComEx(val,string);

	}
	public void getselectedComEx(RatingEngineBean bean) {
		dao.getselectedComEx(bean);

	}
	public List<Object> getVesselList()
	{
		return dao.getVesselList();
	}
	public void getSelectedVessel(RatingEngineBean bean) {
		dao.getSelectedVessel(bean);

	}
	public List<Object> getVesselListAjax(String searchBy, String searchValue) {
		return dao.getVesselListAjax(searchBy, searchValue);
	}
	public void getNewExtraCover(Object[] val) {
		dao.getNewExtraCover(val);

	}
	public List<Object> getExtraCoverList(String branchCode) {
		return dao.getExtraCoverList(branchCode);
	}
	public void getNewCity(Object[] val) {
		dao.getNewCity(val);

	}
	public List<Object> getCityList(RatingEngineBean bean) {
		return dao.getCityList(bean);
	}
	public void getUpdateExraCover(Object[] val) {
		dao.getUpdateExraCover(val);

	}
	public void getSelectedExtraCover(RatingEngineBean bean) {
		dao.getSelectedExtraCover(bean);

	}
	public void getSelectedCity(RatingEngineBean bean) {
		dao.getSelectedCity(bean);

	}
	public List<Object> getExtraCoverListAjax(String branchCode,
			String searchBy, String searchValue) {
		return dao.getExtraCoverListAjax(branchCode, searchBy, searchValue);

	}
	public List<Object> getCityListAjax(String searchBy, String searchValue) {
		return dao.getCityListAjax(searchBy, searchValue);
	}
	public void getVessel(Object[] val) {
		dao.getVessel(val);

	}
	public void getUpdateVessel(Object[] val) {
		dao.getUpdateVessel(val);

	}
	public void getNewWarranty(Object[] val) {
		dao.getNewWarranty(val);

	}
	public void getUpdateWarranty(Object[] val) {
		dao.getUpdateWarranty(val);

	}
	public void getSelectedWarranty(RatingEngineBean bean) {
		dao.getSelectedWarranty(bean);

	}
	public List<Object> getWarrantyList(String branchCode) {
		return dao.getWarrantyList(branchCode);
	}
	public List<Object> getWarrantyListAjax(String branchCode, String searchBy,
			String searchValue) {
		return dao.getWarrantyListAjax(branchCode,searchBy,searchValue);
	}
	public List<Object> getConstantList(String branchCode)
	{
		return dao.getConstantList(branchCode);
	}
	public List<Object> getConstantListAjax(String branchCode,String searchBy,String searchValue)
	{
		return dao.getConstantListAjax(branchCode, searchBy, searchValue);
	}
	public List<String> getCategories(String branchCode) {
		return dao.getCategories(branchCode);
	}
	public void getUpdateConstantMaster(RatingEngineBean bean) {
		dao.getUpdateConstantMaster(bean);
	}
	public void getNewConstant(Object[] val)
	{
		dao.getNewConstant(val);
	}
	public void getSelectedConstantMaster(RatingEngineBean bean) {
		dao.getSelectedConstantMaster(bean);
	}
	public void getSelectedConstant(RatingEngineBean bean)
	{
		dao.getSelectedConstant(bean);
	}
	public void getUpdateConstant(Object[] val)
	{
		dao.getUpdateConstant(val);
	}
	public void getUpdateCity(Object[] val) {
		dao.getUpdateCity(val);

	}
	public List<RatingEngineBean> getCountryDetList(String searchField,String searchString,String searchOper) {
		return dao.getCountryDetList(searchField,searchString,searchOper);
	}
	public List<Object> getCountryDetListAjax(String searchBy,String searchValue)
	{
		return dao.getCountryDetListAjax(searchBy, searchValue);
	}
	public void getNewCountryDet(Object[] val) {
		dao.getNewCountryDet(val);

	}
	public List<Object> getCountryDetList() {
		return dao.getCountryDetList();

	}
	public void getSelectedCountryDet(RatingEngineBean bean) {
		dao.getSelectedCountryDet(bean);

	}
	public void getUpdateCountryDet(Object[] val,String string) {
		dao.getUpdateCountryDet(val,string);

	}
	public List<Object> getCoverages(String searchValue ,String branchCode) {
		return dao.getCoverages(searchValue,branchCode);
	}
	public List<Object> getCoveragesadd(String searchValue ,String branchCode) {
		return dao.getCoveragesadd(searchValue,branchCode);
	}
	public List<Object> getCovey(String searchValue, String branchCode)
	{
		return dao.getCovey(searchValue, branchCode);
	}
	public List<Object> getBaserateCountry()
	{
		return dao.getBaserateCountry();
	}
	public List<Object> getBaserateCommodity(String branchCode)
	{
		return dao.getBaserateCommodity(branchCode);
	}
	public List<Object> getAgentList(String branchCode) {
		return dao.getAgentList(branchCode);
	}
	public List<Object> getAgentListAjax(String branchCode, String searchBy,
			String searchValue) {
		return dao.getAgentListAjax(branchCode,searchBy,searchValue);

	}
	public List<Object> getCityListAjax1(String countryID) {
		return dao.getCityListAjax1(countryID);

	}
	public void getNewAgent(Object[] val) {
		dao.getNewAgent(val);

	}
	public void getSelectedAgent(RatingEngineBean bean) {
		dao.getSelectedAgent(bean);

	}
	public void getUpdateAgent(Object[] val) {
		dao.getUpdateAgent(val);

	}
	public void getCommodityRate(RatingEngineBean bean, String modeOfTransport,
			String coverage,
			String conveyanceType,
			String destCountryId,
			String commodity,
			String fragile,
			double localSumInsured,
			String branch
	)
	{
		dao.getCommodityRate(bean,modeOfTransport, coverage, conveyanceType, destCountryId, commodity, fragile, localSumInsured, branch);
	}
	public List<Object> getCommodityList(Object[] val)
	{
		return dao.getCommodityList(val);
	}
	public List<Object> getCommodityListAjax(Object[] val,String searchBy)
	{
		return dao.getCommodityListAjax(val,searchBy);

	}
	public List<String> getCommodityType(String branchCode) {
		return dao.getCommodityType(branchCode);
	}
	public void getNewCommodity(Object[] val) {
		dao.getNewCommodity(val);

	}
	public void getSelectedCommdity(RatingEngineBean bean,Object[] val) {
		dao.getSelectedCommodity(bean,val);

	}
	public List<String> getCountriesDetail() {
		return dao.getCountriesDetail();
	}
	public List<String> getNewcountriesDetail() {
		return dao.getNewcountriesDetail();
	}
	public int getAmountExist(String startAmt,String endAmt,String branchCode) {
		return dao.getAmountExist(startAmt,endAmt,branchCode);

	}
	public List<String> getCountriesDet1() {
		return dao.getCountriesDet1();
	}
	public int getDateExist(Object[] val) {
		return dao.getDateExist(val);
	}
	public List<Object> getCurrencyList() {
		return dao.getCurrencyList();
	}
	public List<Object> getCurrenctListAjax(String searchValue)
	{
		return dao.getCurrencyListAjax(searchValue);
	}
	public void getNewCurrency(Object[] val) {
		dao.getNewCurrency(val);		
	}
	public void getUpdateCurrency(Object[] val,String string) {
		dao.getUpdateCurrency(val,string);		
	}
	public void getSelectedCurrency(RatingEngineBean bean,String branchCode) {
		dao.getSelectedCurrency(bean,branchCode);

	}
	public List<Object> getExchangeList() {
		return dao.getExchangeList();
	}
	public List<Object> getExchangeListAjax(String searchValue) {
		return dao.getExchangeListAjax(searchValue);
	}
	public List<String> getExchanges(String branchCode) {
		return dao.getExchanges(branchCode);
	}
	public void getNewExchange(Object[] val) {
		dao.getNewExchange(val);

	}
	public void getUpdateExchange(Object[] val,String string) {
		dao.getUpdateExchange(val,string);

	}
	public void getSelectedExchange(RatingEngineBean bean,String branchCode) {
		dao.getSelectedExchange(bean,branchCode);

	}
	public List<Object> getCoverList(Object[] val)
	{
		return dao.getCoverList(val);
	}
	public List<Object> getCoverListAjax(String branchCode,String searchValue)
	{
		return dao.getCoverListAjax(branchCode,searchValue);
	}
	public void getNewCover(Object[] val)
	{
		dao.getNewCover(val);
	}
	/*public void getUpdateCover(RatingEngineBean bean, String branchCode)
	{
		dao.getUpdateCover(bean,branchCode);
	}*/
	public void getUpdateCover(RatingEngineBean bean, String branchCode,String str)
	{
		dao.getUpdateCover(bean,branchCode,str);
	}
	public void getSelectedCover(RatingEngineBean bean)
	{
		dao.getSelectedCover(bean);
	}
	public List<Object> getExclusionList(String branchCode) {
		return dao.getExclusionList(branchCode);
	}
	public List<Object> getExclusionListAjax(String branchCode,String searchBy, String searchValue) {
		return dao.getExclusionListAjax(branchCode,searchBy,searchValue);
	}
	public void getNewExclusion(Object[] val) {
		dao.getNewExclusion(val);

	}
	public void getSelectedExclusion(RatingEngineBean bean) {
		dao.getSelectedExclusion(bean);

	}
	public void getUpdateExclusion(Object[] val) {
		dao.getUpdateExclusion(val);

	}
	public void updatcateg(Object val[],String ss)
	{
		dao.updatcateg(val,ss);
	}
	public void updatcovercomm(Object val[])
	{
		dao.updatcovercomm(val);
	}
	public void insertcateg(Object[] val)
	{
		dao.insertcateg(val);	
	}
	public void insertcovercomm(RatingEngineBean bean,String branchCode)
	{
		dao.insertcovercomm(bean,branchCode);	
	}
	public List<Object> getErrorList(String branchCode)
	{
		return dao.getErrorList(branchCode);
	}

	public List<Object> getErrorListAjax(String branchCode, String searchBy, String searchValue)
	{
		return dao.getErrorListAjax(branchCode, searchBy, searchValue);
	}

	public List<Object> getErrorDesc()
	{
		return dao.getError();
	}

	public void getSeletedError(RatingEngineBean bean)
	{
		dao.getSeletedError(bean);
	}

	public List<Object> getErrorListAjax(String searchBy, String searchValue)
	{
		return dao.getErrorListAjax(searchBy, searchValue);
	}

	public void getUpdateError(Object val[])
	{
		dao.getUpdateError(val);
	}

	public List<Object> getProductnames(String branchCode)
	{
		return dao.getProductnames(branchCode);
	}

	public List<Object> getStagenames(RatingEngineBean bean)
	{
		return dao.getStagenames(bean);
	}

	public List<Object> getstageListAjax1(String stagename)
	{
		return dao.getstageListAjax1(stagename);
	}

	public List<Object> getClauseIDListAjax(String searchBy, String searchValue)
	{
		return dao.getClauseIDListAjax(searchBy, searchValue);
	}

	public List<Object> getcoverNames(RatingEngineBean bean, String branchCode)
	{
		return dao.getCovernames(bean, branchCode);
	}
	public List<Object> coverName(RatingEngineBean bean, String branchCode)
	{
		return dao.coverName(bean, branchCode);
	}

	public void getNewClauseID(Object val[])
	{
		dao.getNewClauseID(val);
	}

	public List <Object>getClauseIDList(String branchCode)
	{
		return dao.getClauseIDList(branchCode);
	}

	public void getSeletedClauseID(RatingEngineBean bean)
	{
		dao.getSelectedClauseID(bean);
	}

	public List<Object> getClauseDesc()
	{
		return dao.getClauseID();
	}

	public void getUpdateClauseID(Object val[])
	{
		dao.getUpdateClauseID(val);
	}
	public void getUpdateCommodity(Object[] val,String string){
		dao.getUpdateCommodity(val,string);
	}
	public List<String> getTypeOfVessel() {
		return dao.getTypeOfVessel();

	}

	public List<RatingEngineBean>getWsrccList(RatingEngineBean bean,String branchCode,String searchField,String searchString,String searchOper)
	{
		return dao.getWsrccList(bean,branchCode,searchField, searchString, searchOper);
	}
	public List<RatingEngineBean>getBankList(String branchcode,String searchField,String searchString,String searchOper)
	{
		return dao.getBankList(branchcode,searchField, searchString, searchOper);
	}
	public List<RatingEngineBean>getWarrateList(String searchField,String searchString,String searchOper)
	{
		return dao.getWarrateList(searchField, searchString, searchOper);
	}
	public List<RatingEngineBean>getCommodityList(String branchcode,String searchField,String searchString,String searchOper)
	{
		return dao.getCommodityList(branchcode,searchField, searchString, searchOper);
	}
	public List<RatingEngineBean>getCovercommList(String branchcode,String searchField,String searchString,String searchOper)
	{
		return dao.getCovercommList(branchcode,searchField, searchString, searchOper);
	}
	public List<RatingEngineBean>getCategoryList(String branchcode,String searchField,String searchString,String searchOper)
	{
		return dao.getCategoryList(branchcode,searchField, searchString, searchOper);
	}
	public List<RatingEngineBean>getSaleList(String branchcode,String searchField,String searchString,String searchOper)
	{
		return dao.getSaleList(branchcode,searchField, searchString, searchOper);
	}
	public List<RatingEngineBean>getToleList(String branchcode,String searchField,String searchString,String searchOper)
	{
		return dao.getToleList(branchcode,searchField, searchString, searchOper);
	}
	public List<RatingEngineBean>getComExList(String branchcode,String searchField,String searchString,String searchOper)
	{
		return dao.getComExList(branchcode,searchField, searchString, searchOper);
	}
	public List<RatingEngineBean>getVesselList(String searchField,String searchString,String searchOper)
	{
		return dao.getVesselList(searchField, searchString, searchOper);
	}
	public List<RatingEngineBean>getSettlingList(String branchcode,String searchField,String searchString,String searchOper)
	{
		return dao.getSettlingList(branchcode,searchField, searchString, searchOper);
	}
	public List<RatingEngineBean>getExchangeList(String searchField,String searchString,String searchOper, String branchCode)
	{
		return dao.getExchangeList(searchField, searchString, searchOper, branchCode);
	}
	public List<RatingEngineBean>getCurrencyList(String searchField,String searchString,String searchOper, String branchCode)
	{
		return dao.getCurrencyList(searchField, searchString, searchOper, branchCode);
	}
	public List<RatingEngineBean>getExtraCoverList(String branchCode,String searchField,String searchString,String searchOper)
	{
		return dao.getExtraCoverList(branchCode,searchField, searchString, searchOper);
	}
	public List<RatingEngineBean>getTransportList(String branchCode,String searchField,String searchString,String searchOper)
	{
		return dao.getTransportList(branchCode,searchField, searchString, searchOper);
	}
	public List<RatingEngineBean>getWarrantyList(String branchCode,String searchField,String searchString,String searchOper)
	{
		return dao.getWarrantyList(branchCode,searchField, searchString, searchOper);
	}
	public List<RatingEngineBean> getConstantMasterList(RatingEngineBean bean, String branchCode,String searchField,String searchString,String searchOper) {
		return dao.getConstantMasterList(bean, branchCode,searchField, searchString, searchOper);
	}
	public List<RatingEngineBean>getConstantList(RatingEngineBean bean, String branchCode,String searchField,String searchString,String searchOper) {
		return dao.getConstantList(bean,branchCode,searchField, searchString, searchOper);
	}
	public List<RatingEngineBean>getExclusionList(String branchCode,String searchField,String searchString,String searchOper)
	{
		return dao.getExclusionList(branchCode,searchField, searchString, searchOper);
	}
	public List<RatingEngineBean>getCityList(String searchField,String searchString,String searchOper, String branchCode)
	{
		return dao.getCityList(searchField, searchString, searchOper,branchCode);
	}
	public List<RatingEngineBean>getClauseList(RatingEngineBean bean,String branchCode,String searchField,String searchString,String searchOper)
	{
		return dao.getClauseList(bean,branchCode,searchField, searchString, searchOper);
	}
	public int wsrccModify(final RatingEngineBean bean, String branchcode,String operation, String pdfName){
		return dao.wsrccModify(bean,branchcode, operation,pdfName);
	}
	public List<RatingEngineBean>getCoverList(String branchCode,String searchField,String searchString,String searchOper)
	{
		return dao.getCoverList(branchCode,searchField, searchString, searchOper);
	}
	public List<RatingEngineBean>getErrorList(String branchCode,String searchField,String searchString,String searchOper)
	{
		return dao.getErrorList(branchCode,searchField, searchString, searchOper);
	}
	public void wsrccEdit(RatingEngineBean bean,String branchcode)
	{
		dao.wsrccEdit(bean,branchcode);
	}
	public int checkExchangeEffDate(String effDate, String loginId) {
		return dao.checkExchangeEffDate(effDate,loginId);
	}
	public int checkEffDate(String effDate) {
		return dao.checkEffDate(effDate);
	}
	public List<RatingEngineBean> getMaterialsList (String branchCode, String searchField, String searchString, String searchOper)
	{
		return dao.getMaterialsList(branchCode,searchField,searchString,searchOper); 
	}
	public List<Map<String,Object>> getCoverList1(String branchCode) {
		return dao.getCoverList1(branchCode);
	}
	public int validateNewMaterial(RatingEngineBean bean, String branchCode) {
		return dao.validateNewMaterial(bean,branchCode);
	}
	public List<RatingEngineBean> getExecutiveMasterList(String branchCode,String searchField, String searchString, String searchOper) {
		return dao.getExecutiveMasterList(branchCode,searchField,searchString,searchOper);
	}
	public void getExecutivemaster(RatingEngineBean bean, String branchCode) {
		dao.getExecutivemaster(bean, branchCode);
	}
	public int validateOtherPartyCode(String otherpartyCode, String mode, String executiveId) {
		return dao.validateOtherPartyCode(otherpartyCode,mode,executiveId);
	}
	public void updateintoExecutiveMaster(RatingEngineBean bean) {
		dao.updateintoExecutiveMaster(bean);
	}
	public List<RatingEngineBean>getPackageList(String searchField,String searchString,String searchOper)
	{
		return dao.getPackageList(searchField, searchString, searchOper);
	}
	public void getPackageEdit(RatingEngineBean bean) {
		dao.getPackageEdit(bean);

	}
	public void insertPackage(Object[] val) {
		dao.insertPackage(val);
	}
	public void updatePackage(Object[] val,String string) {
		dao.updatePackage(val,string);
	}



}