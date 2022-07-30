<%@ page language="java" import="java.util.*"  isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>
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
				"order": [[ 1, "desc" ]],
				"columnDefs": [ {
		          "targets": 'no-sort',
		          "orderable": false
			    } ],
				responsive: true
			});
		} catch(err){}
	} );
  	</script>
  	<style type="text/css">
			.corners {				
				  background: #4db6ac;				   
				  width: 250px;
				  height: 50px; 
				  text-align :center;
				  color:white;
				} 
			.cornersbody {
				  width: 250px;
				  height: 250px; 
				  text-align :center;
				  border-style: dotted;
				  border-top : 1px;
				  color:black;
				  border-color: #4db6ac;
			}
			  
      	.dropzone{
      		border:none !important;
      		height: 220px; 
      	}
      	/* upload    */
      	.box {
			width:60%;
			height:100%;
			background:#FFF;
			margin:40px auto;
			padding:20px;
		}
		.effect8
		{
		  	position:relative;
		    -webkit-box-shadow:0 1px 4px rgba(0, 0, 0, 0.3), 0 0 40px rgba(0, 0, 0, 0.1) inset;
		       -moz-box-shadow:0 1px 4px rgba(0, 0, 0, 0.3), 0 0 40px rgba(0, 0, 0, 0.1) inset;
		            box-shadow:0 1px 4px rgba(0, 0, 0, 0.3), 0 0 40px rgba(0, 0, 0, 0.1) inset;
		}
		.effect8:before, .effect8:after
		{
			content:"";
		    position:absolute;
		    z-index:-1;
		    -webkit-box-shadow:0 0 20px rgba(0,0,0,0.8);
		    -moz-box-shadow:0 0 20px rgba(0,0,0,0.8);
		    box-shadow:0 0 20px rgba(0,0,0,0.8);
		    top:10px;
		    bottom:10px;
		    left:0;
		    right:0;
		    -moz-border-radius:100px / 10px;
		    border-radius:100px / 10px;
		}
		.effect8:after
		{
			right:10px;
		    left:auto;
		    -webkit-transform:skew(8deg) rotate(3deg);
		       -moz-transform:skew(8deg) rotate(3deg);
		        -ms-transform:skew(8deg) rotate(3deg);
		         -o-transform:skew(8deg) rotate(3deg);
		            transform:skew(8deg) rotate(3deg);
		}
		.btn-block{background-color:#f36f21;border-color:#f36f21}
		.row-pdd-bottom{padding-bottom: 15px;}
		</style>
<link href="<%=request.getContextPath()%>/uploadscript/css/dropzone.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/uploadscript/js/dropzone-struts2.js"></script>
</head>
<body>

<s:if test="display=='uploadList'">
<s:form name="uploadForm"  action="/downloadOpenUpload.action" method="post" enctype="multipart/form-data" theme="simple"  >
<div class="row">
	<div class="col-xs-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="upload.uploadDetails"/>
				<div class="pull-right">
					<s:label key="upload.tranId"/>&nbsp;<s:property value="tranId"/>
				</div>
			</div>
			<div class="panel-body">
			<table width="100%" class="display table table-bordered" id="copyQuoteTable">
						<thead>
						<tr>
							<th><s:text name="Commodity" /></th>
							<th><s:text name="Mode of transport" /></th>
							<th><s:text name="Cover" /></th>
							<th><s:text name="Invoice value" /></th>
							<th><s:text name="Marine premium" /></th>
							<th><s:text name="War premium" /></th>
							<th><s:text name="Issuance fee" /></th>
							<th><s:text name="Quote No" /></th>
							<th><s:text name="Remarks" /></th>
						</tr>
						</thead>
						<tbody>
						<s:iterator value="UploadedList" status="stat" var="record">
						<tr>
							<td><s:property value="Commodity"/></td>
							<td><s:property value="ModeOfTransport"/> </td>
							<td><s:property value="Coverage" /></td>
							<td><s:property value="SumInsured" /></td>
							<td><s:property value="MarinePremium" /></td>
							<td><s:property value="WarPremium" /></td>
							<td><s:property value="PolicyFee" /></td>
							<td><s:property value="QuoteNo" /></td>
							<td><s:property value="Remarks" /></td>
						</tr>
						</s:iterator>
						</tbody>
					</table>	
				<br class="clear" />
				<div class="row">
					<div class="col-xs-12" align="center">
						<input type="button"  class="btn btn-sm btn-danger" value="Back" onClick="goBack()"/>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</s:form>
</s:if>
<s:if test="display=='errorList'">
<s:form name="uploadForm"  action="/errorOpenUpload.action" method="post" enctype="multipart/form-data" theme="simple">
<div class="row">
	<div class="col-xs-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="upload.errorDetail"/>
				<div class="pull-right">
					<s:label key="upload.tranId"/>&nbsp;<s:property value="#request.TranId"/>
				</div>
			</div>
			<div class="panel-body">
				<table width="100%" class="display table table-bordered" id="copyQuoteTable">
						<thead>
						<tr>
							<th><s:text name="Commodity" /></th>
							<th><s:text name="Mode of transport" /></th>
							<th><s:text name="Cover" /></th>
							<th><s:text name="Invoice value" /></th>
							<th><s:text name="Error Description" /></th>
						</tr>
						</thead>
						<tbody>
						<s:iterator value="ErrorList" status="stat" var="record">
						<tr>
							<td><s:property value="Commodity"/></td>
							<td><s:property value="ModeOfTransport"/> </td>
							<td><s:property value="Coverage" /></td>
							<td><s:property value="SumInsured" /></td>
							<td><s:property value="ErrorDesc" /></td>
						</tr>
						</s:iterator>
						</tbody>
					</table>
				<br class="clear" />
				<div class="row">
					<div class="col-xs-12" align="center">
						<input type="button"  class="btn btn-sm btn-danger" value="Back" onClick="goBack()"/>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</s:form>
</s:if>
<s:if test="display=='TransactionList'">
<s:form name="uploadForm" action="/listOpenUpload.action" method="post" enctype="multipart/form-data" theme="simple"  >
<div class="row">
	<div class="col-xs-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="upload.transactionDetail"/>
			</div>
			<div class="panel-body">
				<s:hidden name="typeId" />
				<s:hidden name="tranId" />
					<table width="100%" class="display table table-bordered" id="copyQuoteTable">
						<thead>
						<tr>
							<th><s:text name="Transaction Id" /></th>
							<th><s:text name="Transaction Date" /></th>
							<th><s:text name="Total Records" /></th>
							<th><s:text name="Uploaded Count" /></th>
							<th><s:text name="Pending Count" /></th>
							<th><s:text name="Total Premium" /></th>
						</tr>
						</thead>
						<tbody>
						<s:iterator value="TransactionList" status="stat" var="record">
						<tr>
							<td><s:property value="TransactionID"/></td>
							<td><s:property value="TransactionDate"/> </td>
							<td><s:property value="TotalRecords" /></td>
							<td><a href="#" class="btn btn-sm btn-info"  onclick="downloadSuccess(<s:property value='TransactionID'/>)"><s:property value="UploadedCount" /></a></td>
							<td><a href="#" class="btn btn-sm btn-info"  onclick="downloadError(<s:property value='TransactionID'/>)"><s:property value="PendingCount" /></a></td>
							<td>
							<s:if test='"0".equals(ReferralCount)'>
							<s:property value="TotalPremium" />
							</s:if>
							</td>
						</tr>
						</s:iterator>
						</tbody>
					</table>	
			</div>
		</div>
	</div>
</div>
<s:token/>
</s:form>
</s:if>   
</body>
<script type="text/javascript">
function loaderImage()
{
	document.getElementById('loaderImage').style.display="block";
}

function downloadFile()
{
	
	document.uploadForm.action="<%=request.getContextPath()%>/downloadOpenUpload.action";
	document.uploadForm.submit();
}
function downloadErrorFile()
{
	document.uploadForm.action="<%=request.getContextPath()%>/errorOpenUpload.action";
	document.uploadForm.submit();
}
function downloadSuccess(val)
{
	document.uploadForm.tranId.value=val;
	document.uploadForm.action="<%=request.getContextPath()%>/downloadOpenUpload.action";
	document.uploadForm.submit();
}

function pendingReupload(val)
{
	document.uploadForm.tranId.value=val;
	document.uploadForm.action="<%=request.getContextPath()%>/reuploadOpenUpload.action";
	document.uploadForm.submit();
}

function downloadError(val)
{  
    document.uploadForm.tranId.value=val;
	document.uploadForm.action="<%=request.getContextPath()%>/errorOpenUpload.action";
	document.uploadForm.submit();
}
function goBack()
{
     document.uploadForm.action="<%=request.getContextPath()%>/redirectOpenUpload.action";
 document.uploadForm.submit();
 return true;
}
function goConfirm()
{
 if(confirm("Do you want to Continue Upload?")) {
 	document.uploadForm.action="<%=request.getContextPath()%>/uploadOpenUpload.action";
 	try{
 		document.uploadForm.conveyance1.value=document.uploadForm.conveyance.options[document.uploadForm.conveyance.selectedIndex].text;
 	}catch(err){}
 	try{
 		document.uploadForm.cover1.value=document.uploadForm.cover.options[document.uploadForm.cover.selectedIndex].text;
 	}catch(err){}
 	try{
 		document.uploadForm.saleTerm1.value=document.uploadForm.saleTerm.options[document.uploadForm.saleTerm.selectedIndex].text;
 	}catch(err){}
 	try{
 		document.uploadForm.saleTermPercent1.value=document.uploadForm.saleTermPercent.options[document.uploadForm.saleTermPercent.selectedIndex].text;
 	}catch(err){}
 	try{
 		document.uploadForm.tolerance1.value=document.uploadForm.tolerance.options[document.uploadForm.tolerance.selectedIndex].text;
 	}catch(err){}
 	document.uploadForm.submit();
	return true;
 } else
 	return false;
}
function goTransaction()
{
 document.uploadForm.action="<%=request.getContextPath()%>/listOpenUpload.action";
 document.uploadForm.submit();
 return true;
}
function goQuote()
{
 document.uploadForm.action="<%=request.getContextPath()%>/ViewOpenCovers.jsp";
 document.uploadForm.submit();
 return true;

}



function getList(val, id) {
 	if(id=='percentList'){
 		if(setBasisVal(document.uploadForm.saleTerm, id)){
 			postRequest('<%=request.getContextPath()%>/'+id+'Quotation.action'+val, id);
 		}
 	}else if(id=='conveyanceList'){}
 	else{
 		postRequest('<%=request.getContextPath()%>/'+id+'Quotation.action'+val, id);
 	}
}
//setBasisVal(document.uploadForm.saleTerm, 'percentList');
function setBasisVal(obj, id){
	 var flag=true;
	 var value=obj.options[obj.selectedIndex].innerText;
	 if(value=='Declared Value'){
	 	document.uploadForm.tolerance.disabled=true;
	 	document.uploadForm.saleTermPercent.disabled=true;
	 	document.uploadForm.saleTermDecVal.value=document.uploadForm.saleTerm.value;
	 	document.getElementById(id).disabled=true;
	 	document.uploadForm.saleTermPercent.value='';
	 	document.uploadForm.tolerance.value='Declared Value';
		flag=false;
	 }else{
	 	document.uploadForm.tolerance.disabled=false;
		 document.getElementById(id).disabled=false;
	 	document.uploadForm.saleTermDecVal.value='';
	 }
	 return flag;
}



</script>
</html>