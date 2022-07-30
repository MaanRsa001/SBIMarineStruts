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
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
		<div class="panel panel-primary">
			<div class="panel-body">
				<div class="row">
					<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12">
						<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="Underwriter Details" onclick="fnCall('list')"/> 
					</div>
					<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12">
						<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="Change Password" onclick="fnCall('changePwd')"/>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12">
						<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="Included Brokers" onclick="fnCall('include')"/> 
					</div>
					<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12">
						<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="Excluded Brokers" onclick="fnCall('exclude')"/>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-xs-12 col-sm-12 col-md-9 col-lg-9">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="Change Password" />
				<div class="pullRight">
					Underwriter : <s:property value="loginId"/>
				</div>
				<br class="clear" />
			</div>
			<div class="panel-body">
				<s:form id="newPwd" name="underwriter" method="post" theme="simple">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">	
						<div class="panel panel-primary">
							<div class="panel-heading">
								<s:text name="Underwriter.uwmanagement" />
							</div>
							<div class="panel-body">
							<span style="color:red"><s:actionerror/> </span>
								<s:if test='"passwordsuccess".equals(display)'>
									<div class="row">
										<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">	
											<s:text name="uw.passwordsuccess"/>
										</div>
									</div>
									<br/>
									<div class="row">
										<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">	
											<s:submit name="submit1" cssClass="btn btn-sm btn-danger" onclick="submitAct(this.form,'UnderwriterCreationContoller.action');" value=" Back " />
										</div>
									</div>
									</s:if>
								<s:else>
									<table width="100%">
										<tbody>
										<tr>
											<td width="30%"><s:text name="broker.nameNpassword"/> : </td>
											<td width="30%"><s:password name="password" size="35" onkeyup="passwordStrength(this.value)"  cssClass="inputBox" maxlength="20"/></td>
											<td width="40%"><s:text name="broker.passwordmessage"/> </td>
										</tr>
										<tr align="center">
											<td width="30%">&nbsp;</td>
											<td colspan="2" align="left" style="padding-left: 10px;"><div id="passwordDescription">Password not entered</div><div id="passwordStrength" class="strength0"></div></td>
										</tr>
										<tr>
											<td width="30%">Re enter new Password : </td>
											<td width="30%"><s:password name="rpassword" size="35" cssClass="inputBox" maxlength="20"/> </td>
											<td width="40%">&nbsp;</td>
										</tr>
										<tr><td>&nbsp;</td></tr>
										<tr>
											<td colspan="4" align="center">
												<s:submit  name="submit1" cssClass="btn btn-sm btn-danger" value=" Cancel " onclick="submitAct(this.form,'UnderwriterCreationContoller.action');" /> &nbsp;&nbsp;&nbsp;
												<s:submit name="submit1" cssClass="btn btn-sm btn-success" value="Submit"  onclick="submitAct(this.form,'updatePassUnderwriterMgm.action');"/>
											</td>
										</tr>
										</tbody>
									</table>
								</s:else>
							</div>
						</div>
					</div>
				</div>
				<s:hidden name="agencyCode"/>
				<s:hidden name="borganization"/>
				<s:hidden name="bcode"/>
				<s:hidden name="firstname"/>
				<s:hidden name="loginId" />
				<s:token/>
				</s:form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
function stopRKey(evt) { 
  var evt = (evt) ? evt : ((event) ? event : null); 
  var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null); 
  if ((evt.keyCode == 13) && (node.type=="text"))  {return false;} 
} 
document.onkeypress = stopRKey;

function fnCall(from){
	if(from=='edit')
		document.underwriter.action ="viewUnderwriterMgm.action?mode=edit";
	else if(from=='list')
		document.underwriter.action = "UnderwriterCreationContoller.action";
	else if(from=='changePwd')
		document.underwriter.action = "changePassUnderwriterMgm.action?mode=changePass";	
	else if(from=='include')
		document.underwriter.action = "includeIssuerUnderwriterMgm.action?type1=include";
	else if(from=='exclude')
		document.underwriter.action = "excludeIssuerUnderwriterMgm.action?type1=exclude";
	else if(from=='openCover')
		document.info.action = "opencoverOC.action";
	else if(from=='statistics')
		document.info.action = "statisticsRE.action";
	<%--alert(from);
		postRequest('<%=request.getContextPath()%>/getABListCustomerMgm.action?agencyCode=10016&borganization='+'<s:property value="borganization"/>'+'&bcode='+'<s:hidden name="bcode"/>'+'&mode=mainTab', 'mainTab');
	}--%>else
		document.underwriter.action = from+"BrokerMgm.action";
	document.underwriter.submit();
}

function submitAct( frm, act){
	frm.action=act;
	frm.submit();
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