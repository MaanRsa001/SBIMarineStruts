<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
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
	<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/SBI_icon_header.jpg" />
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/demo.css" />
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/font-awesome.css" />
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap-multiselect.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/datepicker3.css">	
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/jquery.mmenu.all.css" />
	<link href="<%=request.getContextPath()%>/bootstrap/css/footable-0.1.css" rel="stylesheet" type="text/css">
	<link href="<%=request.getContextPath()%>/bootstrap/css/table-res.css" rel="stylesheet" type="text/css">
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css" />
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/style.css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
	<script src="<%=request.getContextPath()%>/bootstrap/js/modernizr.custom.63321.js"></script>
	
	<style>
	  
.layoutHeader{
    box-shadow: rgb(0 0 0 / 15%) 0px 2px 8px;
    border-radius: 20px;
    background: url(images/newMarine8copy.jpg) no-repeat;
    background-size: cover;
    background-position: center bottom;
    width: 95%;
    margin: auto;
    min-height:130px;
    max-height:100%;
  
}

@media(max-width: 320px){ 
  .responsiveHeight{
height:130px !important;
	}
}

.responsiveHeight{
height:100px;
}
</style>
</head>
<body>
<div id="page" class="content">
	<div class="responsiveHeight">
	    <div class="layoutHeader navbar-fixed-top">
	        <tiles:insertAttribute name="header" />
	    </div>
		
	</div>
	<div class="body">
		<tiles:insertAttribute name="body" />
	</div>
	<br/>
	<div class="footer">
		<tiles:insertAttribute name="footer" />
	</div>
</div>
</body>
</html>
