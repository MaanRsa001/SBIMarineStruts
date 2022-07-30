<%@ page isELIgnored="false" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>
<!DOCTYPE HTML>
<html>
<head>
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
			var data1 = $('#record').dataTable( {
				"lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
				"order": [[ 1, "asc" ]],
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
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div id="horizontalTab">
			<ul class="resp-tabs-list">
				<li><s:text name="label.cover.newquote" /></li>
				<li><s:text name="Registered Quotes" /></li>
				<li><s:text name="Portfolio" /></li>
			</ul>
			<div class="resp-tabs-container">					
				<div id="1">
					<div id="neqQuote">
						<s:form id="quoteEdit" name="quoteEdit" method="post" action="" theme="simple">
							<s:if test="'successNew'.equals(display)">
								<div class="row">
									<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
										<div class="panel panel-primary">
											<div class="panel-body">
												<span class="label label-success"><s:label key="quote.new.success"/></span>
											</div>
										</div>
									</div>
								</div>
								<br class="clear" />
								<div class="row">
									<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
										<input type="button" onclick="fnsubmit('back')" name="back" class="btn btn-sm btn-danger" value="Back" />
									</div>
								</div>
							</s:if>
							<s:elseif test="'successUpdate'.equals(display)">
								<div class="row">
									<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
										<div class="panel panel-primary">
											<div class="panel-body">
												<span class="label label-success"><s:label key="quote.update.success"/></span>
											</div>
										</div>
									</div>
								</div>
								<br class="clear" />
								<div class="row">
									<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
										<input type="button" onclick="fnsubmit('back')" name="back" class="btn btn-sm btn-danger" value="Back" />
									</div>
								</div>
							</s:elseif>
							<s:else>
								<div class="row">
									<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">										
										<div class="panel panel-primary">
											<div class="panel-heading">
												<s:text name="New Quote" />
											</div>
											<div class="panel-body">
												<s:if test='!("newAjax".equals(mode1) || "editAjax".equals(mode1))'>
												<div class="row">
													<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
														<s:actionerror cssStyle="color: red;" />
														<s:actionmessage cssStyle="color: green;" />
													</div>
												</div>												
												</s:if>
												<div class="row">
													<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
														<div class="panel panel-primary">
															<div class="panel-heading"> <s:text name="label.quote.new.opencover" /> </div>
															<div class="panel-body">
																<div class="row">
																	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																		<div class="text"><s:label key="label.quote.businesstype" /> <font color="red">*</font></div>
																		<div class="tbox">
																			<s:select name="business" id="business" list="businessTypeList" listKey="REMARKS" listValue="DETAIL_NAME"  headerKey="" headerValue="---Select---" cssClass="inputBoxS"/>
																		</div>
																	</div>
																	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																		<div class="text"><s:label key="label.quote.broker" /> <font color="red">*</font></div>
																		<div class="tbox">
																			<s:select name="broker" list="brokerList" headerKey="" headerValue="-Select-" listKey="login_id" listValue="COMPANY_NAME" cssClass="inputBoxS"/>
																		</div>
																	</div>
																	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																		<div class="text"><s:label key="label.quote.octype" /> <font color="red">*</font></div>
																		<div class="tbox"><s:radio name="octype" id="octype"  cssClass="input" list="#{'One Stop':'Marine OpenCover','Standard':'Standard OpenCover'}" onchange="fnOCType(this.value)" /></div>
																	</div>
																	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																		<div class="text"><s:label key="label.quote.customer" /> <font color="red">*</font><br/></div>
																		<div class="tbox">
																			<s:textfield name="customer"  id="customer" cssClass="input" readonly="true"/>
						                        							<input type="button" value="..." onclick="return popUp('<%=request.getContextPath()%>/customerPopupOC.action','600','500')" class="btn"/>
						                        							<s:hidden name="customerName"/>
																		</div>
																	</div>
																	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																		<div class="text"><s:label key="label.quote.startdate" /><font color="red">*</font></div>
																		<div class="tbox"><s:textfield name="startdate" id="startdate" cssClass="inputBox datepicker"/></div>
																	</div>
																	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4" id="ocend" style="display:<s:if test='"One Stop".equals(octype)'></s:if><s:else>none</s:else>">
																		<div class="text"><s:label key="label.quote.enddate" /> <font color="red">*</font></div>
																		<div class="tbox"><s:textfield name="enddate" id="enddate" cssClass="inputBox datepicker"/></div>
																	</div>
																</div>
															</div>
														</div>
														<div class="panel panel-primary">
															<div class="panel-heading"> <s:text name="label.quote.additionalinfo" /> </div>
															<div class="panel-body">
																<div class="row">
																	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																		<div class="text"><s:label key="label.quote.annual.turnover" /><font color="red">*</font></div>
																		<div class="tbox"><s:textfield name="turnover" cssClass="inputBox"/></div>
																	</div>
																	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																		<div class="text"><s:label key="label.quote.currency" /> <font color="red">*</font></div>																		
																		<div class="tbox">
																			<div class="row">
																				<div class="col-xs-6">
																					<s:select name="currency" list="currecyList" listKey="CURRENCY_ID" listValue="CURRENCY_NAME" headerKey="" headerValue="-select-" cssClass="inputBoxS"/>
																				</div>
																				<div class="col-xs-6">
																					<s:textfield name="currencyVal" cssClass="inputBox" />
																				</div>
																			</div>
																		</div>
																	</div>
																	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																		<div class="text"><s:label key="label.quote.free.text" /></div>
																		<div class="tbox"><s:radio name="freetext" list="#{'Y':'Yes','N':'No'}" cssClass="input2"/></div>
																	</div>
																	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																		<div class="text"><s:label key="label.quote.commission" /> <font color="red">*</font></div>
																		<div class="tbox"><s:textfield name="commission" cssClass="inputBox"/></div>
																	</div>
																	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																		<div class="text"><s:label key="label.quote.crossvoyage" /></div>
																		<div class="tbox"><s:radio name="crossvoyage" list="#{'Y':'Yes','N':'No'}" cssClass="input2" onchange="fncross_percent(this.value)"/></div>
																	</div>
																	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4" id="cross_percent" style="display:<s:if test='"Y".equals(crossvoyage)'></s:if><s:else>none</s:else>">
																		<div class="text"><s:label key="label.quote.crossvoyage.percentage" /></div>
																		<div class="tbox"><s:textfield name="crosspercent"  id="crosspercent" cssClass="inputBox"/></div>
																	</div>
																	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																		<div class="text"><s:label key="label.quote.exist.cims" /></div>
																		<div class="tbox">
																			<div class="row">
																				<div class="col-xs-6">
																					<s:textfield name="cimsNo" cssClass="input"/>
																				</div>
																				<div class="col-xs-6">
																					<s:textfield name="cimsNo1" cssClass="inputBox"/>
																				</div>
																			</div>																			
																		</div>
																	</div>
																	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																		<div class="text"><s:label key="label.quote.minpremium" /><font color="red">*</font></div>
																		<div class="tbox"><s:textfield name="minpremium" cssClass="inputBox" /></div>
																	</div>
																	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																		<div class="text"><s:label key="label.quote.minpremium.issuance" /> <font color="red">*</font></div>
																		<div class="tbox"><s:textfield name="minpremiumissu" cssClass="inputBox" /></div>
																	</div>
																	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																		<div class="text"><s:label key="label.quote.issuancefee" /><font color="red">*</font></div>
																		<div class="tbox"><s:textfield name="issuancefee"  cssClass="inputBox"/></div>
																	</div>
																	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																		<div class="text"><s:label key="label.quote.multiple.declare" /></div>
																		<div class="tbox">
																			<s:radio name="multiDeclare" list="#{'I':'Individual','M':'Multiple'}" cssClass="input"/>
																		</div>
																	</div>
																	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																		<div class="text"><s:label key="label.quote.multiple.declare.minpremium" /></div>
																		<div class="tbox"> <s:textfield name="multiDeclarePremium" cssClass="inputBox" /> </div>
																	</div>
																	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																		<div class="text"><s:label key="label.quote.backdate" /></div>
																		<div class="tbox"><s:textfield name="backDate" cssClass="input"/></div>
																	</div>
																	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																		<div class="text"><s:label key="label.quote.broker.arcode" /></div>
																		<div class="tbox">
																			<s:textfield name="nameAndCode"  id="nameAndCode" cssClass="inputBox" readonly="true"/>
																			<input type="button" value="..." onclick="getCoreCustomerInfo()"/>
																			<s:hidden name="CIMSNO"/>
																			<s:hidden name="ARACC"/>
																			<s:hidden name="customerName"/>
																		</div>
																	</div>
																	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																		<div class="text"></div>
																		<div class="tbox"></div>
																	</div>
																	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																		<div class="text"></div>
																		<div class="tbox"></div>
																	</div>																	
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<br class="clear" />
								<div class="row">
									<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
										<input type="button" onclick="fnsubmit('back')" name="back" class="btn btn-sm btn-danger" value="Back" /> &nbsp;&nbsp;&nbsp;
										<input type="button" name="submit2" class="btn btn-sm btn-success" value="Submit" onclick="fnsubmit('info')"/>
									</div>
								</div>
							</s:else>
							<s:hidden name="agencyCode"/>
							<s:hidden name="login_Id"/>
							<s:hidden name="mode"/>
							<s:token/>
						</s:form>
					</div>
				</div>
				<div id="2">
					<s:form id="regform" name="regform" theme="simple">
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<div class="panel panel-primary">
								<div class="panel-body">
									<div class="row">
										<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
											<div class="text"><s:text name="label.broker.name"/></div>
											<div class="tbox">
												<s:select name="broker" list="brokerList" headerKey="" headerValue="-Select-" listKey="login_id" listValue="COMPANY_NAME" onchange="fnTab(this.value, 'regQuotes','','1')" cssClass="inputBoxS" />
											</div>
										</div>
									</div>
									<br class="clear" />
									<div class="row">
										<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="regQuotes">
											<table class="display responsive no-wrap" id="record" width="100%" cellspacing="0">
												<thead>
												<tr>
													<th class="no-sort"></th>
													<th> <s:text name="Proposal No" /> </th>
													<th> <s:text name="Customer Name" /> </th>
													<th> <s:text name="Policy Start Date" /> </th>
													<th> <s:text name="Policy End date" /> </th>
													<th> <s:text name="Edit" /> </th>
													<th> <s:text name="Schedule" /> </th>
												</tr>
												</thead>
												<tbody>
												<s:iterator value="brokerList" status="stat" var="record">
												<tr>
													<td></td>
													<td> <s:property value="proposal_no" /> </td>
													<td> <s:property value="cust_name" /> </td>
													<td> <s:property value="start_date" /> </td>
													<td> <s:property value="end_date" /> </td>
													<td align="center"> <a href="#" onclick="editQuote(<s:property value="#record.proposal_no"/>, '<s:property value="session.user"/>')" class="btn btn-sm btn-warning" > <i class="fa fa-pencil-square-o"></i> </a> </td>
													<td align="center">
														<s:if test='RENEWAL_STATUS=="Y"'><a href="#" onclick="editQuote(<s:property value="#record.proposal_no"/>, '<s:property value="session.user"/>')" class="btn btn-sm btn-default" ><i class="fa fa-book"></i></a></s:if>
														<s:else>N/A</s:else> 
													</td>												
												</tr>
												</s:iterator>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					</s:form>
				</div>
				<div id="3">
					<s:form id="regform" name="regform" theme="simple">
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<div class="panel panel-primary">
								<div class="panel-body">
									<div class="row">
										<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
											<div class="text"><s:text name="label.broker.name"/></div>
											<div class="tbox">
												<s:select name="broker" list="brokerList" headerKey="" headerValue="-Select-" listKey="login_id" listValue="COMPANY_NAME" onchange="fnTab(this.value, 'portfo','','1'" cssClass="inputBoxS" />
											</div>
										</div>
									</div>
									<br class="clear" />
									<div class="row">
										<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="regQuotes">
											<table class="display responsive no-wrap" id="record" width="100%" cellspacing="0">
												<thead>
												<tr>
													<th class="no-sort"></th>
													<th> <s:text name="Core Application Policy No" /> </th>
													<th> <s:text name="Proposal No" /> </th>
													<th> <s:text name="Customer Name" /> </th>
													<th> <s:text name="Policy Start Date" /> </th>
													<th> <s:text name="Policy End date" /> </th>
													<th> <s:text name="Endorse" /> </th>
													<th> <s:text name="View" /> </th>
													<th> <s:text name="Schedule" /> </th>
													<th> <s:text name="Endt Schedule" /> </th>
													<th> <s:text name="DeActivate" /> </th>
												</tr>
												</thead>
												<tbody>
												<s:iterator value="brokerList" status="stat" var="record">
												<tr>
													<td></td>
													<td> <s:property value="MISSIPPI_OPENCOVER_NO" /> </td>
													<td> <s:property value="PROPOSAL_NO" /> </td>
													<td> <s:property value="cust_name" /> </td>
													<td> <s:property value="start_date" /> </td>
													<td> <s:property value="end_date" /> </td>
													<td align="center">
														<s:if test='STATUS=="Y"'><a href="#" onclick="editQuote(<s:property value="#record.proposal_no"/>, '<s:property value="session.user"/>')" class="btn btn-sm btn-warning" type="button"><i class="fa fa-pencil-square-o"></i></a></s:if>
														<s:elseif test='ENDT_STATUS!="N"'>Endorse</s:elseif>
													</td>
													<td align="center">
														<a href="#" onclick="editQuote(<s:property value="#record.proposal_no"/>, '<s:property value="session.user"/>')" class="btn btn-sm btn-info" type="button"><i class="fa fa-eye"></i></a>
													</td>
													<td align="center">
														<s:if test='STATUS!="Y"'><a href="#" onclick="editQuote(<s:property value="#record.proposal_no"/>, '<s:property value="session.user"/>')" class="btn btn-sm btn-default" type="button"><i class="fa fa-book"></i></a></s:if>
														<s:else>N/A</s:else>
													</td>
													<td align="center">
														<s:if test='ENDT_STATUS=="N"'><a href="#" onclick="editQuote(<s:property value="#record.proposal_no"/>, '<s:property value="session.user}"/>')" class="btn btn-sm btn-default" type="button"><i class="fa fa-book"></i></a></s:if>
														<s:else>N/A</s:else>
													</td>
													<td>
														<s:if test='RENEWAL_STATUS=="Y"'><a href="#" onclick="editQuote(<s:property value="#record.proposal_no"/>, '<s:property value="session.user"/>')" class="btn btn-sm btn-danger" type="button"><i class="fa fa-times"></i></a></s:if>
														<s:else>N/A</s:else>
													</td>												
												</tr>
												</s:iterator>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<s:token/>
					</s:form>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$('#neqQuote').load({
   title:'New Quote',
   href: '<%=request.getContextPath()%>/newQuoteOC.action',
});

$(function(){
	var index = '<s:property value="index"/>';
	var t = $('#tabs');
	var tabs = t.tabs('tabs');
		t.tabs('select', tabs[index].panel('options').title);
});

function fnOCType(val){
	if('One Stop'==val)
		document.getElementById('ocend').style.display='';
	else
		document.getElementById('ocend').style.display='none';
}
function fncross_percent(val){
	if('Y'==val)
		document.getElementById('cross_percent').style.display='';
	else
		document.getElementById('cross_percent').style.display='none';
}
</script>
</body>
</html>