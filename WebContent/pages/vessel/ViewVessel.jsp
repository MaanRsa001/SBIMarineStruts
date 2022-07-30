<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="keywords" content="Maan Sarovar, Sea Trans, Marine Insurance">	
		<meta name="author" content="">
		<title> ::: E-Way - Customer Selection ::: </title>
		<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/saicoHeaderLogo.jpg" />	
		<script type="text/javascript" src="js/common.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css//bootstrap.min.css" />
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
		<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/numeric-comma.js"></script>
		
		<script type="text/javascript">
   		$(document).ready(function() {
		    $('#record').dataTable( {
			        "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
			        responsive: true
			} );
		} );
   		$(document).ready(function() {
		    $('#record1').dataTable( {
			        "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
			        responsive: true
			} );
		} );
   		</script>
	</head>
		
		



<style>
* {box-sizing: border-box}

/* Set height of body and the document to 100% */
body, html {
  height: 100%;
  margin: 0;
  font-family: Arial;
}

/* Style tab links */
.tablink {
  background-color: #194d8b;
    color: white;
    padding: 4px 4px;
    width: 33%;
}

.tablink:hover {
  background-color: #777;
}

/* Style the tab content (and add height:100% for full page content) */
.tabcontent {
  color: black;
  font-weight: bold;
  display: none;
  padding: 10px 10px;
  height: 100%;
  border: 1px solid black;
  line-height: 2;
}

.text{
	color:black;

}
.panel-heading {
    padding: 0px;
}


#Ship Details {background-color: white;}
#Ship Manager {background-color: white;}
#Ship Operator {background-color: white;}
#Registered Owner {background-color: white;}
#Technical Manager {background-color: white;}
#Ship Compliance {background-color: white;}
#Shipowner Compliance {background-color: white;}
#Company Details {background-color: white;}
#Company Compliance {background-color: white;}

}
</style>






</head>
<body>
<div>
<div class="row">
	<button class="tablink" onclick="openPage('ShipDetails', this, '#03A9F4')" id="defaultOpen">Ship Details</button>
	<button class="tablink" onclick="openPage('ShipManager', this, '#03A9F4')">Ship Manager</button>
	<button class="tablink" onclick="openPage('ShipOperator', this, '#03A9F4')" >Ship Operator</button>
</div>
<div class="row">
	<button class="tablink" onclick="openPage('RegisteredOwner', this, '#03A9F4')">Registered Owner</button>
	<button class="tablink" onclick="openPage('TechnicalManager', this, '#03A9F4')">Technical Manager</button>
	<button class="tablink" onclick="openPage('ShipCompliance', this, '#03A9F4')">Ship Compliance</button>
</div>
<div class="row">
	<button class="tablink" onclick="openPage('ShipownerCompliance', this, '#03A9F4')" >Ship owner Compliance</button>
	<button class="tablink" onclick="openPage('CompanyDetails', this, '#03A9F4')">Company Details</button>
	<button class="tablink" onclick="openPage('CompanyCompliance', this, '#03A9F4')">Company Compliance</button>
</div>
</div>
<s:form id="quotation" name="quotation" method="post" action="getQuoteQuotation.action" theme="simple">
<div id="ShipDetails" class="tabcontent">
	<div class="panel panel-primary" >
		<div class="panel-heading">
			<s:text name="Ship Manager" />
		</div>
		<div class="panel-body" >
		 	<div class="row">
		 		<div class="container">
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
							<s:text name="Yard Number" />
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
			 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.yardnumber"/> </span>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
			 			<s:text name="Year Of Build" />
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
			 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.yearOfBuild"/> </span>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
			 			<s:text name="Ship Builder" />
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
			 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.shipbuilder"/> </span>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
			 			<s:text name="Ship Type Group" />
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
			 				<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.shiptypeGroup"/> </span>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
			 			<s:text name="Ship Type Level2" />
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
			 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.shiptypelevel2"/> </span>
						</div>
					</div>
					
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
			 			<s:text name="Ship TypeLevel3" />
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
			 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.shiptypelevel3"/> </span>
						</div>
					</div>
					
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
			 			<s:text name="Ship TypeLevel4" />
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
			 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.shiptypelevel4"/> </span>
						</div>
					</div>
					
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
			 				<s:text name="Ship TypeLevel5" />
	
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
			 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.shiptypelevel5"/> </span>
						</div>
					</div>
					
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
			 			<s:text name="Port Of Registry" />
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
			 			 <span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.portofregistry"/> </span>
						</div>
					</div>
					<s:if test="shipByIHSLRorIMORes.apsshipdetail.shipoverallcompliancestatus==2">
						<div class="row" style="color:red">
					</s:if>
					<s:else>
						<div class="row">
					</s:else>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
			 			<s:text name="Ship Over All Compliance Status" />
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
			 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.shipoverallcompliancestatus"/> </span>
						</div>
					</div>
					<s:if test="shipByIHSLRorIMORes.apsshipdetail.legalOverall==2">
						<div class="row" style="color:red">
					</s:if>
					<s:else>
						<div class="row">
					</s:else>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
			 			<s:text name="Legal Overall" />
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
			 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.legalOverall"/> </span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="ShipManager" class="tabcontent">
	<div class="panel panel-primary" >
		<div class="panel-heading">
			<s:text name="Ship Manager" />
		</div>
		<div class="panel-body" >
		 	<div class="row">
		 		<div class="container">
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
			 			<s:text name="Ship Manager" />
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
			 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.shipmanager"/> </span>
						</div>
					</div>
					
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
			 			<s:text name="Company Code" />
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
			 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.shipmanagercompanycode"/> </span>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
			 			<s:text name="Country Of Domicile Code" />
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
			 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.shipManagerCountryOfDomicileCode"/> </span>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
			 			<s:text name="Country Of Domicile Name" />
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
			 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.shipmanagercountryofdomicilename"/> </span>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
			 			<s:text name="Country Of Registration" />
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
			 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.shipManagerCountryOfRegistration"/> </span>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
			 			<s:text name="Ship Name" />
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
			 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.shipname"/> </span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	
<div id="ShipOperator" class="tabcontent">
	<div class="panel panel-primary" >
		<div class="panel-heading">
			<s:text name="Ship Operator" />
		</div>
		<div class="panel-body" >
		 	<div class="row">
		 		<div class="container">
					  <div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
				 			<s:text name="Operator" />
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
				 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.operator"/> </span>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
				 			<s:text name="Operator Company Code" />
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
				 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.operatorcompanycode"/> </span>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
				 			<s:text name="Country Of DomicileName" />
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
				 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.operatorcountryofdomicilename"/> </span>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<s:text name="Country Of Registration" />
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.operatorCountryOfRegistration"/> </span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</div>
<div id="RegisteredOwner" class="tabcontent">
	<div class="panel panel-primary" >
		<div class="panel-heading">
			<s:text name="Technical Manager" />
		</div>
		<div class="panel-body" >
		 	<div class="row">
		 		<div class="container">
				  <div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
				 			<s:text name="Registered Owner" />
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
				 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.registeredowner"/> </span>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
				 			<s:text name="Registered OwnerCode" />
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
				 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.registeredownercode"/> </span>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
				 			<s:text name="OwnerCountry Of Domicile" />
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
				 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.registeredownercountryofdomicile"/> </span>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<s:text name="OwnerCountry Of Registration" />
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.registeredOwnerCountryOfRegistration"/> </span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	
	
<div id="TechnicalManager" class="tabcontent">
	<div class="panel panel-primary" >
		<div class="panel-heading">
			<s:text name="Technical Manager" />
		</div>
		<div class="panel-body" >
		 	<div class="row">
		 		<div class="container">
					  <div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<s:text name="Technical Manager" />
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.technicalManager"/> </span>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<s:text name="Technical Manager Code" />
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.technicalManagerCode"/> </span>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<s:text name="Country Of Domicile" />
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.technicalManagerCountryOfDomicile"/> </span>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						 			<s:text name="Country Of Registration" />
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.technicalManagerCountryOfRegistration"/> </span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
<div id="ShipCompliance" class="tabcontent">
	<div class="panel panel-primary" >
		<div class="panel-heading">
			<s:text name="Ship Compliance" />
		</div>
		<div class="panel-body" >
		 	<div class="row">
		 		<div class="container">
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<s:text name="EU SanctionList" />
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.shipeusanctionlist"/> </span>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<s:text name="Flag Disputed" />
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.shipflagdisputed"/> </span>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<s:text name="Flag Sanctioned Country" />
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.shipflagsanctionedcountry"/> </span>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<s:text name="ShipStatus" />
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.shipstatus"/> </span>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<s:text name="OFAC NonSDN SanctionList" />
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.shipofacnonsdnsanctionlist"/> </span>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<s:text name="OFACSSI List" />
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.shipofacssilist"/> </span>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<s:text name="OFAC SanctionList" />
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.shipofacsanctionlist"/> </span>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<s:text name="Overall Compliance Status" />
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.shipoverallcompliancestatus"/> </span>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<s:text name="SanctionedCountry Port CallLast12m" />
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.shipsanctionedcountryportcalllast12m"/> </span>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<s:text name="Sanctioned Country Port CallLast3m" />
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.shipsanctionedcountryportcalllast3m"/> </span>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<s:text name="Sanctioned Country Port CallLast6m" />
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.shipsanctionedcountryportcalllast6m"/> </span>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<s:text name="Historical Flag Sanctioned Country" />
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.shiphistoricalflagsanctionedcountry"/> </span>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<s:text name="Status EffectiveDate" />
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.shipstatuseffectivedate"/> </span>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<s:text name="Swiss SanctionList" />
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.shipswisssanctionlist"/> </span>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<s:text name="UN SanctionList" />
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.shipunsanctionlist"/> </span>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<s:text name="US Treasury OFAC AdvisoryList" />
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.shipustreasuryofacadvisorylist"/> </span>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<s:text name="Dark Activity Indicator" />
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.shipdarkactivityindicator"/> </span>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<s:text name="ANNEX4 Suspected STS TransfersWith NKorea" />
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.shipannex4suspectedststransferswithnkorea"/> </span>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<s:text name="Ship ANNEX5 Suspected Export Of NKoreanCoal" />
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.shipannex5suspectedexportofnkoreancoal"/> </span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

	
	
	
<div id="ShipownerCompliance" class="tabcontent">
	<div class="panel panel-primary" >
		<div class="panel-heading">
			<s:text name="Ship owner Compliance" />
		</div>
		<div class="panel-body" >
		 	<div class="row">
		 		<div class="container">
				  	<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<s:text name="ShipOwner Australian SanctionList" />
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.shipowneraustraliansanctionlist"/> </span>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<s:text name="ShipOwner BES SanctionList" />
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.shipownerbessanctionlist"/> </span>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<s:text name="ShipOwner Canadian SanctionList" />
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.shipownercanadiansanctionlist"/> </span>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<s:text name="ShipOwner EU SanctionList" />
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.shipownereusanctionlist"/> </span>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<s:text name="ShipOwner FATF Jurisdiction" />
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.shipownerfatfjurisdiction"/> </span>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<s:text name="Historical OFAC Sanctioned Country" />
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.shipownerhistoricalofacsanctionedcountry"/> </span>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<s:text name="ShipOwner OFAC SanctionList" />
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.shipownerofacsanctionlist"/> </span>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<s:text name="ShipOwner OFAC Sanctioned Country" />
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.shipownerofacsanctionedcountry"/> </span>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<s:text name="ShipOwner Swiss SanctionList" />
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.shipownerswisssanctionlist"/> </span>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<s:text name="ShipOwner UN SanctionList" />
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
					 			<span style="font-weight:400;"><s:property value="shipByIHSLRorIMORes.apsshipdetail.shipownerunsanctionlist"/> </span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>	
</div>
<div id="CompanyDetails" class="tabcontent">
	<div class="panel panel-primary" >
		<div class="panel-heading">
			<s:text name="Company Details" />
		</div>
		<div class="panel-body" >
		 	<div class="row">
		 		<div class="container">
					 <s:iterator value="comp" status="stat" var="report">
					 <div class="panel panel-primary" >
					 <div class="panel-heading">
						<span><s:text name="Company Details" /> &nbsp;<s:property value="%{#stat.count}"/></span>
					</div>
					  <div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						 			<s:text name="Full Name" />
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						 			<span style="font-weight:400;"><s:property value="fullName" /></span>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						 			<s:text name="Last ChangeDate" />
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						 			<span style="font-weight:400;"><s:property value="lastchangedate" /></span>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						 			<s:text name="Nationality of Registration" />
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						 			<span style="font-weight:400;"><s:property value="nationalityofregistration" /></span>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						 			<s:text name="Ow code" />
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						 			<span style="font-weight:400;"><s:property value="owcode" /></span>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						 			<s:text name="Short CompanyName" />
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						 			<span style="font-weight:400;"><s:property value="shortcompanyname" /></span>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						 			<s:text name="Full Address" />
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						 			<span style="font-weight:400;"><s:property value="fulladdress" /></span>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						 			<s:text name="Company Status" />
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						 			<span style="font-weight:400;"><s:property value="companystatus" /></span>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						 			<s:text name="Country Name" />
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						 			<span style="font-weight:400;"><s:property value="countryname" /></span>
							</div>
						</div>
						</div>
					</s:iterator>
				</div>
			</div>
	</div>	
</div>
</div>

<div id="CompanyCompliance" class="tabcontent">
	<div class="panel panel-primary" >
		<div class="panel-heading">
			<s:text name="Company Compliance Details" />
		</div>
		<div class="panel-body" >
		 	<div class="row">
		 		<div class="container">
					 <s:iterator value="comCompliance" status="stat" var="report">
					 <div class="panel panel-primary" >
						 <div class="panel-heading">
							<span><s:text name="Company Compliance Details" /> &nbsp;<s:property value="%{#stat.count}"/></span>
						</div>
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						 			<s:text name="Company In FATF Jurisdiction" />
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						 			<span style="font-weight:400;"><s:property value="companyinfatfjurisdiction" /></span>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						 			<s:text name="Company In OFAC Sanctioned Country" />
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						 			<span style="font-weight:400;"><s:property value="companyinofacsanctionedcountry" /></span>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						 			<s:text name="Company On Australian Sanction List" />
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						 			<span style="font-weight:400;"><s:property value="companyonaustraliansanctionlist" /></span>
							</div>
						</div>
						
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						 			<s:text name="Company On BES Sanction List" />
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						 			<span style="font-weight:400;"><s:property value="companyonbessanctionlist" /></span>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						 			<s:text name="Company On Canadian SanctionList" />
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						 			<span style="font-weight:400;"><s:property value="companyoncanadiansanctionlist" /></span>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						 			<s:text name="Company On EU Sanction List" />
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						 			<span style="font-weight:400;"><s:property value="companyoneusanctionlist" /></span>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						 			<s:text name="Company On OFACSSI List" />
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						 			<span style="font-weight:400;"><s:property value="companyonofacssilist" /></span>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						 			<s:text name="Company On OFAC SanctionList" />
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						 			<span style="font-weight:400;"><s:property value="companyonofacsanctionlist" /></span>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						 			<s:text name="Company On Swiss Sanction List" />
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						 			<span style="font-weight:400;"><s:property value="companyonswisssanctionlist" /></span>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						 			<s:text name="Company On UN Sanction List" />
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						 			<span style="font-weight:400;"><s:property value="companyonunsanctionlist" /></span>
							</div>
						</div>
						<s:if test="companyoverallcompliancestatus==2">
							<div class="row" style="color:red">
							</s:if>
							<s:else>
								<div class="row">
							</s:else>
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						 			<s:text name="Company Overall Compliance Status" />
							</div>
							<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						 			<span style="font-weight:400;"><s:property value="companyoverallcompliancestatus" /></span>
							</div>
						</div>
						</div>
					</s:iterator>
				</div>
			</div>
	</div>	
</div>
</div>
<div class="tablerow" align="center">
		<s:submit type="button" name="close"  key="Close" cssClass="btn btn-sm btn-danger" onclick="window.close();return false;"/>
	</div>	
	
	
</s:form>

<script>
function openPage(pageName,elmnt,color) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].style.backgroundColor = "";
  }
  document.getElementById(pageName).style.display = "block";
  elmnt.style.backgroundColor = color;
}

// Get the element with id="defaultOpen" and click on it
document.getElementById("defaultOpen").click();
</script>
   
</body>
</html> 
