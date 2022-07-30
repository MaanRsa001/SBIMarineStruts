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
	 
	<s:if test='%{borganization!=null && !"".equals(borganization)}'>
		<div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
			<div class="panel panel-primary">
				<div class="panel-body">
					<s:if test='%{borganization!=null && borganization!=""}'>
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12">
								<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="View" onclick="fnCall('viewuser')"/>
							</div>
							<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12">
								<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="User Details" onclick="fnCall('userDetail')"/>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12">
								<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="Customer Details" onclick="fnCall('customerDetail')"/>
							</div>
							<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12">
								<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="OpenCover" onclick="fnCall('openCover')"/>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12">
								<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="Referral" onclick="fnCall('referal')"/>
							</div>
							<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12">
								<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="Statistics" onclick="fnCall('statistics')"/>
							</div>
						</div>
					</s:if>
					<s:else>
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12">
								<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="View" onclick="fnCall('viewuser')"/>
							</div>
							<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12">
								<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="Customer Details" onclick="fnCall('customerDetail')"/>
							</div>
						</div>
					</s:else>
				</div>
			</div>
		</div>
		<div class="col-xs-12 col-sm-12 col-md-9 col-lg-9">
	</s:if>
	 <s:elseif test='"new".equals(optionMode)'>
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
	</s:elseif>
	<s:else>
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
	</s:else>
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:if test='%{borganization!=null && !"".equals(borganization)}'>
					<s:property value="borganization"/>(<s:property value="agencyCode"/>)
				</s:if>
				 <s:elseif test='"new".equals(optionMode)'>
				 	New Underwriter Creation
				 </s:elseif>
				 <s:else>
				 	Enter Underwriter Info
				 </s:else>
			</div>
			<div class="panel-body">
				<s:form id="info" name="underwriter" method="post" theme="simple">
					<s:if test="'successNew'.equals(display)">
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">	
								<span class="label label-md label-success" ><s:label key="user.new.success"/></span>
							</div>
						</div>
						<br/>
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
								<input type="button" onclick="fnsubmit('back','getABListUnderwriterMgm', this.form)" name="back" class="btn btn-sm btn-danger" value="Back" />
							</div>
						</div>
					</s:if>
					<s:elseif test="'successUpdate'.equals(display)">
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">	
								<span class="label label-md label-success" ><s:label key="user.update.success"/></span>
							</div>
						</div>
						<br/>
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
								<input type="button" onclick="fnsubmit('back','getABListUnderwriterMgm', this.form)" name="back" class="btn btn-sm btn-danger" value="Back" />
							</div>
						</div>
					</s:elseif>
					<s:else>
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">	
								<div class="panel panel-primary">
									<div class="panel-heading">
										<s:text name="Underwriter Management" />
									</div>
									<div class="panel-body">
										<s:if test='!"product".equals(mode1) && !"login".equals(mode1)'>
											<div class="row">
												<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">	
													<s:actionerror cssStyle="color: red;" />
													<s:actionmessage cssStyle="color: green;" />
												</div>
											</div>
											<br/>
										</s:if>
										<s:if test='!"new".equals(optionMode)'>
											<div class="row">
												<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
													<div class="text"><s:text name="user.status"/></div>
													<div class="tbox">
														<s:select name="ustatus" list="#{'Y':'Active','N':'Deactive','D':'Delete','L':'Lock'}" headerKey="" headerValue="---Select---" cssClass="inputBoxS" />
													</div>
												</div>
											</div>									
										</s:if>
										<div class="row">
											<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
												<div class="panel panel-primary">
													<div class="panel-heading">
														<s:text name="New Underwriter Form" />
													</div>
													<div class="panel-body">
														<div class="row">
															<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
																<div class="text"><s:text name="User Name" /> <font color="red">*</font></div>
																<div class="tbox">
																	<s:textfield name="IssurName"  cssClass="inputBox" size="35"/>
																</div>
															</div>
															<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
																<div class="text"><s:text name="Email Id" /> <font color="red">*</font></div>
																<div class="tbox"><s:textfield name="emailId"  cssClass="inputBox" size="35"/></div>
															</div>
															<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
																<div class="text"><s:text name="Login Id" /> <font color="red">*</font></div>
																<div class="tbox"><s:textfield name="loginId"  cssClass="inputBox" size="35"/></div>
															</div>
															<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
																<div class="text"><s:text name="Core Login Id" /> <font color="red">*</font></div>
																<div class="tbox"><s:textfield name="coreLoginId" maxlength="3" cssClass="inputBox" size="35"/></div>
															</div>
															<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
																<div class="text">Password <font color="red">*</font></div>
																<div class="tbox"><s:password name="password"  cssClass="inputBox" size="35"/></div>
															</div>
															<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
																	<div class="text"> <s:text name="broker.region" /> </div>
																	<div class="tbox">
																		<s:select name="regionCode" id="regionCode" cssClass="inputBoxS" list="regionsList"  listKey="RegionId" listValue="RegionName"  headerKey="" headerValue="---Select---" onchange="getBranchList(this.value,'branchId');"/>
																	</div>
																</div>
																<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
																	<div class="text"> <s:text name="broker.branchcode" /> </div>
																	<div class="tbox">
																		<div id="branchId"><s:select name="branchCodeS" id="branchCodeS" cssClass="inputBoxS" list="branchList"  listKey="BranchCode" listValue="BranchName"  headerKey="" headerValue="---Select---" /></div>
																	</div>
																</div>
															<%-- <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
																<div class="text"> <s:text name="user.linked.location" /> </div>
																<div class="tbox"><s:select name="broLinkLoc" id="broLinkLoc" cssClass="inputBoxS" list="linkedBranchList"  listKey="FS_BRANCH_CODE" listValue="FS_BRANCH_NAME"  headerKey="" headerValue="---Select---" /></div>
															</div> --%>
															<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
																<div class="text"><s:text name="Choose Products" /> <font color="red">*</font></div>
																<div class="tbox">
																	<s:select name="products" id="products" list="productList"  listKey="ProductId" listValue="ProductName" headerKey="" label="" multiple="true" />
																</div>
															</div>
															</div>
															<div class="row">
															<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
																<div class="text"><s:text name="Attached Branch"/> <font color="red">*</font></div>
																<div class="tbox">
																	<s:textarea name="branchId" id="branchId" cssClass="inputBoxA" rows="2" readonly="true" cssStyle="width: 85%;"/>
																	<input class="btn btn-sm btn-primary" value="..." style="float:right;" type="button" name="menu" onclick="return callPopupbranch('<%=request.getContextPath()%>/branchSelectionUnderwriterMgm.do')"/>
																</div>
															</div>
															<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
																<div class="text"><s:text name="Effective Date"/><font color="red">*</font></div>
																<div class="tbox"><s:textfield id="effecdate" name="effecdate" cssClass="inputBox datepicker" /></div>
															</div>
															
														</div>
													</div>
													<br/>
													<br/>
												</div>
											</div>
										</div>
										<s:if test='"new".equals(mode)'>
										<div class="row">
											<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
												<div class="panel panel-primary">
													<div class="panel-heading">
														<s:label key="user.login.creation" />
													</div>
													<div class="panel-body">
														<div class="row">
															<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
																<div class="text"><s:label key="user.new" /> <font color="red">*</font></div>
																<div class="tbox">
																	<s:textfield name="userId"  cssClass="inputBox" size="35"/>
																</div>
															</div>
															<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
																<div class="text"><s:label key="user.password" /> <font color="red">*</font></div>
																<div class="tbox">
																	<s:password name="password" cssClass="inputBox" maxlength="20"/>
																</div>
															</div>
															<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
																<div class="text"><s:label key="user.rpassword" /> <font color="red">*</font></div>
																<div class="tbox">
																	<s:password name="repassword" cssClass="inputBox" maxlength="20"/>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										</s:if>
										<br class="clear" />
										<div class="row">
											<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
												<s:submit  onclick="fnsubmit('back','getABListUnderwriterMgm', this.form)"   name="submit1" cssClass="btn btn-sm btn-danger" value="Back" /> &nbsp;&nbsp;&nbsp;
												<s:submit name="submit2" cssClass="btn btn-sm btn-success" value="Submit" onclick="addNewUnder()"/>
 											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</s:else>
					<s:hidden name="agencyCode"/>
					<s:hidden name="mode"/>
					<s:hidden name="mode1"/>
					<s:hidden name="type1"/>
					<s:hidden name="uagencyCode"/>
					<s:hidden name="borganization"/>
					<s:hidden name="optionMode"/>
					 <s:token/>
				</s:form>
				<s:if test='!"new".equals(optionMode)'>
					<div class="panel panel-primary">
						<div class="panel-heading">
							<s:text name="Password Change" />
						</div>
						<div class="panel-body">
							<s:form id="newPwd" name="newPwd" method="post" theme="simple">
								<div class="row">
									<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">	
										<div class="panel panel-primary">
											<div class="panel-heading">
												<s:text name="Underwriter Management" />
											</div>
											<div class="panel-body">
												<s:if test='"login".equals(mode1)'>
													<div class="row">
														<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">	
															<s:actionerror cssStyle="color: red;" />
															<s:actionmessage cssStyle="color: green;" />
														</div>
													</div>
													<br/>
												</s:if>
												<div class="row">
													<div class="">
														<table width="100%">
															<tbody>
															<tr>
																<td width="30%"><s:label key="user.new"/> : </td>
																<td width="70%" colspan="2"><s:property value="ulogin_Id"/>( <s:property value="uagencyCode"/> )</td>
															</tr>	
															<tr>
																<td width="30%"><s:text name="broker.nameNpassword"/> : </td>
																<td width="30%"><s:password name="password" cssClass="inputBox" maxlength="20" onkeyup="passwordStrength(this.value)"/></td>
																<td width="40%"><s:text name="broker.passwordmessage"/> </td>
															</tr>
															<tr align="center">
																<td width="30%">&nbsp;</td>
																<td colspan="2" align="left" style="padding-left: 10px;"><div id="passwordDescription">Password not entered</div><div id="passwordStrength" class="strength0"></div></td>
															</tr>
															<tr>
																<td width="30%"><s:label key="user.rpassword"/> : </td>
																<td width="30%"><s:password name="repassword" cssClass="inputBox" maxlength="20"/> </td>
																<td width="40%">&nbsp;</td>
															</tr>
															<tr><td>&nbsp;</td></tr>
															<tr>
																<td colspan="4" align="center">
																	<s:submit onclick="funSubmit('getABListUserMgm.action');"  name="submit1" cssClass="btn btn-sm btn-danger" value=" Cancel " /> &nbsp;&nbsp;&nbsp;
	               													<s:submit onclick="funSubmit('checkPwdUserMgm.action');" name="submit1" cssClass="btn btn-sm btn-success" value=" Submit " />
																</td>
															</tr>
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							<s:hidden name="index" value="2"/>
							<s:hidden name="borganization"/>
							<s:hidden name="agencyCode"/>
							<s:hidden name="firstname"/>
							<s:hidden name="uagencyCode"/>
							<s:hidden name="mode1"/>
							 <s:token/>
							</s:form>
						</div>
					</div>
				</s:if> 
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
$(document).ready(function() {     
    $('#products').multiselect({ 
      includeSelectAllOption: true,
        enableFiltering:true,
        buttonText: function (options) {
         if (options.length == 0) {
             return 'None selected';
         } else {
             var selected = 0;
             options.each(function () {
                 selected += 1;
             });
             return selected +  ' Selected';
            }
           }
                
        
  });            
});

function fnCall(from){
	if(from=='edit'){
		document.underwriter.action ="viewUnderwriterMgm.action";
		document.underwriter.mode.value="edit";
		}
	else if(from=='list'){
		document.underwriter.action = "UnderwriterCreationContoller.action";
		}
	else if(from=='changePwd'){
		document.underwriter.action = "changePassUnderwriterMgm.action";
		document.underwriter.mode.value="changePass";
		}	
	else if(from=='include'){
		document.underwriter.action = "includeIssuerUnderwriterMgm.action";
		document.underwriter.type1.value="include";
		}
	else if(from=='exclude'){
		document.underwriter.action = "excludeIssuerUnderwriterMgm.action";
		document.underwriter.type1.value="exclude";
		}
	else if(from=='openCover')
		document.info.action = "opencoverOC.action";
	else if(from=='statistics')
		document.info.action = "statisticsRE.action";
	else
		document.underwriter.action = from+"BrokerMgm.action";
	document.underwriter.submit();
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
$(document).ready(function() {
	try{
		var index = '<s:property value="index"/>';
		var t = $('#tabs');
		var tabs = t.tabs('tabs');
			t.tabs('select', tabs[index].panel('options').title);
	}catch(e){}
});
function forward1(agcode, id, value, mode1){
	postRequest('<%=request.getContextPath()%>/getUserAjaxUserMgm.action?reqFrom='+id+'&agencyCode='+agcode+'&productID='+value+'&mode1='+mode1, id);
	}
	
function fnsubmit(from, action, frm){
	frm.action=action+".action";
	frm.submit();
}
function branchSelection(){
  var params = "?branchSelected="+document.getElementById('branchSelected').value==null?'':document.getElementById('branchSelected').value+"&formName=underwriter";
  var URL ='<%=request.getContextPath()%>/branchSelectionUnderwriterMgm.do?branchSelected='+params;
  return callPopup(URL);
}
function callPopupbranch(URL) {
	var regioncode=document.getElementById("regionCode").value;
	URL=URL+"?regionCode="+regioncode;
 	var bwidth = window.innerWidth;
	var bwidth1 = document.body.clientWidth;
	if(bwidth <= 768) {
		return popUp(URL,bwidth1,'500');
	} else {
		return popUp(URL,'750','500');
	}
}
function callPopup(URL) {
 	var bwidth = window.innerWidth;
	var bwidth1 = document.body.clientWidth;
	if(bwidth <= 768) {
		return popUp(URL,bwidth1,'500');
	} else {
		return popUp(URL,'750','500');
	}
}

	function addNewUnder(){
		document.underwriter.action = "insertIssuerUnderwriterMgm.action";
		document.underwriter.submit();
	}
function funSubmit(acti){
	document.newPwd.action = acti;
	document.newPwd.submit();
	
}
function getBranchList(val,id){
	postRequest('<%=request.getContextPath()%>/getBrokerAjaxBrokerMgm.action?reqFrom='+id+'&regionCode='+val, id);
}
</script>
</html>