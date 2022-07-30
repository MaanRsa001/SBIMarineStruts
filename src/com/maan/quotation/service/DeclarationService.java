package com.maan.quotation.service;

import java.util.HashMap;
import java.util.List;

import com.maan.common.dao.CommonDAO;
import com.maan.common.exception.BaseException;
import com.maan.quotation.DeclarationAction;
import com.maan.quotation.dao.DeclarationDAO;

public class DeclarationService {

	DeclarationDAO dec=new DeclarationDAO();
	public List<Object> getDeclarationList(String option, String reqFrom, String[] args) throws  BaseException
	{		
		return dec.getDeclarationList(option,reqFrom, args);		
	}
	public List<Object> getDeclarationList(String option, String[] args) throws  BaseException
	{		
		return dec.getDeclarationList(option,args);		
	}
	public List<Object> getDeclarationList(String selectedAllQuote) throws  BaseException
	{		
		return dec.getDeclarationList(selectedAllQuote);		
	}
	public List<Object> policyGeneration(String option, String[] args) throws  BaseException
	{		
		return dec.getDeclarationList(option,args);		
	}
	public int updatePolicyInfo(List<Object> selectedQuote, String generateStatus, String stampStatus,String policyStartDate,String declarationMnth,String declarationYr)throws  BaseException{
		 return dec.updatePolicyInfo(selectedQuote,generateStatus,stampStatus, policyStartDate, declarationMnth, declarationYr);
	}
	public String policyGeneration(String loginId, String productId, String openCoverNo,List<Object> selectedQuote,String branchCode, String rubberStamp, String noteType, String paymentMode, String currencyId, String debitCustomerId, String currencyValue, String issuer,String declaredPolicy)throws  BaseException{
		HashMap<String, String> map=new HashMap<String, String>();
		String quoteNos="";
		List<String> validateFields=null;
		List<String> validateExcessPremium=null;
		if(selectedQuote!=null && !selectedQuote.isEmpty())
		{
			for(int i=0;i<selectedQuote.size();i++){
				map.put(""+(i+1),(String)selectedQuote.get(i));
				quoteNos=quoteNos+selectedQuote.get(i)+",";
				map.put("quote"+(i+1),(String)selectedQuote.get(i));
			}
			quoteNos=quoteNos.substring(0,(quoteNos.length()-1));
			map.put("MultiQuoteStatus","YES");
			map.put("conCatQuotes",quoteNos);
			map.put("count",""+selectedQuote.size());
		}
		else{
			map.put("MultiQuoteStatus","NIL");
		}/*
		return new policyInfo().PolicyGenerationMulti("", loginId, "NO", "NO", "YES", "NO", "NO", productId, openCoverNo, map, branchCode, "", "N", rubberStamp, branchCode, noteType, paymentMode, currencyId, debitCustomerId, currencyValue, issuer);
	}*/
		return null;
		/* if("D".equalsIgnoreCase(declaredPolicy)){
			 return new policyInfo().PolicyGenerationMulti("", loginId, "NO", "NO", "YES", "NO", "NO", productId, openCoverNo, map, branchCode, "", "N", rubberStamp, branchCode, noteType, paymentMode, currencyId, debitCustomerId, currencyValue, issuer);

		 }else{
			 return new policyInfo().PolicyGenerationMultiCert("", loginId, "NO", "NO", "YES", "NO", "NO", productId, openCoverNo, map, branchCode, "", "N", rubberStamp, branchCode, noteType, paymentMode, currencyId, debitCustomerId, currencyValue, issuer);
 
		 }*/
		 
	}
	public List<String>  validateExcessPremium(List<Object> selectedQuotes){
		return dec.validateExcessPremium(selectedQuotes);
	}
	public List<String> validateFields(List<Object> selectedQuotes){
		return dec.validateFields(selectedQuotes);
	}
	public List<Object> getPolicyPrints(String startDate,String openCoverNo,String policyMode,String branch) {
		return dec.getPolicyPrints(startDate,openCoverNo,policyMode,branch);
	}
	public void insertDueDetails(String quoteNo, String policyNo, List<String> dueDate, List<String> dueamount,
			List<String> duepercent,List<String> effectiveDatePT, List<String> dueList, 
				String reqFrom, String snoPT, String amendId, String product) {
		new CommonDAO().insertDueDetails(quoteNo, policyNo, dueDate, dueamount, duepercent, effectiveDatePT, dueList, reqFrom, snoPT, amendId, product);
		
	}
	public List<String> validatePaymentTerms(String quoteNo, String policyNo, List<String> dueDate, List<String> dueamount,
			List<String> duepercent,List<String> effectiveDatePT, List<String> dueList, 
				String premium, String branchCode) {
		return new CommonDAO().validatePaymentTerms(quoteNo, policyNo, dueDate, dueamount, duepercent, effectiveDatePT, dueList, premium, branchCode);
		
	}
	public void processRecords(String tranId, String loginId, String openCoverNo, String branchCode, String issuer, String productId, String brokerCode) {
		dec.processRecords( tranId,  loginId,  openCoverNo,  branchCode,  issuer,  productId,  brokerCode);
		
	}
	public void getDeclarationQuote(DeclarationAction bean) {
		dec.getDeclarationQuote(bean);
		
	}
}
