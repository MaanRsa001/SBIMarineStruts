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
<s:form name="claimIntimation" theme="simple">
<div class="container-fluid">
	<div class="row">
		<div class="col-xs-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<s:text name="label.claim.report"/>
				</div>				
				<div class="panel-body">
					<s:if test="hasActionErrors()">
					<div class="row">
						<font color="red"><s:actionerror cssStyle="list-style: none;"/></font>
					</div>
					<br class="clear" />
					</s:if>
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
							<div class="col-xs-12 col-sm-12 col-md-12col-lg-12" align="center">
								<input type="button" onclick="getClaimReport('list','fromDate','toDate');" class="btn btn-sm btn-success" value="Submit" />
							</div>
					  </div>
				</div>
				<s:if test="mode == 'list'">
				<div class="panel panel-primary">
				<div class="panel-heading">
					<s:text name="label.claim.comprehensive.and.fire.and.theft"/>
				</div>     
				<div class="panel-body">
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="overflow-x: scroll;">
								<table class="footable">
									<thead>
										<tr>
											<th class="no-sort"><s:text name="label.master.sno"/></th>
											<th class="tableColWidth"><s:text name="label.policyNumber"/></th>
											<th class="tableColWidth"><s:text name="label.make"/></th>					
											<th class="tableColWidth"><s:text name="label.model"/></th>	
											<th class="tableColWidth"><s:text name="label.view"/></th>		
										</tr>
										</thead>
										<tbody >
											<s:iterator value="claimIntimateReportList" var="list" status="stat">
												<tr>
													<td><s:property value="#stat.count"/></td>
													<td><s:property value="#list.POLICY_NO"/></td>
													<td><s:property value="#list.MAKE_NAME" /></td>
													<td><s:property value="#list.MODEL_NAME"/></td>
													<td style="text-align: center;">
													<input type="button" class="btn btn-warning btn-sm" onclick="claimSubmit();" value="view" />
												    </td>
												</tr>
											</s:iterator>
										</tbody>
								</table>
							</div>
						</div>
				</div>
			    </div>
			    <div class="panel panel-primary">
				<div class="panel-heading">
					<s:text name="label.claim.third.party"/>
				</div>     
				<div class="panel-body">
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="overflow-x: scroll;">
								<table class="footable">
									<thead>
										<tr>
											<th class="no-sort"><s:text name="label.master.sno"/></th>
											<th class="tableColWidth"><s:text name="label.policyNumber"/></th>
											<th class="tableColWidth"><s:text name="label.make"/></th>					
											<th class="tableColWidth"><s:text name="label.model"/></th>	
											<th class="tableColWidth"><s:text name="label.view"/></th>		
										</tr>
										</thead>
										<tbody >
											<s:iterator value="claimIntimateReportTpaList" var="list" status="stat">
												<tr>
													<td><s:property value="#stat.count"/></td>
													<td><s:property value="#list.POLICY_NO"/></td>
													<td><s:property value="#list.MAKE_NAME" /></td>
													<td><s:property value="#list.MODEL_NAME"/></td>
													<td style="text-align: center;">
													<input type="button" class="btn btn-warning btn-sm" onclick="claimSubmit();" value="view" />
												    </td>
												</tr>
											</s:iterator>
										</tbody>
								</table>
							</div>
						</div>
				</div>
			    </div>
			    </s:if>
		   </div>
		</div>
	</div>
</div>
<s:token/>
</s:form>
</body>
<script type="text/Javascript" >

function getClaimReport(mode,fromDate,toDate){
document.forms['claimIntimation'].fromDate.value = fromDate;
document.forms['claimIntimation'].toDate.value = toDate;
document.forms['claimIntimation'].action = "<%=request.getContextPath()%>/IntimationReportAM.action?mode="+list;
document.forms['claimIntimation'].submit();
}
</script>
</html>