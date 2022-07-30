package com.maan.vessel.Api.res;

import java.util.List;

import com.google.gson.annotations.SerializedName;



public class APSShipDetail {

	@SerializedName("BaleCapacity") 
    public String balecapacity;
    @SerializedName("BreadthExtreme") 
    public String breadthextreme;
    @SerializedName("BreadthMoulded") 
    public String breadthmoulded;
    @SerializedName("CallSign") 
    public String callsign;
    @SerializedName("ClassificationSociety") 
    public String classificationsociety;
    @SerializedName("CoreShipInd") 
    public String coreshipind;
    @SerializedName("DOCCompany") 
    public String doccompany;
    @SerializedName("DOCCompanyCountryOfDomicile") 
    public String doccompanycountryofdomicile;
    @SerializedName("DataSetVersion") 
    public DataSetVersion datasetversion;
    @SerializedName("DateOfBuild") 
    public String dateofbuild;
    @SerializedName("Deadweight") 
    public String deadweight;
    @SerializedName("Depth") 
    public String depth;
    @SerializedName("Displacement") 
    public String displacement;
    @SerializedName("DocumentOfComplianceDOCCompanyCode") 
    public String documentofcompliancedoccompanycode;
    @SerializedName("Draught") 
    public String draught;
    @SerializedName("FlagName") 
    public String flagname;
    @SerializedName("GasCapacity") 
    public String gascapacity;
    @SerializedName("GrainCapacity") 
    public String graincapacity;
    @SerializedName("GrossTonnage") 
    public String grosstonnage;
    @SerializedName("GroupBeneficialOwner") 
    public String groupbeneficialowner;
    @SerializedName("GroupBeneficialOwnerCompanyCode") 
    public String groupbeneficialownercompanycode;
    @SerializedName("GroupBeneficialOwnerCountryOfDomicile") 
    public String groupbeneficialownercountryofdomicile;
    @SerializedName("IHSLRorIMOShipNo") 
    public String ihslrorimoshipno;
    @SerializedName("InsulatedCapacity") 
    public String insulatedcapacity;
    @SerializedName("KeelToMastHeight") 
    public String keeltomastheight;
    @SerializedName("LastUpdateDate") 
    public String lastupdatedate;
    @SerializedName("LeadShipInSeriesByIMONumber") 
    public String leadshipinseriesbyimonumber;
    @SerializedName("LengthBetweenPerpendicularsLBP") 
    public String lengthbetweenperpendicularslbp;
    @SerializedName("LengthOverallLOA") 
    public String lengthoverallloa;
    @SerializedName("LengthRegistered") 
    public String lengthregistered;
    @SerializedName("LightDisplacementTonnage") 
    public String lightdisplacementtonnage;
    @SerializedName("LiquidCapacity") 
    public String liquidcapacity;
    @SerializedName("MaritimeMobileServiceIdentityMMSINumber") 
    public String maritimemobileserviceidentitymmsinumber;
    @SerializedName("NetTonnage") 
    public String nettonnage;
    @SerializedName("OfficialNumber") 
    public String officialnumber;
    @SerializedName("Operator") 
    public String operator;
    @SerializedName("OperatorCompanyCode") 
    public String operatorcompanycode;
    @SerializedName("OperatorCountryOfDomicileName") 
    public String operatorcountryofdomicilename;
    @SerializedName("PassengerCapacity") 
    public String passengercapacity;
    @SerializedName("PortOfRegistry") 
    public String portofregistry;
    @SerializedName("PowerKWMax") 
    public String powerkwmax;
    @SerializedName("RegisteredOwner") 
    public String registeredowner;
    @SerializedName("RegisteredOwnerCode") 
    public String registeredownercode;
    @SerializedName("RegisteredOwnerCountryOfDomicile") 
    public String registeredownercountryofdomicile;
    @SerializedName("SegregatedBallastCapacity") 
    public String segregatedballastcapacity;
    @SerializedName("ShipManager") 
    public String shipmanager;
    @SerializedName("ShipManagerCompanyCode") 
    public String shipmanagercompanycode;
    @SerializedName("ShipManagerCountryOfDomicileName") 
    public String shipmanagercountryofdomicilename;
    @SerializedName("ShipName") 
    public String shipname;
    @SerializedName("ShipStatus") 
    public String shipstatus;
    @SerializedName("Shipbuilder") 
    public String shipbuilder;
    @SerializedName("ShipbuilderCompanyCode") 
    public String shipbuildercompanycode;
    @SerializedName("ShipbuilderFullStyle") 
    public String shipbuilderfullstyle;
    @SerializedName("ShipbuilderFullStyleSBR") 
    public String shipbuilderfullstylesbr;
    @SerializedName("ShiptypeLevel2") 
    public String shiptypelevel2;
    @SerializedName("ShiptypeLevel3") 
    public String shiptypelevel3;
    @SerializedName("ShiptypeLevel4") 
    public String shiptypelevel4;
    @SerializedName("ShiptypeLevel5") 
    public String shiptypelevel5;
    @SerializedName("Speed") 
    public String speed;
    @SerializedName("TEU") 
    public String teu;
    @SerializedName("TEUCapacity14THomogenous") 
    public String teucapacity14thomogenous;
    @SerializedName("YardNumber") 
    public String yardnumber;
    @SerializedName("YearOfBuild") 
    public String yearOfBuild;
    @SerializedName("ShiptypeGroup") 
    public String shiptypeGroup;
    @SerializedName("LegalOverall") 
    public String legalOverall;
    @SerializedName("ShipManagerCountryOfDomicileCode") 
    public String shipManagerCountryOfDomicileCode;
    @SerializedName("ShipManagerCountryOfRegistration") 
    public String shipManagerCountryOfRegistration;
    @SerializedName("OperatorCountryOfRegistration") 
    public String operatorCountryOfRegistration;
    @SerializedName("RegisteredOwnerCountryOfRegistration") 
    public String registeredOwnerCountryOfRegistration;
    //TechnicalManager
    @SerializedName("TechnicalManager") 
    public String technicalManager;
    @SerializedName("TechnicalManagerCode") 
    public String technicalManagerCode;
    @SerializedName("TechnicalManagerCountryOfDomicile") 
    public String technicalManagerCountryOfDomicile;
    @SerializedName("TechnicalManagerCountryOfRegistration") 
    public String technicalManagerCountryOfRegistration;
    //Ship Compliance
    @SerializedName("ShipANNEX4SuspectedSTSTransferswithNKorea") 
    public String shipannex4suspectedststransferswithnkorea;
    @SerializedName("ShipANNEX5SuspectedExportOfNKoreanCoal") 
    public String shipannex5suspectedexportofnkoreancoal;
    @SerializedName("ShipDarkActivityIndicator") 
    public String shipdarkactivityindicator;
    @SerializedName("ShipEUSanctionList") 
    public String shipeusanctionlist;
    @SerializedName("ShipFlagDisputed") 
    public String shipflagdisputed;
    @SerializedName("ShipFlagSanctionedCountry") 
    public String shipflagsanctionedcountry;
    @SerializedName("ShipHistoricalFlagSanctionedCountry") 
    public String shiphistoricalflagsanctionedcountry;
    @SerializedName("ShipManagerCountryOfControl") 
    public String shipmanagercountryofcontrol;
    @SerializedName("ShipOFACNonSDNSanctionList") 
    public String shipofacnonsdnsanctionlist;
    @SerializedName("ShipOFACSSIList") 
    public String shipofacssilist;
    @SerializedName("ShipOFACSanctionList") 
    public String shipofacsanctionlist;
    @SerializedName("ShipOverallComplianceStatus") 
    public String shipoverallcompliancestatus;
    @SerializedName("ShipOwnerAustralianSanctionList") 
    public String shipowneraustraliansanctionlist;
    @SerializedName("ShipOwnerBESSanctionList") 
    public String shipownerbessanctionlist;
    @SerializedName("ShipOwnerCanadianSanctionList") 
    public String shipownercanadiansanctionlist;
    @SerializedName("ShipOwnerEUSanctionList") 
    public String shipownereusanctionlist;
    @SerializedName("ShipOwnerFATFJurisdiction") 
    public String shipownerfatfjurisdiction;
    @SerializedName("ShipOwnerHistoricalOFACSanctionedCountry") 
    public String shipownerhistoricalofacsanctionedcountry;
    @SerializedName("ShipOwnerOFACSanctionList") 
    public String shipownerofacsanctionlist;
    @SerializedName("ShipOwnerOFACSanctionedCountry") 
    public String shipownerofacsanctionedcountry;
    @SerializedName("ShipOwnerParentFATFJurisdiction") 
    public String shipownerparentfatfjurisdiction;
    @SerializedName("ShipOwnerParentOFACSanctionedCountry") 
    public String shipownerparentofacsanctionedcountry;
    @SerializedName("ShipOwnerSwissSanctionList") 
    public String shipownerswisssanctionlist;
    @SerializedName("ShipOwnerUNSanctionList") 
    public String shipownerunsanctionlist;
    @SerializedName("ShipSanctionedCountryPortCallLast12m") 
    public String shipsanctionedcountryportcalllast12m;
    @SerializedName("ShipSanctionedCountryPortCallLast3m") 
    public String shipsanctionedcountryportcalllast3m;
    @SerializedName("ShipSanctionedCountryPortCallLast6m") 
    public String shipsanctionedcountryportcalllast6m;
    @SerializedName("ShipStatusEffectiveDate") 
    public String shipstatuseffectivedate;
    @SerializedName("ShipSwissSanctionList") 
    public String shipswisssanctionlist;
    @SerializedName("ShipUNSanctionList") 
    public String shipunsanctionlist;
    @SerializedName("ShipUSTreasuryOFACAdvisoryList") 
    public String shipustreasuryofacadvisorylist;
    //Company Details
    @SerializedName("Company") 
    public List<Company> company;
    //Company Compliance
    @SerializedName("CompanyComplianceDetails") 
    public List<CompanyComplianceDetail> companycompliancedetails;
	public String getBalecapacity() {
		return balecapacity;
	}
	public void setBalecapacity(String balecapacity) {
		this.balecapacity = balecapacity;
	}
	public String getBreadthextreme() {
		return breadthextreme;
	}
	public void setBreadthextreme(String breadthextreme) {
		this.breadthextreme = breadthextreme;
	}
	public String getBreadthmoulded() {
		return breadthmoulded;
	}
	public void setBreadthmoulded(String breadthmoulded) {
		this.breadthmoulded = breadthmoulded;
	}
	public String getCallsign() {
		return callsign;
	}
	public void setCallsign(String callsign) {
		this.callsign = callsign;
	}
	public String getClassificationsociety() {
		return classificationsociety;
	}
	public void setClassificationsociety(String classificationsociety) {
		this.classificationsociety = classificationsociety;
	}
	public String getCoreshipind() {
		return coreshipind;
	}
	public void setCoreshipind(String coreshipind) {
		this.coreshipind = coreshipind;
	}
	public String getDoccompany() {
		return doccompany;
	}
	public void setDoccompany(String doccompany) {
		this.doccompany = doccompany;
	}
	public String getDoccompanycountryofdomicile() {
		return doccompanycountryofdomicile;
	}
	public void setDoccompanycountryofdomicile(String doccompanycountryofdomicile) {
		this.doccompanycountryofdomicile = doccompanycountryofdomicile;
	}
	public DataSetVersion getDatasetversion() {
		return datasetversion;
	}
	public void setDatasetversion(DataSetVersion datasetversion) {
		this.datasetversion = datasetversion;
	}
	public String getDateofbuild() {
		return dateofbuild;
	}
	public void setDateofbuild(String dateofbuild) {
		this.dateofbuild = dateofbuild;
	}
	public String getDeadweight() {
		return deadweight;
	}
	public void setDeadweight(String deadweight) {
		this.deadweight = deadweight;
	}
	public String getDepth() {
		return depth;
	}
	public void setDepth(String depth) {
		this.depth = depth;
	}
	public String getDisplacement() {
		return displacement;
	}
	public void setDisplacement(String displacement) {
		this.displacement = displacement;
	}
	public String getDocumentofcompliancedoccompanycode() {
		return documentofcompliancedoccompanycode;
	}
	public void setDocumentofcompliancedoccompanycode(String documentofcompliancedoccompanycode) {
		this.documentofcompliancedoccompanycode = documentofcompliancedoccompanycode;
	}
	public String getDraught() {
		return draught;
	}
	public void setDraught(String draught) {
		this.draught = draught;
	}
	public String getFlagname() {
		return flagname;
	}
	public void setFlagname(String flagname) {
		this.flagname = flagname;
	}
	public String getGascapacity() {
		return gascapacity;
	}
	public void setGascapacity(String gascapacity) {
		this.gascapacity = gascapacity;
	}
	public String getGraincapacity() {
		return graincapacity;
	}
	public void setGraincapacity(String graincapacity) {
		this.graincapacity = graincapacity;
	}
	public String getGrosstonnage() {
		return grosstonnage;
	}
	public void setGrosstonnage(String grosstonnage) {
		this.grosstonnage = grosstonnage;
	}
	public String getGroupbeneficialowner() {
		return groupbeneficialowner;
	}
	public void setGroupbeneficialowner(String groupbeneficialowner) {
		this.groupbeneficialowner = groupbeneficialowner;
	}
	public String getGroupbeneficialownercompanycode() {
		return groupbeneficialownercompanycode;
	}
	public void setGroupbeneficialownercompanycode(String groupbeneficialownercompanycode) {
		this.groupbeneficialownercompanycode = groupbeneficialownercompanycode;
	}
	public String getGroupbeneficialownercountryofdomicile() {
		return groupbeneficialownercountryofdomicile;
	}
	public void setGroupbeneficialownercountryofdomicile(String groupbeneficialownercountryofdomicile) {
		this.groupbeneficialownercountryofdomicile = groupbeneficialownercountryofdomicile;
	}
	public String getIhslrorimoshipno() {
		return ihslrorimoshipno;
	}
	public void setIhslrorimoshipno(String ihslrorimoshipno) {
		this.ihslrorimoshipno = ihslrorimoshipno;
	}
	public String getInsulatedcapacity() {
		return insulatedcapacity;
	}
	public void setInsulatedcapacity(String insulatedcapacity) {
		this.insulatedcapacity = insulatedcapacity;
	}
	public String getKeeltomastheight() {
		return keeltomastheight;
	}
	public void setKeeltomastheight(String keeltomastheight) {
		this.keeltomastheight = keeltomastheight;
	}
	public String getLastupdatedate() {
		return lastupdatedate;
	}
	public void setLastupdatedate(String lastupdatedate) {
		this.lastupdatedate = lastupdatedate;
	}
	public String getLeadshipinseriesbyimonumber() {
		return leadshipinseriesbyimonumber;
	}
	public void setLeadshipinseriesbyimonumber(String leadshipinseriesbyimonumber) {
		this.leadshipinseriesbyimonumber = leadshipinseriesbyimonumber;
	}
	public String getLengthbetweenperpendicularslbp() {
		return lengthbetweenperpendicularslbp;
	}
	public void setLengthbetweenperpendicularslbp(String lengthbetweenperpendicularslbp) {
		this.lengthbetweenperpendicularslbp = lengthbetweenperpendicularslbp;
	}
	public String getLengthoverallloa() {
		return lengthoverallloa;
	}
	public void setLengthoverallloa(String lengthoverallloa) {
		this.lengthoverallloa = lengthoverallloa;
	}
	public String getLengthregistered() {
		return lengthregistered;
	}
	public void setLengthregistered(String lengthregistered) {
		this.lengthregistered = lengthregistered;
	}
	public String getLightdisplacementtonnage() {
		return lightdisplacementtonnage;
	}
	public void setLightdisplacementtonnage(String lightdisplacementtonnage) {
		this.lightdisplacementtonnage = lightdisplacementtonnage;
	}
	public String getLiquidcapacity() {
		return liquidcapacity;
	}
	public void setLiquidcapacity(String liquidcapacity) {
		this.liquidcapacity = liquidcapacity;
	}
	public String getMaritimemobileserviceidentitymmsinumber() {
		return maritimemobileserviceidentitymmsinumber;
	}
	public void setMaritimemobileserviceidentitymmsinumber(String maritimemobileserviceidentitymmsinumber) {
		this.maritimemobileserviceidentitymmsinumber = maritimemobileserviceidentitymmsinumber;
	}
	public String getNettonnage() {
		return nettonnage;
	}
	public void setNettonnage(String nettonnage) {
		this.nettonnage = nettonnage;
	}
	public String getOfficialnumber() {
		return officialnumber;
	}
	public void setOfficialnumber(String officialnumber) {
		this.officialnumber = officialnumber;
	}
	public String getOperator() {
		return operator;
	}
	public void setOperator(String operator) {
		this.operator = operator;
	}
	public String getOperatorcompanycode() {
		return operatorcompanycode;
	}
	public void setOperatorcompanycode(String operatorcompanycode) {
		this.operatorcompanycode = operatorcompanycode;
	}
	public String getOperatorcountryofdomicilename() {
		return operatorcountryofdomicilename;
	}
	public void setOperatorcountryofdomicilename(String operatorcountryofdomicilename) {
		this.operatorcountryofdomicilename = operatorcountryofdomicilename;
	}
	public String getPassengercapacity() {
		return passengercapacity;
	}
	public void setPassengercapacity(String passengercapacity) {
		this.passengercapacity = passengercapacity;
	}
	public String getPortofregistry() {
		return portofregistry;
	}
	public void setPortofregistry(String portofregistry) {
		this.portofregistry = portofregistry;
	}
	public String getPowerkwmax() {
		return powerkwmax;
	}
	public void setPowerkwmax(String powerkwmax) {
		this.powerkwmax = powerkwmax;
	}
	public String getRegisteredowner() {
		return registeredowner;
	}
	public void setRegisteredowner(String registeredowner) {
		this.registeredowner = registeredowner;
	}
	public String getRegisteredownercode() {
		return registeredownercode;
	}
	public void setRegisteredownercode(String registeredownercode) {
		this.registeredownercode = registeredownercode;
	}
	public String getRegisteredownercountryofdomicile() {
		return registeredownercountryofdomicile;
	}
	public void setRegisteredownercountryofdomicile(String registeredownercountryofdomicile) {
		this.registeredownercountryofdomicile = registeredownercountryofdomicile;
	}
	public String getSegregatedballastcapacity() {
		return segregatedballastcapacity;
	}
	public void setSegregatedballastcapacity(String segregatedballastcapacity) {
		this.segregatedballastcapacity = segregatedballastcapacity;
	}
	public String getShipmanager() {
		return shipmanager;
	}
	public void setShipmanager(String shipmanager) {
		this.shipmanager = shipmanager;
	}
	public String getShipmanagercompanycode() {
		return shipmanagercompanycode;
	}
	public void setShipmanagercompanycode(String shipmanagercompanycode) {
		this.shipmanagercompanycode = shipmanagercompanycode;
	}
	public String getShipmanagercountryofdomicilename() {
		return shipmanagercountryofdomicilename;
	}
	public void setShipmanagercountryofdomicilename(String shipmanagercountryofdomicilename) {
		this.shipmanagercountryofdomicilename = shipmanagercountryofdomicilename;
	}
	public String getShipname() {
		return shipname;
	}
	public void setShipname(String shipname) {
		this.shipname = shipname;
	}
	public String getShipstatus() {
		return shipstatus;
	}
	public void setShipstatus(String shipstatus) {
		this.shipstatus = shipstatus;
	}
	public String getShipbuilder() {
		return shipbuilder;
	}
	public void setShipbuilder(String shipbuilder) {
		this.shipbuilder = shipbuilder;
	}
	public String getShipbuildercompanycode() {
		return shipbuildercompanycode;
	}
	public void setShipbuildercompanycode(String shipbuildercompanycode) {
		this.shipbuildercompanycode = shipbuildercompanycode;
	}
	public String getShipbuilderfullstyle() {
		return shipbuilderfullstyle;
	}
	public void setShipbuilderfullstyle(String shipbuilderfullstyle) {
		this.shipbuilderfullstyle = shipbuilderfullstyle;
	}
	public String getShipbuilderfullstylesbr() {
		return shipbuilderfullstylesbr;
	}
	public void setShipbuilderfullstylesbr(String shipbuilderfullstylesbr) {
		this.shipbuilderfullstylesbr = shipbuilderfullstylesbr;
	}
	public String getShiptypelevel2() {
		return shiptypelevel2;
	}
	public void setShiptypelevel2(String shiptypelevel2) {
		this.shiptypelevel2 = shiptypelevel2;
	}
	public String getShiptypelevel3() {
		return shiptypelevel3;
	}
	public void setShiptypelevel3(String shiptypelevel3) {
		this.shiptypelevel3 = shiptypelevel3;
	}
	public String getShiptypelevel4() {
		return shiptypelevel4;
	}
	public void setShiptypelevel4(String shiptypelevel4) {
		this.shiptypelevel4 = shiptypelevel4;
	}
	public String getShiptypelevel5() {
		return shiptypelevel5;
	}
	public void setShiptypelevel5(String shiptypelevel5) {
		this.shiptypelevel5 = shiptypelevel5;
	}
	public String getSpeed() {
		return speed;
	}
	public void setSpeed(String speed) {
		this.speed = speed;
	}
	public String getTeu() {
		return teu;
	}
	public void setTeu(String teu) {
		this.teu = teu;
	}
	public String getTeucapacity14thomogenous() {
		return teucapacity14thomogenous;
	}
	public void setTeucapacity14thomogenous(String teucapacity14thomogenous) {
		this.teucapacity14thomogenous = teucapacity14thomogenous;
	}
	public String getYardnumber() {
		return yardnumber;
	}
	public void setYardnumber(String yardnumber) {
		this.yardnumber = yardnumber;
	}
	public String getYearOfBuild() {
		return yearOfBuild;
	}
	public void setYearOfBuild(String yearOfBuild) {
		this.yearOfBuild = yearOfBuild;
	}
	public String getShiptypeGroup() {
		return shiptypeGroup;
	}
	public void setShiptypeGroup(String shiptypeGroup) {
		this.shiptypeGroup = shiptypeGroup;
	}
	public String getLegalOverall() {
		return legalOverall;
	}
	public void setLegalOverall(String legalOverall) {
		this.legalOverall = legalOverall;
	}
	public String getShipManagerCountryOfDomicileCode() {
		return shipManagerCountryOfDomicileCode;
	}
	public void setShipManagerCountryOfDomicileCode(String shipManagerCountryOfDomicileCode) {
		this.shipManagerCountryOfDomicileCode = shipManagerCountryOfDomicileCode;
	}
	public String getShipManagerCountryOfRegistration() {
		return shipManagerCountryOfRegistration;
	}
	public void setShipManagerCountryOfRegistration(String shipManagerCountryOfRegistration) {
		this.shipManagerCountryOfRegistration = shipManagerCountryOfRegistration;
	}
	public String getOperatorCountryOfRegistration() {
		return operatorCountryOfRegistration;
	}
	public void setOperatorCountryOfRegistration(String operatorCountryOfRegistration) {
		this.operatorCountryOfRegistration = operatorCountryOfRegistration;
	}
	public String getRegisteredOwnerCountryOfRegistration() {
		return registeredOwnerCountryOfRegistration;
	}
	public void setRegisteredOwnerCountryOfRegistration(String registeredOwnerCountryOfRegistration) {
		this.registeredOwnerCountryOfRegistration = registeredOwnerCountryOfRegistration;
	}
	public String getTechnicalManager() {
		return technicalManager;
	}
	public void setTechnicalManager(String technicalManager) {
		this.technicalManager = technicalManager;
	}
	public String getTechnicalManagerCode() {
		return technicalManagerCode;
	}
	public void setTechnicalManagerCode(String technicalManagerCode) {
		this.technicalManagerCode = technicalManagerCode;
	}
	public String getTechnicalManagerCountryOfDomicile() {
		return technicalManagerCountryOfDomicile;
	}
	public void setTechnicalManagerCountryOfDomicile(String technicalManagerCountryOfDomicile) {
		this.technicalManagerCountryOfDomicile = technicalManagerCountryOfDomicile;
	}
	public String getTechnicalManagerCountryOfRegistration() {
		return technicalManagerCountryOfRegistration;
	}
	public void setTechnicalManagerCountryOfRegistration(String technicalManagerCountryOfRegistration) {
		this.technicalManagerCountryOfRegistration = technicalManagerCountryOfRegistration;
	}
	public String getShipannex4suspectedststransferswithnkorea() {
		return shipannex4suspectedststransferswithnkorea;
	}
	public void setShipannex4suspectedststransferswithnkorea(String shipannex4suspectedststransferswithnkorea) {
		this.shipannex4suspectedststransferswithnkorea = shipannex4suspectedststransferswithnkorea;
	}
	public String getShipannex5suspectedexportofnkoreancoal() {
		return shipannex5suspectedexportofnkoreancoal;
	}
	public void setShipannex5suspectedexportofnkoreancoal(String shipannex5suspectedexportofnkoreancoal) {
		this.shipannex5suspectedexportofnkoreancoal = shipannex5suspectedexportofnkoreancoal;
	}
	public String getShipdarkactivityindicator() {
		return shipdarkactivityindicator;
	}
	public void setShipdarkactivityindicator(String shipdarkactivityindicator) {
		this.shipdarkactivityindicator = shipdarkactivityindicator;
	}
	public String getShipeusanctionlist() {
		return shipeusanctionlist;
	}
	public void setShipeusanctionlist(String shipeusanctionlist) {
		this.shipeusanctionlist = shipeusanctionlist;
	}
	public String getShipflagdisputed() {
		return shipflagdisputed;
	}
	public void setShipflagdisputed(String shipflagdisputed) {
		this.shipflagdisputed = shipflagdisputed;
	}
	public String getShipflagsanctionedcountry() {
		return shipflagsanctionedcountry;
	}
	public void setShipflagsanctionedcountry(String shipflagsanctionedcountry) {
		this.shipflagsanctionedcountry = shipflagsanctionedcountry;
	}
	public String getShiphistoricalflagsanctionedcountry() {
		return shiphistoricalflagsanctionedcountry;
	}
	public void setShiphistoricalflagsanctionedcountry(String shiphistoricalflagsanctionedcountry) {
		this.shiphistoricalflagsanctionedcountry = shiphistoricalflagsanctionedcountry;
	}
	public String getShipmanagercountryofcontrol() {
		return shipmanagercountryofcontrol;
	}
	public void setShipmanagercountryofcontrol(String shipmanagercountryofcontrol) {
		this.shipmanagercountryofcontrol = shipmanagercountryofcontrol;
	}
	public String getShipofacnonsdnsanctionlist() {
		return shipofacnonsdnsanctionlist;
	}
	public void setShipofacnonsdnsanctionlist(String shipofacnonsdnsanctionlist) {
		this.shipofacnonsdnsanctionlist = shipofacnonsdnsanctionlist;
	}
	public String getShipofacssilist() {
		return shipofacssilist;
	}
	public void setShipofacssilist(String shipofacssilist) {
		this.shipofacssilist = shipofacssilist;
	}
	public String getShipofacsanctionlist() {
		return shipofacsanctionlist;
	}
	public void setShipofacsanctionlist(String shipofacsanctionlist) {
		this.shipofacsanctionlist = shipofacsanctionlist;
	}
	public String getShipoverallcompliancestatus() {
		return shipoverallcompliancestatus;
	}
	public void setShipoverallcompliancestatus(String shipoverallcompliancestatus) {
		this.shipoverallcompliancestatus = shipoverallcompliancestatus;
	}
	public String getShipowneraustraliansanctionlist() {
		return shipowneraustraliansanctionlist;
	}
	public void setShipowneraustraliansanctionlist(String shipowneraustraliansanctionlist) {
		this.shipowneraustraliansanctionlist = shipowneraustraliansanctionlist;
	}
	public String getShipownerbessanctionlist() {
		return shipownerbessanctionlist;
	}
	public void setShipownerbessanctionlist(String shipownerbessanctionlist) {
		this.shipownerbessanctionlist = shipownerbessanctionlist;
	}
	public String getShipownercanadiansanctionlist() {
		return shipownercanadiansanctionlist;
	}
	public void setShipownercanadiansanctionlist(String shipownercanadiansanctionlist) {
		this.shipownercanadiansanctionlist = shipownercanadiansanctionlist;
	}
	public String getShipownereusanctionlist() {
		return shipownereusanctionlist;
	}
	public void setShipownereusanctionlist(String shipownereusanctionlist) {
		this.shipownereusanctionlist = shipownereusanctionlist;
	}
	public String getShipownerfatfjurisdiction() {
		return shipownerfatfjurisdiction;
	}
	public void setShipownerfatfjurisdiction(String shipownerfatfjurisdiction) {
		this.shipownerfatfjurisdiction = shipownerfatfjurisdiction;
	}
	public String getShipownerhistoricalofacsanctionedcountry() {
		return shipownerhistoricalofacsanctionedcountry;
	}
	public void setShipownerhistoricalofacsanctionedcountry(String shipownerhistoricalofacsanctionedcountry) {
		this.shipownerhistoricalofacsanctionedcountry = shipownerhistoricalofacsanctionedcountry;
	}
	public String getShipownerofacsanctionlist() {
		return shipownerofacsanctionlist;
	}
	public void setShipownerofacsanctionlist(String shipownerofacsanctionlist) {
		this.shipownerofacsanctionlist = shipownerofacsanctionlist;
	}
	public String getShipownerofacsanctionedcountry() {
		return shipownerofacsanctionedcountry;
	}
	public void setShipownerofacsanctionedcountry(String shipownerofacsanctionedcountry) {
		this.shipownerofacsanctionedcountry = shipownerofacsanctionedcountry;
	}
	public String getShipownerparentfatfjurisdiction() {
		return shipownerparentfatfjurisdiction;
	}
	public void setShipownerparentfatfjurisdiction(String shipownerparentfatfjurisdiction) {
		this.shipownerparentfatfjurisdiction = shipownerparentfatfjurisdiction;
	}
	public String getShipownerparentofacsanctionedcountry() {
		return shipownerparentofacsanctionedcountry;
	}
	public void setShipownerparentofacsanctionedcountry(String shipownerparentofacsanctionedcountry) {
		this.shipownerparentofacsanctionedcountry = shipownerparentofacsanctionedcountry;
	}
	public String getShipownerswisssanctionlist() {
		return shipownerswisssanctionlist;
	}
	public void setShipownerswisssanctionlist(String shipownerswisssanctionlist) {
		this.shipownerswisssanctionlist = shipownerswisssanctionlist;
	}
	public String getShipownerunsanctionlist() {
		return shipownerunsanctionlist;
	}
	public void setShipownerunsanctionlist(String shipownerunsanctionlist) {
		this.shipownerunsanctionlist = shipownerunsanctionlist;
	}
	public String getShipsanctionedcountryportcalllast12m() {
		return shipsanctionedcountryportcalllast12m;
	}
	public void setShipsanctionedcountryportcalllast12m(String shipsanctionedcountryportcalllast12m) {
		this.shipsanctionedcountryportcalllast12m = shipsanctionedcountryportcalllast12m;
	}
	public String getShipsanctionedcountryportcalllast3m() {
		return shipsanctionedcountryportcalllast3m;
	}
	public void setShipsanctionedcountryportcalllast3m(String shipsanctionedcountryportcalllast3m) {
		this.shipsanctionedcountryportcalllast3m = shipsanctionedcountryportcalllast3m;
	}
	public String getShipsanctionedcountryportcalllast6m() {
		return shipsanctionedcountryportcalllast6m;
	}
	public void setShipsanctionedcountryportcalllast6m(String shipsanctionedcountryportcalllast6m) {
		this.shipsanctionedcountryportcalllast6m = shipsanctionedcountryportcalllast6m;
	}
	public String getShipstatuseffectivedate() {
		return shipstatuseffectivedate;
	}
	public void setShipstatuseffectivedate(String shipstatuseffectivedate) {
		this.shipstatuseffectivedate = shipstatuseffectivedate;
	}
	public String getShipswisssanctionlist() {
		return shipswisssanctionlist;
	}
	public void setShipswisssanctionlist(String shipswisssanctionlist) {
		this.shipswisssanctionlist = shipswisssanctionlist;
	}
	public String getShipunsanctionlist() {
		return shipunsanctionlist;
	}
	public void setShipunsanctionlist(String shipunsanctionlist) {
		this.shipunsanctionlist = shipunsanctionlist;
	}
	public String getShipustreasuryofacadvisorylist() {
		return shipustreasuryofacadvisorylist;
	}
	public void setShipustreasuryofacadvisorylist(String shipustreasuryofacadvisorylist) {
		this.shipustreasuryofacadvisorylist = shipustreasuryofacadvisorylist;
	}
	public List<Company> getCompany() {
		return company;
	}
	public void setCompany(List<Company> company) {
		this.company = company;
	}
	public List<CompanyComplianceDetail> getCompanycompliancedetails() {
		return companycompliancedetails;
	}
	public void setCompanycompliancedetails(List<CompanyComplianceDetail> companycompliancedetails) {
		this.companycompliancedetails = companycompliancedetails;
	}

}
