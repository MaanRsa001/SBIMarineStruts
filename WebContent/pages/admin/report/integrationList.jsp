<%@ page isELIgnored="false" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>
<!DOCTYPE HTML>
<html>
<head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/dataTables/css/dataTables.responsive.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/dataTables/css/dataTables.jqueryui.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/dataTables/css/dataTables.tableTools.css">
	<link href="${pageContext.request.contextPath}/dataTables/css/jquery-start-ui.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/dataTables/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/dataTables/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/dataTables/js/dataTables.jqueryui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/dataTables/js/dataTables.responsive.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/dataTables/js/dataTables.tableTools.js"></script>
	<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script type="text/javascript">
  	jQuery(function ($) {
  		try {
			var data1 = $('.display').dataTable( {
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
  	
  	
  	$(function() {
  		$('#endDates').datepicker({
  			changeMonth: true,
  	        changeYear: true,
  	        endDate:"+45d",
  	        dateFormat: 'dd/mm/yy'
  		}).on('changeDate', function(e){
  		    $(this).datepicker('hide');
  		});
  	});
</script>
<style>
.panel-heading {
    padding: 5px;
}

.panel-primary>.panel-heading {
    border: 0px ;
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">   

</head>
<body>
<s:form id="yachtIntg" name="yachtIntg" method="post" theme="simple">
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="Integration Failed" />
			</div>				
			<div class="panel-body">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<span style="color:red"><s:property value="intgMessage"/></span>
					</div>
				</div>
				
				  <div style="color: red;">
				      <s:actionerror/>
				   </div>
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<div class="row" >
					
					
						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							<div class="text"> <s:text name="Start Date"/> <font color="red">*</font> </div>
							<div class="tbox">
								<s:textfield cssClass="inputBox datepicker" name="startDate" id="startDate" readonly="true" />
							</div>
						</div>
						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							<div class="text"> <s:text name="End Date"/> <font color="red">*</font> </div>
							<div class="tbox">
								<s:textfield cssClass="inputBox datepicker" name="endDate" id="endDate" readonly="true" />
							</div>
						</div>
						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							<div class="text"> <s:text name="Product"/> <font color="red">*</font> </div>
							<div class="tbox">
								<s:select name="productID" cssClass="inputBoxS" id="productID" list="productList" headerKey="" headerValue="---Select---" listKey="ProductId" listValue="ProductName" />
							</div>
						</div>
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<br>
							<div align="center">
								<input type="button" name="sub" value="Search" onclick="funSub()" class="btn btn-sm btn-success" />
							</div>
						</div>
					</div>
				
				<br>
				<br>
				
				<s:if test="integrationFailedList.size()>0">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<table class="display responsive no-wrap" id="record" width="100%" cellspacing="0">
							<thead>
							<tr>
								<th class="no-sort"></th>
								<th><s:text name="S.No" /></th>
								<th><s:text name="Product" /></th>
								<th><s:text name="Quote No" /></th>
								<th><s:text name="Broker name" /></th>
								<th><s:text name="Issued By" /></th>
								<th><s:text name="Insured Name" /></th>
								<th><s:text name="Period From" /></th>
								<th><s:text name="Period To" /></th>
								<th><s:text name="Premium" /></th>
								<th><s:text name="Integration Error" /></th>
								<th>Edit</th>
								<th><s:text name="Reintegrate" /></th>
							</tr>
							</thead>
						 <tbody>
							<s:iterator value="integrationFailedList" status="stat" var="record">
							<tr>
								<td></td>
								<td><s:property value="%{#stat.index+1}" /> </td>
								<td><s:property value="product" /> </td>
								<td><s:property value="QuoteNo" /> </td>
								<td><s:property value="BrokerName" /> </td>
								<td><s:property value="IssuedBy" /> </td>
								<td><s:property value="CustomerName" /> </td>
								<td><s:property value="InceptionDate" /> </td>
								<td><s:property value="ExpiryDate" /> </td>
								<td><s:property value="Premium" /> </td>
								<td><s:property value="coreIntgError" /> </td>
								<td><button class="btn btn-sm btn-primary" onclick="reIntegEditMarine('<s:property value="QuoteNo" />');"><i class='fas fa-pen'></i></button> </td>
								<td><s:a href="#" cssClass="btn btn-sm btn-primary" onclick="return reintegrate('%{#record.ApplicationNO}');"><i class="glyphicon glyphicon-book"></i></s:a> </td>
							</tr>
							</s:iterator>
							</tbody>
						</table>
					</div>
				</div>
				</s:if>
			</div>
		</div>
	</div>
</div>
<s:hidden name="quoteNo" id="quoteNo"></s:hidden>
<s:hidden name="applicationNo" id="applicationNo"></s:hidden>
 <s:token/>
</s:form>


<%-- <s:hidden name="productID" id="productID" /> --%>
<script type="text/javascript">

function reintegrate(val) {
	document.getElementById("applicationNo").value=val;
	document.yachtIntg.action='${pageContext.request.contextPath}/reintegrateAreport.action';	
	document.yachtIntg.submit();
}

function funSub(){
	document.yachtIntg.action = '${pageContext.request.contextPath}/integrationListAreport.action';
	document.yachtIntg.submit();
}


function reIntegEditMarine(val){
	document.getElementById("quoteNo").value=val;
	document.yachtIntg.action = '${pageContext.request.contextPath}/integrationNewAreport.action';
	document.yachtIntg.submit();
}


function reintegEdit(val){
	document.getElementById("quoteNo").value=val;
	document.yachtIntg.action = '${pageContext.request.contextPath}/editReintegrateYacht.action';
	document.yachtIntg.submit();
}


function reintegEditYacht(val){
	document.getElementById("quoteNo").value=val;
	document.yachtIntg.action = '${pageContext.request.contextPath}/editReintegrateYacht.action';
	document.yachtIntg.submit();
}
</script>


</body>
</html>