package com.maan.adminnew.underwriterManagement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.Logger;

import com.maan.adminnew.userManagement.UserMgtBean;
import com.maan.common.LogUtil;
import com.maan.common.MyJdbcTemplate;
import com.maan.common.password.passwordEnc;
import com.opensymphony.xwork2.ActionContext;

public class UnderwriterMgtDAO extends MyJdbcTemplate{
	final static Logger logger = LogUtil.getLogger(UnderwriterMgtDAO.class);
	String query="";
	passwordEnc pass = new passwordEnc();
	Map<String, Object> session=ActionContext.getContext().getSession();
	UnderwriterAPICaller api = new UnderwriterAPICaller();
	
	public List <Object> getAdminUnderwriterList(final UnderwriterMgtBean ba, String agencyCode, String mode1, String branchCode){
		return api.getAdminUnderwriterList(ba,agencyCode, mode1, branchCode);
    }
	
	public List <Object> getUnderwriterDetails(final UnderwriterMgtBean ba, String branchCode, String issurName){
		List <Object> underwriterInfo=null;
		Object[] obj=null;
		try{
			
			underwriterInfo= api.getUnderWriterInfo(ba,session.get("BranchCode").toString(),issurName);
			
			String products="";
			for(int i=0;i<underwriterInfo.size();i++){
				Map temp=(Map)underwriterInfo.get(i);
				ba.setIssurName(temp.get("UserName")==null?"":temp.get("UserName").toString());
				ba.setCoreLoginId(temp.get("CoreLoginId")==null?"":temp.get("CoreLoginId").toString());
				ba.setEmailId(temp.get("UserMail")==null?"":temp.get("UserMail").toString());
				products=temp.get("ProductId")==null?"":temp.get("ProductId").toString();
				ba.setUstatus(temp.get("Status")==null?"":temp.get("Status").toString());
				ba.setBranchId(temp.get("AttachedBranch")==null?"":temp.get("AttachedBranch").toString());
				ba.setEffecdate(temp.get("InceptionDate")==null?"":temp.get("InceptionDate").toString());
				ba.setBroLinkLoc(temp.get("SubBranch")==null?"":temp.get("SubBranch").toString());
				ba.setRegionCode(temp.get("RegionCode")==null?"":temp.get("RegionCode").toString());
				ba.setBranchCodeS(temp.get("BranchCode")==null?"":temp.get("BranchCode").toString());
			}
			String[] productIds=products.split(",");
			List<String> product=new ArrayList<String>();
			for(int i=0;i<productIds.length;i++){
				product.add(productIds[i].trim());
			}
			ba.setProducts(product);			
		}catch (Exception e) {			
			logger.debug("EXCEPTION @ { " + e + " }");
		}
    	return underwriterInfo;
	}
	
	public void updatebrokerDetails(final UnderwriterMgtBean ba, String issurName){
		try{
			query=getQuery("UPDATE_INCLUDE_BROKER");
			if(ba.getBrokerCode()!=null && ba.getBrokerCode().size()>0){
				for(int i=0;i<ba.getBrokerCode().size();i++){
					Object args[]=new Object[4];
					args[0]=ba.getType().get(i+1)==null?"exclude":"include";
					args[1]=ba.getStatus().get(i).toString();
					args[2]=ba.getBrokerCode().get(i).toString();
					args[3]=ba.getProductId().get(i).toString();
				  logger.info("Query "+query+" args"+StringUtils.join(args,",")+"IssuerName "+ba.getIssurName());	
			      this.mytemplate.update(query,args);
				}
		     }
		}
		catch (Exception e) {			
			logger.debug("EXCEPTION @ { " + e + " }");
		}
	}
	
//	private int size(List<String> type) {
//		
//		return 0;
//	}

	public List <Object> includeissuerDetails(final UnderwriterMgtBean ba, String type1){
		List <Object> includeIssuer=null;
		Object[] obj=null;
		try{
			includeIssuer = api.getIncludeIssuerDetail(ba);
		}
		catch (Exception e) {			
			logger.debug("EXCEPTION @ { " + e + " }");
		}
		return includeIssuer;
	}
	
	public List <Object> excludeissuerDetails(final UnderwriterMgtBean ba, String type1){
		List <Object> excludeIssuer=null;
		Object[] obj=null;
		try{
			excludeIssuer = api.getExcludeIssuerDetail(ba);
		}
		catch (Exception e) {			
			logger.debug("EXCEPTION @ { " + e + " }");
		}
		return excludeIssuer;
	}
  public void getRSABranches(UnderwriterMgtBean bean) {
	    try{
		String query ="select branch_code,branch_name from rsa_branch_details where branch_code in ( SELECT distinct(REGEXP_SUBSTR(rsa_branch,'[^,]+',1,LEVEL)) lc_login FROM (select Rsa_branch from branch_master where branch_code=?) B  CONNECT BY LEVEL <= LENGTH(rsa_branch) - LENGTH(REPLACE(rsa_branch,',',''))+1 and rsa_branch is not null)";
			//getQuery("GET_RSA_BRANCHES");
		if(StringUtils.isNotEmpty(bean.getBranchSelected())){
			String rightCodes=StringUtils.join(new Object[] {bean.getBranchSelected()},",") ;
			//String rightCodes="'"+right+"'";
		    bean.setLeftBranchList(this.mytemplate.queryForList(query+" and branch_code not in(?)",new Object[]{bean.getMainBranchCode(),rightCodes}));
		    bean.setRightBranchList(this.mytemplate.queryForList(query+" and branch_code in(?)",new Object[]{bean.getMainBranchCode(),rightCodes}));
		}else{
			bean.setLeftBranchList(this.mytemplate.queryForList(query,new Object[]{bean.getMainBranchCode()}));
			bean.setRightBranchList(new ArrayList<Map<String,Object>>());
		}
	    }catch(Exception e){
	    	logger.debug("EXCEPTION @ { " + e + " }");
	    }
	}


	public int insertUnderwriter(UnderwriterMgtBean bean) {
		//insert into login_master(LOGIN_ID,PASSWORD,USERTYPE,USERNAME,USERID,AGENCY_CODE,OA_CODE,COMPANY_ID,CREATED_BY,STATUS,USER_ID_CREATION,AC_EXECUTIVE_CREATION,ACCESSTYPE,PASSDATE,BRANCH_CODE,COUNTRY_ID,CORE_LOGIN_ID, APP_ID, PWD_COUNT, USER_MAIL) values(?,?,?,?,?,?,?,?,?,?,?,?,?,(select sysdate from dual),?,?,?, '16', '0', ?)
		try{
			List<String> products=bean.getProducts();
			String productIds="";
			if(products!=null){
				for(int i=0;i<products.size();i++){
					productIds=productIds+","+products.get(i);
				}
			}	
		Object args[]=new Object[21];
		args[0]=bean.getLoginId();
		args[1]=pass.crypt(bean.getPassword());
		args[2]="RSAIssuer";
		args[3]=bean.getIssurName();
		args[4]="1";
		args[5]=bean.getLoginId()+1;
		args[6]=bean.getLoginId();
		args[7]="1";
		args[8]=session.get("user");
		args[9]="Y";
		args[10]="";
		args[11]="";
		args[12]="BOTH";
		args[13]=session.get("BranchCode");
		args[14]="";
		args[15]=bean.getCoreLoginId();
		args[16]=bean.getEmailId();
		args[17]=productIds;
		args[18]=bean.getBranchId();
		args[19]=bean.getEffecdate();
		args[20]=bean.getBroLinkLoc();
		this.mytemplate.update(getQuery("INS_ISSUER_LOGIN_DET"),args);
		//this.mytemplate.update("update login_master set product_id=? , RSA_BRANCH_CODE =?,entry_date=sysdate where login_id=?" ,new Object[]{productIds.replaceFirst(",", ""),bean.getBranchSelected(),bean.getLoginId()});
		//Insert for product details
		String query="insert into login_user_details(user_id,user_name,login_id,AGENCY_CODE,OA_CODE,PRODUCT_ID,COMPANY_ID,AMEND_ID,STATUS) values(?,?,?,?,?,?,?,?,?)";
		Object product[]=new Object[9];
		if(bean.getProducts()!=null){
			for(int i=0;i<bean.getProducts().size();i++){
				product[0]=(String)this.mytemplate.queryForObject("select max(user_id)+1 from login_user_details", String.class); 
				product[1]=bean.getIssurName();
				product[2]=bean.getLoginId();
				product[3]=bean.getLoginId()+1;
				product[4]=bean.getLoginId();
				product[5]=bean.getProducts().get(i);
				product[6]="1";
				product[7]="0";
				product[8]="Y";
				this.mytemplate.update(query,product);
			}
		}
		}catch(Exception e){
			e.printStackTrace();
		}
		return 0;
	}
	public int updateUnderwriter(UnderwriterMgtBean bean){
		try{
			api.UpdateUnderWriter(bean);
		}catch(Exception e){
			e.printStackTrace();
		}
       return 0;
		
	}
	public void changePassword(UnderwriterMgtBean bean) {
		   try
		   { 
			   api.updateIssuerPassword(bean);
//				String query="update login_master set password=?,STATUS='Y',PWD_COUNT=0 where login_id=?";
//				logger.info("Query===>" + query);
//				this.mytemplate.update(query,new Object[]{bean.getPassword(),bean.getLoginId()});
		   }
		   catch (Exception e) 
			{
				logger.debug("EXCEPTION @ { " + e + " }");
			}
		}
   public void updateExcludedBrokers(UnderwriterMgtBean bean) {
	   try{
		   
		   
		   if(bean.getBrokerCode()!=null && bean.getStatus()!=null){
			   api.updateIncludeBrokers(bean);
		   }
//			   for(int i=0;i<bean.getStatus().size();i++){
//				   if("exclude".equalsIgnoreCase(bean.getStatus().get(i))){
//					   	String[] productIds=new String[]{"3","11"};
//						   for(int j=0;j<productIds.length;j++){
//							   Object args[]=new Object[7];
//							   args[0]=bean.getLoginId();
//							   args[1]=bean.getBrokerCode().get(i);
//							   args[2]=productIds[j];
//							   args[3]=session.get("BranchCode");
//							   args[4]="0";
//							   args[5]="0";
//							   args[6]="Y";
//							   this.mytemplate.update(getQuery("ICLCU_BROKER"),args);
//						   }
//					   }
//				   }
//			   }
		   }catch (Exception e) {
         e.printStackTrace();
	}
  }
  public void updateIncludeBrokers(UnderwriterMgtBean bean){
	  List<String> brokerCodeList= new ArrayList<String>();
	try{
		if(bean.getBrokerCode()!=null && bean.getStatus()!=null){
//			api.updateExcludedBrokers(bean);
			   for(int i=0;i<bean.getStatus().size();i++){
				   if("include".equalsIgnoreCase(bean.getStatus().get(i))){
//				    this.mytemplate.update("delete from LOGIN_RSAUSER_DETAILS where broker_code=? and login_id=?",new Object[]{bean.getBrokerCode().get(i),bean.getLoginId()});
					   brokerCodeList.add(bean.getBrokerCode().get(i));
				   }
			   }
			   bean.setBrokerCode(brokerCodeList);
			   api.updateExcludedBrokers(bean);
		}
	}catch(Exception e){
		e.printStackTrace();
	}
  }
}