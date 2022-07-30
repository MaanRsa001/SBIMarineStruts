package com.maan.copyquote.service;

import java.util.List;
import java.util.Map;

import com.maan.copyquote.dao.CopyQuoteDAO;

public class CopyQuoteService {
	
CopyQuoteDAO copyquote=new CopyQuoteDAO();
	public List<Object> getCopyQuoteSearch(String type,String quoteNo,String openCoverNo,String productId, String issuer, String loginID,String branchCode)
	{
		return copyquote.getCopyQuoteSearch(type, quoteNo,openCoverNo,productId,issuer,loginID,branchCode);
	}
	public Map<String, Object> copyQuote(String loginId,String quoteNo, String type, String typeId, String issuer)
	{
		return copyquote.copyQuote(loginId, quoteNo, type, typeId, issuer);
	}
	public List<Object> getTravelCopyQuoteSearch(String type,String quoteNo,String loginID,String productId) {
		return copyquote.getTravelCopyQuoteSearch(type, quoteNo, loginID,productId);
	}
	public Map<String, Object> travelcopyQuote(String loginId,String quoteNo, String productId,String branchCode, String typeId, String vehicleId) throws Exception {
		return copyquote.travelcopyQuote(loginId, quoteNo, productId,branchCode,typeId,vehicleId);
	}
	public List<Object> getOpenCopyQuoteSearch(String searchType,String searchValue, String openCoverNo, String productId) {
		return copyquote.getOpenCopyQuoteSearch(searchType,searchValue,openCoverNo,productId);
	}
	public Map<String, Object> openCopyQuote(String copyQuoteValue) {	
		return copyquote.openCopyQuote(copyQuoteValue);
	}
}
