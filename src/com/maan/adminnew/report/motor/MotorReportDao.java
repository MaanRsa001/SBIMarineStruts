package com.maan.adminnew.report.motor;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.Logger;

import com.maan.common.LogUtil;
import com.maan.common.MyJdbcTemplate;
import com.opensymphony.xwork2.ActionContext;

public class MotorReportDao extends MyJdbcTemplate {
	final Logger logger = LogUtil.getLogger(MotorReportDao.class);
	Map<String, Object> session = ActionContext.getContext().getSession();
	String branchCode = (String) session.get("BranchCode");
	private String query="";
	private Object[] args = null;
	
public List<Map<String,Object>> getMotorReport(MotorReportBean bean){
	logger.info("Enter into the getMotorReport()");
	List<Map<String,Object>> drpdwn=new ArrayList<Map<String,Object>>();
	try{
		if("list".equalsIgnoreCase(bean.getMode())){
		args = new Object[2];
		args[0]=bean.getFromDate();
		args[1]=bean.getToDate();
		query = getQuery("GET_MOTOR_REPORT");
		}
		else if("showlist".equalsIgnoreCase(bean.getMode())){
			args = new Object[4];
			args[0]=bean.getFromDate();
			args[1]=bean.getToDate();
			args[2]=bean.getPolicyType();
			args[3]=branchCode;
			query = getQuery("GET_MOTOR_REPORT_DETAIL");	
		}
		logger.info("Query==>"+query);
		logger.info("Arguments => "+StringUtils.join(args,","));
		drpdwn=this.mytemplate.queryForList(query,args);
	}catch(Exception e){
		logger.debug("Exception Occured @ getMotorReport()"+e);
		e.printStackTrace();
	}
	logger.info("Exit from getMotorReport()");
	return drpdwn;
}

public List<Map<String, Object>> claimIntimateReportList(MotorReportBean bean){
	logger.info("Enter into claimIntimateReportList()");
	List<Map<String, Object>> result = null;
	try{
		String query = getQuery("GET_CLAIM_INTIMATE_REPORT_LIST");
		logger.info("query =>" +query);
		Object[] args = new Object [2];
		args[0] = bean.getFromDate();
		args[1] = bean.getToDate();
		removeNull(args);
		logger.info("Argument =>"+StringUtils.join(args,","));
		result = this.mytemplate.queryForList(query,args);
		logger.info("Exit From claimIntimateReportList()");
		}catch(Exception e){
			logger.error("Exception Occured @ claimIntimateReportList()" +e);
			e.printStackTrace();
		}
		return result;
}

public List<Map<String, Object>> claimIntimateReportTpaList(MotorReportBean bean){
	logger.info("Enter into claimIntimateReportTpaList()");
	List<Map<String, Object>> result = null;
	try{
		String query = getQuery("GET_CLAIM_INTIMATE_TPA_REPORT_LIST");
		logger.info("query =>" +query);
		Object[] args = new Object [2];
		args[0] = bean.getFromDate();
		args[1] = bean.getToDate();
		removeNull(args);
		logger.info("Argument =>"+StringUtils.join(args,","));
		result = this.mytemplate.queryForList(query,args);
		logger.info("Exit From claimIntimateReportTpaList()");
		}catch(Exception e){
			logger.error("Exception Occured @ claimIntimateReportTpaList()" +e);
			e.printStackTrace();
		}
		return result;
}

public List<Map<String, Object>> getDailyReport(MotorReportBean bean) {
	logger.info("Enter into the getDailyReport()");
	List<Map<String,Object>> dailyList=new ArrayList<Map<String,Object>>();
	try{
		query = getQuery("GET_DAILY_REPORT_DETAIL");
		args = new Object[10];
		args[0]=bean.getFromDate();
		args[1]=bean.getToDate();
		args[2]=bean.getFromDate();
		args[3]=bean.getToDate();
		args[4]=bean.getFromDate();
		args[5]=bean.getToDate();
		args[6]=bean.getFromDate();
		args[7]=bean.getToDate();
		args[8]=bean.getFromDate();
		args[9]=bean.getToDate();
		dailyList = this.mytemplate.queryForList(query,args);
	}catch(Exception e){
		e.printStackTrace();
	}
	return dailyList;
}

}
