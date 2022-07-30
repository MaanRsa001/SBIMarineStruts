package com.maan.adminnew.report.common;

import java.util.List;
import java.util.Map;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.Logger;

import com.maan.adminnew.rating.RatingUploadService;
import com.maan.common.LogUtil;
import com.maan.common.MyJdbcTemplate;

public class ReportDAO extends MyJdbcTemplate
{
	final Logger logger = LogUtil.getLogger(ReportDAO.class);
	public List<Map<String, Object>> getBrokerList(ReportBean bean) {
		List<Map<String, Object>> result=null;
		try{
			String query=getQuery("GET_COMMON_REPORT_BROKER_LIST");
			Object args[]=new Object[]{bean.getBranchCode(),bean.getProductId()};
			logger.info("Query => "+query);
			logger.info("Arguments => "+StringUtils.join(args,","));
			result=this.mytemplate.queryForList(query,args);
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	public List<Map<String, Object>> getUserList(ReportBean bean) {
		List<Map<String, Object>> result=null;
		try{
			String query=getQuery("GET_COMMON_REPORT_USER_LIST");
			Object args[]=new Object[]{bean.getBrokerCode(),bean.getProductId()};
			logger.info("Query => "+query);
			logger.info("Arguments => "+StringUtils.join(args,","));
			result=this.mytemplate.queryForList(query,args);
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	public List<Map<String, Object>> getBranchList(ReportBean bean) {
		List<Map<String, Object>> result=null;
		try{
			String query=getQuery("");
			Object args[]=new Object[]{};
			logger.info("Query => "+query);
			logger.info("Arguments => "+StringUtils.join(args,","));
			result=this.mytemplate.queryForList(query,args);
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	public List<Map<String, Object>> getSubBranchList(ReportBean bean) {
		List<Map<String, Object>> result=null;
		try{
			String query=getQuery("GET_COMMON_REPORT_SUB_BRANCH_LIST");
			Object args[]=new Object[]{bean.getBranchCode()};
			logger.info("Query => "+query);
			logger.info("Arguments => "+StringUtils.join(args,","));
			result=this.mytemplate.queryForList(query,args);
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	public List<Map<String, Object>> getPolicyTypeList(ReportBean bean) {
		List<Map<String, Object>> result=null;
		try{
			String query="";
			Object args[];
			if("65".equalsIgnoreCase(bean.getProductId())){
				query=getQuery("GET_COMMON_REPORT_MOTOR_POLICY_LIST");
			}else if("33".equalsIgnoreCase(bean.getProductId())){
				query=getQuery("GET_COMMON_REPORT_TRAVEL_POLICY_LIST");
			}else if("11".equalsIgnoreCase(bean.getProductId()) || "3".equalsIgnoreCase(bean.getProductId())){
				query=getQuery("GET_COMMON_REPORT_MARINE_POLICY_LIST");
			}
			logger.info("Query => "+query);
		//	logger.info("Arguments => "+StringUtils.join(args,","));
			result=this.mytemplate.queryForList(query);
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	public List<Map<String, Object>> getReportList(ReportBean bean) {
		List<Map<String, Object>> result=null;
		try{
			String query=getQuery("GET_COMMON_REPORT_LIST");
			Object args[]=new Object[]{bean.getProductId()};
			logger.info("Query => "+query);
			logger.info("Arguments => "+StringUtils.join(args,","));
			result=this.mytemplate.queryForList(query,args);
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	public List<Map<String, Object>> getTranReportList(ReportBean bean) {
		List<Map<String, Object>> result=null;
		try{
			String query="";
			Object[] args=null;
			if("3".equals(bean.getProductId()) || "11".equals(bean.getProductId())){
				if ("2".equals(bean.getReportType())) {
					query=getQuery("GET_COMMON_POLICY_BOUDREAUX_REPORT");
					args=new Object[]{bean.getDateType(),bean.getFromDate(),bean.getToDate(),bean.getBranchCode(),bean.getSubBranchCode(),bean.getPolicyType(),bean.getBrokerCode(),bean.getUserCode(),bean.getProductId()};
				}else{
					query=getQuery("GET_COMMON_POLICY_PRODUCTION_REPORT_MARINE");
					String type="";
					if ("1".equals(bean.getReportType())) {
						type="PRODSUMMARY";
					}else if ("3".equals(bean.getReportType())) {
						type="PRODBRANCHES";
					}else if ("4".equals(bean.getReportType())) {
						type="USERWISE";
					}
					args=new Object[]{type,bean.getFromDate(),bean.getToDate(),bean.getBranchCode(),bean.getBrokerCode(),bean.getPolicyType(),bean.getSubBranchCode(),bean.getUserCode(),bean.getDateType(),bean.getProductId()};
				}
			}else{
			if ("2".equals(bean.getReportType())) {
				query=getQuery("GET_COMMON_POLICY_BOUDREAUX_REPORT");
				args=new Object[]{bean.getDateType(),bean.getFromDate(),bean.getToDate(),bean.getBranchCode(),bean.getSubBranchCode(),bean.getPolicyType(),bean.getBrokerCode(),bean.getUserCode(),bean.getProductId()};
			}else{
				query=getQuery("GET_COMMON_POLICY_PRODUCTION_REPORT");
				String type="";
				if ("1".equals(bean.getReportType())) {
					type="PRODSUMMARY";
				}else if ("3".equals(bean.getReportType())) {
					type="PRODBRANCHES";
				}else if ("4".equals(bean.getReportType())) {
					type="USERWISE";
				}
				args=new Object[]{type,bean.getFromDate(),bean.getToDate(),bean.getBranchCode(),bean.getBrokerCode(),bean.getPolicyType(),bean.getSubBranchCode(),bean.getUserCode(),bean.getDateType(),bean.getProductId()};
			}
			}
			logger.info("Query => "+query);
			logger.info("Arguments => "+StringUtils.join(args,","));
			result=this.mytemplate.queryForList(query,args);
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
}