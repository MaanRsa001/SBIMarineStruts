 <%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" import="com.maan.report.service.ReportService"%>
<!DOCTYPE HTML>
<html>
<head>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.responsive.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.jqueryui.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.tableTools.css">
	<link href="<%=request.getContextPath()%>/dataTables/css/jquery-start-ui.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datepicker/jquery-ui.css">
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.jqueryui.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.responsive.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.tableTools.js"></script>
	<script src="<%=request.getContextPath()%>/datepicker/jquery-ui.js"></script>
	<script type="text/javascript">
  	jQuery(function ($) {
  		try {
  			var data = $('.display').dataTable( {
				"lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
				"order": [[ 0, "desc" ]],
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
<s:form name="report" theme="simple" action="initReport.action?menuType=P">
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<s:actionerror cssStyle="color: red;" />
	</div>
</div>
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="declaration.%{menuType}" />
			</div>
			<div class="panel-body">
				<s:if test='menuType=="D"'>
	  				<s:if test='policyList.size > 0 && "details".equals(listType)'>
	  					<div class="row">
					 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
					 			<div class="textV">
						 			<s:text name="Transaction Id"/>
						 		</div>
						 		<div class="tboxV">
						 			<span style="color:blue;"><s:property value="tranId"/>pan>									 		
						 		</div>
					 		</div>
					 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
					 			<div class="textV">
						 			<s:text name="Consignee Name"/>
						 		</div>
						 		<div class="tboxV">
						 			<span style="color:blue;"><s:property value="supplier"/></span>					 		
						 		</div>
					 		</div>
					 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
					 			<div class="textV">
						 			<s:text name="Vessel Name"/>
						 		</div>
						 		<div class="tboxV">
						 			<span style="color:blue;"><s:property value="vessel"/></span>									 		
						 		</div>
					 		</div>
					 	</div>
					 	<br class="clear" />
					 	<div class="row">SDFSDSDFSDFSDFSDFDSFSD
					 		<div class="col-xs-12">
					 			<table class="display responsive no-wrap" id="gridTable" width="100%" cellspacing="0">
					 				<thead>
					 					<tr>
					 						<th><s:text name="declaration.select" /></th>
											<th><s:text name="declaration.quoteNo" /></th>
											<th><s:text name="declaration.customerName" /></th>
											<th><s:text name="declaration.sumInsured" /></th>
											<th><s:text name="declaration.premium" /></th>
											<th><s:text name="declaration.status" /></th>
											<th><s:text name="declaration.draft" /></th>
					 					</tr>
					 				</thead>
					 				<tbody>
					 				<s:iterator value="policyList" status="status" var="policyList">
					 					<tr>
					 						<td align="center" width="5%">
												<s:if test='#policyList.PACKAGE_DESCRIPTION =="0"'>
												<s:property value="%{#policyList.SELECTED}"/><s:checkbox  name="selectedQuote" id="selectedQuote" value="%{#policyList.SELECTED}" fieldValue="%{#policyList.QUOTE_NO}"/><s:hidden  name="quoteNo" value="%{#policyList.QUOTE_NO}"/>
												</s:if>
											</td>
											<td width="15%"><s:property value="%{#policyList.QUOTE_NO}"/></td>
											<td width="30%"><s:property value="%{#policyList.FIRST_NAME}"/></td>
											<td width="10%" align="right"><s:property value="%{#policyList.TOTAL_SUM_INSURED}"/></td>
											<td width="10%" align="right"><s:property value="%{#policyList.PREMIUM}"/></td>
											<s:if test='#policyList.PACKAGE_DESCRIPTION =="0"'>
												<td width="10%"><s:label key="declartion.completed"></s:label></td>
												<td width="10%"><a href="#" onclick="return popUp('<%=request.getContextPath()%>/Copy of information Admin.jsp?policyMode=draft&policynumber=<s:property value="%{#policyList.QUOTE_NO}"/>&loginid=<s:property value="%{#session.userName}"/>&productTypeIds=<s:property value="%{#session.product_id}"/>','1000','500')"><s:label key="declartion.draft"/></a></td>
											</s:if>
											<s:else>
												<td width="10%"><s:label key="declartion.missing"></s:label></td>
												<td width="10%"><s:label key="declartion.na"></s:label></td>
											</s:else>
					 					</tr>
					 				</s:iterator>
					 				</tbody>							  		
								</table>
					 		</div>
					 	</div>
					 	<br class="clear" />
					 	<div class="row">
					 		<div class="col-xs-6" align="center">
					 			<s:submit type="button" name="close"  key="Back" cssClass="btn btn-sm btn-danger" onclick="forward('KD')"/>								
					 		</div>
					 		<div class="col-xs-6" align="center">
					 			<s:submit type="submit" name="submit" key="Submit" onclick="forward('MD')" cssClass="btn btn-sm btn-success"/>
					 		</div>
					 	</div>
	  				</s:if>
	  				<s:elseif test='policyList.size > 0 && "result".equals(reqFrom)'>
	  					<div class="row">
	  						<div class="col-xs-12">
	  							<table width="100%" class="footable">
	  								<thead>
					  			   		<s:set var="tid" value=""/>
										<s:set var="sname" value=""/>
										<s:if test='%{"admin".equals(#session.user1)}'>
							          		<s:set var="format" value="%{'number.format.2'}"/>
							          	</s:if>
							          	<s:else>
							          		<s:set var="format" value="%{'number.format.'+#session.CurrencyDecimal}"/>
							          	</s:else>
							          	<tr>
							          		<th colspan="5" align="center"><b>Transaction Id</b>&nbsp;:&nbsp;<s:property value="tranId"/></th>
							          	</tr>
						          	</thead>
				  			   		<s:iterator value="policyList" status="status" var="mainpolicyList">
									  		<thead>
											  	<tr class="heading">
										  			<th colspan="5">Consignee Name: &nbsp;<s:property value="supplier_name"/></th>
										  		</tr>
									  		</thead>
										  	<s:set var="tid" value="%{#mainpolicyList.TRANSACTION_ID}"/>
										  	<s:set var="sname" value="%{#mainpolicyList.supplier_name}"/>
										  	<tbody>
					  			   			<s:iterator value="policyList" status="stat" var="subpolicyList">
					  			   				<s:if test='%{#subpolicyList.TRANSACTION_ID==#mainpolicyList.TRANSACTION_ID && #subpolicyList.supplier_name==#mainpolicyList.supplier_name}'>
					  			   					<tr class="bg">
					  			   						<td width="10%"></td>
					  			   						<td width="40%"><s:property value="subpolicyList.VESSEL_NAME" /></td>
					  			   						<td width="20%" align="center"><a href="#" class="btn btn-sm btn-info" onclick="getVesselDeclare('<s:property value="VESSEL_NAME" />','<s:property value="TRANSACTION_ID" />','<s:property value="supplier_name" />');"><s:property value="vessel_count" /></a></td>
					  			   						<td width="20%" align="right"><s:property value="getText(#format,{@java.lang.Double@parseDouble(PREMIUM)})" default="" /></td>
					  			   						<td width="10%"></td>
					  			   					</tr>
					  			   				</s:if>
					  			   			</s:iterator>					  			   			
					  			   			</tbody>
									</s:iterator>
								</table>
	  						</div>
	  					</div>
	  					<br class="clear" />
					 	<div class="row">
					 		<div class="col-xs-12" align="center">
					 			<s:submit type="button" name="close"  key="Back" cssClass="btn btn-sm btn-danger" onclick="forward('D')"/>						
					 		</div>
					 	</div>
	  				</s:elseif>
	  				<s:elseif test='policyList.size > 0'>
	  					<div class="row">
	  						<div class="col-xs-12">
	  							<table class="display responsive no-wrap" id="gridTable1" width="100%" cellspacing="0">
					 				<thead>
					 					<tr>
					 						<th><s:text name="Transaction Id" /></th>
											<th><s:text name="Uploaded Date" /></th>
											<th><s:text name="Total Quotes" /></th>
											<th><s:text name="Uploaded Quotes" /></th>
											<th><s:text name="Pending Quotes" /></th>
											<th><s:text name="Upload Status" /></th>
											<th><s:text name="Process Status" /></th>
					 					</tr>
					 				</thead>
					 				<tbody>
					 					<s:iterator value="policyList" status="status" var="record">
					 					<tr>
					 						<td> <s:property value="TranID" /> </td>
					 						<td> <s:property value="UploadedDates" /> </td>
					 						<td> <s:property value="TotalQuotes" /> </td>
					 						<td> <s:property value="UploadedQuotes" /></td>
					 						<td> <s:property value="PendingQuotes" /> </td>
					 						<td> <s:property value="PrograssDesc" /> </td>
					 						<td>
					 						<s:if test='"C".equals(UploadStatus)'>
											Completed
											</s:if>
											<s:elseif test='"S".equals(UploadStatus)'>
											<a href="#" class="btn btn-sm btn-info"  onclick="processRecord(<s:property value='TranID'/>)">Pending</a>
											</s:elseif>
											<s:else>
											Failed
											</s:else>
					 						
					 						</td>
					 					</tr>
					 					</s:iterator>
					 				</tbody>
					 			</table>
	  						</div>
	  					</div>
	  				</s:elseif>
	  				<s:else>
			  			<s:label key="declaration.nothingfound"></s:label>
			  		</s:else>
	  			</s:if>
	  			<s:if test='menuType=="DP"'>
	  				<s:if test="policyList.size > 0">
	  					<div class="row">
	  						<div class="col-xs-12">
	  							<div style="max-height:400px;overflow:scroll;overflow-x:hidden;">
									<table class="display responsive no-wrap" width="100%" cellspacing="0">
										<thead>
											<tr>
												<th><s:text name="declaration.policyNo" /></th>
												<th><s:text name="declaration.quoteNo" /></th>
												<th><s:text name="declaration.customerName" /></th>
												<th><s:text name="declaration.sumInsured" /></th>
												<th><s:text name="declaration.premium" /></th>
												<th><s:text name="declaration.schedule" /></th>
											</tr>
										</thead>
									  	<tbody>
									  		<s:iterator value="policyList" status="status" var="policyList">
												<tr>								
													<td width="16%"><s:property value="%{#policyList.POLICY_NO}"/>/<s:property value="%{#status.count}"/></td>
													<td width="7%"><s:property value="%{#policyList.QUOTE_NO}"/></td>
													<td width="30%"><s:property value="%{#policyList.FIRST_NAME}"/></td>
													<td width="10%" align="right"><s:property value="getText('number.format.2',{@java.lang.Double@parseDouble(TOTAL_SUM_INSURED)})"/></td>
													<td width="10%" align="right"><s:property value="getText('number.format.2',{@java.lang.Double@parseDouble(PREMIUM)})"/></td>
													<td width="7%"><a href="#" onclick="return popUp('<%=request.getContextPath()%>/Copyofinformation.jsp?policyMode=suppleMentMultiple&policynumber=<s:property value="%{#policyList.QUOTE_NO}"/>&loginid=<s:property value="%{#session.userName}"/>&verNo=<s:property value="%{#status.count}"/>','1000','500')"><s:label
																			key="declaration.schedule" />
																	</a></td>
												</tr>
											</s:iterator>
									  	</tbody>									
									</table>
								</div>
	  						</div>
	  					</div>
	  					<div class="row">
	  						<div class="col-xs-12" align="center">
	  							<input type="button" name="back123" value="Back" class="btn btn-sm btn-danger" onclick="getBack('<s:property value="%{#session.userName}"/>');"/>
	  						</div>
	  					</div>	  					
	  				</s:if>
	  				<s:else>
			  			<s:label key="declaration.nothingfound"></s:label>
			  		</s:else>
	  			</s:if>
	  			<s:elseif test='menuType=="C"'>
	  				<div class="row">
  						<div class="col-xs-12">
  							<table class="display responsive no-wrap" id="gridTable" width="100%" cellspacing="0">
				 				<thead>
				 					<tr>
				 						<th><s:text name="Tran Id" /></th>
				 						<th><s:text name="Policy Date" /></th>
										<th><s:text name="Customer Name" /></th>
										<th><s:text name="No Of Records" /></th>
										<th><s:text name="Certificate No" /></th>
										<th><s:text name="Premium" /></th>
										<th><s:text name="Schedule" /></th>
										<th><s:text name="Debit Note" /></th>
										<th><s:text name="Credit Note" /></th>
				 					</tr>
				 				</thead>
				 				<tbody>
				 					<s:iterator value="declarationList" status="status" var="record">
				 					<tr>
				 						<td align="right"> <s:property value="TranID " /> </td>
				 						<td align="right"> <s:property value="PolicyDate " /> </td>
				 						<td align="right"> <s:property value="CustomerName " /> </td>
				 						<td align="right"> <s:property value="NoOfRecords" /> </td>
				 						<td align="right"> <s:property value="CertificateNo" /> </td>
				 						<td align="right"> <s:property value="Premium" /> </td>
				 						<td align="right">  
				 							<input type="button" value="Schedule" onclick="getSchedule('<s:property value="%{#record.CertificateNo}"/>');" class="btn btn-sm btn-info"> 												
 										</td>
				 						<td align="right"> 
				 							<input type="button" value="Debit" onclick="getDebit('<s:property value="%{#record.CertificateNo}"/>')" class="btn btn-sm btn-info">
				 						 </td>
				 						 <td align="right"> 
				 							<input type="button" value="Credit" onclick="getCredit('<s:property value="%{#session.user}"/>','<s:property value="%{#record.CertificateNo}"/>')" class="btn btn-sm btn-info">
				 						  </td>
				 					</tr>
				 					</s:iterator>
				 				</tbody>
				 			</table>
  						</div>
  					</div>
  					
	  			</s:elseif>
	  			<s:elseif test='menuType=="MD"'>
	  				<div class="row">
  						<div class="col-xs-12">
  							<table class="display responsive no-wrap" id="gridTable" width="100%" cellspacing="0">
				 				<thead>
				 					<tr>
				 						<th><s:text name="Quote No" /></th>
										<th><s:text name="Customer Name" /></th>
										<th><s:text name="Sum Insured" /></th>
										<th><s:text name="Premium" /></th>
				 					</tr>
				 				</thead>
				 				<tbody>
				 					<s:iterator value="declarationList" status="status" var="record">
				 					<tr>
				 						<td> <input type="hidden" name="selectedQuote" value='<s:property value="#record.QUOTE_NO"/>'/><s:property value="#record.QUOTE_NO"/> </td>
				 						<td> <s:property value="FIRST_NAME" /> </td>
				 						<td align="right"> <s:property value="TOTAL_SUM_INSURED" /> </td>
				 						<td align="right"> <s:property value="PREMIUM" /> </td>
				 					</tr>
				 					</s:iterator>
				 				</tbody>
				 			</table>
  						</div>
  					</div>
  					<div class="row">
  						<div class="col-xs-12">
  							<div id="policyGeneration" style='%{referralUpdate=="Y"?"display:none":"display:block"}'>
  								<div class="panel panel-primary">
  									<div class="panel-heading">
  										<s:text name="declaration.policyGeneration" />
  									</div>
  									<div class="panel-body">
  										<div class="row">
  											<div class="col-xs-4">
  												<s:text name="declaration.generatePolicy" />
  											</div>
  											<div class="col-xs-8">
  												<s:radio list="#{'Y':'Yes','N':'No'}"  name="generatePolicy" id="generatePolicy" value="%{generatePolicy==null?'N':generatePolicy}" onclick="disablePolicyDetail(this.value);"/>
  											</div>
  										</div>
  									</div>
  								</div>
  							</div>
  				<div class="panel-body">
					<table id="QuoteDocTable" class="table table-bordered table-striped" style="display: none;" >
						<thead>
							<tr>
								<th >S.No.</th>
								<th >Due Amount</th>
								<th >Due Percent</th>
								<th >Due Date</th>
								<th >Effective Date</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<s:if test="hasActionErrors()">
								<s:iterator value="dueList" var="dueList" status="stat">
									<tr>
									<td align="center"><s:property value="%{#stat.count}"/></td>
									
									<td>
											<s:hidden name="dueList[%{#stat.count-1}]" id="dueList[%{#stat.count-1}]"></s:hidden>
								 			<s:textfield name="dueamount[%{#stat.count-1}]" id="dueamount[%{#stat.count-1}]" cssClass="form-control tooltipContent"  maxlength="100"/>
									</td>
									<td>
								 			<s:textfield name="duepercent[%{#stat.count-1}]" id="duepercent[%{#stat.count-1}]" cssClass="form-control tooltipContent"  maxlength="100"/>
									</td>
									<td>
								 			<s:textfield id="dueDate%{#stat.count-1}" name="dueDate[%{#stat.count-1}]"   readonly="true"  cssClass="form-control passExpDate tooltipContent"   />
								 	</td>
									<td>
								 			<s:textfield id="effectiveDate%{#stat.count-1}" name="effectiveDatePT[%{#stat.count-1}]"  readonly="true"  cssClass="form-control passExpDate tooltipContent" />
								 	</td>
									<td>	
										<s:if test="!#stat.first">
											<s:checkbox name="deleteRow[%{#stat.count-1}]" id="chk%{#stat.count}" onclick="deleteRow(this.id, this)"/>
										</s:if>
									</td>
									</tr>
							</s:iterator>
							</s:if>
							<s:else>
								<tr>
								<td align="center">1</td>
								
								<td>
										<s:hidden name="dueList[0]" id="dueList[0]" value="0"></s:hidden>
							 			<s:textfield name="dueamount[0]" id="dueamount[0]" cssClass="form-control tooltipContent"  maxlength="100"/>
								</td>
								<td>
							 			<s:textfield name="duepercent[0]" id="duepercent[0]" cssClass="form-control tooltipContent"  maxlength="100"/>
								</td>
								<td>
							 			<s:textfield id="dueDate1" name="dueDate" cssClass="form-control datepicker tooltipContent"   />
							 	</td>
								<td>
							 			<s:textfield id="effectiveDate1" name="effectiveDatePT" cssClass="form-control datepicker tooltipContent" />
							 	</td>
							 	<td/>
								</tr>
							</s:else>
						</tbody>
					</table>
						<div class="boxcontent" align="right" id="addTable">
					    	<input type="button" name="addadd" value="Add" class="btn btn-sm btn-primary" onclick="addQuoDocRow()" />
					    </div>
					   
					</div>
  							<div id="getPolicyDetail" style="display: none;">
  								<div class="panel panel-primary">
  									<div class="panel-heading">
  										<s:text name="declaration.certificateDisplayInfo" />
  									</div>
  									<div class="panel-body">
  										<div class="row">
  											<div class="col-xs-12">
  												<s:checkbox name="rubberStamp" id="check_rubber_stamp" fieldValue="Y"   /><s:label key="declaration.printRubberStamp"  name="certificateInfo"/>
  											</div>
  										</div>
  									</div>
  								</div>
  								<div class="panel panel-primary">
  									<div class="panel-heading">
  										<s:text name="declaration.documentBasis" />
  									</div>
  									<div class="panel-body">
  										<div class="row">
  											<div class="col-md-6">
  												<s:text name="declaration.noteType" /> &nbsp; <s:radio name="noteType" list="#{'N':'Net','G':'Gross'}" value="%{noteType==null?'N':noteType}" onclick="toggleCredit(this.value)"/>
  											</div>
  											<div class="col-md-6">
  												<s:text name="declaration.paymentMode" /> &nbsp; <s:radio list="#{'CA':'Cash','CR':'Credit'}" name="paymentMode"  value="%{paymentMode==null?'CA':paymentMode}" />
  											</div>
  										</div>
  									</div>
  								</div>
  							</div>
  						</div>
  					</div>
  					<div class="row">
  						<div class="col-xs-6" align="center">
  							<input type="button" name="close"  value="Back" class="btn btn-sm btn-danger" onclick="getVesselDeclare('<s:property value="vessel"/>','<s:property value="tranId"/>','<s:property value="supplier"/>');"/>
  						</div>
  						<div class="col-xs-6" align="center">
  							<s:submit type="submit" name="submit" key="Submit" onclick="update('MC')" cssClass="btn btn-sm btn-success"/> 
  						</div>
  					</div>
	  			</s:elseif>
	  			<s:elseif test='menuType=="MC"'>
  					<s:if test='!hasActionErrors()'>
  						<div class="row">
  							<div class="col-xs-12">
  								<div class="panel panel-primary">
  									<div class="panel-heading">
  										<s:text name="declaration.title" />
  										<div class="pull-right">
  											<s:text name="declaration.certNo"/>&nbsp;<font color="white"><s:property value="declarationList[0].PolicyNo.toString()"/></font>
  										</div>
  									</div>
  									<div class="panel-body">
  										<table class="display responsive no-wrap" id="gridTable" width="100%" cellspacing="0">
							 				<thead>
							 					<tr>
							 						<th><s:text name="Quote No" /></th>
													<th><s:text name="Customer Name" /></th>
													<th><s:text name="Sum Insured" /></th>
													<th><s:text name="Premium" /></th>
							 					</tr>
							 				</thead>
							 				<tbody>
							 					<s:iterator value="declarationList" status="status" var="record">
							 					<tr>
							 						<td> <input type="hidden" name="selectedQuote" value="<s:property value="#record.QuoteNo"/>"/><s:property value="#record.QuoteNo"/> </td>
							 						<td> <s:property value="CustomerName" /> </td>
							 						<td align="right"> <s:property value="SumInsured" /> </td>
							 						<td align="right"> <s:property value="Premium" /> </td>
							 					</tr>
							 					</s:iterator>
							 				</tbody>
							 			</table>
  									</div>
  								</div>
  								<div class="panel panel-primary">
  									<div class="panel-heading">
  										<s:text name="policyInfo.documentInfo" />
  									</div>
  									<div class="panel-body">
  										<div class="row">
  											<div class="col-xs-4">
  												<s:text name="policyInfo.schedule" />
  											</div>
  											<div class="col-xs-4" align="center">
  												<s:property value="declarationList[0].PolicyNo"/>
  											</div>
  											<div class="col-xs-4" align="center">
  												<s:submit name="Submit2" type="button" cssClass="btn btn-sm btn-info" value="Schedule" cssStyle="width:100px" onclick="return popUp('Copyofinformation.jsp?policyMode=scheduleMultiple&policynumber=%{declarationList[0].PolicyNo}&loginid=%{#session.user}','1000','500')"/>
  											</div>
  										</div>
  										<br class="clear" />
  										<s:if test='declarationList[0].DebitNoteNo != "0"'>
  										<div class="row">
  											<div class="col-xs-4">
  												<s:text name="policyInfo.debit" />
  											</div>
  											<div class="col-xs-4" align="center">
  												<s:property value="declarationList[0].DebitNoteNo"/>
  											</div>
  											<div class="col-xs-4" align="center">
  												<s:submit name="Submit2" type="submit" cssClass="btn btn-sm btn-info" key="policyInfo.debit" cssStyle="width:100px" onclick="return popUp('Copyofinformation.jsp?policyMode=debitMultiple&policynumber=%{declarationList[0].PolicyNo}&loginid=%{#session.user}','1000','500')"/>
  											</div>
  										</div>
  										<br class="clear" />
  										</s:if>
  										<s:if test='declarationList[0].CreditNoteNo != "0"'>
  										<div class="row">
  											<div class="col-xs-4">
  												<s:text name="policyInfo.credit" />
  											</div>
  											<div class="col-xs-4" align="center">
  												<s:property value="declarationList[0].CreditNoteNo"/>
  											</div>
  											<div class="col-xs-4" align="center">
  												<s:submit name="Submit2" type="submit" cssClass="btn btn-sm btn-info" key="policyInfo.credit" cssStyle="width:100px" onclick="return popUp('Copyofinformation.jsp?policyMode=creditMultiple&policynumber=%{declarationList[0].PolicyNo}&loginid=%{#session.user}','1000','500')"/>
  											</div>
  										</div>
  										</s:if>
  									</div>
  								</div>
  							</div>
  						</div>
  					</s:if>
  					<div class="row">
  						<div class="col-xs-12" align="center">
  							<input type="button" name="Submit"  class="btn btn-sm btn-success" value="Proceed"  onclick="declarationMenu('C')"/>
  						</div>
  					</div>
  				</s:elseif>
  				<s:elseif test='menuType=="DE"'>
    				<s:if test='policyList.size > 0'>
    					<div class="row">
    						<div class="col-xs-12">
    							<div style="max-height:400px;overflow:scroll;overflow-x:hidden;">
    							<table class="display responsive no-wrap" id="gridTable" width="100%" cellspacing="0">
					  			   		<thead>
					  			   			<tr>
												<th><s:text name="declaration.select" /></th>
												<th><s:text name="declaration.quoteNo" /></th>
												<th><s:text name="declaration.tranId" /></th>
												<th><s:text name="declaration.customerName" /></th>
												<th><s:text name="declaration.sumInsured" /></th>
												<th><s:text name="declaration.premium" /></th>
												<th><s:text name="declaration.status" /></th>
												<th><s:text name="declaration.draft" /></th>
											</tr>
					  			   		</thead>
									  	<tbody>
									  		<s:iterator value="policyList" status="status" var="policyList">
												<tr> 
													<td align="center" width="5%"> 
														<s:property value="%{#policyList.SELECTED}"/><s:checkbox   name="selectedQuote"  id="selectedQuote"  value="%{#policyList.SELECTED}" fieldValue="%{#policyList.QuoteNo}"/><s:hidden  name="quoteNo" value="%{#policyList.QuoteNo}"/>
													</td>
													<td width="15%"><s:property value="%{#policyList.QuoteNo}"/></td>
													<td width="10%"><s:property value="%{#policyList.TransactionID}"/></td>
													<td width="30%"><s:property value="%{#policyList.CustomerName}"/></td>
													<td width="10%" align="right"><s:property value="%{#policyList.SumInsured}"/></td>
													<td width="10%" align="right"><s:property value="%{#policyList.Premium}"/></td>
													<s:if test='"0".equals(#policyList.PACKAGE_DESCRIPTION.toString())'>
														<td width="10%">Application</td>											
													</s:if>
													<s:else>
														<td width="10%">Excel Upload</td>
													</s:else>
													<td width="10%"><a href="#" onclick="return popUp('<%=request.getContextPath()%>/Copy of information Admin.jsp?policyMode=draft&policynumber=<s:property value="%{#policyList.QuoteNo}"/>&loginid=<s:property value="%{#session.userName}"/>&productTypeIds=<s:property value="%{#session.product_id}"/>','1000','500')"><s:text name="declartion.draft"/></a></td> 
												</tr>
											</s:iterator>
									  	</tbody>
									</table>
								</div>
    						</div>
    					</div>
    					<div class="row">
    						<div class="col-xs-12" align="center">
    							<!--<s:submit type="button" name="close"  key="Back" cssClass="btn" onclick="forward('KD')"/>&nbsp;
								--><s:submit type="submit" name="submit" key="Submit" onclick="forward('DEQ')" cssClass="btn btn-sm btn-success"/>
    						</div>
    					</div>
    				</s:if>
    			</s:elseif>
    			<s:elseif test='menuType=="DEQ"'>
    				<div class="row">
    					<div class="col-xs-12">
    						<table class="display responsive no-wrap" id="gridTable" width="100%" cellspacing="0">
				 				<thead>
				 					<tr>
				 						<th><s:text name="Quote No" /></th>
										<th><s:text name="Customer Name" /></th>
										<th><s:text name="Sum Insured" /></th>
										<th><s:text name="Premium" /></th>
				 					</tr>
				 				</thead>
				 				<tbody>
				 					<s:iterator value="policyList" status="status" var="record">
				 					<tr>
				 						<td> <input type="hidden" name="selectedQuote" id="selectedQuote" value='<s:property value="#record.QuoteNo"/>'/><s:property value="#record.QuoteNo"/> </td>
				 						<td> <s:property value="CustomerName" /> </td>
				 						<td align="right"> <s:property value="SumInsured" /> </td>
				 						<td align="right"> <s:property value="Premium" /> </td>
				 					</tr>
				 					</s:iterator>
				 				</tbody>
				 			</table>
    					</div>
    				</div>
    				<br/>
    				<div class="row">
    					<div class="col-xs-12">
    						<div id="policyGeneration" style='%{referralUpdate=="Y"?"display:none":"display:block"}'>    							
    							<div class="row">
    								<div class="col-xs-12">
    									<div class="panel panel-primary">
    										<div class="panel-heading">
    											<s:text name="declaration.policyGeneration" />
    										</div>
    										<div class="panel-body">
    											<div class="row">
								    				<div class="col-xs-12 col-md-4">
								    					<div class="text">
								    						<s:text name="VAT" />(<s:property value="vatPercent"/>)%
								    					</div>
								    					<div class="tbox">
								    						<s:textfield name="VatTax" id="VatTax" cssClass="inputBox" readonly="true" />
								    					</div>
								    				</div>
								    				<div class="col-xs-12 col-md-4">
								    					<div class="text">
								    						<s:text name="Policy Fee" />
								    					</div>
								    					<div class="tbox">
								    						<s:textfield name="policyfee" id="policyfee" cssClass="inputBox" readonly="true" />
								    					</div>
								    				</div>
								    				<div class="col-xs-12 col-md-4">
								    					<div class="text">
								    						<s:text name="Total Premium" />
								    					</div>
								    					<div class="tbox">
								    						<s:textfield name="totalPremium" id="totalPremium" cssClass="inputBox" readonly="true" />
								    					</div>
								    				</div>
    											</div>
    											<br/>
    											<div class="row">
								    				<div class="col-xs-12 col-md-4">
								    					<div class="text">
								    						<s:text name="Month of Declaration && Year" />
								    					</div>
								    					<div class="tbox">
								    						<div class="row">
								    							<div class="col-xs-6">
								    								<s:select list="#{'January':'January','February':'February','March':'March','April':'April','May':'May',
										    						'June':'June','July':'July','August':'August','September':'September','October':'October',
										    						'November':'November','December':'December'}"  headerKey="" headerValue="---Select---"  name="monthOfDeclaration"   cssClass="inputBoxS"/>
								    							</div>
								    							
								    							<div class="col-xs-6">
																	<s:select name="yearVal" cssClass="inputBoxS" list="yearDrpDown"  headerKey="" headerValue="---Select---" />
								    							</div>
								    						</div>
								    					</div>
								    				</div>
								    				<div class="col-xs-12 col-md-4">
								    					<div class="text">
								    						<s:text name="Declaration policy Issue Date" />
								    					</div>
								    					<div class="tbox">
								    						<s:textfield name="policyStartDate" id="preEffectiveDate1" cssClass="inputBox datepicker" />
								    					</div>
								    				</div>
								    				<div class="col-xs-12 col-md-4">
								    					<div class="text">
								    						<s:label key="Policy Type ? " />
								    					</div>
								    					<div class="tbox">
							    						<s:radio list="#{'D':'Declaration','C':'Certificate'}"  name="declaredPolicy" id="declaredPolicy" value="%{declaredPolicy==null?'D':declaredPolicy}" onclick="disablePolicyDetail(this.value);"/>
							    						</div>									    					
								    				</div>
    											</div>
    											<br/>
    											<div class="row">
								    				<div class="col-xs-12 col-md-6">
							    						<s:label key="declaration.generatePolicy" />
							    						<s:radio list="#{'Y':'Yes','N':'No'}"  name="generatePolicy" id="generatePolicy" value="%{generatePolicy==null?'N':generatePolicy}" onclick="disablePolicyDetail(this.value);"/>							    					
								    				</div>
								    			</div>
    										</div>
    									</div>
    								</div>
    							</div>
							</div>
    					</div>
    				</div>
    				<div class="row">
    				<div class="panel-body">
					<table id="QuoteDocTable" class="table table-bordered table-striped" style="display: none;" >
						<thead>
							<tr>
								<th >S.No.</th>
								<th >Due Amount</th>
								<th >Due Percent</th>
								<th >Due Date</th>
								<th >Effective Date</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<s:if test="hasActionErrors()">
								<s:iterator value="dueList" var="dueList" status="stat">
									<tr>
									<td align="center"><s:property value="%{#stat.count}"/></td>
									
									<td>
											<s:hidden name="dueList[%{#stat.count-1}]" id="dueList[%{#stat.count-1}]"></s:hidden>
								 			<s:textfield name="dueamount[%{#stat.count-1}]" id="dueamount[%{#stat.count-1}]" cssClass="form-control tooltipContent"  maxlength="100"/>
									</td>
									<td>
								 			<s:textfield name="duepercent[%{#stat.count-1}]" id="duepercent[%{#stat.count-1}]" cssClass="form-control tooltipContent"  maxlength="100"/>
									</td>
									<td>
								 			<s:textfield id="dueDate%{#stat.count-1}" name="dueDate[%{#stat.count-1}]" cssClass="form-control passExpDate tooltipContent dueDate"   />
								 	</td>
									<td>
								 			<s:textfield id="effectiveDate%{#stat.count-1}" name="effectiveDatePT[%{#stat.count-1}]" cssClass="form-control passExpDate tooltipContent effectiveDate" />
								 	</td>
									<td>	
										<s:if test="!#stat.first">
											<input type="button" value="Delete" class="btn btn-sm btn-danger btn-width" onclick="disableForm(this.form,false,'');deleteRow('<s:property value="dueList[#status.index]"/>')" />
										</s:if>
									</td>
									</tr>
							</s:iterator>
							</s:if>
							<s:else>
								<tr>
								<td align="center">1</td>
								
								<td>
										<s:hidden name="dueList[0]" id="dueList[0]" value="1"></s:hidden>
							 			<s:textfield name="dueamount[0]" id="dueamount[0]" cssClass="form-control tooltipContent"  maxlength="100"/>
								</td>
								<td>
							 			<s:textfield name="duepercent[0]" id="duepercent[0]" cssClass="form-control tooltipContent"  maxlength="100"/>
								</td>
								<td>
							 			<s:textfield id="dueDate1" name="dueDate[0]" cssClass="form-control datepicker tooltipContent dueDate"   />
							 	</td>
								<td>
							 			<s:textfield id="effectiveDate1" name="effectiveDatePT[0]" cssClass="form-control datepicker tooltipContent effectiveDate" />
							 	</td>
							 	<td/>
								</tr>
							</s:else>
						</tbody>
					</table>
						<div class="boxcontent" align="right" id="addTable">
					    	<input type="button" name="addadd" value="Add" class="btn btn-sm btn-primary" onclick="addQuoDocRow()" />
					    </div>
					   
					</div>
    					<div class="col-xs-12">
    						<div id="getPolicyDetail" style="display: none;">
    							<div class="panel panel-primary">
									<div class="panel-heading">
										<s:text name="declaration.certificateDisplayInfo" />
									</div>
									<div class="panel-body">
										<s:checkbox name="rubberStamp" id="check_rubber_stamp" fieldValue="Y"   /><s:label key="declaration.printRubberStamp"  name="certificateInfo"/>
									</div>
								</div>  
				    			<s:hidden name="noteType" value="N" />
								<s:hidden name="paymentMode" value="" />
			  				</div> 
    					</div>
    				</div>
    				<div class="row">
    					<div class="col-xs-6" align="center">
    						<input type="submit" name="close"  value="Back" class="btn btn-sm btn-danger" onclick="forward('DE')"/>					
    					</div>
    					<div class="col-xs-6" align="center">
    						<s:submit type="submit" name="submit" key="Submit" onclick="update('DEQ')" cssClass="btn btn-sm btn-success"/>
    					</div>
    				</div>
    			</s:elseif>
    			<s:elseif test='menuType=="PP"'>
    				<div class="row">
    					<div class="col-md-4">
    						<div class="text">
    							<s:text name="declaration.startDate" />
    						</div>
    						<div class="tbox">
    							<s:textfield name="policyStartDate" id="policyStartDate" cssClass="inputBox datepicker" />
    						</div>
    					</div>
    					<div class="col-md-4">
    						<div class="text">
    							<s:text name="Choose Policy" />
    						</div>
    						<div class="tbox">
    							<s:radio list="#{'B':'Broker','I':'Operational User','ALL':'Both'}" name="policyMode" id="policyMode" onchange="hideInfo()" value="%{policyMode==null?'ALL':policyMode}" ></s:radio> 
    						</div>
    					</div>
    					<div class="col-md-4" align="center">
    						<s:submit type="submit" name="submit" key="Submit" onclick="getInfo()" cssClass="btn btn-sm btn-success"/>
    					</div>
    				</div>
    				<s:if test="policyInfoList!=null && policyInfoList.size()>0">
    					<div id="polInfo">
    						<s:iterator value="policyInfoList" status="status" var="REC" >
    							<div class="row">
    								<div class="col-xs-3">
    									<b>Date</b> &nbsp;:&nbsp; <s:property value="%{#REC.INCEPTION_DATE}"/>
    								</div>
    								<div class="col-xs-3">
    									<b>Open cover No</b> &nbsp;:&nbsp; <s:property value="%{#REC.OPEN_COVER_NO}"/>
    								</div>
    								<div class="col-xs-3">
    									<b>Customer Name</b> &nbsp;:&nbsp; <s:property value="%{#REC.CUSTOMER_NAME}"/>
    								</div>
    								<div class="col-xs-3">
    									<b>No of Records</b> &nbsp;:&nbsp; <s:property value="%{#REC.TOTAL_POLICY}"/>
    								</div>
    							</div>
    							<s:hidden name="incpDate" id="incpDate" value="%{#REC.INCEPTION_DATE}"/>
    						</s:iterator>
    						<div class="row">
    							<div class="col-xs-6" align="center">
    								<a href="#" type="button" onclick="schedule('WL')" class="btn btn-sm btn-primary" style="TEXT-DECORATION: none"> Schedule With LetterHead</a>
    							</div>
    							<div class="col-xs-6" align="center">
    								<a href="#" type="button" onclick="schedule('WOL')" class="btn btn-sm btn-primary" style="TEXT-DECORATION: none">Schedule Without LetterHead</a>
    							</div>
    						</div>
    					</div>
    				</s:if>
    				<s:else>
    					No Records Found
					</s:else>
					<s:hidden name="menuType" />
    			</s:elseif>
			</div>
		</div>
	</div>
</div>
<s:hidden name="tranId"/>
<s:hidden name="vessel"/>
<s:hidden name="selectedAllQuote" id="selectedAllQuote"/>
<s:hidden name="supplier"/>
<s:hidden name="reqFrom"/>
<s:token/>
</s:form>
<s:form name="report1" theme="simple" action="initDeclaration.action">
	<s:hidden name="tranId" id="tranId1"/>
  	<s:hidden name="vessel" id="vessel1"/>
  	<s:hidden name="supplier" id="supplier1"/>
  	<s:hidden name="menuType" id="menuType1"/>
  	<s:hidden name="reqFrom" id="reqFrom1"/>
  	<s:hidden name="loginId" id="loginId1"/>
  	<s:hidden name="productId" id="productId1"/>
  	<s:hidden name="snoPT" id="snoPT"/>
  	<s:hidden name="selectedAllQuote"/>
  	<s:hidden name="generatePolicy"/>
  	<s:hidden name="declaredPolicy"/>
  	<s:token/>
</s:form>
</body>
<script type="text/javascript">
$(function() {
	$('#preEffectiveDate1').datetimepicker({
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
	
	$('.dueDate').datetimepicker({
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
	
	$('.effectiveDate').datetimepicker({
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
disablePolicyDetail()
function disablePolicyDetail(){
	try{
		val=document.report.generatePolicy.value;
			val2=document.report.declaredPolicy.value;
			if(val=='Y' && val2=='D'){
				document.getElementById('QuoteDocTable').style.display="";
				document.getElementById('addTable').style.display="";
		
			}
			else{
				document.getElementById('QuoteDocTable').style.display="none";
				document.getElementById('addTable').style.display="none";
			}
		}catch(err){}
		}

	function addQuoDocRow(){
		var table = document.getElementById('QuoteDocTable');
		var rowCount = table.rows.length;
		var row = table.insertRow(rowCount);
		var rowCount1 = 0;
		try{
			var table1 = document.getElementById('paymentTermsDetails');
			rowCount1=table1.rows.length;
		}catch(err){rowCount1=2}
		rowCount=rowCount+rowCount1-2;
		row.className="runtext";
		row.id = "new_"+rowCount;
		
		
		cell = row.insertCell(0);     
	   	cell.align = "center"; 
	    	cell.innerHTML = rowCount;
	    	var element = document.createElement("input");
		element.className = "inputSelect";	 
	 	element.type = "hidden";	
		element.value=rowCount;
		element.name = "dueList["+(rowCount-1)+"]";
		element.type = "hidden";
		element.value=rowCount;
		cell.appendChild(element);
		
		 
		
		cell = row.insertCell(1);
		var element = document.createElement("input");
		element.className = "form-control";
		element.name = "dueamount["+(rowCount-1)+"]";
		element.id = "dueamount["+(rowCount-1)+"]";
		element.type = "text";
		
		cell.appendChild(element);
		
		cell = row.insertCell(2);
		var element = document.createElement("input");
		element.className = "form-control";
		element.name = "duepercent["+(rowCount-1)+"]";
		element.id = "duepercent["+(rowCount-1)+"]";
		element.type = "text";
		cell.appendChild(element);
		
		cell = row.insertCell(3);
		var element = document.createElement("input");
	        element.type = "text";
	        //element.setAttribute("placeholder",'DD/MM/YYYY'); 
	        element.setAttribute("maxlength",'10'); 
	        element.setAttribute("readonly",'true'); 
	        element.className = "form-control datepicker dueDate";
	        element.name = "dueDate";
	        element.id = "dueDate"+rowCount+"";            
	        cell.appendChild(element);
	        $(function() {
	        	$('.dueDate').datetimepicker({
	       	     format:'d/m/Y',
	       	     timepicker:false,
	       	     scrollInput : false,
	       	     onSelectDate:function(current_time, $input){
	       	    	 $(".xdsoft_datetimepicker").css("display", "none");
	       	     }
	       	});
	    	});
		cell.appendChild(element);
		
		cell = row.insertCell(4);
			var element = document.createElement("input");
	        element.type = "text";
	       // element.setAttribute("placeholder",'DD/MM/YYYY'); 
	        element.setAttribute("maxlength",'10'); 
	        element.className = "form-control datepicker effectiveDate";
	        element.name = "effectiveDatePT["+(rowCount-1)+"]";
	        element.id = "effectiveDate"+rowCount+"";    
	        element.setAttribute("readonly",'true');         
	        cell.appendChild(element);
	        $(function() {
	        	$('.effectiveDate').datetimepicker({
	       	     format:'d/m/Y',
	       	     timepicker:false,
	       	     scrollInput : false,
	       	     onSelectDate:function(current_time, $input){
	       	    	 $(".xdsoft_datetimepicker").css("display", "none");
	       	     }
	       	});
	    	});
		cell.appendChild(element);
			
		cell = row.insertCell(5);
		var element = document.createElement("input");
		element.type = "button";
		element.value="Delete";
		element.setAttribute("onclick", "deleteRow('"+(rowCount)+"')");
		element.className="btn btn-sm btn-danger btn-width"
	    cell.appendChild(element);
	}
function declaration(tranId){
	document.report.tranId.value=tranId;
	document.report.action = "<%=request.getContextPath()%>/showMultipleQuotes.jsp";
	document.report.submit();
}

function forward(menuType){
	
	
	if(menuType=='D'){
		document.report.tranId.value='';
		document.report.reqFrom.value='';
	}else if(menuType=='KD'){
		menuType='D';
		document.report.reqFrom.value='result';
		document.report.vessel.value='';
		document.report.supplier.value='';
	}
	if(menuType=='DEQ'){
		var oTable1 = $('#gridTable').dataTable();
		var rowcollection1 =  oTable1.$("input[name=selectedQuote]:checked", {"page": "all"});
		var checkedVal1 ="";
		rowcollection1.each(function(index,elem){
		checkedVal1 = checkedVal1.concat($(elem).val()+',')
		});	
	}
	document.getElementById("selectedAllQuote").value=checkedVal1;
	document.report.action = "<%=request.getContextPath()%>/initDeclaration.action?menuType="+menuType;
	if(menuType=='DEQ'){
		var oTable1 = $('#gridTable').dataTable();
		var rowcollection1 =  oTable1.$("input[name=selectedQuote]:checked", {"page": "all"});
		var checkedVal1 ="";
		rowcollection1.each(function(index,elem){
		checkedVal1 = checkedVal1.concat($(elem).val()+',')
		});	
	}
	document.report.submit();
}

function update(menuType){
	document.report.action = "<%=request.getContextPath()%>/updateDeclaration.action?menuType="+menuType;
	document.report.submit();
}

function getVesselDeclare(vessel, transid, supplier){
	document.getElementById('tranId1').value=transid;
	document.getElementById('vessel1').value=vessel;
	document.getElementById('supplier1').value=supplier;
	document.getElementById('menuType1').value='D';
	document.getElementById('reqFrom1').value='result';
	document.report1.action = "<%=request.getContextPath()%>/initDeclaration.action";
	document.report1.submit();
}

function getBack(loginId){
	document.getElementById('loginId1').value=loginId;
	document.getElementById('menuType1').value='PD';
	document.getElementById('productId1').value='11';
	document.report1.action = "<%=request.getContextPath()%>/initReport.action";
	document.report1.submit();
}

function getConsigneeDetail(transid){
	document.getElementById('tranId1').value=transid;
	document.getElementById('reqFrom1').value='result';
	document.getElementById('menuType1').value='D';
	document.report1.action = "<%=request.getContextPath()%>/initDeclaration.action";
	document.report1.submit(); 
}
function getInfo(){
	document.report.action = "<%=request.getContextPath()%>/getInfoDeclaration.action";
	document.getElementById("polInfo").style.visibility = "";
	document.report.submit();
}
function schedule(choice){
	 var date=document.getElementById('incpDate').value;
	 var policyMode=document.report.policyMode.value;
	 var URL ="<%=request.getContextPath()%>/scheduleDeclaration.action?scheduleType="+choice+"&policyStartDate="+date+"&policyMode="+policyMode;
     return popUp(URL,'1000','650');
}

function hideInfo(){
	document.getElementById("polInfo").style.visibility = "hidden";
}
function processRecord(transid){
	document.getElementById('tranId1').value=transid;
	document.report1.action = "<%=request.getContextPath()%>/processDeclaration.action";
	document.report1.submit();
}
function deleteRow(val) {
	if(val==0){
		alert("First row can't be deleted");
	}
	else{
		var status=confirm("Do you want to delete specified row");
		if(status){
			document.getElementById("snoPT").value=val;
			document.report1.action = 'deleteDeclaration.action';
			document.report1.submit();
		}
		}  
		
}
function getSchedule(val) {
	var URL ='<%=request.getContextPath()%>/documentpdfReport.action?policyNo='+val+'&docType=declare';
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
</script>
</html>