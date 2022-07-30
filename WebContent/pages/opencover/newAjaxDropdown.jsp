<%@ taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/tcal.js"></script>
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/cssbootstrap/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/footable-0.1.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.responsive.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.jqueryui.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.tableTools.css">
<link href="<%=request.getContextPath()%>/dataTables/css/jquery-start-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.jqueryui.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.responsive.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.tableTools.js"></script>


<s:if test='"quoteRegDivId".equalsIgnoreCase(ajaxId)'>
<script type="text/javascript">
jQuery(function ($) {
	try {
		var data = $('#gridTable').dataTable( {
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
	<table class="table table-bordered table-stripped" id="gridTable" width="100%">
 	<thead>
 		<tr style="color: white;">
 			<td  style="text-align: center;"><s:text name="Proposal No" /></td>
 			<td  style="text-align: center;"><s:text name="Customer Name" /></td>
 			<td  style="text-align: center;"><s:text name="Policy Start Date" /></td>
 			<td  style="text-align: center;"><s:text name="Policy End Date" /></td>
 			<td  style="text-align: center;"><s:text name="Edit" /></td>
 			<td  style="text-align: center;"><s:text name="Draft" /></td>
 		</tr>
 	</thead>
	<tbody>
	   	<s:iterator value="quoteList" var="var" status="stat">
			<tr>
				<td><font style="float: left;"><s:property value="%{#var.proposal_no}" /></font></td>
				<td><font style="float: left;"><s:property value="%{#var.company_name}" /></font></td>
				<td><font style="float: left;"><s:property value="%{#var.policy_start_date}" /></font></td>
				<td><font style="float: left;"><s:property value="%{#var.policy_end_date}" /></font></td>
				<td><b><a href="#" onclick="viewPolicys('<s:property value="%{#var.proposal_no}" />');">Edit</a></b></td>
				<td><b><a href="#" onclick="draft'<s:property value="%{#var.proposal_no}" />');">Draft</a></b></td>
			</tr>
		</s:iterator>
	</tbody>
 </table>
</s:if>