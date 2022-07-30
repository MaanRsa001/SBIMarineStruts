package com.maan.common.home;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.json.annotations.JSON;

import com.maan.adminnew.common.CommonService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class HomeAction extends ActionSupport implements ModelDriven<HomeBean> {

	private static final long serialVersionUID = 1L;

	private final Map<String, Object> session=ActionContext.getContext().getSession();
	private final String loginId = (String)session.get("user");
	private final String LoginIdType = (String)session.get("LoginIdType");
	private final String userType = (String)session.get("usertype");
	private final String selectedBranch = (String)session.get("selectedBranch");
	
	private HomeBean bean = new HomeBean();
	private HomeService service = new HomeService();
	
	public HomeBean getModel() {
		return bean;
	}
	
	/*public String User() {
		return "productSelection";
	}*/
	
	public String User() {
		if(session!=null && session.size()>0 && StringUtils.isNotBlank(loginId)){

			try {
				removeSessionVariables();
				if("RSAIssuer".equalsIgnoreCase(userType) || "Broker".equalsIgnoreCase(userType) || "User".equalsIgnoreCase(userType)) {
					String actualBranch = session.get("LoginBranchCode1")==null?"01":session.get("LoginBranchCode1").toString();
					String branchCode=!("Broker".equalsIgnoreCase(LoginIdType) || "User".equalsIgnoreCase(LoginIdType))?selectedBranch:actualBranch;
					Map<String,String> brokerUserDetails =new CommonService().getBrokerUserDetails(branchCode);
					boolean issuerCondition=("RSAIssuer".equalsIgnoreCase(userType) && "admin".equalsIgnoreCase(LoginIdType)) ;
					
					session.put("LoginBranchCode",issuerCondition?selectedBranch: branchCode);//Default Branch Code
					session.put("adminBranch",issuerCondition?selectedBranch: actualBranch);//Actual Branch Code
					session.put("defaultBranch", branchCode);
					session.put("BrokerDetails", brokerUserDetails);
					session.put("LANG", brokerUserDetails.get("LANG"));
					//For Issuer
					if(service.isIssuer(userType)) {
						session.put("RSAISSUER", (String) session.get("user"));
					}
					if(service.getIsBrokerHasDC(loginId)) {
						session.put("CDMenu","Yes");
					}
				}
				//session.put("ProductDetails", service.getProductDetails(loginId, userType, (String)session.get("LoginBranchCode")));
				
			} catch(Exception exception) {
				//logger.debug(exception);
			}
			
		
		} 
		return "productSelection";
	}
	
	@JSON(serialize=false)
	public List<Map<String,Object>> getOfficeProductScheme() {
		return service.getOfficeProductScheme(loginId, (String)session.get("LoginBranchCode"));
	}
	
	private void removeSessionVariables() throws Exception {
		if(session.get("language") != null) {
	        session.remove("language");
		} if(session.get("freight")!=null) {
			session.remove("freight");
		} if(session.get("freightBroker")!=null) {
			session.remove("freightBroker");
		} if(session.get("product_id")!=null) {
			session.remove("product_id");
		} if(session.get("typeOfProduct")!=null) {
			session.remove("typeOfProduct");
		} if(session.get("quoteNo")!=null) {
			session.remove("quoteNo");
		} if(session.get("openCoverNo") !=null) {
			session.remove("openCoverNo");
		} if(session.get("brokerCode") !=null) {
			session.remove("brokerCode");
		}
	}

}
