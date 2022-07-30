<%@ page language="java" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<s:if test="issuer != null">
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading"><s:text name="customer.brokerInfo" /></div>
			<div class="panel-body">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text"><s:text name="customer.broker"  /><font color="red">*</font></div>
						<div class="tbox">
							<s:select name="brokerCode" id="brokerCode" list="brokerList" headerKey="" headerValue="---Select---"  listKey="CODE" listValue="CODEDESC" cssClass="inputBoxS tooltipContent" data-content="Broker Code" onchange="getExecutive('?brokerCode='+this.value,'executiveList');emptyCustInfo();" disabled="%{brokerCode!=null && brokerCode!=''}"/>
	                 		<s:hidden name="brokerName" />	
						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text"><s:text name="customer.executive" /><font color="red">*</font></div>
						<div class="tbox">
							<div id="executiveList"><s:select name="executive" list="executiveList" headerKey="" headerValue="---Select---" listKey="CODE" listValue="CODEDESC" cssClass="inputBoxS tooltipContent" data-content="Executive Name" disabled="#disable" value='executive==null?getText("customer.executiveDefault"):executive'/></div>
						</div>
					</div>
				</div>
			</div>
		</div>		
	</div>
</div>
</s:if>
<s:else>
	<s:hidden name="brokerCode" />
	<s:hidden name="executive" />
</s:else>
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading"><s:text name="customer.customerInfo" /></div>
			<div class="panel-body">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text"><s:text name="customer.title"  /><font color="red">*</font></div>
						<div class="tbox">
							<s:select name="title" id="title" list="titleList" headerKey="" headerValue="---Select---"  listKey="CODEDESC" listValue="CODEDESC" cssClass="inputBoxS tooltipContent" data-content="Title" disabled="#disable1"/>
						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text"><s:text name="customer.customerName" /><font color="red">*</font></div>
						<div class="tbox">
							<s:if test='%{#session.LoginType!="B2C" && !"User".equalsIgnoreCase(#session.usertype)}'>
								<s:textfield name="customerName" id="customerName" cssClass="inputBox tooltipContent" data-content="Customer Name" cssStyle="width:85%;"  maxlength="200" disabled="#disable1" />
								<s:submit type="button" value="..." cssClass="inputButton"  onclick="return customerSelectionAction(this.form)" />
							</s:if>
							<s:else>
								<s:textfield name="customerName" id="customerName" cssClass="inputBox tooltipContent" data-content="Customer Name" maxlength="200" disabled="#disable1" />
							</s:else>
							<s:hidden name="customerId"  id="customerId"/>
						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4" style="display: none;">
						<div class="text"><s:text name="customer.coreAppCode" /></div>
						<div class="tbox">
							<s:textfield name="coreAppCode" id="coreAppCode" cssClass="inputBox tooltipContent" data-content="Core App Code" cssStyle="width:85%;" readonly="true" disabled="#disable1"/>
							<s:submit type="button" value="..." cssClass="inputButton" onclick="return coreCustomerSearch()" />
			                 <s:hidden name="custArNo" id="custArNo"/>
			                 <s:hidden name="custCoreCode" id="custCoreCode"/>
			                 <s:hidden name="clientCustomerId" id="clientCustomerId"/>
						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text"><s:text name="customer.address1" /><font color="red">*</font></div>
						<div class="tbox">
							<s:textfield name="address1" id="address1" cssClass="inputBox"  maxlength="200" disabled="#disable1"/>
						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text"><s:text name="customer.address2" /></div>
						<div class="tbox">
							<s:textfield name="address2" id="address2" cssClass="inputBox" maxlength="200" disabled="#disable1"/>
						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text"><s:text name="customer.city" /><font color="red">*</font></div>
						<div class="tbox">
							<s:select name="city" id="city" list="cityList" headerKey="" headerValue="---Select---" listKey="CODEDESC" listValue="CODEDESC" cssClass="inputBoxS tooltipContent" data-content="City" disabled="#disable1"/>
						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text"><s:text name="customer.poBox" /></div>
						<div class="tbox">
							<s:textfield name="poBox" id="poBox" cssClass="inputBox tooltipContent" data-content="P.O.Box" maxlength="6" onkeyup="checkNumbers(this);" disabled="#disable1"/>
						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text"><s:text name="customer.mobileNo" /><font color="red">*</font></div>
						<div class="tbox">
							<s:textfield name="mobileNo" id="mobileNo" cssClass="inputBox tooltipContent" data-content="Mobile No." maxlength="10" onkeyup="checkNumbers(this);" disabled="#disable1"/>
						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text"><s:text name="customer.email" /><font color="red">*</font></div>
						<div class="tbox">
							<s:textfield name="email" id="email" cssClass="inputBox tooltipContent" data-content="Email" disabled="#disable1"/>
						</div>
					</div>
				</div>
			</div>
		</div>		
	</div>
</div>
 <script  type="text/javascript">
 	function getExecutive(val, id)
	{
			postRequest('<%=request.getContextPath()%>/'+id+'Customer.action'+val, id);
	}
	function emptyCustInfo()
	{
		var s="poBox&mobileNo&email&title&customerName&coreAppCode&address2&address1&city"; 
		var stringToArray = new Array;
		stringToArray = s.split("&");
		for ( var int = 0; int < stringToArray.length; int++) {		
				var obj=stringToArray[int]
				document.getElementById(""+obj).value="";
			}
	}
	function customerSelectionAction(frm)
	{	
		var brokerCode='';	
		if(frm.brokerCode){			
				brokerCode=frm.brokerCode.value;		
		}
	     var URL ='<%=request.getContextPath()%>/customerSelectionCustomer.action?brokerCode='+brokerCode;
	     return popUp(URL,'700','500');
	}
	function coreCustomerSearch()
	{
	     var URL ='<%=request.getContextPath()%>/coreCustSearchCustomer.action';
		 return popUp(URL,'700','500');
	}
</script>	