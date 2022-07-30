<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<!DOCTYPE HTML>
<html>
<head>
	<script type="text/javascript" src="js/common.js"></script>		
	<script language="JavaScript">
		function stopRKey(evt) { 
		  var evt = (evt) ? evt : ((event) ? event : null); 
		  var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null); 
		  if ((evt.keyCode == 13) && (node.type=="text"))  {return false;} 
		} 
		document.onkeypress = stopRKey; 
	</script>	
	<s:if test="locale.language == 'ar'">
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min-rtl.css" />	
	</s:if>			
</head>
<body> 
<s:form name="search" theme="simple" action="searchReport.action">
<div class="panel panel-primary">
	<div class="panel-heading">
		<s:label key="search.search" />
	</div>
	<div class="panel-body">
		<div style="color: red;"><s:actionerror/></div>
		<br class="clear" />
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
				<div class="text">
					<s:label key="search.searchBy" />
				</div>
				<div class="tbox">
					<s:if test='#session.usertype==getText("ISSUER")'>
						<s:if test="locale.language == 'ar'">
							<s:select name="searchBy" id="searchBy" list="#{'policyNo':' رقم الوثيقة','quoteNo':'رقم الطلب','custName':'اسم العميل','otherUsers':'Other Users'}"  headerKey="" headerValue="اختار" cssClass="inputBoxS" onchange="setDefault(this)"/>
						</s:if>
						<s:else>
							<s:select name="searchBy" id="searchBy" list="#{'policyNo':'Policy No','quoteNo':'Quote No','custName':'Customer Name','otherUsers':'Other Users'}"  headerKey="" headerValue="Select" cssClass="inputBoxS" onchange="setDefault(this)"/>
						</s:else>
					</s:if>
					<s:else>
						<s:if test="locale.language == 'ar'">
							<s:select name="searchBy" id="searchBy" list="#{'policyNo':' رقم الوثيقة','quoteNo':'رقم الطلب','custName':'اسم العميل'}"  headerKey="" headerValue="اختار"  onchange="setDefault(this)" cssClass="inputBoxS"/>
						</s:if>
						<s:else>
							<s:select name="searchBy" id="searchBy" list="#{'policyNo':'Policy No','quoteNo':'Quote No','custName':'Customer Name'}"  headerKey="" headerValue="Select"  onchange="setDefault(this)" cssClass="inputBoxS"/>
						</s:else>
					</s:else>
				</div>
			</div>
			<s:if test='#session.usertype==getText("BROKER") || #session.usertype==getText("ISSUER")'> 
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
				<div class="text">
					<s:label key="report.selectuser" theme="simple"/>
				</div>
				<div class="tbox">
					<s:select list="userSelection" listKey="LOGIN_ID" listValue="USERNAME" name="loginId"  headerKey="" headerValue="Select" value='%{#session.product_id==getText("OPEN_COVER")?#session.userName:loginId}'  cssClass="inputBoxS"/>
				</div>
			</div>
			</s:if>
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
				<div class="text">
					<s:label key="search.enterDataForSearch"/>
				</div>
				<div class="tbox">
					<s:textfield name="searchValue" id="searchValue" onkeyup="getSearchResult('searchResult',this.value)" cssClass="inputBox"/>	
				</div>
			</div>
			<br class="clear" />
		</div>
		<br class="clear" />
		<div class="boxcontent">
			<div id="searchResult"></div>
		</div>
	</div>
</div>
<s:hidden name="openCoverNo" value="%{#session.openCoverNo}"/>
<s:hidden name="quoteNo"/>
<s:hidden name="quoteStatus"/>
<s:hidden name="tranId"/>
<s:hidden name="policyNo"/>
<s:hidden name="menuType"/> 
<s:hidden name="applicationNo"/>
<s:hidden name="referenceNo"/>
<s:hidden name="linkType" />
<s:hidden name="scrnFrom" />
<s:hidden name="quote_no" />
<s:hidden name="contentTypeId" />
<s:token/>
</s:form>
<script type="text/javascript">
function setDefault(obj) { 
 	var value=obj.value;  
 	var productCode='<s:text name="OPEN_COVER"/>';
 	var session_productCode='<s:property value="#session.product_id"/>'
 	var loginId='';
	loginId='<s:property value="#session.user"/>'; 
 	if(value=='policyNo' && session_productCode == productCode ) {  
 		document.getElementById('searchValue').value='<s:property value="#session.openCoverNo"/>';
 		getSearchResult('searchResult',document.search.searchValue.value);
 	} else {
 		 document.getElementById('searchValue').value='';   
 	}
 	if(session_productCode != productCode) {
 		postRequest('<%=request.getContextPath()%>/brokerListReport.action?searchBy='+value+'&loginId='+loginId,'brokerList');
 	}
}

if(document.search.searchValue.value!='') {
	getSearchResult('searchResult',document.search.searchValue.value);
}

function getSearchResult(id, searchValue) {
	var error='';
	var loginId='';
	var searchBy=document.search.searchBy.value;
	if('User'=='<s:property value="#session.usertype"/>'){
		loginId='<s:property value="#session.user"/>'; 
	} else {
		loginId=document.search.loginId.value;
	}
	if(searchBy=='') {
		error+='- <s:text name="error.searchBy.empty" />\n';
	} 
	if(loginId=='') {
		error+='- <s:text name="error.loginId.empty" />\n';
	}
	if(error=='' && searchValue!='') {
		postRequest('<%=request.getContextPath()%>/searchReport.action?searchBy='+searchBy+'&loginId='+loginId+'&searchValue='+searchValue+'&openCoverNo=<s:property value="#session.openCoverNo"/>'+'&searchFrom=S',id);
	} else if(error!='') {
		alert(error);
	}
}

function view(referenceNo,quote,product)
{
	document.search.referenceNo.value=referenceNo;
	document.search.action='<%=request.getContextPath()%>/viewQuotePremium.action';
	document.search.submit();
}
function editQuote(applicationNo,quoteNo, status,customerId, contentTypeId) { 
	document.search.quoteNo.value=quoteNo;
	document.search.quoteStatus.value=status;
	document.search.applicationNo.value=applicationNo;
	document.search.referenceNo.value=applicationNo;
	if(30=='<s:property value="#session.product_id"/>') {
		document.search.contentTypeId.value = contentTypeId;
		if(status!='RA') {
			document.search.display.value='getQuote';
		}
		document.search.action = "<%=request.getContextPath()%>/initHome.action";
	} else if(65=='<s:property value="#session.product_id"/>') {
		document.search.action = "<%=request.getContextPath()%>/editQuoteMotor.action";
	} else if(3=='<s:property value="#session.product_id"/>' || 11=='<s:property value="#session.product_id"/>') {
		document.search.action = "<%=request.getContextPath()%>/editQuoteQuotation.action";
	}else if(33 == '<s:property value="#session.product_id"/>'){
		if(status!='RA') {
			document.search.action = "<%=request.getContextPath()%>/initTravel.action";
			document.search.display.value='getQuote';
		}else{
			document.search.action = "<%=request.getContextPath()%>/showQuoteTravel.action";
		}
	}
	document.search.submit();
}

/*function editQuote(applicationNo,quoteNo, status,customerId) { 
	document.search.quoteNo.value=quoteNo;
	document.search.quoteStatus.value=status;
	document.search.applicationNo.value=applicationNo;
	document.search.action = "<%=request.getContextPath()%>/editQuoteQuotation.action";
	document.search.submit();
}
function sentMail(val){
	document.search.scrnFrom.value = "QuoteRegister";
	document.search.quote_no.value=val;
	document.search.action="mailController";
	document.search.submit();
}*/
function sentMail(applicationNo,linkType,quoteNo) {
	document.search.menuType.value='QL';
	document.search.applicationNo.value=applicationNo;
	document.search.linkType.value=linkType;
	document.search.quoteNo.value=quoteNo;		
	document.search.action='<%=request.getContextPath()%>/mailReport.action';
	document.search.submit();
}
function getPopup(val,val1,val2,val3) {
	var quoteNo=window.btoa(val);
	var docType=window.btoa(val2);
	var policy=window.btoa(val3);
	var URL ='<%=request.getContextPath()%>/documentpdfReport.action?quoteNo='+quoteNo+'&policyNo='+policy+'&docType='+docType;
	var bwidth = window.innerWidth;
	var bwidth1 = document.body.clientWidth;
	if(bwidth <= 768) {
		return popUp(URL,bwidth1,'500');
	} else {
		return popUp(URL,'750','500');
	}
}
</script>
</body>
</html>