<%@ page language="java" import="java.util.*,java.sql.Connection" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="java.util.*,java.io.*,java.text.*" %>
<html>
<head>
    <link href="https://fonts.googleapis.com/css2?family=Titillium+Web:wght@300;600;700;900&display=swap" rel="stylesheet"/>
</head>
<style>
.companylogo{
   width:165px;
  }
  .logoimagediv{
  width:155px;
  background-color:white;
  padding:5px;
  margin-top: 7px;
  margin-left: 10px;
  border-radius: 11px;
  }
@media only screen and (max-width: 600px) {
  .companylogo{
   width:100px;
  }
  .logoimagediv{
  margin: auto;
  }
  
}
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


.menulink a{
color:white;
}

</style>
<body>
	<s:url forceAddSchemeHostAndPort="true" includeParams="all" var="myurl" escapeAmp="false" encode="false">
		<s:param name="request_locale"/>
	</s:url>
	
	<div>
	    <div class="row">
	         <div class="col-lg-4 col-md-4 col-sm-6">
	            <div>
				   <div class="logoimagediv">
				   <img src="${pageContext.request.contextPath}/images/logonew.png" border="0" class="companylogo">
				   </div>
				</div>
	         </div>
	         <div class="col-md-4 col-lg-4 col-sm-6 col-md-offset-4 col-lg-offset-4">
	               <div>
						<font color="red" style="color:#F8F8FF;font-weight:700;font-size: 30px;font-family: 'Titillium Web', sans-serif;"><s:property value="#session.userLoginMode"/>&nbsp;&nbsp;Environment</font> <br/>
						<span style="font-size: 14px" class="menulink">
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
									<font style="font-weight: bold;color:#F8F8FF"> LoginId&nbsp;:&nbsp;&nbsp;<s:property value="#session.user"/></font>
								</s:else>
						 	</s:if>
						</span>
					</div>
	         </div>
	    </div>
	
		<form action="" method="post" name="header" id="headerId">
	  		<s:token/>
	  	</form>
	</div>
	<br>
	
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
