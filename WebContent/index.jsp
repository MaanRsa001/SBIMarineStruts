<!--
    Author     : Shanish 
	Document   : Common Login Template
-->
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <%--  <base href="<%=basePath%>"> --%>
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge"/>
    <script>
		if (window.XMLHttpRequest) {
				window.location.href += "#";
				setTimeout("changeHashAgain()", "50");
				var storedHash = window.location.hash;
				window.setInterval(function() {
					if (window.location.hash != storedHash) {
						window.location.hash = storedHash;
					}
				}, 50);
				
	    	}else if (window.ActiveXObject) { // IE
				window.location.hash="no-back-button";
				window.location.hash="Again-No-back-button";//again because google chrome don't insert first hash into history
				window.onhashchange=function(){window.location.hash="no-back-button";}
	   		}
			appPath = "<%=request.getContextPath()%>/";
			
			function changeHashAgain() {
				window.location.href += "1";
			}
	</script>
  </head>
  <body onload="formSubmit()">
  	<form action="Loginlanding.do" method="post" name="home" id="home">
  		<s:token />
  	</form>
  </body>
  <script type="text/javascript">
	function formSubmit(){		
		document.home.submit();
	}
  </script>
</html>