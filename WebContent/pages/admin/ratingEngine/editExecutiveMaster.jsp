<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>
<html>
  <head>

    <title>My JSP 'editExecutiveMaster.jsp' starting page</title>
    
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
    <style type="text/css">
    	.inputBox {
    		width: 50%;
    	}
    	.inputAppend {
    		width: 50%;
    		padding-left: 5px;
    	}
    	.inputSelect {
    		width: 51%;
    	}
    </style>
 <script>
	function getList(val, id)
   {
    	postRequest('${pageContext.request.contextPath}/getListAjaxRating.action?exmRegion='+val+'&reqFrom='+id, id);
    }
</script>
    <script language="JavaScript">
        function stopRKey(evt) { 
          var evt = (evt) ? evt : ((event) ? event : null); 
          var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null); 
          if ((evt.keyCode == 13) && (node.type=="text"))  {return false;} 
        } 
        document.onkeypress = stopRKey; 
</script>
<script type="text/javascript" src="js/tcal.js">
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
			   <div class="panel-heading"><s:text name="Sales Executive Master"/></div>
				  <div class="panel-body">
			        <div data-options="region:'center',title:'',iconCls:''">
			            <div class="easyui-tabs" data-options="fit:true,border:false,plain:true" id="mainTab">
			              <div title="Sales Executive Master" style="padding:5px">
			                <s:form id="info" name="info" method="post" action="saveexecutivemasterRating.action" theme="simple">
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
			                                        <tr><td class="heading"><s:text name="exm.executivemaster"/></td></tr>
			                                        <tr><td>&nbsp;</td></tr> -->
			                                        <tr align="center">
														<td bgcolor="#FFFFFF">
			                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
			                                                        <tr>
			                                                          <td class="bg">
			                                                          <table width="100%" border="0" align="center" cellpadding="4" cellspacing="0">
			                                                            <tr>
			                                                                <td>&nbsp;</td>
			                         										<td style="width:40%;"><s:text name="exm.executivename"/><span style="color: red;">*</span></td>
			                                                                <td style="width:70%;">
			                                                                    <s:textfield name="executiveName" cssClass="inputBox form-control" maxlength="100"></s:textfield>
			                                                                <s:if test='editType == "edit"'>																					
																					<s:hidden name="executiveName" />
																			</s:if>
			                                                                </td>
			                                                                <td>&nbsp;</td>
			                                                            </tr>
			                                                            <tr>
			                                                                <td>&nbsp;</td>
			                                                                <td><s:text name="exm.oACode"/></td>
			                                                                <td>
																			<%--<s:if test='mode == "edit"'>
																			<s:textfield name="otherpartyCode" cssClass="inputBox" onkeypress="return checkAlphaNumeric(event)" maxlength="25" disabled="true"></s:textfield>																					
																					<s:hidden name="otherpartyCode" />
																			</s:if>
																			<s:else>
																			--%>
																			<s:textfield name="otherpartyCode" cssClass="inputBox form-control" maxlength="25"></s:textfield> 
																			<%--</s:else>--%>
			                                                                </td>
			                                                                <td>&nbsp;</td>
			                                                            </tr>
			                                                            <tr>
			                                                                <td>&nbsp;</td>
			                                                                <td><s:text name="exm.commission"/></td>
			                                                                <td>
			                                                                    <s:textfield name="exmCommission" id="exmCommission" cssClass="inputBox form-control" size="6" />
			                                                                </td>
			                                                                <td>&nbsp;</td>                                                                
			                                                            </tr>
			                                                            <tr>
			                                                                <td>&nbsp;</td>
			                                                                <td><s:text name="exm.openCoverCommission"/></td>
			                                                                <td>
			                                                                    <s:textfield name="exmOpenCoverCommission" id="exmOpenCoverCommission" cssClass="inputBox form-control" size="6"/>
			                                                                </td>
			                                                                <td>&nbsp;</td>                                                                
			                                                            </tr>
			                                                            <tr>
			                                                                <td>&nbsp;</td>
			                                                                <td><s:text name="exm.effectiveDate"/><span style="color: red;">*</span></td>
			                                                                <td>
			                                                                    <%--<s:textfield name="exmEffectiveDate" id="exmEffectiveDate" cssClass="easyui-datebox" size="39"/>--%>
			                                                                    <s:textfield name="exmEffectiveDate" id="eff_date" cssClass="inputBox datePicker form-control" cssStyle="width:50%;" readonly="true" />
			                                                                </td>
			                                                                <td>&nbsp;</td>
			                                                            </tr>
			                                                            <tr>
			                                                                <td>&nbsp;</td>
			                                                                <td><s:text name="exm.status"/><span style="color: red;">*</span></td>
			                                                                <td>
			                                                                    <s:radio name="exmStatus" id="exmStatus" list="#{'Y':'Active','N':'DeActive'}" value='%{exmStatus==null?"N":exmStatus}'/>
			                                                                </td>
			                                                                <td>&nbsp;</td>
			                                                            </tr>
			                                                            <tr>
			                                                                <td>&nbsp;</td>
			                                                                <td><s:text name="exm.remarks"/></td>
			                                                                <td>
			                                                                    <s:textfield name="exmRemarks" id="exmRemarks" cssClass="inputBox form-control" size="100"/>
			                                                                </td>
			                                                                <td>&nbsp;</td>                                                                
			                                                            </tr>
			                                                            <tr>
			                                                            	<td>&nbsp;</td> 
			                                                            	<td></td>
			                                                                <td colspan="4"><input type="button" class="btn btn-sm btn-danger" value="Back" onclick="fnCall('executivemaster')"/>&nbsp;&nbsp;
			                                                                <s:submit cssClass="btn btn-sm btn-success" value="Save" onclick="return oncheck()"/></td>
			                                                                
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
			                                <s:hidden name="editType" id="editType"/>
			                                <s:hidden name="mode" id="mode"/>
			                                <s:hidden name="exmexecutiveId" id="exmexecutiveId"/>
			                                <s:token/>
			                    </s:form>
			                </div>
			            </div>
			        </div>
			      </div>
			 </div>
		</div>
    </div>
	<script language="JavaScript">
		
    </script>
  </body>
  <script type="text/javascript">
function oncheck(){
      if(document.getElementById("exmStatusN").checked){
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
