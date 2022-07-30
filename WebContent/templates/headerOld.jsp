<%@ page language="java" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="java.util.*,java.io.*,java.text.*" %>
<!DOCTYPE HTML>
<html>
<head>
<title>E-Way</title>
</head>
<body>
<div class="table0">
	<s:url forceAddSchemeHostAndPort="true" includeParams="all" var="myurl" escapeAmp="false" encode="false">
		<s:param name="request_locale"/>
	</s:url>
	<div class="tablerow" style="padding: 10px;">
		<div class="textfieldA">
			<img src="<%=request.getContextPath()%>/images/logonew.png" border="0">
		</div>
		<div class="textfieldA" align="right">
			<%--
			<s:if test='#session.LANG == "Y"'>
				<a href="" onclick="setLang(this, '<s:property value="#myurl"/>', 'en')" >English</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				<a href="" onclick="setLang(this, '<s:property value="#myurl"/>', 'ar')" >Arabic</a>&nbsp;&nbsp;&nbsp;&nbsp;
			</s:if>
			--%>
			<s:if test='#session.user!=null && !"".equalsIgnoreCase(#session.user)'>
				<s:if test="#session.user1==getText('admin')">
					<a onclick="tookAct('homeAdmin.action');" ><s:text name="label.motor.home"/></a>
				</s:if>
				<s:else>
					<a onclick="tookAct('HomeUser.action');" ><s:text name="label.motor.home"/></a>
				</s:else>
				<s:if test='#session.LoginType!="B2C"'>
					&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="tookAct('Loginout.action');">Sign Out</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<br/>
					<font style="font-weight: bold;color:#000000"> LoginId&nbsp;:&nbsp;&nbsp;<s:property value="#session.user"/></font>
				</s:if>
			</s:if>
		</div>
		<br class="clear"/>
	</div>		
</div>
</body>
<script type="text/javascript">
function tookAct(act){
	document.header.action ="${pageContext.request.contextPath}/"+act;
	document.header.submit();
}
function setLang(obj, url, lang)
{
	url=url.replace('request_locale=', 'request_locale='+lang);
	obj.href=url;
}
</script>
</html>