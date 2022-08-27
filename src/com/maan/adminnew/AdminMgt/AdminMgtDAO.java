package com.maan.adminnew.AdminMgt;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.ListUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.Logger;

import com.maan.common.LogUtil;
import com.maan.common.MyJdbcTemplate;
import com.maan.common.password.passwordEnc;
import com.maan.report.api.ReportApiCaller;

public class AdminMgtDAO extends MyJdbcTemplate
{
	AdminMgtApiCaller api = new AdminMgtApiCaller();
	ReportApiCaller rapi = new ReportApiCaller();
	final Logger logger = LogUtil.getLogger(AdminMgtDAO.class);
	String query="";
	
	
	public List <Object> getMenuList(final AdminMgtBean bean, String branchCode){
		List <Object> menuList=null;
		try{

			Object[] obj=new Object[]{branchCode};
			if("newadmin".equalsIgnoreCase(bean.getReqFrom())){
				query=getQuery("GET_MENU_LIST")+" and status='Y'";
			}
			else if("".equals(bean.getSearchBy()) || bean.getSearchBy()==null || StringUtils.isNotBlank(bean.getUname()))
				query=getQuery("GET_MENU_LIST")+" order by A.DETAIL_NAME";
			else if((!"".equals(bean.getSearchBy())) && (!"".equals(bean.getSearchValue())) )
				query=getQuery("GET_MENU_LIST")+" and lower("+bean.getSearchBy()+") like '%'||lower('"+bean.getSearchValue()+"')||'%' order by A.DETAIL_NAME";
			logger.info("Query===>" + query);
			logger.info("Args===> " + StringUtils.join(obj,","));
			menuList=this.mytemplate.queryForList(query,obj);
		}catch (Exception e) {
			logger.debug("EXCEPTION @ { " + e + " }");
		}
		return menuList;
	}
	
	public List<Object>UtypeList(String branchCode,String appId){
		return api.UtypeList( branchCode, appId);
		
	}
	
	public List<Object>adminList(final AdminMgtBean bean, String branchCode,String appId){
		return api.getAdminList(bean,branchCode,appId);
	}
	
	public void getAdminInfo(final AdminMgtBean bean,String branchCode, String appId){
		List <Object> adminList=null;
		try{

			adminList = api.getAdminEditInfo(bean,branchCode , appId);
			
			if(adminList!=null && adminList.size()>0){
				Map map=(Map) adminList.get(0);
				bean.setUname(map.get("UserName")==null?"":map.get("UserName").toString());
				bean.setLoginID(map.get("LoginId")==null?"":map.get("LoginId").toString());
				bean.setUtype(map.get("UserType")==null?"":map.get("UserType").toString());
				bean.setBranch(map.get("BranchName")==null?"":map.get("BranchName").toString());
				bean.setStatus(map.get("Status")==null?"":map.get("Status").toString());
				bean.setBroker(map.get("BrokerCode")==null?"":map.get("BrokerCode").toString());
				bean.setMid(map.get("MenuId")==null?"":map.get("MenuId").toString());
				bean.setEmail(map.get("UserMail")==null?"":map.get("UserMail").toString());
				bean.setRegionCode(map.get("RegionCode")==null?"":map.get("RegionCode").toString());
				bean.setBranchCodeS(map.get("BranchCode")==null?"":map.get("BranchCode").toString());
				bean.setProductID(map.get("ProductId").toString().trim().split(","));
				String attacheduw=map.get("AttachedUnderWriter").toString().replace(" ", "");
				String uwg[]=attacheduw.trim().split(",");
				/*if(uwg.length>0)
					uwg=(String [])ArrayUtils.remove(uwg, 0);*/
				//uwg=(String [])ArrayUtils.remove(uwg, uwg.length-1);
				
				bean.setUwgrade(uwg);
				bean.setBranchId(map.get("AttachedBranch")==null?"":map.get("AttachedBranch").toString());
				bean.setAttachedregion(map.get("AttachedRegion").toString().trim().split(","));
				//bean.setProduct("Marine");
			}
		}catch (Exception e) {
			logger.debug("EXCEPTION @ { " + e + " }");
		}
	}
	
	public void getMenuInfo(final AdminMgtBean bean,String branchCode){
		List <Object> adminList=null;;
		try{
			query=getQuery("GET_MENU_LIST");
			query+=" and A.CATEGORY_DETAIL_ID=?";
			logger.info("Query===>" + query);
			Object[] obj=new Object[]{branchCode, bean.getMid()};
			for(Object k:obj)
				logger.info("Args===>" + k);
			adminList=this.mytemplate.queryForList(query,obj);
			if(adminList!=null && adminList.size()>0){
				Map map=(Map) adminList.get(0);
				bean.setMid(map.get("CATEGORY_DETAIL_ID")==null?"":map.get("CATEGORY_DETAIL_ID").toString());
				bean.setMname(map.get("DETAIL_NAME")==null?"":map.get("DETAIL_NAME").toString());
				bean.setUrlPath(map.get("REMARKS")==null?"":map.get("REMARKS").toString());
				bean.setStatus(map.get("STATUS")==null?"":map.get("STATUS").toString());
				bean.setParent(map.get("PARENT_MENU")==null?"":map.get("PARENT_MENU").toString());
			}
		}catch (Exception e) {
			logger.debug("EXCEPTION @ { " + e + " }");
		}
	}
	
	public int insNewMenu(final AdminMgtBean bean,String branchCode){
		int affRows=0;
		try{
			query=getQuery("INS_NEW_MENU");
			logger.info("Query===>" + query);
			Object[] obj=new Object[]{branchCode, bean.getMname(), bean.getUrlPath(), bean.getStatus(),branchCode, branchCode, bean.getParent()};
			for(Object k:obj)
				logger.info("Args===>" + k);
			affRows=this.mytemplate.update(query,obj);
		}catch (Exception e) {
			logger.debug("EXCEPTION @ { " + e + " }");
		}
		return affRows;
	}
	
	public int updateMenu(final AdminMgtBean bean,String branchCode){
		int affRows=0;
		try{
			query=getQuery("UPD_EXIST_MENU");
			logger.info("Query===>" + query);
			Object[] obj=new Object[]{bean.getMname(), bean.getUrlPath(), bean.getStatus(), bean.getParent(), bean.getMid(), branchCode};
			for(Object k:obj)
				logger.info("Args===>" + k);
			affRows=this.mytemplate.update(query,obj);
		}catch (Exception e) {
			logger.debug("EXCEPTION @ { " + e + " }");
		}
		return affRows;
	}
	
	public int insNewAdmin(final AdminMgtBean bean,String branchCode, String appId){
		int affRows=0;
		try{
			passwordEnc pass = new passwordEnc();
			query=getQuery("INS_NEW_ADMIN_USER");
			logger.info("Query===>" + query);
			Object[] obj=new Object[]{bean.getLoginID(), pass.crypt(bean.getPwd()), bean.getUtype(), bean.getUname(), bean.getUtype(),
					 bean.getLoginID(),"1", "admin", "Y", "Y", "Y", "BOTH", branchCode, branchCode, bean.getMid(), bean.getProduct(),bean.getBroker(), bean.getEmail(),StringUtils.join(bean.getUwgrade(),",")+",",bean.getBranchId()};
			for(Object k:obj)
				logger.info("Args===>" + k);
			affRows=this.mytemplate.update(query,obj);
		}catch (Exception e) {
			logger.debug("EXCEPTION @ { " + e + " }");
		}
		return affRows;
	}
	
	public int updateAdmin(final AdminMgtBean bean, String branchCode, String appId){
		int affRows=0;
		Object[] obj=null;
		try{
			logger.info("Query===>" + query);
			if("".equals(bean.getPwd()) || bean.getPwd()==null){
				query=getQuery("UPD_EXIST_ADMIN_USER");
				obj=new Object[]{bean.getUname(),bean.getUtype(), appId, bean.getStatus(), bean.getMid(), bean.getProduct(), bean.getEmail(), bean.getBroker(),StringUtils.join(bean.getUwgrade(),","),bean.getBranchId(), bean.getLoginID()};
			}
			else{
				passwordEnc pass = new passwordEnc();
				query=getQuery("UPD_EXIST_ADMIN_USER_PWD");
				obj=new Object[]{bean.getUname(),pass.crypt(bean.getPwd()),bean.getUtype(), appId, bean.getStatus(), bean.getMid(), bean.getProduct(), bean.getEmail(), bean.getBroker(),StringUtils.join(bean.getUwgrade(),","),bean.getBranchId(), bean.getLoginID()};
				
			}
			logger.info("Query===>" + query);
			for(Object k:obj)
				logger.info("Args===>" + k);
			affRows=this.mytemplate.update(query,obj);
		}catch (Exception e) {
			logger.debug("EXCEPTION @ { " + e + " }");
		}
		return affRows;
	}
	public String getBranch(String branchCode){
		String branch="";
		try{
			query=getQuery("GET_BRANCH_NAME");
			logger.info("Query===>" + query);
			Object[] obj=new Object[]{branchCode};
			for(Object k:obj)
				logger.info("Args===>" + k);
			branch=this.mytemplate.queryForObject(query,obj, String.class).toString();
		}catch (Exception e) {
			logger.debug("EXCEPTION @ { " + e + " }");
		}
		return branch;
	}
	public List<Object> getDashBoard(String loginId,AdminMgtBean bean,String branchCode) {
		List<Object> result=null;
		try{
			String query=getQuery("GET_DASHBOARD_ADMIN");
			if("3".equals(bean.getProduct()) || "11".equals(bean.getProduct())){
				Object obj[]=new Object[]{"3",loginId,branchCode};
				logger.info("getDashBoard Query ==>"+query);
				logger.info("getDashBoard Args ==>"+StringUtils.join(obj,", "));
				result=this.mytemplate.queryForList(query,obj);
				
				for(int i=0;i<result.size();i++){
					Map<String,Object> temp=(Map<String,Object>)result.get(i);
					if("PORTFOLIO".equalsIgnoreCase(temp.get("TYPE")==null?"":temp.get("TYPE").toString())){
						bean.setOneOffPortFolio(temp.get("QUOTE_NO")==null?"":temp.get("QUOTE_NO").toString());
						bean.setOneOffPremium(temp.get("PREMIUM")==null?"":temp.get("PREMIUM").toString());
					}
			        if("UNAPPROVED".equalsIgnoreCase(temp.get("TYPE")==null?"":temp.get("TYPE").toString())){
			        	bean.setOneOffPending(temp.get("QUOTE_NO")==null?"":temp.get("QUOTE_NO").toString());
			        }
			        if("APPROVED".equalsIgnoreCase(temp.get("TYPE")==null?"":temp.get("TYPE").toString())){
			        	bean.setOneOffAccepted(temp.get("QUOTE_NO")==null?"":temp.get("QUOTE_NO").toString());
			        }
			        if("REJECT".equalsIgnoreCase(temp.get("TYPE")==null?"":temp.get("TYPE").toString())){
			        	bean.setOneOffRejected(temp.get("QUOTE_NO")==null?"":temp.get("QUOTE_NO").toString());
			        }
				}
				obj=new Object[]{"11",loginId,branchCode};
				logger.info("getDashBoard Args ==>"+StringUtils.join(obj,", "));
				result=this.mytemplate.queryForList(query,obj);
				for(int i=0;i<result.size();i++){
					Map<String,Object> temp=(Map<String,Object>)result.get(i);
					if("PORTFOLIO".equalsIgnoreCase(temp.get("TYPE")==null?"":temp.get("TYPE").toString())){
						bean.setOpenCoverPortFolio(temp.get("QUOTE_NO")==null?"":temp.get("QUOTE_NO").toString());
						bean.setOpenCoverPremium(temp.get("PREMIUM")==null?"":temp.get("PREMIUM").toString());
					}
			        if("UNAPPROVED".equalsIgnoreCase(temp.get("TYPE")==null?"":temp.get("TYPE").toString())){
			        	bean.setOpenCoverPending(temp.get("QUOTE_NO")==null?"":temp.get("QUOTE_NO").toString());
			        }
			        if("APPROVED".equalsIgnoreCase(temp.get("TYPE")==null?"":temp.get("TYPE").toString())){
			        	bean.setOpenCoverAccepted(temp.get("QUOTE_NO")==null?"":temp.get("QUOTE_NO").toString());
			        }
			        if("REJECT".equalsIgnoreCase(temp.get("TYPE")==null?"":temp.get("TYPE").toString())){
			        	bean.setOpenCoverRejected(temp.get("QUOTE_NO")==null?"":temp.get("QUOTE_NO").toString());
			        }
				}
			}else if("65".equals(bean.getProduct())){
				query=getQuery("GET_DASHBOARD_ADMIN_MOTOR");
				Object obj[]=new Object[]{bean.getProduct(),loginId,branchCode};
				logger.info("getDashBoard Query ==>"+query);
				logger.info("getDashBoard Args ==>"+StringUtils.join(obj,", "));
				result=this.mytemplate.queryForList(query,obj);
				if(result!=null && result.size()>0){
					for(int i=0;i<result.size();i++){
						Map<String,Object> temp=(Map<String,Object>)result.get(i);
						bean.setPolicyReject("0");
						if("QUOTES".equalsIgnoreCase(temp.get("QUOTETYPE")==null?"":temp.get("QUOTETYPE").toString())){
							bean.setNoOfQuote(temp.get("QUOTE_NO")==null?"0":temp.get("QUOTE_NO").toString());
						}else if("PORTFOLIO".equalsIgnoreCase(temp.get("QUOTETYPE")==null?"":temp.get("QUOTETYPE").toString())){
							bean.setPolicyAccept(temp.get("QUOTE_NO")==null?"0":temp.get("QUOTE_NO").toString());
						}else if("REJECT".equalsIgnoreCase(temp.get("QUOTETYPE")==null?"":temp.get("QUOTETYPE").toString())){
							bean.setPolicyReject(temp.get("QUOTE_NO")==null?"0":temp.get("QUOTE_NO").toString());
						}else if("REFERAL_UNAPPROVED".equalsIgnoreCase(temp.get("QUOTETYPE")==null?"":temp.get("QUOTETYPE").toString())){
							bean.setReferralPending(temp.get("QUOTE_NO")==null?"0":temp.get("QUOTE_NO").toString());
						}else if("REFERRAL_APPROVED".equalsIgnoreCase(temp.get("QUOTETYPE")==null?"":temp.get("QUOTETYPE").toString())){
							bean.setReferralAccepted(temp.get("QUOTE_NO")==null?"0":temp.get("QUOTE_NO").toString());
						}else if("REFERAL_REJECT".equalsIgnoreCase(temp.get("QUOTETYPE")==null?"":temp.get("QUOTETYPE").toString())){
							bean.setReferralRejected(temp.get("QUOTE_NO")==null?"0":temp.get("QUOTE_NO").toString());
						}
					}
				}
			
			}else{
				Object obj[]=new Object[]{bean.getProduct(),loginId,branchCode};
				logger.info("getDashBoard Query ==>"+query);
				logger.info("getDashBoard Args ==>"+StringUtils.join(obj,", "));
				result=this.mytemplate.queryForList(query,obj);
				if(result!=null && result.size()>0){
					for(int i=0;i<result.size();i++){
						Map<String,Object> temp=(Map<String,Object>)result.get(i);
						bean.setPolicyReject("0");
						if("QUOTES".equalsIgnoreCase(temp.get("TYPE")==null?"":temp.get("TYPE").toString())){
							bean.setNoOfQuote(temp.get("QUOTE_NO")==null?"0":temp.get("QUOTE_NO").toString());
						}else if("PORTFOLIO".equalsIgnoreCase(temp.get("TYPE")==null?"":temp.get("TYPE").toString())){
							bean.setPolicyAccept(temp.get("QUOTE_NO")==null?"0":temp.get("QUOTE_NO").toString());
						}else if("REJECT".equalsIgnoreCase(temp.get("TYPE")==null?"":temp.get("TYPE").toString())){
							bean.setPolicyReject(temp.get("QUOTE_NO")==null?"0":temp.get("QUOTE_NO").toString());
						}else if("REFERAL_UNAPPROVED".equalsIgnoreCase(temp.get("TYPE")==null?"":temp.get("TYPE").toString())){
							bean.setReferralPending(temp.get("QUOTE_NO")==null?"0":temp.get("QUOTE_NO").toString());
						}else if("REFERRAL_APPROVED".equalsIgnoreCase(temp.get("TYPE")==null?"":temp.get("TYPE").toString())){
							bean.setReferralAccepted(temp.get("QUOTE_NO")==null?"0":temp.get("QUOTE_NO").toString());
						}else if("REFERAL_REJECT".equalsIgnoreCase(temp.get("TYPE")==null?"":temp.get("TYPE").toString())){
							bean.setReferralRejected(temp.get("QUOTE_NO")==null?"0":temp.get("QUOTE_NO").toString());
						}
					}
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	public void getPopUpList(AdminMgtBean bean,String branchCode) {
		List<Map<String,Object>> popupList=null;
		try{
			String query="";
			Object[] args=null;
			if("commodities".equalsIgnoreCase(bean.getClausesType())){
				query=getQuery("GET_COMMODITY_LIST_CLAUSES");
				args=new Object[]{bean.getProposalNo()};
			}else{
				query=getQuery("GET_COVER_LIST_CLAUSES");
				args=new Object[]{bean.getProposalNo(),branchCode};
			}
			popupList=this.mytemplate.queryForList(query,args);
			bean.setCommodityList(popupList);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public int saveOptionalCovers(AdminMgtBean bean) {
		 int result=1;
		try{
			String query=getQuery("OPTIONAL_COVER_INSERT");
			logger.info("OptionalCovers Insert Query "+query);
			this.mytemplate.update("delete from OPEN_COVER_FREE_TEXT where PROPOSAL_NO=? AND TYPE = 'O' and cover_id=? ",new Object[]{bean.getProposalNo(),bean.getCoverNo()});
			logger.info("delete from OPEN_COVER_FREE_TEXT where PROPOSAL_NO=? AND TYPE = 'O' and cover_id=?");
			String sql=getQuery("saveOptionalCovers");
			String amndId=(String)this.mytemplate.queryForObject(sql, new Object[]{bean.getProposalNo(),bean.getCoverNo()},String.class);
			if(null!=bean.getOptionalId() && null!=bean.getOptionalDesc()){
				for(int i=0;i<bean.getOptionalId().size();i++){
					if(!"false".equalsIgnoreCase(bean.getOptionalId().get(i))){
					  logger.info("Args "+StringUtils.join(new Object[]{bean.getProposalNo(),amndId,"0",bean.getCoverNo(),"0",bean.getOptionalId().get(i),bean.getOptionalDesc().get(i),bean.getEffectDate(),"Y","01","O"},","));	
					  this.mytemplate.update(query,new Object[]{bean.getProposalNo(),amndId,"0",bean.getCoverNo(),"0",bean.getOptionalId().get(i),bean.getOptionalDesc().get(i),bean.getEffectDate(),"Y","01","O"});
					}
				}
			}
		   }catch (Exception e) {
			result=0;
			e.printStackTrace();
		}
		return result;
	}
	public void getOptionalCoverList(String branchCode, AdminMgtBean bean) {
		try{
			
			List coverList=null;
			 List selectedList=null;
			if("0".equals(bean.getCoverNo())){
				 String coverQuery=getQuery("GET_OPTIONAL_COVER_NOT_SELECTED_0");	
				 logger.info("Non Selected Optional Covers List "+coverQuery+"\n args "+StringUtils.join(new Object[]{bean.getCoverNo(),bean.getProposalNo(),bean.getProposalNo(),bean.getCoverNo()}));
				 coverList=this.mytemplate.queryForList(coverQuery,new Object[]{"01",bean.getProposalNo(),bean.getProposalNo(),bean.getCoverNo(),bean.getCoverNo()});
				 String selectedQuery=getQuery("GET_OPTIONAL_COVER_SELECTED");
				 logger.info("Selected Optional Covers List "+selectedQuery+"\n args "+new Object[]{bean.getProposalNo(),bean.getProposalNo(),bean.getCoverNo(),bean.getCoverNo()});
				  selectedList=this.mytemplate.queryForList(selectedQuery,new Object[]{bean.getProposalNo(),bean.getProposalNo(),bean.getCoverNo(),bean.getCoverNo()});
			}else{
				 String coverQuery=getQuery("GET_OPTIONAL_COVER_NOT_SELECTED");	
				 logger.info("Non Selected Optional Covers List "+coverQuery+"\n args "+StringUtils.join(new Object[]{bean.getCoverNo(),bean.getProposalNo(),bean.getProposalNo(),bean.getCoverNo()}));
				  coverList=this.mytemplate.queryForList(coverQuery,new Object[]{branchCode,bean.getProposalNo(),bean.getProposalNo()});
				 String selectedQuery=getQuery("GET_OPTIONAL_COVER_SELECTED_0");
				 logger.info("Selected Optional Covers List "+selectedQuery+"\n args "+new Object[]{bean.getProposalNo(),bean.getProposalNo(),bean.getCoverNo(),bean.getCoverNo()});
				  selectedList=this.mytemplate.queryForList(selectedQuery,new Object[]{bean.getProposalNo(),bean.getProposalNo(),bean.getCoverNo(),bean.getCoverNo()});
			}			
		 
		 bean.setOptionalCoverList(ListUtils.union(selectedList, coverList));
		 bean.setSelectedCovers(selectedList);
		 if(null!=selectedList){
		   if(selectedList.size()>0){
			   Map temp=(Map)selectedList.get(0);
			   bean.setEffectDate((String)temp.get("EFFECTIVE_DATE"));
		   }else{
			     Calendar cal=Calendar.getInstance();
		    	 int date=cal.get(Calendar.DAY_OF_MONTH);
		    	 int month=cal.get(Calendar.MONTH)+1;
		    	 int year=cal.get(Calendar.YEAR);
		    	 bean.setEffectDate(date+"-"+month+"-"+year);
		   }
		 }
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public List<Map<String,String>> getUwGradeList() {
//		List<Map<String,String>> result=null;
//		try{
//			String query=getQuery("GET_RIMASTER");
//			result=this.mytemplate.queryForList(query);
//		}catch (Exception e) {
//			e.printStackTrace();
//		}
//	 	return result;
		return api.getUnderWriterGrade();
	}

	public Map<String,List<Object>> getProductList(AdminMgtBean bean, String branchCode) {
		return api.getProductWiseMenuList(bean , branchCode);
//		 Map<String,List<Object>> result=null;
//		 try{			  
//			 List<Map<String,Object>> key=null;
//			 String query=getQuery("GET_PRODUCT_LIST");
//			 String arg="'"+StringUtils.join(bean.getSelProducts().split(","),"','")+"'";
//			 logger.info("query "+query.replace("?", arg));			 
//			 key=this.mytemplate.queryForList(query.replace("?", arg));
//			 query="SELECT MENU_ID , MENU_NAME FROM MENU_MASTER WHERE STATUS='Y' AND BRANCH_CODE=(SELECT BELONGING_BRANCH FROM BRANCH_MASTER WHERE BRANCH_CODE=?) AND  PRODUCT_ID = ? and USERTYPE='admin'";
//			 String []product=bean.getSelProducts().split(",");
//			 result=new HashMap<String, List<Object>>();
//			 for (int i = 0; i < product.length; i++) {
//				 List<Object> value=this.mytemplate.queryForList(query,new Object[]{branchCode,key.get(i).get("PRODUCT_ID").toString()});
//				 result.put(key.get(i).get("PRODUCT_NAME").toString(), value);	
//			 } 
//		 }catch (Exception e) {
//			 e.printStackTrace();
//		}
//		 return result;
	}

	public List<Object> getUserSelection(AdminMgtBean bean) {
		List<Object> result=null;
		try{
			String query=getQuery("getBrokersHasCover_C",new Object[]{bean.getBranch()});
			result=this.mytemplate.queryForList(query);
		}catch (Exception e) {
			e.printStackTrace();
		}
	 	return result;
	}

	public List<Object> getPaymentTermsDetails(AdminMgtBean bean) {
		List<Object> result=null;
		try{
			String query=getQuery("GETOCDETAILS")+"order by ocpm.PROPOSAL_NO desc ";
			result=this.mytemplate.queryForList(query,new Object[]{bean.getUserLoginId()});
		}catch (Exception e) {
			e.printStackTrace();
		}
	 	return result;
	}

	public List<Object> getPaymentTermsList(AdminMgtBean bean) {
		List<Object> result=null;
		try{
			if("paymentTermsView".equalsIgnoreCase(bean.getReqFrom())){
				String query=getQuery("GETPAYMENT_TERMS_CNT");
				logger.info("Query "+query);
				result=this.mytemplate.queryForList(query,new Object[]{bean.getOpenCoverNo()});
			}else{
				String query=getQuery("GETPAYMENT_TERMS");
				logger.info("Query "+query);
				result=this.mytemplate.queryForList(query,new Object[]{bean.getOpenCoverNo(),bean.getProposalNo().trim(),bean.getMissippiOpenCoverNo()});
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	 	return result;
	}

	public void insertDueDetails(AdminMgtBean bean) {
		try{
			String sql="";
			int sno=0;
			String reqFrom="";
			if("DefInsert".equalsIgnoreCase(bean.getReqFrom())){
				bean.setReqFrom("addNew");
				sql=getQuery("DEL_PAYMENT_TERMS");
				reqFrom="DefInsert";
				this.mytemplate.update(sql,new Object[]{bean.getProposalNo()});
			}else if(StringUtils.isNotBlank(bean.getMissippiOpenCoverNo())){
				sql=getQuery("DEL_PAYMENT_TERMS_PL");
				this.mytemplate.update(sql,new Object[]{bean.getMissippiOpenCoverNo()});
			}
			if("DefInsert".equalsIgnoreCase(reqFrom)){
				sno=1;
			}else if("addNew".equalsIgnoreCase(bean.getReqFrom())){
				sql=getQuery("GET_MAX_SNO_DUE");
				sno=this.mytemplate.queryForInt(sql,new Object[]{bean.getOpenCoverNo()});
			}
			int size="addNew".equalsIgnoreCase(bean.getReqFrom())?bean.getDueList().size():1;
			for(int i=0; i<size;i++){
				Object args[]=new Object[]{bean.getProposalNo(),bean.getOpenCoverNum()==null?bean.getMissippiOpenCoverNo():bean.getOpenCoverNum().get(i),bean.getDueDate().get(i),bean.getDueamount().get(i),bean.getDuepercent().get(i),
						"addNew".equalsIgnoreCase(bean.getReqFrom())?sno+i+1:bean.getSno(),bean.getEffectiveDate().get(i),
								"addNew".equalsIgnoreCase(bean.getReqFrom())?"0":Integer.parseInt(bean.getAmendId())+1,
										"delete".equalsIgnoreCase(bean.getReqFrom())?"N":"Y",bean.getOpenCoverNo(),
												bean.getOpenCoverNum()==null?bean.getMissippiOpenCoverNo():bean.getOpenCoverNum().get(i),"11P","N"
										
				};
				for(Object k:args)
					logger.info("args===>"+k.toString());
				sql=getQuery("INS_PAYMENT_TERMS");
				int result=this.mytemplate.update(sql,args);
				bean.setStatus(result>0?"Y":"N");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public List<Object> getPaymentTerms(AdminMgtBean bean) {
		List<Object> result=null;
		try{
			String query=getQuery("GETOCDETAILS")+" and ISNULL(ocpm.original_policy_no,ocpm.open_cover_no) =?  order by ocpm.PROPOSAL_NO desc ";
			result=this.mytemplate.queryForList(query,new Object[]{bean.getUserLoginId(),bean.getOpenCoverNo()});
		}catch (Exception e) {
			e.printStackTrace();
		}
	 	return result;
	}

	public List<Object> getOpenCoverNoList(AdminMgtBean bean) {
		List<Object> result=null;
		try{
			String query=getQuery("GETOCNOLIST");
			result=this.mytemplate.queryForList(query,new Object[]{bean.getOpenCoverNo()});
		}catch (Exception e) {
			e.printStackTrace();
		}
	 	return result;
	}

	public List<Object> getPolicyEffectiveDt(String proposalNo) {
		List<Object> quoteInfo=null;	
		try{
			String query="select convert (varchar(10),POLICY_EFFECTIVE_DATE, 103 ) POLICY_EFFECTIVE_DATE,convert (varchar(10),DATEADD(month, 1, POLICY_EFFECTIVE_DATE), 103 ) DUE_DATE,isnull(ORIGINAL_POLICY_NO,OPEN_COVER_NO) as OPEN_COVER_NO from OPEN_COVER_POSITION_MASTER where PROPOSAL_NO=?";
			quoteInfo=this.mytemplate.queryForList(query,new String[]{proposalNo});			
			
		}catch(Exception e){
			logger.debug("Exception @ "+e);
		}
		return quoteInfo;
		
	}

	public void updateCoverNo(String proposalNo, String coverno) {
		try{
			String query=getQuery("UPD_PAYMENT_TERMS_OC");
			this.mytemplate.update(query,new Object[]{coverno,coverno,proposalNo});
		}catch (Exception e) {
			e.printStackTrace();
		}
	 	return ;
	}

	
	public void insertNewAdmin(AdminMgtBean bean, String branchCode, String appId) {
		api.insertNewAdmin(bean,branchCode,appId);
	}

	public List<Map<String, Object>> dashboardCharts(String key, String productId, String userType, String branch,String loginId) {
		return rapi.dashboardCharts( key,  productId,  userType,  "", loginId,  branch,"");
	}

	public List<Map<String,Object>> dashboardTopBroker(String productId, String branch, String userType) {
		return rapi.dashboardTopBroker( productId, "", userType, branch,"");
	}

	public List<Map<String,Object>> dashboardTopReferrals(String productId, String branch, String userType) {
		return rapi.dashboardTopReferrals( productId, "", userType, branch,"");
		
	}

	public List<Object> getMenuList(String menuid, String belongingBranch, String product) {
		return api.getMenuList( menuid,  belongingBranch,  product);
	}
	
	
}