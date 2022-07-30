<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href=" https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css">
  <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
 
  <style>
  div.dataTables_wrapper {
        width: 700px;
        margin: 0 auto;
    }
  </style>
  <script>
  $(document).ready(function() {
    $('#example').DataTable( {
        "scrollX": true,
        destroy: true
    } );
} );
  
 
  </script>
</head>
<body>

<div class="container">            
  <table id="example" class="display nowrap" style="width:100%">
 
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

</body>
</html>
