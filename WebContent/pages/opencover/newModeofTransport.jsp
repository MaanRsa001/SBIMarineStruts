 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script language="JavaScript">javascript:window.history.forward(1);</script>
<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap-multiselect.js" type="text/javascript"></script>
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
				<s:text name="label.coverageInfo" /><span style="float:right;"><s:text name="label.proposalNo"/>:<s:property value="proposalNo"/></span>
			</div>
			<div class="panel-body">
				<table width="100%" class="table table-bordered" >
				<thead>
					<tr style="color:blue;">
						<th><s:text name="label.modeofTransport"/><font color="red">*</font></th>
						<th><s:text name="label.coverage"/><font color="red">*</font></th>
						<th><s:text name="label.perbotlimit"/><font color="red">*</font></th>
						<th><s:text name="label.perlocLimit"/><font color="red">*</font></th>
						<th><s:text name="label.currency"/><font color="red">*</font></th>
					</tr>
				</thead>
				<tbody>
				
					<s:iterator value="modeTransportId" var="list" status="stat">
					<tr>
		            	<td>
		            	<s:checkbox name="modeTransportcheck[%{#stat.index}]"></s:checkbox><s:property value="modeTransportName[#stat.index]"/>
		            	<s:hidden name="modeTransportId[%{#stat.index}]"></s:hidden>
		            	<s:hidden name="modeTransportName[%{#stat.index}]"></s:hidden>
		            	
						</td>
						<td>
						<table width="410">
						<tr>
						
						<s:iterator value="coverId" var="clist" status="stat1">
							<s:if test="modeTransportId[#stat.index].equals(modecoverId[#stat1.index])">
								<s:checkbox name="covercheck[%{#stat1.index}]"></s:checkbox>
								&nbsp;&nbsp;<img src="<%=request.getContextPath()%>/images/list_icon.png"  style="cursor:hand" height="16" onClick="return openCoverType('coverTypeId_<s:property value="#stat1.index"/>','coverTypeName_<s:property value="#stat1.index"/>','<s:property value="modeTransportId[#stat.index]"/>')" border='0' name="chkICC_A_SEAClause" alt="Add Conveyance">&nbsp;&nbsp;
								<s:property value="coverName[#stat1.index]"/>
								<s:hidden name="modecoverId[%{#stat1.index}]"></s:hidden>
								<s:hidden name="coverId[%{#stat1.index}]"></s:hidden>
								<s:hidden name="coverTypeId[%{#stat1.index}]" id="coverTypeId_%{#stat1.index}"></s:hidden>
								<s:hidden name="coverTypeName[%{#stat1.index}]" id="coverTypeName_%{#stat1.index}"></s:hidden>
		            			<s:hidden name="coverName[%{#stat1.index}]" ></s:hidden>
							</s:if> 
							
						</s:iterator>
						</tr>
						</table>
						</td>
						<td>
						<%-- <input name="perbottomLimit_<%=modeMaster[i][0]%>" size="14" maxlength="12" value="<%=request.getParameter("perbottomLimit_"+modeMaster[i][0])!=null?(request.getParameter("perbottomLimit_"+modeMaster[i][0])):modeValue%>" type="text" class="inputBox" onkeyup="this.value=Comma(this.value);" > --%>
						<s:textfield name="perbottomLimit[%{#stat.index}]" id="perbottomLimit[%{#stat.index}]" cssClass="inputBox tooltipContent" onkeyup="this.value=Comma(this.value);"/>
						</td>
						<td>
						<%-- <input name="locationLimit_<%=modeMaster[i][0]%>" size="14" maxlength="12" value="<%=request.getParameter("locationLimit_"+modeMaster[i][0])!=null?(request.getParameter("locationLimit_"+modeMaster[i][0])):locationValue%>" type="text" class="inputBox" onkeyup="this.value=Comma(this.value);" > --%>
						<s:textfield name="locationLimit[%{#stat.index}]" id="locationLimit[%{#stat.index}]" cssClass="inputBox tooltipContent" onkeyup="this.value=Comma(this.value);"/>
						</td>
						<td>
						<%-- <select name='currencyId_<%=modeMaster[i][0]%>' id='currencyId_<%=modeMaster[i][0]%>' class='inputSelect' ONCHANGE="return showValue(this.value,'currencyValue_<%=modeMaster[i][0]%>')"> --%>
						<s:select name="currencyId[%{#stat.index}]" id="currency" list="currencyList" headerKey="" headerValue="---Select---" listKey="Code" listValue="CodeDescription" cssClass="inputBoxS tooltipContent tooltipContent" data-content="Currency List" onchange="return showValue(this.value,'currencyValue_%{#stat.index}')"/></td>
						<s:hidden name="currencyName[%{#stat.index}]" ></s:hidden>
						<s:hidden name="currencyValue[%{#stat.index}]"  id="currencyValue_%{#stat.index}" ></s:hidden>
						
						</tr>
						
		  	 			<%-- <tr><td colspan="5"><s:checkbox name="wsrc"></s:checkbox> W&SRCC</td></tr>
		  	 			<tr><td colspan="5"><s:checkbox name="waronLand"></s:checkbox> WaronLand</td></tr> --%>
					</s:iterator>
				</tbody>
			</table>
			<s:iterator value="currencyList" var="currencyDetail">
				<s:hidden name="%{#currencyDetail.Code}" id="%{#currencyDetail.Code}" value="%{#currencyDetail.CodeValue}"/>
			</s:iterator>
			</div>
		</div>
	</div>
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<br/>
			<div class="row" align="center">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<input type="button" value="Back" onclick="backBtn();" class="btn btn-sm btn-danger">&nbsp;&nbsp;&nbsp;
					<input type="button" value="Proceed" onclick="proceedBtn();" class="btn btn-sm btn-success">
				</div>
			</div>
			<br/>
		</div>
	</div>
</div>
<s:hidden name="chkProposalNo" id="chkProposalNo" value="%{proposalNo}"/>
<s:hidden name="extraCoverLength" id="extraCoverLength"/>
<s:hidden name="commodityIds" id="commodityIds"/>
<s:hidden name="transit_countryId" id="transit_countryId"/>
<s:hidden name="totalTransitId" id="totalTransitId"/>
<s:hidden name="destination_countryId" id="destination_countryId"/>
<s:hidden name="totalDestinationId" id="totalDestinationId"/>
<s:hidden name="saleTermId" id="saleTermId"/>
<s:hidden name="brokerId" id="brokerId"/>
<s:hidden name="originalInsured" id="originalInsured"/>
<s:hidden name="proposalStatus" id="proposalStatus"/>			
<s:hidden name="proposalNo" id="proposalNo"/>
<s:token/>
</s:form>
<script type="text/javascript">

function backBtn(){
	document.Quotation.action = 'getSecondPageOpenCover.action';
	document.Quotation.submit();
}
function proceedBtn(){
	document.Quotation.action = 'insertModeofCoverOpenCover.action';
	document.Quotation.submit();
}
function showValue(Field, obj) {
	var selected = document.getElementById(""+Field).value;
	document.getElementById(obj).value=selected;
	
}
function openCoverType(id,name, mode) {
 	var URL = '';
  	var windowName = "";
 	URL='covertypePopupOpenCover.action?coverTypeIds='+id+'&coverTypeNames='+name+'&excoverTypeIds='+document.getElementById(id).value+'&modeOfTransport='+mode+'&proposalNo='+document.Quotation.proposalNo.value;
	//URL='CoverType.jsp?coverTypeName='+obj+'&&coverTypeIds='+document.getElementById(obj).value+'&modeOfTransport='+mode+'&&chkProposalNo='+document.Quotation.chkProposalNo.value;
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
<s:iterator value="modeTransportId" var="list" status="stat">
addComma(document.Quotation,'perbottomLimit[<s:property value="%{#stat.index}"/>],locationLimit[<s:property value="%{#stat.index}"/>]');
</s:iterator>
</script>	
</body>
</html>