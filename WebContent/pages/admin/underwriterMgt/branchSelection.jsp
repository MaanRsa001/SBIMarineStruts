<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
	<head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">		
		<script type="text/javascript" src="js/common.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css" >
		<link href="<%=request.getContextPath()%>/bootstrap/css/footable-0.1.css" rel="stylesheet" type="text/css" >
		<link href="<%=request.getContextPath()%>/bootstrap/css/style.css" rel="stylesheet" type="text/css" >
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
		
   		$(document).ready(function() {
		    $('table.display').dataTable( {
			        "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
			        responsive: true
			} );
		} );
   		</script>
	</head>
<body>
<s:form name="form1" theme="simple">
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="label.broker.selection"/>
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
					<s:iterator value="attachedBranchList" status="stat" var="record">
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
</s:form>
<script type="text/javascript">
if(window.opener.underwriter.branchId.value.length>=1){
	var val=window.opener.underwriter.branchId.value;
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
	window.opener.underwriter.branchId.value=checkedItems;
	window.close();
}
</script>
</body>
</html>