package com.maan.NewOpenCover.reports;

import java.util.ArrayList;
import java.util.List;

import com.maan.NewOpenCover.Api.ApiForCopyQuote;
import com.maan.NewOpenCover.Api.ApiForQuoteRegister;
import com.maan.NewOpenCover.Api.ApiForReport;

public class ReportRegService {

	public List<Object> getQuoteRegisterList(ReportRegBean bean) {
		List<Object> result=new ArrayList<Object>();
		try {
			ApiForQuoteRegister grid=null;		
				grid=new ApiForQuoteRegister(bean,"quoteregister");	
			if(grid!=null)
				result=grid.getQuoteRegisterList();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public List<Object> getPolicyRegisterList(ReportRegBean bean) {
		List<Object> result=new ArrayList<Object>();
		try {
			ApiForQuoteRegister grid=null;		
				grid=new ApiForQuoteRegister(bean,"policyregister");	
			if(grid!=null)
				result=grid.getPolicyRegisterList();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public List<Object> getRenewalPolicyList(ReportRegBean bean) {
		List<Object> result=new ArrayList<Object>();
		try {
			ApiForQuoteRegister grid=null;		
				grid=new ApiForQuoteRegister(bean,"renewalpolicy");	
			if(grid!=null)
				result=grid.getRenewalPolicyList();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public List<Object> getPendingAcceptList(ReportRegBean bean) {
		List<Object> result=new ArrayList<Object>();
		try {
			ApiForQuoteRegister grid=null;		
				grid=new ApiForQuoteRegister(bean,"pendingaccept");	
			if(grid!=null)
				result=grid.getPendingAcceptList();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public List<Object> getExpiredPolicyList(ReportRegBean bean) {
		List<Object> result=new ArrayList<Object>();
		try {
			ApiForQuoteRegister grid=null;		
				grid=new ApiForQuoteRegister(bean,"expirypolicy");	
			if(grid!=null)
				result=grid.getExpiredPolicyList();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public List<Object> getLapsedPolicyList(ReportRegBean bean) {
		List<Object> result=new ArrayList<Object>();
		try {
			ApiForQuoteRegister grid=null;		
				grid=new ApiForQuoteRegister(bean,"laspedpolicy");	
			if(grid!=null)
				result=grid.getLapsedPolicyList();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public List<Object> copySearch(ReportRegBean bean) {
		List<Object> result=new ArrayList<Object>();
		try {
			ApiForCopyQuote grid=null;		
				grid=new ApiForCopyQuote(bean,"copysearch");	
			if(grid!=null)
				result=grid.copySearch();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public List<Object> copySearchPolicy(ReportRegBean bean) {
		List<Object> result=new ArrayList<Object>();
		try {
			ApiForCopyQuote grid=null;		
				grid=new ApiForCopyQuote(bean,"copysearchpolicy");	
			if(grid!=null)
				result=grid.copySearchPolicy();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
		
	}
	public String opencoverCopy(ReportRegBean bean) {
		String result="";
		try {
			ApiForCopyQuote grid=null;		
				grid=new ApiForCopyQuote(bean,"copyquote");	
			if(grid!=null)
				result=grid.opencoverCopy();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public List<Object> getExistingBrokerList(ReportRegBean bean) {
		List<Object> result=new ArrayList<Object>();
		try {
			ApiForQuoteRegister grid=null;		
				grid=new ApiForQuoteRegister(bean,"existingbrokerlist");	
			if(grid!=null)
				result=grid.getExistingBrokerList();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public void activeDeactive(ReportRegBean bean) {
		try {
			ApiForQuoteRegister grid=null;		
				grid=new ApiForQuoteRegister(bean,bean.getDeactive());	
			if(grid!=null)
				grid.activeDeactive();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public String opencoverschedule(ReportRegBean bean) {
		String result="";
		try {
			ApiForReport grid=null;		
				grid=new ApiForReport(bean,"opencoverschedule");	
			if(grid!=null)
				result=grid.opencoverschedule();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public String opencoverdebitcredit(ReportRegBean bean) {
		String result="";
		try {
			ApiForReport grid=null;		
				grid=new ApiForReport(bean,"opencoverdebitcredit");	
			if(grid!=null)
				result=grid.opencoverdebitcredit();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public List<Object> getPortfolioBrokerList(ReportRegBean bean) {
		List<Object> result=new ArrayList<Object>();
		try {
			ApiForQuoteRegister grid=null;		
				grid=new ApiForQuoteRegister(bean,"portfoliobrokerlist");	
			if(grid!=null)
				result=grid.getPortfolioBrokerList();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public String opencoverendt(ReportRegBean bean) {
		String result="";
		try {
			ApiForReport grid=null;		
				grid=new ApiForReport(bean,"opencoverendt");	
			if(grid!=null)
				result=grid.opencoverendt();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public String openClasuesPDF(ReportRegBean bean) {
		String result="";
		try {
			ApiForReport grid=null;		
				grid=new ApiForReport(bean,"opencoverclausespdf");	
			if(grid!=null)
				result=grid.opencoverclausespdf();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
}
