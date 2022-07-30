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
   <script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/tcal.js"></script>
        <script type="text/javascript" src="pages/admin/ratingEngine/menu.js">
                   </script>   
<style> 
 td ,  th {
  padding: 4px;
 }
</style>
 </head>
 <body>
    <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
			<div class="panel panel-primary">
				<div class="panel-body">
					<div class="row">
						<%@ include file="/pages/admin/ratingEngine/ratingEngineMenu.jsp" %>
					</div>
				</div>
			</div>
	</div>
    <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9">
		<div class="panel panel-primary">
			<div class="panel-heading"><s:text name="rating.mode.conveyance"/></div>
			<div class="panel-body">
    			<s:form id="info" name="info" method="post" action="updateConveyanceRating.action" theme="simple">
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
                                                                    <s:select name="transID" id="transID" list="transports" listKey="MODE_TRANSPORT_ID" listValue="TRANSPORT_DESCRIPTION" headerKey="-1" headerValue="---Select---" disabled="true" cssClass="inputBoxS form-control" cssStyle="width: 52%;" />
                                                                </td>
                                                                <td width="5%">&nbsp;</td>
                                                            </tr>
                                                           </s:if>
                                                           <s:else>
                                                            <tr>
                                                                <td>&nbsp;</td>
                                                                <td width="40%"><s:text name="rating.mode.transport"/> <font color="red">*</font></td>
                                                                <td width="70%">
                                                                    <s:select name="transID" id="transID" cssClass="inputBoxS form-control" cssStyle="width:52%;" list="transports" listKey="MODE_TRANSPORT_ID" listValue="TRANSPORT_DESCRIPTION" headerKey="" headerValue="-Select-"/>
                                                                </td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            </s:else>
                                                            <tr>
                                                                <td>&nbsp;</td>
                                                                <td><s:text name="conveyance.name"/><font color="red">*</font></td>
                                                                <td>
                                                                    <s:textfield name="conveyName" id="conveyName"  cssClass="inputBox form-control"  maxlength="45" cssStyle="width:52%;" onkeyup="allLetter(this);" />
                                                                </td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            
                                                            <tr>
                                                                <td>&nbsp;</td>
                                                                <td><s:text name="conveyance.conveyRate"/><font color="red">*</font></td>
                                                                <td>
                                                                    <s:textfield name="conveyRate" id="conveyRate" cssClass="inputBox form-control"  maxlength="6" cssStyle="width:52%;" onkeypress="return isNumberKey(this);" onkeyup="checkDecimals15(this)" />
                                                                </td>
                                                                <td>&nbsp;</td>
                                                                
                                                            </tr>
                                                            <tr>
                                                                <td>&nbsp;</td>
                                                                <td><s:text name="rating.core.code"/><font color="red">*</font></td>
                                                                <td>
                                                                    <s:textfield name="code" id="code" cssClass="inputBox form-control" cssStyle="width:52%;" maxlength="20" />
                                                                </td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td>&nbsp;</td>
                                                                <td><s:text name="rating.date"/><font color="red">*</font></td>
                                                                <td><!--
                                                                	<div class="inputAppend" style="width:51%;"><sj:datepicker id="eff_date" name="eff_date" cssClass="inputBox1" cssStyle="border: none;background: transparent;width:80%;" displayFormat="mm/dd/yy" readonly="true" showAnim="slideDown" duration="fast" disabled="#disable" /></div>
                                                                -->
																	<s:textfield name="eff_date" id="eff_date" cssClass="inputBox datePicker form-control" cssStyle="width:52%;" readonly="true" />
                                                                </td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td>&nbsp;</td>
                                                                <td><s:text name="rating.remark"/></td>
                                                                <td>
                                                                    <s:textfield name="remarks" id="remarks" cssClass="inputBox form-control" cssStyle="width:52%;" maxlength="80"/>
                                                                </td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td>&nbsp;</td>
                                                                <td><s:text name="rating.status"/><font color="red">*</font></td>
                                                                <td>
                                                                    <s:radio name="status" id="status" list="#{'Y':'Active','N':'DeActive'}" value='%{status==null?"N":status}'/>                                                     </td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                           
                                                            <tr>
                                                            	 <td>&nbsp;</td>
                                                            	 <td></td>
                                                                <td colspan="4"><!-- align="center"-->
                                                                    <input type="button" class="btn btn-sm btn-danger" value="Back" onclick="fnCall('conveyance')"/>&nbsp;&nbsp;<s:submit value="Save" cssClass="btn btn-sm btn-success" onclick="return oncheck()"/>
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
                                <s:hidden name="prevdate"/>
                                <s:hidden name="mode" id="mode"/>
                                <s:hidden name="conveyID" id="conveyID"/>
                                <s:hidden name="sno" id="sno"/>
					<s:token/>
                    </s:form>
                  </div>
                </div>
              </div>
    
    
   <%--  <div style="margin:10px 0;"></div>
    <div class="easyui-layout" style="width:1000px;height:1000px;">
      <div class="col-xs-12 col-sm-12 col-md-9 col-lg-3">
            <div class="easyui-accordion" data-options="fit:true,border:false">
                <%@ include file="/pages/admin/ratingEngine/ratingEngineMenu.jsp" %>
            </div>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9">
            <div class="easyui-tabs" data-options="fit:true,border:false,plain:true" id="mainTab">
                <div title="Conveyance Master" style="padding:5px">
                
                </div>
            </div>
        </div>
    </div> --%>
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

