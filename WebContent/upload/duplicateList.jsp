<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />		
	<script language="JavaScript">javascript:window.history.forward(1);</script>
	<script language="JavaScript">
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
			"order": [[ 1, "asc" ]],
			"columnDefs": [ {
			          "targets": 'no-sort',
			          "orderable": false
			    } ],
			"scrollX": true,
					responsive: false
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
			<s:form name="duplicates" action="" theme="simple" >
			<div class="panel panel-primary">
				<div class="panel-heading">
					<s:text name="Duplicate Policies"/>				
				</div>
				<div class="panel-body" align="center">
					 <table class="displayTable" style="width:90%; margin: 0 auto; overflow: auto;" id="lcDoctable">
	 				<thead>
	 					<tr>
						   <th ><s:text name="Najm Model ID" /></th>
						  <th ><s:text name="Najm Make ID" /></th>
						  <th ><s:text name="Make English Dec" /></th>
						  <th ><s:text name="Najm Model Name English" /></th>
						  <th ><s:text name="Najm Model Name Arabic" /></th>
						  <th ><s:text name="Country Name" /></th>
						  <th ><s:text name="Vehicle Type" /></th>
						  <th ><s:text name="Body Type" /></th>
						  <th ><s:text name="Yakeen Make" /></th>
						  <th ><s:text name="Yakeen Model" /></th>
	 					</tr>
	 				</thead>
				   	 <tbody>
				   	 <s:iterator value="duplicateTranslist">
						<tr>
							<td ><s:property value="NAJM_MODEL_ID"/></td>
							<td ><s:property value="NAJM_MAKE_ID"/></td>
							<td ><s:property value="NAJM_MAKE_DESC"/></td>
							<td ><s:property value="NAJM_MODEL_DESC"/></td>
							<td ><s:property value="NAJM_MODEL_DESC_AR"/></td>
							<td ><s:property value="COUNTRY_NAME"/></td>
							<td ><s:property value="VEHICLE_USE_DESC"/></td>
							<td ><s:property value="BODYTYPE_DESC"/></td>
							<td ><s:property value="YAKEEN_MAKE_ID"/></td>
							<td ><s:property value="YAKEEN_MODEL_ID"/></td>
						</tr>
					</s:iterator>
					 </tbody>
				</table>
				<br/>
						<div align="center">
							<input type="button" class="btn btn-sm btn-danger" value="Back" onclick="funBack();" />
						</div>	
			</div>
			<s:hidden name="tranId"/>
			<s:hidden name="typeId"/>	
			<s:hidden name="rawTable"/>
			<s:hidden name="masterTable"/>
			<s:hidden name="uwStartDate"/>	
			<s:hidden name="uwEndDate"/>
			<s:hidden name="startDate"/>	
			<s:hidden name="endDate"/>
			<s:token/>	
			</s:form>		
		</div>
	</div>	
			<script type="text/javascript">    
 		    function funBack()
		    {
		    	document.duplicates.action = 'transactionListOpenUpload.action';
		    	document.duplicates.submit();
		    }
	</script>
</body>
</html>
