package com.maan.adminnew.closeTrn;

import java.util.List;

public class CloseTrnBean {
	private String reqFrom;
	private String openDate;
	private String closeDate;
	private String monthCloseDate;
	private String remarks;
	private String description;
	private String closeNextDate;
	private List <Object> viewList;

	public String getReqFrom() {
		return reqFrom;
	}
	public void setReqFrom(String reqFrom) {
		this.reqFrom = reqFrom;
	}
	public String getOpenDate() {
		return openDate;
	}
	public void setOpenDate(String openDate) {
		this.openDate = openDate;
	}
	public String getCloseDate() {
		return closeDate;
	}
	public void setCloseDate(String closeDate) {
		this.closeDate = closeDate;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getMonthCloseDate() {
		return monthCloseDate;
	}
	public void setMonthCloseDate(String monthCloseDate) {
		this.monthCloseDate = monthCloseDate;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getCloseNextDate() {
		return closeNextDate;
	}
	public void setCloseNextDate(String closeNextDate) {
		this.closeNextDate = closeNextDate;
	}
	public List<Object> getViewList() {
		return viewList;
	}
	public void setViewList(List<Object> viewList) {
		this.viewList = viewList;
	}

}
