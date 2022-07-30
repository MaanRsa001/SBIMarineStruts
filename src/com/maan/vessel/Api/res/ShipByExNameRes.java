package com.maan.vessel.Api.res;

import java.util.List;

import com.google.gson.annotations.SerializedName;


public class ShipByExNameRes {


	@SerializedName("Ships") 
	 public List<Ships> ships;
	@SerializedName("shipCount") 
	 public int shipcount;
	public List<Ships> getShips() {
		return ships;
	}
	public void setShips(List<Ships> ships) {
		this.ships = ships;
	}
	public int getShipcount() {
		return shipcount;
	}
	public void setShipcount(int shipcount) {
		this.shipcount = shipcount;
	}
	
	
}
