<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ page language="java" import="com.maan.report.service.ReportService"%>
<!DOCTYPE HTML>
<html>
<head>
</head>
<body>
<s:form id="newPwd" name="newPwd" method="post" theme="simple">
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
		<div class="panel panel-primary">
			<div class="panel-body">
				<div class="row">
					<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12">
						<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="View" onclick="fnCall('view')"/>
					</div>
					<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12">
						<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="Edit" onclick="fnCall('edit')"/>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12">
						<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="User Details" onclick="fnCall('userDetail')"/>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12">
						<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="Customer Detail" onclick="fnCall('customerDetail')"/>
					</div>
					<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12">
						<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="OpenCover" onclick="fnCall('openCover')"/>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12">
						<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="Referral" onclick="fnCall('referal')"/>
					</div>
					<!-- <div class="col-xs-6 col-sm-6 col-md-12 col-lg-12">
						<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="Statistics" onclick="fnCall('statistics')"/>		
					</div> -->
				</div>
			</div>
		</div>
	</div>
	<div class="col-xs-12 col-sm-12 col-md-9 col-lg-9">
		<div class="panel panel-primary">			
			<div class="panel-heading">
				<s:label key="broker.brokermanagement"/>
				<div class="pullRight label label-warning">
					<s:property value="borganization"/>(<s:property value="bcode"/>)
				</div>
			</div>
			<div class="panel-body">
				<s:if test='"passwordsuccess".equals(display)'>
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<div class="label label-success"><s:text name="broker.passwordsuccess"/></div>
						</div>
					</div>
					<br class="clear" />
					<div class="row">
						<div class="col-xs-12 col-sm-2 col-md-12 col-lg-12" align="center">
							<s:submit name="back11" onclick='saveAction("getABListBrokerMgm.action");' cssClass="btn btn-sm btn-success" value=" Proceed "/>
						</div>
					</div>
				</s:if>
				<s:else>
				<div class="row">
					<div class="col-xs-12 col-sm-2 col-md-12 col-lg-12">
						<s:if test="'invalid'.equals(display)">
						 	<span style="color: red;"> <s:text name="error.invalid" /> </span>
						</s:if>
						<s:elseif test="'different'.equals(display)">
							<span style="color: red;"> <s:text name="error.different"/> </span>
						</s:elseif>
						<table width="100%">
							<tbody>
							<tr>
								<td width="30%"><s:text name="broker.broker"/> : </td>
								<td width="30%"><s:property value="borganization"/>( <s:property value="agencyCode"/> )</td>
								<td width="40%"> </td>
							</tr> 
							<tr><td colspan="3" height="5"></td></tr>
							<tr>
								<td><s:text name="broker.password"/> : </td>
								<td><s:password name="password" size="35" onkeyup="passwordStrength(this.value)" cssClass="inputBox" maxlength="20"/> </td>
								<td> <s:label key="broker.passwordmessage"/> </td>
							</tr>
							<tr><td colspan="3" height="5"></td></tr>
							<tr>
								<td></td>
								<td></td>
								<td>
									<div id="passwordDescription">Password not entered</div><div id="passwordStrength" class="strength0"></div>
								</td>
							</tr>
							<tr><td colspan="3" height="5"></td></tr>
							<tr>
								<td><s:text name="Re-Enter Password"/> : </td>
								<td><s:password name="rpassword" size="35" cssClass="inputBox" maxlength="20"/> </td>
								<td></td>
							</tr>
							</tbody>
						</table>
					</div>
				</div>
				<br class="clear" />
				<div class="row">
					<div class="col-xs-12 col-sm-2 col-md-12 col-lg-12" align="center">
						<s:submit onclick='saveAction("getABListBrokerMgm.action");' name="submit1" cssClass="btn btn-sm btn-danger" value=" Cancel " /> &nbsp;&nbsp;&nbsp;
						<s:submit onclick='saveAction("checkPwdBrokerMgm.action");' name="submit1" cssClass="btn btn-sm btn-success" value=" Submit " />
					</div>
				</div>
				</s:else>
			</div>			
		</div>
	</div>
</div>
<s:hidden name="agencyCode"/>
<s:hidden name="borganization"/>
<s:hidden name="bcode"/>
<s:hidden name="firstname"/>
<s:hidden name="login_Id"/>
<s:token/>
</s:form>
<script type="text/javascript">
function fnCall(from){
	if(from=='edit')
		document.newPwd.action = from+"BrokerMgm.action?mode=edit";
	else if(from=='userDetail')
		document.newPwd.action = "getABListUserMgm.action?mode1=broker";
	else if(from=='customerDetail')
		document.newPwd.action = "getABListCustomerMgm.action?mode1=broker";
	else if(from=='referal')
		document.newPwd.action = "getOCListReferal.action";
	else if(from=='openCover')
		document.newPwd.action = "opencoverBrokerMgm.action";
	else
		document.newPwd.action = from+"BrokerMgm.action";
	document.newPwd.submit();
}

function saveAction(act){
	document.newPwd.action = act;
	document.newPwd.submit();
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
</body>
</html>