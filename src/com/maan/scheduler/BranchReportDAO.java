package com.maan.scheduler;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.Logger;

import com.maan.common.LogUtil;
import com.maan.common.MyJdbcTemplate;

public class BranchReportDAO extends MyJdbcTemplate {
	final Logger logger = LogUtil.getLogger(BranchReportDAO.class);
	public int getBranchReportCount(String startDate,String endDate,String policyStatus,String productId,String branchCode) {
		int result = 0;
		try {
			String query = getQuery("GET_BRANCH_REPORT_CNT");
			Object[] args = new Object[]{startDate,endDate,policyStatus,branchCode,"ALL",
										startDate,endDate,policyStatus,branchCode,"ALL"};
			logger.info("Query==> " + query);
			logger.info("Args==> " + StringUtils.join(args, "~~"));
			result = this.mytemplate.queryForInt(query, args);
			logger.info("Result==> " + result);
		}
		catch(Exception exception) {
			logger.debug(exception);
		}
		return result;
	}
	
	public List<Map<String,Object>> getBranchDetailsList() {
		List<Map<String,Object>> resultList = new ArrayList<Map<String,Object>>();
		try {
			String query = getQuery("GET_BRANCHDETAILS_LIST");
			logger.info("Query==> " + query);
			resultList = this.mytemplate.queryForList(query);
		}
		catch(Exception exception) {
			logger.debug(exception);
		}
		return resultList;
	}
	
	public int getScheduleCount(String startDate,String endDate,String branchCode) {
		int result = 0;
		try {
			String query = getQuery("GET_BRANCH_SCHEDULE_CNT");
			Object[] args = new Object[]{branchCode,startDate,endDate};
			logger.info("Query==> " + query);
			logger.info("Args==> " + StringUtils.join(args, "~~"));
			result = this.mytemplate.queryForInt(query, args);
			logger.info("Result==> " + result);
		}
		catch(Exception exception) {
			logger.debug(exception);
		}
		return result;
	}
	
	public int getDebitCount(String startDate,String endDate,String branchCode, String type) {
		int result = 0;
		try {
			String query = getQuery("GET_BRANCH_DEBIT_CNT");
			Object[] args = new Object[]{branchCode,type,startDate,endDate};
			logger.info("Query==> " + query);
			logger.info("Args==> " + StringUtils.join(args, "~~"));
			result = this.mytemplate.queryForInt(query, args);
			logger.info("Result==> " + result);
		}
		catch(Exception exception) {
			logger.debug(exception);
		}
		return result;
	}
	
	public int getCreditCount(String startDate,String endDate,String branchCode, String type) {
		int result = 0;
		try {
			String query = getQuery("GET_BRANCH_CREDIT_CNT");
			Object[] args = new Object[]{branchCode,type,startDate,endDate};
			logger.info("Query==> " + query);
			logger.info("Args==> " + StringUtils.join(args, "~~"));
			result = this.mytemplate.queryForInt(query, args);
			logger.info("Result==> " + result);
		}
		catch(Exception exception) {
			logger.debug(exception);
		}
		return result;
	}

}
