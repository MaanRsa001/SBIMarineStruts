package com.maan.adminnew.portfolio;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.Logger;

import com.maan.adminnew.common.CommonAPI;
import com.maan.common.DBConstants;
import com.maan.common.LogUtil;
import com.maan.common.MyJdbcTemplate;

public class PortfolioDAO extends MyJdbcTemplate {
	
	CommonAPI api = new CommonAPI();
	
	final Logger logger = LogUtil.getLogger(PortfolioDAO.class);
	@SuppressWarnings("unchecked")
	public List<Object> getProducts(String branchCode) {
		List<Object> products=null;
		try
		{
			logger.info("Enter getProducts()");
			String query=getQuery("GET_PRODUCTS");
			products=this.mytemplate.queryForList(query,new Object[]{branchCode});
			logger.info("Query==>"+query);
			logger.info("Exit from getProducts()");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return products;
	}
	
	@SuppressWarnings("unchecked")
	public List<Object> getPortfolioList(Object[] val) {
		List<Object> portfolioList=null;
		try
		{
			logger.info("Enter to getPortfolioList()");
			String query=getQuery("GET_PORTFOLIO_LIST");
			portfolioList=this.mytemplate.queryForList(query,val);
			logger.info("Query==>"+query);
			logger.info("Exit from getPortfolioList()");
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return portfolioList;
	}
    
	public String updatePortfolioPolicyCancelStatus(Object[] val) {
		try
		{
			logger.info("Enter to updatePortfolioPolicyCancelStatus()");
			String query=getQuery(DBConstants.PORTFOLIO_POLICY_CANCEL_UPDATE);
			this.mytemplate.update(query,val);
			logger.info("Query==>"+query);
			logger.info("Exit from updatePortfolioPolicyCancelStatus()");
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return "";
	}
	
	@SuppressWarnings("unchecked")
	public List<Object> getViewlist(Object[] val) {
		List<Object> viewList=null;
		try
		{
			logger.info("Enter to getViewList()");
			String query=getQuery("GET_PORTFOLIO_BY_DATE1");
			logger.info("Query==>"+query);
			logger.info("Args==>"+StringUtils.join(val, ", "));
			viewList=this.mytemplate.queryForList(query,val);
			
			logger.info("Exit from getViewList()");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return viewList;
	}
	public List<Object> getPortFolio(String sdate, String edate, String status,
			String pid, String branchCode, String brokerCodes,
			String freightStatus) // Approved_Policy_PortFoolio.jsp
	{
		
		return api.getPorfolioByDate(sdate , edate,status,pid,branchCode , brokerCodes , freightStatus);
//		List<Object> list=null;
//		String sql = "";
//		String branch="";
//		String product="";
//		try {
//			Object args[]=new Object[4];
//			args[0]=sdate;
//			args[1]=edate;
//			/*String query="select SNO,ENTRY_DATE,COU from table(policy_report(?,?,?,?,?,?))";
//			list=this.mytemplate.queryForList(query, new Object[]{sdate,edate,status,branchCode,rsaBranch,"1".equals(pid)?"ALL":pid});
//			*/
//			if("c".equalsIgnoreCase(status)||"r".equalsIgnoreCase(status)){
//				if("3".equals(pid) || "11".equals(pid))
//					sql=getQuery("GET_PORTFOLIO_BY_DATE1");
//				else 
//					sql=getQuery("GET_MOTORPORTFOLIO_BY_DATE1");
//				if("3".equals(pid) || "11".equals(pid)){
//					product=" ) AND a.product_id IN (3,11) ";
//				}else{
//					product=" ) AND a.product_id IN ("+(("3".equals(pid) || "11".equals(pid))?"3,11":pid)+") ";
//				}
//				String append="";
//				if("3".equals(pid) || "11".equals(pid))
//					append=getQuery("GET_PORTFOLIO_BY_DATE_APPEND1");
//				else
//					append=getQuery("GET_MOTORPORTFOLIO_BY_DATE_APPEND1");
//				sql=sql+branch+product+append;
//				args[2]="y";
//			}else{
//				if("3".equals(pid) || "11".equals(pid))
//					sql=getQuery("GET_PORTFOLIO_BY_DATE2");
//				else
//					sql=getQuery("GET_MOTORPORTFOLIO_BY_DATE2");
//				if("1".equals(pid)){
//					product=" ) AND a.product_id IN (3,11) ";
//					}else{
//						product=" ) AND a.product_id IN ("+(("3".equals(pid) || "11".equals(pid))?"3,11":pid)+") ";
//					}
//				String append="";
//				if("3".equals(pid) || "11".equals(pid))
//					append=getQuery("GET_PORTFOLIO_BY_DATE_APPEND2");
//				else
//					append=getQuery("GET_MOTORPORTFOLIO_BY_DATE_APPEND2");
//					sql=sql+product+append;
//				args[2]=status;
//			}
//			args[3]=branchCode;
//			logger.info("query==>"+sql);
//			logger.info("args==>"+StringUtils.join(args, ", "));
//			list = this.mytemplate.queryForList(sql,args);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return list;
	}
	public List<Object> getPortfolioByDate(String eDate,String status, String pid, String branchCode, String brokerCodes,String freightStatus,String searchBy,String searchValue) // PortFolio_ByDate.jsp BrokerCodes
	{
 		List<Object> list=null;
		try{
			String query="";
			if("30".equals(pid) || "33".equals(pid) || "65".equals(pid)) {
				if("c".equalsIgnoreCase(status)||"r".equalsIgnoreCase(status)) {
					if("33".equals(pid)) 
						query = getQuery("GET_TRAVELPORTFOLIO_QLIST");
					else
						query = getQuery("GET_HOMEPORTFOLIO_QLIST");
					Object[] obj = new Object[6];
					obj[0] = eDate;
					obj[1] = pid;
					obj[2] = pid;
					obj[3] = pid;
					obj[4] = "y";
					obj[5] = branchCode;
					logger.info("query==>"+query);
					logger.info("args==>"+StringUtils.join(obj, ", "));
					list=this.mytemplate.queryForList(query, obj);
				}
				else  {
					if("33".equals(pid)) 
						query = getQuery("GET_TRAVELPORTFOLIO_PLIST");
					else if("65".equals(pid))
						query = getQuery("GET_HOMEPORTFOLIO_PLIST",new Object[]{"n"});
					else
						query = getQuery("GET_HOMEPORTFOLIO_PLIST",new Object[]{status});
					Object[] obj = new Object[6];
					obj[0] = eDate;
					obj[1] = pid;
					obj[2] = pid;
					obj[3] = pid;
					obj[4] = status;
					obj[5] = branchCode;
					logger.info("query==>"+query);
					logger.info("args==>"+StringUtils.join(obj, ", "));
					list=this.mytemplate.queryForList(query, obj);
				}
			}else if("13".equals(pid)){
				query=getQuery("GET_PORFOLIO_LAND_REPORT");
				Object[] obj = new Object[3];
				obj[0] = eDate;
				obj[1] = status;
				obj[2] = branchCode;
				logger.info("query==>"+query);
				logger.info("args==>"+StringUtils.join(obj, ", "));
				list=this.mytemplate.queryForList(query, obj);
			}
			else {
				if(searchBy !=null && !"".equals(searchBy)){
					String param="";				
					query=getQuery("getPortfolioByDate1");
					Object obj[]=new Object[]{"policyNO".equalsIgnoreCase(searchBy)?searchValue:"","customerName".equalsIgnoreCase(searchBy)?searchValue:""};
					logger.info("Portfolio query "+query+" \n args"+StringUtils.join(obj,","));
					list=this.mytemplate.queryForList(query, obj);
				}else{
					query=getQuery("getPortfolioByDate2");					 
					Object obj[]=new Object[]{eDate,"",status,branchCode,"1".equals(pid)?"ALL":pid};
					logger.info("query==>"+query);
					logger.info("args==>"+StringUtils.join(obj, ", "));
					list=this.mytemplate.queryForList(query, obj);
				}
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Object> getPolicyTreatyInfo(PortfolioBean bean) {
		List<Object> list=null;
		try{
			String query="select RI_CODE, RI_CODE_value from position_master where POLICY_NO=?";
			list=this.mytemplate.queryForList(query, new Object[]{bean.getPolNo()});
			if(list!=null && list.size()>0){
				Map map=(Map)list.get(0);
				bean.setRiCode(map.get("RI_CODE")==null?"":map.get("RI_CODE").toString());
				bean.setRiCodeValue(map.get("RI_CODE_VALUE")==null?"":map.get("RI_CODE_VALUE").toString());
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	public int saveTreaty(PortfolioBean bean) {
		int count=0;
		try{
			String query="update position_master set RI_CODE=?, RI_CODE_value=? where POLICY_NO=?";
			count=this.mytemplate.update(query, new Object[]{bean.getRiCode(), bean.getRiCodeValue(), bean.getPolNo()});
		}catch(Exception e){
			e.printStackTrace();
		}
		return count;
	}
	
	public List<Object> facultativeInfo(PortfolioBean bean) {
		List<Object> list=null;
		try{
			String query=getQuery("GET_BASIC_FACULTATIVE_INFO");
			logger.info("query==>"+query);
			logger.info("args==>"+bean.getPolNo());
			list=this.mytemplate.queryForList(query, new Object[]{bean.getPolNo()});
			if(list==null || list.size()<=0){
				bean.setFacultativeList(new ArrayList<Object>());
				bean.setCommodityList(new ArrayList<Object>());
			}else{
				bean.setFacultativeList(list);
				Object str=((Map)list.get(0)).get("APPLICATION_NO");
				if(str!=null && !"".equals(str)){
					query=getQuery("GET_COMMODITYFACULTATTIVE_INFO");
					logger.info("query==>"+query);
					logger.info("args==>"+(((Map)list.get(0)).get("BRANCH_CODE"))+", "+ str);
					list=this.mytemplate.queryForList(query, new Object[]{(((Map)list.get(0)).get("BRANCH_CODE")), str});
					bean.setCommodityList(list);
				}else
					bean.setCommodityList(new ArrayList<Object>());
				
				if(!"Y".equals(bean.getValidYN())){
					query=getQuery("GET_FACULTATIVE_INFO");
					logger.info("query==>"+query);
					logger.info("args==>"+bean.getPolNo());
					list=this.mytemplate.queryForList(query, new Object[]{bean.getPolNo()});
					if(list!=null && list.size()>0){
						Map<String, Object> map=(Map)list.get(0);
						//YEAR, CRT_NO,DATE_VAL, COMPANYRET_PERCENTAGE,COMPANYRET_SUMINSURED, COMPANYRET_CUMSUMINSURED, 
						//COMPANYRET_NETPREMIUM, QUOTESHARE_PERCENTAGE, QUOTESHARE_SUMINSURED, QUOTESHARE_CUMSUMINSURED,
						//QUOTESHARE_NETPREMIUM FIRST_SURPLUS_PRECENTAGE, FIRST_SURPLUS_SUMINSURED, FIRST_SURPLUS_NETPREMIUM,
						//SECOND_SURPLUS_PRECENTAGE,SECOND_SURPLUS_SUMINSURED,SECOND_SURPLUS_CUMSUMINSURED, SECONDT_SURPLUS_NETPREMIUM,
						//FACULTATIVE_PRECENTAGE  FACULTATIVE_SUMINSURED, FACULTATIVE_CUMSUMINSURED, FACULTATIVE_NETPREMIUM
						bean.setYearVal(map.get("YEAR")==null?"":map.get("YEAR").toString());
						bean.setCrt(map.get("CRT_NO")==null?"":map.get("CRT_NO").toString());
						bean.setDateVal(map.get("DATE_VAL")==null?"":map.get("DATE_VAL").toString());
						bean.setCompRetentShare(map.get("COMPANYRET_PERCENTAGE")==null?"":map.get("COMPANYRET_PERCENTAGE").toString());
						bean.setCompRetentSI(map.get("COMPANYRET_SUMINSURED")==null?"":map.get("COMPANYRET_SUMINSURED").toString());
						bean.setCompRetentCumSI(map.get("COMPANYRET_CUMSUMINSURED")==null?"":map.get("COMPANYRET_CUMSUMINSURED").toString());
						bean.setCompRetentNetPrem(map.get("COMPANYRET_NETPREMIUM")==null?"":map.get("COMPANYRET_NETPREMIUM").toString());
						bean.setQuotaShare(map.get("QUOTESHARE_PERCENTAGE")==null?"":map.get("QUOTESHARE_PERCENTAGE").toString());
						bean.setQuotaSI(map.get("QUOTESHARE_SUMINSURED")==null?"":map.get("QUOTESHARE_SUMINSURED").toString());
						bean.setQuotaCumSI(map.get("QUOTESHARE_CUMSUMINSURED")==null?"":map.get("QUOTESHARE_CUMSUMINSURED").toString());
						bean.setQuotaNetPrem(map.get("QUOTESHARE_NETPREMIUM")==null?"":map.get("QUOTESHARE_NETPREMIUM").toString());
						bean.setFsurPlus(map.get("FIRST_SURPLUS_PRECENTAGE")==null?"":map.get("FIRST_SURPLUS_PRECENTAGE").toString());
						bean.setFsurPlusSI(map.get("FIRST_SURPLUS_SUMINSURED")==null?"":map.get("FIRST_SURPLUS_SUMINSURED").toString());
						bean.setFsurPlusCumSI(map.get("FIRST_SURPLUS_CUMSUMINSURED")==null?"":map.get("FIRST_SURPLUS_CUMSUMINSURED").toString());
						bean.setFsurPlusNetPrem(map.get("FIRST_SURPLUS_NETPREMIUM")==null?"":map.get("FIRST_SURPLUS_NETPREMIUM").toString());
						bean.setSsurPlus(map.get("SECOND_SURPLUS_PRECENTAGE")==null?"":map.get("SECOND_SURPLUS_PRECENTAGE").toString());
						bean.setSsurPlusCumSI(map.get("SECOND_SURPLUS_CUMSUMINSURED")==null?"":map.get("SECOND_SURPLUS_CUMSUMINSURED").toString());
						bean.setSsurPlusSI(map.get("SECOND_SURPLUS_SUMINSURED")==null?"":map.get("SECOND_SURPLUS_SUMINSURED").toString());
						bean.setSsurPlusNetPrem(map.get("SECONDT_SURPLUS_NETPREMIUM")==null?"":map.get("SECONDT_SURPLUS_NETPREMIUM").toString());
						bean.setFaculativeSI(map.get("FACULTATIVE_SUMINSURED")==null?"":map.get("FACULTATIVE_SUMINSURED").toString());
						bean.setFaculativeCumSI(map.get("FACULTATIVE_CUMSUMINSURED")==null?"":map.get("FACULTATIVE_CUMSUMINSURED").toString());
						bean.setFaculativeNetPrem(map.get("FACULTATIVE_NETPREMIUM")==null?"":map.get("FACULTATIVE_NETPREMIUM").toString());
						bean.setIssuingDate(map.get("ISSUING_DATE")==null?"":map.get("ISSUING_DATE").toString());
						bean.setInceptionDate(map.get("INCEPTION_DATE")==null?"":map.get("INCEPTION_DATE").toString());
					}
					query=getQuery("GET_RI_DETAILS");
					logger.info("query==>"+query);
					logger.info("args==>"+bean.getPolNo());
					list=this.mytemplate.queryForList(query, new Object[]{bean.getPolNo()});
					if(list!=null && list.size()>0){
						 List<String> riInsCode1=new ArrayList<String>();
						 List<String> riInsName1=new ArrayList<String>();
						 List<String> riInsCommRate1=new ArrayList<String>();
						 List<String> riInsShare1=new ArrayList<String>();
						 List<String> riInsSI1=new ArrayList<String>();
						 List<String> riInsNetPrem1=new ArrayList<String>();
						 List<String> riInsCommission1=new ArrayList<String>();
						 List<String> riInsTax1=new ArrayList<String>();
						 List<String> riInsFixedStamp1=new ArrayList<String>();
						 List<String> riInsSlipAmt1=new ArrayList<String>();
						for(int i=0; i<list.size(); i++){
							Map<String, Object> map=(Map)list.get(i);
							riInsCode1.add(map.get("CODE")==null?"":map.get("CODE").toString());
							riInsName1.add(map.get("RI_NAME")==null?"":map.get("RI_NAME").toString());
							riInsCommRate1.add(map.get("COMISSION_RATE")==null?"":map.get("COMISSION_RATE").toString());
							riInsShare1.add(map.get("SHARE_PERCNT")==null?"":map.get("SHARE_PERCNT").toString());
							riInsSI1.add(map.get("SUM_INSURED")==null?"":map.get("SUM_INSURED").toString());
							riInsNetPrem1.add(map.get("NET_PREMIUM")==null?"":map.get("NET_PREMIUM").toString());
							riInsCommission1.add(map.get("COMISSION")==null?"":map.get("COMISSION").toString());
							riInsTax1.add(map.get("TAX")==null?"":map.get("TAX").toString());
							riInsFixedStamp1.add(map.get("FIXED_STAMP")==null?"":map.get("FIXED_STAMP").toString());
							riInsSlipAmt1.add(map.get("SLIP_AMOUNT")==null?"":map.get("SLIP_AMOUNT").toString());
						}
						bean.setRiInsCode(riInsCode1);
						bean.setRiInsName(riInsName1);
						bean.setRiInsCommRate(riInsCommRate1);
						bean.setRiInsShare(riInsShare1);
						bean.setRiInsSI(riInsSI1);
						bean.setRiInsNetPrem(riInsNetPrem1);
						bean.setRiInsCommission(riInsCommission1);
						bean.setRiInsTax(riInsTax1);
						bean.setRiInsFixedStamp(riInsFixedStamp1);
						bean.setRiInsSlipAmt(riInsSlipAmt1);
					}
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	public List<Object> getRiList() {
		List<Object> list=null;
		try{
			String query=getQuery("GET_RI_LIST");
			list=this.mytemplate.queryForList(query);
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
	}
	
	public int insertFacultativeinfo(PortfolioBean bean) {
		int count=0;
		Object obj[];
		try{
			String amendId=this.mytemplate.queryForObject("Select nvl(max(amend_id)+1,0) from REINSURER_DETAILS where quote_no=?", new Object[]{bean.getQuoteno()}, String.class).toString();
			String query=getQuery("INS_RI_DETAILS");
			logger.info("Query==>"+query);
			for(int i=0; i<bean.getRiInsCode().size(); i++){
				obj=new Object[]{bean.getQuoteno(), bean.getPolNo(), amendId, bean.getRiInsCode().get(i), bean.getRiInsShare().get(i), bean.getRiInsSI().get(i), bean.getRiInsNetPrem().get(i),
								bean.getRiInsCommRate().get(i), bean.getRiInsCommission().get(i), bean.getRiInsTax().get(i), bean.getRiInsFixedStamp().get(i), bean.getRiInsSlipAmt()==null?"0":bean.getRiInsSlipAmt().get(i)};
				logger.info("Args==>"+StringUtils.join(obj, ", "));
				this.mytemplate.update(query, obj);
			}

			query=getQuery("INS_FACULTATIVE_DETAILS");
			obj=new Object[]{bean.getQuoteno(), bean.getPolNo(),amendId, bean.getYearVal(), bean.getCrt(), bean.getDateVal(), bean.getCompRetentShare(), bean.getCompRetentSI(), bean.getCompRetentCumSI(),
					bean.getCompRetentNetPrem(),bean.getQuotaShare(), bean.getQuotaSI(), bean.getQuotaCumSI(), bean.getQuotaNetPrem(),bean.getFsurPlus(),bean.getFsurPlusSI(), bean.getFsurPlusCumSI(), bean.getFsurPlusNetPrem(),
					bean.getSsurPlus(), bean.getSsurPlusSI(), bean.getSsurPlusCumSI(), bean.getSsurPlusNetPrem(), "0", "0", "0", bean.getIssuingDate(), bean.getInceptionDate()};
			logger.info("Query==>"+query);
			logger.info("Args==>"+StringUtils.join(obj, ", "));
			this.mytemplate.update(query, obj);
		}catch(Exception e){
			e.printStackTrace();
		}
		return count;
	}
	
	public String getbranchWiseCountry(String branchCode) {
		 logger.info("getbranchWiseCountry - Enter: branchCode: "+branchCode);
		 String result="";
		 try{
			 String query=getQuery(DBConstants.BRANCH_WISE_COUNTRY);
			 result=(String)this.mytemplate.queryForObject(query,new String[]{branchCode},String.class);
		 }
		 catch (Exception e) {			
			 logger.debug("EXCEPTION @ { " + e + " }");
		 }	
		 logger.info("getbranchWiseCountry - Exit:"+ result);
		 return result;
	}

	public List<Object> getSearchList(String rep, String productID,String searchBy, String searchValue) {
		return api.getSearchList(rep,productID ,searchBy,searchValue );
// 		List<Object> list=null;
//		try{
//			String query="";
//			if("quoteNo".equals(rep)){
//				query = getQuery("GET_SEARCH_BY_QUOTE_LIST");
//				Object[] obj = new Object[4];
//				obj[0] = productID;
//				obj[1] = productID;
//				obj[2] = productID;
//				obj[3] = searchValue;
//				logger.info("query==>"+query);
//				logger.info("args==>"+StringUtils.join(obj, ", "));
//				list=this.mytemplate.queryForList(query, obj);
//			}else{
//			query = getQuery("GET_SEARCH_BY_POLICY_LIST");
//			Object[] obj = new Object[4];
//			obj[0] = productID;
//			obj[1] = productID;
//			obj[2] = productID;
//			obj[3] = searchValue;
//			logger.info("query==>"+query);
//			logger.info("args==>"+StringUtils.join(obj, ", "));
//			list=this.mytemplate.queryForList(query, obj);
//			}
//			
//		}catch(Exception e){
//			e.printStackTrace();
//		}
//		return list;
	}
	
}
