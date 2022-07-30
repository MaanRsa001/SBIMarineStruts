<%@ page isELIgnored="false" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
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
			var data = $('#record').dataTable( {
				"lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
				"order": [[ 1, "asc" ]],
				"columnDefs": [ {
		          "targets": 'no-sort',
		          "orderable": false,
			    } ],
				responsive: true
			});
		} catch(err){}
	} );
	</script>
</head>
	<body>
     	<div class="table0" style="width: 100%; margin: 0 auto;">
	<div class="tablerow">
		<div class="table1" style="width: 100%; margin: 0 auto; background-color: #E5E5E5; ">
			<div class="tablerow">
				<div style="padding:10px; background:#F8F8F8">							
					<div class="table2">
						<div class="tablerow">
							<span style="color:red;"><s:actionerror/></span>
						</div>																
						<div class="tablerow" style="margin-top: 10px; background-color: #fff; padding: 10px;">
							<div class="boxcontent">
								<s:form name="nhActivity" theme="simple">
								<div class="panel panel-primary">											
									<div class="panel-heading">
										<span> Customer Details</span>
										 
											<br class="clear" />
									</div>
									<div class="panel-body">
										<div class="panel panel-danger">											 
											<div class="panel-body">												
												<table class="display responsive no-wrap" id="record" width="100%" cellspacing="0">
													<thead>
														<tr>
														<th width="5%">S.No.</th>
														<th width="15%">Customer Id</th>
														<th width="8.3%">First Name</th>
														<th width="8.3%">Mail Address</th>
														<th width="8.3%">Country</th>														
														<th width="8.3%">View</th>
														</tr>
													</thead>
													<tbody>
													<s:iterator value="coreCustomerList" var="stat">
														<tr>
															<td align="center"><s:property value="%{#stat.index}"/></td>
															<td><s:property value="%{#stat.CUSTOMER_ID}"/></td>
															<td><s:property value="%{#stat.FIRST_NAME}"/></td>
															<td><s:property value="%{#stat.EMAIL}"/></td>
															<td><s:property value="%{#stat.EMIRATE}"/></td>														 
															<td  align="center"><input type="button" class="btn btn-sm btn-warning" value="View" onclick="funChView(<s:property value="%{#stat.CUSTOMER_ID}"/>);" ></td>
														</tr>
													</s:iterator>													 
													</tbody>
												</table>
											</div>
										</div>										
										<div align="center">
											<input type="button" class="btn btn-sm btn-danger" value="Back" onclick="funBack();" >
										</div>										
									</div>											
								</div>
								<s:token/>
								</s:form>
							</div>									
						</div>																
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<SCRIPT type="text/javascript">
function funChView(custId){
	document.nhActivity.action="editCoreCustomerCustomerMgm.action?customerId="+custId;
	document.nhActivity.submit();
}
</SCRIPT>
	</body>
</html>