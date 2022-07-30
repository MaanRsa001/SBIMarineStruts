<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
	<head>
        <meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="keywords" content="Maan Sarovar, Sea Trans, Marine Insurance">	
		<meta name="author" content="">
		<title>::: AlRajhi - Menu Selection :::</title>
		<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/AlRajhi_icon_header.jpg" />
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/demo.css" />
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/font-awesome.min.css" />
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap-multiselect.css" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/datepicker3.css">	 
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/slimmenu.css">
		<link href="<%=request.getContextPath()%>/bootstrap/css/footable-0.1.css" rel="stylesheet" type="text/css">
		<link href="<%=request.getContextPath()%>/bootstrap/css/table-res.css" rel="stylesheet" type="text/css">
		<link href="<%=request.getContextPath()%>/bootstrap/css/easy-responsive-tabs.css" rel="stylesheet" type="text/css">
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css" />
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/style.css" />
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
		<script src="<%=request.getContextPath()%>/bootstrap/js/modernizr.custom.63321.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/bootstrap/js/jquery-1.9.1.min.js"></script>
		<style type="text/css">
		.panel-heading {
			padding: 5px;
		}
		</style>
	</head>
<body>
<s:form name="form1" theme="simple">
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="label.menu.selection"/>
			</div>
			<div class="panel-body">
			 	<table class="footable tableWidth table table-bordered">
					<thead>
					<tr>
						<th width="25%"> <input type='checkbox'  onclick='SelectAll()' id='checkall' /> </th>
						<th width="75%"> Menu Name </th>
					</tr>
					</thead>
					<tbody>
					<s:iterator value="productsWiseMenu" status="stat" var="record">
					<tr>
						<td align="center">
							<s:property value="#record.key"/>							 
						 </td>
						<td>
							<s:select name="menuId[]" id="products%{#stat.index}" list="%{#record.value}"  cssClass="selectmulti" listKey="MenuId" listValue="MenuName" headerKey="" label="" multiple="true" />
						</td>
					</tr>
					</s:iterator>
					</tbody>					
				</table>
			</div>
		</div>
	</div>
</div>
<br class="clear" />
<div>
	<div align="center">
		<input type="button" onclick="fnsubmit()"  class="btn btn-sm btn-success" value="Submit"/> &nbsp;&nbsp;&nbsp;
		<input name="back" type="button" class="btn btn-sm btn-danger" onclick="javascript:window.close()" value="Back" style ="cursor:hand"/>
	</div>
</div><s:property value="%{mid.length==0}"/> 
</s:form>
<script type="text/javascript" src="<%=request.getContextPath()%>/bootstrap/js/jquery.slimmenu.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/bootstrap/js/jquery.easing.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/bootstrap/js/easy-responsive-tabs.js"></script>	
<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap-datepicker.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap-multiselect.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap-3.2.0.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/bootstrap/js/app-js.js" type="text/javascript"></script>
<!--<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap-select.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.js" type="text/javascript"></script>-->
<script type="text/javascript">

/*
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
*/
function fnsubmit(){
	var checkedItems='';
	try
	{
		var elements=document.forms[0].elements;
		for(i=1; i<elements.length; i++)
		{
			obj=elements[i];
			if(obj.checked)
				checkedItems+=obj.value+',';
		}
	}catch(e){}
	if(checkedItems.length>1)
		checkedItems=checkedItems.substring(0, checkedItems.length-1);
	alert(checkedItems);
	window.opener.adminlist.mid.value=checkedItems;
	window.close();
}


	$(document).ready(function() { 
		 
		    $('.selectmulti').multiselect({ 
		      includeSelectAllOption: true,
		        enableFiltering:true ,
		        allSelectedText: 'All Selected',
		        selectAllValue: -1,
		        maxHeight: 200,
		        onChange: function(element, checked) {
		        	var menuId='<s:property value="mid"/>';
			        var brands =menuId.split(","); 
			        var selected = [];
			        $(brands).each(function(index, brand){
			            selected.push([$(this).val()]);
			        });
			        console.log(selected);
			    },
			    onSelectAll: function() {
		           
		        }
		  	});   
		   <s:if test='mid!=null && !"".equals(mid)'>
		   	 var data='<s:property value="mid"/>';
		   	 var dataArray=data.split(",");
		   	$(".selectmulti").val(dataArray);
		   	$(".selectmulti").multiselect("refresh");
		   </s:if>
		   
		   
		   
		    	 
	});

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