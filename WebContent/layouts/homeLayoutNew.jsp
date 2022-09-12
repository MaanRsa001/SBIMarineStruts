<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML>
<html <s:if test="locale.language == 'ar'">dir="rtl"</s:if>>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<meta name="description" content="">
	<meta name="keywords" content="Maan Sarovar, Sea Trans, Marine Insurance">	
	<meta name="author" content="">	
	<title><tiles:insertAttribute name="title" /></title>
	<!-- Favicon-->
	<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/SBI_icon_header.jpg" />
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    
    <!-- Bootstrap Core Css -->
    <link href="<%=request.getContextPath()%>/assets/plugins/bootstrap/css/bootstrap.css" rel="stylesheet">
    
    <!-- Font Awesome Css -->
    <link href="<%=request.getContextPath()%>/assets/plugins/font-awesome/css/font-awesome.css" rel="stylesheet">

    <!-- Waves Effect Css -->
    <link href="<%=request.getContextPath()%>/assets/plugins/node-waves/waves.css" rel="stylesheet" />

    <!-- Animation Css -->
    <link href="<%=request.getContextPath()%>/assets/plugins/animate-css/animate.css" rel="stylesheet" />

    <!-- Preloader Css -->
    <link href="<%=request.getContextPath()%>/assets/plugins/material-design-preloader/md-preloader.css" rel="stylesheet" />

    <!-- Morris Chart Css-->
    <link href="<%=request.getContextPath()%>/assets/plugins/morrisjs/morris.css" rel="stylesheet" />

    <!-- Custom Css -->
    <link href="<%=request.getContextPath()%>/assets/css/style.css" rel="stylesheet">

    <!-- AdminBSB Themes. You can choose a theme from css/themes instead of get all themes -->
    <link href="<%=request.getContextPath()%>/assets/css/themes/all-themes.css" rel="stylesheet" />
    <script src="<%=request.getContextPath()%>/assets/plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap Core Js -->
    <script src="<%=request.getContextPath()%>/assets/plugins/bootstrap/js/bootstrap.js"></script>
</head>
<body>
<div class="theme-SBI">
	<!-- Page Loader -->
    <div class="page-loader-wrapper">
        <div class="loader">
            <div class="md-preloader pl-size-md">
             <%--   <svg viewbox="0 0 75 75">
                    <circle cx="37.5" cy="37.5" r="33.5" class="pl-red" stroke-width="4" />
                </svg>--%>
                <img alt="" src="<%=request.getContextPath()%>/images/logonew.png">
            </div>
            <p><s:text name="label.motor.pleasewait"/></p>
        </div>
    </div>    
    <div class="overlay"></div>
    <nav class="navbar">
        <div class="container-fluid">
        	<tiles:insertAttribute name="header" />            
        </div>
    </nav>
    <section class="content">
        <div class="container-fluid">
        	<tiles:insertAttribute name="body" />
        </div>
    </section>
	<br/>
	<div class="footer">
		<tiles:insertAttribute name="footer" />
	</div>
</div>
<script type="text/javascript">
if (typeof jQuery === "undefined") {
    throw new Error("jQuery plugins need to be before this file");
}
setTimeout(function () { $('.page-loader-wrapper').fadeOut(); }, 50);
</script>
</body>
</html>
