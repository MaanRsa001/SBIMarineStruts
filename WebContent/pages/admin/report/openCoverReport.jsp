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
<s:if test ='%{reqFrom==null || "".equals(reqFrom)}'>
<s:form id="opencover" name="opencover" method="post" action="openCoverAreport.action" theme="simple">
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="OpenCover Report" />
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
						<div class="text"><s:text name="Select Broker"/> <font color="red">*</font></div>
						<div class="tbox">
							<s:select name="broker" list="brokerList" headerKey="ALL" headerValue="ALL" listKey="LoginId" listValue="CompanyName" cssClass="inputBoxS"/>
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
<s:elseif test='!"certificate".equals(reqFrom)' >
<s:form id="branch1" name="branch1" method="post" action="branchAreport.action" theme="simple">
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="OpenCover Report" />
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
								<th><s:text name="Broker Name" /></th>
								<th><s:text name="Customer Name" /></th>
								<th><s:text name="Open Cover No" /></th>
								<th><s:text name="No Of Policies" /></th>
								<th><s:text name="Total Premium" /></th>
								<th><s:text name="Total Commission" /></th>
							</tr>
							</thead>
							<tbody>
							<s:iterator value="coverList" status="stat" var="record">
							<tr>
								<td></td>
								<td><s:property value="%{#stat.index+1}" /> </td>
								<td><s:property value="BrokerName" /> </td>
								<td><s:property value="CustomerName" /> </td>
								<td><s:property value="OpenCoverNo" /> </td>
								<td align="center"> <a type="button" class="btn btn-sm btn-info" href="#" onclick="getCertificates('<s:property value="#record.OpenCoverNo"/>','<s:property value="#record.BrokerName"/>')"  > <s:property value="#record.PolicyCount"/></a> </td>
								<td style="text-align: right;"><s:property value='getText("number.format.2",{@java.lang.Double@valueOf(Premium)})' /> </td>
								<td style="text-align: right;"><s:property value='getText("number.format.2",{@java.lang.Double@valueOf(Commission)})' /> </td>
							</tr>
							</s:iterator>
							</tbody>
						</table>
					</div>
				</div>
				<br class="clear" />
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
						<input type="button" onclick="exportdata('excel')" class="btn btn-sm btn-success" value="Excel"/> &nbsp;&nbsp;&nbsp;
						<input type="button" onclick="exportdata('pdf')" class="btn btn-sm btn-primary" value="Pdf"/> &nbsp;&nbsp;&nbsp;
						<input type="button" name="sub" value="Back" onclick="fnsubmit(this.form,'Back','')" class="btn btn-sm btn-danger" />
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<s:hidden name="startDate"/>
<s:hidden name="endDate"/>
<s:hidden name="broker"/>
<s:hidden name="productID"/>
<s:hidden name="reportStatus"/>
<s:hidden name="branch"/>
<s:hidden name="openCoverNo"/>
<s:hidden name="downloadType" id="downloadType"/>
<s:token/>
</s:form>
</s:elseif>
<s:else>
<s:form id="certificate" name="certificate" method="post" action="" theme="simple">
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="OpenCover Report" />
			</div>			
			<div class="panel-body">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<table class="display responsive no-wrap" id="record" width="100%" cellspacing="0">
							<thead>
							<tr>
								<th class="no-sort"></th>
								<th><s:text name="S.No" /></th>
								<th><s:text name="Policy Issue Date" /></th>
								<th><s:text name="Policy No" /></th>
								<th><s:text name="Insured Name" /></th>
								<th><s:text name="Mode of Transport" /></th>
								<th><s:text name="Cover" /></th>
								<th><s:text name="Originating Country" /></th>
								<th><s:text name="Destination Country" /></th>
								<th><s:text name="Sum Insured(Foreign Currency)" /></th>
								<th><s:text name="Currency Type" /></th>
								<th><s:text name="Exchange Rate" /></th>
								<th><s:text name="Basis of Valuation" /></th>
								<th><s:text name="Equivalent UDD" /></th>
								<th><s:text name="Marine Premium" /></th>
								<th><s:text name="WSRCC Premium" /></th>
								<th><s:text name="Excess" /></th>
								<th><s:text name="Total Premium" /></th>
								<th><s:text name="Commission Percent" /></th>
								<th><s:text name="Commission" /></th>
								<%-- <th><s:text name="Policy Type" /></th> --%>
								<th><s:text name="User Name" /></th>
								<th><s:text name="Debitnote No" /></th>
								<th><s:text name="Creditnote No" /></th>
							</tr>
							</thead>
							<tbody>
							<s:iterator value="certificateList" status="stat" var="record">
							<tr>
								<td></td>
								<td><s:property value="%{#stat.index+1}" /> </td>
								<td><s:property value="InceptionDate" /> </td>
								<td><s:property value="PolicyNo" /> </td>
								<td><s:property value="CustomerName" /> </td>
								<td><s:property value="TransportDesc" /> </td>
								<td><s:property value="CoverName" /> </td>
								<td><s:property value="TransitFromCountry" /> </td>
								<td><s:property value="FinalDestCountry" /> </td>
								<td style="text-align: right;"><s:property value='getText("number.format.2",{@java.lang.Double@valueOf(SuminsuredForeign)})' /> </td>
								<td><s:property value="CurrencyName" /> </td>
								<td><s:property value="ExchangeRate" /> </td>
								<td><s:property value="SaleTermName" /> </td>
								<td style="text-align: right;"><s:property value='getText("number.format.2",{@java.lang.Double@valueOf(SuminsuredLocal)})' /> </td> 
								<td style="text-align: right;"><s:property value='getText("number.format.2",{@java.lang.Double@valueOf(MarinePremium)})' /> </td>
								<td style="text-align: right;"><s:property value='getText("number.format.2",{@java.lang.Double@valueOf(WarPremium)})' /> </td>
								<td style="text-align: right;"><s:property value='getText("number.format.2",{@java.lang.Double@valueOf(ExcessPremium)})' /> </td>
								<td style="text-align: right;"><s:property value='getText("number.format.2",{@java.lang.Double@valueOf(TotalPremiumLocal)})' /> </td>
								<td><s:property value="CommissionPercent" /> </td>
								<td style="text-align: right;"><s:property value='getText("number.format.2",{@java.lang.Double@valueOf(CommissionAmount)})' /> </td>
								<%-- <td><s:property value="POLICYTYPE" /> </td> missing --%>
								<td><s:property value="LoginId" /> </td>
								<td><s:property value="DebitNoteNo" /> </td>
								<td><s:property value="CreditNoteNo" /> </td>
							</tr>
							</s:iterator>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<br class="clear" />
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
		<input type="button" onclick="exportdetaildata('excel')" class="btn btn-sm btn-success" value="Excel"/> &nbsp;&nbsp;&nbsp;
 		<input type="button" onclick="exportdetaildata('pdf')" class="btn btn-sm btn-primary" value="Pdf"/> &nbsp;&nbsp;&nbsp;
 		<input type="button" name="sub" value="Back" onclick="fnsubmit(this.form,'Back','certificate')" class="btn btn-sm btn-danger" />
	</div>
</div>
<s:hidden name="startDate"/>
<s:hidden name="endDate"/>
<s:hidden name="broker" />
<s:hidden name="downloadType" id="downloadType"/>
<s:hidden name="openCoverBroker" />
<s:hidden name="openCoverNo" />
<s:hidden name="productID" />
<s:token/>
</s:form>
</s:else>
<script type="text/javascript">
function fnsubmit(frm,from,val) {
	if(from == 'result'){
		document.opencover.action = "<%=request.getContextPath()%>/openCoverAreport.action?reqFrom="+from;
		document.opencover.submit();
	}else if(val=='certificate'){
		document.certificate.action = "<%=request.getContextPath()%>/openCoverAreport.action?reqFrom=result";
		document.certificate.submit();
	}else{
		document.branch1.action = "<%=request.getContextPath()%>/openCoverAreport.action?reqFrom=";
		document.branch1.submit();
	}
}
function exportdata1(val) {
	document.branch1.downloadType.value=val;	
	document.branch1.action='<%=request.getContextPath()%>/openCoverJasperAreport.action';	
	document.branch1.submit();
}
function exportdetaildata(val) {
	document.certificate.downloadType.value=val;	
	document.certificate.action='<%=request.getContextPath()%>/openCoverdetailJasperAreport.action';	
	document.certificate.submit();
}
function exportdata(val) {
	var startdate=document.branch1.startDate.value;
	var endDate=document.branch1.endDate.value;
	var productID=document.branch1.productID.value;
	var reportStatus=document.branch1.reportStatus.value;
	var branch=document.branch1.branch.value;
	var broker=document.branch1.broker.value;
	var URL ='<%=request.getContextPath()%>/openCoverJasperAreport.action?downloadType='+val+'&startDate='+startdate+'&endDate='+endDate+'&productID='+productID+'&branch='+branch+'&broker='+broker+'&reportStatus='+reportStatus;
	var bwidth = window.innerWidth;
	var bwidth1 = document.body.clientWidth;
	if(bwidth <= 768) {
		return popUp(URL,bwidth1,'500');
	} else {
		return popUp(URL,'750','500');
	}
}
function getCertificates(openCoverNo,bname){
   document.branch1.openCoverNo.value=openCoverNo;
   //document.branch1.broker.value=bname;
   document.branch1.action = "<%=request.getContextPath()%>/openCoverCertificateAreport.action?reqFrom=certificate&openCoverBroker="+bname;
   document.branch1.submit();
}
</script>
</body>
</html>