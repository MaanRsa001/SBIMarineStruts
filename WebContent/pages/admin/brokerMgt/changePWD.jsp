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
<s:form id="brokeredit" name="brokeredit" method="post"  action="checkPwdBrokerMgm" theme="simple">
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
						<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="Change Password" onclick="fnCall('changePwd')"/>
					</div>
					<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12">
						<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="User Details" onclick="fnCall('userDetail')"/>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12">
						<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="OpenCover" onclick="fnCall('customerDetail')"/>
					</div>
					<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12">
						<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="Referral" onclick="fnCall('referal')"/>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12">
						<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="Statistics" onclick="fnCall('statistics')"/>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-xs-12 col-sm-12 col-md-9 col-lg-9">
		<div class="panel panel-primary">			
			
				<div class="panel-heading"> <s:text name="broker.brokermanagement"/> </div>
				<s:if test="'passwordsuccess'.equals(display)">
					<div class="panel-body">
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
								<div class="label label-success"><s:text name="broker.passwordsuccess"/></div>
							</div>
						</div>
						<br class="clear" />
						<div class="row">
							<div class="col-xs-12 col-sm-2 col-md-12 col-lg-12" align="center">
								<s:submit name="back11" action="getABListBrokerMgm" cssClass="btn btn-sm btn-success" value=" Proceed "/>
							</div>
						</div>
					</div>
				</s:if>
				<s:else>
				<div class="panel-body">
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
									<td width="30%"><s:property value="firstname"/>( <s:property value="agencyCode"/> )</td>
									<td width="40%"> <s:hidden name="display1"/> </td>
								</tr>
								<s:if test="'newlogin'.equals(display1)">
								<tr>
									<td><s:text name="broker.new"/> : </td>
									<td><s:textfield name="loginid" cssClass="inputBox" size="20"/> </td>
									<td> </td>
								</tr>
								<tr>
									<td><s:text name="broker.password"/> : </td>
									<td><s:password name="password" size="35" cssClass="inputBox" maxlength="20"/> </td>
									<td> <s:label key="broker.passwordmessage"/> </td>
								</tr>
								</s:if>
								<s:else>
								<tr>
									<td><s:text name="broker.nameNpassword"/> : </td>
									<td><s:password name="newpassword" size="35" cssClass="inputBox" maxlength="20"/> </td>
									<td> <s:label key="broker.passwordmessage"/> </td>
								</tr>
								</s:else>
								<tr>
									<td><s:text name="broker.nameRpassword"/> : </td>
									<td><s:password name="repassword" size="35" cssClass="inputBox" maxlength="20"/> </td>
									<td> </td>
								</tr>
								<tr align="center">
									<td width="30%">&nbsp;</td>
									<td colspan="2" align="left" style="padding-left: 10px;"><div id="passwordDescription">Password not entered</div><div id="passwordStrength" class="strength0"></div></td>
								</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<br class="clear" />
				<div class="row">
					<div class="col-xs-12 col-sm-2 col-md-12 col-lg-12" align="center">
						<s:if test="'newlogin'.equals(display1)">
							<s:submit action="newBrokerBrokerMgm" name="submit1" cssClass="btn btn-sm btn-danger" value="Cancel" /> &nbsp;&nbsp;&nbsp;
							<s:submit name="submit1" action="newloginBrokerMgm" cssClass="btn btn-sm btn-success" value="Submit" />
						</s:if>
						<s:else>
							<s:submit name="back" cssClass="btn btn-sm btn-danger" action="getABListBrokerMgm" value="Back"/>
							<s:submit name="submit1" cssClass="btn btn-sm btn-success" value="Submit" />
						</s:else>
					</div>
				</div>
				</s:else>
		</div>
		
	</div>	
</div>
<s:token/>
</s:form>
<script type="text/javascript">
function fnCall(from){
	if(from=='edit')
		document.brokeredit.action = from+"BrokerMgm.action?mode=edit";
	else if(from=='userDetail')
		document.brokeredit.action = "getABListUserMgm.action?mode1=broker";
	else if(from=='customerDetail')
		document.brokeredit.action = "getABListCustomerMgm.action?mode1=broker";
	else if(from=='referal')
		document.brokeredit.action = "getOCListReferal.action";
	else if(from=='openCover')
		document.brokeredit.action = "opencoverOC.action";
	else
		document.brokeredit.action = from+"BrokerMgm.action";
	document.brokeredit.submit();
}
</script>
</body>
</html>