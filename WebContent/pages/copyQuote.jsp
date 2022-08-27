<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<!DOCTYPE HTML>
<html <s:if test="locale.language == 'ar'">dir="rtl"</s:if>>
<head>
	<s:if test="locale.language == 'ar'">
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min-rtl.css" />	
	</s:if>	
</head>
<body>
<div class="table0">
	<div class="tablerow">
		<font color="red"><s:actionerror/></font>
	</div>
	<div class="tablerow">
		<div class="boxcontent">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<s:text name="copyQuote.copyQuote" />
				</div>
				<div class="panel-body">
					<s:if test="display=='init'">
						<s:form name="copyCode" theme="simple" action="searchCopyQuote.action">
							<div class="row">
								<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
									<div class="text">
										<s:label key="copyQuote.searchBy" />
									</div>
									<div class="tbox">
										<s:if test="locale.language == 'ar'">
											<s:select name="searchType" id="searchType" list="#{'policyNo':'رقم الوثيقة','quoteNo':'رقم الطلب','custName':'اسم العميل'}"  headerKey="" headerValue="اختار" cssClass="inputBoxS" />
										</s:if>
										<s:else>
											<s:select name="searchType" id="searchType" list="#{'policyNo':'Policy No','quoteNo':'Quote No','custName':'Customer Name'}"  headerKey="" headerValue="---Select---" cssClass="inputBoxS" />
										</s:else>										
									</div>
								</div>
								<s:if test='#session.usertype==getText("ISSUER")'> 
									<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
										<div class="text">
											<s:label key="report.selectuser" theme="simple"/>
										</div>
										<div class="tbox">
											<s:select list="userSelection" listKey="LOGIN_ID" listValue="USERNAME" name="loginId"  headerKey="" headerValue="Select" value='%{#session.product_id==getText("OPEN_COVER")?#session.userName:loginId}'  cssClass="inputBoxS"/>
										</div>
									</div>
								</s:if>
								<s:else>
								<s:hidden name="loginId" value='%{#session.user}'/>
								</s:else>
								<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
									<div class="text">
										<s:label key="copyQuote.enterDataForSearch"/>
									</div>
									<div class="tbox">
										<s:textfield name="searchValue" cssClass="inputBox" />
									</div>
								</div>
								<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center" style="padding-top: 10px;">
									<s:submit type="button" name="Go"  key="copyQuote.go" cssClass="btn btn-sm btn-success" cssStyle="" />
								</div>
							</div>
							<s:token/>
						</s:form>
					</s:if>
					<s:elseif test="display=='search'">
					<s:form name="copyCodeSearch" theme="simple" action="copyCopyQuote.action">
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
								<s:if test="searchResult.size > 0">							
									<table width="100%" class="table table-bordered" id="copyQuoteTable">
										<thead>
										<tr>
											<th><s:text name="label.copy.sno" /></th>
											<th>&nbsp;</th>
											<th><s:text name="label.copy.quoteno" /></th>
											<th><s:text name="label.copy.cusname" /></th>
											<th><s:text name="label.copy.Premium" />(<s:property value="#session.BrokerDetails.CurrencyAbb"/>)</th>
										</tr>
										</thead>
										<tbody>
										<s:iterator value="searchResult" status="stat" var="record">
										<tr>
											<td><s:property value="%{#stat.index+1}"/></td>
											<td><input type="radio" name="selects"onclick="getQuoteNo('<s:property value="#record.QUOTE_NO"/>')"/></td>
											<td><s:property value="QUOTE_NO"/> </td>
											<td><s:property value="FIRST_NAME" /></td>
											<td align="right"><s:property value="PREMIUM" /></td>
										</tr>
										</s:iterator>
										</tbody>
									</table>					
									<s:hidden name="searchType"/>
									<s:hidden name="searchValue"/>
									<s:hidden name="loginId"/>
									
								</s:if>
								<s:else>
									<div align="center" style="font-size: 20px;font-weight: bold;">
										<s:if test='"policyNo".equalsIgnoreCase(searchType)'>
											<s:label key="copyQuote.notfoundmsg.policyNo"></s:label>		
										</s:if>
										<s:elseif test='"quoteNo".equalsIgnoreCase(searchType)'>	
											<s:label key="copyQuote.notfoundmsg.quoteNo"></s:label>	
										</s:elseif>
										<s:elseif test='"custName".equalsIgnoreCase(searchType)'>
											<s:label key="copyQuote.notfoundmsg.custName"></s:label>		
										</s:elseif>
										<s:else>
											<s:label key="copyQuote.notfoundmsg"></s:label>
										</s:else>
									</div>
								</s:else>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
								<s:submit type="button" name="close"  key="label.copy.Cancel" cssClass="btn btn-sm btn-danger" onclick="backButtonAction();"/>&nbsp;&nbsp;&nbsp;
		                   		<s:if test="searchResult.size > 0">
									<s:submit type="submit" name="submit" key="label.copy.Submit" cssClass="btn btn-sm btn-success"/>
								</s:if>
							</div>
						</div>
						<s:hidden name="copyQuoteValue"></s:hidden>
						<s:token/>
					</s:form>
					</s:elseif>
					<s:elseif test="display=='copyquote'">
					<s:form name="copyCode" theme="simple" action="redirectCopyQuote.action">
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
								<div align="center" style="font-size: 20px;color: blue;">
									<s:property value="msg" />
								</div>
								<br class="clear"/>
								<div align="center">
									<s:submit type="submit" name="submit" key="copyQuote.proceed" cssClass="btn btn-sm btn-success"/>
								</div>
								<s:hidden name="searchCriteria"></s:hidden>
							</div>
						</div>
						<s:token/>
					</s:form>
					</s:elseif>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
function setDefault(obj) { 
 	var value=obj.value;  
 	var productCode='<s:text name="OPEN_COVER"/>';
 	var session_productCode='<s:property value="#session.product_id"/>'
 	if(value=='policyNo' && session_productCode == productCode ) {  
 		document.getElementById('openCover_No').value='<s:property value="#session.openCoverNo"/>'
 	    document.getElementById('openCover').style.display='block';  	
 	    document.getElementById('oneOff').style.display='none';     		
 	} else {
		document.getElementById('oneOff').style.display='block';   
		document.getElementById('openCover').style.display='none';   
 	}
}
function getQuoteNo(obj) { 
	document.copyCodeSearch.copyQuoteValue.value=obj; 	
}
function backButtonAction() {
 	document.copyCodeSearch.action='<%=request.getContextPath()%>/initCopyQuote.action'
 	document.copyCodeSearch.submit();
}
</script>
</body>
</html>				