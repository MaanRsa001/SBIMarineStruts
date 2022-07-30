package com.maan.adminnew.report.motor;

import java.util.List;
import java.util.Map;

public class MotorReportService {

	MotorReportDao dao= new MotorReportDao();

	public List<Map<String,Object>> getMotorReport(MotorReportBean bean) {
		return dao.getMotorReport(bean);
	}
		
	public List<Map<String,Object>> claimIntimateReportList(MotorReportBean bean) {
			return dao.claimIntimateReportList(bean);
	}
	
	public List<Map<String,Object>> claimIntimateReportTpaList(MotorReportBean bean) {
		return dao.claimIntimateReportTpaList(bean);
    }

	public List<Map<String,Object>> getDailyReport(MotorReportBean bean) {
		return dao.getDailyReport(bean);
	}
	
}
