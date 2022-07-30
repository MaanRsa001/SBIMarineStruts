<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<s:form name="policyInfo" theme="simple" action="initReport.action">
<s:iterator value="policyInformation">

<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">			
			<div class="panel-body">
				<s:set var="paymentDtl" value="%{paymentDetails}"/>
				<font color="red"><s:actionerror cssStyle="list-style:none;"/></font>
				<s:if test='POLICY_NO != null && POLICY_NO!=""'>
					<div class="panel panel-primary">
						<div class="panel-heading">
							<s:label key="policyInfo.policyInfo" />
						</div>
						<div class="panel-body" align="center">
							<font size="5px" style="font-weight: bold;"><s:text name="policyInfo.yourPolicyNumberis" /> <font color="blue"><s:property value="POLICY_NO"/></font></font>
							<s:if test='"VISA".equalsIgnoreCase(#paymentDtl.PAYMENT_TYPE) || "SADAD".equalsIgnoreCase(#paymentDtl.PAYMENT_TYPE)'>
								<table class="footable tableWidth">
									<tbody>
										<tr>
											<s:if test='"SADAD".equalsIgnoreCase(#paymentDtl.PAYMENT_TYPE)'>
												<td><s:text name="SADAD.Transaction.Id" /></td>
												<td><s:property value="#paymentDtl.RESPONSE_TRAN_NO"/></td>
											</s:if>
											<s:else>
												<td><s:text name="Response.Transaction.Id" /></td>
												<td><s:property value="#paymentDtl.RESPONSE_TRAN_NO"/></td>
											</s:else>
										</tr>
										<tr>
											<td><s:text name="Response.Status" /></td>
											<td><s:property value="#paymentDtl.RESPONSE_STATUS"/></td>
										</tr>	
										<tr>
											<td><s:text name="Response.Code" /></td>
											<td><s:property value="#paymentDtl.RESPONSE_CODE"/></td>
										</tr>	
										<tr>
											<td><s:text name="Response.Message" /></td>
											<td><s:property value="#paymentDtl.RESPONSE_MESSAGE"/></td>
										</tr>		
									</tbody>
								</table>
							</s:if>
						</div>
					</div>
				</s:if>
				<s:elseif test='"VISA".equalsIgnoreCase(#paymentDtl.PAYMENT_TYPE) || "SADAD".equalsIgnoreCase(#paymentDtl.PAYMENT_TYPE)'>
					<div class="panel panel-primary">
						<div class="panel-heading">
							<s:text name="Transaction.Status" />
						</div>
						<div class="panel-body" align="center">
							<s:if test='"VISA".equalsIgnoreCase(#paymentDtl.PAYMENT_TYPE) || "SADAD".equalsIgnoreCase(#paymentDtl.PAYMENT_TYPE)'>
								<table class="footable tableWidth">
									<tbody>
										<tr>
											<s:if test='"SADAD".equalsIgnoreCase(#paymentDtl.PAYMENT_TYPE)'>
												<td><s:text name="SADAD.Transaction.Id" /></td>
												<td><s:property value="#paymentDtl.RESPONSE_TRAN_NO"/></td>
											</s:if>
											<s:else>
												<td><s:text name="Response.Transaction.Id" /></td>
												<td><s:property value="#paymentDtl.RESPONSE_TRAN_NO"/></td>
											</s:else>
										</tr>
										<tr>
											<td><s:text name="Response.Status" /></td>
											<td><s:property value="#paymentDtl.RESPONSE_STATUS"/></td>
										</tr>	
										<tr>
											<td><s:text name="Response.Code" /></td>
											<td><s:property value="#paymentDtl.RESPONSE_CODE"/></td>
										</tr>	
										<tr>
											<td><s:text name="Response.Message" /></td>
											<td><s:property value="#paymentDtl.RESPONSE_MESSAGE"/></td>
										</tr>		
									</tbody>
								</table>
							</s:if>
						</div>
					</div>
				</s:elseif>
				<div class="panel panel-primary">
					<div class="panel-heading">
						<s:label key="quotation.quoteInfo" />
					</div>
					<div class="panel-body">					
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
								<table width="100%">
									<tr>
										<td width="40%"><b><s:label key="premiumInfo.quoteNo" /></b></td>
										<td width="60%">&nbsp;&#58;&nbsp;<s:property value="QUOTE_NO"/></td>
									</tr>
								</table>
						 	</div>
						 	<div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
						 		<table width="100%">
									<tr>
										<td width="40%"><b><s:label key="policyInfo.quotationDate" /></b></td>
										<td width="60%">
											&nbsp;&#58;&nbsp;
									 		<s:if test='POLICY_NO != null && POLICY_NO!=""'>
						                   		<s:property value="POL_DATE"/>
						                   	</s:if>
						                   	<s:else>
						                   		<s:property value="QUOTE_DATE"/>
						                   	</s:else>
										</td>
									</tr>
								</table>						 		
						 	</div>
						 	<div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
						 		<table width="100%">
									<tr>
										<td width="40%" valign="top"><b><s:label key="policyInfo.proposerName" /></b></td>
										<td width="60%">&nbsp;&#58;&nbsp;<s:property value="PROPOSER_NAME"/></td>
									</tr>
								</table>
						 	</div>
						 	<div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
						 		<table width="100%">
									<tr>
										<td width="40%"><b><s:label key="policyInfo.coverStartDate" /></b></td>
										<td width="60%">&nbsp;&#58;&nbsp;<s:property value="COVER_START_DATE"/></td>
									</tr>
								</table>
						 	</div>
						 	<div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
						 		<table width="100%">
									<tr>
										<td width="40%"><b><s:label key="policyInfo.coverEndDate" /></b></td>
										<td width="60%">&nbsp;&#58;&nbsp;<s:property value="COVER_END_PERIODS"/></td>
									</tr>
								</table>
						 	</div>
						 	<br class="clear" />
						</div>
					</div>
				</div>
				<s:if test='%{#session.product_id == 65 && STATUS == "N" && "N".equals(generatePolicyYN) && b2cCustYN=="Y"}'>
					<div class="panel panel-primary">				
						<div class="panel-body" align="center">
							<div style="color:red;font-size: 15px;">
								<b>
				   					<s:label key="policyInfo.contactInsurance"/>
				   				</b>
			   				</div>
						</div>
					</div>
				</s:if>
				<s:elseif test='%{STATUS == "Y"}'>
					<div style="color:red;font-size: 15px;" align="center">
					<b>
						<s:if test='%{#session.product_id == 30 && validCoverage!=null && !"".equals(validCoverage)}'>
							<s:property value="getText('label.error.validcoverage.referralmsg')"/> :<br/><s:property value="validCoverage"/>
						</s:if>
						<s:else>
							<s:property value="policyInfoReferralMsg"/>
						</s:else>						
						<br/>
						<s:label key="policyInfo.referralMsg"/><s:property value="REFERRAL_DESC"/>
					</b>
					</div>
					<br class="clear" />
					<div style="width: 100%; margin: 0 auto;">	
						<center><b><s:property value="premiumInfoReferralMsg"/></b></center>
					</div>
					<br class="clear" />
					<s:if test="adminuwList.size()>0">
						<table class="table table-bordered" width="100%">
							<thead>
							<tr>
								<th width="5%"><s:text name="motor.sNo" /></th>
								<th width="31.66%"><s:text name="motor.name" /></th>
								<th width="31.66%"><s:text name="customer.email" /></th>
							</tr>
							</thead>
							<tbody>
							<s:iterator value="adminuwList" status="stat" var="adminIds">  
										<tr>
											<td>
												<s:property value="%{#stat.index+1}"/>
											</td>
											<td>
									    		<s:property value="%{#adminIds.USERNAME}"/>
											</td>
											<td>
									    		<s:property value="%{#adminIds.USER_MAIL}"/>
											</td>
										</tr>
							</s:iterator>
							</tbody>
						</table>
					</s:if>
				</s:elseif>
				<s:elseif test='STATUS == "N"'>
				<div class="panel panel-primary">
					<div class="panel-heading">
						<s:label key="premiumInfo.premiumInfo" />
					</div>
					<div class="panel-body">
						<div class="row">
							<s:if test="%{#session.product_id == 31 || #session.product_id == 32 || #session.product_id == 33 || #session.product_id == 34 || #session.product_id == 41 || #session.product_id == 65 || #session.product_id == 30}">
								<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
									<b><s:label key="travel.Premium" />&nbsp;<s:property value="#session.BrokerDetails.CurrencyAbb"/></b> &nbsp;&#58;&nbsp; <s:property value="getText('{0,number,#,##0.00}',{PREMIUM})"/>
								</div>
							</s:if>
							<s:else>
								<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
									<b><s:label key="policyInfo.totalInsuredValueUSD" />&nbsp;<s:property value="#session.BrokerDetails.CurrencyAbb"/></b> &nbsp;&#58;&nbsp; <s:property value="EQUIVALENT"/> <br/>
									<b><s:label key="premiumInfo.showPremium" />&nbsp;<s:property value="#session.BrokerDetails.CurrencyAbb"/></b> &nbsp;&#58;&nbsp; <s:property value="PREMIUM"/>
								</div>
							</s:else>
							<br class="clear" />
						</div>
					</div>
				</div>
				<div class="panel panel-primary">
					<div class="panel-heading">
						<s:label key="policyInfo.documentInfo" />
					</div>
					<div class="panel-body">
						<div class="row">
							<s:if test='POLICY_NO == null  || POLICY_NO==""'>
								
									<table width="100%" class="table table-bordered" style="border: none;">
										<tbody>
											<tr>
												<s:if test="#session.product_id == 65" >
													
														<td width="33%" style="border: none;" align="center"><s:label key="policyInfo.draft" /></td>
														<td width="33%" style="border: none;" align="center"><s:property value="QUOTE_NO"/></td>
													
												</s:if>
												<s:else>
													<td width="33%" style="border: none;" align="center"><s:label key="policyInfo.draft" /></td>
													<td width="33%" style="border: none;" align="center"><s:property value="QUOTE_NO"/></td>
												</s:else>
												
												<s:if test="#session.product_id == 65" >
													 
														<td width="33%" style="border: none;" align="center">
														<s:if test="%{#session.product_id == openCover}">
															<button type="button" name="Submit2" class="btn btn-sm btn-info" onclick="return getPopup('print4ScheduleOpen.OpenCertificate?policynumber=<s:property value="QUOTE_NO"/>&loginid=<s:property value="LOGIN_ID"/>&printoption=<s:property value="PDF_PRE_SHOW_STATUS"/>&bankerOption=<s:property value="PDF_BANKER_STATUS"/>&displayText=DRAFT&displayMode=draftMode&bankerAssuredOption=<s:property value="PDF_BANKER_ASSURED_STATUS"/>')">
																<s:text name="policyInfo.draft" />
															</button>
														</s:if>
														<s:elseif test="%{#session.product_id == 31 || #session.product_id == 32  || #session.product_id == 34 || #session.product_id == 41 || #session.product_id == 42}">
															<button type="button" name="Submit2" class="btn btn-sm btn-warning" onclick="return popUp('PdfSummary_Schedule.Travel?quoteNo='+<s:property value="QUOTE_NO"/>,'1000','500');">
																<s:text name="policyInfo.schedule" />
															</button>
														</s:elseif>
														<s:else><!--
														<s:hidden name="menuType"></s:hidden>
															--><button type="button" name="Submit2" class="btn btn-sm btn-info" onclick="return getMotorProposalPdf(<s:property value="QUOTE_NO" />)">
																<s:text name="policyInfo.draft" />
															</button>
														</s:else>
														</td>
													 
												</s:if>
												<s:else>
													<td width="33%" style="border: none;" align="center">
													<s:if test="%{#session.product_id == openCover}">
														<button type="button" name="Submit2" class="btn btn-sm btn-info" onclick="return getPopup('documentpdfReport.action?docType=draft&quoteNo=<s:property value="QUOTE_NO"/>&loginid=<s:property value="LOGIN_ID"/>&printoption=<s:property value="PDF_PRE_SHOW_STATUS"/>&bankerOption=<s:property value="PDF_BANKER_STATUS"/>&displayText=DRAFT&displayMode=draftMode&bankerAssuredOption=<s:property value="PDF_BANKER_ASSURED_STATUS"/>')">
															<s:text name="policyInfo.draft" />
														</button>
													</s:if>
													<s:elseif test="%{#session.product_id == 31 || #session.product_id == 32  || #session.product_id == 34 || #session.product_id == 41 || #session.product_id == 42}">
														<button type="button" name="Submit2" class="btn btn-sm btn-warning" onclick="return popUp('PdfSummary_Schedule.Travel?quoteNo='+<s:property value="QUOTE_NO"/>,'1000','500');">
															<s:text name="policyInfo.schedule" />
														</button>
													</s:elseif>
													<s:else><!--
													<s:hidden name="menuType"></s:hidden>
														--><button type="button" name="Submit2" class="btn btn-sm btn-info" onclick="return getPopup('documentpdfReport.action?docType=draft&quoteNo=<s:property value="QUOTE_NO"/>&loginid=<s:property value="LOGIN_ID"/>&printoption=<s:property value="PDF_PRE_SHOW_STATUS"/>&bankerOption=<s:property value="PDF_BANKER_STATUS"/>&displayText=DRAFT&displayMode=draftMode&bankerAssuredOption=<s:property value="PDF_BANKER_ASSURED_STATUS"/>')">
															<s:text name="policyInfo.draft" />
														</button>
													</s:else>
													</td>
												</s:else>												
											</tr>									
										</tbody>
									</table>
 							</s:if>				
							<s:if test='POLICY_NO != null  && POLICY_NO !=""'>
								<s:if test='%{#session.product_id == "65"}'>
									<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
			       						<s:set var="multiVehicleDtls" value="%{multiVehicleDetails}"/>
										<table cellpadding="1" class="table table-bordered" cellspacing="1" border="1">
											<thead>
										        <tr>
													<th style="width:5%;"><s:text name="motor.sNo" /></th>
													<th style="width:15%;"><s:text name="motor.vehicleUsage"/></th>
													<th style="width:20%;"><s:label key="motor.make" /></th>
													<th style="width:20%;"><s:label key="motor.model" /></th>
													<th style="width:15%;"><s:text name="motor.typeOfBody" /></th>
													<th style="width:15%;"><s:label key="motor.sumInsured" /></th>
													<th style="width:10%;"></th>
												</tr>
											</thead>
											<tbody>
												<s:iterator value="#multiVehicleDtls" var="view" status="status">
													<tr>
														<td><s:property value="#status.count" /></td>
														<td><s:property value="#view.VEHICLETYPE_DESC" /></td>
														<td><s:property value="#view.MAKE_NAME" /></td>					
														<td><s:property value="#view.MODEL_NAME" default=" " /> </td>
														<td><s:property value="#view.TYPE_OF_BODY_NAME" /></td>
														<td><s:property value="#view.SUMINSURED_VALUE_LOCAL" /></td>
														<td align="center">
															<button type="button" name="Submit2" class="btn btn-sm btn-warning"  onclick="return getBailBondPdf('<s:property value="#view.QUOTE_NO" />','<s:property value="#view.VEHICLE_ID" />')">
															<s:label key="motor.certificate" />
															</button>
														</td>
													</tr>
												</s:iterator>
											</tbody>
										</table>
									</div>
	        					</s:if>
	        					<s:if test='SHOW_STATUS == "N"'>
	        						<br class="clear"/>
		        						<%--<div style="color:green;font-size: 15px;" align="center">
											<b>
							   					<s:label key="policyInfo.information"/>
							   				</b>
						   				</div>--%>
					   				<br class="clear"/>
		        					<table width="100%" class="table table-bordered" style="border: none;">
										<tbody>
											<tr>
												<td width="33%" style="border: none;" align="center">
													<s:if test="ISSELECTCOVER != 5">
														<s:label key="policyInfo.schedule" />
													</s:if>
													<s:else><s:label key="policyInfo.proposal" /></s:else>
												</td>
												<td width="33%" style="border: none;" align="center"><s:property value="QUOTE_NO"/></td>
												<s:if test="ISSELECTCOVER != 5">
													<td width="33%" style="border: none;" align="center">
														<button type="button" name="Submit2" class="btn btn-sm btn-info" onclick="return getPopup('documentpdfReport.action?docType=schedule&quoteNo=<s:property value="QUOTE_NO"/>&loginid=<s:property value="LOGIN_ID"/>&printoption=<s:property value="PDF_PRE_SHOW_STATUS"/>&bankerOption=<s:property value="PDF_BANKER_STATUS"/>&displayText=DRAFT&displayMode=draftMode&bankerAssuredOption=<s:property value="PDF_BANKER_ASSURED_STATUS"/>')">
															<s:text name="policyInfo.schedule" />
														</button>
													</td>
												</s:if>
												<s:else><td width="33%" style="border: none;" align="center"></td></s:else>	
												<td align="center">
													<button type="button" name="Submit2" class="btn btn-sm btn-info" onclick="return getMotorProposalPdf(<s:property value="QUOTE_NO" />)">
														<s:text name="policyInfo.proposal" />
													</button>
												</td>
											</tr>									
										</tbody>
									</table>
	        					</s:if>
	        					<s:else>	
		        					<s:if test="%{#session.product_id == 65}">
		        					<table width="100%" class="table table-bordered" style="border: none;">
												<tbody>
		        								<s:if test="ISSELECTCOVER != 5">
			        						
													<tr>
														<td width="33%" style="border: none;" align="center"><s:label key="policyInfo.schedule" /></td>
														<td width="33%" style="border: none;" align="center"><s:property value="POLICY_NO"/></td>
														<td width="33%" style="border: none;" align="center">
															<s:if test="%{#session.product_id == 31 ||#session.product_id == 32 || #session.product_id == 34 || #session.product_id == 41}">
																<button type="button" name="Submit2" class="btn btn-sm btn-info" value="Schedule" onclick="return getPopup('PdfSummary_Schedule.Travel?quoteNo='+<s:property value="QUOTE_NO"/>);" style="width: 100px;">
										                  			<s:text name="policyInfo.schedule" />
										                  		</button>
										                  	</s:if>
										                  	<s:else>
										                  		<button type="button" name="Submit2" class="btn btn-sm btn-info" value="Schedule" onclick="return getPopup('Copyofinformation.jsp?policyMode=schedule&policynumber=<s:property value="POLICY_NO"/>&loginid=<s:property value="LOGIN_ID"/>')" style="width: 100px;">
										                  			<s:text name="policyInfo.schedule" />
										                  		</button>
										                  	</s:else>
														</td>
													</tr>									
												
													</s:if>
													<tr>
														<td width="33%" style="border: none;" align="center"><s:label key="policyInfo.proposal" /></td>
														<td width="33%" style="border: none;" align="center"><s:property value="POLICY_NO"/></td>
															<td width="33%" style="border: none;" align="center">												 
									                  		<button type="button" name="Submit2" class="btn btn-sm btn-info" onclick="return getMotorProposalPdf(<s:property value="QUOTE_NO" />)">
																	<s:text name="policyInfo.proposal" />
															</button>									                  	 
														</td>
													</tr>	
										</tbody>
											</table>
		        					</s:if>
	        					<s:else>
	        						<table width="100%" class="table table-bordered" style="border: none;">
										<tbody>
											<tr>
												<td width="33%" style="border: none;" align="center"><s:label key="policyInfo.schedule" /></td>
												<td width="33%" style="border: none;" align="center"><s:property value="POLICY_NO"/></td>
												<td width="33%" style="border: none;" align="center">
													<s:if test="%{#session.product_id == 31 ||#session.product_id == 32 || #session.product_id == 34 || #session.product_id == 41}">
														<button type="button" name="Submit2" class="btn btn-sm btn-info" value="Schedule" onclick="return getPopup('PdfSummary_Schedule.Travel?quoteNo='+<s:property value="QUOTE_NO"/>);" style="width: 100px;">
								                  			<s:text name="policyInfo.schedule" />
								                  		</button>
								                  	</s:if>
								                  	<s:else>
								                  		<button type="button" name="Submit2" class="btn btn-sm btn-info" value="Schedule" onclick="return getPopup('documentpdfReport.action?docType=schedule&quoteNo=<s:property value="QUOTE_NO"/>&loginid=<s:property value="LOGIN_ID"/>')" style="width: 100px;">
								                  			<s:text name="policyInfo.schedule" />
								                  		</button>
								                  	</s:else>
												</td>
											</tr>									
										</tbody>
									</table>
	        					</s:else>	        					        					
								
								<s:if test="%{endTypeId!=null && endTypeId.length() > 0 && (#session.product_id == 3|| #session.product_id == 11)}">
									<table width="100%" class="table table-bordered" style="border: none;">
										<tbody>
											<tr>
												<td width="33%" style="border: none;" align="center"><s:label key="policyInfo.endtSchedule" /></td>
												<td width="33%" style="border: none;" align="center"><s:property value="POLICY_NO"/></td>
												<td width="33%" style="border: none;" align="center">
													<button type="button" class="btn btn-sm btn-info" onclick="return getPopup('documentpdfReport.action?docType=EndtSchedule&policyNo=<s:property value="POLICY_NO"/>&quoteNo=<s:property value="QUOTE_NO"/>&applicationNo=<s:property value="applicationNo"/>&endTypeId=<s:property value="endTypeId"/>')" style="width: 100px;">
														<s:text name="label.endorsement" />
													</button>
												</td>
											</tr>									
										</tbody>
									</table>
								</s:if>
								
								</s:else>																
							</s:if>
							<s:if test='SHOW_STATUS != "N"'>
							<s:if test='%{DEBIT_NOTE_NO != null && !"".equals(DEBIT_NOTE_NO) }'>
	               		  		<s:if test="%{#session.product_id == 31 || #session.product_id == 32 || #session.product_id == 34 || #session.product_id == 41}">
	               		  			<table width="100%" class="footable" style="border: none;">
										<tbody>
											<tr>
												<td width="33%" style="border: none;" align="center"><s:label key="policyInfo.debit" /></td>
												<td width="33%" style="border: none;" align="center"><s:property value="DEBIT_NOTE_NO"/></td>
												<td width="33%" style="border: none;" align="center">
													<button type="button" class="btn btn-sm btn-info" onclick="return getPopup('PdfSummary_Debit.Travel?quoteNo='+<s:property value="QUOTE_NO"/>);" style="width: 100px;">
														<s:text name="label.debitNote" />
													</button>
												</td>
											</tr>									
										</tbody>
									</table>	               		  			
								</s:if>
	               		  		<s:else>
	               		  			<table width="100%" class="footable" style="border: none;">
										<tbody>
											<tr>
												<td width="33%" style="border: none;" align="center"><s:label key="policyInfo.debit" /></td>
												<td width="33%" style="border: none;" align="center"><s:property value="DEBIT_NOTE_NO"/></td>
												<td width="33%" style="border: none;" align="center">
													<button type="button" class="btn btn-sm btn-info" onclick="return getPopup('documentpdfReport.action?docType=debit&policyNo=<s:property value="POLICY_NO"/>&loginid=<s:property value="LOGIN_ID"/>')" style="width: 100px;">
														<s:text name="policyInfo.debit" />
													</button>
												</td>
											</tr>									
										</tbody>
									</table>
	               		  		</s:else>
	               		  	</s:if>
	               		  	<s:if test="%{RECEIPT_NO != null}">
	               		  		<table width="100%" class="footable" style="border: none;">
									<tbody>
										<tr>
											<td width="33%" style="border: none;" align="center"><s:label key="policyInfo.receipt" /></td>
											<td width="33%" style="border: none;" align="center"><s:property value="RECEIPT_NO"/></td>
											<td width="33%" style="border: none;" align="center">
												<button type="button" class="btn btn-sm btn-info" onClick="getReceiptPdf('<s:property value="QUOTE_NO"/>')" style="width: 100px;">
													<s:text name="label.receipt" />
												</button>
											</td>
										</tr>									
									</tbody>
								</table>	               		  			
								<s:if test="%{#session.product_id == 65}">
									<table width="100%" class="footable" style="border: none;">
										<tbody>
											<tr>
												<td width="33%" style="border: none;" align="center"><s:label key="policyInfo.bailBond" /></td>
												<td width="33%" style="border: none;" align="center"></td>
												<td width="33%" style="border: none;" align="center">
													<button type="button" class="btn btn-sm btn-warning" onclick="getBailBondPdf(<s:property value="QUOTE_NO"/>);" style="width: 100px;">
														<s:text name="policyInfo.bailBond" />
													</button>
												</td>
											</tr>									
										</tbody>
									</table>						
								</s:if>
	               		  	</s:if>
	               		  	<s:if test='%{CREDIT_NOTE_NO != null && !"".equals(CREDIT_NOTE_NO)}'>
	               		  		<s:if test='"Y".equalsIgnoreCase(creditNoteStatus)'>
		               		  		<table width="100%" class="footable" style="border: none;">
										<tbody>
											<tr>
												<td width="33%" style="border: none;" align="center"><s:label key="policyInfo.credit" /></td>
												<td width="33%" style="border: none;" align="center"><s:property value="CREDIT_NOTE_NO"/></td>
												<td width="33%" style="border: none;" align="center">
													<button type="button" class="btn btn-sm btn-warning" onclick="return getPopup('documentpdfReport.action?docType=credit&policyNo=<s:property value="POLICY_NO"/>&loginid=<s:property value="LOGIN_ID"/>')" style="width: 100px;">
														<s:text name="policyInfo.credit" />
													</button>
												</td>
											</tr>									
										</tbody>
									</table>
								</s:if>								
							</s:if>
							<%-- <s:if test="%{#session.product_id == 3 && POLICY_NO != null}">
								<table width="100%" class="footable" style="border: none;">
									<tbody>
										<tr>
											<td width="33%" style="border: none;" align="center"><s:label key="policyInfo.policyWording" /></td>
											<td width="33%" style="border: none;" align="center"><s:property value="POLICY_NO"/></td>
											<td width="33%" style="border: none;" align="center">
												<button type="button" class="btn btn-sm btn-info" onclick="return getPopup('Copyofinformation.jsp?policyMode=clauses&policynumber=<s:property value="POLICY_NO"/>&loginid=<s:property value="LOGIN_ID"/>')" style="width: 100px;">
													<s:text name="policyInfo.policyWording" />
												</button>
											</td>
										</tr>									
									</tbody>
								</table>
							</s:if>
							<s:if test='%{#session.product_id == 33  && POLICY_NO != null }'>
								<table width="100%" class="footable" style="border: none;">
									<tbody>
										<tr>
											<td width="33%" style="border: none;" align="center"><s:label key="policyInfo.policyTermsAndCondition" /></td>
											<td width="33%" style="border: none;" align="center"><s:property value="POLICY_NO"/></td>
											<td width="33%" style="border: none;" align="center">
												<button type="button" class="btn btn-sm btn-info" onclick="getPolicyWordingPdf(<s:property value="QUOTE_NO"/>);" style="width: 100px;">
													<s:text name="label.download" />
												</button>
											</td>
										</tr>									
									</tbody>
								</table>
							</s:if> --%>
							</s:if>   
						</div>
					</div>
				</div>
							<s:if test='%{"65".equalsIgnoreCase(#session.product_id) && POLICY_NO != null && POLICY_NO!=""}'>
								<s:if test='%{"ar".equals(#session.isArabic)}'>
							    <s:text name="label.policy.givefeedback"/><s:radio list="#{'Y':'نعم','N':'لا'}" name="feedbackyn" id="feedbackyn" value="%{'Y'}" onclick="toggleFeedback(this.value);"  /> 
								</s:if>
								<s:else>
								<s:text name="label.policy.givefeedback"/><s:radio list="#{'Y':'Yes','N':'No'}" name="feedbackyn" id="feedbackyn" value="%{'Y'}" onclick="toggleFeedback(this.value);"  />
								</s:else>
								<br class="clear"/>								
						 		<s:include value="/pages/feedbackform.jsp"/>
						 	</s:if>
				</s:elseif>
			</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
		<s:if test="%{endTypeId!=null && endTypeId.length() > 0}">
			<s:hidden name="menuType" value="P"/>
		</s:if>
		<s:elseif test='STATUS=="Y"'>
			<s:hidden name="menuType" value="RU"/>
		</s:elseif>
		<s:else>
			<s:if test="%{#session.product_id == 3 || #session.product_id == 11 || #session.product_id == 33}">
				<s:hidden name="menuType" value='%{(POLICY_NO==null || POLICY_NO=="")?"QE":"P"}'/>
			</s:if>
			<s:elseif test="#session.product_id == 65">
				<s:hidden name="menuType" value="%{POLICY_NO==null?'QE':'AP'}"/>
			</s:elseif>
			<s:else>
				<s:if test='%{quoteStatus==null || quoteStatus==""}'>
					<s:hidden name="menuType" value='%{(POLICY_NO==null || POLICY_NO=="")?menuType=="RA"?"RA":"QE":"P"}'/>
				</s:if>
				<s:else>
					<s:hidden name="menuType" value='%{(POLICY_NO!=null && POLICY_NO!="")?"P":quoteStatus}'/>
				</s:else>
			</s:else>
		</s:else>    
		<s:if test='%{POLICY_NO==null || POLICY_NO==""}'>  
			<s:if test="%{#session.product_id == 31 || #session.product_id == 32 || #session.product_id == 33 || #session.product_id == 34}">
				<s:if test='referralMsg==null || "".equalsIgnoreCase(referralMsg)'>
				<button type="submit" name="Submit"  class="btn btn-sm btn-danger" onclick="update('initPremium.action')"/> 
											<s:text name="motor.back" />
										</button>
					<!--<s:submit name="Submit" type="submit" cssClass="btn btn-sm btn-danger" value="Back"  onclick="update('showQuoteTravel.action')"/> &nbsp;&nbsp;&nbsp;-->
				</s:if>
				<s:else>
				<button type="submit" name="Submit"  class="btn btn-sm btn-danger" onclick="update('initPremium.action')"/> 
											<s:text name="motor.back" />
										</button>
					<!--<s:submit name="Submit" type="submit" cssClass="btn btn-sm btn-danger" value="Back"  onclick="update('initTravel.action')"/> &nbsp;&nbsp;&nbsp;-->																
				</s:else>
			</s:if>
			<s:elseif test="%{#session.product_id == 41}">
			<button type="submit" name="Submit"  class="btn btn-sm btn-danger" onclick="update('initPremium.action')"/> 
											<s:text name="motor.back" />
										</button>																
				<!--<s:submit name="Submit" type="submit" cssClass="btn btn-sm btn-danger" value="Back"  onclick="update('showQuoteHealth.action')"/> &nbsp;&nbsp;&nbsp;-->
			</s:elseif>
			<s:elseif test="%{#session.product_id == 65}">
				<s:if test='referralMsg==null || "".equalsIgnoreCase(referralMsg) || "RA".equals(quoteStatus)'>
				<button type="submit" name="Submit"  class="btn btn-sm btn-danger" onclick="update('showPolicyInfoMotor.action')"/> 
											<s:text name="motor.back" />
										</button>
					<!--<s:submit name="Submit" type="submit" cssClass="btn btn-sm btn-danger" value="Back"  onclick="update('showPolicyInfoMotor.action')"/>-->
				</s:if>
				<s:elseif test='"2".equals(premiumType)'>
				<button type="submit" name="Submit"  class="btn btn-sm btn-danger" onclick="update('editQuoteMotor.action')"/> 
											<s:text name="motor.back" />
										</button>
					<!--<s:submit name="Submit" type="submit" cssClass="btn btn-sm btn-danger" value="Back"  onclick="update('editQuoteMotor.action')"/>-->
				</s:elseif>
				<s:else>
				<button type="submit" name="Submit"  class="btn btn-sm btn-danger" onclick="update('showSummarryMotor.action')"/> 
											<s:text name="motor.back" />
										</button>
					<!--<s:submit name="Submit" type="submit" cssClass="btn btn-sm btn-danger" value="Back"  onclick="update('showSummarryMotor.action')"/>-->
				</s:else>
			</s:elseif>
			<s:elseif test='%{#session.product_id=="30"}'>
				<s:if test='%{validCoverage!=null && !"".equals(validCoverage)}'>
				<button type="submit" name="Submit"  class="btn btn-sm btn-danger" onclick="update('tabRenderHome.action')"/>
											<s:text name="motor.back" />
										</button>
					<!--<s:submit name="Submit" type="submit" cssClass="btn btn-sm btn-danger" value="Back"  onclick="update('tabRenderHome.action')"/>-->
				</s:if>
				<s:else>
				<button type="submit" name="Submit"  class="btn btn-sm btn-danger" onclick="update('showQuoteHome.action')"/> 
											<s:text name="motor.back" />
										</button>
					<!--<s:submit name="Submit" type="submit" cssClass="btn btn-sm btn-danger" value="Back"  onclick="update('showQuoteHome.action')"/>-->
				</s:else>
			</s:elseif>
			<s:else>
			<button type="submit" name="Submit"  class="btn btn-sm btn-danger" onclick="update('inetPremium.action')"/> &nbsp;&nbsp;&nbsp;
											<s:text name="motor.back" />
										</button>
				<!--<s:submit name="Submit" type="submit" cssClass="btn btn-sm btn-danger" value="Back"  onclick="update('initPremium.action')"/> &nbsp;&nbsp;&nbsp;-->
			</s:else>  
		</s:if>
		<s:if test='#session.b2c == "b2c" || #session.LoginType=="B2C"'>
		<button type="submit" name="Submit" class="btn btn-sm btn-success" onclick="getHome();">
											<s:text name="motor.proceed" />
										</button>
			<!--<s:submit name="Submit" type="submit" cssClass="btn btn-sm btn-success" value="Proceed"  onclick="getHome()"/>-->
		</s:if>
		<s:else>
		 
			<s:if test='%{"65".equalsIgnoreCase(#session.product_id) && POLICY_NO != null && POLICY_NO != ""}'>
				<button type="button" name="Submit" class="btn btn-sm btn-success"  onclick="return validateFeedback();"/>
												<s:text name="motor.proceed" />
											</button>
			</s:if>
			<s:else>
				<button type="submit" name="Submit" class="btn btn-sm btn-success" onclick="simSubmit()"/>
												<s:text name="motor.proceed" />
											</button>
			</s:else>
		
			<!--<s:submit name="Submit" type="submit" cssClass="btn btn-sm btn-success" value="Proceed"  onclick=""/>-->
		</s:else>
	</div>
</div>
<s:hidden name="loginId" value="%{LOGIN_ID}"/> 
</s:iterator>
<s:hidden name="applicationNo"/> 
<s:hidden name="quoteNo"/> 
<s:hidden name="policyNo"/> 
<s:hidden name="custName"/> 
<s:hidden name="refNo"/>  
<s:hidden name="referenceNo"/> 
<s:hidden name="openCoverNo"/>
<s:hidden name="quoteStatus" />
<s:hidden name="endTypeId" />
<s:hidden name="brokerCompany"/>
<s:hidden name="searchFrom" />
<s:hidden name="searchBy" />
<s:hidden name="searchValue" />
<s:hidden name="referralMsg"/>
<s:hidden name="menuFrom" value="%{quoteStatus}"/>
<s:hidden name="vehicleId"/>
<s:token/>
</s:form>
	
	
</body>
<script type="text/javascript">
function update(actionPath) { 
	document.policyInfo.action = actionPath;
	document.policyInfo.submit();
	return false;
}
function getHome() {
	document.policyInfo.action ='<%=request.getContextPath()%>/login/ProductSelection.jsp'
	document.policyInfo.submit();
	return false;
}
function getPopup(URL) {
	var bwidth = window.innerWidth;
	var bwidth1 = document.body.clientWidth;
	if(bwidth <= 768) {
		return popUp(URL,bwidth1,'500');
	} else {
		return popUp(URL,'750','500');
	}
}	
function getReceiptPdf(val) {
	var URL ='<%=request.getContextPath()%>/receiptReport.action?quoteNo='+val;
	var bwidth = window.innerWidth;
	var bwidth1 = document.body.clientWidth;
	if(bwidth <= 768) {
		return popUp(URL,bwidth1,'500');
	} else {
		return popUp(URL,'750','500');
	}
}
function getFleetPdf(quoteNo, vehicleId) {
	var URL ='<%=request.getContextPath()%>/motorFleetScheduleReport.action?quoteNo='+quoteNo+'&vehicleId='+vehicleId;
	var bwidth = window.innerWidth;
	var bwidth1 = document.body.clientWidth;
	if(bwidth <= 768) {
		return popUp(URL,bwidth1,'500');
	} else {
		return popUp(URL,'750','500');
	}
}
function getBailBondPdf(val,vehicleId) {
	var URL ='<%=request.getContextPath()%>/bailBondReport.action?quoteNo='+val+'&vehicleId='+vehicleId;
	var bwidth = window.innerWidth;
	var bwidth1 = document.body.clientWidth;
	if(bwidth <= 768) {
		return popUp(URL,bwidth1,'500');
	} else {
		return popUp(URL,'750','500');
	}
}
function getPolicyWordingPdf(val){
	var URL ='<%=request.getContextPath()%>/policyWordingReport.action?quoteNo='+val;
	var bwidth = window.innerWidth;
	var bwidth1 = document.body.clientWidth;
	if(bwidth <= 768) {
		return popUp(URL,bwidth1,'500');
	} else {
		return popUp(URL,'750','500');
	}
}

function getMotorProposalPdf(val) {
	var URL ='<%=request.getContextPath()%>/proposalFormReport.action?quoteNo='+val;
	var bwidth = window.innerWidth;
	var bwidth1 = document.body.clientWidth;
	if(bwidth <= 768) {
		return popUp(URL,bwidth1,'500');
	} else {
		return popUp(URL,'750','500');
	}
}
toggleFeedback('Y');
function toggleFeedback(val){
	var svalue=document.policyInfo.feedbackyn.value;
	if(val=='Y'){

		document.getElementById("feedQuestion1E").disabled = false;
		document.getElementById("feedQuestion1A").disabled = false;
		document.getElementById("feedQuestion1P").disabled = false;
		document.getElementById("feedQuestion2Y").disabled = false;
		document.getElementById("feedQuestion2N").disabled = false;
		document.getElementById("feedQuestion3").disabled = false;
		document.getElementById("feedQuestion3").value = '';
	}else{
		document.getElementById("feedQuestion1E").disabled = true;
		document.getElementById("feedQuestion1A").disabled = true;
		document.getElementById("feedQuestion1P").disabled = true;
		document.getElementById("feedQuestion2Y").disabled = true;
		document.getElementById("feedQuestion2N").disabled = true;
		document.getElementById("feedQuestion3").disabled = true;
		
		}
}
function validateFeedback(){
	var value=document.policyInfo.feedbackyn.value;
	if(value=='Y'){
		if(document.policyInfo.feedQuestion1.value=='' || document.policyInfo.feedQuestion2.value==''){
		<s:if test='%{"ar".equals(#session.isArabic)}'>
			alert('يرجى تعبئة نموذج الإستبيان')
		</s:if>
		<s:else>
			alert('Please Fill Feedback form')
		</s:else>
			return false;	
		}	
	}
	if(value=='Y')
		$("#smallModal").modal();
	else{
		document.policyInfo.submit();
		}
	return true;
}
function simSubmit(){
	document.policyInfo.submit();
}
</script>
</html>