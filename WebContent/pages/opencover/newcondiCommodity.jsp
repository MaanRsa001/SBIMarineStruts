 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/demo.css" /> 
	<link href="<%=request.getContextPath()%>/bootstrap/css/footable-0.1.css" rel="stylesheet" type="text/css">
	<link href="<%=request.getContextPath()%>/bootstrap/css/table-res.css" rel="stylesheet" type="text/css">
	<link href="<%=request.getContextPath()%>/bootstrap/css/easy-responsive-tabs.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datepicker/datetimepicker/jquery.datetimepicker.min.css"/> 
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css" />
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/style.css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
	<script src="<%=request.getContextPath()%>/bootstrap/js/modernizr.custom.63321.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/bootstrap/js/jquery-1.9.1.min.js"></script>
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/select2.css" rel="stylesheet"/>
	
<!-- my css-->

<link rel="stylesheet" type="text/css" href="assets/css/main.css">
<link rel="stylesheet" type="text/css" href="assets/css/fair-j.css">
<!-- my end css -->

<!-- Site Icons -->

<!-- Bootstrap CSS -->
<!-- <link rel="stylesheet" href="assets/css/bootstrap.min.css"> -->
<!-- Site CSS -->
<link rel="stylesheet" href="host_fair.css"> 
<!-- Colors CSS -->
<link rel="stylesheet" href="assets/css/colors.css">
<!-- ALL VERSION CSS -->
<link rel="stylesheet" href="assets/css/versions.css">
<!-- Responsive CSS -->
<link rel="stylesheet" href="assets/css/responsive.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="assets/css/custom.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/bootstrap/js/jquery.slimmenu.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/bootstrap/js/jquery.easing.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/bootstrap/js/easy-responsive-tabs.js"></script>	
<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap-datepicker.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap-multiselect.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap-3.2.0.min.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/bootstrap/js/select2.js"></script>
<script src="<%=request.getContextPath()%>/datepicker/datetimepicker/jquery.datetimepicker.js"></script>
<script src="<%=request.getContextPath()%>/bootstrap/js/app-js.js" type="text/javascript"></script>
<script language="JavaScript">
function stopRKey(evt) { 
  var evt = (evt) ? evt : ((event) ? event : null); 
  var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null); 
  if ((evt.keyCode == 13) && (node.type=="text"))  {return false;} 
} 
document.onkeypress = stopRKey;
</script>
<style>
	#loading {
	  width: 100%;
	  height: 100%;
	  top: 0px;
	  left: 0px;
	  position: fixed;
	  display: block;
	  opacity: 0.7;
	  background-color: #fff;
	  z-index: 99;
	  text-align: center;
	}
	
	#loading-image {
	  position: absolute;
	  top: 30%;
	  left: 45%;
	  z-index: 100;
	  width: 100px;
	  height: 100px;
	}
</style>
</head>
<body>
<s:form id="Quotation" name="Quotation" method="post" action="" theme="simple">
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<s:actionerror cssStyle="color: red;" />
	</div>
</div>
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="Commodity Selection" />
			</div>
			<div class="panel-body">
				<div class="row">
					<div style="width: 95%; margin: 0 auto;">
						<table width="100%" class="table table-bordered">
							<tbody>
							<s:iterator value="editCommodityList" var="list" status="stat">
							<tr>
								<td>
									<input type="checkbox" name="commodity<s:property value='%{#list.CommodityCode}'/>" id="commodity<s:property value='%{#list.CommodityCode}'/>" value="<s:property value='%{#list.CommodityCode}'/>~<s:property value='%{#list.CommodityName}'/>"/><s:property value="%{#list.CommodityName}"/> 
								</td>
							</tr>
							</s:iterator>
							</tbody>
						</table>
						</div>
					<br/>
					<br/>
					
				<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
					<input type="button" value="Back" onClick="window.close()" class="btn btn-sm btn-danger">&nbsp;&nbsp;
					<input type="button" value="submit" onclick="setValues();" class="btn btn-sm btn-primary">
				</div>
			</div>
			 	</div>
			</div>
			
		</div>
	</div>
</div>
			
<s:hidden name="proposalNo" id="proposalNo"/>
<s:hidden name="commodityNames" id="commodityNames"/>
<s:hidden name="commodityIds" id="commodityIds"/>
<s:hidden name="modeOfTransport" id="modeOfTransport"/>
</s:form>
<script type="text/javascript">

function setValues()
{
	var coverTypeId=document.getElementById("commodityIds").value;
	var coverTypeName=document.getElementById("commodityNames").value;
	try
	{
		var elems=document.forms[0].elements;
		var ids='',names='';
		var checkedCount=0;
		for(var i=0; i<elems.length; i++)
		{
			var obj=elems[i];
			if(obj.type=='checkbox' && obj.checked)
			{
				var s=obj.value.split("~");
				ids+=s[0]+',';
				names+=s[1]+',';
			}
		}
		if(ids.length>0)
			ids=ids.substring(0, ids.length-1);
		if(names.length>0)
			names=names.substring(0, names.length-1);
		window.opener.document.getElementById(coverTypeId).value=ids;
		window.opener.document.getElementById(coverTypeName).value=names;
		window.close();
	}catch(e)
	{
		alert(e);
	}
	return false;
}
getValues('<s:property value="commodityIds"/>')
function getValues(obj)
{
	try
	{
		var coverTypeId=window.opener.document.getElementById(obj).value;
		if(coverTypeId.length>0)
		{
			var ids=coverTypeId.split(',');
			for(var i=0; i<ids.length; i++)
			{
				
				var obj1=document.getElementById("commodity"+ids[i]);
				if(obj1){
					obj1.checked=true;
				}
					
			}
		}
	}catch(e)
	{
		alert(e);
	}
	return false;
}

</script>	
</body>
</html>