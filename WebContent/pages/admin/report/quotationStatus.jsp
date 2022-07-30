<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<style type="text/css">
	#myDIV {
	    overflow-x:scroll;
	    margin: auto:
	}
           }
</style>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/tcal.js"></script>
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.tableTools.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.jqueryui.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/cssbootstrap/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/footable-0.1.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap-datetimepicker.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.responsive.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.jqueryui.css"/>
<link href="<%=request.getContextPath()%>/dataTables/css/jquery-start-ui.css" rel="stylesheet" type="text/css" />
<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap-datetimepicker.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.responsive.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.tableTools.js"></script>
	
<script type="text/javascript">
		jQuery(function ($) {
			try {
				var data = $('#gridTableMake').dataTable( {
					"lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
					"order": [[ 0, "asc" ]],
					"columnDefs": [ {
			          "targets": 'no-sort',
			          "orderable": false
				    } ],
					responsive: true
				});
			} catch(err){}
		} );
	 </script>
</head>
<body>
<s:form name="form1" theme="simple">
	<div class="container-fluid">
		<div class="row">
			<div class="col-xs-12">
			<s:if test="mode != 'viewlist' ">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<s:text name="Quotation Status"/>
					</div>				
					<div class="panel-body">
						<s:if test="hasActionErrors()">
						<div class="row">
							<font color="red"><s:actionerror cssStyle="list-style: none;"/></font>
						</div>
						<br class="clear" />
						</s:if>
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-4 col-lg-3">
								<div class="form-group">
   									<label><s:text name="label.startDate"/></label>
									<s:textfield name="startDate" id="startDate1" cssClass="form-control datepicker" readonly="true" />
								</div>
							</div>
							<div class="col-xs-12 col-sm-12 col-md-4 col-lg-3">
								<div class="form-group">
   									<label><s:text name="label.endDate" /></label>
									<s:textfield name="endDate" id="endDate1" cssClass="form-control datepicker" readonly="true" />
								</div>
							</div>
							<s:if test='!"policyStatus".equalsIgnoreCase(reqFrom) && !"ccpStatus".equalsIgnoreCase(reqFrom)'>
								<div class="col-xs-12 col-sm-12 col-md-4 col-lg-3">
									<div class="form-group">
	   									<label><s:text name="label.paymentType"/></label>
										<s:select headerKey="all" cssClass="form-control" headerValue="All Payment" list="motorPaymentTypeList" name="paymentType" value="paymentType" listKey="item_desc" listValue="item_value" />
									</div>
								</div>
							</s:if>
							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-3" align="center">
								<br/>
								<input type="button" onclick="fnSubmit();" class="btn btn-sm btn-success" value="Submit" />
							</div>
						</div>
					</div>
				</div>
				<br class="clear"/>
				<s:if test="mode == 'list'">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<s:text name="Motor Payment Detail"/>
					</div>				
					<div class="panel-body">
						<table class="display responsive no-wrap" id="gridTableMake" width="100%" cellspacing="0">
							<thead>
							<tr>
								<th><s:text name="label.master.sno"/></th>
								<th><s:text name="label.quoteno"/></th>
								<th><s:text name="label.policyNo"/></th>					
								<th><s:text name="label.customerName"/></th>		
								<th><s:text name="label.paymentType"/></th>
								<th><s:text name="label.status"/></th>
								<th></th>
							</tr>
							</thead>
							<tbody>
								<s:iterator value="motorPaymentList" var="list" status="stat">
									<tr>
										<td><s:property value="#stat.count"/></td>
										<td><s:property value="#list.QUOTE_NO"/></td>
										<td><s:property value="#list.POLICY_No" /></td>
										<td><s:property value="#list.CUSTOMER_NAME"/></td>
										<td><s:property value="#list.PAYMENT_TYPE" /></td>
										<td><s:property value="#list.RESPONSE_MESSAGE"/></td>
										<td align="center" ><input type="button" onclick="fnView('<s:property value="#list.QUOTE_NO"/>','<s:property value="#list.MERCHANT_REFERENCE"/>');" class="btn btn-sm btn-success" value="View" align="middle" /></td>
									</tr>
								</s:iterator>
							</tbody>
						</table>
						<s:if test="reqFrom != 'ccpStatus'">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
							<div class="" >
								<br/>
						    	<input type="button" onclick="fnReport('S');" class="btn btn-warning btn-sm" value="Excel" align="middle"/>
							</div>
						</div>
						</s:if>
						<s:else>
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
							<div class="" >
								<br/>
						    	<input type="button" onclick="fnReport('F');" class="btn btn-warning btn-sm" value="Excel" align="middle"/>
							</div>
						</div>
						</s:else>
					</div>
				</div>
				</s:if>
				</s:if>
				<s:if test="mode == 'viewlist' ">
				<div class="panel panel-primary" >
				<div class="panel-heading">
					<s:text name="label.payment.status"/>
				</div><br class="clear"/>
					<div class="container-fluid">
					<s:if test="hasActionErrors()">
						<font color="red"><s:actionerror cssStyle="list-style: none;"/></font>
					</s:if>
							<div class="row">
							     <div class="col-xs-12">
									<div class="panel panel-primary">
										<div class="panel-heading">
											<s:text name="label.customer"/>
											<div class="pullRight">
														<label><s:text name="label.quoteno" />&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</label><s:property value="quoteNo" /><s:hidden name="quoteNo"></s:hidden>
											</div>
										</div>
										<div class="panel-body">
							        		<div class="row">
							        				<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="">
					    									<label><s:text name="label.first.name"/>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</label><s:property value="firstName" />
														</div>
													</div>
													<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="">
					    									<label><s:text name="label.last.name"/>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</label><s:property value="lastName" />
														</div>
													</div>
													<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="">
					    									<label><s:text name="label.add1"/>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</label><s:property value="add1" />
														</div>
													</div>
													<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="">
					    									<label><s:text name="label.add2"/>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</label><s:property value="add2" />
														</div>
													</div>
													<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="">
					    									<label><s:text name="label.pobox"/>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</label><s:property value="poBox" />
														</div>
													</div>
													<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="">
					    									<label><s:text name="label.mobile"/>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</label><s:property value="mobileNo" />
														</div>
													</div>
													<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="">
					    									<label><s:text name="label.mail"/>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</label><s:property value="eMailId" />
														</div>
													</div>
							        				</div>
							        		</div>
							        		</div>
							        		<div class="panel panel-primary">
							        		<div class="panel-heading">
												<s:text name="label.premium.detail"/>
											</div>
											<div class="panel-body">
							        		<div class="row">
							        				<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="">
					    									<label><s:text name="label.policyNo"/>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</label><s:property value="policyNo" />
														</div>
													</div>
							        				<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="">
					    									<label><s:text name="label.startDate"/>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</label><s:property value="fromDate" />
														</div>
													</div>
													<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="">
					    									<label><s:text name="label.endDate"/>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</label><s:property value="toDate" />
														</div>
													</div>
													<!--<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="">
					    									<label><s:text name="label.quoteno"/>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</label><s:property value="quoteNo" />
														</div>
													</div>
													-->
													<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="">
					    									<label><s:text name="label.premium"/>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</label><s:property value="premium" />
														</div>
													</div>
													<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="">
					    									<label><s:text name="label.vat"/>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</label><s:property value="adminFee" />
														</div>
													</div>
													<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="">
					    									<label><s:text name="Vat 5%"/>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</label><s:property value="vat" />
														</div>
													</div>
													<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="">
					    									<label><s:text name="label.total.premium"/>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</label><s:property value="totalPremium" />
														</div>
													</div>
							        				</div>
							        			</div>
							        		</div>
							        		<s:if test='"policyStatus".equalsIgnoreCase(reqFrom) || "ccpStatus".equalsIgnoreCase(reqFrom)'>
							        		<div class="panel panel-primary">
							        			<div class="panel-heading">
													<s:text name="label.payment.detail"/>
											</div>
												<div class="panel-body">
							        			<div class="row">
							        					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="overflow-x: scroll; width:100%;">
							        					<table class="footable" style="overflow-x: scroll; width:100%;">
																<thead>
																<tr>
																	<th class="tableColWidth"><s:text name="label.master.sno"/></th>
																	<th class="tableColNoWrap"><s:text name="label.reqtime"/></th>
																	<th class="tableColNoWrap"><s:text name="label.req.tran"/></th>
																	<th class="tableColNoWrap"><s:text name="label.restime"/></th>					
																	<th class="tableColWidth"><s:text name="label.res.tran"/></th>		
																	<th class="tableColWidth"><s:text name="label.res.status"/></th>
																	<th><s:text name="label.res.msge"/></th>
																	<th class="tableColWidth"><s:text name="label.masked.card"/></th>
																	<!-- <th class="tableColWidth"><s:text name="label.res.code"/></th>
																	<th class="tableColWidth"><s:text name="label.res.msge"/></th>
																	<th class="tableColWidth"><s:text name="label.res.deci"/></th> -->
																</tr>
																</thead>
																<tbody>
																	<s:iterator value="creditPaymentList" var="list" status="stat">
																		<tr>
																			<td><s:property value="#stat.count"/></td>
																			<td class="tableColNoWrap"><s:property value="#list.REQUEST_TIME"/></td>
																			<td ><s:property value="#list.MERCHANT_REFERENCE"/></td>
																			<td class="tableColNoWrap"><s:property value="#list.RESPONSE_TIME" /></td>
																			<td><s:property value="#list.RESPONSE_TRAN_NO"/></td>
																			<td><s:property value="#list.RESPONSE_STATUS" /></td>
																			<td><s:property value="#list.RESPONSE_MESSAGE"/></td>
																			<td><s:property value="#list.CARD_NUMBER_MASKED"/></td>
																			<!--<td class="tableColWidthLarge"><s:property value="#list.RES_DESCRIPTION" /></td>
																			<td class="tableColNoWrap"><s:property value="#list.RES_MESSAGE"/></td>
																			<td><s:property value="#list.RES_DECISION" /></td>-->
																		</tr>
																	</s:iterator>
																</tbody>
															</table>
							        					</div>
							        				</div>
							        			</div>
							        		</div>
							        		</s:if>
							        		<div class="panel panel-primary">
							        		<div class="panel-heading">
											<s:text name="label.payment"/>
													<div class="pullRight">
														<label><s:text name="label.paymentType" />&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</label><s:property value="paymentMode" />
													</div>
											<br class="clear" />
											</div>
											<div class="panel-body">
											<s:if test='paymentMode == "Cheque" || "Cheque".equalsIgnoreCase(paymentMode)'>
							        		<div class="row">
							        				<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="">
					    									<label><s:text name="label.cheque.no"/>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</label><s:property value="chequeNo" />
														</div>
													</div>
													<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="">
					    									<label><s:text name="label.cheque.date"/>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</label><s:property value="chequeDate" />
														</div>
													</div>
													<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="">
					    									<label><s:text name="label.cheque.amount"/>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</label><s:property value="chequeAmount" />
														</div>
													</div>
													<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="">
					    									<label><s:text name="label.bank.name"/>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</label><s:property value="bankName" />
														</div>
													</div>
													<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="">
					    									<label><s:text name="label.bank.micr"/>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</label><s:property value="micr" />
														</div>
													</div>
												</div>
												</s:if>
												<s:if test='paymentMode == "Cash" || "Cash".equalsIgnoreCase(paymentMode)'>
							        		<div class="row">
							        				<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="">
					    									<label><s:text name="label.challan.no"/>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</label><s:property value="chequeNo" />
														</div>
													</div>
													<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="">
					    									<label><s:text name="label.deposit.date"/>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</label><s:property value="chequeDate" />
														</div>
													</div>
													<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="">
					    									<label><s:text name="label.amount"/>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</label><s:property value="chequeAmount" />
														</div>
													</div>
													<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="">
					    									<label><s:text name="label.bank.name"/>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</label><s:property value="bankName" />
														</div>
													</div>
													<!--<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="">
					    									<label><s:text name="label.bank.micr"/>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</label><s:property value="micr" />
														</div>
													</div>
												--></div>
												</s:if>
												<s:if test='paymentMode !="Cheque" && paymentMode !="Cash" && !"Cheque".equalsIgnoreCase(paymentMode) && !"Cash".equalsIgnoreCase(paymentMode)'>
												<div class="row">
													<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="">
					    									<label><s:text name="label.reqtime"/>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</label><s:property value="reqTime" />
														</div>
													</div>
													<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="">
					    									<label><s:text name="label.restime"/>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</label><s:property value="resTime" />
														</div>
													</div>
													<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="">
					    									<label><s:text name="label.res.tran"/>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</label><s:property value="resTranNo" />
														</div>
													</div>
													<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="">
					    									<label><s:text name="label.req.tran"/>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</label><s:property value="reqTranNo" />
														</div>
													</div>
													<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="">
					    									<label><s:text name="label.res.status"/>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</label><s:property value="resStatus" />
														</div>
													</div>
													<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="">
					    									<label><s:text name="label.res.msge"/>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</label><s:property value="resMsge" />
														</div>
													</div>
													<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="">
					    									<label><s:text name="Response Amount"/>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</label><s:property value="payeeAmount" />
														</div>
													</div>
													<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="">
					    									<label><s:text name="label.res.code"/>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</label><s:property value="resCode" />
														</div>
													</div>
													<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="">
					    									<label><s:text name="label.masked.card"/>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</label><s:property value="maskedCard" />
														</div>
													</div>
							        				</div>
							        			</s:if>
							        			<%--<s:if test='reqFrom == "ccpStatus" || "ccpStatus".equalsIgnoreCase(reqFrom)'>
							        				<div class="panel-body">
									        			<div class="row">
															<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																<div class="form-group">
							    									<label><s:text name="label.reqtime"/></label>
																	<s:textfield name="reqTime" id="reqTime"  cssClass="form-control" maxlength="20" readonly="true" />
																</div>
															</div>
															<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																<div class="form-group">
							    									<label><s:text name="label.req.tran"/></label>
																	<s:textfield name="reqTranNo" id="reqTranNo"  cssClass="form-control" maxlength="20" readonly="true" />
																</div>
															</div>
															<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																<div class="form-group">
							    									<label><s:text name="label.masked.card"/></label><font color="red">*</font>
																	<s:textfield name="maskedCard" id="maskedCard"  cssClass="form-control" maxlength="20" readonly="true" />
																</div>
															</div>
															<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
															<div class="form-group">
																	<label><s:text name="label.restime"/></label><font color="red">*</font>
																	<s:textfield name="resTime" id="resTime"  cssClass="form-control form_datetime"  maxlength="20" readonly="true" />
																    <!--<input size="16" type="text" value="" class="form_datetime" id="form_datetime"></input>
																--></div>
															</div>
															<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																<div class="form-group">
							    									<label><s:text name="label.res.tran"/></label><font color="red">*</font>
																	<s:textfield name="resTranNo" id="resTranNo"  cssClass="form-control" maxlength="20"  readonly="true" />
																</div>
															</div>
															 <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																<div class="form-group">
							    									<label><s:text name="label.res.bill.tran"/></label><font color="red">*</font>
																	<s:textfield name="resBillTranNo" id="resBillTranNo"  cssClass="form-control" maxlength="20" />
																</div>
															</div> 
															 <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																<div class="form-group">
							    									<label><s:text name="label.res.deci"/></label><font color="red">*</font>
																	<s:select cssStyle="width:100%;" name="resDeci" id="resDeci" cssClass="form-control" headerKey="" headerValue="--Select--" list="resDecisionList" listKey="ITEM_VALUE" listValue="ITEM_VALUE" onchange="getAjaxResCode(this.value,'resCodeAjaxList');" theme="simple"/>
																</div>
															</div>
															<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																<div class="form-group">
							    									<label><s:text name="label.res.code"/></label><font color="red">*</font>
							    										<s:select list="#{}" id="resCodeAjaxList" cssStyle="width:100%;" name="resCode" cssClass="form-control"  headerKey="" headerValue="---Select---" />
																</div>
															</div>  
															<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																<div class="form-group">
							    									<label><s:text name="label.res.status"/></label><font color="red">*</font>
																	<s:textfield name="resStatus" id="resStatus"  cssClass="form-control"  maxlength="20" readonly="true" />
																</div>
															</div>
															<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																<div class="form-group">
							    									<label><s:text name="label.res.msge"/></label><font color="red">*</font>
																	<s:textfield name="resMsge" id="resMsge"  cssClass="form-control" maxlength="20" readonly="true" />
																</div>
															</div>
									        			</div>
							        				</div>
							        			</s:if>--%>
							        		</div>
							        	</div>
							        	<s:if test='!"policyStatus".equalsIgnoreCase(reqFrom) && !"ccpStatus".equalsIgnoreCase(reqFrom)'>
						        			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
												<div class="" >
													<br/>
					    							<input type="button" onclick="fnSubmit();" class="btn btn-sm btn-danger" value="Back" align="middle" />
												</div>
						        		    </div>
						        			</s:if>
						        			<s:if test='"policyStatus".equalsIgnoreCase(reqFrom) || "ccpStatus".equalsIgnoreCase(reqFrom)'>
						        			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
												<div class="" >
					    							<%--<input type="button" onclick="fnUpdate();" class="btn btn-sm btn-success" value="Submit" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
					    							<input type="button" onclick="fnBack();" class="btn btn-sm btn-danger" value="Back" align="middle" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					    							<input type="button" onclick="fncheckstatus();" class="btn btn-sm btn-warning" value="Check status" align="middle" />
					    							<s:if test='"ccpStatus".equalsIgnoreCase(reqFrom)'>
					    								<input type="button" onclick="fnpolicygen();" class="btn btn-sm btn-info" value="Policy Generation" align="middle" />
					    							</s:if>
												</div>
						        		    </div>
						        		  </s:if>
							        </div>
							         <br class="clear"/>
							     </div>
							</div>
								<s:hidden name="paymentType" />       
								<%--<s:hidden name="productId" /> --%>
								<s:hidden name="startDate"  />
								<s:hidden name="endDate"  />
							</div>
						</s:if>
			</div>
		</div>
	</div>
	<s:hidden name="reqFrom"/>
</s:form>	
<script type="text/Javascript" >
function fnSubmit(){
	    document.form1.action='getMotorPaymentStatus.action?mode=list';
	    document.form1.submit();
}
function fnClick(val){
		document.form1.action='getMotorPaymentStatus.action?policyType='+val+'&mode=showlist';
	    document.form1.submit();
}
function fnView(val,val2){
		document.form1.action='getMotorViewPaymentStatus.action?quoteNo='+val+'&reqTranNo='+val2;
	    document.form1.submit();
}
function fnBack(){
		document.form1.action='getMotorPaymentStatus.action?mode=list';
	    document.form1.submit();
}
function fnReport(val){
		//document.form1.action='reportReportAM.action';
		document.form1.action='paymentReportPaymentStatus.action?msgStatus='+val;
	    document.form1.submit();
}

function fncheckstatus(){
	document.form1.action='checkstatusPaymentStatus.action';
    document.form1.submit();
}

function fnpolicygen(){
	var answer = confirm("Do you Confirm to Generate Policy..?");
	if (answer) {
		document.form1.action='policyGenPaymentStatus.action';
	    document.form1.submit();
	}
	
}
/*function fnUpdate(){
	    document.form1.action='ccpUpdatePaymentStatus.action';
	    document.form1.submit();
}*/

/*getAjaxResCode('<s:property value="resDeci"/>','resCodeAjaxList');
	function getAjaxResCode(val,id){
		var action='';
		if(id=='resCodeAjaxList'){
			action=	'?resDeci='+val+'&resCode=<s:property value="resCode"/>';
		}
		postRequest('<%=request.getContextPath()%>/ajaxGetResCodePaymentStatus.action'+action+'&reqFrom1='+id, id);
	}*/
</script>
</body>
</html>