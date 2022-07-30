package com.maan.vessel;

import java.util.ArrayList;
import java.util.List;

import com.maan.vessel.Api.res.Company;
import com.maan.vessel.Api.res.CompanyComplianceDetail;
import com.maan.vessel.Api.res.ShipByExNameRes;
import com.maan.vessel.Api.res.ShipByIHSLRorIMORes;
import com.maan.vessel.Api.res.ShipByNameRes;

public class VesselBean {

	private String searchBy;
	private String callSign;
	private String companyCode;
	private String endDate;
	private String englishName;
	private String exNameString;
	private String iHSLRORIMO;
	private String iHSLRORIMOs;
	private String lastUpdateDate;
	private String MMSI;
	private String nameString;
	private String officialNumber;
	private String shipsCategory;
	private String exshipsCategory;
	private String startDate;
	private ShipByNameRes shipByNameRes;
	private ShipByExNameRes shipByExNameRes;
	private  ShipByIHSLRorIMORes shipByIHSLRorIMORes;
	private String imoNumber;
	private String mapLoc;
	private String quoteNumber;
	private String policyNumber;
	private String polStartDate;
	private String polEndDate;

	public String getImoNumber() {
		return imoNumber;
	}
	public void setImoNumber(String imoNumber) {
		this.imoNumber = imoNumber;
	}
	public ShipByIHSLRorIMORes getShipByIHSLRorIMORes() {
		return shipByIHSLRorIMORes;
	}
	public void setShipByIHSLRorIMORes(ShipByIHSLRorIMORes shipByIHSLRorIMORes) {
		this.shipByIHSLRorIMORes = shipByIHSLRorIMORes;
	}
	public ShipByExNameRes getShipByExNameRes() {
		return shipByExNameRes;
	}
	public void setShipByExNameRes(ShipByExNameRes shipByExNameRes) {
		this.shipByExNameRes = shipByExNameRes;
	}
	public ShipByNameRes getShipByNameRes() {
		return shipByNameRes;
	}
	public void setShipByNameRes(ShipByNameRes shipByNameRes) {
		this.shipByNameRes = shipByNameRes;
	}
	public String getSearchBy() {
		return searchBy;
	}
	public void setSearchBy(String searchBy) {
		this.searchBy = searchBy;
	}
	public String getCallSign() {
		return callSign;
	}
	public void setCallSign(String callSign) {
		this.callSign = callSign;
	}
	public String getCompanyCode() {
		return companyCode;
	}
	public void setCompanyCode(String companyCode) {
		this.companyCode = companyCode;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getEnglishName() {
		return englishName;
	}
	public void setEnglishName(String englishName) {
		this.englishName = englishName;
	}
	public String getExNameString() {
		return exNameString;
	}
	public void setExNameString(String exNameString) {
		this.exNameString = exNameString;
	}
	public String getiHSLRORIMO() {
		return iHSLRORIMO;
	}
	public void setiHSLRORIMO(String iHSLRORIMO) {
		this.iHSLRORIMO = iHSLRORIMO;
	}
	public String getiHSLRORIMOs() {
		return iHSLRORIMOs;
	}
	public void setiHSLRORIMOs(String iHSLRORIMOs) {
		this.iHSLRORIMOs = iHSLRORIMOs;
	}
	public String getLastUpdateDate() {
		return lastUpdateDate;
	}
	public void setLastUpdateDate(String lastUpdateDate) {
		this.lastUpdateDate = lastUpdateDate;
	}
	public String getMMSI() {
		return MMSI;
	}
	public void setMMSI(String mMSI) {
		MMSI = mMSI;
	}
	public String getNameString() {
		return nameString;
	}
	public void setNameString(String nameString) {
		this.nameString = nameString;
	}
	public String getOfficialNumber() {
		return officialNumber;
	}
	public void setOfficialNumber(String officialNumber) {
		this.officialNumber = officialNumber;
	}
	public String getShipsCategory() {
		return shipsCategory;
	}
	public void setShipsCategory(String shipsCategory) {
		this.shipsCategory = shipsCategory;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getExshipsCategory() {
		return exshipsCategory;
	}
	public void setExshipsCategory(String exshipsCategory) {
		this.exshipsCategory = exshipsCategory;
	}
	
	private List<CompanyComplianceDetail> comCompliance;
	private List<Company> comp;


	public List<CompanyComplianceDetail> getComCompliance() {
		return comCompliance;
	}
	public void setComCompliance(List<CompanyComplianceDetail> comCompliance) {
		this.comCompliance = comCompliance;
	}
	public List<Company> getComp() {
		return comp;
	}
	public void setComp(List<Company> comp) {
		this.comp = comp;
	}
	public String getMapLoc() {
		return mapLoc;
	}
	public void setMapLoc(String mapLoc) {
		this.mapLoc = mapLoc;
	}
	public String getQuoteNumber() {
		return quoteNumber;
	}
	public void setQuoteNumber(String quoteNumber) {
		this.quoteNumber = quoteNumber;
	}
	public String getPolicyNumber() {
		return policyNumber;
	}
	public void setPolicyNumber(String policyNumber) {
		this.policyNumber = policyNumber;
	}
	public String getPolStartDate() {
		return polStartDate;
	}
	public void setPolStartDate(String polStartDate) {
		this.polStartDate = polStartDate;
	}
	public String getPolEndDate() {
		return polEndDate;
	}
	public void setPolEndDate(String polEndDate) {
		this.polEndDate = polEndDate;
	}

	
	
	
}
