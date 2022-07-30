package com.maan.common.dao;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.Logger;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;

import com.maan.common.DBConstants;
import com.maan.common.LogUtil;
import com.maan.common.MyJdbcTemplate;
import com.maan.common.Validation;
import com.maan.common.exception.BaseException;


public class CommonDAO extends MyJdbcTemplate 
{
	final static Logger logger = LogUtil.getLogger(CommonDAO.class);
	public String sql="";

	public List getTypeInfo(String typeId,String campaignId, String partnerId)
	{
		logger.info("getTypeInfo - Enter");
		List list=null;

		try {
			sql = "SELECT DESTINATION_TABLE FROM XL_MOVEMENT_DETAIL WHERE MOVEMENT_ID='1' and product_id=? and campaign_id= ? and partner_id=? and status='Y'";
			list=this.mytemplate.queryForList(sql, new String[]{typeId,campaignId,partnerId});
		} catch (Exception e) {

			logger.debug("EXCEPTION @ { "+e+" }");
		}
		logger.info("getTypeInfo - Exit || Result: "+list.size());
		//logger.popRemove();
		return list;
	}



	public String insertTransactionDetails(String loginId, String fileName, String folderPath, String movementDetailId, String tranId2,String openCoverNo, String transactionDesc, String issuer) 
	{
		String resultTranId = "";
		int count = this.mytemplate.queryForInt("select count(*) from XL_TRANSACTION_DETAILS where transaction_id =?",new Object[] {tranId2});
		if(count==0){
			//int tranId=this.mytemplate.queryForInt("SELECT TRANSACTION_NO.NEXTVAL FROM DUAL");

			String args[]=new String[8];
			args[0] = tranId2+"";
			args[1] = loginId;
			args[2] = fileName;
			args[3] = folderPath;
			args[4] = movementDetailId;
			args[5] = openCoverNo;
			args[6] = transactionDesc;
			args[7] = issuer;
			sql=getQuery("declaration.insertTransactionDetails");
			if(!tranId2.equalsIgnoreCase("")){
				int result=this.mytemplate.update(sql,args);
				System.out.println("insertTransactionDetails() - Exit || Result: "+result+" Tran Id: "+tranId2);

			}
			resultTranId=tranId2+"";
		}
		else
		{
			//sql= "delete from XL_OPENCOVER_RAW WHERE TRANSACTION_ID=?";
			//this.mytemplate.update(sql,new Object[]{tranId2});
			resultTranId=tranId2;
		}
		return resultTranId;
	}


	public List getMovements(String product, String partner, String campaign) {

		List movements = null;
		String sql = "SELECT MOVEMENT_DETAIL_ID FROM XL_MOVEMENT_DETAIL WHERE MOVEMENT_ID<>1 AND PRODUCT_ID=? AND PARTNER_ID=? AND CAMPAIGN_ID=?  AND STATUS='Y' AND MOVEMENT_TYPE='A' ORDER BY PRIORITY ASC";
		movements= this.mytemplate.queryForList(sql,new Object[]{product,partner,campaign});
		return movements;
	}
	public List getExcelMovement(String product, String partner, String campaign) {

		//logger.info("getExcelMovement");
		List movements = null;
		String sql = "SELECT MOVEMENT_DETAIL_ID FROM XL_MOVEMENT_DETAIL WHERE MOVEMENT_ID=1 AND PRODUCT_ID=? AND PARTNER_ID=? AND CAMPAIGN_ID=?  AND STATUS='Y' ORDER BY PRIORITY ASC";
		movements= this.mytemplate.queryForList(sql,new Object[]{product,partner,campaign});
		//logger.info("getExcelMovement query "+ sql);
		return movements;
	}
	/*public synchronized String getPolicyNo(String branchCode,String productId,String type) throws BaseException {
		logger.info("getPolicyNo method() Enter");
		String maxId = null;
		String preFix = null;
		try{
			Object obj[] = new Object[]{branchCode, productId, branchCode, productId};
			String sql=getQuery("GET_MAX_ID1")+" " +type+" "+getQuery("GET_MAX_ID2");
			logger.info("Query=>"+sql);
			logger.info("obj[] ==> "+StringUtils.join(obj, ","));
			Map polMap=this.mytemplate.queryForMap(sql, obj);
			preFix=(polMap.get("PREFIX")==null?"":polMap.get("PREFIX").toString()).trim();
			maxId =(polMap.get("MAXNO")==null?"":polMap.get("MAXNO").toString()).trim(); 
			logger.info("Result=>"+maxId);
			sql=getQuery("UPD_MAX_ID1")+" " +type+" "+getQuery("UPD_MAX_ID2");
			logger.info("Query=>"+sql);
			obj = new Object[]{maxId,maxId,branchCode, productId, branchCode, productId};
			logger.info("obj[] ==> "+StringUtils.join(obj, ","));
			int res=this.mytemplate.update(sql,obj);
			logger.info("Result=>"+res);
		}catch(Exception e)
		{
			logger.debug(e);
		}
		//logger.popRemove();
		logger.info("getPolicyNo method() Exit || maxId=>"+preFix+maxId);
		return preFix+maxId;
	}*/

	public synchronized String getMinimumPremium(String applicationNo) throws BaseException
	{
		logger.info("CommonDAO getMinimumPremium() Enter");
		String minPremium = null;
		try{
			sql=getQuery("GET_MINIUM_PREMIUM");
			Object[] obj=new Object[2];
			obj[0]=applicationNo;
			obj[1]=applicationNo;
			logger.info("Query=>"+sql);
			logger.info("Obj[0-2]=>"+StringUtils.join(obj,","));
			minPremium=(String)this.mytemplate.queryForObject(sql,obj,String.class);
			logger.info("Minimum Premium=>"+minPremium);
		}catch(Exception e)
		{
			logger.debug(e);
		}
		//logger.popRemove();
		logger.info("CommonDAO getMinimumPremium() Exit || minPremium=>"+minPremium);
		return minPremium;
	}

	public synchronized double getPolicyFee(String applicationNo,String branchCode,String productId) throws BaseException
	{
		logger.info("CommonDAO getPolicyFee() Enter");
		double policyFee = 0.0;
		try{
			Object[] obj=new Object[2];
			if("65".equalsIgnoreCase(productId)){
				obj[0]=applicationNo;
				obj[1]=applicationNo;
				sql=getQuery("GET_POLICY_FEE_MOTOR");
				logger.info("Query=>"+sql);
				logger.info("Obj[0-1]=>"+StringUtils.join(obj,","));
			}else{
				obj[0]=applicationNo;
				obj[1]=branchCode;
				sql=getQuery("GET_POLICY_FEE");
				logger.info("Query=>"+sql);
				logger.info("Obj[0-1]=>"+StringUtils.join(obj,","));
			}

			List li=this.mytemplate.queryForList(sql,obj);
			if(li!=null && li.size()>0)
			{
				Map map=(Map)li.get(0);
				policyFee=Double.parseDouble(map.get("POLICY_FEE").toString());
			}
			logger.info("policyFee=>"+policyFee);
		}catch(Exception e)
		{
			logger.debug(e);
		}
		//logger.popRemove();
		logger.info("CommonDAO getPolicyFee() Exit || policyFee=>"+policyFee);
		return policyFee;
	}

	public synchronized double getNajmFee(String applicationNo,String productId) throws BaseException
	{
		logger.info("CommonDAO getNajmFee() Enter");
		double najmFee = 0.0;
		try{
			Object[] obj=new Object[2];
			if("65".equalsIgnoreCase(productId)){
				obj[0]=applicationNo;
				obj[1]=applicationNo;
				sql=getQuery("GET_NAJM_FEE_MOTOR");
				logger.info("Query=>"+sql);
				logger.info("Obj[0-1]=>"+StringUtils.join(obj,","));
			}else{
				obj[0]=applicationNo;
				obj[1]=productId;
				sql=getQuery("GET_NAJM_FEE");
				logger.info("Query=>"+sql);
				logger.info("Obj[0-1]=>"+StringUtils.join(obj,","));
			}
			List li=this.mytemplate.queryForList(sql,obj);
			if(li!=null && li.size()>0)
			{
				Map map=(Map)li.get(0);
				najmFee=Double.parseDouble(map.get("NAJM_FEE").toString());
			}
			logger.info("getNajmFee=>"+najmFee);
		}catch(Exception e)
		{
			logger.debug(e);
		}
		//logger.popRemove();
		logger.info("CommonDAO getPolicyFee() Exit || policyFee=>"+najmFee);
		return najmFee;
	}

	public String getCommision(final double premium,final String appNo)throws BaseException {
		logger.info("getCommision method() Enter||");
		double commision=0; 
		DecimalFormat df = new DecimalFormat("####0.00");
		try{
			String sql=getQuery("GET_LOGIN_PROD_ID");
			logger.info("Query=>"+sql);
			logger.info("Obj[0]=>"+appNo);
			Map map=this.mytemplate.queryForMap(sql,new Object[]{appNo});
			logger.info("Map Size=>"+map.size());
			sql=getQuery("GET_COMM");
			Object obj[] = {map.get("LOGIN_ID"),map.get("PROD_ID")};
			logger.info("Query=>"+sql);
			logger.info("Obj[0]=>"+map.get("LOGIN_ID"));
			logger.info("Obj[1]=>"+map.get("PROD_ID"));
			String comPer =(String)this.mytemplate.queryForObject(sql, obj,String.class);
			logger.info("Result=>"+comPer);
			if (0==Double.parseDouble(comPer)){
				commision = 0.0;
			}
			else{
				commision = premium * (Double.parseDouble(comPer) / 100.0);
			}
		}catch(Exception e)
		{
			logger.debug(e);
		}
		logger.info("getCommision method() Exit|| Commision=>"+commision);
		return df.format(commision);
	}

	public synchronized String getReferralYN(String loginId) throws BaseException
	{
		logger.info("getPolicyNo getReferralYN() Enter");
		String refYN = "";
		try{
			sql=getQuery("GET_REFERAL_YN");
			Object[] obj=new Object[1];
			obj[0]=loginId;
			logger.info("Query=>"+sql);
			logger.info("Obj[0]=>"+loginId);
			refYN=(String)this.mytemplate.queryForObject(sql, obj,String.class);
			logger.info("Result=>"+refYN);
		}catch(Exception e)
		{
			logger.debug(e);
		}
		//logger.popRemove();
		logger.info("getPolicyNo getReferralYN() Exit || ReferralYN=>"+refYN);
		return refYN;
	}

	public List<Object> getOptionsList(String option, Object[] objects)
	{
		logger.info("getOptionsList - Enter || option: "+option);
		List<Object> list=new ArrayList<Object>();
		try
		{
			sql=getQuery(DBConstants.OPTION);
			objects[0]=option;
			logger.info("sql==>"+sql);
			removeNull(objects);
			logger.info("args[] ==> "+StringUtils.join(objects, ","));
			list = this.mytemplate.queryForList(sql, objects);
		}catch(Exception e)
		{
			logger.debug("Exception @ "+e);
		}
		//logger.popRemove();
		logger.info("getOptionsList - Exit || Result: "+list.size());
		return list;	
	}

	public List<Object> getOptionsList(String option, String productId, Object[] objects) {
		logger.info("getOptionsList - Enter || option: "+option);
		List<Object> list=new ArrayList<Object>();
		try {
			String sql = "";
			if("cancelReason".equalsIgnoreCase(option)){
				sql=getQuery("GET_CANCEL_REASON");	
				logger.info("sql==>"+sql);
				list = this.mytemplate.queryForList(sql);
			}else{
				if("broker".equalsIgnoreCase(option)){
					sql=getQuery("issuer.broker");				
				}else {
					if("65".equals(productId)) {
						sql=getQuery(DBConstants.OPTION_MOTOR);
					} else {
						sql=getQuery(DBConstants.OPTION);
					}
					objects[0]=option;
					logger.info("sql==>"+sql);
					for (int i = 0; i < objects.length; i++) {
						if(objects[i]==null){
							objects[i]="";
						}
					}
				}
				logger.info("args[] ==> "+StringUtils.join(objects, ","));
				list = this.mytemplate.queryForList(sql, objects);
			}
		}catch(Exception e)
		{
			logger.debug("Exception @ "+e);
		}
		//logger.popRemove();
		logger.info("getOptionsList - Exit || Result: "+list.size());
		return list;	
	}

	public int getCalculatedAge(String date)
	{
		logger.info("getCalculatedAge - Enter || Date=>"+date);
		int age=0;
		try
		{
			String sql=getQuery("GET_AGE_CALC");
			logger.info("Obj[0-3]=>"+date);
			Map map=this.mytemplate.queryForMap(sql,new Object[]{date,date,date,date});
			age=Integer.parseInt(map.get("YEARS").toString());
			logger.info("Query=>"+sql);
		}catch(Exception e)
		{
			logger.debug(e);
		}
		logger.info("getCalculatedAge - Exit Age=>"+age);
		return age;
	}
	public String getBackDatesAllowed(final String user,final String userType,final String productId, final String branchCode ,final String schemeId)
	{
		logger.info("getBackDatesAllowed - Enter");
		String result = "0";
		if (userType != null)
		{
			String sql="";
			if ("RSAUSER".equalsIgnoreCase(userType)||"Admin".equalsIgnoreCase(userType)){
				sql = getQuery("GET_CONSTRANCT_DTLS");
				logger.info("Query=>"+sql);
				logger.info("Obj[0]=>152"+152);
				logger.info("Obj[1]=>"+branchCode);
				result = (String)this.mytemplate.queryForObject(sql,new Object[]{"152",branchCode}, String.class);
			}
			else {
				sql = getQuery("GET_BACK_DATE_ALLOWED");
				logger.info("Query=>"+sql);
				logger.info("Obj[0]=>"+user);
				logger.info("Obj[1]=>"+productId);
				if("30".equalsIgnoreCase(productId)){
					sql+=" and scheme_id=?";
					result =(String) this.mytemplate.queryForObject(sql, new Object[]{user,productId, schemeId},String.class);
				}else
					result =(String) this.mytemplate.queryForObject(sql, new Object[]{user,productId},String.class);
			}
		}
		if (result == null){
			result = "0";
		}
		logger.info("getBackDatesAllowed - Exit");
		return result;
	}
	public synchronized String getSumInsuredLimit(String appNo,String loginId,String productId) throws BaseException
	{
		logger.info("CommonDAO getSumInsuredLimit() Enter");
		String siLimit = null;
		Object[] obj=new Object[2];
		try{
			if(StringUtils.isBlank(appNo))
			{
				sql=getQuery("GET_SI_LIMIT");
				obj[0]=loginId;
				obj[1]=productId;
			}else
			{
				sql=getQuery("GET_SI_LIMIT_APPNO");
				obj[0]=appNo;
				obj[1]=appNo;
			}
			logger.info("Query=>"+sql);
			logger.info("Obj[0-2]=>"+StringUtils.join(obj,","));
			siLimit=(String)this.mytemplate.queryForObject(sql,obj,String.class);
			logger.info("SI Limit=>"+siLimit);
		}catch(Exception e)
		{
			logger.debug(e);
		}
		//logger.popRemove();
		logger.info("CommonDAO getSumInsuredLimit() Exit || SI Limit=>"+siLimit);
		return siLimit;
	}
	public Map getTodaysDate()
	{
		logger.info("getTodaysDate - Enter");
		Map todayDate=null;
		try{
			final String sql = getQuery("GET_TODAY_DT");
			logger.info("Query=>"+sql);
			todayDate =this.mytemplate.queryForMap(sql);
			logger.info("Map Size=>"+todayDate.size());
		}catch(Exception e)
		{
			logger.debug(e);
		}
		logger.info("getTodaysDate - Exit");
		return todayDate;
	}
	public void closeTrnDateCalculation(final String quoteNo,final String loginBranch,final String policy)throws BaseException{
		logger.info("closeTrnDateCalculation method() Enter");
		try{
			Date sysDates;
			Date sysDates1;
			Date closeDate;
			Date openDate;
			List closeDates;
			closeDates = getCloseDate(loginBranch,quoteNo,policy);
			sysDates = new Date();
			if(closeDates.size()>0){
				Map closeDatesMap=(Map)closeDates.get(0);
				sysDates1 = new Date(sysDates.getYear(), sysDates.getMonth(),sysDates.getDate());
				sysDates = sysDates1;
				closeDate = new Date(Integer.parseInt(closeDatesMap.get("CLOSE_YEARS").toString()) - 1900,Integer.parseInt(closeDatesMap.get("CLOSE_MONTHS").toString()) - 1, Integer
						.parseInt(closeDatesMap.get("CLOSE_DAYS").toString()));
				openDate = new Date(Integer.parseInt(closeDatesMap.get("OPEN_YEARS").toString()) - 1900,Integer.parseInt(closeDatesMap.get("OPEN_MONTHS").toString()) - 1, Integer
						.parseInt(closeDatesMap.get("OPEN_DAYS").toString()));
				if (!(sysDates.compareTo(openDate) >= 0&& sysDates.compareTo(closeDate) <= 0)) {
					String sql="";
					Object obj[] = new Object[3];
					obj[0] =closeDatesMap.get("OPEN_DAYS").toString()+ "/"+ (closeDatesMap.get("OPEN_MONTHS").toString()) + "/"+closeDatesMap.get("OPEN_YEARS").toString()+ " 01:01:01";
					obj[1] =closeDatesMap.get("OPEN_DAYS").toString()+ "/"+ (closeDatesMap.get("OPEN_MONTHS").toString()) + "/"+closeDatesMap.get("OPEN_YEARS").toString()+ " 01:01:01";

					if("HTOS".equalsIgnoreCase(policy)){
						sql=this.getQuery("UPD_HPMDATE_QUOTENO");
						obj[2] = quoteNo;
					}else{
						sql=this.getQuery("UPD_HPMDATE_POLICYNO");
						obj[2] = policy;
					}
					logger.info("sql=>"+sql);
					logger.info("obj[]=>"+StringUtils.join(obj,","));
					this.mytemplate.update(sql,obj);
				}
			}
		}catch(Exception e)
		{
			logger.debug(e);
		}
		logger.info("closeTrnDateCalculation method() Exit");
	}
	private List getCloseDate(final String loginBranch,final String quoteNo,final String policy)throws BaseException{
		logger.info("getCloseDate method() Enter");
		List closeDates=new ArrayList();
		try{
			String sql="";
			String pdtCoreCode = "";
			Object obj[] = new Object[2];
			obj[0] = quoteNo;
			obj[1] = loginBranch;
			sql=getQuery("GET_RSACODE");
			logger.info("Query=>"+sql);
			logger.info("obj[0]=>"+quoteNo);
			logger.info("obj[1]=>"+loginBranch);
			pdtCoreCode =(String)this.mytemplate.queryForObject(sql,obj,String.class);
			logger.info("Result=>"+pdtCoreCode);
			if("HTOS".equalsIgnoreCase(policy)){
				obj = new Object[3];
				obj[0] = loginBranch;
				obj[1] = pdtCoreCode;
				obj[2] = quoteNo;
				sql=getQuery("GET_CLOSE_TRNRSACODE");
				logger.info("Query=>"+sql);
				logger.info("Obj[0]=>"+StringUtils.join(obj,","));
				closeDates = this.mytemplate.queryForList(sql,obj);
			}else{
				obj = new Object[1];
				obj[0] = loginBranch;
				sql=getQuery("GET_CLOSE_TRN");
				logger.info("Query=>"+sql);
				logger.info("Obj[0]=>"+loginBranch);
				closeDates = this.mytemplate.queryForList(sql,obj);
			}
		}catch(Exception e)
		{
			logger.debug(e);
		}
		logger.info("getCloseDate method() Exit List Size=>"+closeDates.size());
		return closeDates;
	}
	public String getBrokerLoginId(String brokerCode)
	{
		logger.info("getBrokerLoginId - Enter||");
		String result=null;
		String sql="";
		logger.info("getBrokerLoginId");
		try{	
			sql=getQuery("quotation.brokerloginId");
			logger.info("Sql=>" + sql+"\nArgs =>"+brokerCode);				
			result=(String)this.mytemplate.queryForObject(sql,new String[]{brokerCode},String.class);			
		}
		catch (Exception e) {			
			logger.debug(e);
		}		
		logger.info("getBrokerLoginId - Exit||"+ result);
		//logger.popRemove();		
		return result;
	}
	public List<Object> getCustomerSelectionList(String loginId,String searchBy,String searchValue,String openCoverNo)
	{
		logger.info("getCustomerSelectionList - Enter || "+loginId+","+searchValue);
		List<Object> customerList=new ArrayList<Object>();		
		searchValue=searchValue==null?"":searchValue;
		String sql="";
		try{
			if("".equalsIgnoreCase(searchValue)){
				if(StringUtils.isNotEmpty(openCoverNo) && !"0".equals(openCoverNo)){
					sql=getQuery("customer.opencover");
					sql+=" ORDER BY PI.FIRST_NAME";
					logger.info("SQL=>" + sql);
					logger.info("Args[]=>"+openCoverNo);
					customerList=this.mytemplate.queryForList(sql,new String[]{openCoverNo});
				}else{
					sql=getQuery("travel.customer.selection");
					sql+=" ORDER BY PI.FIRST_NAME";
					logger.info("SQL=>" + sql);
					logger.info("Args[]=>"+loginId);
					customerList=this.mytemplate.queryForList(sql,new String[]{loginId});}
			}else{
				if(StringUtils.isNotEmpty(openCoverNo) && !"0".equals(openCoverNo)){
					sql=getQuery("customer.opencover.byname");
					logger.info("SQL=>" + sql);
					logger.info("Args[]=>"+openCoverNo+","+searchValue);
					customerList=this.mytemplate.queryForList(sql,new String[]{openCoverNo,"%"+searchValue+"%"});
				}else{
					Object[] obj=new Object[]{loginId};
					sql=getQuery("customer.selection.common");
					if("custName".equalsIgnoreCase(searchBy)){
						sql+=" "+getQuery("customer.selection.byname");
						obj=new Object[]{loginId,"%"+searchValue+"%"};
					}else if("coreAppCode".equalsIgnoreCase(searchBy)){
						sql+=" "+getQuery("customer.selection.coreAppCode");
						obj=new Object[]{loginId,"%"+searchValue+"%"};
					}else if("mobileNo".equalsIgnoreCase(searchBy)){
						sql+=" "+getQuery("customer.selection.mobileNo");
						obj=new Object[]{loginId,"%"+searchValue+"%"};
					}else if("email".equalsIgnoreCase(searchBy)){
						sql+=" "+getQuery("customer.selection.email");
						obj=new Object[]{loginId,"%"+searchValue+"%"};
					}
					logger.info("SQL=>" + sql);
					logger.info("Obj[]=>"+StringUtils.join(obj,","));
					customerList=this.mytemplate.queryForList(sql,obj);
				}
			}	
		}
		catch (Exception e) {			
			logger.debug("EXCEPTION @ { " + e + " }");
		}		
		logger.info("getCustomerSelectionList() - Exit Result=>"+ customerList.size() );
		//logger.popRemove();		
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
		//logger.popRemove();		
		return result;
	}

	public String getProductIdByAppNo(String applicationNo) {
		String productId = "";
		try {
			String query = "SELECT PRODUCT_ID FROM position_master PM WHERE APPLICATION_NO=? AND AMEND_ID=(SELECT MAX(AMEND_ID) FROM POSITION_MASTER PM1 WHERE PM1.APPLICATION_NO=PM.APPLICATION_NO)";
			productId = (String) this.mytemplate.queryForObject(query, new Object[]{applicationNo}, String.class);
		}
		catch(Exception exception) {
			logger.debug(exception);
		}
		return productId;
	}
	public Double getPremium(String applicationNo){
		Double premium=0.0;
		try{
			String query = "SELECT OVERALL_PREMIUM FROM home_position_master WHERE APPLICATION_NO=?";
			premium=(Double) this.mytemplate.queryForObject(query, new Object[]{applicationNo},Double.class);
		}catch(Exception e){
			e.printStackTrace();
		}
		return premium;
	}
	public String getUserMail(String loginId) {
		String userMail = "";
		try {
			String query = "SELECT USER_MAIL FROM LOGIN_MASTER WHERE LOGIN_ID=?";
			userMail = (String) this.mytemplate.queryForObject(query, new Object[]{loginId}, String.class);
		}
		catch(Exception exception) {
			logger.debug("Exception @ { " + exception + " } ");
		}
		return userMail;
	}

	public String getBrokerExecutiveId(String productId, String loginId, String openCoverNo) {
		String result = "";
		try {
			String query = "";
			Object[] args = null;
			if("11".equals(productId)) {
				query = getQuery("executive_oc");
				args =new Object[]{openCoverNo};
			}
			else {
				query = getQuery("executive");
				args =new Object[]{loginId};
			}
			result = (String) this.mytemplate.queryForObject(query, args, String.class);
		}
		catch(Exception exception) {
			logger.debug("Exception @ getBrokerExecutiveId() { " + exception + " } ");
		}
		return result;
	}
	public String calculatePolicyFee(String premium, String branchCode) {
		String result ="";
		try{
			final java.text.NumberFormat fmt1 = new java.text.DecimalFormat("0.00");
			String query = getQuery("GET_POLICYFEE_PERCENT");
			Object args[] = new Object[]{branchCode};
			String policyPercent = (String) this.mytemplate.queryForObject(query, args, String.class);
			double policyFee = (Double.valueOf(premium)*Double.valueOf(policyPercent))/100;
			result = fmt1.format(policyFee);
		}
		catch (Exception e) {
			logger.debug("Exception occured @ calculatePolicyFee{"+e+"}");
			result="0";
		}
		return result;
	}
	/**
	 * This Method 
	 * 
	 * *//* 
	public synchronized String getSequenceNo(String type, String productId, String branchCode, String quoteNo, String customerId) {
		String result = "";
		try {
			String query = "";
			Object[] args = null;
			if("CUSTOMER_ID".equals(type)) {
				query = getQuery("GET_CUST_SEQ");
				args = new Object[]{applicationNo, customerId};
				query = getQuery("GET_CUST_ID_MAX");
			} else {
				query = getQuery("GET_SEQUENCE");
				args = new Object[]{quoteNo,branchCode,type,productId};
			}
			result = (String) this.mytemplate.queryForObject(query, args, String.class);


			// Below This for Only For MSSQL			
			String colType="";			 
			if(type.equalsIgnoreCase("CUSTOMER_ID"))
				colType="CUSTOMER_TYPE_ID";
			else if(type.equalsIgnoreCase("Policy"))
				colType="POLICY_TYPE_ID";
			else if(type.equalsIgnoreCase("Receipt"))
				colType="RECEIPT_TYPE_ID";
			else if(type.equalsIgnoreCase("Debit"))
				colType="DEBIT_TYPE_ID";
			else if(type.equalsIgnoreCase("Application"))
				colType="APPLICATION_TYPE_ID";
			else if(type.equalsIgnoreCase("Quote"))
				colType="QUOTE_TYPE_ID";
			else if (type.equalsIgnoreCase("BROKER_CODE"))
				colType="CERTIFICATE_NO_TYPE_ID";
			else 
				colType="";




			result = getPolicyNo(branchCode, productId, colType);
		} catch(Exception exception) {
			logger.debug(exception);
		} finally {
			result = StringUtils.isBlank(result)?"":result;
		}

		return result;
	}*/
	/*public synchronized String getPolicyNo(String branchCode,String productId,String type) throws BaseException
	{
		logger.info("getPolicyNo method() Enter");
		String maxId = null;
		String preFix = null;
		try{
			Object obj[] = new Object[]{branchCode, productId, branchCode, productId};
			String sql=getQuery("GET_MAX_ID1")+" " +type+" "+getQuery("GET_MAX_ID2");
			logger.info("Query=>"+sql);
			logger.info("obj[] ==> "+StringUtils.join(obj, ","));
			Map polMap=this.mytemplate.queryForMap(sql, obj);
			preFix=(polMap.get("PREFIX")==null?"":polMap.get("PREFIX").toString()).trim();
			maxId =(polMap.get("MAXNO")==null?"":polMap.get("MAXNO").toString()).trim(); 
			logger.info("Result=>"+maxId);
			sql=getQuery("UPD_MAX_ID1")+" " +type+" "+getQuery("UPD_MAX_ID2");
			logger.info("Query=>"+sql);
			obj = new Object[]{maxId,maxId,branchCode, productId, branchCode, productId};
			logger.info("obj[] ==> "+StringUtils.join(obj, ","));
			int res=this.mytemplate.update(sql,obj);
			logger.info("Result=>"+res);
		}catch(Exception e)
		{
			logger.debug(e);
		}
		//logger.popRemove();
		logger.info("getPolicyNo method() Exit || maxId=>"+preFix+maxId);
		return preFix+maxId;
	}*/
	public String getHomeQuoteNo(String policyNo) {
		String result = null;
		try {
			result = (String) this.mytemplate.queryForObject("SELECT QUOTE_NO FROM HOME_POSITION_MASTER WHERE POLICY_NO=? AND STATUS in ('P','D')",new String[]{policyNo},String.class);
		} catch(Exception exception) {
			logger.error(exception);
		} finally {
			result = result==null?"":result;
		}
		return 	result;
	}
	public String getHomePolicyNo(String quoteNo) {
		String result = null;
		try {
			result = (String) this.mytemplate.queryForObject("SELECT POLICY_NO FROM HOME_POSITION_MASTER WHERE QUOTE_NO=? AND STATUS in ('P','D')",new String[]{quoteNo},String.class);
		} catch(Exception exception) {
			logger.error(exception);
		} finally {
			result = result==null?"":result;
		}
		return 	result;
	}
	public String getHomeApplicationNo(String policyNo) {
		String result = null;
		try {
			result = (String) this.mytemplate.queryForObject("SELECT APPLICATION_NO FROM HOME_POSITION_MASTER WHERE POLICY_NO=? AND STATUS in ('P','D')",new String[]{policyNo},String.class);
		} catch(Exception exception) {
			logger.error(exception);
		} finally {
			result = result==null?"":result;
		}
		return 	result;
	}
	/*	public synchronized String getPolicyNo(String branchCode,String productId,String type) throws BaseException
	{
		logger.info("getPolicyNo method() Enter");
		String maxId = "";
		String preFix = "";
		try{
			Object obj[] = new Object[]{branchCode, productId, branchCode, productId};
			String sql=getQuery("GET_MAX_ID1")+" " +type+" "+getQuery("GET_MAX_ID2");
			logger.info("Query=>"+sql);
			logger.info("obj[] ==> "+StringUtils.join(obj, ","));
			Map polMap=this.mytemplate.queryForMap(sql, obj);
			preFix=(polMap.get("PREFIX")==null?"":polMap.get("PREFIX").toString()).trim();
			maxId =(polMap.get("MAXNO")==null?"":polMap.get("MAXNO").toString()).trim(); 
			logger.info("Result=>"+maxId);
			sql=getQuery("UPD_MAX_ID1")+" " +type+" "+getQuery("UPD_MAX_ID2");
			logger.info("Query=>"+sql);
			obj = new Object[]{maxId,maxId,branchCode, productId, branchCode, productId};
			logger.info("obj[] ==> "+StringUtils.join(obj, ","));
			int res=this.mytemplate.update(sql,obj);
			logger.info("Result=>"+res);
		}catch(Exception e)
		{
			logger.debug(e);
		}
		//logger.popRemove();
		logger.info("getPolicyNo method() Exit || maxId=>"+preFix+maxId);
		return preFix+maxId;
	}*/
	public enum PolicyType {
		CUSTOMER_ID, Policy, Receipt, Debit,Application, Quote 
	}
	/*** Payment Details Start****************/
	/*
	 * Check Whether This user is B2C User or not
	 */
	public int checkUserType(String loginId,String oaCode) {
		int result=0;
		try{
			String query = getQuery("CHECK_USER_TYPE");
			Object args[]=new Object[]{loginId,oaCode};
			logger.info("Query => "+query);
			logger.info("Arguments => "+StringUtils.join(args,","));
			result=this.mytemplate.queryForInt(query,args);
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	/*
	 * Check Credit Note Status
	 */
	public String getCreditNoteStatus(String loginId,String productId){
		String result = "";
		try {
			result = (String) this.mytemplate.queryForObject(getQuery("CHECK_CREDIT_NOTE_STATUS"), new Object[]{loginId,productId},String.class);
		}
		catch(Exception exception) {
			exception.printStackTrace();
		}
		return result;
	}

	public String getSequenceNo(String branchCode,String productId,String type){
		String result="";
		try{
			String sql="";
			if("POLICY_NO".equalsIgnoreCase(type)){
				sql = getQuery("GET_POLICY_GENERATE_MARINE");
				Map<String,Object> inputValues=new java.util.TreeMap<String, Object>(String.CASE_INSENSITIVE_ORDER);
				inputValues.put("Pvquote", "");
				inputValues.put("Pvbranch", branchCode);
				inputValues.put("Pvtype", "Policy");
				inputValues.put("PvProduct", productId);

				SimpleJdbcCall procedure= mySimpleJdbcCall.withProcedureName(sql);
				logger.info("Args==> " + inputValues.toString());
				Map<String, Object> outputValues=null;
				synchronized (procedure) {
					outputValues = procedure.execute(new MapSqlParameterSource(inputValues));
					result=(String)outputValues.get("pvout");
				}			  	
				logger.info("SP OUT SP=>"+outputValues.get("pvout"));
			}else{
				if("CUSTOMER_ID".equalsIgnoreCase(type)){
					sql=getQuery("SEQ_GET_CUSTOMER_ID");
				}else if("CREDIT_NO".equalsIgnoreCase(type)){
					sql=getQuery("SEQ_GET_CREDIT_NO");
				}else if("DEBIT_NO".equalsIgnoreCase(type)){
					sql=getQuery("SEQ_GET_DEBIT_NO");
				}else if("RECEIPT_NO".equalsIgnoreCase(type)){
					sql=getQuery("SEQ_GET_RECEIPT_NO");
				}else if("BROKER_CODE_SEQ".equalsIgnoreCase(type)){
					sql=getQuery("BROKER_CODE_SEQ");
				}else if("PAYMENT_CODE_SEQ".equalsIgnoreCase(type)){
					sql=getQuery("PAYMENT_CODE_SEQ");
				}
				else if("65".equals(productId)){
					if("QUOTE_NO".equalsIgnoreCase(type)){
						//sql=getQuery("SEQ_GET_QUOTE_NO_MOTOR"); Changed Motor & Travel QuoteNo Same				
						sql=getQuery("SEQ_GET_QUOTE_NO_MOTOR"); 
					}else if("APPLICATION_NO".equalsIgnoreCase(type)){
						//sql=getQuery("SEQ_GET_APPLICATION_NO_MOTOR");
						sql=getQuery("SEQ_GET_APPLICATION_NO_MOTOR");
					}
				}
				else if("33".equals(productId)){
					if("QUOTE_NO".equalsIgnoreCase(type)){
						sql=getQuery("SEQ_GET_QUOTE_NO_TRAVEL");
					}else if("APPLICATION_NO".equalsIgnoreCase(type)){
						sql=getQuery("SEQ_GET_APPLICATION_NO_TRAVEL");
					}
				}else{
					sql = getQuery("GET_POLICY_GENERATE_MARINE");
					Map<String,Object> inputValues=new java.util.TreeMap<String, Object>(String.CASE_INSENSITIVE_ORDER);
					inputValues.put("Pvquote", "");
					inputValues.put("Pvbranch", branchCode);
					inputValues.put("Pvtype", "Policy");
					inputValues.put("PvProduct", productId);
					inputValues.put("pvout", ""); 
					SimpleJdbcCall procedure= mySimpleJdbcCall.withProcedureName(sql);
					logger.info("Args==> " + inputValues.toString());
					Map<String, Object> outputValues=null;
					synchronized (procedure) {
						outputValues = procedure.execute(new MapSqlParameterSource(inputValues));
						result=(String)outputValues.get("pvout");
					}			  	
					logger.info("SP OUT SP=>"+outputValues.get("pvout"));
				}
				logger.info("Query => "+sql);
				result=(String) this.mytemplate.queryForObject(sql,String.class);
				logger.info("Result => "+result);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public Map<String, String> getDebitCreditTo(String applicationNo, String productId, String openCoverNo, String channelType, String loginId, String customerId, String branchCode, String premium, String commissionAmt, String quoteNo) {
		Map<String, String> debitCreditTo = new HashMap<String, String>();
		String directStatus =""; 
		String executiveId = "";
		if("65".equalsIgnoreCase(productId) || "33".equalsIgnoreCase(productId)){
			directStatus=getDirectHomeStatus(applicationNo,branchCode);
		}else{
			directStatus=getDirectStatus(applicationNo,branchCode);
		}

		if("11".equalsIgnoreCase(productId) || "3".equalsIgnoreCase(productId)){
			executiveId = getValue("GET_EXECUTIVE_ID", new String[]{applicationNo});
		}else{
			executiveId = getValue("GET_EXECUTIVE_HPM", new String[]{applicationNo});
		}

		String corebrokerCode = getValue("GET_RSABROKER_CODE", new String[]{loginId});
		String coreCustomerId = getValue("GET_CORECUSTOMER_CODE", new String[]{customerId});
		String coreExecutiveId = getValue("GET_COREEXECUTIVE_ID", new String[]{executiveId});
		String openCoverDebit = "";
		if("11".equals(productId)) {
			openCoverDebit = getValue("GET_OPENCOVER_DEBITTO", new String[]{openCoverNo});
		}
		if(!"".equals(premium) && !"0".equals(premium) && Double.valueOf(premium)>0) {
			if(("broker".equalsIgnoreCase(channelType) && corebrokerCode.equals(coreCustomerId))
					|| ("11".equals(productId) && "broker".equalsIgnoreCase(openCoverDebit))
			) {
				debitCreditTo.put("DEBIT","B");
				debitCreditTo.put("DEBIT_ID",corebrokerCode);
			}
			else if("cash".equalsIgnoreCase(channelType)){
				debitCreditTo.put("DEBIT","S");
				debitCreditTo.put("DEBIT_ID",coreExecutiveId);
			}else
			{
				debitCreditTo.put("DEBIT","C");
				debitCreditTo.put("DEBIT_ID",coreCustomerId);
			}
		}
		else if(!"".equals(commissionAmt) && !"0".equals(commissionAmt) && Double.valueOf(commissionAmt)<0) {
			if(!"5".equals(executiveId)) {
				debitCreditTo.put("DEBIT","S");
				debitCreditTo.put("DEBIT_ID",coreExecutiveId);
			}
			else {
				debitCreditTo.put("DEBIT","B");
				debitCreditTo.put("DEBIT_ID",corebrokerCode);
			}
		}
		if(!"".equals(commissionAmt) && !"0".equals(commissionAmt) && Double.valueOf(commissionAmt)>0) {
			if(!"5".equals(executiveId)) {
				debitCreditTo.put("CREDIT","S");
				debitCreditTo.put("CREDIT_ID",coreExecutiveId);
			}
			else {
				debitCreditTo.put("CREDIT","B");
				debitCreditTo.put("CREDIT_ID",corebrokerCode);
			}
		}
		else if(!"".equals(premium) && !"0".equals(premium) && Double.valueOf(premium)<0 ) {
			if(("broker".equalsIgnoreCase(channelType) && corebrokerCode.equals(coreCustomerId))
					|| ("11".equals(productId) && "broker".equalsIgnoreCase(openCoverDebit))
			) {
				debitCreditTo.put("CREDIT","B");
				debitCreditTo.put("CREDIT_ID",corebrokerCode);
			}
			else {
				debitCreditTo.put("CREDIT","C");
				debitCreditTo.put("CREDIT_ID",coreCustomerId);
			}
		}
		String debitTo = debitCreditTo.get("DEBIT")==null?"":debitCreditTo.get("DEBIT");
		String creditTo = debitCreditTo.get("CREDIT")==null?"":debitCreditTo.get("CREDIT");
		String debitToId = debitCreditTo.get("DEBIT_ID")==null?"":debitCreditTo.get("DEBIT_ID");
		String creditToId = debitCreditTo.get("CREDIT_ID")==null?"":debitCreditTo.get("CREDIT_ID");
		String debitNoteNo="";
		String creditNoteNo="";

		if(getSource().equalsIgnoreCase("ORACLE")){
			if(StringUtils.isNotBlank(debitTo) && Double.parseDouble(premium)!=0) {
				debitNoteNo = (String) this.mytemplate.queryForObject(getQuery("GET_DEBITNO_SEQ"), new String[]{branchCode,quoteNo} ,String.class);
			}else{
				debitNoteNo="";
			}
			if(StringUtils.isNotBlank(creditTo) && Double.parseDouble(premium)!=0) {
				creditNoteNo =(String) this.mytemplate.queryForObject(getQuery("GET_CERDITNO_SEQ") , new String[]{branchCode,quoteNo} ,String.class);
			}else{
				creditNoteNo="";
			}
		}else{
			if(StringUtils.isNotBlank(debitTo) && Double.parseDouble(premium)!=0) {
				debitNoteNo =getSequenceNo(branchCode, productId, "DEBIT_NO");
				//debitNoteNo =new CommonDAO().getPolicyNo("01",  "03","DEBIT_TYPE_ID");											
			}else{
				debitNoteNo="";
			}
			if(StringUtils.isNotBlank(creditTo) && Double.parseDouble(premium)!=0) {
				creditNoteNo =getSequenceNo(branchCode, productId, "CREDIT_NO");
				//creditNoteNo =new CommonDAO().getPolicyNo("01",  "03","CREDIT_TYPE_ID");

			}else{
				creditNoteNo="";
			}	
		}
		debitCreditTo.put("CREDIT_NOTE_NO",creditNoteNo);
		debitCreditTo.put("DEBIT_NOTE_NO",debitNoteNo);
		return debitCreditTo;
	}
	public String getDirectStatus(String applicationNo,String branchCode)
	{
		logger.info("getDirectStatus - Enter || applicationNo: "+applicationNo+" branchCode: "+branchCode);
		String result="";
		try{
			sql=getQuery(DBConstants.DIRECT_STATUS,new Object[]{" POSITION_MASTER "});
			result=(String)this.mytemplate.queryForObject(sql,new String[]{branchCode,applicationNo},String.class);
		}
		catch (Exception e) {			
			logger.debug("EXCEPTION @ { " + e + " }");
		}	
		logger.info("getDirectStatus - Exit:"+ result);
		return result;
	}
	public String getDirectHomeStatus(String applicationNo,String branchCode)
	{
		logger.info("getDirectHomeStatus - Enter || applicationNo: "+applicationNo+" branchCode: "+branchCode);
		String result="";
		try{
			sql=getQuery(DBConstants.DIRECT_STATUS,new Object[]{" HOME_POSITION_MASTER "});
			result=(String)this.mytemplate.queryForObject(sql,new String[]{branchCode,applicationNo},String.class);
		}
		catch (Exception e) {			
			logger.debug("EXCEPTION @ { " + e + " }");
		}	
		logger.info("getDirectHomeStatus - Exit:"+ result);
		return result;
	}
	public String getValue(String option, String[] args)
	{
		logger.info("getValue - Enter || "+option+" args: "+ StringUtils.join(args, ","));
		String result="";					
		try{
			sql=getQuery(option);
			result=(String)this.mytemplate.queryForObject(sql,args, String.class);			
		}
		catch (Exception e) {			
			result=StringUtils.isBlank(result)?"":result;
		}		
		logger.info("getValue() - Exit || Result: "+result );
		//logger.popRemove();		
		return result;
	}
	public String drCrInsert(String policyNo,String branchCode,String type,String startDate, String endDate, String productId){
		String result="";
		try{
			logger.info("Enter Into drCrInsert");
			String query = "";
			Object[] args = null;
			query = getQuery("CAL_DR_CR_TABLE_INSERT");
			args = new Object[]{policyNo,type,productId};
			logger.info("Query==>" + query);
			logger.info("Args==>" + StringUtils.join(args,", "));
			this.mytemplate.update(query, args);
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}

	public String getCommisionPer(final String appNo)throws BaseException {
		logger.info("getCommision method() Enter||");
		String commision="0"; 
		try{
			String sql=getQuery("GET_LOGIN_PROD_ID");
			logger.info("Query=>"+sql);
			logger.info("Obj[0]=>"+appNo);
			Map map=this.mytemplate.queryForMap(sql,new Object[]{appNo});
			logger.info("Map Size=>"+map.size());
			sql=getQuery("GET_COMM");
			Object obj[] = {map.get("LOGIN_ID"),map.get("PROD_ID")};
			logger.info("Query=>"+sql);
			logger.info("Obj[0]=>"+map.get("LOGIN_ID"));
			logger.info("Obj[1]=>"+map.get("PROD_ID"));
			commision =(String)this.mytemplate.queryForObject(sql, obj,String.class);
			logger.info("Result=>"+commision);
		}catch(Exception e)
		{
			logger.debug(e);
		}
		logger.info("getCommision method() Exit|| Commision=>"+commision);
		return commision;
	}



	public String getPaymentStatus(String applicationNo, String productId, List<String> isCustomerId,String userType) {
		String result="";
		try{
			String paymetStatus =getSingleInfo("GET_ONLINE_PAYMENT_STATUS",new String[]{productId});
			if("Y".equalsIgnoreCase(paymetStatus)){
				if("65".equalsIgnoreCase(productId)){
					String selectedCover =getSingleInfo("GET_MOTOR_SELECTED_POLICY",new String[]{applicationNo});
					if("5".equalsIgnoreCase(selectedCover)){
						result="Y";
					}else{
						double isReferral = Double.parseDouble(getSingleInfo("ISREFERRALQUOTE",new String[]{applicationNo}));
						if(isReferral>0)
							result="Y";
						else
							result="N";
						// Only ThirdParty allow to do online payment
						/*if(isCustomerId!=null && isCustomerId.size()>0){
							if(isCustomerId.contains("N") && "USER".equalsIgnoreCase(userType)){
								result="N";
							}else{
								result="Y";
							}
						}else{
							result="N";
						}*/
					}
				}else{
					result="Y";
				}
			}else{
				result="N";
			}
		}catch(Exception e){
			e.printStackTrace();	
		}
		return result;		
	}

	public String getCompMail(String applicationNo, String productId, List<String> isCustomerId,String userType) {
		String result="";
		try{
			String selectedCover =getSingleInfo("GET_MOTOR_SELECTED_POLICY",new String[]{applicationNo});
			if("5".equalsIgnoreCase(selectedCover)){
				result="Y";
			}
			else{
				result="Y";
			}
		}catch(Exception e){
			e.printStackTrace();	
		}
		return result;		
	}

	public boolean getReferralApprovedStatus(String applicationNo) {
		boolean isTrue=false;
		try{
			String sql="select count(*) from HOME_POSITION_MASTER where APPLICATION_NO=? and ADMIN_REFERRAL_STATUS='N' and REMARKS is not null";
			logger.info("Query => "+sql);
			int count = this.mytemplate.queryForInt(sql,new Object[]{applicationNo});
			if(count >0){
				isTrue=true;
			}else{
				isTrue=false;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return isTrue;
	}
	public String checkSysYears(String year){
		String result="";
		try{
			int sysYear = Calendar.getInstance().get(Calendar.YEAR);
			if(Integer.parseInt(year)>=sysYear-1){
				result="Y";
			}else{
				result="N";
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	public String marineIntegrationInsert(String policyNo,String branchCode,String type,String startDate, String endDate, String productId){
		String result="";
		try{
			logger.info("Enter Into marineIntegrationInsert");
			String query = "", status="", ckey="",statusMsg="";
			Object[] args = null;
			SimpleJdbcCall procedure= new SimpleJdbcCall(mytemplate.getDataSource()).withProcedureName("INTEGRATION_STAGING_INSERT");
			Map<String,Object> inputValues=new java.util.TreeMap<String, Object>(String.CASE_INSENSITIVE_ORDER);
			inputValues.put("PVPOLICY",policyNo);
			inputValues.put("PVTYPE", type);
			logger.info("Args==> " + inputValues.toString());
			Map<String, Object> outputValues = procedure.execute(new MapSqlParameterSource(inputValues));
			statusMsg="SUCCESS";
			status="SUCCESS".equalsIgnoreCase(statusMsg)?"Y":"F";
			result=updateMarineIntgStatus(policyNo, type, status,statusMsg, ckey,branchCode,startDate,endDate,productId);
			//result=statusMsg;
			logger.info("outputValues==>" + outputValues);
			logger.info("outputValues==>" + outputValues +"val");
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}

	private String  updateMarineIntgStatus(String policyNo,String type,String status,String statusMsg ,String ckey, String branchCode, String startDate, String endDate, String productId){
		
		try {
			int count=0;
			String sql="";
			 if("DECLARATIONUPLOAD".equalsIgnoreCase(type)){
				 sql=getQuery("GET_INTG_COUNT_DEC");
				 logger.info("query==>"+sql);
				 logger.info("args[]==>"+policyNo);
				 count=this.mytemplate.queryForInt(sql,new Object[]{policyNo});
			 }else{
				 sql=getQuery("GET_INTG_COUNT");
				 logger.info("query==>"+sql);
				 logger.info("args[]==>"+policyNo);
				 count=this.mytemplate.queryForInt(sql,new Object[]{policyNo});
			 }
			if(count==0){
				status="F";
				statusMsg="FAILED";
				if(!"RE".equalsIgnoreCase(productId))
					statusMsg=marineIntegrationInsert(policyNo, branchCode, type, startDate, endDate, "RE");
			}

			if("ONEOFFCERTIFICATE".equalsIgnoreCase(type)){
				sql=getQuery("UPDATE_INTG_PM");
			}else if("OPENDEPOSITPREMIUM".equalsIgnoreCase(type)){
				sql=getQuery("UPDATE_INTG_OCPM");
			}else if("LANDTRANSIT".equalsIgnoreCase(type)){
				sql=getQuery("UPDATE_INTG_MVD");
			}else if("DECLARATIONUPLOAD".equalsIgnoreCase(type)){
				sql=getQuery("UPDATE_INTG_DEC");
			}
			this.mytemplate.update(sql,new Object[]{ckey,status,statusMsg,policyNo});
		} catch (Exception e) {
			e.printStackTrace();
		}
		return statusMsg;
	}

	public int checkDocumentMandotry(String policyType, String applicationNo,String quoteNo,String type) {
		logger.info("checkDocumentMandotry - Enter");
		int result = 0;
		String query="";
		String selectedCover="";
		Object[] args=null;
		try {
			if(StringUtils.isNotBlank(applicationNo)){
				selectedCover =getSingleInfo("GET_MOTOR_SELECTED_POLICY",new String[]{applicationNo});
			}
			if("promo".equalsIgnoreCase(type)){
				query = getQuery("DOCUMENT_MAND_VALIDATE_PROMO",new Object[]{selectedCover});
			}else if("cancel".equalsIgnoreCase(type)){
				query = getQuery("DOCUMENT_MAND_VALIDATE_CANCEL");
			}else{
				query = getQuery("DOCUMENT_MAND_VALIDATE",new Object[]{selectedCover});
			}
			if("cancel".equalsIgnoreCase(type)){
				args = new Object[]{quoteNo,quoteNo};
			}else{
				args = new Object[]{quoteNo};
			}
			logger.info("query==>"+query);
			logger.info("args[]==>"+StringUtils.join(args,", "));
			result = this.mytemplate.queryForInt(query,args);
		} catch(Exception e) {
			e.printStackTrace();
		}
		logger.info("checkDocumentMandotry - Exit");
		return result;
	}
	public void insertDueDetails(String quoteNo,String policyNo, 
			List<String>  dueDate, List<String>  dueamount,List<String>  duepercent,
			List<String>  effectiveDate,List<String>  dueList,String reqFrom,
			String oldSno, String amendId,String product) {
		try{
			String sql="";
			int sno=0;
			if("addNew".equalsIgnoreCase(reqFrom)&&StringUtils.isNotBlank(policyNo)){
				sql=getQuery("GET_MAX_SNO_DUE1");
				sno=this.mytemplate.queryForInt(sql,new Object[]{policyNo});
			}
			if(StringUtils.isBlank(policyNo)){
				sql=getQuery("DEL_PAYMENT_TERMS");
				this.mytemplate.update(sql,new Object[]{quoteNo});	
			}
		
			int size="addNew".equalsIgnoreCase(reqFrom)?dueList.size():1;
			for(int i=0; i<size;i++){
				Object args[]=new Object[]{quoteNo,policyNo,dueDate.get(i),dueamount.get(i),duepercent.get(i),
						"addNew".equalsIgnoreCase(reqFrom)?sno+i+1:oldSno,effectiveDate.get(i),
								"addNew".equalsIgnoreCase(reqFrom)?"0":Integer.parseInt(amendId)+1,
										"delete".equalsIgnoreCase(reqFrom)?"N":"Y","","",product,"N"

				};
				removeNull(args);
				for(Object k:args)
					logger.info("args===>"+k.toString());
				sql=getQuery("INS_PAYMENT_TERMS");
				this.mytemplate.update(sql,args);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<String> validatePaymentTerms(String quoteNo,String policyNo, 
			List<String>  dueDate, List<String>  dueamount,List<String>  duepercent,
			List<String>  effectiveDate,List<String>  dueList,String premium,String branchCode){
		List<String>  error=new ArrayList<String>();
		double duepercentTot=0;
		double dueAmtTot=0;
		Validation valid=new Validation();
		try{
			for(int i=0; i<dueList.size();i++){

				if(StringUtils.isBlank(dueDate.get(i))){
					error.add("Please Select Due Date at Row "+ (i+1));
				}
				
				if(StringUtils.isBlank(duepercent.get(i))){
					error.add("Please Select Due Percent at Row "+ (i+1));
				}else if(!StringUtils.isNumeric(duepercent.get(i).trim())){
					error.add("Invalid Due percent at row "+(i+1));
				}else{
					duepercentTot=duepercentTot+Double.parseDouble(duepercent.get(i));
				}
				
				if(StringUtils.isBlank(dueamount.get(i))){
					error.add("Please Enter Due Amount at Row "+ (i+1));

				}else if(Validation.INVALID.equalsIgnoreCase(valid.validDouble(dueamount.get(i).trim()))){
					error.add("Invalid Due Amount at row "+(i+1));
				}else{
					dueAmtTot=dueAmtTot+Double.parseDouble(dueamount.get(i));
				}
				
				if(StringUtils.isBlank(effectiveDate.get(i))){
					error.add("Please Select Effective Date at Row "+ (i+1));
				}else{
					/*String valiadteEffDate=validateImsDate(effectiveDate.get(i),branchCode);
					if(!"success".equalsIgnoreCase(valiadteEffDate)){
						String errorMsg="Invaild effective Date ("+effectiveDate.get(i)+")."+valiadteEffDate + " month production already closed at row " +(i+1) ;
						error.add(errorMsg);
					}*/
				}

			}
			if(error.size()==0){
				if(Math.round(dueAmtTot)!=Math.round(Double.parseDouble(premium))){
					error.add("Total Due amount should be equal to "+premium);
				}

				if(duepercentTot!=100){
					error.add("Total Due % should be equal to 100");
				}
			}


		}catch (Exception e) {
			e.printStackTrace();
			error.add("Error Smothing went Wrong");
		}
		return error;
		
	}

	public String validateImsDate(String effectiveDate,String branchCode) {
		String result="";
		try{
			sql=getQuery("POLICY_EFF_DATE_CT");
			result=(String) this.mytemplate.queryForObject(sql,new Object[]{effectiveDate,branchCode,effectiveDate,effectiveDate},String.class);
		}catch (Exception e) {
			logger.debug("Exception @ "+e);
		}
		return result;
	}
	public Map<String, Object> paymentArchieve(String merchant_reference,String quoteNo, String productId){
		Map<String, Object> execute=null;
		try{
			logger.info("paymentArchieve - Enter || merchant_reference: "+merchant_reference+" quoteNo: "+quoteNo+" productId: "+productId);
			logger.info("args[]"+merchant_reference+","+quoteNo+","+productId);
			SimpleJdbcCall procedure= mySimpleJdbcCall.withProcedureName("PAYMENT_ARCHIEVE");
			Map<String,Object> inputValues=new java.util.TreeMap<String, Object>(String.CASE_INSENSITIVE_ORDER);
			inputValues.put("pvquote", quoteNo);
			inputValues.put("Pvrefno", merchant_reference);
			inputValues.put("Pvproduct", productId);
			logger.info("Args==> " + inputValues.toString());
			execute = procedure.execute(new MapSqlParameterSource(inputValues));
			//Map<String, Object> result=new java.util.TreeMap<String,Object>(String.CASE_INSENSITIVE_ORDER);
			//	result.put("PVOUT", (String)execute.get("pvoutmsg"));
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return execute;   	 
	}

	public int policyIntegrationStatus(String quoteNo) {
		int count = 0;
		try {
			String query = getQuery("PAYMENT_STATUS_ONLINE");
			Object[] args = new Object[]{quoteNo, quoteNo};
			logger.info("Query==>" + query);
			logger.info("Args==>" + StringUtils.join(args,", "));
			count = this.mytemplate.queryForInt(query, args);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public String getSuccesMerchant(String quoteNo) {
		try{
			String query=getQuery("GET_SUCCESS_MERCHANT_ID");
			String[] args=new String[]{quoteNo, quoteNo};
			logger.info("Query==>"+query);
			logger.info("Arguments => "+StringUtils.join(args,","));
			List<Map<String,Object>> queryForList = this.mytemplate.queryForList(query,args); 
			if(queryForList.size()>0) {
				Map<String, Object> map = queryForList.get(0);
				return map.get("MERCHANT_REFERENCE").toString();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public int sadadStatusCount(String quoteNo) {
		int count = 0;
		try {
			String query = getQuery("GET_SADAAD_STATUS");
			Object[] args = new Object[]{quoteNo, quoteNo};
			logger.info("Query==>" + query);
			logger.info("Args==>" + StringUtils.join(args,", "));
			count = this.mytemplate.queryForInt(query, args);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public String getSadadMerchant(String quoteNo) {
		try{
			String query=getQuery("GET_SADAAD_MERCHANT_ID");
			String[] args=new String[]{quoteNo, quoteNo};
			logger.info("Query==>"+query);
			logger.info("Arguments => "+StringUtils.join(args,","));
			List<Map<String,Object>> queryForList = this.mytemplate.queryForList(query,args); 
			if(queryForList.size()>0) {
				Map<String, Object> map = queryForList.get(0);
				return map.get("MERCHANT_REFERENCE").toString();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public void getSadadArchive(String quoteNo,String merchenrRef) {
		try{
			String query=getQuery("GET_PAYMENT_SADAD_ARCHIVE");
			String[] args=new String[]{quoteNo, merchenrRef};
			logger.info("Query==>"+query);
			logger.info("Arguments => "+StringUtils.join(args,","));
			this.mytemplate.update(query, args) ;
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void removeNull(Object []args) {
		for(int i=0;i<args.length;i++) {
			if(args[i]==null)
				args[i]="";
		}
	}


	public String getCommisionForMotor(final double premium,final String appNo)throws BaseException {
		logger.info("getCommision method() Enter||");
		double commision=0; 
		DecimalFormat df = new DecimalFormat("####0.00");
		try{

			sql=getQuery("GET_COMM_MOTOR");
			Object obj[] = {appNo};
			logger.info("Query=>"+sql);
			logger.info("Obj[0]=>"+appNo);			
			String comPer =(String)this.mytemplate.queryForObject(sql, obj,String.class);
			logger.info("Result=>"+comPer);
			if (0==Double.parseDouble(comPer)){
				commision = 0.0;
			}
			else{
				commision = premium * (Double.parseDouble(comPer) / 100.0);
			}
		}catch(Exception e)
		{
			logger.debug(e);
		}
		logger.info("getCommision method() Exit|| Commision=>"+commision);
		return df.format(commision);
	}



	public String getCommisionPercentForMotor(String applicationNo) {
		logger.info("getCommisionPercentForMotor method() Enter||");
		String comPer="0"; 

		try{

			sql=getQuery("GET_COMM_MOTOR");
			Object obj[] = {applicationNo};
			logger.info("Query=>"+sql);
			logger.info("Obj[0]=>"+applicationNo);			
			comPer =(String)this.mytemplate.queryForObject(sql, obj,String.class);
			logger.info("Result=>"+comPer);

		}catch(Exception e)
		{
			logger.debug(e);
		}
		logger.info("getCommisionPercentForMotor() ");
		return comPer;
	}
	public List<String> getUnRelativeList() {
		logger.info("getUnRelativeList() Enter ");
		List<String>unRelative=new ArrayList<String>();
		try {
			String query=getQuery("GET_UN_RELATIVE_LIST");
			logger.info("Query=>"+query);
			List list=this.mytemplate.queryForList(query);
			logger.info("Result=>"+list);
			if(list!=null && list.size()>0){
				for(int i=0;i<list.size();i++){
					Map<String,Object>map=(Map<String, Object>) list.get(i);
					unRelative.add(map.get("ITEM_CODE")==null?"":map.get("ITEM_CODE").toString());
				}
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		logger.info("getUnRelativeList() Exit");
		return unRelative;
	}
}
