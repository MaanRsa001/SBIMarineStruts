package com.maan.report.dao;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.Logger;
import org.apache.tika.Tika;

import com.maan.common.DBConstants;
import com.maan.common.LogUtil;
import com.maan.common.MyJdbcTemplate;
import com.maan.report.ReportAction;
import com.maan.report.ReportBean;
import com.maan.report.api.ReportApiCaller;
import com.maan.webservice.dao.PolicyGenerationDAO;

public class ReportDAO extends MyJdbcTemplate{
	final Logger logger = LogUtil.getLogger(ReportDAO.class);
	String sql="" ;
	PolicyGenerationDAO policyDAO=new PolicyGenerationDAO();
	ReportApiCaller api = new ReportApiCaller();
	
	public List<Object> getReportList(String loginId,String productId,String issuer, final String menuType,String openCoverNo,String startDate,String endDate, String quoteNo, String policyNo,String searchBy,String searchValue, String searchField,String searchString,String searchOper,String branchCode, String userLogin,String schemeId,String vehicleId)
	{
		
		List<Object> reportList=new ArrayList<Object>();

		if("QE".equalsIgnoreCase(menuType) || "QL".equalsIgnoreCase(menuType) || "L".equalsIgnoreCase(menuType)) {
			reportList=	api.getReportList(loginId,productId,issuer,  menuType, openCoverNo, startDate, endDate,  quoteNo,  policyNo, searchBy, searchValue,  searchField, searchString, searchOper, branchCode,  userLogin, schemeId, vehicleId);
			return reportList;
		}else if("P".equalsIgnoreCase(menuType) || "PC".equalsIgnoreCase(menuType)|| "PF".equalsIgnoreCase(menuType)) {
			reportList=	api.getPortFolio(loginId,productId,issuer,  menuType, openCoverNo, startDate, endDate,  quoteNo,  policyNo, searchBy, searchValue,  searchField, searchString, searchOper, branchCode,  userLogin, schemeId, vehicleId);
			return reportList;
		}else if("RR".equalsIgnoreCase(menuType) || "RA".equalsIgnoreCase(menuType) || "RU".equalsIgnoreCase(menuType)) {
			reportList=	api.getReferralList(loginId,productId,issuer,  menuType, openCoverNo, startDate, endDate,  quoteNo,  policyNo, searchBy, searchValue,  searchField, searchString, searchOper, branchCode,  userLogin, schemeId, vehicleId);
		} else if ("C".equalsIgnoreCase(menuType)) {
			reportList = api.getCustomerList(loginId, issuer,branchCode);
			return reportList;
		} else if ("E".equalsIgnoreCase(menuType)) {
			reportList = api.getEndorsementList(loginId,productId,issuer,  menuType, openCoverNo, startDate, endDate,  quoteNo,  policyNo, searchBy, searchValue,  searchField, searchString, searchOper, branchCode,  userLogin, schemeId, vehicleId);
			return reportList;
		}else if ("PE".equalsIgnoreCase(menuType)) {
			reportList = api.getPolicyEndorsementList(loginId,productId,issuer,  menuType, openCoverNo, startDate, endDate,  quoteNo,  policyNo, searchBy, searchValue,  searchField, searchString, searchOper, branchCode,  userLogin, schemeId, vehicleId);
			return reportList;
		}else if("PR".equalsIgnoreCase(menuType)) {
			reportList = api.getPolicyReportList(loginId,productId,issuer,  menuType, openCoverNo, startDate, endDate,  quoteNo,  policyNo, searchBy, searchValue,  searchField, searchString, searchOper, branchCode,  userLogin, schemeId, vehicleId);
			return reportList;
		}else if("R".equalsIgnoreCase(menuType)){
			reportList = api.getPolicyReporBrokertList(loginId,productId,issuer,  menuType, openCoverNo, startDate, endDate,  quoteNo,  policyNo, searchBy, searchValue,  searchField, searchString, searchOper, branchCode,  userLogin, schemeId, vehicleId);
			return reportList;
		}

		/*StringUtils.defaultIfEmpty(openCoverNo,"");
		logger.info("args===>" + loginId+","+ productId+","+ issuer+","+ menuType+","+openCoverNo);	
		try
		{
			String homeSQLCondition = "";
			final String ISSUER_SQL_CONDITION = StringUtils.isBlank(issuer)?"":" AND a.APPLICATION_ID IN ('" + issuer + "' )";
			if("30".equals(productId)) {
				homeSQLCondition = " and  a.scheme_id = '" + schemeId + "'";
			}
			String args[]=null;
			args=new String[]{loginId,productId,StringUtils.isBlank(issuer)?"1":"gotherPolicyNo".equalsIgnoreCase(searchField)?"1":issuer,StringUtils.isBlank(openCoverNo)?"":openCoverNo};
			 if("AP".equalsIgnoreCase(menuType)){
				if("11".equals(productId)){
					sql=getQuery("GET_PORTFOLIO_OC", new Object[]{"gotherPolicyNo".equalsIgnoreCase(searchField)||StringUtils.isNotBlank(issuer)?"":"A.LOGIN_ID=? AND "});
					openCoverNo="%"+getOriginalPolicyNo(openCoverNo)+"%";
					String applicationId = StringUtils.isBlank(issuer)?"1":"gotherPolicyNo".equalsIgnoreCase(searchField)?"1":issuer;
					if("gotherPolicyNo".equalsIgnoreCase(searchField)||StringUtils.isNotBlank(issuer)) {
					args=new String[]{productId,StringUtils.isBlank(openCoverNo)?"":openCoverNo};
					}else {
						args=new String[]{loginId,productId,StringUtils.isBlank(openCoverNo)?"":openCoverNo};
					}
				} else if("3".equals(productId)) {
					sql=getQuery(DBConstants.REPORT_PORTFOLIO, new Object[]{"gotherPolicyNo".equalsIgnoreCase(searchField)?"":"A.LOGIN_ID=? AND "});
					String applicationId = StringUtils.isBlank(issuer)?"1":"gotherPolicyNo".equalsIgnoreCase(searchField)?"":issuer;
					if("gotherPolicyNo".equalsIgnoreCase(searchField)) {
					args=new String[]{productId,StringUtils.isBlank(openCoverNo)?"":openCoverNo};
					}else {
						args=new String[]{loginId,productId,StringUtils.isBlank(openCoverNo)?"":openCoverNo};	
					}
				} 
			} else if("C".equalsIgnoreCase(menuType)){
				if(StringUtils.isNotEmpty(openCoverNo)){
					sql=getQuery(DBConstants.OPENCOVER_CUSTOMER_LIST);
					args=new String[]{openCoverNo};
				}else{
					sql=getQuery(DBConstants.CUSTOMER_SELECTION);
					args=new String[]{loginId};
				}
			}else if("R".equalsIgnoreCase(menuType)){
				if("3".equals(productId) || "11".equals(productId)) {
					if(StringUtils.isBlank(issuer)){
						sql=getQuery(DBConstants.REPORT_REPORT);
						args=new String[]{loginId,loginId}; 
					}else{
						sql=getQuery(DBConstants.REPORT_USERLIST_ISSUER);
						args=new String[]{issuer,productId};					
					}
				}else{
					if(StringUtils.isBlank(issuer)){
						sql=getQuery(DBConstants.TRAVEL_REPORT_REPORT);
						args=new String[]{loginId,productId}; 
					}else{
						sql=getQuery(DBConstants.TRAVEL_REPORT_USERLIST_ISSUER);
						args=new String[]{issuer,productId};					
					}
				}
			}else if("PR".equalsIgnoreCase(menuType)){
				if("3".equals(productId) || "11".equals(productId)) {
					if(StringUtils.isEmpty(issuer)){
						sql=getQuery(DBConstants.REPORT_POLICY);
						args=new String[]{branchCode,startDate,endDate,userLogin,loginId,productId,"11".equals(productId)?openCoverNo:""};
					}else{
						sql=getQuery(DBConstants.REPORT_POLICY_ISSUER);
						args=new String[]{branchCode,startDate,endDate,userLogin,loginId,productId,"11".equals(productId)?openCoverNo:""};
					}
					sql = "Select * from table(broker_reports(?,?,?,?,?,?))";
						args=new String[]{loginId,branchCode,startDate,endDate,"ALL",productId};
				}
			}else if("E".equalsIgnoreCase(menuType)){
				if("3".equals(productId) || "11".equals(productId)) {
					sql=getQuery("GET_END_LIST");
					args=new String[]{loginId, productId,StringUtils.isBlank(policyNo)?"":policyNo};
				} else if("65".equals(productId)) {
					sql=getQuery("GET_MOTOR_END_LIST");
					args=new String[]{policyNo, productId,vehicleId};
				}else { //"30".equals(productId)
					sql=getQuery("GET_TRAVEL_END_LIST");
					args=new String[]{policyNo, productId};
				}
			}else if("PE".equalsIgnoreCase(menuType)){
				sql=getQuery("GET_ENDT_LIST_ISSUER");
				if("11".equals(productId)){
					openCoverNo=getOriginalPolicyNo(openCoverNo);
				}
				args=new String[]{loginId, productId,issuer,openCoverNo};
			}
			//}
			if(!"R".equalsIgnoreCase(menuType)&&!"PR".equalsIgnoreCase(menuType)){
				String str="like '%"+searchString+"%'";
				if(searchField!=null && searchString!=null && searchOper!=null){
					if("nc".equalsIgnoreCase(searchOper))
						str="not like '%"+searchString+"%'";
					else if("cn".equalsIgnoreCase(searchOper))
						str="like '%"+searchString+"%'";
					else if("eq".equalsIgnoreCase(searchOper))
						str=" = ?";
					else if("nq".equalsIgnoreCase(searchOper))
						str=" != ?";

					if("gquoteNo".equalsIgnoreCase(searchField))
						sql+=" and upper(A.QUOTE_NO) "+str;
					else if("gcustName".equalsIgnoreCase(searchField)){
						if("P".equals(menuType) || "QL".equals(menuType) || "PE".equals(menuType))
							sql+=" and upper(NVL (b.COMPANY_NAME, b.FIRST_NAME)) "+str;
						else if("QE".equals(menuType))
							sql+=" and upper(NVL (b.COMPANY_NAME, b.FIRST_NAME)) "+str;
						else if("L".equals(menuType) || "RU".equals(menuType) || "RR".equals(menuType))
							sql+=" and upper(B.FIRST_NAME) "+str;
					}
					else if("gpolicyNo".equalsIgnoreCase(searchField)||"gotherPolicyNo".equalsIgnoreCase(searchField))
						sql+=" and upper(POLICY_NO) "+str;
					else if("gocCustName".equalsIgnoreCase(searchField))
						sql+=" and upper(OPENCOVER_CUST_NAME) "+str;
					else if("gfirstName".equalsIgnoreCase(searchField))
						sql+=" and upper(FIRST_NAME) "+str;
					else if("gcustomerCivilId".equalsIgnoreCase(searchField))
						sql+=" and upper(CUSTOMER_SOURCE) "+str;
					//sql+=" and upper(CUSTOMER_SOURCE) "+str;
					if("eq".equalsIgnoreCase(searchOper) && "nq".equalsIgnoreCase(searchOper)){
						String[] newArray = new String[args.length+1];  
						for(int cnt=0;cnt<args.length;cnt++){  
							newArray[cnt] = args[cnt];  
						}  
						newArray[args.length]=searchString;
						args=newArray;
					}
						
				}

				if(!"PE".equalsIgnoreCase(menuType) && !"E".equalsIgnoreCase(menuType) && !"PD".equalsIgnoreCase(menuType) && !"T".equalsIgnoreCase(menuType)){
					if("C".equalsIgnoreCase(menuType))
						sql+=" ORDER BY FIRST_NAME";
					else if("P".equalsIgnoreCase(menuType) || "PC".equalsIgnoreCase(menuType) || "BP".equals(menuType)  )
						if("3".equals(productId) || "11".equals(productId)) {
							sql+=" ORDER BY QUOTE_NO DESC";
						} else { //"30".equals(productId)
							sql += " ORDER BY HPM.INCEPTION_DATE DESC";
						}
					else
						sql+=" ORDER BY QUOTE_NO DESC";
				}else if(!"T".equalsIgnoreCase(menuType) && !"PD".equalsIgnoreCase(menuType) && !"E".equalsIgnoreCase(menuType))
					sql+=" ORDER BY A.QUOTE_NO DESC";

			}
			logger.info("args[] ==> "+StringUtils.join(args, ","));

			for(int i=0;i<args.length;i++){
				if(args[i]==null)
					args[i]="";
			}
			if(StringUtils.isNotEmpty(sql)){
				reportList=this.mytemplate.queryForList(sql,args);
			}
		}
		catch (Exception e)
		{			
			logger.debug("EXCEPTION @ { " + e + " }");
			e.printStackTrace();
		}		
		logger.info("Query===>" + sql);		
		logger.info("getReportList() - Exit || Result: " + reportList.size());*/
		return reportList;
	}


	public List<Object> getUserList(String loginId,String productId,String issuer, String searchBy, String branchCode,String menuType,String opencoverNo)	
	{
		return api.getUserList(loginId, productId, issuer, searchBy, branchCode, menuType, opencoverNo);
	}
	public List<Object> getDeclarationPolicyList(String policyNo)	
	{
		List<Object> declarationList=null;	
		logger.info("args===>" + policyNo);
		try
		{
			sql=getQuery(DBConstants.DECLARATION_POLICY_INDIVIDUAL);
			declarationList=this.mytemplate.queryForList(sql,new String[]{policyNo,policyNo});				

		}
		catch (Exception e) 
		{			
			logger.debug("EXCEPTION @ { " + e + " }");
		}		
		logger.info("Query===>" + sql);		
		logger.info("getDeclarationPolicyList() - Exit || Result: " + declarationList.size());
				
		return declarationList;
	}
	public List<Object> getLapsedReason(String branchCode)	
	{
		return api.getLapsedReason( branchCode);
	}
	public List<Object> getLapsedQuote(String quoteNo,String productId) {
		return api.getLapsedQuote( quoteNo, productId);
		
	}
	public int updateLabsed(String quoteNo,String remarks,String loginId,String productId)	
	{
		return api.updateLabsed( quoteNo,remarks,loginId,  productId);
		
	}
	public int activeLapsed(String quoteNo, String productId)	
	{
		return api.activeLapsed( quoteNo,  productId);
		
	}
	public List<Object> getSearchResult(ReportAction action, String userType, String productId, String searchby, String searchValue) {
		logger.info("getSearchResult() - Enter");
		List<Object> result=new ArrayList<Object>();		
		result = api.getSearchResult(action,userType,productId, searchby, searchValue);
		return result;

	}
	
	public List<Object> getConstantList(String categoryId, String branchCode)	
	{
		logger.info("getConstantList() - Enter || categoryId: " + categoryId+" branchCode: "+branchCode);
		List<Object> list=null;			
		try{
			sql=getQuery("GET_CONSTANT");
			list=this.mytemplate.queryForList(sql,new String[]{branchCode,categoryId});				
		}
		catch (Exception e){			
			logger.debug("EXCEPTION @ { " + e + " }");
		}		
		logger.info("Query===>" + sql);
		logger.info("getConstantList() - Exit || Result: " + list);
				
		return list;
	}
	public List<Object> getSearchResult(String policyNo, String branchCode, String productId)
	{
		logger.info("getSearchResult() - Enter");
		List<Object> result=new ArrayList<Object>();			
		try
		{
			sql=getQuery("GET_PORTFOLIO_ISSUER") +" ORDER BY SUBSTR (A.POLICY_NO, 9, 16) DESC";
			String[] args=new String[]{branchCode,productId,"%"+policyNo+"%"};
			logger.info("args=>"+StringUtils.join(args,","));
			for (int i = 0; i < args.length; i++) {
				if(args[i]==null){
					args[i]="";
				}
			}
			result=this.mytemplate.queryForList(sql,args);					
		}
		catch (Exception e) 
		{			
			logger.debug("EXCEPTION @ { " + e + " }");
		}		
		logger.info("getSearchResult() - Exit || Result: " + result.size());
				
		return result;
	}
	public String getOriginalPolicyNo(String openCoverNo){
		logger.info("getOriginalPolicyNo() - Enter || openCoverNo: "+openCoverNo);
		//openCoverNo=policyDAO.getValue("GET_ORIGINAL_POLNO", new String[]{openCoverNo});
		openCoverNo=api.getOriginalPolicyNo(openCoverNo);
		logger.info("getOriginalPolicyNo() - Exit || Result: "+openCoverNo);
		return openCoverNo;
	}
	public List<Map<String, Object>> getEndtPolicyInfo(String branchCode, String policyNo)	
	{
		logger.info("getEndtPolicyInfo() - Enter || branchCode: "+branchCode+" policyNo: "+policyNo);
		List<Map<String, Object>> info=new ArrayList<Map<String, Object>>();;			
		try{
			sql=getQuery("GET_ENDT_POL");
			info=this.mytemplate.queryForList(sql,new String[]{branchCode, policyNo});				
		}catch (Exception e){
			logger.debug("EXCEPTION @ { " + e + " }");
		}		
		logger.info("Query===>" + sql);	
		logger.info("getEndtPolicyInfo() - Exit || Result: " + info.size());
				
		return info;
	}
	public List<Object> getPolicyEndtTypeList(String endtType)	
	{
		logger.info("getPolicyEndtTypeList() - Enter || endtType: "+endtType);
		List<Object> info=new ArrayList<Object>();;			
		try{
			info=(List<Object>)this.mytemplate.queryForList(getQuery("GET_POL_ENDT_LIST").replace("?",endtType));
		}catch (Exception e){			
			logger.debug("EXCEPTION @ { " + e + " }");
		}		
		logger.info("Query===>" + sql);	
		logger.info("getPolicyEndtTypeList() - Exit || Result: " + info.size());
				
		return info;
	}
	public int[] getTRPortfolio(String loginId,String productId,String issuer,String openCoverNo, String schemeId)
	{
		logger.info("getTRPortfolio() - Enter");
		int portfolio=0;
		int portfolioAmount=0;
		Object[] obj=null;
		try{
			if("3".equals(productId) || "11".equals(productId)){
				sql=getQuery(DBConstants.REPORT_CHART_PORTFOLIO,new Object[]{(StringUtils.isBlank(issuer)?" A.LOGIN_ID =? AND":"")});
				if(StringUtils.isBlank(issuer)) {
				obj=new Object[]{loginId,productId,(StringUtils.isBlank(issuer)?"1":issuer),openCoverNo};
				}else {
					obj=new Object[]{productId,(StringUtils.isBlank(issuer)?"1":issuer),openCoverNo};
				}
				logger.info("SQL=>"+sql);
				logger.info("obj=>"+StringUtils.join(obj,","));
				portfolio=this.mytemplate.queryForInt(sql,obj);
				logger.info("Result=>"+portfolio);
				sql=getQuery(DBConstants.REPORT_CHART_PORTFOLIO_AMOUNT,new Object[]{(StringUtils.isBlank(issuer)?" A.LOGIN_ID =? AND":"")});
				logger.info("SQL=>"+sql);
				logger.info("obj=>"+StringUtils.join(obj,","));
				portfolioAmount=this.mytemplate.queryForInt(sql,obj);
				logger.info("Result=>"+portfolioAmount);
			} else { //"30".equals(productId)
				sql=getQuery(DBConstants.TRAVEL_REPORT_CHART_PORTFOLIO,new Object[]{(StringUtils.isBlank(issuer)?" A.LOGIN_ID =? AND":"")});
				if(StringUtils.isBlank(issuer)) {
				obj=new Object[]{loginId,productId,(StringUtils.isBlank(issuer)?"1":issuer)};
				}else {
					obj=new Object[]{productId,(StringUtils.isBlank(issuer)?"1":issuer)};
				}
				logger.info("SQL=>"+sql);
				logger.info("obj=>"+StringUtils.join(obj,","));
				portfolio=this.mytemplate.queryForInt(sql,obj);
				logger.info("Result=>"+portfolio);
				sql=getQuery(DBConstants.TRAVEL_REPORT_CHART_PORTFOLIO_AMOUNT,new Object[]{(StringUtils.isBlank(issuer)?" A.LOGIN_ID =? AND":"")});
				logger.info("SQL=>"+sql);
				logger.info("obj=>"+StringUtils.join(obj,","));
				portfolioAmount=this.mytemplate.queryForInt(sql,obj);
				logger.info("Result=>"+portfolioAmount);
			}
		}catch (Exception e){			
			logger.debug("EXCEPTION @ { " + e + " }");
		}
		logger.info("getTRPortfolio() - Exit");
				
		return new int[]{portfolio,portfolioAmount};
	}
	public int[] getTRExisting(String loginId,String productId,String issuer,String openCoverNo,String schemeId)
	{
		logger.info("getTRExisting() - Enter");
		int existing =0;
		int existingAmpont =0;
		Object[] obj=null;
		try{
			if("3".equals(productId) || "11".equals(productId)){
				sql=getQuery(DBConstants.REPORT_QUOTEREGISTER_CHART_EXISTING,new Object[]{(StringUtils.isBlank(issuer)?" A.LOGIN_ID =? AND":"")});
				logger.info("Query=>" + sql);
				if(StringUtils.isBlank(issuer)) {
				obj=new Object[]{loginId,productId,(StringUtils.isBlank(issuer)?"1":issuer),openCoverNo};
				}else {
					obj=new Object[]{productId,(StringUtils.isBlank(issuer)?"1":issuer),openCoverNo};
				}
				logger.info("obj[]=>"+StringUtils.join(obj,","));
				existing=this.mytemplate.queryForInt(sql,obj);
				logger.info("Result=>" + existing);
				sql=getQuery(DBConstants.REPORT_CHART_EXISTING_AMOUNT,new Object[]{(StringUtils.isBlank(issuer)?" A.LOGIN_ID =? AND":"")});
				logger.info("Query=>" + sql);
				logger.info("obj[]=>"+StringUtils.join(obj,","));
				existingAmpont=this.mytemplate.queryForInt(sql,obj);
				logger.info("Result=>" + existingAmpont);
			}else
			{
				sql=getQuery(DBConstants.TRAVEL_QUOTEREGISTER_CHART_EXISTING,new Object[]{(StringUtils.isBlank(issuer)?" A.LOGIN_ID =? AND":"")});
				logger.info("Query=>" + sql);
				if(StringUtils.isBlank(issuer)) {
				obj=new Object[]{loginId,productId,(StringUtils.isBlank(issuer)?"1":issuer)};
				}else{
					obj=new Object[]{productId,(StringUtils.isBlank(issuer)?"1":issuer)};	
				}
				logger.info("obj[]=>"+StringUtils.join(obj,","));
				existing=this.mytemplate.queryForInt(sql,obj);
				logger.info("Result=>" + existing);
				sql=getQuery(DBConstants.TRAVEL_QUOTEREGISTER_CHART_EXISTING_AMOUNT,new Object[]{(StringUtils.isBlank(issuer)?" A.LOGIN_ID =? AND":"")});
				logger.info("Query=>" + sql);
				logger.info("obj[]=>"+StringUtils.join(obj,","));
				existingAmpont=this.mytemplate.queryForInt(sql,obj);
				logger.info("Result=>" + existingAmpont);
			}

		}catch (Exception e){			
			logger.debug("EXCEPTION @ { " + e + " }");
		}
		logger.info("getTRExisting() - Exit");
				
		return new int[]{existing,existingAmpont};
	}
	public int[] getTRUnapproved(String loginId,String productId,String issuer,String openCoverNo,String schemeId)
	{
		logger.info("getTRUnapproved() - Enter");
		int unapproved =0;
		int unapprovedAmount =0;
		String[] obj=null;
		try{
			if("3".equals(productId) || "11".equals(productId)){
				sql=getQuery(DBConstants.REPORT_REFERRAL_CHART_UNAPPROVED,new Object[]{(StringUtils.isBlank(issuer)?" A.LOGIN_ID =? AND":"")});
				if(StringUtils.isBlank(issuer)) {
				obj=new String[]{loginId,productId,(StringUtils.isBlank(issuer)?"1":issuer),openCoverNo};
				}else {
					obj=new String[]{productId,(StringUtils.isBlank(issuer)?"1":issuer),openCoverNo};
				}
				logger.info("Query=>" + sql);
				logger.info("Args[]=>" + StringUtils.join(obj,","));
				unapproved=this.mytemplate.queryForInt(sql,obj);
				logger.info("Result=>" + unapproved);
				sql=getQuery(DBConstants.REPORT_REFERRAL_CHART_UNAPPROVED_AMOUNT,new Object[]{(StringUtils.isBlank(issuer)?" A.LOGIN_ID =? AND":"")});
				logger.info("Query=>" + sql);
				logger.info("Args[]=>" + StringUtils.join(obj,","));
				unapprovedAmount=this.mytemplate.queryForInt(sql,obj);
				logger.info("Result=>" + unapprovedAmount);
			}else
			{
				sql=getQuery(DBConstants.TRAVEL_REPORT_REFERRAL_CHART_UNAPPROVED,new Object[]{(StringUtils.isBlank(issuer)?" A.LOGIN_ID =? AND":"")});
				logger.info("Query=>" + sql);
				if(StringUtils.isBlank(issuer)) {
				obj=new String[]{loginId,productId,(StringUtils.isBlank(issuer)?"1":issuer)};
				}else {
					obj=new String[]{productId,(StringUtils.isBlank(issuer)?"1":issuer)};
				}
				logger.info("Args[]=>" + StringUtils.join(obj,","));
				unapproved=this.mytemplate.queryForInt(sql,obj);
				logger.info("Result=>" + unapproved);
				sql=getQuery(DBConstants.TRAVEL_REPORT_REFERRAL_CHART_UNAPPROVED_AMOUNT,new Object[]{(StringUtils.isBlank(issuer)?" A.LOGIN_ID =? AND":"")});
				logger.info("Query=>" + sql);
				logger.info("Args[]=>" + StringUtils.join(obj,","));
				unapprovedAmount=this.mytemplate.queryForInt(sql,obj);
				logger.info("Result=>" + unapprovedAmount);
			}
		}catch (Exception e){			
			logger.debug("EXCEPTION @ { " + e + " }");
		}
		int[] trUnapproved={unapproved,unapprovedAmount};
		logger.info("Query===>" + sql);	
		logger.info("getTRUnapproved() - Exit");
				
		return trUnapproved;
	}
	public int[] getTRApproved(String loginId,String productId,String issuer,String openCoverNo,String schemeId)
	{
		logger.info("getTRApproved() - Enter");
		int approved =0;
		int approvedAmount =0;
		String[] obj=null;
		try{
			if("3".equals(productId) || "11".equals(productId)){
				sql=getQuery(DBConstants.REPORT_REFERRAL_CHART_APPROVED,new Object[]{(StringUtils.isBlank(issuer)?" A.LOGIN_ID =? AND":"")});
				if(StringUtils.isBlank(issuer)) {
				obj=new String[]{loginId,productId,(StringUtils.isBlank(issuer)?"1":issuer),openCoverNo};
				}else {
					obj=new String[]{productId,(StringUtils.isBlank(issuer)?"1":issuer),openCoverNo};
				}
				logger.info("Query=>" + sql);
				logger.info("Args[]=>" + StringUtils.join(obj,","));
				approved=this.mytemplate.queryForInt(sql,obj);
				logger.info("Result=>" + approved);
				sql=getQuery(DBConstants.REPORT_REFERRAL_CHART_APPROVED_AMOUNT,new Object[]{(StringUtils.isBlank(issuer)?" A.LOGIN_ID =? AND":"")});
				logger.info("Query=>" + sql);
				logger.info("Args[]=>" + StringUtils.join(obj,","));
				approvedAmount=this.mytemplate.queryForInt(sql,obj);
				logger.info("Result=>" + approvedAmount);
			}else
			{
				sql=getQuery(DBConstants.TRAVEL_REPORT_REFERRAL_CHART_APPROVED,new Object[]{(StringUtils.isBlank(issuer)?" A.LOGIN_ID =? AND":"")});
				if(StringUtils.isBlank(issuer)) {
				obj=new String[]{loginId,productId,(StringUtils.isBlank(issuer)?"1":issuer)};
				}else {
					obj=new String[]{productId,(StringUtils.isBlank(issuer)?"1":issuer)};	
				}
				logger.info("Query=>" + sql);
				approved=this.mytemplate.queryForInt(sql,obj);
				logger.info("Result=>" + approved);
				sql=getQuery(DBConstants.TRAVEL_REPORT_REFERRAL_CHART_APPROVED_AMOUNT,new Object[]{(StringUtils.isBlank(issuer)?" A.LOGIN_ID =? AND":"")});
				logger.info("Query=>" + sql);
				logger.info("Args[]=>" + StringUtils.join(obj,","));
				approvedAmount=this.mytemplate.queryForInt(sql,obj);
				logger.info("Result=>" + approvedAmount);
			}
		}catch (Exception e){			
			logger.debug("EXCEPTION @ { " + e + " }");
		}
		int[] trApproved={approved,approvedAmount};
		logger.info("getTRApproved() - Exit");
				
		return trApproved;
	}
	public int[] getTRReject(String loginId,String productId,String issuer,String openCoverNo,String schemeId)
	{
		logger.info("getTRReject() - Enter");
		int reject =0;
		int rejectAmount =0;
		String[] obj=null;
		try{
			if("3".equals(productId) || "11".equals(productId)){
				if(StringUtils.isBlank(issuer)) {
					obj=new String[]{loginId,productId,(StringUtils.isBlank(issuer)?"1":issuer),openCoverNo};
				}else {
				obj=new String[]{productId,(StringUtils.isBlank(issuer)?"1":issuer),openCoverNo};
				}
				sql=getQuery(DBConstants.REPORT_REFERRAL_CHART_REJECT,new Object[]{(StringUtils.isBlank(issuer)?" A.LOGIN_ID =? AND":"")});
				logger.info("Query=>" + sql);
				logger.info("Args[]=>" + StringUtils.join(obj,","));
				reject=this.mytemplate.queryForInt(sql,obj);
				logger.info("Result=>" + reject);
				sql=getQuery(DBConstants.REPORT_REFERRAL_CHART_REJECT_AMOUNT,new Object[]{(StringUtils.isBlank(issuer)?" A.LOGIN_ID =? AND":"")});
				logger.info("Query=>" + sql);
				logger.info("Args[]=>" + StringUtils.join(obj,","));
				rejectAmount=this.mytemplate.queryForInt(sql,obj);
				logger.info("Result=>" + rejectAmount);
			}else{
				sql=getQuery(DBConstants.TRAVEL_REPORT_REFERRAL_CHART_REJECT,new Object[]{(StringUtils.isBlank(issuer)?" A.LOGIN_ID =? AND":"")});
				if(StringUtils.isBlank(issuer)) {
				obj=new String[]{loginId,productId,(StringUtils.isBlank(issuer)?"1":issuer)};
				}else {
					obj=new String[]{productId,(StringUtils.isBlank(issuer)?"1":issuer)};
				}
				logger.info("Query=>" + sql);
				logger.info("Args[]=>" + StringUtils.join(obj,","));
				reject=this.mytemplate.queryForInt(sql,obj);
				logger.info("Result=>" + reject);
				sql=getQuery(DBConstants.TRAVEL_REPORT_REFERRAL_CHART_REJECT_AMOUNT,new Object[]{(StringUtils.isBlank(issuer)?" A.LOGIN_ID =? AND":"")});
				logger.info("Query=>" + sql);
				logger.info("Args[]=>" + StringUtils.join(obj,","));
				rejectAmount=this.mytemplate.queryForInt(sql,obj);
				logger.info("Result=>" + rejectAmount);
			}
		}catch (Exception e){			
			logger.debug("EXCEPTION @ { " + e + " }");
		}
		int[] trReject={reject, rejectAmount};
		logger.info("getTRReject() - Exit");
				
		return trReject;
	}
	public int[] getTRLapsed(String loginId,String productId,String issuer,String openCoverNo,String schemeId)
	{
		logger.info("getTRLapsed() - Enter");
		int lapsed =0;
		int lapsedAmount =0;
		Object[] obj=null;
		try{
			if("3".equals(productId) || "11".equals(productId)){
				sql=getQuery(DBConstants.REPORT_CHART_QUOTEREGISTER_LAPSED,new Object[]{(StringUtils.isBlank(issuer)?" A.LOGIN_ID =? AND":"")});
				logger.info("Query=>" + sql);
				if(StringUtils.isBlank(issuer)) {
				obj=new Object[]{loginId,productId,(StringUtils.isBlank(issuer)?"1":issuer),openCoverNo};
				}else {
					obj=new Object[]{productId,(StringUtils.isBlank(issuer)?"1":issuer),openCoverNo};	
				}
				logger.info("obj=>" + StringUtils.join(obj,","));
				lapsed=this.mytemplate.queryForInt(sql,obj);
				logger.info("Result=>" + lapsed);
				sql=getQuery(DBConstants.REPORT_CHART_QUOTEREGISTER_LAPSED_AMOUNT,new Object[]{(StringUtils.isBlank(issuer)?" A.LOGIN_ID =? AND":"")});
				logger.info("Query=>" + sql);
				logger.info("obj=>" + StringUtils.join(obj,","));
				lapsedAmount=this.mytemplate.queryForInt(sql,obj);
				logger.info("Result=>" + lapsedAmount);
			}else
			{
				sql=getQuery(DBConstants.TRAVEL_REPORT_CHART_QUOTEREGISTER_LAPSED,new Object[]{(StringUtils.isBlank(issuer)?" A.LOGIN_ID =? AND":"")});
				if(StringUtils.isBlank(issuer)) {
				obj=new Object[]{loginId,productId,(StringUtils.isBlank(issuer)?"1":issuer)};
				}else {
					obj=new Object[]{productId,(StringUtils.isBlank(issuer)?"1":issuer)};	
				}
				logger.info("Query=>" + sql);
				logger.info("obj=>" + StringUtils.join(obj,","));
				lapsed=this.mytemplate.queryForInt(sql,obj);
				logger.info("Result=>" + lapsed);
				sql=getQuery(DBConstants.TRAVEL_REPORT_CHART_QUOTEREGISTER_LAPSED_AMOUNT,new Object[]{(StringUtils.isBlank(issuer)?" A.LOGIN_ID =? AND":"")});
				logger.info("Query=>" + sql);
				logger.info("obj=>" + StringUtils.join(obj,","));
				lapsedAmount=this.mytemplate.queryForInt(sql,obj);
				logger.info("Result=>" + lapsedAmount);
			}
		}catch (Exception e){
			logger.debug("EXCEPTION @ { " + e + " }");
		}
		logger.info("getTRLapsed() - Exit");
		
		return new int[]{lapsed,lapsedAmount};
	}
	public List getSingleInfo(String option, String[] args) {
		logger.info("getSingleInfo - Enter || "+option+" args: "+ StringUtils.join(args, ","));
		List result=null;					
		try{
			sql=getQuery(option);
			result=this.mytemplate.queryForList(sql,args);			
		}
		catch (Exception e) {			
			logger.debug("EXCEPTION @ { " + e + " }");
		}		
		logger.info("Query==>" + sql);
		logger.info("getSingleInfo() - Exit " );
				
		return result;
	}

	public String getEndtQuoteNo(String quoteNo) {
		logger.info("getEndtQuoteNo - Enter || "+quoteNo);
		String endtQuoteNo="";					
		try{
			sql=getQuery("GET_ENDT_QUOTENO");
			logger.info("Query==>" + sql);
			List list= this.mytemplate.queryForList(sql,new Object[]{quoteNo});
			if(list!=null && list.size()>0){
				Map map=(Map)list.get(0);
				endtQuoteNo=map.get("QUOTE_NO")==null?"":map.get("QUOTE_NO").toString();
			}
			if (StringUtils.isBlank(endtQuoteNo))
				endtQuoteNo=quoteNo;
		}
		catch (Exception e) {			
			logger.debug("EXCEPTION @ { " + e + " }");
		}	
		return endtQuoteNo;
	}

	public Map<String ,Object> getQuoteInfo(String quoteNo) {
		logger.info("getQuoteInfo - Enter || "+quoteNo);
		Map<String ,Object> quoteInfo=null;
		try{
			sql="select REFERENCE_NUMBER, application_no from webservice_marine_quote where quote_no=?";
			logger.info("Query==>" + sql);
			quoteInfo= this.mytemplate.queryForMap(sql,new Object[]{quoteNo});
		}
		catch (Exception e) {			
			logger.debug("EXCEPTION @ { " + e + " }");
		}	
		return quoteInfo;
	}

	public void getUpdateEndtStatus(String quoteNo , String cancelRemarks, String effectiveDate) {
		logger.info("getUpdateEndtStatus - Enter || "+quoteNo);
		try{
			String sql="UPDATE POSITION_MASTER SET STATUS='D', PDF_PRE_SHOW_STATUS='YES',CANCEL_REMARKS=? ,POLICY_EFFECTIVE_DATE=CONVERT(DATE,?,103)  WHERE QUOTE_NO=?";
			logger.info("Query==>" + sql);
			this.mytemplate.update(sql,new Object[]{cancelRemarks,effectiveDate ,quoteNo});
			///sql = "UPDATE  POSITION_MASTER SET STATUS='D', PDF_BROKER_STATUS='999' WHERE POLICY_NO LIKE (SELECT SUBSTR(POLICY_NO,1,instr(POLICY_NO,'-',-1)-1) FROM POSITION_MASTER WHERE QUOTE_NO=?) ||'%'";
			sql = getQuery("getUpdateEndtStatus");
			logger.info("Query==>" + sql);
			this.mytemplate.update(sql,new Object[]{quoteNo});
		}
		catch (Exception e) {
			logger.debug("EXCEPTION @ { " + e + " }");
		}
	}
	public List getLcUploadDetails(String policyNo) {
		logger.info("getLcUploadDetails - Enter");
		List result=null;					
		try{
			sql=getQuery("GET_LC_UPLOAD_DETAILS");
			result=this.mytemplate.queryForList(sql,new Object[]{policyNo});			
		}
		catch (Exception e) {			
			logger.debug("EXCEPTION @ { " + e + " }");
		}		
		logger.info("Query==>" + sql);
		logger.info("getLcUploadDetails() - Exit || Result: "+result.size() );
				
		return result;
	}
	public List getLcUploadPolicy(String policyNo) {
		logger.info("getLcUploadPolicy - Enter");
		List result=null;					
		try{
			sql=getQuery("GET_LC_UPLOAD_POLICY_DTLS");
			result=this.mytemplate.queryForList(sql,new Object[]{policyNo});			
		}
		catch (Exception e) {			
			logger.debug("EXCEPTION @ { " + e + " }");
		}		
		logger.info("Query==>" + sql);
		logger.info("getLcUploadPolicy() - Exit || Result: "+result.size() );
				
		return result;
	}
	public List getLcUploadPloDtls(String policyNo) {
		logger.info("getLcUpoladPolDtls - Enter");
		List result=null;					
		try{
			sql=getQuery("GET_LC_UPLOAD_POL_DTLS");
			result=this.mytemplate.queryForList(sql,new Object[]{policyNo});			
		}
		catch (Exception e) {			
			logger.debug("EXCEPTION @ { " + e + " }");
		}		
		logger.info("Query==>" + sql);
		logger.info("getLcUploadPolDtls() - Exit || Result: "+result.size() );
				
		return result;
	}
	public void insertLcFileDtls(String policyNo,String loginId,List<String> uploadFileName,File fileToCreate,List<String> lcdocremarks,String lcFilePath,List<File> upload){
		logger.info("getUpdateEndtStatus - Enter || ");
		try{
			sql=getQuery("LC_FILE_INSERT");
			logger.info("Query==>" + sql);
			Tika tika = new Tika();
			for(int i=0;i<uploadFileName.size();i++){
				String  lcUploadId="";
				if(getSource().equalsIgnoreCase("ORACLE")){
				Map uploadId = this.mytemplate.queryForMap("select LC_FILE_UPLOAD_SEQ.nextval uploadid from dual");
				 lcUploadId = uploadId.get("uploadid")==null?"":uploadId.get("uploadid").toString();
				}else{
				//Map uploadId = this.mytemplate.queryForMap("select LC_FILE_UPLOAD_SEQ.nextval uploadid from dual");	
					 lcUploadId =(String)this.mytemplate.queryForObject("SELECT NEXT VALUE FOR LC_FILE_UPLOAD_SEQ", String.class); 

				}
				fileToCreate = new File(lcFilePath+lcUploadId+"."+FilenameUtils.getExtension(uploadFileName.get(i)));
				FileUtils.copyFile(upload.get(i), fileToCreate);
				
				
			    String mediaType = tika.detect(new FileInputStream(fileToCreate));
				/*TikaConfig tika =null;

			 
					
				tika= new TikaConfig(fileToCreate);
				   Metadata metadata = new Metadata();
				   metadata.set(Metadata.RESOURCE_NAME_KEY, fileToCreate.toString());
				    MediaType detect = tika.getMimeRepository().detect(new FileInputStream(fileToCreate), metadata);*/
				   System.out.println("File "  + " is " +mediaType);
				   //if(!("image/jpeg".equals(mediaType) || "application/pdf".equals(mediaType)))					   
					   this.mytemplate.update(sql,new Object[]{policyNo,fileToCreate.getName(),loginId,uploadFileName.get(i),lcdocremarks.get(i),"Y",lcUploadId});
			}

		}
		catch (Exception e) {
			logger.debug("EXCEPTION @ { " + e + " }");
			e.printStackTrace();
		}
	}
	public List<Object> getLcFileList(String policyNo)	
	{
		logger.info("getLcFileList() - Enter || endtType: ");
		List<Object> info=new ArrayList<Object>();;			
		try{
			//policyNo = "01/3112/327/2015/2231";
			sql=getQuery("GET_LC_FILE_LIST");
			info=(List<Object>)this.mytemplate.queryForList(sql,new Object[]{policyNo});
		}catch (Exception e){			
			logger.debug("EXCEPTION @ { " + e + " }");
		}		
		logger.info("Query===>" + sql);	
		logger.info("getLcFileList() - Exit || Result: " + info.size());
				
		return info;
	}
	public void deleteLcFile(String policyNo,String uploadId){
		logger.info("getUpdateEndtStatus - Enter || ");
		try{
			//policyNo = "01/3112/327/2015/2231";
			sql=getQuery("LC_FILE_DELETE");
			logger.info("Query==>" + sql);
			this.mytemplate.update(sql,new Object[]{uploadId.trim()});
		}
		catch (Exception e) {
			logger.debug("EXCEPTION @ { " + e + " }");
		}
	}
	public List<Object> getAllDocuments(String policyNo) {
		List<Object> list=null;
		try{
			String[] policyNumber = policyNo.split("-");
			policyNo = policyNumber[0];
			String query=getQuery("GET_DOCUMENTS_LIST");
			list=this.mytemplate.queryForList(query,new Object[]{policyNo});
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}


	public String getCancalRemarks(String quoteNo) {		
		/*String result="";
		try{
			String query =  getQuery("GET_CANCEL_REMARKS");
			logger.info("Query==>" + query);
			  Map<String,Object> map =(Map<String,Object>) this.mytemplate.queryForList(query,new Object[]{quoteNo}).get(0);
			  result= map.get("ENDT_REMARKS")==null?"":map.get("ENDT_REMARKS").toString();
		}catch (Exception e) {
			e.printStackTrace();
		}*/
		return api.getCancalRemarks(quoteNo);
	}


	public void updateEndtStatus(String quoteNo, String cancelRemarks) {
		logger.info("updateEndtStatus - Enter || "+quoteNo);
		try{
			String sql="UPDATE POSITION_MASTER SET ENDT_REMARKS=?  WHERE QUOTE_NO=?";
			logger.info("Query==>" + sql);
			this.mytemplate.update(sql,new Object[]{cancelRemarks, quoteNo});			 
		}
		catch (Exception e) {
			logger.debug("EXCEPTION @ { " + e + " }");
		}
	}
	public List<Map<String, Object>> getBulkPrintOPList(ReportBean bean, String productId, String reqFrom, String userType, String branchCode, String appId, String loginId) {
		List<Map<String,Object>> result=new ArrayList<Map<String,Object>>();
		try{
			String query="";
			Object args[] = null;
			if("BOL".equalsIgnoreCase(reqFrom)){
				if("3".equalsIgnoreCase(productId)){
					query=getQuery("GET_OP_BP_COUNT");
				}else{
					query=getQuery("GET_OP_OPEN_BP_COUNT");
				}
			args=new Object[]{bean.getMode(),bean.getStartDate(),bean.getEndDate(),productId,userType,branchCode,""};
			//type startdate enddate product OpencoverNo usertype branch application login 
			}
			else if("BBL".equalsIgnoreCase(reqFrom)){
					if("3".equalsIgnoreCase(productId)){
						query=getQuery("GET_BR_BP_LIST");
					}else{
						query=getQuery("GET_BR_OPEN_BP_LIST");
					}
				args=new Object[]{bean.getMode(),bean.getStartDate(),bean.getEndDate(),productId,userType,branchCode,appId,""};
			}
			else if("BBDL".equalsIgnoreCase(reqFrom)){
				if("3".equalsIgnoreCase(productId)){
					query=getQuery("GET_BR_BP_LIST");
				}else{
					query=getQuery("ET_BR_OP_OPEN_BP_LIST");
				}
				args=new Object[]{bean.getMode(),bean.getStartDate(),bean.getEndDate(),productId,userType,branchCode,appId,loginId};
			}
			removeNull(args);
			logger.info("Query===>" + StringUtils.join(args, ","));
			logger.info("Arguments===>" + query);	
			result=this.mytemplate.queryForList(query,args);
			logger.info("getBulkPrintOPList() - Exit || Result: " + result.size());
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

public String getOPUserName(String adminLoginId) {
		String result="";
		try{
		String query = "";
		query = getQuery("GET_OP_USERNAME");
		logger.info("Query==>" + query);
		result = (String) this.mytemplate.queryForObject(query,new Object[]{adminLoginId},String.class);
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


public String getCancelReissue(String  quoteNo) {

	logger.info("getCancelReissue - Enter");
	String result="";
	Object[] obj=new Object[0];
	try{
		if(true){
		String sql=getQuery("GET_QUOTE_COUNT");
		obj=new Object[1];
		obj[0]=quoteNo;
		int count=this.mytemplate.queryForInt(sql,obj);	
			if(count>0)
			{
				result="cancel";
			}else{
				logger.info("Enter into NO CANCEL::");
				result="nocancel";
			}
		}
		
	}catch(Exception e){
		logger.debug(e);
	}
	logger.info("getCancelReissue - Exit ");
	return result;
}


public boolean getVatStatus(String policyNo,String pvType) {

	logger.info("getVatStatus - Enter");
	boolean	 result=false;
	Object[] obj=new Object[0];
	try{
		String sql="";
		obj=new Object[1];
		obj[0]=policyNo;
		int count=0;
		if("Opencover".equalsIgnoreCase(pvType)){
			sql=getQuery("GET_VAT_STATUS_OC");
			count=this.mytemplate.queryForInt(sql,obj);	
		}else if("hauler".equalsIgnoreCase(pvType)){
			
			sql=getQuery("GET_VAT_STATUS_HAU");
			count=this.mytemplate.queryForInt(sql,obj);	
		}else{
		
			sql=getQuery("GET_VAT_STATUS_PM");
			count=this.mytemplate.queryForInt(sql,obj);	
			if(count==0)
			{
				sql=getQuery("GET_VAT_STATUS_HPM");
				count=this.mytemplate.queryForInt(sql,obj);	
			}
			
			if(count==0)
			{
				sql=getQuery("GET_VAT_STATUS_HPM");
				count=this.mytemplate.queryForInt(sql,obj);	
			}
		}
		if(count>0)
		{
			result=true;
		}else{
			result=false;
		}

	}catch(Exception e){
		logger.debug(e);
	}
	logger.info("getVatStatus - Exit ");
	return result;
}


public void getBulkReportList(ReportBean bean, String branchCode, String adminLoginId, String productId) {
	api.getBulkReportList(bean, branchCode, adminLoginId,productId);
}


public void getShipDetails(ReportBean bean, String userType, String loginId, String issuer, String type) {
	 api.getShipDetails( bean,  userType,  loginId, issuer, type);
}


public void getShipTrackDetails(ReportBean bean) {
	api.getShipTrackDetails(bean);
	
}


public List<Object> getOpenCoverLapsedList(ReportBean bean, String userType, String loginId, String issuer) {
	return api.getOpenCoverLapsedList(bean,  userType,  loginId,  issuer);
}


public List<Object> getOpenCoverBrokerList(ReportBean bean, String productId, String adminLoginId, String branchCode) {
	return api.getOpenCoverBrokerList(bean,productId,adminLoginId,branchCode);
}


public List<Object> getOpenCoverCreatedList(ReportBean bean, String userType, String adminLoginId, String issuer,String branchCode) {
	return api.getOpenCoverCreatedList( bean,  userType,  adminLoginId,  issuer, branchCode);
}


public List<Object> getOpenCoverEndorseList(ReportBean bean, String userType, String adminLoginId, String issuer,String branchCode) {
	return api.getOpenCoverEndorseList( bean,  userType,  adminLoginId,  issuer, branchCode);
}


public List<Map<String, Object>> dashboardCharts(String key, String productId, String userType, String issuer,String loginId, String branch, String openCoverNo) {
	return api.dashboardCharts( key,  productId,  userType,  issuer, loginId,  branch,openCoverNo);
	
}


public List<Map<String,Object>> dashboardTopBroker(String productId, String loginId, String userType, String branch, String opencoverno) {
		return api.dashboardTopBroker( productId,  loginId,  userType,  branch,opencoverno);
	
}

public List<Map<String,Object>> dashboardTopReferrals(String productId, String loginId, String userType, String branch, String opencoverno) {
	return api.dashboardTopReferrals( productId,  loginId,  userType,  branch,opencoverno);
}


public List<Map<String, Object>> dashboardTopCustomer(String productId, String loginId, String userType,String branch, String opencoverno) {
	return api.dashboardTopCustomer( productId,  loginId,  userType,  branch,opencoverno);
	
}


public String schedulePdf(String applicationNo, String branchCode) {
	return api.schedulePdf( applicationNo,  branchCode);
}


public String debitcreditpdf(String policyNo, String docType) {
	return api.debitcreditpdf( policyNo,  docType);
}


public String endtSchedule(String applicationNo, String branchCode, String policyNo, String belongingBranch) {
	return api.endtSchedule( applicationNo,  branchCode,  policyNo,  belongingBranch);
}


public String clasuesPDF(String applicationNo, String belongingBranch) {
	return api.clasuesPDF(applicationNo, belongingBranch);
}


public List<Map<String,Object>> getBasicEndtInfo(String policyNo) {
	return api.getBasicEndtInfo( policyNo);
}


public String vehiclePDF(String policyNo, String belongingBranch) {
	return api.vehiclePDF( policyNo,  belongingBranch);
}


public String PolicyReportdownload(String policyStartDate, String policyEndDate, String issuer, String downloadType,
		String loginId, String openCoverNo, String branchCode, String productId) {
	return api.PolicyReportdownload(policyStartDate, policyEndDate, issuer, downloadType,loginId, openCoverNo,branchCode,productId);
}


public String declarePDF(String policyNo, String belongingBranch) {
	return api.declarePDF( policyNo,  belongingBranch);
}


public String portalPDF(String quoteNo, String belongingBranch) {
	return api.portalPDF( quoteNo,  belongingBranch);
}



}