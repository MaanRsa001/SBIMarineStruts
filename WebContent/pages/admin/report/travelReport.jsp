<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
	<SCRIPT language=Javascript>
		function isNumberKey(evt) {
			var charCode = (evt.which) ? evt.which : event.keyCode;
			if (charCode != 46 && charCode > 31 
			&& (charCode < 48 || charCode > 57))
			return false;
			return true;
		}
	</SCRIPT>
	<s:if test='startDate!=null & startDate!="" &&endDate!=null && endDate!="" && transactionList!=null && transactionList.size()>0' >
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
	var ListMap;
	$(document).ready(function() {
			try {
				var ListMapStr = window.localStorage.getItem("transactionList");
				ListMap = JSON.parse(ListMapStr);	
				$('#gridTable').DataTable( {
					"lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
					"order": [[ 2, "desc" ]],
					"responsive": true,
                    "data": ListMap,
		            "columnDefs" : [ 
		                            
									{'targets': 0,"visible": true,"searchable": true,"data":"POLICY_NO"},
									{'targets': 1,"visible": true,"searchable": true,"data":"COMPANY_NAME"},
									{'targets': 2,"visible": true,"searchable": true,"data":"MISSIPPI_ID"},
									{'targets': 3,"visible": true,"searchable": true,"data":"BRANCH_CODE"},
									{'targets': 4,"visible": true,"searchable": true,"data":"LINKED_BRANCH_LOCATION"},
									{'targets': 5,"visible": true,"searchable": true,"data":"LOB"},
									{'targets': 6,"visible": true,"searchable": true,"data":"LOGIN_ID"},
									{'targets': 7,"visible": true,"searchable": true,"data":"PRODUCT"},
									{'targets': 8,"visible": true,"searchable": true,"data":"SUB_PRODUCT"},
									{'targets': 9,"visible": true,"searchable": true,"data":"SUB_PRODUCT_CODE"},
									{'targets': 10,"visible": true,"searchable": true,"data":"CUSTOMER_ID"},
									{'targets': 11,"visible": true,"searchable": true,"data":"FIRST_NAME"},
									{'targets': 12,"visible": true,"searchable": true,"data":"POLICY_GENERATED_DATE"},
									{'targets': 13,"visible": true,"searchable": true,"data":"POLICY_START_DATE"},
									{'targets': 14,"visible": true,"searchable": true,"data":"POLICY_END_DATE"},
									{'targets': 15,"visible": true,"searchable": true,"data":"PREMIUM"},
									{'targets': 16,"visible": true,"searchable": true,"data":"COMMISSION_PERCENTAGE"},
									{'targets': 17,"visible": true,"searchable": true,"data":"COMMISSION_AMOUNT"},
									{'targets': 18,"visible": true,"searchable": true,"data":"ADULT_PASSENGER_CNT"},
									{'targets': 19,"visible": true,"searchable": true,"data":"CHILD_PASSENGER_CNT"},
									{'targets': 20,"visible": true,"searchable": true,"data":"TOTAL_PASSENGER_CNT"}
		                            ]
		                            
				} );

			} catch(err){}
		} );
	 </script>
	 </s:if>
</head>
<body>
<s:form name="report"  method="post" id="report" theme="simple">
<div class="container-fluid">
	<div class="row">
		<div class="col-xs-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<s:text name="label.travelReports"/>
				</div>				
				<div class="panel-body">
					<s:if test="hasActionErrors()">
						<div class="row">
							<font color="red"><s:actionerror cssStyle="list-style: none;"/></font>
						</div>
						<br class="clear" />
					</s:if>
					<div class="panel-body">
						<%--<div id="loading" style="width: 100%">
							<img id="loading-image"
								src="images/ajax-loader-bar.gif" />
						</div>
						--%><div class="row">
							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-3">
								<div class="text"><s:text name="label.fromDate"/><font color="red">*</font></div>
								<div class="tbox">
									<s:textfield name="startDate" id="startDate" cssClass="inputBox datepicker" readonly="true" />
								</div>
							</div>
							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-3">
								<div class="text"><s:text name="label.toDate" /><font color="red">*</font></div>
								<div class="tbox">
									<s:textfield name="endDate" id="endDate" cssClass="inputBox datepicker" readonly="true" />
								</div>
							</div>
							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-3">
								<div class="text"><s:text name="Select Broker"/> <font color="red">*</font></div>
								<div class="tbox">
									<s:select name="brokerName" list="brokerList" headerKey="ALL" headerValue="ALL" listKey="LOGIN_ID" listValue="COMPANY_NAME" cssClass="inputBoxS" onchange="getAjaxModel(this.value,'userNameList','');"/>
								</div>
							</div>
							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-3" id="userNameList">
								<div class="text"><s:text name="User Name"/><font color="red">*</font></div>
								<div class="tbox">
									<s:select name="userName" list="#{}" headerKey="ALL" headerValue="ALL" cssClass="inputBoxS"/>
								</div>
							</div>
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
								<br/>
								<input type="button" onclick="getTravelReport();" class="btn btn-sm btn-success" value="Submit" />
							</div>
						</div>
					</div>
					<div class="panel-body">
					<s:if test='startDate!=null & startDate!="" &&endDate!=null && endDate!="" && transactionList!=null && transactionList.size()>0' >
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
								
								<table class="display responsive no-wrap" id="gridTable" width="100%" cellspacing="0">
									<thead>
										<tr>
											<th class="no-sort"></th>
											<th><s:text name="Policy No."/></th>
											<th><s:text name="Company Name"/></th>
											<th><s:text name="Customer Core Code"/></th>					
											<th><s:text name="Branch Code"/></th>		
											<th><s:text name="Linked Branch Location"/></th>
											<th><s:text name="LOB"/></th>
											<th><s:text name="Login Id"/></th>					
											<th><s:text name="Product"/></th>		
											<th><s:text name="Sub Product"/></th>
											<th><s:text name="Sub Product Code"/></th>
											<th><s:text name="Customer Id"/></th>					
											<th><s:text name="Customer Name"/></th>		
											<th><s:text name="Policy Generated Date"/></th>
											<th><s:text name="Policy Start Date"/></th>
											<th><s:text name="Policy End Date"/></th>					
											<th><s:text name="Premium"/></th>		
											<th><s:text name="Commission Percentage"/></th>
											<th><s:text name="Commission Amount"/></th>
											<th><s:text name="Number Of Adult Passanger"/></th>					
											<th><s:text name="Number Of Child Passanger "/></th>		
											<th><s:text name="Total No. Passanger"/></th>
										</tr>
										</thead>
										<!--<tbody>
											<s:iterator value="transactionList" var="list" status="stat">
												<tr>
													<td><s:property value="#stat.count"/></td>
													<td><s:property value="#list.POLICY_NO"/></td>
													<td><s:property value="#list.COMPANY_NAME"/></td>
													<td><s:property value="#list.MISSIPPI_ID" /></td>
													<td><s:property value="#list.BRANCH_CODE"/></td>
													<td><s:property value="#list.LINKED_BRANCH_LOCATION" /></td>
													<td><s:property value="#list.LOB"/></td>
													<td><s:property value="#list.LOGIN_ID" /></td>
													<td><s:property value="#list.PRODUCT"/></td>
													<td><s:property value="#list.SUB_PRODUCT" /></td>
													<td><s:property value="#list.SUB_PRODUCT_CODE"/></td>
													<td><s:property value="#list.CUSTOMER_ID" /></td>
													<td><s:property value="#list.FIRST_NAME"/></td>
													<td><s:property value="#list.POLICY_GENERATED_DATE" /></td>
													<td><s:property value="#list.POLICY_START_DATE"/></td>
													<td><s:property value="#list.POLICY_END_DATE" /></td>
													<td align="right"><s:property value="#list.PREMIUM"/></td>
													<td align="right"><s:property value="#list.COMMISSION_PERCENTAGE" /></td>
													<td align="right"><s:property value="#list.COMMISSION_AMOUNT"/></td>
													<td><s:property value="#list.ADULT_PASSENGER_CNT" /></td>
													<td><s:property value="#list.CHILD_PASSENGER_CNT"/></td>
													<td><s:property value="#list.TOTAL_PASSENGER_CNT" /></td>
												</tr>
											</s:iterator>
										</tbody>-->
								</table>
							</div>
						</div>
						<br class="clear" />
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" align="center">
								<input type="button" onclick="fnReport('<s:property value="startDate"/>','<s:property value="endDate"/>','travelReport','<s:property value="brokerName"/>','<s:property value="userName"/>');" class="btn btn-warning btn-sm" value="Excel" /> &nbsp; &nbsp; &nbsp;
								<input type="button" onclick="fnReport('<s:property value="startDate"/>','<s:property value="endDate"/>','travelDetailReport','<s:property value="brokerName"/>','<s:property value="userName"/>');" class="btn btn-info btn-sm" value="Detail Report" />
							</div>
							<!-- <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" align="center">
								<input type="button" onclick="fnBack();" class="btn btn-sm btn-danger" value="Back" />
							</div> -->
						</div>						
					</s:if> 
					<s:else>
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
								No Records Available						
							</div>
						</div>	
					</s:else>	 
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<s:hidden name="reqFrom"></s:hidden>
</s:form>
</body>
<script type="text/Javascript" >
function getTravelReport(){
	    document.report.action='initReportTravelConfigure.action';
	    document.report.submit();
}
function fnBack(){
		document.report.action='reportTravelConfigure.action';
	    document.report.submit();
}
function fnReport(startDate,endDate,reqFrom,brokerName,userName){
		document.report.action='reportReportAT.action?fromDate='+startDate+'&toDate='+endDate+'&mode='+reqFrom;
	    document.report.submit();
}
getAjaxModel('<s:property value="brokerName"/>','userNameList','<s:property value="userName"/>');
function getAjaxModel(val,id,userName){
		postRequest('<%=request.getContextPath()%>/'+id+'TravelConfigure.action?brokerName='+val+'&userName='+userName, id);
}
</script>
</html>