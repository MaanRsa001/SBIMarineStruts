package com.maan.common.home;

import java.util.List;
import java.util.Map;

public interface HomeDAO {
	public String getActualBranch(String user);
	public String getDefaultBranch(String loginType, String selectedBranch, String branchCode);
	public Map<String,String> getBrokerUserDetails(String brokerBranch);
	public List<Map<String,Object>> getProductDetails(String loginId, String userType, String branchCode);
	public List<Map<String,Object>> getOfficeProductScheme(String loginId, String branchCode);
	public boolean getIsBrokerHasDC(String loginId);
}
