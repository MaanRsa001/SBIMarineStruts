<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>
<html>
	<head>
	<SCRIPT language=Javascript>
      
       function isNumberKey(evt)
       {
          var charCode = (evt.which) ? evt.which : event.keyCode;
          if (charCode != 46 && charCode > 31 
            && (charCode < 48 || charCode > 57))
             return false;

          return true;
       }
               
    </SCRIPT>
    <script language="JavaScript">
		function stopRKey(evt) { 
		  var evt = (evt) ? evt : ((event) ? event : null); 
		  var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null); 
		  if ((evt.keyCode == 13) && (node.type=="text"))  {return false;} 
		} 
		document.onkeypress = stopRKey; 
		</script>
    <script>
	function callCover(val,id)
       { 		
       		postRequest('${pageContext.request.contextPath}/getListAjaxRating.action?transID='+val+'&reqFrom='+id, id);
       }
	</script>
	   
		<script type="text/javascript" src="pages/admin/ratingEngine/menu.js">
					</script>	
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
			       <div data-options="region:'west',split:true" title="Options" style="width:100%;">
			            <div class="easyui-accordion" data-options="fit:true,border:false">
			                 <%@ include file="/pages/admin/ratingEngine/ratingEngineMenu.jsp" %>
			            </div>
			        </div>
			    </div>
			 </div>
		</div>
		<div class="col-xs-12 col-sm-12 col-md-9 col-lg-9">
			<div class="panel panel-primary">
			   <div class="panel-heading"><s:text name="Clause ID Master"/></div>
				  <div class="panel-body">
			        <div data-options="region:'center',title:'',iconCls:''">
			        <!--<div data-options="region:'center',title:'<s:property value="borganization"/>(<s:property value="agencyCode"/>)',iconCls:'icon-ok'">
			            --><div class="easyui-tabs" data-options="fit:true,border:false,plain:true" id="mainTab">
			                <div title="Clause ID Master" style="padding:5px">
			                <s:form id="info" name="info" method="post" action="updateClauseIDRating.action" theme="simple"  enctype="multipart/form-data">
			                	<table width="100%">
			                          <tr>
									    <td height="5"></td>
									  </tr>
									  <tr>
									    <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#E5E5E5">
									      <tr>
									        <td bgcolor="#FFFFFF" style="padding:10px; background:#F8F8F8">
									        
									            <table width="100%" border="0" cellspacing="0" cellpadding="0">
									            	<tr>
										       	   		<td  style="color:red;"><s:actionerror/></td>
										       		</tr>
													<!-- <tr> <td>&nbsp;&nbsp;</td> </tr>
													<tr><td class="heading"><s:text name="rating.mode.clauseid"/></td></tr>
													<tr><td>&nbsp;</td></tr> -->
													<tr align="center">
															 <td bgcolor="#FFFFFF">
															 <table width="100%" border="0" cellspacing="0" cellpadding="0">
																	<tr>
																	  <td class="bg">
																	  <table width="100%" border="0" align="center" cellpadding="4" cellspacing="0">
																	  <s:if test="mode=='edit'">
			                                                            <tr>
			                                                                <td width="5%">&nbsp;</td>
			                                                                <td width="45%"><s:text name="rating.mode.transport"/><font color="red">*</font></td>
			                                                                <td width="45%">
			                                                                    <s:hidden name="transID" id="transID"></s:hidden>
			                                                                    <s:select name="transID" id="transID" list="transports" listKey="MODE_TRANSPORT_ID" listValue="TRANSPORT_DESCRIPTION" headerKey="-1" headerValue="---Select---" disabled="true" cssClass="inputBoxS form-control" cssStyle="width: 51%;" />
			                                                                </td>
			                                                                <td width="5%">&nbsp;</td>
			                                                            </tr>
			                                                           </s:if>
			                                                           <s:else>
																		<tr>
																			<td>&nbsp;</td>
																			<td><s:text name="rating.mode.transport"/><font color="red">*</font></td>
																			<td>
																			   <s:select name="transID" id="transID" cssClass="inputBoxS form-control" cssStyle="width: 51%;" headerKey="transID" headerValue="--Select--" list="transports" listKey="MODE_TRANSPORT_ID" listValue="TRANSPORT_DESCRIPTION" onchange="callCover(this.value,'covername')"/>
																				<s:hidden name="modeOfTransport"/>
																			</td>
																			<td>&nbsp;</td>
																			
																		</tr>
																		</s:else>
																		<s:if test="mode=='edit'">
			                                                            <tr>
			                                                               <td>&nbsp;</td>
																			<td><s:text name="rating.cover"/><font color="red">*</font></td>
																			<td id="covername">
																				<s:select name="covername" id="covername" cssClass="inputBoxS form-control" cssStyle="width: 51%;" headerKey="-1" headerValue="--Select--"  list="coverNames" listKey="COVER_ID" listValue="COVER_NAME" disabled="true"/>
																			</td>
																			<s:hidden name="covername" id="covername"></s:hidden>
																			<td>&nbsp;</td>
			                                                            </tr>
			                                                           </s:if>
			                                                           <s:else>
																		<tr>
																			<td>&nbsp;</td>
																			<td><s:text name="rating.cover"/><font color="red">*</font></td>
																			<td id="covername">
																				<s:select name="covername" id="covername" cssClass="inputBoxS form-control" cssStyle="width: 51%;" headerKey="-1" headerValue="--Select--"  list="coverNames" listKey="COVER_ID" listValue="COVER_NAME"/>
																			</td>
																			
																			<td>&nbsp;</td>
																			
																		</tr>
																		</s:else>
																		<tr>
																			<td>&nbsp;</td>
																			<td><s:text name="rating.clauseDesc"/><font color="red">*</font></td>
																			<td>
																				<s:textarea name="clauseDesc"  maxlength="800" id="clauseDesc" cssClass="inputBoxA form-control" cssStyle="width:51%;" rows="2"/>
																			</td>
																			<td>&nbsp;</td>
																			
																		</tr>
																		<tr>
																			<td>&nbsp;</td>
																			<td><s:text name="rating.rsacode"/><font color="red">*</font></td>
																			<td>
																				<s:textfield name="rsacode" id="rsacode" cssClass="inputBox form-control" cssStyle="width:51%;" maxlength="10" />
																			</td>
																			<td>&nbsp;</td>
																			
																		</tr>
																		<tr>
																			<td>&nbsp;</td>
																			<td><s:text name="rating.displayorder"/><font color="red">*</font></td>
																			<td><!--
																				<s:textfield name="displayorder" id="displayorder" cssClass="inputBox" cssStyle="width:50%;" maxlength="5" onkeypress="return isNumberKey(event)"/>
																				--><s:textfield name="displayorder" id="displayorder" cssClass="inputBox form-control" cssStyle="width:51%;" maxlength="5" />
																				<s:hidden name="displayorder1"/>
																			</td>
																			<td>&nbsp;</td>																
																		</tr>
																		<tr>
																			<td>&nbsp;</td>
																			<td><s:text name="rating.remarks"/></td>
																			<td>
																				<s:textarea name="remarks" id="remarks" cssClass="inputBox form-control" cssStyle="width:51%;"  />
																			</td>
																			<td>&nbsp;</td>
																			
																		</tr>
																		<tr>
																			<td>&nbsp;</td>
																			<td><s:text name="rating.status"/><font color="red">*</font></td>
																			<td>
																				<s:radio name="status" id="status" list="#{'Y':'Active','N':'DeActive'}"/>
																			</td>
																			<td>&nbsp;</td>
																			
																		</tr>
																		<tr>
																			<td>&nbsp;</td>
																			<td><s:text name="rating.clauses.policyWording"/><font color="red">*</font></td>
																			<td>
																				<div id="wordingDisplay" >
																					<strong>${wordingFileName}</strong>&nbsp;<a href="#" onclick="popUp('${pageContext.request.contextPath}/clausespdfReport.action?fileName=${wordingFileName}',1000,500)"><img src="images/go_down.png" width="25" height="25"/></a>&nbsp;<a href="#" onclick="wordingCheck('N');"><img src="images/delete.png" width="25" height="25"/></a>
																				</div>
																				<div id="wordingUpload" style="display: none;">
																					<s:file name="upload" id="upload" cssClass="inputBox" cssStyle="width:51%;height:32px;"/>
																				</div>
																				<s:hidden name="wordingYN" id="wordingYN"/>
																				<s:hidden name="wordingFileName" id="wordingFileName"/>
																			</td>
																			<td>&nbsp;</td>
																		</tr>
																		<tr>
																			<td>&nbsp;</td> 
																			<td></td>
																			<td colspan="4"><input type="button" class="btn btn-sm btn-danger" value="Back" onclick="fnCall('clause')"/>&nbsp;&nbsp;<s:submit value="Save" cssClass="btn btn-sm btn-success" onclick="return oncheck()"/></td>
																		</tr>																													
																	 </table></td>
																	 </tr>														
																	</table>
																  </td>
																</tr>
													</table>
													</tr>
												</table>
			    								
											
											</td>
											</tr>
											</table>
											<s:hidden name="clauseID"/>
											<s:hidden name="mode" id="mode"/>
											<s:token/>
			                    </s:form>
			                </div>
			            </div>
			        </div>
			   </div>
			</div>
		</div>
    </div>
</body>
<script type="text/javascript">
	function oncheck(){
	    if(document.getElementById("statusN").checked){
        	answer=confirm("Are You want to Deactive");
     	if(answer)
     		return true;
     	else
     		return false;
     	}
	    else return true;
	}
	wordingCheck('${wordingYN}');
	function wordingCheck(val) {
		if(val == "Y") {
			document.getElementById('wordingDisplay').style.display = "";
			document.getElementById('wordingUpload').style.display = "none";
		}
		else {
			document.getElementById('wordingDisplay').style.display = "none";
			document.getElementById('wordingUpload').style.display = "";
			document.getElementById('wordingYN').value = "N";
		}
	}
</script>
</html>

