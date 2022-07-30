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
    <script type="text/javascript" src="js/tcal.js"></script>
        <script type="text/javascript" src="js/common.js"></script>
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
			<div class="panel-heading"><s:text name="rating.countrymas"/></div>
			<div class="panel-body">
				<s:form id="info" name="info" method="post" action="updateCountryRating.action" theme="simple">
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
                                                            <tr>
                                                                <td>&nbsp;</td>
                                                                <td width="40%"><s:text name="countrymas.name"/><font color="red">*</font></td>
                                                                <td  width="70%">
                                                                    <s:textfield name="countryName" id="countryName" cssClass="inputBox form-control" cssStyle="width:51%;" maxlength="50" onkeyup="allLetter(this);" />
                                                                </td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td>&nbsp;</td>
                                                                <td><s:text name="countrymas.short.name"/></td>
                                                                <td>
                                                                    <s:textfield name="countryShortName" id="countryShortName" cssClass="inputBox form-control" cssStyle="width:51%;" maxlength="10" onkeyup="allLetter(this);"/>
                                                                </td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td>&nbsp;</td>
                                                                <td><s:text name="countrymas.nationality"/><font color="red">*</font></td>
                                                                <td>
                                                                    <s:textfield name="countryNat" id="countryNat" cssClass="inputBox form-control" cssStyle="width:51%;" maxlength="50" onkeyup="allLetter(this);"/>
                                                                </td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td>&nbsp;</td>
                                                                <td><s:text name="countrymas.georate"/><font color="red">*</font></td>
                                                                <td>
                                                                    <s:textfield name="geoRate" id="geoRate" cssClass="inputBox form-control" cssStyle="width:51%;" maxlength="6" onkeypress="return isNumberKey(this);" onkeyup=" checkDecimal(this);"/>
                                                                </td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td>&nbsp;</td>
                                                                <td><s:text name="rating.core.code"/><font color="red">*</font></td>
                                                                <td>
                                                                    <s:textfield name="code" id="code" cssClass="inputBox form-control" cssStyle="width:51%;" maxlength="10"/>
                                                                </td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td>&nbsp;</td>
                                                                <td><s:text name="rating.date"/><font color="red">*</font></td>
                                                                <td>
                                                                	<%-- <div class="inputAppend" style="width:51%;"><sj:datepicker id="eff_date" name="eff_date" cssClass="inputBox1" cssStyle="border: none;background: transparent;width:80%;" displayFormat="mm/dd/yy" changeMonth="true" changeYear="true" readonly="true" showAnim="slideDown" duration="fast" disabled="#disable" /></div>--%>
                                                                	<s:textfield name="eff_date" id="eff_date" cssClass="inputBox datePicker form-control" cssStyle="width:51%;" readonly="true"  />
                                                                </td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td>&nbsp;</td>
                                                                <td><s:text name="rating.remark"/></td>
                                                                <td>                                                                	
                                                                    <s:textfield name="remarks" id="remarks" cssClass="inputBox form-control" cssStyle="width:51%;" maxlength="80"/>
                                                                </td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td>&nbsp;</td>
                                                                <td><s:text name="rating.status"/><font color="red">*</font></td>
                                                                <td>
                                                                    <s:radio name="status" id="status" list="#{'Y':'Active','N':'DeActive','R':'Refferal'}" value='%{status==null?"N":status}'/>
                                                                </td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                            	<td>&nbsp;</td>
                                                            	<td></td>
                                                                <td colspan="4"><input type="button" class="btn btn-sm btn-danger" value="Back" onclick="fnCall('countrymaster')"/>&nbsp;&nbsp;<s:submit cssClass="btn btn-sm btn-success" value="Save" onclick="return oncheck()"/></td>
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
                                    <s:hidden name="countryID"/>
                                    <s:hidden name="borganization"/>
                                    <s:hidden name="bcode"/>
                                    <s:hidden name="prevdate"/>
			                        <s:hidden name="mode" id="mode"/>
				                  </td>
                                </tr>
                                </table>
                                <s:token/>
                    </s:form>
			</div>
		</div>
		</div>
		
    <%-- <div style="margin:10px 0;"></div>
    <div class="easyui-layout" style="width:900px;height:1000px;">
       <div data-options="region:'west',split:true" title="Options" style="width:150px;">
            <div class="easyui-accordion" data-options="fit:true,border:false">
                <%@ include file="/pages/admin/ratingEngine/ratingEngineMenu.jsp" %>
            </div>
        </div>
        <div data-options="region:'center',title:'',iconCls:''">
            <div class="easyui-tabs" data-options="fit:true,border:false,plain:true" id="mainTab">
                <div title="Country Master" style="padding:5px">
                
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

