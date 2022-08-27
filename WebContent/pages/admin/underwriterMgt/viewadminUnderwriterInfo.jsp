<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ page language="java" import="com.maan.report.service.ReportService"%>
<!DOCTYPE HTML>
<html>
<head>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap-multiselect.css" />
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
				<s:text name="Under writer Info" />
				<div class="pullRight">
					<s:property value="loginId"/>
				</div>
				<br class="clear" />
			</div>
			<div class="panel-body">
				<s:form id="info" name="underwriter" method="post" action="updateissuerUnderwriterMgm" theme="simple">
				<s:if test="'successNew'.equals(display)">
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">	
							<span class="label label-md label-success" ><s:label key="user.new.success"/></span>
						</div>
					</div>
					<br/>
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">	
							<input type="button" onclick="fnsubmit('back','getABListUserMgm', this.form)" name="back" class="btn btn-sm btn-danger" value="Back" />
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
							<input type="button" onclick="fnsubmit('back','getABListUserMgm', this.form)" name="back" class="btn btn-sm btn-danger" value="Back" />
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
									<br/>								
									</s:if>
									<div class="row">
										<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
											<div class="panel panel-primary">
												<div class="panel-heading">
													<s:text name="Edit Underwriter" />
												</div>
												<div class="panel-body">
													<div class="row">
														<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
															<div class="text"><s:text name="User Name" /> <font color="red">*</font></div>
															<div class="tbox">
																<s:textfield name="issurName"  cssClass="inputBox" size="35" />
															</div>
														</div>
														<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
															<div class="text"><s:text name="Email Id" /> <font color="red">*</font></div>
															<div class="tbox">
																<s:textfield name="emailId"  cssClass="inputBox" size="35"/>
															</div>
														</div>
														<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
															<div class="text"><s:text name="Login Id" /> <font color="red">*</font></div>
															<div class="tbox">
																<s:textfield name="loginId"  cssClass="inputBox" size="35" readonly="true"/>
															</div>
														</div>
														<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
															<div class="text"><s:text name="Core Login Id" /> <font color="red">*</font></div>
															<div class="tbox">
																<s:textfield name="coreLoginId" maxlength="3" cssClass="inputBox" size="35"/>
															</div>
														</div>
														<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
															<div class="text"><s:text name="Choose Products" /> <font color="red">*</font></div>
															<div class="tbox"> 
																<s:select name="products" id="products"  cssClass="inputBoxS" list="productList"  listKey="ProductId" listValue="ProductName" headerKey="" label="" multiple="true" />													
															</div>
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
														<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
																<div class="text"><s:text name="admin.user.region.select"/> <font color="red">*</font></div>
																<div class="tbox">
																	<s:select name="attachedregion" id="attachedregion" cssClass="inputBoxS" list="regionsList"  listKey="RegionId" listValue="RegionName"  headerKey=""  multiple="true"/>
																</div>
														</div>
														</div>
														<div class="row">
														<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
															<div class="text"><s:text name="Attached Branch"/> <font color="red">*</font></div>
															<div class="tbox">
																<s:textarea name="branchId" id="branchId" cssClass="inputBoxA" rows="2" readonly="true" cssStyle="width: 85%;"/>
																<input class="btn btn-sm btn-primary" value="..." style="float:right;" type="button" name="menu" onclick="return callPopupbranch('<%=request.getContextPath()%>/branchSelectionUnderwriterMgm.do','600','500')"/>
															</div>
														</div>
														<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
															<div class="text"><s:text name="Effective Date"/><font color="red">*</font></div>
															<div class="tbox"><s:textfield id="effecdate" name="effecdate" cssClass="inputBox datepicker" /></div>
														</div>
														</div>
													</div>
												</div>
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
								</div>
							</div>
						</div>
					</div>
					<br class="clear" />
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
							<input type="button" value="Back" class="btn btn-sm btn-danger" onclick="fnBack('UnderwriterCreationContoller')"  >
							<s:submit name="submit2" cssClass="btn btn-sm btn-success" value="Submit" />
						</div>
					</div>
				</s:else>
				<s:hidden name="agencyCode"/>
				<s:hidden name="mode"/>
				<s:hidden name="mode1"/>
				<s:hidden name="uagencyCode"/>
				<s:hidden name="borganization"/>
				<s:token/>
				</s:form>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
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
		document.info.action = "opencoverBrokerMgm.action";
	else if(from=='statistics')
		document.info.action = "statisticsRE.action";
	<%--alert(from);
		postRequest('<%=request.getContextPath()%>/getABListCustomerMgm.action?agencyCode=10016&borganization='+'<s:property value="borganization"/>'+'&bcode='+'<s:hidden name="bcode"/>'+'&mode=mainTab', 'mainTab');
	}--%>else
		document.underwriter.action = from+"BrokerMgm.action";
	document.underwriter.submit();
}
function branchSelection(){
  var params = "?branchSelected="+document.getElementById('branchSelected').value==null?'':document.getElementById('branchSelected').value;
  var URL ='<%=request.getContextPath()%>/branchSelectionUnderwriterMgm.do?branchSelected='+params;
  return callPopup(URL);
}
function callPopupbranch(url){	 
	var checkedItems='';
	try
	{
		var elements=document.getElementById("attachedregion");		 
		for(i=0; i<elements.length; i++)
		{
			obj=elements[i];
			if(obj.selected)
				checkedItems+=obj.value+',';
		}
	}catch(e){}	 
	if(checkedItems.length>1)
		checkedItems=checkedItems.substring(0, checkedItems.length-1);	 
	if(checkedItems!=null && checkedItems!="")
		return callPopup(url+'?selregions='+checkedItems);
	else
		alert('Please Select Attached Region');	
}
function callPopupbranch1(URL) {
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
function fnBack(from){
	document.underwriter.action = from+".action";
	document.underwriter.submit();
}
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
      $('#attachedregion').multiselect({ 
          includeSelectAllOption: true,
            enableFiltering:true 
            
      	});
});
function getBranchList(val,id){
	postRequest('<%=request.getContextPath()%>/getBrokerAjaxBrokerMgm.action?reqFrom='+id+'&regionCode='+val, id);
}
</script>
</html>