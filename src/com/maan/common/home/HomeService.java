package com.maan.common.home;

import java.util.List;
import java.util.Map;

public class HomeService {
	HomeDAO dao = new HomeDAOImpl();
	
	public String getActualBranch(String user) {
		return dao.getActualBranch(user);
	}
	public String getDefaultBranch(String loginType, String selectedBranch, String branchCode) {
		return dao.getDefaultBranch(loginType, selectedBranch, branchCode);
	}
	public Map<String,String> getBrokerUserDetails(String brokerBranch) {
		return dao.getBrokerUserDetails(brokerBranch);
	}
	public boolean isIssuer(String userType) {
		return "RSAIssuer".equalsIgnoreCase(userType)?true:false;
	}
	public List<Map<String,Object>> getProductDetails(String loginId, String userType, String branchCode) {
		return dao.getProductDetails(loginId, userType, branchCode);
	}
	public List<Map<String,Object>> getOfficeProductScheme(String loginId, String branchCode) {
		return dao.getOfficeProductScheme(loginId, branchCode);
	}
	public boolean getIsBrokerHasDC(String loginId) {
		return dao.getIsBrokerHasDC(loginId);
	}	
}
