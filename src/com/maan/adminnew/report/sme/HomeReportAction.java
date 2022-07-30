package com.maan.adminnew.report.sme;


import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class HomeReportAction  extends ActionSupport implements ModelDriven<HomeReport> {
 
	private static final long serialVersionUID = 1L;
	HomeReport bean =new HomeReport();
	public HomeReport getModel() {
		return bean;
	}
		
	public String home(){
		return SUCCESS;		
	} 

}
