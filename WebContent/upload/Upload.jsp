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
  
  <body> 
  <s:if test="display==null">
<s:form action="uploadFilesOpenUpload" method="post" enctype="multipart/form-data" theme="simple" id="uploadForm" >
<div style="width: 90%;margin: 0 auto;" class="table0" >
	<div class="tablerow">
		<span style="color: red;"><s:actionerror/><s:fielderror/></span>
	</div>

	<div class="tablerow" align="center">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:label key="upload.fileUpload"/>
			</div>
			<div class="panel-body">
			<table style="width:50%;margin:0;" id="lcDoctable">
	 				  <tbody>
						<tr>
						    <td width="50%" >	<s:label key="Upload Type"/><font color="red">*</font></td>
							<td width="50%" ><s:select cssClass="inputBoxS" name="mfrType" id="mfrType" list="typeList" listKey="TYPE_ID"  listValue="TYPE_NAME "  headerKey="" headerValue="---Select---"/></td>
						</tr>
						<tr>
							<td colspan="2" height="5"></td>
						</tr>
						<tr>
							<td ><s:label key="upload.fileToUpload"/><font color="red">*</font></td>
							<td ><s:file name="exupload" cssClass="inputBox" /></td>
						</tr>
					 </tbody>
				</table>
				<br class="clear"/>
				<div class="boxcontent" align="center">
					<button type="submit" onclick="loaderImage()" class="btn btn-sm btn-success" >
						<i class="glyphicon glyphicon-cloud-upload"></i> &nbsp; Upload
					</button>					
					<s:hidden name="typeId"/>
				</div>
			</div>
		</div>
	</div>
</div>	
<s:token/>
</s:form>
</s:if>
<s:elseif test="display=='result'">

</s:elseif>
</body>
  <SCRIPT type="text/javascript">
  	function loaderImage()
	{
		//var URL ='<%=request.getContextPath()%>/uploadFilesUpload.action?;
		document.getElementById('loaderImage').style.display="block";
	}

		function getDeleted(tranId)
			{
			var URL ='<%=request.getContextPath()%>/getDeletedTransactionDetailsUpload.action?reqForm=deleted&tranId='+tranId;
			return popUp(URL,'800','600');	
			}
		function getUploaded(tranId)
			{
			var URL = '<%=request.getContextPath()%>/getupTransactionDetailsUpload.action?reqForm=uploaded&tranId='+tranId;
			return popUp(URL,'800','600');
			}
		  	
		  	
</script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/file-upload/js/vendor/jquery.ui.widget.js"></script>
<script src="//blueimp.github.io/JavaScript-Load-Image/js/load-image.all.min.js"></script>
<script src="//blueimp.github.io/JavaScript-Canvas-to-Blob/js/canvas-to-blob.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/file-upload/js/jquery.iframe-transport.js"></script>
<script src="<%=request.getContextPath()%>/file-upload/js/jquery.fileupload.js"></script>
<script src="<%=request.getContextPath()%>/file-upload/js/jquery.fileupload-process.js"></script>
<script src="<%=request.getContextPath()%>/file-upload/js/jquery.fileupload-image.js"></script>
<script src="<%=request.getContextPath()%>/file-upload/js/jquery.fileupload-audio.js"></script>
<script src="<%=request.getContextPath()%>/file-upload/js/jquery.fileupload-video.js"></script>
<script src="<%=request.getContextPath()%>/file-upload/js/jquery.fileupload-validate.js"></script>
</html>

