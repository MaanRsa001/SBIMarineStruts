<%@ page isELIgnored="false" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>
<!DOCTYPE HTML>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.responsive.css">
	<s:if test="locale.language == 'ar'">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.jqueryui_ar.css">
	</s:if>
	<s:else>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.jqueryui.css">
	</s:else>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.tableTools.css">
	<link href="<%=request.getContextPath()%>/dataTables/css/jquery-start-ui.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datepicker/jquery-ui.css">
	<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery-1.11.1.min.js"></script> --%>
	<s:if test="locale.language == 'ar'">
		<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery.dataTables.min_ar.js"></script>
	</s:if>
	<s:else>
		<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery.dataTables.min.js"></script>
	</s:else>
	
	
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.jqueryui.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.responsive.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.tableTools.js"></script>
	<script src="<%=request.getContextPath()%>/datepicker/jquery-ui.js"></script>
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
<s:form id="branch" name="branch" method="post" action="branchAreport.action" theme="simple">
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="Branch Report" />
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
							<s:select name="productID" id="productID" list="productList" headerKey="" headerValue="---Select---" listKey="ProductId"  listValue="ProductName" cssClass="inputBoxS"/>
						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text"> <s:text name="policy.report.Status"/> <font color="red">*</font> </div>
						<div class="tbox">
							<s:radio list="#{'P':'Policy Status','Y':'Quote Status','D':'Cancelled Policy Status'}" name="reportStatus" id="reportStatus" value="%{reportStatus==null?'P':reportStatus}" />
						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
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
<s:else>
<s:form id="branch1" name="branch1" method="post" action="branchAreport.action" theme="simple">
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:if test='"reportBR".equals(mode1)'> <s:text name="Broker Report" /></s:if>
				<s:elseif test='"reportUW".equals(mode1)'> <s:text name="Underwriter Report" /></s:elseif>
				<s:else> <s:text name="Branch Report" /></s:else>
			</div>			
			<div class="panel-body">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<s:actionerror cssStyle="color: red;" /> <s:actionmessage cssStyle="color: green;" />
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">																		
						<table class="display responsive no-wrap" id="record" width="100%" cellspacing="0">
							<thead>
							<tr>
								<th class="no-sort"></th>
								<th><s:text name="S.No" /></th>
								<th><s:text name="Entry Date" /></th>
								<th><s:text name="Branch Name" /></th>
								<th><s:text name="Login Id" /></th>
								<th><s:text name="Application Id" /></th>
								<th><s:text name="Quote No" /></th>
								<th><s:text name="Application No" /></th>
								<th><s:text name="Policy No" /></th>
								<th><s:text name="Inception Date" /></th>
								<th><s:text name="Effective Date" /></th>
								<th><s:text name="Product Id" /></th>
								<th><s:text name="Customer Name" /></th>
								<th><s:text name="Transport Desc" /></th>
								<th><s:text name="Cover Name" /></th>
								<th><s:text name="Goods Description" /></th>
								<th><s:text name="Saleterm For Valuation" /></th>
								<th><s:text name="Extracover Name" /></th>
								<th><s:text name="SumInsured Foreign" /></th>
								<th><s:text name="Currency Name" /></th>
								<th><s:text name="Exchange Rate" /></th>
								<th><s:text name="SumInsured (SAR)" /></th>
								<th><s:text name="Saleterm Charges(SAR)" /></th>
								<th><s:text name="Tolerance Charges(SAR)" /></th>
								<th><s:text name="Total SumInsured (SAR )" /></th>
								<th><s:text name="Marine Premium" /></th>
								<th><s:text name="War Premium" /></th>
								<th><s:text name="Excess Premium" /></th>
								<th><s:text name="Policy Fee" /></th>
								<th><s:text name="Inspection Fee" /></th>
								<th><s:text name="Total Premium(SAR)" /></th>
								<th><s:text name="Foreign Currency Status" /></th>
								<th><s:text name="Total Premium(Foreign)" /></th>
								<th><s:text name="Commission" /></th>
								<th><s:text name="Transit from City" /></th>
								<th><s:text name="Transit from Country" /></th>
								<th><s:text name="Finaldest City" /></th>
								<th><s:text name="Finaldest Country" /></th>
								<th><s:text name="Via" /></th>
								<th><s:text name="Debitnote No" /></th>
								<th><s:text name="Creditnote No" /></th>
								<th><s:text name="Referral" /></th>
								<th><s:text name="Referral Status" /></th>
								<th><s:text name="Status" /></th>
								<th><s:text name="Integration Status" /></th>
								<th><s:text name="Integration Error" /></th>
								<th><s:text name="Excess Description" /></th>
							</tr>
							</thead>
							<tbody>
							<s:iterator value="branchList" status="stat" var="record">
							<tr>
								<td></td>
								<td><s:property value="%{#stat.index+1}" /></td>
								<td><s:property value="EntryDate" /> </td>
								<td><s:property value="BranchName" /> </td>
								<td><s:property value="LoginId" /> </td>
								<td><s:property value="ApplicationId" /> </td>
								<td><s:property value="QuoteNo" /> </td>
								<td><s:property value="ApplicationNo" /> </td>
								<td><s:property value="PolicyNo" /> </td>
								<td><s:property value="InceptionDate" /> </td>
								<td><s:property value="EffectiveDate" /> </td>
								<td><s:property value="ProductId" /> </td>
								<td><s:property value="CustomerName" /> </td>
								<td><s:property value="TransportDesc" /> </td>
								<td><s:property value="CoverName" /> </td>
								<td><s:property value="GoodsDesc" /> </td>
								<td><s:property value="SaleTermName" /> </td>
								<td><s:property value="ExtraCoverName" /> </td>
								<td><s:property value="SuminsuredForeign" /> </td>
								<td><s:property value="CurrencyName" /> </td>
								<td><s:property value="ExchangeRate" /> </td>
								<td><s:property value="SuminsuredLocal" /> </td>
								<td><s:property value="TotalSaleTermCharges" /> </td>
								<td><s:property value="TotalToleraneCharges" /> </td>
								<td><s:property value="Suminsured" /> </td>
								<td><s:property value="MarinePremium" /> </td>
								<td><s:property value="WarPremium" /> </td>
								<td><s:property value="ExcessPremium" /> </td>
								<td><s:property value="PolicyFee" /> </td>
								<td><s:property value="InspectionFee" /> </td>
								<td><s:property value="TotalPremiumLocal" /> </td>
								<td><s:property value="ForeignCurrency" /> </td>
								<td><s:property value="TotalPremiumForeign" /> </td>
								<td><s:property value="CommissionAmount" /> </td>
								<td><s:property value="TransitFromCity" /> </td>
								<td><s:property value="TransitFromCountry" /> </td>
								<td><s:property value="FinalDestCity" /> </td>
								<td><s:property value="FinalDestCountry" /> </td>
								<td><s:property value="Via" /> </td>
								<td><s:property value="DebitNoteNo" /> </td>
								<td><s:property value="CreditNoteNo" /> </td>
								<td><s:property value="Referral" /> </td>
								<td><s:property value="ReferralStatus" /> </td>
								<td><s:property value="Status" /> </td>
								<td><s:property value="IntegrationStatus" /> </td>
								<td><s:property value="IntegrationError" /> </td>
								<td><s:property value="ExcessDescription" /> </td>
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
<s:token/>
</s:form>
</s:else>
<script type="text/javascript">
function exportdata(val) {
	var startdate=document.branch1.startDate.value;
	var endDate=document.branch1.endDate.value;
	var productID=document.branch1.productID.value;
	var reportStatus=document.branch1.reportStatus.value;
	var branch=document.branch1.branch.value;
	var loginId=document.branch1.loginId.value;
	var URL ='<%=request.getContextPath()%>/branchReportJasperAreport.action?downloadType='+val+'&startDate='+startdate+'&endDate='+endDate+'&productID='+productID+'&branch='+branch+'&loginId='+loginId+'&reportStatus='+reportStatus;
	var bwidth = window.innerWidth;
	var bwidth1 = document.body.clientWidth;
	if(bwidth <= 768) {
		return popUp(URL,bwidth1,'500');
	} else {
		return popUp(URL,'750','500');
	}
}
function exportdata1(val) {
	document.branch1.downloadType.value=val;	
	document.branch1.action='<%=request.getContextPath()%>/branchReportJasperAreport.action';	
	document.branch1.submit();
}
function fnsubmit(frm,from,val) {
	if(from == 'result'){
		document.branch.action = "<%=request.getContextPath()%>/branchResultAreport.action?reqFrom="+from;
		document.branch.submit();
	}else{
		<s:if test='"reportBR".equals(mode1)'>document.branch1.action = "<%=request.getContextPath()%>/policyAreport.action?index=1";</s:if>
		<s:elseif test='"reportUW".equals(mode1)'>document.branch1.action = "<%=request.getContextPath()%>/policyAreport.action";</s:elseif>
		<s:else>document.branch1.action = "<%=request.getContextPath()%>/branchAreport.action";</s:else>
		
		document.branch1.submit();
	}
}
</script>
</body>
</html>