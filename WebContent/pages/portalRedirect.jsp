<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML>
<html>
<head>
</head>
<body>
<s:form name="portalRedirect" theme="simple">
 <s:hidden name="loginId" value='%{#session.user}' />
 <s:hidden name="productId" value="%{product}"  />
 <s:hidden name="menuType" value="%{menuType}" />
 <s:hidden name="customerName" />
 <s:hidden name="email" />
 <s:hidden name="mobileNo" />
 <s:hidden name="companyRegNo" />
 <s:hidden name="request_local" />
 <!--  menuType=CHART&productId=65&quoteStatus=QE -->  
</s:form>
</body>
<script type="text/javascript"> 
editQuote();
function editQuote(){
	if(30=='<s:property value="product"/>') {
		document.portalRedirect.contentTypeId.value = contentTypeId;
		if(status!='RA') {
			document.portalRedirect.display.value='getQuote';
		}
		document.portalRedirect.action = "<%=request.getContextPath()%>/initHome.action";
	} else if(65=='<s:property value="product"/>') {
		document.portalRedirect.action = "<%=request.getContextPath()%>/editQuoteMotor.action";
	} else if(3=='<s:property value="product"/>' || 11=='<s:property value="product"/>') {
		document.portalRedirect.action = "<%=request.getContextPath()%>/editQuoteQuotation.action";
	}else if(33 == '<s:property value="product"/>'){
		document.portalRedirect.action = "<%=request.getContextPath()%>/initTravel.action";
	
	}
	document.portalRedirect.submit();
}
</script>
</html>