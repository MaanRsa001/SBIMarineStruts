<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap-multiselect.js" type="text/javascript"></script>
<link href="<%=request.getContextPath()%>/bootstrap/css//style.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.responsive.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.jqueryui.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.tableTools.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datepicker/jquery-ui.css">
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.jqueryui.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.responsive.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.tableTools.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery.dataTables.js"></script>
<script language="JavaScript">
function stopRKey(evt) { 
  var evt = (evt) ? evt : ((event) ? event : null); 
  var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null); 
  if ((evt.keyCode == 13) && (node.type=="text"))  {return false;} 
} 
document.onkeypress = stopRKey;
</script>
<style>
	#loading {
	  width: 100%;
	  height: 100%;
	  top: 0px;
	  left: 0px;
	  position: fixed;
	  display: block;
	  opacity: 0.7;
	  background-color: #fff;
	  z-index: 99;
	  text-align: center;
	}
	
	#loading-image {
	  position: absolute;
	  top: 30%;
	  left: 45%;
	  z-index: 100;
	  width: 100px;
	  height: 100px;
	}
</style>
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
<s:form id="paymentForm" name="paymentForm" method="post" theme="simple">
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<s:actionerror cssStyle="color: red;" />
	</div>
</div>
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="label.paymentterms" />
				<s:if test="reqFrom=='paymentTermsNew'">
	       			<div class="pull-right">
	       			<s:text name="OpenCover Number :"></s:text> <s:property value="%{openCoverNo}" />
	       			</div>
	       		</s:if>
			</div>
			<s:if test="reqFrom=='display'">
			<div class="panel-body" >
				<div class="row">
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
			 			<div class="text">
				 			<s:text name="label.broker" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
							<s:select name="userLoginId" id="userLoginId" list="userSelection" headerKey="" headerValue="---Select---"  listKey="LoginId" listValue="UserName" onchange="paymentSelectReport('display')" cssClass="bg-hover inputBoxS tooltipContent select2" data-content="Broker" />
				 		</div>	
			 		</div>
			 	</div>
			 	<br/>
			 	<div>
			 		<table class="table table-bordered table-stripped" id="gridTable" width="100%">
					 	<thead>
					 		
					 		<tr>
							<th> <s:text name="label.sno"/> </th>
							<th> <s:text name="label.proposalNo"/> </th>
							<th> <s:text name="label.corepolicyNo"/> </th>
							<th> <s:text name="label.customerName"/> </th>
							<th> <s:text name="label.policySatrtDate"/> </th>
							<th> <s:text name="label.entryDate"/> </th>
							<th> <s:text name="label.addedit"/> </th>
							</tr>
					 	</thead>
						<tbody>
						   	<s:iterator value="paymentTermsDetails" var="var" status="stat">
								<tr>
									<td><font style="float: left;"><s:property value="%{#stat.index+1}" /></font></td>
									<td><font style="float: left;"><s:property value="%{#var.ProposalNo}" /></font></td>
									<td><font style="float: left;"><s:property value="%{#var.BaseOpenCoverNo}" /></font></td>
									<td><font style="float: left;"><s:property value="%{#var.CustomerName}" /></font></td>
									<td><font style="float: left;"><s:property value="%{#var.PolicyStartDate}" /></font></td>
									<td><font style="float: left;"><s:property value="%{#var.PolicyIssueDate}" /></font></td>
									<td>
								    	<input type="button" name="view" value="View" class="btn btn-sm btn-info" onclick="ViewPayment('<s:property value="#var.ProposalNo"/>','<s:property value="#var.BaseOpenCoverNo"/>')" />
								    </td>
								</tr>
							</s:iterator>
						</tbody>
					 </table>
			 	</div>
			</div>
			</s:if>
			<s:elseif test="reqFrom=='paymentTerms'">
			<div class="panel-body">
			<div class="boxcontent" align="right">
					<input type="button" name="add" value="Add/Edit" class="btn btn-sm btn-primary" onclick="addnewPayment()" />
				</div>
				<table class="display responsive no-wrap" id="gridTable" width="100%" cellspacing="0">
					<thead>
						<tr>
							<th> <s:text name="label.sno"/> </th>
							<th> <s:text name="label.proposalNo"/> </th>
							<th> <s:text name="label.opencoverNo"/> </th>
							<th> <s:text name="label.policySatrtDate"/> </th>
							<th> <s:text name="label.dueAmount"/> </th>
							<th> <s:text name="label.duePercent"/> </th>
							<th> <s:text name="label.dueDate"/> </th>
							<th> <s:text name="label.effectiveDate"/> </th>
							
					</thead>
					<tbody>
						<s:iterator value="paymentTermsDetails" var="record1" status="status">
							<tr>
								<td><s:property value="%{#status.index+1}" /></td>
								<td> <s:property value="#record1.PROPOSAL_NO"/> </td>
								<td> <s:property value="#record1.MISSIPPI_OPENCOVER_NO"/> </td>
								<td> <s:property value="#record1.POLICY_START_DATE"/> </td>
								<td> <s:property value="#record1.DUE_AMOUNT"/> </td>
								<td> <s:property value="#record1.DUE_Percentage"/> </td>
								<td> <s:property value="#record1.DUE_DATE"/> </td>
								<td> <s:property value="#record1.EFFECTIVE_DATE"/> </td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
			</div>
			</s:elseif>
			<s:elseif test="reqFrom=='paymentTermsView'">
			<div class="panel-body">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						 <s:if test="paymentTerms.size()>0">
					       		<table  width="100%" class="table table-bordered table-striped"  >
									<thead>
											<tr>
												<th> <s:text name="label.opencoverNo"/> </th>
												<th> <s:text name="label.orginalOpenCoveNo"/> </th>
												<th> <s:text name="label.customerName"/> </th>
												<th> <s:text name="label.policySatrtDate"/> </th>
												<th> <s:text name="label.policyEndDate"/> </th>
												<th> <s:text name="label.totalPrmium"/> </th>
												<th> <s:text name="label.lastupdateDate"/> </th>
									</thead>
									<tbody>
										<s:iterator value="paymentTerms" var="record2" status="status">
											<tr>
												<td> <s:property value="#record2.OpenCoverNo"/> </td>
												<td> <s:property value="#record2.BaseOpenCoverNo"/> </td>
												<td> <s:property value="#record2.CustomerName"/> </td>
												<td> <s:property value="#record2.PolicyStartDate"/> </td>
												<td> <s:property value="#record2.PolicyEndDate"/> </td>
												<td> <s:property value="#record2.TotalPremium"/> </td>
												<td> <s:property value="#record2.LastUpdated"/> </td>
											</tr>
											<s:hidden name="openCoverPremium" id="openCoverPremium" value="%{#record2.TotalPremium}"/>
										</s:iterator>
									</tbody>
							</table>
							<br/>
					</s:if>
					 <s:if test="paymentTermsList.size()>0">
				       		<table  width="100%" class="table table-bordered table-striped" id="paymentTermsDetails" >
								<thead>
										<tr>
										<th > <s:text name="SNo"/> </th>
										<th width="25%"> <s:text name="label.opencoverNo"/> </th>
										<th> <s:text name="label.proposalNo"/> </th>
										<th> <s:text name="label.totalDueAmount"/> </th>
										<th> <s:text name="label.totalUdePercent"/> </th>
										<th> <s:text name="label.totalPrmium"/> </th>
										<th> <s:text name="label.addeditins"/> </th>
								</thead>
								<tbody>
									<s:iterator value="paymentTermsList" var="record1" status="status">
										<tr>
											<td><s:property value="%{#status.index+1}" /></td>
											<td>  <s:property value="#record1.MissippiOpenCoverNo"/> </td>
											<td>  <s:property value="#record1.ProposalNo"/> </td>  
											<td>   <s:property value="#record1.DueAmount"/>  </td>
											<td>  <s:property value="#record1.DuePercentage"/></td>
											<td>  <s:property value="#record1.TotalPremium"/></td>
											<td> <input type="button" name="edit" value="Update Instalment" class="btn btn-sm btn-success" onclick="editPaymentTerms('<s:property value="%{#record1.MissippiOpenCoverNo}" />','<s:property value="%{#record1.TotalPremium}" />','<s:property value="#record1.ProposalNo"/>')" /> </td>
											
										</tr>
									</s:iterator>
									
								</tbody>
							</table>
							 <div class="row">
			 					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
						            <s:submit name="back" id="back1" cssClass="btn btn-sm btn-danger" value="Back" onclick="paymentSelectReport('display')" />
						    	</div>
							</div>
					</s:if>
					<s:else>
		       			<div class="panel-body">
							<table id="paymentTermsDetails" class="table table-bordered table-striped" >
								<thead>
									<tr>
										<th ><s:text name="label.sno"/></th>
										<th ><s:text name="label.opencoverNo"/></th>
										<th ><s:text name="label.dueAmount"/></th>
										<th ><s:text name="label.duePercent"/></th>
										<th ><s:text name="label.dueDate"/></th>
										<th ><s:text name="label.effectiveDate"/></th>
										<th><input type="button" name="addadd" value="Add" class="btn btn-sm btn-primary" onclick="addQuoDocRowNew()" /></th>
									</tr>
								</thead>
								<tbody>
								<s:iterator value="openCoverNum" var="record1" status="status">
									<tr>
									<td align="center"><s:property value="%{#status.index+1}" /></td>
									<td>  
									 	<s:select name="openCoverNum[%{#status.index}]" id="openCoverNum[%{#status.index}]" list="openCoverNoList" cssClass="inputBoxS" listKey="OpenCoverNo" listValue="OpenCoverNo"  headerKey="" headerValue="Select"  />
									</td> 
									<td>
											<s:hidden name="dueList" id="dueList"></s:hidden>
								 			<s:textfield name="dueamount[%{#status.index}]" id="dueamount[%{#status.index}]" cssClass="inputBox tooltipContent"  maxlength="100"/>
									</td>
									<td>
								 			<s:textfield name="duepercent[%{#status.index}]" id="duepercent[%{#status.index}]" cssClass="inputBox tooltipContent"  maxlength="100"/>
									</td>
									<td>
								 			<s:textfield  name="dueDate[%{#status.index}]" id="dueDate" cssClass="inputBox datepicker tooltipContent dueDate" data-content="Due Date" placeholder="DD/MM/YYYY" />
								 	</td>
									<td>
								 			<s:textfield  name="effectiveDate[%{#status.index}]" id="effectiveDate" cssClass="inputBox datepicker tooltipContent effectiveDate" data-content="Due Date" placeholder="DD/MM/YYYY"/>
								 	</td>
								 	<td/>
									</tr>
									</s:iterator>
								</tbody>
							</table>
							<!-- <div class="boxcontent" align="right">
						    	<input type="button" name="addadd" value="Add" class="btn btn-sm btn-primary" onclick="addQuoDocRow()" />
						    </div> -->
						    <div class="row">
	   							 <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
						            <s:submit name="SubmitGetQuote" id="Submit" type="submit" cssClass="btn btn-sm btn-success" value="Insert" onclick="insertPayment()"/>&nbsp;&nbsp;
						            <s:submit name="back" type="back" cssClass="btn btn-sm btn-danger" value="Back" onclick="paymentSelectReport('')" />
						    	</div>
							</div>
						</div>
						</s:else>
						<div id="paymentTable" style="display: none;">
								<table id="QuoteDocTable" class="table table-bordered table-striped">
									<thead>
										<tr>
										<th ><s:text name="label.sno"/></th>
										<th ><s:text name="label.opencoverNo"/></th>
										<th ><s:text name="label.dueAmount"/></th>
										<th ><s:text name="label.duePercent"/></th>
										<th ><s:text name="label.dueDate"/></th>
										<th ><s:text name="label.effectiveDate"/></th>
										</tr>
									</thead>
									<tbody>
										
									</tbody>
								</table>
									<div class="boxcontent" align="right">
								    	<input type="button" name="addadd" value="Add" class="btn btn-sm btn-primary" onclick="addQuoDocRow()" />
								   </div>
								<div class="row">
		   							 <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
							            <s:submit name="SubmitGetQuote" id="Submit" type="submit" cssClass="btn btn-sm btn-success" value="Insert" onclick="insertPayment()"/>&nbsp;&nbsp;
							            <s:submit name="Submit2" type="submit" cssClass="btn btn-sm btn-danger" value="Back" onclick="paymentSelectReport('paymentTermsView')" />
							    	</div>
								</div>
				</div>
			</div>
			</div>
		</div>
	</s:elseif>
	<s:else>
	<div class="panel-body">
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			 <s:if test="paymentTerms.size()>0">
					       		<table  width="100%" class="table table-bordered table-striped"  >
									<thead>
											<tr>
												<th> <s:text name="label.opencoverNo"/> </th>
												<th> <s:text name="label.orginalOpenCoveNo"/> </th>
												<th> <s:text name="label.customerName"/> </th>
												<th> <s:text name="label.policySatrtDate"/> </th>
												<th> <s:text name="label.policyEndDate"/> </th>
												<th> <s:text name="label.totalPrmium"/> </th>
												<th> <s:text name="label.lastupdateDate"/> </th>
									</thead>
									<tbody>
										<s:iterator value="paymentTerms" var="record2" status="status">
											<tr>
												<td> <s:property value="#record2.OpenCoverNo"/> </td>
												<td> <s:property value="#record2.BaseOpenCoverNo"/> </td>
												<td> <s:property value="#record2.CustomerName"/> </td>
												<td> <s:property value="#record2.PolicyStartDate"/> </td>
												<td> <s:property value="#record2.PolicyEndDate"/> </td>
												<td> <s:property value="#record2.TotalPremium"/> </td>
												<td> <s:property value="#record2.LastUpdated"/> </td>
											</tr>
											<s:hidden name="openCoverPremium" id="openCoverPremium" value="%{#record2.TotalPremium}"/>
										</s:iterator>
									</tbody>
							</table>
							<br/>
					</s:if>
			 <s:if test="openCoverNum.size()>0">
		       		<table  width="100%" class="table table-bordered table-striped" id="paymentTermsDetails" >
						<thead>
								<tr>
								<th > <s:text name="SNo"/> </th>
								<th width="25%"> <s:text name="label.opencoverNo"/> </th>
								<th> <s:text name="label.dueAmount"/> </th>
								<th> <s:text name="label.duePercent"/> </th>
								<th > <s:text name="label.dueDate"/> </th>
								<th> <s:text name="label.effectiveDate"/> </th>
								<th ><input type="button" name="addadd" value="Add" class="btn btn-sm btn-primary" onclick="addQuoDocRowNew()" /> </th>
						</thead>
						<tbody>
							<s:iterator value="openCoverNum" var="record1" status="status">
								<tr>
									<td><s:property value="%{#status.index+1}" />
									<s:hidden name="dueList[%{#status.index}]" id="dueList"></s:hidden>
									</td>
									<td> <s:select list="openCoverNoList" cssClass="inputBoxS tooltipContent"   listKey="OpenCoverNo" listValue="OpenCoverNo" name="openCoverNum[%{#status.index}]" id="openCoverNum[%{#status.index}]"   disabled="true" headerKey="" headerValue="Select"  /></td> 
									<td><s:textfield name="dueamount[%{#status.index}]" id="dueamount%{#status.index}"    cssClass="inputBox tooltipContent"  maxlength="100"/> </td>
									<td><s:textfield name="duepercent[%{#status.index}]" id="duepercent%{#status.index}" cssClass="inputBox tooltipContent"  maxlength="100"/></td>
									<td> <s:textfield name="dueDate[%{#status.index}]"  id="dueDate[%{#status.index}]"  cssClass="inputBox datepicker tooltipContent dueDate"  data-content="Due Date"  placeholder="DD/MM/YYYY"/></td>
									<td> <s:textfield name="effectiveDate[%{#status.index}]" id="effectiveDate[%{#status.index}]" cssClass="inputBox datepicker tooltipContent effectiveDate"   data-content="Due Date" placeholder="DD/MM/YYYY" /></td>
									<td>	
										<input type="button" value="<s:text name='label.delete'/>" class="btn btn-sm btn-danger btn-width" onclick="disableForm(this.form,false,'');deleteRow('<s:property value="dueList[#status.index]"/>')" />
										<%-- <s:checkbox name="deleteRow[%{#stat.count-1}]" id="chk%{#stat.count}" value="dueList[%{#status.index}]" onclick="disableForm(this.form,false,'');deleteRow(this.id, this.value)"/> --%>
									</td>
							</s:iterator>
							</tbody>
					</table>
					<!-- <div class="boxcontent" align="right">
				    	<input type="button" name="addadd" value="Add" class="btn btn-sm btn-primary" onclick="addQuoDocRowNew()" />
				    </div> -->
					 <div class="row">
  							 <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
				            <s:submit name="SubmitGetQuote" id="Submit" type="submit" cssClass="btn btn-sm btn-success" value="Update" onclick="disableForm(this.form,false,'');insertPayment()"/>&nbsp;&nbsp;
				            <s:submit name="Submit2" type="submit" cssClass="btn btn-sm btn-danger" value="Back" onclick="paymentSelectReport('paymentTermsView')" />
				    	</div>
					</div>
			</s:if>
		</div>
	</div>
</div>
</s:else>	
</div>
</div>
</div>

<s:token/>
<s:hidden name="proposalNo" id="proposalNo" />
<s:hidden name="openCoverNo" id="openCoverNo" />
<s:hidden name="reqFrom" id="reqFrom" />
<s:hidden name="sno" id="sno" />
<s:hidden name="missippiOpenCoverNo" id="missippiOpenCoverNo"/>
<s:if test="reqFrom !='display'">
		<s:hidden name="userLoginId" id="userLoginId"></s:hidden>
</s:if>
</s:form>
<script type="text/javascript">
$(function() {
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
function paymentSelectReport(reqForm1){
	document.paymentForm.reqFrom.value=reqForm1;
	document.paymentForm.action = 'initPaymentTerm.action';
	document.paymentForm.submit();
}
function ViewPayment(val,openCoverNo){
	document.paymentForm.action = 'initPaymentTerm.action';
	document.paymentForm.proposalNo.value=val;
	document.paymentForm.openCoverNo.value=openCoverNo;
	document.paymentForm.reqFrom.value='paymentTermsView';
	document.paymentForm.submit();
}
function insertPayment(val,sNo,amendId){
	disableForm(paymentForm,false,'');
	//document.paymentForm.reqFrom.value='addNew';
	document.paymentForm.action = 'addPaymentTerm.action';
	document.paymentForm.submit();
}	
function editPaymentTerms(val,premium,proposal){
	document.paymentForm.action = 'initPaymentTerm.action';
	document.paymentForm.missippiOpenCoverNo.value=val;
	document.paymentForm.openCoverPremium.value=premium;
	document.paymentForm.proposalNo.value=proposal;
	document.paymentForm.reqFrom.value='paymentTermsNew';
	document.paymentForm.submit();
}
function createDocList(cell, rowCount){
	element = document.createElement("select");
	element.className = "inputBoxS tooltipContent";
	element.name ="openCoverNum["+(rowCount-1)+"]";
	element.id = "openCoverNum["+(rowCount-1)+"]";
		var objOption = document.createElement("option");
	 objOption.text = '-Select-';
	 objOption.value = '';
 	if(document.all && !window.opera){
 		element.add(objOption);
		}else{
 			element.add(objOption, null);
 		}
		 <s:iterator value="openCoverNoList">
    	 var objOption = document.createElement("option");
     	objOption.text = '<s:property value="OpenCoverNo"/>';
     	objOption.value = '<s:property value="OpenCoverNo"/>';
     	if(document.all && !window.opera){
     		element.add(objOption);
     	}else{
     		element.add(objOption, null);
     }
 </s:iterator>
 
element.value=document.paymentForm.missippiOpenCoverNo.value;
//element.disabled=true;
cell.appendChild(element);
}

function addQuoDocRowNew(){
var table = document.getElementById('paymentTermsDetails');
var rowCount = table.rows.length;
var row = table.insertRow(rowCount);

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
	createDocList(cell, rowCount);	 

cell = row.insertCell(2);
var element = document.createElement("input");
element.className = "inputBox";
element.name = "dueamount["+(rowCount-1)+"]";
element.id = "dueamount["+(rowCount-1)+"]";
element.type = "text";

cell.appendChild(element);

cell = row.insertCell(3);
var element = document.createElement("input");
element.className = "inputBox";
element.name = "duepercent["+(rowCount-1)+"]";
element.id = "duepercent["+(rowCount-1)+"]";
element.type = "text";
cell.appendChild(element);

cell = row.insertCell(4);
var element = document.createElement("input");
    element.type = "text";
    element.setAttribute("placeholder",'DD/MM/YYYY'); 
    element.setAttribute("maxlength",'10'); 
    element.className = "inputBox datepicker  tooltipContent dueDate";
    element.name = "dueDate["+(rowCount-1)+"]";
    element.id = "dueDate";        
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

cell = row.insertCell(5);
	var element = document.createElement("input");
    element.type = "text";
    element.setAttribute("placeholder",'DD/MM/YYYY'); 
    element.setAttribute("maxlength",'10'); 
    element.className = "inputBox datepicker effectiveDate tooltipContent";
    element.name = "effectiveDate["+(rowCount-1)+"]";
    element.id = "effectiveDate";            
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
cell = row.insertCell(6);
var element9 = document.createElement("input");
element9.type = "button";

element9.value="<s:text name='label.delete'/>";
element9.setAttribute("onclick", "deleteRow('"+(rowCount)+"')");
element9.className="btn btn-sm btn-danger btn-width"
cell.appendChild(element9);


}
function deleteRow(val) {
	disableForm(paymentForm,false,'');
	if(val==0){
		alert("First row can't be deleted");
	}
	else{
		var status=confirm("Do you want to delete specified row");
		if(status){
			document.getElementById("sno").value=val;
			document.paymentForm.action = 'deletePaymentTerm.action';
			document.paymentForm.submit();
		}
		}  
		
}
function disableForm(theform, disable, exclude) {
if (document.all || document.getElementById) {
	for (i = 0; i < theform.length; i++) {
	var formElement = theform.elements[i];
		if (exclude.indexOf(formElement.name.toString().indexOf("[")!=-1?formElement.name.toString().substring(0,formElement.name.toString().indexOf("[")):formElement.name.toString())==-1) {
			formElement.disabled = disable;
		}
	}
}
}
</script>	
</body>
</html>