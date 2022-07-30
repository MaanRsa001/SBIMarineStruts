<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
	<title>AlRajhi - Access Denied</title>
	<link href="<%=request.getContextPath()%>/cssbootstrap/bootstrap.min.css" rel="STYLESHEET" type="text/css">
	<style type="text/css">
	.bringCenter {
		position: absolute;
	    top: 25%;
	    left: 25%;
	    width: 50%;
	}
	</style>
</head>
<body>
<div class="table0">
	<div class="tablerow">
		<div class="panel panel-danger bringCenter">
			<div class="panel-heading">
				AlRajhi
			</div>
			<div class="panel-body">
				<img alt="Error" src="<%=request.getContextPath()%>/images/error.gif"/>
				&nbsp; <b>Sorry, Access Denied</b>
			</div>
		</div>
	</div>
</div>
</body>
</html>