<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Alegreya+Sans|Amiri|Cormorant+Garamond&display=swap" rel="stylesheet">
<style>
body {
    font-family: 'Alegreya Sans', sans-serif !important;
    color: #000;
    font-size: 22px !important;
}
ul li a {
    /*font-family: optima sans-serif !important;*/
    color: #000;
    font-family: 'Alegreya Sans', sans-serif !important;
    font-weight: 200 !important;
    font-size: 15px !important;
}
label {
	padding-top: 7px;
	margin-bottom: 0;
	font-size: 17px;
	font-weight: 400;
	font-family: 'Alegreya Sans', sans-serif !important;
}
h3 {
	font-size: 25px;
    line-height: 44px;
    font-weight: 200;
    letter-spacing: -1px;
    display: inline;
    font-family: 'Alegreya Sans', sans-serif;
}
.menu-bg >li {
	padding-top: 6px !important;
    padding-bottom: 6px !important;
    border-right: unset !important;
    border: unset !important;
    font-family: 'Alegreya Sans', sans-serif;
}
.menu-bg >li>a {
	padding-top: 12px !important;
    padding-bottom: 12px !important;
    border-right: unset !important;
    border: unset !important;
    font-size: 15px;
    font-weight: 200;
}
ul.menu-bg {
    background: url(./images/top-bg-1.jpg)center center !important;
    border-bottom: 4px solid #CCC;
    border-top: 4px solid #CCC;
    min-height: 50px;
    position: relative;
    text-align: left;
}
ul.slimmenu {
	background-color: unset !important;
}
a {
	border-bottom: unset !important;
}
ul.slimmenu li {
	background-color: unset !important;
	font-size: 15px;
    font-weight: 200;
}
ul.slimmenu li a:hover {
    background-color: transparent !important;
    text-decoration: none;
    border-bottom: unset !important;
    color: #fff !important;
}
.menu-hoverContant {
	background:  url(./images/top-bg-1.jpg)center center !important;
}
.menu-hoverContant>.menu-hoverContant_li>.menu-hoverContant_a:hover {
	/*background:  #fff !important;*/
	color: #ffcc99 !important;
	font-weight: 500 !important;
}
/*.contant-fontCol {
	background: #2f2269 !important;
}*/

</style>
<style>
label {
	padding-top: 7px;
	margin-bottom: 0;
	font-size: 17px;
	font-weight: 400;
	font-family: 'Alegreya Sans', sans-serif !important;
}

h3 {
	font-size: 25px;
    line-height: 44px;
    letter-spacing: -1px;
    display: inline;
    font-family: 'Alegreya Sans', sans-serif;
    color:#fff;
}
input {
	font-size: 14px;
}
 select {
	font-size: 14px;
}
span {
   font-size: 14px;
}
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
	.bg-hover {
		background-color: #FFF;
		border: 1px solid #ccc;
		border-radius: 4px;
		box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
		transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
	}
	/*.bg-hover:hover {
		background-color: #fff !important;
    	
    	border-radius: unset !important;
	}*/
	.bg-hovero {
		top: 1px;
    	position: relative;
    
	}
	/*.bg-hovero:hover {
		background: #282472;
		color: #fff;
		border: 1px solid #282472 !important;
	}
	span#select2-city-container:hover {
		background-color: #fff !important;
    	box-shadow: 0 0 4px #282472 !important;
    	border: 1px solid #282472 !important;
    	border-radius: unset !important;
	}*/
	
  .panel-heading {
    background: url(./images/top-bg-1.jpg)center center;
    /*border-top: 1px solid #cecece;*/
    line-height: 44px;
    letter-spacing: -1px;
    position: relative;
    clear: both;
    margin-bottom: 0;
    font-size: 18px !important;
	color:#2f2269 !important;
}
 .panel-heading {
 	border-bottom: 2px solid #dee2e6 !important;
 	border: unset !important;
 }
 .panel-primary {
    border-color: blue !important;
    border: 2px solid #2824718a !important;
}

span {
	
}
.panel-head {
	color: #2f2269 !important;
}

span.select2-selection.select2-selection--single {
    height: 40px !important;
}
/*span#select2-title-container {
    padding-top: 7px;
}*/
span.select2-selection__arrow {
    padding-top: 40px;
}
.tbox {
    margin-bottom: 17px;
    width: 80%;
}
.bg-hover {
    height: 40px;
}
.bg-hovero {
	padding: 9px;
}
span.select2-selection.select2-selection--single {
    padding-top: 7px;
}
.inputAppend {
    height: 40px;
}
input#policyStartDate {
    height: 40px;
}
input#exchageValue {
    height: 40px;
}
input#totalCommodity {
    height: 40px;
}
input#totalSI {
    height: 40px;
}
input#vesselName {
    height: 40px;
}
input#voyageNo {
    height: 40px;
}
input#quotation_lcNo {
    height: 40px;
}
input#lcDate {
    height: 40px;
}
input#quotation_blNo {
    height: 40px;
}
input#blDate {
    height: 40px;
}
input#sailingDate {
    height: 40px;
}
input#via {
    height: 40px;
}
ul.slimmenu li a:hover {
    background-color: transparent !important;
    text-decoration: none;
    border-bottom: 1px solid #fff;
    color: #fff !important;
}
.pullRight {
	padding-top: unset;
}
.panel-heading {
    padding: 0;
    padding-bottom: 0;
     padding-left: 10px;
}

.sub-btn {
	color: #fff;
    text-transform: uppercase;
    font-size: 13px;
    line-height: 14px;
    font-weight: 700;
    background: #545454;
    box-shadow: 0 0 4px #8e8d8d;
    border-radius: 2px;
    cursor: pointer;
    outline: 0;
    border: none;
    border: 2px solid #cfcfcf;
}
select#initReport_loginId {
    height: 40px;
}
.pullLeft {
	font-size: 22px;
    font-weight: 200;
    font-family: 'Alegreya Sans', sans-serif;
}
#initReport_endt_policyNo {
	font-weight: 600;
	font-size:17px;
}
.textV {
    font-size: 15px;
}
.tboxV {
	 font-size: 14px;
}
div{
font-size:14px;
font-weight: bold;
}
.btn-default {
    border-color: #2824718a;
}
</style>
</head>
<body>
<s:if test="#session.user!='guest'">
	<s:if test="menuBlocker != 'bulkreport '">
	<s:if test='%{!"admin".equalsIgnoreCase(#session.user1)}'>
	<form action="initReport.action">
	<s:if test='#session.product_id=="11"'>
	<s:set var="cert" value='Certificate'/>							
	</s:if>
	<s:elseif test='#session.product_id=="3"'>
	<s:set var="cert" value='Certificate'/>						
	</s:elseif>
		<div class="row" style="margin-bottom: 0px;">
			<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4"></div>
			<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4"></div>
			<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				<div class="panel panel-primary" style="background-color: #194d8b;">
					<div class="panel-heading" style="background:#282472 !important;border-color: #282472;">
						<h3 style="margin-bottom: 0px;">
							<s:if test='#session.product_id=="33" || #session.product_id=="34"'>
								<i class="fa fa-plane"></i>&nbsp;<s:text name="Travel Insurance"/>
							</s:if>
							<s:elseif test='#session.product_id=="41"'>
								<i class="fa fa-heartbeat"></i>&nbsp;<s:text name="Health Insurance"/>
							</s:elseif>
							<s:elseif test='#session.product_id=="65"'>
								<i class="fa fa-car"></i>&nbsp;<s:text name="Motor Insurance"/>
							</s:elseif> 
							<s:elseif test='#session.product_id=="30"'>
								<i class="fa fa-home"></i>&nbsp;<s:text name="Home Insurance"/>
							</s:elseif>
							<s:elseif test='#session.product_id=="3" || #session.product_id=="11"'>
								<i class="fa fa-ship"></i>&nbsp;<s:text name="Marine Insurance"/>
							</s:elseif>
							<s:elseif test='#session.product_id=="40"'>
								<i class="fa fa-ship"></i>&nbsp;<s:text name="Yacht Insurance"/>
							</s:elseif>
							<s:elseif test='#session.product_id=="42"'>
								<i class="fa fa-heartbeat"></i>&nbsp;<s:text name="Jet Ski Insurance"/>
							</s:elseif>				
						</h3>
					</div>
				</div>
			</div>
		</div>
		<div style="width: 100%; margin: 0 auto;">
			<s:if test='#session.b2c=="b2c"'>	
				<ul class="slimmenu">
					<li><a href="${pageContext.request.contextPath}/login/ProductSelection.jsp">PRODUCTS</a></li>
					<li><a href="${pageContext.request.contextPath}/CopyQuote/BtoCSearchQuote.jsp">RETRIEVE QUOTE</a></li>
					<li><a href="${pageContext.request.contextPath}/CopyQuote/BtoCSearchQuote.jsp">RETRIEVE POLICY</a></li>
					<s:if test='#session.typeOfProduct=="M"'>
						<li><a href="${pageContext.request.contextPath}/CopyQuote/BtoCSearchPolicy.jsp?reqFrom=renew">RENEW POLICY</a></li>
					</s:if>
				</ul>
			</s:if>
			<s:elseif test='#session.LoginType=="B2C"'>			
			</s:elseif>
			<s:else>
				<ul class="slimmenu menu-bg">
					<s:if test='#session.product_id==getText("OPEN_COVER")'>	
						<li class="contant-fontCol"><a href="#" onclick="newQuote('<s:property value="%{#session.product_id}"/>')">New Certificate</a></li>
						<li class="contant-fontCol">
							<a href="#">Certificate Register</a>
							<ul class="menu-hoverContant" style="padding: 0px;">
								<li class="contant-fontCol menu-hoverContant_li"><a class="menu-hoverContant_a" href="#" onclick="menuSelect('QE')">Existing Certificate</a></li>
								<%--<li><a href="#" onclick="menuSelect('QS')">Saved Quotes</a></li> --%>
								<li class="contant-fontCol menu-hoverContant_li"><a class="menu-hoverContant_a" href="#" onclick="menuSelect('QL')">Lapsed Certificate</a></li>
								<li class="contant-fontCol menu-hoverContant_li"><a class="menu-hoverContant_a" href="#" onclick="menuSelect('L')">Rejected Certificate</a></li>
								<%-- <s:if test='%{#session.usertype==getText("ISSUER") && !("3".equals(#session.product_id) || "11".equals(#session.product_id))}'>
									<li class="contant-fontCol menu-hoverContant_li"><a class="menu-hoverContant_a" href="#" onclick="menuSelect('BQE')">B2C Existing Quote</a></li>
								</s:if> --%>
							</ul>
						</li>	
					</s:if>		
					<s:else>
					<li class="contant-fontCol"><a href="#" onclick="newQuote('<s:property value="%{#session.product_id}"/>')">New Quote</a></li>
							
						<li class="contant-fontCol">
							<a href="#">Quote Register</a>
							<ul class="menu-hoverContant" style="padding: 0px;">
								<li class="contant-fontCol menu-hoverContant_li"><a class="menu-hoverContant_a" href="#" onclick="menuSelect('QE')">Existing Quotes</a></li>
								<%--<li><a href="#" onclick="menuSelect('QS')">Saved Quotes</a></li> --%>
								<li class="contant-fontCol menu-hoverContant_li"><a class="menu-hoverContant_a" href="#" onclick="menuSelect('QL')">Lapsed Quotes</a></li>
								<li class="contant-fontCol menu-hoverContant_li"><a class="menu-hoverContant_a" href="#" onclick="menuSelect('L')">Rejected Quotes</a></li>
								<%-- <s:if test='%{#session.usertype==getText("ISSUER") && !("3".equals(#session.product_id) || "11".equals(#session.product_id))}'>
									<li class="contant-fontCol menu-hoverContant_li"><a class="menu-hoverContant_a" href="#" onclick="menuSelect('BQE')">B2C Existing Quote</a></li>
								</s:if> --%>
							</ul>
						</li>
					</s:else>
									
					<s:if test='#session.product_id==getText("OPEN_COVER")'>	
					<li class="contant-fontCol" style="width:10%">
						<a href="#">Portfolio</a>
						<ul class="menu-hoverContant" style="padding: 0px;">
							<li class="contant-fontCol menu-hoverContant_li"><a class="menu-hoverContant_a" href="#" onclick="menuSelect('P')">Certificate</a></li>
							 <li class="contant-fontCol menu-hoverContant_li"><a class="menu-hoverContant_a" href="#" onclick="menuSelect('PC')">Canceled Certificate</a></li> 				
						</ul>
					</li>
					</s:if>
					<s:else>
					<li class="contant-fontCol" style="width:10%">
						<a href="#">Portfolio</a>
						<ul class="menu-hoverContant" style="padding: 0px;">
				 			<li class="contant-fontCol menu-hoverContant_li"><a class="menu-hoverContant_a" href="#" onclick="menuSelect('P')">Policies</a></li>
							<li class="contant-fontCol menu-hoverContant_li"><a class="menu-hoverContant_a" href="#" onclick="menuSelect('PC')" style="text-align:justify;">Canceled Policies</a></li>
							<%-- <s:if test='%{#session.usertype==getText("ISSUER") && !("3".equals(#session.product_id) || "11".equals(#session.product_id))}'>
								<li class="contant-fontCol menu-hoverContant_li"><a class="menu-hoverContant_a" href="#" onclick="menuSelect('BP')">B2C Portfolio</a></li>
							</s:if> --%>
							<s:if test='#session.product_id=="40" || #session.product_id=="42" ' >
								<li class="contant-fontCol menu-hoverContant_li"><a class="menu-hoverContant_a" href="#" onclick="menuSelect('PI')">Pending  for Post</a></li>
								<li class="contant-fontCol menu-hoverContant_li"><a class="menu-hoverContant_a" href="#" onclick="menuSelect('PF')">Failed  Policies</a></li>
							</s:if>	
						</ul>
					</li>
					</s:else>
					<li class="contant-fontCol">
					<s:if test='#session.product_id==getText("OPEN_COVER")'>	
						<a href="#">Referral Certificate</a>
					</s:if>
					<s:else>
						<a href="#">Referral Quote</a>
					</s:else>
						
						<ul class="menu-hoverContant" style="padding: 0px;">
							<li class="contant-fontCol menu-hoverContant_li"><a class="menu-hoverContant_a" href="#" onclick="menuSelect('RA')" >Referral Approved</a></li>
							<li class="contant-fontCol menu-hoverContant_li"><a class="menu-hoverContant_a" href="#" onclick="menuSelect('RU')">Referral UnApproved</a></li>
							<li class="contant-fontCol menu-hoverContant_li"><a class="menu-hoverContant_a" href="#" onclick="menuSelect('RR')">Referral Rejected</a></li>
							<%-- <s:if test='%{#session.usertype==getText("ISSUER") && !("3".equals(#session.product_id) || "11".equals(#session.product_id))}'>
								<li class="contant-fontCol menu-hoverContant_li"><a class="menu-hoverContant_a" href="#" onclick="menuSelect('BRU')">B2C Referral UnApproved</a></li>
							</s:if> --%>
						</ul>
					</li>
					<s:if test='%{!"User".equalsIgnoreCase(#session.usertype)}'>
					<li class="contant-fontCol"><a href="#" onclick="menuSelect('C')">Customer</a></li>
					</s:if>
					<s:if test='#session.product_id=="40" || #session.product_id=="42" ' >
						<li class="contant-fontCol"><a href="yachtreportReport.action" >Reports</a></li>
					</s:if>
					<s:else>
					<li class="contant-fontCol" style="width:10%">
						<a href="#">Reports</a>
						<ul class="menu-hoverContant" style="padding: 0px;">
							<li class="contant-fontCol menu-hoverContant_li"><a class="menu-hoverContant_a" href="#" onclick="menuSelect('R')" >Reports</a></li>
							<s:if test='"3".equals(#session.product_id) || "11".equals(#session.product_id)'>
							<!-- <li class="contant-fontCol menu-hoverContant_li"><a class="menu-hoverContant_a" href="#" onclick="movePolicyPrint('PP')">Policy Print</a></li> -->
							<s:if test='"3".equals(#session.product_id)'><li class="contant-fontCol menu-hoverContant_li"><a class="menu-hoverContant_a" href="#" onclick="moveBulkPrint('BRP')">Bulk Report Print </a></li></s:if>
							</s:if>
						</ul>
						
					</li>
					</s:else>
					<%--<ul style="padding: 0px;">
							<li><a href="#" onclick="menuSelect('R')">Reports</a></li>
							<s:if test='#session.usertype==getText("ISSUER") && "3".equals(#session.product_id) || "11".equals(#session.product_id)'>
							 	<li> <a href="#" onclick="movePolicyPrint('PP')">Policy Print </a></li>
							 	<s:if test='"3".equals(#session.product_id)'><li> <a href="#" onclick="moveBulkPrint('BRP')">Bulk Report Print </a></li></s:if>
							 </s:if>			
						</ul>
					 <s:if test='#session.product_id==getText("OPEN_COVER")'>	
					<li>
						<a href="#">Open Cover</a>
						<ul style="padding: 0px;">
							<li><a href="${pageContext.request.contextPath}/ViewOpenCovers.jsp" onclick="menuSelect('C')" >Certificate</a></li>
							<li><a href="#" onclick="declarationMenu('D')">Declaration</a></li>
							<li><a href="#" onclick="declarationMenu('DE')">Declaration Menu</a></li>
							<li><a href="${pageContext.request.contextPath}/redirectOpenUpload.action" onclick="menuSelect('RU')">Declaration Upload</a></li>
							<li><a href="#" onclick="menuSelect('T')">Upload Transaction</a></li>
						</ul>
					</li>	
					</s:if> --%>
					
					<s:if test='%{#session.product_id=="3" || #session.product_id=="11"}'>
					<s:if test='issuer !=null'>
						<li class="contant-fontCol"><a href="#" onclick="menuSelect('PE')">Endorsement</a></li>
					</s:if>	
					</s:if>	
					<s:if test='#session.product_id==getText("OPEN_COVER")'>	
						<li class="contant-fontCol"><a href="initCopyQuote.action" >Copy Certificate</a></li>
					</s:if>
					<s:else>
						<li class="contant-fontCol"><a href="initCopyQuote.action" >Copy Quote</a></li>
					</s:else>		
											
					<li class="contant-fontCol"><a href="initSearchReport.action" >Search</a></li>		
					<s:if test='%{"User".equalsIgnoreCase(#session.usertype)}'>
						<li class="contant-fontCol"><a href="modifyUserReg.action" >Profile</a></li>
					</s:if>		
				</ul>
			</s:else>	
	<s:hidden name="menuType"/>		
	<s:hidden name="productId"/>
	<s:hidden name="quoteStatus"/>
	<s:hidden name="loginId"/>
		</div>
	</form>
	</s:if>
	</s:if>
</s:if>
<script type="text/javascript">
function menuSelect(obj)
{	
	var productId=document.forms[0].productId.value;
	document.forms[0].menuType.value=obj;
	document.forms[0].loginId.value='<s:property value="#session.user"/>';
	document.forms[0].action="${pageContext.request.contextPath}/initReport.action";
	document.forms[0].submit();
}
function newQuote(productId)
{
	if(null=='<s:property value="#session.RSAISSUER"/>' || ''=='<s:property value="#session.RSAISSUER"/>')
	{
		document.forms[0].productId.value=productId;
		document.forms[0].quoteStatus.value='QE';	
		//if(productId=='31'||productId=='32'||productId=='33'||productId=='34'||productId=='41')//31-Travel & 32-Travel Standard &33-Travel -Walaa &41-Helath Insurance Walaa & 30-Home Insurance-Walaa
		if(productId=='31'||productId=='32'||productId=='34'||productId=='41')//31-Travel & 32-Travel Standard &33-Travel -Walaa &41-Helath Insurance Walaa & 30-Home Insurance-Walaa
		{
			document.forms[0].action="${pageContext.request.contextPath}/getDetailCustomer.action";
		}else if(productId=='65')
			document.forms[0].action="${pageContext.request.contextPath}/editQuoteMotor.action";
		else if(productId=='30')
			document.forms[0].action="${pageContext.request.contextPath}/packageSelectionHome.action";
		else if(productId=='33')
			document.forms[0].action="${pageContext.request.contextPath}/initTravel.action";	
		else if(productId=='40' || productId=='42')
			document.forms[0].action="${pageContext.request.contextPath}/initYacht.action";
		else
			document.forms[0].action="${pageContext.request.contextPath}/newQuoteQuotation.action";
	}else{
		document.forms[0].quoteStatus.value='QE';
		if(productId=='65')
			document.forms[0].action="${pageContext.request.contextPath}/editQuoteMotor.action";
		else if(productId=='30')
			document.forms[0].action="${pageContext.request.contextPath}/packageSelectionHome.action";
		else if(productId=='11' || productId=='3')
			document.forms[0].action="${pageContext.request.contextPath}/newQuoteQuotation.action";
		else if(productId=='40' || productId=='42')
			document.forms[0].action="${pageContext.request.contextPath}/initYacht.action";	
		else if(productId=='33')
			document.forms[0].action="${pageContext.request.contextPath}/initTravel.action";	
		else{
			document.forms[0].loginId.value='<s:property value="#session.user"/>';
			document.forms[0].action='${pageContext.request.contextPath}/login/RSAPolicyIssue.jsp';
		}
	}
	document.forms[0].submit();
	return false;
}
function declarationMenu(obj)
{
	document.forms[0].menuType.value=obj;
	document.forms[0].action='${pageContext.request.contextPath}/initDeclaration.action';	
	document.forms[0].submit();
}
function movePolicyPrint(obj)
{
	document.forms[0].menuType.value=obj;
	document.forms[0].action='${pageContext.request.contextPath}/pInitDeclaration.action';	
	document.forms[0].submit();
}

function moveBulkPrint(obj)
{
	document.forms[0].menuType.value=obj;
	document.forms[0].action='${pageContext.request.contextPath}/bulkPrintReport.action';	
	document.forms[0].submit();
}

function motorVehicleDetails(policyNo) {
	document.forms['report'].menuType.value = 'PVD';
	document.forms['report'].policyNo.value = policyNo;
	document.forms['report'].action = "${pageContext.request.contextPath}/initReport.action";
	document.forms['report'].submit();
}
</script>
</body>
</html>