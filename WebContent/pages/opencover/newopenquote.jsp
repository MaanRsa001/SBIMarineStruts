<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<!-- <link href="https://fonts.googleapis.com/css?family=Alegreya+Sans|Amiri|Cormorant+Garamond&display=swap" rel="stylesheet">-->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<!-- <link href="<%=request.getContextPath()%>/pages/font-awesome-JA/font-awesome.css" rel="stylesheet" type="text/css">-->

<script language="JavaScript">javascript:window.history.forward(1);</script>
<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap-multiselect.js" type="text/javascript"></script>
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
<s:set var="disable" value='%{(quoteStatus=="RA")||(endTypeId!=null && endTypeId.length() > 0) || "Y".equals(finalizeYN)}'/>
<s:set var="disable2" value='%{(endTypeId!=null && endTypeId.length() > 0)}'/>
<%--<div id="loading" style="width:100%">
   <img id="loading-image" src="<%=request.getContextPath()%>/images/ajax-loader-bar.gif"/>
</div>
--%><s:form id="quotation" name="quotation" method="post" theme="simple">
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<s:actionerror cssStyle="color: red;" />
	</div>
</div>
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="label.newopencoverinfo" /><s:if test="proposalNo!=null && proposalNo!=''"><span style="float:right;"><s:text name="label.proposalNo"/>:<s:property value="proposalNo"/></span></s:if>
			</div>
			<div class="panel-body">
				<div class="row">
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
			 			<div class="text">
				 			<s:text name="label.businessType" /><font color="red">*</font>
				 		</div>
				 			<div class="tbox">
                               <s:select name="businessType" id="businessType" list="businessTypeList" headerKey="" headerValue="---Select---"  listKey="Code" listValue="CodeDescription" cssClass="bg-hover inputBoxS tooltipContent select2" data-content="Business Type" onchange="getBusinesType(this.value);"/>
				 		</div>
			 		</div>
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
			 			<div class="text">
				 			<s:text name="label.opencovertype" /><font color="red">*</font>
				 		</div>
				 			<div class="tbox">
                               <s:select name="type" id="type" list="openCoverTypeList" headerKey="" headerValue="---Select---"  listKey="Code" listValue="CodeDescription" cssClass="bg-hover inputBoxS tooltipContent select2" data-content="Type" onchange="getOpenCoverType(this.value)"/>
				 		</div>	
			 		</div>
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
			 			<div class="text">
				 			<s:text name="label.broker" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
                               <s:select name="brokerId" id="brokerId" list="brokerList" headerKey="" headerValue="---Select---"  listKey="Code" listValue="CodeDescription" onChange="resett(this.form);toggleDebitType(this.value);ToggleCommission();" cssClass="bg-hover inputBoxS tooltipContent select2" data-content="Broker" />
				 		</div>	
			 		</div>
			 	</div>
			 	<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text">
				 			<s:text name="label.executive" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
				 			<s:select name="executiveId" id="executiveId" list="executiverList" headerKey="" headerValue="---Select---"  listKey="Code" listValue="CodeDescription" onChange="ToggleCommission();" cssClass="bg-hover inputBoxS tooltipContent select2" data-content="Executive" />
				 		</div>	
			 		</div>
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
			 			<div class="text">
				 			<s:text name="label.customer" /><font color="red">*</font>
				 		</div>
				 		
				 		<div class="input-group">
				 		     <s:textfield name="customerName" id="customerName" cssClass="bg-hover inputBox tooltipContent" data-content="Custome Name"  maxlength="200" readonly="true" disabled="#disable" onchange="setCustomerId();"/>
				 		     <s:hidden name="customerId" id="customerId" />
				 		     <span class="input-group-addon" >
				 		     	<a onclick="customerSelectionAction()" style="cursor: pointer"  disabled="#disable"><span class="glyphicon glyphicon-list"></a>
				 		     </span>
				 		</div>
			 		</div>
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text">
				 			<s:text name="label.debitto" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
				 			<s:radio list="#{'Broker':'Broker','Customer':'Customer'}" name="debitType" id="debitType" value="%{debitType==null || debitType==''?'Customer':debitType}" />
				 		</div>
			 		</div>
			 	</div>
				<div class="row">
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text">
				 			<s:text name="label.openstartdate" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
				 			<s:textfield name="opencoverstartdate" id="opencoverstartdate" cssClass="inputBox datepicker tooltipContent" data-content="Open Cover Start Date"  onchange="getPolicyExpiryDate();"/>
				 		</div>
			 		</div>
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text">
				 			<s:text name="label.openenddate" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
				 			<s:textfield name="opencoverenddate" id="opencoverenddate" cssClass="inputBox datepicker tooltipContent" data-content="Open Cover End Date" />
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
				<s:text name="label.extrainfo" />
			</div>
			<div class="panel-body">
				<div class="row">
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
			 			<div class="text">
				 			<s:text name="label.anualEst" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
				 			<s:textfield name="estimateAmount" id="estimateAmount" cssClass="inputBox tooltipContent" data-content="" maxlength="15" onkeyup="this.value=Comma(this.value);"/>
				 		</div>
			 		</div>
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
			 			<div class="text">
				 			<s:text name="label.utilized" />
				 		</div>
				 		<div class="tbox">
				 			<s:textfield name="utilizedAmount" id="utilizedAmount" value="%{(utilizedAmount==null || utilizedAmount=='')?0:utilizedAmount}" cssClass="inputBox tooltipContent" data-content="" maxlength="15" onkeyup="this.value=Comma(this.value);"/>
				 		</div>
			 		</div>
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				 		<div class="text">
				 			<s:text name="label.currency" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
				 			<s:select name="currency" id="currency" list="currencyList" headerKey="" headerValue="---Select---" listKey="Code" listValue="CodeDescription" cssClass="inputBoxS tooltipContent tooltipContent" data-content="Currency List" cssStyle="width:80%;float:left;"  onchange="return showValue(this.value)"/>
	                           <s:textfield id="exchangeRate" name="exchangeRate" cssStyle="width:20%;float:left;" cssClass="inputBox tooltipContent" data-content="Exchange Value" size="5"  disabled="#disable"/>
								<s:iterator value="currencyList" var="currencyDetail">
									<s:hidden name="%{#currencyDetail.Code}" id="%{#currencyDetail.Code}" value="%{#currencyDetail.CodeValue}"/>
								</s:iterator>
				 		</div>	
				 	</div>
			 	</div>
			 	<div class="row">
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
			 			<div class="text">
				 			<s:text name="label.sharepercent" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
                               <s:textfield name="rsaValue" id="rsaValue" cssClass="inputBox tooltipContent" onchange="TextSubmit()" data-content="" value="%{(rsaValue==null || rsaValue=='')?'100':rsaValue}" readonly="true"/>
				 		</div>	
			 		</div>
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text">
				 			<s:text name="label.noofcoins" />
				 		</div>
				 		<div class="tbox">
				 			 <s:textfield name="no_ofCompany" id="no_ofCompany" cssClass="inputBox tooltipContent" data-content=""  value="%{(no_ofCompany==null || no_ofCompany=='')?'0':no_ofCompany}" readonly="true"/>
				 		</div>	
			 		</div>
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text">
				 			<s:text name="label.freetext" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
				 			<s:radio list="#{'Y':'Yes','N':'NO'}" name="freeText" id="freeText" value="%{freeText==null || freeText==''?'N':freeText}" />
				 		</div>
			 		</div>
			 	</div>
			 	<div class="row">
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text">
				 			<s:text name="label.crossvoyage" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
				 			<s:radio list="#{'Y':'Yes','N':'NO'}" name="crossVoyage" id="crossVoyage" value="%{crossVoyage==null || crossVoyage==''?'N':crossVoyage}"  onchange="RadioSubmit(this.value)"/>
				 		</div>
			 		</div>
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text">
				 			<s:text name="label.crossvoyagepercent" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
				 			<s:textfield name="voyageValue" id="voyageValue" cssClass="inputBox tooltipContent" data-content="P.O. Box" disabled="#disable" maxlength="6" onchange="checkNumbers(this);" />
				 		</div>
			 		</div>
			 	</div>
			 	<div class="row">
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text">
				 			<s:text name="label.ext.core.policyno" />
				 		</div>
				 		<div class="tbox">
				 		<s:hidden name="missippiCode" id="missippiCode"></s:hidden>
				 			<s:textfield name="policyNo" id="policyNo" style="width:70%; float:left;" cssClass="inputBox tooltipContent" data-content="Policy No." disabled="#disable" maxlength="50" />
				 			<span style="float:left; line-height: 30px;">-</span>
				 			<s:textfield name="renNo" id="renNo" style="width:25%; float:left;" cssClass="inputBox tooltipContent" data-content="P.O. Box" disabled="#disable" maxlength="6" onchange="checkNumbers(this);" />
				 		</div>
			 		</div>
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text">
				 			<s:text name="label.certificatestart" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
				 			<s:textfield name="certNo" id="certNo" cssClass="inputBox tooltipContent" data-content="Certificate No. Starts From" disabled="#disable" maxlength="10" onchange="checkNumbers(this);" />
				 		</div>
			 		</div>
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text">
				 			<s:text name="label.commission" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
				 			<s:textfield name="commission" id="commission" cssClass="inputBox tooltipContent" data-content="Commission"  maxlength="6" onchange="checkNumbers(this);" />
				 		</div>
			 		</div>
			 		<%-- <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text">
				 			<s:text name="label.milandpremium" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
				 			<s:textfield name="crossMiniPremium" id="crossMiniPremium" cssClass="inputBox tooltipContent" data-content="Land Minimum Premium" disabled="#disable" maxlength="6" onchange="checkNumbers(this);" />
				 		</div>
			 		</div> --%>
			 	</div>
			 	<div class="row">
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text">
				 			<s:text name="label.minpremium" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
				 			<s:textfield name="expMiniPremium" id="expMiniPremium" cssClass="inputBox tooltipContent" data-content="Minimum Premium" disabled="#disable" maxlength="6" onchange="checkNumbers(this);" />
				 		</div>
			 		</div>
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text">
				 			<s:text name="label.endtfee" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
				 			<s:textfield name="endorsementFee" id="endorsementFee" cssClass="inputBox tooltipContent" data-content="Endorsement Fee" disabled="#disable" maxlength="6" onchange="checkNumbers(this);" />
				 		</div>
			 		</div>
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text">
				 			<s:text name="label.insuranceFee" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
				 			<s:textfield name="issuanceFee" id="issuanceFee" cssClass="inputBox tooltipContent" data-content="Issuance Fees" disabled="#disable" maxlength="10" onchange="checkNumbers(this);" />
				 		</div>
			 		</div>
					
			 		
			 	</div>
			 	<div class="row">
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text">
				 			<s:text name="label.minpreInsurancefee" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
				 			<s:textfield name="minPremiumIssuance" id="minPremiumIssuance" cssClass="inputBox tooltipContent" data-content="Minimum Premium Issuance Fees" disabled="#disable" maxlength="10" onchange="checkNumbers(this);" />
				 		</div>
			 		</div>
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text">
				 			<s:text name="label.noofbackdays" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
				 			<s:textfield name="backDays" id="backDays" cssClass="inputBox tooltipContent" data-content="No. of Back days allowed" disabled="#disable" maxlength="10" onchange="checkNumbers(this);" />
				 		</div>
			 		</div>
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text">
				 			<s:text name="label.defaultclause" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
				 			<s:radio list="#{'Y':'Yes','N':'No'}" name="defaultClauses" id="defaultClauses" value="%{defaultClauses==null || defaultClauses==''?'N':defaultClauses}" />
				 		</div>
			 		</div>
					
			 		
			 	</div>
			 	<div class="row">
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text">
				 			<s:text name="label.declarationTyep" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
				 			<s:select name="decType" id="decType" list="declarationList" headerKey="" headerValue="---Select---"  listKey="Code" listValue="CodeDescription" onChange="resett(this.form);toggleDebitType(this.value);ToggleCommission();" cssClass="bg-hover inputBoxS tooltipContent select2" data-content="Broker" />
				 		</div>
			 		</div>
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text">
				 			<s:text name="label.haulierType" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
			 				<s:radio list="#{'A':'Annual Type','V':'Vehicles Type','N':'None'}" name="haulierType" id="haulierType" value="%{(haulierType==null || haulierType=='')?'N':haulierType}" />
				 		</div>
			 		</div>
					<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2">
						<div class="text">
				 			<s:text name="label.warYN" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
				 			<s:radio list="#{'Y':'Yes','N':'No'}" name="warYN" id="warYN" value="%{warYN==null || warYN==''?'N':warYN}" />
				 		</div>
			 		</div>
			 		<s:hidden name="warLand" id="warLand" value="%{warLand==null || warLand==''?'N':warLand}"/>
			 		<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2">
						<div class="text">
				 			<s:text name="Fac YN" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
				 			<s:radio list="#{'Y':'Yes','N':'No'}" name="facYN" id="facYN" value="%{facYN==null || facYN==''?'N':facYN}" />
				 		</div>
			 		</div>
			 		<%-- <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text">
				 			<s:text name="label.vatpercent" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
				 			<s:textfield name="vatTaxPrecent" id="vatTaxPrecent" cssClass="inputBox tooltipContent" data-content="VAT Tax Percent" disabled="#disable" maxlength="6" onchange="checkNumbers(this);" />
				 		</div>
			 		</div> --%>
			 	</div>
			 	<%-- <div class="row">
			 		
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text">
				 			<s:text name="Warland YN" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
				 			<s:radio list="#{'Y':'Yes','N':'No'}" name="warLand" id="warLand" value="%{warLand==null || warLand==''?'N':warLand}" />
				 		</div>
			 		</div>
			 		
			 	</div> --%>
			 	<div class="row">
			 	<s:hidden  name="marginYN" id="marginYN" value="%{marginYN==null || marginYN==''?'N':marginYN}"/>
			 	<s:hidden name="marginPercent" id="marginPercent"/>
			 		<%-- <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text">
				 			<s:text name="Margin Rate" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
				 			<s:radio list="#{'Y':'Yes','N':'No'}" name="marginYN" id="marginYN" value="%{marginYN==null || marginYN==''?'N':marginYN}" onchange="getMarginRate(this.value)"/>
				 		</div>
			 		</div>
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text">
				 			<s:text name="Margin Rate(%)" />
				 		</div>
				 		<div class="tbox">
							<s:textfield name="marginPercent" id="marginPercent" cssClass="inputBox tooltipContent" data-content="Margin Percent" disabled="#disable" maxlength="6" onchange="checkNumbers(this);" />
						</div>
					</div> --%>
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4" >
							<div class="text">
								<s:text name="Policy Fee" /><font color="red">*</font>
					 		</div>
					 		<div class="tbox">
								<s:textfield name="policyFee"  maxlength="15" onkeyup="checkNumbers(this);" class="inputBox"/>
							</div>
						</div>
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text">
				 			<s:text name="Voyage Remarks" />
				 		</div>
				 		<div class="tbox">
							<s:textarea name="txtarCryRemarkes" id="txtarCryRemarkes" onkeyup="textCounter()" cssClass="inputBox tooltipContent"/>
						</div>
					</div>
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text">
				 			<s:text name="Effective Date" />
				 		</div>
				 		<div class="tbox">
							<s:textfield name="effectiveDate" id="effectiveDate" cssClass="inputBox datepicker tooltipContent" data-content="Open Cover Start Date"  />
						</div>
					</div>
					
			 	</div>
			 	<!-- <div class="row">
					
			 	</div> -->
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
<s:token/>
<s:hidden name="proposalNo"  id="proposalNo"/>
<s:hidden name="noofDays" id="noofDays" value="364"></s:hidden>
</s:form>
<script type="text/javascript">

$(function() {
	$('#opencoverstartdate').datetimepicker({
	     format:'d/m/Y',
	     //step: 1,
	     timepicker:false,
	    // minDate:'0',
	    // maxDate:'+1970/01/15',    
	     scrollInput : false,
	     onSelectDate:function(current_time, $input){
	    	 $(".xdsoft_datetimepicker").css("display", "none");
	     }
	});
	
	$('#opencoverenddate').datetimepicker({
	     format:'d/m/Y',
	     //step: 1,
	     timepicker:false,
	    // minDate:'0',
	    // maxDate:'+1970/01/15',    
	     scrollInput : false,
	     onSelectDate:function(current_time, $input){
	    	 $(".xdsoft_datetimepicker").css("display", "none");
	     }
	});
});
$(function() {
	$('#effectiveDate').datetimepicker({
	     format:'d/m/Y',
	     //step: 1,
	     timepicker:false,
	    // minDate:'0',
	    // maxDate:'+1970/01/15',    
	     scrollInput : false,
	     onSelectDate:function(current_time, $input){
	    	 $(".xdsoft_datetimepicker").css("display", "none");
	     }
	});
});
function showValue(Field)
{
	var selected = document.getElementById(""+Field);
	with(selected)
	{
		document.quotation.exchangeRate.value=value;
	}
}

function getquote(frm) { 
	disableForm(frm,false,'');
	document.getElementById('SubmitGetQuote').disabled=true;
	document.quotation.action = '<%=request.getContextPath()%>/getQuoteQuotation.action';
	document.quotation.submit();
}

function customerSelectionAction(){
	var broker = document.getElementById('brokerId').value;
	var customerId = document.getElementById('customerId').value;
	if(broker==null || broker==''){
		alert('Please Select a Broker');
		return false;
	}else{
		var url = 'customerSelectionOpenCover.action?brokerId='+broker+'&customerId='+customerId;
		viewPopUp(url);
		 //postRequest(url, 'customerSelectionAjaxId');
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
RadioSubmit('<s:property value="crossVoyage" />')
function RadioSubmit(val) {
	if(val == 'Y') {
		document.quotation.voyageValue.disabled=false;
	} else {
		document.quotation.voyageValue.value='';
		document.quotation.voyageValue.disabled=true;
	}
}
getMarginRate('<s:property value="marginYN" />')
function getMarginRate(val) {
	if(val == 'Y') {
		document.quotation.marginPercent.disabled=false;
	} else {
		document.quotation.marginPercent.value='';
		document.quotation.marginPercent.disabled=true;
	}
}

function showCustomer()
{
	var broker=document.form1.brokerId.value;
	if(broker=='Select')
		alert('Please Select Broker');
	else
	{
	var URL = '';
	var windowName = "";
	
URL='chooseCustomer.jsp?brokerId='+document.form1.brokerId.value+'&&customerId='+document.form1.customerId.value;

var width  = screen.availWidth;
var height = screen.availHeight;
var h=350;
var w=680;
var features =
	'width='          + w +
	',height='		  + h +
	',left='		  + ((width - w - 0) * .4)  +
	',top='			  + ((height - h - 0) * .4) +
	',directories=no' +
	',location=no'	  +
	',menubar=no'	  +
	',scrollbars=yes' +
	',status=yes'	  +
	',toolbar=no'	  +
	',resizable=false';
var strOpen = window.open (URL, windowName, features);
strOpen.focus();
return false;
	}
}

function proceedBtn(){
	if(document.quotation.policyNo.value!='' || document.quotation.renNo.value!='')
	{
		if(document.quotation.renNo.value!='') {
			document.quotation.missippiCode.value=document.quotation.policyNo.value+'-'+document.quotation.renNo.value;
		}
		else {
			document.quotation.missippiCode.value=document.quotation.policyNo.value;
		}
	}else{
	document.quotation.missippiCode.value='';
	}
	replaceComma(document.quotation,'estimateAmount,utilizedAmount');
	document.quotation.action = 'getQuoteOpenCover.action';
	document.quotation.submit();
}

function backBtn(){
	document.quotation.action = 'quoteRegisterReportReg.action';
	document.quotation.submit();
}


function resett(Form) {
// 	with(Form) {
// 		customerName.value="";
// 		customerId.value=null;
// 		if(brokerId.value=='RSABROKER123') {   // Hardcode
// 			commission.value='0';
// 			commission.disabled=true;
// 		} else {   // coding by marimuthu on 13th December 2007
// 			commission.value='';
// 			commission.disabled=false;
// 		}
// 	}
}

function toggleDebitType(val) {
// 	if(val == directLoginId) {
// 		document.getElementById('debitTypeB').checked = false;
// 		document.getElementById('debitTypeC').checked = true;
// 		document.getElementById('debitTypeB').disabled = true;
// 		document.getElementById('debitTypeC').disabled = true;
		
// 	}
// 	else {
// 		document.getElementById('debitTypeB').disabled = false;
// 		document.getElementById('debitTypeC').disabled = false;
// 	}
}

function ToggleCommission(){}

function setCustomerId(){
	
}
addComma(document.quotation,'estimateAmount,utilizedAmount');
function getPolicyExpiryDate(){
	var date = $('#opencoverstartdate').val();
	var days = $('#noofDays').val();
	 if(date!=null && date!='' && days!=null && days!=''){
	date=parseDate(date);
	date.setDate(date.getDate() + parseInt(days)); 
	if(parseInt(date.getDate())<10)
	{
		dd="0"+date.getDate();
	}else
	{
		dd=date.getDate();
	}
	if(parseInt(date.getMonth()+1)==0)
	{
		mm="12"
	}else
	if((parseInt(date.getMonth())+1)<10)
	{
		mm="0"+(parseInt(date.getMonth())+1);
	}else
	{
		mm=(parseInt(date.getMonth())+1);
	}

	var y = date.getFullYear();
	
	document.quotation.opencoverenddate.value = dd + '/'+ mm + '/'+ y;
	//$('#opencoverenddate').datepicker('setDate', dd + '/'+ mm + '/'+ y);
	 }
}
function parseDate(str) {
    var mdy = str.split('/');
    return new Date(mdy[1]+"/"+mdy[0]+"/"+mdy[2]);
}
getBusinesType('<s:property value="businessType"/>')
function getBusinesType(obj){
	var modeOfTrans=obj;
	if(modeOfTrans=='2'){
		document.getElementById('facYNY').disabled = false;

	}else{
		document.getElementById('facYNY').disabled = true;
		document.getElementById('facYNN').checked = true;
	}
}
getOpenCoverType('<s:property value="type"/>')
function getOpenCoverType(obj){
	var modeOfTrans=obj;
	if(modeOfTrans=='13' || modeOfTrans=='14'){
		document.getElementById('haulierTypeA').disabled = false;
		document.getElementById('haulierTypeV').disabled = false;
	}else{
		document.getElementById('haulierTypeA').disabled = true;
		document.getElementById('haulierTypeV').disabled = true;
		document.getElementById('haulierTypeN').checked = true;
	}
}
</script>	
</body>
</html>