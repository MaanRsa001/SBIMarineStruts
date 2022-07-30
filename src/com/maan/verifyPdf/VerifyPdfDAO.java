package com.maan.verifyPdf;

import java.util.List;
import java.util.Map;

import com.maan.common.MyJdbcTemplate;

public class VerifyPdfDAO extends MyJdbcTemplate{

	public List<Map<String, Object>> getQuoteList(VerifyPdfBean bean) {
		String query="";
		Map<String, Object> map = null;
		List<Map<String , Object>> result = null;
		try {
			query= getQuery("GET_QUOTATION_DETAIL_MARINE");
			result = this.mytemplate.queryForList(query, new Object[] {bean.getCode(),bean.getPolicyNo()});
			/*if(result.size()>0) {
			map = result.get(0);
			bean.setProductId((String)map.get("PRODUCT_ID"));
			if("3".equalsIgnoreCase(bean.getProductId()) || "11".equalsIgnoreCase(bean.getProductId())) {
				query= getQuery("GET_MARINE_PREMIA_VERIFY");
				result = this.mytemplate.queryForList(query, new Object[] {bean.getPolicyNo()});
				
			}else if("40".equalsIgnoreCase(bean.getProductId())) {
				query= getQuery("GET_YACHT_PREMIA_VERIFY");
				result = this.mytemplate.queryForList(query, new Object[] {bean.getPolicyNo()});
				
			}else if("42".equalsIgnoreCase(bean.getProductId())) {
				query= getQuery("GET_JETSKI_PREMIA_VERIFY");
				result = this.mytemplate.queryForList(query, new Object[] {bean.getPolicyNo()});
			}
			}*/
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
