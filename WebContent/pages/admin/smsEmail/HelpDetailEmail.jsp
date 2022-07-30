<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html <s:if test="locale.language == 'ar'">dir="rtl"</s:if> >
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>HomeHelp</title>
		<link href="<%=request.getContextPath()%>/bootstrap/css/footable-0.1.css" rel="stylesheet" type="text/css">
		<STYLE type="text/css">
		.tableHeading {
			background: #0078ae url(images/ui-bg_glass_45_0078ae_1x400.png) 50% 50% repeat-x;
			color: #ffffff; font-weight: bold; font-size: 14px;
		}
		</STYLE>
	</head>
	<body>
	 	<s:form name="helpInfo" theme="simple">
	 		<div class="container-fluid">
			<div class="row">
				<div class="col-xs-12">
					<div class="panel panel-primary">
						<div class="panel-heading">
						<s:text name="Help Detail For Sms Email Master"/>
						</div>
					</div>
					<div class="panel panel-body">
					<font color="red">
						* Use the Key Word for Replacing the Particular Description
					</font>
					</div>
			<table width="100%" border="0" align="center" class="footable">
				<thead>
					<tr>
						<th class="tableHeading">S.NO</th>
						<th class="tableHeading">KEYWORD</th>
						<th class="tableHeading">DESCRIPTION</th>
					</tr>
				</thead>
				<tbody>
		   			<tr>
						<td align="center" >1</td>
						<td align="center" >{CUST_NAME}</td>
						<td align="center" >For Showing Customer Name</td>
					</tr>
	   				<tr>
	   					<td align="center">2</td>
	   					<td align="center">{MOBILE_NO}</td>
	   					<td align="center">For Showing Customer Mobile No </td>
	   				</tr>
	   				<tr>
	   					<td align="center">3</td>
	   					<td align="center">{MAIL_ID}</td>
	   					<td align="center">For Showing Customer Mail Id</td>
	   				</tr>
	   				<tr>
	   					<td align="center">4</td>
	   					<td align="center">{QUOTE_NO}</td>
	   					<td align="center">For Showing Quotation No</td>
	   				</tr>
	   				<tr>
	   					<td align="center">5</td>
	   					<td align="center">{CUST_OTP}</td>
	   					<td align="center">For Showing Customer One Time Password</td>
	   				</tr>
	   				<tr>
	   					<td align="center">6</td>
	   					<td align="center">{CUST_PWD}</td>
	   					<td align="center">For Showing Customer Password</td>
	   				</tr>
	   				<tr>
	   					<td align="center">7</td>
	   					<td align="center">{PAY_AMOUNT}</td>
	   					<td align="center">For Showing Payment Amount or Premium</td>
	   				</tr>
	   				<tr>
	   					<td align="center">8</td>
	   					<td align="center">{PAYMENT_MODE}</td>
	   					<td align="center">For Showing Payment Mode ( Ex: Cash or Cheque )</td>
	   				</tr>
	   				<tr>
	   					<td align="center">9</td>
	   					<td align="center">{CLAIM_NO}</td>
	   					<td align="center">For Showing Claim Reference No</td>
	   				</tr>
	   				<tr>
	   					<td align="center">10</td>
	   					<td align="center">{PRODUCT_NAME}</td>
	   					<td align="center">For Showing Product Name ( Ex: Motor or Home )</td>
	   				</tr>
	   				<tr>
	   					<td align="center">11</td>
	   					<td align="center">{POLICY_NO}</td>
	   					<td align="center">For Showing Policy No</td>
	   				</tr>
	   				<tr>
	   					<td align="center">12</td>
	   					<td align="center">{SURVEYOUR_NAME}</td>
	   					<td align="center">For Showing Surveyor Name</td>
	   				</tr>
	   				<tr>
	   					<td align="center">13</td>
	   					<td align="center">{SURVEYOUR_MOBILE}</td>
	   					<td align="center">For Showing Surveyor Mobile No</td>
	   				</tr>
	   				<tr>
	   					<td align="center">14</td>
	   					<td align="center">{ENDT_TYPE_NAME}</td>
	   					<td align="center">For Showing Endoresment Type Name</td>
	   				</tr>
	   				<tr>
	   					<td align="center">15</td>
	   					<td align="center">{OP_USER_NAME}</td>
	   					<td align="center">For Showing Under writer (Operational User) Name</td>
	   				</tr>
	   				<tr>
	   					<td align="center">16</td>
	   					<td align="center">{SURVEYOUR_EMAIL_ID}</td>
	   					<td align="center">For Showing Surveyor Email Id</td>
	   				</tr>
	   				<tr>
	   					<td align="center">17</td>
	   					<td align="center">{PAYMENT_STATUS}</td>
	   					<td align="center">For Showing Payment Status (Ex: Success or Error)</td>
	   				</tr>
		   		</tbody>
			</table>
			</div>
		</div>
		</div>
		<s:token/>
	</s:form>
</body>
</html>