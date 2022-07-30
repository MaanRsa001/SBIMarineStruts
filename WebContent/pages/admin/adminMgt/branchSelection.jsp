<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
	<head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title> ::: AlRajhi - Branch Selection ::: </title>
		<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/AlRajhi_icon_header.jpg" />		
		<script type="text/javascript" src="js/common.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css" >
		<link href="<%=request.getContextPath()%>/bootstrap/css/footable-0.1.css" rel="stylesheet" type="text/css" >
		<link href="<%=request.getContextPath()%>/bootstrap/css/style.css" rel="stylesheet" type="text/css" >
		
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
		<style type="text/css">
		label {
			margin-left: 10px;
		}
		</style>	
		<script type="text/javascript">		
		function stopRKey(evt) { 
		  var evt = (evt) ? evt : ((event) ? event : null); 
		  var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null); 
		  if ((evt.keyCode == 13) && (node.type=="text"))  {return false;} 
		} 
		document.onkeypress = stopRKey;
   		</script>
	</head>
<body>
<s:form name="form1" theme="simple">
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="Branch Selection"/>
			</div>
			<div class="panel-body">
				<table class="table table-bordered tableWidth">
					<thead>
					<tr>
						<th width="25%"> <input type='checkbox'  onclick='SelectAll()' id='checkall' /> </th>
						<th width="75%"> Branch Name </th>
					</tr>
					</thead>
					<tbody>
					<s:iterator value="branchList" status="stat" var="record">
					<tr>
						<td align="center"> <input type="checkbox"  value="<s:property value="#record.BranchCode"/>" id="checkbox<s:property value="#record.BranchCode"/>" /> </td>
						<td> <s:property value="BranchName" /> </td>
					</tr>
					</s:iterator>
					</tbody>					
				</table>
			</div>
		</div>
	</div>
</div>
<br class="clar" />
<div>
	<div align="center">
		<input type="button" onclick="fnsubmit()"  class="btn btn-sm btn-success" value="Submit"/> &nbsp;&nbsp;&nbsp;
		<input name="back" type="button" class="btn btn-sm btn-danger" onclick="javascript:window.close()" value="Back" style ="cursor:hand"/>
	</div>
</div>
<s:token/>
</s:form>
<script type="text/javascript">
if(window.opener.adminlist.branchId.value.length>=1){
	var val=window.opener.adminlist.branchId.value;
	var elements=val.split(',');
	for(i=0; i<elements.length; i++){
		document.getElementById('checkbox'+elements[i]).checked=true;
	}
}

function SelectAll(){
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
	try
	{
		var elements=document.forms[0].elements;
		for(i=1; i<elements.length; i++)
		{
			obj=elements[i];
			if(obj.type=='checkbox' && obj.checked)
				checkedItems+=obj.value+',';
		}
	}catch(e){}
	if(checkedItems.length>1)
		checkedItems=checkedItems.substring(0, checkedItems.length-1);
	window.opener.adminlist.branchId.value=checkedItems;
	window.close();
}
$(function () {
	try{
	var strutsToken = "<s:property value="#session['struts.tokens.token']" />"
	try{$('.token input').val(strutsToken);}catch(e){}
	try{window.opener.document.forms[0].token.value = strutsToken;}catch(e){}
	try{window.opener.document.forms[1].token.value = strutsToken;}catch(e){}
	try{window.opener.document.forms[2].token.value = strutsToken;}catch(e){}
	try{window.opener.document.forms[3].token.value = strutsToken;}catch(e){}
	try{window.opener.document.forms[4].token.value = strutsToken;}catch(e){}
	}catch(e){}
	});
</script>
</body>
</html>