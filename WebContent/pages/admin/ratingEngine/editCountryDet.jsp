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
    <script type="text/javascript" src="js/tcal.js">
                    </script>
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
				   <div class="row">
				        <div data-options="region:'west',split:true" title="Options" style="width:100%;">
				            <div class="easyui-accordion" data-options="fit:true,border:false">
				                <%@ include file="/pages/admin/ratingEngine/ratingEngineMenu.jsp" %>
				            </div>
				        </div>
				    </div>
				 </div>
			</div>
		</div>
		<div class="col-xs-12 col-sm-12 col-md-9 col-lg-9">
			<div class="panel panel-primary">
			   <div class="panel-heading"><s:text name="Country Cover"/></div>
				  <div class="panel-body">
			        <div data-options="region:'center',title:'',iconCls:''">
			            <div class="easyui-tabs" data-options="fit:true,border:false,plain:true" id="mainTab">
			                <div title="Country Cover" style="padding:5px">
			                <s:form id="info" name="info" method="post" action="updateCountryDetRating.action" theme="simple">
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
			                                        <tr><td class="heading"><s:text name="countryDet.master"/></td></tr>
			                                        <tr><td>&nbsp;</td></tr>-->
			                                        <tr align="center">
			                                                 <td bgcolor="#FFFFFF">
			                                                 <table width="100%" border="0" cellspacing="0" cellpadding="0">
			                                                        
			                                                        <tr>
			                                                          <td class="bg">
			                                                          <table width="100%" border="0" align="center" cellpadding="4" cellspacing="0">
			                                                            <tr>
			                                                                <td width="5%">&nbsp;</td>
			                                                                <td width="30%"><s:text name="countrymas.name"/><font color="red">*</font></td>
			                                                                <td width="60%">                                                                
			                                                                <s:if test="mode=='edit'">
			                                                                    <s:select name="countryDetID" id="countryDetID" list="countriesDetail" listKey="COUNTRY_ID" listValue="COUNTRY_NAME" cssClass="inputBoxS form-control" cssStyle="width:52%;" headerKey="-1" headerValue="-Select-" disabled="true"/>
			                                                                    <s:hidden name="countryDetID"/>
			                                                                </s:if>
			                                                                <s:else>
			                                                                    <s:select name="countryDetID" id="countryDetID" list="newcountriesDetail" listKey="COUNTRY_ID" listValue="COUNTRY_NAME" cssClass="inputBoxS form-control" cssStyle="width:52%;" headerKey="-1" headerValue="-Select-"/>
			                                                                </s:else>
			                                                                </td>
			                                                                <td width="5%">&nbsp;</td>
			                                                                
			                                                            </tr>
			                                                            
			                                                            <tr>
			                                                                <td>&nbsp;</td>
			                                                                <td><s:text name="countrymas.short.name"/></td>
			                                                                <td>
			                                                                    <s:textfield name="countryShortName" id="countryShortName" cssClass="inputBox form-control" cssStyle="width:52%;"  maxlength="10" onkeyup="allLetter(this);"/>
			                                                                </td>
			                                                                <td>&nbsp;</td>
			                                                                
			                                                            </tr>
			                                                            <tr>
			                                                                <td>&nbsp;</td>
			                                                                <td><s:text name="war.rate"/><font color="red">*</font></td>
			                                                                <td>
			                                                                    <s:textfield name="warRate" id="warRate" cssClass="inputBox form-control" cssStyle="width:52%;" maxlength="8" onkeypress="return fun_AllowOnlyAmountAndDot(this.id)"/>
			                                                                </td>
			                                                                <td>&nbsp;</td>
			                                                                
			                                                            </tr>
			                                                             <tr>
			                                                                <td>&nbsp;</td>
			                                                                <td><s:text name="War on Land Rate"/><font color="red">*</font></td>
			                                                                <td>
			                                                                    <s:textfield name="warLandRate" id="warLandRate" cssClass="inputBox form-control" cssStyle="width:52%;" maxlength="8" onkeypress="return fun_AllowOnlyAmountAndDot(this.id)"/>
			                                                                </td>
			                                                                <td>&nbsp;</td>
			                                                                
			                                                            </tr>
			                                                            <tr>
			                                                                <td>&nbsp;</td>
			                                                                <td><s:text name="countryDet.start"/><font color="red">*</font></td>
			                                                                <td>
			                                                                
			                                                                <s:select name="startPlace" id="startPlace" headerKey="-1" headerValue="-- Select --" list="#{'1':'Any Port','2':'Warehouse','3':'Disabled'}" cssClass="inputBoxS form-control" cssStyle="width: 52%;" />
			                                                                    
			                                                                </td>
			                                                                <td>&nbsp;</td>
			                                                                
			                                                            </tr>
			                                                            <tr>
			                                                                <td>&nbsp;</td>
			                                                                <td><s:text name="countryDet.start.warranty"/></td>
			                                                                <td>
			                                                                	<table width="100%">
			                                                                		<tr>
			                                                                			<td width="55%;" style="padding-left:0;"><s:textfield name="sp" id="sp" readonly="true" cssStyle="width:95%;"  cssClass="inputBox form-control" size="35"/></td>
			                                                                			<td width="43%;"><a><img src="images/list_ic.gif"  style="cursor:hand" height="16" src="images/list_ic.jpg" onClick="javascript:OpenClausePopUp('W','1','_1','sp');" border='0' alt="Add warranties ">&nbsp;&nbsp;Warranty</a></td>
			                                                                		</tr>
			                                                                	</table>                                                               
			                                                                </td>
			                                                                
			                                                            </tr>
			                                                            <tr>
			                                                                <td>&nbsp;</td>
			                                                                <td><s:text name="countryDet.end"/><font color="red">*</font></td>
			                                                                <td>
			                                                                    <s:select name="endPlace" id="endPlace" headerKey="-1" headerValue="-- Select --" list="#{'1':'Any Port','2':'Warehouse','3':'Disabled'}" cssClass="inputBoxS form-control" cssStyle="width:52%;" />
			                                                                </td>
			                                                                <td>&nbsp;</td>
			                                                                
			                                                            </tr>
			                                                            <tr>
			                                                                <td>&nbsp;</td>
			                                                                <td><s:text name="countryDet.end.warranty"/></td>
			                                                                <td>
			                                                                	<table width="100%">
			                                                                		<tr>
			                                                                			<td width="55%;" style="padding-left:0;"><s:textfield name="ep" id="ep" readonly="true"  cssStyle="width:95%;" cssClass="inputBox form-control" size="35"/></td>
			                                                                			<td width="43%;"><a><img src="images/list_ic.gif"  style="cursor:hand" height="16" src="images/list_ic.jpg" onClick="javascript:OpenClausePopUp('W','1','_1','ep');" border='0' alt="Add warranties ">&nbsp;&nbsp;Warranty</a></td>
			                                                                		</tr>
			                                                                	</table>
			                                                                </td>
			                                                                <td>&nbsp;</td>
			                                                                
			                                                            </tr>
			                                                                                                                        
			                                                            <tr>
			                                                                <td>&nbsp;</td>
			                                                                <td><s:text name="rating.core.code"/><font color="red">*</font></td>
			                                                                <td>
			                                                                    <s:textfield name="code" id="code" cssClass="inputBox form-control" cssStyle="width:52%;" maxlength="10"/>
			                                                                </td>
			                                                                <td>&nbsp;</td>
			                                                                
			                                                            </tr>
			                                                            
			                                                            <tr>
			                                                                <td>&nbsp;</td>
			                                                                <td><s:text name="rating.remark"/></td>
			                                                                <td>
			                                                                    <s:textfield name="remarks" id="remarks" cssClass="inputBox form-control" cssStyle="width:52%;" size="35" />
			                                                                </td>
			                                                                <td>&nbsp;</td>
			                                                                
			                                                            </tr>
			                                                            <tr>
			                                                                <td>&nbsp;</td>
			                                                                <td><s:text name="rating.date"/><font color="red">*</font></td>
			                                                                <td>
			                                                                    <%--<div class="inputAppend" style="width:51%;"><sj:datepicker id="eff_date" name="eff_date" cssClass="inputBox1" cssStyle="border: none;background: transparent;width:80%;" displayFormat="mm/dd/yy" changeMonth="true" changeYear="true" readonly="true" showAnim="slideDown" duration="fast" disabled="#disable" /></div> --%>
			                                                                    <s:textfield name="eff_date" id="eff_date" cssClass="inputBox datePicker form-control" cssStyle="width:52%;" readonly="true" />
			                                                                </td>
			                                                                <td>&nbsp;</td>
			                                                                
			                                                            </tr>
			                                                            <tr>
			                                                                <td>&nbsp;</td>
			                                                                <td><s:text name="rating.status"/><font color="red">*</font></td>
			                                                                <td>
			                                                                    <s:radio name="status" id="status" list="#{'Y':'Active','N':'DeActive','R':'Referral'}"/>
			                                                                </td>
			                                                                <td>&nbsp;</td>
			                                                                
			                                                            </tr>
			                                                            
			                                                            <tr>
			                                                                <td>&nbsp;</td> 
																			<td></td>
			                                                                <td colspan="4">
			                                                                    <input type="button" class="btn btn-sm btn-danger" value="Back" onclick="fnCall('country')"/>&nbsp;&nbsp;<s:submit value="Save" cssClass="btn btn-sm btn-success" onclick="return oncheck()"/>
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
			                                    <s:hidden name="agencyCode"/>
			                                    <s:hidden name="login_Id"/>
			                                    <s:hidden name="borganization"/>
			                                    <s:hidden name="bcode"/>
			                                    <s:hidden name="prevdate"/>
			                                    <s:hidden name="countryID"/>
			                                    <s:hidden name="countryDetSNO"/>
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
 function OpenClausePopUp(clause,value,id,name) 
{

    var val=document.getElementById(name).value;
    var URL = "pages/admin/ratingEngine/ClausePopUp.jsp?ida="+clause+"&from="+value+"&id="+id+"&val="+val+"&name="+name;
    var windowName = "GroupView";
    var width  = screen.availWidth;
    var height = screen.availHeight;
    var w = 750;
    var h = 460;
    var features =
        'width='          + w +
        ',height='        + h +
        ',left='          + ((0) * .5)  +
        ',top='           + ((0) * .5) +
        ',directories=no' +
        ',location=no'    +
        ',menubar=no'     +
        ',scrollbars=yes' +
        ',status=no'      +
        ',toolbar=no'     +
        ',resizable=no';
    var strOpen = window.open (URL, windowName, features);
    strOpen.focus();
    return false;
}

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

