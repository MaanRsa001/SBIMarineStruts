<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
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
	<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/AlRajhi_icon_header.jpg" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/datepicker3.css">	 
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css" />	
	<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap-datepicker.js" type="text/javascript"></script>
	<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap-3.2.0.min.js" type="text/javascript"></script>
	<script type="text/javascript">
  	jQuery(function ($) {
  		try {
  			var data = $('#gridTable').dataTable( {
				"lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
				"order": [[0, "asc" ]],
				"columnDefs": [ {
		          "targets": 'no-sort',
		          "orderable": false
			    } ],
				responsive: true
			});
			var data1 = $('#record').dataTable( {
				"lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
				"order": [[ 0, "asc" ]],
				"columnDefs": [ {
		          "targets": 'no-sort',
		          "orderable": false
			    } ],
				responsive: true
			});
			
			$('#dueDate1').datepicker({
					todayHighlight: true,
		        	format: "dd/mm/yyyy",
		        	yearRange: "-100:+0",
				  	viewMode: "years"
				  	//endDate: dt
				}).on('changeDate', function(e){
		            $(this).datepicker('hide');
		        });
	 
	 		$('#effectiveDatePT1').datepicker({
					todayHighlight: true,
		        	format: "dd/mm/yyyy",
		        	yearRange: "-100:+0",
				  	viewMode: "years"
				  	//endDate: dt
				}).on('changeDate', function(e){
		            $(this).datepicker('hide');
		        });		        
		} catch(err){}
	} );
</script>

	  
</head>
<body>
<table width="100%" >
<tr>
<td>
<s:form id="paymentForm" name="paymentForm" method="post"  theme="simple">
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<s:actionerror cssStyle="color: red;" />
	</div>
</div>

<div class="panel panel-primary">
	
			<div class="panel-heading">
	       		Payment Terms	
	       		<s:if test="reqFrom=='paymentTermsNew'">
	       			<div class="pull-right">
	       			<s:text name="Policy Number :"></s:text> <s:property value="%{policyNo}" />
	       			</div>
	       		</s:if>
	       	</div>
	<s:if test="reqFrom=='display'">
	<div class="panel-body">
		
		<div class="row">
			<div class="col-xs-12">
				<table class="display responsive no-wrap" id="gridTable" width="100%" cellspacing="0">
					<thead>
						<tr>
							<th> <s:text name="snoPT"/> </th>
							<th> <s:text name="Quote No"/> </th>
							<th> <s:text name="Policy No"/> </th>
							<th> <s:text name="Customer Name"/> </th>
							<th> <s:text name="Entry Date"/> </th>
							<th> <s:text name="Add/Edit"/> </th>
							
					</thead>
					<tbody>
						<s:iterator value="paymentTermsDetails" var="record1" status="status">
						<tr>
							<td><s:property value="%{#status.index+1}" /></td>
							<td> <s:property value="#record1.QUOTE_NO"/> </td>
							<td> <s:property value="#record1.POLICY_NO"/> </td>
							<td> <s:property value="#record1.CUS_NAME"/> </td>
							<td> <s:property value="#record1.INCEPTION_DATE"/> </td>
							<td>
					    	<input type="button" name="view" value="Add / Edit" class="btn btn-sm btn-info" onclick="ViewPayment('<s:property value="#record1.POLICY_NO"/>','<s:property value="#record1.QUOTE_NO"/>')" />
					    </td>
						</tr>
						</s:iterator>
					</tbody>
				</table>
			</div>
		</div>	
		 <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
            <s:submit name="Submit2" type="submit" cssClass="btn btn-sm btn-danger" value="Back" onclick="paymentSelectReport('back')" />
    	</div>	
	</div>
	</s:if>
	<s:elseif test="reqFrom=='search'">
						<div class="row">
								
								<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
									<div class="text">
										<s:label key="Enter Policy No For Search"/>
									</div>
									<div class="tbox">
										<s:textfield name="searchValue" cssClass="inputBox" />
									</div>
								</div>
								<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4" align="center" style="padding-top: 10px;">
									<s:submit type="button" name="Go"  key="Submit" cssClass="btn btn-sm btn-success" cssStyle="" onclick="paymentSelectReport('search')" />
								</div>
							</div>
							<div class="row">
   							 <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
					            <s:submit name="Submit2" type="submit" cssClass="btn btn-sm btn-danger" value="Back" onclick="paymentSelectReport('back')" />
					    	</div>
							</div>
	</s:elseif>
	<s:elseif test="reqFrom=='paymentTerms'">
	<div class="panel-body">
	<div class="boxcontent" align="right">
			<input type="button" name="add" value="Add/Edit" class="btn btn-sm btn-primary" onclick="addnewPayment()" />
		</div>
		<table class="display responsive no-wrap" id="gridTable" width="100%" cellspacing="0">
			<thead>
				<tr>
					<th> <s:text name="snoPT"/> </th>
					<th> <s:text name="Proposal No"/> </th>
					<th> <s:text name="Policy No"/> </th>
					<th> <s:text name="Policy Start Date"/> </th>
					<th> <s:text name="Due Amount"/> </th>
					<th> <s:text name="Due Percent"/> </th>
					<th> <s:text name="Due Date"/> </th>
					<th> <s:text name="Effective Date"/> </th>
					
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
	<s:else>
	<div class="panel-body">
	<div class="row">
		
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			
			 <s:if test="paymentTermsDetails.size()>0">
		       		<table  width="100%" class="table table-bordered table-striped" id="paymentTermsDetails" >
						<thead>
								<tr>
								<th > <s:text name="Sno"/> </th>
								<th> <s:text name="Due Amount"/> </th>
								<th> <s:text name="Due Percent"/> </th>
								<th > <s:text name="Due Date"/> </th>
								<th> <s:text name="Effective Date"/> </th>
								<s:if test='menuBlocker=="bulkreport" || "RSAIssuer".equalsIgnoreCase(#session.usertype)'>
									<th > <s:text name="Edit"/> </th>
									<th ><s:text name="Delete"/> </th>
									<th ><s:text name="Update"/> </th>
								</s:if>
						</thead>
						<tbody>
							<s:iterator value="paymentTermsDetails" var="record1" status="status1">
								<tr>
									<td><s:property value="%{#status1.index+1}" /></td>
									<td> <s:textfield id="dueamount%{#status1.index+1}" value="%{#record1.DUE_AMOUNT}" disabled="true"  cssClass="form-control tooltipContent"  maxlength="100"/> </td>
									<td><s:textfield  id="duepercent%{#status1.index+1}" value="%{#record1.DUE_Percentage}" disabled="true" cssClass="form-control tooltipContent"  maxlength="100"/></td>
									<td> <s:textfield id="dueDate%{#status1.index+1}"  cssClass="form-control datepicker tooltipContent" disabled="true" value="%{#record1.DUE_DATE}" data-content="Due Date"  /></td>
									<td> <s:textfield id="effectiveDatePT%{#status1.index+1}" cssClass="form-control datepicker tooltipContent" disabled="true" value="%{#record1.EFFECTIVE_DATE}" data-content="Due Date"  /></td>
									<s:if test='menuBlocker=="bulkreport" || "RSAIssuer".equalsIgnoreCase(#session.usertype)'>
										<td> <input type="button" name="edit" value="Edit" class="btn btn-sm btn-warning" onclick="editPayment(<s:property value="%{#status1.index+1}" />)" /> </td>
										<td> <input type="button" name="delete" id="delete<s:property value='%{status1.index+1}'/>"   style="display: none; " value="Delete" class="btn btn-sm btn-danger" onclick="UpdatePayment('<s:property value="%{#status1.index+1}" />', '<s:property value="#record1.sno"/>','<s:property value="#record1.AMEND_ID"/>','delete')" /> </td>
										<td> <input type="button" name="update" id="update<s:property value='%{status1.index+1}'/>" style="display: none; "  value="Update" class="btn btn-sm btn-info" onclick="UpdatePayment('<s:property value="%{#status1.index+1}" />', '<s:property value="#record1.sno"/>','<s:property value="#record1.AMEND_ID"/>','update')" /> </td>
									</s:if>
								</tr>
							</s:iterator>
							<tr>
								<td colspan="8" align="right">
							    	<input type="button" name="addpayment" value="Add New Payment" class="btn btn-sm btn-primary" onclick="addnewPayment()" />
									<s:hidden name="userLoginId" id="userLoginId"></s:hidden>
								</td>
							</tr>
						</tbody>
				</table>
				 <div class="row">
 					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
			            <s:submit name="back" id="back1" cssClass="btn btn-sm btn-danger" value="Back" onclick="paymentSelectReport('back')" />
			    	</div>
				</div>
		</s:if>
		<s:else>
			<s:if test='menuBlocker=="bulkreport" || "RSAIssuer".equalsIgnoreCase(#session.usertype)'>
       			<div class="panel-body">
					<table id="QuoteDocTable" class="table table-bordered table-striped" >
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
							<tr>
							<td align="center">1</td>
							 
							<td>
									<s:hidden name="dueList" id="dueList"></s:hidden>
						 			<s:textfield name="dueamount" id="dueamount" cssClass="form-control tooltipContent"  maxlength="100"/>
							</td>
							<td>
						 			<s:textfield name="duepercent" id="duepercent" cssClass="form-control tooltipContent"  maxlength="100"/>
							</td>
							<td>
						 			<s:textfield id="dueDate1" name="dueDate" cssClass="form-control datepicker tooltipContent" data-content="Due Date"  />
						 	</td>
							<td>
						 			<s:textfield id="effectiveDatePT1" name="effectiveDatePT" cssClass="form-control datepicker tooltipContent" data-content="Due Date"/>
						 	</td>
						 	<td/>
							</tr>
						</tbody>
					</table>
						<div class="boxcontent" align="right">
					    	<input type="button" name="addadd" value="Add" class="btn btn-sm btn-primary" onclick="addQuoDocRow()" />
					    </div>
					    <div class="row">
   							 <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
					            <s:submit name="SubmitGetQuote" id="Submit" type="submit" cssClass="btn btn-sm btn-success" value="Insert" onclick="insertPayment()"/>&nbsp;&nbsp;
					            <s:submit name="back" type="back" cssClass="btn btn-sm btn-danger" value="Back" onclick="paymentSelectReport('back')" />
					    	</div>
						</div>
					</div>
					</s:if>
					<s:else>
					     <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
					            No record found&nbsp;&nbsp;
					    </div>
					</s:else>
				</s:else>
				<div id="paymentTable" style="display: none;">
						<table id="QuoteDocTable" class="table table-bordered table-striped">
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
								
							</tbody>
						</table>
							<div class="boxcontent" align="right">
						    	<input type="button" name="addadd" value="Add" class="btn btn-sm btn-primary" onclick="addQuoDocRow()" />
						   </div>
						<div class="row">
   							 <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
					            <s:submit name="SubmitGetQuote" id="Submit" type="submit" cssClass="btn btn-sm btn-success" value="Insert" onclick="insertPayment()"/>&nbsp;&nbsp;
					            <s:submit name="Submit2" type="submit" cssClass="btn btn-sm btn-danger" value="Back" onclick="paymentSelectReport('back')" />
					    	</div>
						</div>
		</div>
	</div>
	</div>
	</div>
	</s:else>
	<s:hidden name="policyNo" id="policyNo"></s:hidden>
	<s:hidden name="reqFrom" id="reqFrom"></s:hidden>
	<s:hidden name="snoPT" id="snoPT"></s:hidden>
	<s:hidden name="branch" id="branch"></s:hidden>
	<s:hidden name="amendId" id="amendId"></s:hidden>
	<s:hidden name="quoteNo" id="quoteNo"></s:hidden>
	<s:hidden name="openCoverNo" id="openCoverNo"></s:hidden>
	<s:hidden name="menuBlocker" id="menuBlocker"></s:hidden>
</div>
<s:token/>
</s:form>		
</td>
</tr>
</table>
<script type="text/javascript">
	function paymentSelectReport(val){
		document.paymentForm.reqFrom.value='display';
		var val2=document.paymentForm.menuBlocker.value;
		document.paymentForm.action = 'paymentTermsPremium.action';
		if(val=='back'){
			document.paymentForm.reqFrom.value='search';
			if(val2=='bulkreport'){
				document.paymentForm.action = 'insertTransMarineVehicle';
			}else{
				document.paymentForm.action = 'paymentTermsPremium.action';
			}
		}
		
		document.paymentForm.submit();
	}
	function ViewPayment(val,qNo){
		document.paymentForm.action = 'paymentTermsPremium.action';
		document.paymentForm.policyNo.value=val;
		document.paymentForm.quoteNo.value=val;
		document.paymentForm.reqFrom.value='paymentTermsNew';
		document.paymentForm.submit();
}
	function addnewPayment(){
		document.getElementById('paymentTable').style.display="";
		document.getElementById('back1').style.display='none';
		addQuoDocRow();
	}
	
	
	function editPayment(val){
		var dueId='dueDate'+val;
		var effId='effectiveDatePT'+val;
		var dueamountId='dueamount'+val;
		var duepercentId='duepercent'+val;
		var updateId='update'+val;
		var deleteId='delete'+val;
		document.getElementById(dueId).disabled=false;
		document.getElementById(effId).disabled=false;
		document.getElementById(dueamountId).disabled=false;
		document.getElementById(duepercentId).disabled=false;		
		document.getElementById(updateId).style.display="";
		document.getElementById(deleteId).style.display="";
		$(function() {
	        	var dt = new Date();
				dt.setFullYear(new Date().getFullYear()-18);
				$('#'+dueId+'').datepicker({
					todayHighlight: true,
		        	format: "dd/mm/yyyy",
		        	yearRange: "-100:+0",
				  	viewMode: "years"
				  	//endDate: dt
				}).on('changeDate', function(e){
		            $(this).datepicker('hide');
		        });
			});
		
		$(function() {
	        	var dt = new Date();
				dt.setFullYear(new Date().getFullYear()-18);
				$('#'+effId+'').datepicker({
					todayHighlight: true,
		        	format: "dd/mm/yyyy",
		        	yearRange: "-100:+0",
				  	viewMode: "years"
				  	//endDate: dt
				}).on('changeDate', function(e){
		            $(this).datepicker('hide');
		        });
			});
	}	
	
	function UpdatePayment(val,snoPT,amendId,req){
		var error='';
		var dueDate= document.getElementById('dueDate'+val).value;
		var effectiveDatePT=document.getElementById('effectiveDatePT'+val).value;
		var dueamount=document.getElementById('dueamount'+val).value;
		var duepercent=document.getElementById('duepercent'+val).value;	
		document.paymentForm.amendId.value=amendId;
		document.paymentForm.snoPT.value=snoPT;
		document.paymentForm.reqFrom.value=req;
		document.paymentForm.action = 'updateDuePremium.action?dueDate='+dueDate+'&effectiveDatePT='+effectiveDatePT+'&duepercent='+duepercent+'&dueamount='+dueamount;
		document.paymentForm.submit();
		
		
	}
	function insertPayment(val,snoPT,amendId){
		document.paymentForm.reqFrom.value='addNew';
		document.paymentForm.action = 'updateDuePremium.action';
		document.paymentForm.submit();
		
		
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
		element.name = "dueList";
		element.type = "hidden";
		element.value=rowCount-1;
		cell.appendChild(element);    
	   
		
		
		cell = row.insertCell(1);
		var element = document.createElement("input");
		element.className = "form-control";
		element.name = "dueamount";
		element.id = "dueamount["+(rowCount-1)+"]";
		element.type = "text";
		
		cell.appendChild(element);
		
		cell = row.insertCell(2);
		var element = document.createElement("input");
		element.className = "form-control";
		element.name = "duepercent";
		element.id = "duepercent["+(rowCount-1)+"]";
		element.type = "text";
		cell.appendChild(element);
		
		cell = row.insertCell(3);
		var element = document.createElement("input");
	        element.type = "text";
	        element.setAttribute("placeholder",'DD/MM/YYYY'); 
	        element.setAttribute("maxlength",'10'); 
	        element.className = "form-control datepickerTable";
	        element.name = "dueDate";
	        element.id = "dueDate"+rowCount+"";            
	        cell.appendChild(element);
	        $(function() {
	        	var dt = new Date();
				dt.setFullYear(new Date().getFullYear()-18);
				$('#dueDate'+rowCount+'').datepicker({
					todayHighlight: true,
		        	format: "dd/mm/yyyy",
		        	yearRange: "-100:+0",
				  	viewMode: "years"
				  	//endDate: dt
				}).on('changeDate', function(e){
		            $(this).datepicker('hide');
		        });
			});
		cell.appendChild(element);
		
		cell = row.insertCell(4);
			var element = document.createElement("input");
	        element.type = "text";
	        element.setAttribute("placeholder",'DD/MM/YYYY'); 
	        element.setAttribute("maxlength",'10'); 
	        element.className = "form-control datepickerTable";
	        element.name = "effectiveDatePT";
	        element.id = "effectiveDatePT"+rowCount+"";            
	        cell.appendChild(element);
	        $(function() {
	        	var dt = new Date();
				dt.setFullYear(new Date().getFullYear()-18);
				$('#effectiveDatePT'+rowCount+'').datepicker({
					todayHighlight: true,
		        	format: "dd/mm/yyyy",
		        	yearRange: "-100:+0",
				  	viewMode: "years"
				  	//endDate: dt
				}).on('changeDate', function(e){
		            $(this).datepicker('hide');
		        });
			});
		cell.appendChild(element);
			
		cell = row.insertCell(5);
		cell.align = "center";
		cell.setAttribute('colSpan', '2');
		var element = document.createElement("input");
		element.type = "checkbox";
		element.id = "chk"+rowCount;
		element.onclick = function () {deleteRow(this.id,this)};	
	    cell.appendChild(element);
	}
			
		function deleteRow(id, el) {
				var decision = confirm("Row will be deleted. Do You Want to continue? ","");
				if (decision==true){
					while (el.parentNode && el.tagName.toLowerCase() != 'tr') {
						el = el.parentNode;
					}
					if (el.parentNode && el.parentNode.rows.length > 1) {
						el.parentNode.removeChild(el);
					}
				} else {
					document.getElementById(id).checked=false;
				}	   
			
		}
			
			
			
</script>	
</body>
</html>