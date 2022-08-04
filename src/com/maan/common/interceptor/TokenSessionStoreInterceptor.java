package com.maan.common.interceptor;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.Result;
import com.opensymphony.xwork2.util.ValueStack;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.HttpParameters;
import org.apache.struts2.interceptor.TokenInterceptor;
import org.apache.struts2.util.InvocationSessionStore;
import org.apache.struts2.util.TokenHelper;

public class TokenSessionStoreInterceptor
  extends TokenInterceptor
{
  private static final long serialVersionUID = -9032347965469098195L;
  
  protected String handleToken(ActionInvocation invocation)
    throws Exception
  {
    HttpSession session = ServletActionContext.getRequest().getSession(true);
    synchronized (session.getId().intern())
    {
      if (checkUnCheckAct(invocation) && !TokenHelper.validToken()) {
        return handleInvalidToken(invocation);
      }
      return handleValidToken(invocation);
    }
  }
  
  private boolean checkUnCheckAct(ActionInvocation invocation) throws Exception{
	  boolean res = true;
	  String[] checkStr = {"lcListQuotation","brokersListQuotation","executiveListQuotation","promotionalListQuotation","cityListQuotation",
			  "coverListQuotation","conveyanceListQuotation","packageListQuotation","agentListQuotation",
			  "percentListQuotation","toleranceListQuotation","initPremium","clausesPremium","customerSelectionQuotation",
			  "countryCityListQuotation","commodityListQuotation","vesselQuotation","addCommodityQuotation",
			  "vesselListQuotation","pdfReport","viewpdfReport","searchReport","getOCAjaxReferal","searchRefReferal",
			  "getSearchListAjaxPortfolio","editQuoteQuotation","reportReport","getListAjaxPortfolio","viewPortfolio",
			  "documentUploadAreport","userAjaxCommonRep","getRePolicyAreport","branchReportJasperAreport","HomeUser",
			  "integrationJasperReportAreport","viewUserMgm","brokerSelectionAdmin","menuSelectionAdmin","branchSelectionAdmin",
			  "editadminAdmin","editBrokerMgm","viewBrokerMgm","getBrokerAjaxBrokerMgm","editconveyanceRating","editcountrymasterRating",
			  "editcountryRating","editcommoditymasterRating","editcategorymasterRating","editbankmasterRating","editmaterialmasterRating",
			  "editwarratemasterRating","editpackagemasterRating","editsaletermmasterRating","edittolerancemasterRating","editcommodityexcessRating",
			  "editvesselmasterRating","editsettlingagentRating","editexchangemasterRating","editexchangeuploadRating","editcurrencymasterRating",
			  "editextracoverRating","editmodeoftransportRating","editwarrantymasterRating","editconstantMasterRating","editexclusionmasterRating",
			  "editcitymasterRating","editclauseRating","editwsrccRating","editcovermasterRating","editerrorRating","editexecutivemasterRating",
			  "conveyanceRating","countrymasterRating","Loginlanding","getFrgileQuotation","claimIntimation",
			  "countryRating","commoditymasterRating","categorymasterRating","bankmasterRating","materialmasterRating",
			  "warratemasterRating","packagemasterRating","saletermmasterRating","tolerancemasterRating","commodityexcessRating",
			  "vesselmasterRating","settlingagentRating","exchangemasterRating","exchangeuploadRating","currencymasterRating",
			  "extracoverRating","modeoftransportRating","warrantymasterRating","constantMasterRating","exclusionmasterRating",
			  "citymasterRating","clauseRating","wsrccRating","covermasterRating","errorRating","executivemasterRating","uploadRating","downloadRating",
			  "addClausesPremium","branchSelectionUnderwriterMgm","editUserMgm",
			  "lcListQuotation","brokersListQuotation","executiveListQuotation","promotionalListQuotation","customerSelectionQuotation",
			  "coverListQuotation","conveyanceListQuotation","packageListQuotation","agentListQuotation", "percentListQuotation","toleranceListQuotation",
			  "editQuoteQuotation","initPremium","clausesPremium","countryCityListQuotation","commodityListQuotation","vesselQuotation","addCommodityQuotation",
			  "vesselListQuotation","pdfReport","viewpdfReport","searchReport","getOCAjaxReferal","searchRefReferal","getSearchListAjaxPortfolio","reportReport",
			  "getListAjaxPortfolio","viewPortfolio","documentUploadAreport","userAjaxCommonRep","getRePolicyAreport","branchReportJasperAreport","HomeUser",
			  "integrationJasperReportAreport","viewUserMgm","brokerSelectionAdmin","menuSelectionAdmin","branchSelectionAdmin","editadminAdmin","editBrokerMgm",
			  "viewBrokerMgm","getBrokerAjaxBrokerMgm","editconveyanceRating","editcountrymasterRating","editcountryRating","editcommoditymasterRating",
			  "editcategorymasterRating","editbankmasterRating","editmaterialmasterRating","editwarratemasterRating","editpackagemasterRating",
			  "editsaletermmasterRating","edittolerancemasterRating","editcommodityexcessRating","editvesselmasterRating","editsettlingagentRating",
			  "editexchangemasterRating","editexchangeuploadRating","editcurrencymasterRating", "editextracoverRating","editmodeoftransportRating",
			  "editwarrantymasterRating","editconstantMasterRating","editexclusionmasterRating","editcitymasterRating","editclauseRating","editwsrccRating",
			  "editcovermasterRating","editerrorRating","editexecutivemasterRating","conveyanceRating","countrymasterRating","countryRating","commoditymasterRating",
			  "categorymasterRating","bankmasterRating","materialmasterRating","warratemasterRating","packagemasterRating","saletermmasterRating","tolerancemasterRating",
			  "commodityexcessRating","vesselmasterRating","settlingagentRating","exchangemasterRating","exchangeuploadRating","currencymasterRating",
			  "extracoverRating","modeoftransportRating","warrantymasterRating","constantMasterRating","exclusionmasterRating","citymasterRating","clauseRating",
			  "wsrccRating","covermasterRating","errorRating","executivemasterRating","uploadRating","downloadRating","exchangeListQuotation","expoexchangeListQuotation",
			  "brokersListQuotation","yachtexecutiveListQuotation","yachtbrokersListYacht","yachtexecutiveListYacht","addClausesPremium","addClauseYacht","clausesYacht",
			  "addClauseConditionsYacht","downloadLcFileReport","deleteLcFilePremium","updateConditionsPremium","documentReport","scheduleReport","initReport",
			  "paymentExcelDownloadAreport","Loginout","customerSelectionYacht","customerSelectionAjYacht","updateConditionsYacht","Loginpage","excelDownloadReport",
			  "BrokerDisplayContoller","addProductBrokerMgm","deleteProductBrokerMgm","editUserMgm","UserCreationContoller","adminMgtAdmin","UnderwriterCreationContoller",
			  "branchSelectionUnderwriterMgm","openPortfolio","integrationAreport","policyAreport","branchAreport","openCoverAreport","paymentreportAreport",
			  "Ratingengine","editbranchmasterRating","editYacht","itemAjaxRating","editawnicmasterRating","editLovRating","editoccupationMasterRating","editClausesRating",
			  "editWarrantiesRating","editExclusionsRating","yachtreportAreport","payResPremium","policyEndListYacht","payResYacht","viewPremiumYacht","customerSelectionOpenCover","addNewCustomerOpenCover",
			  "quoteListAjaxOpenCover","getSecondPageOpenCover","countrypopUpOpenCover","commoditypopUpOpenCover","saletermpopUpOpenCover","tolerancepopUpOpenCover",
			  "chooseCustomerOpenCover","newQuoteOpenCover","savecommodityOpenCover","saveOrgCountryOpenCover","saveDestCountryOpenCover","saveSaletermOpenCover","saveToleranceOpenCover",
			  "commodityRateOpenCover","covertypePopupOpenCover","getOthersAdmin","clausesPopupCondition","warrantyPopupCondition","exclusionPopupCondition","warPopupCondition","othersPopupCondition",
			  "commoditycoverPopupOpenCover","addClausesCondition","addWarrantyCondition","addExclusionCondition","addWarCondition","addOthersCondition","savechcustomerOpenCover","copyQuoteOpenCover",
			  "insertCustomerNewOpenCover","editcustomerOpenCover","documentReportReg","searchListVessel","viewListVessel","pointingShips","shipDetailsReport","LoginbranchSelection",
			  "getListAjaxRating","pointingVessel","checkCodeVerify","getOCCertificateUserMgm","openCoverJasperAreport","dashboardInfoAreport","openCoverdetailJasperAreport",
			  "uploadDocument","submitDocument","downloadDocument","deleteDocument","documentpdfReport","viewdocPortfolio","uploadOpenUpload","listOpenUpload","errorOpenUpload","redirectOpenUpload","downloadOpenUpload","integrationAreport",
			  "documentUploadAreport"};
	  for(String str: checkStr) {
		  if(str.equals(invocation.getProxy().getActionName())) {
			  return false;
		  }
	  }
	return res;
}

protected String handleInvalidToken(ActionInvocation invocation)
    throws Exception
  {
    ActionContext ac = invocation.getInvocationContext();
    
    HttpServletRequest request = (HttpServletRequest)ac.get("com.opensymphony.xwork2.dispatcher.HttpServletRequest");
    HttpServletResponse response = (HttpServletResponse)ac.get("com.opensymphony.xwork2.dispatcher.HttpServletResponse");
    String tokenName = TokenHelper.getTokenName();
    String token = TokenHelper.getToken(tokenName);
    if ((tokenName != null) && (token != null))
    {
      HttpParameters params = ac.getParameters();
      params.remove(tokenName);
      params.remove("struts.token.name");
      
      String sessionTokenName = TokenHelper.buildTokenSessionAttributeName(tokenName);
      ActionInvocation savedInvocation = InvocationSessionStore.loadInvocation(sessionTokenName, token);
      if (savedInvocation != null)
      {
        ValueStack stack = savedInvocation.getStack();
        request.setAttribute("struts.valueStack", stack);
        
        ActionContext savedContext = savedInvocation.getInvocationContext();
        savedContext.getContextMap().put("com.opensymphony.xwork2.dispatcher.HttpServletRequest", request);
        savedContext.getContextMap().put("com.opensymphony.xwork2.dispatcher.HttpServletResponse", response);
        Result result = savedInvocation.getResult();
        if ((result != null) && (savedInvocation.getProxy().getExecuteResult())) {
          result.execute(savedInvocation);
        }
        invocation.getProxy().setExecuteResult(false);
        
        return savedInvocation.getResultCode();
      }
    }
    return "invalid.token";
  }
  
  protected String handleValidToken(ActionInvocation invocation)
    throws Exception
  {
    String key = TokenHelper.getTokenName();
    String token = TokenHelper.getToken(key);
    String sessionTokenName = TokenHelper.buildTokenSessionAttributeName(key);
    InvocationSessionStore.storeInvocation(sessionTokenName, token, invocation);
    
    return invocation.invoke();
  }
}
