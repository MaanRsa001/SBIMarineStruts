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
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.responsive.css">
	<s:if test="locale.language == 'ar'">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.jqueryui_ar.css">
	</s:if>
	<s:else>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.jqueryui.css">
	</s:else>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.tableTools.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datepicker/jquery-ui.css">
	<s:if test="locale.language == 'ar'">
		<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery.dataTables.min_ar.js"></script>
	</s:if>
	<s:else>
		<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery.dataTables.min.js"></script>
	</s:else>
	
	
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.jqueryui.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.responsive.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.tableTools.js"></script>
		
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
<table class="display responsive no-wrap" id="record" width="100%" cellspacing="0" style="font-size: 12px;">
	<thead>
	<tr class="info">
		<th width="5%" class="no-sort"></th>
		<th width="5%"></th>
		<s:if test='"CUSTOMER".equals(searchType) || "OC_CUSTOMER".equals(searchType) || "OPENCOVER".equals(searchType)'>
			<th width="19%"><b>Customer Name</b></th>
			<th width="19%"><b>Customer Name Arabic</b></th>
			
			<th width="19%"><b>P.O.Box</b></th>
			<th width="19%"><b>City</b></th>
			<th width="19%"><b>Email</b></th>
			<th width="19%"><b>Core Application Code</b></th>
		</s:if>
		<s:elseif test='"BROKER".equals(searchType)'>
			<th width="15%"><b>Broker Code</b></th>
			<th width="15%"><b>Broker Name</b></th>
			<th width="15%"><b>P.O.Box</b></th>
			<th width="15%"><b>City</b></th>
			<th width="15%"><b>Email</b></th>
			<th width="15%"><b>Core Application Code</b></th>
		</s:elseif>
		
	</tr>
	</thead>
	<tbody>		
		<s:set var="custSelection" value="customerSelection"></s:set>			
		<s:if test="#custSelection!=null && #custSelection.size > 0">
			<s:iterator value="#custSelection" var="customerdetail" status="stat">
				<tr>
					<s:if test='"CUSTOMER".equals(searchType) || "OC_CUSTOMER".equals(searchType) || "OPENCOVER".equals(searchType)'>
						<td></td>   
					 	<td><input type="radio" name="selects" onclick="customerDetail('<s:property value="%{#customerdetail.TITLE}"/>','<s:property value="%{#customerdetail.ADDRESS1}"/>','<s:property value="%{#customerdetail.ADDRESS2}"/>','<s:property value="%{#customerdetail.MOBILE}"/>','<s:property value="%{#customerdetail.EMIRATE}"/>','<s:property value="%{#customerdetail.POBOX}"/>','<s:property value="%{#customerdetail.FIRST_NAME}"/>','<s:property value="%{#customerdetail.MISSIPPI_CUSTOMER_CODE}"/>','<s:property value="%{#customerdetail.CUSTOMER_ID}"/>','<s:property value="%{#customerdetail.EMAIL}"/>','<s:property value="%{#customerdetail.COMPANYARABIC}"/>')"/></td>   				  
						<td><s:property value='%{#customerdetail.FIRST_NAME==null?"":#customerdetail.FIRST_NAME}' /></td>
						<td><s:property value='%{#customerdetail.COMPANYARABIC==null?"":#customerdetail.COMPANYARABIC}' /></td>
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
		</s:if>
		<s:else>
			<s:if test='"CUSTOMER".equals(searchType) || "OC_CUSTOMER".equals(searchType)'>
				<tr><td colspan="7"><s:label key="quotation.norecords" theme="simple"></s:label> </td> </tr>
			</s:if>
			<s:elseif test='"BROKER".equals(searchType)'>
				<tr><td colspan="8"><s:label key="quotation.norecords" theme="simple"></s:label> </td> </tr>
			</s:elseif>
		</s:else>
</tbody>
</table>
</body>