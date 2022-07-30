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
<body onload="getValues()">

<s:form id="toleranceform" name="toleranceform" method="post" action="getQuoteQuotation.action" theme="simple">
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<s:actionerror cssStyle="color: red;" />
	</div>
</div>
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="Tolerance Selection" />
			</div>
			<div class="panel-body">
				<div class="row">
					<div  STYLE="overflow: auto; width:50%; height:46vh; border-left: 0px gray solid;padding:1px; padding-left:5px; margin: 0 auto;">
						<table width="100%" class="table table-bordered">
							<tbody>
							<s:iterator value="optedSaleTermList" var="list" status="stat">
							<tr>
								<td width="50%">
									<input type="checkbox" name="saleTerm<s:property value='%{#list.SaleTermId}'/>" id="saleTerm<s:property value='%{#list.SaleTermId}'/>" value="<s:property value='%{#list.SaleTermId}'/>" title="<s:property value='%{#list.SaleTermName}'/>"/><s:property value="%{#list.SaleTermName}"/> 
								</td>
								<td width="50%">
								<s:select name="tolerance%{#list.SaleTermId}" id="tolerance%{#list.SaleTermId}" list="optedTolerance" listKey="ToleranceId" listValue="ToleranceName"  cssClass="inputBoxS tooltipContent tooltipContent" value="4"></s:select>
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
					<button type="button" name="close" class="btn btn-danger btn-oval" data-dismiss="modal">Close</button>
					<input type="button" value="submit" id="tolerancebtn" onclick="setValues();" class="btn btn-sm btn-primary">
				</div>
			</div>
			 	</div>
			</div>
			
		</div>
	</div>
</div>
<s:hidden name="proposalNo" id="proposalNo" />
<s:hidden name="identify" id="identify"/>
<s:hidden name="toleranceId" id="toleranceId"/>
<s:hidden name="tolerance" id="tolerance"/>
</s:form>
<script type="text/javascript">
function setValues()
{
	try
	{
		var elems=document.toleranceform.elements;
		var basisVal='';
		var basisValIds='';
		var tolObj='';
		var tolPercent;
		var checkedCount=0;
		for(var i=0; i<elems.length; i++)
		{
			var obj=elems[i];
			if(obj.type=='checkbox' && obj.checked)
			{
				tolObj=document.getElementById('tolerance'+obj.value);
				tolPercent=tolObj.options[tolObj.selectedIndex].text;
				tolPercent=tolPercent=='NONE'?'':('+'+tolPercent);
				basisVal+=obj.title+tolPercent+', ';
				basisValIds+=obj.value+'~'+tolObj.value+',';
				checkedCount++;
			}
		}
		if(checkedCount!=0)
		{
			basisVal=basisVal.substring(0, basisVal.length-2); 
			basisValIds=basisValIds.substring(0, basisValIds.length-1);
			//window.opener.document.Quotation.tolerance.value=basisVal;
			//window.opener.document.Quotation.toleranceId.value=basisValIds; 
			document.toleranceform.tolerance.value=basisVal;
			document.toleranceform.toleranceId.value=basisValIds; 
			postFormRequest('saveToleranceOpenCover.action','tolenanceSelectionAjaxId','toleranceform');
			$("#tolerancebtn").attr("data-dismiss","modal");
		}else
		{
			alert("please close the Tolerance selection window and open again");
			$("#tolerancebtn").attr("data-dismiss","modal");
		}
	}catch(e)
	{
		alert(e);
	}
	return false;
}
getValues();
function getValues()
{
	try
	{
		var basisValIds=document.Quotation.toleranceId.value;
		//alert(basisValIds);
		if(basisValIds.length>0)
		{
			var ids=basisValIds.split(',');
			for(var i=0; i<ids.length; i++)
			{
				var id=ids[i].split('~');
				var obj1=document.getElementById('saleTerm'+id[0]);
				var obj2=document.getElementById('tolerance'+id[0]);
				if(obj1)
					obj1.checked=true;
				if(obj2)	
					obj2.value=id[1];
			}
		}
	}catch(e)
	{
		alert(e);
	}
	return false;
}
function postFormRequest(strUrl, id, formId) {
    $.ajax({
		url : strUrl,
		type : "POST",
		data : $("#" + formId).serialize(),
		error : function() {
			$('#' + id).html('<p>An error has occurred in jquery Ajax</p>');
		},
		success : function(data) {
			$('#' + id).html(data);
		},
		beforeSend : function() {
			$('#loading').show();
			$('.ajaxLoader').show();
		},
		complete : function() {
			$('#loading').hide();
			$('.ajaxLoader').hide();
		}
	});
}
</script>	
</body>
</html>