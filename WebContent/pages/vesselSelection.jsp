<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
       <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="keywords" content="Maan Sarovar, Sea Trans, Marine Insurance">	
	<meta name="author" content="">
	<title> ::: SBI - Vessel Selection ::: </title>
	<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/SBI_icon_header.jpg" />		
	<script type="text/javascript" src="js/common.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/footable-0.1.css" />
	<link href="<%=request.getContextPath()%>/bootstrap/css//style.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.responsive.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.jqueryui.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.tableTools.css">
	<link href="<%=request.getContextPath()%>/dataTables/css/jquery-start-ui.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.jqueryui.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.responsive.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.tableTools.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery.dataTables.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/numeric-comma.js"></script>
</head>
<body>
<form name="Vessel" action="vesselListQuotation.action">
<div class="table0">
	<div class="tablerow" id="customerSearchList">
		<div class="panel panel-primary" style="overflow-x: visible;">
			<div class="panel-heading">
				<s:text name="Vessel Search" />
			</div>
			<div class="panel-body">
				<div class="boxcontent">
					<div class="textfield50">
						<div class="text">
							<s:text name="Vessel Name" />
						</div>
						<div class="tbox">
							<input type="text" class="inputBox" name="vesselSearch" value="" onkeyup="return getVesselList('vesselList',this.value)"/>&nbsp;&nbsp;(Enter min. 2 chars to search)
						</div>
					</div>
					<div class="textfield50">
						<div class="text">
							<input type="radio" name="select" id="selectNone" checked="checked"/> None &nbsp;&nbsp;&nbsp;
							<input type="radio" name="select" id="selectOther" /> Others
						</div>
						<div class="tbox">
							<input type="text" name="vesselOthers" maxlength="100" class="inputBox">
						</div>
					</div>
					<br class="clear" />
					<br class="clear" />
					<br class="clear" />
					<table class="footable" id="record" width="100%" cellspacing="0" style="font-size: 12px;">
						<thead>
						<tr>
							<th width="5%"> </th>
							<th width="23.75%"> <s:text name="Vessel Name" /> </th>
							<th width="23.75%"> <s:text name="Vessel Type" /> </th>
							<th width="23.75%"> <s:text name="Vessel Class" /> </th>
							<th width="23.75%"> <s:text name="Mfr. Yea" /> </th>
						</tr>
						</thead>
					</table>
					<div id="vesselList">
					<table class="footable" width="100%">
						<tbody>						
						<tr>
							<td class="6">No records found</td>
						</tr>
						</tbody>
					</table>
					
				</div>
			</div>
		</div>
	</div>
	<div class="tablerow">
		<div id="vesselList" ></div>
		<input type="hidden" name="vesselId"/>
		<input type="hidden" name="vesselName"/>
	</div>
	<br/>
	<div class="tablerow" align="center">
		<a href="#" onClick="return fnSubmit()" class="btn btn-sm btn-success" type="button" > Submit </a>
	</div>
</div>
</form>
<script type="text/javascript">

String.prototype.trim = function(){
	return this.replace(/^\s+|\s+$/g, "");
}
if(window.opener.document.quotation.vesselId.value=='' && window.opener.document.quotation.vesselName.value!='') {
	if(document.Vessel.select[1]) {
		var othersObj=document.Vessel.select[1];
  	} else {
  		var othersObj=document.Vessel.select;
  	}
	othersObj.checked=true;
	document.Vessel.vesselOthers.value=window.opener.document.quotation.vesselName.value;
} else {
	getVesselList('vesselList', window.opener.document.quotation.vesselName.value);
}

function getVesselList(id, name) {
	if(name.length>=2) {
 		var url='<%=request.getContextPath()%>/vesselListQuotation.action?vesselName='+name;
		postRequest(url, id);
	}
	return false;
}

function selectVessel(id, name) {
  	document.Vessel.vesselId.value=id;
  	document.Vessel.vesselName.value=name;
 	return false;
}

function fnSubmit() {
	if(document.Vessel.select[0]){
		var noneObj=document.Vessel.select[0];
	} else {
		var noneObj=document.Vessel.select;
	}
	if(document.Vessel.select[1]){
		var othersObj=document.Vessel.select[1];
	} else {
		var othersObj=document.Vessel.select;
	}
	if(!noneObj.checked && !othersObj.checked){
		var array=document.Vessel.select;
	 	for ( var int = 0; int < array.length; int++) {
			if(array[int].checked) {
				document.Vessel.vesselId.value=array[int].value;
	 			document.Vessel.vesselName.value=array[int].title;
			}
		}
  	}
	if(noneObj.checked) {
		window.opener.document.quotation.vesselName.value='';
		window.opener.document.quotation.vesselId.value='';
		window.close();
	} else if(othersObj.checked) {
		if(document.Vessel.vesselOthers.value.trim()==''){ 	
			alert('Please Enter Vessel Name');
		} else {
			window.opener.document.quotation.vesselName.value=document.Vessel.vesselOthers.value;
			window.opener.document.quotation.vesselId.value='';
			window.close();
		}
	} else if(document.Vessel.vesselId.value =='') {
		alert('Please Select Vessel');
	} else {
		window.opener.document.quotation.vesselName.value=document.Vessel.vesselName.value;
		window.opener.document.quotation.vesselId.value=document.Vessel.vesselId.value;
		window.close();
	}
	return false;
}

function postRequest(strURL, id) {
	var xmlHttp;
    if (window.XMLHttpRequest) { // Mozilla, Safari, ...
		var xmlHttp = new XMLHttpRequest();
    } else if (window.ActiveXObject) { // IE
		var xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
   	}
    xmlHttp.open('POST', strURL, true);
    xmlHttp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
	xmlHttp.onreadystatechange = function() {
		if (xmlHttp.readyState == 4) {
			document.getElementById(id).innerHTML=xmlHttp.responseText;
		}
   	}
	xmlHttp.send(null);
}

</script>
</body>
</html>