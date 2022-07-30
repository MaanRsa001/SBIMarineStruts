<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="keywords" content="Maan Sarovar, Sea Trans, Marine Insurance">	
	<meta name="author" content="">
	<title><tiles:insertAttribute name="title" /></title>
	 <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/demo.css" /> 
	<%--<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/font-awesome.min.css" /> 
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap-multiselect.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/datepicker3.css">	 
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/slimmenu.css">--%>
	 <link href="<%=request.getContextPath()%>/bootstrap/css/footable-0.1.css" rel="stylesheet" type="text/css">
	<link href="<%=request.getContextPath()%>/bootstrap/css/table-res.css" rel="stylesheet" type="text/css">
	<link href="<%=request.getContextPath()%>/bootstrap/css/easy-responsive-tabs.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datepicker/datetimepicker/jquery.datetimepicker.min.css"/> 
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css" />
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/style.css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
	<script src="<%=request.getContextPath()%>/bootstrap/js/modernizr.custom.63321.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/bootstrap/js/jquery-1.9.1.min.js"></script>
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/select2.css" rel="stylesheet"/>
	<link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Titillium+Web:wght@300;600;700;900&display=swap" rel="stylesheet"/>
<!-- my css-->

<link rel="stylesheet" type="text/css" href="assets/css/main.css">
<link rel="stylesheet" type="text/css" href="assets/css/fair-j.css">
<!-- my end css -->

<!-- Site Icons -->

<!-- Bootstrap CSS -->
<!-- <link rel="stylesheet" href="assets/css/bootstrap.min.css"> -->
<!-- Site CSS -->
<link rel="stylesheet" href="host_fair.css"> 
<!-- Colors CSS -->
<link rel="stylesheet" href="assets/css/colors.css">
<!-- ALL VERSION CSS -->
<link rel="stylesheet" href="assets/css/versions.css">
<!-- Responsive CSS -->
<link rel="stylesheet" href="assets/css/responsive.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="assets/css/custom.css">

<%-- <link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/datepicker/jquery-ui.css"> --%>

<!-- Modernizer for Portfolio -->
<%-- <script src="js/modernizer.js"></script>
<!-- ALL JS FILES -->
<script src="js/all.js"></script> --%>
<meta charset="ISO-8859-1">	
</head>
<style type="text/css">
	body {
	font-family: 'Titillium Web', sans-serif;
    color: #000;
    font-size: 16px !important;
    background-color:#F8F8FF;
}
	<style>
label {
	padding-top: 7px;
	margin-bottom: 0;
	font-size: 17px;
	font-weight: 400;
	font-family: 'Titillium Web', sans-serif;
}



</style>
<body>
<div id="page" class="content">
	<div>
		<tiles:insertAttribute name="header" />
	</div>	
	<div>
		<tiles:insertAttribute name="menu" />
	</div>&nbsp; 
	<br class="clear"/>
	<div>
		<tiles:insertAttribute name="body" />
	</div>
	<br class="clear"/>
	<div class="footer">
		<tiles:insertAttribute name="footer" />
	</div>
</div>
<script type="text/javascript" src="<%=request.getContextPath()%>/bootstrap/js/jquery.slimmenu.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/bootstrap/js/jquery.easing.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/bootstrap/js/easy-responsive-tabs.js"></script>	
<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap-datepicker.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap-multiselect.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap-3.2.0.min.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/bootstrap/js/select2.js"></script>
<script src="<%=request.getContextPath()%>/datepicker/datetimepicker/jquery.datetimepicker.js"></script>
<script src="<%=request.getContextPath()%>/bootstrap/js/app-js.js" type="text/javascript"></script>
</body>
</html>