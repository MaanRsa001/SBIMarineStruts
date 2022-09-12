<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>::: SBI - Documents :::
		<title> ::: SBI - Documents ::: </title>
		<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/SBI_icon_header.jpg" />
		<sj:head jqueryui="true" jquerytheme="start" />
		<link href="<%=request.getContextPath()%>/css/styles.css" rel="stylesheet" type="text/css" />
		<link href="<%=request.getContextPath()%>/css/easyui.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/css/icon.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/css/demo.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/css/tcal.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath()%>/css/ddlevelsmenu-topbar.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath()%>/css/ddlevelsmenu-base.css" rel="stylesheet" type="text/css" />
        <link href="<%=request.getContextPath()%>/css/displaytag.css" rel="stylesheet" type="text/css">
        <link href="<%=request.getContextPath()%>/cssbootstrap/bootstrap.min.css" rel="STYLESHEET" type="text/css">
		<link href="<%=request.getContextPath()%>/css/footable-0.1.css" rel="stylesheet" type="text/css">
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/tcal.js"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
        <script src="<%=request.getContextPath()%>/js/ddlevelsmenu.js" type="text/javascript"></script>
        <script src="<%=request.getContextPath()%>/js/ddtabmenu.js" type="text/javascript"></script>
        <script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
        <script>
       	 $(document).unbind('keydown').bind('keydown', function (event) {
			    var doPrevent = false;
			    if (event.keyCode === 8) {
			        var d = event.srcElement || event.target;
			        if ((d.tagName.toUpperCase() === 'INPUT' && (d.type.toUpperCase() === 'TEXT' || d.type.toUpperCase() === 'PASSWORD' || d.type.toUpperCase() === 'FILE')) 
			             || d.tagName.toUpperCase() === 'TEXTAREA') {
			            doPrevent = d.readOnly || d.disabled;
			        }
			        else {
			            doPrevent = true;
			        }
			    }
			    if (doPrevent) {
			        event.preventDefault();
			    }
			});
        </script>
    </head>
<body> 
<s:form name="report" theme="simple" enctype="multipart/form-data">
	<table width="100%" border="0" cellspacing="0" cellpadding="2" align="center" bgcolor="#FFFFFF">
		<tr >
			<td colspan="2">
				<s:actionmessage cssStyle="color:green;"/>
				<s:actionerror cssStyle="color:red;"/>
			</td>
		</tr>
  		<tr><td>&nbsp;</td></tr>	
  		<tr>
  			<td class="heading" width="100%">
  			   <s:text name="lc.policydetails" />		      		  
     		</td>
  		</tr>
  		<tr><td>&nbsp;</td></tr>
		<tr>
  			<td><span class="headingOrange">Policy No : <s:property value="policynumber"/></span></td>
  		</tr>
  		<tr><td>&nbsp;</td></tr>
  		<tr>
  			<td>
  			<table class="footable" style="width:100%;margin:0 auto;" id="lcDoctable">
 				<s:set var="lcDoc" value="1"/>
 				<thead>
 					<tr>
					  <th width="25%">Upload File</th>
					  <th width="25%">Remarks</th>
					  <th width="25%">Delete</th>
 					</tr>
 				</thead>
			   <s:if test="documentList.size()>0">
			   	 <tbody>
			   	 	<s:iterator value="documentList" var="lcfile">
						<s:set var="lcDoc" value="1"/>
						<tr>
							<td><s:property value="%{#lcfile.ORIGINAL_FILE}"/></td>
								<td><s:property value="%{#lcfile.remarks}"/></td>
								<td>
									<a href="#" class="btn btn-sm btn-info" onclick="downloadDoc('<s:property value="%{#lcfile.ORIGINAL_FILE}"/>','<s:property value="%{#lcfile.file_Name}"/>')">
									<i class="glyphicon glyphicon-save"></i></a>
									<a href="#" class="btn btn-sm btn-warning" onclick="deleteDoc('<s:property value="%{#lcfile.upload_id}"/>','<s:property value="%{#lcfile.file_Name}"/>')">
									<i class="glyphicon glyphicon-remove"></i></a>
								</td>
						</tr>
					</s:iterator>
					<tr >
						<td width="25%"> <s:file cssClass="inputBox" name="upload" ></s:file></td>
						<td width="25%"> <s:textfield name="lcdocremarks" id="lcdocremarks" value='%{lcdocremarks.isEmpty()?"":lcdocremarks}' cssClass="inputBox"></s:textfield>  </td>
						<td width="25%"></td>
					</tr>
					<s:hidden name="uploadId" id="uploadId"/>
					<s:hidden name="lcFileName" id="lcFileName"/>
					<s:hidden name="downloadFileName" id="downloadFileName"/>
				 </tbody>	
				</s:if>
				<s:else>
					<tbody>
		 				<tr>
							<td width="25%"> <s:file cssClass="inputBox" name="upload" ></s:file></td>
							<td width="25%"> <s:textfield name="lcdocremarks" value='%{lcdocremarks.isEmpty()?"":lcdocremarks}' id="lcdocremarks" cssClass="inputBox"></s:textfield>  </td>
							<td width="25%">  </td>
						</tr>
			   		</tbody>
				</s:else>
		</table>
	    <div class="boxcontent" align="right" >
		  	<input type="button" class="btn btn-sm btn-primary" onclick="addMorelc()" value="Add More">
		</div>
  			</td>
  		</tr>				
				<tr align="center">
					<td>
						<input type="button" value="Submit" class="btn btn-sm btn-success" onclick="lcFileUpload();"/>&nbsp;
						<input type="button" value="Close" class="btn btn-sm btn-danger" onclick="lcFileUploadBack();"/>
					</td>
				</tr> 
	  		</table>
	  		<s:hidden name="policyNo"/>
 </s:form>
</body>
<script type="text/javascript">
function lcFileUpload(){
	document.report.action = "<%=request.getContextPath()%>/submitDocument.action";
	document.report.submit();
}
function addMorelc(){
			var table = document.getElementById('lcDoctable');
			var rowCount = table.rows.length;
			var row = table.insertRow(rowCount);
			row.className="runtext";
			row.id = "new_"+rowCount;
			
			cell = row.insertCell(0);
			var element = document.createElement("input");
			element.className = "inputBox";
			element.name = "upload";
			element.id = "upload";
			element.type = "file";
			cell.appendChild(element);
			
			cell = row.insertCell(1);
			var element = document.createElement("input");
			element.className = "inputBox";
			element.name = "lcdocremarks";
			element.id = "lcdocremarks";
			element.type = "text";
			cell.appendChild(element);
			
			cell = row.insertCell(2);
			var element = document.createElement("input");
			element.type = "checkbox";
			element.id = "chk"+rowCount;
			element.align = "right";
			element.onclick = function () {deleteRow(this.id,this)};	
		    cell.appendChild(element);
}
function deleteRow(id, el) {
	var decision = confirm("Row will be deleted. Do You Want to continue? ","");{
		if (decision==true){
			while (el.parentNode && el.tagName.toLowerCase() != 'tr') {
				el = el.parentNode;
			}
			if (el.parentNode && el.parentNode.rows.length > 1) {
				el.parentNode.removeChild(el);
			}
		} else {
			document.getElementById(id).checked=false;
		}	   
	}
}
function deleteDoc(uplaodId1,fileName1){
	var decision = confirm("Document will be deleted. Do You Want to continue? ","");{
		if (decision==true) {
			document.getElementById("uploadId").value=uplaodId1;
			document.getElementById("lcFileName").value=fileName1;
			document.report.action = "<%=request.getContextPath()%>/deleteDocument.action";
			document.report.submit();
		}
	}
}
function downloadDoc(downloadFileName,fileName1){
	document.getElementById("downloadFileName").value=downloadFileName;
	document.getElementById("lcFileName").value=fileName1;
	document.report.action = "<%=request.getContextPath()%>/downloadDocument.action";
	document.report.submit();
}
function lcFileUploadBack(){
	window.close();
}
</script>
</html>


