<%@ page language="java" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<META http-equiv=Content-Type content="text/html; charset=windows-1252">
<META content="MSHTML 6.00.2600.0" name=GENERATOR>
<LINK href="<%=request.getContextPath()%>/css/skin1.css" type=text/css rel=stylesheet>

<div class="footer_body" style="background: #194d8b;">
	<div class="row">
		<div class="col-md-6" align="center" style="line-height: 50px;">
			COPYRIGHTS &nbsp; &copy; &nbsp; SBI Cooperative Insurance Company 
		</div>
		
	</div>	
	<SCRIPT type="text/javascript">
	<s:if test='%{"ar".equalsIgnoreCase(#session.isArabic)}'>		
		setLang(document.getElementById('abar'), '<s:property value="#myurl"/>', 'ar');
	</s:if>
	</SCRIPT>
	
	
</div>
