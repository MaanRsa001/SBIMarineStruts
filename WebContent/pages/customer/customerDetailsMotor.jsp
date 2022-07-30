<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<s:if test='issuer != null'>
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
  			<div class="panel-heading txtB">
  				<s:text name="customer.brokerInfo" />
  			</div>
  			<div class="panel-body">
  				<div class="row">
  					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
  						<div class="form-group form-float">
	  						<label class="form-label"><s:text name="customer.broker.name"  /><font color="red">*</font></label>
	  						<div class="form-line">
	  							<s:select name="brokerCode" id="brokerCode" list="brokerList" headerKey="" headerValue="---Select---" listKey="CODE" listValue="CODEDESC" cssClass="form-control tooltipContent" data-content="Select Broker" onchange="getExecutive('?brokerCode='+this.value,'executiveList');emptyCustInfo();" disabled="%{brokerCode!=null && brokerCode!=''}"/>
	                 			<s:hidden name="brokerName" />
	  						</div>
	  					</div>
  					</div>
  					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
	  					<div class="form-group form-float">
	 						<label class="form-label"><s:text name="customer.executive.info"  /><font color="red">*</font></label>
	 						<div class="form-line">
	 							<div id="executiveList"><s:select name="executive" list="executiveList" headerKey="" headerValue="---Select---" listKey="CODE" listValue="CODEDESC" cssClass="form-control tooltipContent" data-content="Select Executive" disabled="#disable" value='executive==null?getText("customer.executiveDefault"):executive'/></div>
	 						</div>
	 					</div>
  					</div>
  					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
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
	<s:if test='"newQuote".equalsIgnoreCase(display) || "getQuote".equalsIgnoreCase(display) || "getCustomer".equalsIgnoreCase(display)'>
		<div class="panel panel-primary">
  			<div class="panel-heading txtB">
  				<s:text name="customer.customerInfo" />
				<s:if test='%{"65".equals(#session.product_id)}'>
					<%--<sj:dialog id="helpInfo_customerDetails" title='%{getText("customer.customerInfo")}' autoOpen="false" modal="true" showEffect="explode" hideEffect="explode"/>
					<sj:a openDialog="helpInfo_customerDetails" href="getHelpInfoMotor.action?helpType=CUSTOMER_INFORMATION"><img src="<%=request.getContextPath()%>/images/Help.png" width="20" height="20"/></sj:a>
				
					<s:if test='quoteNo!=null && quoteNo!=""'>
						<div class="pull-right">
							<s:text name="label.quote.no"> &nbsp;&nbsp; : </s:text>
							<s:property value="quoteNo"/>					
						</div>					
					</s:if>--%>
				</s:if>
				<s:elseif test='%{"33".equals(#session.product_id)}'>
					<s:if test='quoteNo!=null && quoteNo!=""'>
						<div class="pull-right">
							<s:text name="label.quote.no"> &nbsp;&nbsp; : </s:text>
							<s:property value="quoteNo"/>					
						</div>					
					</s:if>
				</s:elseif>
  			</div>
  			<div class="panel-body">
  				<div class="row">
  					<s:if test='%{#session.product_id=="65"}'>
  						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4"  id="transferownerName" style="display: none;">
  						<div class="form-group form-float">
	  						<label class="form-label"><s:text name="customer.customerName(English)"  /><font color="red">*</font></label>
	  						<div class="row">
	  							<div class="col-xs-12 col-md-4">
		  							<div class="form-line">
	  									<s:select name="title" id="title" list="titleList" listKey="CODEDESC" listValue="CODEDESC" cssClass="form-control tooltipContent" data-content="Title" disabled="#disable1"/>
	  								</div>
	  							</div>
	  							<div class="col-xs-12 col-md-8">
	  								<div class="form-line">
		  								<s:textfield name="customerName" id="customerName" cssClass="form-control tooltipContent charOnly" data-content="Customer Name (English)" maxlength="40" disabled="#disable1" onchange="setDriverNameEng(this);" onblur="" /><s:hidden name="customerId"  id="customerId"/>
									</div>
	  							</div>
	  						</div>	  						
	  					</div>
  					</div>
  					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4" style="display: none;">
  						<div class="form-group form-float">
	  						<label class="form-label"><s:text name="customer.customerName(Arabic)"  /></label>
	  						<div class="form-line">
	  							<s:textfield name="custNameArabic" id="custNameArabic" cssClass="form-control tooltipContent" data-content="Customer Name (Arabic)"  maxlength="40" disabled="#disable1" onchange="setDriverNameArabic(this);" onblur=""/>
	  						</div>
	  					</div>
  					</div>
	  					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
	  						<div class="form-group form-float">
		  						<label class="form-label"><s:text name="customer.nationalID"  /><font color="red">*</font></label>
		  						<div class="form-line">
		  							<s:textfield name="companyRegNo" id="companyRegNo" cssClass="form-control tooltipContent" data-content="National Id" maxlength="18" disabled="#disable1" oninput="swapDOB(this.value);"  onkeyup="checkNumbers(this);" onchange="setDriverId(this);" onblur=""/>
		  							<!-- getnijmAjax(this.form,'?driverIdajax='+this.value,'nijmAjax'); -->
		  						</div>
		  					</div>
		  				</div>
  					</s:if>
  					<s:else>
  						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
  						<s:if test='%{#session.LoginType!="B2C" && !"User".equalsIgnoreCase(#session.usertype)}'>
							<div class="input-group form-float">
								<label class="form-label"><s:text name="customer.customerName(English)"  /><font color="red">*</font></label>
									<div class="row">
			  							<div class="col-xs-12 col-md-4">
				  							<div class="form-line">
			  									<s:select name="title" id="title" list="titleList" listKey="CODEDESC" listValue="CODEDESC" cssClass="form-control tooltipContent" data-content="Title" disabled="#disable1"/>
			  								</div>
			  							</div>
			  							<div class="col-xs-12 col-md-8">
			  								<div class="input-group">
			  									<div class="form-line">
							                        <s:textfield name="customerName" id="customerName" cssClass="form-control tooltipContent" data-content="Customer Name (English)"  cssStyle="width:85%;" maxlength="40" disabled="#disable1" onchange="setDriverNameEng(this);"  /><s:hidden name="customerId"  id="customerId"/>
							                    </div>
							                    <span class="input-group-addon">
													<s:submit type="button" value="..." cssClass="inputButton" onclick="return customerSelectionAction(this.form)" disabled="#disable1"/>
												</span>
			  								</div>		  								
			  							</div>
			  						</div>
								</div>
	  						</s:if>
	  						<s:else>
	  						<div class="form-group form-float">
		  						<label class="form-label"><s:text name="customer.customerName(English)"  /><font color="red">*</font></label>
		  						<div class="row">
		  							<div class="col-xs-12 col-md-4">
			  							<div class="form-line">
		  									<s:select name="title" id="title" list="titleList" listKey="CODEDESC" listValue="CODEDESC" cssClass="form-control tooltipContent" data-content="Title" disabled="#disable1"/>
		  								</div>
		  							</div>
		  							<div class="col-xs-12 col-md-8">
		  								<div class="form-line">
			  								<s:textfield name="customerName" id="customerName" cssClass="form-control tooltipContent charOnly" data-content="Customer Name (English)" maxlength="40" disabled="#disable1" onchange="setDriverNameEng(this);" onblur="" /><s:hidden name="customerId"  id="customerId"/>
										</div>
		  							</div>
		  						</div>	  						
		  					</div>
	  						</s:else>
	  					</div>
	  					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
	  						<div class="form-group form-float">
		  						<label class="form-label"><s:text name="customer.customerName(Arabic)"  /></label>
		  						<div class="form-line">
		  							<s:textfield name="custNameArabic" id="custNameArabic" cssClass="form-control tooltipContent" data-content="Customer Name (Arabic)"  maxlength="40" disabled="#disable1" onchange="setDriverNameArabic(this);" onblur=""/>
		  						</div>
		  					</div>
	  					</div>
	  					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
	  						<div class="form-group form-float">
		  						<label class="form-label"><s:text name="customer.nationalID"  /><font color="red">*</font></label>
		  						<div class="form-line">
		  							<s:textfield name="companyRegNo" id="companyRegNo" cssClass="form-control tooltipContent alphanumeric1" data-content="National Id" maxlength="10" disabled="#disable1" onkeyup="setDriverId(this);" onblur=""/>
		  						</div>
		  					</div>
	  					</div>	
  					</s:else>
  					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
  						<div class="form-group form-float">
	  						<label class="form-label"><s:text name="customer.email"  /><font color="red">*</font></label>
	  						<div class="form-line">
	  							<s:textfield name="email" id="email" cssClass="form-control tooltipContent" data-content="Email Id" disabled="#disable1" maxlength="30"/>
	  						</div>
	  					</div>
  					</div>  
  					<s:if test='%{"65".equals(#session.product_id)}'>
						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
  						<div class="form-group form-float">
	  						<label class="form-label"><s:text name="customer.mobileNo1"  /><font color="red">*</font></label>
	  						<div class="form-line">
	  							<s:textfield name="mobileNo" id="mobileNo" cssClass="form-control tooltipContent numericOnly" data-content="Mobile No.(Starts with 05), Verification Code Will be sent to this Mobile Number" maxlength="10" onkeyup="checkNumbers(this);" disabled='%{("Y".equalsIgnoreCase(b2cCustYN) && "User".equalsIgnoreCase(#session.usertype))?"true":"#disable1"}'/>
	  						</div>
	  					</div>
  					</div>
					</s:if>
					<s:elseif test='%{"33".equals(#session.product_id)}'>
						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
  						<div class="form-group form-float">
	  						<label class="form-label"><s:text name="customer.mobileNo1"  /><font color="red">*</font></label>
	  						<div class="form-line">
	  							<s:textfield name="mobileNo" id="mobileNo" cssClass="form-control tooltipContent numericOnly" data-content="Mobile No.(Starts with 05), Verification Code Will be sent to this Mobile Number" maxlength="10" onkeyup="checkNumbers(this);" disabled="#disable1"/>
	  						</div>
	  					</div>
  					</div>
					</s:elseif>					
  					<%--<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
  						<label class="form-label"> <s:text name="customer.customerType"  /><font color="red">*</font> </div>
  						<div class="form-line">
  							<s:radio name="customerType" id="customerType" list="#{'INDIVIDUAL':'Individual','CORPORATE':'Corporate'}" value='%{(customerType==null||"".equals(customerType))?"CORPORATE":customerType}' cssClass="input" disabled="#disable1" onclick="toggleCompanyRegistration(this.value);"/>
  						</div>  						
  					</div>
  					--%>
  					<s:if test='%{#session.product_id=="65"}'>
  						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
  							<div id="greDob" style="display: block;">
  							<div class="form-group form-float">
								<label class="form-label"><s:text name="customer.dob" /><font color="red">*</font></label>
	  							<div class="form-line">
  									<s:textfield name="custdob" id="custdob" cssClass="form-control datePicker  tooltipContent" data-content="Date of Birth" disabled="#endtDisable" readonly="true" onchange="setDriverDOB(this.value);"/>
  								</div>
  							</div>
  							</div>
  							<div id="hijDob" style="display: none;">
								<div class="form-group form-float">
									<label class="form-label"><s:text name="customer.dob.ar" /><font color="red">*</font></label>
		  							<div class="form-line">
	  									<s:textfield name="custdobar" id="dobArDatepicker" cssClass="form-control datePicker  tooltipContent" data-content="Date of Birth" disabled="#endtDisable" readonly="true" onchange="setDriverDOB(this.value);"/>
	  								</div>
  							</div>
							</div>
  						</div>
  					</s:if>
  					<s:else>
  						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
	  						<div class="form-group form-float">
		  						<label class="form-label"><s:text name="customer.dob" /><font color="red">*</font></label>
		  						<div class="form-line">
		  							<s:textfield name="custdob" id="custdob" cssClass="form-control datePicker  tooltipContent" data-content="Date of Birth" disabled="#disable1" readonly="true" onchange="setDriverDOB(this.value);"/>
		  						</div>
		  					</div>
	  					</div>
  					</s:else>
  					
  				</div>
  				<s:hidden name="custLastName" id="custLastName"/>
  				<s:hidden name="address1" id="address1"/>
				<s:hidden name="address2" id="address2"/>
				<s:hidden name="city" id="city"/>
				<s:hidden name="poBox" id="poBox"/>
				<!--<s:hidden name="custdob" id="custdob"/>
				<s:hidden name="custdobar" id="custdobar"/>-->
				<s:hidden name="custAlterMobileNo" id="custAlterMobileNo"/>
  				<s:hidden name="coreAppCode" id="coreAppCode"/>
				<s:hidden name="custArNo" id="custArNo"/>
				<s:hidden name="custCoreCode" id="custCoreCode"/>
				<s:hidden name="clientCustomerId" id="clientCustomerId"/>
				<s:hidden name="occupation" id="occupation"/>
				<s:hidden name="buildingNo" id="buildingNo"/>
				<s:hidden name="additionalNo" id="additionalNo"/>
				<s:hidden name="nationality" id="nationality"/>
				</div>
			</div>
	</s:if>
	<s:else>
		<div class="panel panel-primary">
	  			<div class="panel-heading txtB">
	  				<s:text name="customer.customerInfo" />
					<s:if test='%{"65".equals(#session.product_id)}'>
						<%--<sj:dialog id="helpInfo_customerDetails" title='%{getText("customer.customerInfo")}' autoOpen="false" modal="true" showEffect="explode" hideEffect="explode"/>
						<sj:a openDialog="helpInfo_customerDetails" href="getHelpInfoMotor.action?helpType=CUSTOMER_INFORMATION"><img src="<%=request.getContextPath()%>/images/Help.png" width="20" height="20"/></sj:a>
					--%></s:if>
					<s:elseif test='%{"33".equals(#session.product_id)}'>
						<s:if test='quoteNo!=null && quoteNo!=""'>
							<div class="pull-right">
								<s:text name="label.quote.no"> &nbsp;&nbsp; : </s:text>
								<s:property value="quoteNo"/>					
							</div>					
						</s:if>
					</s:elseif>
	  		</div>
  			<div class="panel-body">
  			<s:if test='%{"65".equals(#session.product_id)}'>
  				<div class="row">
  					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4"  style="display: none;">
  						<div class="form-group form-float">
	  						<label class="form-label"><s:text name="customer.title"  /><font color="red">*</font></label>
	  						<div class="form-line">
	  							<s:select name="title" id="title" list="titleList" listKey="CODEDESC" listValue="CODEDESC" cssClass="form-control tooltipContent" data-content="Title" disabled="#disable1"/>
	  						</div>
	  					</div>
  					</div>
  					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4"  style="display: none;">
  						<div class="form-group form-float">
	  						<label class="form-label"><s:text name="customer.firstName"/><font color="red">*</font></label>
	  						<div class="form-line">
	  							<s:if test='%{#session.LoginType!="B2C" && !"User".equalsIgnoreCase(#session.usertype)}'>
		  							<s:textfield name="customerName" id="customerName" cssClass="form-control tooltipContent charOnly" data-content="First Name" cssStyle="width:85%;" maxlength="40" disabled="#disable1" /><s:hidden name="customerId"  id="customerId"/>
									<%--<s:submit type="button" value="..." cssClass="inputButton" onclick="return customerSelectionAction(this.form)" />
								--%></s:if>
								<s:else>
									<s:textfield name="customerName" id="customerName" cssClass="form-control tooltipContent charOnly" data-content="First Name" maxlength="40" disabled="#disable1" /><s:hidden name="customerId"  id="customerId"/>
								</s:else>
	  						</div>
	  					</div>
  					</div>
  					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4"  style="display: none;">
  						<div class="form-group form-float">
	  						<label class="form-label"><s:text name="customer.lastName"/></label>
	  						<div class="form-line">
	  							<s:textfield name="custLastName" id="custLastName" cssClass="form-control tooltipContent charOnly" data-content="Last Name"  maxlength="20" disabled="#endtDisable"/>
	  						</div>
	  					</div>
  					</div>
  					<s:hidden name="customerType"/>
  					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
  						<div class="form-group form-float">
							<label class="form-label"> <s:text name="customer.occupation" /><font color="red">*</font> </label>
							<div class="form-line">
								<s:select name="occupation" id="occupation" list="occupationList" headerKey="" headerValue="---Select---" listKey="CODE" listValue="CODEDESC" cssClass="form-control" style="height:50%"/>
							</div>
						</div>
					</div>
  					
  					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4" style="display: none;">
  						<div class="form-group form-float">
	  						<label class="form-label"><s:text name="customer.nrc"/></label>
	  						<div class="form-line">
	  							<s:textfield name="custnrc" id="custnrc" cssClass="form-control tooltipContent" data-content="National Registration Card No."  maxlength="25" disabled="#endtDisable"/>
	  						</div>
	  					</div>
  					</div>
  					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4" style="display: none;">
  						<div class="form-group form-float">
	  						<label class="form-label"><s:text name="customer.passportNo"/><font color="red">*</font></label>
	  						<div class="form-line">
	  							<s:textfield name="custPassportNo" id="custPassportNo" cssClass="form-control tooltipContent" data-content="Passport No."  maxlength="25" disabled="#endtDisable"/>
	  						</div>
	  					</div>
  					</div>
  					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4" style="display: none;">
  						<div class="form-group form-float">
	  						<label class="form-label"><s:text name="customer.coreAppCode"  /></label>
	  						<div class="form-line">
	  							<s:if test='%{#session.LoginType!="B2C" && !"User".equalsIgnoreCase(#session.usertype)}'>
									<s:textfield name="coreAppCode" id="coreAppCode" cssClass="form-control tooltipContent" data-content="Core App Code" cssStyle="width:85%;" readonly="true" disabled="#disable1"/>
									<s:submit type="button" cssClass="inputButton" value="..." onclick="return coreCustomerSearch()" />
								</s:if>
								<s:else>
									<s:textfield name="coreAppCode" id="coreAppCode" cssClass="form-control tooltipContent" data-content="Core App Code" readonly="true" disabled="#disable1"/>
								</s:else>
	  						</div>
	  					</div>
						<s:hidden name="custArNo" id="custArNo"/>
						<s:hidden name="custCoreCode" id="custCoreCode"/>
						<s:hidden name="clientCustomerId" id="clientCustomerId"/>
  					</div>
  					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
  						<div class="form-group form-float">
	  						<label class="form-label"><s:text name="customer.nationality"  /><font color="red">*</font></label>
	  						<div class="form-line">
	 							<s:select name="nationality" id="nationality" list="nationalityList" headerKey="" headerValue="---Select---" listKey="CODE" listValue="CODEDESC" cssClass="form-control tooltipContent" data-content="Title" disabled="#endtDisable"/>
		  					</div>
		  				</div>
	  				</div>	
  				</div>
  				<s:if test='"policyInfo".equalsIgnoreCase(display)'>
  					<s:set var="yakeenAdd" value='%{"Y".equalsIgnoreCase(webStatus)}' />	
	  				<div class="row">
	  					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							<div class="form-group form-float">
		  						<label class="form-label"><s:text name="cust.buildingNo"/><font color="red">*</font></label>
		  						<div class="form-line">
		  							<s:textfield name="buildingNo" id="buildingNo" cssClass="form-control tooltipContent" data-content="Building No" maxlength="4" oninput="checkNumbers(this);setWaselAddres('2');" onblur="setWaselAddres('2');" readonly='%{buildingNo==null || buildingNo==""?false:#yakeenAdd}' disabled="#endtDisable"/>
		  						</div>
		  					</div>
	  					</div>
	  					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
	  						<div class="form-group form-float">
		  						<label class="form-label"><s:text name="cust.additionalNumber"/><font color="red">*</font></label>
		  						<div class="form-line">
		  							<s:textfield name="additionalNumber" id="additionalNumber" cssClass="form-control tooltipContent numericOnly" data-content="Additional Number" maxlength="4" oninput="checkNumbers(this);setWaselAddres('2');"  onblur="setWaselAddres('2');" readonly='%{additionalNumber==null || additionalNumber==""?false:#yakeenAdd}' disabled="#endtDisable"/>
		  						</div>
		  					</div>
	  					</div>
	  					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
	  						<div class="form-group form-float">
		  						<label class="form-label"><s:text name="cust.zipCode"/><font color="red">*</font></label>
		  						<div class="form-line">
		  							<s:textfield name="zipCode" id="zipCode" cssClass="form-control tooltipContent numericOnly" data-content="Zip Code" maxlength="5" oninput="checkNumbers(this);setWaselAddres('2');"  onblur="setWaselAddres('2');" readonly='%{zipCode==null || zipCode==""?false:#yakeenAdd}' disabled="#endtDisable"/>
		  						</div>
		  					</div>
	  					</div>
	  					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
	  						<div class="form-group form-float">
		  						<label class="form-label"><s:text name="customer.city"  /><font color="red">*</font></label>
		  						<div class="form-line">
		  						<s:if test='"Y".equals(webStatus) && !"".equals(city) && city != null'>
			  						<s:textfield name="city" id="city" cssClass="form-control tooltipContent" data-content=""   readonly="true"/>
			  					</s:if>
			  					<s:else>
			  						<s:select name="city" id="city" list="cityList" headerKey="" headerValue="---Select---" listKey="CODEDESC" listValue="CODEDESC" cssClass="form-control tooltipContent" data-content="City" onchange="setWaselAddres('2');" disabled="#endtDisable"/>
			  					</s:else>
		  						</div>
		  					</div>
		  				</div>	
		  				<s:hidden name="webStatus"/>
	  					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
	  						<div class="form-group form-float">
		  						<label class="form-label"><s:text name="cust.neighborhood"/><font color="red">*</font></label>
		  						<div class="form-line">
		  							<s:textfield name="neighborhood" id="neighborhood" cssClass="form-control tooltipContent charOnly" data-content="Neighborhood" maxlength="50"   oninput="setWaselAddres('2');"  readonly='%{neighborhood==null || neighborhood==""?false:#yakeenAdd}' disabled="#endtDisable"/>
		  						</div>
		  					</div>
	  					</div>
	  					
	  					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
	  						<div class="form-group form-float">
		  						<label class="form-label"><s:text name="cust.unitNo"/></label>
		  						<div class="form-line">
		  							<s:textfield name="unitNo" id="unitNo" cssClass="form-control tooltipContent numericOnly" data-content="" maxlength="5" onkeyup="checkNumbers(this);" disabled="#endtDisable"/>
		  						</div>
		  					</div>
	  					</div>
	  				</div>
	  				<div class="row">	  					
	  					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
	  						<div class="form-group form-float">
		  						<label class="form-label"><s:text name="cust.street"/></label>
		  						<div class="form-line">
		  						<s:textfield name="street" id="street" cssClass="form-control tooltipContent" data-content="Street" maxlength="200"  readonly='%{street==null || street==""?false:#yakeenAdd}' disabled="#endtDisable"/>
		  						</div>
		  					</div>
	  					</div>
	  					 <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
	  						<div class="form-group form-float">
		  						<label class="form-label"><s:text name="motor.iban.no"/><font color="red">*</font></label>
		  						<div class="row">
			  						<div class="col-xs-2" align="left">
			  							<div class="form-line ">
			  								<s:textfield name="ibanNum1[0]" id="ibanNum1[0]" cssClass="form-control tooltipContent" value="SA" data-content="iBan No." maxlength="2" disabled="true" />
			  							</div>
			  						</div>
		  							<div class="col-xs-10" align="right">
			  						<div class="form-line ">
			  						 	<s:textfield name="ibanNum[0]" id="ibanNum[0]" cssClass="form-control tooltipContent numericOnly" data-content="iBan No." maxlength="22" disabled="#endtDisable" />
			  						 </div>
			  						</div>
			  					</div>
		  					</div>
	  					</div>
	  					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
	  						<div class="form-group form-float">
		  						<label class="form-label"><s:text name="motor.bankOfFinance"/><font color="red">*</font></label>
		  						<div class="form-line">
		  						 	<s:select name="ibankId[0]" id="ibankId" list="bankList" listKey="CODE" listValue="CODEDESC" headerKey="" headerValue="---Select---" cssClass="form-control tooltipContent" data-content="Bank Name" disabled="#endtDisable" />
		  						</div>
		  					</div>
	  					</div>
	  				</div>
  				</s:if>
  			</s:if>
  			<s:else>
  				<div class="row">
  					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
  						<div class="form-group form-float">
	  						<label class="form-label"><s:text name="customer.title"  /><font color="red">*</font></label>
	  						<div class="form-line">
	  							<s:select name="title" id="title" list="titleList" listKey="CODEDESC" listValue="CODEDESC" cssClass="form-control tooltipContent" data-content="Title" disabled="#disable1"/>
	  						</div>
	  					</div>
  					</div>
  					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
  						<div class="form-group form-float">
	  						<label class="form-label"><s:text name="customer.firstName"/><font color="red">*</font></label>
	  						<div class="form-line">
	  							<s:if test='%{#session.LoginType!="B2C" && !"User".equalsIgnoreCase(#session.usertype)}'>
		  							<s:textfield name="customerName" id="customerName" cssClass="form-control tooltipContent charOnly" data-content="First Name" cssStyle="width:85%;" maxlength="40" disabled="#disable1" /><s:hidden name="customerId"  id="customerId"/>
									<%--<s:submit type="button" value="..." cssClass="inputButton" onclick="return customerSelectionAction(this.form)" />
								--%></s:if>
								<s:else>
									<s:textfield name="customerName" id="customerName" cssClass="form-control tooltipContent charOnly" data-content="First Name" maxlength="40" disabled="#disable1" /><s:hidden name="customerId"  id="customerId"/>
								</s:else>
	  						</div>
	  					</div>
  					</div>
  					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
  						<div class="form-group form-float">
	  						<label class="form-label"><s:text name="customer.lastName"/></label>
	  						<div class="form-line">
	  							<s:textfield name="custLastName" id="custLastName" cssClass="form-control tooltipContent charOnly" data-content="Last Name"  maxlength="20" disabled="#endtDisable"/>
	  						</div>
	  					</div>
  					</div>
  					<s:hidden name="customerType"/>
  					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
  						<div class="form-group form-float">
							<label class="form-label"> <s:text name="customer.occupation" /><font color="red">*</font> </label>
							<div class="form-line">
								<s:select name="occupation" id="occupation" list="occupationList" headerKey="" headerValue="---Select---" listKey="CODE" listValue="CODEDESC" cssClass="form-control" style="height:50%"/>
							</div>
						</div>
					</div>
  					
  					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4" style="display: none;">
  						<div class="form-group form-float">
	  						<label class="form-label"><s:text name="customer.nrc"/></label>
	  						<div class="form-line">
	  							<s:textfield name="custnrc" id="custnrc" cssClass="form-control tooltipContent" data-content="National Registration Card No."  maxlength="25" disabled="#endtDisable"/>
	  						</div>
	  					</div>
  					</div>
  					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4" style="display: none;">
  						<div class="form-group form-float">
	  						<label class="form-label"><s:text name="customer.passportNo"/><font color="red">*</font></label>
	  						<div class="form-line">
	  							<s:textfield name="custPassportNo" id="custPassportNo" cssClass="form-control tooltipContent" data-content="Passport No."  maxlength="25" disabled="#endtDisable"/>
	  						</div>
	  					</div>
  					</div>
  					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4" style="display: none;">
  						<div class="form-group form-float">
	  						<label class="form-label"><s:text name="customer.coreAppCode"  /></label>
	  						<div class="form-line">
	  							<s:if test='%{#session.LoginType!="B2C" && !"User".equalsIgnoreCase(#session.usertype)}'>
									<s:textfield name="coreAppCode" id="coreAppCode" cssClass="form-control tooltipContent" data-content="Core App Code" cssStyle="width:85%;" readonly="true" disabled="#disable1"/>
									<s:submit type="button" cssClass="inputButton" value="..." onclick="return coreCustomerSearch()" />
								</s:if>
								<s:else>
									<s:textfield name="coreAppCode" id="coreAppCode" cssClass="form-control tooltipContent" data-content="Core App Code" readonly="true" disabled="#disable1"/>
								</s:else>
	  						</div>
	  					</div>
						<s:hidden name="custArNo" id="custArNo"/>
						<s:hidden name="custCoreCode" id="custCoreCode"/>
						<s:hidden name="clientCustomerId" id="clientCustomerId"/>
  					</div>
  					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
  						<div class="form-group form-float">
	  						<label class="form-label"><s:text name="customer.nationality"  /><font color="red">*</font></label>
	  						<div class="form-line">
	 							<s:select name="nationality" id="nationality" list="nationalityList" headerKey="" headerValue="---Select---" listKey="CODE" listValue="CODEDESC" cssClass="form-control tooltipContent" data-content="Title" disabled="#endtDisable"/>
		  					</div>
		  				</div>
	  				</div>	
  				</div>
  				<s:if test='"policyInfo".equalsIgnoreCase(display)'>
  					<s:set var="yakeenAdd" value='%{"Y".equalsIgnoreCase(webStatus)}' />	
	  				<div class="row">
	  					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							<div class="form-group form-float">
		  						<label class="form-label"><s:text name="cust.buildingNo"/><font color="red">*</font></label>
		  						<div class="form-line">
		  							<s:textfield name="buildingNo" id="buildingNo" cssClass="form-control tooltipContent" data-content="Building No" maxlength="4" oninput="checkNumbers(this);setWaselAddres('2');" onblur="setWaselAddres('2');" readonly='%{buildingNo==null || buildingNo==""?false:#yakeenAdd}' disabled="#endtDisable"/>
		  						</div>
		  					</div>
	  					</div>
	  					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
	  						<div class="form-group form-float">
		  						<label class="form-label"><s:text name="cust.additionalNumber"/><font color="red">*</font></label>
		  						<div class="form-line">
		  							<s:textfield name="additionalNumber" id="additionalNumber" cssClass="form-control tooltipContent numericOnly" data-content="Additional Number" maxlength="4" oninput="checkNumbers(this);setWaselAddres('2');"  onblur="setWaselAddres('2');" readonly='%{additionalNumber==null || additionalNumber==""?false:#yakeenAdd}' disabled="#endtDisable"/>
		  						</div>
		  					</div>
	  					</div>
	  					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
	  						<div class="form-group form-float">
		  						<label class="form-label"><s:text name="cust.zipCode"/><font color="red">*</font></label>
		  						<div class="form-line">
		  							<s:textfield name="zipCode" id="zipCode" cssClass="form-control tooltipContent numericOnly" data-content="Zip Code" maxlength="5" oninput="checkNumbers(this);setWaselAddres('2');"  onblur="setWaselAddres('2');" readonly='%{zipCode==null || zipCode==""?false:#yakeenAdd}' disabled="#endtDisable"/>
		  						</div>
		  					</div>
	  					</div>
	  					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
	  						<div class="form-group form-float">
		  						<label class="form-label"><s:text name="customer.city"  /><font color="red">*</font></label>
		  						<div class="form-line">
		  						<s:if test='"Y".equals(webStatus) && !"".equals(city) && city != null'>
			  						<s:textfield name="city" id="city" cssClass="form-control tooltipContent" data-content=""   readonly="true"/>
			  					</s:if>
			  					<s:else>
			  						<s:select name="city" id="city" list="cityList" headerKey="" headerValue="---Select---" listKey="CODEDESC" listValue="CODEDESC" cssClass="form-control tooltipContent" data-content="City" onchange="setWaselAddres('2');" disabled="#endtDisable"/>
			  					</s:else>
		  						</div>
		  					</div>
		  				</div>	
		  				<s:hidden name="webStatus"/>
	  					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
	  						<div class="form-group form-float">
		  						<label class="form-label"><s:text name="cust.neighborhood"/><font color="red">*</font></label>
		  						<div class="form-line">
		  							<s:textfield name="neighborhood" id="neighborhood" cssClass="form-control tooltipContent charOnly" data-content="Neighborhood" maxlength="50"   oninput="setWaselAddres('2');"  readonly='%{neighborhood==null || neighborhood==""?false:#yakeenAdd}' disabled="#endtDisable"/>
		  						</div>
		  					</div>
	  					</div>
	  					
	  					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
	  						<div class="form-group form-float">
		  						<label class="form-label"><s:text name="cust.unitNo"/></label>
		  						<div class="form-line">
		  							<s:textfield name="unitNo" id="unitNo" cssClass="form-control tooltipContent numericOnly" data-content="" maxlength="5" onkeyup="checkNumbers(this);" disabled="#endtDisable"/>
		  						</div>
		  					</div>
	  					</div>
	  				</div>
	  				<div class="row">	  					
	  					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
	  						<div class="form-group form-float">
		  						<label class="form-label"><s:text name="cust.street"/></label>
		  						<div class="form-line">
		  						<s:textfield name="street" id="street" cssClass="form-control tooltipContent" data-content="Street" maxlength="200"  readonly='%{street==null || street==""?false:#yakeenAdd}' disabled="#endtDisable"/>
		  						</div>
		  					</div>
	  					</div>
	  					 <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
	  						<div class="form-group form-float">
		  						<label class="form-label"><s:text name="motor.iban.no"/><font color="red">*</font></label>
		  						<div class="row">
			  						<div class="col-xs-2" align="left">
			  							<div class="form-line ">
			  								<s:textfield name="ibanNum1[0]" id="ibanNum1[0]" cssClass="form-control tooltipContent" value="SA" data-content="iBan No." maxlength="2" disabled="true" />
			  							</div>
			  						</div>
		  							<div class="col-xs-10" align="right">
			  						<div class="form-line ">
			  						 	<s:textfield name="ibanNum[0]" id="ibanNum[0]" cssClass="form-control tooltipContent numericOnly" data-content="iBan No." maxlength="22" disabled="#endtDisable" />
			  						 </div>
			  						</div>
			  					</div>
		  					</div>
	  					</div>
	  					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
	  						<div class="form-group form-float">
		  						<label class="form-label"><s:text name="motor.bankOfFinance"/><font color="red">*</font></label>
		  						<div class="form-line">
		  						 	<s:select name="ibankId[0]" id="ibankId" list="bankList" listKey="CODE" listValue="CODEDESC" headerKey="" headerValue="---Select---" cssClass="form-control tooltipContent" data-content="Bank Name" disabled="#endtDisable" />
		  						</div>
		  					</div>
	  					</div>
	  				</div>
  				</s:if>
  			</s:else>
  				
  			</div>
  		</div>
  		<s:if test='"policyInfo".equalsIgnoreCase(display)'>  		
  			<s:if test='%{"65".equals(#session.product_id)}'>
  				<div class="panel panel-primary" style="display: none;">
			  		<div class="panel-heading txtB">
								<s:text name="cust.communication.add" />
			  		</div>
		  			<div class="panel-body" style="display: none;">
		  				<div class="row">
			  				<div class="col-xs-12 col-md-6">
			  					<div class="form-group form-float">
								<label class="form-label"><s:text name="cust.addressIdentifier"/></label>
			  						<div class="form-line">
			  							<%--<s:if test='#session.product_id=="65"'>
			  								<s:radio name="addressIdentifier" id="addressIdentifier" list="addressIdentifierList" value='%{(addressIdentifier==null||"".equals(addressIdentifier))?"1":addressIdentifier}' cssClass="input" disabled="#endtDisable" onclick="toggleAddress(this.value);setWaselAddres(this.value);" listKey="CODE" listValue="CODEDESC"/>
			  							</s:if>
			  							<s:else>
			  									<s:radio name="addressIdentifier" id="addressIdentifier" list="#{'1':'Pobox address','2':'Wasel address'}" value='%{(addressIdentifier==null||"".equals(addressIdentifier))?"1":addressIdentifier}' cssClass="input" disabled="#endtDisable" onclick="toggleAddress(this.value);setWaselAddres(this.value);"/>
			  							</s:else>
			  						--%>
			  						<s:hidden name="addressIdentifier" id="addressIdentifier" value="2"/>
			  						</div>
								</div>
							</div>
							<div class="col-xs-12 col-md-6" style="display: none;">
								<div class="form-group form-float">	  						
			  						<div class="form-line">
			  							<b><s:text name="customer.register"/> &nbsp;<a href="https://address.gov.sa/ar/" target="_blank"><s:text name="customer.clickhere"/></a></b>
			  						</div>
			  					</div>
			  				</div>
		  					<div id="PoboxAddress" style="display: none;" >
								<div class="col-xs-12">
									<div class="row">
										<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
											<div class="form-group form-float">
						  						<label class="form-label"><s:text name="cust.insuredPostalCode"/><font color="red">*</font></label>
						  						<div class="form-line" dir="ltr">
						  							<s:textfield name="insuredPostalCode" id="insuredPostalCode" cssClass="form-control tooltipContent numericOnly" data-content="Insured Postal Code" onkeyup="checkNumbers(this);" maxlength="5" disabled="#endtDisable"/>
						  						</div>
						  					</div>
					  					</div>
										<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
											<div class="form-group form-float">
						  						<label class="form-label"><s:text name="cust.insuredPOBox"/><font color="red">*</font></label>
						  						<div class="form-line" dir="ltr">
						  							<s:textfield name="insuredPOBox" id="insuredPOBox" cssClass="form-control tooltipContent numericOnly" data-content="Insured PO Box" onkeyup="checkNumbers(this);" maxlength="5"  disabled="#endtDisable"/>
						  						</div>
						  					</div>
					  					</div>
										<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
											<div class="form-group form-float">
						  						<label class="form-label"><s:text name="cust.insuredCity"/><font color="red">*</font></label>
						  						<div class="form-line">
						  							<s:select name="insuredCity" id="insuredCity" list="cityList" headerKey="" headerValue="---Select---" listKey="CODEDESC" listValue="CODEDESC" cssClass="form-control tooltipContent" data-content="Insured City" disabled="#endtDisable"/>
						  						</div>
						  					</div>
					  					</div>
									</div>
								</div>
							</div>
							<div id="WaselAddress" style="display: none;">
								<div class="col-xs-12 ">
									<div class="row">
										<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
											<div class="form-group form-float">
						  						<label class="form-label"><s:text name="cust.waseelbuildingNo"/><font color="red">*</font></label>
						  						<div class="form-line">
						  							<s:textfield name="waseelbuildingNo" id="waseelbuildingNo" cssClass="form-control tooltipContent numericOnly" data-content="Wasel building No" maxlength="4" onkeyup="checkNumbers(this);" readonly="#yakeenAdd" disabled="#endtDisable"/>
						  						</div>
						  					</div>
					  					</div>
										<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
											<div class="form-group form-float">
						  						<label class="form-label"><s:text name="cust.waseeladditionalNumber"/><font color="red">*</font></label>
						  						<div class="form-line">
						  							<s:textfield name="waseeladditionalNumber" id="waseeladditionalNumber" cssClass="form-control tooltipContent numericOnly" data-content="Wasel Additional Number" maxlength="4" onkeyup="checkNumbers(this);" readonly="#yakeenAdd" disabled="#endtDisable"/>
						  						</div>
						  					</div>
					  					</div>
										<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
											<div class="form-group form-float">
						  						<label class="form-label"><s:text name="cust.waseelzipCode"/><font color="red">*</font></label>
						  						<div class="form-line">
						  							<s:textfield name="waseelzipCode" id="waseelzipCode" cssClass="form-control tooltipContent numericOnly" data-content="Wasel Zip Code" readonly="#yakeenAdd" maxlength="5" onkeyup="checkNumbers(this);" disabled="#endtDisable"/>
						  						</div>
						  					</div>
					  					</div>
										<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
											<div class="form-group form-float">
						  						<label class="form-label"><s:text name="cust.waseelcity"/><font color="red">*</font></label>
						  						<div class="form-line">
							  						<s:if test='"Y".equals(webStatus)'>
							  							<s:textfield name="waseelcity"  id="waseelcity" cssClass="form-control tooltipContent" data-content=""   readonly="true"/>
							  						</s:if>
							  						<s:else>
							  							<s:select name="waseelcity" id="waseelcity" list="cityList" headerKey="" headerValue="---Select---" listKey="CODEDESC" listValue="CODEDESC" cssClass="form-control tooltipContent" data-content="City" disabled="#endtDisable"/>
							  						</s:else>
						  						</div>
						  					</div>
					  					</div>
										<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
											<div class="form-group form-float">
						  						<label class="form-label"><s:text name="cust.waseelneighborhood"/><font color="red">*</font></label>
						  						<div class="form-line">
						  							<s:textfield name="waseelneighborhood" id="waseelneighborhood" cssClass="form-control tooltipContent" data-content="Waseel Neighborhood" maxlength="50"  disabled="#endtDisable"/>
						  						</div>
						  					</div>
					  					</div>
									</div>
								</div>
							</div>
		  				</div>
					</div>
				</div>
  			</s:if>
  			<s:else>
  					<div class="panel panel-primary">
				  		<div class="panel-heading txtB">
									<s:text name="cust.communication.add" />
				  		</div>
			  			<div class="panel-body">
			  				<div class="row">
				  				<div class="col-xs-12 col-md-6">
				  					<div class="form-group form-float">
									<label class="form-label"><s:text name="cust.addressIdentifier"/></label>
				  						<div class="form-line">
				  							<s:if test='#session.product_id=="65"'>
				  								<s:radio name="addressIdentifier" id="addressIdentifier" list="addressIdentifierList" value='%{(addressIdentifier==null||"".equals(addressIdentifier))?"1":addressIdentifier}' cssClass="input" disabled="#endtDisable" onclick="toggleAddress(this.value);setWaselAddres(this.value);" listKey="CODE" listValue="CODEDESC"/>
				  							</s:if>
				  							<s:else>
				  									<s:radio name="addressIdentifier" id="addressIdentifier" list="#{'1':'Pobox address','2':'Wasel address'}" value='%{(addressIdentifier==null||"".equals(addressIdentifier))?"1":addressIdentifier}' cssClass="input" disabled="#endtDisable" onclick="toggleAddress(this.value);setWaselAddres(this.value);"/>
				  							</s:else>
				  						</div>
									</div>
								</div>
								<div class="col-xs-12 col-md-6" style="display: none;">
									<div class="form-group form-float">	  						
				  						<div class="form-line">
				  							<b><s:text name="customer.register"/> &nbsp;<a href="https://address.gov.sa/ar/" target="_blank"><s:text name="customer.clickhere"/></a></b>
				  						</div>
				  					</div>
				  				</div>
			  					<div id="PoboxAddress">
									<div class="col-xs-12">
										<div class="row">
											<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
												<div class="form-group form-float">
							  						<label class="form-label"><s:text name="cust.insuredPostalCode"/><font color="red">*</font></label>
							  						<div class="form-line">
							  							<s:textfield name="insuredPostalCode" id="insuredPostalCode" cssClass="form-control tooltipContent numericOnly" data-content="" onkeyup="checkNumbers(this);" maxlength="5" disabled="#endtDisable"/>
							  						</div>
							  					</div>
						  					</div>
											<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
												<div class="form-group form-float">
							  						<label class="form-label"><s:text name="cust.insuredPOBox"/><font color="red">*</font></label>
							  						<div class="form-line">
							  							<s:textfield name="insuredPOBox" id="insuredPOBox" cssClass="form-control tooltipContent numericOnly" data-content="" onkeyup="checkNumbers(this);" maxlength="5"  disabled="#endtDisable"/>
							  						</div>
							  					</div>
						  					</div>
											<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
												<div class="form-group form-float">
							  						<label class="form-label"><s:text name="cust.insuredCity"/><font color="red">*</font></label>
							  						<div class="form-line">
							  							<s:select name="insuredCity" id="insuredCity" list="cityList" headerKey="" headerValue="---Select---" listKey="CODEDESC" listValue="CODEDESC" cssClass="form-control tooltipContent" data-content="City" disabled="#endtDisable"/>
							  						</div>
							  					</div>
						  					</div>
										</div>
									</div>
								</div>
								<div id="WaselAddress" style="display: none;">
									<div class="col-xs-12 ">
										<div class="row">
											<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
												<div class="form-group form-float">
							  						<label class="form-label"><s:text name="cust.waseelbuildingNo"/><font color="red">*</font></label>
							  						<div class="form-line">
							  						<s:if test='"Y".equals(webStatus)'>
							  						<s:textfield name="waseelbuildingNo" id="waseelbuildingNo" cssClass="form-control tooltipContent numericOnly" data-content="" maxlength="4" onkeyup="checkNumbers(this);" disabled="true"/>
							  						</s:if>
							  						<s:else>
							  						<s:textfield name="waseelbuildingNo" id="waseelbuildingNo" cssClass="form-control tooltipContent numericOnly" data-content="" maxlength="4" onkeyup="checkNumbers(this);" disabled="#endtDisable"/>
							  						</s:else>
							  						</div>
							  					</div>
						  					</div>
											<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
												<div class="form-group form-float">
							  						<label class="form-label"><s:text name="cust.waseeladditionalNumber"/><font color="red">*</font></label>
							  						<div class="form-line">
							  						<s:if test='"Y".equals(webStatus)'>
							  						<s:textfield name="waseeladditionalNumber" id="waseeladditionalNumber" cssClass="form-control tooltipContent numericOnly" data-content="" maxlength="4" onkeyup="checkNumbers(this);" disabled="true"/>
							  						</s:if>
							  						<s:else>
							  						<s:textfield name="waseeladditionalNumber" id="waseeladditionalNumber" cssClass="form-control tooltipContent numericOnly" data-content="" maxlength="4" onkeyup="checkNumbers(this);" disabled="#endtDisable"/>
							  						</s:else>
							  							
							  						</div>
							  					</div>
						  					</div>
											<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
												<div class="form-group form-float">
							  						<label class="form-label"><s:text name="cust.waseelzipCode"/><font color="red">*</font></label>
							  						<div class="form-line">
							  						<s:if test='"Y".equals(webStatus)'>
							  						<s:textfield name="waseelzipCode" id="waseelzipCode" cssClass="form-control tooltipContent numericOnly" data-content="" maxlength="5" onkeyup="checkNumbers(this);" disabled="true"/>
							  						</s:if>
							  						<s:else>
							  						<s:textfield name="waseelzipCode" id="waseelzipCode" cssClass="form-control tooltipContent numericOnly" data-content="" maxlength="5" onkeyup="checkNumbers(this);" disabled="#endtDisable"/>
							  						</s:else>
							  						</div>
							  					</div>
						  					</div>
											<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
												<div class="form-group form-float">
							  						<label class="form-label"><s:text name="cust.waseelcity"/><font color="red">*</font></label>
							  						<div class="form-line">
							  						<s:if test='"Y".equals(webStatus)'>
							  						<s:textfield name="waseelcity"  cssClass="form-control tooltipContent" data-content=""   readonly="true"/>
							  						</s:if>
							  						<s:else>
							  						<s:select name="waseelcity" id="waseelcity" list="cityList" headerKey="" headerValue="---Select---" listKey="CODEDESC" listValue="CODEDESC" cssClass="form-control tooltipContent" data-content="City" disabled="#endtDisable"/>
							  						</s:else>
							  							
							  						</div>
							  					</div>
						  					</div>
											<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
												<div class="form-group form-float">
							  						<label class="form-label"><s:text name="cust.waseelneighborhood"/><font color="red">*</font></label>
							  						<div class="form-line">
							  							<s:textfield name="waseelneighborhood" id="waseelneighborhood" cssClass="form-control tooltipContent" data-content="" maxlength="50"  disabled="#endtDisable"/>
							  						</div>
							  					</div>
						  					</div>
										</div>
									</div>
								</div>
			  				</div>
						</div>
					</div>
  			</s:else>
  		
		</s:if>
		</s:else>
		</div>
  	</div>
<script type="text/javascript">
<s:if test='!("newQuote".equalsIgnoreCase(display) || "getQuote".equalsIgnoreCase(display) || "getCustomer".equalsIgnoreCase(display))'>
$(document).ready(function() {     
    $('#occupation').multiselect({ 
      includeSelectAllOption: true,
        enableFiltering:true,
        enableCaseInsensitiveFiltering: true,
        minHeight     : 10,
        maxHeight	:300
         
  	});

    $('#nationality').multiselect({ 
        includeSelectAllOption: true,
          enableFiltering:true ,
          enableCaseInsensitiveFiltering: true,
          minHeight     : 10,
          maxHeight	:300
          
    	});

    <s:if test='"policyInfo".equalsIgnoreCase(display)'>
	   	 if('<s:property value="city"/>'=='' || '<s:property value="city"/>'== null){
	   		 $('#city').multiselect({ 
	     		   includeSelectAllOption: true,
	       	 		enableFiltering:true ,
	       	 	enableCaseInsensitiveFiltering: true,
	       	 minHeight     : 10,
	         maxHeight	:300
	    	});
	   	 }
   		$('#insuredCity').multiselect({ 
      	 	  includeSelectAllOption: true,
        	   enableFiltering:true ,
        	   enableCaseInsensitiveFiltering: true,
        	   minHeight     : 10,
               maxHeight	:300
     	});
   		if('<s:property value="city"/>'=='' || '<s:property value="city"/>'== null){
	   		$('#waseelcity').multiselect({ 
	       		   includeSelectAllOption: true,
	         	   enableFiltering:true ,
	         	  enableCaseInsensitiveFiltering: true,
	         	 minHeight     : 10,
	             maxHeight	:300
	         	   
	      	});
   		}
   		

   		$("#addressIdentifier").click(function () {
   	   		
   	   				if('2'==$("#addressIdentifier").val())
   			  			$('#waseelcity').val($('#city').val());
   		    });	
   		
    </s:if>
});
</s:if>
<s:if test='!"".equals(brokerCode)'>
	getExecutive('?brokerCode=<s:property value="brokerCode"/>&executive=<s:property value="executive"/>','executiveList');
</s:if>

function getExecutive(val, id) {
	postRequest('<%=request.getContextPath()%>/'+id+'Customer.action'+val, id);
}
	
function emptyCustInfo() {
	var s="poBox&mobileNo&email&title&customerName&coreAppCode&address2&address1&city"; 
	var stringToArray = new Array;
	stringToArray = s.split("&");
	for ( var int = 0; int < stringToArray.length; int++) {		
		var obj=stringToArray[int]
		document.getElementById(""+obj).value="";
	}
}
function userCustomerSelection(frm){
	var agencyCode='';	
	if(frm.agencyCode){			
		agencyCode=frm.agencyCode.value;
		//alert(agencyCode);		
	}
	var URL ='<%=request.getContextPath()%>/customerSelectionCustomer.action?agencyCode='+agencyCode;
	//return popUp(URL,'779','537');
	return "";
}

function customerSelectionAction(frm) {	
	var brokerCode='';	
	if(frm.brokerCode){			
			brokerCode=frm.brokerCode.value;		
	}
	var URL ='<%=request.getContextPath()%>/customerSelectionCustomer.action?brokerCode='+brokerCode;
	return popUp(URL,'779','537');
}
	
function coreCustomerSearch() {
	var URL ='<%=request.getContextPath()%>/coreCustSearchCustomer.action';
	return popUp(URL,'700','500');
}
<s:if test='!%{"65".equals(#session.product_id)}'>
	<s:if test='"policyInfo".equalsIgnoreCase(display)'>
	if('<s:property value="addressIdentifier"/>'=='' || '<s:property value="addressIdentifier"/>'== null){
		var value='1';
		}else{
		var value='<s:property value="addressIdentifier"/>';
		}
	toggleAddress(value)
	</s:if>
	
	function toggleAddress(val) {
		if(val=="1") {
			document.getElementById('PoboxAddress').style.display='block';
			document.getElementById('WaselAddress').style.display='none';
			
			document.getElementById('waseelbuildingNo').value='';
			document.getElementById('waseeladditionalNumber').value='';
			document.getElementById('waseelzipCode').value='';
			document.getElementById('waseelcity').value='';
			document.getElementById('waseelneighborhood').value='';
		}
		else {
			document.getElementById('PoboxAddress').style.display='none';
			document.getElementById('WaselAddress').style.display='block';
			
			document.getElementById('insuredPostalCode').value='';
			document.getElementById('insuredPOBox').value='';
			document.getElementById('insuredCity').value='';
		}
	}
	
	
	function setWaselAddres(val){
		if(val==2){
			if(document.getElementById('waseelbuildingNo').value==null || document.getElementById('waseelbuildingNo').value=='') {
				var buildingNo=document.getElementById('buildingNo').value;
				document.getElementById('waseelbuildingNo').value=buildingNo;
			}if(document.getElementById('waseeladditionalNumber').value==null  || document.getElementById('waseeladditionalNumber').value=='') {
				var additionalNumber=document.getElementById('additionalNumber').value;
				document.getElementById('waseeladditionalNumber').value=additionalNumber;
			}if(document.getElementById('waseelzipCode').value==null  || document.getElementById('waseelzipCode').value=='') {
				var zipCode=document.getElementById('zipCode').value;
				document.getElementById('waseelzipCode').value=zipCode;
			}if(document.getElementById('waseelcity').value==null  || document.getElementById('waseelcity').value=='') {
				var city=document.getElementById('city').value;
				//document.getElementById('waseelcity').value=city;						
				$("#waseelcity option[value='"+city+"']").attr("selected", true);
				$("#waseelcity").multiselect('refresh');
			}if(document.getElementById('waseelneighborhood').value==null || document.getElementById('waseelneighborhood').value=='') {
				var neighborhood=document.getElementById('neighborhood').value;
				document.getElementById('waseelneighborhood').value=neighborhood;
			}
		}
	}
</s:if>
<s:if test='%{"65".equals(#session.product_id)}'>

function setWaselAddres(val){
	if(val==2){
		var buildingNo=document.getElementById('buildingNo').value;
		document.getElementById('waseelbuildingNo').value=buildingNo;
		var additionalNumber=document.getElementById('additionalNumber').value;
		document.getElementById('waseeladditionalNumber').value=additionalNumber;
		var zipCode=document.getElementById('zipCode').value;
		document.getElementById('waseelzipCode').value=zipCode;
		var neighborhood=document.getElementById('neighborhood').value;
		document.getElementById('waseelneighborhood').value=neighborhood;
		var city=document.getElementById('city').value;
		document.getElementById('waseelcity').value=city;
	}
}
</s:if>
/*
 //toggleCompanyRegistration('CORPORATE');

//function toggleCompanyRegistration(val) {
	//if('true'!='<s:property value="#disable1"/>') {
	//	if(val=="CORPORATE") {
	//		document.getElementById('companyRegNo').disabled = false;
	//	}
	//	else {
	//		document.getElementById('companyRegNo').value = "";
	//		document.getElementById('companyRegNo').disabled = true;
	//	}
	//}
}*/

function setDriverId(obj){
	if(document.getElementById('driverIdList[0]')!=null && (document.getElementById('ownerDriverYNY').checked == true)) {
		document.getElementById('driverIdList[0]').value=obj.value;
	}
}
function setDriverNameEng(obj){
	if(document.getElementById('driverNameEng[0]')!=null && (document.getElementById('ownerDriverYNY').checked == true)) {
		document.getElementById('driverNameEng[0]').value=obj.value;
	}
}
function setDriverNameArabic(obj){
	if(document.getElementById('driverNameArabic[0]')!=null && (document.getElementById('ownerDriverYNY').checked == true)) {
		document.getElementById('driverNameArabic[0]').value=obj.value;
	}
}
function setDriverDOB(obj){
	if(document.getElementById('driverDOB')!=null && (document.getElementById('ownerDriverYNY').checked == true)) {
		document.getElementById('driverDOB').value=obj;
	}
}
<s:if test='"newQuote".equalsIgnoreCase(display) || "getQuote".equalsIgnoreCase(display) || "getCustomer".equalsIgnoreCase(display)'>
swapDOB('<s:property value="companyRegNo"/>')

function swapDOB(val){
	var first = val.charAt(0);
	if(first == "1"){
	//document.getElementById('gender').value='';
	document.getElementById('greDob').style.display='none';
	document.getElementById('hijDob').style.display='block';
	}else{
	document.getElementById('greDob').style.display='block';
	document.getElementById('hijDob').style.display='none';
	}
}
</s:if>
</script>	