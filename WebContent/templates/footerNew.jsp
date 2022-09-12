<%@ page language="java" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<META content="MSHTML 6.00.2600.0" name=GENERATOR>
<LINK href="<%=request.getContextPath()%>/css/skin1.css" type=text/css rel=stylesheet>

<div class="footer_body" style="background: #0A5676;">
	<div class="row">
		<div class="col-md-6" align="center" style="line-height: 50px; color: #FFFFFF;">
			COPYRIGHTS &nbsp; &copy; &nbsp; SBI Cooperative Insurance Company
		</div>
		<div class="col-md-6" align="right">	
		<%--<s:if test='%{#session.user==null || "".equals(#session.user) ||(#session.LoginType=="B2C" && #session.user1!=getText("admin")) }'>
			<a href="<%=request.getContextPath()%>/Loginlanding.action" style="color: #FFC107;"><i>...</i></a>	
		</s:if>--%>	
			<img alt="Payment GateWay Images" src='<%=request.getContextPath()%>/images/<s:text name="img.paymentComapny" />' />
		</div>
	</div>
	<SCRIPT type="text/javascript">
	<s:if test='%{"ar".equalsIgnoreCase(#session.isArabic)}'>
		setLang(document.getElementById('abar'), '<s:property value="#myurl"/>', 'ar');
	</s:if>
	</SCRIPT>
</div>
