<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>Documents Upload</title>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="keywords" content="Maan Sarovar, Sea Trans, Marine Insurance"> 	
		<meta name="author" content="">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/font-awesome.css" />
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/demo.css" />
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap-multiselect.css" />
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/easy-responsive-tabs.css" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/datepicker3.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/slimmenu.css">
		<link href="<%=request.getContextPath()%>/bootstrap/css/footable-0.1.css" rel="stylesheet" type="text/css">
		<link href="<%=request.getContextPath()%>/bootstrap/css/table-res.css" rel="stylesheet" type="text/css">
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css" />
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/style.css" />
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
		<script src="<%=request.getContextPath()%>/bootstrap/js/modernizr.custom.63321.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/jquery-2.2.3.min.js"></script>
	</head>
	<body>
	<s:set var="uploadDocListVar" value="%{uploadDocList}"/>
	<s:set var="documentListVar" value="%{documentList}"/>
	<s:set var="documentListOthersVar" value="%{documentListOthers}"/>
		<div id="page" class="content">
			<s:form id="form1" name="form1" method="post" theme="simple" enctype="multipart/form-data">
				<br class="clear"/>
				<br class="clear"/>
				<s:if test='"display".equals(mode)'>
				<div class="row">
					<div class="col-xs-12">				
						<div class="panel panel-primary">
		        			<div class="panel-heading">
		        				<s:text name="motor.document"/>
		        			</div>
		        			<div class="panel-body">
		        				<div class="row">
									<div class="col-xs-12">
										<b id="errorDesc" style="color:red"></b>
										<s:actionerror cssStyle="color:red;"/>
										<s:if test="hasActionMessages()">
										<font size="3px"><i class="fa fa-check-circle-o" style="color:green">&nbsp;<s:text name="motor.upload.success"/></i></font>
										</s:if>
									</div>
								</div>
								<br class="clear">
								<div class="row">
									<div class="col-xs-12">
								<table id="QuoteDocTable" cellpadding="1" class="footable" cellspacing="1" border="1">
									<thead>
										<tr>
											<th width="5%"><s:text name="label.report.sno"/></th>
											<th width="20%"><s:text name="label.document.type"/></th>
											<th width="30%"><s:text name="label.document.file"/></th>
											<th width="20%"><s:text name="label.document.description"/></th>											
											<th ></th>
										</tr>
									</thead>
									<tbody>
										<s:if test="#uploadDocListVar != null && #uploadDocListVar.size > 0">
										<s:iterator value="#uploadDocListVar" var="list" status="stat">
										<tr>
										<td align="center"><strong><s:property value="#stat.count"/></strong>
										</td>
										<td>
												<s:property value="#list.DOCUMENT_DESC"/>
										</td>
										<td>
												<s:property value="#list.FILE_NAME"/>
										</td> 
										<td>
												<s:property value="#list.DESCRIPTION"/>
										</td>
										<s:if test='"portfolio".equalsIgnoreCase(mode)'>
											<td align="center">
													<button type="button" class="btn btn-sm btn-info" onclick="downloadDoc('<s:property value="#list.FILE_PATH_NAME"/>','<s:property value="#list.FILE_NAME"/>')">
														<i class="glyphicon glyphicon-save"></i>
													</button>
											</td>
											<td align="center">
											</td>
										</s:if>
										<s:else>
											<td align="center">
													<button type="button" class="btn btn-sm btn-info" onclick="downloadDoc('<s:property value="#list.FILE_PATH_NAME"/>','<s:property value="#list.FILE_NAME"/>')">
														<i class="glyphicon glyphicon-save"></i>
													</button>
											</td>
										</s:else>
											<!--<td align="center">
												<s:if test='#documentDtls.get(""+#record.DOCUMENT_ID)!=null && !"".equals(#documentDtls.get(""+#record.DOCUMENT_ID))'>
													<button type="button" class="btn btn-sm btn-info" onclick="downloadDoc('<s:property value='#documentDtls.get(""+#record.DOCUMENT_ID)'/>')">
														<i class="glyphicon glyphicon-save"></i>
													</button>
												</s:if>
											</td>-->
										</tr>
										</s:iterator>
										</s:if>
										</tbody>
								</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
				</s:if>
				<s:else>
				<s:if test='"65".equalsIgnoreCase(#session.product_id)'>
					<s:set var="multiVehicleDtls" value="%{vehicleDetailsById}"/>
					<div class="row">
						<div class="col-xs-12">				
							<div class="panel panel-primary">
			        			<div class="panel-heading">
			        				<s:text name="motor.vehicleDetails" />
			        			</div>
			        			<div class="panel-body">
									<table cellpadding="1" class="footable" cellspacing="1" border="1">
										<thead>
									        <tr>
												<th style="width:5%;"><s:text name="label.report.sno"/></th>
												<th style="width:15%;"><s:text name="label.document.vehicleusage"/></th>
												<th style="width:20%;"><s:text name="label.document.make"/></th>
												<th style="width:20%;"><s:text name="label.document.model"/></th>
												<th style="width:15%;"><s:text name="label.document.suminsured"/></th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>1</td>
												<td><s:property value='#multiVehicleDtls.get("VEHICLETYPE_DESC")' /></td>
												<td><s:property value='#multiVehicleDtls.get("MAKE_NAME")' /></td>					
												<td><s:property value='#multiVehicleDtls.get("MODEL_NAME")'/> </td>
												<td><s:property value='#multiVehicleDtls.get("SUMINSURED_VALUE_LOCAL")' /></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<br class="clear"/>
				</s:if>
				<div class="row">
					<div class="col-xs-12">				
						<div class="panel panel-primary">
		        			<div class="panel-heading">
		        				<s:text name="motor.document"/>
		        			</div>
		        			<div class="panel-body">
		        				<%--
		        				<s:set var="documentDtls" value="%{documentDetails}"/>
		        				--%>
		        				<div class="row">
									<div class="col-xs-12">
										<b id="errorDesc" style="color:red"></b>
										<s:actionerror cssStyle="color:red;"/>
										<s:if test="hasActionMessages()">
										<font size="3px"><i class="fa fa-check-circle-o" style="color:green">&nbsp;<s:text name="motor.upload.success"/></i></font>
										</s:if>
									</div>
								</div>
								<br class="clear">
								<div class="row">
									<div class="col-xs-12">
								<table id="QuoteDocTable" cellpadding="1" class="footable" cellspacing="1" border="1">
									<thead>
										<tr>
											<th width="5%"><s:text name="label.report.sno"/></th>
											<th width="20%"><s:text name="label.document.type"/></th>
											<th width="50%"><s:text name="label.document.file"/></th>
											<th width="20%"><s:text name="label.document.description"/></th>											
											<th ></th>
											<th ></th>
										</tr>
									</thead>
									<tbody>
									<s:set var="count" value="0" />
										<s:if test="#uploadDocListVar != null && #uploadDocListVar.size>0">
											<s:iterator value="#uploadDocListVar" var="list" status="stat">
											<tr>
											<td align="center"><strong><s:property value="#stat.count"/></strong>
											</td>
											<s:if test='isArabic=="ar"'>
												<td>
													<s:property value="#list.DOCUMENT_DESC_AR"/>
												</td>
											</s:if>
											<s:else>
												<td>
													<s:property value="#list.DOCUMENT_DESC"/>
												</td>
											</s:else>
											<td>
													<s:property value="#list.FILE_NAME"/>
											</td> 
											<td>
													<s:property value="#list.DESCRIPTION"/>
											</td>
											<s:if test='"portfolio".equalsIgnoreCase(mode)'>
												<td align="center">
														<button type="button" class="btn btn-sm btn-info" onclick="downloadDoc('<s:property value="#list.FILE_PATH_NAME"/>','<s:property value="#list.FILE_NAME"/>')">
															<i class="glyphicon glyphicon-save"></i>
														</button>
												</td>
												<td align="center">
												</td>
											</s:if>
										<s:else>
											<td align="center">
													<button type="button" class="btn btn-sm btn-info" onclick="downloadDoc('<s:property value="#list.FILE_PATH_NAME"/>','<s:property value="#list.FILE_NAME"/>')">
														<i class="glyphicon glyphicon-save"></i>
													</button>
											</td>
											<td align="center">
													<%-- <button type="button" class="btn btn-sm btn-danger" onclick="return deleteDoc('<s:property value="#list.FILE_PATH_NAME"/>')">
														<i class="glyphicon glyphicon-remove-sign"></i>
													</button>
													--%>
											</td>
										</s:else>
											<!--<td align="center">
												<s:if test='#documentDtls.get(""+#record.DOCUMENT_ID)!=null && !"".equals(#documentDtls.get(""+#record.DOCUMENT_ID))'>
													<button type="button" class="btn btn-sm btn-info" onclick="downloadDoc('<s:property value='#documentDtls.get(""+#record.DOCUMENT_ID)'/>')">
														<i class="glyphicon glyphicon-save"></i>
													</button>
												</s:if>
											</td>-->
										</tr>
										<s:set var="count" value="%{@java.lang.Integer@parseInt(#count)+1}" />
										</s:iterator>
										</s:if>
										<s:if test='!"proForm".equalsIgnoreCase(mode1) && #documentListVar != null && #documentListVar.size>0 '>
										<s:iterator value="#documentListVar" var="list" status="stat">
											<tr>
												<td align="center"><strong><s:property value="#stat.count+#count"/></strong></td>
												<s:hidden name="serialNos[%{#stat.count-1}]" id="serialNos%{#stat.count-1}" value="%{#stat.count}"/>
												<s:hidden name="mandYN[%{#stat.count-1}]" id="mandYN%{#stat.count-1}" value="%{#list.MANDATORY_STATUS}"/>
												<s:hidden name="documentIdList[%{#stat.count-1}]" id="documentIdList[%{#stat.count-1}]" value="%{#list.DOCUMENT_ID}"/>
												<s:if test='isArabic=="ar"'>
													<td>
														<s:property value="#list.DOCUMENT_DESC_AR"/>
													<%--<s:select name="documentIdList[%{0}]" id="documentIdList[%{0}]" cssClass="inputSelect" list="#documentListVar" listKey="DOCUMENT_ID" listValue="DOCUMENT_DESC_AR" headerKey="" headerValue="-Select-" />
													--%><s:hidden name="documentNameList[%{#stat.count-1}]" id="documentNameList[%{#stat.count-1}]" value="%{#list.DOCUMENT_DESC_AR}"/>
													</td>
												</s:if>
												<s:else>
													<td>
														<s:property value="#list.DOCUMENT_DESC"/>
														<%--<s:select name="documentIdList[%{0}]" id="documentIdList[%{0}]" cssClass="inputSelect" list="#documentListVar" listKey="DOCUMENT_ID" listValue="DOCUMENT_DESC" headerKey="" headerValue="-Select-" />
													--%>
													<s:hidden name="documentNameList[%{#stat.count-1}]" id="documentNameList[%{#stat.count-1}]" value="%{#list.DOCUMENT_DESC}"/>
													</td>
												</s:else>
												<td>
													<s:file name="upload" id="upload[%{#stat.count-1}]" cssClass="inputBox"/>
												</td> 
												<td>
													<s:textfield name="docDescription[%{#stat.count-1}]" id="docDescription[%{#stat.count-1}]" cssClass="inputBox" cssStyle="text:" maxlength="50"/>
												</td>
												<td colspan="2" >
													<s:hidden id="chk1" onclick="deleteRow(chk1, this)"/>
												</td>
												</tr>
											</s:iterator>
										</s:if>
									</tbody>
								</table>
								<s:property value="type"/>
								<s:if test='!"proForm".equalsIgnoreCase(mode1) && #documentListOthersVar != null && #documentListOthersVar.size>0 '>
									<div class="boxcontent" align="right">
									
								    	<!--<input type="button" name="addadd" value="<s:text name="label.motor.add"/>" class="btn btn-sm btn-primary" onclick="addQuoDocRow()" />-->
								    </div>
								 </s:if>
								</div>
							</div>
							</div>
						</div>
					</div>
				</div>
				</s:else>
				<s:if test='"display".equals(mode)'>
				<div class="row" align="center">
				<button type="button"  class="btn btn-sm btn-danger" onclick="wclose();">
						<s:text name="label.motor.close"/>
				</button>
				</div>
				</s:if>
				<s:else>
				<br class="clear"/>
				<div class="row" align="center">
				<button type="button"  class="btn btn-sm btn-danger" onclick="wclose();">
						<s:text name="label.motor.close"/>
				</button>
				
					<!--<s:submit type="button" cssClass="btn btn-sm btn-danger" value="Close" onclick="wclose();"/>
					<s:submit type="button" cssClass="btn btn-sm btn-success" value="Upload" onclick="return docupload();"/>-->
				</div>
				</s:else>
				<br class="clear"/>
				<s:hidden name="uploadType" />
				<s:hidden name="applicationNo"/>
				<s:hidden name="quoteNo"/>
				<s:hidden name="vehicleId"/>
				<s:hidden name="deleteVehicleId"/>
				<s:hidden name="filePath" id="filePath"/>
				<s:hidden name="fileName" id="fileName"/>
				<s:hidden name="mode" />
				<s:hidden name="mode1" />
				<s:hidden name="product_id" id="product_id" value="#session.product_id"/>
				<s:hidden name="isArabic"/>
				</s:form>
		</div>
		<script type="text/javascript">
		function docupload() {
	 		try{
				document.getElementById('errorDesc').innerHTML = "";
				var error = "";
				var table = document.getElementById('QuoteDocTable');
				var rowCount = table.rows.length;
				var size='<s:property value="#uploadDocListVar.size()"/>';
				var i=0;
				
				var j=parseInt(size);
				//alert("slNo->"+slNo);
				//alert("i->"+i);
				//alert("j->"+j);
				while( i<(slNo)) {
				//	alert("i->"+i);
				//	alert("j->"+j);
				try{
					var value =document.getElementById("serialNos"+i+"").value;
					var value1 =document.getElementById("mandYN"+i+"").value;
					if(value != null && value != ''){
						if(document.getElementById('upload['+ i +']').value == "") {
							
						}else{
							
						}
						
					if(value1 == 'Y'){
						var file=document.getElementById('upload['+ i +']').files ;
						if(document.getElementById('upload['+ i +']').value == "") {
						var documentName =document.getElementById('documentNameList['+i+']').value;
						<s:if test='isArabic=="ar"'>
						error+="يرجى رفع "+documentName + "<br/>"
						</s:if>
						<s:else>
						error+="Please Upload "+documentName + "<br/>"
						</s:else>
							//error+="please choose file at row "+ (j+1) + "<br/>"
						} else{
							error += validateFile((i+1), document.getElementById('upload['+i+']').value);
						}
						/*if(document.getElementById('documentIdList['+ i +']').value == "") {
								error+="please select document Type at row "+ (j+1) + "<br/>"
						}*/
					}
					j++;
					//alert("j++->"+j);
					}
					i++;
					}catch(e) {
					//j++;
					i++;
						console.debug(e);
					}
				}
				
			if(error.length > 0) {
				document.getElementById('errorDesc').innerHTML = error;
				   $("html, body").animate({ scrollTop: 0 }, 600);
				 
			} else{
				var i=0;
				var k=0;
				var j=slNo+1;
				//alert("j->"+j);
				while(i<j) {
					//alert("i->"+i);
					try{
						var value =document.getElementById("serialNos"+i+"").value;
						//alert(value);
						if(value != null && value != ''){
								if(document.getElementById('upload['+ i +']').value == "") {
									//alert("value->"+document.getElementById('documentIdList['+ i +']').value);
									document.getElementById('documentIdList['+ i +']').value='';
									//alert("null value->"+document.getElementById('documentIdList['+ i +']').value);
								}else{
									k++;
								}
						}
						}catch(e) {
							console.debug(e);
						}
						i++;
				}
				/*var mode=document.getElementById('mode').value;
				if(mode=='pendingPolicy'){
					var decision = confirm("Do You Informed to Insurance Company? ","");
					if (decision==true){
						document.form1.action = "<%=request.getContextPath()%>/submitdocumentDoUpload";
						document.form1.submit();
						}else{
							document.form1.action = "<%=request.getContextPath()%>/documentUploadMotor";
							document.form1.submit();
						}
				}else{*/
					if(k>0){
					document.form1.action = "<%=request.getContextPath()%>/submitdocumentDoUpload";
					document.form1.submit();
					}else{
						 <s:if test='isArabic=="ar"'>
							error+="يرجى اختيار سبب واحد على الأقل"
						 </s:if>
						 <s:else>
						 	error+="please choose Minium one file "
						 </s:else>
						document.getElementById('errorDesc').innerHTML = error;
					   $("html, body").animate({ scrollTop: 0 }, 600);
					}
					
				}
		 	}catch(e) {
			console.debug(e);
		}
		  return false;
	}
		
		 
		function validateFile(rownum, sFileName) {
			var error = "";
			var _validFileExtensions = [".jpg", ".jpeg", ".bmp", ".gif",".docx", ".png",".pdf",".doc",".xls",".xlsx",".txt"];
			//var sFileName = oInput.value;
            if (sFileName.length > 0) {
            	var blnValid = false;
                for (var j = 0; j < _validFileExtensions.length; j++) {
                    var sCurExtension = _validFileExtensions[j];
                    if (sFileName.substr(sFileName.length - sCurExtension.length, sCurExtension.length).toLowerCase() == sCurExtension.toLowerCase()) {
                        blnValid = true;
                        break;
                    }
                }
                if (!blnValid) {
                	error = "Please select valid file ( " + _validFileExtensions.join(", ") + " ) at " + rownum + "<br/>";
                }
            } else {
            	error = "Please select file ( " + _validFileExtensions.join(", ") + " ) at " + rownum + "<br/>";
			}
			return error;
		}
		function wclose() {
			window.close();
		}
		function downloadDoc(filePath,sFileName) {
			document.getElementById('fileName').value = sFileName;
			document.getElementById('filePath').value = filePath;
			document.form1.action = "<%=request.getContextPath()%>/downloaddocumentDoUpload";
			document.form1.submit();
		}
	function deleteDoc(filePath) {
		var decision = confirm("File will be deleted. Do You Want to continue? ","");
			if (decision==true){
				document.getElementById('filePath').value = filePath;
				document.form1.action = "<%=request.getContextPath()%>/deletedocumentDoUpload";
				document.form1.submit();
				}else{
					document.form1.action = "<%=request.getContextPath()%>/documentUploadMotor";
					document.form1.submit();
				}
			return false;
		}

		
	function createDocList(cell, rowCount){
		element = document.createElement("select");
    	element.className = "inputSelect";
    	element.name = "documentIdList["+(rowCount)+"]";
    	element.id = "documentIdList["+(rowCount)+"]";
    	//var objOption = document.createElement("option");
    	 //objOption.text = '-Select-';
    	 //objOption.value = '';
     	//if(document.all && !window.opera){
     	//	element.add(objOption);
    		//}else{
     		//	element.add(objOption, null);
     		//}
    		 <s:iterator value="#documentListOthersVar">
        	 var objOption = document.createElement("option");
        	 <s:if test='isArabic=="ar"'>
         		objOption.text = '<s:property value="DOCUMENT_DESC_AR"/>';
         	 </s:if>
         	 <s:else>
         		objOption.text = '<s:property value="DOCUMENT_DESC"/>';
         	 </s:else>
         	objOption.value = '<s:property value="DOCUMENT_ID"/>';
         	
         	if(document.all && !window.opera){
         		element.add(objOption);
         	}else{
         		element.add(objOption, null);
         }
     </s:iterator>
     
     
   cell.appendChild(element);
}

	var slNo=<s:property value="#documentListVar.size()"/>;
	
	/*<s:if test="#uploadDocListVar.size() <= 1">
		var slNo=<s:property value="#documentListVar.size()"/>;
	</s:if>
	<s:else>
		var table = document.getElementById('QuoteDocTable');
       	var rowCount = table.rows.length;
        var slNo = parseInt(rowCount);
		//var slNo=parseInt(document.getElementById("serialNos"+sNo1+"").value)+1;
		//var slNo= table.rows.length;
	</s:else>*/
	 
	function addQuoDocRow(){
		var table = document.getElementById('QuoteDocTable');
		var rowCount = table.rows.length;
		var row = table.insertRow(rowCount);
		row.className="runtext";
		row.id = "new_"+rowCount;
		
		cell = row.insertCell(0);     
    	cell.align = "center"; 
     	cell.innerHTML = "<strong>"+rowCount+"</strong>";
     	var element = document.createElement("input");
		element.className = "inputSelect";	 
	 	element.type = "hidden";	
		element.value=slNo;
		cell.appendChild(element);
		element = document.createElement("input");
        element.type = "hidden";
        element.name = "serialNos["+(slNo)+"]";
        element.id = "serialNos"+(slNo)+"";
        element.value = slNo+1;
        cell.appendChild(element);
		
		
		cell = row.insertCell(1);
   		createDocList(cell, slNo);	 	
		
	
		
		cell = row.insertCell(2);
		var element = document.createElement("input");
		element.className = "inputBox";
		element.name = "upload";
		element.id = "upload["+(slNo)+"]";
		element.type = "file";

		cell.appendChild(element);
		
		cell = row.insertCell(3);
		var element = document.createElement("input");
		element.className = "inputBox";
		element.type = "text";
		element.name = "docDescription["+(slNo)+"]";
		element.maxlength = "50";
		element.id = "docDescription["+(slNo)+"]";
		cell.appendChild(element);
		
		cell = row.insertCell(4);
		cell.align = "center";
		cell.setAttribute('colSpan', '2');
		var element = document.createElement("input");
		element.type = "button";
		<s:if test='%{"ar".equals(#session.isArabic)}'>
		element.value = "إزالة";
		</s:if>
		<s:else>
		element.value = "Remove";
		</s:else>
		element.className = "btn btn-sm btn-danger";
		element.id = "chk"+slNo;
		element.onclick = function () {deleteRow(this.id,this)};	
	    cell.appendChild(element);
	    slNo++;
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
				var renum = 1;
				$("tr td strong").each(function() {
				    $(this).text(renum);
				    renum++;
				});
				
			} else {
				document.getElementById(id).checked=false;
			}	   
		}
	}
	</script>
	</body>
</html>