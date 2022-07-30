<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />		
	<script language="JavaScript">javascript:window.history.forward(1);</script>
	<script language="JavaScript">
		 	function getConfirmation(tranid){
		        	answer=confirm("Do you want to delete this transaction : "+tranid);
			     	if(answer) {
			     	deleteTrans(tranid);
			     	return true;
			     	}
			     	else
			     	return false;
		     }
			function stopRKey(evt) { 
			  var evt = (evt) ? evt : ((event) ? event : null); 
			  var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null); 
			  if ((evt.keyCode == 13) && (node.type=="text"))  {return false;} 
			} 
			document.onkeypress = stopRKey; 
	</script>
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
		  	 var data = $('.displayTable').dataTable( {
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
	<div class="table0" style="width: 90%; margin: 0 auto;">
		<div class="tablerow">
		<span style="color:red;"><s:actionerror/></span>
	</div>
		<div class="tablerow" align="center">
			<s:form name="uploadTransaction"  theme="simple" >
			<div class="panel panel-primary">
				<div class="panel-heading">
					<s:text name="Upload Transaction Details"/>				
				</div>
				<div class="panel-body" align="center">
					 <table class="displayTable" style="width:90%;margin:0 auto;" id="lcDoctable">
	 				<thead>
	 					<tr>
						  <th width="20%"><s:text name="Batch Id" /></th>
						  <th width="20%"><s:text name="Transaction Date" /></th>
						  <th width="10%"><s:text name="Current Status" /></th>
						  <th width="10%"><s:text name="Total Records" /></th>
	 					  <th width="10%"><s:text name="Valid Records" /></th>
						  <th width="10%"><s:text name="Not Uploaded" /></th>
						  <th width="10%"><s:text name="Duplicates" /></th>
	 					</tr>
	 				</thead>
				   	 <tbody>
				   	 <s:iterator value="transList">
						<tr> 
							<td width="20%"><s:property value="BATCH_ID"/></td>
							<td width="20%"><s:property value="ENTRY_DATE"/></td>
							<td width="20%"><s:property value="status"/></td>
							<td width="10%"><s:property value="TOTAL_RECORDS"/></td>
							<td width="10%"><a type="button" class="btn btn-sm btn-success" title="Total" onclick="uploaded('<s:property value="BATCH_ID"/>')"><s:property value="VALID_RECORDS"/></a></td>
							<td width="20%"><s:property value="NOT_UPLOADED"/></td>
							<td width="10%"><a type="button" class="btn btn-sm btn-success" title="Total" onclick="duplicates('<s:property value="BATCH_ID"/>')"><s:property value="DUPLICATE_RECORDS"/></a></td>
						</tr>
					</s:iterator>
					 </tbody>
				</table>
			</div>	
				<div align="center">
					<a type="button" class="btn btn-sm btn-danger" title="Back" onclick="getBack()">Back</a>
				</div>  
			</div>
			<s:hidden name="typeId"/>	
			<s:hidden name="startDate"/>	
			<s:hidden name="endDate"/>
			<s:hidden name="uploadTranId"/>
			<s:hidden name="reqTo"/>
			<s:hidden name="mfrType"/>
			<s:token/>
			</s:form>		
		</div>
	</div>	
			<script type="text/javascript">   
		     function uploaded(tranid)
		    {
		    	document.uploadTransaction.action = "<%=request.getContextPath()%>/uploadedListOpenUpload.action?tranId="+tranid;
		    	document.uploadTransaction.submit();
		    }
		    function duplicates(tranid)
		    {
		    	document.uploadTransaction.action = "<%=request.getContextPath()%>/duplicateListOpenUpload.action?tranId="+tranid;
		    	document.uploadTransaction.submit();
		    }
		    
		    function getBack()
		    {
		    	document.uploadTransaction.action = "<%=request.getContextPath()%>/fileUploadOpenUpload.action?";
		    	document.uploadTransaction.submit();
		    }
	</script>
</body>
</html>
