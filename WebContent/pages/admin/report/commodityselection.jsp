<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
	<head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">		
		<script type="text/javascript" src="js/common.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css" />
		<link href="<%=request.getContextPath()%>/bootstrap/css/footable-0.1.css" rel="stylesheet" type="text/css" />
		<link href="<%=request.getContextPath()%>/bootstrap/css/style.css" rel="stylesheet" type="text/css" />
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
			<div class="panel-heading">
				<s:text name="label.commodity.selection" />
			</div>
			<div class="panel-body">
				<table class="footable">
					<thead>
					<tr>
						<th width="5%"> &nbsp; </th>
						<th width="95%"> <s:text name="Commodity Name" /> </th>
					</tr>
					</thead>
					<tbody>
					<s:iterator value="commodityList" status="stat" var="record">
					<tr>
						<td> <input type="checkbox"  value='<s:property value="#record.commodity_id"/>' id='checkbox<s:property value="#record.commodity_id"/>' /> </td>
						<td> <s:property value="commodity_name" /> </td>
					</tr>
					</s:iterator>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<br class="clear"/>
<div>
	<div align="center">
		<input type="button" onclick="fnsubmit()"  class="btn btn-sm btn-success" value="Submit"/>&nbsp;&nbsp;&nbsp;
		<input name="back" type="button" class="btn btn-sm btn-danger" onclick="javascript:window.close()" value="Back" />
	</div>
</div>
<s:token/>
</s:form>
<script type="text/javascript">
if(window.opener.smart.commodity.value.length>=1){
	var val=window.opener.smart.commodity.value;
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
	window.opener.smart.commodity.value=checkedItems;
	window.close();
}
</script>
</body>
</html>