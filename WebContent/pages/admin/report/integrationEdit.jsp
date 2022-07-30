<%@ page isELIgnored="false" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>
<!DOCTYPE HTML>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/dataTables/css/dataTables.responsive.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/dataTables/css/dataTables.jqueryui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/dataTables/css/dataTables.tableTools.css">
	<link href="${pageContext.request.contextPath}/dataTables/css/jquery-start-ui.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/dataTables/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/dataTables/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/dataTables/js/dataTables.jqueryui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/dataTables/js/dataTables.responsive.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/dataTables/js/dataTables.tableTools.js"></script>
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script type="text/javascript">
jQuery(function ($) {
	try {
		var data = $('#clauseTable').dataTable( {
//				"lengthMenu": [[-1], ["All"]],
			"lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
			"order": [[ 0, "asc" ]],
			"columnDefs": [ {
	          "targets": 'no-sort',
	          "orderable": false
		    } ],
			responsive: true
		});
	} catch(err){}
} ); 


jQuery(function ($) {
	try {
		var data = $('#coverTable').dataTable( {
//				"lengthMenu": [[-1], ["All"]],
			"lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
			"order": [[ 0, "asc" ]],
			"columnDefs": [ {
	          "targets": 'no-sort',
	          "orderable": false
		    } ],
			responsive: true
		});
	} catch(err){}
} ); 
</script>
 <style>
.panel {
margin-bottom: 5px}
</style> 

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">   

</head>
<body>
<s:form id="integ" name="integ" method="post"  theme="simple">
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<s:actionerror cssStyle="color: red;" />
	</div>
</div>
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel panel-heading">
			<s:text name="Integration Failed" />
			</div>
			<div class="panel-body">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<div class="panel panel-primary">
						<div class="panel panel-heading">
						<s:text name="Integration Header Info" />
						</div>
							<div class="panel-body" >
							<div class="row">
								<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						 			<div class="text">
							 			<label><s:text name="Msg Id" /></label>
							 		</div>
							 		<div class="tbox">
							 			<s:textfield name="msgId" id="msgId" cssClass="bg-hover inputBox tooltipContent" data-content="" maxlength="200" readonly="true"/>
							 		</div>
						 		</div>
						 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						 			<div class="text">
							 			<label><s:text name="Tran Id" /></label>
							 		</div>
							 		<div class="tbox">
							 			<s:textfield name="transId" id="transId" cssClass="bg-hover inputBox tooltipContent" data-content="" maxlength="200" readonly="true"/>
							 		</div>
						 		</div>
						 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						 			<div class="text">
							 			<label><s:text name="Source App Id" /></label>
							 		</div>
							 		<div class="tbox">
							 			<s:textfield name="sourceAppId" id="sourceAppId" cssClass="bg-hover inputBox tooltipContent" data-content="" maxlength="200" readonly="true"/>
							 		</div>
						 		</div>
							</div>
							<div class="row">
								<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						 			<div class="text">
							 			<label><s:text name="Destination App Id" /></label>
							 		</div>
							 		<div class="tbox">
							 			<s:textfield name="destAppId" id="destAppId" cssClass="bg-hover inputBox tooltipContent" data-content="" maxlength="200" readonly="true"/>
							 		</div>
						 		</div>
						 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						 			<div class="text">
							 			<label><s:text name="Trans Desc" /></label>
							 		</div>
							 		<div class="tbox">
							 			<s:textfield name="transDesc" id="transDesc" cssClass="bg-hover inputBox tooltipContent" data-content="" maxlength="200" readonly="true"/>
							 		</div>
						 		</div>
						 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						 			<div class="text">
							 			<label><s:text name="Doc Number" /></label>
							 		</div>
							 		<div class="tbox">
							 			<s:textfield name="docNumber" id="docNumber" cssClass="bg-hover inputBox tooltipContent" data-content="" maxlength="200" readonly="true"/>
							 		</div>
						 		</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="panel-body">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<div class="panel panel-primary">
						<div class="panel panel-heading">
						<s:text name="Customer Information" />
						</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							 			<div class="text">
								 			<label><s:text name="Type " /></label>
								 		</div>
								 		<div class="tbox">
								 			<s:select list="#{'1':'Certificate','2':'Declaration' }" name="policyType" id="policyType" cssClass="inputBoxS tooltipContent" ></s:select>
								 		</div>
							 		</div>
							 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							 			<div class="text">
								 			<label><s:text name="Policy No" /></label>
								 		</div>
								 		<div class="tbox">
								 			<s:textfield name="policyNo" id="policyNo" cssClass="bg-hover inputBox tooltipContent" data-content="" maxlength="200" />
								 		</div>
							 		</div>
							 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							 			<div class="text">
								 			<label><s:text name="Interest Name" /></label>
								 		</div>
								 		<div class="tbox">
								 			<s:textfield name="interestName" id="interestName" cssClass="bg-hover inputBox tooltipContent" data-content="" maxlength="200" />
								 		</div>
							 		</div>
						 		</div>
							</div>
						</div>
					</div>
				</div>
				<div class="panel-body">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<div class="panel panel-primary">
						<div class="panel panel-heading">
						<s:text name="Shipment Information" />
						</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							 			<div class="text">
								 			<label><s:text name="Shipment Date" /></label>
								 		</div>
								 		<div class="tbox">
								 			<s:textfield name="shipmentDate" id="fromDate" cssClass="bg-hover inputBox tooltipContent" data-content="" maxlength="200" />
								 		</div>
							 		</div>
							 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							 			<div class="text">
								 			<label><s:text name="Effective Date" /></label>
								 		</div>
								 		<div class="tbox">
								 			<s:textfield name="effectiveDate" id="effecdate" cssClass="bg-hover inputBox tooltipContent" data-content="" maxlength="200" />
								 		</div>
							 		</div>
							 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							 			<div class="text">
								 			<label><s:text name="Expiry Date" /></label>
								 		</div>
								 		<div class="tbox">
								 			<s:textfield name="expiryDate" id="toDate" cssClass="bg-hover inputBox tooltipContent" data-content="" maxlength="200" />
								 		</div>
							 		</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="panel-body">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<div class="panel panel-primary">
						<div class="panel panel-heading">
						<s:text name="Cargo Information" />
						</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							 			<div class="text">
								 			<label><s:text name="Conveyence Code" /></label>
								 		</div>
								 		<div class="tbox">
								 			<s:select list="trnasportList" name="conveyenceCode" id="conveyenceCode" listKey="Code" listValue="CodeDescription" cssClass="inputBoxS tooltipContent" ></s:select>
								 		</div>
							 		</div>
							 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							 			<div class="text">
								 			<label><s:text name="Conveyence Desc" /></label>
								 		</div>
								 		<div class="tbox">
								 			<s:textfield name="conveyenceDesc" id="conveyenceDesc" cssClass="bg-hover inputBox tooltipContent" data-content="" maxlength="200" />
								 		</div>
							 		</div>
									<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							 			<div class="text">
								 			<label><s:text name="Package Type" /></label>
								 		</div>
								 		<div class="tbox">
								 			<s:select list="packageList" name="packageType" id="packageType" listKey="Code" listValue="CodeDescription" cssClass="inputBoxS tooltipContent" ></s:select>
								 		</div>
							 		</div>
								</div>
								<div class="row">
							 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							 			<div class="text">
								 			<label><s:text name="Cargo Type" /></label>
								 		</div>
								 		<div class="tbox">
								 			<s:select list="commodityList" name="cargoType" id="cargoType" listKey="Code" listValue="CodeDescription" cssClass="inputBoxS tooltipContent" ></s:select>
								 		</div>
							 		</div>
							 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							 			<div class="text">
								 			<label><s:text name="Cargo Type Desc" /></label>
								 		</div>
								 		<div class="tbox">
								 			<s:textfield name="cargoTypeDesc" id="cargoTypeDesc" cssClass="bg-hover inputBox tooltipContent" data-content="" maxlength="200" />
								 		</div>
							 		</div>
							 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							 			<div class="text">
								 			<label><s:text name="Basic Evaluation" /></label>
								 		</div>
								 		<div class="tbox">
								 			<s:select list="saletermList" name="basicEvaluation" id="basicEvaluation" listKey="Code" listValue="CodeDescription" cssClass="inputBoxS tooltipContent" ></s:select>
								 		</div>
							 		</div>
								</div>
								<div class="row">
									<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							 			<div class="text">
								 			<label><s:text name="Loading Port" /></label>
								 		</div>
								 		<div class="tbox">
								 			<s:select list="countryList" name="loardingPort" id="loardingPort" listKey="Code" listValue="CodeDescription" cssClass="inputBoxS tooltipContent" ></s:select>
								 		</div>
							 		</div>
							 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							 			<div class="text">
								 			<label><s:text name="Arrival Port" /></label>
								 		</div>
								 		<div class="tbox">
								 			<s:select list="countryList" name="arrivalPort" id="arrivalPort" listKey="Code" listValue="CodeDescription" cssClass="inputBoxS tooltipContent" ></s:select>
								 		</div>
							 		</div>
							 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							 			<div class="text">
								 			<label><s:text name="Sail Route" /></label>
								 		</div>
								 		<div class="tbox">
								 			<s:textfield name="sailRoute" id="letterCreditNo" cssClass="bg-hover inputBox tooltipContent" data-content="" maxlength="200" />
								 		</div>
							 		</div>
								</div>
								<div class="row">
									<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							 			<div class="text">
								 			<label><s:text name="Deductable Note" /></label>
								 		</div>
								 		<div class="tbox">
								 			<s:textfield name="deductableNote" id="deductableNote" cssClass="bg-hover inputBox tooltipContent" data-content="" maxlength="200" />
								 		</div>
							 		</div>
									<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							 			<div class="text">
								 			<label><s:text name="Risk Category" /></label>
								 		</div>
								 		<div class="tbox">
								 			<s:textfield name="riskCategory" id="riskCategory" cssClass="bg-hover inputBox tooltipContent" data-content="" maxlength="200" />
								 		</div>
							 		</div>
							 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							 			<div class="text">
								 			<label><s:text name="Quantity" /></label>
								 		</div>
								 		<div class="tbox">
								 			<s:textfield name="quantity" id="quantity" cssClass="bg-hover inputBox tooltipContent" data-content="" maxlength="200" />
								 		</div>
							 		</div>
							 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							 			<div class="text">
								 			<label><s:text name="Declaration Note" /></label>
								 		</div>
								 		<div class="tbox">
								 			<s:textfield name="declarationNote" id="declarationNote" cssClass="bg-hover inputBox tooltipContent" data-content="" maxlength="200" />
								 		</div>
							 		</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="panel-body">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<div class="panel panel-primary">
						<div class="panel panel-heading">
						<s:text name="SumInsured Information" />
						</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							 			<div class="text">
								 			<label><s:text name="Sum Insured" /></label>
								 		</div>
								 		<div class="tbox">
								 			<s:textfield name="sumInsured" id="sumInsured" cssClass="bg-hover inputBox tooltipContent" data-content="" maxlength="200" />
								 		</div>
							 		</div>
									<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							 			<div class="text">
								 			<label><s:text name="Latest SumInsured" /></label>
								 		</div>
								 		<div class="tbox">
								 			<s:textfield name="latestSumInsured" id="latestSumInsured" cssClass="bg-hover inputBox tooltipContent" data-content="" maxlength="200" />
								 		</div>
							 		</div>
									<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							 			<div class="text">
								 			<label><s:text name="Certificate SI" /></label>
								 		</div>
								 		<div class="tbox">
								 			<s:textfield name="certificateSI" id="certificateSI" cssClass="bg-hover inputBox tooltipContent" data-content="" maxlength="200" />
								 		</div>
							 		</div>
									<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							 			<div class="text">
								 			<label><s:text name="All Certificate SI" /></label>
								 		</div>
								 		<div class="tbox">
								 			<s:textfield name="allcertificateSI" id="allcertificateSI" cssClass="bg-hover inputBox tooltipContent" data-content="" maxlength="200" />
								 		</div>
							 		</div>
							 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							 			<div class="text">
								 			<label><s:text name="Open Cover SI" /></label>
								 		</div>
								 		<div class="tbox">
								 			<s:textfield name="openCoverSI" id="openCoverSI" cssClass="bg-hover inputBox tooltipContent" data-content="" maxlength="200" />
								 		</div>
							 		</div>
							 		
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="panel-body">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<div class="panel panel-primary">
						<div class="panel panel-heading">
						<s:text name="Vessel Information" />
						</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							 			<div class="text">
								 			<label><s:text name="Vessel Name" /></label>
								 		</div>
								 		<div class="tbox">
								 			<s:textfield name="vesselName" id="vesselName" cssClass="bg-hover inputBox tooltipContent" data-content="" maxlength="200" />
								 		</div>
							 		</div>
							 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							 			<div class="text">
								 			<label><s:text name="Vessel Year Built" /></label>
								 		</div>
								 		<div class="tbox">
								 			<s:textfield name="vesselYearBuilt" id="vesselYearBuilt" cssClass="bg-hover inputBox tooltipContent" data-content="" maxlength="200" />
								 		</div>
							 		</div>
							 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							 			<div class="text">
								 			<label><s:text name="Vessel Nationality" /></label>
								 		</div>
								 		<div class="tbox">
								 			<s:textfield name="vesselNatonality" id="vesselNatonality" cssClass="bg-hover inputBox tooltipContent" data-content="" maxlength="200" />
								 		</div>
							 		</div>
							 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							 			<div class="text">
								 			<label><s:text name="Vessel Classfification" /></label>
								 		</div>
								 		<div class="tbox">
								 			<s:textfield name="vesselClass" id="vesselClass" cssClass="bg-hover inputBox tooltipContent" data-content="" maxlength="200" />
								 		</div>
							 		</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="panel-body">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<div class="panel panel-primary">
						<div class="panel panel-heading">
						<s:text name="Premium Information" />
						</div>
							<div class="panel-body">	
								<div class="row">
									<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							 			<div class="text">
								 			<label><s:text name="Minimum Premium" /></label>
								 		</div>
								 		<div class="tbox">
								 			<s:textfield name="minimumPremium" id="minimumPremium" cssClass="bg-hover inputBox tooltipContent" data-content="" maxlength="200" />
								 		</div>
							 		</div>
							 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							 			<div class="text">
								 			<label><s:text name="Marine Premium" /></label>
								 		</div>
								 		<div class="tbox">
								 			<s:textfield name="marinePremium" id="marinePremium" cssClass="bg-hover inputBox tooltipContent" data-content="" cols="3"/>
								 		</div>
							 		</div>
							 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							 			<div class="text">
								 			<label><s:text name="War Premium" /></label>
								 		</div>
								 		<div class="tbox">
								 			<s:textfield name="warPremium" id="warPremium" cssClass="bg-hover inputBox tooltipContent" data-content="" cols="3"/>
								 		</div>
							 		</div>
							 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							 			<div class="text">
								 			<label><s:text name="Net Premium LC" /></label>
								 		</div>
								 		<div class="tbox">
								 			<s:textfield name="netPremiumLc" id="letterCreditNo" cssClass="bg-hover inputBox tooltipContent" data-content="" maxlength="200" />
								 		</div>
							 		</div>
							 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							 			<div class="text">
								 			<label><s:text name="Gross Premium LC" /></label>
								 		</div>
								 		<div class="tbox">
								 			<s:textfield name="grossPremiumLc" id="grossPremiumLc" cssClass="bg-hover inputBox tooltipContent" data-content="" maxlength="200" />
								 		</div>
							 		</div>
							 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							 			<div class="text">
								 			<label><s:text name="Total Fee LC" /></label>
								 		</div>
								 		<div class="tbox">
								 			<s:textfield name="totalFeeLC" id="packageType" cssClass="bg-hover inputBox tooltipContent" data-content="" maxlength="200" />
								 		</div>
							 		</div>
							 		
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="panel-body">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<div class="panel panel-primary">
						<div class="panel panel-heading">
						<s:text name="Lc Information" />
						</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							 			<div class="text">
								 			<label><s:text name="Bank Code" /></label>
								 		</div>
								 		<div class="tbox">
								 			<s:select list="bankList" name="bankCode" id="bankCode" listKey="Code" listValue="CodeDescription" cssClass="inputBoxS tooltipContent" ></s:select>
								 		</div>
							 		</div>
							 		
							 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							 			<div class="text">
								 			<label><s:text name="Letter Credit No" /></label>
								 		</div>
								 		<div class="tbox">
								 			<s:textfield name="letterCreditNo" id="letterCreditNo" cssClass="bg-hover inputBox tooltipContent" data-content="" maxlength="200" />
								 		</div>
							 		</div>
									<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							 			<div class="text">
								 			<label><s:text name="Letter Credit Amount" /></label>
								 		</div>
								 		<div class="tbox">
								 			<s:textfield name="letterCreditAmount" id="letterCreditAmount" cssClass="bg-hover inputBox tooltipContent" data-content="" maxlength="200" />
								 		</div>
							 		</div>
							 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							 			<div class="text">
								 			<label><s:text name="Letter Credit Currency" /></label>
								 		</div>
								 		<div class="tbox">
								 			<s:textfield name="letterCreditCurrency" id="letterCreditCurrency" cssClass="bg-hover inputBox tooltipContent" data-content="" maxlength="200" />
								 		</div>
							 		</div>
							</div>
						</div>
					</div>
				</div>
				</div>
				<div class="panel-body">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<div class="panel panel-primary">
							<div class="panel panel-heading">
							<s:text name="Request and Response Information" />
							</div>
								<div class="panel-body">
									<div class="row">
										<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
								 			<div class="text">
									 			<label><s:text name="Integration Request" /></label>
									 		</div>
									 		<div class="tbox">
									 			<s:textarea name="integReq" id="integReq" cssClass="bg-hover inputBox tooltipContent" data-content="" cols="3"/>
									 		</div>
								 		</div>
								 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
								 			<div class="text">
									 			<label><s:text name="Integration Response" /></label>
									 		</div>
									 		<div class="tbox">
									 			<s:textarea name="integRes" id="integRes" cssClass="bg-hover inputBox tooltipContent" data-content="" cols="3"/>
									 		</div>
								 		</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<br/>
					<div class="row">
						 <div class="col-lg-2 col-md-2 col-sm-4 col-xs-4 col-lg-offset-4" align="center">
							<button type="button"  value="Back"  class="btn btn-block btn-sm btn-danger" onclick="fnBack();" ><s:text name="label.back"></s:text></button>
						</div>
						<div class="col-lg-2 col-md-2 col-sm-4 " align="center">
							<button type="button"  value="Submit"  class="btn btn-block btn-sm btn-success" onclick="fnSubmit();" ><s:text name="Submit"></s:text></button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<s:token/>
<s:hidden name="startDate"/>
<s:hidden name="endDate"/>
<s:hidden name="productID"/>
<s:hidden name="quoteNo" id="quoteNo"/>
</s:form>
<script type="text/javascript">

function fnSubmit() {
	document.integ.action='${pageContext.request.contextPath}/updateIntegAreport.action';	
	document.integ.submit();
}

function fnBack(){
	document.integ.action = '${pageContext.request.contextPath}/integrationListAreport.action';
	document.integ.submit();
}



</script>


</body>
</html>