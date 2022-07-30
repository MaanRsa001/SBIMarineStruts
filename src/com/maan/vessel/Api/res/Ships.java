package com.maan.vessel.Api.res;

import java.io.Serializable;

import com.google.gson.annotations.SerializedName;

public class Ships implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@SerializedName("CallSign")
	public String callsign;//Response from ShipByExname
	@SerializedName("CoreShipInd") 
    public String coreshipind;
    @SerializedName("DataSetVersion") 
    public DataSetVersion datasetversion;
    @SerializedName("DateOfBuild") 
    public String dateofbuild;
    @SerializedName("Deadweight") 
    public String deadweight;
    @SerializedName("FlagName") 
    public String flagname;
    @SerializedName("GrossTonnage") 
    public String grosstonnage;
    @SerializedName("IHSLRorIMOShipNo") 
    public String ihslrorimoshipno;
    @SerializedName("MaritimeMobileServiceIdentityMMSINumber")
	public String maritimemobileserviceidentitymmsinumber;//Response from ShipByExname
    @SerializedName("PortOfRegistry") 
    public String portofregistry;
    @SerializedName("ShipName") 
    public String shipname;
    @SerializedName("ShiptypeLevel5") 
    public String shiptypelevel5;
    @SerializedName("ShipStatus") 
    public String shipstatus;
	
}
