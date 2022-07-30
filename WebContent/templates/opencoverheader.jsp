<%@ page language="java" import="java.util.*,java.sql.Connection" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="java.util.*,java.io.*,java.text.*" %>
<html>
<head>
    <link href="https://fonts.googleapis.com/css2?family=Titillium+Web:wght@300;600;700;900&display=swap" rel="stylesheet"/>
</head>
<style>
body {
    font-family: 'Titillium Web', sans-serif;
    color: #000;
    font-size: 16px !important;
}
font {
	font-family: 'Titillium Web', sans-serif;
}
a {
font-family: 'Titillium Web', sans-serif;
}
.navbar-brand {
   
    padding: 7px 15px;
    
}

.pullRight a{
color:black;
font-weight:bold;
padding: 4px 7px;
border-radius: 21px;
background-color:#d0cdcd;
margin-top:3px;
}
.layoutHeader{
    box-shadow: rgb(0 0 0 / 15%) 0px 2px 8px;
    border-radius: 20px;
    width: 95%;
    margin: auto;
    min-height:100px;
    max-height:100%;
    background-color:white;
}
</style>
<body>
	<s:url forceAddSchemeHostAndPort="true" includeParams="all" var="myurl" escapeAmp="false" encode="false">
		<s:param name="request_locale"/>
	</s:url>
	<div class="layoutHeader navbar-fixed-top">
	
	
	
		<div class="pullLeft">
			 <div style="width:155px;background-color:white;padding:5px;margin-top: 7px;margin-left: 10px;border-radius: 11px;">
		   <img src="${pageContext.request.contextPath}/images/logonew.png" border="0" width="165px">
		   </div>
		</div>
		<div class="pullRight">
				<h4  style="margin:0;padding:0;line-height: 109% !important;color:#194d8b;font-weight:700;font-size: 30px;font-family: 'Titillium Web', sans-serif;">
				<s:property value="#session.userLoginMode"/>&nbsp;&nbsp;Environment
				</h4>
			<p style="font-size: 14px;padding-top:5px;margin:0;">
				<%--
				<s:if test="#session.user1==getText('admin')">
					<a href="${pageContext.request.contextPath}/homeAdmin.action">Home</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				</s:if>
				<s:else>
					<a href="${pageContext.request.contextPath}/HomeUser.action">Home</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				</s:else>
				--%>
				<s:if test="#session.user!='guest'">
					<a href="#" onclick="tookAct('HomeUser.action');" style="cursor:pointer">Home</a>&nbsp;&nbsp;|&nbsp;&nbsp;
					
					<s:if test='#session.product_id=="3" || #session.product_id=="11"'>
						<a href="mailto:n_susai@awnic.com" target='_blank'>Report a Problem</a>&nbsp;&nbsp;|&nbsp;&nbsp;
					</s:if>
					<s:elseif test='#session.product_id=="40"'>
						<a href="mailto:n_susai@awnic.com" target='_blank'>Report a Problem</a>&nbsp;&nbsp;|&nbsp;&nbsp;
					</s:elseif>
					
					<s:if test='%{#session.LoginType=="B2C" && #session.user1!=getText("admin")}'>
					</s:if>
					<s:else>
					<s:if test='%{#session.user1!=getText("admin")}'>
					<s:if test='#session.product_id=="3" || #session.product_id=="11"'>
						<a href='${pageContext.request.contextPath}/PDFFile/UserManual/Marine_B2B_User_Manual.pdf' target='_blank'>User Manual</a>&nbsp;&nbsp;|&nbsp;&nbsp;
					</s:if>
					<s:elseif test='#session.product_id=="40"'>
						<a href='${pageContext.request.contextPath}/PDFFile/UserManual/Yacht_B2B_User_Manual.pdf' target='_blank'>User Manual</a>&nbsp;&nbsp;|&nbsp;&nbsp;
					</s:elseif>
					
					</s:if>
						<a href="#"  onclick="tookAct('Loginout.action');" style="cursor:pointer">Sign Out</a>&nbsp;&nbsp;&nbsp;&nbsp;
	 				</s:else>
					<br/> <s:if test='%{#session.LoginType=="B2C" && #session.user1!=getText("admin")}'>
					</s:if>
					<s:else>
						<p style="font-weight: bold;color:black;padding-top:5px;margin:0;"> LoginId&nbsp;:&nbsp;&nbsp;<s:property value="#session.user"/></p>
					</s:else>
			 	</s:if>
			</p>
		</div>
		<br class="clear"/>
		<form action="" method="post" name="header" id="headerId">
	  		<s:token/>
	  	</form>
	</div>
</body>
<script type="text/javascript">
function tookAct(act){
	document.header.action ="${pageContext.request.contextPath}/"+act;
	document.header.submit();
}
function setLang(obj, url, lang) {
	url=url.replace('request_locale=', 'request_locale='+lang);
	obj.href=url;
}
</script>
</html>
