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
<s:if test ="reqFrom==null || reqFrom == ''">
<s:form id="integration" name="integration" method="post" action="integrationAreport.action" theme="simple">
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="Integration Report" />
			</div>			
			<div class="panel-body">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<s:actionerror cssStyle="color: red;" /> <s:actionmessage cssStyle="color: green;" />
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
						<div class="text"> <s:text name="policy.report.product"/> <font color="red">*</font> </div>
						<div class="tbox">
							<s:select name="productID" id="productID" list="#{'ONEOFFCERTIFICATE':'OneOff Policy & Certificate','OPENDEPOSITPREMIUM':'Open Cover Deposite','LANDTRANSIT':'Land Transist All Risk','DECLARATIONUPLOAD':'declaration policy'}" cssClass="inputBoxS" />
						</div>
					</div>
					<!--<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text"> <s:text name="policy.report.Status"/> <font color="red">*</font> </div>
						<div class="tbox">
							<s:radio list="#{'P':'Policy Status','Y':'Quote Status','D':'Cancelled Policy Status'}" name="reportStatus" id="reportStatus" value="%{reportStatus==null?'P':reportStatus}" />
						</div>
					</div>
					--><div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text"> <s:text name="policy.report.Branch"/> </div>
						<div class="tbox">
							<s:select name="branch" id="branch" list="branchName" headerKey="" headerValue="---Select---" listKey="BRANCH_CODE"  listValue="BRANCH_NAME" cssClass="inputBoxS"/>
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
<s:token/>
</s:form>
</s:if>
<s:elseif test="reqFrom=='result'">
<s:form id="branch1" name="branch1" method="post" action="branchAreport.action" theme="simple">
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				 <s:text name="Integartion Report" />
				<s:else></s:else>
			</div>			
			<div class="panel-body">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<s:actionerror cssStyle="color: red;" /> <s:actionmessage cssStyle="color: green;" />
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" align="center">
						<b><s:text name="Start Date"/></b> &nbsp;:&nbsp;<s:property value="startDate"/>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" align="center">
						<b><s:text name="End Date"/></b> &nbsp;:&nbsp;<s:property value="endDate"/>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">																		
						<table class="display responsive no-wrap" id="record" width="100%" cellspacing="0">
							<thead>
							<tr>
								<th class="no-sort"></th>
								<th><s:text name="S.No" /></th>
								<th><s:text name="QuoteNo" /></th>
								<th><s:text name="Policy No" /></th>
								<th><s:text name="Login Id" /></th>
								<th><s:text name="Customer Name" /></th>
								<th><s:text name= "Premium" /></th>
								<th><s:text name="Integration Status" /></th>
								<th><s:text name="Integration Error" /></th>
								<th><s:text name="Policy Type" /></th>
								<th><s:text name= "Re Integration" /></th>
							
							
							</tr>
							</thead>
							<tbody>
							<s:iterator value="integratedList" status="stat" var="record">
							<tr>
								<td></td>
								<td><s:property value="%{#stat.index+1}" /></td>
								<td><s:property value="QUOTE_NO" /> </td>
								<td><s:property value="POLICY_NO" /> </td>
								<td><s:property value="LOGIN_ID" /> </td>
								<td><s:property value="CUST_NAME" /> </td>
								<td><s:property value="PREMIUM" /> </td>
								<td><s:property value="INTEGRATION_STATUS" /> </td>
								<td><s:property value="TYPE" /> </td>
								<td><s:property value="INTEGRATION_ERROR" /> </td>
								
								
								<td><s:if test='%{"F".equals(#record.INTEGRATION_STATUS)}'>
									<input type="button" onclick="reintegrate('<s:property value="POLICY_NO" /> ','<s:property value="TYPE" />')" class="btn btn-sm btn-info" value="Re Integrate"/> &nbsp;&nbsp;&nbsp;
									</s:if>
									<s:else></s:else> </td>
								
							</tr>
							</s:iterator>
							</tbody>
						</table>
						<br class="clear" />
						<div align="right">
							<input type="button" onclick="exportdata('excel')" class="btn btn-sm btn-info" value="Excel"/> &nbsp;&nbsp;&nbsp;
	  						<input type="button" onclick="exportdata('pdf')" class="btn btn-sm btn-info" value="Pdf"/>
						</div>
					</div>
				</div>
				<br class="clear" />
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
						<input type="button" name="sub" value="Back" onclick="fnsubmit(this.form,'Back','')" class="btn btn-sm btn-danger" />
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<s:hidden name="startDate"/>
<s:hidden name="mode1" id="lmode1"/>
<s:hidden name="endDate"/>
<s:hidden name="productID"/>
<s:hidden name="reportStatus"/>
<s:hidden name="branch"/>
<s:hidden name="downloadType"/>
<s:hidden name="loginId"/>
<s:hidden name="policynumber"/>
<s:token/>
</s:form>
</s:elseif>
<s:elseif test="reqFrom=='custUpdte'">
<s:form id="integration" name="integration" method="post" action="integrationAreport.action" theme="simple">
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="Integration Report" />
			</div>			
			<div class="panel-body">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<s:actionerror cssStyle="color: red;" /> <s:actionmessage cssStyle="color: green;" />
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
						<div class="text"> <s:text name="policy.report.product"/> <font color="red">*</font> </div>
						<div class="tbox">
							<s:select name="productID" id="productID" list="#{'ONEOFFCERTIFICATE':'OneOff Policy & Certificate','OPENDEPOSITPREMIUM':'Open Cover Deposite','LANDTRANSIT':'Land Transist All Risk'}" cssClass="inputBoxS" />
						</div>
					</div>
					<!--<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text"> <s:text name="policy.report.Status"/> <font color="red">*</font> </div>
						<div class="tbox">
							<s:radio list="#{'P':'Policy Status','Y':'Quote Status','D':'Cancelled Policy Status'}" name="reportStatus" id="reportStatus" value="%{reportStatus==null?'P':reportStatus}" />
						</div>
					</div>
					--><div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text"> <s:text name="policy.report.Branch"/> </div>
						<div class="tbox">
							<s:select name="branch" id="branch" list="branchName" headerKey="" headerValue="---Select---" listKey="BRANCH_CODE"  listValue="BRANCH_NAME" cssClass="inputBoxS"/>
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
<s:token/>
</s:form>
</s:elseif>
<script type="text/javascript">
function exportdata(val) {
	document.branch1.downloadType.value=val;	
	document.branch1.action='<%=request.getContextPath()%>/integrationJasperReportAreport.action';	
	document.branch1.submit();
}
function fnsubmit(frm,from,val) {
	if(from == 'result'){
		document.integration.action = "<%=request.getContextPath()%>/integrationNewResultAreport.action?reqFrom="+from;
		document.integration.submit();
		
	}else{
		document.branch1.action = "<%=request.getContextPath()%>/integrationNewAreport.action";
		document.branch1.submit();
	}
}

function reintegrate(policy_no,type){
	document.branch1.policynumber.value=policy_no;	
	document.branch1.action='<%=request.getContextPath()%>/reintegrateAreport.action';	
	document.branch1.submit();
}
</script>
</body>
</html>