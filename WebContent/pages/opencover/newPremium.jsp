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
--%><s:form id="quotation" name="quotation" method="post" action="getQuoteQuotation.action" theme="simple">
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<s:actionerror cssStyle="color: red;" />
	</div>
</div>
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="label.newopencoverinfo" />
			</div>
			<div class="panel-body">
				<div class="row">
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
			 			<div class="text">
				 			<s:text name="label.businessType" /><font color="red">*</font>
				 		</div>
				 			<div class="tbox">
                               <s:select name="businessType" id="businessType" list="#{}" headerKey="" headerValue="---Select---"  listKey="CODEDESC" listValue="CODEDESC" cssClass="bg-hover inputBoxS tooltipContent select2" data-content="Business Type"/>
				 		</div>
			 		</div>
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
			 			<div class="text">
				 			<s:text name="label.opencovertype" /><font color="red">*</font>
				 		</div>
				 			<div class="tbox">
                               <s:select name="type" id="type" list="#{}" headerKey="" headerValue="---Select---"  listKey="CODEDESC" listValue="CODEDESC" cssClass="bg-hover inputBoxS tooltipContent select2" data-content="Type"/>
				 		</div>	
			 		</div>
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
			 			<div class="text">
				 			<s:text name="label.broker" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
                               <s:select name="brokerId" id="brokerId" list="brokerList" headerKey="" headerValue="---Select---"  listKey="CODE" listValue="CODEDESC" onChange="resett(this.form);toggleDebitType(this.value);ToggleCommission();" cssClass="bg-hover inputBoxS tooltipContent select2" data-content="Broker" />
				 		</div>	
			 		</div>
			 	</div>
			 	<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text">
				 			<s:text name="label.executive" />
				 		</div>
				 		<div class="tbox">
				 			<s:select name="executiveId" id="executiveId" list="#{}" headerKey="" headerValue="---Select---"  listKey="CODEDESC" listValue="CODEDESC" onChange="ToggleCommission();" cssClass="bg-hover inputBoxS tooltipContent select2" data-content="Executive" />
				 		</div>	
			 		</div>
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
			 			<div class="text">
				 			<label><s:text name="label.customer" /><font color="red">*</font></label>
				 		</div>
				 		<div class="tbox">
				 			<div class="inputAppend">
                               <s:textarea name="customerName" id="customerName" cssClass="bg-hover inputBox1 inputBox tooltipContent" cssStyle="width: 100%;" data-content="Custome Name"  maxlength="200" disabled="#disable" onchange="setCustomerId();"/>
                               <s:hidden name="customerId" id="customerId" />
                               <s:submit type="button" value="..." cssClass="inputButton sub-btn" onclick="return customerSelectionAction()" cssStyle="position: relative;bottom: 47px;right: 1px;" disabled="#disable"/>
                           </div>
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
				 			<s:textfield name="opencoverstartdate" id="opencoverstartdate" cssClass="inputBox datepicker tooltipContent" data-content="Open Cover Start Date"  />
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
				 			<s:text name="label.anualEst" />
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
				 			<s:textfield name="utilizedAmount" id="utilizedAmount" cssClass="inputBox tooltipContent" data-content="" maxlength="15" onkeyup="this.value=Comma(this.value);"/>
				 		</div>
			 		</div>
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				 		<div class="text">
				 			<s:text name="label.currency" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
				 			<s:select name="currency" id="currency" list="#{ }" headerKey="" headerValue="---Select---" listKey="CODE" listValue="CODEDESC" cssClass="inputBoxS tooltipContent tooltipContent" data-content="Currency List" cssStyle="width:80%;float:left;"  onchange="return showValue(this.value)"/>
	                           <s:textfield id="currencyValue" name="currencyValue" cssStyle="width:20%;float:left;" cssClass="inputBox tooltipContent" data-content="Exchange Value" size="5"  disabled="#disable"/>
							<s:iterator value="currencyList" var="currencyDetail">
								<s:hidden name="%{#currencyDetail.CODE}" id="%{#currencyDetail.CODE}" value="%{#currencyDetail.CODEVALUE}"/>
							</s:iterator>
				 		</div>	
				 	</div>
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
			 			<div class="text">
				 			<s:text name="label.sharepercent" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
                               <s:textfield name="rsaValue" id="rsaValue" cssClass="inputBox tooltipContent" onchange="TextSubmit()" data-content="" value="%{(rsaValue==null || rsaValue=='')?'100':rsaValue}"/>
				 		</div>	
			 		</div>
			 	</div>
			 	<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text">
				 			<s:text name="label.noofcoins" />
				 		</div>
				 		<div class="tbox">
				 			 <s:textfield name="no_ofCompany" id="no_ofCompany" cssClass="inputBox tooltipContent" data-content="" readonly="readonly" value="%{(no_ofCompany==null || no_ofCompany=='')?'100':rsaValue}" />
				 		</div>	
			 		</div>
			 		
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
				 			<s:text name="label.freetext" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
				 			<s:radio list="#{'Y':'Yes','N':'NO'}" name="freeText" id="freeText" value="%{freeText==null || freeText==''?'N':freeText}" />
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
			 	</div>
			 	<div class="row">
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text">
				 			<s:text name="label.ext.core.policyno" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
				 		<s:hidden name="missippiCode" id="missippiCode"></s:hidden>
				 			<s:textfield name="policyNo" id="policyNo" style="width:70%; float:left;" cssClass="inputBox tooltipContent" data-content="Policy No." disabled="#disable" maxlength="6" onchange="checkNumbers(this);" />
				 			<span style="float:left; line-height: 30px;">-</span>
				 			<s:textfield name="renNo" id="renNo" style="width:25%; float:left;" cssClass="inputBox tooltipContent" data-content="P.O. Box" disabled="#disable" maxlength="6" onchange="checkNumbers(this);" />
				 		</div>
			 		</div>
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
				 			<s:text name="label.milandpremium" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
				 			<s:textfield name="crossMiniPremium" id="crossMiniPremium" cssClass="inputBox tooltipContent" data-content="Land Minimum Premium" disabled="#disable" maxlength="6" onchange="checkNumbers(this);" />
				 		</div>
			 		</div>
			 	</div>
			 	<div class="row">
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text">
				 			<s:text name="label.insuranceFee" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
				 			<s:textfield name="issuanceFee" id="issuanceFee" cssClass="inputBox tooltipContent" data-content="Issuance Fees" disabled="#disable" maxlength="10" onchange="checkNumbers(this);" />
				 		</div>
			 		</div>
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
			 	</div>
			 	<div class="row">
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text">
				 			<s:text name="label.defaultclause" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
				 			<s:radio list="#{'Y':'Yes','N':'No'}" name="defaultClauses" id="defaultClauses" value="%{defaultClauses==null || defaultClauses==''?'N':defaultClauses}" />
				 		</div>
			 		</div>
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text">
				 			<s:text name="label.declarationTyep" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
				 			<s:select name="decType" id="decType" list="declarationList" headerKey="" headerValue="---Select---"  listKey="CODE" listValue="CODEDESC" onChange="resett(this.form);toggleDebitType(this.value);ToggleCommission();" cssClass="bg-hover inputBoxS tooltipContent select2" data-content="Broker" />
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
			 	</div>
			 	<div class="row">
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text">
				 			<s:text name="label.haulierType" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
			 				<s:radio list="#{'Y':'Annual Type','N':'Vehicles Type'}" name="haulierType" id="haulierType" value="%{haulierType==null || haulierType==''?'N':haulierType}" />
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
				 			<s:text name="label.vatpercent" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
				 			<s:textfield name="vatTaxPrecent" id="vatTaxPrecent" cssClass="inputBox tooltipContent" data-content="VAT Tax Percent" disabled="#disable" maxlength="6" onchange="checkNumbers(this);" />
				 		</div>
			 		</div>
			 	</div>
			 	<div class="row">
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text">
				 			<s:text name="label.warYN" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
				 			<s:radio list="#{'Y':'Yes','N':'No'}" name="warYN" id="warYN" value="%{warYN==null || warYN==''?'N':warYN}" />
				 		</div>
			 		</div>
			 	</div>
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4" align="right">
					<input type="button" value="Back" class="btn btn-sm btn-danger">
				</div>
				<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4" align="center">
					<input type="button" value="save quote" class="btn btn-sm btn-warning">
				</div>
				<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4" align="left">
					<input type="button" value="Proceed" onclick="proceedBtn();" class="btn btn-sm btn-success">
				</div>
			</div>
			<br/>
		</div>
	</div>
</div>
<s:token/>
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

function showValue(Field)
{
	var selected = document.getElementById(""+Field);
	with(selected)
	{
		document.form1.currencyValue.value=value;
	}
}
function getquote(frm) { 
	disableForm(frm,false,'');
	document.getElementById('SubmitGetQuote').disabled=true;
	document.quotation.action = '<%=request.getContextPath()%>/getQuoteQuotation.action';
	document.quotation.submit();
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
	document.quotation.action = 'quotationOpenCover.action';
	document.quotation.submit();
}

</script>	
</body>
</html>