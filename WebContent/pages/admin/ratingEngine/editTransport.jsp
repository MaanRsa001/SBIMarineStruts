<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>
<html>
	<head>
	
		<script type="text/javascript" src="pages/admin/ratingEngine/menu.js">
					</script>
					<script language="JavaScript">
		function stopRKey(evt) { 
		  var evt = (evt) ? evt : ((event) ? event : null); 
		  var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null); 
		  if ((evt.keyCode == 13) && (node.type=="text"))  {return false;} 
		} 
		document.onkeypress = stopRKey; 
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
			   <div class="panel-heading"><s:text name="Mode of Transport"/></div>
				  <div class="panel-body">
			        <div data-options="region:'center',title:'',iconCls:''">
			            <div class="easyui-tabs" data-options="fit:true,border:false,plain:true" id="mainTab">
			                <div title="Mode of Transport" style="padding:5px">
			                <s:form id="info" name="info" method="post" action="updateTransportRating.action" theme="simple">
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
													<tr><td class="heading"><s:text name="rating.mode.transport"/> </td></tr>
													<tr><td>&nbsp;</td></tr>-->
													<tr align="center">
															 <td bgcolor="#FFFFFF">
															 <table width="100%" border="0" cellspacing="0" cellpadding="0">
																	
																	<tr>
																	  <td class="bg">
																	  <table width="100%" border="0" align="center" cellpadding="4" cellspacing="0">
																		<tr> 
			                                                              <td width="30%"><s:text name="rating.mode.transport"/> <font color="red">*</font></td>
			                                                              <td width="70%"><s:textfield name="transDesc" id="transDesc" cssClass="inputBox form-control" maxlength="50" cssStyle="width:51%;" /></td>
			                                                            </tr>
										                                <tr> 
			                                                              <td><s:text name="rating.core.code"/> <font color="red">*</font></td>
			                                                              <td><s:textfield name="transRSA" id="transRSA" cssClass="inputBox form-control" maxlength="10" cssStyle="width:51%;"/></td>
			                                                            </tr>
										                                <tr> 
										                                
			                                                              <!--<td><s:text name="transport.display"/></td>
			                                                              <td><s:textfield name="transDO" id="transDO" cssClass="inputBox" size="35" cssStyle="width: 50%;" /></td>
			                                                              
			                                                            -->
			                                                            <s:hidden name="transDO" value="0"></s:hidden>
			                                                            </tr>
			                                                            <tr> 
			                                                             <td><s:text name="rating.status"/></td>
			                                                             <td><s:radio name="status" id="status" list="#{'Y':'Active','N':'DeActive'}" value='%{status==null?"N":status}'/></td>
			                                                            </tr>
			                                                            <s:hidden name="transID"/>
										                                <tr> 
										                                  <td>&nbsp;</td> 
																		  <td colspan=2><input type="button" class="btn btn-sm btn-danger" value="Back" onclick="fnCall('modeoftransport')"/>&nbsp;&nbsp;<s:submit value="Save" cssClass="btn btn-sm btn-success" onclick="return oncheck()"/></td>
			                                                            </tr>								
																	  </table>
																	  </td>
																	 </tr>
																	
																</table>
																</td>
													</tr>
													</table>
													</tr>
												</table>
			    								<s:hidden name="agencyCode"/>
												<s:hidden name="login_Id"/>
												<s:hidden name="borganization"/>
												<s:hidden name="bcode"/>
											    <s:hidden name="mode" id="mode"/>
			    
											</td>  
									 
			
											</tr>
											</table>
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
