package com.maan.vessel.Api.res;

import com.google.gson.annotations.SerializedName;

public class ShipByIHSLRorIMORes {


	@SerializedName("APSShipDetail") 
    public APSShipDetail apsshipdetail;
	@SerializedName("shipCount") 
    public String shipcount;
	public APSShipDetail getApsshipdetail() {
		return apsshipdetail;
	}
	public void setApsshipdetail(APSShipDetail apsshipdetail) {
		this.apsshipdetail = apsshipdetail;
	}
	public String getShipcount() {
		return shipcount;
	}
	public void setShipcount(String shipcount) {
		this.shipcount = shipcount;
	}
	
	
}
