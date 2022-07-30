<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

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
<script language="JavaScript">
function stopRKey(evt) { 
  var evt = (evt) ? evt : ((event) ? event : null); 
  var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null); 
  if ((evt.keyCode == 13) && (node.type=="text"))  {return false;} 
} 
document.onkeypress = stopRKey;
</script>
<style>
	#loading {
	  width: 100%;
	  height: 100%;
	  top: 0px;
	  left: 0px;
	  position: fixed;
	  display: block;
	  opacity: 0.7;
	  background-color: #fff;
	  z-index: 99;
	  text-align: center;
	}
	
	#loading-image {
	  position: absolute;
	  top: 30%;
	  left: 45%;
	  z-index: 100;
	  width: 100px;
	  height: 100px;
	}
</style>
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
</head>
<body>
<s:form id="reportForm" name="reportForm" method="post" theme="simple">
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<s:actionerror cssStyle="color: red;" />
	</div>
</div>
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="label.lapsedPolicy" />
			</div>
			<div class="panel-body" >
				<div class="row">
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
			 			<div class="text">
				 			<s:text name="label.broker" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
							<s:select name="brokerId" id="brokerId" list="portfolioBrokerList" headerKey="" headerValue="---Select---"  listKey="Code" listValue="CodeDescription"  onChange="quoteList(this.value);" cssClass="bg-hover inputBoxS tooltipContent select2" data-content="Broker" />
				 		</div>	
			 		</div>
			 	</div>
			 	<br/>
			 	<div>
			 		<table class="table table-bordered table-stripped" id="gridTable" width="100%">
					 	<thead>
					 		<tr style="color: white;">
					 			<th width="5%"><s:text name="label.sno"/></th>
								<th width="13.57%"><s:text name="label.corepolicyNo"/></th>
								<th width="10%"><s:text name="label.proposalNo"/></th>
								<th width="20%"><s:text name="label.customerName"/></th>
								<th width="10%"><s:text name="label.policySatrtDate"/></th>
								<th width="10%"><s:text name="label.policyEndDate"/></th>
					 		</tr>
					 	</thead>
						<tbody>
						   	<s:iterator value="quoteList" var="var" status="stat">
								<tr>
									<td><font style="float: left;"><s:property value="%{#stat.index+1}" /></font></td>
									<td><font style="float: left;"><s:property value="%{#var.MissippiOpenCoverNo}" /></font></td>
									<td><font style="float: left;"><s:property value="%{#var.ProposalNo}" /></font></td>
									<td><font style="float: left;"><s:property value="%{#var.CompanyName}" /></font></td>
									<td><font style="float: left;"><s:property value="%{#var.OpenCoverStartDate}" /></font></td>
									<td><font style="float: left;"><s:property value="%{#var.OpenCoverEndDate}" /></font></td>
								</tr>
							</s:iterator>
						</tbody>
					 </table>
			 	</div>
			</div>
		</div>
	</div>
</div>

<s:token/>
<s:hidden name="proposalNo"  />
</s:form>
<script type="text/javascript">
function quoteList(val){
	document.reportForm.action ='lapsedPolicyReportReg.action';
	document.reportForm.submit();
}
function viewPolicys(proposalNo){
	document.reportForm.proposalNo.value=proposalNo;
	document.reportForm.action ='editQuoteOpenCover.action';
	document.reportForm.submit();
}
</script>	
</body>
</html>