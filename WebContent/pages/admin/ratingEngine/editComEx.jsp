<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
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
    <div class="easyui-layout" style="width:100%;height:1000px">
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
			   <div class="panel-heading"><s:text name="Commodity Excess Master"/></div>
				  <div class="panel-body">
				        <div data-options="region:'center',title:'',iconCls:''">
				            <div class="easyui-tabs" data-options="fit:true,border:false,plain:true" id="mainTab">
				                <div title="Commodity Excess Master" style="padding:5px">
				                <s:form id="info" name="info" method="post" action="updateComExRating.action" theme="simple">
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
				                                        <tr><td class="heading"><s:text name="com.ex.name"/></td></tr>
				                                        <tr><td>&nbsp;</td></tr>-->
				                                        <tr align="center">
				                                                 <td bgcolor="#FFFFFF">
				                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
				                                                        
				                                                        <tr>
				                                                          <td class="bg">
				                                                          <table width="100%" border="0" align="center" cellpadding="4" cellspacing="0">
				                                                          	<s:if test="mode=='edit'">
					                                                            <tr>
					                                                                <td width="5%">&nbsp;</td>
					                                                                <td width="45%"><s:text name="Cover"/><font color="red">*</font></td>
					                                                                <td width="45%">
					                                                                    <s:hidden name="coverName" id="coverName"></s:hidden>
					                                                                    <s:select name="coverName" id="coverName" list="CoverList1" listKey="COVER_ID" listValue="COVER_NAME" headerKey="-1" headerValue="---Select---" disabled="true" cssClass="inputBoxS form-control" cssStyle="width: 52%;" />
					                                                                </td>
					                                                                <td width="5%">&nbsp;</td>
					                                                            </tr>
					                                                           </s:if>
					                                                           <s:else>
					                                                            <tr>
					                                                                <td>&nbsp;</td>
					                                                                <td width="40%"><s:text name="Cover"/> <font color="red">*</font></td>
					                                                                <td width="70%">
					                                                                    <s:select name="coverName" id="coverName" cssClass="inputBoxS form-control" cssStyle="width:52%;" list="CoverList1" listKey="COVER_ID" listValue="COVER_NAME"  headerKey="" headerValue="-Select-"/>
					                                                                </td>
					                                                                <td>&nbsp;</td>
					                                                            </tr>
					                                                            </s:else>
				                                                          	
				                                                            <tr>
				                                                                <td>&nbsp;</td>
				                                                                <td style="width:40%;">
				                                                                    <s:text name="start.amt"/> <font color="red">*</font>
				                                                                </td>
				                                                                <td style="width:70%;">
				                                                                    <s:textfield name="startAmt" id="startAmt" cssClass="inputBox form-control" cssStyle="width:51%;" maxlength="30" onkeypress="return fun_AllowOnlyAmountAndDot(this.id)"/>
				                                                                    
				                                                                </td>
				                                                                <td>&nbsp;</td>
				                                                            </tr>
				                                                            <tr>
				                                                                <td>&nbsp;</td>
				                                                                <td>
				                                                                    <s:text name="end.amt"/><font color="red">*</font>
				                                                                </td>
				                                                                <td>
				                                                                    <s:textfield name="endAmt" id="endAmt" cssClass="inputBox form-control" cssStyle="width:51%;" maxlength="30" onkeypress="return fun_AllowOnlyAmountAndDot(this.id)"/>
				                                                                    
				                                                                </td>
				                                                                <td>&nbsp;</td>
				                                                            </tr>
				                                                            <tr>
				                                                                <td>&nbsp;</td>
				                                                                <td>
				                                                                    <s:text name="com.deductible"/><font color="red">*</font>
				                                                                </td>
				                                                                <td>
				                                                                    <s:textfield name="deductible" id="deductible" cssClass="inputBox form-control" cssStyle="width:51%;" maxlength="10" onkeypress="return fun_AllowOnlyAmountAndDot(this.id)"/>
				                                                                    
				                                                                </td>
				                                                                <td>&nbsp;</td>
				                                                            </tr>
				                                                            <tr>
				                                                                <td>&nbsp;</td>
				                                                                <td>
				                                                                    <s:text name="com.rate"/><font color="red">*</font>
				                                                                </td>
				                                                                <td>
				                                                                    <s:textfield name="comExRate" id="conExRate" cssClass="inputBox form-control" cssStyle="width:51%;" maxlength="6" onkeypress="return fun_AllowOnlyAmountAndDot(this.id)"/>
				                                                                    <s:hidden name="comExID"/>
				                                                                </td>
				                                                                <td>&nbsp;</td>
				                                                            </tr>
				                                                            <!--
				                                                            <tr>
				                                                                <td>&nbsp;</td>
				                                                                <td>
				                                                                    <s:text name="rating.core.code"/>
				                                                                </td>
				                                                                <td>
				                                                                    <s:textfield name="code" id="code" cssClass="inputBox" cssStyle="width:50%;" onkeypress="return checkAlphaNumeric(event)"/>
				                                                                    
				                                                                </td>
				                                                                <td>&nbsp;</td>
				                                                            </tr>
				                                                            --><tr>
				                                                                <td>&nbsp;</td>
				                                                                <td>
				                                                                    <s:text name="rating.date"/><font color="red">*</font>
				                                                                </td>
				                                                                <td>
																					<s:textfield name="eff_date" id="eff_date" cssClass="inputBox datePicker form-control" cssStyle="width:51%;" readonly="true" />
				                                                                </td>
				                                                                <td>&nbsp;</td>
				                                                            </tr>
				                                                            
				                                                            <tr>
				                                                                <td>&nbsp;</td>
				                                                                <td>
				                                                                    <s:text name="rating.status"/>
				                                                                </td>
				                                                                <td>
				                                                                    <s:radio name="status" id="status" list="#{'Y':'Active','N':'DeActive'}" value='%{status==null?"N":status}'/>
				                                                                    
				                                                                </td>
				                                                                <td>&nbsp;</td>
				                                                            </tr>
				                                                            <tr>
				                                                            
				                                                            	<td>&nbsp;</td> 
																				<td></td>
				                                                                <td colspan="4"><input type="button" class="btn btn-sm btn-danger" value="Back" onclick="fnCall('commodityexcess')"/>&nbsp;&nbsp;<s:submit value="Save" cssClass="btn btn-sm btn-success" onclick="return oncheck()"/></td>
				                                                                
				                                                            </tr>
				                                                         </table></td>
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
				                                    <s:hidden name="prevdate"/>
				                                    <s:hidden name="mode" id="mode"/>
				                                    <s:token/>
				                   </td>
				                                </tr>
				                                </table>
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

