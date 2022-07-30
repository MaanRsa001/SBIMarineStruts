package com.maan.quotation.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.ResourceBundle;

import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.Logger;
import org.springframework.jdbc.core.RowMapper;

import com.maan.common.DBConstants;
import com.maan.common.LogUtil;
import com.maan.common.MarineJdbcTemplate;
import com.maan.common.MyJdbcTemplate;
import com.maan.common.Token;
import com.maan.common.runner;
import com.maan.quotation.QuotationAction;
import com.maan.quotation.api.QuotationApiCall;
import com.maan.quotation.model.BrokerInfoReq;
import com.maan.quotation.model.BrokerInfoResp;
import com.maan.quotation.model.BrokerInfoResponse;
import com.maan.quotation.model.CommonInfo;
import com.maan.quotation.model.CustomerInfoResponse;
import com.maan.quotation.model.customerInfoResp;

public class QuotationDAO extends MarineJdbcTemplate{
	QuotationApiCall quoteApi=new QuotationApiCall();
	final static Logger logger = LogUtil.getLogger(QuotationDAO.class);
	private String sql;
	public List<Object> getOptionsList(String option, Object[] objects)
	{
		
		logger.info("getOptionsList - Enter || option: "+option);
		List<Object> list=new ArrayList<Object>();
		try {
			//if(!("branch".equalsIgnoreCase(option)||"broker".equalsIgnoreCase(option))){
			if(!("branch".equalsIgnoreCase(option))){
				if("commodity_oc".equalsIgnoreCase(option)) {
					sql=getQuery(DBConstants.COMMODITY_OC);
				}else if("commodity".equalsIgnoreCase(option)) {
					sql=getQuery(DBConstants.COMMODITY);
				}
				else {
					sql=getQuery(DBConstants.OPTION);
					objects[0]=option;
				}
				logger.info("sql==>"+sql);
				for (int i = 0; i < objects.length; i++) {
					if(objects[i]==null){
						objects[i]="";
					}
				}
				logger.info("args[] ==> "+StringUtils.join(objects, ","));
				list = this.mytemplate.queryForList(sql, objects);

			}else if("branch".equalsIgnoreCase(option)){
				sql=getQuery("issuer.branch");
				list = this.mytemplate.queryForList(sql, objects);
			}else if("broker".equalsIgnoreCase(option)){
				sql=getQuery("issuer.broker");
				list = this.mytemplate.queryForList(sql, objects);
			}
		}catch(Exception e) {
			logger.debug("Exception @ "+e);
		}
		
		logger.info("getOptionsList - Exit || Result: "+list.size());
		return list;	
	}
	public Map<String, Object> getBranchInfo(String branchCode)
	{
		logger.info("getBranchInfo - Enter || branchCode: "+branchCode);
		Map<String, Object> list=new HashMap<String, Object>();
		try
		{
			sql=getQuery(DBConstants.BRANCH_INFO);
			list = this.mytemplate.queryForMap(sql, new String[]{branchCode});
		}catch(Exception e)
		{
			logger.debug("Exception @ "+e);
		}
		
		logger.info("getBranchInfo - Exit || Result: "+list.size());
		return list;	
	}
	public String addCommodity(String applicationNo, String refNo, List<Object> commList)
	{
		logger.info("addCommodity - Enter || applicationNo: "+applicationNo);
		Map<String, String> commInfo=null;
		try
		{
			if(commList!=null && commList.size()>0)
			{
				sql=getQuery(DBConstants.COMMODITY_DELETE);
				this.mytemplate.update(sql, new String[]{applicationNo});
				sql=getQuery(DBConstants.COMMODITY_ADD);
				for (int i = 0; i < commList.size(); i++) {
					commInfo=(Map<String, String>)commList.get(i);
					this.mytemplate.update(sql, new String[]{commInfo.get("COMMODITY_ID"),
							commInfo.get("COMMODITY_NAME"),commInfo.get("SUM_INSURED"),
							commInfo.get("SUPPLIER_NAME"),commInfo.get("PACKAGE_DESC"),
							commInfo.get("INVOICE_NUMBER"),commInfo.get("INVOICE_DATE"),
							commInfo.get("FRAGILE"),refNo,applicationNo,commInfo.get("EXCESS_DESCRIPTION"),commInfo.get("PO_NUMBER")});
				}
			}
		}catch(Exception e)
		{
			logger.debug("Exception @ "+e);
		}
		
		logger.info("addCommodity - Exit");
		return "";	
	}
	public String updateCommodity(String applicationNo, List<Object> commList)
	{
		logger.info("addCommodity - Enter || applicationNo: "+applicationNo);
		Map<String, String> commInfo=null;
		try
		{
			if(commList!=null && commList.size()>0)
			{
				sql=getQuery(DBConstants.COMMODITY_UPDATE);
				for (int i = 0; i < commList.size(); i++) {
					commInfo=(Map<String, String>)commList.get(i);
					this.mytemplate.update(sql, new String[]{commInfo.get("SUPPLIER_NAME"),commInfo.get("PACKAGE_DESC"),
							commInfo.get("INVOICE_NUMBER"),commInfo.get("INVOICE_DATE"),commInfo.get("EXCESS_DESCRIPTION"),applicationNo,commInfo.get("COMMODITY_ID")});
				}
			}
		}catch(Exception e)
		{
			logger.debug("Exception @ "+e);
		}
		
		logger.info("addCommodity - Exit");
		return "";	
	}
	public String insertOrUpdateQuote(String applicationNo, Object[] args, String quoteType)
	{
		logger.info("insertOrUpdateQuote - Enter || applicationNo: "+applicationNo+"quoteType: "+quoteType+" args: "+StringUtils.join(args, ","));
		try
		{
			if("F".equalsIgnoreCase(quoteType)){
				sql=getQuery(DBConstants.QUOTE_ADD);
			}else{
				sql=getQuery(DBConstants.QUOTE_UPDATE);
			}
			logger.info("sql==>"+sql);
			logger.info("args: "+StringUtils.join(args, ","));
			for (int i = 0; i < args.length; i++) {
				if(args[i]==null){
					args[i]="";
				}
			}
			this.mytemplate.update(sql, args);
		}catch(Exception e)
		{
			logger.debug("Exception @ "+e);
		}
		
		logger.info("insertOrUpdateQuote - Exit");
		return "";	
	}
	@SuppressWarnings("unchecked")
	public List<String> getQuoteInfo(final QuotationAction qa)
	{
		logger.info("getQuoteInfo - Enter || applicationNo: "+qa.getApplicationNo()+" quoteNo: "+qa.getQuoteNo());
		List<String> list=null;
		try
		{
			sql=getQuery(DBConstants.QUOTE_EDIT);
			list = (List<String>) this.mytemplate.query(sql, new Object[]{StringUtils.defaultIfEmpty(qa.getApplicationNo(), null),StringUtils.defaultIfEmpty(qa.getQuoteNo(), "")},new RowMapper() {
				public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
					qa.setCustomerName(rs.getString("CUSTOMER_NAME"));
					qa.setCity(rs.getString("EMIRATE"));
					qa.setMobileNo(rs.getString("MOBILE_NUMBER"));
					qa.setModeOfTransport(rs.getString("MODE_OF_TRANSPORT"));
					qa.setOriginCountry(rs.getString("ORIGINATING_COUNTRY"));
					qa.setDestCountry(rs.getString("DESTINATION_COUNTRY"));
					qa.setOriginCity(rs.getString("ORIGINATING_COUNTRY_CITY"));
					qa.setDestCity(rs.getString("DESTINATION_COUNTRY_CITY"));
					qa.setOriginCityName(rs.getString("ORIGIN_CITY_NAME"));
					qa.setDestCityName(rs.getString("DEST_CITY_NAME"));
					qa.setOriginWarehouse(rs.getString("ORIGINATING_WAREHOUSE_COVERAGE"));
					qa.setDestWarehouse(rs.getString("DESTINATION_WAREHOUSE_COVERAGE"));
					qa.setSaleTerm(rs.getString("SALETERM_VALUE"));
					qa.setCurrency(rs.getString("CURRENCY"));
					qa.setSettlingAgent(rs.getString("SETTLING_AGENT"));
					qa.setAgentOthers(rs.getString("SETTLING_AGENT_NAME"));
					qa.setPolicyStartDate(rs.getString("POLICY_START_DATE") == null?"":dateFormat(rs.getString("POLICY_START_DATE")));
					qa.setSailingDate(rs.getString("SAILING_DATE") == null?"":dateFormat(rs.getString("SAILING_DATE")));
					qa.setVesselName(rs.getString("VESSEL_NAME"));
					qa.setLcNo(rs.getString("LC_NUMBER"));
					qa.setLcBank(rs.getString("ISSUING_BANK"));
					qa.setLcDate(rs.getString("LC_DATE") == null?"":dateFormat(rs.getString("LC_DATE")));
					qa.setPartialShipment(rs.getString("PARTIAL_SHIPMENT"));
					qa.setBlNo(rs.getString("BL_AWB_NUMBER"));
					qa.setBlDate(rs.getString("BL_AWB_DATE") == null?"":dateFormat(rs.getString("BL_AWB_DATE")));
					qa.setCover(rs.getString("COVERAGES"));
					qa.setConveyance(rs.getString("SEA_COVERAGES"));
					qa.setWarSrcc(rs.getString("WSRCC"));
					qa.setTolerance(rs.getString("TOLERANCE"));
					qa.setPackageCode(rs.getString("PACKAGE_TYPE"));
					qa.setSaleTermPercent(rs.getString("SALETERM_PERCENT"));
					qa.setRefNo(rs.getString("REFERENCE_NUMBER"));
					qa.setTitle(rs.getString("CUST_TITLE"));
					qa.setCoreAppCode(rs.getString("CUST_CORE_APP_CODE"));
					qa.setAddress1(rs.getString("ADDRESS1"));
					qa.setAddress2(rs.getString("ADDRESS2"));
					qa.setEmail(rs.getString("EMAIL"));
					qa.setPoBox(rs.getString("PO_BOX"));
					qa.setBranchCode(rs.getString("BRANCH_CODE"));
					qa.setBrokerCode(rs.getString("BROKER_CODE"));
					//qa.setProductId(rs.getString("PRODUCT_ID"));
					qa.setApplicationNo(rs.getString("APPLICATION_NO"));
					qa.setQuoteNo(rs.getString("QUOTE_NO"));
					qa.setOpenCoverNo(rs.getString("OPENCOVER_POLICY_NUMBER"));
					qa.setExecutive(rs.getString("AC_EXECUTIVE_ID"));
					qa.setCustomerId(rs.getString("CUSTOMER_ID"));
					qa.setExposureCurrency(rs.getString("EXPOSURE_CURRENCY"));
					qa.setShipmentExposure(rs.getString("SHIPMENT_EXPOSURE"));
					qa.setCustContractNo(rs.getString("CUST_CONTRACT_NO"));
					qa.setCustFmsCaseNo(rs.getString("CUST_FMS_CASE_NO"));
					qa.setCustRefNo(rs.getString("CUST_REFERENCE_NO"));
					qa.setCustArNo(rs.getString("CUST_AR_NO"));
					qa.setVesselId(rs.getString("VESSEL_ID"));
					qa.setPromotionalCode(rs.getString("PROMOTIONAL_CODE"));
					qa.setConsigneeDetail(rs.getString("CONSIGNEE_DET"));
					qa.setSpecialTerm(rs.getString("SPECIAL_TERM"));
					qa.setAddCustomerName(rs.getString("ADD_CUST_NAME"));
					qa.setCoreCustomerName(rs.getString("core_customer_name"));
					qa.setNameAndCode(rs.getString("core_customer_name")+"("+rs.getString("CUST_CORE_APP_CODE")+")");
					qa.setChannelType(rs.getString("CHANNEL_TYPE"));
					qa.setExchageValue(rs.getString("EXCHANGE_RATE"));
					qa.setVia(rs.getString("VIA"));
					qa.setCustVatRegNo(rs.getString("VAT_REG_NO"));
					qa.setCustomerNameAr(rs.getString("CUSTOMER_NAME_AR"));
					//qa.setLcAmount(rs.getString("LC_AMT"));
					/*qa.setLcexchageValue(rs.getString("LC_EXCHANGEVALUE"));
					qa.setLcCurrency(rs.getString("LC_CURRECNYID"));*/
					return null;
				}
			});
			sql=getQuery(DBConstants.COMMODITY_TOTAL);
			list=this.mytemplate.query(sql, new Object[]{qa.getRefNo()}, new RowMapper() {
				public Object mapRow(ResultSet rs, int rowNum) throws SQLException {				
					qa.setTotalCommodity(rs.getString("TOTAL_COMMODITY"));
					qa.setTotalSI(rs.getString("SUM_INSURED"));
					qa.setCommodity(rs.getString("COMMODITY_DESCRIPTION"));
					return null;
				}
			});
			//For Edit Clause and FinalizeYN
			/*Map<String,Object> checkYN = new PolicyGenerationDAO().getResultMap("QUOTE_FINALIZE_YN", new String[]{qa.getRefNo()});
			if(checkYN!=null){
	        	qa.setFinalizeYN(checkYN.get("FINALIZE_YN")==null?"N":checkYN.get("FINALIZE_YN").toString());
	        	//qa.setEditClausesYN(checkYN.get("EDIT_CLAUSES_YN")==null?"N":checkYN.get("EDIT_CLAUSES_YN").toString());
	        }*/
			if("RU".equalsIgnoreCase(qa.getQuoteStatus())){
		        qa.setFinalizeYN("N");
		        //qa.setEditClausesYN("N");
		    }
		}catch(Exception e)
		{
			logger.debug("Exception @ "+e);e.printStackTrace();
		}
		
		logger.info("getQuoteInfo - Exit || Result: "+list.size());
		return list;	
	}
	public List<Object> getCustomerSelectionList(String loginId,String searchValue,String openCoverNo, String searchType)
	{
		logger.info("getCustomerSelectionList - Enter || "+loginId+","+searchValue);
		List<Object> customerList=null;		
		searchValue=searchValue==null?"":searchValue;
		try{
			if("".equalsIgnoreCase(searchValue)){
				if(StringUtils.isNotEmpty(openCoverNo) && !"0".equals(openCoverNo)){
					sql=getQuery(DBConstants.OPENCOVER_CUSTOMER_LIST);
					customerList=this.mytemplate.queryForList(sql,new String[]{openCoverNo});
				}else{
					if("BROKER".equals(searchType)){
						sql=getQuery("EXIST_BROKER_SELECTION",new Object[]{""});
						customerList=this.mytemplate.queryForList(sql);
					}else{
						sql=getQuery(DBConstants.CUSTOMER_SELECTION);
						customerList=this.mytemplate.queryForList(sql,new String[]{loginId});
					}
				}
			}
			else
			{
				if(StringUtils.isNotEmpty(openCoverNo) && !"0".equals(openCoverNo)){
					sql=getQuery(DBConstants.OPENCOVER_CUSTOMER_BYNAME);
					customerList=this.mytemplate.queryForList(sql,new String[]{openCoverNo,"%"+searchValue+"%"});
				}else{			
					if("BROKER".equals(searchType)){
						sql=getQuery("EXIST_BROKER_SELECTION",new Object[]{" AND EMCODE LIKE %'"+searchValue+"'%"});
						customerList=this.mytemplate.queryForList(sql);
					}else{
						sql=getQuery(DBConstants.CUSTOMER_SELECTION_BYNAME);
						customerList=this.mytemplate.queryForList(sql,new String[]{"%"+searchValue+"%"});
					}	
				}
			}					
		}
		catch (Exception e) {			
			logger.debug("EXCEPTION @ { " + e + " }");
		}		
		logger.info("Query==>" + sql);
		logger.info("args: "+loginId+","+searchValue);
		logger.info("getCustomerSelectionList() - Exit size"+ customerList.size() );
				
		return customerList;
	}
	public List<Object> getCoreCustomerSearch(String searchValue, String searchType) {
		List<Object> customerList=null;
		try {
			String custClass = "";
			if("CUSTOMER".equals(searchType) || "OC_CUSTOMER".equals(searchType)) {
				//custClass = LocalizedTextUtil.findDefaultText("GET_CUSTOMER_CUST_CLASS",Locale.ENGLISH);;
				custClass = ResourceBundle.getBundle("CoreQuery").getString("GET_CUSTOMER_CUST_CLASS");
				customerList = this.mytemplate.queryForList(sql);
			} else if("BROKER".equals(searchType)) {
				//custClass = LocalizedTextUtil.findDefaultText("GET_BROKER_CUST_CLASS",Locale.ENGLISH);;
				sql=getQuery("EXIST_BROKER_SELECTION",new Object[]{" AND EMPDES like('%?%') "});
				customerList = this.mytemplate.queryForList(sql,new Object[] {searchValue});
			}else{
				//sql = LocalizedTextUtil.findDefaultText("GET_CORE_CUSTOMER_LIST",Locale.ENGLISH, new String[]{custClass}) + " AND UPPER(CUST_NAME) LIKE '%"+ searchValue.toUpperCase() +"%'";
				custClass = ResourceBundle.getBundle("CoreQuery").getString("GET_BROKER_CUST_CLASS");
				customerList = this.mytemplate.queryForList(sql);
			}
			logger.info("Query==> " + sql);
			
		}
		catch(Exception e) {
			logger.debug("EXCEPTION @ { " + e + " }");
		}
				
		return customerList;
	}
	public String getSingleInfo(String option, String[] args)
	{
		logger.info("getSingleInfo - Enter || "+option+" args: "+ StringUtils.join(args, ","));
		String result="";					
		try{
			sql=getQuery(option);
			result=(String)this.mytemplate.queryForObject(sql,args, String.class);			
		}
		catch (Exception e) {			
			logger.debug("EXCEPTION @ { " + e + " }");
		}		
		logger.info("Query==>" + sql);
		logger.info("getSingleInfo() - Exit || Result: "+result );
				
		return result;
	}
	public List<Object> getVesselListNew(String alpha)
	{
		logger.info("getVesselList - Enter || "+alpha);
		List<Object> vesselList=null;					
		logger.info("Method to get Vessel List");
		try{
			sql=getQuery(DBConstants.VESSEL_SELECTIION);
			vesselList=this.mytemplate.queryForList(sql,new String[]{"%"+alpha+"%"});			
		}
		catch (Exception e) {			
			logger.debug("EXCEPTION @ { " + e + " }");
		}		
		logger.info("Query==>" + sql);
		logger.info("getVesselList() - Exit: size"+ vesselList.size());
				
		return vesselList;
	}
	public String checkExist(String dataValue,String datatype,String applicationNo,String ocNO)
	{
		String result=null;
		logger.info("checkLCNOExist");
		try{
			if("LCNO".equals(datatype))
			{
				sql=getQuery(DBConstants.LCNO_EXIST);
				result=(String)this.mytemplate.queryForObject(sql,new String[]{dataValue,applicationNo},String.class);
			}else if("LCNOOC".equals(datatype)){
				sql=getQuery(DBConstants.LCNO_EXIST)+" and OPENCOVER_POLICY_NUMBER=?";
				result=(String)this.mytemplate.queryForObject(sql,new String[]{dataValue,applicationNo,ocNO},String.class);
			}
			else {
				sql=getQuery(DBConstants.INVOICE_EXIST);
				result=(String)this.mytemplate.queryForObject(sql,new String[]{dataValue,applicationNo},String.class);
			}
			//result=(String)this.mytemplate.queryForObject(sql,new String[]{dataValue,applicationNo},String.class);			
		}
		catch (Exception e) {			
			logger.debug("EXCEPTION @ { " + e + " }");
		}		
		logger.info("Query==>" + sql);
		logger.info("Result - Exit:"+ result);
				
		return result;
	}
	public String getBrokerLoginId(String brokerCode)
	{
		String result=null;
		logger.info("getBrokerLoginId");
		try{	
			sql=getQuery(DBConstants.BROKER_LOGINID);	
			result=(String)this.mytemplate.queryForObject(sql,new String[]{brokerCode},String.class);			
		}
		catch (Exception e) {			
			logger.debug("EXCEPTION @ { " + e + " }");
		}		
		logger.info("Query==>" + sql+"args :"+brokerCode);
		logger.info("Result - Exit:"+ result);
				
		return result;
	}
	public String[][] getVesselList(String vesselName)
	{
		String result[][] = new String[0][0];
		String sql = "";
		String args[] = new String[0];
		try{
			sql = "SELECT VESSEL_ID,VESSEL_NAME,VESSEL_TYPE,VESSEL_CLASS,MANUFACTURE_YEAR FROM VESSEL_MASTER WHERE STATUS IN ('Y','R') AND UPPER(VESSEL_NAME) LIKE UPPER(?) ORDER BY VESSEL_NAME";
			result = runner.multipleSelection(sql,new String[]{"%"+vesselName+"%"});
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	/*public String getPolicyEndtType(String applicationNo)
	{
		logger.info("getPolicyEndtType - Enter || applicationNo: "+applicationNo);
		String endtType="";
		try{
			endtType=(String)this.mytemplate.queryForObject(getQuery("GET_POL_ENDT"),new String[]{applicationNo},String.class);
			if(StringUtils.isNotEmpty(endtType)){
				endtType=(String)this.mytemplate.queryForObject(getQuery("GET_QUOTE_ENDT_TYPE").replace("?",endtType),String.class);
			}
		}catch(Exception e){
			logger.debug(e);
		}
		logger.info("getPolicyEndtType - Exit || Result: " );
		return endtType;
	}*/
	/*public String getDirectStatus(String applicationNo,String branchCode)
	{
		logger.info("getDirectStatus - Enter || applicationNo: "+applicationNo+" branchCode: "+branchCode);
		String result="";
		try{
			sql=getQuery(DBConstants.DIRECT_STATUS);
			result=(String)this.mytemplate.queryForObject(sql,new String[]{branchCode,applicationNo},String.class);
		}
		catch (Exception e) {			
			logger.debug("EXCEPTION @ { " + e + " }");
		}	
		logger.info("getDirectStatus - Exit:"+ result);
		return result;
	}*/
	public String getbranchWiseCountry(String branchCode)
	{
		logger.info("getbranchWiseCountry - Enter: branchCode: "+branchCode);
		String result="";
		try{
			sql=getQuery(DBConstants.BRANCH_WISE_COUNTRY);
			result=(String)this.mytemplate.queryForObject(sql,new String[]{branchCode},String.class);
		}
		catch (Exception e) {			
			logger.debug("EXCEPTION @ { " + e + " }");
		}	
		logger.info("getbranchWiseCountry - Exit:"+ result);
		return result;
	}
	public boolean getDubaiTradeStatus(String brokerCode,String branchCode)
	{
		logger.info("getDubaiTradeStatus - Enter: branchCode: "+branchCode);
		boolean dubaiTradeStaus=false;
		try{
			sql=getQuery("GET_DUBAITRADE_STATUS");
			String result=(String)this.mytemplate.queryForObject(sql,new String[]{brokerCode, branchCode}, String.class);
			if(result!=null && "Y".equals(result))
				dubaiTradeStaus=true;
		}
		catch (Exception e) {			
			//logger.debug("EXCEPTION @ { " + e + " }");
		}	
		logger.info("getDubaiTradeStatus - Exit:"+ dubaiTradeStaus);
		return dubaiTradeStaus;
	}

	public List<Object> lcSelectionList(String ocNo, String searchValue, String exact) {
		logger.info("lcSelection - Enter || ocNo==>"+ocNo+"		searchValue==>"+searchValue);
		List<Object> lcSelectionList=null;
		try{
			sql="SELECT OCLM.BANK_ID,OPBM.BANK_NAME, OCLM.LC_ID, OCLM.LC_NUMBER, to_CHAR(OCLM.LC_DATE,'DD/MM/YYYY') LC_DATE, OCLM.LC_AMOUNT, OCLM.LC_CURRENCY_ID, nvl(OCLM.LC_BALANCE_AMOUNT,0) LC_BALANCE_AMOUNT  FROM OPEN_COVER_LC_MASTER OCLM, OPEN_COVER_BANK_MASTER OPBM WHERE OPBM.BANK_ID=OCLM.BANK_ID  and OCLM.OPEN_COVER_NO = ? and OPBM.AMEND_ID=(select max(opbmm.AMEND_ID) from OPEN_COVER_BANK_MASTER opbmm where opbmm.BANK_ID=opbm.BANK_ID and opbmm.status='Y')";
			if("Y".equals(exact) && StringUtils.isNotBlank(searchValue)) {
				sql=sql+" and upper(OCLM.LC_NUMBER)=upper(?) order by OCLM.LC_DATE desc";
				logger.info("Query==>" + sql);
			lcSelectionList=this.mytemplate.queryForList(sql,new String[]{ocNo,searchValue});
			}else if(StringUtils.isNotBlank(searchValue)) {
				sql=sql+" and upper(OCLM.LC_NUMBER) like upper('%?%') order by OCLM.LC_DATE desc";
				logger.info("Query==>" + sql);
			lcSelectionList=this.mytemplate.queryForList(sql,new String[]{ocNo,searchValue});
			}else {
				lcSelectionList=this.mytemplate.queryForList(sql,new String[]{ocNo});
			}
			
			
		}
		catch (Exception e) {			
			logger.debug("EXCEPTION @ { " + e + " }");
		}
		return lcSelectionList;
	}

	public int lcNoExist(String lcNo, String ocNo) {
		logger.info("lcNoExist - Enter || lcNo==>"+lcNo);
		int lcCount=1;
		try{
			sql="select count(OPEN_COVER_NO) from OPEN_COVER_LC_MASTER OCLM where OCLM.lc_number=? and OCLM.OPEN_COVER_NO!=?";
			logger.info("Query==>" + sql);
			lcCount=this.mytemplate.queryForInt(sql,new String[]{lcNo, ocNo});
		}catch (Exception e) {
			logger.debug("EXCEPTION @ { " + e + " }");
		}
		return lcCount;
	}
	/*public List<Object>getLCOCDetail(String branchCode, final LCMasterBean bean, String from){
		List <Object> ocDetail=null;
		try{
			Object obj[];
			sql=getQuery("GET_LCOC_DETAILS_LIST");
			if("add".equals(from)){
				sql+=" and LC_number=? and LC_ID=?";
				obj=new Object[]{branchCode,branchCode,branchCode, bean.getOpenCover(), bean.getLcNum(), bean.getLcId()};
			}else 
				obj=new Object[]{branchCode,branchCode,branchCode, bean.getOpenCover()};
			logger.info("Query===>" + sql);
			for(Object a:obj)
				logger.info("args===>" + a);
			ocDetail=this.mytemplate.queryForList(sql,obj);
		}catch (Exception e) {			
			logger.debug("EXCEPTION @ { " + e + " }");
		}
		return ocDetail;
	}*/
	public int checkValidPromotionalCode(String promotionalCode, String branchCode) {
		logger.info("checkValidPromotionalCode - Enter || promotionalCode==>"+promotionalCode+"		branchCode==>"+branchCode);
		int validCount=0;
		try{
			sql=getQuery("CHECK_VALID_PROMOTIONAL_CODE");
			logger.info("Query==>" + sql);
			validCount=this.mytemplate.queryForInt(sql,new String[]{promotionalCode, branchCode});
		}catch (Exception e) {
			logger.debug("EXCEPTION @ { " + e + " }");
		}
		return validCount;
	}

	public void updateWSMarineQuote(String[] args) {
		logger.info("updateWSMarineQuote - Enter");
		try{
			sql=getQuery("UPD_WS_MARINE_QUOTE");
			logger.info("Query==>" + sql);
			logger.info("Args==>"+StringUtils.join(args, ",  "));
			this.mytemplate.update(sql, args);
		}catch (Exception e) {
			e.printStackTrace();
			logger.debug("updateWSMarineQuote - EXCEPTION @ { " + e + " }");
		}
	}
	public List<Map<String, Object>> searchList(String applicationNo,String branchCode){
		List<Map<String, Object>> searchList=null;		
		String query=getQuery("SER_COMM_SHOW");
		logger.info("query "+query+">>>>"+applicationNo+" branchCode==> "+branchCode);
		try{
			searchList=this.mytemplate.queryForList(query,new String[]{branchCode,applicationNo});
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return searchList;
	}
	public String addCommodity(String applicationNo, String refNo, List<Object> commList, String branchCode) {
		logger.info("addCommodity - Enter || applicationNo: "+applicationNo);
		Map<String, String> commInfo=null;
		try
		{
			if(commList!=null && commList.size()>0)
			{
				String sql1=getQuery(DBConstants.COMMODITY_DELETE);
				sql=getQuery(DBConstants.COMMODITY_ADD);
				for (int i = 0; i < commList.size(); i++) {
					commInfo=(Map<String, String>)commList.get(i);
					this.mytemplate.update(sql1, new String[]{applicationNo,commInfo.get("COMMODITY_ID")});
					Object[]  args = new Object[]{
							commInfo.get("COMMODITY_ID"),
							commInfo.get("COMMODITY_NAME"), 
							commInfo.get("SUM_INSURED"),
							commInfo.get("SUPPLIER_NAME"),
							commInfo.get("PACKAGE_DESC"),
							commInfo.get("INVOICE_NUMBER"),
							commInfo.get("INVOICE_DATE"),
							commInfo.get("FRAGILE"),refNo,applicationNo,commInfo.get("EXCESS_DESCRIPTION"),commInfo.get("PO_NUMBER")};
					logger.info("Args==> " + StringUtils.join(args,","));
					this.mytemplate.update(sql, args);
				}
			}
		}catch(Exception e)
		{
			e.printStackTrace();
			logger.debug("Exception @ "+e);
		}
		
		logger.info("addCommodity - Exit");
		return "";	
	}
	public String deleteCommodity(String applicationNo,String  commodityCode)
	{
		logger.info("deleteCommodity - Enter || applicationNo: "+applicationNo +commodityCode);
		try
		{
			sql=getQuery(DBConstants.COMMODITY_DELETE);
			this.mytemplate.update(sql, new String[]{applicationNo,commodityCode});
		}catch(Exception e)
		{
			logger.debug("Exception @ "+e);
		}
		
		logger.info("deleteCommodity - Exit");
		return "";	
	}
	public int getCommodityExist(String commodityId, String applicationno){
		logger.info("getapplicationno - Enter: commodityId: "+commodityId);
		logger.info("getapplicationno - Enter: applicationno: "+applicationno);
		logger.info("Enter into getCommodityExist()");
	 	int count=0;
	 	try{
	 		sql=getQuery("COMMODITY_EXIST");
	 		logger.info("query =>"+sql);
	        count=this.mytemplate.queryForInt(sql,new String[]{commodityId,applicationno});
	 		}
	        catch(Exception e){
	     		logger.info("Exception in getUserInfo()"+e);
	     	}
	     	logger.info("Exit from getCommodityExist()");
	     	return count;
		}
	public String getFragile(String category,String appNo) {
		logger.info("getFragile() Enter ");
		String fragile="";
		try{
			sql="SELECT   Commodity_Name_Desc, Fragile FROM   Open_Cover_Commodity_Master Occm,Open_Cover_Position_Master Ocpm WHERE Occm.Proposal_No = Ocpm.Proposal_No AND Occm.Amend_Id = (SELECT   MAX (Amend_Id) FROM   Open_Cover_Commodity_Master Oc WHERE   Oc.Proposal_No = Occm.Proposal_No)  AND Ocpm.Status = 'P' AND Ocpm.Open_cover_No=? AND occm.commodity_id =?";
			Object args[]={appNo,category};
			logger.info("Query >>"+sql);
			logger.info("args>>>>"+StringUtils.join(args,","));
			Map result = this.mytemplate.queryForMap(sql,args);
			fragile=result.get("FRAGILE").toString();
		}catch (Exception e) {
			e.printStackTrace();
			logger.info("getFragile() Exception "+e);	
		}
		logger.info("getFragile() Exit ");
		return fragile;
	}
	public double getSaleTermValue(String saleTermPercent, String branchCode) {
		double result = 0;
		try {
			String query = getQuery("GET_SALETERM_VAL");
			String res = (String) this.mytemplate.queryForObject(query, new Object[]{saleTermPercent,branchCode},String.class);
			result = StringUtils.isBlank(res)?0:Double.valueOf(res);
		}
		catch(Exception exception) {
			logger.debug("getSaleTermValue()==> " + exception);
		}
		return result;
	}
	public double getToleranceValue(String tolerance, String branchCode) {
		double result = 0;
		try {
			String query = getQuery("GET_TOLERANCE_PERCENT");
			String res = (String) this.mytemplate.queryForObject(query, new Object[]{tolerance,branchCode},String.class);
			result = StringUtils.isBlank(res)?0:Double.valueOf(res);
		}
		catch(Exception exception) {
			logger.debug("getToleranceValue()==> " + exception);
		}
		return result;
	}
	public void setOpenCustomerInfo(QuotationAction bean, String openCoverNo) {
		try {
			//String query = getQuery("GET_OPENCUSTOMER_INFO");
			//Map<String, Object> resultMap = this.mytemplate.queryForMap(query, new Object[]{openCoverNo});
			//Map<String,Object> resultMap=(Map<String, Object>) list.get(0);
			CustomerInfoResponse custInfo=quoteApi.getOpenCustomerInfo(openCoverNo);
			//if(Token.save(custInfo.getDefaultValue())) {
			List<customerInfoResp> list =custInfo.getCustomerInformation();
			customerInfoResp resultMap=list.get(0);
		
			bean.setTitle(resultMap.getTitle()==null?"":resultMap.getTitle().toString());
			bean.setAddress1(resultMap.getAddress1()==null?"":resultMap.getAddress1().toString());
			bean.setAddress2(resultMap.getAddress2()==null?"":resultMap.getAddress2().toString());
			bean.setMobileNo(resultMap.getMobile()==null?"":resultMap.getMobile().toString());
			bean.setCity(resultMap.getCityCode()==null?"":resultMap.getCityCode().toString());
			bean.setPoBox(resultMap.getPoBox()==null?"":resultMap.getPoBox().toString());
			bean.setCustomerName(resultMap.getFirstName()==null?"":resultMap.getFirstName().toString());
			bean.setCoreAppCode(resultMap.getMissippiCustomerCode()==null?"":resultMap.getMissippiCustomerCode().toString());
			bean.setCustomerId(resultMap.getCustomerId()==null?"":resultMap.getCustomerId().toString());
			bean.setEmail(resultMap.getEmail()==null?"":resultMap.getEmail().toString());
			bean.setCustArNo(resultMap.getCustomerArNo()==null?"":resultMap.getCustomerArNo().toString());
			bean.setCustVatRegNo(resultMap.getVatRegNo()==null?"":resultMap.getVatRegNo().toString());
			bean.setCustomerNameAr(resultMap.getCustomerArabicName()==null?"":resultMap.getCustomerArabicName().toString());
		//}
		}
		catch(Exception exception) {
			logger.debug("setOpenCustomerInfo()==> " + exception);
		}
	}
	public String updateExcessDesc(String cover,String applicationNo,String openCoverNo) {
		int status=0;
		logger.info("updateExcessDesc - Enter || applicationNo: "+applicationNo);
		try
		{
			sql=getQuery("UPD_EXCESS_DESC");
			status = this.mytemplate.update(sql, new String[]{cover,openCoverNo,applicationNo});
		}catch(Exception e)
		{
			logger.debug("Exception @ "+e);
		}
		
		logger.info("updateExcessDesc - Exit");
		return "";	
	}
	public int validateCoverReferral(String commodityId, String branchCode,	String coverId) {
		int result = 0;
		try {
			String query = getQuery("COVER_REFERAL_VALIDATE");
			result = this.mytemplate.queryForInt(query,new Object[]{commodityId,branchCode,coverId});
		}
		catch(Exception ex) {
			logger.debug(ex);
		}
		return result;
	}
	public String dateFormat(String name){
		String date = "";
		if(StringUtils.contains(name, "-")) {
			String arr[]=name.split("-");
			date = arr[1]+"/"+arr[0]+"/"+arr[2];
		} else if(StringUtils.contains(name, "/")) {
			String arr[]=name.split("/");
			date = arr[1]+"/"+arr[0]+"/"+arr[2];
		}
		return date;
	}
	public String invoicExist(String invoiceNo,String ocNo,QuotationAction bean){
		String result ="";
		try {
			String query="";
			if("11".equalsIgnoreCase(bean.getProductId())){
				query = getQuery("GET_INVOICE_EXIST_OC");
			}else
				query = getQuery("GET_INVOICE_EXIST_ONEOFF");
			
			List<Map<String,Object>> result2 = this.mytemplate.queryForList(query,new Object[]{invoiceNo,"11".equalsIgnoreCase(bean.getProductId())?ocNo:bean.getBrokerCode(),bean.getApplicationNo()==null?"":bean.getApplicationNo()});
			for (int i = 0; i < result2.size()	; i++) {
				Map<String, Object> map = result2.get(i);
				result+=map.get("quote_no").toString()+",";				
			}
		}
		catch(Exception ex) {
			System.out.println(ex.toString());
		}
		return result.substring(0, result.length()==0?0:result.length()-1);
	}
	public void getBrokerInformation(QuotationAction bean) {
		BrokerInfoReq br=new BrokerInfoReq();
		br.setBranchCode(bean.getBranchCode());
		br.setLoginId(bean.getLoginId());
		br.setOpenCoverNo(bean.getOpenCoverNo());
		br.setProductId(bean.getProductId());
		br.setUserType(bean.getUserType());
		BrokerInfoResponse broInfo=quoteApi.getBrokerInformation(br);
		//if(Token.save(broInfo.getDefaultValue())) {
			BrokerInfoResp res=broInfo.getBrokerInformation();
			bean.setBrokerCode(res.getBrokerCode()==null?"":res.getBrokerCode());
			bean.setOriginCountry(res.getOrigCountryId()==null?"":res.getDestCountryId());
			bean.setDestCountry(res.getDestCountryId()==null?"":res.getDestCountryId());
			if(bean.getOneOff().equals(bean.getProductId()))
			{
				bean.setBrokerCode("");
				if(bean.getIssuer()==null){
					bean.setBrokerCode(res.getBrokerCode()==null?"":res.getBrokerCode());
				}
			}else{
				bean.setBrokerCode(res.getBrokerCode()==null?"":res.getBrokerCode());
				bean.setExecutive(res.getExecutiveId()==null?"":res.getExecutiveId());
				setOpenCustomerInfo(bean,bean.getOpenCoverNo());
			}
		//}
		
	}
	public List<Object> getCustomerSelectionListNew(QuotationAction bean) {
		List<Object>list=new ArrayList<>();
		CustomerInfoResponse custInfo=new CustomerInfoResponse();
		CommonInfo cmi = new CommonInfo();
		cmi.setLoginId(bean.getLoginId());
		cmi.setApplicationId(bean.getIssuer());
		cmi.setOpenCoverNo(bean.getOpenCoverNo());
		cmi.setSearchValue(bean.getSearchValue());
		
		if(StringUtils.isBlank(bean.getSearchBy())) {
			custInfo=quoteApi.getCustomerSelectionInfo(cmi);
		}else {
			custInfo=quoteApi.getCustomerSearchSelectionInfo(cmi,bean.getSearchBy());
		}
		
		//if(Token.save(custInfo.getDefaultValue())) {
		List<customerInfoResp> cust =custInfo.getCustomerInformation();
		for(int i=0;i<cust.size();i++) {
			Map<String,Object>map=new HashMap<>();
			customerInfoResp resultMap=cust.get(i);
			map.put("TITLE", resultMap.getTitle()==null?"":resultMap.getTitle());
			map.put("FIRST_NAME", resultMap.getFirstName()==null?"":resultMap.getFirstName());
			map.put("CUST_NAME", resultMap.getCustomerName()==null?"":resultMap.getCustomerName());
			map.put("ADDRESS", resultMap.getAddress()==null?"":resultMap.getAddress());
			map.put("ADDRESS1", resultMap.getAddress1()==null?"":resultMap.getAddress1());
			map.put("ADDRESS2", resultMap.getAddress2()==null?"":resultMap.getAddress2());
			map.put("CUSTOMER_ID", resultMap.getCustomerId()==null?"":resultMap.getCustomerId());
			map.put("CITY_NAME", resultMap.getCityName()==null?"":resultMap.getCityName());
			map.put("MISSIPPI_CUSTOMER_CODE", resultMap.getMissippiCustomerCode()==null?"":resultMap.getMissippiCustomerCode());
			map.put("EMAIL", resultMap.getEmail()==null?"":resultMap.getEmail());
			map.put("POBOX", resultMap.getPoBox()==null?"":resultMap.getPoBox());
			map.put("MOBILE", resultMap.getMobile()==null?"":resultMap.getMobile());
			map.put("CUST_AR_NO", resultMap.getCustomerArNo()==null?"":resultMap.getCustomerArNo());
			map.put("VAT_REG_NO", resultMap.getVatRegNo()==null?"":resultMap.getVatRegNo());
			map.put("EMIRATE", resultMap.getCityName()==null?"":resultMap.getCityName());
			list.add(map);
		}
		
		//}
		return list;
	}
	public String getWarOption(String openCoverNo) {
		return quoteApi.getWarOption(openCoverNo);
	}
	public void updateFinalizeStatus(String finalizeYN, String quoteNo) {
		quoteApi.updateFinalizeStatus( finalizeYN,  quoteNo);
		
	}
}