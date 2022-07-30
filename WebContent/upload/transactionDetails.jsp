<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
  <body><br> 
  <s:form id="uploadForm" name="uploadForm" action="" theme="simple">
<div style="width: 90%;margin: 0 auto;" class="table0" >
	<div class="tablerow">
		<span style="color: red;"><s:actionerror/><s:fielderror/></span>
	</div>

	<div class="col-xs-12 table-responsive">
						<i><b><s:text name="Transaction Details" /></b></i> <br>
						<table class="table table-striped">
							<thead>
								<tr>
									<th width="20%">Total</th>
									<th width="20%">Upload</th>
									<th width="20%">NotUpload</th>
									<th width="20%">Duplicates</th>
								</tr>
							</thead>
							<tbody>
								<s:iterator value="transactionDetails" var="list" status="stat">
											<tr>
												<td><s:property value="#list.TOTAL_RECORDS" /></td>
												<td><s:property value="#list.VALID_RECORDS" /></td>
												<td><s:property value="#list.NOT_UPLOADED" /></td>
												<td><s:property value="#list.DUPLICATE_RECORDS" /></td>
											</tr>
											
										</s:iterator>
							</tbody>
						</table>
						<br/>
						<div align="center">
							<input type="button" class="btn btn-sm btn-danger" value="View" onclick="funBack();" />
						</div>						
					</div>
</div>	
<s:hidden name="typeId" />
<s:hidden name="tranId" id="tranId"/>
<s:token/>
</s:form>
<script type="text/javascript">
function funBack(){
		document.uploadForm.action='transactionListOpenUpload.action';
		document.uploadForm.submit();
	}
</script>
</body>
</html>
