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
					responsive: true
				});
			} catch(err){}
		} );
		
		jQuery(function ($) {
			try {
				var data = $('#gridTableMotorReport').dataTable( {
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
					<s:text name="label.motorReports"/>
				</div>				
				<div class="panel-body">
					<s:if test="hasActionErrors()">
					<div class="row">
						<font color="red"><s:actionerror cssStyle="list-style: none;"/></font>
					</div>
					<br class="clear" />
					</s:if>
					<s:if test="mode != 'showlist'">
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
								<div class="text"><s:text name="label.fromDate"/><font color="red">*</font></div>
								<div class="tbox">
									<s:textfield name="fromDate" id="fromDate" cssClass="inputBox datepicker" readonly="true" />
								</div>
							</div>
							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
								<div class="text"><s:text name="label.toDate" /><font color="red">*</font></div>
								<div class="tbox">
									<s:textfield name="toDate" id="toDate" cssClass="inputBox datepicker" readonly="true" />
								</div>
							</div>
							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4" align="center">
								<br/>
								<input type="button" onclick="getMotorReport('fromDate','toDate','id');" class="btn btn-sm btn-success" value="Submit" />
							</div>
						</div>
					</s:if>
					<s:if test="mode == 'list'">
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
								<table class="display responsive no-wrap" id="gridTableMake" width="100%" cellspacing="0">
									<thead style="background: #F8F8F8;">
										<tr>
											<th class="no-sort"><s:text name="label.master.sno"/></th>
											<!--<th><s:text name="label.policyType"/></th>
											--><th><s:text name="label.policyName"/></th>					
											<th><s:text name="label.noofpolicy"/></th>		
											<th><s:text name="label.premium"/></th>
										</tr>
									</thead>
									<tbody>
										<s:iterator value="motorReportList" var="list" status="stat">
										<tr>
											<td align="center"><s:property value="#stat.count"/></td>
											<!--<td><s:property value="#list.POLICYTYPE"/></td>
											--><td><s:property value="#list.POLICY_NAME" /></td>
											<td align="center"><a type="button" class="btn btn-sm btn-primary" href="#" onclick="fnClick('<s:property value="#list.POLICYTYPE"/>');" ><s:property value="#list.NO_OF_POLICY"/> </a> </td>
											<td align="right"><s:property value="#list.PREMIUM" /></td>
										</tr>
										</s:iterator>
									</tbody>
								</table>
							</div>
						</div>
					</s:if>
					<div class="panel-body">
					<s:if test="mode == 'showlist'">
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="overflow-x: scroll;">
								<table class="display responsive no-wrap" id="gridTableMotorReport" width="100%" cellspacing="0">
									<thead>
										<tr>
											<th class="no-sort"><s:text name="label.master.sno"/></th>
											<th class="tableColWidth">Policy No</th>
											<th class="tableColWidth"><s:text name="label.policyName"/></th>
											<th class="tableColWidth"><s:text name="label.makename"/></th>					
											<th class="tableColWidth"><s:text name="label.modelname"/></th>		
											<th class="tableColWidth"><s:text name="label.typeofbody"/></th>
											<th class="tableColWidth"><s:text name="label.vehicletypedesc"/></th>
											<th class="tableColWidth"><s:text name="label.manfau.year"/></th>					
											<th class="tableColWidth"><s:text name="label.seating.capacity"/></th>		
											<th class="tableColWidth"><s:text name="label.cubic.capacity"/></th>
											<th class="tableColWidth"><s:text name="label.areaCoverage"/></th>
											<th class="tableColWidth"><s:text name="label.suminsured.value.local"/></th>					
											<th class="tableColWidth"><s:text name="label.vehiclerate"/></th>		
											<th class="tableColWidth"><s:text name="label.premium"/></th>
											<th class="tableColWidth"><s:text name="label.electical.si"/></th>
											<th class="tableColWidth"><s:text name="label.non.electrical.si"/></th>					
											<th class="tableColWidth"><s:text name="label.optional.cover"/></th>		
											<th class="tableColWidth"><s:text name="label.no.claim.bonus"/></th>
											<th class="tableColWidth"><s:text name="label.claim.yn"/></th>
											<th class="tableColWidth"><s:text name="label.claim.amount"/></th>					
											<th class="tableColWidth"><s:text name="label.driver.id"/></th>		
											<th class="tableColWidth"><s:text name="label.driver.dob"/></th>
											<th class="tableColWidth"><s:text name="label.vehicle.color"/></th>
										</tr>
										</thead>
										<tbody >
											<s:iterator value="motorReportList" var="list" status="stat">
												<tr>
													<td><s:property value="#stat.count"/></td>
													<td><s:property value="#list.POLICY_NO"/></td>
													<td><s:property value="#list.POLICYTYPENAME"/></td>
													<td><s:property value="#list.MAKE_NAME" /></td>
													<td><s:property value="#list.MODEL_NAME"/></td>
													<td><s:property value="#list.TYPE_OF_BODY_NAME" /></td>
													<td><s:property value="#list.VEHICLETYPE_DESC"/></td>
													<td><s:property value="#list.MANUFACTURE_YEAR" /></td>
													<td><s:property value="#list.SEATING_CAPACITY"/></td>
													<td><s:property value="#list.CUBIC_CAPACITY" /></td>
													<td><s:property value="#list.AREA_COVERAGE"/></td>
													<td align="right"><s:property value="#list.SUMINSURED_VALUE_LOCAL" /></td>
													<td align="right"><s:property value="#list.VEHICLERATE"/></td>
													<td align="right"><s:property value="#list.PREMIUM" /></td>
													<td align="right"><s:property value="#list.ELECTRICAL_SI"/></td>
													<td align="right"><s:property value="#list.NONELECTRICAL_SI" /></td>
													<td><s:property value="#list.OPTIONAL_COVER"/></td>
													<td align="right"><s:property value="#list.NO_CLAIM_BONUS" /></td>
													<td><s:property value="#list.CLAIMYN"/></td>
													<td align="right"><s:property value="#list.CLAIM_AMOUNT" /></td>
													<td><s:property value="#list.DRIVER_ID"/></td>
													<td><s:property value="#list.DRIVER_DOB" /></td>
													<td><s:property value="#list.VEHICLE_COLOR"/></td>
												</tr>
											</s:iterator>
										</tbody>
								</table>
							</div>
						</div>
						<br class="clear" />
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" align="center">
								<input type="button" onclick="fnReport('policyType','fromDate','toDate');" class="btn btn-warning btn-sm" value="Excel" />
							</div>
							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" align="center">
								<input type="button" onclick="getMotorReport();" class="btn btn-sm btn-danger" value="Back" />
							</div>
						</div>
						<s:hidden name="policyType" id="policyType"/>
						<s:hidden name="fromDate"  id="fromDate"/>
						<s:hidden name="toDate"  id="toDate"/>
					</s:if>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</s:form>
</body>
<script type="text/Javascript" >
function getMotorReport(){
	    document.form1.action='getMotorReportAM.action?mode=list';
	    document.form1.submit();
}
function fnClick(val){
		document.form1.action='getMotorReportAM.action?policyType='+val+'&mode=showlist';
	    document.form1.submit();
}
function fnBack(){
		document.form1.action='getMotorReportAM.action?mode=list';
	    document.form1.submit();
}
function fnReport(val){
		document.form1.action='reportReportAM.action';
	    document.form1.submit();
}
</script>
</html>