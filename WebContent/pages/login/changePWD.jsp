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
	<title> ::: SBI - Change Password ::: </title>
	<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/SBI_icon_header.jpg" />
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
		function loginFocus(){
			document.getElementById('userId').focus();
		}
		function pwdFocus(){
			document.getElementById('newpwd').focus();
		}
		function callSubmit(val){
	       	if(val=='back'){
	       		document.changepwd.action="<%=request.getContextPath()%>/Loginpage.action";
	       		document.getElementById("status").value="";
	       	}
	       	else if(val=='submit'){
	       		document.changepwd.action="<%=request.getContextPath()%>/LoginpwdChange.action";
	       	}
	       	else if(val=='changePwd'){
	       		document.changepwd.action="<%=request.getContextPath()%>/LogincheckChangePassword.action";
	       	}
	          document.changepwd.submit();
	 	}
	 	
	 	function passwordStrength(password){
			var desc = new Array();
			desc[0] = "Very Weak";
			desc[1] = "Weak";
			desc[2] = "Better";
			desc[3] = "Medium";
			desc[4] = "Strong";
			desc[5] = "Strongest";
			var score   = 0;
			if (password.length > 6) score++;
			if ( ( password.match(/[a-z]/) ) && ( password.match(/[A-Z]/)) ) score++;
			if ( password.match(/\d+/)) score++;
			if ( password.match(/.[@,#,$,%]/))score++;
			if ( (password.length > 10) && (password.match(/.[@,#,$,%]/)) && (password.match(/[a-z]/) ) && (password.match(/[A-Z]/)) && (password.match(/\d+/)))score++;
			document.getElementById("passwordDescription").innerHTML = desc[score];
			document.getElementById("passwordStrength").className = "strength" + score;
		}
	</script>
</head>
<!--[if lt IE 7 ]>   <body class="ie6">          <![endif]-->
<!--[if IE 7 ]>      <body class="ie7">          <![endif]-->
<!--[if IE 8 ]>      <body class="ie8">          <![endif]-->
<!--[if IE 9 ]>      <body class="ie9">          <![endif]-->
<!--[if (gt IE 9) ]> <body class="modern">       <![endif]-->
<!--[!(IE)]><!-->    <body class="notIE modern"> <!--<![endif]-->
<div id="page" class="content">
	<div class="ielogo" style="text-align: center;">
		<img id="SBILogo" src="images/logonew.png" alt="logo" >
	</div>	
	<div class="logonBg">
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<span><s:text name="pwd.change"/></span>
					</div>
					<div class="panel-body">
						<div style="color: red;">
							<s:actionerror/>
						</div>
						<s:form id="changepwd" name="changepwd" method="post" action="" theme="simple">							
							<div class="form-group">
								<div class="tableWidth">
									<s:if test='"success"==status'>
										<div class="row">
											<div class="col-xs-12" align="center">
												<h5 class="label label-success"> <s:text name="pwd.change.success"/> </h5>
											</div>
										</div>
									</s:if>
									<s:elseif test='"changePwd"==status'>
										<div class="row">
											<div class="col-xs-12">
												<div class="text"><s:text name="user.name" /> <font color="red">*</font> </div>
												<div class="tbox">
													<s:textfield name="loginId" id="userId" cssClass="inputBox" placeholder="Login Name" maxlength="50" cssStyle="border: 1px solid #c2c2c2;" />
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-xs-12">
												<div class="text"><s:text name="pass.word" /> <font color="red">*</font></div>
												<div class="tbox">
													<s:password name="pwd" id="pwd" cssClass="inputBox" placeholder="Password" maxlength="20" cssStyle="border: 1px solid #c2c2c2;"/>
												</div>
											</div>
										</div>
									</s:elseif>
									<s:else>
										<div class="row">
											<div class="col-xs-12">
												<div class="textV"><s:text name="user.name" />  </div>
												<div class="tboxV">
													: <b><s:property value="loginId"/></b>
													<s:hidden name="loginId"/>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-xs-12">
												<div class="text"><s:text name="new.pwd" /> <font color="red">*</font></div>
												<div class="tbox">
													<s:password name="newpwd" id="newpwd" cssClass="inputBox" maxlength="20" onkeyup="passwordStrength(this.value)" cssStyle="border: 1px solid #c2c2c2;"/>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-xs-12" style="color: red;">
												(<s:property value="pwdMsg"/>)												
											</div>
										</div>
										<br class="clear" />
										<div class="row">
											<div class="col-xs-12" align="center">
												<div id="passwordDescription">Password not entered</div> <div id="passwordStrength" class="strength0"></div>												
											</div>
										</div>
										<div class="row">
											<div class="col-xs-12">
												<s:text name="confirm.pwd" /> <font color="red">*</font>
												<div class="tbox">
													<s:password name="repwd" id="repwd" cssClass="inputBox" maxlength="20" cssStyle="border: 1px solid #c2c2c2;" />
												</div>
											</div>
										</div>
									</s:else>
									<s:hidden name="status" id="status"/>
									<br class="clear" />
									<div class="row">
										<div class="col-xs-12" align="center">
											<s:if test='"success"==status'>
												<s:hidden name="pwdMsg"/>
	                            				<s:submit name="Submit1" cssStyle="cursor:pointer;" cssClass="btn btn-sm btn-danger" value="Back" onclick="callSubmit('back')"/>
											</s:if>
											<s:else>
												<s:hidden name="pwdMsg"/>
		                            			<input  type="button" name="Submit1" style="cursor:pointer;" class="btn btn-sm btn-danger" value=" Cancel " onclick="callSubmit('back')"/>&nbsp;&nbsp;&nbsp;
		                            			<s:if test='"changePwd"==status'>                          			
		                              				<s:reset name="Submit2" cssStyle="cursor:pointer;" value=" Reset " onclick="loginFocus();" cssClass="btn btn-sm btn-warning"/> &nbsp;&nbsp;&nbsp;
		                              			</s:if>
		                              			<s:else>
		                              				<s:reset name="Submit2" cssStyle="cursor:pointer;" value=" Reset " onclick="pwdFocus();" cssClass="btn btn-sm btn-warning"/> &nbsp;&nbsp;&nbsp;
		                              			</s:else>
			                              		<s:if test='"changePwd"==status'>
			                              			<input type="button" name="Submit1" style="cursor:pointer;" class="btn btn-sm btn-success" value="Submit" onclick="callSubmit('changePwd')"/>	                              			
			                              		</s:if>
			                              		<s:else>
			                              			<input type="button" name="Submit1" style="cursor:pointer;" class="btn btn-sm btn-success" value="Submit" onclick="callSubmit('submit')"/>	                              			
			                            		</s:else>
											</s:else>
										</div>
									</div>
								</div>
								<br class="clear">
							</div>
							<s:token/>
						</s:form>				
					</div>
				</div>
			</div>			
		</div>
		<br class="clear" />
	</div>
	<br class="clear"/>
	<div id="footer" align="right">
		<div class="div-footer">SBI Cooperative Insurance Company</div>
		<%-- <div class="div-footer">&copy; Owned by <a href="http://www.maansarovar.com/" target="_blank">Maan Sarovar Tech Solutions Pvt. Ltd.</a></div>--%>    	   
		<br class="clear">
	</div>
</div>
<script src="<%=request.getContextPath()%>/bootstrap/js/jquery.placeholder.js"></script>
<script type="text/javascript">	
	var width = (window.innerWidth > 0) ? window.innerWidth : screen.width;
	document.getElementById("swidth").value=width;	
</script>
</body>
</html>