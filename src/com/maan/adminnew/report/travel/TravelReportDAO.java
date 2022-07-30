package com.maan.adminnew.report.travel;

import java.util.List;
import java.util.Map;

public interface TravelReportDAO {
	
	public List<Map<String,Object>> travelReport(TravelReportBean bean);
}
