<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ page language="java" import="com.maan.report.service.ReportService"%>
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
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery-1.11.1.min.js"></script>
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
						$(function() {
							$('#fromdate').datepicker({
								changeMonth: true,
						        changeYear: true,
						        yearRange: "-100:+0",
						        dateFormat: 'dd/mm/yy'
							}).on('changeDate', function(e){
							    $(this).datepicker('hide');
							});
							$('#todate').datepicker({
								changeMonth: true,
						        changeYear: true,
						        yearRange: "-100:+0",
						        dateFormat: 'dd/mm/yy'
							}).on('changeDate', function(e){
							    $(this).datepicker('hide');
							});
						});
						</script>
	<script type="text/javascript">
		$(document).ready(function() {
		    $('.display').dataTable( {
		        "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
		        responsive: true
		} );
		} );
		$(document).ajaxComplete(function() {
		$('.display').dataTable( {
		        "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
		        responsive: true
		} );
		});
  	</script>
</head>
<body>
<s:form name="form1" theme="simple">

<div class="row">
    <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
		<div class="panel panel-primary">
			<div class="panel-heading"> <s:text name="Search By Date" /> </div>
			<div class="panel-body">
			<div class="row">
					<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						<b id="val" style="color:red"></b>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
						<div class="text"><s:text name="from.date"/></div>
						<div class="tbox">
							<s:textfield name="fromdate" id="fromdate" cssClass="inputBox datepicker" readonly="true" />
						</div>
					</div>
					<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
						<div class="text"><s:text name="to.date"/></div>
						<div class="tbox">
							<s:textfield name="todate" id="todate" cssClass="inputBox datepicker" readonly="true" />
						</div>
					</div>
					<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" align="center">
					<div class="text">&nbsp;&nbsp;&nbsp;</div>
						<div class="tbox">
							<s:if test='%{"promo"==menuType}'> 
								<input type="button" onclick="getPortfolio('existingLists')" class="btn btn-sm btn-success" value="Search"/>
							</s:if>
							<s:else>
								<input type="button" onclick="getPortfolio1('existingLists')" class="btn btn-sm btn-success" value="Search"/>
							</s:else>
						</div>
					</div>
				</div>
				</div>		
		</div>
	</div>	
	<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
		<div class="panel panel-primary">
			<div class="panel-heading"> <s:text name="Search By Value" /> </div>
			<div class="panel-body">
				<div class="row">
					<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						<b id="srchby" style="color:red"></b>
					</div>
				</div>
				<div class="row">
				    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
						<div class="text"><s:text name="Search By"/></div>
						<div class="tbox">
							<s:select name="searchBy" id="searchBy" list="#{'mobileNo':'Mobile No','policyNo':'Policy No','quoteNo':'Quote No','companyReg':'Iqama Id','sequnceNo':'Sequence No'}"  headerKey="" headerValue="---Select---" cssClass="inputBoxS" />
						</div>
					</div>
					<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
						<div class="text"><s:text name="Search Value"/></div>
						<div class="tbox">
							<s:textfield name="searchValue" id="searchvalue" cssClass="inputBoxS" />
						</div>
					</div>
					<div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" align="center">
					<div class="text">&nbsp;&nbsp;&nbsp;</div>
						<div class="tbox">
						<s:if test='%{"promo"==menuType}'> 
								<input type="button" onclick="getSearchList('searchList')" class="btn btn-sm btn-success" value="Search" />
						</s:if>
						<s:else>
								<input type="button" onclick="getSearchList1('searchList')" class="btn btn-sm btn-success" value="Search" />
						</s:else>  
						</div>
					</div>
				</div>
				</div>	
			
		</div>
	</div>
	<s:if test="reqFrom1 == 'existingLists' || reqFrom1 == 'searchList'">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-body">
				<div class="row">
			         <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			         
			         <s:set value="existingLists" var="existingListsVar"/>
						<s:if test='#existingListsVar.size()>0'>
			         	<div>
			         	<table class="display responsive no-wrap" width="100%" cellspacing="0" cellspacing="0" style="font-size: 12px;">
		<thead>
		<tr>
			<th><s:text name="S.No" /></th>
			<th><s:text name="Quote No"/></th>
			<th><s:text name="Customer Name"/></th>
			<th><s:text name="Policy Date"/></th> 
			<th><s:text name="Premium" /></th>
			<th><s:text name="Policy No" /></th>
			<th><s:text name="Documents" /></th>	
			<th><s:text name="Schedule" /></th>
			<th><s:text name="BailBond" /></th>
			<th><s:text name="Debit Note" /></th>
			<th><s:text name="Receipt" /></th>
			<th><s:text name="Credit Note" /></th>
			<%--<th><s:text name="Vehicle" /></th>--%>
			<th><s:text name="Third party Terms & Conditions" /></th>
			
			
		</tr>
		</thead>
		<tbody>
		
		<s:iterator value="existingLists" status="stat" var="record">
		<tr>
			<td><s:property value="%{#stat.index+1}" /></td>
			
				<td> <s:property value="QUOTE_NO" /> </td>
				<td> <s:property value="CUSTOMER_NAME" /> </td>
				<td> <s:property value="QUOTATION_DATE" /> </td>				
				<td> <s:property value="PREMIUM" /> </td>
				<td> <s:property value="POLICY_NO" /> </td>
				<td align="center">
					<a href="#" type="button" class="btn btn-sm btn-warning" onClick="uploadDocuments('<s:property value="APPLICATION_NO" />','<s:property value="QUOTE_NO" />')"><i class="glyphicon glyphicon-pencil"></i></a>
				</td>
				<td></td>
				<td><a href="#" class="btn btn-sm btn-primary" onclick="return getBailBondPdf('<s:property value="QUOTE_NO" />','1')"><i class="glyphicon glyphicon-book"></i></a></td>
				<td><a href="#" type="button" class="btn btn-sm btn-warning" onClick="getDebit('<s:property value="POLICY_NO" />&loginid=<s:property value="loginId" />')"><i class="glyphicon glyphicon-book"></i></a></td>
				<td><a href="#" type="button" class="btn btn-sm btn-info" onClick="getReceiptPdf('<s:property value="QUOTE_NO" />')"><i class="glyphicon glyphicon-book"></i></a></td>
				<td><a href="#" type="button" class="btn btn-sm btn-info" onClick="getCredit('<s:property value="loginId" />','<s:property value="POLICY_NO" />')"><i class="glyphicon glyphicon-book"></i></a></td>
<%-- 		<td>
				</td>--%>		
				<td><a href="#" type="button" class="btn btn-sm btn-danger" onclick="getPolicyWordingPdf('<s:property value="QUOTE_NO" />')"><i class="glyphicon glyphicon-book"></i></a></td>
				
		</tr>
		</s:iterator>

		</tbody>
	</table>
			         	</div>
			         	</s:if>
			         </div>
		       </div>
				
			
		</div>
	</div>
</div>
</s:if>
</div>
<s:hidden name="quoteNo" />
<s:hidden name="quoteStatus" />

<s:hidden name="loginid" />
<s:hidden name="applicationNo" />
<s:hidden name="linkType" />
<s:hidden name="menuType" />
<s:hidden name="reqFrom1" />

<s:hidden name="mode" id="mode"/>
<s:hidden name="productID" id="productID"/>
<s:token/>
</s:form>
<script type="text/javascript">
function getPortfolio(id){
	var fromdate=document.form1.fromdate.value;
	var todate=document.form1.todate.value;
	document.form1.reqFrom1.value=id;
	var productID=document.getElementById("productID").value;
	var dateFirst = fromdate.split('/');
	var dateSecond = todate.split('/');
	var now = new Date(dateFirst[2], dateFirst[1]-1, dateFirst[0]);
	var end = new Date(dateSecond[2], dateSecond[1]-1, dateSecond[0]);
	var days = Math.floor((end-now) / (1000 * 60 * 60 * 24)); 
	//productID=(("3"==(productID) || "11"==(productID))?"3,11":productID);
	if(fromdate=="") { 
		document.getElementById('val').innerHTML="Please Select the From Date";
	} else if(todate=="") {
		document.getElementById('val').innerHTML="Please Select the To Date";
	} else if(now > end){
		document.getElementById('val').innerHTML="To Date must be Greater then From Date";
	}
	 else if(days>3){
		document.getElementById('val').innerHTML="From Date and To Date difference not more than 3 days ";
	}else {
		document.getElementById('val').innerHTML="";
		document.form1.action="getListAjaxB2CQuote.action";
		document.form1.submit();
		//postRequest('<%=request.getContextPath()%>/getListAjaxB2CQuote.action?reqFrom='+id+'&fromdate='+fromdate+'&todate='+todate+'&productID='+productID+'&menuType=BQE', id);
	}
}

function getPortfolio1(id){
	var fromdate=document.form1.fromdate.value;
	var todate=document.form1.todate.value;
	document.form1.reqFrom1.value=id;
	var productID=document.getElementById("productID").value;
	var dateFirst = fromdate.split('/');
	var dateSecond = todate.split('/');
	var now = new Date(dateFirst[2], dateFirst[1]-1, dateFirst[0]);
	var end = new Date(dateSecond[2], dateSecond[1]-1, dateSecond[0]);
	var days = Math.floor((end-now) / (1000 * 60 * 60 * 24)); 
	//productID=(("3"==(productID) || "11"==(productID))?"3,11":productID);
	if(fromdate=="") { 
		document.getElementById('val').innerHTML="Please Select the From Date";
	} else if(todate=="") {
		document.getElementById('val').innerHTML="Please Select the To Date";
	} else if(now > end){
		document.getElementById('val').innerHTML="To Date must be Greater then From Date";
	}
	 else if(days>3){
		document.getElementById('val').innerHTML="From Date and To Date difference not more than 3 days ";
	}else {
		document.getElementById('val').innerHTML="";
		document.form1.action="getExistAjaxB2CQuote.action";
		document.form1.submit();
		//postRequest('<%=request.getContextPath()%>/getListAjaxB2CQuote.action?reqFrom='+id+'&fromdate='+fromdate+'&todate='+todate+'&productID='+productID+'&menuType=BQE', id);
	}
}

function getSearchList(id) {
 	var searchBy=document.form1.searchBy.value;
  	var searchValue=document.form1.searchvalue.value;
  	document.form1.reqFrom1.value=id;
 	var rep=document.getElementById("searchBy").value;
 	if(searchBy==null || searchBy=="") {
  		document.getElementById('srchby').innerHTML="Please Select the Search By";
  	}
  	else if(searchValue==null || searchValue=="") {
  		document.getElementById('srchby').innerHTML="Please Enter the Search Value";
  	}
  	else {
  		document.form1.action="getListAjaxB2CQuote.action";
		document.form1.submit();
	 	//postRequest('<%=request.getContextPath()%>/getListAjaxB2CQuote.action?reqFrom='+id+'&rep='+rep+'&searchBy='+searchBy+'&searchValue='+searchValue, 'existingLists');
	 }
}


function getSearchList1(id) {
 	var searchBy=document.form1.searchBy.value;
  	var searchValue=document.form1.searchvalue.value;
  	document.form1.reqFrom1.value=id;
 	var rep=document.getElementById("searchBy").value;
 	if(searchBy==null || searchBy=="") {
  		document.getElementById('srchby').innerHTML="Please Select the Search By";
  	}
  	else if(searchValue==null || searchValue=="") {
  		document.getElementById('srchby').innerHTML="Please Enter the Search Value";
  	}
  	else {
  		document.form1.action="getExistAjaxB2CQuote.action";
		document.form1.submit();
	 	//postRequest('<%=request.getContextPath()%>/getListAjaxB2CQuote.action?reqFrom='+id+'&rep='+rep+'&searchBy='+searchBy+'&searchValue='+searchValue, 'existingLists');
	 }
}1

function editQuote(applicationNo,quoteNo, status,customerId, contentTypeId) { 
	document.form1.quoteNo.value=quoteNo;
	document.form1.quoteStatus.value=status;
	document.form1.applicationNo.value=applicationNo;
	document.form1.action = "<%=request.getContextPath()%>/editQuoteMotor.action";
	document.form1.submit();
}
function sentEMail(applicationNo,linkType,quoteNo)
{
	document.form1.menuType.value='<s:property value="%{menuType}" />';
	document.form1.applicationNo.value=applicationNo;
	document.form1.linkType.value=linkType;
	document.form1.quoteNo.value=quoteNo;		
	document.form1.action='<%=request.getContextPath()%>/mailReport.action';
	document.form1.submit();
}
function getMotorProposalPdf(val) {
	var URL ='<%=request.getContextPath()%>/proposalFormReport.action?quoteNo='+val;
	var bwidth = window.innerWidth;
	var bwidth1 = document.body.clientWidth;
	if(bwidth <= 768) {
		return popUp(URL,bwidth1,'500');
	} else {
		return popUp(URL,'750','500');
	}
}

	function uploadDocuments(applicationNo,quoteNo) {
		var URL ='<%=request.getContextPath()%>/displayUploadMotor.action?applicationNo='+applicationNo+'&isArabic=en&quoteNo='+quoteNo+'&deleteVehicleId=1';
		return callPopup(URL);
	}
	
	function getBailBondPdf(val,vehicleId) {
	var URL ='<%=request.getContextPath()%>/bailBondReport.action?quoteNo='+val+'&vehicleId='+vehicleId;
	var bwidth = window.innerWidth;
	var bwidth1 = document.body.clientWidth;
	if(bwidth <= 768) {
		return popUp(URL,bwidth1,'500');
	} else {
		return popUp(URL,'750','500');
	}
}


function getPolicyWordingPdf(val){
	var URL ='<%=request.getContextPath()%>/policyWordingReport.action?quoteNo='+val;
	var bwidth = window.innerWidth;
	var bwidth1 = document.body.clientWidth;
	if(bwidth <= 768) {
		return popUp(URL,bwidth1,'500');
	} else {
		return popUp(URL,'750','500');
	}
}
function motorVehicleDetails(policyNo) {
	document.forms['report'].menuType.value = 'PVD';
	document.forms['report'].policyNo.value = policyNo;
	document.forms['report'].action = "/eportalV1/initReport.action";
	document.forms['report'].submit();
}
function getDebit(val) {
	var URL ='<%=request.getContextPath()%>/Copyofinformation.jsp?policyMode=debit&policynumber='+val;
	var bwidth = window.innerWidth;
	var bwidth1 = document.body.clientWidth;
	if(bwidth <= 768) {
		return popUp(URL,bwidth1,'500');
	} else {
		return popUp(URL,'750','500');
	}
}
function getReceiptPdf(val) {
	var URL ='<%=request.getContextPath()%>/receiptReport.action?quoteNo='+val;
	var bwidth = window.innerWidth;
	var bwidth1 = document.body.clientWidth;
	if(bwidth <= 768) {
		return popUp(URL,bwidth1,'500');
	} else {
		return popUp(URL,'750','500');
	}
}
function getCredit(loginId,val) {
	var URL ='Copyofinformation.jsp?policyMode=credit&loginid='+loginId+'&policynumber='+val;
	var bwidth = window.innerWidth;
	var bwidth1 = document.body.clientWidth;
	if(bwidth <= 768) {
		return popUp(URL,bwidth1,'500');
	} else {
		return popUp(URL,'750','500');
	}
}
</script>
</body>
</html>