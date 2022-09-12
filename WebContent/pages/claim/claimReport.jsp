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
	<meta name="keywords" content="Maan Sarovar, SBI, Marine Insurance">	
	<meta name="author" content="">
	<title> ::: SBI Insurance - Login ::: </title>
	<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/logonew.png" />
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/demo.css" />
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/font-awesome.min.css" />
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap-multiselect.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/datepicker3.css">	 
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/slimmenu.css">
	<link href="<%=request.getContextPath()%>/bootstrap/css/footable-0.1.css" rel="stylesheet" type="text/css">
	<link href="<%=request.getContextPath()%>/bootstrap/css/table-res.css" rel="stylesheet" type="text/css">
	<link href="<%=request.getContextPath()%>/bootstrap/css/easy-responsive-tabs.css" rel="stylesheet" type="text/css">
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css" />
	<link href="<%=request.getContextPath()%>/bootstrap/css/loginStyle.css" rel="stylesheet" type="text/css">
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/style.css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/shortcut.js"></script>
	<script src="<%=request.getContextPath()%>/bootstrap/js/modernizr.custom.63321.js"></script>
	<script src="<%=request.getContextPath()%>/bootstrap/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript">
		window.history.forward();
		function noBack(){ 
		    window.history.forward(); 
		}
		if(document.attachEvent)
		    document.attachEvent("onkeydown", my_onkeydown_handler);
		function my_onkeydown_handler() {
		    switch (event.keyCode) {
		        case 116 : // 'F5'
		            event.returnValue = false;
		            event.keyCode = 0;
		            window.status = "Refresh Functionality Disabled";
		            break;
		    }
		}
		shortcut.add("f5",function() {window.status = "Refresh Functionality Disabled";});
		shortcut.add("Ctrl+f5",function() {window.status = "Refresh Functionality Disabled";});
		shortcut.add("Ctrl+r",function() {window.status = "Refresh Functionality Disabled";});
		shortcut.add("Ctrl+Shift+r",function() {window.status = "Refresh Functionality Disabled";});
		shortcut.add("Ctrl+n",function() {window.status = "New Window Functionality Disabled";});
		
		function callSubmit(){
		    document.form1.action="<%=request.getContextPath()%>/claimSearchPolicyNo.action";
		    document.form1.submit();
		}
	</script>
</head>
<!--[if lt IE 7 ]>   <body class="ie6">          <![endif]-->
<!--[if IE 7 ]>      <body class="ie7">          <![endif]-->
<!--[if IE 8 ]>      <body class="ie8">          <![endif]-->
<!--[if IE 9 ]>      <body class="ie9">          <![endif]-->
<!--[if (gt IE 9) ]> <body class="modern">       <![endif]-->
<!--[!(IE)]><!-->    <body class="notIE modern"> <!--<![endif]-->
<s:form name="form1" method="post" action="" theme="simple">
<div class="loginHolderMain">
	<div class="row">
		<div class="col-xs-12">
			<div class="headerMain">
				<div class="row">
					<div class="col-xs-12">
						<br/>
						<a href="#">
							<img src="<%=request.getContextPath()%>/images/logonew.png" alt="Welcome to SBI Insurance" >
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<div class="contentMain">
				<div class="row" style="background: #6c96ae;">
					<div class="col-xs-12 col-md-4" style="padding-right: 0px; width: auto;padding-left:0px;">
						<table width="100%">
							<tr>
								<td class="left">
									<table border="0" class="leftHolderMain loginTable" width="100%">
										<tbody><tr>
											<td><h1>Report a Claim</h1></td>
											<td><u><a href="<%=request.getContextPath()%>">Home</a></u></td>
										</tr>
										<tr>
											<td>
												<div style="color: red; background: #c2c2c2">
													<s:actionerror/>
												</div>
												<div style="color: green; background: #c2c2c2">
													<s:actionmessage/>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												
												<div class="form-group">
													<div class="" style="padding: 0 15px 0 15px;margin-top: 30px;" id="tone">
														<div class="row">
															<div class="col-xs-12">
																<div class="tbox">
																	<s:textfield name="policyNo" id="policyNo" cssClass="inputBox loginField"  cssStyle="border: 1px;" placeholder="Policy No" maxlength="50" />
																</div>
															</div>
														</div>
														<br class="clear" />
														<div class="row">
															<div class="col-xs-12" align="center">
																<p>
																	<a href="#" title="search" id="search" class="lgnBtn" onclick="callSubmit();">
																		<span>Submit</span>
																	</a>													
																</p>
															</div>
														</div>
														<br class="clear" />
														
													</div>
													
													<s:hidden name="swidth" id="swidth" value=""/>
													<s:hidden name="loginType" id="loginType"/>
													<s:hidden name="status" id="status"/>
													<br class="clear">
												</div>
											</td>
										</tr>												
									</tbody></table>									
								</td>
							</tr>
						</table>						
					</div>
					<div class="col-xs-12 col-md-8" style="padding-left: 0px;">
						<table width="100%">
							<tr>
								<td class="right">
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tbody><tr>
											<td valign="top">
												<img src="<%=request.getContextPath()%>/images/enLoginBanner.jpg" width="100%" height="auto">
											</td>
										</tr>
										<tr>
											<td>
												<div style=" margin: 30px">
													<h5>Marine Cargo Insurance</h5>
													<p>
														Marine Cargo (Sea, Air and Land) insurance provides cover for loss or damage to goods in transit either within Kingdom of Saudi Arabia or imports/exports to and from Kingdom of Saudi Arabia or a combination of both. Marine Insurance can be provided on “All Risks” or restricted cover basis. Open cover and Single Transit policies are available.
													</p>
												</div>
											</td>
										</tr>
										<tr>
											<td align="center">
												<img src="<%=request.getContextPath()%>/images/img_marine_logo.jpg" width="100%" height="auto">
												</td>
											</tr>
											<tr>
												<td>
													<div style=" margin: 30px">
														<h5>Committed to serve you</h5>
														<p>
															Conduct business with us whenever, wherever. With XYZ Insurance eServices, we’re always open. Don’t worry about branch hours, no need to drive, no need to wait.<br><br>
			Whether you log in to renew your policy, pay your premium, get a quote, check your policy details, order a policy alteration or check your claims, it’s just free, easy and accessible all the time. <br><br>
			And no need to worry, we’re committed to keeping your personal and financial information safe and to protecting your security.
														</p>
													</div>
												</td>
											</tr>									
										</tbody></table>
								</td>
							</tr>
						</table>						
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12">
			<table border="0" cellspacing="0" cellpadding="0" class="footerMain">
				<tbody><tr>
					<td class="footerLeft" valign="top"><div>&nbsp;</div></td>
					<td class="footerMiddle" valign="top">
						<div>									
							<p>
								</p><table align="center" width="850" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
									<tbody><tr>
										<td width="50%" align="left">
											<a href="" onclick="secureNprivacy();">Privacy &amp; Security Statement</a>
										</td>
										<td width="50%" align="right">
											
											
											All Rights are Reserved for SBI Insurance 
										</td>
									</tr>
								</tbody></table>									
							<p></p>							
						</div>
					</td>
					<td class="footerRight" valign="top"><div>&nbsp;</div></td>
				</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<s:token/>
</s:form>
<script src="<%=request.getContextPath()%>/bootstrap/js/jquery.placeholder.js"></script>
<script type="text/javascript">	
	var width = (window.innerWidth > 0) ? window.innerWidth : screen.width;
	document.getElementById("swidth").value=width;
	
	jQuery(document).ready(function($) {
		$('#loginId').placeholder();
		$('#pwd').placeholder();
	  });
	try{
		getTab('Broker');
	}catch(e){}
	
</script>
</body>
</html>