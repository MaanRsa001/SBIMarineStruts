<%@ page language="java" import="java.util.*,java.sql.Connection" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page import="java.util.*,java.io.*,java.text.*" %>
<div class="navbar-header">
	<s:url forceAddSchemeHostAndPort="true" includeParams="all" var="myurl" escapeAmp="false" encode="false">
		<s:param name="request_locale"/>
	</s:url>
    <a href="javascript:void(0);" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse" aria-expanded="false"></a>   
        <s:if test='%{(#session.user!=null && !"".equals(#session.user)) && #session.user1 != getText("admin")}'>
			<a class="navbar-brand" href="<%=request.getContextPath()%>/Loginb2bProduct.action"><img alt="SBI Logo" src="<%=request.getContextPath()%>/images/logonew.png"> </a>
		</s:if>
		<s:elseif test='%{#session.user1 == getText("admin")}'>
			<a class="navbar-brand" href="#" onclick="tookAct('HomeUser.action');" style="cursor:pointer"><img alt="SBI Logo" src="<%=request.getContextPath()%>/images/logonew.png"> </a>
		</s:elseif>
		<s:else>
			<a class="navbar-brand" href="<%=request.getContextPath()%>/Loginb2cProduct.action" style="z-index: 5; "><img alt="SBI Logo" src="<%=request.getContextPath()%>/images/logonew.png"> </a>
		</s:else>         
</div>
<div class="collapse navbar-collapse" id="navbar-collapse">
	<s:if test='%{#session.user1!=getText("admin")  }'>
	<ul class="nav navbar-nav navbar-right">
		<li>
			<a style='font-size: 12px;<s:property value='%{"Y".equals(fori18nLink)?"display:block;":"display:none;"}'/>' href="" onclick="setLang(this, '<s:property value="#myurl"/>', 'en')"  >English</a>
		</li>
		<li>
			<a style='font-size: 12px;<s:property value='%{"Y".equals(fori18nLink)?"display:block;":"display:none;"}'/>' href="" onclick="setLang(this, '<s:property value="#myurl"/>', 'ar')"  id="abar"><s:text name="عربي"/></a>
		</li>
	</ul>
	</s:if>
	<ul class="nav navbar-nav navbar-right">
		<s:if test='%{#session.user!=null && !"".equals(#session.user)}'>
			<li>
				<a href="<%=request.getContextPath()%>/Loginb2bProduct.action?request_locale=<s:property value='%{#session.isArabic}'/>"> <i class="fa fa-home"></i> <s:text name="label.motor.home"/></a>
			</li>
		</s:if>
		<s:else>
			<li>
				<a href="<%=request.getContextPath()%>/Loginb2cProduct.action?request_locale=<%=request.getParameter("request_locale")==null?"en":request.getParameter("request_locale")%>"> <i class="fa fa-home"></i> <s:text name="label.motor.home"/></a>
			</li>
		</s:else>
		<s:if test='%{#session.user==null || "".equals(#session.user) ||(#session.LoginType=="B2C" && #session.user1!=getText("admin")) }'>
			<%--
				<li>
					<a href="<%=request.getContextPath()%>/Loginlanding.action" style="color: #FFC107;"><i class="fa fa-user-secret"></i> Broker Login</a>
				</li>
			--%>
			<li>
				<a href="<%=request.getContextPath()%>/LoginregUser.action?request_locale=<%=request.getParameter("request_locale")==null?"en":request.getParameter("request_locale")%>" style="color: #FFC107;" ><i class="fa fa-user"></i><s:text name="label.bail.sign"/></a>
			</li>
		</s:if>
		<s:else>
			<li>
				<a href="#" style=";color: #FFC107;"> <s:text name="label.home.loginId"/>&nbsp;:&nbsp;&nbsp;<s:property value="#session.user"/></a>
			</li>
			<li>
				<a href="#"  onclick="tookAct('Loginout.action');" style="cursor:pointer"><s:text name="label.motor.signout"/></a>
			</li>
			
		</s:else>	
		
	</ul>	
	<s:hidden name="isArabic" id="isArabic"/>
	
		<form action="" method="post" name="header" id="headerId">
	  		<s:token/>
	  	</form>
</div>
<script type="text/javascript">
function tookAct(act){
	document.header.action ="${pageContext.request.contextPath}/"+act;
	document.header.submit();
}
function setLang(obj, url, lang) {
	$("#isArabic").val(lang);
	url=url.replace('request_locale=', 'request_locale='+lang);	
	url=url.replace('http','https');
	obj.href=url;
}
</script>