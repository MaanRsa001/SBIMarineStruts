<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ page language="java" import="com.maan.report.service.ReportService"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script language="JavaScript">javascript:window.history.forward(1);</script>
<script language="JavaScript">
</script>
</head>
<body>
<s:form name="report" theme="simple" enctype="multipart/form-data">
<s:set var="format" value="%{'number.format.'+#session.CurrencyDecimal}"></s:set>
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<s:actionerror cssStyle="color: red;" />
	</div>
</div>
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="lc.policydetails" />
			</div>
			<div class="panel-body">
			<s:iterator value="lcUploadDetails" var="lcupload">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
						<div class="textV">
				 			<s:text name="lc.policyNo"/>
				 		</div>
				 		<div class="tboxV">
				 			<span style="color:blue;"><s:property value="%{#lcupload.policy_no}"/></span>									 		
				 		</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
						<div class="textV">
				 			<s:text name="lc.custName"/>
				 		</div>
				 		<div class="tboxV">
				 			<span style="color:blue;"><s:property value="%{#lcupload.First_name}"/></span>									 		
				 		</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<table class=able table-bordered width="100%">						
							<tbody>
							<s:iterator value="lcUploadPloDtls" var="lcdtls">
							<tr>
								<s:if test='%{!"".equals(#lcdtls.invoice_number) && #lcdtls.invoice_number!=null}'>
									<td><s:text name="lc.invoiceno"/> : <SPAN style="color:blue;"><s:property value="%{#lcdtls.invoice_number}"/></SPAN></td>
								</s:if>
								<s:if test='%{!"".equals(#lcdtls.invoice_date) && #lcdtls.invoice_date!=null}'>
									<td><s:text name="lc.invoicedate"/> : <SPAN style="color:blue;"><s:property value="%{#lcdtls.invoice_date}"/></SPAN></td>
								</s:if>
								<s:if test='%{!"".equals(#lcdtls.DESCRIPTION) && #lcdtls.DESCRIPTION!=null}'>
									<td><s:text name="lc.description"/> : <SPAN style="color:blue;"><s:property value="%{#lcdtls.DESCRIPTION}"/></SPAN></td>
								</s:if>
							</tr>
							</s:iterator>
							</tbody>
						</table>
					</div>
				</div>
			</s:iterator>
			</div>
		</div>
		
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="report.lcbankdetails" />
			</div>
			<div class="panel-body">
				<s:iterator value="lcUploadPolicy" var="lcuploadpolicy">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="textV">
				 			<s:text name="lc.bankname"/>
				 		</div>
				 		<div class="tboxV">
				 			<span style="color:blue;"><s:property value="%{#lcuploadpolicy.BANK_NAME}"/></span>									 		
				 		</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="textV">
				 			<s:text name="lc.lcno"/>
				 		</div>
				 		<div class="tboxV">
				 			<span style="color:blue;"><s:property value="%{#lcuploadpolicy.LC_NUMBER}"/></span>									 		
				 		</div>
					</div>
					<s:if test='%{!"".equals(#lcuploadpolicy.LC_DATE) && #lcuploadpolicy.LC_DATE!=null}'>
						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							<div class="textV">
					 			<s:text name="lc.lcdate"/>
					 		</div>
					 		<div class="tboxV">
					 			<span style="color:blue;"><s:property value="%{#lcuploadpolicy.LC_DATE}"/></span>									 		
					 		</div>
						</div>
					</s:if>
					<s:if test='%{!"".equals(#lcuploadpolicy.BL_AWB_NO) && #lcuploadpolicy.BL_AWB_NO!=null}'>
						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							<div class="textV">
					 			<s:text name="lc.lcblawno"/>
					 		</div>
					 		<div class="tboxV">
					 			<span style="color:blue;"><s:property value="%{#lcuploadpolicy.BL_AWB_NO}"/></span>									 		
					 		</div>
						</div>
					</s:if>
					<s:if test='%{!"".equals(#lcuploadpolicy.BL_AWB_DATE) && #lcuploadpolicy.BL_AWB_DATE!=null}'>
						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							<div class="textV">
					 			<s:label key="lc.lcblawdate"/>
					 		</div>
					 		<div class="tboxV">
					 			<span style="color:blue;"><s:property value="%{#lcuploadpolicy.BL_AWB_DATE}"/></span>									 		
					 		</div>
						</div>
					</s:if>
					<s:if test='%{!"".equals(#lcuploadpolicy.SAILING_DATE) && #lcuploadpolicy.SAILING_DATE!=null}'>
						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							<div class="textV">
					 			<s:text name="lc.lcsailingdate"/>
					 		</div>
					 		<div class="tboxV">
					 			<span style="color:blue;"><s:property value="%{#lcuploadpolicy.SAILING_DATE}"/></span>									 		
					 		</div>
						</div>
					</s:if>										
				</div>
				</s:iterator>
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<table width="100%" class="able table-bordered" id="lcDoctable">
							<thead>
							<tr>
								<th width="33%"> <s:text name="Upload File" /> </th>
								<th width="33%"> <s:text name="Remarks" /> </th>
								<th width="33%"> <s:text name="Delete" /> </th>
							</tr>
							</thead>
							<tbody>
							<s:if test="lcFileList.size()>0">
								<s:iterator value="lcFileList" var="lcfile">
								<s:set var="lcDoc" value="1"/>
								<tr>
									<td><s:property value="%{#lcfile.ORIGINAL_FILE}"/><s:hidden name="hiddencheque" id="hiddencheque" value="%{#lcfile.ORIGINAL_FILE}"></s:hidden></td>
									<td><s:property value="%{#lcfile.remarks}"/></td>
									<td align="center">
										<a href="#" class="btn btn-sm btn-info" onclick="downloadDoc('downloadLcFileReport.action','<s:property value="%{#lcfile.ORIGINAL_FILE}"/>','<s:property value="%{#lcfile.file_Name}"/>')">
										<i class="glyphicon glyphicon-save"></i></a>
									<s:if test="menuBlocker != 'bulkreport'">	<a href="#" class="btn btn-sm btn-warning" onclick="deleteDoc('deleteLcFileReport.action','<s:property value="%{#lcfile.upload_id}"/>','<s:property value="%{#lcfile.file_Name}"/>')">
										<i class="glyphicon glyphicon-remove"></i></a>
									</s:if>
									</td>
								</tr>
								</s:iterator>
								<s:if test="menuBlocker != 'bulkreport'">
									<tr>
										<td> <s:file cssClass="inputBox" name="upload" ></s:file></td>
										<td> <s:textfield name="lcdocremarks" id="lcdocremarks" value='%{lcdocremarks.isEmpty()?"":lcdocremarks}' cssClass="inputBox"></s:textfield>  </td>
										<td>
											<s:hidden name="uploadId" id="uploadId"/>
											<s:hidden name="lcFileName" id="lcFileName"/>
											<s:hidden name="downloadFileName" id="downloadFileName"/>
										</td>
									</tr>
								 </s:if>
							 </s:if>
							 <s:else>
							 	<s:if test="menuBlocker != 'bulkreport'">
							 	<tr>
									<td> <s:file cssClass="inputBox" name="upload" ></s:file></td>
									<td> <s:textfield name="lcdocremarks" value='%{lcdocremarks.isEmpty()?"":lcdocremarks}' id="lcdocremarks" cssClass="inputBox"></s:textfield>  </td>
									<td>  </td>
								</tr>
								 </s:if>
							 </s:else>							 
							</tbody>
						</table>
						<br/>
						<s:if test="menuBlocker != 'bulkreport'">
							<div align="right">
								<input type="button" class="btn btn-sm btn-primary" onclick="addMorelc()" value="Add More">
							</div>
						</s:if>
					</div>
				</div>			
			</div>			
		</div>
	</div>
</div>
<br class="clear" />
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
		<input type="button" name="Submit"  value="Submit" class="btn btn-sm btn-success" onclick="lcFileUpload('<s:property value="%{policyNo}"/>');"/>&nbsp;
		<input type="button" name="Back"  value="Back" class="btn btn-sm btn-danger" onclick="lcFileUploadBack();"/>
	</div>
</div>
<s:hidden name="policyNo"/>
<s:hidden name="menuType"/>
<s:hidden name="userLoginId"/>
<s:hidden name="loginId"/>
<s:hidden name="menuBlocker"/>
<s:token/>
</s:form>
<script type="text/javascript">
function lcupload(){
	document.report.menuType.value="U";
	document.report.action = "<%=request.getContextPath()%>/initReport.action";
	document.report.submit();
}
function lcFileUpload(policyNo){
	document.report.policyNo.value = policyNo;
	document.report.action = "<%=request.getContextPath()%>/lcFileUploadReport.action";
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
function deleteDoc(val,uplaodId1,fileName1){
	var decision = confirm("Document will be deleted. Do You Want to continue? ","");{
	if (decision==true)
		document.getElementById("uploadId").value=uplaodId1;
		document.getElementById("lcFileName").value=fileName1;
		document.report.action = "<%=request.getContextPath()%>/"+val;
		document.report.submit();
	}
}
function downloadDoc(val,downloadFileName,fileName1){
	document.getElementById("downloadFileName").value=downloadFileName;
	document.getElementById("lcFileName").value=fileName1;
	document.report.action = "<%=request.getContextPath()%>/"+val;
	document.report.submit();
}
function lcFileUploadBack(){
	
	document.report.action = "<%=request.getContextPath()%>/initReport.action";
	document.report.submit();
}
</script>
</body>
</html>