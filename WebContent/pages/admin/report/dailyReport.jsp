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
	 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datepicker/jquery-ui.css">
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
				var data = $('#gridTableMake').dataTable( {
					"lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
					"order": [[ 0, "asc" ]],
					"columnDefs": [ {
			          "targets": 'no-sort',
			          "orderable": false
				    } ],
					"scrollX": true,
					responsive: false
				});
			} catch(err){}
		} );
</script>
	 <style type="text/css">
	 .tableColWidth {
	 	min-width: 100px;
	 	max-width: 200px;
	 	width: 100px;
	 }
	 </style>	
</head>
<body>
<s:form name="form1" theme="simple">
<div class="container-fluid">
	<div class="row">
		<div class="col-xs-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<s:text name="Daily Report"/>
				</div>				
				<div class="panel-body">
					<s:if test="hasActionErrors()">
					<div class="row">
						<font color="red"><s:actionerror cssStyle="list-style: none;"/></font>
					</div>
					<br class="clear" />
					</s:if>
					<div class="panel-body">
					<s:if test="mode == 'dailyList'">
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="overflow-x: scroll;">
								<table class="display responsive no-wrap" id="gridTableMake" width="100%" cellspacing="0">
									<thead>
										<tr>
											<th class="no-sort"><s:text name="label.master.sno"/></th>
											<th class="tableColWidth">Quote No</th>
											<th class="tableColWidth"><s:text name="Policy No"/></th>
											<th class="tableColWidth"><s:text name="Customer Name"/></th>					
											<th class="tableColWidth"><s:text name="Mobile No"/></th>		
											<th class="tableColWidth"><s:text name="Email"/></th>
											<th class="tableColWidth"><s:text name="Policy Type Name"/></th>
											<th class="tableColWidth"><s:text name="Agency Repair"/></th>					
											<th class="tableColWidth"><s:text name="Inception Date"/></th>		
											<th class="tableColWidth"><s:text name="Expiry Date"/></th>
											<th class="tableColWidth"><s:text name="Issued Date"/></th>
											<th class="tableColWidth"><s:text name="HIJRI Issue Date"/></th>					
											<th class="tableColWidth"><s:text name="HIJRI Effective Date"/></th>		
											<th class="tableColWidth"><s:text name="HIJRI Expire Date"/></th>
											<th class="tableColWidth"><s:text name="SumInsured Value Local"/></th>
											<th class="tableColWidth"><s:text name="Deductibles"/></th>					
											<th class="tableColWidth"><s:text name="Base Rate"/></th>		
											<th class="tableColWidth"><s:text name="TPL Base Premium"/></th>
											<th class="tableColWidth"><s:text name="PA Driver Premium"/></th>
											<th class="tableColWidth"><s:text name="PA Passenger Premium"/></th>					
											<th class="tableColWidth"><s:text name="Policy Fee"/></th>		
											<th class="tableColWidth"><s:text name="Najam Fee"/></th>
											<th class="tableColWidth"><s:text name="Premium"/></th>
											<th class="tableColWidth"><s:text name="Overall Premium"/></th>
											<th class="tableColWidth"><s:text name="Optional Cover"/></th>
											<th class="tableColWidth"><s:text name="Plate Number AR"/></th>
											<th class="tableColWidth"><s:text name="Chassis No"/></th>
											<th class="tableColWidth"><s:text name="Engine Number"/></th>
											<th class="tableColWidth"><s:text name="Quote Remarks"/></th>
											<th class="tableColWidth"><s:text name="Payment Mode"/></th>
										</tr>
										</thead>
										<tbody >
											<s:iterator value="dailyReportList" var="list" status="stat">
												<tr>
													<td><s:property value="#stat.count"/></td>
													<td><s:property value="#list.QUOTE_NO"/></td>
													<td><s:property value="#list.POLICY_NO"/></td>
													<td><s:property value="#list.broker_name"/></td>
													<td><s:property value="#list.MOBILENO"/></td>
													<td><s:property value="#list.EMAIL"/></td>
													<td><s:property value="#list.POLICYTYPENAME"/></td>
													<td><s:property value="#list.AGENCY_REPAIR"/></td>
													<td><s:property value="#list.INCEPTION_DATE"/></td>
													<td><s:property value="#list.EXPIRY_DATE"/></td>
													<td><s:property value="#list.ISSUED_DATE"/></td>
													<td><s:property value="#list.HIJRI_ISSUE_DATE"/></td>
													<td><s:property value="#list.HIJRI_EFF_DATE"/></td>
													<td><s:property value="#list.HIJRI_EXPIRE_DATE"/></td>
													<td><s:property value="#list.SUMINSURED_VALUE_LOCAL"/></td>
													<td><s:property value="#list.DEDUCTIBLES"/></td>
													<td><s:property value="#list.BASE_RATE"/></td>
													<td><s:property value="#list.TPL_BASE_PREMIUM"/></td>
													<td><s:property value="#list.PA_DRIVER_PREMIUM"/></td>
													<td><s:property value="#list.PA_PASSENGER_PREMIUM"/></td>
													<td><s:property value="#list.POLICY_FEE"/></td>
													<td><s:property value="#list.NAJM_FEE"/></td>
													<td><s:property value="#list.PREMIUM"/></td>
													<td><s:property value="#list.OVERALL_PREMIUM"/></td>
													<td><s:property value="#list.OPTIONAL_COVER"/></td>
													<td><s:property value="#list.PLATE_NUMBER_AR"/></td>
													<td><s:property value="#list.CHASSIS_NO"/></td>
													<td><s:property value="#list.ENGINE_NUMBER"/></td>
													<td><s:property value="#list.quote_remarks"/></td>
													<td><s:property value="#list.PAYMENT_MODE"/></td>
												</tr>
											</s:iterator>
										</tbody>
								</table>
							</div>
						</div>
						<br class="clear" />
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" align="center">
								<input type="button" onclick="fnReport('fromDate','toDate');" class="btn btn-warning btn-sm" value="Excel" />
							</div>
							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" align="center">
								<input type="button" onclick="fnBack();" class="btn btn-sm btn-danger" value="Back" />
							</div>
						</div>
						<s:hidden name="fromDate"  id="fromDate"/>
						<s:hidden name="toDate"  id="toDate"/>
					</s:if>
					<s:else>
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-3">
								<div class="text"><s:text name="label.fromDate"/><font color="red">*</font></div>
								<div class="tbox">
									<s:textfield name="fromDate" id="fromDate" cssClass="inputBoxS datepicker" readonly="true" />
								</div>
							</div>
							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-3">
								<div class="text"><s:text name="label.toDate" /><font color="red">*</font></div>
								<div class="tbox">
									<s:textfield name="toDate" id="toDate" cssClass="inputBoxS datepicker" readonly="true" />
								</div>
							</div>
							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-3">
								<div class="text"><s:text name="Type" /><font color="red">*</font></div>
								<div class="tbox">
									<s:select name="reportType" id="reportType" list="#{'Policy':'Policies Generated','BuyQuote':'Prospective Customers','Quote':'Quotes','FailedQuote':'Make - Model Missing','PaymentFailed':'Payment Failure','CancelPolicy':'Cancel Policy'}" headerKey="" headerValue="---Select---" cssClass="inputBoxS tooltipContent" disabled="#endtDisable"></s:select>
								</div>
							</div>
							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-3" align="center">
							<br/>
								<input type="button" onclick="fnReport('fromDate','toDate','reportType');" class="btn btn-sm btn-success" value="Submit" />
							</div>
							<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" align="center">
								<input type="button" onclick="fnSummary('fromDate','toDate');" class="btn btn-warning btn-sm" value="Summary" />
							</div>
							<!--<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4" align="center">
								<br/>
								<input type="button" onclick="getDailyReport('fromDate','toDate','id');" class="btn btn-sm btn-success" value="Submit" />
							</div>
						--></div>
						</div>
					</s:else>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<s:token/>
</s:form>
</body>
<script type="text/Javascript" >
function getDailyReport(){
	    document.form1.action='getDailyReportAM.action?mode=list';
	    document.form1.submit();
}
function fnBack(){
		document.form1.action='dailySearchReportAM.action';
	    document.form1.submit();
}
function fnReport(val){
		document.form1.action='dailyReportReportAM.action';
	    document.form1.submit();
}
function fnSummary(val){
		document.form1.action='dailySummaryReportAM.action';
		document.form1.submit();
}
</script>
</html>