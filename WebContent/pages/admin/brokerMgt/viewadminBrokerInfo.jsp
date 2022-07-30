<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML>
<html>
<head>
	<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap-multiselect.js" type="text/javascript"></script>
	<link href="<%=request.getContextPath()%>/bootstrap/css//style.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.responsive.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.jqueryui.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.tableTools.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datepicker/jquery-ui.css">
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.jqueryui.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.responsive.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.tableTools.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery.dataTables.js"></script>
	<script type="text/javascript">
  	jQuery(function ($) {
  		try {
			var data1 = $('#record').dataTable( {
				"lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
				"order": [[ 1, "asc" ]],
				"columnDefs": [ {
		          "targets": 'no-sort',
		          "orderable": false
			    } ],
				responsive: true
			});
		} catch(err){}
	} );
  	</script>
</head>
<body>
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
		<div class="panel panel-primary">
			<div class="panel-body">
				<div class="row">
					<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12">
						<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="Edit" onclick="fnCall('edit')"/>
					</div>
					<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12">
						<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="Change Password" onclick="fnCall('changePwd')"/>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12">
						<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="User Details" onclick="fnCall('userDetail')"/>
					</div>
					<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12">
						<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="OpenCover" onclick="fnCall('openCover')"/>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12">
						<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="Referral" onclick="fnCall('referal')"/>
					</div>					
				</div>
			</div>
		</div>
	</div>
	<div class="col-xs-12 col-sm-12 col-md-9 col-lg-9">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="broker.brokermanagement"/>
				<div  class="pullRight label label-warning">
					<s:property value="borganization"/>(<s:property value="agencyCode"/>)
				</div>
				<br class="clear" />
			</div>
			<div class="panel-body">
				<s:form id="info" name="info" method="post"  theme="simple">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">								
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">	
								<s:actionerror cssStyle="color: red;" />
								<s:actionmessage cssStyle="color: green;" />
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
								<div class="row">
									<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
										<div class="panel panel-primary">
											<div class="panel-heading"> <s:text name="broker.companyinfo"/> </div>
											<div class="panel-body">
												<div class="row">
													<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="textV"><s:text name="broker.branch"/></div>
														<div class="tboxV"><s:property value="%{branchData[0].BranchName}"/></div>
													</div>
													<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="textV"><s:text name="broker.brokercode"/></div>
														<div class="tboxV"><s:property value="bcode"/></div>
													</div>
													<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="textV"><s:text name="broker.brokerOrg"/></div>
														<div class="tboxV"><s:property value="companyName"/></div>
													</div>
													<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="textV"><s:text name="broker.address1"/></div>
														<div class="tboxV"><s:property value="address1"/></div>
													</div>
													<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="textV"><s:text name="broker.address2"/></div>
														<div class="tboxV"><s:property value="address2"/></div>
													</div>
													<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="textV"><s:text name="broker.city"/></div>
														<div class="tboxV"><s:property value="othercity"/></div>
													</div>
													<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="textV"><s:text name="broker.country"/></div>
														<div class="tboxV"><s:property value="nationalityNa"/></div>
													</div>
													<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="textV"><s:text name="broker.pobox"/></div>
														<div class="tboxV"><s:property value="pobox"/></div>
													</div>
													<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="textV"><s:text name="broker.telephone"/></div>
														<div class="tboxV"><s:property value="telephone"/></div>
													</div>
													<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="textV"><s:text name="broker.fax"/></div>
														<div class="tboxV"><s:property value="fax"/></div>
													</div>
													
													<%--<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="textV"><s:text name="broker.images" /></div>
														<div class="tboxV">
															<s:if test='broImgName!=null'>
																<img src='<%=request.getContextPath()%><s:property value="broImgName"/>' border="0" width="150" height="60"/><br>
															</s:if>
															<s:else> &nbsp; </s:else>
														</div> 
													</div>--%>
												</div>
											</div>
										</div>
										<div class="panel panel-primary">
											<div class="panel-heading"> <s:text name="broker.contactpersonInfo"/> </div>
											<div class="panel-body">
												<div class="row">
													<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="textV"><s:text name="broker.name"/></div>
														<div class="tboxV"><s:property value="firstname"/><s:property value="lastname"/></div>
													</div>
													<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="textV"><s:text name="broker.gender"/></div>
														<div class="tboxV"><s:property value='%{gender=="M"?"Male":(gender=="F"?"Female":"")}'/></div>
													</div>
													<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="textV"><s:text name="broker.dob"/></div>
														<div class="tboxV"><s:property value="dob"/></div>
													</div>
													<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="textV"><s:text name="broker.occupation"/></div>
														<div class="tboxV"><s:property value="occupation"/></div>
													</div>
													<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="textV"><s:text name="broker.mobile"/></div>
														<div class="tboxV"><s:property value="mobile"/></div>
													</div>
													<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="textV"><s:text name="broker.email"/></div>
														<div class="tboxV"><s:property value="bemail"/></div>
													</div>
													<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="textV"><s:text name="broker.nationality"/></div>
														<div class="tboxV"><s:property value="nationalityNa"/></div>
													</div>
													<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="textV"><s:text name="broker.loginId"></s:text> </div>
														<div class="tboxV"><s:property value="login_Id"/></div>
													</div>
												</div>
											</div>
										</div>
										<div class="panel panel-primary">
											<div class="panel-heading"> <s:text name="broker.productinfo"/> </div>
											<div class="panel-body">
												<div class="row">
													<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
														<table class="display responsive no-wrap" id="record" width="100%" cellspacing="0">
															<thead>
															<tr>
																<th class="no-sort"></th>
																<th><s:text name="Products" /></th>
																<th><s:text name="Sum Insured" /></th>
																<th><s:text name="Commission [%]" /></th>
																<th><s:text name="Min Premium" /></th>
																<th><s:text name="Loading % Max" /></th>
																<th><s:text name="Discount % Max" /></th>
															</tr>
															</thead>
															<tbody>
															<s:iterator value="commisionDetails" status="stat" var="record">
															<tr>
																<td></td>
																<td> <s:property value="ProductName" /> </td>
																<td> <s:property value="InsuranceEndLimit" /> </td>
																<td> <s:property value="Commission" /> </td>
																<td> <s:property value="MinPremiumAmount" /> </td>
																<td> <s:property value="LoadingPremium" /> </td>
																<td> <s:property value="DiscountPremium" /> </td>
															</tr>
															</s:iterator>
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<br class="clear" />
				<div class="row">
					<div align="center">
						<s:submit onclick="fnCall('beBack')" name="submit1" cssClass="btn btn-sm btn-danger" value="Back" />
					</div>
				</div>
				<s:hidden name="agencyCode"/>
				<s:hidden name="login_Id"/>
				<s:hidden name="borganization"/>
				<s:hidden name="bcode"/>
				<s:token/>
				</s:form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
function fnCall(from){
	if(from=='edit')
		document.info.action = from+"BrokerMgm.action?mode=edit";
	else if(from=='userDetail')
		document.info.action = "getABListUserMgm.action?mode1=broker";
	else if(from=='customerDetail')
		document.info.action = "getABListCustomerMgm.action?mode1=broker";
	else if(from=='referal')
		document.info.action = "getOCListReferal.action";
	else if(from=='openCover')
		document.info.action = "opencoverOC.action";
	else if(from=='statistics')
		document.info.action = "statisticsRE.action";
	else if (from=='beBack')
		document.info.action = "getABListBrokerMgm.action";
	<%--alert(from);
		postRequest('<%=request.getContextPath()%>/getABListCustomerMgm.action?agencyCode=10016&borganization='+'<s:property value="borganization"/>'+'&bcode='+'<s:hidden name="bcode"/>'+'&mode=mainTab', 'mainTab');
	}--%>else
		document.info.action = from+"BrokerMgm.action";
	document.info.submit();
} 
</script>
</body>
</html>