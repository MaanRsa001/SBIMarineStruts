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
<s:form id="marine" name="marine" method="post" action="initIntegrationAreport.action" theme="simple">
<s:if test='"payreport".equals(mode)' >
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="Marine Payment Report" />
			</div>				
			<div class="panel-body">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" align="center">
						<s:text name="Start Date"/></b> &nbsp;:&nbsp;<s:property value="startDate"/>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" align="center">
						<s:text name="End Date"/></b> &nbsp;:&nbsp;<s:property value="endDate"/>
					</div>
				</div>
				<br class="clear" />
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<table class="display responsive no-wrap" id="record" width="100%" cellspacing="0">
							<thead>
							<tr>
								<th class="no-sort"></th>
								<th><s:text name="S.No" /></th>
								<th><s:text name="Policy No" /></th>
								<th><s:text name="No of Terms" /></th>
								<th><s:text name="Branch Name" /></th>
								<th><s:text name="Broker Name" /></th>
								<th><s:text name="Customer Name" /></th>
								<th><s:text name="Base Policy No" /></th>
								<th><s:text name="Open Cover No" /></th>
								<th><s:text name="Type" /></th>
								<th><s:text name="Policy Effective Date" /></th>
								<th><s:text name="Due Amount" /></th>
								<th><s:text name="Remarks" /></th>
							</tr>
							</thead>
							<tbody>
							<s:iterator value="paymentList" status="stat" var="record">
							<tr>
								<td></td>
								<td><s:property value="%{#stat.index+1}" /> </td>
								<td><s:property value="policy_no" /> </td>
								<td><s:property value="NO_OF_TERMS" /> </td>
								<td><s:property value="BRANCH_NAME" /> </td>
								<td><s:property value="BROKER_NAME" /> </td>
								<td><s:property value="CUSTOMER_NAME" /> </td>
								<td><s:property value="BASE_POLICY_NO" /> </td>
								<td><s:property value="OPEN_COVER_NO" /> </td>
								<td><s:property value="TYPE" /> </td>
								<td><s:property value="POLICY_EFFECTIVE_DATE" /> </td>
								<td><s:property value="DUE_AMOUNT" /> </td>
								<td><s:property value="Remarks" /> </td>
							</tr>
							</s:iterator>
							</tbody>
						</table>
					</div>
				</div>
				<br class="clear" />
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
						<input type="button" onclick="exportdata('excel')" class="btn btn-sm btn-info" value="Excel"/> &nbsp;&nbsp;&nbsp;
						<input type="button" name="sub" value="Back" onclick="fnback('')" class="btn btn-sm btn-danger" />
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<s:hidden name="startDate"/>
<s:hidden name="endDate"/>
</s:if>
<s:elseif test='"prodreport".equals(mode)' >
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="Marine Production Report" />
			</div>				
			<div class="panel-body">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" align="center">
						<s:text name="Start Date"/></b> &nbsp;:&nbsp;<s:property value="startDate"/>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" align="center">
						<s:text name="End Date"/></b> &nbsp;:&nbsp;<s:property value="endDate"/>
					</div>
				</div>
				<br class="clear" />
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<table class="display responsive no-wrap" id="record" width="100%" cellspacing="0">
							<thead>
							<tr>
								<th class="no-sort"></th>
								<th><s:text name="S.No" /></th>
								<th><s:text name="Quote No" /></th>
								<th><s:text name="Policy No" /></th>
								<th><s:text name="Product Name" /></th>
								<th><s:text name="Customer Name" /></th>
								<th><s:text name="Policy Start Date" /></th>
								<th><s:text name="Policy End Date" /></th>
								<th><s:text name="Premium" /></th>
							</tr>
							</thead>
							<tbody>
							<s:iterator value="productionList" status="stat" var="record">
							<tr>
								<td></td>
								<td><s:property value="%{#stat.index+1}" /> </td>
								<td><s:property value="QUOTE_NO" /> </td>
								<td><s:property value="policy_no" /> </td>
								<td><s:property value="PRODUCT_NAME" /> </td>
								<td><s:property value="CUSTOMER_NAME" /> </td>
								<td><s:property value="POLICY_CREATED_DATE" /> </td>
								<td><s:property value="POLICY_END_DATE" /> </td>
								<td><s:property value="TOTAL_PREMIUM" /> </td>
							</tr>
							</s:iterator>
							</tbody>
						</table>
					</div>
				</div>
				<br class="clear" />
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
						<input type="button" onclick="exportmdata('excel')" class="btn btn-sm btn-info" value="Excel"/> &nbsp;&nbsp;&nbsp;
						<input type="button" name="sub" value="Back" onclick="fnback('')" class="btn btn-sm btn-danger" />
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<s:hidden name="startDate"/>
<s:hidden name="endDate"/>
</s:elseif>
<s:else>
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="Marine Report" />
			</div>			
			<div class="panel-body">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<s:actionerror cssStyle="color: red;" />
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text"> <s:text name="policy.report.startdate"/> <font color="red">*</font> </div>
						<div class="tbox">
							<s:textfield cssClass="inputBox datepicker" name="startDate" id="startDate" />
						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text"> <s:text name="policy.report.enddate"/> <font color="red">*</font> </div>
						<div class="tbox">
							<s:textfield cssClass="inputBox datepicker" name="endDate" id="endDate" />
						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text"><s:text name="Report Type"/> <font color="red">*</font></div>
						<div class="tbox">
							<s:select name="reportType" id="reportType" list="#{'Payment':'Payment','Production':'Production'}" headerKey="" headerValue="---Select---" cssClass="inputBoxS tooltipContent" disabled="#endtDisable"></s:select>
						</div>
					</div>
				</div>
				<br class="clear" />
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
						<input type="button" name="sub" value="Submit" onclick="fnsubmit(this.form,'result','')" class="btn btn-sm btn-success" />
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</s:else>
<s:token/>
</s:form>
<script type="text/javascript">
function fnsubmit(frm,from,val) {
	if(from == 'result'){
		document.marine.action = "<%=request.getContextPath()%>/initIntegrationAreport.action?reqFrom="+from
		document.marine.submit();
	}else{
		document.marine.action = "<%=request.getContextPath()%>/initIntegrationAreport.action";
		document.marine.submit();
	}
}
function exportdata(val) {
	document.marine.action='<%=request.getContextPath()%>/motorpaymentJasperAreport.action';	
	document.marine.submit();
}
function exportmdata(val) {
	document.marine.action='<%=request.getContextPath()%>/motorproductionJasperAreport.action';	
	document.marine.submit();
}
function fnback(val){
   document.marine.action = "<%=request.getContextPath()%>/initIntegrationAreport.action?reportType=''";
   document.marine.submit();
}	
</script>
</body>
</html>