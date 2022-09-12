<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
     	<title><tiles:insertAttribute name="title" /></title>
		<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/SBI_icon_header.jpg" />
        <link href="css/easyui.css" rel="stylesheet" type="text/css">
        <link href="css/icon.css" rel="stylesheet" type="text/css">
        <link href="css/demo.css" rel="stylesheet" type="text/css">
        <link href="css/styles.css" rel="stylesheet" type="text/css" />
        <link href="css/ddlevelsmenu-topbar.css" rel="stylesheet" type="text/css" />
        <link href="css/ddlevelsmenu-base.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="js/tcal.js"></script>
        <script type="text/javascript" src="js/common.js"></script>
        <script src="js/ddlevelsmenu.js" type="text/javascript"></script>
        <script src="js/ddtabmenu.js" type="text/javascript"></script>        
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/datepicker3.css">
    </head>
    <body>
        <table border="0" cellpadding="0" cellspacing="0" align="center" width="900">
            <tr>
                <td height="70">
                    <table width="100%"/>
                        <tr><td><tiles:insertAttribute name="header" />
                     </td></tr></table>
                </td>
            </tr>
            <tr>
                <td height="20">
                    <table width="100%"/>
                        <tr><td><tiles:insertAttribute name="menu" />
                     </td></tr></table>
                </td>
            </tr>
            <tr>
                <td height="500" valign="top" >
                    <table width="100%"/>
                        <tr><td><br/><tiles:insertAttribute name="body" />
                     </td></tr></table>
                </td>
            </tr>
            <tr>
                <td height="30">
                    <table width="900" align="center"/>
                    <tr><td><tiles:insertAttribute name="footer" />
                     </td></tr></table>
                </td>
            </tr>
        </table>
    </body>
    <script type="text/javascript" src="<%=request.getContextPath()%>/bootstrap/js/jquery-1.9.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap-datepicker.js" type="text/javascript"></script>
    <script type="text/javascript">
    $(function() {
	try {
		
		$('#eff_date').datepicker({
			todayHighlight: true,
			yearRange: "-100:+0",
			format: "dd/mm/yyyy"			
		}).on('changeDate', function(e){
		    $(this).datepicker('hide');
		});
		$('#exmEffectiveDate').datepicker({
			todayHighlight: true,
			yearRange: "-100:+0",
			format: "dd/mm/yyyy"			
		}).on('changeDate', function(e){
		    $(this).datepicker('hide');
		});
		//Motor End
	} catch(err){}
});
    </script>
</html>
