<%@ page isELIgnored="false" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>
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
<s:form name="form1" method="post" action="" theme="simple" validate="false">
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="broker.brokermanagement" />
				<div class="pullRight">
					<a class="btn btn-sm btn-info" style="text-decoration: none;" title="Broker Creation" href="editBrokerMgm.action?mode=new"> <i class="glyphicon glyphicon-plus"></i> </a>
				</div>
				<br class="clear" />
			</div>
			<div class="panel-body">
				<table class="display responsive no-wrap" id="record" width="100%" cellspacing="0">
					<thead>
					<tr>
						<th class="no-sort"></th>
						<th><s:text name="S.No." /></th>
						<th><s:text name="Broker Name" /></th>
						<th><s:text name="Broker Code" /></th>
						<th><s:text name="Login Id" /></th>
						<th><s:text name="Created Date" /></th>
						<th><s:text name="More" /></th>
						<th><s:text name="Status" /></th>
					</tr>
					</thead>
					<tbody>
					<s:iterator value="brokerList" status="stat" var="record">
					<tr>
						<td></td>
						<td><s:property value="%{#stat.index+1}" /></td>
						<td><s:property value="#record.CompanyName"/>&nbsp;(<s:property value="#record.AgencyCode"/>)</td>
						<td><s:property value="RsaBrokerCode" /></td>
						<td><s:property value="LoginId" /></td>
						<td><s:property value="CreateDate" /></td>						
						<td>
							<a class="btn btn-sm btn-warning" style="text-decoration: none;" type="button" href='viewBrokerMgm.action?mode=edit&agencyCode=<s:property value="#record.AgencyCode"/>' > <i class="fa fa-ellipsis-h"></i> </a>
						</td>
						<td> <span class="label label-success"> <s:property value="Status" /> </span> </td>
					</tr>
					</s:iterator>
					</tbody>						
				</table>
			</div>	
		</div>
	</div>
</div>
<s:token/>
</s:form>
<script type="text/javascript">
function getBroker(val, id){
	if(val.length>=2){
		var searchBy=document.getElementById("searchBy").value;
		var bCode=document.getElementById("branchCode").value;
		postRequest('<%=request.getContextPath()%>/getBrokerAjaxBrokerMgm.action?reqFrom='+id+'&branchCode='+bCode+'&searchBy='+searchBy+'&searchValue='+val, id);
	}
}
</script>
</body>
</html>