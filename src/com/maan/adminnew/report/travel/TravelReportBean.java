package com.maan.adminnew.report.travel;

import java.util.List;
import java.util.Map;

public class TravelReportBean {
	private String reqFrom;
	private String fromDate;
	private String toDate;
	private String productId;
	private String product;
	private String mode;
	private String brokerName;
	private String userName;
	
	private List<Map<String,Object>> travelReportList;
	
	public String getReqFrom() {
		return reqFrom;
	}
	public void setReqFrom(String reqFrom) {
		this.reqFrom = reqFrom;
	}
	public String getFromDate() {
		return fromDate;
	}
	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}
	public String getToDate() {
		return toDate;
	}
	public void setToDate(String toDate) {
		this.toDate = toDate;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getProductId() {
		return productId;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public String getProduct() {
		return product;
	}
	public void setTravelReportList(List<Map<String,Object>> travelReportList) {
		this.travelReportList = travelReportList;
	}
	public List<Map<String,Object>> getTravelReportList() {
		return travelReportList;
	}
	public void setMode(String mode) {
		this.mode = mode;
	}
	public String getMode() {
		return mode;
	}
	public void setBrokerName(String brokerName) {
		this.brokerName = brokerName;
	}
	public String getBrokerName() {
		return brokerName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserName() {
		return userName;
	}
	
}
