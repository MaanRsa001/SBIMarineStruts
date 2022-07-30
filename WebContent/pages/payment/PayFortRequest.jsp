<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
	#loading {
	  width: 200%;
	  height: 200%;
	  top: 0px;
	  left: 0px;
	  position: fixed;
	  display: block;
	  opacity: 0.7;
	  background-color: #fff;
	  z-index: 100;
	  text-align: center;
	}
	
	#loading-image {
	  position: absolute;
	  top: 20%;
	  left: 45%;
	  z-index: 100;
	}
	#message-loading{
	  position: absolute;
	  top: 30%;
	  left: 45%;
	  z-index: 100;
	}
</style>
</head>
<body>
	<%-- <form method="post" action="https://checkout.payfort.com/FortAPI/paymentPage" id="form1" name="form1"> <%-- Live --%>
	<form method="post" action="https://sbcheckout.payfort.com/FortAPI/paymentPage" id="form1" name="form1"><%--Test --%>
		<div id="loading" style="width:100%;">
			<img id="loading-image" src="<%=request.getContextPath()%>/images/logonew.png" id="loader"/>
			<span id="message-loading"> <s:text name="label.motor.pleasewait"/> </span>	
			PLEASE DON'T REFRESH THE PAGE
		</div>
		<s:hidden name="access_code"/>
		<s:hidden name="amount"/>
		<s:hidden name="command"/>
		<s:hidden name="currency"/>
		<s:hidden name="customer_email"/>
		<s:hidden name="customer_ip"/>
		<s:hidden name="customer_name"/>
		<s:hidden name="eci"/>
		<s:hidden name="language"/>
		<s:hidden name="merchant_identifier"/>
		<s:hidden name="merchant_reference"/>		
		<s:hidden name="order_description"/>  
		<s:hidden name="payment_option"/> 
		<s:hidden name="return_url"/>
		<s:hidden name="signature"/>
	</form>
	<br/>
</body>
<script type="text/javascript">
	document.form1.submit();
</script>

</html>