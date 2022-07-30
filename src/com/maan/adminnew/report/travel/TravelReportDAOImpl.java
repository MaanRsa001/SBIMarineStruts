package com.maan.adminnew.report.travel;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.Logger;

import com.maan.adminnew.report.motor.MotorReportDao;
import com.maan.common.LogUtil;
import com.maan.common.MyJdbcTemplate;
import com.opensymphony.xwork2.ActionContext;

public class TravelReportDAOImpl extends MyJdbcTemplate implements TravelReportDAO {
	final Logger logger = LogUtil.getLogger(TravelReportDAOImpl.class);
	Map<String, Object> session = ActionContext.getContext().getSession();
	String branchCode = (String) session.get("BranchCode");
	String productId = (String) session.get("product_id");
	private String query="";
	private Object[] args = null;
	
	public List<Map<String,Object>> travelReport(TravelReportBean bean){
		logger.info("Enter into the travelReport()");
		List<Map<String,Object>> drpdwn=new ArrayList<Map<String,Object>>();
		try{
			query = getQuery("GET_TRAVEL_REPORT");
			Object args[]={bean.getFromDate(),bean.getToDate(),productId,branchCode};
			logger.info("Query==>"+query);
			logger.info("Arguments => "+StringUtils.join(args,","));
			drpdwn=this.mytemplate.queryForList(query,args);
		}
		catch(Exception e){
			e.printStackTrace();
			logger.debug("Exception Occured @ travelReport()"+e);
		}
		logger.info("Exit from the travelReport()");
		return drpdwn;
		
	}
}
