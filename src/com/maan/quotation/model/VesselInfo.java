package com.maan.quotation.model;

import com.google.gson.annotations.SerializedName;

public class VesselInfo {
	@SerializedName("VesselName")
	private String vesselName;
	@SerializedName("BranchCode")
	private String branchCode;
	public String getVesselName() {
		return vesselName;
	}
	public void setVesselName(String vesselName) {
		this.vesselName = vesselName;
	}
	public String getBranchCode() {
		return branchCode;
	}
	public void setBranchCode(String branchCode) {
		this.branchCode = branchCode;
	}
	
	
	
	

}
