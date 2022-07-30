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
				<s:text name="label.countryInfo" /><span style="float:right;"><s:text name="label.proposalNo"/>:<s:property value="proposalNo"/></span>
			</div>
			<div class="panel-body">
				<div class="row">
					
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
					<div class="text">
				 			<s:text name="label.countyOrigin" /><font color="red">*</font>
				 		</div>
				 		<div class="input-group">
				 		     <s:textarea name="transit_country" id="transit_country" cssClass="inputBox tooltipContent" style="margin: 0px;height: 85px;width: 380px;"/>
				 		     <span class="input-group-addon" >
				 		     <button type="button" onclick="showCommodities('originationcountry','countrySelectionAjaxId');" style="cursor: pointer" data-toggle="modal" data-target="#countrySelectionModal">
			                	<span class="glyphicon glyphicon-list"></span>
			                </button>
				 		     	<%-- <a onclick="showCommodities('originationcountry','countrySelectionAjaxId');" style="cursor: pointer" data-toggle="modal" data-target="#countrySelectionModal" disabled="#disable"><span class="glyphicon glyphicon-list"></a> --%>
				 		     </span>
				 		</div>
				 		<%-- <div class="tbox">
						<s:textarea name="transit_country" id="transit_country" style="width: 90%;" cssClass="inputBox tooltipContent"/><input name="chooseCommodityC" value="..." class="inputButton" onclick="showCommodities('originationcountry')" type="button">
						</div> --%>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text">
				 			<s:text name="label.countyDest" /><font color="red">*</font>
				 		</div>
				 		<div class="input-group">
				 		     <s:textarea name="destination_country" id="destination_country" cssClass="inputBox tooltipContent" style="margin: 0px;height: 85px;width: 380px;"/>
				 		     <span class="input-group-addon" >
				 		     <button type="button" onclick="showCommodities('destinationcountry','countrySelectionAjaxId');" style="cursor: pointer" data-toggle="modal" data-target="#countrySelectionModal">
			                	<span class="glyphicon glyphicon-list"></span>
			                </button>
				 		     	<%-- <a onclick="showCommodities('destinationcountry','countrySelectionAjaxId');" style="cursor: pointer" data-toggle="modal" data-target="#countrySelectionModal" disabled="#disable"><span class="glyphicon glyphicon-list"></a> --%>
				 		     </span>
				 		</div>
				 		<%-- <div class="tbox">
							<s:textarea name="destination_country" id="destination_country" style="width: 90%;" cssClass="inputBox tooltipContent"/><input name="chooseCommodityC2" value="..." class="inputButton" onclick="showCommodities('destinationcountry')" type="button">
						</div> --%>
					</div>
					
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text">
				 			<s:text name="label.customer" /><font color="red">*</font>
				 		</div>
				 		<div class="input-group">
				 		     <s:textarea name="customer" id="customer" cssClass="inputBox tooltipContent" style="margin: 0px;height: 85px;width: 380px;"/>
				 		     <s:hidden name="chcustomerIds"/>
				 		     <span class="input-group-addon" >
				 		     	<button type="button" onclick="showCommodities('customer','customerSelectionAjaxId');" style="cursor: pointer">
			                	<span class="glyphicon glyphicon-list"></span>
			                	</button>
				 		     	<%-- <a onclick="showCommodities('customer','customerSelectionAjaxId');" style="cursor: pointer" disabled="#disable"><span class="glyphicon glyphicon-list"></a> --%>
				 		     </span>
				 		</div>
				 		<%-- <div class="tbox">
							<s:textarea name="customer" id="customer" style="width: 90%;" cssClass="inputBox tooltipContent"/><input name="chooseCustomer" value="..." class="inputButton" onclick="showCommodities('customer')" type="button">
							<s:hidden name="customerId"/>
						</div> --%>
					</div>
			 	</div>
			</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="label.goodsInfo" />
			</div>
			<div class="panel-body">
				<div class="row">
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
			 			<div class="text">
				 			<s:text name="label.goodsToInsure" /><font color="red">*</font>
				 		</div>
				 		<div class="input-group">
				 		     <s:textarea name="commodity_TA" id="commodity_TA" cssClass="inputBox tooltipContent" style="margin: 0px;height: 85px;width: 380px;"/>
				 		     <s:hidden name="customerId"/>
				 		     <span class="input-group-addon" >
				 		     	<button type="button" onclick="showCommodities('commodity','commoditySelectionAjaxId');" style="cursor: pointer" data-toggle="modal" data-target="#commoditySelectionModal">
			                	<span class="glyphicon glyphicon-list"></span>
			                	</button>
				 		     	<%-- <a onclick="showCommodities('commodity','commoditySelectionAjaxId');" style="cursor: pointer" data-toggle="modal" data-target="#commoditySelectionModal" disabled="#disable"><span class="glyphicon glyphicon-list"></a> --%>
				 		     </span>
				 		</div>
				 		<%-- <div class="tbox">
				 			<s:textarea name="commodity_TA" id="commodity_TA" style="width: 90%;" cssClass="inputBox tooltipContent"/><input name="chooseCommodityC" value="..." class="inputButton" onclick="showCommodities('commodity')" type="button">
				 		</div> --%>
			 		</div>
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
			 			<div class="text">
				 			<s:text name="label.totalgoods" />
				 		</div>
				 		<div class="tbox">
				 			<s:textfield name="totalCommudity" id="totalCommudity" cssClass="inputBox tooltipContent" readonly="true"/>
				 		</div>
			 		</div>
			 	</div>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="label.valueBasisInfo" />
			</div>
			<div class="panel-body">
				<div class="row">
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
			 			<div class="text">
				 			<s:text name="label.valuebasis" /><font color="red">*</font>
				 		</div>
				 		<div class="input-group">
				 		     <s:textarea name="saleTermName" id="saleTermName" cssClass="inputBox tooltipContent" style="margin: 0px;height: 85px;width: 380px;"/>
				 		     <span class="input-group-addon" >
				 		     	<button type="button" onclick="showCommodities('saleterm','saletermSelectionAjaxId');" style="cursor: pointer" data-toggle="modal" data-target="#saletermSelectionModal">
			                	<span class="glyphicon glyphicon-list"></span>
			                	</button>
				 		     	<%-- <a onclick="showCommodities('saleterm','saletermSelectionAjaxId');" style="cursor: pointer" data-toggle="modal" data-target="#saletermSelectionModal" disabled="#disable"><span class="glyphicon glyphicon-list"></a> --%>
				 		     </span>
				 		</div>
				 		<%-- <div class="tbox">
				 			<s:textarea name="saleTermName" id="saleTermName" style="width: 90%;" cssClass="inputBox tooltipContent"/><input name="chooseSaleTerm" value="..." class="inputButton" onclick="showCommodities('saleterm')" type="button">
				 		</div> --%>
			 		</div>
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
			 			<div class="text">
				 			<s:text name="label.tolerance" /><font color="red">*</font>
				 		</div>
				 		<div class="input-group">
				 		     <s:textarea name="tolerance" id="tolerance" cssClass="inputBox tooltipContent" style="margin: 0px;height: 85px;width: 380px;"/>
				 		    <s:hidden name="toleranceId"/>
				 		     <span class="input-group-addon" >
				 		     	<button type="button" onclick="showCommodities('tolerance','tolenanceSelectionAjaxId');" style="cursor: pointer" data-toggle="modal" data-target="#tolenanceSelectionModal">
			                	<span class="glyphicon glyphicon-list"></span>
			                	</button>
				 		     	<%-- <a onclick="showCommodities('tolerance','tolenanceSelectionAjaxId');" style="cursor: pointer" data-toggle="modal" data-target="#tolenanceSelectionModal" disabled="#disable"><span class="glyphicon glyphicon-list"></a> --%>
				 		     </span>
				 		</div>
				 		<%-- <div class="tbox">
				 			<s:textarea name="tolerance" id="tolerance" style="width: 90%;" cssClass="inputBox tooltipContent"/><input name="chooseTolerance" value="..." class="inputButton" onclick="showCommodities('tolerance')" type="button">
				 			<s:hidden name="toleranceId"/>
				 		</div> --%>
			 		</div>
			 	</div>
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
<div id="countrySelectionModal" class="modal fade" role="dialog">
	  <div class="modal-dialog modal-lg">
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
        	<div class="modal-title">
				<div class="row">
       				<div class="col-md-12 col-xs-12">
			         	<h3><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;&nbsp;<s:text name="Country Selection" /></h3>
			         </div>
    			</div>
			</div>
	      </div>
	      <div class="modal-body" >
	        <div class="container-fluid" id="countrySelectionAjaxId">
	        </div>
	      </div>
	    </div>
	  </div>
  </div>
  <div id="customerSelectionModal" class="modal fade" role="dialog">
	  <div class="modal-dialog modal-lg">
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
        	<div class="modal-title">
				<div class="row">
       				<div class="col-md-12 col-xs-12">
			         	<h3><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;&nbsp;<s:text name="Customer Selection" /></h3>
			         </div>
    			</div>
			</div>
	      </div>
	      <div class="modal-body" >
	        <div class="container-fluid" id="customerSelectionAjaxId">
	        </div>
	      </div>
	    </div>
	  </div>
  </div>
  <div id="commoditySelectionModal" class="modal fade" role="dialog">
	  <div class="modal-dialog modal-lg">
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
        	<div class="modal-title">
				<div class="row">
       				<div class="col-md-12 col-xs-12">
			         	<h3><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;&nbsp;<s:text name="Commodity Selection" /></h3>
			         </div>
    			</div>
			</div>
	      </div>
	      <div class="modal-body" >
	        <div class="container-fluid" id="commoditySelectionAjaxId">
	        </div>
	      </div>
	    </div>
	  </div>
  </div>
<div id="saletermSelectionModal" class="modal fade" role="dialog">
	  <div class="modal-dialog modal-lg">
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
        	<div class="modal-title">
				<div class="row">
       				<div class="col-md-12 col-xs-12">
			         	<h3><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;&nbsp;<s:text name="Value Basis Selection" /></h3>
			         </div>
    			</div>
			</div>
	      </div>
	      <div class="modal-body" >
	        <div class="container-fluid" id="saletermSelectionAjaxId">
	        </div>
	      </div>
	    </div>
	  </div>
  </div>
<div id="tolenanceSelectionModal" class="modal fade" role="dialog">
	  <div class="modal-dialog modal-lg">
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
        	<div class="modal-title">
				<div class="row">
       				<div class="col-md-12 col-xs-12">
			         	<h3><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;&nbsp;<s:text name="Tolerance Selection" /></h3>
			         </div>
    			</div>
			</div>
	      </div>
	      <div class="modal-body" >
	        <div class="container-fluid" id="tolenanceSelectionAjaxId">
	        </div>
	      </div>
	    </div>
	  </div>
  </div>
<s:hidden name="chkProposalNo" id="chkProposalNo" value="%{proposalNo}"/>
<s:hidden name="proposalNo" id="proposalNo"/>
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
<s:token/>
</s:form>
<script type="text/javascript">

function showCommodities(values,id) {
 	var URL = '';
  	var windowName = "";  
	if(values == 'commodity') {
		URL='commoditypopUpOpenCover.action?proposalNo='+document.Quotation.proposalNo.value;
	} else if(values == 'originationcountry') {
		URL='countrypopUpOpenCover.action?identify='+values+'&proposalNo='+document.Quotation.proposalNo.value;
	} else if(values == 'destinationcountry') {
		URL='countrypopUpOpenCover.action?identify='+values+'&proposalNo='+document.Quotation.proposalNo.value;
	} else if(values == 'saleterm') {
		URL='saletermpopUpOpenCover.action?identify='+values+'&proposalNo='+document.Quotation.proposalNo.value;
	} else if(values == 'tolerance') {
		URL='tolerancepopUpOpenCover.action?identify='+values+'&proposalNo='+document.Quotation.proposalNo.value;
	} else if(values == 'customer') {
		URL='chooseCustomerOpenCover.action?brokerId='+document.Quotation.brokerId.value+'&proposalNo='+document.Quotation.proposalNo.value;
	} 
	if(values == 'customer'){
		var width  = screen.availWidth;
		var height = screen.availHeight;
		var h=450;
		var w=750;
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
		
	}else{
		postRequest(URL, id);
	}
	
	
}

function viewPopUp(URL) {
	var bwidth = window.innerWidth;
	var bwidth1 = document.body.clientWidth;
	if(bwidth <= 768) {
		return popUp(URL,bwidth1,'500');
	} else {
		return popUp(URL,'750','500');
	}
}

function textCounter() {
	var field=document.getElementById("txtarCryRemarkes")
	var maxlimit=500
	if (field.value.length > maxlimit) { 
		field.value = field.value.substring(0, maxlimit);
	}
}

function backBtn(){
	document.Quotation.action = 'editQuoteOpenCover.action';
	document.Quotation.submit();
}
function proceedBtn(){
	document.Quotation.action = 'getModeofCoverOpenCover.action';
	document.Quotation.submit();
}
</script>	
</body>
</html>