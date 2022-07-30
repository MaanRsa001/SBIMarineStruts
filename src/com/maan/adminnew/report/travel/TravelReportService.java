package com.maan.adminnew.report.travel;

import java.util.List;
import java.util.Map;

public class TravelReportService {

	TravelReportDAO dao = new TravelReportDAOImpl();
	
	public List<Map<String,Object>> travelReport(TravelReportBean bean){
		return dao.travelReport(bean);
	}
	
}
