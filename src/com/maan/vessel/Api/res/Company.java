package com.maan.vessel.Api.res;

import com.google.gson.annotations.SerializedName;

public class Company {

	@SerializedName("CompanyStatus") 
    public String companystatus;
	@SerializedName("CountryName") 
    public String countryname;
    @SerializedName("DataSetVersion") 
    public DataSetVersion datasetversion;
    @SerializedName("Emailaddress") 
    public String emailaddress;
    @SerializedName("Facsimile") 
    public String facsimile;
    @SerializedName("FullAddress") 
    public String fulladdress;
    @SerializedName("FullName") 
    public String fullname;
    @SerializedName("LastChangeDate") 
    public String lastchangedate;
    @SerializedName("NationalityOfControl") 
    public String nationalityofcontrol;
    @SerializedName("NationalityOfRegistration") 
    public String nationalityofregistration;
    @SerializedName("OWCODE") 
    public String owcode;
    @SerializedName("ShortCompanyName") 
    public String shortcompanyname;
    @SerializedName("Telephone") 
    public String telephone;
    @SerializedName("Website") 
    public String website;
    @SerializedName("Telex") 
    public String telex;
	public String getCompanystatus() {
		return companystatus;
	}
	public void setCompanystatus(String companystatus) {
		this.companystatus = companystatus;
	}
	public String getCountryname() {
		return countryname;
	}
	public void setCountryname(String countryname) {
		this.countryname = countryname;
	}
	public DataSetVersion getDatasetversion() {
		return datasetversion;
	}
	public void setDatasetversion(DataSetVersion datasetversion) {
		this.datasetversion = datasetversion;
	}
	public String getEmailaddress() {
		return emailaddress;
	}
	public void setEmailaddress(String emailaddress) {
		this.emailaddress = emailaddress;
	}
	public String getFacsimile() {
		return facsimile;
	}
	public void setFacsimile(String facsimile) {
		this.facsimile = facsimile;
	}
	public String getFulladdress() {
		return fulladdress;
	}
	public void setFulladdress(String fulladdress) {
		this.fulladdress = fulladdress;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getLastchangedate() {
		return lastchangedate;
	}
	public void setLastchangedate(String lastchangedate) {
		this.lastchangedate = lastchangedate;
	}
	public String getNationalityofcontrol() {
		return nationalityofcontrol;
	}
	public void setNationalityofcontrol(String nationalityofcontrol) {
		this.nationalityofcontrol = nationalityofcontrol;
	}
	public String getNationalityofregistration() {
		return nationalityofregistration;
	}
	public void setNationalityofregistration(String nationalityofregistration) {
		this.nationalityofregistration = nationalityofregistration;
	}
	public String getOwcode() {
		return owcode;
	}
	public void setOwcode(String owcode) {
		this.owcode = owcode;
	}
	public String getShortcompanyname() {
		return shortcompanyname;
	}
	public void setShortcompanyname(String shortcompanyname) {
		this.shortcompanyname = shortcompanyname;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	public String getTelex() {
		return telex;
	}
	public void setTelex(String telex) {
		this.telex = telex;
	}
    
    
}