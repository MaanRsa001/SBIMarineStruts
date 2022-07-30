<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.responsive.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.jqueryui.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.tableTools.css">
	<link href="<%=request.getContextPath()%>/dataTables/css/jquery-start-ui.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.jqueryui.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.responsive.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.tableTools.js"></script>
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
	<s:if test='%{borganization!=null && borganization!=""}'>
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
						<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="OpenCover" onclick="fnCall('openCover')"/>
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
			<div class="panel-heading">
				<s:property value="borganization"/>(<s:property value="agencyCode"/>)
			</div>			
	</s:if>
	<s:else>
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="Customer Management" />
			</div>
	</s:else>	
			<div class="panel-body">
				<div id="horizontalTab">
					<ul class="resp-tabs-list">
						<li><s:text name="Customer Info" /></li>
						<li><s:text name="Open Cover List" /></li>
					</ul>
					<div class="resp-tabs-container">					
						<div id="1">
							<s:form id="info" name="info" method="post" action="" theme="simple">
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
											<div class="panel panel-primary">
												<div class="panel-heading"> <s:text name="customer.contactinfo"/> </div>
												<div class="panel-body">
													<div class="row">
														<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
															<table width="100%">
																<tbody>
																<tr>
																	<td width="40%"><s:text name="customer.customerId"/></td>
																	<td width="60%" style="font-weight: bold;">&nbsp;:&nbsp;<s:property value="customerId"/></td>
																</tr>
																</tbody>
															</table>
														</div>
														<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
															<table width="100%">
																<tbody>
																<tr>
																	<td width="40%"><s:text name="customer.name"/></td>
																	<td width="60%" style="font-weight: bold;">&nbsp;:&nbsp;<s:property value="cfirstname"/></td>
																</tr>
																</tbody>
															</table>
														</div>
														<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
															<table width="100%">
																<tbody>
																<tr>
																	<td width="40%"><s:text name="customer.gender"/></td>
																	<td width="60%" style="font-weight: bold;">&nbsp;:&nbsp;<s:property value='%{cgender=="M"?"Male":"Female"}'/></td>
																</tr>
																</tbody>
															</table>
														</div>
														<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
															<table width="100%">
																<tbody>
																<tr>
																	<td width="40%"><s:text name="customer.dob"/></td>
																	<td width="60%" style="font-weight: bold;">&nbsp;:&nbsp;<s:property value="cdob"/></td>
																</tr>
																</tbody>
															</table>
														</div>
														<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
															<table width="100%">
																<tbody>
																<tr>
																	<td width="40%"><s:text name="customer.nationality"/></td>
																	<td width="60%" style="font-weight: bold;">&nbsp;:&nbsp;<s:property value="cnationalityNa"/></td>
																</tr>
																</tbody>
															</table>
														</div>
														<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
															<table width="100%">
																<tbody>
																<tr>
																	<td width="40%"><s:text name="customer.agencycode"/></td>
																	<td width="60%" style="font-weight: bold;">&nbsp;:&nbsp;<s:property value="cagencyCode"/></td>
																</tr>
																</tbody>
															</table>
														</div>
														<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
															<table width="100%">
																<tbody>
																<tr>
																	<td width="40%"><s:text name="customer.occupation"/></td>
																	<td width="60%" style="font-weight: bold;">&nbsp;:&nbsp;<s:property value="coccupation"/></td>
																</tr>
																</tbody>
															</table>
														</div>
														<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
															<table width="100%">
																<tbody>
																<tr>
																	<td width="40%"><s:text name="customer.address1"/></td>
																	<td width="60%" style="font-weight: bold;">&nbsp;:&nbsp;<s:property value="caddress1"/></td>
																</tr>
																</tbody>
															</table>
														</div>
														<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
															<table width="100%">
																<tbody>
																<tr>
																	<td width="40%"><s:text name="customer.address2"/></td>
																	<td width="60%" style="font-weight: bold;">&nbsp;:&nbsp;<s:property value="caddress2"/></td>
																</tr>
																</tbody>
															</table>
														</div>
														<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
															<table width="100%">
																<tbody>
																<tr>
																	<td width="40%"><s:text name="customer.city"/></td>
																	<td width="60%" style="font-weight: bold;">&nbsp;:&nbsp;<s:property value="ccity"/></td>
																</tr>
																</tbody>
															</table>
														</div>
														<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
															<table width="100%">
																<tbody>
																<tr>
																	<td width="40%"><s:text name="customer.country"/></td>
																	<td width="60%" style="font-weight: bold;">&nbsp;:&nbsp;<s:property value="ccountryNa"/></td>
																</tr>
																</tbody>
															</table>
														</div>
														<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
															<table width="100%">
																<tbody>
																<tr>
																	<td width="40%"><s:text name="customer.pobox"/></td>
																	<td width="60%" style="font-weight: bold;">&nbsp;:&nbsp;<s:property value="cpobox"/></td>
																</tr>
																</tbody>
															</table>
														</div>
														<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
															<table width="100%">
																<tbody>
																<tr>
																	<td width="40%"><s:text name="customer.mobile"/></td>
																	<td width="60%" style="font-weight: bold;">&nbsp;:&nbsp;<s:property value="cmobile"/></td>
																</tr>
																</tbody>
															</table>
														</div>
														<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
															<table width="100%">
																<tbody>
																<tr>
																	<td width="40%"><s:text name="customer.telephone"/></td>
																	<td width="60%" style="font-weight: bold;">&nbsp;:&nbsp;<s:property value="cphone"/></td>
																</tr>
																</tbody>
															</table>
														</div>													
														<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
															<table width="100%">
																<tbody>
																<tr>
																	<td width="40%"><s:text name="customer.email"/></td>
																	<td width="60%" style="font-weight: bold;">&nbsp;:&nbsp;<s:property value="cemail"/></td>
																</tr>
																</tbody>
															</table>
														</div>
														<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
															<table width="100%">
																<tbody>
																<tr>
																	<td width="40%"><s:text name="customer.fax"/></td>
																	<td width="60%" style="font-weight: bold;">&nbsp;:&nbsp;<s:property value="cfax"/></td>
																</tr>
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
							<s:hidden name="agencyCode"/>
							<s:hidden name="customerId"/>
							<s:hidden name="borganization"/>
							<s:token/>
							</s:form>
						</div>
						<div id="2">
							<s:form name="info1" id="info1" method="post" action="" theme="simple">
							<div class="row">
								<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
									<div class="panel panel-primary">
										<div class="panel-heading"> <s:text name="customer.contactinfo"/> </div>
										<div class="panel-body">
											<div class="row">
												<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
													<table class="display responsive no-wrap" id="record" width="100%" cellspacing="0">
														<thead>
														<tr>
															<th class="no-sort"></th>
															<th><s:text name="S.No." /></th>
															<th><s:text name="Core Application Policy No" /></th>
															<th><s:text name="Open Cover No" /></th>
															<th><s:text name="Start Date" /></th>
															<th><s:text name="Expiry Date" /></th>
															<th><s:text name="Status" /></th>
														</tr>
														</thead>
														<tbody>
														<s:iterator value="openCover" status="stat" var="record">
														<tr>
															<td></td>
															<td><s:property value="%{#stat.index+1}" /></td>
															<td> <s:property value="MISSIPPI_OPENCOVER_NO" /> </td>
															<td> <s:property value="open_cover_no" /> </td>
															<td> <s:property value="pol_start_date" /> </td>
															<td> <s:property value="pol_expire_date" /> </td>
															<td> <s:property value="STATUS" /> </td>																												
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
							<s:hidden name="agencyCode" id="agencyCode"/>
	 						<s:hidden name="customerId" id="customerId"/>
							<s:hidden name="borganization"/>
							<s:token/>
							</s:form>
						</div>
					</div>
				</div>
				<br class="clear" />
				<div align="center">
					<input type="button" class="btn btn-sm btn-danger" value="Back" >
				</div>				
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
function getPolicy(val, id){
	if(val.length>=2){
		var searchBy=document.getElementById("searchBy").value;
		var cId=document.getElementById("customerId").value;
		var acode=document.getElementById("agencyCode").value;
		postRequest('<%=request.getContextPath()%>/getCustomerAjaxCustomerMgm.action?agencyCode='+acode+'&customerId='+cId+'&reqFrom='+id+'&searchBy='+searchBy+'&searchValue='+val, id);
	}
}

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
	else
		document.info.action = from+"BrokerMgm.action";
	document.info.submit();
}
</script>
</body>
</html>