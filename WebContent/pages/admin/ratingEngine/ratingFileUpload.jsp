	<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<html>
	<head>
		<sj:head jqueryui="true" jquerytheme="start" />
		<script language=Javascript>
	       function isNumberKey(evt)  {
	          var charCode = (evt.which) ? evt.which : event.keyCode;
	          if (charCode != 46 && charCode > 31 
	            && (charCode < 48 || charCode > 57))
	             return false;
	          return true;
	       }
			function stopRKey(evt) { 
			  var evt = (evt) ? evt : ((event) ? event : null); 
			  var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null); 
			  if ((evt.keyCode == 13) && (node.type=="text"))  {return false;} 
			} 
			document.onkeypress = stopRKey; 
			
			function resetSearch() {
				window.location.href = "${pageContext.request.contextPath}/listPolicy.do";
				return false;
			}
		
			function goSearch(form){
				form.action = "${pageContext.request.contextPath}/listPolicy.do";
				form.submit();
				return false;
			}
			
			function uploadDoc(form){
				form.action = "${pageContext.request.contextPath}/uploadRating.do";
				form.submit();
				return false;
			}
			
			function loaderImage() {
				document.getElementById('loaderImage').style.display="block";
			}
			
			function downloadFile(val) {
				document.getElementById("downloadType").value=val;
				document.forms[0].action="${pageContext.request.contextPath}/downloadTransUpload.do";
				document.forms[0].submit();
			}
			
			function transDetails() {
				document.getElementById("reqFrom").value='';
				document.info.action="${pageContext.request.contextPath}/transDetailsRating.do";
				document.info.submit();
			}
		</script>
		<script type="text/javascript" src="pages/admin/ratingEngine/menu.js"></script>
		
<style>
	td, th {
		padding:4px;
	}
</style>		
</head>
<body>
    <div style="margin:10px 0;"></div>
    <div class="easyui-layout" style="width:100%;height:1000px;">
    	<div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
		   <div class="panel panel-primary">
			   <div class="panel-body">
			       <div data-options="region:'west',split:true" title="Options" style="width:100%">
			            <div class="easyui-accordion" data-options="fit:true,border:false">
			               <%@ include file="/pages/admin/ratingEngine/ratingEngineMenu.jsp" %>
			            </div>
			        </div>
		      </div>
		   </div>
		</div>
		<div class="col-xs-12 col-sm-12 col-md-9 col-lg-9">
			<div class="panel panel-primary">
			   <div class="panel-heading"><s:text name="Exchange Master Upload"/></div>
				  <div class="panel-body" style="padding: 0px;">
			        <div data-options="region:'center',title:'',iconCls:''">
			            <div class="easyui-tabs" data-options="fit:true,border:false,plain:true" id="mainTab">
			                <div title="${title}">
			                <s:if test='"polDoc".equals(display)'>
								<s:form  name="info"  action="uploadRating" method="post" enctype="multipart/form-data" theme="simple" id="info" >
									<table width="100%">
			                          <tr>
									    <td height="5"></td>
									  </tr>
									  <tr>
									    <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#E5E5E5">
									      <tr >
									        <td bgcolor="#FFFFFF">
									        	<table width="100%" border="0" cellspacing="0" cellpadding="0">
									            	<tr>
										       	   		<td  style="color:red;"><s:actionerror/></td>
										       		</tr>
													<!--<tr> <td>&nbsp;&nbsp;</td> </tr>
													<tr><td class="heading">${title}</td></tr>-->
													<tr><td align="right"><br/><a href="#" onclick="transDetails()" class="form">TransactionDetails</a><br/></td></tr>
													</tr>
													<tr align="center">
														<td bgcolor="#FFFFFF">
															<table width="100%" border="0" cellspacing="0" cellpadding="0">
																<tr>
																	<td class="bg">
																	  <table width="100%" border="0" align="center" cellpadding="4" cellspacing="0">
																		<s:if test='"exchangeupload".equals(menuType)'>
																			<div class="boxcontent" style="margin-top: 10px;" align="center">				    						    		
																				<div id="loaderImage" style="display:none">
																					<b><s:label key="upload.progress" cssStyle="color:#073e8f" /></b>
																					<br>
																						<img src="${pageContext.request.contextPath}/images/ajax-loader.gif" width="50px" height="50px"/>
																					<br>
																				</div>
																				<br class="clear"/>
																			</div>
																			<tr>
																				<td>&nbsp;</td>
																				<td> <s:text name="Effective Date"/><font color="red">*</font> </td>
																				<td> <div class="inputAppend form-control" style="width:51%;height:30px;"><sj:datepicker id="eff_date" name="eff_date" cssClass="inputBox1" cssStyle="border: none;background: transparent;width:80%;" displayFormat="mm/dd/yy" readonly="true" showAnim="slideDown" duration="fast" disabled="#disable" /></div> </td>
																				<td>&nbsp;</td>
																			</tr>
																		</s:if>
																		<tr>
																			<td>&nbsp;</td>
																			<td> <s:text name="Upload File"/><font color="red">*</font> </td>
																			<td> <s:file name="upload" cssStyle="width:51%;height:32px;"  cssClass="inputBox rEdge form-control" /></td>
																			<td>&nbsp;</td>
																		</tr>
																		<tr> 
																			<td>&nbsp;</td> 
																			<td></td>
																			<td colspan="4"><s:submit value="Upload" cssClass="btn btn-warning"/> </td>
																		</tr>
																		<tr> <td colspan="4" align="center">
																		<br/><br/>
																			<a href="downloadRating.do?reqFrom=${menuType}" class="form">Download Sample File</a></td>
																		</tr>
																	 </table></td>
																	 </tr>
																	</table>
																  </td>
																</tr>
															</table>
														</tr>
													</table>
											   		<s:hidden name="menuType"/>
											   		<s:hidden name="reqFrom" value="%{menuType}" id="reqFrom"/>
												</td>
											</tr>
										</table>
										<s:token/>
							    </s:form>
							</s:if>
							<s:elseif test="display=='result'">
								<s:form name="info" action="redirectDoUpload" method="post" theme="simple">
									<table width="500" border="0" cellspacing="2" cellpadding="4" align="center" class="data-table-border">
										<tr bgcolor="#FDF0D9">
											<td class='head' height="37" colspan="2" class="style1">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											</td>
										</tr>
										<tr class="runtext">
											<td height="14" align="right" colspan="2"></td>
										</tr>
										<tr class="runtext">
											<td height="14" align="center" colspan="2"><font color="blue" style="font-weight:bold">&nbsp;<s:label key="upload.tranId"/>&nbsp;<s:property value="tranId"/></font></td>
											<s:hidden name="tranId"/>
										</tr>
										<s:iterator value="%{#request.UPLOAD_RESULT}" var="result">
											<tr class="runtext">
											<td height="14" align="left" width="50%"><s:label key="upload.totalRecords"/></td>
											<td height="14" align="center" width="50%"><b><s:property value="TOTAL_RECORDS"/></b></td>
										</tr>
										<tr class="runtext">
											<td height="14" align="left" width="50%"><s:label key="upload.uploaded"/></td>
											<td height="14" align="center" width="50%"><b><s:property value="VALID_RECORDS"/></b></td>
										</tr>
										<tr class="runtext">
											<td height="14" align="left" width="50%"><s:label key="upload.notUploaded"/></td>
											<s:if test="ERROR_RECORDS!=0">
												<td height="14" align="center" width="50%"><b><a style="color: red;font-weight: bold; text-decoration:underline;cursor:pointer;" onclick="downloadFile('E')" title="Download"><s:property value="ERROR_RECORDS"/></a></b></td>
											</s:if>
											<s:else>
												<td height="14" align="center" width="50%"><b><s:property value="ERROR_RECORDS"/></b></td>
											</s:else>
										</tr>
											<tr class="runtext">
												<td height="14" align="center" colspan="2">
													<input type="button" value=" Back " class="iButton rh" onclick="uploadDoc(this.form)" name="back"/>
							    					<s:hidden name="typeId"/>
							    					<s:hidden name="downloadType" id="downloadType"/>
							    					<s:hidden name="menuType"/>
							    					<s:hidden name="reqFrom" id='reqFrom'/>
												</td>
											</tr>
										</s:iterator>
									</table>
									<s:token/>
								</s:form>
							</s:elseif>
			                </div>
			            </div>
			        </div>
			   </div>
			</div>
		</div>
    </div>
</body>
</html>

