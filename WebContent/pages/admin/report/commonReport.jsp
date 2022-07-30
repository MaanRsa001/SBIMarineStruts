<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ page import="java.util.List,java.util.ArrayList,java.util.Map,java.util.HashMap,java.util.Collections"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<s:if test='"view".equals(mode)'>
<head>
	

	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.jqueryui.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.tableTools.css">
	<link href="<%=request.getContextPath()%>/dataTables/css/jquery-start-ui.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.jqueryui.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.tableTools.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				$('#record').DataTable( {
					 ajax: {
				        url: 'reportTranCommonRep.action?dateType='+'<s:property value="dateType"/>'
				        +'&fromDate='+'<s:property value="fromDate"/>'
				        +'&toDate='+'<s:property value="toDate"/>'
				        +'&brokerCode='+'<s:property value="brokerCode"/>'
				        +'&subBranchCode='+'<s:property value="subBranchCode"/>'
				        +'&userCode='+'<s:property value="userCode"/>'
				        +'&policyType='+'<s:property value="policyType"/>'
				        +'&reportType='+'<s:property value="reportType"/>',
				        dataSrc: 'transList'
				    },
				    "columns": [
								<s:if test='"1".equals(reportType)'>
									{"visible": true,"searchable": true,"data":"AGENCY_NAME"},
									{"visible": true,"searchable": true,"data":"POLICYTYPE"},
									{"visible": true,"searchable": true,"data":"INITIAL_PREMIUM"},
									{"visible": true,"searchable": true,"data":"ADD_PREM"},
									{"visible": true,"searchable": true,"data":"DEL_PREM"},
									{"visible": true,"searchable": true,"data":"POLICY_FEE"},
									{"visible": true,"searchable": true,"data":"GROSS_PREMIUM"},
									{"visible": true,"searchable": true,"data":"NET_PREMIUM"},
									{"visible": true,"searchable": true,"data":"COUNT1"}
								</s:if>
								<s:elseif test='"2".equals(reportType)'>
									{"visible": true,"searchable": true,"data":"POLICY_NO"},
									{"visible": true,"searchable": true,"data":"EFFECTIVE_DATE"},
									{"visible": true,"searchable": true,"data":"INCEPTION_DATE"},
									{"visible": true,"searchable": true,"data":"EXPIRY_DATE"},
									{"visible": true,"searchable": true,"data":"COMPANY_NAME"},
									{"visible": true,"searchable": true,"data":"BRANCH_NAME"},
									{"visible": true,"searchable": true,"data":"FS_BRANCH_NAME"},
									{"visible": true,"searchable": true,"data":"POLICYTYPE_DESC_ENGLISH"},
									{"visible": true,"searchable": true,"data":"LOGIN_ID"},
									{"visible": true,"searchable": true,"data":"USERNAME"},
									{"visible": true,"searchable": true,"data":"INITIAL_PREM"},
									{"visible": true,"searchable": true,"data":"END_ADDPREM"},
									{"visible": true,"searchable": true,"data":"END_REFPREM"},
									{"visible": true,"searchable": true,"data":"GROSS_PREMIUM"},
									{"visible": true,"searchable": true,"data":"COMMISSION"},
									{"visible": true,"searchable": true,"data":"POLICY_FEE"},
									{"visible": true,"searchable": true,"data":"NET_PREMIUM"},
									{"visible": true,"searchable": true,"data":"COVER_PREM"},
									{"visible": true,"searchable": true,"data":"EXTEN_PREM"},
									{"visible": true,"searchable": true,"data":"POLICY_TYPE"},
									{"visible": true,"searchable": true,"data":"ENDT_TYPE_ID"},
									{"visible": true,"searchable": true,"data":"SEQUENCE_NO"},
									{"visible": true,"searchable": true,"data":"REGISTRATION_NO"},
									{"visible": true,"searchable": true,"data":"PLATE_COLOR"},
									{"visible": true,"searchable": true,"data":"CHASSIS_NO"},
									{"visible": true,"searchable": true,"data":"MAKE_NAME"},
									{"visible": true,"searchable": true,"data":"MODEL_NAME"},
									{"visible": true,"searchable": true,"data":"TYPE_OF_BODY_NAME"},
									{"visible": true,"searchable": true,"data":"MANUFACTURE_YEAR"},
									{"visible": true,"searchable": true,"data":"VEHICLETYPE_DESC"},
									{"visible": true,"searchable": true,"data":"NAME"},
									{"visible": true,"searchable": true,"data":"MOBILE_NO"},
									{"visible": true,"searchable": true,"data":"COMPANY_REG_NO"},
									{"visible": true,"searchable": true,"data":"DOB"}
								</s:elseif>
								<s:elseif test='"3".equals(reportType)'>
									{"visible": true,"searchable": true,"data":"AGENCY_NAME"},
									{"visible": true,"searchable": true,"data":"FS_BRANCH_NAME"},
									{"visible": true,"searchable": true,"data":"INITIAL_PREMIUM"},
									{"visible": true,"searchable": true,"data":"ADD_PREM"},
									{"visible": true,"searchable": true,"data":"DEL_PREM"},
									{"visible": true,"searchable": true,"data":"POLICY_FEE"},
									{"visible": true,"searchable": true,"data":"GROSS_PREMIUM"},
									{"visible": true,"searchable": true,"data":"NET_PREMIUM"},
									{"visible": true,"searchable": true,"data":"COUNT1"}
								</s:elseif>
								<s:elseif test='"4".equals(reportType)'>
									{"visible": true,"searchable": true,"data":"AGENCY_NAME"},
									{"visible": true,"searchable": true,"data":"FS_BRANCH_NAME"},
									{"visible": true,"searchable": true,"data":"USERID"},
									{"visible": true,"searchable": true,"data":"USERNAME"},
									{"visible": true,"searchable": true,"data":"COUNT1"},
									{"visible": true,"searchable": true,"data":"INITIAL_PREMIUM"},
									{"visible": true,"searchable": true,"data":"ADD_PREM"},
									{"visible": true,"searchable": true,"data":"DEL_PREM"},
									{"visible": true,"searchable": true,"data":"GROSS_PREMIUM"},
									{"visible": true,"searchable": true,"data":"COMMISSION"},
									{"visible": true,"searchable": true,"data":"POLICY_FEE"},
									{"visible": true,"searchable": true,"data":"NET_PREMIUM"}
								</s:elseif>
								
				               ],
				    "scrollX": true,	
				    "deferRender": true,
					"lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]]
				} );
			} );
		</script>	
</head>
</s:if>
<body>
	<s:form name="commonReport" method="post" theme="simple"  >
		<div class="">
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<s:if test='"view".equals(mode)'>
								<s:if test='"1".equals(reportType)'>
									<s:text name="PRODUCTION SUMMARY REPORTS"/>
								</s:if>
								<s:elseif test='"2".equals(reportType)'>
									<s:text name="PRODUCTION BOUDREAUX REPORTS"/>
								</s:elseif>
								<s:elseif test='"3".equals(reportType)'>
									<s:text name="PRODUCTION BRANCH WISE REPORTS"/>
								</s:elseif>
								<s:elseif test='"4".equals(reportType)'>
									<s:text name="PRODUCTION USER WISE REPORTS"/>
								</s:elseif>
							</s:if>
							<s:else>
								<s:text name="Reports"/>
							</s:else>
						</div>				
						<div class="panel-body">
							<div class="col-md-12">
								<font color="red">
									<s:actionerror cssStyle="list-style: none;"/>
									<s:actionmessage cssStyle="list-style: none;"/>
								</font>
							</div>
							<s:if test='"view".equals(mode)'>
								<div class="row">
									<div class="col-md-12">
										<table class="display responsive no-wrap" id="record"  style="width: 100%; margin: 0 auto;">
											<thead>
												<tr>
													<s:if test='"1".equals(reportType)'>
														<th>Broker Name</th>
														<th>Sub Class</th>
														<th>Initial Premium</th>
														<th>Add Premium</th>
														<th>Delete Premium</th>
														<th>Policy Fee</th>
														<th>Gross Premium</th>
														<th>Net Premium</th>
														<th>No Of Policy</th>
													</s:if>
													<s:elseif test='"2".equals(reportType)'>
														<th>Policy Number</th>
														<th>Issued Date</th>
														<th>Period From</th>
														<th>Period To</th>
														<th>Company Name</th>
														<th>Region Name</th>
														<th>Branch Name</th>
														<th>Subclass Name</th>
														<th>Issued User</th>
														<th>Issued User Name</th>
														<th>Initial Premium</th>
														<th>End Add Premium</th>
														<th>End Ref Premium</th>
														<th>Gross Premium</th>
														<th>Commission</th>
														<th>Policy fee</th>
														<th>Net Premium</th>
														<th>Cover Premium</th>
														<th>Exten Premium</th>
														<th>Policy Type</th>
														<th>Endor Type</th>
														<th>Serial No</th>
														<th>Custom Id</th>
														<th>Plate Number</th>
														<th>Chassis number</th>
														<th>Make</th>
														<th>Model</th>
														<th>Body type</th>
														<th>Year</th>
														<th>Vehicle Type</th>
														<th>Customer Name</th>
														<th>Mobile Number</th>
														<th>ID Number</th>
														<th>Date ofBirth</th>													
													</s:elseif>
													<s:elseif test='"3".equals(reportType)'>
														<th>Broker Name</th>
														<th>Branch Name</th>
														<th>Initial Premium</th>
														<th>Add Premium</th>
														<th>Delete Premium</th>
														<th>Policy Fee</th>
														<th>Gross Premium</th>
														<th>Net Premium</th>
														<th>No Of Policy</th>
													</s:elseif>
													<s:elseif test='"4".equals(reportType)'>
														<th>Broker Name</th>
														<th>Branch Name</th>
														<th>User Id</th>
														<th>User Name</th>
														<th>No Of Policy</th>
														<th>Initial Premium</th>
														<th>Add Premium</th>
														<th>Delete Premium</th>
														<th>Gross Premium</th>
														<th>Commission</th>
														<th>Policy Fee</th>
														<th>Net Premium</th>
													</s:elseif>
													
												</tr>
											</thead>
										</table>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12" align="center">
										<s:submit cssClass="btn btn-sm btn-success" value="Download" onclick="funBack('downloadCommonRep.action');"></s:submit>
										<s:submit cssClass="btn btn-sm btn-danger" value="Back" onclick="funBack('initCommonRep.action');"></s:submit>
									</div>
								</div>
								<s:hidden name="dateType"></s:hidden>
							    <s:hidden name="fromDate"></s:hidden>
							    <s:hidden name="toDate"></s:hidden>
							    <s:hidden name="brokerCode"></s:hidden>
							    <s:hidden name="subBranchCode"></s:hidden>
							    <s:hidden name="userCode"></s:hidden>
							    <s:hidden name="policyType"></s:hidden>
							    <s:hidden name="reportType"></s:hidden>
							</s:if>
							<s:else>
								<div class="row">
									<div class="col-md-12">
										<label>Do You Want to</label> <br/>
										<s:radio list="#{'PID':'Based on Policy Inception Date','PPD':'Based On Policy Posted Date'}" name="dateType" id="dateType" />
									</div>
									<div class="col-md-3">
										<div class="form-group">
										    <label for="fromDate">From Date</label>
										    <s:textfield name="fromDate" id="fromDate" cssClass="form-control datepicker" readonly="true" > </s:textfield>
										  </div>
									</div>
									<div class="col-md-3">
										<div class="form-group">
										    <label for="toDate">To Date</label>
										    <s:textfield name="toDate" id="toDate" cssClass="form-control datepicker" readonly="true" > </s:textfield>
										  </div>
									</div>
									<div class="col-md-3">
										<div class="form-group">
										   <label for="brokerCode">Company</label>
										   <s:select list="brokerList" name="brokerCode" id="brokerCode" cssClass="form-control" headerKey="ALL" headerValue="ALL" listKey="AGENCY_CODE" listValue="COMPANY_NAME" onchange="funAjax(this.value,'userList')"></s:select>
										</div>
									</div>
									<%--<div class="col-md-3">
										<div class="form-group" id="branchList">
										   <label for="subBranchCode">Branch</label>
										   <s:select list="branchList" name="userBranchCode" id="userBranchCode" cssClass="form-control" headerKey="ALL" headerValue="ALL" listKey="" listValue=""></s:select>
										</div>
									</div>
									--%>
									<div class="col-md-3">
										<div class="form-group" id="branchList">
										   <label for="subBranchCode">Sub Branch</label>
										   <s:select list="subBranchCodeList" name="subBranchCode" id="subBranchCode" cssClass="form-control" headerKey="ALL" headerValue="ALL" listKey="FS_BRANCH_CODE" listValue="FS_BRANCH_NAME"></s:select>
										</div>
									</div>
									<div class="col-md-3">
										<div class="form-group" id="userList">
										   <label for="userCode">User Name</label>
										   <s:select list="#{}" name="userCode" id="userCode" cssClass="form-control" headerKey="ALL" headerValue="ALL" listKey="" listValue=""></s:select>
										</div>
									</div>
									<div class="col-md-3">
										<div class="form-group">
										   <label for="brokerCode">Sub Class</label>
										   <s:select list="policyTypeList" name="policyType" id="policyType" cssClass="form-control" headerKey="ALL" headerValue="ALL" listKey="CODE" listValue="CODEDESC"></s:select>
										</div>
									</div>
									<div class="col-md-3">
										<div class="form-group">
										   <label for="reportType">Type Of Report</label>
										   <s:select list="reportList" name="reportType" id="reportType" cssClass="form-control" headerKey="" headerValue="Select" listKey="ITEM_CODE" listValue="ITEM_VALUE"></s:select>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12" align="center">
										<s:submit cssClass="btn btn-sm btn-success" value="Submit" onclick="funSubmit()"></s:submit>
									</div>
								</div>
							</s:else>
						</div>
					</div>
				</div>
			</div>
		</div>
		<s:token/>
	</s:form>
</body>
<script type="text/Javascript" >
function funSubmit(){
	document.commonReport.action='viewReportCommonRep.action?mode=list';
    document.commonReport.submit();
    return false;
}

funAjax('<s:property value="brokerCode"/>','userList');


function funAjax(brokerCode,id){
	postRequest('<%=request.getContextPath()%>/userAjaxCommonRep.action?brokerCode='+brokerCode+'&userCode='+'<s:property value="userCode"/>', id);
}
function funBack(action){
	document.commonReport.action=action;
    document.commonReport.submit();
    return false;
}
</script>
</html>