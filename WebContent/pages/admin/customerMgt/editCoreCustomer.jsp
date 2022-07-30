<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE HTML>
<html>
<head>
</head>
<body>
<s:form id="editCustomer" name="editCustomer" method="post"  theme="simple" >
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<table class="footable tableWidth">
			<tbody>
			<tr>
				<td width="40%"><s:text name="First Name" /> </td>
				<td width="60%"> <s:property value="cfirstname"/> </td>
			</tr>
			<tr>
				<td> <s:text name="Post Box" /> </td>
				<td> <s:property value="cpobox"  /> </td>
			</tr>
			<tr>
				<td> <s:text name="Mail" /> </td>
				<td> <s:property value="mail" /> </td>
			</tr>
			<tr>
				<td> <s:text name="Customer Code" /> <font color="red">*</font> </td>
				<td> <s:textfield name="cmissipiCode" cssClass="inputBox" size="35" maxlength="30" /> </td>
			</tr>			
			</tbody>
		</table>
	</div>
</div>
<br class="clear" />
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
		<input type="button" onclick="funChView()" name="submitd" class="btn btn-sm btn-success" value="Submit" /> &nbsp;&nbsp;&nbsp;
		<input type="button" onclick="fnsubmit()" name="back" class="btn btn-sm btn-danger" value="Back" />
		<s:hidden name="customerId"/>
		<s:hidden name="mode"/>
	</div>
</div>
<s:token/>
</s:form>
</body>
<script type="text/javascript">
function funChView(){
	document.editCustomer.mode.value="update";
	document.editCustomer.action="editCoreCustomerCustomerMgm.do";
	document.editCustomer.submit();
}
function fnsubmit(){
	document.editCustomer.action="coreCustomerCustomerMgm.do";
	document.editCustomer.submit();
}
</script>
</html>