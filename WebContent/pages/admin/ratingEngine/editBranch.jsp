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
			<div class="panel-heading"><s:text name="BRANCH MASTER"/></div>
			<div class="panel-body">
				<s:form id="info" name="info" method="post" action="updateBranchRating.action" theme="simple">
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
                                                                <td><s:text name="Branch Name"/><font color="red">*</font></td>
                                                                <td>
                                                                    <s:textfield name="branchName" id="branchName" cssClass="inputBox form-control" cssStyle="width:51%;height:30px;" maxlength="50" onkeyup="allLetter(this);" />
                                                                </td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td>&nbsp;</td>
                                                                <td><s:text name="Address1"/></td>
                                                                <td>
                                                                    <s:textfield name="address1" id="address1" cssClass="inputBox form-control" cssStyle="width:51%;height:30px;" maxlength="50" onkeyup="allLetter(this);"/>
                                                                </td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td>&nbsp;</td>
                                                                <td><s:text name="Address2"/></td>
                                                                <td>
                                                                    <s:textfield name="address2" id="address2" cssClass="inputBox form-control" cssStyle="width:51%;height:30px;" maxlength="50" onkeyup="allLetter(this);"/>
                                                                </td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td>&nbsp;</td>
                                                                <td><s:text name="Address3"/></td>
                                                                <td>
                                                                    <s:textfield name="address3" id="address3" cssClass="inputBox form-control" cssStyle="width:51%;height:30px;" maxlength="50" onkeyup="allLetter(this);"/>
                                                                </td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td>&nbsp;</td>
                                                                <td><s:text name="Currency Name"/><font color="red">*</font></td>
                                                                <td>
                                                                    <s:textfield name="currencyName" id="currencyName" cssClass="inputBox form-control" cssStyle="width:51%;height:30px;" maxlength="50" onkeyup="allLetter(this);"/>
                                                                </td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td>&nbsp;</td>
                                                                <td><s:text name="City"/>
                                                                <td>
                                                                    <s:textfield name="city" id="city" cssClass="inputBox form-control" cssStyle="width:51%;height:30px;" maxlength="50"  onkeyup=" allLetter(this);"/>
                                                                </td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td>&nbsp;</td>
                                                                <td><s:text name="Country"/>
                                                                <td>
                                                                    <s:textfield name="country" id="country" cssClass="inputBox form-control" cssStyle="width:51%;height:30px;" maxlength="50"  onkeyup=" allLetter(this);"/>
                                                                </td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td>&nbsp;</td>
                                                                <td><s:text name="Effective Date"/><font color="red">*</font></td>
                                                                <td>
                                                                	<%-- <div class="inputAppend" style="width:51%;"><sj:datepicker id="eff_date" name="eff_date" cssClass="inputBox1" cssStyle="border: none;background: transparent;width:80%;" displayFormat="mm/dd/yy" changeMonth="true" changeYear="true" readonly="true" showAnim="slideDown" duration="fast" disabled="#disable" /></div>--%>
                                                                	<s:textfield name="eff_date" id="eff_date" cssClass="form-control textfiledNew datepicker tooltipContent"  data-content="" cssStyle="width:51%;height:30px;" readonly="true"  />
                                                                </td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td>&nbsp;</td>
                                                                <td><s:text name="Remarks"/></td>
                                                                <td>                                                                	
                                                                    <s:textfield name="remarks" id="remarks" cssClass="inputBox form-control" cssStyle="width:51%;height:30px;" maxlength="80"/>
                                                                </td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            
                                                 <!-- ================================================================== --> 
                                                             <tr>
                                                                <td>&nbsp;</td>
                                                                <td><s:text name="Phone"/></td>
                                                                <td>                                                                	
                                                                    <s:textfield name="phone" id="phone" cssClass="inputBox form-control" cssStyle="width:51%;height:30px;" maxlength="15"/>
                                                                </td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            
                                                             <tr>
                                                                <td>&nbsp;</td>
                                                                <td><s:text name="Fax"/></td>
                                                                <td>                                                                	
                                                                    <s:textfield name="fax" id="fax" cssClass="inputBox form-control" cssStyle="width:51%;height:30px;" value="0" maxlength="25"/>
                                                                </td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            
                                                             <tr>
                                                                <td>&nbsp;</td>
                                                                <td><s:text name="Email"/></td>
                                                                <td>                                                                	
                                                                    <s:textfield name="emailID" id="emailID" cssClass="inputBox form-control" cssStyle="width:51%;height:30px;" maxlength="40"/>
                                                                </td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            
                                                             <tr>
                                                                <td>&nbsp;</td>
                                                                <td><s:text name="Header Img"/></td>
                                                                <td>                                                                	
                                                                    <s:textfield name="headerIMG" id="headerIMG" cssClass="inputBox form-control" cssStyle="width:51%;height:30px;" maxlength="50"/>
                                                                </td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            
                                                             <tr>
                                                                <td>&nbsp;</td>
                                                                <td><s:text name="Footer Img"/></td>
                                                                <td>                                                                	
                                                                    <s:textfield name="footerIMG" id="footerIMG" cssClass="inputBox form-control" cssStyle="width:51%;height:30px;" maxlength="50"/>
                                                                </td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            
                                                             <tr>
                                                                <td>&nbsp;</td>
                                                                <td><s:text name="Sign Img"/></td>
                                                                <td>                                                                	
                                                                    <s:textfield name="signIMG" id="signIMG" cssClass="inputBox form-control" cssStyle="width:51%;height:30px;" maxlength="50"/>
                                                                </td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            
                                                             <tr>
                                                                <td>&nbsp;</td>
                                                                <td><s:text name="Stamp"/></td>
                                                                <td>                                                                	
                                                                    <s:textfield name="stamp" id="stamp" cssClass="inputBox form-control" cssStyle="width:51%;height:30px;" maxlength="50"/>
                                                                </td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            
                                                             <tr>
                                                                <td>&nbsp;</td>
                                                                <td><s:text name="Currency Abbrevation"/></td>
                                                                <td>                                                                	
                                                                    <s:textfield name="currencyABB" id="currencyABB" cssClass="inputBox form-control" cssStyle="width:51%;height:30px;" maxlength="10"/>
                                                                </td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            
                                                             <tr>
                                                                <td>&nbsp;</td>
                                                                <td><s:text name="Currency Acronym"/></td>
                                                                <td>                                                                	
                                                                    <s:textfield name="currencyACRO" id="currencyACRO" cssClass="inputBox form-control" cssStyle="width:51%;height:30px;" maxlength="10"/>
                                                                </td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            
                                                             <tr>
                                                                <td>&nbsp;</td>
                                                                <td><s:text name="Origination CountryID"/></td>
                                                                <td>                                                                	
                                                                    <s:textfield name="originationID" id="originationID" cssClass="inputBox form-control" cssStyle="width:51%;height:30px;" value="0" maxlength="10"/>
                                                                </td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            
                                                             <tr>
                                                                <td>&nbsp;</td>
                                                                <td><s:text name="Destination CountryID"/></td>
                                                                <td>                                                                	
                                                                    <s:textfield name="destinationID" id="destinationID" cssClass="inputBox form-control" cssStyle="width:51%;height:30px;" value="0" maxlength="10"/>
                                                                </td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            
                                                             <tr>
                                                                <td>&nbsp;</td>
                                                                <td><s:text name="Currency Decimal Name"/></td>
                                                                <td>                                                                	
                                                                    <s:textfield name="currencyDecName" id="currencyDecName" cssClass="inputBox form-control" cssStyle="width:51%;height:30px;" maxlength="20"/>
                                                                </td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            
                                                             <tr>
                                                                <td>&nbsp;</td>
                                                                <td><s:text name="eCurrency Decimal Digit"/></td>
                                                                <td>                                                                	
                                                                    <s:textfield name="currencyDecDigit" id="currencyDecDigit" cssClass="inputBox form-control" cssStyle="width:51%;height:30px;" value="0" maxlength="10"/>
                                                                </td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            
                                                             <tr>
                                                                <td>&nbsp;</td>
                                                                <td><s:text name="Decimal Places"/></td>
                                                                <td>                                                                	
                                                                    <s:textfield name="decimalPlaces" id="decimalPlaces" cssClass="inputBox form-control" cssStyle="width:51%;height:30px;" value="0" maxlength="3"/>
                                                                </td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            
                                                             <tr>
                                                                <td>&nbsp;</td>
                                                                <td><s:text name="Tax"/></td>
                                                                <td>                                                                	
                                                                    <s:textfield name="tax" id="tax" cssClass="inputBox form-control" cssStyle="width:51%;height:30px;" value="0" maxlength="7"/>
                                                                </td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            
                                                             <tr>
                                                                <td>&nbsp;</td>
                                                                <td><s:text name="Branch Prefix"/></td>
                                                                <td>                                                                	
                                                                    <s:textfield name="branchPrefix" id="branchPrefix" cssClass="inputBox form-control" cssStyle="width:51%;height:30px;" maxlength="10"/>
                                                                </td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            
                                                             <tr>
                                                                <td>&nbsp;</td>
                                                                <td><s:text name="PcKey Close TRN"/></td>
                                                                <td>                                                                	
                                                                    <s:textfield name="pckeyClose" id="pckeyClose" cssClass="inputBox form-control" cssStyle="width:51%;height:30px;" maxlength="5"/>
                                                                </td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            
                                                             <tr>
                                                                <td>&nbsp;</td>
                                                                <td><s:text name="Lang YN"/></td>
                                                                <td>                                                                	
                                                                    <s:textfield name="langYN" id="langYN" cssClass="inputBox form-control" cssStyle="width:51%;height:30px;" maxlength="1"/>
                                                                </td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            
                                                             <tr>
                                                                <td>&nbsp;</td>
                                                                <td><s:text name="Belonging Branch"/></td>
                                                                <td>                                                                	
                                                                    <s:textfield name="belongingBranch" id="belongingBranch" cssClass="inputBox form-control" cssStyle="width:51%;height:30px;" maxlength="10"/>
                                                                </td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            
                                                             <tr>
                                                                <td>&nbsp;</td>
                                                                <td><s:text name="Core App Code"/></td>
                                                                <td>                                                                	
                                                                    <s:textfield name="coreCode" id="coreCode" cssClass="inputBox form-control" cssStyle="width:51%;height:30px;" maxlength="100"/>
                                                                </td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            
                                                             <tr>
                                                                <td>&nbsp;</td>
                                                                <td><s:text name="Dept Code"/></td>
                                                                <td>                                                                	
                                                                    <s:textfield name="deptCode" id="deptCode" cssClass="inputBox form-control" cssStyle="width:51%;height:30px;" maxlength="10"/>
                                                                </td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            							
                                                            
                                                            
                                                            
                                                 <!-- ================================================================== -->         
                                                            
                                                            
                                                            <tr>
                                                                <td>&nbsp;</td>
                                                                <td><s:text name="Status"/><font color="red">*</font></td>
                                                                <td>
                                                                    <s:radio name="status" id="status" list="#{'Y':'Active','N':'DeActive'}" value='%{status==null?"N":status}'/>
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
                                    <s:hidden name="snoID"/>
                                     <s:hidden name="branchcode1"/>
                                     <s:hidden name="amendID1"/>
                                    <s:hidden name="borganization"/>
                                    <s:hidden name="bcode"/>
                                    <s:hidden name="prevdate"/>
			                        <s:hidden name="mode" id="mode"/>
				                  </td>
                                </tr>
                                </table>
                    </s:form>
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
$(function() {
	$('#eff_date').datepicker({
				//startDate: "+0d",
				endDate: '+0d',
				todayHighlight: true,
				format: "mm/dd/yyyy"
			}).on('changeDate', function(e){
			    $(this).datepicker('hide');
			});
	});

</script>
</html>

