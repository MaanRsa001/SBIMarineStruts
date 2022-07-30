<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ page language="java" import="com.maan.report.service.ReportService"%>
<!DOCTYPE HTML>
<html>
<head>
<style type="text/css">

#gridTable {
  table-layout: fixed;
  width: 100% !important;
}
#gridTable td,
#gridTable th{
  width: auto !important;
  white-space: normal;
  text-overflow: ellipsis;
  overflow: hidden;
}


</style>

	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.responsive.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.jqueryui.css">
	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.tableTools.css">
	<link href="<%=request.getContextPath()%>/dataTables/css/jquery-start-ui.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datepicker/jquery-ui.css">
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
				"order": [[ 1, "asc" ]],
				"columnDefs": [ {
		          "targets": 'no-sort',
		          "orderable": false
			    } ],
				responsive: true
			});
  			var data2 = $('#gridTable1').dataTable( {
				"lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
				"order": [[ 1, "asc" ]],
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
	
	
/* $(function() {
	$('#preEffectiveDate').datetimepicker({
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
	
}); */


  	</script>


</head>
<body>
<s:form name="report" theme="simple">
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				 Company Compliance Details				
			</div>
			<div class="panel-body" id="quoteInfo" style="display:;">
						
					<table class="display responsive no-wrap" id="gridTable" width="100%" cellspacing="0">
						<thead>
						<tr>
							<!-- <th class="no-sort"></th> -->
							<th>SNo</th>
							<th><b>FullName</b></th>
							<th><b>Last ChangeDate</b></th>
							<th><b>Nationality of Registration</b></th>
							<th><b>Owcode</b></th>
							<th><b>Short CompanyName</b></th>
							<th><b>Full Address</b></th>
							<th><b>Company Status</b></th>
							<th><b>CountryName</b></th>
						</tr>
						</thead>
						<tbody>
						<s:iterator value="comp" status="stat" var="report">
						<tr valign="middle">
							<!-- <td></td> -->
							<td><s:property value="%{#stat.index+1}"/></td>
							<td><s:property value="fullname" /></td>
							<td><s:property value="lastchangedate"/></td>
							<td><s:property value="nationalityofregistration"  /></td>
							<td><s:property value="owcode" /></td>
							<td><s:property value="shortcompanyname" /></td>
							<td><s:property value="fulladdress" /></td>
							<td><s:property value="companystatus" /></td>
							<td><s:property value="countryname" /></td>			
						</tr>
						</s:iterator>
							
						</tbody>
					</table>
				</div>								
			</div>
		</div>
	</div>

</s:form>
</body>
<script type="text/javascript">


</script>
</html>