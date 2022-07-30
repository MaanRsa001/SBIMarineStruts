<%@ page isELIgnored="false" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>
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
	
	<style type="text/css">
	
		.droplink li:hover a { /* These create persistent hover states, meaning the top-most link stays 'hovered' even when your cursor has moved down the list. */
		    background-color: #0000FF;
		    text-decoration: underline;
		}
		
	</style>
	
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
		} catch(err){console.log(err)}
	} );
 	
 	jQuery(function ($) {
  		try {
			var data1 = $('#record1').dataTable( {
				"lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
				"order": [[ 1, "asc" ]],
				"columnDefs": [ {
		          "targets": 'no-sort',
		          "orderable": false
			    } ],
				responsive: true
			});
		} catch(err){console.log(err)}
	} );
  	</script>
</head>
<body>
<s:form id="shipDetailForm" name="shipDetailForm" method="post"  theme="simple">
		<s:if test='%{!"admin".equalsIgnoreCase(#session.usertype)}'>		
				<div class="panel panel-primary">
					<div class="panel-heading">
						<s:text name="Ship  Tracking Detail" />
						<br class="clear" />
					</div>
					<div class="panel-body">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
								<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
									<div class="text"> <s:text name="Start Date"/> <font color="red">*</font> </div>
									<div class="tbox">
										<s:textfield cssClass="inputBox datepicker" name="startDate" id="startDate" />
									</div>
								</div>
								<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
									<div class="text"> <s:text name="End Date"/> <font color="red">*</font> </div>
									<div class="tbox">
										<s:textfield cssClass="inputBox datepicker" name="endDate" id="endDate" />
									</div>
								</div>
								<s:if test='%{"RsaIssuer".equalsIgnoreCase(#session.usertype)}'>
								<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
									<div class="text">
										<s:label key="report.selectuser" theme="simple"/>
									</div>
									<div class="tbox">
										<s:select list="userSelection" listKey="LOGIN_ID" listValue="USERNAME" name="loginId"  headerKey="" headerValue="Select" value='%{#session.product_id==getText("OPEN_COVER")?#session.userName:loginId}'  cssClass="inputBoxS"/>
									</div>
								</div>
								</s:if>
								<s:else>
								<s:hidden name="loginId" value="%{#session.user}"/>
								</s:else>
								<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
									<br>
									<input type="button" name="sub" value="Submit" onclick="fnsubmit(this.form)" class="btn btn-sm btn-success" />
								</div>
							</div>
							<br>
							<s:if test="shipDetailList.size()>0 || shipPendingList.size()>0">
							&nbsp;<div class="row">
								<br>
								<br>
<!-- 												<ul class="nav nav-tabs droplink"> -->
<!-- 													<li class="active" ><a href="#home" class="nav-link" data-toggle="tab" data-toggle="pill" role="tab" aria-controls="pills-home">Completed</a></li> -->
<!-- 													<li><a href="#commodityID" class="nav-link"  data-toggle="tab" data-toggle="pill" " role="tab" aria-controls="pills-home">Pending</a></li> -->
<!-- 												</ul> -->

										<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
										  <li class="nav-item">
										    <a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#home" role="tab" aria-controls="pills-home" aria-selected="true">Completed</a>
										  </li>
										  <li class="nav-item">
										    <a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#commodityID" role="tab" aria-controls="pills-profile" aria-selected="false">Pending</a>
										  </li>
										</ul>
								
								<br>
							 </div>
							<div class="tab-content">
								<div class="tab-pane active" id="home">
										<div class="panel panel-primary">
											<div class="panel-heading">
												<s:text name="Shipment Completed" />
												<br class="clear" />
											</div>
										</div>
										<s:if test="shipDetailList.size()>0">
												<div class="row">
													<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">																		
														<table class="display responsive no-wrap" id="record1" width="100%" cellspacing="0">
															<thead>
															<tr>
																<th class="no-sort"></th>
																<th><s:text name="S.No" /></th>
																<th><s:text name="Owner name" /></th>
																<th><s:text name="QuoteNo" /></th>
																<th><s:text name="Policy No" /></th>
																<th><s:text name="IMO No" /></th>
																<th><s:text name="Ship Status" /></th>
																<th><s:text name="Flag" /></th>
																<th><s:text name="Year Of build" /></th>
																<th><s:text name="Status" /></th>
																<th><s:text name="View Ship" /></th>
															</tr>
															</thead>
															<tbody>
															<s:iterator value="shipDetailList" status="stat" var="record">
																<tr>
																	<td></td>
																	<td><s:property value="%{#stat.index+1}" /></td>
																	<td><s:property value="OwnerName" /> </td>
																	<td><s:property value="QuoteNo" /> </td>
																	<td><s:property value="PolicyNo" /> </td>
																	<td><s:property value="ImoNumber" />
																		<s:hidden name="imoNoC[%{#stat.index+1}]" id="imoNoC[%{#stat.index+1}]" value="%{ImoNumber}" />
																	 </td>
																	<td><s:property value="ShipStatus" /> </td>
																	<td><s:property value="Flag" /> </td>
																	<td><s:property value="YearOfBuild" /> </td>
																	<td><s:property value="Status" /> </td>
																	<td>
																		<input type="button" onclick="callPopup('<s:property value="ImoNumber" />','<s:property value="QuoteNo" />')" class="btn btn-sm btn-info" value="View"/> &nbsp;&nbsp;&nbsp;
																	</td>
																</tr>
															</s:iterator>
															</tbody>
														</table>
													</div>
												</div>
												<br>
												<div class="row">
														<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">	
														<input type="button" name="sub" value="View All Ship" onclick="viewAllShipCompleted('<s:property value="shipDetailList.size()"/>')" class="btn btn-sm btn-success" />
													</div>
												</div>
											</s:if>
									</div>
									<div class="tab-pane" id="commodityID">
										<div class="panel panel-primary">
											<div class="panel-heading">
												<s:text name="Shipment Pending" />
												<br class="clear" />
											</div>
										</div>
										<s:if test="shipPendingList.size()>0">
												<div class="row">
													<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">																		
														<table class="display responsive no-wrap" id="record" width="100%" cellspacing="0">
															<thead>
															<tr>
																<th class="no-sort"></th>
																<th><s:text name="S.No" /></th>
																<th><s:text name="Owner name" /></th>
																<th><s:text name="QuoteNo" /></th>
																<th><s:text name="Policy No" /></th>
																<th><s:text name="IMO No" /></th>
																<th><s:text name="Ship Status" /></th>
																<th><s:text name="Flag" /></th>
																<th><s:text name="Year Of build" /></th>
																<th><s:text name="Status" /></th>
																<th><s:text name="View Ship" /></th>
															</tr>
															</thead>
															<tbody>
															<s:iterator value="shipPendingList" status="stat" var="record">
																<tr>
																	<td></td>
																	<td><s:property value="%{#stat.index+1}" /></td>
																	<td><s:property value="OwnerName" /> </td>
																	<td><s:property value="QuoteNo" /> </td>
																	<td><s:property value="PolicyNo" /> </td>
																	<td><s:property value="ImoNumber" />
																		<s:hidden name="imoNo[%{#stat.index+1}]" id="imoNo[%{#stat.index+1}]" value="%{ImoNumber}" />
																	 </td>
																	<td><s:property value="ShipStatus" /> </td>
																	<td><s:property value="Flag" /> </td>
																	<td><s:property value="YearOfBuild" /> </td>
																	<td><s:property value="Status" /> </td>
																	<td>
																		<input type="button" onclick="callPopup('<s:property value="ImoNumber" />','<s:property value="QuoteNo" />')" class="btn btn-sm btn-info" value="View"/> &nbsp;&nbsp;&nbsp;
																	</td>
																</tr>
															</s:iterator>
															</tbody>
														</table>
													</div>
												</div>
												<br>
												<div class="row">
														<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">	
														<input type="button" name="sub" value="View All Ship" onclick="viewAllShipPending('<s:property value="shipPendingList.size()"/>')" class="btn btn-sm btn-success" />
													</div>
												</div>
											</s:if>
											
										</div>
									</div>
								</s:if>
							</div>
						</div>
					</s:if>
<s:else>

<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="Ship Detail Report" />
			</div>			
			<div class="panel-body">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<s:actionerror cssStyle="color: red;" /> <s:actionmessage cssStyle="color: green;" />
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text"> <s:text name="Search By"/> <font color="red">*</font> </div>
						<div class="tbox">
							<s:select name="searchBy" id="searchBy" headerKey="" headerValue="Select" list="#{'datewise':'Policy Period','quote':'Quote No','policy':'Policy No'}" cssClass="inputBoxS" onchange="changeDivId(this.value)"/>
						</div>
					</div>
					<div id="dateDivId" style="display:none">
						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							<div class="text"> <s:text name="Inception Date"/> <font color="red">*</font> </div>
							<div class="tbox">
								<s:textfield cssClass="inputBox datepicker" name="startDate" id="startDate" />
							</div>
						</div>
						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							<div class="text"> <s:text name="Expiry Date"/> <font color="red">*</font> </div>
							<div class="tbox">
								<s:textfield cssClass="inputBox datepicker" name="endDate" id="endDate" />
							</div>
						</div>
					</div>
					<div id="searchDivId">
						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							<div class="text"> <s:text name="Search Value"/> <font color="red">*</font> </div>
							<div class="tbox">
								<s:textfield name="searchValue" id="searchValue" cssClass="inputBox"></s:textfield>
							</div>
						</div>
					</div>
				</div>
				<br class="clear" />
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
						<input type="button" name="sub" value="Submit" onclick="fnAdsubmit(this.form)" class="btn btn-sm btn-success" />
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<s:if test="shipDetailList.size()>0">
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">																		
			<table class="display responsive no-wrap" id="record" width="100%" cellspacing="0">
				<thead>
				<tr>
					<th class="no-sort"></th>
					<th><s:text name="S.No" /></th>
					<th><s:text name="Owner name" /></th>
					<th><s:text name="QuoteNo" /></th>
					<th><s:text name="Policy No" /></th>
					<th><s:text name="IMO No" /></th>
					<th><s:text name="Ship Status" /></th>
					<th><s:text name="Flag" /></th>
					<th><s:text name="Year Of build" /></th>
					<th><s:text name="Status" /></th>
					<th><s:text name="View Ship" /></th>
				</tr>
				</thead>
				<tbody>
				<s:iterator value="shipDetailList" status="stat" var="record">
					<tr>
						<td></td>
						<td><s:property value="%{#stat.index+1}" /></td>
						<td><s:property value="OwnerName" /> </td>
						<td><s:property value="QuoteNo" /> </td>
						<td><s:property value="PolicyNo" /> </td>
						<td><s:property value="ImoNumber" />
						<s:hidden name="imoNo[%{#stat.index+1}]" id="imoNo[%{#stat.index+1}]" value="%{ImoNumber}" />
						 </td>
						<td><s:property value="ShipStatus" /> </td>
						<td><s:property value="Flag" /> </td>
						<td><s:property value="YearOfBuild" /> </td>
						<td><s:property value="Status" /> </td>
						<td>
							<input type="button" onclick="callPopup('<s:property value="ImoNumber" />','<s:property value="QuoteNo" />')" class="btn btn-sm btn-info" value="View"/> &nbsp;&nbsp;&nbsp;
						</td>
					</tr>
				</s:iterator>
				</tbody>
			</table>
		</div>
	</div>
	<br>
	<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">	
			<input type="button" name="sub" value="View All Ship" onclick="viewAllShipPending('<s:property value="shipDetailList.size()"/>')" class="btn btn-sm btn-success" />
		</div>
	</div>
</s:if>

</s:else>

<s:token/>
</s:form>

<script type="text/javascript">

function fnsubmit(frm) {
		document.shipDetailForm.action = "<%=request.getContextPath()%>/shipDetailsReport.action?mode=search";
		document.shipDetailForm.submit();
}
function fnAdsubmit(frm) {
	document.shipDetailForm.action = "<%=request.getContextPath()%>/shipTrackDetailsReport.action?mode=search";
	document.shipDetailForm.submit();
}
try{
changeDivId('<s:property value="searchBy"/>');
function changeDivId(val){
	if(val=='datewise'){
		document.getElementById("dateDivId").style.display = "block";
		document.getElementById("searchDivId").style.display = "none";
	}else{
		document.getElementById("dateDivId").style.display = "none";
		document.getElementById("searchDivId").style.display = "block";
	}
}
}catch(err){console.log(err);}

function callPopup(imoNo,quoteNo) {
	var URL = 'pointingVessel.do?imoNumber='+imoNo+'&quoteNumber='+quoteNo;
 	var bwidth = window.innerWidth;
	var bwidth1 = document.body.clientWidth;
	if(bwidth <= 768) {
		return popUp(URL,bwidth1,'500');
	} else {
		return popUp(URL,'750','500');
	}
}

// viewAllShipCompleted
function viewAllShipCompleted(val){
var imo='';
	for (var i=1;i<=val;i++){
		imo+=','+document.getElementById('imoNoC['+i+']').value;
	}
	imo = imo.substring(1);
	callPopup(imo,'');
}

function viewAllShipPending(val){
// 	alert();
	var imo='';
	for (var i=1;i<=val;i++){
		imo+=','+document.getElementById('imoNo['+i+']').value;
	}
// 	alert(imo);
	imo = imo.substring(1);
	callPopup(imo,'');
}

// viewAllShipPending


	var url = document.location.toString(); // select current url shown in browser.
	if (url.match('#')) {
	    $('.nav-tabs a[href=#' + url.split('#')[1] + ']').tab('show'); // activate current tab after reload page.
	}
	// Change hash for page-reload
	$('.nav-tabs a').on('shown', function (e) { // this function call when we change tab.
	    window.location.hash = e.target.hash; // to change hash location in url.
	});
	
</script>
</body>
</html>