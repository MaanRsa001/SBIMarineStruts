<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ page language="java" import="com.maan.report.service.ReportService"%>
<!DOCTYPE HTML>
<html>
<head>
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
	<script type="text/javascript">
		$(document).ready(function() {
		    $('.display').dataTable( {
		        "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
		        responsive: true
		});
		});
		
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
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading"> <s:text name="Search" /> </div>
			<div class="panel-body">
			    <div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<b id="srchby" style="color:red"></b><br/>
					</div>
				</div>
				<div class="row">
				    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
						<div class="text"><s:text name="Search By"/></div>
						<div class="tbox">
							<s:select name="searchBy" cssClass="inputBoxS" id="searchby" list="#{'policyNo':'Policy No','quoteNo':'Quote No','customerName':'Customer Name'}" headerKey="" headerValue="---Select---" />
						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
						<div class="text"><s:text name="Search Value"/></div>
						<div class="tbox">
							<s:textfield name="searchValue" id="searchvalue" cssClass="inputBoxS" />
						</div>
					</div>
				</div>
				<div class="row">
				     <div class="" align="center">
							<br/>
							<input type="button" onclick="getSearchList('searchList')" class="btn btn-sm btn-success" value="Search" />
					</div>
				</div>
				<br class="clear" />
		        <div class="row">
			         <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			         <div id="searchList"></div>	
			         </div>
		       </div>
			</div>
		</div>
	</div>	
</div>

<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading"> <s:text name="Portfolio" /> </div>
			<div class="panel-body">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<b id="val1" style="color:red"></b><br/>
						<b id="val" style="color:red"></b><br/>
						<b id="val2" style="color:red"></b>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text"><s:text name="from.date"/></div>
						<div class="tbox">
							<s:textfield name="fromdate" id="fromdate" cssClass="inputBox datepicker" readonly="true" />
						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text"><s:text name="to.date"/></div>
						<div class="tbox">
							<s:textfield name="todate" id="todate" cssClass="inputBox datepicker" readonly="true" />
						</div>
					</div>
					<%-- <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text"><s:text name="product.select"/></div>
						<div class="tbox">
							<s:select name="productID" id="productID" list="products" listKey="PRODUCT_ID" listValue="PRODUCT_NAME" headerKey="1" headerValue="ALL" cssClass="inputBoxS"/>
						</div>
					</div>--%>
					<s:hidden name="productID" id="productID" />
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text"><s:text name="Regions"/></div>
						<div class="tbox">
							<s:select cssClass="inputBoxS" name="region" id="region1" list="regionsList" headerKey="" headerValue="---Select---" listKey="RegionId" listValue="RegionName" onchange="getBranchList(this.value,'branchsel');"/>
						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text"><s:text name="admin.user.branch"/></div>
						<div class="tbox">
							<div id="branchsel"><s:select name="branchId" cssClass="inputBoxS" id="branchId" list="branchList" headerKey="" headerValue="---Select---" listKey="BranchCode" listValue="BranchName" /></div>
						</div>
					</div>
					
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text"><s:text name="Type "/></div>
						<div class="tbox">
							<s:select name="rep" id="rep" list="#{'c':'Pending Quotations','p':'Policy Generated','d':'Policy Cancelled'}" cssClass="inputBoxS" />
						</div>
					</div>
				</div>
				<br class="clear" />
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
						<input type="button" onclick="getPortfolio('portfolioLists')" class="btn btn-sm btn-success" value="Search"/>
					</div>
				</div>
					<br class="clear" />
		<%-- <s:if test='%{#session.product_id=="3" || #session.product_id=="11"}'>
				<b><s:text name="Land Transit All Risk"></s:text></b>
			<br class="clear" />
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text"><s:text name="from.date"/></div>
						<div class="tbox">
							<s:textfield name="fromdate1" id="fromDate" cssClass="inputBox datepicker" readonly="true" />
						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text"><s:text name="to.date"/></div>
						<div class="tbox">
							<s:textfield name="todate1" id="toDate" cssClass="inputBox datepicker" readonly="true" />
						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text"><s:text name="product.select"/></div>
						<div class="tbox">
							<s:select name="productID" id="productID" list="products" listKey="PRODUCT_ID" listValue="PRODUCT_NAME" headerKey="1" headerValue="ALL" cssClass="inputBoxS"/>
						</div>
					</div>
					<s:hidden name="productID" id="productID" />
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text"><s:text name="admin.user.branch"/></div>
						<div class="tbox">
							<s:select name="rsaBranch" cssClass="inputBoxS" id="rsaBranch" list="branchLists" headerKey="" headerValue="---Select---" listKey="BRANCH_CODE" listValue="BRANCH_NAME" />
						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text"><s:text name="Regions"/></div>
						<div class="tbox">
							<s:select cssClass="inputBoxS" name="region" id="region1" list="regionList" listKey="BRANCH_CODE" listValue="BRANCH_NAME" onchange="getBranches(this.value,'pendingBranch');"/>
						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text"><s:text name="Type "/></div>
						<div class="tbox">
							<s:select name="rep" id="status1" list="#{'y':'Policy Generated','d':'Policy Cancelled'}" cssClass="inputBoxS" />
						</div>
					</div>
				</div>
				<br class="clear" />
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
						<input type="button" onclick="getPortfolioLand('portfolioLists')" class="btn btn-sm btn-success" value="Search"/>
					</div>
				</div>
			</s:if> --%>
				<br class="clear" />
<%-- 				<s:if test='%{#session.product_id=="3" || #session.product_id=="3"}'> --%>
<!-- 					<div class="row"> -->
<!-- 						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4"> -->
<%-- 							<div class="text"><s:text name="portfolio.search.by"/></div> --%>
<!-- 							<div class="tbox"> -->
<%-- 								<s:select cssClass="inputBoxS" name="searchBy" id="searchBy" list="#{'policyNO':'Policy No','customerName':'Customer Name'}"  headerKey="" headerValue="---Select---"/> --%>
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4"> -->
<%-- 							<div class="text"><s:text name="portfolio.search.value"/></div> --%>
<!-- 							<div class="tbox"> -->
<%-- 								<s:textfield name="searchValue" cssClass="inputBox"  /> --%>
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4" align="center"> -->
<!-- 							<br/> -->
<!-- 							<input type="button" onclick="getportfolioResult('viewLists','portfolioLists')" class="btn btn-sm btn-success" value="Search" /> -->
<!-- 						</div> -->
<!-- 					</div> -->
<%-- 				</s:if> --%>
				<br class="clear" />
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<div id="viewLists"></div>	
						<div id="portfolioLists"></div>						 
						</div>
					</div>
				</div>				
			</div>				
		</div>
	</div>
</div>
<s:hidden name="policynumber" />
<s:hidden name="policyno" />
<s:hidden name="quoteNo" />
<s:hidden name="loginid" />
<s:hidden name="policyMode" />
<s:hidden name="polNo" />
<s:hidden name="reqFrom1" />
<s:hidden name="mode" id="mode"/>
<s:hidden name="productID"/>
<s:token/>
</s:form>
<script type="text/javascript">
function getPortfolio(id){
	var fromdate=document.form1.fromdate.value;
	var todate=document.form1.todate.value;
	var branchId=document.form1.branchId.value;
	var region=document.form1.region.value;
	var productID=document.getElementById("productID").value;
	var dateFirst = fromdate.split('/');
	var dateSecond = todate.split('/');
	var now = new Date(dateFirst[2], dateFirst[1]-1, dateFirst[0]);
	var end = new Date(dateSecond[2], dateSecond[1]-1, dateSecond[0]);
	//productID=(("3"==(productID) || "11"==(productID))?"3,11":productID);
	var rep=document.getElementById("rep").value;
	if(fromdate=="") { 
		document.getElementById('val1').innerHTML="Please Select the From Date";
	} else if(todate=="") {
		document.getElementById('val1').innerHTML="";
		document.getElementById('val').innerHTML="Please Select the To Date";
	} else if(now > end){
		document.getElementById('val1').innerHTML="";
		document.getElementById('val').innerHTML="";
		document.getElementById('val2').innerHTML="To Date must be Greater then From Date";
	}else {
		document.getElementById('val1').innerHTML="";
		document.getElementById('val').innerHTML="";
		document.getElementById('val2').innerHTML="";
		postRequest('<%=request.getContextPath()%>/getListAjaxPortfolio.action?reqFrom='+id+'&fromdate='+fromdate+'&todate='+todate+'&productID='+productID+'&rep='+rep+'&branchId='+branchId+'&region='+region, id);
	}
}
function getPortfolioLand(id){
	var fromdate=document.form1.fromDate.value;
	var todate=document.form1.toDate.value;
	var branchId=document.form1.rsaBranch.value;
	var region=document.form1.region.value;
	//var status=document.form1.status1.value;
	var productID='13'
	var dateFirst = fromdate.split('/');
	var dateSecond = todate.split('/');
	var now = new Date(dateFirst[2], dateFirst[1]-1, dateFirst[0]);
	var end = new Date(dateSecond[2], dateSecond[1]-1, dateSecond[0]);
	//productID=(("3"==(productID) || "11"==(productID))?"3,11":productID);
	var rep=document.getElementById("status1").value;
	if(fromdate=="") { 
		document.getElementById('val1').innerHTML="Please Select the From Date";
	} else if(todate=="") {
		document.getElementById('val1').innerHTML="";
		document.getElementById('val').innerHTML="Please Select the To Date";
	} else if(now > end){
		document.getElementById('val1').innerHTML="";
		document.getElementById('val').innerHTML="";
		document.getElementById('val2').innerHTML="To Date must be Greater then From Date";
	}else {
		document.getElementById('val1').innerHTML="";
		document.getElementById('val').innerHTML="";
		document.getElementById('val2').innerHTML="";
		postRequest('<%=request.getContextPath()%>/getListAjaxPortfolio.action?reqFrom='+id+'&fromdate='+fromdate+'&todate='+todate+'&productID='+productID+'&rep='+rep+'&branchId='+branchId+'&region='+region+'&status='+status, id);
	}
}

function getViewLists(date,id,status,productID){
	try{
		if(productID=='13') { 
			var branchId=document.form1.rsaBranch.value;
		}else
			var branchId=document.form1.branchId.value;
		//productID=productID=(("3"==(productID) || "11"==(productID))?"ALL":productID);
		postRequest('<%=request.getContextPath()%>/viewPortfolio.action?mode=edit&reqFrom=viewLists&viewdate='+date+'&productID='+productID+'&rep='+status+'&branchId='+branchId, id);
	}catch (e) {
 
	}
}

function getSubmit(){
	document.form1.action='updatePolicyPortfolio.action';
	document.form1.submit();
}

function getBack(val){
	if(val=='13'){
		getPortfolioLand('portfolioLists');
	}else{
		getPortfolio('portfolioLists');
	}
}

function pendingExcel(){
	var fromdate=document.form1.fromdate.value;
	var todate=document.form1.todate.value;
	var status='p';
	var productID=document.getElementById("productID").value;
	var freightstatus='';
	var edate='';
	var brokercode='';
	
	//var URL="<%=request.getContextPath()%>/admin/PendingQuoteShowxcelusingPoi.jspfromdate="+fromdate+'&todate='+todate+'&rep='+status+'&productID='+productID";
	document.form1.action='<%=request.getContextPath()%>/admin/PendingQuoteShowxcelusingPoi.jsp?eDate='+edate+'&data1='+fromdate+'&data2='+todate+'&rep='+status+'&productId='+productID+'&broker_codes='+brokercode+'&freightStatus='+freightstatus;
	document.form1.submit();
}
function getVehicleSchedule(frm,policyNo,reqFrom){
	//document.getElementById('policyNo').value=policyNo;
	//document.getElementById('reqFrom').value=reqFrom;
	document.form1.action = 'VehiclescheduleReport.action?reqFrom='+reqFrom+'&policyNo='+policyNo;
	document.form1.submit();
}

function getportfolioResult(reqFrom,id) {
 	var searchBy=document.form1.searchBy.value;
	alert(searchBy);
  	var searchValue=document.form1.searchValue.value;
 	var rep=document.getElementById("rep").value;
 	var rep = "sr";
 	alert(searchValue);
 	if(searchBy==null || searchBy=="") {
  		document.getElementById('val1').innerHTML="Please Select the Search By";
  	}
  	else if(searchValue==null || searchValue=="") {
  		document.getElementById('val1').innerHTML="Please Enter the Search Value";
  	}
  	else {
	 	//postRequest('<%=request.getContextPath()%>/getListAjaxPortfolio.action?reqFrom='+id+'&rep='+rep+'searchBy='+searchBy+'&searchValue='+searchValue, id);
	 	postRequest('<%=request.getContextPath()%>/viewPortfolio.action?reqFrom='+reqFrom+'&rep='+rep+'&searchBy='+searchBy+'&searchValue='+searchValue, id);
	 }
}

function getSearchList(id) {
 	var searchBy=document.form1.searchby.value;
  	var searchValue=document.form1.searchvalue.value;
 	var rep=document.getElementById("searchby").value;
 	if(searchBy==null || searchBy=="") {
  		document.getElementById('srchby').innerHTML="Please Select the Search By";
  	}
  	else if(searchValue==null || searchValue=="") {
  		document.getElementById('srchby').innerHTML="Please Enter the Search Value";
  	}
  	else {
	 	postRequest('<%=request.getContextPath()%>/getSearchListAjaxPortfolio.action?reqFrom='+id+'&rep='+rep+'&searchBy='+searchBy+'&searchValue='+searchValue, id);
	 }
}

function print(ed)
{
    var pid=document.getElementById("productID").value;
	var rep=document.getElementById("rep").value;
    var fs='';
	var Print="print";
	var URL = "<%=request.getContextPath()%>/admin/PendingQuotesPrint.jsp?eDate="+ed+"&rep="+rep+"&productId="+pid+"&freightStatus="+fs;

	var windowName = "PremiumSummarySheet_BI";
	var width  = screen.availWidth;
	var height = screen.availHeight;
	var bwidth = window.innerWidth;
	var bwidth1 = document.body.clientWidth;
	if(bwidth <= 768) {
		var w = bwidth;
		var h = 400;
	} else {
		var w = 700;
		var h = 400;
	}
	var features =
	'width='          + w +
	',height='		  + h +
	',left='		  + ((width - w - 10) * .5)  +
	',top='			  + ((height - h - 30) * .5) +
	',directories=no' +
	',location=no'	  +
	',menubar=no'	  +
	',scrollbars=yes' +
	',status=yes'	  +
	',toolbar=no'	  +
	',resizable=false';
	var strOpen = window.open (URL, windowName, features);
	return false;
}
function viewDoc(quoteNo,policyNo,type){
	var URL ='<%=request.getContextPath()%>/viewdocPortfolio.action?quoteno='+quoteNo+'&polNo='+policyNo+'&reqFrom=type';

	var windowName = "PolicyView";
	var width  = screen.availWidth;
	var height = screen.availHeight;
	var bwidth = window.innerWidth;
	var bwidth1 = document.body.clientWidth;
	if(bwidth <= 768) {
		var w = bwidth;
		var h = 400;
	} else {
		var w = 700;
		var h = 400;
	}
	var features =
		'width='          + w +
		',height='		  + h +
		',left='		  + ((width - w - 10) * .5)  +
		',top='			  + ((height - h - 30) * .5) +
		',directories=no' +
		',location=no'	  +
		',menubar=no'	  +
		',scrollbars=yes' +
		',status=yes'	  +
		',toolbar=no'	  +
		',resizable=false';
	var strOpen = window.open (URL, windowName, features);
	strOpen.focus();
	return false;
}
function viewPolicys(policynumber,loginid,policyModee,productId,openNo) {
	document.form1.policynumber.value=policynumber;
	document.form1.loginid.value=loginid;
	document.form1.policyMode.value=policyModee;
	
	if(policyModee=='treaty'){
		document.form1.polNo.value=policynumber;
		document.form1.reqFrom1.value='view';
		document.form1.action='treatyPortfolio.action';
		document.form1.submit();
	
	}else{	
		var verno='';
		var pdfstatus='';
		var displaytext='';
      	var URL ='<%=request.getContextPath()%>/Copy of information Admin.jsp?policyMode='+policyModee+'&policynumber='+policynumber+'&loginid='+loginid+'&productTypeIds='+productId+'&openCoverNoSettingCert='+openNo+'verNo='+verno+'pdfStatus='+pdfstatus+'disPlayText='+displaytext;

		var windowName = "PolicyView";
		var width  = screen.availWidth;
		var height = screen.availHeight;
		var bwidth = window.innerWidth;
		var bwidth1 = document.body.clientWidth;
		if(bwidth <= 768) {
			var w = bwidth;
			var h = 400;
		} else {
			var w = 700;
			var h = 400;
		}
		var features =
			'width='          + w +
			',height='		  + h +
			',left='		  + ((width - w - 10) * .5)  +
			',top='			  + ((height - h - 30) * .5) +
			',directories=no' +
			',location=no'	  +
			',menubar=no'	  +
			',scrollbars=yes' +
			',status=yes'	  +
			',toolbar=no'	  +
			',resizable=false';
		var strOpen = window.open (URL, windowName, features);
		strOpen.focus();
		return false;
	}
}
		
function fnSubmit() {
	document.form1.action="openPortfolio.action";
	document.form1.submit();
}

function viewDocument(quoteNo,mode){
	var vehicleId='1';
	var URL ="<%=request.getContextPath()%>/documentUploadAreport.action?policynumber="+quoteNo+"&mode="+mode+"&deleteVehicleId="+vehicleId;
	return callPopup(URL);
}
function callPopup(URL) {
 	var bwidth = window.innerWidth;
	var bwidth1 = document.body.clientWidth;
	if(bwidth <= 768) {
		return popUp(URL,bwidth1,'500');
	} else {
		return popUp(URL,'750','500');
	}
}
function getBranchList(val,id){
	postRequest('<%=request.getContextPath()%>/getListAjaxPortfolio.action?reqFrom='+id+'&regionCode='+val, id);
}
</script>
</body>
</html>