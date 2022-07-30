<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<!-- <link href="https://fonts.googleapis.com/css?family=Alegreya+Sans|Amiri|Cormorant+Garamond&display=swap" rel="stylesheet">-->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<!-- <link href="<%=request.getContextPath()%>/pages/font-awesome-JA/font-awesome.css" rel="stylesheet" type="text/css">-->

<script language="JavaScript">javascript:window.history.forward(1);</script>
<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap-multiselect.js" type="text/javascript"></script>
<script language="JavaScript">
function stopRKey(evt) { 
  var evt = (evt) ? evt : ((event) ? event : null); 
  var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null); 
  if ((evt.keyCode == 13) && (node.type=="text"))  {return false;} 
} 
document.onkeypress = stopRKey;
</script>
<style>
	#loading {
	  width: 100%;
	  height: 100%;
	  top: 0px;
	  left: 0px;
	  position: fixed;
	  display: block;
	  opacity: 0.7;
	  background-color: #fff;
	  z-index: 99;
	  text-align: center;
	}
	
	#loading-image {
	  position: absolute;
	  top: 30%;
	  left: 45%;
	  z-index: 100;
	  width: 100px;
	  height: 100px;
	}
</style>
</head>
<body>
<s:form id="Quotation" name="Quotation" method="post" theme="simple">
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<s:actionerror cssStyle="color: red;" />
	</div>
</div>
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="Open Cover Policy Info" />
			</div>
			<div class="panel-body">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<div class="row" align="center">
						<s:if test='!"".equals(openCoverNo) && openCoverNo!=null'>
					 	<font size="5px" style="font-weight: bold;">OpenCover  Number  <font color="blue"><s:property value="openCoverNo"/></font>  are Generated Successfully for this Proposal Number: <s:property value="proposalNo"/></font>
					 	</s:if>
					 	<s:else>
					 	<font size="5px" style="font-weight: bold;">Your Information are Stored Successfully for this Proposal Number : <s:property value="proposalNo"/></font>
					 	</s:else>
				 	</div>
				 	<div class="row">
				 		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
				 			<s:if test='!"".equals(openCoverNo) && openCoverNo!=null'>
				 			<input type="button" name="Submit2" type="button" class="btn btn-sm btn-primary" value="Schedule" onclick="return viewPolicys('<s:property value="proposalNo"/>','<s:property value="openCoverNo"/>','<s:property value="#session.user"/>','schedule','<s:property value="openCoverNo"/>','','');"/>&nbsp;&nbsp;&nbsp;
				 			<%-- <input type="button" name="Submit2" type="button" class="btn btn-sm btn-warning" value="Credit" onclick="return viewPolicys('<s:property value="proposalNo"/>','<s:property value="openCoverNo"/>','<s:property value="#session.user"/>','debit','<s:property value="debitNoteNo"/>','','');"/>&nbsp;&nbsp;&nbsp;
				 			<input type="button" name="Submit2" type="button" class="btn btn-sm btn-info" value="Debit" onclick="return viewPolicys('<s:property value="proposalNo"/>','<s:property value="openCoverNo"/>','<s:property value="#session.user"/>','credit','<s:property value="creditNoteNo"/>','','');"/> --%>
				 			</s:if>
				 			<s:if test='!"".equals(openCoverNo) && openCoverNo!=null'>
								<input type="button" value="Proceed" onclick="proceedBtn('opencover');" class="btn btn-sm btn-success">
							</s:if>
							<s:else>
								<input type="button" value="Proceed" onclick="proceedBtn('proposal');" class="btn btn-sm btn-success">
							</s:else>
				 		</div>
				 	</div>
					</div>
				</div>
		</div>
	</div>

</div>

<s:token/>
<s:hidden name="proposalNo"  />
<s:hidden name="openCoverType" id="openCoverType" value="%{openCoverTypeS}"/>
</s:form>
<script type="text/javascript">
$(function() {
	$('#policyeffectiveDate').datetimepicker({
	     format:'d/m/Y',
	     //step: 1,
	     timepicker:false,
	    // minDate:'0',
	    // maxDate:'+1970/01/15',    
	     scrollInput : false,
	     onSelectDate:function(current_time, $input){
	    	 $(".xdsoft_datetimepicker").css("display", "none");
	     }
	});
});
$(function() {
	$('#depositDate').datetimepicker({
	     format:'d/m/Y',
	     //step: 1,
	     timepicker:false,
	    // minDate:'0',
	    // maxDate:'+1970/01/15',    
	     scrollInput : false,
	     onSelectDate:function(current_time, $input){
	    	 $(".xdsoft_datetimepicker").css("display", "none");
	     }
	});
});
function backBtn(){
	var opencoverType=document.getElementById("openCoverType").value;
	if(opencoverType=='12'){
		document.Quotation.action = 'depositInfoOpenCover.action';
	}else{
		document.Quotation.action = 'getCommodityRateInfoOpenCover.action';
	}
	document.Quotation.submit();
}
function proceedBtn(type){
	if(type=='opencover'){
		document.Quotation.action = 'policyRegisterReportReg.action';
	}else{
		document.Quotation.action = 'quoteRegisterReportReg.action';
	}
	document.Quotation.submit();
}
function viewPolicys(proposalNo,policynumber,loginId,docType,docNo,amendId,endtstatus)
{
	     var URL ="<%=request.getContextPath()%>/documentReportReg.action?docType="+docType+"&opencoverNo="+policynumber+"&loginId="+loginId+"&docNo="+docNo+"&amendId="+amendId+"&proposalNo="+proposalNo+"&endtstatus="+endtstatus;
		 var windowName = "PolicyView";
		 var width  = screen.availWidth;
		 var height = screen.availHeight;
		 var w = 900;
		 var h =	500;
		 var features =
			'width='          + w +
			',height='		  + h +
			',left='		  + ((width - w - 10) * .5)  +
			',top='			  + ((height - h - 30) * .5) +
			',directories=no' +
			',location=no'	  +
			',menubar=no'	  +
			',scrollbars=yes' +
			',status=no'	  +
			',toolbar=no'	  +
			',resizable=false';
		var strOpen = window.open (URL, windowName, features);
		strOpen.focus();
		return false;
}
</script>	
</body>
</html>