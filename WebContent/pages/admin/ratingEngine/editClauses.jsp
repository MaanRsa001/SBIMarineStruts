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
			<s:if test = 'type.equals("Clauses")'>
				<div class="panel-heading"><s:text name="Clauses Master"/></div>
			</s:if>
			<s:elseif test = 'type.equals("Warranties")'>
				<div class="panel-heading"><s:text name="Warranties Master"/></div>
			</s:elseif>
			<s:elseif test = 'type.equals("Exclusions")'>
				<div class="panel-heading"><s:text name="Exclusions Master"/></div>
			</s:elseif>
			<div class="panel-body">
				<s:form id="info" name="info" method="post" action="updateClausesRating.action" theme="simple">
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
                                                                <td><s:text name="CLAUSES DESCRIPTION"/><font color="red">*</font></td>
                                                                <td>
                                                                    <s:textarea name="clauseDesc" id="clauseDesc" cssClass="inputBox form-control" cssStyle="width:51%;height:30px;"  onkeyup="allLetter(this);"/>
                                                                </td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td>&nbsp;</td>
                                                                <td><s:text name="COVER ID"/><font color="red">*</font></td>
                                                                <td>
                                                                	<s:if test='"add".equals(mode)'>
                                                                     <s:select name="coverID" id="coverID" list="#{'1':'Comprehensive','2':'TPL'}" headerKey="" headerValue="---Select---" cssClass="inputBox form-control" cssStyle="width:51%;height:30px;"/>
                                                                	</s:if>
                                                                	<s:else>
                                                                		<s:textfield name="coverID" id="coverID" value='%{coverID.equals("1")?"Comprehensive":"TPL"}' cssClass="inputBox form-control" cssStyle="width:51%;height:30px;" maxlength="50" onkeyup="allLetter(this);" readonly="true"/>
                                                                	</s:else>
                                                                
                                                                </td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                           	<tr>
                                                                <td>&nbsp;</td>
                                                                <td><s:text name="STATUS"/></td>
                                                                <td>
                                                                	<s:radio name="status" id="status" list="#{'Y':'Active','N':'DeActive'}" value='%{status==null?"N":status}'/>
                                                                    
                                                                </td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                           	<tr>
                                                                <td>&nbsp;</td>
                                                                <td><s:text name="REMARKS"/></td>
                                                                <td>
                                                                    <s:textfield name="remarks" id="remarks" cssClass="inputBox form-control" cssStyle="width:51%;height:30px;" maxlength="200" onkeyup="allLetter(this);"/>
                                                                </td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                           <tr>
                                                            	<td>&nbsp;</td>
                                                            	<td></td>
                                                                <td colspan="4">
                                                                <s:if test='type.equals("Clauses")'>
                                                                	<input type="button" class="btn btn-sm btn-danger" value="Back" onclick="fnCall('Clauses')"/>
                                                                </s:if>
                                                                <s:elseif test='type.equals("Warranties")'>
                                                                	<input type="button" class="btn btn-sm btn-danger" value="Back" onclick="fnCall('Warranties')"/>
                                                                </s:elseif>
                                                                <s:elseif test='type.equals("Exclusions")'>
                                                                	<input type="button" class="btn btn-sm btn-danger" value="Back" onclick="fnCall('Exclusions')"/>
                                                                </s:elseif>
                                                                &nbsp;&nbsp;<s:submit cssClass="btn btn-sm btn-success" value="Save" onclick="return oncheck()"/></td>
                                                            </tr> 
                                                            
                                                         </table></td>
                                                         </tr>
                                                        </table>
                                                      </td>
                                                    </tr>
                                        </table>
                                        </tr>
                                    </table>
                                  	<s:hidden name="sno" id="sno"/>
                                  	<s:hidden name="type" id="type"/>
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
	$('#effectiveDate').datepicker({
				//startDate: "+0d",
				endDate: '+100000d',
				todayHighlight: true,
				format: "mm/dd/yyyy"
			}).on('changeDate', function(e){
			    $(this).datepicker('hide');
			});
	});

$(function() {
	$('#end_Date').datepicker({
				//startDate: "+0d",
				endDate: "+100000d",
				todayHighlight: true,
				format: "dd/mm/yyyy"
			}).on('changeDate', function(e){
			    $(this).datepicker('hide');
			});
	});
</script>
</html>

