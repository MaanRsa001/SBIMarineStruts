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
	<script type="text/javascript">
  	jQuery(function ($) {
  		try {
			var data1 = $('.display').dataTable( {
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
				<s:text name="lc.smart.report" />
			</div>			
			<div class="panel-body">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text"> <s:text name="policy.report.select.br"/> </div>
						<div class="tbox">
							<s:select name="broker" id="broker" list="brokerList" headerKey="" headerValue="---Select---" listKey="login_id" listValue="COMPANY_NAME" cssClass="inputBoxS" onchange="getlcreport(this.value, 'lcsmartLists')"/>
						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4" id="search" style="display:<s:if test='"ajax".equals(from1)'>block</s:if><s:else>none</s:else>">
						<div class="text"> <s:text name="Search By"/> </div>
						<div class="tbox">
							<div class="row">
								<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
									<s:select name="searchBy" id="searchBy" list="#{'ocm.MISSIPPI_OPENCOVER_NO':'Open Cover No', 'oclm.LC_NUMBER':'LC Number'}" headerKey="" headerValue="---Select---" cssClass="inputBoxS" />
								</div>
								<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
									<s:textfield name="searchValue" onkeyup="getlcsmart(this.value,'lcsmartLists')" cssClass="inputBox" />
								</div>
							</div>
						</div>
					</div>
				</div>
				<br class="clear" />
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<div id="lcsmartLists">
							<s:if test='"ajax".equals(from1)'>
								<table class="display responsive no-wrap" id="record" width="100%" cellspacing="0">
									<thead>
									<tr>
										<th class="no-sort"></th>
										<th><s:text name="S.No" /></th>
										<th><s:text name="Open Cover No" /></th>
										<th><s:text name="Customer Name" /></th>
										<th><s:text name="Bank Name" /></th>
										<th><s:text name="LC Number" /></th>
										<th><s:text name="Start Date" /></th>
										<th><s:text name="End Date" /></th>
										<th><s:text name="LC Currency" /></th>
										<th><s:text name="LC Currency Amount" /></th>
										<th><s:text name="LC Amount" /></th>
										<th><s:text name="LC Amount(SAR)" /></th>
										<th><s:text name="Used Amount(SAR)" /></th>
										<th><s:text name="Pending LC Amount(SAR)" /></th>
									</tr>
									</thead>
									<tbody>
									<s:iterator value="lcsmartList" status="stat" var="record">
									<tr>
										<td></td>
										<td><s:property value="%{#stat.index+1}" /> </td>
										<td><s:property value="MISSIPPI_OPENCOVER_NO" /> </td>
										<td><s:property value="cust_name" /> </td>
										<td><s:property value="bank_name" /> </td>
										<td><s:property value="LC_NUMBER" /> </td>
										<td><s:property value="start_date" /> </td>
										<td><s:property value="end_date" /> </td>
										<td><s:property value="SHORT_NAME" /> </td>
										<td><s:property value="EXCHANGE_RATE" /> </td>
										<td><s:property value="LC_AMOUNT" /> </td>
										<td><s:property value="LC_AMT_DH" /> </td>
										<td><s:property value="used_amt" /> </td>
										<td><s:property value='getText("number.format.2",{@java.lang.Double@valueOf(LC_BALANCE_AMOUNT)})' /> </td>
									</tr>
									</s:iterator>
									</tbody>
								</table>
							</s:if>
							<br class="clear" />
							<div align="right">
								<input type="button" onclick="exportdata('excel')" class="btn btn-sm btn-info" value="Excel"/> &nbsp;&nbsp;&nbsp;
		  						<input type="button" onclick="exportdata('pdf')" class="btn btn-sm btn-info" value="Pdf"/>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<s:hidden name="downloadType"/>
<s:token/>
</s:form>
<script type="text/javascript">
function getlcreport(val, id){
	//document.getElementById('ajaxLoader').style.display="block";
	document.getElementById('search').style.display="block";
	postRequest('<%=request.getContextPath()%>/lcSmartAreport.action?reqFrom='+id+'&broker='+val, id);
}

function getlcsmart(val, id){
	if(val.length>=2){
		var searchBy=document.getElementById("searchBy").value;
		var broker=document.getElementById("broker").value;
		postRequest('<%=request.getContextPath()%>/lcSmartAreport.action?reqFrom='+id+'&searchBy='+searchBy+'&searchValue='+val+'&broker='+broker, id);
	}
}

function exportdata(val) {
	document.form1.downloadType.value=val;	
	document.form1.action='<%=request.getContextPath()%>/lcSmartJasperAreport.action';	
	document.form1.submit();
}
</script>
</body>
</html>