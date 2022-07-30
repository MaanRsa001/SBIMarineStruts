package com.maan.adminnew.referal;

import java.util.List;

public class ReferalService
{	
	ReferalDAO dao=new ReferalDAO();
	
	public List <Object> getOCList(String reqFrom, String productID, String branchCode, String agencyCode,String login_id,String attched_Branch){
    	return dao.getOCList(reqFrom, productID, branchCode, agencyCode,login_id,attched_Branch);
    }
	
	public List <Object> getPolicyList(String branchCode, String date, String productID, String reqFrom, String agencyCode,String loginId,String attched_Branch){
    	return dao.getPolicyList(branchCode, date, productID, reqFrom, agencyCode, loginId,attched_Branch);
    }

	public List<Object> getRegionList(String loginId, String accesstype) {
		return dao.getRegionList(loginId, accesstype);
	}

	public List<Object> searchReferralQuote(String branchId, String searchQuote,String productID) {	 
		return dao.searchReferralQuote(branchId,searchQuote,productID);
	}

	public List<Object> searchDecReferralQuote(String branchId, String searchQuote,String productID) {	 
		return dao.searchDecReferralQuote(branchId,searchQuote,productID);
	}

	public List<Object> getOCListApi(String reqFrom, String productID, String branchId, String agencyCode, String login_id, String attched_Branch) {
		return dao.getOcListApi(reqFrom, productID, branchId, agencyCode, login_id, attched_Branch);
	}

	public List<Object> getSearchReferralQuoteAPI(String branchId, String searchQuote, String productID) {
		return dao.getSearchReferralQuoteAPI(branchId,searchQuote,productID);
	}
}