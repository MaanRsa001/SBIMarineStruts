<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="keywords" content="Maan Sarovar, Sea Trans, Marine Insurance">	
	<meta name="author" content="">
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/demo.css" />
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap-multiselect.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/datepicker3.css">
	
	<link href="<%=request.getContextPath()%>/bootstrap/css/footable-0.1.css" rel="stylesheet" type="text/css">
	<link href="<%=request.getContextPath()%>/bootstrap/css/table-res.css" rel="stylesheet" type="text/css">
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css" />
	
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/style.css" />
	<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>
	
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
	<script src="<%=request.getContextPath()%>/bootstrap/js/modernizr.custom.63321.js"></script>
	
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
			var data1 = $('.display').dataTable( {
				"lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
				"order": [[ 0, "asc" ]],
				"columnDefs": [ {
		          "targets": 'no-sort',
		          "orderable": false
			    } ],
				responsive: true
			});
		} catch(err){}
	} );	
 	</script> 
	<style type="text/css">
	.panel-heading {
		padding: 5px;
	}
	</style>
</head>
<body >
<s:form name="ViewOpenCover" method="post" action="" theme="simple" validate="false">
<div id="page" class="content">
	<div class="header">
	<s:include value="/openMenu.jsp"></s:include>
	</div>
	<div class="body">
		<div class="table0">
			<div class="tablerow">
			<s:if test="openCoverLapsedList.size()>0">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<s:text name="LAPSED OPEN COVERS" />
					</div>
					<div class="panel-body">
						<table class="display responsive no-wrap" id="record" width="100%" cellspacing="0">
							<thead>
							<tr>
								<th>S.No</th>
								<th>Core Application Policy No. </th>
								<th>OpenCover No. </th>
								<th>Customer Name </th>
								<th>OpenCover Date </th>
								<th>Validity Period </th>
								<th>Remarks</th>
								<th>View Certificate</th>
							</tr>
							</thead>
							<tbody>
								<s:iterator value="openCoverLapsedList" status="stat" var="record">
									<tr>
										<td><s:property value="%{#stat.index+1}" /></td>
										<td><s:property value="MissippiOpenCoverNo"/></td>
										<td><s:property value="OpenCoverNo" /></td>
										<td><s:property value="CustomerName" /></td>
										<td><s:property value="InceptionDate" /></td>
										<td><s:property value="ExpiryDate" /></td>	
										<td> <s:property value="LapsedRemarks" /></td>					
										<td>
										<s:if test='"13".equals(#record.Type)'>
										 <a href="#" type="button" class="btn btn-sm btn-success" title="Vehicle" onClick="return getVehicle('<s:property value="MissippiOpenCoverNo" />','<s:property value="Type" />','<s:property value="BrokerId" />','<s:property value="CustomerId" />','Y')"><b> View Certificate</b> </a>
										</s:if>
										<s:else>
										<a type="button" href="#" class="btn btn-sm btn-warning" title="New Quote" onClick="return viewCertificate('<s:property value="OpenCoverNo" />','<s:property value="Type" />','<s:property value="BrokerId" />','<s:property value="CustomerId" />')"><b> View Certificate</b> </a>
										</s:else>
										</td>
									</tr>
									</s:iterator>					
							</tbody>
						</table>
					</div>
				</div>
				</s:if>
			</div>
		</div>
		</div>
		<div class="tablerow">
				<div class="boxcontent">
					<div class="panel panel-primary">
						<div class="panel-body">
							<div class="textfield33">
								<div class="text">
						 			<s:text name="Search By"/>
						 		</div>
						 		<div class="tbox">
						 		<s:select  name="searchBy" list="#{'FIRST_NAME':'Customer Name','opencover_nos':'Open Cover Number','DateWise':'Date wise' }" headerKey="Select" headerValue="ALL" class="inputBoxS" onChange="setData()"></s:select>
						 		</div>
							</div>
							<div class="textfield33">
								<div class="text">
						 			<s:text name="Enter Data For Search "/>
						 		</div>
						 		<div class="tbox">
						 			<input type="text" class="inputBox" name="searchValue"  onsubmit='return focus1()'>
						 		</div>
							</div>
							<div class="textfield33" align="center">
								<input type="button" class="btn btn-sm btn-success" value="Go" onclick="return search_details()"  id='go' >
							</div>			
						</div>
						<br class="clear" />
					</div>
				</div>
				<br/>
			<s:if test='#session.RSAISSUER!=null'>
			<div class="boxcontent">
				<div class="panel panel-primary">
					<div class="panel-body">
						<div class="textfield33">
							<div class="text">
					 			<s:text name="Select Broker"/>
					 		</div>
					 		<div class="tbox">
					 			<s:select list="openCoverBrokerList" class="inputBoxS" name="userSel" onChange="samePage()" listKey="LoginId" listValue="CompanyName" headerKey="Select" headerValue="ALL" ></s:select>
					 		</div>
					 	</div>
					</div>
					<br class="clear"/>
				</div> 	
			</div>
			</s:if>
			<div class="boxcontent">
				<s:if test='"Broker".equals(#session.usertype)'>
					<s:if test="loginCustomers.size()>0">
						<div class="textfield33">
					</s:if>
				</s:if>
				<s:else>
					<div class="textfield33V">
				</s:else>
				User Name &nbsp;:&nbsp; <s:property value="#session.user"/>
				</div>
				<s:if test='"Broker".equals(#session.usertype)'>
					<s:if test="loginCustomers.size()>0">
						<div class="textfield33">
							<div class="text">
					 			<s:text name="Select User"/>
					 		</div>
					 		<div class="tbox">
					 		<s:select list="openCoverBrokerList" class="inputBoxS" name="userSel" onChange="samePage()" listKey="LoginId" listValue="CompanyName" headerKey="select" headerValue="Select"></s:select>
					 		</div>
						</div>
					</s:if>
					</s:if>
					<br class="clear"/>
			</div>
			<ul class="nav nav-pills nav-justified">
			    <li class="active"><a  data-toggle="tab" href="#moctab" onclick="getTab('moc')">EXISTING Marine Open cover (MOC)</a></li>
			    <li><a  data-toggle="tab" href="#moptab" onclick="getTab('mop')">EXISTING Marine Open cover (MOP)</a></li>
			    <li><a  data-toggle="tab" href="#mhltab" onclick="getTab('mhl')">EXISTING Land Transit Deposit All Risk</a></li>
			    <li><a  data-toggle="tab" href="#nonmhltab" onclick="getTab('nonmhl')">EXISTING Land Transit Non-Deposit All Risk</a></li>
			    <li><a  data-toggle="tab" href="#" onclick="getBR();" >Bulk Report</a></li>
			  </ul>
			  <br class="clear"/>
			<!-- <div class="tabsBg rEdge">
				<input type="button" class="tabBg rEdge" name="moc" id='moc' value="EXISTING Marine Open cover (MOC)" onclick="getTab('moc')" />
				<input type="button" class="tabBg rEdge" name="mop" id='mop' value="EXISTING Marine Open cover (MOP)" onclick="getTab('mop')" />
				<input type="button" class="tabBg rEdge" name="mhl" id='mhl' value="EXISTING Land Transit All Risk" onclick="getTab('mhl')" />
				<input type="button" class="tabBg rEdge" name="bulkReport" id='bulkReport' value="Bulk Report" onclick="getBR();" />
			</div> -->
			<div class="tablerow">
				<div class="boxcontent">
					<div id="moctab" class="tab-pane fade in active" >
						<div class="panel panel-primary">
							<div class="panel-heading">
								EXISTING Marine Open cover (MOC)
							</div>
							<div class="panel-body">
								<table class="display responsive no-wrap" id="record" width="100%" cellspacing="0">
									<thead>
									<tr>
										<th>S.No</th>
										<th>Core Application Policy No. </th>
										<th>OpenCover No. </th> 
										<th>Customer Name </th>
										<th>OpenCover Date </th>
										<th>Certificate</th>
										<th>Balance Sum Insured</th>
										<s:if test='"admin".equals(#session.usertype) || "RSAIssuer".equals(#session.usertype) '>
											<th>Schedule</th>
											<th>Policy Wordings</th>
										</s:if>
										<th>Validity Period </th>
										<s:if test='!"None".equals(QuoteOpt)'>
											<th>LC Details</th>
										</s:if>
									</tr>
									</thead>
									<tbody>
										<s:iterator value="openCoverMocCreatedList" status="stat" var="record">
											<tr>
												<td><s:property value="%{#stat.index+1}" /></td>
												<td><s:property value="MissippiOpenCoverNo"/></td>
												<td><s:property value="OpenCoverNo" /></td>
												<td><s:property value="CustomerName" /></td>
												<td><s:property value="InceptionDate" /></td>
												<td>
													<a href="#" type="button" class="btn btn-sm btn-warning" title="New Quote" onClick="return newQuote('<s:property value="MissippiOpenCoverNo"/>','11','<s:property value="BrokerId"/>','<s:property value="CustomerId"/>');"><b> Certificate</b> </a>
												</td>
												<td><s:property value="Voyage" /></td>	
												
												<s:if test='"admin".equals(#session.usertype) || "RSAIssuer".equals(#session.usertype) '>
												<td>
													<a href="#" title="View Schedule" style="color:#00aeef !important;" onclick="return viewDoc('<s:property value="ProposalNo" />','<s:property value="OpenCoverNo" />','<s:property value="session.user" />','schedule','','0','false');">Schedule</a>
													<%-- <a href="#" type="button" title="View Schedule" class="btn btn-sm btn-default" onclick="return viewDoc('<s:property value="MissippiOpenCoverNo"/>','<s:property value="#session.user"/>','schedule','<s:property value="MissippiOpenCoverNo"/>','','<s:property value="ProposalNo"/>','false');" > <b> Schedule </b></a> --%>
												</td>
												<td>
													<a href="#" title="Policy Wordings" style="color:#42ca6c !important;" onclick="return viewDoc('<s:property value="ProposalNo" />','<s:property value="OpenCoverNo" />','<s:property value="session.user" />','clauses','false','');">Policy Wordings</a>
												</td>
												</s:if>
												<td> <s:property value="ExpiryDate" /></td>	
												<s:if test='!"None".equals(QuoteOpt)'>
												<td>
													<a href="#" type="button" class="btn btn-sm btn-info" title="LC Details" onClick="return openLCDetailsTest('<s:property value="#session.user"/>','<s:property value="MissippiOpenCoverNo"/>','<s:property value="CustomerName"/>');"> <b>LC Details </b> </a>
												</td>
												</s:if>
											</tr>
											</s:iterator>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					 <div id="moptab" class="tab-pane fade">
						<div class="panel panel-primary">
							<div class="panel-heading">
								EXISTING Marine Open cover (MOP)
							</div>
						</div>
						<div class="panel-body">
								<table class="display responsive no-wrap" id="record" width="100%" cellspacing="0">
									<thead>
									<tr>
										<th>S.No</th>
										<th>Core Application Policy No. </th>
										<th>OpenCover No. </th> 
										<th>Customer Name </th>
										<th>OpenCover Date </th>
										<th>Certificate</th>
										<th>Balance Sum Insured</th>
										<s:if test='"admin".equals(#session.usertype) || "RSAIssuer".equals(#session.usertype) '>
											<th>Schedule</th>
											<th>Policy Wordings</th>
										</s:if>
										<th>Validity Period </th>
										<s:if test='!"None".equals(QuoteOpt)'>
											<th>LC Details</th>
										</s:if>
									</tr>
									</thead>
									<tbody>
										<s:iterator value="openCoverMopCreatedList" status="stat" var="record">
											<tr>
												<td><s:property value="%{#stat.index+1}" /></td>
												<td><s:property value="MissippiOpenCoverNo"/></td>
												<td><s:property value="OpenCoverNo" /></td>
												<td><s:property value="CustomerName" /></td>
												<td><s:property value="InceptionDate" /></td>
												<td>
													<a href="#" type="button" class="btn btn-sm btn-warning" title="New Quote" onClick="return newQuote('<s:property value="MissippiOpenCoverNo"/>','11','<s:property value="BrokerId"/>','<s:property value="CustomerId"/>');"><b> Certificate</b> </a>
												</td>
												<td><s:property value="Voyage" /></td>	
												
												<s:if test='"admin".equals(#session.usertype) || "RSAIssuer".equals(#session.usertype) '>
												<td>
													<a href="#" title="View Schedule" style="color:#00aeef !important;" onclick="return viewDoc('<s:property value="ProposalNo" />','<s:property value="OpenCoverNo" />','<s:property value="session.user" />','schedule','','0','false');">Schedule</a>
													<%-- <a href="#" type="button" title="View Schedule" class="btn btn-sm btn-default" onclick="return viewDoc('<s:property value="MissippiOpenCoverNo"/>','<s:property value="#session.user"/>','schedule','<s:property value="MissippiOpenCoverNo"/>','','<s:property value="ProposalNo"/>','false');" > <b> Schedule </b></a> --%>
												</td>
												<td>
													<a href="#" title="Policy Wordings" style="color:#42ca6c !important;" onclick="return viewDoc('<s:property value="ProposalNo" />','<s:property value="OpenCoverNo" />','<s:property value="session.user" />','clauses','false','');">Policy Wordings</a>
												</td>
												</s:if>
												<td> <s:property value="ExpiryDate" /></td>	
												<s:if test='!"None".equals(QuoteOpt)'>
												<td>
													<a href="#" type="button" class="btn btn-sm btn-info" title="LC Details" onClick="return openLCDetailsTest('<s:property value="#session.user"/>','<s:property value="MissippiOpenCoverNo"/>','<s:property value="CustomerName"/>');"> <b>LC Details </b> </a>
												</td>
												</s:if>
											</tr>
											</s:iterator>
									</tbody>
								</table>
							</div>
					</div>
					 <div id="mhltab" class="tab-pane fade">
						<div class="panel panel-primary">
							<div class="panel-heading">
								EXISTING Marine Haulier Liability
							</div>
							<div class="panel-body">
								<table class="display responsive no-wrap" id="record" width="100%" cellspacing="0">
									<thead>
									<tr>
										<th>S.No</th>
										<th>Core Application Policy No. </th>
										<th>OpenCover No. </th> 
										<th>Customer Name </th>
										<th>OpenCover Date </th>
										<th>Certificate</th>
										<th>Balance Sum Insured</th>
										<s:if test='"admin".equals(#session.usertype) || "RSAIssuer".equals(#session.usertype) '>
											<th>Schedule</th>
											<th>Policy Wordings</th>
										</s:if>
										<th>Validity Period </th>
										<s:if test='!"None".equals(QuoteOpt)'>
											<th>LC Details</th>
										</s:if>
									</tr>
									</thead>
									<tbody>
										<s:iterator value="openCoverLandCreatedList" status="stat" var="record">
											<tr>
												<td><s:property value="%{#stat.index+1}" /></td>
												<td><s:property value="MissippiOpenCoverNo"/></td>
												<td><s:property value="OpenCoverNo" /></td>
												<td><s:property value="CustomerName" /></td>
												<td><s:property value="InceptionDate" /></td>
												<td>
													<a href="#" type="button" class="btn btn-sm btn-success" title="Vehicle" onClick="return getVehicle('<s:property value="MissippiOpenCoverNo" />','<s:property value="Type" />','<s:property value="BrokerId" />','<s:property value="CustomerId" />','N')"><b> Vehicle</b> </a>
												</td>
												<td><s:property value="Voyage" /></td>	
												
												<s:if test='"admin".equals(#session.usertype) || "RSAIssuer".equals(#session.usertype) '>
												<td>
													<a href="#" title="View Schedule" style="color:#00aeef !important;" onclick="return viewDoc('<s:property value="ProposalNo" />','<s:property value="OpenCoverNo" />','<s:property value="session.user" />','schedule','','0','false');">Schedule</a>
													<%-- <a href="#" type="button" title="View Schedule" class="btn btn-sm btn-default" onclick="return viewDoc('<s:property value="MissippiOpenCoverNo"/>','<s:property value="#session.user"/>','schedule','<s:property value="MissippiOpenCoverNo"/>','','<s:property value="ProposalNo"/>','false');" > <b> Schedule </b></a> --%>
												</td>
												<td>
													<a href="#" title="Policy Wordings" style="color:#42ca6c !important;" onclick="return viewDoc('<s:property value="ProposalNo" />','<s:property value="OpenCoverNo" />','<s:property value="session.user" />','clauses','false','');">Policy Wordings</a>
												</td>
												</s:if>
												<td> <s:property value="ExpiryDate" /></td>	
												<s:if test='!"None".equals(QuoteOpt)'>
												<td>
													<a href="#" type="button" class="btn btn-sm btn-info" title="LC Details" onClick="return openLCDetailsTest('<s:property value="#session.user"/>','<s:property value="MissippiOpenCoverNo"/>','<s:property value="CustomerName"/>');"> <b>LC Details </b> </a>
												</td>
												</s:if>
											</tr>
											</s:iterator>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					
					<div id="nonmhltab" class="tab-pane fade">
						<div class="panel panel-primary">
							<div class="panel-heading">
								EXISTING Marine Haulier Non Deposit Liability
							</div>
							<div class="panel-body">
								<table class="display responsive no-wrap" id="record" width="100%" cellspacing="0">
									<thead>
									<tr>
										<th>S.No</th>
										<th>Core Application Policy No. </th>
										<th>OpenCover No. </th> 
										<th>Customer Name </th>
										<th>OpenCover Date </th>
										<th>Certificate</th>
										<th>Balance Sum Insured</th>
										<s:if test='"admin".equals(#session.usertype) || "RSAIssuer".equals(#session.usertype)'>
											<th>Schedule</th>
											<th>Policy Wordings</th>
										</s:if>
										<th>Validity Period </th>
										<s:if test='!"None".equals(QuoteOpt)'>
											<th>LC Details</th>
										</s:if>
									</tr>
									</thead>
									<tbody>
										<s:iterator value="openCoverLandNonDepositCreatedList" status="stat" var="record">
											<tr>
												<td><s:property value="%{#stat.index+1}" /></td>
												<td><s:property value="MissippiOpenCoverNo"/></td>
												<td><s:property value="OpenCoverNo" /></td>
												<td><s:property value="CustomerName" /></td>
												<td><s:property value="InceptionDate" /></td>
												<td>
													<a href="#" type="button" class="btn btn-sm btn-success" title="Vehicle" onClick="return getVehicle('<s:property value="MissippiOpenCoverNo" />','<s:property value="Type" />','<s:property value="BrokerId" />','<s:property value="CustomerId" />','N')"><b> Vehicle</b> </a>
												</td>
												<td><s:property value="Voyage" /></td>	
												
												<s:if test='"admin".equals(#session.usertype) || "RSAIssuer".equals(#session.usertype) '>
												<td>
													<a href="#" type="button" title="View Schedule" class="btn btn-sm btn-default" onclick="return viewDoc('<s:property value="MissippiOpenCoverNo"/>','<s:property value="#session.user"/>','schedule','<s:property value="MissippiOpenCoverNo"/>','','<s:property value="ProposalNo"/>','false');" > <b> Schedule </b></a>
												</td>
												<td>
													<a href="#" type="button" title="Policy Wordings" class="btn btn-sm btn-default" onclick="return viewDoc('<s:property value="MissippiOpenCoverNo"/>','<s:property value="#session.user"/>','clauses','<s:property value="MissippiOpenCoverNo"/>','','<s:property value="ProposalNo"/>','false');" > <b> View </b></a>
												</td>
												</s:if>
												<td> <s:property value="ExpiryDate" /></td>	
												<s:if test='!"None".equals(QuoteOpt)'>
												<td>
													<a href="#" type="button" class="btn btn-sm btn-info" title="LC Details" onClick="return openLCDetailsTest('<s:property value="#session.user"/>','<s:property value="MissippiOpenCoverNo"/>','<s:property value="CustomerName"/>');"> <b>LC Details </b> </a>
												</td>
												</s:if>
											</tr>
											</s:iterator>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					
					
				</div>
			</div>
			<%-- <div class="tablerow">
				<div class="panel panel-primary">
					<div class="panel-heading">
						ENDORSEMENT SEARCH
					</div>
					<div class="panel-body">
						<div class="textfield33">
					 		<div class="text">
					 			Search By Policy No
					 		</div>
					 		<div class="tbox">
					 			<input type="text" size="25" class="inputBox" maxlength='50' id="policyNo"  name="searchPolicyNo" />
					 		</div>
					 	</div>
					 	<div class="textfield33" align="center">
					 		<input type="button" class="btn btn-sm btn-success" value="Submit" onclick="return searchByPolicy()" />
					 	</div>
					 	<br class="clear"/>
					 	<br/>
						<table class="display responsive no-wrap" id="record" width="100%" cellspacing="0">
							<thead>
							<tr>
								<th></th>
								<th><s:text name="Select" /></th>
								<th><s:text name="Policy No" /></th>
								<th><s:text name="Broker Name" /></th>
								<th><s:text name="Customer Name" /></th>
								<th><s:text name="Policy Date" /></th>
							</tr>
							</thead>
							<tbody>
							<s:iterator value="openCoverEndorseList" status="stat" var="record">
							<tr>
								<td></td>
								<td align="center"> <input type="radio" name="selectPolicy" value='<s:property value="#record.PolicyNo"/>' onclick="setPolicyInfo('<s:property value="#record.PolicyNo"/>','<s:property value="#record.OpenCoverNo"/>','<s:property value="#record.LoginId"/>','<s:property value="#record.OcCustomerId "/>')"/> </td>
								<td><s:property value="PolicyNo" /> </td>
								<td><s:property value="BrokerName" /> </td>
								<td><s:property value="CustomerName" /> </td>
								<td><s:property value="PolicyStartDate" /> </td>
							</tr>
							</s:iterator>
							</tbody>
						</table>
					</div>
				</div>
			</div>	 --%>		
	<div class="footer">
		<%@include file="/templates/footer.jsp"%>
	</div>
</div>
<s:hidden name="loginId" id="loginId"/>
<s:hidden name="productId" id="productId"/>
<s:hidden name="openCoverNo" id="openCoverNo"/>
<s:hidden name="openCustomerId" id="openCustomerId"/>
<s:hidden name="brokerCode" id="brokerCode"/>
<s:hidden name="executive" id="executive"/>
<s:hidden name="openNo" id="openNo"/>
<s:hidden name="lcBroker" id="lcBroker"/>
<s:hidden name="custName" id="custName"/>
<s:hidden name="openCover" id="openCover"/>
<s:hidden name="fromBroker" id="fromBroker"/>
<s:hidden name="search_option" id="search_option"/>
<s:hidden name="selectProd" id="selectProd"/>
<s:hidden name="searchFrom" id="searchFrom"  value="BS"/>
<s:hidden name="lapsedStatus" id="lapsedStatus"/>
<s:hidden name="policyNo" id="policyNo"/>

<s:token/>
</s:form>
<script type="text/javascript">
function stopRKey(evt) { 
  var evt = (evt) ? evt : ((event) ? event : null); 
  var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null); 
  if ((evt.keyCode == 13) && (node.type=="text"))  {return false;} 
} 
document.onkeypress = stopRKey;
function newQuote(openCoverNo, productId, loginId, customerId) {
	var selected=document.getElementById(loginId);
	if(selected) {
		document.ViewOpenCover.brokerCode.value=selected.value;
		document.ViewOpenCover.executive.value=selected.title;
	}	
	document.ViewOpenCover.loginId.value=loginId;
	document.ViewOpenCover.productId.value=productId;
	document.ViewOpenCover.openCoverNo.value=openCoverNo;
	document.ViewOpenCover.openCustomerId.value=customerId;
	document.ViewOpenCover.action="initReport.action?menuType=CHART";
	document.ViewOpenCover.submit();
	return false;
}
function getVehicle(openCoverNo, productId, loginId, customerId,lapsedStatus){
	var selected=document.getElementById(loginId);
		if(selected) {
			document.ViewOpenCover.brokerCode.value=selected.value;
			document.ViewOpenCover.executive.value=selected.title;
		}	
		document.ViewOpenCover.loginId.value=loginId;
		document.ViewOpenCover.lapsedStatus.value=lapsedStatus;
		document.ViewOpenCover.productId.value=productId;
		document.ViewOpenCover.openCoverNo.value=openCoverNo;
		document.ViewOpenCover.openCustomerId.value=customerId;
		document.ViewOpenCover.action="vehicleInitMarineVehicle.do";
		document.ViewOpenCover.submit();
		return false;
	}
function viewCertificate(openCoverNo, productId, loginId, customerId) {
	var selected=document.getElementById(loginId);
	if(selected) {
		document.ViewOpenCover.brokerCode.value=selected.value;
		document.ViewOpenCover.executive.value=selected.title;
	}	
	document.ViewOpenCover.loginId.value=loginId;
	document.ViewOpenCover.productId.value=productId;
	document.ViewOpenCover.openCoverNo.value=openCoverNo;
	document.ViewOpenCover.openCustomerId.value=customerId;
	document.ViewOpenCover.action="initReport.action?menuType=P&menuBlocker=bulkreport&lapsedmenu=lapsedOC";
	document.ViewOpenCover.submit();
	return false;
}
function openLCDetailsTest(log,open,cust) {
	document.ViewOpenCover.openNo.value = open;
	document.ViewOpenCover.lcBroker.value = log;
	document.getElementById("custName").value=cust;
	document.ViewOpenCover.openCover.value=open;
	document.ViewOpenCover.fromBroker.value = "Yes";
	document.ViewOpenCover.action="lcDetailsLC.action";
	document.ViewOpenCover.submit();
}
function samePage() {
	document.ViewOpenCover.searchBy.value=""
	document.ViewOpenCover.action="viewOpenCoverReport.action";
	document.ViewOpenCover.submit();
}
function search_details() {
	document.ViewOpenCover.search_option.value="YES"
	document.ViewOpenCover.action="viewOpenCoverReport.action"
	document.ViewOpenCover.submit();
   return false;
}
function focus1() {
	  var elem = document.getElementById("go");
	  elem.focus();
}
function setData() {
	var search=document.ViewOpenCover.searchby.value;
	if(search=='Select')
			document.ViewOpenCover.searchValue.value="";
	else if(search=='DateWise')
			document.ViewOpenCover.searchValue.value="DD/MM/YYYY";
	//alert(search);
}
function searchByPolicy() {
	if(document.ViewOpenCover.searchPolicyNo.value==''){
		alert('Please enter Policy No to search');
		return false;
	} else {
		document.ViewOpenCover.action='viewOpenCoverReport.action';
		document.ViewOpenCover.submit();
		return true;
	}
}
function setPolicyInfo(policyNo, openCoverNo, loginId, openCustomerId)
{
	document.ViewOpenCover.searchValue.value=policyNo;
	document.ViewOpenCover.openCoverNo.value=openCoverNo;
	document.ViewOpenCover.loginId.value=loginId;
	document.ViewOpenCover.openCustomerId.value=openCustomerId;
}
function viewDoc(proposalNo,policynumber,loginId,docType,docNo,amendId,endtstatus) {
	 var URL ="<%=request.getContextPath()%>/documentReportReg.action?docType="+docType+"&opencoverNo="+policynumber+"&loginId="+loginId+"&docNo="+docNo+"&amendId="+amendId+"&proposalNo="+proposalNo+"&endtstatus="+endtstatus;
	 var windowName = "PolicyView";
	 var width  = screen.availWidth;
	 var height = screen.availHeight;
	 var bwidth = window.innerWidth;
	var bwidth1 = document.body.clientWidth;
	if(bwidth <= 768) {
		var w = bwidth1;
	 	var h =	500;
	} else {
		var w = 750;
	 	var h =	500;
	}
	 
	 var features =
		'width='          + w +
		',height='		  + h +
		',left='		  + ((width - w - 10) * .5)  +
		',top='			  + ((height - h - 30) * .5) +
		',directories=no' +
		',location=no'	  +
		',menubar=no'	  +
		',scrollbars=yes' +
		',status=no'	  +
		',toolbar=no'	  +
		',resizable=false';
	var strOpen = window.open (URL, windowName, features);
	strOpen.focus();
	return false;
}
try{
	getTab('moc');
}catch(e){}
function getTab(tabId){
	if(tabId=="moc") {
		//document.getElementById("moc").className="tabBgA rEdge";
		//document.getElementById("mop").className="tabBg rEdge";
		//document.getElementById("mhl").className="tabBg rEdge";
		document.getElementById("moctab").style.display = "block";
		document.getElementById("moptab").style.display = "none";
		document.getElementById("mhltab").style.display = "none";
		document.getElementById("nonmhltab").style.display = "none";
	} else if(tabId=="mop") {
		//document.getElementById("moc").className="tabBg rEdge";
		//document.getElementById("mop").className="tabBgA rEdge";
		//document.getElementById("mhl").className="tabBg rEdge";
		document.getElementById("moctab").style.display = "none";
		document.getElementById("moptab").style.display = "block";
		document.getElementById("mhltab").style.display = "none";
		document.getElementById("nonmhltab").style.display = "none";
	} else if(tabId=="mhl") {
		//document.getElementById("moc").className="tabBg rEdge";
		//document.getElementById("mop").className="tabBg rEdge";
		//document.getElementById("mhl").className="tabBgA rEdge";
		document.getElementById("moctab").style.display = "none";
		document.getElementById("moptab").style.display = "none";
		document.getElementById("mhltab").style.display = "block";
		document.getElementById("nonmhltab").style.display = "none";
	} else if(tabId=="nonmhl"){
		document.getElementById("moctab").style.display = "none";
		document.getElementById("moptab").style.display = "none";
		document.getElementById("mhltab").style.display = "none";
		document.getElementById("nonmhltab").style.display = "block";
	}
}
function getBR(){
	document.ViewOpenCover.action='bulkPrintReport.action';
	document.ViewOpenCover.submit();
}
</script>
</body>
</html>