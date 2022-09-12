<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
	<head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title> ::: SBI - Open Cover Selection ::: </title>
		<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/SBI_icon_header.jpg" />		
		<script type="text/javascript" src="js/common.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css" >
		<link href="<%=request.getContextPath()%>/bootstrap/css/footable-0.1.css" rel="stylesheet" type="text/css" >
		<link href="<%=request.getContextPath()%>/bootstrap/css/style.css" rel="stylesheet" type="text/css" >
		<script type="text/javascript" src="<%=request.getContextPath()%>/bootstrap/js/jquery-1.9.1.min.js"></script>
		<style type="text/css">
		.footable > thead > tr > th, .footable > thead > tr > td, .footable > tfoot > tr > th, .footable > tfoot > tr > td {
			font-size: 14px;
		}
		</style>
	</head>
<body>
<s:form name="form1" theme="simple">
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-body">
				<table class="table table-bordered">
					<thead>
					<tr>
						<th> <s:text name="S.No" /> </th>
						<th> <input type='checkbox'  onclick='SelectAll()' id='checkall' /> </th>
						<th> <s:text name="OPEN COVER NO" /> </th>
						<th> <s:text name="CUSTOMER NAME" /> </th>
						<th> <s:text name="MISSIPPI OPENCOVER NO" /> </th>
					</tr>
					</thead>
					<tbody>
					<s:iterator value="occList" status="stat" var="record">
					<tr>
						<td> <s:property value="%{#stat.index+1}" /> </td>
						<td align="center"> <input type="checkbox"  value='<s:property value="#record.OpenCoverNo"/>' id='checkbox<s:property value="#record.OpenCoverNo"/>'/> </td>
						<td> <s:property value="OpenCoverNo" /> </td>
						<td> <s:property value="CompanyName" /> </td>
						<td> <s:property value="MissippiOpenCoverNo" /> </td>
					</tr>
					</s:iterator>
					</tbody>					
				</table>
			</div>
		</div>
	</div>
</div>
<br class="clear" />
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
		<input type="button" name="back" value="Back" class="btn btn-sm btn-danger" onclick="fnclose()"/>&nbsp;&nbsp;&nbsp;
		<input type="button" name="back1" value="Submit" class="btn btn-sm btn-success" onclick="fnsubmit()"/>
	</div>
</div>
<br class="clear" />
<s:token/>
</s:form>
<script type="text/javascript">

$(function () {
	try{
	var strutsToken = "<s:property value="#session['struts.tokens.token']" />"
	try{$('.token input').val(strutsToken);}catch(e){}
	try{window.opener.document.forms[0].token.value = strutsToken;
	}catch(e){}
	try{window.opener.document.forms[1].token.value = strutsToken;}catch(e){}
	try{window.opener.document.forms[2].token.value = strutsToken;}catch(e){}
	try{window.opener.document.forms[3].token.value = strutsToken;}catch(e){}
	try{window.opener.document.forms[4].token.value = strutsToken;}catch(e){}
	}catch(e){}
	});
	
	
	
if(window.opener.document.form1.openCover.value.length>=1)
	{
		var val=window.opener.document.form1.openCover.value;	
	var elements=val.split(',');
	for(i=0; i<elements.length; i++){
		document.getElementById('checkbox'+elements[i]).checked=true;
	}
} 
function SelectAll()
{
	try{
		var elements=document.forms[0].elements;
		if(document.getElementById('checkall').checked){
			for(i=0;i<elements.length;i++){
		    	obj=elements[i];
		    	if(obj.type=='checkbox'){
		      		obj.checked=true;
		    	}
		 	}
		}else{
		 	for(i=0;i<elements.length;i++){
		   		obj=elements[i];
			   	if(obj.type=='checkbox'){
		      		obj.checked=false;
		    	}
		 	}
		}
	}catch(e){}
}

function fnsubmit(){
	var checkedItems='';
	try{
		var elements=document.forms[0].elements;
		for(i=1; i<elements.length; i++){
			obj=elements[i];
			if(obj.type=='checkbox' && obj.checked)
				checkedItems+=obj.value+',';
		}
	}catch(e){}
	
	if(checkedItems.length>1)
		checkedItems=checkedItems.substring(0, checkedItems.length-1);
	window.opener.document.form1.openCover.value=checkedItems;
	window.close();
}
function fnclose(){
	window.close();
}


	
</script>
</body>
</html>