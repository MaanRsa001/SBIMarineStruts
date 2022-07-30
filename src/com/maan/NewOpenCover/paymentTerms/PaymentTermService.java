package com.maan.NewOpenCover.paymentTerms;

import java.util.ArrayList;
import java.util.List;

import com.maan.NewOpenCover.Api.ApiForCommodity;
import com.maan.NewOpenCover.paymentTerms.Api.ApiForPaymentTerm;

public class PaymentTermService {

	public List<Object> getPaymentTermsDetails(PaymentTermBean bean) {
		List<Object> result=new ArrayList<Object>();
		try {
			ApiForPaymentTerm grid=null;		
				grid=new ApiForPaymentTerm(bean,"paymenttermdetail");	
			if(grid!=null)
				result=grid.getPaymentTermsDetails();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public List<Object> getUserSelection(PaymentTermBean bean) {
		List<Object> result=new ArrayList<Object>();
		try {
			ApiForPaymentTerm grid=null;		
				grid=new ApiForPaymentTerm(bean,"userselection");	
			if(grid!=null)
				result=grid.getUserSelection();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public List<Object> getPaymentTerms(PaymentTermBean bean) {
		List<Object> result=new ArrayList<Object>();
		try {
			ApiForPaymentTerm grid=null;		
				grid=new ApiForPaymentTerm(bean,"paymentterms");	
			if(grid!=null)
				result=grid.getPaymentTerms();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public List<Object> getOpenCoverNoList(PaymentTermBean bean) {
		List<Object> result=new ArrayList<Object>();
		try {
			ApiForPaymentTerm grid=null;		
				grid=new ApiForPaymentTerm(bean,"opencoverlist");	
			if(grid!=null)
				result=grid.getOpenCoverNoList();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public List<Object> getPaymentTermsList(PaymentTermBean bean) {
		List<Object> result=new ArrayList<Object>();
		try {
			ApiForPaymentTerm grid=null;		
				grid=new ApiForPaymentTerm(bean,"paymenttermlist");	
			if(grid!=null)
				result=grid.getPaymentTermsList();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public List<Object> getPaymentTermsViewList(PaymentTermBean bean) {
		List<Object> result=new ArrayList<Object>();
		try {
			ApiForPaymentTerm grid=null;		
				grid=new ApiForPaymentTerm(bean,"paymenttermviewlist");	
			if(grid!=null)
				result=grid.getPaymentTermsViewList();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public List<Object> getPaymentDuelist(PaymentTermBean bean) {
		List<Object> result=new ArrayList<Object>();
		try {
			ApiForPaymentTerm grid=null;		
				grid=new ApiForPaymentTerm(bean,"paymentduelist");	
			if(grid!=null)
				result=grid.getPaymentDuelist();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public String addPaymentTerms(PaymentTermBean bean) {
		String result="";
		try {
			ApiForPaymentTerm grid=null;		
				grid=new ApiForPaymentTerm(bean,"addpaymentterm");	
			if(grid!=null)
				result=grid.addPaymentTerms();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public String deletePayment(PaymentTermBean bean) {
		String result="";
		try {
			ApiForPaymentTerm grid=null;		
				grid=new ApiForPaymentTerm(bean,"deletepaymentterm");	
			if(grid!=null)
				result=grid.deletePayment();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	

}
