package com.maan.common.home;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.Logger;

import com.maan.common.LogUtil;
import com.maan.common.MyJdbcTemplate;


public class HomeDAOImpl extends MyJdbcTemplate implements HomeDAO {
	final static Logger logger = LogUtil.getLogger(HomeDAOImpl.class);
	public String getActualBranch(String user) {
		String result = "";
		try {
			String query = getQuery("LOG_BRANCH_FROM_BCM");			
			Object[] args = new Object[]{user};
			logger.info("Query==> " + query);
			logger.info("Args==> " + StringUtils.join(args, ", "));
			result = (String) this.mytemplate.queryForObject(query, args, String.class);
		} catch(Exception exception) {
			//logger.debug("Exception @ getActualBranch() " + exception);
		} finally {
			if(StringUtils.isBlank(result)) {
				String query = getQuery("LOG_BRANCH_FROM_LM") ;
				Object[] args = new Object[]{user};
				logger.info("Query==> " + query);
				logger.info("Args" + StringUtils.join(args, ", "));
				result = (String) this.mytemplate.queryForObject(query, args, String.class);
			}
		}
		return result;
	}
	
	public String getDefaultBranch(String loginType, String selectedBranch, String branchCode) {
		String result = "";
		try {
			String query = getQuery("GET_DEFAULT_BRANCH");
			Object[] args = new Object[]{branchCode};
			logger.info("Query==> " + query);
			logger.info("Args==> " + StringUtils.join(args, ", "));
			result = (String) this.mytemplate.queryForObject(query, args, String.class);
		} catch(Exception exception) {
			logger.debug("Exception @ getDefaultBranch() " + exception);
		} finally {
			result=!("Broker".equalsIgnoreCase(loginType) || "User".equalsIgnoreCase(loginType))?selectedBranch:result;
		}
		return result;
	}
	
	public Map<String,String> getBrokerUserDetails(String brokerBranch) {
		Map<String,String> finalMap = new HashMap<String,String>();
		try {
			String query = getQuery("GET_BROKUSER_DET");
			Object[] args = new Object[]{brokerBranch};
			logger.info("Query==> " + query);
			logger.info("Args==> " + StringUtils.join(args, ", "));
			Map<String,Object> resultMap = this.mytemplate.queryForMap(query, args); 
			finalMap.put("Branch", brokerBranch);
			finalMap.put("CurrencyName",(resultMap.get("CURRENCY_ABBREVIATION")==null?"SAR":resultMap.get("CURRENCY_ABBREVIATION").toString()));
			finalMap.put("Orgination",(resultMap.get("ORIGINATION_COUNTRY_ID")==null?"1":resultMap.get("ORIGINATION_COUNTRY_ID").toString()));
			finalMap.put("Destination",(resultMap.get("DESTINATION_COUNTRY_ID")==null?"1":resultMap.get("DESTINATION_COUNTRY_ID").toString()));
			finalMap.put("CurrencyAbb",(resultMap.get("CURRENCY_ABBREVIATION")==null?"SAR":resultMap.get("CURRENCY_ABBREVIATION").toString()));
			finalMap.put("CurrencyDecimal",(resultMap.get("DECIMAL_PLACES")==null?"2":resultMap.get("DECIMAL_PLACES").toString()));
			finalMap.put("Tax",(resultMap.get("TAX")==null?"0":resultMap.get("TAX").toString()));
			finalMap.put("Site",(resultMap.get("EMAIL")==null?" ":resultMap.get("EMAIL").toString()));
			finalMap.put("LANG",(resultMap.get("LANG_YN")==null?" ":resultMap.get("LANG_YN").toString()));
		} catch(Exception exception) {
			logger.debug("Exception @ getBrokerUserDetails() " + exception);
		}
		return finalMap;
	}
		
	public List<Map<String,Object>> getProductDetails(String loginId, String userType, String branchCode) {
		List<Map<String,Object>> resultList = null;
		try {
			String query;
			Object[] args;
			if("Broker".equalsIgnoreCase(userType) || "User".equalsIgnoreCase(userType)) {
				query = getQuery("GET_PROD_BROK");
				args = new Object[]{branchCode,loginId};
				logger.info("Query==> " + query);
				logger.info("Args==> " + StringUtils.join(args, ", "));
				resultList = this.mytemplate.queryForList(query, args);
			} else {
				query = getQuery("GET_ADMIN_PROD");
				args = new Object[]{loginId};
				logger.info("Query==> " + query);
				logger.info("Args==> " + StringUtils.join(args, ", "));
				String productIds = (String) this.mytemplate.queryForObject(query, args, String.class);
				
				productIds=productIds.replaceAll(", ", ",");
				productIds=productIds.replaceAll(" ,", ",");
				productIds=productIds.replaceAll(",", "','");
				query = getQuery("GET_PROD_LIST",productIds);
				args = new Object[]{branchCode};
				logger.info("Query==> " + query);
				logger.info("Args" + StringUtils.join(args, ", "));
				resultList = this.mytemplate.queryForList(query, args);
			}
			
		} catch(Exception exception) {
			logger.debug("Exception @ getProductDetails() " + exception);
		}
		return resultList;
	}
	public List<Map<String,Object>> getOfficeProductScheme(String loginId, String branchCode) {
		List<Map<String,Object>> resultList = null;
		try {
			String query = getQuery("GET_OFSPROD_SCHEM");
			Object[] args = new Object[]{branchCode,loginId};
			logger.info("Query==> " + query);
			logger.info("Args==> " + StringUtils.join(args, ", "));
			resultList = this.mytemplate.queryForList(query, args);
		} catch(Exception exception) {
			logger.debug("Exception @ getOfficeProductScheme() " + exception);
		}
		return resultList;
	}
	
	public Map<String,String> getCustomerRights(String loginId, String userType) {
		Map<String,String> resultMap = new HashMap<String, String>();
		try {
			if("RSAIssuer".equalsIgnoreCase(userType) || "Broker".equalsIgnoreCase(userType) || "User".equalsIgnoreCase(userType)) {
				String query = getQuery("GET_CUST_RIGHT");
				Object[] args = new Object[]{loginId};
				logger.info("Query==> " + query);
				logger.info("Args==> " + StringUtils.join(args, ", "));
				List<Map<String,Object>> resultList = this.mytemplate.queryForList(query, args);
				for(Map<String,Object> tempMap:resultList) {
					String cusPid = tempMap.get("PRODUCT_ID")==null?"":tempMap.get("PRODUCT_ID").toString();
					resultMap.put("cusQuote"+cusPid, tempMap.get("CUSTOMER_QUOTE")==null?"":tempMap.get("CUSTOMER_QUOTE").toString());
					resultMap.put("cusSchedule"+cusPid, tempMap.get("CUSTOMER_SCHEDULE")==null?"":tempMap.get("CUSTOMER_SCHEDULE").toString());
					resultMap.put("cusDebit"+cusPid, tempMap.get("FREIGHT_DEBIT_OPTION")==null?"":tempMap.get("FREIGHT_DEBIT_OPTION").toString());
					resultMap.put("cusCusDebit"+cusPid, tempMap.get("CUSTOMER_CUSTOMERDEBIT")==null?"":tempMap.get("CUSTOMER_CUSTOMERDEBIT").toString());
					resultMap.put("policyOpt"+cusPid, tempMap.get("CUSTOMER_POLICY")==null?"":tempMap.get("CUSTOMER_POLICY").toString());
					resultMap.put("certificateOpt"+cusPid, tempMap.get("CUSTOMER_CERTIFICATE")==null?"":tempMap.get("CUSTOMER_CERTIFICATE").toString());
				}
			}
		} catch(Exception exception) {
			logger.debug("Exception @ getCustomerRights() " + exception);
		}
		return resultMap;
	}
	
	public boolean getIsBrokerHasDC(String loginId) {
		boolean status = false;
		try {
			String query = getQuery("GET_BROKDC");
			Object[] args = new Object[]{loginId};
			logger.info("Query==> " + query);
			logger.info("Args==> " + StringUtils.join(args, ", "));
			int count = this.mytemplate.queryForInt(query, args);
			if(count==0) {
				status = true;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return status;
	}
	
}
