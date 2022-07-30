<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML>
<html <s:if test="locale.language == 'ar'">dir="rtl"</s:if> >

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	<meta name="description" content="">
	<meta name="keywords" content="Maan Sarovar, Sea Trans, Marine Insurance">	
	<meta name="author" content="">	
	<title><tiles:insertAttribute name="title" /></title>
	<!-- Favicon-->
	<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/AlRajhi_icon_header.jpg" />
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">
    <!-- Slim Menu Css -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/slimmenu.css">
	
    <!-- Bootstrap Core Css--> 
    <s:if test="locale.language == 'ar'">
    <link href="<%=request.getContextPath()%>/assets/plugins/bootstrap/css/bootstrap-rtl.css" rel="stylesheet">
    </s:if>
    <s:else>
    <link href="<%=request.getContextPath()%>/assets/plugins/bootstrap/css/bootstrap.css" rel="stylesheet">
    </s:else>
    
    
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
       
    <link rel="stylesheet" href="<%=request.getContextPath()%>/datepicker/jquery.calendars.picker.css">
      
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/Hijri.js"></script>
	<script src="<%=request.getContextPath()%>/bootstrap/js/modernizr.custom.63321.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/bootstrap/js/jquery-1.9.1.min.js"></script>
</head>
<body>
<div class="theme-AlRajhi">
	<!-- Page Loader -->
    <div class="page-loader-wrapper">
        <div class="loader">
            <div class="md-preloader pl-size-md">
              <%-- <svg viewbox="0 0 75 75">
                    <circle cx="37.5" cy="37.5" r="33.5" class="pl-red" stroke-width="4" />
                </svg> --%> 
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
    <section class="menu">
    	<tiles:insertAttribute name="menu" />
    </section>
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
<script type="text/javascript" src="<%=request.getContextPath()%>/bootstrap/js/jquery.slimmenu.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/bootstrap/js/jquery.easing.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/bootstrap/js/easy-responsive-tabs.js"></script>
<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap-multiselect.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap-3.2.0.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/bootstrap/js/app-js.js" type="text/javascript"></script>



<script src="<%=request.getContextPath()%>/datepicker/jquery.plugin.js"></script>
<script src="<%=request.getContextPath()%>/datepicker/jquery.calendars.js"></script>
<script src="<%=request.getContextPath()%>/datepicker/jquery.calendars.plus.js"></script>
<script src="<%=request.getContextPath()%>/datepicker/jquery.calendars.picker.js"></script>
<script src="<%=request.getContextPath()%>/datepicker/jquery.calendars.islamic.js"></script>
<script src="<%=request.getContextPath()%>/datepicker/date.format.js"></script>
<script type="text/javascript">
var calendar = $.calendars.instance('islamic');
$('#hijriDatepicker').calendarsPicker({calendar: calendar,dateFormat: 'dd/mm/yyyy',onSelect: function(dates) { getGregorianDate(dates); }});
$('#dobArDatepicker').calendarsPicker({
	calendar: calendar,
	dateFormat: 'dd/mm/yyyy',
	minDate : "-100Y",
	maxDate : "-17Y"
});
//$('#hijriDatepicker').calendarsPicker({calendar: calendar});
function getGregorianDate(val) {
	alert(val);
	var dteSplit = val.toString().split("-");
	var yr = dteSplit[0]; //special yr format, take last 2 digits
	var month = dteSplit[1];
	var month1 = parseInt(month,0)-1;	
	var day = dteSplit[2];
	var day1 = parseInt(day,0)-2;
	var formatteddate = day1+"/"+month1+"/"+yr;
	alert(formatteddate);
	var date2 = HijriJS.toGregorian(formatteddate);
	alert(date2);
	var date5 = dateFormat(new Date(date2), 'dd/mm/yyyy');
	$('#hijriIstmaraED').val(date5);
}
</script>
<script type="text/javascript">
if (typeof jQuery === "undefined") {
    throw new Error("jQuery plugins need to be before this file");
}
setTimeout(function () { $('.page-loader-wrapper').fadeOut(); }, 50);
</script>
</body>
</html>
