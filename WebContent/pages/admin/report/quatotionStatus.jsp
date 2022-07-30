<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<style type="text/css">
		#myDIV {
		    overflow-x:scroll;
		    margin: auto:
		}
	</style>
	<script type="text/javascript" src="js/common.js"></script>
	<script type="text/javascript" src="js/tcal.js"></script>
	<link href="css/styles.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/cssbootstrap/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/footable-0.1.css"/>
	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.responsive.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.jqueryui.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.tableTools.css">
	<link href="<%=request.getContextPath()%>/dataTables/css/jquery-start-ui.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.jqueryui.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.responsive.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.tableTools.js"></script>
	<script type="text/javascript">
			jQuery(function ($) {
				try {
					var data = $('#gridTable').dataTable( {
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
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0"> 
			<s:form name="form1" theme="simple">
			<tr>
		    	<td height="5">
		    	<b id="val1" style="color:red"></b><br/>
				<b id="val" style="color:red"></b> <br/></td>
		  	</tr>
		  	<tr>
		    	<td>
		    	<s:if test="mode != 'viewlist' ">
		    	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#E5E5E5" >
		      		<s:if test="hasActionErrors()">
						<font color="red"><s:actionerror cssStyle="list-style: none;"/></font>
					</s:if>
		      		<tr>
		        		<td bgcolor="#FFFFFF" style="padding:10px; background:#F8F8F8">
								<br /><br />
							 		<table width="100%" align="center">
								 		<tr>
								        	<td>
								        	<table width="100%">
								        	<tr>
								            <td bgcolor="#FFFFFF" class="heading" width="100%" >Quotation Status</td>
								       		 </tr>
									        	<tr>
									        		<td>&nbsp;</td>
									        	</tr>
									        	<tr>
									        		<td>
									        		<div class="row">
									        				<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2">
																<div class="">
							    									<label><s:text name="label.startDate"/><font color="red">*</font></label><s:textfield name="startDate" id="startDate1" cssClass="inputBox datepicker" readonly="true"></s:textfield>
																</div>
															</div>
															<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2">
																<div class="">
							    									<label><s:text name="label.endDate" /><font color="red">*</font></label> <s:textfield name="endDate" id="endDate1" cssClass="inputBox datepicker" readonly="true" ></s:textfield>
																</div>
															</div>
															<div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
																<div class="">
							    									<label><s:text name="label.product" /><font color="red">*</font></label> 
							    										<s:select headerKey="" headerValue="<-- Select Product -->" list="motorProductList" name="productId" value="productId" listKey="PRODUCT_ID" listValue="PRODUCT_NAME" ></s:select>
																</div>
															</div>
															<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2">
																<div class="">
							    									<label><s:text name="label.paymentType" /><font color="red">*</font></label> 
							    									<s:select headerKey="all" headerValue="All Payment" list="motorPaymentTypeList" name="paymentType" value="paymentType" listKey="DETAIL_NAME" listValue="REMARKS" ></s:select>
																</div>
															</div>
															<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2">
																<div class="">
																	<br/>
							    									<input type="button" onclick="fnSubmit();" class="btn btn-sm btn-success" value="Submit" align="left" />
																</div>
															</div>
															
									        			</div>
									        			</td>
										        </tr>
								        	</table>
								        	</td>
							        	</tr>
							      	</table>
							      	<br/>
							      	<br/>
							      	<s:if test="mode == 'list'">
							      	<tr>
								        <td bgcolor="#FFFFFF" class="heading" width="100%" >Motor Payment Detail</td>
								    </tr>
									<table class="footable" id="gridTable">
									<thead style="background: #F8F8F8;">
									<tr>
										<th><s:text name="label.master.sno"/></th>
										<th><s:text name="label.quoteno"/></th>
										<th><s:text name="label.policyNo"/></th>					
										<th><s:text name="label.customerName"/></th>		
										<th><s:text name="label.paymentType"/></th>
										<th><s:text name="label.status"/></th>
										<th><s:text name="label.verfication.status"/></th>
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
												<td><s:property value="#list.STATUS"/></td>
												<td align="center" ><input type="button" onclick="fnView('<s:property value="#list.QUOTE_NO"/>','<s:property value="#list.MERCHANT_REFERENCE"/>');" class="btn btn-sm btn-success" value="View" align="middle" /></td>
											</tr>
										</s:iterator>
									</tbody>
								</table>
							</s:if>
							</td>
							</tr>
						</table>
						</s:if>
						<s:if test="mode == 'viewlist' ">
							<div class="">
									<div class="row">
									     <div class="col-xs-12">
											<div class="panel panel-primary">
												<div class="panel-heading">
													<s:text name="label.customer"/>
													<div class="pullRight">
																<label><s:text name="label.quoteno" />&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</label><s:property value="quoteNo" />
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
							    									<label><s:text name="label.vat"/>&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</label><s:property value="vat" />
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
									        			<div class="panel panel-primary">
									        		<div class="panel-heading">
													<s:text name="label.payment"/>
													<div class="pullRight">
																<label><s:text name="label.paymentType" />&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;</label><s:property value="paymentMode" />
													</div>
													<br class="clear" />
													</div>
													<div class="panel-body">
													<s:if test="paymentMode == 'cheque'">
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
														<s:if test="paymentMode =='net'">
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
									        			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
															<div class="" >
																<br/>
								    							<input type="button" onclick="fnSubmit();" class="btn btn-sm btn-success" value="Back" align="middle" />
															</div>
									        		    </div>
													</div>
									        	</div>
									        </div>
									     </div>
									</div>
										<s:hidden name="paymentType" />       
										<s:hidden name="productId" />
										<s:hidden name="startDate"  />
										<s:hidden name="endDate"  />
				      				</s:if>
								</td>
							</tr>
						</s:form>
					</table>
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
		document.form1.action='getMotorViewPaymentStatus.action?quoteNo='+val+'&reqTranNo='+val2+'&mode=viewlist';
	    document.form1.submit();

}
function fnBack(){
		document.form1.action='getMotorPaymentStatus.action?mode=list';
	    document.form1.submit();
}
</script>
</body>
</html>