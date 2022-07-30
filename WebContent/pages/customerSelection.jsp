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
<s:form name="customerSelection" id="customerSelection" theme="simple" action="customerPopulateQuotation.action">
<div class="table0">
	<div class="tablerow" id="customerSearchList">
		<div class="panel panel-primary" style="overflow-x: visible;">
			<div class="panel-heading">
				<s:text name="Customer Selection" />
			</div>
			<div class="panel-body">
				<table width="100%">
					<tr>
						<s:if test='"CUSTOMER".equals(searchType) || "OPENCOVER".equals(searchType)'>
							<div class="row" >
								<div class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
								</div>
								<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
									<div class="col-xs-2">
										<div class="text">
									 		<s:text name="customer.searchBy" />
									 	</div>
								 	</div>
								 	<div class="col-xs-4">
									 	<div class="tbox">
									 		<s:select list="#{'nationalId':'National Id','customerNo':'Customer No','employeeId':'Employee Id','mobileNo':'Mobile No','vatRegNo':'Vat Regestration No' }" name="searchBy" id="searchBy" headerKey="" headerValue="--Select--" cssClass="inputBoxS tooltipContent"></s:select>
									 	</div>
								 	</div>
								 	<div class="col-xs-2">
									 	<div class="text">
									 		<s:text name="Search Value" />
									 	</div>
								 	</div>
								 	<div class="col-xs-4">
									 	<div class="tbox">
									 		<s:textfield name="searchValue" id="searchValue" cssClass="inputBox tooltipContent"/>
									 	</div>
									</div>
								</div>
								<div class="row" align="center">
								<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
								 	<div class="tbox">
								 		<button type="button" onclick="searchList();" class="btn btn-sm btn-info">Search</button>
								 	</div>
								</div>
							</div>
							</div>
						</s:if>
						<s:elseif test='"BROKER".equals(searchType)'>
							<td align="right" colspan="3">
								<s:label key="customer.searchBy" />&nbsp;Existing Broker Name<br/>
								<s:textfield name="coreSearchValue" id="coreSearchValue"/>
								<input type="button" value="Search" onclick="coreSearchList()" class="btn btn-sm btn-info"/>
							</td>
						</s:elseif>
						<s:elseif test='("YES".equalsIgnoreCase(getText("CUST_SEARCH_STATUS")) && ("admin".equalsIgnoreCase(#session.usertype) || "RSAIssuer".equalsIgnoreCase(#session.usertype))) || ("OC_CUSTOMER".equals(searchType))'>
							<td align="right" colspan="3">
								<s:label key="customer.searchBy" />&nbsp;Existing Customer Name<br/>
								<s:textfield name="coreSearchValue" id="coreSearchValue"/>
								<input type="button" value="Search" onclick="coreSearchList()" class="btn btn-sm btn-info"/>
							</td>
						</s:elseif>
					</tr>
				</table>
				<br class="clear"/>
				<s:if test='!"OPENCOVER".equals(channelType)'>
					<table class="display responsive no-wrap" id="record" width="100%" cellspacing="0" style="font-size: 12px;">
						<thead>
							<tr>
								<th width="5%" class="no-sort"></th>
								<th width="5%"></th>
								<s:if test='"CUSTOMER".equals(searchType) || "OC_CUSTOMER".equals(searchType)'>
									<th width="19%"><b>Customer Name</b></th>
									<th width="19%"><b>P.O.Box</b></th>
									<th width="19%"><b>City</b></th>
									<th width="19%"><b>Email</b></th>
									<th width="19%"><b>Core Application Code</b></th>
								</s:if>
								<s:elseif test='"BROKER".equals(searchType)'>
									<th width="15%"><b>Broker Code</b></th>
									<th width="15%"><b>Broker Name</b></th>
									<th width="15%"><b>Address1</b></th>
									<th width="15%"><b>City</b></th>
									<th width="15%"><b>Email</b></th>
									<th width="15%"><b>Core Application Code</b></th>
								</s:elseif>
								
							</tr>
						</thead>
						<tbody>					
							<s:iterator value="customerSelection" var="customerdetail" status="stat">
								<tr>
									<s:if test='"CUSTOMER".equals(searchType) || "OC_CUSTOMER".equals(searchType)'>
										<td></td>   
									 	<td><input type="radio" name="selects" onclick="customerDetail('<s:property value="%{#customerdetail.TITLE}"/>','<s:property value="%{#customerdetail.ADDRESS1}"/>','<s:property value="%{#customerdetail.ADDRESS2}"/>','<s:property value="%{#customerdetail.MOBILE}"/>','<s:property value="%{#customerdetail.EMIRATE}"/>','<s:property value="%{#customerdetail.POBOX}"/>','<s:property value="%{#customerdetail.FIRST_NAME}"/>','<s:property value="%{#customerdetail.MISSIPPI_CUSTOMER_CODE}"/>','<s:property value="%{#customerdetail.CUSTOMER_ID}"/>','<s:property value="%{#customerdetail.EMAIL}"/>','<s:property value="%{#customerdetail.CUST_AR_NO}"/>')"/></td>   				  
										<td><s:property value='%{#customerdetail.FIRST_NAME==null?"":#customerdetail.FIRST_NAME}' /></td>
										<td><s:property value='%{#customerdetail.POBOX==null?"":#customerdetail.POBOX}'  /></td>
										<td><s:property value='%{#customerdetail.CITY_NAME==null?"":#customerdetail.CITY_NAME}' /></td>
										<td><s:property value='%{#customerdetail.EMAIL==null?"":#customerdetail.EMAIL}' /></td>
										<td><s:property value='%{#customerdetail.MISSIPPI_CUSTOMER_CODE==null?"":#customerdetail.MISSIPPI_CUSTOMER_CODE}' /></td>
									</s:if>
									<s:elseif test='"BROKER".equals(searchType)'>
										<td></td>   
									 	<td><input type="radio" name="selects" onclick="brokerDetail('<s:property value="%{#customerdetail.EMCODE}"/>','<s:property value="%{#customerdetail.EMPDES}"/>','<s:property value="%{#customerdetail.FGROUP}"/>','<s:property value="%{#customerdetail.EMACCODE}"/>','<s:property value="%{#customerdetail.COMMISSION}"/>','<s:property value="%{#customerdetail.PER}"/>'
										 	,'<s:property value="%{#customerdetail.TITLE}"/>','<s:property value="%{#customerdetail.CONTACT_PERSON}"/>','<s:property value="%{#customerdetail.CONTACT_PERSON_NO}"/>','<s:property value="%{#customerdetail.CONTACT_OCCUPATION}"/>','<s:property value="%{#customerdetail.ADDRESS1}"/>','<s:property value="%{#customerdetail.ADDRESS2}"/>','<s:property value="%{#customerdetail.CITY}"/>','<s:property value="%{#customerdetail.COUNTRY}"/>','<s:property value="%{#customerdetail.PHONE}"/>','<s:property value="%{#customerdetail.FAX}"/>' ,'<s:property value="%{#customerdetail.MOBILENO}"/>','<s:property value="%{#customerdetail.EMAIL}"/>'
										 	)"/></td>   				  
										<td><s:property value='%{#customerdetail.EMCODE==null?"":#customerdetail.EMCODE}'  /></td>
										<td><s:property value='%{#customerdetail.EMPDES==null?"":#customerdetail.EMPDES}' /></td>
										<td><s:property value='%{#customerdetail.EMCODE==null?"":#customerdetail.ADDRESS1}'  /></td>
										<td><s:property value='%{#customerdetail.EMCODE==null?"":#customerdetail.CITY}'  /></td>
										<td><s:property value='%{#customerdetail.EMCODE==null?"":#customerdetail.EMAIL}'  /></td>
										<td><s:property value='%{#customerdetail.EMACCODE==null?"":#customerdetail.EMACCODE}' /></td>
									</s:elseif>
								</tr>
							</s:iterator>
						</tbody>
					</table>
				</s:if>
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
         		<s:hidden name="customerId" />
         		<s:hidden name="searchType" />
			</div>
		</div>
	</div>
	<br/>
	<div class="tablerow" align="center">
		<%-- <s:submit type="button" name="close"  key="Close" cssClass="btn btn-sm btn-danger"/>&nbsp;&nbsp;&nbsp; --%>
		<input type="button" onclick="window.close()"  class="btn btn-sm btn-danger" value="Close" >&nbsp;&nbsp;&nbsp;
		<input type="button" name="submit" value="Submit" class="btn btn-sm btn-success" onclick="fnSubmit()"/>
	</div>
	
</div>

</s:form>
<s:form name="frm">
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
    <s:hidden name="customerId" />
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
	var search="",searchBy="";
	try{
		searchBy=document.getElementById('searchBy').value;
		search=document.getElementById('searchValue').value;
	}catch (e) {
		search=document.customerSelection.searchValue.value;
	}
	if(searchBy==null || searchBy==''){
		alert('Please Select  searchBy');
		return false;
	}else if(search==null || search==''){
		alert('Please Select  searchValue');
		return false;
	}else{
	postRequest('<%=request.getContextPath()%>/customerSelectionQuotation.action?searchValue='+search+'&searchBy='+searchBy+'&brokerCode='+'<s:property value="brokerCode"/>'+'&searchType='+'<s:property value="searchType"/>','customerSearchList');
	ajaxLoading(); 
	}
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
	//document.frm.customerNameAr.value=custArNo;
	
}

function fnSubmit() { 
	var searchType = document.frm.searchType.value;

	if(!document.frm.customerId.value) {
		if("BROKER" == searchType) {
			alert("Please Select Broker");
		}else{
			alert("Please Select Customer");
		}
	} else {
		if("CUSTOMER" == searchType) {
			if("0"==document.frm.customerId.value) {
				document.frm.customerId.value = "";
			}
			window.opener.document.getElementById("title").value=document.frm.title.value;
			window.opener.document.getElementById("address1").value=document.frm.address1.value;
			window.opener.document.getElementById("address2").value=document.frm.address2.value;
			window.opener.document.getElementById("mobileNo").value=document.frm.mobileNo.value;
			window.opener.document.getElementById("city").value=document.frm.city.value;
			window.opener.document.getElementById("poBox").value=document.frm.poBox.value;
			window.opener.document.getElementById("customerName").value=document.frm.customerName.value;
			window.opener.document.getElementById("coreAppCode").value=document.frm.coreAppCode.value;
			window.opener.document.getElementById("customerId").value=document.frm.customerId.value;
			window.opener.document.getElementById("email").value=document.frm.email.value;
			//window.opener.document.getElementById("customerNameAr").value=document.frm.customerNameAr.value;
			
			/*<s:if test='%{productId==openCover && !((quoteStatus=="RA")||(endTypeId!=null && endTypeId.length() > 0))}'>
				var sescustomerId = '<s:property value="#session.customer_id"/>';
				var customerId = document.customerSelection.customerId.value;
				if(customerId == sescustomerId) {
					window.opener.document.getElementById("editCustomerNO").checked = true;
				}
				else {
					window.opener.document.getElementById("editCustomerYES").checked = true;
				}
				window.opener.editCustomerInfo();
			</s:if>*/
			window.close();
		}if( "OPENCOVER" == searchType) {
			if("0"==document.frm.customerId.value) {
				document.frm.customerId.value = "";
			}
			window.opener.document.getElementById("title").value=document.frm.title.value;
			 window.opener.document.getElementById("address1").value=document.frm.address1.value;
			window.opener.document.getElementById("address2").value=document.frm.address2.value;
			window.opener.document.getElementById("mobileNo").value=document.frm.mobileNo.value;
			window.opener.document.getElementById("cityCode").value=document.frm.city.value;
			window.opener.document.getElementById("poBox").value=document.frm.poBox.value;
			window.opener.document.getElementById("custName").value=document.frm.customerName.value;
			window.opener.document.getElementById("coreAppCode").value=document.frm.coreAppCode.value;
			window.opener.document.getElementById("customerId").value=document.frm.customerId.value;
			window.opener.document.getElementById("email").value=document.frm.email.value; 
			
			window.close();
		}  
		else if("BROKER" == searchType) {
			window.opener.document.getElementById("bcode").value=document.frm.bcode.value;
			window.opener.document.getElementById("borganization").value=document.frm.broOrganisation.value;
			//window.opener.document.getElementById("groupId").value=document.frm.groupId.value;
			window.opener.document.getElementById("missippiId").value=document.frm.missippiId.value;
			window.opener.document.getElementById("title").value=document.frm.title.value;
			window.opener.document.getElementById("firstname").value=document.frm.customerName.value;
			window.opener.document.getElementById("occupation").value=document.frm.occupation.value;
			window.opener.document.getElementById("address1").value=document.frm.address1.value;
			window.opener.document.getElementById("address2").value=document.frm.address2.value;
			window.opener.document.getElementById("emirate").value=document.frm.city.value;
			window.opener.document.getElementById("country").value=document.frm.country.value;
			window.opener.document.getElementById("telephone").value=document.frm.phone.value;
			window.opener.document.getElementById("fax").value=document.frm.fax.value;
			window.opener.document.getElementById("mobile").value=document.frm.mobileNo.value;
			window.opener.document.getElementById("bemail").value=document.frm.email.value;
			if(window.opener.document.getElementById("mode").value!="edit"){
				window.opener.document.getElementById("loginid").value=document.frm.bcode.value;
			}
			
			window.close();
		} else if("OC_CUSTOMER" == searchType) {
			var coreCustomerId = document.frm.coreAppCode.value;
			document.location = '<%=request.getContextPath()%>/premiumOpenCover/newCustomer.jsp?corecustomers='+coreCustomerId+'&coreMode=edit&mode=new&brokerId=<s:property value="brokerId"/>';
		}	
	}
}

function trim(text) {
	return text.replace(/^\s+|\s+$/g, "");
}

</script>
</body>
</html>