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
			   <div class="panel-heading"><s:text name="rating.mode.city"/></div>
				  <div class="panel-body">
			        <div data-options="region:'center',title:'',iconCls:''">
			        <!--<div data-options="region:'center',title:'<s:property value="borganization"/>(<s:property value="agencyCode"/>)',iconCls:'icon-ok'">
			            --><div class="easyui-tabs" data-options="fit:true,border:false,plain:true" id="mainTab">
			                <div title="City" style="padding:5px">
			                <s:form id="info" name="info" method="post" action="updateCityRating.action" theme="simple"  enctype="multipart/form-data">
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
															       	   		<td  style="color:red;"><s:actionerror/></td>
															       		</tr>
																		<tr align="center">
																				 <td bgcolor="#FFFFFF">
																				 <table width="100%" border="0" cellspacing="0" cellpadding="0">
																						
																						<tr>
																						  <td class="bg">
																						  <table width="100%" border="0" align="center" cellpadding="4" cellspacing="0">
																						  <tr>
																								<td>&nbsp;</td>
																								<td><s:text name="country.name"/><font color="red">*</font></td>
																								<td>
																									<s:select name="countryID" cssClass="inputBoxS" cssStyle="width:51%;" id="countryID" list="countryList" listKey="COUNTRY_ID" listValue="COUNTRY_NAME" headerKey="-1" headerValue="-Select-"/>
																								</td>
																								<td>&nbsp;</td>
																								
																							</tr>
																							
																							<tr>
																								<td>&nbsp;</td>
																								<td><s:text name="citi.name"/><font color="red">*</font></td>
																								<td>
																									<s:textfield name="cityName" cssClass="inputBox" cssStyle="width:50%;" maxlength="50" onkeyup="allLetter(this);"/>
																									<s:hidden name="cityID"/>
																								</td>
																								<td>&nbsp;</td>
																								
																							</tr>
																							
																							<tr>
																								<td>&nbsp;</td>
																								<td><s:text name="rating.remark"/></td>
																								<td>
																									<s:textfield name="remarks" cssClass="inputBox" cssStyle="width:50%;" maxlength="80" />
																								</td>
																								<td>&nbsp;</td>
																								
																							</tr>
																							<tr>
																								<td>&nbsp;</td>
																								<td><s:text name="rating.core.code"/><font color="red">*</font></td>
																								<td>
																									<s:textfield name="code" cssClass="inputBox" cssStyle="width:50%;" maxlength="10" />
																								</td>
																								<td>&nbsp;</td>
																								
																							</tr>
																							
																							<tr>
																								<td>&nbsp;</td>
																								<td><s:text name="rating.status"/><font color="red">*</font></td>
																								<td>
																									<s:radio name="status" id="status" list="#{'Y':'Active','N':'DeActive'}" value='%{status==null?"N":status}' />
																								</td>
																								<td>&nbsp;</td>
																							</tr>
																							<tr>
																								<td colspan="4" align="center">
																									<input type="button" class="btn btn-sm btn-danger" value="Back" onclick="fnCall('citymaster')"/>&nbsp;&nbsp;<s:submit value="Save" cssClass="btn btn-sm btn-success" onclick="return oncheck()"/>
																								</td>
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
													</tr>
												</table>
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
</script>
</html>

