package com.maan.adminnew.AdminMgt;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.apache.commons.lang.StringUtils;
import com.maan.adminnew.common.CommonService;
import com.maan.common.Validation;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class AdminMgtAction extends ActionSupport implements ModelDriven<AdminMgtBean>
{
	private static final long serialVersionUID = 1589654L;
	private AdminMgtBean bean = new AdminMgtBean();
	Validation validation=new Validation();
	AdminMgtService service=new AdminMgtService();
	CommonService cservice=new CommonService();
	Map<String, Object> session=ActionContext.getContext().getSession();
	String branchCode=(String)session.get("BranchCode");
	private String belongingBranch=(String)session.get("BelongingBranch");
	String appId=(String)session.get("AppId");
	String login_id=(String)session.get("user");
	private String productId=(String) session.get("product_id");

	public AdminMgtBean getModel() {
		if(StringUtils.isNotBlank(productId))
		bean.setProduct(productId);
		return bean;
	}
	public List<Object>getUtypeList(){
		return service.UtypeList(belongingBranch, appId);
	}
	public List<Object> getMenuList(){
		return service.getMenuList(bean,branchCode);
	}
	public Map<String,List<Object>>  getProductsWiseMenu(){
		return service.getProductList(bean,branchCode);
	}
	public List<Object>getAdminList(){
		return service.adminList(bean, branchCode, appId);
	}
	public List<Map<String,String>>getProductList(){
		return cservice.getProductsDET(branchCode, "");
	}
	public List<Object>getBrokerList(){
		return cservice.getAdminBrokerList(branchCode, appId);
	}
	/*public List<Object>getBranchList(){
		return cservice.getAdminBranchList(branchCode, appId);
	}	*/
	public List<Map<String,String>> getUwGradeList(){
		return service.getUwGradeList();
	}
	public List<Map<String,Object>> getRegionsList(){
		return cservice.getRegionsList();
	}
	public List<Map<String,Object>> getBranchList(){
		return cservice.getBranchList(bean.getRegionCode());
	}
	public List<Map<String,Object>> getAttachedBranchList(){
		return cservice.getAttachedBranchList(bean.getSelregions());
	}
	public String home(){
		session.put("product_id",bean.getProduct());
		//session.put("MenuList", cservice.getMenuList( (String)session.get("MENU_ID"), belongingBranch,bean.getProduct()));
		session.put("MenuList", service.getMenuList( (String)session.get("MENU_ID"), belongingBranch,bean.getProduct()));
		//bean.setDashBoard(service.getDashBoard(login_id,bean,branchCode));
		service.dashboardCharts(bean.getProduct(), "admin", branchCode, (String)session.get("user"), bean);
		return "adminHome";
	}
	
	public List<Map<String,Object>>getTopBrokerList(){
		return service.dashboardTopBroker(bean.getProduct(),branchCode,"admin");
	}
	public List<Map<String,Object>>getTopReferralsList(){
		return service.dashboardTopReferrals(bean.getProduct(),branchCode,"admin");
	}
	

	public String adminMgt(){
		bean.setFrom("alist");
		bean.setFrom1("mlist");
		return "adminMgt";
	}

	public String editadmin(){
		bean.setFrom("aform");
		bean.setFrom1("mlist");
		bean.setIndex("0");
		if("edit".equals(bean.getMode()))
			service.getAdminInfo(bean, branchCode, appId);
		bean.setBranch(service.getBranch(branchCode));
		return "adminMgt";
	}

	public String editMenu(){
		bean.setFrom("alist");
		bean.setFrom1("mform");
		bean.setIndex("1");
		if("edit".equals(bean.getMode1()))
			service.getMenuInfo(bean, branchCode);
		return "adminMgt";
	}

	public String menuSave(){
		bean.setFrom("alist");
		bean.setFrom1("mform");
		bean.setIndex("1");
		try{
			validatemenu();
			if(!hasActionErrors()){
				if("new".equals(bean.getMode1())){
					service.insNewMenu(bean, branchCode);
					bean.setFrom1("addSuccess");
				}else if("edit".equals(bean.getMode1())){
					service.updateMenu(bean, branchCode);
					bean.setFrom1("updateSuccess");
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return "adminMgt";
	}
	public String adminSave(){
		bean.setFrom("aform");
		bean.setFrom1("mlist");
		bean.setIndex("0");
		String pid="";
		if(bean.getProductID()!=null && bean.getProductID().length>0){
			for(String str: bean.getProductID())
				pid=pid+","+str;
			pid=pid.substring(1);
		}
		bean.setProduct(pid);
		try{
			service.insertNewAdmin(bean,branchCode , appId);
			validation();
			//validateadmin();
			if(!hasActionErrors()){
				if("new".equals(bean.getMode())){
					bean.setFrom("addSuccess");
				}else if("edit".equals(bean.getMode())){
					bean.setFrom("updateSuccess");
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return "adminMgt";
	}

	public String menuSelection(){
		return "menuSelect";
	}

	public String brokerSelection(){
		return "brokerSelect";
	}
	public String branchSelection(){
		return "branchSelect";
	}
	public String ajaxList(){
		return "ajax";
	}

	public void validatemenu(){
		if(StringUtils.isBlank(bean.getMname()))
			addActionError(getText("error.menu.name.required"));
		if(StringUtils.isBlank(bean.getUrlPath()))
			addActionError(getText("error.url.path.required"));
		if(StringUtils.isBlank(bean.getParent()))
			addActionError(getText("error.parent.required"));
		if(StringUtils.isBlank(bean.getStatus()))
			addActionError(getText("error.status.required"));
	}

	public void validateadmin(){
		if(StringUtils.isBlank(bean.getUtype()))
			addActionError(getText("error.admin.utype.required"));
		if(StringUtils.isBlank(bean.getBranchId()))
			addActionError(getText("error.policy.report.branch.invalid"));
		if(StringUtils.isBlank(bean.getUname()))
			addActionError(getText("error.admin.uname.required"));
		if(StringUtils.isBlank(bean.getLoginID()))
			addActionError(getText("error.admin.loginid.required"));
		else if(StringUtils.contains(bean.getLoginID(), " "))
			addActionError("Login Id should not contain white spaces");
		if("new".equals(bean.getMode())){
			if(cservice.getAdminInfo(bean.getLoginID()).size()>0)
				addActionError(getText("error.loginid.notavailable"));
			if(StringUtils.isBlank(bean.getPwd()))
				addActionError(getText("error.admin.pwd.required"));
			else if(StringUtils.contains(bean.getPwd(), " "))
				addActionError("Password should not contain white spaces");
		}if(StringUtils.isBlank(bean.getProduct()))
			addActionError(getText("error.admin.product.required"));
		if(StringUtils.isBlank(bean.getMid()))
			addActionError(getText("error.admin.mid.required"));
		//if(StringUtils.isBlank(bean.getBroker()))
		//addActionError(getText("error.admin.broker.required"));
		if(StringUtils.isBlank(bean.getEmail()))
			addActionError(getText("error.admin.email.required"));
		else if(StringUtils.contains(bean.getEmail(), " "))
			addActionError("Email Id should not contain white spaces");
		else if("invalid".equalsIgnoreCase(validation.emailValidate(bean.getEmail())))
			addActionError(getText("error.admin.email.invalid"));
		if(StringUtils.isBlank(bean.getStatus()))
			addActionError(getText("error.admin.status.required"));
	}
	public String getPopUpList(){
		String proposalNo=String.valueOf(session.get("proposalNo")==null?"":session.get("proposalNo"));

		bean.setProposalNo(proposalNo);
		service.getPopUpList(bean,branchCode);
		return "clauses";
	} 
	public String getOthers(){
		try{
			String proposalNo=String.valueOf(session.get("proposalNo")==null?"":session.get("proposalNo"));
			String openCoverNo=String.valueOf(session.get("openCoverNo")==null?"":session.get("openCoverNo"));
			bean.setProposalNo(proposalNo);
			bean.setOpenCoverNo(openCoverNo);
			if("proceed".equalsIgnoreCase(bean.getFrom())){
				boolean covers = validateOptionalCovers();
				if(!hasActionErrors()){
					int i=0;
					i=service.saveOptionalCovers(bean);
					if(i>0){
						service.getOptionalCoverList(branchCode, bean);
						bean.setFrom1("second");
					}
				}else{
					bean.setFrom1("first"); 
					service.getOptionalCoverList(branchCode, bean);
				}
			}else{
				bean.setFrom1("first"); 
				service.getOptionalCoverList(branchCode, bean);
				if(StringUtils.isBlank(bean.getEffectDate())){
					Calendar cal=Calendar.getInstance();
					int date=cal.get(Calendar.DAY_OF_MONTH);
					int month=cal.get(Calendar.MONTH)+1;
					int year=cal.get(Calendar.YEAR);
					bean.setEffectDate(date+"-"+month+"-"+year);
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return "others";    	
	}
	private boolean validateOptionalCovers(){
		boolean result=true;
		try{
			if(StringUtils.isBlank(bean.getEffectDate())){
				addActionError(getText("optional.effective.date.empty"));
			}
			if(null!=bean.getOptionalId()){
				int i=0;
				Iterator<String> iterator=bean.getOptionalId().iterator();
				while(iterator.hasNext()){
					if(!"false".equalsIgnoreCase(iterator.next())){
						i=i+1; 
					}
				}
				if(i==0){
					result=false;
				}
			}else{
				addActionError(getText("optional.covers.empty"));
			}

		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public String paymentTerms(){
 		bean.setReqFrom(StringUtils.isBlank(bean.getReqFrom())?"display":bean.getReqFrom());
		if("display".equalsIgnoreCase(bean.getReqFrom())){
			bean.setUserSelection(service.getUserSelection(bean));
			bean.setPaymentTermsDetails(service.getPaymentTermsDetails(bean));

		}else if("paymentTermsView".equalsIgnoreCase(bean.getReqFrom())){

			bean.setPaymentTerms(service.getPaymentTerms(bean));
			bean.setPaymentTermsDetails(service.getPaymentTermsList(bean));
			bean.setOpenCoverNoList(service.getOpenCoverNoList(bean));
			
		
		}
		else if("paymentTermsNew".equalsIgnoreCase(bean.getReqFrom())){
			bean.setPaymentTerms(service.getPaymentTerms(bean));
			bean.setPaymentTermsDetails(service.getPaymentTermsList(bean));
			bean.setOpenCoverNoList(service.getOpenCoverNoList(bean));
			
		}else if("paymentTermsDel".equalsIgnoreCase(bean.getReqFrom())){
			deletePayment();
			bean.setPaymentTerms(service.getPaymentTerms(bean));
			bean.setOpenCoverNoList(service.getOpenCoverNoList(bean));
			addActionMessage("Record was deleted but not saved.Kindly Update Installment");
		}
		return "paymentTerms";

	}
	public void deletePayment(){
		 List<Object> list=new ArrayList<Object>();
			for(int i=0; i<bean.getDueList().size();i++){
				if(StringUtils.isNotBlank(bean.getDueList().get(i))){
					Map <String, Object> tempMap=new HashMap<String, Object>();
					tempMap.put("MISSIPPI_OPENCOVER_NO",bean.getOpenCoverNum().get(i));
					tempMap.put("DUE_AMOUNT",bean.getDueamount().get(i));
					tempMap.put("DUE_DATE",bean.getDueDate().get(i));
					tempMap.put("DUE_PERCENTAGE",bean.getDuepercent().get(i));
					tempMap.put("EFFECTIVE_DATE",bean.getEffectiveDate().get(i));
					list.add(tempMap);	
				}
				
			}
			bean.setPaymentTermsDetails(list);
	}
	public String updateDueDetails(){
		if("addNew".equalsIgnoreCase(bean.getReqFrom())){
			validateDueInsert();
		}else
			validateDueEdit();
		if(!hasActionErrors()){
			service.insertDueDetails(bean);
			addActionMessage("Payment Terms Updated Sucessfully");
		}
		bean.setReqFrom("paymentTermsNew");
		bean.setPaymentTerms(service.getPaymentTerms(bean));
		//bean.setPaymentTermsDetails(service.getPaymentTermsList(bean));
		bean.setOpenCoverNoList(service.getOpenCoverNoList(bean));
		return "paymentTerms";

	}
	private void validateDueEdit(){
		
		if(StringUtils.isBlank(bean.getOpenCoverNum().get(0))){
			addActionError("Please Select Open Cover No at Row ");
		}
		
		
		if(StringUtils.isBlank(bean.getDueamount().get(0))){
			addActionError("Please Enter Due Amount");
		}
		if(StringUtils.isBlank(bean.getDueDate().get(0))){
			addActionError("Please Select Due Date");
		}
		if(StringUtils.isBlank(bean.getEffectiveDate().get(0))){
			addActionError("Please Select Effective Date");
		}
		if(StringUtils.isBlank(bean.getDuepercent().get(0))){
			addActionError("Please Select Due Percent");
		}
	}
	private void validateDueInsert(){
		
		List<String> error =service.validatePaymentTerms(bean.getProposalNo(), bean.getMissippiOpenCoverNo(), bean.getDueDate(), bean.getDueamount()
				, bean.getDuepercent(), bean.getEffectiveDate(), bean.getDueList(), bean.getOpenCoverPremium(), branchCode);
		for(int i=0; i<error.size();i++){
			addActionError(error.get(i));
			//result="error";
		}
		 List<Object> list=new ArrayList<Object>();
		for(int i=0; i<bean.getDueList().size();i++){
			
			Map <String, Object> tempMap=new HashMap<String, Object>();
			tempMap.put("MISSIPPI_OPENCOVER_NO",bean.getOpenCoverNum().get(i));
			tempMap.put("DUE_AMOUNT",bean.getDueamount().get(i));
			tempMap.put("DUE_DATE",bean.getDueDate().get(i));
			tempMap.put("DUE_PERCENTAGE",bean.getDuepercent().get(i));
			tempMap.put("EFFECTIVE_DATE",bean.getEffectiveDate().get(i));
			list.add(tempMap);
			/*
			
			if(StringUtils.isBlank(bean.getOpenCoverNum().get(i))){
				addActionError("Please Select Open Cover No at Row "+ (i+1));
			}
			
			if(StringUtils.isBlank(bean.getDueamount().get(i))){
				addActionError("Please Enter Due Amount at Row "+ (i+1));
			}
			if(StringUtils.isBlank(bean.getDueDate().get(i))){
				addActionError("Please Select Due Date at Row "+ (i+1));
			}
			if(StringUtils.isBlank(bean.getEffectiveDate().get(i))){
				addActionError("Please Select Effective Date at Row "+ (i+1));
			}
			if(StringUtils.isBlank(bean.getDuepercent().get(i))){
				addActionError("Please Select Due Percent at Row "+ (i+1));
			}
		*/}
		
		bean.setPaymentTermsDetails(list);

	}
	
	public String chartReport(){
		bean.setDashBoard(service.getDashBoard(login_id,bean,branchCode));
		return "adminHome";
	}
	public void validation() {
		if(bean.getErrors()!=null && bean.getErrors().size()>0) {
			for (int i =0;i<bean.getErrors().size();i++) {
				HashMap<String, Object> map=bean.getErrors().get(i);
				addActionError(map.get("Message").toString());
			}
		}
	}

}