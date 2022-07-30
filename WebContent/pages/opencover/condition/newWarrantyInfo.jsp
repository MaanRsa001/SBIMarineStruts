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
	
		<s:if test='!"".equals(type) && type!=null'>
			<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="Warranty Info" />:&nbsp;&nbsp;&nbsp;<s:property value="coverName"/><span style="float:right;"><s:text name="Proposal Number:" /><s:property value="proposalNo"/></span>
			</div>
			<div class="panel-body">
				<div class="body">
				    	<div class="row">
						    <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
								<div class="text">
						 			<s:text name="Cover Type " />
						 		</div>
						 		<div class="tbox">
								<s:select name="coverId" id="coverId" list="coverClausesList" headerKey="0" headerValue="---ALL---" listKey="CoverId" listValue="CoverName" cssClass="inputBoxS tooltipContent tooltipContent" data-content="Currency List" cssStyle="width:80%;float:left;" onchange="getCoverName(this.value);" />
								<s:iterator value="coverClausesList" var="list"  status="stat">
								<s:hidden name="%{#list.CoverId}" id="coverName_%{#list.CoverId}" value="%{#list.CoverName}"/>
								<s:hidden name="%{#list.ModeOfTransport}" id="modeId_%{#list.CoverId}" value="%{#list.ModeOfTransport}"/>
								<s:hidden name="%{#list.ModeOfTransportName}" id="modeName_%{#list.CoverId}" value="%{#list.ModeOfTransportName}"/>
								</s:iterator>
								</div>
								<br/>
							</div>
						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
						<input type="button" value="Back" onClick="window.close()" class="btn btn-sm btn-danger">&nbsp;&nbsp;
						<input type="button" value="Submit" onclick="fnSubmit()" class="btn btn-sm btn-success">
					</div>
			</div>
		</div>
		</s:if>
		<s:else>
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="Clauses Info" />:&nbsp;&nbsp;&nbsp;<s:property value="coverName"/><span style="float:right;"><s:text name="Proposal Number:" /><s:property value="proposalNo"/></span>
			</div>
			<s:if test="mode==null">
			<div class="panel-body">
				<div class="body">
				    	<div class="row">
						    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
									<s:if test='warrantyId!=null && warrantyId.size()>0'>
										<table id="ConditionTable" class="table table-bordered-pop" border="2">
											<thead>
												<tr style="color:blue;">
													<th width="5%"><s:text name="label.Sno"/></th>
													<th width="5%"><s:text name="label.warrantyId"/></th>
													<th width="70%"><s:text name="label.warrantyDescription"/></th>
													<th width="20%"><s:text name="label.commodity"/></th>
												</tr>
											</thead>
											<tbody>
												<s:iterator value="warrantyId" var="list"  status="stat">
													<tr>
														<th align="center" width="10%"><s:property value="%{#stat.count}"/>
														<s:checkbox name="warrantycheck[%{#stat.index}]"   disabled="#disable"  ></s:checkbox>
														</th>
														<th align="left" width="5%">
															<s:property value='warrantyId[#stat.index]' />
															<s:hidden name="warrantyId[%{#stat.index}]"  id="clausesId[%{#stat.index}]"></s:hidden>
														</th>
														<th align="left" width="70%">
															<s:textarea name="warrantyName[%{#stat.index}]"  id="warrantyName[%{#stat.index}]" cssClass="form-control" cssStyle="width:100%" disabled="#disable"  onkeyup="textLimit(this,2000)"> </s:textarea>
														</th>
														<th align="left" width="15%">
															<a href="#" onclick="showCommodities('commodityId_<s:property value="#stat.index"/>','commodityName_<s:property value="#stat.index"/>')"> Commodities </a>
															<s:hidden name="commodityId[%{#stat.index}]" id="commodityId_%{#stat.index}"></s:hidden>
															<s:hidden name="commodityName[%{#stat.index}]" id="commodityName_%{#stat.index}"></s:hidden>
														</th>											
													</tr>
												</s:iterator>
											</tbody>
										</table>							
									</s:if> 
							</div>
						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
						<input type="button" value="Back" onClick="window.close()" class="btn btn-sm btn-danger">&nbsp;&nbsp;
						<input type="button" value="Submit" onclick="proceedBtn()" class="btn btn-sm btn-success">
					</div>
			</div>
			</s:if>
			<s:else>
				<div class="panel-body">
				<div class="body">
				    	<div class="row">
						    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
									<s:if test='warrantyId!=null && warrantyId.size()>0'>
										<table id="ConditionTable" class="table table-bordered-pop" border="2">
											<thead>
												<tr style="color:blue;">
													<th width="5%"><s:text name="label.Sno"/></th>
													<th width="5%"><s:text name="label.warrantyId"/></th>
													<th width="70%"><s:text name="label.warrantyDescription"/></th>
												</tr>
											</thead>
											<tbody>
												<s:iterator value="warrantyId" var="list"  status="stat">
												<s:if test='"true".equals(warrantycheck[#stat.index])'>
													<tr>
														<th align="center" width="10%"><s:property value="%{#stat.count}"/>
														</th>
														<th align="left" width="5%">
															<s:property value='warrantyId[#stat.index]' />
														</th>
														<th align="left" width="70%">
															<s:property value='warrantyName[#stat.index]' />
														</th>
																									
													</tr>
													</s:if>
												</s:iterator>
											</tbody>
										</table>							
									</s:if> 
							</div>
						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
						<input type="button" value="Close" onClick="window.close()" class="btn btn-sm btn-danger">&nbsp;&nbsp;
					</div>
			</div>
			</s:else>
		</div>
		<s:hidden name="coverId" id="coverId"/>
	</s:else>
	</div>
</div>
<s:hidden name="coverName" id="coverName"/>
<s:hidden name="modeOfTransport" id="modeOfTransport"/>
<s:hidden name="modeOfTransportName" id="modeOfTransportName"/>
<s:hidden name="proposalNo" id="proposalNo"/>
</s:form>
<script type="text/javascript">

function fnSubmit(){
	document.Quotation.action = 'warrantyPopupCondition.action';
	document.Quotation.submit();
}
function showValue(Field, obj) {
	var selected = document.getElementById(""+Field).value;
	document.getElementById(obj).value=selected;
	
}
function showCommodities(id,name) {
 	var URL = '';
  	var windowName = "";
 	URL='commoditycoverPopupOpenCover.action?commodityIds='+id+'&commodityNames='+name+'&proposalNo='+document.Quotation.proposalNo.value;
	var width  = screen.availWidth;
	var height = screen.availHeight;
	var h=300;
	var w=500;
	var features =
		'width='		 + w +
		',height='		 + h +
		',left='		 + ((width - w - 0) * .4)  +
		',top='			 + ((height - h - 0) * .4) +
		',directories=no'+
		',location=no'	 +
		',menubar=no'	 +
		',scrollbars=yes'+
		',status=yes'	 +
		',toolbar=no'	 +
		',resizable=false';
	var strOpen = window.open (URL, windowName, features);
	strOpen.focus();
	return false;
}
function proceedBtn(){
	document.Quotation.action = 'addWarrantyCondition.action';
	document.Quotation.submit();
}
function getCoverName(Field)
{
	document.Quotation.coverName.value=document.getElementById("coverName_"+Field).value;
	document.Quotation.modeOfTransport.value=document.getElementById("modeId_"+Field).value;
	document.Quotation.modeOfTransportName.value=document.getElementById("modeName_"+Field).value;
}

</script>	
</body>
</html>