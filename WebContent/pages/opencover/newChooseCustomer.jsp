<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
	<head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="keywords" content="Maan Sarovar, Sea Trans, Marine Insurance">	
		<meta name="author" content="">
		<title> ::: E-Way - Customer Selection ::: </title>
		<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/saicoHeaderLogo.jpg" />	
		<script type="text/javascript" src="js/common.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css//bootstrap.min.css" />
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
		<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/numeric-comma.js"></script>
		
		<script type="text/javascript">
   		$(document).ready(function() {
		    $('#record').dataTable( {
			        "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
			        responsive: true
			} );
		} );
   		</script>
	</head>
<body>
<s:form name="custform" id="custform" theme="simple">
<div class="table0">
	<div class="tablerow" id="customerSearchList">
		<div class="panel panel-primary" style="overflow-x: visible;">
			<div class="panel-heading">
				<s:text name="Customer Selection" />
			</div>
			<div class="panel-body">
					<table class="display responsive no-wrap" id="record" width="100%" cellspacing="0" style="font-size: 12px;">
						<thead>
							<tr>
								<th width="5%"></th>
									<th width="19%"><b><s:text name="label.cusromerId"/></b></th>
									<th width="19%"><b><s:text name="label.customer"/></b></th>
									<th width="19%"><b><s:text name="label.email"/></b></th>
									<th width="19%"><b><s:text name="label.view"/></b></th>
							</tr>
						</thead>
						<tbody>					
							<s:iterator value="customerSelectionlist" var="customerdetail" status="stat">
								<tr>
									 	<td>
									 	<s:hidden name="chcustomerName[%{#stat.index}]" value="%{#customerdetail.FirstName==null?'':#customerdetail.FirstName}"></s:hidden>
									 	<s:hidden name="chcustomerId[%{#stat.index}]" value="%{#customerdetail.CustomerId==null?'':#customerdetail.CustomerId}"></s:hidden>
									 	<s:checkbox name="chcustomercheck[%{#stat.index}]" id="checkbox%{#customerdetail.CustomerId}" title="%{#customerdetail.FirstName}"></s:checkbox>
									 	</td>   				  
										<td><s:property value='%{#customerdetail.CustomerId==null?"":#customerdetail.CustomerId}' /></td>
										<td><s:property value='%{#customerdetail.FirstName==null?"":#customerdetail.FirstName}'  /></td>
										<td><s:property value='%{#customerdetail.Email==null?"":#customerdetail.Email}' /></td>
										<td><a href="#" title="View Customer Details" class="two" onClick="viewCustomer('<s:property value="%{#customerdetail.CustomerId}"/>');"> <b>View</b></a></td>
								</tr>
							</s:iterator>
						</tbody>
					</table>
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
						 <input type="button" onclick="window.close()"  class="btn btn-sm btn-danger" value="Close" > 
						<input type="button" value="Submit" id="customerbtn" onclick="fncustSubmit()" class="btn btn-sm btn-success">
					</div>
					
				</div>
			
			
			</div>
		</div>
	</div>
	
	
</div>
<s:hidden name="proposalNo" id="proposalNo" />
<s:hidden name="customerId" id="customerId" />
<s:hidden name="brokerId" id="brokerId" />
</s:form>

<script type="text/javascript">
function stopRKey(evt) { 
	var evt = (evt) ? evt : ((event) ? event : null); 
	var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null); 
	if ((evt.keyCode == 13) && (node.type=="text")) { return false; } 
} 

document.onkeypress = stopRKey;
if(window.opener.Quotation.chcustomerIds.value.length>=1){
	var val=window.opener.Quotation.chcustomerIds.value;
	var elements=val.split(',');
	for(i=0; i<elements.length; i++){
		document.getElementById('checkbox'+elements[i]).checked=true;
	}
}
function fncustSubmit(){
	document.custform.action = 'savechcustomerOpenCover.action';
	document.custform.submit();
	//postFormRequest('savechcustomerOpenCover.action','customerSelectionAjaxId','custform');
	//$("#customerbtn").attr("data-dismiss","modal");
}
function viewCustomer(val){
	document.custform.customerId.value=val;
	document.custform.action = 'editcustomerOpenCover.action';
	document.custform.submit();
}
function postFormRequest(strUrl, id, formId) {
    $.ajax({
		url : strUrl,
		type : "POST",
		data : $("#" + formId).serialize(),
		error : function() {
			$('#' + id).html('<p>An error has occurred in jquery Ajax</p>');
		},
		success : function(data) {
			$('#' + id).html(data);
		},
		beforeSend : function() {
			$('#loading').show();
			$('.ajaxLoader').show();
		},
		complete : function() {
			$('#loading').hide();
			$('.ajaxLoader').hide();
		}
	});
}
</script>
</body>
</html>