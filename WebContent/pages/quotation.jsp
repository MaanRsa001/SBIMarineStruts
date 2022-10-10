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
	.modal-title{
	width:70%;
	}
</style>
</head>
<body>
<s:set var="disable" value='%{(quoteStatus=="RA")||(endTypeId!=null && endTypeId.length() > 0) || "Y".equals(finalizeYN)}'/>
<s:set var="disable2" value='%{(endTypeId!=null && endTypeId.length() > 0)}'/>
<s:set var="endtTypeVal" value='%{endtType}'/>
<s:set var="ecurrencyList" value='%{currencyList}'/>
<s:set var="ewarOption" value='%{warOption}'/>

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
		<s:if test='%{#endtTypeVal!=null && #endtTypeVal.length() > 0}'>			
			<div class="panel panel-primary">
				<div class="panel-body" style="padding: 0;">
					<s:set value="policyEndtInfo" var="policyEndtInfo"></s:set>
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							<div class="textV">
					 			<s:text name="endt.policyNo"/>
					 		</div>
					 		<div class="tboxV">
					 			<span style="color:blue;"><s:property value="%{#policyEndtInfo.POLICY_NO}"/></span>									 		
					 		</div>
						</div>
						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							<div class="textV">
					 			<s:text name="endt.brokerName"/>
					 		</div>
					 		<div class="tboxV">
					 			<span style="color:blue;"><s:property value="%{#policyEndtInfo.BROKER_NAME}"/></span>									 		
					 		</div>
						</div>
						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							<div class="textV">
					 			<s:text name="endt.custName"/>
					 		</div>
					 		<div class="tboxV">
					 			<span style="color:blue;"><s:property value="%{#policyEndtInfo.CUSTOMER_NAME}"/></span>									 		
					 		</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							<div class="textV">
					 			<s:text name="quotation.endtTypeDesc" />
					 		</div>
					 		<div class="tboxV">
					 			:&nbsp;<span style="color:blue;"><s:property value="#endtTypeVal" /></span>									 		
					 		</div>
						</div>
					</div>
				 	<br class="clear"/>
				</div>
			</div>
		</s:if>
		<s:elseif test="%{productId==openCover}" >
			<div class="panel panel-primary">
				<div class="panel-body" style="padding: 0;">
				 	<s:set value="openCoverInfo" var="openCoverInfo"></s:set>
				 	<div class="row">
				 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				 			<div class="text35V">
					 			<s:text name="endt.openPolicyNo"/>
					 		</div>
					 		<div class="tbox65V">
					 			<span style="color:blue;"><s:property value="%{#openCoverInfo.OPEN_COVER_NO}"/></span>									 		
					 		</div>
				 		</div>
				 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				 			<div class="text35V">
					 			<s:text name="endt.brokerName"/>
					 		</div>
					 		<div class="tbox65V">
					 			<span style="color:blue;"><s:property value="%{#openCoverInfo.BROKER_NAME}"/></span>									 		
					 		</div>
				 		</div>
				 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				 			<div class="text35V">
					 			<s:text name="endt.custName"/>
					 		</div>
					 		<div class="tbox65V">
					 			<span style="color:blue;"><s:property value="%{#openCoverInfo.CUSTOMER_NAME}"/></span>									 		
					 		</div>
				 		</div>
				 	</div>
				 	<br class="clear" />
				 </div>
			</div>
		</s:elseif>
	</div>
</div>
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<s:if test="issuer != null">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<s:text name="quotation.brokerInfo" />
				</div>
				<div class="panel-body" style="padding: 0;">
					<div class="row">
						<s:if test="%{productId!=openCover}">
							<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
								<div class="text">
						 			<s:text name="quotation.channelType"  /><font color="red">*</font>
						 		</div>
						 		<div class="tbox">									 			
						 			<!-- <s:select name="channelType" id="channelType" list="#{'broker':'Broker','customer':'Customer','cash':'Cash'}" headerKey="" headerValue="---Select----" cssClass="inputBoxS tooltipContent" data-content="Channel Type" onchange="getList('?channelType='+this.value,'brokersList');getList('?brokerCode=','executiveList');getList('?brokerCode=','promotionalList');emptyCustInfo();" disabled="%{brokerCode!=null && brokerCode!=''}"/> -->
						 			<s:select name="channelType" id="channelType" list="#{'broker':'Broker','cash':'Cash'}" headerKey="" headerValue="---Select----" cssClass="inputBoxS tooltipContent" data-content="Channel Type" onchange="getList('?channelType='+this.value,'brokersList');getList('?brokerCode=','executiveList');getList('?brokerCode=','promotionalList');emptyCustInfo();" disabled="#disable"/>  							 		
						 		</div>
					 		</div>
				 		</s:if>
				 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				 			<div class="text" >
					 			<s:text name="quotation.broker"/><font color="red">*</font>
					 		</div>
					 		<div class="tbox" id="brokersList">
					 			<s:select name="brokerCode" id="brokerCode" list="brokerList" headerKey="" headerValue="---Select----" cssClass="inputBoxS tooltipContent" data-content="Broker"  listKey="CODE" listValue="CODEDESC" onchange="getList('?brokerCode='+this.value,'executiveList');getList('?brokerCode='+this.value,'promotionalList');emptyCustInfo();"  disabled="%{#disable || productId==openCover}"  />
					 		</div>
				 		</div>
				 		<s:hidden name="executive" value="5"></s:hidden>
				 		<%-- <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				 			<div class="text">
					 			<s:text name="quotation.executive" />
					 		</div>
					 		<div class="tbox">
					 			<div id="executiveList"><s:select name="executive" list="executiveList" headerKey="" headerValue="---Select----" cssClass="inputBoxS tooltipContent" data-content="Executive" listKey="CODE" listValue="CODEDESC" disabled="%{#disable || productId==openCover}"  value='executive==null?getText("quotation.executiveDefault"):executive'/></div>
					 		</div>	
				 		</div> --%>
					</div>			
				</div>
				<br class="clear"/>
			</div>
		</s:if>
		<s:else>
			<s:hidden name="channelType"/>
			<s:hidden name="brokerCode"/>
			
		</s:else>
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="quotation.customerInfo" />
				<!-- <div class="pullRight">
					<input type="button" value="Clear" class="btn btn-sm btn-default" style="cursor:pointer;" onclick="clearCustomerInfo();"/>
				</div>
				<br class="clear"/> -->
			</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text">
				 			<s:text name="quotation.title"  /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
				 			<s:select name="title" id="title" list="titleList" headerKey="" headerValue="---Select---"  listKey="CODEDESC" listValue="CODEDESC" cssClass="inputBoxS tooltipContent" data-content="Title" disabled="#disable"/>
				 		</div>
			 		</div>
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
			 			<div class="text">
				 			<s:text name="quotation.customerName" /><font color="red">*</font>
				 		</div>
						<div class="input-group">
                               <s:textfield name="customerName" id="customerName" cssClass="inputBox tooltipContent" data-content="Custome Name"   maxlength="500" disabled="#disable" onchange="setCustomerId();"/>
                               <s:hidden name="customerId" id="customerId" />
					       <span class="input-group-addon">
                             <a onclick="customerSelectionAction()" style="cursor: pointer"  disabled="#disable"><span class="glyphicon glyphicon-list"></span></a>
					      </span>
					    </div>			 		
			 		</div>
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text">
				 			<s:text name="quotation.address1" />
				 		</div>
				 		<div class="tbox">
				 			<s:textfield name="address1" id="address1" cssClass="inputBox tooltipContent" data-content=""  maxlength="150" disabled="#disable"/>
				 		</div>
				 	</div>
			 		
			 		</div>
			 		<div class="row">
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
			 			<div class="text">
				 			<s:text name="quotation.address2" />
				 		</div>
				 		<div class="tbox">
				 			<s:textfield name="address2" id="address2" cssClass="inputBox tooltipContent" data-content="" maxlength="150" disabled="#disable"/>
				 		</div>
			 		</div>
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
			 			<div class="text">
				 			<s:text name="quotation.state" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
				 			<s:select name="state" id="state" list="stateList" headerKey="" headerValue="---Select---" listKey="CODE" listValue="CODEDESC" cssClass="inputBoxS tooltipContent" data-content="State" disabled="#disable" onchange="getList('?state='+this.value,'cityList');" />
				 		</div>
			 		</div>
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
			 			<div class="text">
				 			<s:text name="quotation.city" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
				 			<div id="cityList"><s:select name="city" id="city" list="cityList" headerKey="" headerValue="---Select---" listKey="CODE" listValue="CODEDESC" cssClass="inputBoxS tooltipContent" data-content="City" disabled="#disable"/></div>
				 		</div>
			 		</div>
			 		</div>
				<div class="row">
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text">
				 			<s:text name="quotation.poBox" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
				 			<s:textfield name="poBox" id="poBox" cssClass="inputBox tooltipContent" data-content="P.O. Box" disabled="#disable" maxlength="6" onchange="checkNumbers(this);" />
				 		</div>
			 		</div>
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
			 			<div class="text">
				 			<s:text name="quotation.mobileNo" />
				 		</div>
				 		<div class="tbox">
				 			<s:textfield name="mobileNo" id="mobileNo" cssClass="inputBox tooltipContent" data-content="Mobile No." disabled="#disable"  maxlength="10" onchange="checkNumbers(this);" />
				 		</div>	
			 		</div>
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
			 			<div class="text">
				 			<s:text name="quotation.email" />
				 		</div>
				 		<div class="tbox">
				 			<s:textfield name="email" id="email" cssClass="inputBox tooltipContent" data-content="E-Mail" disabled="#disable" maxlength="100"/>
				 		</div>	
			 		</div>
			 	</div>
				<div class="row">
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
			 			<div class="text">
				 			<s:text name="quotation.customerType" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
				 			<s:select name="customerType" id="customerType" list="customerTypeList" headerKey="" headerValue="---Select---" listKey="CODE" listValue="CODEDESC" cssClass="inputBoxS tooltipContent" data-content="CustomerType" disabled="#disable"/>
				 		</div>
			 		</div>
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
			 			<div class="text">
				 			<s:text name="quotation.gstno" />
				 		</div>
				 		<div class="tbox">
				 			<s:textfield name="gstIdentityNo" id="gstIdentityNo" cssClass="inputBox tooltipContent" data-content="GST Number" disabled="#disable" maxlength="16"/>
				 		</div>	
			 		</div>
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
			 			<div class="text">
				 			<s:text name="quotation.aadharNumber" />
				 		</div>
				 		<div class="tbox">
				 			<s:textfield name="aadharNo" id="aadharNo" cssClass="inputBox tooltipContent" data-content="AAdhar Number" disabled="#disable" maxlength="12"/>
				 		</div>	
			 		</div>
			 	</div>
			 	<div class="row">
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
			 			<div class="text">
				 			<s:text name="quotation.eiaNumber" />
				 		</div>
				 		<div class="tbox">
				 			<s:textfield name="eiaNumber" id="eiaNumber" cssClass="inputBox tooltipContent" data-content="GST Number" disabled="#disable" maxlength="16"/>
				 		</div>	
			 		</div>
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
			 			<div class="text">
				 			<s:text name="quotation.iaCode" />
				 		</div>
				 		<div class="tbox">
				 			<s:select name="ianocode" id="ianocode" list="irtypeList" headerKey="" headerValue="---Select---" listKey="CODE" listValue="CODEDESC" cssClass="inputBoxS tooltipContent" data-content="IA No Code" disabled="#disable"/>
				 		</div>	
			 		</div>
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
			 			<div class="text">
				 			<s:text name="quotation.coreAppCode" />
				 		</div>
				 		<div class="tbox">
				 			<s:textfield name="coreAppCode" id="coreAppCode" cssClass="inputBox tooltipContent" data-content="Core App Code" maxlength="20" readonly="true" disabled="#disable"/>
                     		<s:hidden name="nameAndCode" id="nameAndCode"/>
                     		<s:hidden name="custArNo" id="custArNo"/>
                     		<s:hidden name="coreCustomerName" id="coreCustomerName"/>
				 		</div>	
			 		</div>
			 	</div>
			 		<div class="row">
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
			 			<div class="text">
				 			<s:text name="quotation.sezYn" />
				 		</div>
				 		<div class="tbox">
				 			<s:radio list="#{'YES':'Yes','NO':'No'}" name="sezYn" id="sezYn"  value='%{(sezYn==null || "".equals(sezYn))?"NO":sezYn}' disabled="#disable" onclick="editCustomerInfo();"/>
				 		</div>	
			 		</div>
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
			 			<div class="text">
				 			<s:text name="quotation.hypo" />
				 		</div>
				 		<div class="tbox">
				 			<s:textfield name="hypothecation" id="hypothecation" cssClass="inputBox tooltipContent" data-content="Hypothecation Details" disabled="#disable" maxlength="16"/>
				 		</div>	
			 		</div>
			 		
			 	</div>
				<div class="row" id="editCustomerDIV">
					<s:if test='%{productId==openCover1 && customerId.equals(#session.customer_id) && !(#disable)}'>
					 	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
					 		<div class="text">
					 			<s:text name="quotation.editCustomer" />
					 		</div>
					 		<div class="tbox">
					 			<s:radio list="#{'YES':'Yes','NO':'No'}" name="editCustomer" id="editCustomer"  value='%{(editCustomer==null || "".equals(editCustomer))?"NO":editCustomer}' disabled="#disable" onclick="editCustomerInfo();"/>
					 		</div>	
					 	</div>
				 	</s:if>
				</div>
			</div>
		</div>
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="quotation.quoteInfo" />					
			</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				 		<div class="text">
				 			<s:text name="quotation.modeOfTransport" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
				 			<s:select name="modeOfTransport" id="modeOfTransport" list="modeList" headerKey="" headerValue="---Select---" listKey="CODE" listValue="CODEDESC" cssClass="inputBoxS tooltipContent" data-content="Mode of Transport" disabled="#disable"  onchange="getList('?modeOfTransport='+this.value,'coverList');getList('?modeOfTransport='+this.value,'conveyanceList');getList('?modeOfTransport='+this.value,'packageList');disableWarehouse(this);toggleWarSrcc(this);setVesselName();toggleModeOfTransport(this);toggleShipTracking(this.value);" />
				 		</div>	
				 	</div>
				 	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				 		<div class="text">
				 			<s:text name="quotation.cover" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
				 			<s:if test="%{productId==openCover}" >
	                           	<div id="coverList"><s:select name="cover" id="cover" list="coverList" headerKey="" headerValue="---Select---" listKey="CODE" listValue="CODEDESC" cssClass="inputBoxS tooltipContent" data-content="Cover" disabled="#disable" /></div>
	                          </s:if>	
	                          <s:else>
	                           	<div id="coverList"><s:select name="cover" id="cover" list="coverList" headerKey="" headerValue="---Select---" listKey="CODE" listValue="CODEDESC" cssClass="inputBoxS tooltipContent" data-content="Cover" disabled="#disable"  /></div>                                
	                          	</s:else>
				 		</div>	
				 	</div>
				 	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				 		<div class="text">
				 			<s:text name="quotation.conveyance" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
				 			<div id="conveyanceList"><s:select name="conveyance" list="conveyanceList" listKey="CODE" listValue="CODEDESC" headerKey="" headerValue="---Select---" cssClass="inputBoxS tooltipContent" data-content="Conveyance" disabled="#disable" /></div>
				 		</div>	
				 	</div>
				</div>
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				 		<div class="text">
				 			<s:text name="quotation.originCountry" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
				 			<s:select name="originCountry" id="originCountry" list="originList" headerKey="" headerValue="---Select---" listKey="CODE" listValue="CODEDESC" cssClass="inputBoxS tooltipContent" data-content="Origin City" disabled="#disable" value="%{originCountry==null?'1':originCountry}" onchange="emptyCity('orgin');"/>
				 		</div>	
				 	</div>
				 	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				 		<div class="text">
				 			<s:text name="quotation.originCity" />
				 		</div>
				 		 <div class="input-group">
						    
						    <s:textfield name="originCityName" id="originCityName" cssClass="inputBox" disabled="#disable" readonly="true"/>
				 			<s:hidden name="originCity" id="originCity"/>
				 			<span class="input-group-addon">
				 				
                               <button type="button" name="originCityBtn" id="originCityBtn" data-toggle="modal" data-target="#originationCityModal" onclick="originCitySelectionAction();" <s:if test="#disable">disabled</s:if><s:else></s:else>>
				 			     <span class="glyphicon glyphicon-list"></span>
				 			   </button>			                	
			                </span>
						  </div>
				 	</div>
				 	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				 		<div class="text">
				 			<s:text name="quotation.originaddress" />
				 		</div>
				 		<div class="tbox">
				 			<s:textfield name="orginateaddress" id="orginateaddress" cssClass="inputBox tooltipContent" data-content="Orginating Address" disabled="#disable" maxlength="12"/>
				 		</div>	
				 	</div>
				 	
				</div>
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				 		<div class="text">
				 			<s:text name="quotation.destCountry" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
				 			<s:select name="destCountry" id="destCountry" list="destList" headerKey="" headerValue="---Select---" listKey="CODE" listValue="CODEDESC" cssClass="inputBoxS tooltipContent" data-content="Destination City" disabled="#disable"  onchange="getList('?quoteStatus=%{quoteStatus}&destCountry='+this.value,'agentList');getList('?quoteStatus=%{quoteStatus}&destCountry='+this.value,'surveyagentList');emptyCity('dest');" value="%{destCountry==null?'1':destCountry}"/>
				 		</div>	
				 	</div>
				 	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				 		<div class="text">
				 			<s:text name="quotation.destCity" />
				 		</div>
				 		 <div class="input-group">
						   
						   <s:textfield name="destCityName" id="destCityName" cssClass="inputBox" data-content="Destination City"  disabled="#disable" readonly="true"/>
				 			<s:hidden name="destCity" id="destCity"/>
				 			 <span class="input-group-addon" >
			                	<button type="button" style="cursor: pointer" name="destCityBtn" id="destCityBtn" data-toggle="modal" data-target="#destinationCityModal" onclick="destCitySelectionAction();" <s:if test="#disable">disabled</s:if><s:else></s:else> ><span class="glyphicon glyphicon-list"></span></button>
			                </span>
						 </div>
				 	</div>
				 	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				 		<div class="text">
				 			<s:text name="quotation.destinaddress" />
				 		</div>
				 		<div class="tbox">
				 			<s:textfield name="destinateaddress" id="destinateaddress" cssClass="inputBox tooltipContent" data-content="Destinating Address" disabled="#disable" maxlength="12"/>
				 		</div>	
				 	</div>
				 	
				</div>
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				 		<div class="text">
				 			<s:text name="quotation.originWarehouse" />
				 		</div>
				 		<div class="tbox">
				 			<s:radio list="#{'YES':'Yes','NO':'No'}" name="originWarehouse" id="originWarehouse"  value='%{originWarehouse==null?"NO":originWarehouse}' disabled="#disable"/>
				 		</div>	
				 	</div>
					
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				 		<div class="text">
				 			<s:text name="quotation.destWarehouse" />
				 		</div>
				 		<div class="tbox">
				 			<s:radio list="#{'YES':'Yes','NO':'No'}" name="destWarehouse"  value='%{destWarehouse==null?"NO":destWarehouse}' disabled="#disable"/>
				 		</div>	
				 	</div>
				 	 
				 	<s:if test='#ewarOption=="Y"'>
				 	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				 		<div class="text">
				 			<div id="warSrccId" class="tCol"><s:text name="quotation.warSrcc" /> </div>
				 		</div>
				 		<div class="tbox">
				 			<s:radio list="#{'YES':'Yes','NO':'No'}" name="warSrcc"  value='%{warSrcc==null?"YES":warSrcc}' disabled="#disable"/>
				 		</div>	
				 	</div>
				 	</s:if>
				</div>
			 	<div class="row">
			 		
			 		<s:if test='!((specialTerm!=null && !"".equals(specialTerm)) || ("admin".equalsIgnoreCase(#session.usertype)||"RSAIssuer".equalsIgnoreCase(#session.usertype)))'> 
					 	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
					 		<div class="text">
					 			<s:text name="quotation.via"/>
					 		</div>
					 		<div class="tbox">
					 			<s:textfield name="via" id="via" cssClass="inputBox tooltipContent" data-content="" disabled="#disable" maxlength="100"/>
					 		</div>	
					 	</div>
				 	</s:if>
				 	<s:else>
					 	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
					 		<div class="text">
					 			<s:text name="quotation.via" />
					 		</div>
					 		<div class="tbox">
					 			<s:textfield name="via" id="via" cssClass="inputBox tooltipContent" data-content="" disabled="#disable" maxlength="100"/>
					 		</div>	
					 	</div>
				 	</s:else>
				 	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				 		<div class="text">
				 			<s:text name="quotation.currency" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
				 			<s:select name="currency" id="currency" list="#ecurrencyList" headerKey="" headerValue="---Select---" listKey="CODE" listValue="CODEDESC" cssClass="inputBoxS tooltipContent tooltipContent" data-content="Currency List" cssStyle="width:80%;float:left;" disabled="#disable"  onchange="exchageRate(this,'currency')"/>
	                           <s:textfield id="exchageValue" name="exchageValue" cssStyle="width:20%;float:left;" cssClass="inputBox tooltipContent" data-content="Exchange Value" size="5"  disabled="#disable"/>
							<s:iterator value="#ecurrencyList" var="currencyDetail">
								<s:hidden name="%{#currencyDetail.CODE}" id="%{#currencyDetail.CODE}" value="%{#currencyDetail.CODEVALUE}"/>
							</s:iterator>
				 		</div>	
				 	</div>
			 		
			 		
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				 		<div class="text">
				 			<s:text name="quotation.policyStartDate" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
				 			<s:textfield id="policyStartDate" name="policyStartDate" cssClass="inputBox datepicker tooltipContent" data-content="Policy Start Date" readonly="true" disabled="#disable" />
				 		</div>	
				 	</div>
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				 		<div class="text">
				 			<s:text name="quotation.commodity" /><font color="red">*</font>
				 		</div>
				 		
				 		 <div class="input-group">
						    <s:textarea name="commodity" id="commodity" cssClass="inputBox tooltipContent" data-content="Commodity Name"  disabled="#disable" readonly="true"/>
						    <span class="input-group-addon" >
			                	<button type="button" data-toggle="modal" data-target="#commodityPopup">
			                	<span class="glyphicon glyphicon-list"></span>
			                	</button>
			                </span>
						  </div>
					 	<div class="modal" id="commodityPopup" role="dialog">
				        	<div class="modal-dialog modal-lg">
							      <!-- Commodity Modal-->
								<div class="modal-content">
							        <div class="modal-header">
							          <button type="button" class="close" data-dismiss="modal"  onclick="assignVal('commodity','commodityDesc')">&times;</button>
							          <h4 class="modal-title"><b>Category Of Goods Information</b></h4>
							        </div>
							        <div class="modal-body">
										<div class="row">
									 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
									 			<div class="text"><s:text name="Commodity Name" /><font color="red">*</font></div>
										 		<div class="tbox">
										 		<s:if test='!"".equals(commodityId[0])'>
												<s:select name="commodityId[0]" list="goodsCategoryList" id="commodityId_0" headerKey="" headerValue="-Select-" listKey="CODE" listValue="CODEDESC" disabled="true" cssClass="inputBoxS"/>							 		
										 		</s:if>
										 		<s:else>
										 		<s:select name="commodityId[0]" list="goodsCategoryList" id="commodityId_0" headerKey="" headerValue="-Select-" listKey="CODE" listValue="CODEDESC" disabled="#disable" cssClass="inputBoxS"/>
										 		</s:else>	
										 		</div>	
									 		</div>
											<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
												<div class="text"><s:text name="Goods Description" /><font color="red">*</font></div>
										 		<div class="tbox">
										 			<s:textarea name="commodityDesc[0]" id="commodityDesc_0" onkeyup="textLimit(this,800)" cssClass="inputBox" disabled="#disable" cols="34" rows="3" cssStyle="width: 100%;height:100px;" />
										 		</div>
									 		</div>
											<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
												<div class="text">
													<s:text name="commodity.insuredValue" /><font color="red">*</font>
												</div>
												<div class="tbox">
													<s:textfield name="insuredValue[0]" id="insuredValue_0" cssClass="inputBox" maxlength="13" disabled="#disable" onkeyup="this.value=numberComma(this.value);"/>
												</div>
									 		</div>
									 		
									 	</div>
									 	<!-- <br/>
									 	<br/> -->
									 	<div class="row">
									 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
												<div class="text">
													<s:text name="commodity.dutyinsuredValue" /><font color="red">*</font>
												</div>
												<div class="tbox">
													<s:textfield name="dutyValue[0]" id="dutyValue_0" cssClass="inputBox" maxlength="13" disabled="#disable" onkeyup="this.value=numberComma(this.value);"/>
												</div>
									 		</div>
									 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
												<div class="text">
													<s:text name="commodity.invoiceNo" />
												</div>
												<div class="tbox">
													<s:textfield name="invoiceNo[0]" cssClass="inputBox" maxlength="500"  disabled="%{#disable || #disable2}" />
												</div>	
									 		</div>
											<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
												<div class="text">
													<s:text name="commodity.invoiceDate" />
												</div>
												<div class="tbox">
													<s:textfield id="invoiceDate_0" name="invoiceDate[0]"  cssClass="inputBox datepicker tooltipContent"  disabled="%{#disable || #disable2}" readonly="true" />
												</div>
									 		</div>
											
									 	</div>
									 	<div class="row">
									 	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
												<div class="text">
													<s:text name="Consigned From" />
												</div>
												<div class="tbox">
													<s:textfield name="consignedFrom[0]" cssClass="inputBox" disabled="%{#disable2 || #disable}" />
												</div>
									 		</div>
											<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
												<div class="text">
													<s:text name="Consigned To" />
												</div>
												<div class="tbox">
													<s:textfield name="consignedTo[0]" cssClass="inputBox"  disabled="%{#disable2 || #disable}" />
												</div>
									 		</div>
									 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
												<div class="text">
													<s:text name="PO Number" />
												</div>
												<div class="tbox">
													<s:textfield name="poNumber[0]" cssClass="inputBox" maxlength="300" onkeyup="checkNumbers(this);" disabled="%{#disable2 || #disable}"  />
												</div>
									 		</div>
											
									 	</div>
									 	<div class="row">
								 		<s:if test='%{"3".equals(#session.product_id) && ("admin".equalsIgnoreCase(#session.usertype) || "RSAIssuer".equalsIgnoreCase(#session.usertype))}'>
								 			
												<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
													<div class="text"><s:label key="commodity.excessdesc" /></div>
													<div class="tbox">
														<s:textarea name="excessDesc[0]" onkeyup="textLimit(this,450)" disabled='%{"11".equals(#session.product_id)?"true":#disable}' cssClass="inputBoxA" cols="34" rows="3" cssStyle="width: 100%;" />
													</div>
										 		</div>
									 		
									 	</s:if>
									 	<s:else>
									 		<s:hidden name="excessDesc[0]" />
									 	</s:else>
									 	
									 	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
												<div class="text">
													<s:label key="commodity.fragile" />
												</div>
												<div class="tbox">
													<s:radio name="fragile[0]" list="#{true:'Yes',false:'No'}" value="%{fragile==null?false:fragile[0]}" disabled="#disable" />
												</div>
									 		</div>
									 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
												<div class="text">
													<s:label key="quotation.identificationno" />
												</div>
												<div class="tbox">
													<s:textfield name="identificationno[0]" cssClass="inputBox" maxlength="300" onkeyup="checkNumbers(this);" disabled="%{#disable2 || #disable}"  />
 												</div>
									 		</div>
									 		
									 		</div>
							        </div>
							        <div class="modal-footer">
							         <button type="button" name="close" class="btn btn-danger btn-oval" data-dismiss="modal">Close</button>
							         <s:if test='%{(applicationNo !=null && applicationNo.length() > 0) && (commodityId[0]!=null && !"".equals(commodityId[0])) && !((quoteStatus=="RA" ||(endTypeId!=null && endTypeId.length() > 0)))}'>
							         <button type="button" class="btn btn-warning" id="commdelete"  onclick="comdelete('commodityId_0')">Delete</button>
							         </s:if>
							          <button type="button" class="btn btn-success" data-dismiss="modal" onclick="assignVal('commodity','commodityDesc_0')">Submit</button>
							        </div>
							     </div>
							</div>
						</div>
				 	</div>
				 	
				 	<%-- <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				 		<div class="text">
				 			<s:text name="quotation.totalCommodity" />
				 		</div>
				 		<div class="tbox">
				 			<s:textfield name="totalCommodity"  id="totalCommodity" cssClass="inputBox tooltipContent" data-content="" disabled="#disable" readonly="true"/>
				 		</div>	
				 	</div> --%>
				 	<s:hidden name="totalCommodity" id="totalCommodity"/>
				 	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				 		<div class="text">
				 			<s:text name="quotation.totalSI" />
				 		</div>
				 		<div class="tbox">
				 			<s:textfield name="totalSI" id="totalSI" cssClass="inputBox tooltipContent" data-content="" disabled="#disable" readonly="true" maxlength="20"/>
				 		</div>	
				 	</div>
				</div>
			 	<div class="row">
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				 		<div class="text">
				 			<s:text name="quotation.saleTerms" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
				 			<s:select name="saleTerm" list="saleTermList" headerKey="" headerValue="---Select---" listKey="CODE" listValue="CODEDESC" cssClass="inputBoxS tooltipContent" data-content="Sale Term" disabled="#disable" onchange="getList('?saleTerm='+this.value,'percentList');getList('?saleTermPercent='+this.value,'toleranceList');"/>
				 		</div>	
				 	</div>
				 	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				 		<div class="text">
				 			<s:text name="quotation.percentage"/><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
				 			<s:if test="%{productId==openCover}" >
								<div id="percentList"><s:select name="saleTermPercent" list="percentList" headerKey="" headerValue="---Select---" listKey="CODE" listValue="CODEDESC" cssClass="inputBoxS tooltipContent" data-content="Percentage" disabled="#disable"  onchange="getList('?saleTermPercent='+this.value,'toleranceList');"/></div>
							</s:if>	
							<s:else>                                
								<div id="percentList"><s:select name="saleTermPercent" id="percent" list="percentList" headerKey="" headerValue="---Select---" listKey="CODE" listValue="CODEDESC" cssClass="inputBoxS tooltipContent" data-content="Percentage" disabled="%{saleTerm=='205' || #disable}"  onchange="getList('?saleTermPercent='+this.value,'toleranceList');"/></div>                                
							</s:else><s:hidden name="saleTermDecVal"/>
				 		</div>	
				 	</div>
				 	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				 		<div class="text">
				 			<s:text name="quotation.tolerance" />
				 		</div>
				 		<div class="tbox">
				 			<div id="toleranceList"><s:select name="tolerance" list="toleranceList" listKey="CODE" listValue="CODEDESC" cssClass="inputBoxS tooltipContent" data-content="Tolerance" disabled="#disable" value='tolerance==null?getText("quotation.toleranceDecVal"):tolerance'/></div>
				 		</div>	
				 	</div>
				</div>
				<s:if test="%{productId==openCover}" >
				 	<div class="row">
					 	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
					 		<div class="text">
					 			<s:text name="quotation.partialShipment" />
					 		</div>
					 		<div class="tbox">
					 			<s:select list="#{'N':'None','Y':'Partial','M':'Multiple'}" cssClass="inputBoxS tooltipContent" data-content="" name="partialShipment"  value='%{partialShipment==null?"N":partialShipment}' disabled="#disable2" onchange="if(this.value=='N'){this.form.shipmentExposure.value='';this.form.exposureCurrency.value='';this.form.exposureValue.value='';this.form.shipmentExposure.disabled=true;this.form.exposureCurrency.disabled=true;this.form.exposureValue.disabled=true;}else{this.form.shipmentExposure.disabled=false;this.form.exposureCurrency.disabled=false;this.form.exposureValue.disabled=false;}"/>
					 		</div>	
					 	</div>
					 	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
					 		<div class="text">
					 			<s:text name="quotation.exposureOfShipment" /><font color="red">*</font>
					 		</div>
					 		<div class="tbox">
					 			<s:textfield name="shipmentExposure" id="shipmentExposure" cssClass="inputBox tooltipContent" data-content="Shipment Exposure" disabled='%{#disable2==false?(partialShipment==null || partialShipment=="N"):#disable2}' maxlength="20"/>
					 		</div>	
					 	</div>
					 	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
					 		<div class="text">
					 			<s:text name="quotation.currencyOfExposure" /><font color="red">*</font>
					 		</div>
					 		<div class="tbox">
					 			<s:select name="exposureCurrency" id="exposureCurrency" list="#ecurrencyList" headerKey="" headerValue="---Select---" listKey="CODE" listValue="CODEDESC" cssClass="inputBoxS tooltipContent" data-content="Exposure Currency" cssStyle="width:80%;float:left;" onchange="exchageRate(this,'exposureCurrency')" disabled='%{#disable2==false?(partialShipment==null || partialShipment=="N"):#disable2}'/><s:textfield id="exposureValue" name="exposureValue" cssStyle="width:20%;float:left;" cssClass="inputBox tooltipContent" data-content="" size="5" readonly="true" disabled='%{#disable2==false?(partialShipment==null || partialShipment=="N"):#disable2}' maxlength="20"/>
		                           <s:iterator value="#ecurrencyList" var="currencyDetail">
		                           <s:hidden name="%{#currencyDetail.CODE}" id="%{#currencyDetail.CODE}" value="%{#currencyDetail.CODEVALUE}"/>
		                           </s:iterator>
					 		</div>	
					 	</div>
					</div>
				</s:if>
			 	<%-- <div class="row">
				 	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				 		<div class="text">
				 			<s:text name="quotation.packageDesc" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
				 			<div id="packageList"><s:select name="packageCode" list="packageList" headerKey="" headerValue="---Select---" listKey="CODE" listValue="CODEDESC" cssClass="inputBoxS tooltipContent" data-content="Package Discription"   disabled="#disable2" /></div>
				 		</div>	
				 	</div>
				</div>
				<br class="clear"/> --%>
				<s:hidden name="consigneeDetail" value=""/>
                <s:hidden name="addCustomerName" value=""/>	 
			 	<div class="row">
			 			<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				 		<div class="text">
				 			<s:text name="quotation.packageDesc" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
				 			<div id="packageList"><s:select name="packageCode" list="packageList" headerKey="" headerValue="---Select---" listKey="CODE" listValue="CODEDESC" cssClass="inputBoxS tooltipContent" data-content="Package Discription"   disabled="#disable2" /></div>
				 		</div>	
				 	</div>			 		
					 	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
					 		<div class="text">
					 			<s:text name="quotation.settlingAgent" />
					 		</div>
					 		<div class="tbox">
					 			<s:if test='settlingAgent!=null && "0".equals(settlingAgent) && !("admin".equalsIgnoreCase(#session.usertype) || "RSAIssuer".equalsIgnoreCase(#session.usertype)) && "RA".equalsIgnoreCase(quoteStatus)'>
					 			<div id="agentList">
		                     			<s:select name="settlingAgent" id="settlingAgent" list="agentList"  listKey="CODE" listValue="CODEDESC" cssClass="inputBoxS tooltipContent" data-content=""  onchange="disableOthers(this);" disabled="true" />
		                     	</div>
		                     		</s:if>
		                     		<s:else>
		                     		<div id="agentList">
		                     			<s:select name="settlingAgent" id="settlingAgent" list="agentList"  listKey="CODE" listValue="CODEDESC" cssClass="inputBoxS tooltipContent" data-content=""  onchange="disableOthers(this);" disabled="#disable2" />
		                     			</div>
		                     		</s:else>
					 		</div>	
					 	</div>
					 	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
					 		<div class="text">
					 			<s:text name="quotation.agentOthers" />
					 		</div>
					 		<div class="tbox">
					 			<div class="inputAppend" style="height: 50px;border:0;"> 
					 			<s:if test='settlingAgent!=null && "0".equals(settlingAgent) && !("admin".equalsIgnoreCase(#session.usertype) || "RSAIssuer".equalsIgnoreCase(#session.usertype)) && "RA".equalsIgnoreCase(quoteStatus)'>
		                          		<s:textarea name="agentOthers" id="agentOthers" cssClass="inputBox" disabled="true" maxlength="60"/>
		                          	</s:if>
		                          	<s:else>
		                          		<s:textarea name="agentOthers" id="agentOthers" cssClass="inputBox"  disabled="#disable2" maxlength="1000"/>
		                          	</s:else>
		                          	</div>
					 		</div>	
					 	</div>
					 	<%-- <s:if test="%{productId!=openCover}" >
					 	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
					 		<div class="text">
					 			<s:text name="quotation.partialShipment" />
					 		</div>
					 		<div class="tbox">
					 			<s:radio list="#{'Y':'Yes','N':'No'}" name="partialShipment"  value='%{partialShipment==null?"N":partialShipment}' disabled="#disable2"/>
					 		</div>	
					 	</div>
				 	</s:if> --%>
				 	<%-- <s:if test='(specialTerm!=null && !"".equals(specialTerm)) || ("admin".equalsIgnoreCase(#session.usertype)||"RSAIssuer".equalsIgnoreCase(#session.usertype))'>       
					 	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
					 		<div class="text">
					 			<s:text name="Special Term & Condition" />
					 		</div>
					 		<div class="tbox">
					 			<div class="inputAppend" style="height: 50px;"> 
					 				<s:textarea name="specialTerm" cssClass="inputBox1" onkeyup="textLimit(this,1000)" cssStyle="border: none;background: transparent; height : 50px;width:100%;" disabled='%{(("admin".equalsIgnoreCase(#session.usertype)||"RSAIssuer".equalsIgnoreCase(#session.usertype)))?"false":"true"}'/>
					 			</div>
					 		</div>	
					 	</div>	
					 	</s:if> --%>
				</div>
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				 		<div class="text">
				 			<s:text name="quotation.vesselName" />
				 		</div>
				 		<div class="input-group">
				 		<s:textfield name="vesselName" id="vesselName" cssClass="inputBox tooltipContent" style="text-transform:uppercase"  disabled="#disable3" maxlength="100" onkeyup="this.value = this.value.toUpperCase();" />
									<s:hidden name="vesselId" id="vesselId"/>
	                         		<s:hidden name="vesselDeclareYN" id="vesselDeclareYN" value="N"/>						   
	                         	 <span class="input-group-addon" >
			                	<button type="button" onclick="return callvessel()">
			                	<span class="glyphicon glyphicon-list"></span>
			                	</button>
			                </span>
						  </div>
				 	</div>
				 	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				 		<div class="text">
				 			<s:text name="quotation.surveyagent" />
				 		</div>
				 		<div class="input-group">
				 			
				 			
				 			<s:if test='surveyagentid!=null && "0".equals(surveyagentid) && !("admin".equalsIgnoreCase(#session.usertype) || "RSAIssuer".equalsIgnoreCase(#session.usertype)) && "RA".equalsIgnoreCase(quoteStatus)'>
					 			<div id="surveyagentList">
		                     			<s:select name="surveyagentid" id="surveyagentid" list="surveyagentList"  listKey="CODE" listValue="CODEDESC" cssClass="inputBoxS tooltipContent" data-content=""  onchange="disableOthers(this);" disabled="true" />
		                     	</div>
		                     		</s:if>
		                     		<s:else>
		                     		<div id="surveyagentList">
		                     			<s:select name="surveyagentid" id="surveyagentid" list="surveyagentList"  listKey="CODE" listValue="CODEDESC" cssClass="inputBoxS tooltipContent" data-content=""  onchange="disableOthers(this);" disabled="#disable2" />
		                     			</div>
		                     		</s:else>
				 		</div>
				 	</div>
				 </div>
			 	<%-- <div class="row">
			 			<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4" id="vesselDivId">
					 		<div class="text">
					 			<s:text name="Do you want Declare Vessel details ?" />
					 		</div>
					 		<div class="tbox">
					 			<s:radio list="#{'Y':'Yes','N':'No'}" name="vesselDeclareYN"  value='%{vesselDeclareYN==null?"N":vesselDeclareYN}' disabled="#disable2" onchange="getVehicleDec(this.value,'');"/>
					 		</div>	
					 	</div>
					 	<s:hidden name="vesselId" id="vesselId"/>
					 	<s:hidden name="vesselName" id="vesselName"/>
				</div> --%>
			 </div>
		</div>
		<%-- <div class="panel panel-primary" id="vesselDecId" style="display: none">
			<div class="panel-heading">
			<s:text name="Vessel Details" />
			</div>
			<div class="panel-body" >
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				 		<div class="text">
				 			<s:text name="Search By" />
				 		</div>
				 		<div class="tbox">
				 			<s:select list="#{'imo':'IMO Number','name':'Name','exname':'ExName'}" name="vesselSearchBy" value='%{vesselSearchBy==null?"imo":vesselSearchBy}' headerKey="" headerValue="---Select---"  cssClass="inputBoxS tooltipContent" data-content="" onchange="vesselType(this.value);" disabled="#disable2" />
				 			<b id="vesselSearchByerror" style="color:red"></b><br/>
				 		</div>	
				 	</div>
				 	<div id="imoInfo" style="display:none;">
				 	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				 		<div class="text">
				 			<s:text name="IMO Number" />
				 		</div>
				 		<div class="tbox">
				 			<s:textfield name="iHSLRORIMO" id="iHSLRORIMO" cssClass="inputBox tooltipContent" data-content="" disabled="#disable" maxlength="100"/>
				 			<b id="iHSLRORIMOerror" style="color:red"></b><br/>
				 		</div>	
				 	</div>
				 	</div>
				 	<div id="bynameInfo" style="display:none;">
				 	<s:hidden name="	" id="shipsCategory" value="CoreShipsOnly" />
				 	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				 		<div class="text">
				 			<s:text name="Ship Name" />
				 		</div>
				 		<div class="tbox">
				 			<s:textfield name="nameString" id="nameString" cssClass="inputBox tooltipContent" data-content="" disabled="#disable" maxlength="100"/>
				 			<b id="shipnameerror" style="color:red"></b><br/>
				 		</div>	
				 	</div>
				 	</div>
				 	<div id="byexnameInfo" style="display:none;">
					<s:hidden name="exshipsCategory" id="exshipsCategory" value="CoreShipsOnly" />
				 	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				 		<div class="text">
				 			<s:text name="Ship Ex Name" />
				 		</div>
				 		<div class="tbox">
				 			<s:textfield name="exNameString" id="exNameString" cssClass="inputBox tooltipContent" data-content="" disabled="#disable" maxlength="100"/>
				 			<b id="shipexnameerror" style="color:red"></b><br/>
				 		</div>	
				 	</div>
				 	</div>
				 	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center" style="padding-top: 10px;">
				 	<button type="button"  value="Submit"  class="btn btn-sm btn-success" onclick="vesselSearch('vesselLists');" ><s:text name="Search"/></button>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<div id="wait" align="center"  style="display:none"><img src='<%=request.getContextPath()%>/images/ajax-loader-bar.gif' width="64" height="64" /><br>Loading..</div>
						<div id="vesselLists"></div>	
					</div>
				</div>
				<div class="row" id="marineship" >
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<table class="table table-striped table-bordered dt-responsive nowrap" id="record" width="100%" cellspacing="0">
				       <thead>
				         <tr style="color:#000000;">
				           <th>SNo</th>
				           <th>IMO Number</th>
				           <th>Ship Name</th>
				           <th>Ship Status</th>
				           <th>Sanction</th>
				           <th>View </th>
				           
				         </tr>
				       </thead>
				       <tbody id="tbl_posts_body">
				       <s:iterator value="marineShipInfo" status="cnt" var="var">
				         <tr>
				           <td><span class="sn"><s:property value="%{#cnt.count}"/></span>.</td>
				           <td><s:property value="%{#var.IMO_NUMBER}"/></td>
				           <td><s:property value="%{#var.SHIP_NAME}"/></td>
				            <td><s:property value="%{#var.SHIP_STATUS}"/></td>
				            <td><s:property value="%{#var.LEGAL_OVERALL}"/></td> 
				            <td><input type="button" value="View" class="btn btn-sm btn-primary btn-width" onclick="return view('vesselView','<s:property value="%{#var.IMO_NUMBER}"/>')"/></td>
				         </tr>
				       </s:iterator>								          
				         
				       </tbody>
				    </table>
				</div>
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<div id="vesselView"></div>	
					</div>
				</div>
		</div>
		<br class="clear" />
		</div>
		</div> --%>
		<div class="panel panel-primary">
			<div class="panel-heading">
				 <div id="plus" onclick="quotationDetail(true);" style="display: none; cursor: pointer;">+&nbsp;&nbsp;<s:text name="LC Bank Details" /></div> 
                 <div id="miuns" onclick="quotationDetail(false);" style="display: block; cursor: pointer;">-&nbsp;&nbsp;<s:text name="LC Bank Details" /></div>				
			</div>
			<div class="panel-body" id="quoteInfo" style="display:;">
				<div class="row">
					<s:set var="lcBankListVar" value="lcBankList"/>
					<s:if test="%{productId==openCover}" >
						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
					 		<div class="text">
					 			<s:text name="quotation.lcBank" />
					 		</div>
					 		<div class="tbox">
					 			<s:if test='lcBankListVar!=null && lcBankListVar.size==1'>
		                      			<s:select name="lcBank" list="lcBankListVar" listKey="CODE" listValue="CODEDESC" cssClass="inputBoxS tooltipContent" data-content="LC Bank"   disabled="%{#disable2==false?(quoteStatus=='RA'):#disable2}"/>
		                      		</s:if>
		                      		<s:else>
		                      			<s:select name="lcBank" list="lcBankListVar" headerKey=""  headerValue="---Select---" listKey="CODE" listValue="CODEDESC" cssClass="inputBoxS tooltipContent" data-content="LC Bank"   disabled="%{#disable2==false?(quoteStatus=='RA'):#disable2}"/>
		                      		</s:else>
					 		</div>	
					 	</div>
				 	</s:if>
				 	<s:else>
					 	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
					 		<div class="text">
					 			<s:text name="quotation.lcBank" />
					 		</div>
					 		<div class="tbox">
					 			<s:select name="lcBank" id="lcBank" list="lcBankListVar" headerKey="" headerValue="---Select---" listKey="CODE" listValue="CODEDESC" cssClass="inputBoxS tooltipContent" data-content="Lc Bank"  disabled="%{#disable2==false?(quoteStatus=='RA'):#disable2}"/>
					 		</div>	
					 	</div>
				 	</s:else>
				 	<s:if test="%{productId==openCover}" > 
					 	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
					 		<div class="text">
					 			<s:text name="quotation.lcNo" />
					 		</div>
					 		<div class="tbox">
					 			<s:textfield name="lcNo" cssClass="inputBox tooltipContent" data-content="Lc No" maxlength="30" disabled="#disable2"/>
					 		</div>	
					 	</div>
				 	</s:if>
				 	<s:else>
					 	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
					 		<div class="text">
					 			<s:text name="quotation.lcNo" />
					 		</div>
					 		<div class="tbox">
					 			<s:textfield name="lcNo" cssClass="inputBox tooltipContent" data-content="LC No." maxlength="30" disabled="#disable2"/>
					 		</div>	
					 	</div>
				 	</s:else>
				 	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				 		<div class="text">
				 			<s:text name="quotation.lcDate" />
				 		</div>
				 		<div class="tbox">
				 			<s:textfield id="lcDate" name="lcDate" cssClass="inputBox datepicker inputBox tooltipContent" data-content="LC Date" readonly="true" disabled="#disable" />
				 		</div>	
				 	</div>
				</div>
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				 		<div class="text">
				 			<s:text name="quotation.blNo" />
				 		</div>
				 		<div class="tbox">
				 			<s:textfield name="blNo" cssClass="inputBox tooltipContent" data-content=""  maxlength="25" disabled="#disable2"/>
				 		</div>	
				 	</div>
				 	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				 		<div class="text">
				 			<s:text name="quotation.blDate" />
				 		</div>
				 		<div class="tbox">
				 			<s:textfield id="blDate" name="blDate" cssClass="inputBox datepicker" readonly="true" disabled="#disable" />
				 		</div>	
				 	</div>
				 	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				 		<div class="text">
				 			<s:text name="quotation.sailingDate" />
				 		</div>
				 		<div class="tbox">
				 			<s:textfield id="sailingDate" name="sailingDate" cssClass="inputBox datepicker" readonly="true" disabled="#disable" />
				 		</div>	
				 	</div>
				</div>
				<div class="row" id="promotionalList">
					<s:if test='%{(promotionalCode!=null && !"".equals(promotionalCode)) || dubaiTradeStatus}'>
					 	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4" >
					 		<div class="text">
					 			<s:text name="Promotional Code" />
					 		</div>
					 		<div class="tbox">
					 			<s:textfield name="promotionalCode" cssClass="inputBox tooltipContent" data-content=""  maxlength="25" disabled="#disable2"/>
					 		</div>	
					 	</div>
				 	</s:if>
				 	<s:else><s:hidden name="promotionalCode" value=""/></s:else>
				</div>
			 	<div class="row">
					<!--<s:if test="brokerType == brokerOne">
					 	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
					 		<div class="text">
					 			<s:text name="quotation.custContractNo" /><s:if test="%{productId==openCover}" ><font color="red">*</font></s:if>
					 		</div>
					 		<div class="tbox">
					 			<s:textfield name="custContractNo" cssClass="inputBox tooltipContent" data-content="Custome Contact No."  disabled="#disable2"/>
					 		</div>	
					 	</div>
					 	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
					 		<div class="text">
					 			<s:text name="quotation.custFmsCaseNo" /><s:if test="%{productId==openCover}" ><font color="red">*</font></s:if>
					 		</div>
					 		<div class="tbox">
					 			<s:textfield name="custFmsCaseNo" cssClass="inputBox tooltipContent" data-content="Customer FMS Case No"  disabled="#disable2"/>
					 		</div>	
					 	</div>
					 	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
					 		<div class="text">
					 			<s:text name="quotation.custRefNo" /><s:if test="%{productId==openCover}" ><font color="red">*</font></s:if>
					 		</div>
					 		<div class="tbox">
					 			<s:textfield name="custRefNo" cssClass="inputBox tooltipContent" data-content="Customer Reference no."  disabled="#disable2"/>
					 		</div>	
					 	</div>
				 	</s:if>-->
				 	<s:hidden name="brokerType"></s:hidden>
				</div>
			</div>
		</div>
	</div>
</div>



  <!-- Customer -->
  <div id="customerSelectionModal" class="modal" role="dialog">
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
  
  <div id="originationCityModal" class="modal" role="dialog">
		  <div class="modal-dialog modal-lg">
		    <!-- Modal content-->
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        	<div class="modal-title">
					<div class="row">
	       				<div class="col-md-12 col-xs-12">
				         	<h3><s:text name="City Of Origin Country" /></h3>
				         </div>
	    			</div>
				</div>
		      </div>
		      <div class="modal-body" >
		        <div class="container-fluid" id="originationCityAjaxId">
		        </div>
		      </div>
		    </div>
		  </div>
		</div>
		<div id="destinationCityModal" class="modal" role="dialog">
		  <div class="modal-dialog modal-lg">
		    <!-- Modal content-->
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        	<div class="modal-title">
					<div class="row">
	       				<div class="col-md-12 col-xs-12">
				         	<h3><s:text name="City Of Destination Country" /></h3>
				         </div>
	    			</div>
				</div>
		      </div>
		      <div class="modal-body" >
		        <div class="container-fluid" id="destinationCityAjaxId">
		        </div>
		      </div>
		    </div>
		  </div>
		</div>


<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
		<s:if test="%{endTypeId!=null && endTypeId.length() > 0}">
		<s:if test='%{!"admin".equalsIgnoreCase(#session.user1)}'>
			<s:submit type="button" name="close"  key="Back" cssClass="btn btn-sm btn-danger" onclick="forward('initReport.action?menuType=ET')"/>&nbsp;&nbsp;&nbsp;
		</s:if>
		</s:if>
			<s:submit name="SubmitGetQuote" id="SubmitGetQuote" type="button" cssClass="btn btn-sm btn-success" value="Get Quote"  onclick="return getquote(this.form);"/>
		&nbsp;&nbsp;&nbsp;
		<s:hidden name="refNo" />
		<s:if test='referenceNo!=null && !"".equalsIgnoreCase(referenceNo)'>
			<s:hidden name="referenceNo" />
		</s:if>
		<s:if test='quoteNo!=null && !"".equalsIgnoreCase(quoteNo)'>
			<s:hidden name="quoteNo" />
		</s:if>
		<s:hidden name="openCoverNo"/>
		<s:hidden name="loginId" />	                            
		<s:hidden name="quoteStatus" />
		<s:hidden name="endTypeId" />
		<s:hidden name="policyNo"/> 
		<s:hidden name="custName"/>
		<s:hidden name="brokerCompany"/>
		<s:hidden name="searchFrom" />
		<s:hidden name="searchBy" />
		<s:hidden name="searchValue" />
		<s:hidden name="finalizeYN" />
		<s:hidden name="editClausesYN" />
		<s:if test='applicationNo!=null && !"".equalsIgnoreCase(applicationNo)'>
			<s:hidden name="applicationNo" />
		</s:if>
		<s:hidden name="imoNumber" />
		<s:hidden name="newSearch" />
		<s:hidden name="rateChange" value="N"/>
			<s:submit name="Submit2" type="submit" cssClass="btn btn-sm btn-danger" value="Cancel" onclick="callAction('%{quoteStatus}','%{#session.user1}');" />
		<s:if test='%{"admin".equalsIgnoreCase(#session.user1) || "Admin".equals(#session.user1)}'>
		<s:hidden name="executive"/>
		</s:if>
	</div>
</div>
<s:token/>


<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Modal Header</h4>
      </div>
      <div class="modal-body">
        <p>Some text in the modal.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
</s:form>
<script type="text/javascript">

$(function () {
    var isIE = window.ActiveXObject || "ActiveXObject" in window;
    if (isIE) {
        $('.modal').removeClass('fade');
    }
});

function getquote(frm) { 
	disableForm(frm,false,'');
	document.getElementById('SubmitGetQuote').disabled=true;
	document.quotation.action = '<%=request.getContextPath()%>/getQuoteQuotation.action';
	document.quotation.submit();
}

function validNumber(val){
	var value=val.value;
	if(value!=null){
		val.value = value.replace(/[^,0-9]/g,'');
	}
}

function disableSubmitGetQuote(){
	document.getElementById('SubmitGetQuote').disabled=true;
}


if(document.quotation.endTypeId.value!=''&&document.quotation.finalizeYN.value!='Y'){
	enableForm(document.quotation,false,'<s:property value="%{fields}"/>');
}
setBasisVal(document.quotation.saleTerm, 'percentList');

function setBasisVal(obj, id) {
	 var flag=true;
	 var value=obj.options[obj.selectedIndex].innerText;
	 if(value=='<s:text name="quotation.declaredValue"/>'){
	 	document.quotation.tolerance.disabled=true;
	 	document.quotation.saleTermPercent.disabled=true;
	 	document.quotation.saleTermDecVal.value=document.quotation.saleTerm.value;
	 	document.getElementById(id).disabled=true;
	 	document.quotation.saleTermPercent.value='';
	 	document.quotation.tolerance.value='<s:text name="quotation.toleranceDecVal"/>';
	 	flag=false;
	 }else{
	 	if('RA'!='<s:property value="%{quoteStatus}"/>' && document.quotation.endTypeId.value==''){
		 	document.quotation.tolerance.disabled=false;
		 	document.getElementById(id).disabled=false;
	 	}
	 	document.quotation.saleTermDecVal.value='';
	 }
	 return flag;
}

function getList(val, id) {
	//var strutsToken = "<s:property value="#session['struts.tokens.token']" />";
	//+'&struts.token.name=token&token='+strutsToken
 	if(id=='percentList'){
 		if(setBasisVal(document.quotation.saleTerm, id)){
 			postRequest('<%=request.getContextPath()%>/'+id+'Quotation.action'+val, id);
 		}
 	}else{
 		postRequest('<%=request.getContextPath()%>/'+id+'Quotation.action'+val, id);
 	}
}

function commoditySelection(){
      var URL ='<%=request.getContextPath()%>/commodityListQuotation.action?applicationNo='+document.quotation.applicationNo.value+'&quoteStatus='+document.quotation.quoteStatus.value+'&refNo='+document.quotation.refNo.value+'&endTypeId='+document.quotation.endTypeId.value+'&brokerCode='+document.quotation.brokerCode.value+'&finalizeYN='+document.quotation.finalizeYN.value;  
     return viewPopUp(URL);
}

function optionsSelection(option) {
    var URL ='<%=request.getContextPath()%>/optionsListQuotation.action?option='+option;
	return viewPopUp(URL);
}
function coreCustomerSearch() {
     var URL ='<%=request.getContextPath()%>/coreCustomerSearchQuotation.action';
	 return viewPopUp(URL);
}

function customerSelectionAction() {	
	var brokerCode='';
	var channelType = "";	
	if(document.quotation.brokerCode){			
		brokerCode=document.quotation.brokerCode.value;		
	}
	if(document.quotation.channelType) {
		channelType=document.quotation.channelType.value;
	}	
     var URL ="<%=request.getContextPath()%>/customerSelectionQuotation.action?brokerCode="+brokerCode+"&channelType="+channelType+"&searchType=CUSTOMER";
    // postRequest(URL, 'customerSelectionAjaxId');
     return viewPopUp(URL);
}
function customerSelectionAction1() {	
	var brokerCode='';
	var channelType = "";	
	if(document.quotation.brokerCode){			
		brokerCode=document.quotation.brokerCode.value;		
	}
	if(document.quotation.channelType) {
		channelType=document.quotation.channelType.value;
	}	
     var URL ="<%=request.getContextPath()%>/customerSelectionQuotation.action?brokerCode="+brokerCode+"&channelType="+channelType+"&searchType=CUSTOMER";
    postRequest(URL, 'customerSelectionAjaxId');
}
function lcSelectionAction() {
     var URL ='<%=request.getContextPath()%>/lcSelectionQuotation.action';
     return popUp(URL,'700','500');
}
if(document.getElementById("modeOfTransport").value=='<s:text name="LAND_TRANSIT"/>') {
	document.getElementsByName("originWarehouse")[0].checked=true;   
	document.getElementsByName("destWarehouse")[0].checked=true;  
	document.getElementsByName("originWarehouse")[1].disabled=true;   
	document.getElementsByName("destWarehouse")[1].disabled=true;
	//document.getElementById("originCityName").disabled=true;   
	//document.getElementById("originCityBtn").disabled=true;   
	//document.getElementById("destCityName").disabled=true;   
	//document.getElementById("destCityBtn").disabled=true;  
}
//exchageRate(document.getElementById("currency"),"currency");
<s:if test='!("admin".equalsIgnoreCase(#session.usertype) || "RSAIssuer".equalsIgnoreCase(#session.usertype))'>
 document.getElementById("exchageValue").disabled = true;
</s:if>
if(document.getElementById("lccurrency")){
	exchageRate(document.getElementById("lccurrency"),"lccurrency");
}
function exchageRate(obj,colnType){
	if(obj.value!=''){
	    var selected=document.getElementById(obj.value);
		with(selected){
			if(colnType=="currency"){
				document.getElementById("exchageValue").value=value;
				<s:if test='("admin".equalsIgnoreCase(#session.usertype) || "RSAIssuer".equalsIgnoreCase(#session.usertype))'>
					if("1"==obj.value)
				 	document.getElementById("exchageValue").disabled = true;
				 else
				 	document.getElementById("exchageValue").disabled = false;
				</s:if>	
				<s:else>
				 document.getElementById("exchageValue").disabled = true;
				</s:else>
				 							 						
			}else if(colnType=="exposureCurrency"){
				document.getElementById("exposureValue").value=value;
			}else{
				document.getElementById("lcexchageValue").value=value;
			}
		}
	}else{
		if(colnType=="currency"){
			document.getElementById("exchageValue").value='';
		}else if(colnType=="exposureCurrency"){
			document.getElementById("exposureValue").value=value;
		}else{
			document.getElementById("lcexchageValue").value='';
	 	}		
	}
}
function disableWarehouse(obj){
	var modeOfTrans=obj.value
	if(modeOfTrans=='<s:text name="LAND_TRANSIT"/>'){		 
		document.getElementsByName("originWarehouse")[0].checked=true;   
		document.getElementsByName("destWarehouse")[0].checked=true;  
		document.getElementsByName("originWarehouse")[1].disabled=true;   
		document.getElementsByName("destWarehouse")[1].disabled=true;
		//document.getElementById("originCityName").disabled=true;   
		//document.getElementById("originCityBtn").disabled=true;   
		//document.getElementById("destCityName").disabled=true;   
		//document.getElementById("destCityBtn").disabled=true;  
    } else {                    
   	 	document.getElementsByName("originWarehouse")[1].checked=true;   
		document.getElementsByName("destWarehouse")[1].checked=true;  
		document.getElementsByName("originWarehouse")[1].disabled=false;   
		document.getElementsByName("destWarehouse")[1].disabled=false; 
		//document.getElementById("originCityName").disabled=false;   
		//document.getElementById("originCityBtn").disabled=false;   
		//document.getElementById("destCityName").disabled=false;   
		//document.getElementById("destCityBtn").disabled=false;
		document.getElementById("destCity").value="";	
		document.getElementById("destCityName").value="";
		document.getElementById("originCity").value="";
		document.getElementById("originCityName").value="";
    }   
}
toggleWarSrcc(document.getElementById("modeOfTransport"))
function toggleWarSrcc(obj) {
	<s:if test='#ewarOption=="Y"'>
	var modeOfTrans=obj.value;
	if(modeOfTrans=='3') {		 
	    document.getElementById("warSrccId").innerHTML='<s:text name="quotation.Srcc"/>'
    } else {                    
		document.getElementById("warSrccId").innerHTML='<s:text name="quotation.warSrcc"/>'    
    }
    </s:if>
}
disableOthers(document.getElementById("settlingAgent"));

function disableOthers(obj) {
	var value=obj.value;	
	if(value=='<s:text name="quotation.others.value"/>') {	
	    //document.getElementById("agentOthers").value="SBI COOPERATIVE INSURANCE COMPANY";	
		document.getElementById("agentOthers").readOnly=false;
	} else {	
		document.getElementById("agentOthers").value="";
		document.getElementById("agentOthers").readOnly=true;		
	}		
}

function emptyCity(obj) {		
	if(obj=='<s:text name="quotation.dest"/>') {
		document.getElementById("destCity").value="";	
		document.getElementById("destCityName").value="";	
	} else {
		document.getElementById("originCity").value="";
		document.getElementById("originCityName").value="";
	} 
}

function originCitySelectionAction() {	
	var countryId=document.getElementById("originCountry").value;	
	var URL ='<%=request.getContextPath()%>/countryCityListQuotation.action?originCountry='+countryId+'&countrySelect=O';
	  postRequest(URL, 'originationCityAjaxId');
	//return viewPopUp(URL);	
}

function destCitySelectionAction() {	
	var countryId=document.getElementById("destCountry").value;
	var URL ='<%=request.getContextPath()%>/countryCityListQuotation.action?destCountry='+countryId+'&countrySelect=D';
	 postRequest(URL, 'destinationCityAjaxId');
	//return viewPopUp(URL);	
}

function callvessel() {
	var URL ='<%=request.getContextPath()%>/vesselQuotation.action';
	return viewPopUp(URL);	
}	
function emptyCustInfo(){
	var s="poBox&mobileNo&email&title&customerName&customerNameAr&coreAppCode&address2&address1&city"; 
	var stringToArray = new Array;
	stringToArray = s.split("&");
	for ( var int = 0; int < stringToArray.length; int++) {		
			var obj=stringToArray[int]
			document.getElementById(""+obj).value="";
	}
}
function custInfoDisable(channelType) {
	var issuer = '<s:property value="issuer"/>';
	var s="poBox&mobileNo&email&title&coreAppCode&address2&address1&city";
	var stringToArray = new Array;
	stringToArray = s.split("&"); 
	if(issuer!=null && issuer!="" && channelType=="customer") {
		for ( var int = 0; int < stringToArray.length; int++) {
			var obj=stringToArray[int]
			document.getElementById(""+obj).disabled=true;
		}
	}
	else {
		for ( var int = 0; int < stringToArray.length; int++) {
			var obj=stringToArray[int]
			document.getElementById(""+obj).disabled=false;
		}
	}
}
function setVesselName() {
	document.getElementById('vesselName').value = "";
	document.getElementById('vesselId').value = "";
}
function callAction(status, userType) {
	if(userType=='admin' || userType=='Admin'){
		if(status=='RU'){
			document.quotation.action='<%=request.getContextPath()%>/getOCAjaxReferal.action?index=0';
		}else if(status=='RA'){
			document.quotation.action='<%=request.getContextPath()%>/getOCAjaxReferal.action?index=1';
		}else if(status=='RR'){
			document.quotation.action='<%=request.getContextPath()%>/getOCAjaxReferal.action?index=2';
		}
	}else{
		document.quotation.action='<%=request.getContextPath()%>/initReport.action?menuType=QE';
	}
	document.quotation.submit();
}
function forward(url) {
	document.quotation.action = "<%=request.getContextPath()%>/"+url;
	document.quotation.submit();
}

<s:if test='lcBankListVar!=null && lcBankListVar.size==1'>
         getList('?lcBank=<s:property value="lcBankListVar[0].CODE"/>','lcList');
</s:if>
         
function quotationDetail(val) {
  	if(val){
	  	document.getElementById('quoteInfo').style.display='';
	    document.getElementById('miuns').style.display='';
	    document.getElementById('plus').style.display='none';
    }else{
    	document.getElementById('quoteInfo').style.display='none';
	    document.getElementById('miuns').style.display='none';
	    document.getElementById('plus').style.display='';
    }
}

function textLimit(field, maxlen){
	if (field.value.length > maxlen + 1)
		alert('Maximum Length is '+maxlen);
	if (field.value.length > maxlen)
		field.value = field.value.substring(0, maxlen);
		checkSpecialChars(field);
}
function clearCustomerInfo() {
	var disableStatus = '<s:property value="#disable"/>';
	if(disableStatus!="disabled" && disableStatus!="true") {
		document.getElementById("title").value="";
		document.getElementById("address1").value="";
		document.getElementById("address2").value="";
		document.getElementById("mobileNo").value="";
		document.getElementById("city").value="";
		document.getElementById("poBox").value="";
		document.getElementById("customerName").value="";
		//document.getElementById("customerNameAr").value="";
		document.getElementById("coreAppCode").value="";
		document.getElementById("customerId").value="";
		document.getElementById("email").value="";
		<s:if test='%{productId==openCover && !((quoteStatus=="RA")||(endTypeId!=null && endTypeId.length() > 0))}'>
			document.getElementById("editCustomerYES").checked = true;
			editCustomerInfo();
		</s:if>
	}
}
<s:if test='%{productId==openCover && customerId.equals(#session.customer_id) && !(#disable)}'>
	editCustomerInfo();
</s:if>
function editCustomerInfo() {
	var chk = document.getElementById("editCustomerNO").checked;
	if( chk == true) {
		document.getElementById("title").disabled=true;
		document.getElementById("address1").disabled=true;
		document.getElementById("address2").disabled=true;
		document.getElementById("mobileNo").disabled=true;
		document.getElementById("city").disabled=true;
		document.getElementById("poBox").disabled=true;
		document.getElementById("customerName").disabled=true;
		document.getElementById("email").disabled=true;
		
		document.getElementById("editCustomerDIV").style.display = "";
	} else {
		document.getElementById("title").disabled=false;
		document.getElementById("address1").disabled=false;
		document.getElementById("address2").disabled=false;
		document.getElementById("mobileNo").disabled=false;
		document.getElementById("city").disabled=false;
		document.getElementById("poBox").disabled=false;
		document.getElementById("customerName").disabled=false;
		document.getElementById("email").disabled=false;
		
		document.getElementById("customerId").value="";
		document.getElementById("editCustomerDIV").style.display = "none";
	}
}
function toggleModeOfTransport(obj){
	var modeOfTrans=obj.value;
	if(modeOfTrans=='3'  ){
    	document.quotation.warSrcc.value='NO';
	} else {
	    	document.quotation.warSrcc.value='YES';
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

function numberComma(Num){//Not allow any decimal value
			Num = Num.replace(/[^,0-9,]/g,'');
			  Num += '';
			  
		    Num = Num.replace(/,/g, '');
		    x = Num.split('.');
		    x1 = x[0];
		    x2 = x.length > 1 ? '.' + x[1] : '';
		    var rgx = /(\d+)(\d{3})/;
		    while (rgx.test(x1))
		    x1 = x1.replace(rgx, '$1' + ',' + '$2');
		    return x1 + x2;
		}
function removeComma(object) {
	try {
		replaceComma(document.commoditySelection,'insuredValue');
		document.commoditySelection.submit();
	} catch(err) { console.log(err); }
}

function comdelete(id1){
	document.getElementById(''+id1+'').disabled = false;
	document.getElementById('commdelete').style.display = "none";
	
}
function assignVal(id1,id2){
	document.getElementById(''+id1+'').value = document.getElementById(''+id2+'').value;
	document.getElementById('totalCommodity').value = '1';
	document.getElementById('totalSI').value = document.getElementById('insuredValue_0').value;
}
var imoNumber=document.quotation.iHSLRORIMO.value;
if(imoNumber!=''){
	vesselSearch('vesselLists');
}
function vesselSearch(id) {
 	var searchBy=document.quotation.vesselSearchBy.value;
  	var shipsCategory=document.quotation.shipsCategory.value;
  	var nameString=document.quotation.nameString.value;
  	var exshipsCategory=document.quotation.exshipsCategory.value;
  	var exnameString=document.quotation.exNameString.value;
  	var imoNumber=document.quotation.iHSLRORIMO.value;
  	var imoNumberS=document.quotation.imoNumber.value;
  	document.getElementById('marineship').style.display = "none";
  	var count=0;
 	if(searchBy==null || searchBy=="") {
  		document.getElementById('vesselSearchByerror').innerHTML="Please Select the Search By";
  		count=count+1;
  	}if(searchBy=='imo' && (imoNumber==null || imoNumber=="")) {
  		document.getElementById('iHSLRORIMOerror').innerHTML="Please Enter the IMO Number";
  		count=count+1;
  	}
  /*if(searchBy=='name' && (shipsCategory==null || shipsCategory=="")) {
  		document.getElementById('shipcategoryerror').innerHTML="Please Select the Ship Category";
  		count=count+1;
  	}*/
  	if(searchBy=='name' && (nameString==null || nameString=="")) {
  		document.getElementById('shipnameerror').innerHTML="Please Select the Ship Name";
  		count=count+1;
  	}
  	/*if(searchBy=='exname' && (exshipsCategory==null || exshipsCategory=="")) {
  		document.getElementById('exshipcategoryerror').innerHTML="Please Select the Ship Category";
  		count=count+1;
  	}*/
  	if(searchBy=='exname' && (exnameString==null || exnameString=="")) {
  		document.getElementById('shipexnameerror').innerHTML="Please Enter the Ship Ex Name";
  		count=count+1;
  	}
  	
  	if(count==0){
  		
	 	vesselpostRequest('<%=request.getContextPath()%>/searchListVessel.action?searchBy='+searchBy+'&shipsCategory='+shipsCategory+'&nameString='+nameString+'&exshipsCategory='+exshipsCategory+'&exNameString='+exnameString+'&iHSLRORIMO='+imoNumber+'&imoNumber='+imoNumberS, id);
	 }
}
<s:if test='%{vesselSearchBy=="" || vesselSearchBy==null}'>
vesselType('imo');
</s:if>
<s:else>
vesselType('<s:property value="vesselSearchBy"/>');
</s:else>
function vesselType(val){
	if(val=='imo'){
		document.getElementById('imoInfo').style.display = "block";
		document.getElementById('bynameInfo').style.display = "none";
		document.getElementById('byexnameInfo').style.display = "none";
	}else if(val=='name'){
		document.getElementById('imoInfo').style.display = "none";
		document.getElementById('bynameInfo').style.display = "block";
		document.getElementById('byexnameInfo').style.display = "none";
	}else if(val=='exname'){
		document.getElementById('imoInfo').style.display = "none";
		document.getElementById('bynameInfo').style.display = "none";
		document.getElementById('byexnameInfo').style.display = "block";
	}
}
getVehicleDec('<s:property value="vesselDeclareYN"/>','edit');
function getVehicleDec(val,type){
	var quoteNO;
		<s:if test='quoteNo!=null && !"".equalsIgnoreCase(quoteNo)'>
		quoteNO=document.quotation.quoteNo.value;
		</s:if>
	var imoNumberS=document.quotation.imoNumber.value;
	if(quoteNO==null|| quoteNO==''){
		document.getElementById('marineship').style.display = "none";
	}
	if(val=='Y'){
		document.getElementById('vesselDecId').style.display = "block";
		if(imoNumberS==null || imoNumberS==''){
			document.getElementById('marineship').style.display = "none";
		}
		
	}else {
		document.getElementById('vesselDecId').style.display = "none";
		//document.quotation.shipsCategory.value='';
	  	document.quotation.nameString.value='';
	  	//document.quotation.exshipsCategory.value='';
	  	document.quotation.exNameString.value='';
	  	document.quotation.iHSLRORIMO.value='';
	  	document.quotation.imoNumber.value='';
	}
}
function getImoNumber(obj) { 
	document.quotation.imoNumber.value=obj;
	document.quotation.newSearch.value='new';
}

function vesselpostRequest(strUrl, id){
	$.ajax({
		   url: strUrl,		   
		   error: function() {
		      $('#'+id).html('<p>An error has occurred in jquery Ajax</p>');
		   },		   
		   success: function(data) {			 
		      $('#'+id).html(data);
		   },
		   beforeSend : function(){
			   $('#wait').show();
           },
           complete : function(){
        	   $('#wait').hide();
            },
		   type: 'POST'
	});	
}

function view(id,searchBy) { 
	
	var URL = '<%=request.getContextPath()%>/viewListVessel.action?iHSLRORIMO='+searchBy;
	return viewPopUp(URL);
}
function fnOrgcitySubmit() {  
	try {	
		//var countrySelect=document.citySelection.countrySelect.value; 
		var cityObj, cityNameObj, obj,array;
			array=document.originCitySelection.cityName;
			cityObj=document.quotation.originCity;	
			cityNameObj=document.quotation.originCityName;	
		
		if (array.length > 0) {
			for ( var int = 0; int < array.length; int++) {	  	
				obj=array[int];
				if(obj.checked) {
					cityObj.value=obj.value;
					var regex = /^[a-zA-Z ]{2,30}$/;
					if(obj.title=='Others') {
						if(document.getElementById("otherOriginCity").value==''){
							alert('Please enter city');
							return false;
						}
						cityNameObj.value=document.getElementById("otherOriginCity").value;	
					} else {
						cityNameObj.value=obj.title;
					}
				}
			}
		} else {
			if(document.getElementById("otherOriginCity").value=='') {
				alert('Please enter city');
				return false;
			} else {	
				cityNameObj.value=document.getElementById("otherOriginCity").value;
				cityObj.value="9999";
			}
		}
	} catch(e){alert(e);} 	
	 $("#ocitysum").attr("data-dismiss","modal");
	
}
function fnDestcitySubmit() {  
	try {	
		//var countrySelect=document.citySelection.countrySelect.value; 
		
		var cityObj, cityNameObj, obj,array;
			array=document.destCitySelection.cityName;
			cityObj=document.quotation.destCity;	
			cityNameObj=document.quotation.destCityName;	
		if (array.length > 0) {
			for ( var int = 0; int < array.length; int++) {	  	
				obj=array[int];
				if(obj.checked) {
					cityObj.value=obj.value;
					var regex = /^[a-zA-Z ]{2,30}$/;
					if(obj.title=='Others') {
						if(document.getElementById("otherDestCity").value==''){
							alert('Please enter city');
							return false;
						}
						cityNameObj.value=document.getElementById("otherDestCity").value;	
					} else {
						cityNameObj.value=obj.title;
					}
				}
			}
		} else {
			if(document.getElementById("otherDestCity").value=='') {
				alert('Please enter city');
				return false;
			} else {	
				cityNameObj.value=document.getElementById("otherDestCity").value;
				cityObj.value="9999";
			}
		}
	} catch(e){alert(e);} 	
	 $("#dcitysum").attr("data-dismiss","modal");
}
toggleShipTracking('<s:property value="modeOfTransport"/>')
function toggleShipTracking(obj){
	var modeOfTrans=obj;
	if(modeOfTrans=='1' || modeOfTrans=='5' || modeOfTrans=='7' || modeOfTrans=='9'){
		//document.quotation.veseelDeclareYN.readOnly='true';
		document.getElementById('quotation_vesselDeclareYNY').disabled = false;
		document.getElementById('quotation_vesselDeclareYNN').disabled = false;
		
		//document.getElementById('vesselDivId').style.display ='block'
	}else{
		document.getElementById('quotation_vesselDeclareYNY').disabled = true;
		document.getElementById('quotation_vesselDeclareYNN').disabled = true;
		document.getElementById('quotation_vesselDeclareYNN').checked=true;
		//document.getElementById('vesselDivId').style.display ='none'
		getVehicleDec('N');
	}
}



</script>	
</body>
</html>