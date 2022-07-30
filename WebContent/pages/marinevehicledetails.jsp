<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
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
  			var data = $('#gridTable').dataTable( {
				"lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
				"order": [[ 1, "desc" ]],
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
  	</script>
  	<script type="text/javascript">
	
	  </script>	
</head>
<body>
<s:if test="display=='upload'">
<s:form action="uploadMarineVehicle" method="post" enctype="multipart/form-data" theme="simple" id="uploadForm" >
	<div class="panel panel-primary">
		<div class="panel-heading">
			<s:text name="upload.fileUpload" />
		</div>
		
		<div class="panel-body">
			<div class="row">
				<div class="col-xs-12">
					<s:actionerror cssStyle="color:red;"/>
					<s:fielderror cssStyle="color:red;" />
					<s:if test='"Y".equals(reUpload)'>
					 <center> <a class="btn btn-sm btn-success" onclick="duplicateUpload('<s:property value="%{tranId}" />');"> View Duplicate Records
					</a></center></s:if>
				</div>
			</div>
			
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
				<s:if test="openCoverNo!=null && openCoverNo!=''">
					<table width="100%">						
						<tr>
							<td width="50%"><s:label key="Open Cover No" /></td>
							<td width="50%">:<s:property value="openCoverNo"/></td>
						</tr>
					</table>
					</s:if>
				</div>
			<s:if test="marineVehicleDetails.size()>0">
			<table class="display responsive no-wrap" id="gridTable" width="100%" cellspacing="0">
					<thead>
						<tr>
							<th> <s:text name="label.SNo"/> </th>
							<th> <s:text name="label.tranid"/> </th>
							<th> <s:text name="label.assetNo"/> </th>
							<th> <s:text name="label.plateNo"/> </th>
							<th> <s:text name="label.chaseNo"/> </th>
							<th> <s:text name="label.make"/> </th>
							<th> <s:text name="label.desc"/> </th>
							<th> <s:text name="label.sequence"/> </th>
							<th> <s:text name="label.year"/> </th>
							<th> <s:text name="label.limit"/> </th>
							<th> <s:text name="label.actualPremium"/> </th>
							<th> <s:text name="label.refundPremium"/> </th>
							<th> <s:text name="label.entryDate"/> </th>
							<th> <s:text name="label.effectiveDate"/> </th>
							<th> <s:text name="label.expiryDate"/> </th>
							<th> <s:text name="label.status"/> </th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="marineVehicleDetails" var="record1" status="status">
						<tr>
							<td><s:property value="%{#status.index+1}" /></td>
							<td> <s:property value="#record1.TranId"/> </td>
							<td> <s:property value="#record1.AssertNo"/> </td>
							<td> <s:property value="#record1.PlateNo"/> </td>
							<td> <s:property value="#record1.ChassisNo"/> </td>
							<td> <s:property value="#record1.Make"/> </td>
							<td> <s:property value="#record1.Desciption"/> </td>
							<td> <s:property value="#record1.SequenceNo"/> </td>
							<td> <s:property value="#record1.ManufactureYear"/> </td>
							<td> <s:property value="#record1.LIMIT"/> </td>
							<td> <s:property value="#record1.ActualPremium"/> </td>
							<td> -<s:property value="#record1.RefundPremium"/> </td>
							<td> <s:property value="#record1.EntryDate"/> </td>
							<td> <s:property value="#record1.InceptionDate"/> </td>
							<td> <s:property value="#record1.ExpiryDate"/> </td>
							<td> <s:property value="#record1.STATUS"/> </td>
						</tr>
						</s:iterator>
					</tbody>
				</table>
				<div class="row">
				<div class="col-xs-12">
					<div id="loaderImage" style="display:none">
								<b><s:label key="upload.progress" cssStyle="color:#073e8f" /></b>
						<br>
						<img src='<%=request.getContextPath()%>/images/ajax-loader.gif' width="50px" height="50px"/>
						<br>
					</div>
				</div>
			</div>
			<hr/>
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			<div class="row" id="reupload" style="display:none">
				<div class="col-sm-12 col-md-4">
					<s:label key="upload.fileToUpload"/><font color="red">*</font> <br/>
					<s:file name="upload" cssClass="form-control" />
				</div>
				<div class="col-sm-12 col-md-6" align="center">
					<s:submit align="left" cssClass="btn btn-sm btn-primary" key="upload.upload" onclick="loaderImage()"/>
				</div>
			</div>
			</div>
			<s:hidden name="baseOpenCoverNo" id="baseOpenCoverNo"/>
				</s:if>
				<s:else>
			<div class="row">
				<div class="col-xs-12">
					<div id="loaderImage" style="display:none">
								<b><s:label key="upload.progress" cssStyle="color:#073e8f" /></b>
						<br>
						<img src='<%=request.getContextPath()%>/images/ajax-loader.gif' width="50px" height="50px"/>
						<br>
					</div>
				</div>
			</div>
			<hr/>
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			<div class="row" >
				<div class="col-sm-12 col-md-4">
					<s:label key="upload.fileToUpload"/><font color="red">*</font> <br/>
					<s:file name="upload" cssClass="form-control" />
				</div>
				<div class="col-sm-12 col-md-6" align="center">
					<s:submit align="left" cssClass="btn btn-sm btn-primary" key="upload.upload" onclick="loaderImage()"/>
				</div>
			</div>
			</div>
			<br/>
			</s:else>
				<div>
				<br>	
				<div class="col-sm-12" align="center">					
					<button type="button" class="btn btn-danger"  onclick="getTranList();">Back</button>
					<s:hidden name="typeId" />
					<s:hidden name="openCoverNo" id="openCoverNo"/>
					<s:hidden name="proposalNo" id="proposalNo"/>
					<s:hidden name="customerName" id="customerName"/>
					<s:hidden name="startDate" id="startDate"/>
					<s:hidden name="endDate" id="endDate"/>
					<s:hidden name="brokerId" id="brokerId"/>
					<s:hidden name="endtYN" id="endtYN"/>
					<s:hidden name="lapsedStatus" id="lapsedStatus"/>
					<s:hidden name="vatTaxPrecent" id="vatTaxPrecent"/>
				</div>
			</div>
		</div>
	</div>
	<s:token/>
</s:form>
</s:if>

<s:elseif test="display=='result'">
<s:form  method="post" theme="simple" id="vehicleForm" >
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-body">
			<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
					<table width="100%">						
						<tr>
							<td width="50%"><s:label key="label.baseOpenCoverNo" /></td>
							<td width="50%">:<s:property value="openCoverNo"/></td>
							
						</tr> 
					</table>
				</div>
				</div>
				<div class="tablerow" align="right">
				 <a class="btn btn-sm btn-info" onclick="transactionDet();">Transaction Detail</a>
				<s:if test='"N".equals(lapsedStatus) '>
					 <a class="btn btn-sm btn-success" onclick="AddUpload();"> ADD Vehicle</a>
					 <a class="btn btn-sm btn-danger" onclick="deleteUpload('');"> Delete Vehicle</a>
					 <!-- <a class="btn btn-primary active" onclick="paymentTerms();"> PayMent Terms</a> -->
					 <a class="btn btn-sm btn-primary" onclick="transactionUpload();"> UnApproved Policy</a>
				</s:if> 
				
					 <a class="btn btn-sm btn-info" onclick="activeUpload();"> Active Vehicle</a>
					 <a class="btn btn-sm btn-warning" onclick="deletedUpload();"> Deleted Vehicle</a>
					
			</div>
				<table class="display responsive no-wrap" id="gridTable" width="100%" cellspacing="0">
					<thead>
						<tr>
							<th> <s:text name="label.SNo"/> </th>
							<th> <s:text name="label.tranid"/> </th>
							<th> <s:text name="label.uploadDate"/> </th>
							<th> <s:text name="label.policyNo"/> </th>
							<th> <s:text name="label.totalRecords"/> </th>
							<th> <s:text name="label.Premium"/> </th>
							<s:if test='!"N".equals(status)'>
							<th> <s:text name="label.schedule"/> </th>
							<th> <s:text name="label.vehicleCredit"/> </th>
							<th> <s:text name="label.vehicleDebit"/> </th>
						</s:if>
						<s:else>
						<th> <s:text name="Edit"/> </th>
						</s:else>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="transDetails" var="record1" status="stat">
						<tr>
							<td><s:property value="%{#stat.index+1}" /></td>
							<td> <s:property value="#record1.TranId"/> </td>
							<td> <s:property value="#record1.EntryDate"/> </td>
							<td> <s:property value="#record1.PolicyNo"/> </td>
							<td> 
							<a href="#" onclick="getTransDetails('<s:property value="#record1.TranId"/>','<s:property value="#record1.Status"/>')"> <s:property value="#record1.Totalrecords"/></a> 
							 </td>
							<td><s:property value="#record1.Premium"/>  </td>
							<s:if test='!"N".equals(status)'>
							<td>	
									<a href="#" type="button"  class="btn btn-sm btn-primary" onClick="getSchedule('<s:property value="#record1.PolicyNo"/>')"><i class="glyphicon glyphicon-book"></i></a>
							</td>	
							<td>	
									<a href="#" type="button" class="btn btn-sm btn-warning" onClick="getCredit('<s:property value="%{#session.user}"/>','<s:property value="#record1.PolicyNo"/>')"><i class="glyphicon glyphicon-book"></i></a>
							</td>
							<td>	
									<a href="#" type="button"  class="btn btn-sm btn-info"  onClick="getDebit('<s:property value="#record1.PolicyNo"/>')"><i class="glyphicon glyphicon-book"></i></a>
							</td>	
							</s:if>	
							<s:else>
							<td>	
									<a href="#" type="button"  class="btn btn-sm btn-info"  onClick="getVehicleEdit('<s:property value="#record1.TranId"/>')">Edit</a>
							</td>	
							</s:else>				
							</tr>
						</s:iterator>
					</tbody>
				</table>
				<br>
				<table  class="table table-bordered"  width="100%">
					<thead>
						<tr>
							<th>S.No</th>
							<th>Haulier Category</th>
							<th>Start Limit</th>
							<th>End Limit</th>
							<!--<th>No. of vehicle</th>
							--><th>Premium (per vehicle) </th>
						</tr>
					</thead>
						<tbody>
						<s:iterator value="haulierDetails" var="record1" status="status">
										<tr>
											<td><s:property value="%{#status.index+1}" /></td>
											<td> <s:property value="#record1.HaulierCategory"/> </td>
											<td> <s:property value="#record1.StartLimit"/> </td>
											<td> <s:property value="#record1.EndLimit"/> </td><!--
											<td> <s:property value="#record1.NO_OF_VEHICLES"/> </td>
											--><td><s:property value="#record1.HaulierPremium"/>  </td>
											
										</tr>
										</s:iterator>
						</tbody>
			</table>
				<div class="row" align="center">
					<button type="button" class="btn btn-danger"  onclick="getHalierDetails();">Back</button>
					<s:hidden name="proposalNo" id="proposalNo"/>
					<s:hidden name="brokerId" id="brokerId"/>
					<s:hidden name="refundchargeamount" id="refundchargeamount"/>
					<s:hidden name="openCoverNo" id="openCoverNo"/>
					<s:hidden name="endtYN" id="endtYN"/>
					<s:hidden name="reqFrom" id="reqFrom"/>
					<s:hidden name="policyNo" id="policyNo"/>
					<s:hidden name="lapsedStatus" id="lapsedStatus"/>
					<s:hidden name="vatTaxPrecent" id="vatTaxPrecent"/>
				</div>
			</div>
		</div>		
	</div>
</div>
<s:token/>
</s:form>
</s:elseif>
<s:elseif test="display=='delete'">
<s:form  method="post" theme="simple" id="vehicleForm" >
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
		<div class="panel-body">
		<div class="row">
				<div class="col-xs-12">
					<s:actionerror cssStyle="color:red;"/>
					<s:fielderror cssStyle="color:red;" />
				</div>
			</div>
			<table width="100%">
				<tr>
					<td width="10%">&nbsp;</td>
					<td width="30%">
						<s:label key="vehicle.searchBy" />
						<s:select name="searchType" id="searchType" list="#{'tranId':'Tran ID','assetNo':'Asset No','plateNo':'Plate No','chaseNo':'Chase No'}"  headerKey="" headerValue="---Select---" cssClass="form-control" cssStyle="width: 100%;" />
					</td>
					<td width="5%"></td>
					<td width="30%">								
						<s:label key="vehicle.enterDataForSearch"/>
						<s:textfield name="searchValue"  cssClass="form-control"/>	
					</td>	
					<td width="5%"></td>				
					<td width="10%">
						<button type="button" class="btn btn-success"  onclick="searchVehicle();">Search</button>
					</td>	
					<td width="10%">&nbsp;</td>		
				</tr>		
				</table>
			</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
							<table width="100%">						
								<tr>
									<td width="50%"><s:label key="label.baseOpenCoverNo" /></td>
									<td width="50%">:<s:property value="baseOpenCoverNo"/></td>
								</tr>
							</table>
						</div>
				</div>	
				<table class="display responsive no-wrap" id="gridTable" width="100%" cellspacing="0">
					<thead>
						<tr>
							<th></th>
							<th></th>
							<th> <s:text name="label.SNo"/> </th>
							<th> <s:text name="label.proposalNo"/> </th>
							<th> <s:text name="label.tranid"/> </th>
							<th> <s:text name="label.assetNo"/> </th>
							<th> <s:text name="label.plateNo"/> </th>
							<th> <s:text name="label.chaseNo"/> </th>
							<th> <s:text name="label.make"/> </th>
							<th> <s:text name="label.desc"/> </th>
							<th> <s:text name="label.sequence"/> </th>
							<th> <s:text name="label.year"/> </th>
							<th> <s:text name="label.limit"/> </th>
							<th> <s:text name="label.actualPremium"/> </th>
							<th> <s:text name="label.refundPremium"/> </th>
							<th> <s:text name="label.entryDate"/> </th>
							<th> <s:text name="label.effectiveDate"/> </th>
							<th> <s:text name="label.expiryDate"/> </th>
							<th> <s:text name="label.status"/> </th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="marineVehicleDetails" var="record1" status="status">
						<tr>
						<td></td>
						<td><s:checkbox name="checkvalue[%{#status.index}]" fieldValue="true"/></td>
							<td><s:property value="%{#status.index+1}" /> <s:hidden name="sno[%{#status.index}]" value="%{#record1.Sno}"/> </td>
							<td> <s:property value="#record1.ProposalNo"/>
							<s:hidden name="proposalno[%{#status.index}]" value="%{#record1.ProposalNo}"/></td>
							<td> <s:property value="#record1.TranId"/><s:hidden name="transNo[%{#status.index}]" value="%{#record1.TranId}"/> </td>
							<td> <s:property value="#record1.AssertNo"/> </td>
							<td> <s:property value="#record1.PlateNo"/> </td>
							<td> <s:property value="#record1.ChassisNo"/> </td>
							<td> <s:property value="#record1.Make"/> </td>
							<td> <s:property value="#record1.Desciption"/> </td>
							<td> <s:property value="#record1.SequenceNo"/> </td>
							<td> <s:property value="#record1.ManufactureYear"/> </td>
							<td> <s:property value="#record1.LIMIT"/> </td>
							<td> <s:property value="#record1.ActualPremium"/> </td>
							<td> -<s:property value="#record1.RefundPremium"/> </td>
							<td> <s:property value="#record1.EntryDate"/> </td>
							<td> <s:property value="#record1.InceptionDate"/> </td>
							<td> <s:property value="#record1.ExpiryDate"/> </td>
							<td> <s:property value="#record1.STATUS"/> </td>
						</tr>
						</s:iterator>
					</tbody>
				</table>
				<div class="row">
				<div class="col-sm-12 col-md-4">
					<s:label key="label.expiryDate"/><font color="red">*</font> <br/>
					<s:textfield name="expiryDate" id="eff_date"    onkeyup="validateSpecialChars(this)" cssClass="form-control " />
				</div>
				</div>
				</div>
				<br>
				<div class="row" align="center">
					<button type="button" class="btn btn-success"  onclick="deleteVehicle();">Submit</button>
					<button type="button" class="btn btn-danger"  onclick="getTranList1();">Back</button>
					<s:hidden name="proposalNo" id="proposalNo"/>
					<s:hidden name="baseOpenCoverNo" id="baseOpenCoverNo"/>
					<s:hidden name="openCoverNo" id="openCoverNo"/>
					<s:hidden name="brokerId" id="brokerId"/>
					<s:hidden name="endtYN" id="endtYN"/>
					<s:hidden name="refundchargeamount" id="refundchargeamount"/>
					<s:hidden name="lapsedStatus" id="lapsedStatus"/>
					<s:hidden name="vatTaxPrecent" id="vatTaxPrecent"/>			
					
				</div>
			</div>
		</div>		
	</div>
</div>
<s:token/>
</s:form>
</s:elseif>
<s:elseif test='"premium".equals(display)'>
<s:form  method="post" theme="simple" id="premiumForm" >
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-body">
				<div class="row">
					<div class="col-xs-12">
						<s:actionerror cssStyle="color:red;"/>
						<s:fielderror cssStyle="color:red;" />
					</div>
				</div>
				<table class="display responsive no-wrap" id="gridTable" width="100%" cellspacing="0">
					<thead>
						<tr>
							<th> <s:text name="label.SNo"/> </th>
							<th> <s:text name="label.tranid"/> </th>
							<th> <s:text name="label.assetNo"/> </th>
							<th> <s:text name="label.plateNo"/> </th>
							<th> <s:text name="label.chaseNo"/> </th>
							<th> <s:text name="label.make"/> </th>
							<th> <s:text name="label.desc"/> </th>
							<th> <s:text name="label.sequence"/> </th>
							<th> <s:text name="label.year"/> </th>
						<s:if test='!"R".equals(status)'>
							<th> <s:text name="label.limit"/> </th>
							<th> <s:text name="label.actualPremium"/> </th>
							<th> <s:text name="label.refundPremium"/> </th>
							<th> <s:text name="label.entryDate"/> </th>
							<th> <s:text name="label.effectiveDate"/> </th>
							<th> <s:text name="label.expiryDate"/> </th>
						</s:if>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="marineVehicleDetails" var="record1" status="status">
						<tr>
							<td><s:property value="%{#status.index+1}" /></td>
							<td> <s:property value="#record1.TranId"/> </td>
							<td> <s:property value="#record1.AssertNo"/> </td>
							<td> <s:property value="#record1.PlateNo"/> </td>
							<td> <s:property value="#record1.ChassisNo"/> </td>
							<td> <s:property value="#record1.Make"/> </td>
							<td> <s:property value="#record1.Desciption"/> </td>
							<td> <s:property value="#record1.SequenceNo"/> </td>
							<td> <s:property value="#record1.ManufactureYear"/> </td>
							<s:if test='!"R".equals(status)'>
							<td> <s:property value="#record1.LIMIT"/> </td>
							<td> <s:property value="#record1.ActualPremium"/> </td>
							<td> -<s:property value="#record1.RefundPremium"/> </td>
							<td> <s:property value="#record1.EntryDate"/> </td>
							<td> <s:property value="#record1.InceptionDate"/> </td>
							<td> <s:property value="#record1.ExpiryDate"/> </td>
							
							</s:if>
						</tr>
						</s:iterator>
					</tbody>
				</table>
				
				<div class="row" align="center">
				<s:if test='"premium".equals(reqFrom)'>
					<div class="panel-body">
						<div class="row">
							<div class="col-xs-12" align="left">
								<div class="col-xs-3">
									<s:text name="Premium " />
								</div>
								<div class="col-xs-3">
									<s:textfield name="premium" id="premium"  cssClass="inputBox" readonly="true"/>
								</div>
							
								<div class="col-xs-3">
									<s:text name="Endorsement fee" />
								</div>
								<div class="col-xs-3">
									<s:textfield name="policyFee" id="policyFee"  cssClass="inputBox" readonly="true" />
								</div>
							</div>
							</div>
							<br/>
							<div class="row">
							<div class="col-xs-12" align="left">
								<div class="col-xs-3">
									<s:text name="VAT Tax" />(<s:property value="vatTaxPrecent"/> <s:text name="%" />)
								</div>
								<div class="col-xs-3">
									<s:textfield name="vatTax" id="vatTax" cssClass="inputBox"  readonly="true"/>
								</div>
								<div class="col-xs-3">
									<s:text name="Total Premium " />
								</div>
								<div class="col-xs-3">
									<s:textfield name="totalPremium" id="totalPremium"  cssClass="inputBox" readonly="true"/>
								</div>
							</div>
						 </div>
						 <br/>
						<div class="row">
							<div class="col-xs-12" align="left">
								<div class="col-xs-3">
									<LABEL><s:text name="Condition" /></LABEL>
								</div>
								<div class="col-xs-9">
								<s:textarea name="conditionDesc" onkeyup="textLimit(this,1500)"   cssClass="inputBoxA" cols="34" rows="3" cssStyle="width: 100%;" />
								</div>
							</div>
						</div>
						<div class="row">
						<div class="col-xs-12" align="left">
							<div class="col-xs-3">
								<LABEL><s:text name="Land Transist Policy Issue Date" /></LABEL>
							</div>
							<div class="col-xs-3">
								 	<s:textfield id="preEffectiveDate1" name="effectiveDate" cssClass="inputBox datepicker tooltipContent"   readonly="true" />
							</div>
							<div class="col-xs-6">
								<s:text name="Do you Want Generate Policy" />
								<s:radio list="#{'Y':'Yes','N':'No'}"  name="generatePolicy" id="generatePolicy" value="%{generatePolicy==null?'N':generatePolicy}" onclick="getPaymentStatus(this.value,'%{status}')" />
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
								 			<s:textfield id="dueDate%{#stat.count-1}" name="dueDate[%{#stat.count-1}]"  readonly="true"  cssClass="form-control passExpDate tooltipContent"   />
								 	</td>
									<td>
								 			<s:textfield id="effectiveDate%{#stat.count-1}" name="effectiveDatePT[%{#stat.count-1}]"  readonly="true"  cssClass="form-control passExpDate tooltipContent" />
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
							 			<s:textfield id="dueDate1" name="dueDate[0]" cssClass="form-control datepicker tooltipContent"   />
							 	</td>
								<td>
							 			<s:textfield id="effectiveDate1" name="effectiveDatePT[0]" cssClass="form-control datepicker tooltipContent" />
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
					<div class="col-xs-12" align="center">
					<button type="button" class="btn btn-danger"  onclick="getUpload();">Back</button>
  							 <button type="button" class="btn btn-success"  onclick="getPolicyConfirm();">Submit</button>
  					</div>
  					<s:hidden name="tranId" id="tranId"/>
  					<s:hidden name="status" id="status"/>
					<s:hidden name="snoPT" id="snoPT"/>
					</s:if>
					<s:elseif test='"policy".equals(reqFrom)'>
						<div >
  									<div class="panel-heading">
  										<s:text name="Document Info" />
  									</div>
  									<div class="panel-body">
  										<div class="row">
  											<div class="col-xs-4">
  												<s:text name="Schedule" />
  											</div>
  											<div class="col-xs-4" align="center">
  												<s:property value="policyNo"/>
  											</div>
  											<div class="col-xs-4" align="center">
  											<a href="#" type="button"  class="btn btn-sm btn-primary" onClick="getSchedule('<s:property value="PolicyNo"/>')"><i class="glyphicon glyphicon-book"></i></a>
  											</div>
  										</div>
  										<br class="clear" />
  										<s:if test='creditNoteNo!="0"'>
  										<div class="row">
  											<div class="col-xs-4">
  												<s:text name="Debit" />
  											</div>
  											<div class="col-xs-4" align="center">
  												<s:property value="creditNoteNo"/>
  											</div>
  											<div class="col-xs-4" align="center">
  												<a href="#" type="button" class="btn btn-sm btn-warning" onClick="getCredit('<s:property value="%{#session.user}"/>','<s:property value="PolicyNo"/>')"><i class="glyphicon glyphicon-book"></i></a>
  											</div>
  										</div>
  										<br class="clear" />
  										</s:if>
  										<s:if test='debitNoteNo != "0"'>
  										<div class="row">
  											<div class="col-xs-4">
  												<s:text name="Credit" />
  											</div>
  											<div class="col-xs-4" align="center">
  												<s:property value="debitNoteNo"/>
  											</div>
  											<div class="col-xs-4" align="center">
  												<a href="#" type="button"  class="btn btn-sm btn-info"  onClick="getDebit('<s:property value="PolicyNo"/>')"><i class="glyphicon glyphicon-book"></i></a>
  											</div>
  											<div class="col-xs-4" align="center">
											</div>
  										</div>
  										</s:if>
  									</div>
  								</div>
							<div class="row">
  								<div class="col-xs-12" align="center">
  							     <button type="button" class="btn btn-success"  onclick="getTransaction();">Proceed</button>
  								</div>
  							</div>
  						</s:elseif>
  						<s:elseif test='"tran".equals(reqFrom)'>
  							<button type="button" class="btn btn-danger"  onclick="getTransaction();">Back</button>
  						</s:elseif>
  						
							<%--<button type="button" class="btn btn-danger"  onclick="getUpload();">Back</button> --%>
							<s:hidden name="proposalNo" id="proposalNo"/>
							<s:hidden name="baseOpenCoverNo" id="baseOpenCoverNo"/>
							<s:hidden name="openCoverNo" id="openCoverNo"/>
							<s:hidden name="brokerId" id="brokerId"/>
							<s:hidden name="endtYN" id="endtYN"/>
							<s:hidden name="refundchargeamount" id="refundchargeamount"/>
							<s:hidden name="policyNo" id="policyNo"/>
							<s:hidden name="reqFrom" id="reqFrom"/>
							<s:hidden name="lapsedStatus" id="lapsedStatus"/>
							<s:hidden name="vatTaxPrecent" id="vatTaxPrecent"/>			
							
									
						</div>
				</div>
			</div>
		</div>
	</div>
	<s:token/>
</s:form>
</s:elseif>
<s:elseif test='"transaction".equals(display)'>
<s:form  method="post" theme="simple" id="premiumForm" >
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-body">
				<div class="row">
					<div class="col-xs-12">
						<s:actionerror cssStyle="color:red;"/>
						<s:fielderror cssStyle="color:red;" />
					</div>
				</div>
				<table class="display responsive no-wrap" id="gridTable" width="100%" cellspacing="0">
	 				<thead>
	 					<tr>
	 						<th><s:text name="Transaction Id" /></th>
							<th><s:text name="Uploaded Date" /></th>
							<th><s:text name="Total Quotes" /></th>
							<th><s:text name="Uploaded Quotes" /></th>
							<th><s:text name="Duplicate Quotes" /></th>
							<th><s:text name="Error Desc" /></th>
							<th><s:text name="Upload Status" /></th>
							<th><s:text name="Process Status" /></th>
	 					</tr>
	 				</thead>
	 				<tbody>
	 					<s:iterator value="vehicletransDetails" status="status" var="record">
	 					<tr>
	 						<td> <s:property value="TranId" /> </td>
	 						<td> <s:property value="EntryDate" /> </td>
	 						<td> <s:property value="Totalrecords" /> </td>
	 						<td> <s:property value="UploadedRecord" /></td>
	 						<td> <s:property value="DuplicateRecord" /> </td>
	 						<td> <s:property value="ErrorDesc" /> </td>
	 						<td> <s:property value="ProgressDesc" /> </td>
	 						<td>
	 						<s:if test='"C".equals(ProgressStatus)'>
	 						Completed
	 						</s:if>
	 						<s:elseif test='"S".equals(ProgressStatus)'>
	 						<a href="#" class="btn btn-sm btn-info"  onclick="processRecord(<s:property value='TranId'/>)">Pending</a>
	 						</s:elseif>
	 						<s:else>
	 						Failed
	 						</s:else>
	 						</td>
	 					</tr>
	 					</s:iterator>
	 				</tbody>
	 			</table>
				<br/>
				<div class="row" align="center">
					<button type="button" class="btn btn-danger"  onclick="getUpload();">Back</button>
					<s:hidden name="proposalNo" id="proposalNo"/>
					<s:hidden name="baseOpenCoverNo" id="baseOpenCoverNo"/>
					<s:hidden name="openCoverNo" id="openCoverNo"/>
					<s:hidden name="brokerId" id="brokerId"/>
					<s:hidden name="endtYN" id="endtYN"/>
					<s:hidden name="refundchargeamount" id="refundchargeamount"/>
					<s:hidden name="lapsedStatus" id="lapsedStatus"/>	
					<s:hidden name="vatTaxPrecent" id="vatTaxPrecent"/>	
					<s:hidden name="tranId" id="tranId"/>		
				</div>
			</div>
		</div>
	</div>
</div>
<s:token/>
</s:form>
</s:elseif>
<script type="text/javascript">

//calculateVat(<s:property value="%{vatTaxPrecent}"/>);
//addComma(document.forms['premiumForm'],'balanceAmt,suminsured,receviedTot,marinePremium,warPremium,totalPremium,inceptionFee,policyFee,finalPremium,PremiumRcvd,inceptionFeeRcvd,policyFeeRcvd,finalPremium,Premium,inceptionFeeBal,policyFeeBal,receviedAmt,PremiumPaid,inceptionFeePaid,policyFeePaid,refundAmt');

	function calculateVat(vatTax){
		var preAmt=0,policyFee=0,vatTaxAmt=0;
	try{
		preAmt=document.getElementById('premium').value;
		if(preAmt.length>0)
			preAmt=preAmt.replace(new RegExp(',','g'),'');
		else
			preAmt="0";
		policyFee=document.getElementById('policyFee').value;	
		if(policyFee.length>0)
			policyFee=policyFee.replace(new RegExp(',','g'),'');
		else
			policyFee="0";
		vatTaxAmt=((parseFloat(preAmt)+parseFloat(policyFee)) * parseFloat(vatTax))/100;
		document.getElementById('vatTaxAmt').value=vatTaxAmt.toFixed(3);	
		document.getElementById('vatTaxAmt1').value=vatTaxAmt.toFixed(3);	
		document.getElementById('totalPremium').value=(parseFloat(preAmt)+parseFloat(policyFee)+parseFloat(vatTaxAmt.toFixed(3)));
		
		//alert(vatTaxAmt);
	}catch (e) {
	}	
}
	
function transactionDet(){
	document.vehicleForm.action="TransactionMarineVehicle.do";
	document.vehicleForm.submit();
}
function AddUpload(){

document.vehicleForm.action="uploadInitMarineVehicle.do?refundChrgYN=Y";
document.vehicleForm.submit();
}
function viewUpload(proposalNo){
document.opencoverForm.action="vehicleInitMarineVehicle.do?proposalNo="+proposalNo;
document.opencoverForm.submit();
}
function deleteUpload(proposalNo){
document.vehicleForm.action="deleteInitMarineVehicle.do";
document.vehicleForm.submit();
}
function searchVehicle(){
document.vehicleForm.action="deleteInitMarineVehicle.do";
document.vehicleForm.submit();
}
function deleteVehicle(){
conf =confirm("Do you Want delete Vehicle?");
		
 if(conf){
	document.vehicleForm.action="deleteTransactionMarineVehicle.do";
	document.vehicleForm.submit();
}
}
function getBroker(){
document.opencoverForm.action="openCoverInitMarineVehicle.do";
document.opencoverForm.submit();
}function getHalierDetails(){
document.vehicleForm.action="viewOpenCoverReport.action";
document.vehicleForm.submit();
}
function getTranList(){
document.uploadForm.action="vehicleInitMarineVehicle.do";
document.uploadForm.submit();
}
function getTranList1(){
document.vehicleForm.action="vehicleInitMarineVehicle.do";
document.vehicleForm.submit();
}
function getUpload(){
document.premiumForm.action="vehicleInitMarineVehicle.do";
document.premiumForm.submit();
}
function duplicateUpload(tranid){
document.uploadForm.action='getDuplicateMarineVehicle.do?tranId='+tranid;
document.uploadForm.submit();
}

function getreuploadStatus(val){
if(val=='Y'){
document.getElementById('reupload').style.display="";

}
else{
document.getElementById('reupload').style.display="none";
}
}
function transactionUpload(){
document.vehicleForm.action="unApprovedMarineVehicle.do";
document.vehicleForm.submit();
}
function activeUpload(){
document.vehicleForm.action="activeCountMarineVehicle.do";
document.vehicleForm.submit();
}
function deletedUpload(){
document.vehicleForm.action="deletedCountMarineVehicle.do";
document.vehicleForm.submit();
}

function paymentTerms(){
document.vehicleForm.reqFrom.value='search';
document.vehicleForm.action="paymentTermsPremium.action?menuBlocker=bulkreport";
document.vehicleForm.submit();
}

function getTransaction(){
document.premiumForm.action="vehicleInitMarineVehicle.do";
document.premiumForm.submit();
}
function getTransDetails(tranid,status){
document.vehicleForm.action='getTranMarineVehicle.do?tranId='+tranid+'&status='+status;
document.vehicleForm.submit();
}
function toggleChargeable() {
				document.getElementById('refundAmt').disabled = false;
			}
function closepopup()
{
   window.opener.location.reload(true);
 	//var result=document.getElementById('refundchargeamount').value;
   	//window.opener.form1.refundAmt.value=result;
    window.close();
}
function getDebit(val) {
	var URL ='<%=request.getContextPath()%>/Copyofinformation.jsp?policyMode=debit&policynumber='+val;
	var bwidth = window.innerWidth;
	var bwidth1 = document.body.clientWidth;
	if(bwidth <= 768) {
		return popUp(URL,bwidth1,'500');
	} else {
		return popUp(URL,'750','500');
	}
}
function getCredit(loginId,val) {
	var URL ='Copyofinformation.jsp?policyMode=credit&loginid='+loginId+'&policynumber='+val;
	var bwidth = window.innerWidth;
	var bwidth1 = document.body.clientWidth;
	if(bwidth <= 768) {
		return popUp(URL,bwidth1,'500');
	} else {
		return popUp(URL,'750','500');
	}
}


function getVehicleSchedule(frm,policyNo,reqFrom){
	document.getElementById('policyNo').value=policyNo;
	document.getElementById('reqFrom').value=reqFrom;
	document.vehicleForm.action = 'VehiclescheduleReport.action';
	document.vehicleForm.submit();
}
function getVehicleSchedule1(frm,policyNo,reqFrom){
	document.getElementById('policyNo').value=policyNo;
	document.getElementById('reqFrom').value=reqFrom;
	document.premiumForm.action = 'VehiclescheduleReport.action';
	document.premiumForm.submit();
}
function getPolicyConfirm(){
	document.premiumForm.action = 'updatePolicyMarineVehicle.do';
	document.premiumForm.submit();
}
function getVehicleEdit(tranid){
	document.vehicleForm.action = 'viewUnapprovedMarineVehicle.do?tranId='+tranid;
	document.vehicleForm.submit();
}
function funTotal(){		
				var refundAmt,policyFeePaid,inceptionFeePaid;
				try{ 
					refundAmt=document.getElementById('PremiumPaid').value;
					if(refundAmt.length>0)
						refundAmt=refundAmt.replace(new RegExp(',','g'),'');
					else
						refundAmt="0";
						
					policyFeePaid=document.getElementById('policyFeePaid').value;	
				 	if(policyFeePaid.length>0)
						policyFeePaid=policyFeePaid.replace(new RegExp(',','g'),'');
					else
						policyFeePaid="0";
				 
				 	inceptionFeePaid=document.getElementById('inceptionFeePaid').value;
				  	if(inceptionFeePaid.length>0)
						inceptionFeePaid=inceptionFeePaid.replace(new RegExp(',','g'),'');
					else
						inceptionFeePaid="0";			 
					
				}catch (e) { console.log(e);}
				
				var total=parseFloat(refundAmt)+parseFloat(policyFeePaid)+parseFloat(inceptionFeePaid);	 
				document.getElementById('total').value=total;
				addComma(document.forms['premiumForm'],'balanceAmt,suminsured,receviedTot,marinePremium,warPremium,totalPremium,inceptionFee,policyFee,finalPremium,PremiumRcvd,inceptionFeeRcvd,policyFeeRcvd,finalPremium,Premium,inceptionFeeBal,policyFeeBal,receviedAmt,PremiumPaid,inceptionFeePaid,policyFeePaid,refundAmt');
				
			}
function numberComma(Num){//Not allow any decimal value
			Num = Num.replace(/[^,0-9,]/g,'');
			  Num += '';
			  
		    Num = Num.replace(/,/g, '');
		    x = Num.split('.');
		    x1 = x[0];
		    x2 = x.length > 1 ? '.' + x[1] : '';
		    var rgx = /(\d+)(\d{3})/;
		    while (rgx.test(x1))
		    x1 = x1.replace(rgx, '$1' + ',' + '$2');
		    return x1 + x2;
		}
		function funActualTotal(){
		//alert();		
				var preAmt,policyFee,inceptionFee;
				var policyFeeBal,inceptionFeeBal,receviedTot;
				var policyFeeRcvd,inceptionFeeRcvd,PremiumRcvd;
				try{ 
					preAmt=document.getElementById('totalPremium').value;
					if(preAmt.length>0)
						preAmt=preAmt.replace(new RegExp(',','g'),'');
					else
						preAmt="0";
						
					policyFee=document.getElementById('policyFee').value;	
				 	if(policyFee.length>0)
						policyFee=policyFee.replace(new RegExp(',','g'),'');
					else
						policyFee="0";
				 
				 	inceptionFee=document.getElementById('inceptionFee').value;
				  	if(inceptionFee.length>0)
						inceptionFee=inceptionFee.replace(new RegExp(',','g'),'');
					else
						inceptionFee="0";	
					
					
					// start Balnce amt calculation js
					policyFeeBal=document.getElementById('policyFeeBal').value;
					if(policyFeeBal.length>0)
						policyFeeBal=policyFeeBal.replace(new RegExp(',','g'),'');
					else
						policyFeeBal="0";
					inceptionFeeBal=document.getElementById('inceptionFeeBal').value;
					if(inceptionFeeBal.length>0)
						inceptionFeeBal=inceptionFeeBal.replace(new RegExp(',','g'),'');
					else
						inceptionFeeBal="0";
					receviedTot=document.getElementById('receviedTot').value;
					if(receviedTot.length>0)
						receviedTot=receviedTot.replace(new RegExp(',','g'),'');
					else
						receviedTot="0";
					policyFeeRcvd=document.getElementById('policyFeeRcvd').value;
					if(policyFeeRcvd.length>0)
						policyFeeRcvd=policyFeeRcvd.replace(new RegExp(',','g'),'');
					else
						policyFeeRcvd="0";
					inceptionFeeRcvd=document.getElementById('inceptionFeeRcvd').value;
					if(inceptionFeeRcvd.length>0)
						inceptionFeeRcvd=inceptionFeeRcvd.replace(new RegExp(',','g'),'');
					else
						inceptionFeeRcvd="0";
					PremiumRcvd=document.getElementById('PremiumRcvd').value;
					if(PremiumRcvd.length>0)
						PremiumRcvd=PremiumRcvd.replace(new RegExp(',','g'),'');
					else
						PremiumRcvd="0";	
					
					// End Balnce amt calculation js
						
	 
					
				}catch (e) { console.log(e);}
				try{
					var total=parseFloat(preAmt)+parseFloat(policyFee)+parseFloat(inceptionFee);	
					var polFee=parseFloat(policyFee)-parseFloat(policyFeeRcvd); 
					var incFee=parseFloat(inceptionFee)-parseFloat(inceptionFeeRcvd);
					var totFee=total-parseFloat(PremiumRcvd);
					//alert(total);
					document.getElementById('finalPremium').value=total.toFixed(2);
					document.getElementById('policyFeeBal').value=polFee.toFixed(2);
					document.getElementById('inceptionFeeBal').value=incFee.toFixed(2);
					document.getElementById('receviedTot').value=totFee.toFixed(2);
					}catch (e) { console.log(e);}
					addComma(document.forms['premiumForm'],'balanceAmt,receviedTot,suminsured,marinePremium,warPremium,totalPremium,inceptionFee,policyFee,finalPremium,PremiumRcvd,inceptionFeeRcvd,policyFeeRcvd,finalPremium,Premium,inceptionFeeBal,policyFeeBal,receviedAmt,PremiumPaid,inceptionFeePaid,policyFeePaid,refundAmt');
					
					
			}
		getPaymentStatus('<s:property value="%{generatePolicy}" />','<s:property value="%{status}" />')
		function getPaymentStatus(val,status){
		//alert(status);
			if(val=='Y' && status != 'D' ){
				document.getElementById('QuoteDocTable').style.display="";
				document.getElementById('addTable').style.display="";
		
			}
			else{
				document.getElementById('QuoteDocTable').style.display="none";
				document.getElementById('addTable').style.display="none";
			}
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
	function processRecord(transid){
		document.getElementById('tranId').value=transid;
		document.premiumForm.action = "<%=request.getContextPath()%>/processMarineVehicle.action";
		document.premiumForm.submit();
	}
	function deleteRow(val) {
		if(val==0){
			alert("First row can't be deleted");
		}
		else{
			var status=confirm("Do you want to delete specified row");
			if(status){
				document.getElementById("snoPT").value=val;
				document.premiumForm.action = 'deleteMarineVehicle.action';
				document.premiumForm.submit();
			}
			}  
			
	}
	function getSchedule(val) {
		var URL ='<%=request.getContextPath()%>/documentpdfReport.action?policyNo='+val+'&docType=vehicle';
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
</body>
</html>