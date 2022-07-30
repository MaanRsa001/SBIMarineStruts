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

<s:if test="display=='init'">
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<s:actionerror cssStyle="color: red;" />
	</div>
</div>
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:label key="copyQuote.copyQuote" />
			</div>
			<div class="panel-body">
				<div class="row">
						<div class="col-md-4">
							<s:label key="copyQuote.searchBy" />
							<s:select name="searchType" id="searchType" list="#{'proposalNo':'Proposal No'}"  headerKey="" headerValue="---Select---" cssClass="inputBoxS" />				
						</div>
						<div class="col-md-4">
							<s:label key="copyQuote.enterDataForSearch"/>
							<s:textfield name="searchValue"  cssClass="inputBox"/>
						</div>
						<div class="col-md-4" align="center">
							<br/>
							<s:submit type="button" name="Go"  key="copyQuote.go" cssClass="btn btn-sm btn-success" onclick="searchCopy();"/>
						</div>
					</div>
			</div>
		</div>
	</div>
</div>
</s:if>	
<s:elseif test="display=='search'">
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:label key="copyQuote.copyQuote" />
			</div>
			<div class="panel-body">
			<div class="row">
				<div class="col-xs-12">
					<s:if test="searchResult.size > 0">							
						<table width="100%" class="table table-bordered" >
							<thead>
							<tr>
								<th><s:text name="S.No." /></th>
								<th>&nbsp;</th>
								<th><s:text name="Proposal Number" /></th>
								<th><s:text name="OpenCover Number" /></th>
								<th><s:text name="Customer Name" /></th>										 
							</tr>
							</thead>
							<tbody>
							<s:iterator value="searchResult" status="stat" var="record">
							<tr>
								<td><s:property value="%{#stat.index+1}"/></td>
								<td><input type="radio" name="selects" onclick="getQuoteNo('<s:property value="#record.ProposalNo"/>','<s:property value="#record.FirstName"/>')"/></td>
								<td><s:property value="ProposalNo"/> </td>
								<td><s:property value="OpenCoverNo"/> </td>
								<td><s:property value="FirstName" /></td>											
							</tr>
							</s:iterator>
							</tbody>
						</table>					
						<s:hidden name="searchType"/>
						<s:hidden name="searchValue"/>
					</s:if>
					<s:else>
					<br/>
					<div align="center" style="font-size: 20px;font-weight: bold;">
						<s:label key="opencopyQuote.notfoundmsg"></s:label>
					</div>
					</s:else>
				</div>
			</div>
			<div class="row">
				<s:if test="searchResult.size > 0">
					<div class="col-xs-6" align="center">
						<s:submit type="button" name="close"  key="Cancel" cssClass="btn btn-sm btn-danger" onclick="backButtonAction();"/>
					</div>
		            <div class="col-xs-6" align="center">
						<s:submit type="submit" name="submit" key="Submit" cssClass="btn btn-sm btn-success"  onclick="copyQuote();"/>
					</div>				
				</s:if>
				<s:else>
					<div class="col-xs-12" align="center">
						<s:submit type="button" name="close"  key="Cancel" cssClass="btn btn-sm btn-danger" onclick="backButtonAction();"/>
					</div>
				</s:else>
			</div>
			</div>
		</div>
	</div>
</div>
</s:elseif>
<s:elseif test="display=='copyquote'">
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:label key="copyQuote.copyQuote" />
			</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-xs-12" align="center" style="font-size: 20px;color: blue;list-style: none;">
						<s:actionerror cssStyle="list-style: none;"/>
					</div>
				</div>
				<br/>
				<div class="row">
					<div class="col-xs-12" align="center">
						<s:submit type="submit" name="submit" key="copyQuote.proceed" cssClass="btn btn-sm btn-success" onclick="proceedBtn();"/>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</s:elseif>		
<s:hidden name="proposalNo" id="proposalNo"/>
<s:hidden name="copyQuoteValue"></s:hidden>
<s:token/>
</s:form>
<script type="text/javascript">
function searchCopy(){
	document.Quotation.action = 'copySearchReportReg.action';
	document.Quotation.submit();
}
function copyQuote(){
	document.Quotation.action = 'openCopyReportReg.action';
	document.Quotation.submit();
}
function proceedBtn(){
	document.Quotation.action = 'quoteRegisterReportReg.action';
	document.Quotation.submit();
}
function backButtonAction()
{
	document.Quotation.action='copyQuoteReportReg.action';
	document.Quotation.submit();
}
function getQuoteNo(obj)
{ 
	document.Quotation.copyQuoteValue.value=obj; 	
}
</script>	
</body>
</html>