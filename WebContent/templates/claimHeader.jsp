<%@ page language="java" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="java.util.*,java.io.*,java.text.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<title>SBI</title>
</head>
<link href="<%=request.getContextPath()%>/css/styles.css" rel="stylesheet" type="text/css" />
<table border="0"  cellspacing="0" cellpadding="0" width="100%">
	<s:url forceAddSchemeHostAndPort="true" includeParams="all" var="myurl" escapeAmp="false" encode="false">
		<s:param name="request_locale"/>
	</s:url>
	<tr >
		<td bgColor=#ffffff width="20" align="right"></td>
		<td><img src="<%=request.getContextPath()%>/images/logonew.png" border="0" width="230" height="60"></td>
		<td bgColor=#ffffff width="400" align="right"><font color="red" style="font: bold;font-size: 30px;"><s:property value="#session.userLoginMode"/>&nbsp;&nbsp;Environment</font></td>
		<td bgColor=#ffffff width="300" align="right">
		
			<a href="<%=request.getContextPath()%>">Home</a>
		</td>
	 </tr>
</table>
<script type="text/javascript">
function setLang(obj, url, lang)
{
	url=url.replace('request_locale=', 'request_locale='+lang);
	obj.href=url;
}
</script>
