<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ page language="java" import="com.maan.report.service.ReportService"%>
<!DOCTYPE HTML>
<html <s:if test="locale.language == 'ar'">dir="rtl"</s:if> >
<head>
<s:if test='menuType=="CHART"'>
	<s:if test='("40".equalsIgnoreCase(#session.product_id) || "42".equalsIgnoreCase(#session.product_id) || "3".equalsIgnoreCase(#session.product_id) || "11".equalsIgnoreCase(#session.product_id)) && ("RSAIssuer".equalsIgnoreCase(#session.usertype) || "Broker".equalsIgnoreCase(#session.usertype) || "User".equalsIgnoreCase(#session.usertype))'>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/highchartsUpd/highcharts.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/highchartsUpd/highcharts-3d.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/highchartsUpd/exporting.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/highchartsUpd/export-data.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/highchartsUpd/accessibility.js"></script>
		<style type="text/css">
		#container {
		  height: 400px; 
		}
		.overflow{
		overflow: scroll;
		}
		
		.highcharts-figure, .highcharts-data-table table {
		  min-width: 310px; 
		  max-width: 800px;
		  margin: 1em auto;
		}
		
		.highcharts-data-table table {
		  font-family: Verdana, sans-serif;
		  border-collapse: collapse;
		  border: 1px solid #EBEBEB;
		  margin: 10px auto;
		  text-align: center;
		  width: 100%;
		  max-width: 500px;
		}
		.highcharts-data-table caption {
		  padding: 1em 0;
		  font-size: 1.2em;
		  color: #555;
		}
		.highcharts-data-table th {
		  font-weight: 600;
		  padding: 0.5em;
		}
		.highcharts-data-table td, .highcharts-data-table th, .highcharts-data-table caption {
		  padding: 0.5em;
		}
		.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even) {
		  background: #f8f8f8;
		}
		.highcharts-data-table tr:hover {
		  background: #f1f7ff;
		}
		#sliders td input[type=range] {
		    display: inline;
		}
		#sliders td {
		    padding-right: 1em;
		    white-space: nowrap;
		}
		.slidershape {
		  -webkit-appearance: none;
		  width: 100%;
		  height: 15px;
		  border-radius: 5px;  
		  background: #d3d3d3;
		  outline: none;
		  opacity: 0.7;
		  -webkit-transition: .2s;
		  transition: opacity .2s;
		}
		
		.slidershape::-webkit-slider-thumb {
		  -webkit-appearance: none;
		  appearance: none;
		  width: 25px;
		  height: 25px;
		  border-radius: 50%; 
		  background: #0C3965;
		  cursor: pointer;
		}
		
		.slidershape::-moz-range-thumb {
		  width: 25px;
		  height: 25px;
		  border-radius: 50%;
		  background: #0C3965;
		  cursor: pointer;
		}
		div.polaroid {
		  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
		  width: 98%;
		}
		</style>
	</s:if> 
</s:if>
<s:if test='menuType!="CHART"'>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.responsive.css">
	<s:if test="locale.language == 'ar'">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.jqueryui_ar.css">
	</s:if>
	<s:else>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.jqueryui.css">
	</s:else>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.tableTools.css">
	<%-- <link href="<%=request.getContextPath()%>/dataTables/css/jquery-start-ui.css" rel="stylesheet" type="text/css" /> --%>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datepicker/jquery-ui.css">
	<%-- <script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery-1.11.1.min.js"></script> --%>
	<s:if test="locale.language == 'ar'">
		<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery.dataTables.min_ar.js"></script>
	</s:if>
	<s:else>
		<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery.dataTables.min.js"></script>
	</s:else>
	
	
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.jqueryui.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.responsive.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.tableTools.js"></script>
	<script src="<%=request.getContextPath()%>/datepicker/jquery-ui.js"></script>	
	<script type="text/javascript">
  	jQuery(function ($) {
  		try {
  			var data = $('#gridTable').dataTable( {
				"lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
				"order": [[ 1, "asc" ]],
				"columnDefs": [ {
		          "targets": 'no-sort',
		          "orderable": false
			    } ],
				responsive: true
			});
  			var data2 = $('#gridTable1').dataTable( {
				"lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
				"order": [[ 1, "asc" ]],
				"columnDefs": [ {
		          "targets": 'no-sort',
		          "orderable": false
			    } ],
				responsive: true
			});


  			
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
	
	
$(function() {
	$('#preEffectiveDate').datetimepicker({
	     format:'d/m/Y',
	     //step: 1,
	     timepicker:false,
	    // minDate:'0',
	    // maxDate:'+1970/01/15',    
	     scrollInput : false,
	     onSelectDate:function(current_time, $input){
	    	 $(".xdsoft_datetimepicker").css("display", "none");
	     }
	     
	});
	/* $('#preEffectiveDate').datepicker({
		changeMonth: true,
        changeYear: true,
        yearRange: "-100:+0",
        dateFormat: 'dd/mm/yy'
	}).on('changeDate', function(e){
	    $(this).datepicker('hide');
	}); */
    
});
  	</script>
</s:if>

</head>
<body>
<s:form name="report" theme="simple">
<%--<div id="loading" style="width:100%">
   <img id="loading-image" src="<%=request.getContextPath()%>/images/ajax-loader-bar.gif"/>
</div>
--%><div class="row">
	<s:set var="format" value="%{'number.format.'+#session.CurrencyDecimal}"></s:set>
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<s:if test='menuType!="CHART"'>
			<div class="panel panel-primary">
				<div class="panel panel-heading">
					<!--<span class="pullLeft">-->
					<s:if test='lapsedmenu=="lapsedOC"'>
						<a href="#" type="button" class="btn btn-sm btn-primary" onClick="forward('P')">Portfolio</a>
						<a href="#" type="button" class="btn btn-sm btn-primary" onClick="forward('PC')">Cancelled Policies</a>
						</s:if>
					<s:if test='menuType!="CHART"'>
						<s:text name="report.%{menuType}" />
					</s:if>					
					<!--</span>-->
					<span class="pullRight">
						<s:if test='menuType!="ET" && menuType!="E" && menuType!="CHART" && (#session.usertype==getText("BROKER") || #session.usertype==getText("ISSUER") || #session.usertype==getText("USER"))'>
							<s:if test='#session.product_id==getText("OPEN_COVER")'>
								<s:label key="endt.policyNo"/> : <span style="color:yellow;"><s:property value="%{originalPolicyNo}"/></span>
							</s:if> 
						</s:if>
						<%--
						<s:elseif test='menuType!="ET" || menuType!="E"'>
			  				<s:hidden name="loginId"></s:hidden>
			  			</s:elseif>
			  			--%>
					</span>
					<br class="clear" />
				</div>
				<div class="panel-body" style="padding-top: 0px;">
					<s:if test='menuType!="ET" && menuType!="E" && menuType!="CHART" && (#session.usertype==getText("BROKER") || #session.usertype==getText("ISSUER") || #session.usertype==getText("USER"))'>
						<s:if test='(menuType=="PD" && searchFrom != "BS"'>
							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
								<div class="text">
									<s:text name='%{#session.product_id!=getText("OPEN_COVER")?"report.searchByPolicyNo":"report.searchByCertNo"}' />
								</div>
								<div class="tbox">
									<s:textfield name="searchValue" id="searchValue" cssClass="inputBox" />
								</div>
							</div>	
							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4" align="center">
								<s:hidden name="searchBy" value="policyNo"/>
								<s:submit type="submit" name="go" key="Go" cssClass="btn btn-sm btn-success" onclick="return searchByPolicy()"/>
							</div>
						</s:if>
						<s:if test='(#session.usertype!=getText("USER"))'>
							<s:if test='searchFrom == "BS"'> 
		  						<s:hidden name="searchValue" id="searchValue" />&nbsp;<s:hidden name="searchBy" value="policyNo"/>
		  					</s:if>
		  					<s:if test='(#session.usertype==getText("BROKER") || (#session.product_id!=getText("OPEN_COVER") && #session.usertype==getText("ISSUER")))'>
		  						<s:if test='menuType=="R" || menuType=="PR" || "BQE".equalsIgnoreCase(menuType) || "BP".equalsIgnoreCase(menuType) || "BRU".equalsIgnoreCase(menuType) || "BRA".equalsIgnoreCase(menuType) || "BRR".equalsIgnoreCase(menuType) || "PVD".equalsIgnoreCase(menuType)'>
		  							<s:hidden name="loginId"/>
		  						</s:if>
		  						<s:else>
		  							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
										<div class="text">
											<s:label key="report.selectuser" theme="simple"/>
										</div>
										<div class="tbox">
											<s:select list="userSelection" cssClass="inputBoxS" listKey="LOGIN_ID" listValue="USERNAME" name="userLoginId" id="userLoginId" headerKey="" headerValue="Select"  onchange="userSelectReport(this)" disabled='issuer !=null && issuer.length() > 0 && #session.product_id==getText("OPEN_COVER")'/>
										</div>
									</div>
		  						</s:else>
		  					</s:if>
		  					<s:else>
		  						<s:hidden name="loginId"/>
		  					</s:else>
		  					<s:if test='(#session.usertype==getText("ISSUER") && (menuType=="P" || menuType=="AP"))'>			  				 
								<div class="pullRight">							 		
							 		<div>
								 		<div class="col-xs-9">
								 			<s:label key="report.otherPolicyNo" /> <br/> 
								 			<s:textfield name="otherPolicySearch" id="otherPolicySearch" cssClass="inputBox" maxlength="50" /> 
								 		</div> 
								 		<div class="col-xs-3">
									  	 	<s:submit value="Search" onclick="initReport" cssClass="btn btn-sm btn-success" />								 		 
								 		</div>
							 		</div>
							 	</div> 
								<br class="clear"/>
							 </s:if>
						</s:if>
						<s:else>
	  						<s:hidden name="loginId"/>
	  					</s:else>
					</s:if>
					<%--
					<s:elseif test='menuType!="ET" || menuType!="E"'>
		  				<s:hidden name="loginId"></s:hidden>
		  			</s:elseif>
		  			--%>
		  			<s:else>
		  				<s:hidden name="loginId"></s:hidden>
		  			</s:else>
		  			<br class="clear"/>
		  			<s:if test='menuType=="R"'>
						<div class="boxcontent">
							<div style="color: red;"><s:actionerror/></div>
							<br/>
							<table class="tableWidth">
								<tr>
									<td width="50%"><s:text name="report.startDate" /><font color="red">*</font></td>
									<td width="50%"><s:textfield id="rpolicyStartDate" name="policyStartDate" cssClass="inputBox datepicker" readonly="true" disabled="#disable" /></td>
								</tr>
								<tr><td colspan="2" height="5"></td></tr>
								<tr>
									<td><s:text name="report.endDate" /><font color="red">*</font></td>
									<td><s:textfield id="rpolicyEndDate" name="policyEndDate" cssClass="inputBox datepicker" readonly="true" disabled="#disable" /></td>
								</tr>
								<tr><td colspan="2" height="5"></td></tr>
								<tr>
								<s:if test='%{ #session.product_id=="11" || "USER".equalsIgnoreCase(#session.usertype)}'>
									<s:hidden name="userLoginId" value="%{loginId}"></s:hidden>
								</s:if>
								<s:else>
									<td><s:text name="report.selectuser"/><font color="red">*</font></td>
									<td><s:select name="userLoginId" id="userLoginId" list="policyList1" headerKey="ALL" headerValue="-ALL-"  listKey="LoginId" listValue="UserName" cssClass="inputBoxS" /></td>
								</s:else>
										<!--<s:if test='#session.usertype==getText("USER")'>
										<td></td>
										<s:hidden name="userLoginId" value="%{loginId}"></s:hidden>
									</s:if>
									<s:else>
										<td><s:text name="report.selectuser"/><font color="red">*</font></td>
										<td><s:select name="userLoginId" id="userLoginId" list="policyList1" headerKey="ALL" headerValue="-ALL-"  listKey="FIRST_NAME" listValue="USERNAME" cssClass="inputBoxS" /></td>
									</s:else>--> 
								</tr>
								<tr><td colspan="2" height="5"></td></tr>
							</table>
							<br class="clear" />
							<div align="center">
							<button type="submit" id="submit" name="submit" class="btn btn-sm btn-success" onclick="forwardReport('PR')">
											<s:text name="label.report.submit" />
										</button>												
								<!--<s:submit type="submit" name="submit" key="Submit" onclick="forwardReport('PR')" cssClass="btn btn-sm btn-success"/>-->
							</div>
						</div>
						<script type="text/javascript">
						$(function() {
							$('#rpolicyStartDate').datetimepicker({
							     format:'d/m/Y',
							     //step: 1,
							     timepicker:false,
							    // minDate:'0',
							    // maxDate:'+1970/01/15',    
							     scrollInput : false,
							     onSelectDate:function(current_time, $input){
							    	 $(".xdsoft_datetimepicker").css("display", "none");
							     }
							     
							});
							$('#rpolicyEndDate').datetimepicker({
							     format:'d/m/Y',
							     //step: 1,
							     timepicker:false,
							    // minDate:'0',
							    // maxDate:'+1970/01/15',    
							     scrollInput : false,
							     onSelectDate:function(current_time, $input){
							    	 $(".xdsoft_datetimepicker").css("display", "none");
							     }
							     
							});
						});
						</script>
					</s:if>
					<s:elseif test='menuType=="PR"'>
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
								<table class="display responsive no-wrap" id="record" width="100%" cellspacing="0">
									<thead>
									<tr>
										<th class="no-sort"></th>
										<s:if test='%{#session.product_id=="3" || #session.product_id=="11"}'>
											<th><s:text name="S.No." /></th>
											<th><s:text name="Policy Issue Date" /></th>
											<th><s:text name="Policy No" /></th>
											<th><s:text name="Inception Date" /></th>
											<th><s:text name="Debit Note No" /></th>
											<th><s:text name="Creditnote no" /></th>
											<th><s:text name="Insured Name" /></th>
											<th><s:text name="Carrier Name" /></th>
											<th><s:text name="Country Of Origin" /></th>
											<th><s:text name="Country Of Destination" /></th>
											<th><s:text name="Via" /></th>
											<th><s:text name="Form of Transport" /></th>
											<th><s:text name="Sum Insured(Local Currency)" /></th>
											<th><s:text name="Sum Insured(Foreign  Currency)" /></th>
											<th><s:text name="Currency Type" /></th>
											<th><s:text name="Exchange Rate" /></th>
											<th><s:text name="Sale Term Charges" /></th>
											<th><s:text name="Tolerance Charges" /></th>
											<th><s:text name="Total Sum Insured" /></th>
											<th><s:text name="Basis of Valuation" /></th>
											<th><s:text name="Marine Premium" /></th>
											<th><s:text name="WSRCC Premium" /></th>
											<th><s:text name="Excess Premium" /></th>
											<th><s:text name="Issuance Fee" /></th>
											<th><s:text name="Inspection Fee" /></th>
											<th><s:text name="Total Premium" /></th>
											<th><s:text name="Commission" /></th>
											<th><s:text name="Goods Description" /></th>
											<th><s:text name="Excess Description" /></th>
											<th></th>			
										</s:if>
										<s:else> <!-- #session.product_id=="30" -->
											<th><s:text name="label.report.sno" /></th>							
											<th><s:text name="report.insuredName" /></th>
											<th><s:text name="label.report.policyno" /></th>
											<th><s:text name="label.report.premium" /></th>
											<!--<th><s:text name="report.commission" /></th>
											<th><s:text name="Mode of Payment" /></th>-->
											<th><s:text name="label.report.loginid" /></th>
											<th><s:text name="report.issueDate" /></th>
											<th><s:text name="label.report.policyincdate" /></th>
											<th><s:text name="label.report.policyexpdate" /></th>
											<th><s:text name="report.debitNoteNo" /></th>
											<th><s:text name="label.report.receiptno" /></th>
											<th><s:text name="report.creditNoteNo" /></th>
										</s:else>
									</tr>
									</thead>
									<tbody>
									<s:iterator value="policyList" status="stat" var="record">
									<tr>
										<td></td>
										<s:if test='%{#session.product_id=="3" || #session.product_id=="11"}'>
											<td><s:property value="%{#stat.index+1}" /></td>
											<td><s:property value="POLICY_ISSUE_DATE" /></td>
											<td> <s:property value="POLICY_NO" /> </td>
											<td> <s:property value="INCEPTION_DATE" /> </td>
											<td> <s:property value="DEBIT_NOTE_NO" /> </td>
											<td> <s:property value="CREDIT_NOTE_NO" /> </td>
											<td> <s:property value="INSURED_NAME" /> </td>
											<td> <s:property value="CARRIER_NAME" /> </td>
											<td> <s:property value="ORIGIN_COUNTRY" /> </td>
											<td> <s:property value="DEST_COUNTRY" /> </td>
											<td> <s:property value="VIA" /> </td>
											<td> <s:property value="FORM_OF_TRANSPORT" /> </td>
											<td align="right"> <s:property value='getText(#format,{@java.lang.Double@valueOf(SUM_INSURED_LOCAL)})'/> </td>
											<td align="right"> <s:property value='getText(#format,{@java.lang.Double@valueOf(SUM_INSURED_FOREIGN)})'/> </td>
											<td> <s:property value="CURRENCY_TYPE" /> </td>
											<td> <s:property value="EXCHANGE_RATE" /> </td>
											<td> <s:property value="SALE_TERM_CHARGES" /> </td>
											<td> <s:property value="TOLERANCE_CHARGES" /> </td>
											<td> <s:property value="EQUIVALENT_USD" /> </td>
											<td> 
												<s:property value="BASIS_OF_VALUATION" /> 
												<s:if test='%{!"NONE".equals(#stat.index.TOLERANCE_NAME)}'>
													+ <s:property value='%{#stat.index.TOLERANCE_NAME}'/>
												</s:if> 
											</td>
											<td align="right"> <s:property value='getText("number.format.2",{@java.lang.Double@valueOf(MARINE_PREMIUM)})' /> </td>
											<td align="right"> <s:property value='getText("number.format.2",{@java.lang.Double@valueOf(WSRCC_PREMIUM)})' /> </td>
											<td align="right"> <s:property value='getText("number.format.2",{@java.lang.Double@valueOf(EXCESS_PREMIUM)})' /> </td>
											<td align="right"> <s:property value='getText("number.format.2",{@java.lang.Double@valueOf(POLICY_FIXEDFEE)})' /> </td>
											<td align="right"> <s:property value='getText("number.format.2",{@java.lang.Double@valueOf(INSPECTION_FEE)})' /> </td>
											<td align="right"> <s:property value='getText(#format,{@java.lang.Double@valueOf(TOTAL_PREMIUM)})' /> </td>
											<td align="right"> <s:property value='getText("number.format.2",{@java.lang.Double@valueOf(COMMISSION)})' /> </td>
											<td align="right"> <s:property value="GOODS_DESCRIPTION" /> </td>
											<td align="right"> <s:property value="EXCESS_DESCRIPTION"/> </td>
											<td> <s:property value="user_name" /> </td>
										</s:if>
										<s:else> <!-- #session.product_id=="30" -->
											<td><s:property value="%{#stat.index+1}" /></td>
											<td> <s:property value="INSURED_NAME" /> </td>
											<td> <s:property value="POLICY_NO" /> </td>
											<td align="right"> <s:property value='getText(#format,{@java.lang.Double@valueOf(OVERALL_PREMIUM)})' /> </td>
											<!-- <td align="right"> <s:property value='getText(#format,{@java.lang.Double@valueOf(COMMISSION)})' /> </td> -->
											<td> <s:property value="LOGIN_ID" /> </td>
											<!--<td> <s:property value="PAYMENT_MODE" /> </td> -->
											<td> <s:property value="EFFECTIVE_DATE" /> </td>
											<td> <s:property value="INCEPTION_DATE" /> </td>
											<td> <s:property value="EXPIRY_DATE" /> </td>
											<td> <s:property value="DEBIT_NOTE_NO" /> </td>
											<td> <s:property value="RECEIPT_NO" /> </td>
											<td> <s:property value="CREDIT_NO" /> </td>
										</s:else>
									</tr>
									</s:iterator>
									</tbody>
								</table>
							</div>
						</div>
						<br class="clear" />
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
								<input type="button" onclick="exportdata('excel')" class="btn btn-sm btn-warning" value="Excel"/> &nbsp;&nbsp;&nbsp;
								<input type="button" onclick="exportdata('pdf')" class="btn btn-sm btn-info" value="Pdf"/> &nbsp;&nbsp;&nbsp;
								<input type="button" onclick="menuSelect('R')" class="btn btn-sm btn-danger" value="<s:text name="label.report.back"/>"/>
							</div>
						</div>
						<s:hidden name="policyStartDate"/>
						<s:hidden name="policyEndDate"/>
						<s:hidden name="userLoginId"/>
						<s:hidden name="downloadType" id="downloadType"/>
					</s:elseif>
					<s:elseif test='menuType=="ET"'>
					
					 <s:if test='%{#session.product_id=="3" || #session.product_id=="11"}'>
							<div class="row">
								<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
									<s:label key="endt.policyNo"/> : <span class="text-primary"><s:property value="%{policyNo}"/></span>
								</div>
								<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
									<s:label key="endt.brokerName"/> : <span class="text-primary"><s:property value="%{brokerCompany}"/></span>
								</div>
								<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
									<s:label key="endt.custName"/> : <span class="text-primary"><s:property value="%{custName}"/></span>
								</div>
								<br class="clear"/>
							</div>
							<div class="boxcontent">
								<s:actionerror cssStyle="color:red;"/>
							</div>
							<div class="panel panel-primary">
								<div class="panel-heading">
									<s:text name="Non-Financial Endorsement" />
								</div>
								<div class="panel-body">
									<s:set var="list" value="endType"></s:set>
							        <s:set var="#typelist" value="endTypeList"></s:set>
							        <div class="row">
										<s:set var="datacnt" value="0"/>
										<s:iterator value="#typelist" var="type" status="stat">
								        	<s:if test='%{"1"==#type.ENDT_TYPE_CATEGORY_ID}'>
								        		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
								        			<s:set var="datacnt" value="%{@java.lang.Integer@parseInt(#attr.datacnt)+1}"/>
													<s:checkbox name="endType" value="%{#type.ENDT_TYPE_ID in #list}" id="%{#type.ENDT_TYPE_ID}" fieldValue="%{#type.ENDT_TYPE_ID}" onclick="toggleConfirm();"/><s:property value="%{#type.ENDT_TYPE}" />
								        		</div>
								        	</s:if>
								        </s:iterator>
							        </div>
								</div>
							</div>
							<s:if test='(#session.usertype==getText("RSAIssuer") || #session.usertype==getText("BROKER"))'>
							<div class="panel panel-primary">
								<div class="panel-heading">
									<s:text name="Financial Endorsement" />
								</div>
								<div class="panel-body">			
							        <div class="row">
										<s:set var="datacnt" value="0"/>
										<s:iterator value="#typelist" var="type" status="stat">
								        	<s:if test='%{"2"==#type.ENDT_TYPE_CATEGORY_ID}'>
								        		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
								        			<s:set var="datacnt" value="%{@java.lang.Integer@parseInt(#attr.datacnt)+1}"/>
													<s:checkbox name="endType" value="%{#type.ENDT_TYPE_ID in #list}" id="%{#type.ENDT_TYPE_ID}" fieldValue="%{#type.ENDT_TYPE_ID}" onclick="toggleConfirm();"/><s:property value="%{#type.ENDT_TYPE}" />
								        		</div>
								        	</s:if>
								        </s:iterator>
							        </div>
								</div>
							</div>
							</s:if>
							<div class="row" id="toggle" style="display: none;">
								<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" id="toggleCaption" >
									<div class="text">
										<s:text name=" Do you really want to cancel this policy?" />
									</div>
									<div class="tbox">
										<s:radio list="#{'Y':'Yes','N':'No'}" name="cancelYN"  />
									</div>
								</div>
								<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" id="cancelRemarks">
									<div class="text">
										<s:text name="Cancellation Remarks" /> &nbsp; <font color="red">* </font>
									</div>
									<div class="tbox">
										<s:textarea  name="cancelRemarks" rows="2" cssClass="inputBoxA1" cols="50"  onkeyup="textLimit(this,500)" /> 
									</div>
								</div>
								<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" id="cancelRemarks">
									<div class="text">
										<s:text name="Policy  Issued Date" /> &nbsp; <font color="red">* </font>
									</div>
									<div class="tbox">
										<s:textfield id="preEffectiveDate" name="effectiveDate" cssClass="inputBox datepicker tooltipContent"  data-content="Effective Date" readonly="true" />
									</div>
								</div>
								<br class="clear" />
							</div>
							<div class="row" id="toggleEndt" style="display: none;">							 
								<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" id="endtRemarks">
									<div class="text">
										<s:text name="Remarks" /> &nbsp; <font color="red">* </font>
									</div>
									<div class="tbox">
										<s:textarea  name="endtRemarks" rows="2" cssClass="inputBoxA1" cols="50"  onkeyup="textLimit(this,500)" /> 
									</div>
								</div>
								<br class="clear" />
							</div>
							<br/>
							<div align="center">
								<s:submit type="button" name="close"  key="Back" cssClass="btn btn-sm btn-danger" onclick="forward('E')"/>&nbsp;&nbsp;&nbsp;
								<s:submit name="proceedEndt" id="proceedEndt" type="button" cssClass="btn btn-sm btn-success" value="Proceed"  onclick="return proceedEndtFun('/endorsementReport.action?openCoverNo=%{openCoverNo}')" />
							</div>
						</s:if>
						<s:elseif test='%{"33".equalsIgnoreCase(#session.product_id)}'>
						<div class="boxcontent">
								<s:actionerror cssStyle="color:red;"/>
							</div>
						<div class="row">
								<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
									<s:label key="endt.policyNo"/> : <span class="text-primary"><s:property value="%{policyNo}"/></span>
								</div>
								<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
									<s:label key="endt.brokerName"/> : <span class="text-primary"><s:property value="%{brokerCompany}"/></span>
								</div>
								<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
									<s:label key="endt.custName"/> : <span class="text-primary"><s:property value="%{custName}"/></span>
								</div>
								<br class="clear"/>
							</div>
						<div class="panel panel-primary">
								<div class="panel-heading">
									<s:text name="Cancellation Endorsement" />
								</div>
						</div>
						<s:hidden name="endType" value="41" ></s:hidden>
							<div class="row" id="toggle" >
								<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" id="toggleCaption" >
									<div class="text">
										<s:text name=" Do you really want to cancel this policy?" />
									</div>
									<div class="tbox">
										<s:radio list="#{'Y':'Yes','N':'No'}" name="cancelYN"  />
									</div>
								</div>
								<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" id="cancelRemarks">
									<div class="text">
										<s:text name="Cancellation Remarks" /> &nbsp; <font color="red">* </font>
									</div>
									<div class="tbox">
										<s:textarea  name="cancelRemarks" rows="2" cssClass="inputBoxA1" cols="50"  onkeyup="textLimit(this,500)" /> 
									</div>
								</div>
								
								<br class="clear" />
							</div>
							<br/>
							<div align="center">
								<s:submit type="button" name="close"  key="Back" cssClass="btn btn-sm btn-danger" onclick="forward('P')"/>&nbsp;&nbsp;&nbsp;
								<s:submit type="button" name="submit" key="Proceed" onclick="redirect('/endorsementReport.action?openCoverNo=%{openCoverNo}')" cssClass="btn btn-sm btn-success"/>
							</div>
						
						</s:elseif>
					</s:elseif>
					<s:else>
						<s:if test='menuType=="E"'>
							<div class="row">
								<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
									<s:label key="endt.policyNo"/> : <span style="color:blue;"><s:property value="%{policyNo}"/></span>
								</div>
								<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
									<s:label key="endt.brokerName"/> : <span style="color:blue;"><s:property value="%{brokerCompany}"/></span>
								</div>
								<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
									<s:label key="endt.custName"/> : <span style="color:blue;"><s:property value="%{custName}"/></span>
								</div>
								<br class="clear"/>
							</div>
						</s:if>
						<s:if test='menuType!="CHART"'>
						<br class="clear"/>
							<div class="row">
								<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
									<table class="display responsive no-wrap" id="gridTable" width="100%" cellspacing="0">
										<thead>
										<tr>
											<th class="no-sort"></th>
											<th><s:text name="label.report.sno" /></th>
											<s:if test='menuType!="T" && menuType!="PD" && menuType!="C"'>
												<th><s:text name="label.report.quoteno"/></th>
												<th><s:text name="label.report.cusname"/></th>
												<s:if test='menuType!="L" && menuType!="RR" && menuType!="P"'>
													<th><s:text name="label.report.quotedate"/></th>
												</s:if>
												<s:if test='menuType=="RR"'>
													<th><s:text name="label.report.rejdate"/></th>
												</s:if>
												<s:elseif test='menuType=="P" || menuType=="BP" || menuType=="AP"'>
													<th><s:text name="label.report.policydate"/></th>
												</s:elseif>
											</s:if>
											<s:if test='menuType=="P" || menuType=="PE"  || menuType=="PC" || menuType=="BP"'>
												<s:if test='%{#session.product_id=="3" || #session.product_id=="11"}'>
													<th><s:text name="label.report.premium" /></th>
													<th><s:text name="label.report.policyno" /></th>
													<th><s:text name="report.schedule" /></th>
													 <%-- <th><s:text name="report.debitNote" /></th>
													<th><s:text name="report.creditNote" /></th>  --%>
													<s:if test='#session.product_id=="3"'>
														<th><s:text name="Policy Wording" /></th>
													</s:if>
													<s:if test='menuType=="PC"'>
															<th><s:text name="Cancelled Certificate" /></th>
													</s:if>
													<s:else>
														<th><s:text name="Endorse" /></th>
														<th><s:text name="Documents" /></th>
													</s:else>
													<th><s:text name="User Name" /></th>
													<th><s:text name="Goods Description" /></th>
													<th><s:text name="LC Date" /></th>
													<th><s:text name="LC Number" /></th>
													<th><s:text name="B/L Aw bill Number" /></th>
													<th><s:text name="B/L Aw bill Date" /></th>	
												</s:if>
												<s:else><!-- #session.product_id=="30" -->
													<th><s:text name="label.report.premium" /></th>
													<th><s:text name="label.report.policyno" /></th>
													<th><s:text name="report.schedule" /></th>
													<s:if test='%{"65".equalsIgnoreCase(#session.product_id)}'>
														<th><s:text name="label.report.bailbond"/></th>														
													</s:if>
													<th><s:text name="report.debitNote" /></th>
													<th><s:text name="label.report.Receipt" /></th>
													<th><s:text name="report.creditNote"/></th>													
													<s:if test='%{"65".equalsIgnoreCase(#session.product_id)}'>
														<th><s:text name="label.report.vehicle"/></th>
														<th align="center"><s:text name="label.report.terms.cond" /></th>														
													</s:if>
													<s:elseif test='%{"33".equalsIgnoreCase(#session.product_id)}'>
														<s:if test='(#session.usertype==getText("ISSUER"))'>
															<th><s:text name="Correction" /></th>
														</s:if>
														<th ><s:text name="Cancel / ReIssue" /></th>
														<th><s:text name="Policy Wording" /></th>
														<s:if test='menuType=="P"'>
															<th><s:text name="Attachment" /></th>
														</s:if>
													</s:elseif>
													<s:else>
														<th><s:text name="Endorse" /></th>
													</s:else>
												</s:else>	 
											</s:if>
											<s:elseif test='menuType=="PI" || menuType=="PF"'>
												<th><s:text name="Broker Name" /></th>
												<th><s:text name="Integration Error" /></th>
												<th><s:text name="Edit" /></th>
											</s:elseif>
											<s:elseif test='menuType=="AP"'>
													<th><s:text name="label.report.premium" /></th>
													<th><s:text name="label.report.policyno" /></th>
													<th><s:text name="label.report.policystatus" /></th>
													<s:if test='%{#session.product_id=="65"}'>
														<th><s:text name="label.report.propform" /></th>
													</s:if>
											</s:elseif>
											<s:elseif test='menuType=="QL"'>
												<th><s:text name="label.report.validatedate" /></th>
												<th><s:text name="label.report.active" /></th>
												<th><s:text name="label.report.Reject" /></th>
											</s:elseif>
											<s:elseif test='menuType=="QE" || menuType=="QS" || menuType=="BQE"'>
												<th><s:text name="label.report.validatedate" /></th>
												<s:if test='menuType=="QE" || menuType=="BQE"'>
													<th><s:text name="label.report.premium" /></th>
												</s:if>
												<th><s:text name="label.report.edit" /></th>
												<s:if test='menuType=="QE" || menuType=="BQE"'>
													<th><s:text name="label.report.emailid" /></th>
													<%-- <s:if test='%{#session.product_id != "65"}'>
														<th><s:text name="label.report.print" /></th>
													</s:if>
													<s:if test='%{#session.product_id=="65"}'>
														<th><s:text name="label.report.propform" /></th>
													</s:if> --%>
												</s:if>
												<th><s:text name="label.report.Reject" /></th>					
											</s:elseif>
											<s:elseif test='menuType=="RU" || menuType=="RA" || menuType=="BRU" || menuType=="BRA" || menuType=="BRR"'>
												<th><s:text name="label.report.edit" /></th>							
												<%-- <s:if test='%{#session.product_id != "65"}'>
														<th><s:text name="label.report.print" /></th>
													</s:if> --%>
												<th><s:text name="label.report.Reject" /></th>
											</s:elseif>
											<s:elseif test='menuType=="RR"'>
												<th><s:text name="label.reports.Remarks" /></th>
												<%-- <s:if test='%{#session.product_id != "65"}'>
														<th><s:text name="label.report.print" /></th>
													</s:if> --%>
											</s:elseif>
											<s:elseif test='menuType=="L"'>
												<th><s:text name="label.report.quotedate" /></th>
												<th><s:text name="label.report.rejdate" /></th>
												<th><s:text name="label.reports.Remarks" /></th>
												<%-- <s:if test='%{#session.product_id != "65"}'>
														<th><s:text name="label.report.print" /></th>
													</s:if> --%>
											</s:elseif>
											<s:elseif test='menuType=="T"'>
												<th><s:text name="Transaction Id" /></th>
												<th><s:text name="Valid Records" /></th>
												<th><s:text name="Invalid Records" /></th>
											</s:elseif>
											<s:elseif test='menuType=="PD"'>
												<th><s:text name="label.report.policyno" /></th>
												<th><s:text name="OpenCover Customer Name" /></th>
												<th align="right"><s:text name="label.report.premium" /></th>
												<th><s:text name="Total of Certificates" /></th>
												<th><s:text name="report.schedule" /></th>
												<%-- <th><s:text name="report.debitNote" /></th>
												<th><s:text name="report.creditNote" /></th> --%>
											</s:elseif>
											<s:elseif test='menuType=="C"'>
												<th><s:text name="label.report.cusname" /></th>
												<th><s:text name="Address" /></th>
												<th><s:text name="label.report.emailid" /></th>
												<th><s:text name="Contact No." /></th>
											</s:elseif>
											<s:elseif test='menuType=="E"'>
												<th><s:text name="label.report.premium" /></th>
												<th><s:text name="label.report.policyno" /></th>												
												<%---- <s:if test='#session.product_id=="3" || #session.product_id=="11"'> 
													<s:if test='"P".equals(gstatus)'>
														<th><s:text name="Schedule" /></th>
													</s:if>
												 	<s:if test='"P".equals(gstatus)'>
														<th><s:text name="Debit Note" /></th>
													</s:if>
													<s:if test='"P".equals(gstatus)'> 
														<th><s:text name="Credit Note" /></th>
													</s:if>
												</s:if>
												<s:else>
												  	<s:if test='"P".equals(gstatus)'>
														<th><s:text name="Schedule" /></th>
													</s:if>
												 	<s:if test='"P".equals(gstatus)'>
														<th><s:text name="Debit Note" /></th>
													</s:if>
													<s:if test='"P".equals(gstatus)'> 
														<th><s:text name="Credit Note" /></th>
													</s:if>
												</s:else>												
												<th><s:text name="Schedule" /></th>
												<th><s:text name="Debit Note" /></th>
												<th><s:text name="Credit Note" /></th>
												---%>
												<%--<s:if test='"P".equals(gstatus)'>
													<th><s:text name="Schedule" /></th>
												</s:if>--%>
												<th><s:text name="Status" /></th>
												<th><s:text name="Endorsement" /></th>
												<th><s:text name="Schedule" /></th>
												<%-- <th><s:text name="Debit Note" /></th>
												<th><s:text name="Credit Note" /></th> --%>
											</s:elseif>
										</tr>
										</thead>
										<tbody>
										<s:iterator value="gridReport" status="stat" var="report">
										<tr valign="middle">
											<td></td>
											<td><s:property value="%{#stat.index+1}"/></td>
											<s:if test='menuType!="T" && menuType!="PD" && menuType!="C"'>
												<td><s:property value="gquoteNo"/></td>
												<td><s:property value="gcustName"/></td>
												<s:if test='menuType!="L" && menuType!="RR" && menuType!="P"'>
													<td><s:property value="gquoteDate"/></td>
												</s:if>
												<s:if test='menuType=="RR"'>
													<td><s:property value="gquoteDate"/></td>
												</s:if>
												<s:elseif test='menuType=="P" || menuType=="BP" || menuType=="AP"'>
													<td><s:property value="gquoteDate"/></td>
												</s:elseif>
											</s:if>
											<s:if test='menuType=="P" || menuType=="PE"  || menuType=="PC" || menuType=="BP"'>
												<s:if test='%{#session.product_id=="3" || #session.product_id=="11"}'>
													<td align="right"><s:property value='getText(#format,{@java.lang.Double@valueOf(gpremium)})' /></td>
													<td> <s:property value="gpolicyNo" /> </td>
													<td align="center">
														<a href="#" type="button" class="btn btn-sm btn-primary" onClick="getSchedule('<s:property value="gquoteNo" />')">Eska</a>
														<a href="#" type="button" class="btn btn-sm btn-primary" onClick="getPortalSchedule('<s:property value="gquoteNo" />')">Portal</a> 
													</td>
													<%-- <td align="center">
														<s:if test='!"".equals(gdebit)'>
															<a href="#" type="button" class="btn btn-sm btn-warning" onClick="getDebit('<s:property value="gdebit" />')"><i class="glyphicon glyphicon-book"></i></a>
														</s:if> 
													</td> --%>
												</s:if>
												<s:else><!-- #session.product_id=="30" -->
													<td align="right"><s:property value='getText(#format,{@java.lang.Double@valueOf(goverAllPremium)})' /></td>
													<td> <s:property value="gpolicyNo" /> </td>
													<s:if test='#session.product_id=="65" '>
														<td align="center">
															<s:if test='!"5".equals(isselectedCover)'> 
																<a href="#" type="button" class="btn btn-sm btn-primary" onClick="getSchedule('<s:property value="gquoteNo" />')"><i class="glyphicon glyphicon-book"></i></a>
															</s:if> 
														</td>
													</s:if>
													<s:elseif test='#session.product_id=="33" '>
													    <td align="center">
																<a href="#" type="button" class="btn btn-sm btn-primary" onClick="getSchedule('<s:property value="gquoteNo" />')"><i class="glyphicon glyphicon-book"></i></a>
														</td>
													</s:elseif>
													
														<s:if test='%{#session.product_id=="65"}'><td align="center">
															<s:if test='"5".equals(isselectedCover)'>															
																	 <s:a href="#" cssClass="btn btn-sm btn-primary" onclick="return getBailBondPdf('%{gquoteNo}','1')"><i class="glyphicon glyphicon-book"></i></s:a>															
															</s:if>	</td>																							
														</s:if>
													
													<td align="center">
														<s:if test='!"".equals(gdebit)'>
															<a href="#" type="button" class="btn btn-sm btn-warning" onClick="getDebit('<s:property value="gdebit" />')"><i class="glyphicon glyphicon-book"></i></a>
														</s:if>
													</td>
													<td align="center">
														<s:if test='!"".equals(greceipt)'>
															<a href="#" type="button" class="btn btn-sm btn-info" onClick="getReceiptPdf('<s:property value="gquoteNo" />')"><i class="glyphicon glyphicon-book"></i></a>
														</s:if> 
													</td>
													<td align="center">
														<s:if test='!"".equals(gcredit) && "Y".equals(creditNoteStatus)'>
															<s:if test='"Y".equalsIgnoreCase(creditNoteStatus)'>
																<a href="#" type="button" class="btn btn-sm btn-info" onClick="getCredit('<s:property value="loginId" />','<s:property value="gcredit" />')"><i class="glyphicon glyphicon-book"></i></a>
															</s:if>
														</s:if>
													</td>
													<s:if test='%{#session.product_id=="65"}'>
														<td align="center">
															<a href="#" type="button" class="btn btn-sm btn-default" onClick="motorVehicleDetails('<s:property value="report.gpolicyNo"/>')"><i class="glyphicon glyphicon glyphicon-list-alt"></i></a>
														</td>	
														<td align="center">
															<a href="#" type="button" class="btn btn-sm btn-danger" onclick="getPolicyWordingPdf('<s:property value="report.gquoteNo"/>')"><i class="glyphicon glyphicon-book"></i></a>
														</td>																											
													</s:if>
													<s:elseif test='%{#session.product_id=="33"}'>
													<s:if test='(#session.usertype==getText("ISSUER"))'>
														<td align="center">
															<a href="#" type="button" class="btn btn-sm btn-primary" onClick="viewCorrection('<s:property value="report.gquoteNo"/>','<s:property value="report.gapplicationNo"/>')"><i class="glyphicon glyphicon-pencil"></i></a>
														</td>
													</s:if>
													<td align="center" >
														<a href="#" type="button" class="btn btn-sm btn-default" onClick="travelEndorsement(<s:property value="gendorse" />)" ><i class="glyphicon glyphicon-book"></i></a>
													</td>
													<td align="center">
														<a href="#" type="button" class="btn btn-sm btn-danger" onclick="getPolicyWordingPdf('<s:property value="report.gquoteNo"/>')"><i class="glyphicon glyphicon-book"></i></a>
													</td>
													<s:if test='menuType=="P"'>
														<td>
															<a href="#" type="button" class="btn btn-sm btn-primary" onClick="uploadDocuments('<s:property value="report.gattach"/>')"><i class="glyphicon glyphicon-upload"></i></a>
														</td>
													</s:if>
													</s:elseif>
													<s:else>
														<td align="center">
															<s:if test='!"".equals(gendorse)'>
																<a href="#" type="button" class="btn btn-sm btn-warning" onClick="endorsement(<s:property value="gendorse" />)"><i class="glyphicon glyphicon-book"></i></a>
															</s:if>
														</td> 
													</s:else>
												</s:else>
												<s:if test='%{#session.product_id=="3" || #session.product_id=="11"}'>
													<%-- <td align="center">
														<s:if test='!"".equals(gcredit)'>
															<s:if test='"Y".equalsIgnoreCase(creditNoteStatus)'>	
																<a href="#" type="button" class="1btn btn-sm btn-warning" onClick="getCredit('<s:property value="loginId" />','<s:property value="gcredit" />')"><i class="glyphicon glyphicon-book"></i></a>
															</s:if>
														</s:if>
													</td> --%>
													<s:if test='#session.product_id=="3"'>
														<td>
															<a href='#' onClick="getpolicyWording('<s:property value="gquoteNo"/>')"><i class="glyphicon glyphicon-book"></i></a>
														</td>
													</s:if>
													<td align="center">
															<s:if test='!"".equals(gendorse)'>
																<a href="#" type="button" class="btn btn-sm btn-warning" onClick="endorsement(<s:property value="gendorse" />)"><i class="glyphicon glyphicon-book"></i></a>
															</s:if>
													</td>
													<s:if test='menuType!="PC"'>	
														<td align="center">
															<s:if test='!"".equals(glcupload)'>
																<a href="#" type="button" class="btn btn-sm btn-default" onClick="lcupload(<s:property value="glcupload" />)"><i class="glyphicon glyphicon-book"></i></a>
															</s:if>
														</td>
													</s:if>	
												</s:if>
												
												<s:if test='%{#session.product_id=="3" || #session.product_id=="11"}'>
													<td><s:property value="guserName"/></td>
													<td><s:property value="ggood_desc"/></td>
													<td><s:property value="glc_date"/></td>
													<td><s:property value="glc_number"/></td>
													<td><s:property value="gbl_awb_no"/></td>
													<td><s:property value="gbl_awb_date"/></td>
												</s:if>											 
											</s:if>
											<s:elseif test='menuType=="PI" || menuType=="PF"'>
												  	<td> <s:property value="gbrokerName" /> </td>
													<td> <s:property value="gintgError" /> </td>
													<td align="center">
														<a href="#" type="button" class="btn btn-sm btn-warning" onClick="editQuote(<s:property value="gedit" />)"><i class="glyphicon glyphicon-pencil"></i></a>
													</td>
											</s:elseif>
											<s:elseif test='menuType=="AP"'>
													<td align="right"><s:property value='getText(#format,{@java.lang.Double@valueOf(goverAllPremium)})' /></td>
													<td> <s:property value="gpolicyNo" /> </td>
													<td> <s:property value="gstatus" /> </td>
													<s:if test='%{#session.product_id=="65"}'>
														<td align="center">
															<a href="#" type="button" class="btn btn-sm btn-primary" onClick="return getMotorProposalPdf(<s:property value="gquoteNo" />)"><i class="glyphicon glyphicon-print"></i></a>
														</td>
													</s:if>
											</s:elseif>
											<s:elseif test='menuType=="QL"'>
												<td> <s:property value="gvalidityDate" /> </td>
												<td align="center">
													<a href="#" type="button" class="btn btn-sm btn-success" onClick="sentEMail(<s:property value="gactive" />)"><i class="glyphicon glyphicon-ok-sign"></i></a>
												</td>
												<td align="center">
													<a href="#" type="button" class="btn btn-sm btn-danger" onClick="sentEMail(<s:property value="gdeactive" />)"><i class="glyphicon glyphicon-remove-sign"></i></a>
												</td>
											</s:elseif>
											<s:elseif test='menuType=="QE" || menuType=="QS" || menuType=="BQE"'>
												<td> <s:property value="gvalidityDate" /> </td>
												<s:if test='menuType=="QE" || menuType=="BQE"'>
												<s:if test='getText(#format,{@java.lang.Double@valueOf(gpremium)}) == getText(#format,{@java.lang.Double@valueOf(0)})'>
													<td align="right"> <s:property value='getText(#format,{@java.lang.Double@valueOf(gbasePremium)})' /> </td>
												</s:if>
												<s:else>
													<td align="right"> <s:property value='getText(#format,{@java.lang.Double@valueOf(gpremium)})' /> </td>
												</s:else>
												</s:if>
												<td align="center">
													<a href="#" type="button" class="btn btn-sm btn-warning" onClick="editQuote(<s:property value="gedit" />)"><i class="glyphicon glyphicon-pencil"></i></a>
												</td>
												<s:if test='menuType=="QE" || menuType=="BQE"'>
													<td align="center">
														<a href="#" type="button" class="btn btn-sm btn-default" onClick="sentEMail('<s:property value="gapplicationNo" />','MAIL','<s:property value="gquoteNo" />')"><i class="glyphicon glyphicon-envelope"></i></a>
													</td>
													<%-- <s:if test='%{#session.product_id != "65"}'>
														<td align="center">
														<a href="#" type="button" class="btn btn-sm btn-primary" onClick="viewQuote(<s:property value="gquoteNo" />)"><i class="glyphicon glyphicon-print"></i></a>
													</td>
													</s:if>
													<s:if test='%{#session.product_id=="65"}'>
														<td align="center">
															<a href="#" type="button" class="btn btn-sm btn-primary" onClick="return getMotorProposalPdf(<s:property value="gquoteNo" />)"><i class="glyphicon glyphicon-print"></i></a>
														</td>
													</s:if> --%>
												</s:if>
												<td align="center">
													<a href="#" type="button" class="btn btn-sm btn-danger" onClick="sentEMail(<s:property value="greject" />)"><i class="glyphicon glyphicon-remove-sign"></i></a>
												</td>
											</s:elseif>
											<s:elseif test='menuType=="RU" || menuType=="RA" || menuType=="BRU" || menuType=="BRA" || menuType=="BRR"'>
												<td align="center"><a type="button" class="btn btn-sm btn-warning" href="#" onClick="editQuote(<s:property value="gedit" />)"><i class="glyphicon glyphicon-pencil" ></i></a></td>
												<%-- <s:if test='%{#session.product_id != "65"}'>
														<td align="center">
														<a href="#" type="button" class="btn btn-sm btn-primary" onClick="viewQuote(<s:property value="gquoteNo" />)"><i class="glyphicon glyphicon-print"></i></a>
													</td>
													</s:if> --%>
												<td align="center">
													<a href="#" type="button" class="btn btn-sm btn-danger" onClick="sentEMail(<s:property value="greject1" />)"><i class="glyphicon glyphicon-remove-sign"></i></a>
												</td>
											</s:elseif>
											<s:elseif test='menuType=="RR"'>
												<td> <s:property value="glapsedRemark" /> </td>
												<%-- <s:if test='%{#session.product_id != "65"}'>
														<td align="center">
														<a href="#" type="button" class="btn btn-sm btn-primary" onClick="viewQuote(<s:property value="gquoteNo" />)"><i class="glyphicon glyphicon-print"></i></a>
													</td>
												</s:if> --%>
											</s:elseif>
											<s:elseif test='menuType=="L"'>
												<td> <s:property value="gquoteDate" /> </td>
												<td> <s:property value="glapsedDate" /> </td>
												<td> <s:property value="glapsedRemark" /> </td>
												<%-- <s:if test='%{#session.product_id != "65"}'>
														<td align="center">
														<a href="#" type="button" class="btn btn-sm btn-primary" onClick="viewQuote(<s:property value="gquoteNo" />)"><i class="glyphicon glyphicon-print"></i></a>
													</td>
												</s:if> --%>
											</s:elseif>
											<s:elseif test='menuType=="T"'>
												<td> <s:property value="gtransactionId" /> </td>
												<td><a href="#" onclick="downloadSuccess('<s:property value="gtransactionId" />')"> <s:property value="gvalidRecords" /></a> 
												 </td>
												<td> <a href="#" onclick="downloadError('<s:property value="gtransactionId" />')"> <s:property value="ginvalidRecords" /></a>
												 
												</td>
											</s:elseif>
											<s:elseif test='menuType=="PD"'>
												<td> <s:property value="gpolicyNo" /> </td>
												<td> <s:property value="gocCustName" /> </td>
												<td> <s:property value="gpremium" /> </td>
												<td> <s:property value="gtotalCert" /> </td>
												<td align="center">
													<a href="#" type="button" class="btn btn-sm btn-primary" onClick="getMultiSchedule(<s:property value="gschedule" />)"><i class="glyphicon glyphicon-book"></i></a> 
												</td>
												<td align="center">
													<a href="#" type="button" class="btn btn-sm btn-warning" onClick="getDebit2('<s:property value="gdebit" />')"><i class="glyphicon glyphicon-book"></i></a> 
												</td>
												<td align="center">
													<a href="#" type="button" class="btn btn-sm btn-warning" onClick="getCredit(<s:property value="loginId" />,<s:property value="gcredit" />)"><i class="glyphicon glyphicon-book"></i></a>
												</td>
											</s:elseif>
											<s:elseif test='menuType=="C"'>
												<td> <s:property value="gfirstName" /> </td>
												<td> <s:property value="gaddress" /> </td>
												<td> <s:property value="gemail" /> </td>
												<td> <s:property value="gmobile" /> </td>
											</s:elseif>
											<s:elseif test='menuType=="E"'>
												 <td> <s:property value="gpremium" /> </td>
												<s:if test='gstatus=="P" || gstatus=="D"'>
												 	<td> <s:property value="gpolicyNo" /> </td>
												 </s:if>
												 <s:else>
												 		<td>&nbsp;</td>
												 </s:else>
												<%--- <s:if test='#session.product_id=="3" || #session.product_id=="11"'>
												 	<td align="center">
												 		<s:if test='"P".equals(gstatus)'>
												 			<a href="#" type="button" class="btn btn-sm btn-primary" onClick="getSchedule(<s:property value="gschedule" />)"><i class="glyphicon glyphicon-book"></i></a>
												 		</s:if>
												 		<s:else> &nbsp; </s:else>
												 	</td>
												 	<td align="center">
												 		<s:if test='%{"P".equals(gstatus)}'>
															<a href="#" type="button" class="btn btn-sm btn-warning" onClick="getDebit2(<s:property value="gdebit" />)"><i class="glyphicon glyphicon-book"></i></a>
														</s:if>
														<s:else> &nbsp; </s:else> 
													</td>												 	
												 	<td align="center">
												 		<s:if test='%{"P".equals(gstatus)}'>
															<a href="#" type="button" class="btn btn-sm btn-warning" onClick="getCredit(<s:property value="loginId" />,<s:property value="gcredit" />)"><i class="glyphicon glyphicon-book"></i></a>
														</s:if>
													 	<s:else>
													 		&nbsp;
													 	</s:else>
													</td>
												 </s:if>
												 <s:else>												 	
												 	<td align="center">
												 		<s:if test='"P".equals(gstatus)'>
															<a href="#" type="button" class="btn btn-sm btn-primary" onClick="getSchedule1(<s:property value="gquoteNo" />)"><i class="glyphicon glyphicon-book"></i></a>
														</s:if>
													 	<s:else>
													 		&nbsp;
													 	</s:else> 
													</td>												 	
												 	<td align="center">
												 		<s:if test='%{"P".equals(gstatus)}'>
															<a href="#" type="button" class="btn btn-sm btn-warning" onClick="getDebit1(<s:property value="gdebit1" />)"><i class="glyphicon glyphicon-book"></i></a>
														</s:if>
													 	<s:else>
													 		&nbsp;
													 	</s:else> 
													</td>												 	
												 		<td align="center">
														<s:if test='%{"P".equals(gstatus)}'>
															<a href="#" type="button" class="btn btn-sm btn-warning" onClick="getCredit(<s:property value="loginId" />,<s:property value="gcredit" />)"><i class="glyphicon glyphicon-book"></i></a>
														</s:if>
													 	<s:else>
													 		&nbsp;
													 	</s:else>
													</td>
												 </s:else> --%>
												 <td> 	
													 <s:if test='gstatus=="D"'>
													 	<s:text name="Policy Cancelled" />
													  </s:if>
													  <s:else>
													  	<s:property value="grefSatus" />
													  </s:else>
												  </td> 
												  <td align="center"> <s:property escapeHtml="false" value="%{gendtSchedule}"/> </td>	
												 <td align="center">
												 
														<a href="#" type="button" class="btn btn-sm btn-primary" onClick="getSchedule('<s:property value="gquoteNo" />')"><i class="glyphicon glyphicon-book"></i></a> 
												</td>											  
												<%-- <td align="center">
													<s:if test='!"".equalsIgnoreCase(gdebit) &&  !"DR".equalsIgnoreCase(gendtcrdrStatus) '>
														<a href="#" type="button" class="btn btn-sm btn-warning" onClick="getDebit2('<s:property value="gdebit" />')"><i class="glyphicon glyphicon-book"></i></a> 
													</s:if>
													<s:else>&nbsp;</s:else>													 
												</td>										  
												
												<td align="center">
												<s:if test='!"".equalsIgnoreCase(gcredit) &&  !"CR".equalsIgnoreCase(gendtcrdrStatus) '>
														<a href="#" type="button" class="btn btn-sm btn-warning" onClick="getCredit('<s:property value="loginId" />','<s:property value="gcredit" />')"><i class="glyphicon glyphicon-book"></i></a>
													</s:if>
													<s:else>&nbsp;</s:else>
												</td>	 --%>												
											</s:elseif>					
										</tr>
										</s:iterator>
											
										</tbody>
									</table>
									
									
								</div>								
							</div>
							
							
									<!--<s:if test='%{menuType=="RA"}' >
									<br class="clear"/><br class="clear"/><br class="clear"/>
											<s:set value="gridReport1" var="gridReportRef"></s:set>
											<s:if test="#gridReportRef.size()>0">
											<div class="panel panel-primary">
												<div class="panel panel-heading">
													<s:text name="report.RA" />
												</div>
											
						
											<div class="row">
												<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
													<table class="display responsive no-wrap" id="gridTable1" width="100%" cellspacing="0">
														<thead>
															<tr>
															<th class="no-sort"></th>
															<th><s:text name="label.report.sno" /></th>
															<th><s:text name="label.report.quoteno"/></th>
															<th><s:text name="label.report.cusname"/></th>
															<th><s:text name="label.report.quotedate"/></th>
															<th><s:text name="label.report.edit" /></th> 
															<th><s:text name="label.report.Reject" /></th>
															</tr>
														</thead>
														<tbody>
															<s:iterator value="#gridReportRef" status="statv" var="reportv">
																<tr><td></td>
																<td><s:property value="%{#statv.index+1}"/></td>
																<td><s:property value="gquoteNo"/></td>
																<td><s:property value="gcustName"/></td>
																<td><s:property value="gquoteDate"/></td>
																<td align="center"><a type="button" class="btn btn-sm btn-warning" href="#" onClick="editQuote(<s:property value="gedit" />)"><i class="glyphicon glyphicon-pencil" ></i></a></td>
																<td align="center">
																	<a href="#" type="button" class="btn btn-sm btn-danger" onClick="sentEMail(<s:property value="greject1" />)"><i class="glyphicon glyphicon-remove-sign"></i></a>
																</td></tr>
															</s:iterator>														
														</tbody>
													</table>
												</div>
											</div>	</div> 
											</s:if>
											
										</s:if>-->
						</s:if>
						<br class="clear" />
						<div class="row" align="center">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
								<s:if test='menuType=="P" || menuType=="PE" || menuType=="PC" || menuType=="BP"'>
									<s:if test='#session.product_id!=getText("OPEN_COVER")'> </s:if>
									<s:else>
										<s:submit type="button" name="close"  key="Back" cssClass="btn btn-sm btn-danger" onclick="redirect('/viewOpenCoverReport.action')"/>&nbsp;&nbsp;&nbsp;
									</s:else>
								</s:if>
								<s:if test='menuType=="E"'>
								
									<s:if test='%{#session.product_id=="65"}'>
										<s:submit type="button" name="close"  key="Back" cssClass="btn btn-sm btn-danger" onclick="motorVehicleDetails('%{policyNo}')"/>&nbsp;&nbsp;&nbsp;
									</s:if>
									<s:else>
										<s:submit type="button" name="close"  key="Back" cssClass="btn btn-sm btn-danger" onclick="forward('P')"/>&nbsp;&nbsp;&nbsp;
									</s:else>
									<s:if test='%{((issuer !=null && issuer.length() > 0) || #session.usertype==getText("BROKER")) && (endtStatus==null || endtStatus=="")}'>
										<s:submit type="button" name="new"  key="Create New" cssClass="btn btn-sm btn-primary" onclick="endorsementTypeNew('ET','N')"/>&nbsp;&nbsp;&nbsp;
									</s:if>
								 	<s:elseif test='%{((issuer !=null && issuer.length() > 0) || #session.usertype==getText("BROKER")) && endtStatus=="N"}'>
										<a href="#" onclick="endorsementType('ET','P','','<s:property value="quotationNo"/>','<s:property value="referalStatus"/>','<s:property value="appNo"/>')"><s:submit type="button" name="new"  key="Create New" cssClass="btn btn-sm btn-primary" /></a>
									</s:elseif>  
									<%-- <s:elseif  test='menuType=="E"'>
									<tr align="center">
											<td class="text" >
												<s:submit type="button" name="close"  key="Back"  cssClass="btn btn-sm btn-danger" onclick="forward('P')"/>&nbsp;
											</td>
										</tr> 
									</s:elseif> --%>
									<input type="button" value="View" class="btn btn-sm btn-info"  onclick="policyView('<s:property value="curntAppNo"/>','P','')" />
								</s:if>
								<s:if test='menuType=="D"'>
									<s:submit type="button" name="close"  key="Back" cssClass="btn btn-sm btn-danger" onclick="forward('T')"/>&nbsp;&nbsp;&nbsp;
									<s:submit type="submit" name="submit" key="Submit" onclick="forward()" cssClass="btn btn-sm btn-success"/>
								</s:if>
							</div>							
						</div>		
					</s:else>
				</div>
			</div>
		</s:if>
		<s:if test='%{menuType=="CHART" && #session.LoginType=="B2C"}'>
			<script language="JavaScript" type="text/javascript">
				newQuote('<s:property value="%{#session.product_id}"/>');
			</script>
		</s:if>
		<s:elseif test='menuType=="CHART"'>
		<div class="panel panel-primary">			
			<div class="panel-body">
				<s:if test='("3".equalsIgnoreCase(#session.product_id) || "11".equalsIgnoreCase(#session.product_id)) '>
				<div class="container">
					<div class="row">
						<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
							<ul class="nav nav-pills">
							    <li><a data-toggle="pill" href="#pieCharts" onclick="barAdj('pie','barAngleAdjustId')" >Pie Chart</a></li>
							    <li class="active"><a data-toggle="pill" href="#barCharts" onclick="barAdj('bar','barAngleAdjustId')">Bar Chart</a></li>
							</ul>
						</div>
						<div class="col-xs-12 col-sm-8 col-md-8 col-lg-8" style="display:block;" id="barAngleAdjustId" >
							<div id="sliders">
								<div class="textfield33">
							 		<div class="text">
							 			Alpha Angle
							 		</div>
							 		<div class="tbox">
							 			<input id="alpha" type="range" min="0" max="45" class="slidershape" value="0"/> <span id="alpha-value" class="value"></span>
							 		</div>	
						 		</div>
						 		<div class="textfield33">
							 		<div class="text">
							 			Beta Angle
							 		</div>
							 		<div class="tbox">
							 			<input id="beta" type="range" min="-45" max="45" class="slidershape" value="0"/> <span id="beta-value" class="value"></span>
							 		</div>	
						 		</div>
						 		<div class="textfield33">
							 		<div class="text">
							 			Depth
							 		</div>
							 		<div class="tbox">
							 			<input id="depth" type="range" min="0" max="100" class="slidershape" value="0"/> <span id="depth-value" class="value"></span>
							 		</div>	
						 		</div>
						    </div>
						</div>
					</div>
					<div class="tab-content">
						<div id="pieCharts" class="tab-pane fade">
							<div class="row">
								<s:if test='"Yes".equalsIgnoreCase(dcPolicyProdShow)'>
									<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 col-md-offset-4 col-lg-offset-4">
										<div id="containerPolicyProd"></div>
										<script language="JavaScript" type="text/javascript">
											Highcharts.chart('containerPolicyProd', {
											    chart: {
											        type: 'pie',
											        options3d: {
											            enabled: true,
											            alpha: 200,
											            beta: 0
											        }
											    },
											    title: {
											        text: 'PRODUCTION'
											    },
											    subtitle: {
											        text: '(Current Year)'
											    },
											    accessibility: {
											        point: {
											            valueSuffix: '%'
											        }
											    },
											    tooltip: {
											        pointFormat: '<b>{point.percentage:.1f}%</b><br/>'+
											        'No Of Policies : <b>{point.y}</b><br/>'+
											        'Total Premium : <b>{point.premium}</b>'
											    },
											    plotOptions: {
											        pie: {
											            allowPointSelect: true,
											            cursor: 'pointer',
											            innerSize: 150,
											            depth: 0,
											            dataLabels: {
											                enabled: true,
											                format: '{point.percentage:.1f}%'
											            },
											            showInLegend: true
											        }
											    },
											    series: [{
											        type: 'pie',
											        name: 'Policies',
											        data: [
												        <s:property value="dcPolicyProdValues"/>
											        ]
											    }],
											    exporting: {
											        enabled: false
											    }
											});
										</script>
									</div>
								</s:if>
								
								<s:if test='"Yes".equalsIgnoreCase(dcQuoteProdShow)'>
									<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 col-md-offset-4 col-lg-offset-4">
										<div id="containerQuoteProd"></div>
										<script language="JavaScript" type="text/javascript">
											Highcharts.chart('containerQuoteProd', {
											    chart: {
											        type: 'pie',
											        options3d: {
											            enabled: true,
											            alpha: 200,
											            beta: 0
											        }
											    },
											    title: {
											        text: 'QUOTATION'
											    },
											    subtitle: {
											        text: '(Current Year)'
											    },
											    accessibility: {
											        point: {
											            valueSuffix: '%'
											        }
											    },
											    tooltip: {
											        pointFormat: '<b>{point.percentage:.1f}%</b><br/>'+
											        'No Of Quotes : <b>{point.y}</b><br/>'+
											        'Total Premium : <b>{point.premium}</b>'
											    },
											    plotOptions: {
											        pie: {
											            allowPointSelect: true,
											            cursor: 'pointer',
											            innerSize: 150,
											            depth: 0,
											            dataLabels: {
											                enabled: true,
											                format: '{point.percentage:.1f}%'
											            },
											            showInLegend: true
											        }
											    },
											    series: [{
											        type: 'pie',
											        name: 'Quotes',
											        data: [
											            <s:property value="dcQuoteProdValues"/>
											        ]
											    }],
											    exporting: {
											        enabled: false
											    }
											});
										</script>
									</div>
								</s:if>
							</div>
							<br/>
							<br/>
							
							<div class="row">
							
								<s:if test='"Yes".equalsIgnoreCase(dcPolicyShow) && !"User".equalsIgnoreCase(#session.usertype)'>
									<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 col-md-offset-4 col-lg-offset-4">
										<div id="containerPolicy"></div>
										<script language="JavaScript" type="text/javascript">
											Highcharts.chart('containerPolicy', {
											    chart: {
											        type: 'pie',
											        options3d: {
											            enabled: true,
											            alpha: 200,
											            beta: 0
											        }
											    },
											    title: {
											        text: 'BROKER PRODUCTION'
											    },
											    subtitle: {
											        text: '(Current Year)'
											    },
											    accessibility: {
											        point: {
											            valueSuffix: '%'
											        }
											    },
											    tooltip: {
											        pointFormat: '<b>{point.percentage:.1f}%</b><br/>'+
											        'No Of Policies : <b>{point.y}</b><br/>'+
											        'Total Premium : <b>{point.premium}</b>'
											    },
											    plotOptions: {
											        pie: {
											            allowPointSelect: true,
											            cursor: 'pointer',
											            innerSize: 150,
											            depth: 0,
											            dataLabels: {
											                enabled: true,
											                format: '{point.percentage:.1f}%'
											            },
											            showInLegend: true
											        }
											    },
											    series: [{
											        type: 'pie',
											        name: 'Policies',
											        data: [
												        <s:property value="dcPolicyValues"/>
											        ]
											    }],
											    exporting: {
											        enabled: false
											    }
											});
										</script>
									</div>
								</s:if>
								
								<s:if test='"Yes".equalsIgnoreCase(dcQuoteShow) && !"User".equalsIgnoreCase(#session.usertype)'>
									<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 col-md-offset-4 col-lg-offset-4">
										<div id="containerQuote"></div>
										<script language="JavaScript" type="text/javascript">
											Highcharts.chart('containerQuote', {
											    chart: {
											        type: 'pie',
											        options3d: {
											            enabled: true,
											            alpha: 200,
											            beta: 0
											        }
											    },
											    title: {
											        text: 'BROKER QUOTATION'
											    },
											    subtitle: {
											        text: '(Current Year)'
											    },
											    accessibility: {
											        point: {
											            valueSuffix: '%'
											        }
											    },
											    tooltip: {
											        pointFormat: '<b>{point.percentage:.1f}%</b><br/>'+
											        'No Of Quotes : <b>{point.y}</b><br/>'+
											        'Total Premium : <b>{point.premium}</b>'
											    },
											    plotOptions: {
											        pie: {
											            allowPointSelect: true,
											            cursor: 'pointer',
											            innerSize: 150,
											            depth: 0,
											            dataLabels: {
											                enabled: true,
											                format: '{point.percentage:.1f}%'
											            },
											            showInLegend: true
											        }
											    },
											    series: [{
											        type: 'pie',
											        name: 'Quotes',
											        data: [
											            <s:property value="dcQuoteValues"/>
											        ]
											    }],
											    exporting: {
											        enabled: false
											    }
											});
										</script>
									</div>
								</s:if>
								
							</div>
							<br/>
							<br/>
							<br/>
							<div class="row">
								<div class="col-md-12">
									<div  class="ChartPageHeadingStript" align="center">
										<h3 class="" >REFERRAL REQUEST OF USER</h3>					
								    </div>
								</div>
							</div>
							<br>
							<div class="row">
								<s:if test='"Yes".equalsIgnoreCase(dcRefCompShow)'>
									<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 col-md-offset-4 col-lg-offset-4">
										<div id="containerRa"></div>
										<script language="JavaScript" type="text/javascript">
											Highcharts.chart('containerRa', {
											    chart: {
											        type: 'pie',
											        options3d: {
											            enabled: true,
											            alpha: 200,
											            beta: 0
											        }
											    },
											    title: {
											        text: 'Referral - Approved'
											    },
											    subtitle: {
											        text: '(Current Year)'
											    },
											    accessibility: {
											        point: {
											            valueSuffix: '%'
											        }
											    },
											    tooltip: {
											        pointFormat: '<b>{point.percentage:.1f}%</b><br/>'+
											        'No Of Referrals : <b>{point.y}</b>'
											    },
											    plotOptions: {
											        pie: {
											            allowPointSelect: true,
											            cursor: 'pointer',
											            depth: 0,
											            innerSize: 100,
											            dataLabels: {
											                enabled: true,
											                format: '{point.percentage:.1f}%'
											            },
											            showInLegend: true
											        }
											    },
											    series: [{
											        type: 'pie',
											        name: 'Referrals',
											        data: [
											            <s:property value="dcRefCompValues"/>
											        ]
											    }],
											    exporting: {
											        enabled: false
											    }
											});
										</script>
									</div>
								</s:if>
								<s:if test='"Yes".equalsIgnoreCase(dcRefPendShow)'>
									<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 col-md-offset-4 col-lg-offset-4">
										<div id="containerRp"></div>
										<script language="JavaScript" type="text/javascript">
											Highcharts.chart('containerRp', {
											    chart: {
											        type: 'pie',
											        options3d: {
											            enabled: true,
											            alpha: 200,
											            beta: 0
											        }
											    },
											    title: {
											        text: 'Referral - Pending'
											    },
											    subtitle: {
											        text: '(Current Year)'
											    },
											    accessibility: {
											        point: {
											            valueSuffix: '%'
											        }
											    },
											    tooltip: {
											        pointFormat: '<b>{point.percentage:.1f}%</b><br/>'+
											        'No Of Referrals : <b>{point.y}</b>'
											    },
											    plotOptions: {
											        pie: {
											            allowPointSelect: true,
											            cursor: 'pointer',
											            depth: 0,
											            innerSize: 100,
											            dataLabels: {
											                enabled: true,
											                format: '{point.percentage:.1f}%'
											            },
											            showInLegend: true
											        }
											    },
											    series: [{
											        type: 'pie',
											        name: 'Referrals',
											        data: [
											            <s:property value="dcRefPendValues"/>
											        ]
											    }],
											    exporting: {
											        enabled: false
											    }
											});
										</script>
									</div>
								</s:if>
								<s:if test='"Yes".equalsIgnoreCase(dcRefRejectShow)'>
									<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 col-md-offset-4 col-lg-offset-4">
										<div id="containerRr"></div>
										<script language="JavaScript" type="text/javascript">
											Highcharts.chart('containerRr', {
											    chart: {
											        type: 'pie',
											        options3d: {
											            enabled: true,
											            alpha: 200,
											            beta: 0
											        }
											    },
											    title: {
											        text: 'Referral - Rejected'
											    },
											    subtitle: {
											        text: '(Current Year)'
											    },
											    accessibility: {
											        point: {
											            valueSuffix: '%'
											        }
											    },
											    tooltip: {
											        pointFormat: '<b>{point.percentage:.1f}%</b><br/>'+
											        'No Of Referrals : <b>{point.y}</b>'
											    },
											    plotOptions: {
											        pie: {
											            allowPointSelect: true,
											            cursor: 'pointer',
											            depth: 0,
											            innerSize: 100,
											            dataLabels: {
											                enabled: true,
											                format: '{point.percentage:.1f}%'
											            },
											            showInLegend: true
											        }
											    },
											    series: [{
											        type: 'pie',
											        name: 'Referrals',
											        data: [
											            <s:property value="dcRefRejectValues"/>
											        ]
											    }],
											    exporting: {
											        enabled: false
											    }
											});
										</script>
									</div>
								</s:if>
							</div>
						</div>
						<div id="barCharts" class="tab-pane fade in active">
							
								
								<s:if test='"Yes".equalsIgnoreCase(dcBPolicyProdShow)'>
									<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
										<div id="containerBPolicyProd"></div>
										<script language="JavaScript" type="text/javascript">
											var chartpP = new Highcharts.chart('containerBPolicyProd', {
												    chart: {
												        type: 'column',
												        options3d: {
												            enabled: true,
												            alpha: 0,
												            beta: 0,
												            depth: 0
												        }
												    },
												    title: {
												        text: 'PRODUCTION'
												    },
												    subtitle: {
												        text: '(Current Year)'
												    },
												    plotOptions: {
												        column: {
												            depth: 25
												        }
												    },
												    xAxis: {
												        categories: <s:property value="dcBPolicyProdValues"/>,
												        labels: {
												            skew3d: true,
												            style: {
												                fontSize: '16px'
												            }
												        }
												    },
												    yAxis: [{
												        title: {
												            text: 'No Of Policies'
												        },
												        labels: {
												            skew3d: true,
												            style: {
												                fontSize: '16px'
												            }
												        }
												    },{
												    	opposite: true,
												    	title: {
												            text: 'Total Premium'
												        },
												        labels: {
												            skew3d: true,
												            style: {
												                fontSize: '16px'
												            }
												        }
												    }],
												    series: [{
												        name: 'No Of Policies',
												        data: <s:property value="dcBPolicyProdCountValues"/>
												    },{
												    	name: 'Total Premium',
												        data: <s:property value="dcBPolicyProdPremiumValues"/>,
												        yAxis: 1
												    }],
												    exporting: {
												        enabled: false
												    }
												});
										</script>
									</div>
								</s:if>
							<s:if test='"Yes".equalsIgnoreCase(dcBQuoteProdShow)'>
									<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
										<div id="containerBQuoteProd"></div>
										<script language="JavaScript" type="text/javascript">
											var chartqP = new Highcharts.chart('containerBQuoteProd', {
												    chart: {
												        type: 'column',
												        options3d: {
												            enabled: true,
												            alpha: 0,
												            beta: 0,
												            depth: 0
												        }
												    },
												    title: {
												        text: 'QUOTATION'
												    },
												    subtitle: {
												        text: '(Current Year)'
												    },
												    plotOptions: {
												        column: {
												            depth: 25
												        }
												    },
												    xAxis: {
												        categories: <s:property value="dcBQuoteProdValues"/>,
												        labels: {
												            skew3d: true,
												            style: {
												                fontSize: '16px'
												            }
												        }
												    },
												    yAxis: [{
												        title: {
												            text: 'No Of Quotes'
												        },
												        labels: {
												            skew3d: true,
												            style: {
												                fontSize: '16px'
												            }
												        }
												    },{
												    	opposite: true,
												    	title: {
												            text: 'Total Premium'
												        },
												        labels: {
												            skew3d: true,
												            style: {
												                fontSize: '16px'
												            }
												        }
												    }],
												    series: [{
												        name: 'Count',
												        data: <s:property value="dcBQuoteProdCountValues"/>
												    },{
												    	name: 'Premium',
												        data: <s:property value="dcBQuoteProdPremiumValues"/>,
												        yAxis: 1
												    }],
												    exporting: {
												        enabled: false
												    }
												});
										</script>
									</div>
								</s:if>
							
							<s:if test='"Yes".equalsIgnoreCase(dcBPolicyShow) && !"User".equalsIgnoreCase(#session.usertype)'>
								<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
									<div id="containerBPolicy"></div>
									<script language="JavaScript" type="text/javascript">
										var chartp = new Highcharts.chart('containerBPolicy', {
											    chart: {
											        type: 'column',
											        options3d: {
											            enabled: true,
											            alpha: 0,
											            beta: 0,
											            depth: 0
											        }
											    },
											    title: {
											        text: 'BROKER PRODUCTION'
											    },
											    subtitle: {
											        text: '(Current Year)'
											    },
											    plotOptions: {
											        column: {
											            depth: 25
											        }
											    },
											    xAxis: {
											        categories: <s:property value="dcBPolicyBrokerValues"/>,
											        labels: {
											            skew3d: true,
											            style: {
											                fontSize: '16px'
											            }
											        }
											    },
											    yAxis: [{
											        title: {
											            text: 'No Of Policies'
											        },
											        labels: {
											            skew3d: true,
											            style: {
											                fontSize: '16px'
											            }
											        }
											    },{
											    	opposite: true,
											    	title: {
											            text: 'Total Premium'
											        },
											        labels: {
											            skew3d: true,
											            style: {
											                fontSize: '16px'
											            }
											        }
											    }],
											    series: [{
											        name: 'No Of Policies',
											        data: <s:property value="dcBPolicyCountValues"/>
											    },{
											    	name: 'Total Premium',
											        data: <s:property value="dcBPolicyPremiumValues"/>,
											        yAxis: 1
											    }],
											    exporting: {
											        enabled: false
											    }
											});
									</script>
								</div>
							</s:if>
							<s:if test='"Yes".equalsIgnoreCase(dcBQuoteShow) && !"User".equalsIgnoreCase(#session.usertype)'>
								<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
									<div id="containerBQuote"></div>
									<script language="JavaScript" type="text/javascript">
										var chartq = new Highcharts.chart('containerBQuote', {
											    chart: {
											        type: 'column',
											        options3d: {
											            enabled: true,
											            alpha: 0,
											            beta: 0,
											            depth: 0
											        }
											    },
											    title: {
											        text: 'BROKER QUOTATION'
											    },
											    subtitle: {
											        text: '(Current Year)'
											    },
											    plotOptions: {
											        column: {
											            depth: 25
											        }
											    },
											    xAxis: {
											        categories: <s:property value="dcBQuoteBrokerValues"/>,
											        labels: {
											            skew3d: true,
											            style: {
											                fontSize: '16px'
											            }
											        }
											    },
											    yAxis: [{
											        title: {
											            text: 'No Of Quotes'
											        },
											        labels: {
											            skew3d: true,
											            style: {
											                fontSize: '16px'
											            }
											        }
											    },{
											    	opposite: true,
											    	title: {
											            text: 'Total Premium'
											        },
											        labels: {
											            skew3d: true,
											            style: {
											                fontSize: '16px'
											            }
											        }
											    }],
											    series: [{
											        name: 'Count',
											        data: <s:property value="dcBQuoteCountValues"/>
											    },{
											    	name: 'Premium',
											        data: <s:property value="dcBQuotePremiumValues"/>,
											        yAxis: 1
											    }],
											    exporting: {
											        enabled: false
											    }
											});
									</script>
								</div>
							</s:if>
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<div class=" " style="background-color:#007ec1;color:white" align="center">
								<h3 class="" >REFERRAL REQUEST OF USER</h3>					
							</div>
							</div>
							<s:if test='"Yes".equalsIgnoreCase(dcBRefPendShow)'>
								<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
									<div id="containerBRefPend"></div>
									<script language="JavaScript" type="text/javascript">
										var chartrp = new Highcharts.chart('containerBRefPend', {
											    chart: {
											        type: 'column',
											        options3d: {
											            enabled: true,
											            alpha: 0,
											            beta: 0,
											            depth: 0
											        }
											    },
											    title: {
											        text: 'Referral - Pending'
											    },
											    subtitle: {
											        text: '(Current Year)'
											    },
											    plotOptions: {
											        column: {
											            depth: 25
											        }
											    },
											    xAxis: {
											        categories: <s:property value="dcBRefPendBrokerValues"/>,
											        labels: {
											            skew3d: true,
											            style: {
											                fontSize: '16px'
											            }
											        }
											    },
											    yAxis: [{
											        title: {
											            text: 'No Of Referrals'
											        },
											        labels: {
											            skew3d: true,
											            style: {
											                fontSize: '16px'
											            }
											        }
											    }],
											    series: [{
											        name: 'No Of Referrals',
											        data: <s:property value="dcBRefPendCountValues"/>
											    }],
											    exporting: {
											        enabled: false
											    }
											});
									</script>
								</div>
							</s:if>
							<s:if test='"Yes".equalsIgnoreCase(dcBRefCompShow)'>
								<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
									<div id="containerBRefComp"></div>
									<script language="JavaScript" type="text/javascript">
										var chartrc = new Highcharts.chart('containerBRefComp', {
											    chart: {
											        type: 'column',
											        options3d: {
											            enabled: true,
											            alpha: 0,
											            beta: 0,
											            depth: 0
											        }
											    },
											    title: {
											        text: 'Referral - Approved'
											    },
											    subtitle: {
											        text: '(Current Year)'
											    },
											    plotOptions: {
											        column: {
											            depth: 25
											        }
											    },
											    xAxis: {
											        categories: <s:property value="dcBRefCompBrokerValues"/>,
											        labels: {
											            skew3d: true,
											            style: {
											                fontSize: '16px'
											            }
											        }
											    },
											    yAxis: [{
											        title: {
											            text: 'No Of Referrals'
											        },
											        labels: {
											            skew3d: true,
											            style: {
											                fontSize: '16px'
											            }
											        }
											    }],
											    series: [{
											        name: 'No Of Referrals',
											        data: <s:property value="dcBRefCompCountValues"/>
											    }],
											    exporting: {
											        enabled: false
											    }
											});
									</script>
								</div>
							</s:if>
							<s:if test='"Yes".equalsIgnoreCase(dcBRefRejectShow)'>
								<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
									<div id="containerBRefReject"></div>
									<script language="JavaScript" type="text/javascript">
										var chartrr = new Highcharts.chart('containerBRefReject', {
											    chart: {
											        type: 'column',
											        options3d: {
											            enabled: true,
											            alpha: 0,
											            beta: 0,
											            depth: 0
											        }
											    },
											    title: {
											        text: 'Referral - Rejected'
											    },
											    subtitle: {
											        text: '(Current Year)'
											    },
											    plotOptions: {
											        column: {
											            depth: 25
											        }
											    },
											    xAxis: {
											        categories: <s:property value="dcBRefRejectBrokerValues"/>,
											        labels: {
											            skew3d: true,
											            style: {
											                fontSize: '16px'
											            }
											        }
											    },
											    yAxis: [{
											        title: {
											            text: 'No Of Referrals'
											        }
											    }],
											    series: [{
											        name: 'No Of Referrals',
											        data: <s:property value="dcBRefRejectCountValues"/>
											    }],
											    exporting: {
											        enabled: false
											    }
											});
									</script>
								</div>
							</s:if>
						    <script language="JavaScript" type="text/javascript">
								function showValues() {
									try{
									    $('#alpha-value').html(chartqP.options.chart.options3d.alpha);
									    $('#beta-value').html(chartqP.options.chart.options3d.beta);
									    $('#depth-value').html(chartqP.options.chart.options3d.depth);
									}catch(err){ console.log(err)}
									try{
									    $('#alpha-value').html(chartpP.options.chart.options3d.alpha);
									    $('#beta-value').html(chartpP.options.chart.options3d.beta);
									    $('#depth-value').html(chartpP.options.chart.options3d.depth);
									}catch(err){ console.log(err)}
									try{
									    $('#alpha-value').html(chartq.options.chart.options3d.alpha);
									    $('#beta-value').html(chartq.options.chart.options3d.beta);
									    $('#depth-value').html(chartq.options.chart.options3d.depth);
									}catch(err){ console.log(err)}
									try{
									    $('#alpha-value').html(chartp.options.chart.options3d.alpha);
									    $('#beta-value').html(chartp.options.chart.options3d.beta);
									    $('#depth-value').html(chartp.options.chart.options3d.depth);
									}catch(err){ console.log(err)}
									try{
									    $('#alpha-value').html(chartrp.options.chart.options3d.alpha);
									    $('#beta-value').html(chartrp.options.chart.options3d.beta);
									    $('#depth-value').html(chartrp.options.chart.options3d.depth);
									}catch(err){ console.log(err)}
									try{
									    $('#alpha-value').html(chartrc.options.chart.options3d.alpha);
									    $('#beta-value').html(chartrc.options.chart.options3d.beta);
									    $('#depth-value').html(chartrc.options.chart.options3d.depth);
									}catch(err){ console.log(err)}
									try{
									    $('#alpha-value').html(chartrr.options.chart.options3d.alpha);
									    $('#beta-value').html(chartrr.options.chart.options3d.beta);
									    $('#depth-value').html(chartrr.options.chart.options3d.depth);
									}catch(err){ console.log(err)}
								}
	
								// Activate the sliders
								$('#sliders input').on('input change', function () {
									try{
									    chartqP.options.chart.options3d[this.id] = parseFloat(this.value);
									    showValues();
									    chartqP.redraw(false);
									}catch(err){ console.log(err)}
									try{
									    chartpP.options.chart.options3d[this.id] = parseFloat(this.value);
									    showValues();
									    chartpP.redraw(false);
									}catch(err){ console.log(err)}
									try{
									    chartq.options.chart.options3d[this.id] = parseFloat(this.value);
									    showValues();
									    chartq.redraw(false);
									}catch(err){ console.log(err)}
									try{
									    chartp.options.chart.options3d[this.id] = parseFloat(this.value);
									    showValues();
									    chartp.redraw(false);
									}catch(err){ console.log(err)}
									try{
									    chartrp.options.chart.options3d[this.id] = parseFloat(this.value);
									    showValues();
									    chartrp.redraw(false);
									}catch(err){ console.log(err)}
									try{
									    chartrc.options.chart.options3d[this.id] = parseFloat(this.value);
									    showValues();
									    chartrc.redraw(false);
									}catch(err){ console.log(err)}
									try{
									    chartrr.options.chart.options3d[this.id] = parseFloat(this.value);
									    showValues();
									    chartrr.redraw(false);
									}catch(err){ console.log(err)}
								});
	
								showValues();
						    </script>
						</div>
 					</div>
				</div>
				
		    
				 </s:if>
				
			</div>
		</div>
		<s:if test='("40".equalsIgnoreCase(#session.product_id) || "42".equalsIgnoreCase(#session.product_id) || "3".equalsIgnoreCase(#session.product_id) || "11".equalsIgnoreCase(#session.product_id))'>
		<!-- <div class="panel panel-primary">			
			<div class="panel-body"> -->
			<s:if test='topBrokerList.size()>0 && ("RSAIssuer".equalsIgnoreCase(#session.usertype) || "Broker".equalsIgnoreCase(#session.usertype))'> 
			<s:set var="format" value="%{'number.format.2'}"/>
			<div class="row" style="padding:13px;">
			<div class="panel panel-primary">			
			<div class="panel-body">
			<div class="col-sm-12" style="background-color:white;">
			<div class=" " style="">
				<h3 class="panel-head"><s:if test='"Broker".equalsIgnoreCase(#session.usertype)'>TOP 10 USER PRODUCTION</s:if><s:else>TOP 10 BROKER PRODUCTION</s:else></h3>					
			</div>
			<!-- <h4 class="nav-colr" style="padding-top: 5px;">TOP 10 BROKER PRODUCTION<h4> -->
			<div class="scrollbar">
		    <div class="overflow">
		     <table class="table table-striped table-bordered" id="record" width="100%" cellspacing="0">
				  <thead>
					<tr style="background-color:#007ec1;color:white">
					  <th width="10%"></th>
					  <th width="45%">Broker Name</th>
					  <th width="25%">Total Policies</th>
					 	  <th align="right" width="15%">Total Amount</th>
					</tr>
				  </thead>
				  <tbody>
				  	<s:iterator value="topBrokerList" status="stat" var="record">
						<tr>
						  <th scope="row"><s:property value="%{#stat.index+1}" /></th>
						  <td><s:property value="Name" /></td>
						<td><s:property value="Count" /></td>
						  <td align="right"><s:property value="%{getText(#format,{@java.lang.Double@parseDouble(Premium)})}" /></td>
						</tr>
					</s:iterator>
				  </tbody>
				</table>
				</div>
				</div>
				<br>
		    </div>
		    </div>
		    </div>
			</div>
			 </s:if>
			 <s:if test='topCustomerList.size()>0 && ("User".equalsIgnoreCase(#session.usertype) || "Broker".equalsIgnoreCase(#session.usertype))'> 
			<s:set var="format" value="%{'number.format.2'}"/>
			<div class="row" style="padding:13px">
			<div class="panel panel-primary">			
			<div class="panel-body">
			<div class="col-sm-12" style="background-color:white;">
			<div class=" " style="">
				<h3 class="panel-head">TOP 10 CUSTOMER PRODUCTION</h3>					
			</div>
			<!-- <h4 class="nav-colr" style="padding-top: 5px;">TOP 10 BROKER PRODUCTION<h4> -->
			<div class="scrollbar">
		    <div class="overflow">
		     <table class="table table-striped table-bordered" id="record" width="100%" cellspacing="0">
				  <thead>
					<tr style="background-color:#007ec1;color:white">
					  <th width="10%"></th>
					  <th width="45%">Customer Name</th>
					 <th width="25%">Total Policies</th>
					  <th align="right" width="15%">Total Amount</th>
					</tr>
				  </thead>
				  <tbody>
				  	<s:iterator value="topCustomerList" status="stat" var="record">
						<tr>
						  <th scope="row"><s:property value="%{#stat.index+1}" /></th>
						  <td><s:property value="Name" /></td>
						 <td><s:property value="Count" /></td>
						  <td align="right"><s:property value="%{getText(#format,{@java.lang.Double@parseDouble(Premium)})}" /></td>
						</tr>
					</s:iterator>
				  </tbody>
				</table>
				</div>
				</div>
				<br>
		    </div>
		    </div>
		    </div>
			</div>
			 </s:if>
		<s:if test='topReferralsList.size()>0'> 
			<div class="row" style="padding:13px;">
			<div class="panel panel-primary">			
			<div class="panel-body">
			<div class="col-sm-12" style="background-color:white;">
			<div class=" " style="">
				<h3 class="panel-head">LAST 10 REFERRAL REQUEST OF USER</h3>
			</div>
			<!-- <h4 class="nav-colr" style="padding-top: 5px;">TOP 10 BROKER PRODUCTION<h4> -->
			<div class="scrollbar">
		    <div class="overflow">
		     <table class="table table-striped table-bordered" id="record" width="100%" cellspacing="0">
				  <thead>
					<tr style="background-color:#007ec1;color:white">
					  <th width="2%"></th>
					  <s:if test='!("User".equalsIgnoreCase(#session.usertype) || "Broker".equalsIgnoreCase(#session.usertype))'>
					  <th width="15%">Broker Name</th>
					  </s:if>
					  <th width="15%">User Name</th>
					  <th width="15%">Insured Name</th>
					  <th width="10%">Product Name</th>
					  <th width="15%">Quote No</th>
					  <th width="10%">Referred Date and Time</th>
					  <th width="5%">Status</th>
					  <th width="10%">TAT</th>
					</tr>
				  </thead>
				  <tbody>
				  	<s:iterator value="topReferralsList" status="stat" var="record">
						<tr>
						  <th scope="row"><s:property value="%{#stat.index+1}" /></th>
						  <s:if test='!("User".equalsIgnoreCase(#session.usertype) || "Broker".equalsIgnoreCase(#session.usertype))'>
						  <td><s:property value="Name" /></td>
						  </s:if>
						  <td><s:property value="LoginId" /></td>
						  <td><s:property value="CustomerName" /></td>
						  <td><s:property value="ProductName" /></td>
						  <td><s:property value="QuoteNo" /></td>
						  <td><s:property value="ReferralUpdate" /></td>
						  <td><s:property value="ReferralStatus" /></td>
						  <td><s:property value="TimeDifference" /></td>
						</tr>
					</s:iterator>
				  </tbody>
				</table>
				</div>
				</div>
				<br>
		    </div>
		    </div>
		    </div>
			</div>
			 </s:if>	
		
				</s:if>
	</s:elseif>
	</div>
</div>
<s:hidden name="quoteNo" ></s:hidden>
<s:hidden name="policyNo" ></s:hidden>
<s:hidden name="quoteStatus" ></s:hidden>
<s:hidden name="tranId" ></s:hidden>
<s:hidden name="menuType"></s:hidden> 
<s:hidden name="applicationNo" ></s:hidden>
<s:hidden name="referenceNo" ></s:hidden>
<s:hidden name="linkType" ></s:hidden>
<s:hidden name="endTypeId" ></s:hidden>
<s:hidden name="endStatus" ></s:hidden>
<s:hidden name="custName" ></s:hidden>
<s:hidden name="brokerCompany" ></s:hidden>
<s:hidden name="searchFrom" ></s:hidden>
<s:hidden name="customerId" ></s:hidden>
<s:hidden name="searchFrom" ></s:hidden>
<s:hidden name="display" ></s:hidden>
<s:hidden name="reqFrm" ></s:hidden>
<s:hidden name="reqFrom" ></s:hidden>
<s:hidden name="selRow" id="selRow"/>
<s:hidden name="endtLoginId"/>
<s:hidden name="contentTypeId"/>
<s:hidden name="endtView" />
<s:hidden name="vehicleId"/>
<s:hidden name="menuBlocker"/>
<s:hidden name="lapsedmenu"/>
<s:token/>
</s:form>
</body>
<script type="text/javascript">
<s:if test='"ET".equals(menuType)' >
toggleConfirm();
</s:if>


function proceedEndtFun(url) { 
	document.getElementById('proceedEndt').disabled=true;
	document.report.action='<%=request.getContextPath()%>'+url;
	document.report.submit();
	return false;
}

function getSchedule(val) {
	<%-- var URL ='<%=request.getContextPath()%>/Copyofinformation.jsp?policyMode=schedule&policynumber='+val; --%>
	var quoteNo=window.btoa(val);
	var docType=window.btoa('schedule');
	var URL ='<%=request.getContextPath()%>/documentpdfReport.action?quoteNo='+quoteNo+'&docType='+docType;
	var bwidth = window.innerWidth;
	var bwidth1 = document.body.clientWidth;
	if(bwidth <= 768) {
		return popUp(URL,bwidth1,'500');
	} else {
		return popUp(URL,'750','500');
	}
}
function getpolicyWording(val) {
	var quoteNo=window.btoa(val);
	var docType=window.btoa('clauses');
	var URL ='<%=request.getContextPath()%>/documentpdfReport.action?quoteNo='+quoteNo+'&docType='+docType;
	var bwidth = window.innerWidth;
	var bwidth1 = document.body.clientWidth;
	if(bwidth <= 768) {
		return popUp(URL,bwidth1,'500');
	} else {
		return popUp(URL,'750','500');
	}
}
function getPortalSchedule(val) {
	<%-- var URL ='<%=request.getContextPath()%>/Copyofinformation.jsp?policyMode=schedule&policynumber='+val; --%>
	var quoteNo=window.btoa(val);
	var docType=window.btoa('portalPdf');
	var URL ='<%=request.getContextPath()%>/documentpdfReport.action?quoteNo='+quoteNo+'&docType='+docType;
	var bwidth = window.innerWidth;
	var bwidth1 = document.body.clientWidth;
	if(bwidth <= 768) {
		return popUp(URL,bwidth1,'500');
	} else {
		return popUp(URL,'750','500');
	}
}
function getDebit(val) {
	<%-- var URL ='<%=request.getContextPath()%>/Copyofinformation.jsp?policyMode=debit&policynumber='+val; --%>
	var URL ='<%=request.getContextPath()%>/documentpdfReport.action?policyNo='+val+'&docType=debit';
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
function getSchedule1(val) {
	var URL ='<%=request.getContextPath()%>/PdfSummary_Schedule.Travel?quoteNo='+val;
	var bwidth = window.innerWidth;
	var bwidth1 = document.body.clientWidth;
	if(bwidth <= 768) {
		return popUp(URL,bwidth1,'500');
	} else {
		return popUp(URL,'750','500');
	}
}
function getDebit1(val) {
	var URL ='<%=request.getContextPath()%>/PdfSummary_Debit.Travel?quoteNo='+val;
	var bwidth = window.innerWidth;
	var bwidth1 = document.body.clientWidth;
	if(bwidth <= 768) {
		return popUp(URL,bwidth1,'500');
	} else {
		return popUp(URL,'750','500');
	}
}
function getDebit2(val) {
	var URL ='<%=request.getContextPath()%>/Copyofinformation.jsp?policyMode=debitMultiple&policynumber='+val;
	var bwidth = window.innerWidth;
	var bwidth1 = document.body.clientWidth;
	if(bwidth <= 768) {
		return popUp(URL,bwidth1,'500');
	} else {
		return popUp(URL,'750','500');
	}
}
function getReceipt(val) {
	var URL ='<%=request.getContextPath()%>/PdfSummary_Receipt.Travel?quoteNo='+val;
	var bwidth = window.innerWidth;
	var bwidth1 = document.body.clientWidth;
	if(bwidth <= 768) {
		return popUp(URL,bwidth1,'500');
	} else {
		return popUp(URL,'750','500');
	}
}
function getCredit(loginId,val) {
	/* var URL ='Copyofinformation.jsp?policyMode=credit&loginid='+loginId+'&policynumber='+val; */
	var URL ='<%=request.getContextPath()%>/documentpdfReport.action?policyNo='+val+'&docType=credit';
	var bwidth = window.innerWidth;
	var bwidth1 = document.body.clientWidth;
	if(bwidth <= 768) {
		return popUp(URL,bwidth1,'500');
	} else {
		return popUp(URL,'750','500');
	}
}
function getPrint1(val) {
	var URL ='<%=request.getContextPath()%>/PdfSummary_Draft.Travel?quoteNo='+val;
	var bwidth = window.innerWidth;
	var bwidth1 = document.body.clientWidth;
	if(bwidth <= 768) {
		return popUp(URL,bwidth1,'500');
	} else {
		return popUp(URL,'750','500');
	}
}
function getMultiSchedule(val) {
	var URL ='<%=request.getContextPath()%>/Copyofinformation.jsp?policyMode=scheduleMultiple&policynumber='+val;
	var bwidth = window.innerWidth;
	var bwidth1 = document.body.clientWidth;
	if(bwidth <= 768) {
		return popUp(URL,bwidth1,'500');
	} else {
		return popUp(URL,'750','500');
	}
}
function exportdata(val) {
	document.report.downloadType.value=val;	
	document.report.action='<%=request.getContextPath()%>/reportReport.action';	
	document.report.submit();
}
function editQuote(applicationNo,quoteNo, status,customerId, contentTypeId) { 
	document.report.quoteNo.value=quoteNo;
	document.report.quoteStatus.value=status;
	document.report.applicationNo.value=applicationNo;
	document.report.referenceNo.value=applicationNo;
	if(30=='<s:property value="#session.product_id"/>') {
		document.report.contentTypeId.value = contentTypeId;
		if(status!='RA') {
			document.report.display.value='getQuote';
		}
		document.report.action = "<%=request.getContextPath()%>/initHome.action";
	} else if(65=='<s:property value="#session.product_id"/>') {
		document.report.action = "<%=request.getContextPath()%>/editQuoteMotor.action";
	} else if(3=='<s:property value="#session.product_id"/>' || 11=='<s:property value="#session.product_id"/>') {
		document.report.action = "<%=request.getContextPath()%>/editQuoteQuotation.action";
	}else if(33 == '<s:property value="#session.product_id"/>'){
		if(status!='RA') {
			document.report.action = "<%=request.getContextPath()%>/initTravel.action";
			document.report.display.value='getQuote';
		}else{
			document.report.action = "<%=request.getContextPath()%>/showQuoteTravel.action";
		}
	}
	document.report.submit();
}
function declaration(tranId)
{
	document.report.tranId.value=tranId;
	document.report.menuType.value='D';
	document.report.reqFrom.value='declare';
	document.report.action = "<%=request.getContextPath()%>/initDeclaration.action";
	document.report.submit();
}
function forward(menuType)
{
	document.report.menuType.value=menuType;
	document.report.action = "<%=request.getContextPath()%>/initReport.action";
	document.report.submit();
}
function userSelectReport(obj)
{ 		
	if(document.report.searchValue){
	
		document.report.searchValue.value='';
	}
	if(obj.value==''){
	
		document.report.loginId.value='<s:property value="#session.user"/>';	
	}else{
	
	document.report.userLoginId.value=obj.value;	
	}
			
	document.report.action='<%=request.getContextPath()%>/initReport.action';	
	document.report.submit();
}

function forwardReport(menuType)
{
    document.report.menuType.value=menuType;
	document.report.action='<%=request.getContextPath()%>/initReport.action';	
	document.report.submit();	
}
function viewQuote(val)
{
	<%-- var URL ='<%=request.getContextPath()%>/QuotePrint.pdfSchedule?quote_no='+val+'&reqFrom=QuotePrint'; --%>
	var URL='<%=request.getContextPath()%>/documentpdfReport.action?quoteNo='+val+'&docType=print';
	var windowName = "QuotatiionPrint";
	var width  = screen.availWidth;
	var height = screen.availHeight;
	var bwidth = window.innerWidth;
	var bwidth1 = document.body.clientWidth;
	if(bwidth <= 768) {
		var w = bwidth1;
		var h =	500;
	} else {
		var w = 750;
		var h =	500;
	}
	var features =
		'width='          + w +
		',height='		  + h +
		',left='		  + ((width - w - 10) * .5)  +
		',top='			  + ((height - h - 30) * .5) +
		',directories=no' +
		',location=no'	  +
		',menubar=no'	  +
		',scrollbars=yes' +
		',status=no'	  +
		',toolbar=no'	  +
		',resizable=false';
	var strOpen = window.open (URL, windowName, features);
	strOpen.focus();
	return false;
}
function sentMail(val)
{
	document.report.scrnFrom.value = "QuoteRegister";
	document.report.quote_no.value=val;
	document.report.action="mailController";
	document.report.submit();
}
function sentEMail(applicationNo,linkType,quoteNo)
{
	document.report.menuType.value='<s:property value="%{menuType}" />';
	document.report.applicationNo.value=applicationNo;
	document.report.linkType.value=linkType;
	document.report.quoteNo.value=quoteNo;		
	document.report.action='<%=request.getContextPath()%>/mailReport.action';
	document.report.submit();
}
function delQuotes(val)
{
	document.report.quote_no.value=val;
	document.report.action='<%=request.getContextPath()%>/LapsedQuote1.jsp';
	document.report.submit();
}
function lapsedQuotes(val)
{
	document.report.quote_no.value=val;
	document.report.action='<%=request.getContextPath()%>/lapsedReport.action';
	document.report.submit();
}
function view(appNo,quoteNo,productId)
{
	if(productId=='3' || productId=='11'){
		popUp('\quotationSchedule.jsp?quoteNo='+quoteNo,650,650);
	}else
	{
		popUp('<%=request.getContextPath()%>/viewTravel.action?quoteNo='+quoteNo+'&applicationNo='+appNo+'&selection=profile',650,650);
	}
}
function redirect(url)
{
	document.report.action='<%=request.getContextPath()%>'+url;
	//document.report.submit();
}
function endorsement(menuType, quoteNo, policyNo, custName, brokerCompany, loginId, vehicleId)
{
	document.report.brokerCompany.value=brokerCompany;
	document.report.custName.value=custName;
	document.report.quoteNo.value=quoteNo;
	document.report.policyNo.value=policyNo;
	document.report.menuType.value=menuType;
	document.report.endtLoginId.value=loginId;
	document.report.vehicleId.value=vehicleId;
	document.report.action = "<%=request.getContextPath()%>/initReport.action";
	document.report.submit();
}
function endorsementType(menuType, endStatus, typeId, quoteNo, status, applicationNo)
{
	document.report.applicationNo.value=applicationNo;
	document.report.quoteNo.value=quoteNo;
	document.report.menuType.value=menuType;
	document.report.endTypeId.value=typeId;
	document.report.endStatus.value=endStatus;
	document.report.quoteStatus.value=status;
	if(status=='ReferalApproved' || status=='RA'){ //if(status=='RA'){
		document.report.quoteStatus.value='RA';
		document.report.action = "<%=request.getContextPath()%>/initPremium.action";
	}else{
		document.report.action = "<%=request.getContextPath()%>/initReport.action";
	}
	document.report.submit();
}
function endorsementTypeNew(menuType, endStatus)
{
	document.report.menuType.value=menuType;
	document.report.endStatus.value=endStatus;
	document.report.endTypeId.value='';
	document.report.action = "<%=request.getContextPath()%>/initReport.action";
	document.report.submit();
}

function travelEndorsement(menuType, quoteNo, policyNo, custName, brokerCompany, loginId, vehicleId)
{
	document.report.brokerCompany.value=brokerCompany;
	document.report.custName.value=custName;
	document.report.quoteNo.value=quoteNo;
	document.report.policyNo.value=policyNo;
	document.report.menuType.value=menuType;
	document.report.endtLoginId.value=loginId;
	document.report.vehicleId.value=vehicleId;
	document.report.action = "<%=request.getContextPath()%>/initReport.action";
	document.report.submit();
}
function searchByPolicy()
{
	if(document.report.searchValue.value==''){
		alert('Please enter Policy No to search');
		return false;
	}
}
function searchByQuote()
{
	if(document.report.searchValue.value==''){
		alert('Please enter Quote No to search');
		return false;
	}
}
function toggleConfirm(){
	try{
		var status=document.getElementById('41').checked;
		if(status){
		   document.getElementById('toggle').style.display="";
		   document.getElementById('cancelRemarks').style.display="";
		   
		   document.getElementById('toggleEndt').style.display="none";
		   document.getElementById('endtRemarks').style.display="none";
		}else{
		   document.getElementById('toggle').style.display="none";
		   document.getElementById('cancelRemarks').style.display="none";
		   
		   document.getElementById('toggleEndt').style.display="";
		   document.getElementById('endtRemarks').style.display="";
		} 
	}catch(err){}
	
}
/* function toggleConfirm(){
	var status=document.getElementById('41').checked;
	if(status){
	   document.getElementById('toggle').style.display="";
	   document.getElementById('cancelRemarks').style.display="";
	   document.getElementById('toggleCaption').style.display="";
	   
	}else{
	   document.getElementById('toggle').style.display="";
	   document.getElementById('cancelRemarks').style.display="";
	   document.getElementById('toggleCaption').style.display="none";
	   document.forms['report'].cancelYN.value ='N'; 
	} 
}*/

function lcupload(policyNo){
	document.report.policyNo.value = policyNo; 
	document.report.action = "<%=request.getContextPath()%>/lcUploadReport.action";
	document.report.submit();
}
function claim(vehicleId){
	document.forms['report'].vehicleId.value = vehicleId;
	document.forms['report'].action = "<%=request.getContextPath()%>/intimateClaim.action";
	document.forms['report'].submit();
}
function motorOtherEndorsement(vehicleId){
    document.forms['report'].vehicleId.value = vehicleId;
	document.forms['report'].action = "<%=request.getContextPath()%>/endorsementClaim.action";
	document.forms['report'].submit();
}
function viewCorrection(quoteNo,appNo){
	document.report.quoteNo.value=quoteNo;
	document.report.applicationNo.value=appNo;
	document.report.action = "<%=request.getContextPath()%>/viewTravel.action";
	document.report.submit();
}
function viewPopUp(URL) {
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
function policyView(applicationNo,status,remarks)
{
	document.report.applicationNo.value=applicationNo;
	document.report.referenceNo.value=applicationNo;
	document.report.quoteStatus.value=status;
	document.report.endtView.value='endt';
	document.report.action='<%=request.getContextPath()%>/viewQuotePremium.action';
	document.report.submit();
}
function downloadError(val)
{  
    document.report.tranId.value=val;
	document.report.action="<%=request.getContextPath()%>/errorOpenUpload.action";
	document.report.submit();
}

function downloadSuccess(val)
{
	document.report.tranId.value=val;
	document.report.action="<%=request.getContextPath()%>/downloadOpenUpload.action";
	document.report.submit();
}
function uploadDocuments(vehicleId,appNo,quoteNo,mode) {
	var URL ='<%=request.getContextPath()%>/documentUploadDoUpload.action?applicationNo='+appNo+'&quoteNo='+quoteNo+'&deleteVehicleId='+vehicleId+'&mode='+mode;
	return popUp(URL,'700','500');
}	
function barAdj(id,id1){
	if(id == 'bar'){
		document.getElementById(''+id1+'').style.display = 'block';
	}else{
		document.getElementById(''+id1+'').style.display = 'none';
	}
	
}
</script>
</html>