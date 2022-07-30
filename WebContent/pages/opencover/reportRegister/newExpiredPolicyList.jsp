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
	<%-- <link href="<%=request.getContextPath()%>/dataTables/css/jquery-start-ui.css" rel="stylesheet" type="text/css" /> --%>
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
				<s:text name="label.expiredPolicy" />
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
					 		
					 		<tr>
								<th width="1%"><s:text name="label.sno"/></th>
								<th width="15%"><s:text name="label.corepolicyNo"/></th>
								<th width="10%"><s:text name="label.proposalNo"/></th>
								<th width="15%"><s:text name="label.customerName"/></th>
								<th width="10%"><s:text name="label.balanceSumInsured"/></th>
								<th width="10%"><s:text name="label.policySatrtDate"/></th>
								<th width="10%"><s:text name="label.policyEndDate"/></th>
								<th width="10%"><s:text name="label.endorse"/></th>
								<th width="5%"><s:text name="label.view"/></th>
								<th width="10%"><s:text name="label.schedule"/></th>
								<th width="10%"><s:text name="label.policywording"/></th>
								<th width="10%"><s:text name="label.document"/></th>
								<th width="10%"><s:text name="label.endtSchedule"/></th>
								<th width="5%"><s:text name="label.deactivate"/></th>
							</tr>
					 	</thead>
						<tbody>
						   	<s:iterator value="quoteList" var="var" status="stat">
								<tr>
									<td><font style="float: left;"><s:property value="%{#stat.index+1}" /></font></td>
									<td><font style="float: left;"><s:property value="%{#var.MissippiOpenCoverNo}" /></font></td>
									<td><font style="float: left;"><s:property value="%{#var.ProposalNo}" /></font></td>
									<td><font style="float: left;"><s:property value="%{#var.CompanyName}" /></font></td>
									<td><font style="float: left;"><s:property value="%{#var.TurnoverAmount}" /></font></td>
									<td><font style="float: left;"><s:property value="%{#var.OpenCoverStartDate}" /></font></td>
									<td><font style="float: left;"><s:property value="%{#var.OpenCoverEndDate}" /></font></td>
									
									<td><b>
									<s:if test='"Y".equalsIgnoreCase(#var.Status)'>
										<a href="#" title="Edit Policy" onclick="return viewPolicys('<s:property value="%{#var.ProposalNo}" />','<s:property value="%{#var.OpenCoverNo}" />');">Edit</a>
									</s:if>
									<s:elseif test='!"N".equalsIgnoreCase(#var.EndtStatus)'>
										<a href="#" title="Endorse Policy" onclick="Endorsement('<s:property value="%{#var.ProposalNo}" />','<s:property value="%{#var.OpenCoverNo}" />');">Endorse</a>
									</s:elseif>
									</b></td>
									<td><b><a href="#" title="Print Policy" onclick="printQuote('<s:property value="%{#var.ProposalNo}" />');">View</a></b></td>
									
									<td><b>
									<s:if test='!"Y".equalsIgnoreCase(#var.Status)'>
										<a href="#" title="View Schedule" onclick="return viewDoc('<s:property value="%{#var.ProposalNo}" />','<s:property value="%{#var.OpenCoverNo}" />','<s:property value="%{#session.user}" />','schedule','false','');">Schedule</a>
									</s:if>
									<s:else>N/A</s:else>
									</b></td>
									<td><b>
									<s:if test='!"Y".equalsIgnoreCase(#var.EndtStatus)'>
										<a href="#" title="Policy Wordings" onclick="return viewDoc('<s:property value="%{#var.ProposalNo}" />','<s:property value="%{#var.OpenCoverNo}" />','<s:property value="%{#session.user}" />','clauses','false','');">Policy Wordings</a>
									</s:if>
									<s:else>N/A</s:else>
									</b></td>
									<td><b>
									<s:if test="#var.DEBITNOTENO!=null && #var.DEBITNOTENO!=''">
										<a href="#" title="#var.DEBITNOTENO" onclick="return viewDoc('<s:property value="%{#var.ProposalNo}" />','<s:property value="%{#var.OpenCoverNo}" />','<s:property value="%{#session.user}" />','debit','false','<s:property value="%{#var.DEBITNOTENO}" />');">Debit</a>
									</s:if>
									<s:if test="#var.CREDITNOTENO!=null && #var.CREDITNOTENO!=''">
										<a href="#" title="CREDITNOTENO" onclick="return viewDoc('<s:property value="%{#var.ProposalNo}" />','<s:property value="%{#var.OpenCoverNo}" />','<s:property value="%{#session.user}" />','debit','false','<s:property value="%{#var.CREDITNOTENO}" />');">Credit</a>
									</s:if>
									<s:if test='!"Y".equalsIgnoreCase(#var.EndtStatus)'>
										<a href="#" title="Policy Wordings" onclick="return addDoc('<s:property value="%{#var.ORIGINALPOLICYNO}" />','<s:property value="%{#var.OpenCoverNo}" />');">Documents</a>
									</s:if>
									<s:else>N/A</s:else>
									</b></td>
									<td><b>
									<s:if test="#var.ORIGINAL_POLICY_NO!=null && #var.ORIGINAL_POLICY_NO!=''">
									<a href="#"  title="View Schedule" onclick="return viewDoc('<s:property value="%{#var.ProposalNo}" />','<s:property value="%{#var.OpenCoverNo}" />','<s:property value="%{#session.user}" />','EndtReport','false','<s:property value="%{#var.CREDITNOTENO}" />');">Endt Schedule</a>
									</s:if>
									<s:else>N/A</s:else>
									</b></td>
									<td><b>
									<s:if test='!"N".equalsIgnoreCase(#var.EndtStatus)'>
									<a href="#" onclick="deActive('<s:property value="%{#var.ProposalNo}" />','N');">DeActivate</a>
									</s:if>
									</b></td>
									
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
	document.reportForm.action ='expiredPolicyReportReg.action';
	document.reportForm.submit();
}
function viewPolicys(proposalNo){
	document.reportForm.proposalNo.value=proposalNo;
	document.reportForm.action ='editQuoteOpenCover.action';
	document.reportForm.submit();
}
function deActive(proposalNo)
{
    var flag=confirm("Are you sure want to delete ?","Yes","No");
    if(flag){
    	document.reportForm.proposalNo.value=proposalNo;
		document.reportForm.deactive.value='deactive';
		document.reportForm.display.value='expiry';
		document.reportForm.action="activeDeactiveReportReg.action";
		document.reportForm.submit();
	}else{
	   return false;
	}
}
</script>	
</body>
</html>