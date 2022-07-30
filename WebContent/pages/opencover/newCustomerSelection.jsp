<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
	<head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="keywords" content="Maan Sarovar, Sea Trans, Marine Insurance">	
		<meta name="author" content="">
		<title> ::: E-Way - Customer Selection ::: </title>
		<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/saicoHeaderLogo.jpg" />	
		<script type="text/javascript" src="js/common.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css//bootstrap.min.css" />
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
		<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/numeric-comma.js"></script>
		
		<script type="text/javascript">
   		$(document).ready(function() {
		    $('#record').dataTable( {
			        "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
			        responsive: true
			} );
		} );
   		</script>
	</head>
<body>
<s:form name="customerSelectionForm" id="customerSelectionForm" theme="simple">

<div class="table0">
	<div class="tablerow" id="customerSearchList">
		<div class="panel panel-primary" style="overflow-x: visible;">
			<div class="panel-heading">
				<s:text name="Customer Selection" />
			</div>
			<div class="panel-body">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<s:actionerror cssStyle="color: red;" />
				</div>
			</div>
			<s:if test='"add".equalsIgnoreCase(mode)'>
				<table align="center" border="0" cellpadding="2" cellspacing="2" width="90%">
					<tr>
						<td colspan="4">
							<span class ="heading">Customer details</span>
						</td>
					</tr>
					<tr>
						<td class="formtxtf1" width="20%" style="padding: 5px;">Title<FONT color=red>**</FONT></td>
						<td class="formtxtf1" width="30%" style="padding: 5px;">
							<s:select name="title" id="title" list="titleList" listKey="CodeDescription" listValue="CodeDescription" headerKey="" headerValue="--Select--" class="inputBox" style="width: 95%;" />
						</td>
						<td class="formtxtf1" width="20%" style="padding: 5px;">Name/Organization Name <FONT color=red>**</FONT></td>
						<td class="formtxtf1" width="30%" style="padding: 5px;">
							<table>
								<tr>
									<td>
										<s:textfield name="custName" id="custName" style="width: 95%;" class="inputBox"/>					
									</td>
									 <td>
										 <span class="input-group-addon" >
							 		     	<a onclick="customerSelectionAction()" style="cursor: pointer"  disabled="#disable"><span class="glyphicon glyphicon-list"></a>
							 		     </span>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td class="formtxtf1" style="padding: 5px;">Customer Name(Arabic)</td>
						<td class="formtxtf1" style="padding: 5px;">
							<s:textfield  name="custNameAr" style="width: 95%;" class="inputBox"/>
						</td>
						<td class="formtxtf1" style="padding: 5px;">Core Application Code</td>
						<td class="formtxtf1" style="padding: 5px;">
								<s:textfield name="custCode" id="coreAppCode" style="width: 95%;" class="inputBox"/>
						</td>
				
					</tr>
					<tr>
						<td class="formtxtf1" style="padding: 5px;">Address 1</td>
						<td class="formtxtf1" style="padding: 5px;">
							<s:textfield name="address1" id="address1" style="width: 95%;" class="inputBox"/>
						</td>
						<td class="formtxtf1" style="padding: 5px;">Address 2</td>
						<td class="formtxtf1" style="padding: 5px;">
							<s:textfield name="address2" id="address2" style="width: 95%;" class="inputBox"/>
						</td>
						
					</tr>
					<tr>
						<td class="formtxtf1" style="padding: 5px;">P.O.Box <FONT color=red>**</FONT></td>
						<td class="formtxtf1" style="padding: 5px;">
							<s:textfield name="poBox" class="inputBox" id="poBox" style="width: 95%;" maxlength="6" />
						</td>
						<td class="formtxtf1" style="padding: 5px;">Email<FONT color=red>**</FONT></td>
						<td class="formtxtf1" style="padding: 5px;">
							<s:textfield name="email" class="inputBox" id="email" style="width: 95%;" />
						</td>
					</tr>
					<tr>
						<td class="formtxtf1" style="padding: 5px;">City <FONT color=red>**</FONT></td>
						<td class="formtxtf1" style="padding: 5px;">
							<s:select name="cityCode" id="cityCode" list="cityList" listKey="Code" listValue="CodeDescription" headerKey="" headerValue="--Select--" class="inputBox" style="width: 95%;" onchange="return showValue(this.value)"/>
							<s:iterator value="cityList" var="det">
								<s:hidden name="%{#det.Code}" id="%{#det.Code}" value="%{#det.CodeDescription}"/>
							</s:iterator>
						</td>
						<td class="formtxtf1" style="padding: 5px;">Mobile<FONT color=red>**</FONT></td>
						<td class="formtxtf1" style="padding: 5px;">
							<s:textfield name="mobileNo" id="mobileNo" maxlength="10" style="width: 95%;"  class="inputBox"  />
						</td>
						
					</tr>
					<tr>
					<td class="formtxtf1" style="padding: 5px;">VAT Reg No</td>
						<td class="formtxtf1" style="padding: 5px;">
							<s:textfield name="custVatRegNo" maxlength="25" style="width: 95%;"  class="inputBox"  />
						</td>
					</tr>
				</table>
      		<br/>
			<div class="tablerow" align="center">
				 <input type="button" onclick="window.close()"  class="btn btn-sm btn-danger" value="Close" > 
				<input type="button" value="Insert" class="btn btn-sm btn-success" onclick="fnInsert(this.form)"/>
			</div>
			<s:hidden name="brokerId"/>
			<s:hidden name="customerId" id="customerId"/>
			<s:hidden name="branchCode"/>
			</s:if>
			<s:else>
					<table class="display responsive no-wrap" id="record" width="100%" cellspacing="0" style="font-size: 12px;">
						<thead>
							<tr>
								<th width="5%" class="no-sort"></th>
								<th width="5%"></th>
									<th width="19%"><b>Customer Name</b></th>
									<th width="19%"><b>P.O.Box</b></th>
									<th width="19%"><b></b></th>
									<th width="19%"><b>Email</b></th>
									<th width="19%"><b>Core Application Code</b></th>
									<th width="19%"><b>View</b></th>
							</tr>
						</thead>
						<tbody>					
							<s:iterator value="customerSelectionlist" var="customerdetail" status="stat">
								<tr>
										<td></td>   
									 	<td><input type="radio" name="selects" onclick="customerDetail('<s:property value="%{#customerdetail.Title}"/>','<s:property value="%{#customerdetail.ADDRESS1}"/>','<s:property value="%{#customerdetail.ADDRESS2}"/>','<s:property value="%{#customerdetail.MOBILE}"/>','<s:property value="%{#customerdetail.EMIRATE}"/>','<s:property value="%{#customerdetail.POBOX}"/>','<s:property value="%{#customerdetail.FirstName}"/>','<s:property value="%{#customerdetail.MissippiCustomerCode}"/>','<s:property value="%{#customerdetail.CustomerId}"/>','<s:property value="%{#customerdetail.Email}"/>','<s:property value="%{#customerdetail.CUST_AR_NO}"/>')"/></td>   				  
										<td><s:property value='%{#customerdetail.FirstName==null?"":#customerdetail.FirstName}' /></td>
										<td><s:property value='%{#customerdetail.PoBox==null?"":#customerdetail.PoBox}'  /></td>
										<td><s:property value='%{#customerdetail.EmirateName==null?"":#customerdetail.EmirateName}' /></td>
										<td><s:property value='%{#customerdetail.Email==null?"":#customerdetail.Email}' /></td>
										<td><s:property value='%{#customerdetail.MissippiCustomerCode==null?"":#customerdetail.MissippiCustomerCode}' /></td>
										<td><a href="#" title="View Customer Details" id="viewbtn" class="two" data-toggle="modal" data-target="#customerViewModal" onClick="viewCustomer('<s:property value="%{#customerdetail.CustomerId}"/>');"> <b>View</b></a></td>
								</tr>
							</s:iterator>
						</tbody>
					</table>
				<s:hidden name="title" />
         		<s:hidden name="address1" />
         		<s:hidden name="address2" />
         		<s:hidden name="mobileNo" />
         		<s:hidden name="" />
         		<s:hidden name="poBox" />
         		<s:hidden name="customerName" />
         		<s:hidden name="customerNameAr" />
         		<s:hidden name="coreAppCode" />
         		<s:hidden name="email"/>
         		<s:hidden name="custArNo" />
         		<s:hidden name="customerId" />
         		<s:hidden name="searchType" />
         		<s:hidden name="branchCode"/>
         		
         		<br/>
			<div class="tablerow" align="center">
<%-- 				<s:submit type="button" name="close"  key="Close" cssClass="btn btn-sm btn-danger"/>&nbsp;&nbsp;&nbsp; --%>
				 <input type="button" onclick="window.close()"  class="btn btn-sm btn-danger" value="Close" > 
				<!-- <button type="button" name="close" class="btn btn-danger btn-oval" data-dismiss="modal">Close</button>&nbsp;&nbsp;&nbsp; -->
				<s:if test='!"add".equalsIgnoreCase(mode)'>
					<input type="button" name="Add Customer" id="addBtn" value="Add Customer" class="btn btn-sm btn-warning" data-toggle="modal" data-target="#customeraddModal" onclick="fnAddCustomer()"/>&nbsp;&nbsp;&nbsp;
				</s:if>
				<input type="button" name="submit" id="customerBtn" value="Submit" class="btn btn-sm btn-success" onclick="fnSubmit()"/>
			</div>
			
			</s:else>
			
			</div>
		</div>
	</div>
	
	
</div>
<div id="customerViewModal" class="modal fade" role="dialog">
	  <div class="modal-dialog modal-lg">
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
        	<div class="modal-title">
				<div class="row">
       				<div class="col-md-12 col-xs-12">
			         	<h3><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;&nbsp;<s:text name="Customer Selection" /></h3>
			         </div>
    			</div>
			</div>
	      </div>
	      <div class="modal-body" >
	        <div class="container-fluid" id="customerviewAjaxId">
	        </div>
	      </div>
	    </div>
	  </div>
  </div>
  <div id="customeraddModal" class="modal fade" role="dialog">
	  <div class="modal-dialog modal-lg">
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
        	<div class="modal-title">
				<div class="row">
       				<div class="col-md-12 col-xs-12">
			         	<h3><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;&nbsp;<s:text name="Customer Selection" /></h3>
			         </div>
    			</div>
			</div>
	      </div>
	      <div class="modal-body" >
	        <div class="container-fluid" id="customeraddAjaxId">
	        </div>
	      </div>
	    </div>
	  </div>
  </div>
<s:hidden name="cityName"/>
</s:form>

<s:form name="frm">
	<s:hidden name="brokerId"/>
	<s:hidden name="customerId"/>
	<s:hidden name="title" />
    <s:hidden name="address1" />
    <s:hidden name="address2" />
    <s:hidden name="mobileNo" />
    <s:hidden name="city" />
    <s:hidden name="poBox" />
    <s:hidden name="customerName" />
     <s:hidden name="customerNameAr" />
    <s:hidden name="coreAppCode" />
    <s:hidden name="email"/>
    <s:hidden name="custArNo" />
    <s:hidden name="searchType" />
    <s:hidden name= "broOrganisation"/>
    <s:hidden name= "bcode"/>
    <s:hidden name= "missippiId"/>
    <s:hidden name= "commission"/>
    <s:hidden name= "commissionPer"/>
    <s:hidden name= "groupId"/>
    <s:hidden name="occupation"/>
	<s:hidden name="country"/>
	<s:hidden name="phone"/>
	<s:hidden name="fax"/>
	<s:hidden name="mode"/>
	<s:hidden name="branchCode"/>
	
</s:form>
<script type="text/javascript">
function stopRKey(evt) { 
	var evt = (evt) ? evt : ((event) ? event : null); 
	var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null); 
	if ((evt.keyCode == 13) && (node.type=="text")) { return false; } 
} 

document.onkeypress = stopRKey;

function searchList() {
	//ajaxLoading(); 
	var search="";
	try{
		search=document.getElementById('searchValue').value;
	}catch (e) {
		search=document.customerSelection.searchValue.value;
	}
	postRequest('<%=request.getContextPath()%>/customerSelectionQuotation.action?searchValue='+search+'&brokerCode='+'<s:property value="brokerCode"/>'+'&searchType='+'<s:property value="searchType"/>','customerSearchList');
}

function coreSearchList() {	
	var search=""; 
	try{
		search=document.getElementById('coreSearchValue').value;
	}catch (e) {
		search=document.customerSelection.searchValue.value;
	}
	postRequest('<%=request.getContextPath()%>/customerSelectionQuotation.action?coreSearchValue='+search+'&brokerCode=<s:property value="brokerCode"/>&channelType=<s:property value="channelType"/>&searchType=<s:property value="searchType"/>','customerSearchList');
	ajaxLoading();
}

function ajaxLoading() {
	document.getElementById("customerSearchList").innerHTML = '<img alt="Loading" src="<%=request.getContextPath()%>/images/ajax-loader.gif" class="ajaxLoader">';
}
function brokerDetail(bcode,borg,groupId,missipiId,commission,commissionPer,title,contactPerson,contactPersonNo,contactOccupation,address1,address2,city,country,phone,fax,mobileNo,email){
	document.frm.customerId.value=bcode;
	document.frm.bcode.value=bcode;
	document.frm.broOrganisation.value=borg;
	document.frm.groupId.value=groupId;
	document.frm.missippiId.value=missipiId;
	document.frm.commission.value=commission;
	document.frm.commissionPer.value=commissionPer;

	document.frm.title.value=title;
	document.frm.customerName.value=contactPerson;
	document.frm.occupation.value=contactOccupation;
	document.frm.address1.value=address1;
	document.frm.address2.value=address2;
	document.frm.city.value=city;
	document.frm.country.value=country;
	document.frm.phone.value=phone;
	document.frm.fax.value=fax;
	document.frm.mobileNo.value=mobileNo;
	document.frm.email.value=email;
}

function customerDetail(title,address1,address2,mobileNo,city,poBox,customerName,coreAppCode,customerId,email,custArNo) { 
	document.frm.title.value=title;
	document.frm.address1.value=address1;
	document.frm.address2.value=address2;
	document.frm.mobileNo.value=mobileNo;
	document.frm.city.value=city;
	document.frm.poBox.value=poBox;
	document.frm.customerName.value=customerName;
	document.frm.coreAppCode.value=coreAppCode;
	document.frm.customerId.value=customerId;
	document.frm.email.value=email;
	document.frm.customerNameAr.value=custArNo;
}

function fnSubmit() { 
	window.opener.document.getElementById("customerName").value=document.frm.customerName.value;
	window.opener.document.getElementById("customerId").value=document.frm.customerId.value;
	window.close();
	//$("#customerBtn").attr("data-dismiss","modal");
}

function fnAddCustomer(){
	//$('#customerSelectionModal').modal('hide');
	//$("#customerSelectionModal").attr("data-dismiss","modal");
	//postRequest('addNewCustomerOpenCover.action','customeraddAjaxId');
	//$("#addBtn").attr("data-dismiss","modal");
	document.frm.action='addNewCustomerOpenCover.action';
	document.frm.submit();
}

function trim(text) {
	return text.replace(/^\s+|\s+$/g, "");
}

function fnInsert(formIns){
	//postFormRequest('insertCustomerNewOpenCover.action','customerviewAjaxId','customerSelectionForm');
	formIns.action='insertCustomerNewOpenCover.action';
	formIns.submit();
}
function showValue(Field)
{
	var selected = document.getElementById(""+Field);
	with(selected)
	{
		document.customerSelectionForm.cityName.value=value;
	}
}
function viewCustomer(val){
	//$("#viewbtn").attr("data-dismiss","modal");
	//$("#viewbtn").attr("data-toggle","modal");
	//$("#viewbtn").attr("data-target","#customerViewModal");
	document.frm.customerId.value=val;
	document.frm.action = 'editcustomerOpenCover.action';
	document.frm.submit();
	//postRequest('editcustomerOpenCover.action?customerId='+val,'customerviewAjaxId');
}
function postFormRequest(strUrl, id, formId) {
    $.ajax({
		url : strUrl,
		type : "POST",
		data : $("#" + formId).serialize(),
		error : function() {
			$('#' + id).html('<p>An error has occurred in jquery Ajax</p>');
		},
		success : function(data) {
			$('#' + id).html(data);
		},
		beforeSend : function() {
			$('#loading').show();
			$('.ajaxLoader').show();
		},
		complete : function() {
			$('#loading').hide();
			$('.ajaxLoader').hide();
		}
	});
}
function customerSelectionAction() {	
	
     var URL ="<%=request.getContextPath()%>/customerSelectionQuotation.action?searchType=OPENCOVER";
     var windowName = "New Customer Search";
 	var width  = screen.availWidth;
 	var height = screen.availHeight;
 	var w = 700;
 	var h = 400;
 	var features =
 		'width='          + w +
 		',height='		  + h +
 		',left='		  + ((width - w - 0) * .4)  +
 		',top='			  + ((height - h - 0) * .4) +
 		',directories=no' +
 		',location=no'	  +
 		',menubar=no'	  +
 		',scrollbars=yes' +
 		',status=yes'	  +
 		',toolbar=no'	  +
 		',resizable=false';
 	var strOpen = window.open (URL, windowName, features);
 	strOpen.focus();
}

</script>
</body>
</html>