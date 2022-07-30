package com.maan.webservice.dao;

import com.maan.common.LogUtil;
import com.maan.common.MarineJdbcTemplate;


import java.util.Map;

import org.apache.logging.log4j.Logger;
import org.springframework.dao.DataAccessException;
public class VatPremiumDAO extends MarineJdbcTemplate  {
	
	final static Logger logger = LogUtil.getLogger(VatPremiumDAO.class);
	public boolean getVatApplicableForGCC(String countryId)
    {
		 int count=0;
		try {
			String sql = getQuery("GET_VAT_YN");
			 count=this.mytemplate.queryForInt(sql, new String[] {countryId});
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
        return count>0;
    }
	
	public String getVatPercentage(String policyStartDt)
	{
		String result="";
		try {
			String sql = getQuery("GET_VAT_PERCENT");
			result=(String) this.mytemplate.queryForObject(sql,new Object[]{policyStartDt}, String.class);
		} catch (DataAccessException e) {
			result="0";
			
		}
		return result;
	}
	public void insertVatInfo(String option, Object[] args)
	{
		try
		{
			String sql = getQuery(option);
			this.mytemplate.update(sql, args);
		}
		catch(Exception e)
		{
			logger.debug("Exception @ {"+e+"}");
		}
		
	}
	public Map<String,Object> getResultMap(String option, String[] args)
	{
		Map<String,Object> map=null;
		try
		{
			String sql = getQuery(option);
			map=this.mytemplate.queryForMap(sql, args);
			logger.info("sql=>"+sql);
		}
		catch(Exception e)
		{
//			logger.debug("Exception @ {"+e+"}");
			e.printStackTrace();
		}
		return map;

	}
}


