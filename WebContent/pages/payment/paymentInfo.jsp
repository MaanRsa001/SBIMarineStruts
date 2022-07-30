<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<script language="JavaScript">
				function stopRKey(evt) { 
				  var evt = (evt) ? evt : ((event) ? event : null); 
				  var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null); 
				  if ((evt.keyCode == 13) && (node.type=="text"))  {return false;} 
				} 
				document.onkeypress = stopRKey; 
		</script>
	</head>
	<body>
		<s:if test='b2cCustYN=="Y"'>
			<s:if test='"N".equals(paymentStatus)'>
				<s:hidden name="generatePolicyYN" value="N"></s:hidden>
			</s:if>
			<s:else>
				<div id="policyGeneration">
					<div class="panel panel-primary" id="declarationDiv">
						<div class="panel-heading">
							<s:text name="label.declaration"/>
						</div>
						<div class="panel-body">
							<div class="row clearfix">
								<div class="col-xs-3 col-md-1" align="center">
									<s:checkbox name="quoteEmailYN" cssStyle="position: static; left: 0px; opacity: inherit;" fieldValue="Y" id="quoteEmailYN" /> 
								</div>
								<div class="col-xs-9 col-md-11">
									<label><s:text name="labe.emailQuote" /></label>
								</div>
							</div>
							<div class="row clearfix">
								<div class="col-xs-3 col-md-1" align="center">
									<s:checkbox name="generatePolicyYN" cssStyle="position: static; left: 0px; opacity: inherit;" fieldValue="Y" id="generatePolicyYN" onclick="getMop(this.value);toggleEmailYN(this.value);"/>									
								</div>
								<div class="col-xs-9 col-md-11">
									<label>
										<s:text name="label.declaration.quote1"/><br/>
										
										<s:text name="label.declaration.quote2"/><br/>

										<!--<s:text name="label.declaration.quote3"/><br/>
										
										--><s:text name="label.declaration.quote4"/><br/>
									</label>
								</div>
							</div>
			       		</div>
		        	</div>	
					<div class="row" id="modeOfPay">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<div class="panel panel-primary">
								<div class="panel-heading">
									<s:text name="payment.modeOfPayment" />
								</div>								
								<div class="panel-body">
									<div class="row">
										<div class="col-md-4">
											<input type="radio" name="modeOfPayment" style="position: static; left: 0px; opacity: inherit;" id="modeOfPayment_SADAD" value="SADAD" class="tooltipContent" data-content="Payment Type(SADAD)" onchange="showCheque(this.value);" disabled="disabled" /> <img alt="SADAD" src='<%=request.getContextPath()%>/images/<s:text name="img.paymentOption" />'>											
										</div>
										<div class="col-md-4">
											<input type="radio" name="modeOfPayment" style="position: static; left: 0px; opacity: inherit;" id="modeOfPayment_MASTERCARD" value="MASTERCARD" class="tooltipContent" data-content="Payment Type(Master Card)" onchange="showCheque(this.value);" disabled="disabled" /> <img alt="Master Card" src="<%=request.getContextPath()%>/images/master_card.jpg">
										</div>
										<div class="col-md-4">
											<input type="radio" name="modeOfPayment" style="position: static; left: 0px; opacity: inherit;" id="modeOfPayment_VISA" value="VISA" class="tooltipContent" data-content="Payment Type(VISA)" onchange="showCheque(this.value);" disabled="disabled" /> <img alt="Visa" src="<%=request.getContextPath()%>/images/visa.jpg">
										</div>
									</div>
									<div class="panel panel-primary" id="cheque" style="display: none;">
										<div class="panel-heading">
											<s:text name="cheque.chequeDetails" />
										</div>
										<div class="panel-body">
											<div class="row">
												<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
													<div class="text">
														<s:text name="cheque.chequeNo" /> <font color="red">*</font>
													</div>
													<div class="tbox">
														<s:textfield name="chequeNo" id="chequeNo" onchange="checkNumbers(this);" cssClass="inputBox tooltipContent" data-content="Cheque No." disabled="#disable2" maxlength="20" />
													</div>
												</div>
												<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
													<div class="text">
														<s:text name="cheque.chequeDate" /> <font color="red">*</font>
													</div>
													<div class="tbox">
														<s:textfield name="chequeDate" id="chequeDate" cssClass="inputBox datePicker" readonly="true" />
													</div>
												</div>
												<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
													<div class="text">
														<s:text name="cheque.chequeAmount" /> <font color="red">*</font>
													</div>
													<div class="tbox">
														<s:textfield name="chequeAmount" id="chequeAmount" cssClass="inputBox tooltipContent" data-content="Cheque Amount" disabled="#disable2" maxlength="20" onkeyup="checkNumbers(this);" />
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
													<div class="text">
														<s:text name="cheque.bankName" /> <font color="red">*</font>
													</div>
													<div class="tbox">
														<s:select name="bankName" id="bankName" list="bankNamelist" listKey="CODE" listValue="CODEDESC" headerKey="" headerValue="---Select---" cssClass="inputBoxS tooltipContent" data-content="Banker Name" />
													</div>
												</div>
												<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
													<div class="text">
														<s:text name="cheque.micrCode" /> <font color="red">*</font>
													</div>
													<div class="tbox">
														<s:textfield name="micrCode" id="micrCode" onchange="checkNumbers(this);" cssClass="inputBox tooltipContent" data-content="MICR Code" disabled="#disable2" maxlength="9" />
													</div>
												</div>
											</div>
											<br class="clear" />
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
					<div class="modal" id="agreePayment" role="dialog">
		                <div class="modal-dialog" role="document">
		                    <div class="modal-content">
		                        <div class="modal-header">
		                            <h4 class="modal-title" id="agreePaymentLabel"><s:text name="payment.confirmation.attention"/>  </h4>
		                        </div>
		                        <div class="modal-body">
		                            <div class="row">			                          	
			                          	 	<s:text name="payment.conformation.message"/>                         	
									</div>
		                        </div>
		                        <div class="modal-footer" style="text-align: center">
			                        <button type="button" class="btn btn-sm btn-success" name="iagreed"  id="iagreed" onclick="this.form.actionType.value='getQuote';setIssueSysDate();disableForm(this.form,false,'');this.form.submit();disableButton(this.id);" ><s:text name="payment.confirmation.button"/>
									</button> 
		                        </div>
		                    </div>
		                </div>
		            </div>
				
			</s:else>
			
		</s:if>
		<s:else>
			<div class="row">
				<div class="panel panel-primary">
					<div class="panel-body">
						<div class="row">
							<div class="col-xs-3">
								<s:text name="label.generatePolicy"/>
							</div>
							<div class="col-xs-9">
								<s:radio list="#{'Y':'Schedule','N':'Draft'}"  name="generatePolicyYN" id="generatePolicyYN" value="%{generatePolicyYN==null?'N':generatePolicyYN}"/>
								<!--<s:if test="%{#session.product_id == 33}">
									<s:radio list="#{'Y':'Schedule','N':'Draft'}"  name="generatePolicyYN" id="generatePolicyYN" value="%{generatePolicyYN==null?'N':generatePolicyYN}"/>
								</s:if>
								<s:elseif test="%{#session.product_id == 65}">
									<s:radio list="#{'Y':'Schedule','N':'Draft'}"  name="generatePolicyYN" id="generatePolicyYN" value="%{generatePolicyYN==null?'N':generatePolicyYN}"/>
								</s:elseif>-->
							</div>
						</div>
					</div>
				</div>
			</div>
		</s:else>
		<s:hidden name="b2cCustYN"></s:hidden>
	</body>
	<script  type="text/javascript">
		function showCheque(val) {
			if(val=='CHEQUE'){
				 document.getElementById('cheque').style.display="block";
			} else {
				document.getElementById('cheque').style.display="none";
			}
		}
		if('<s:property value="generatePolicyYN"/>' =="Y"){
			showCheque('<s:property value="modeOfPayment"/>');
		}
		if('<s:property value="modeOfPayment"/>'!=null && '<s:property value="modeOfPayment"/>'!=''){
			document.getElementById('modeOfPayment_<s:property value="modeOfPayment"/>').checked=true;
		}
		 function toggleGeneratePolicy() {
	       	if(document.getElementById('generatePolicyYN').checked) {
	        	//document.getElementById('generatePolicyDiv').style.display = "";
	        	document.getElementById('generatePolicyYN').checked = true;
	        	getMop('Y');
	        	toggleEmailYN('Y');
	        } else {
	        	document.getElementById('generatePolicyYN').checked = false;
	        	//document.getElementById('generatePolicyDiv').style.display = "none";
	        	toggleEmailYN('');
	        	getMop('');
	        }
	    }
		function toggleEmailYN(value)
   		 {
			 if(document.getElementById('generatePolicyYN').checked)
			 {
				document.getElementById('quoteEmailYN').checked=false; 
			 	document.getElementById("quoteEmailYN").disabled=true;			 	
			 }   
			 else
			 {  
			    document.getElementById("quoteEmailYN").disabled=false;				
			 } 
    	}
		function getMop(val) {
			//if (document.getElementById("generatePolicyYN").checked || val == "Y") {
			if (document.getElementById("generatePolicyYN").checked) {
				//document.getElementById("modeOfPay").style.display = "block";
				var value = document.getElementById("modeOfPay").value;
				if(value=="Cash" || value=="Cheque")
				 {
				 	//document.getElementById('ChqInvNoData').style.display='block';
				 	//document.getElementById('ChqInvNoData').value='';
				 }   
				 else
				 {   
					//document.getElementById('ChqInvNoData').value='';
					//document.getElementById('ChqInvNoData').style.display='none';			 
				 }
				 document.getElementById('modeOfPayment_SADAD').disabled = false;
				 document.getElementById('modeOfPayment_MASTERCARD').disabled = false;
				 document.getElementById('modeOfPayment_VISA').disabled = false;
			///	 document.getElementById('modeOfPayment_CHEQUE').disabled = false;
			} else {
				//document.getElementById("modeOfPay").style.display = "none";
				//document.getElementById('ChqInvNoData').style.display='none';
				//document.getElementById('ChqInvNoData').value='';
				document.getElementById('modeOfPayment_SADAD').disabled = true;
				document.getElementById('modeOfPayment_MASTERCARD').disabled = true;
				document.getElementById('modeOfPayment_VISA').disabled = true;
				//document.getElementById('modeOfPayment_CHEQUE').disabled = true;
			}
		}
			
		function toggleDeclaration() {
			if (document.getElementById("generatePolicyYN").checked) {
				document.getElementById("declarationDiv").style.display = "block";
			} else {
				document.getElementById("declarationDiv").style.display = "none";
			}
		}
		/*function getChequeMode(val) {
			if(val=='CHEQUE'){
				 document.getElementById('cheque').style.display="block";
			} else {
				document.getElementById('cheque').style.display="none";
			}
		}*/
		//toggleChqInvNo('<s:property value="modeOfPayment"/>');
		if("Y"=='<s:property value="generatePolicyYN"/>') {	
			document.getElementById('generatePolicyYN').checked = true;
			toggleGeneratePolicy();
		}
		/*if('<s:property value="generatePolicyYN"/>' == 'Y'){
			document.getElementById('generatePolicyYN').checked = true;
			getMop('<s:property value="generatePolicyYN"/>');
			toggleEmailYN('<s:property value="generatePolicyYN"/>');
			//getChequeMode('<s:property value="modeOfPayment"/>');
			
		}
		else{
			document.getElementById('generatePolicyYN').checked = false;
		}*/
		<s:if test='"showmodel".equals(isfirsttime)'>
			$(document).ready(function(){
					$("#agreePayment").modal("show");   
			});
		</s:if>	
	</script>
</html>	