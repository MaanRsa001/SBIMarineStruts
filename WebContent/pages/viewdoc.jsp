 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script language="JavaScript">javascript:window.history.forward(1);</script>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/font-awesome.css" />
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/demo.css" />
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap-multiselect.css" />
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/easy-responsive-tabs.css" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/datepicker3.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/slimmenu.css">
		<link href="<%=request.getContextPath()%>/bootstrap/css/footable-0.1.css" rel="stylesheet" type="text/css">
		<link href="<%=request.getContextPath()%>/bootstrap/css/table-res.css" rel="stylesheet" type="text/css">
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css" />
		<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/style.css" />
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
		<script src="<%=request.getContextPath()%>/bootstrap/js/modernizr.custom.63321.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/assets/js/jquery-2.2.3.min.js"></script>
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
<body onload="toggleEndt()">
<s:form id="Quotation" name="Quotation" method="post" action="" theme="simple">
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<s:actionerror cssStyle="color: red;" />
	</div>
</div>
<div class="row">
	
	
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="document Info" />
			</div>
			<div class="panel-body">
				 <div class="row">
				 	<s:if test='"draft".equals(reqFrom)'>
				 	<div class="col-md-3 ">
				    	 <button type="button"  class="btn btn-block btn-sm btn-danger"  data-toggle="modal" data-target="#CSIFrame"  onclick="getSchedule('<s:property value='quoteno'/>','<s:property value='polNo'/>','draft');"  tabindex="1"> <s:text name="Original"/> </button>
				     </div>
				 	</s:if>
				 	<s:else>
				     <div class="col-md-3 ">
				    	 <button type="button"  class="btn btn-block btn-sm btn-info"  data-toggle="modal" data-target="#CSIFrame"  onclick="getSchedule('<s:property value='quoteno'/>','<s:property value='polNo'/>','schedule');"  tabindex="1"> <s:text name="Original"/> </button>
				     </div>
				    <%--  <div class="col-md-3 ">
				    	 <button type="button"  class="btn btn-block btn-sm btn-warning"  data-toggle="modal" data-target="#CSIFrame"  onclick="getSchedule('<s:property value='quoteno'/>','<s:property value='polNo'/>','schedule');"  tabindex="1"> <s:text name="Duplicate"/> </button>
				     </div>
				     <div class="col-md-3 ">
				    	 <button type="button"  class="btn btn-block btn-sm btn-primary"  data-toggle="modal" data-target="#CSIFrame"  onclick="getSchedule('<s:property value='quoteno'/>','<s:property value='polNo'/>','schedule');"  tabindex="1"> <s:text name="Copy"/> </button>
				     </div> --%>
				     <div class="col-md-3 ">
				    	 <button type="button"  class="btn btn-block btn-sm btn-primary"  data-toggle="modal" data-target="#CSIFrame"  onclick="getSchedule('<s:property value='quoteno'/>','<s:property value='polNo'/>','portalPdf');"  tabindex="1"> <s:text name="Portal Schedule"/> </button>
				     </div>
				     <%-- <div class="col-md-3 ">
				     	<button type="button"  class="btn btn-block btn-sm btn-warning"  data-toggle="modal" data-target="#CSIFrame"  onclick="getSchedule('<s:property value='quoteno'/>','<s:property value='polNo'/>','debit');"  tabindex="1"><s:text name="debit"/> </button>
				     </div>
				     <div class="col-md-3 ">
				     	<button type="button"  class="btn btn-block btn-sm btn-primary"  data-toggle="modal" data-target="#CSIFrame"  onclick="getSchedule('<s:property value='quoteno'/>','<s:property value='polNo'/>','credit');"  tabindex="1"> <s:text name="Credit"/> </button>&nbsp;&nbsp;&nbsp;
				     </div> --%>
				     </s:else>
				 </div>   
					
						
						
						
						
				
			 	
			</div>
		</div>
	</div>
	
	
	
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<br/>
			<div class="row" align="center">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<input type="button" value="Close"  onclick="window.close();" class="btn btn-sm btn-danger">&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			<br/>
		</div>
	</div>
</div>
			

</s:form>
<script type="text/javascript">
function getSchedule(val,policyNo,type) {
	<%-- var URL ='<%=request.getContextPath()%>/Copyofinformation.jsp?policyMode=schedule&policynumber='+val; --%>
	<%-- var URL ='<%=request.getContextPath()%>/documentpdfReport.action?quoteNo='+val+'&policyNo='+policyNo+'&docType='+type; --%>
	var quoteNo=window.btoa(val);
	var docType=window.btoa(type);
	var policy=window.btoa(policyNo);
	var URL ='<%=request.getContextPath()%>/documentpdfReport.action?quoteNo='+quoteNo+'&policyNo='+policy+'&docType='+docType;
	var bwidth = window.innerWidth;
	var bwidth1 = document.body.clientWidth;
	if(bwidth <= 768) {
		return popUp(URL,bwidth1,'500');
	} else {
		return popUp(URL,'750','500');
	}
}
function popUp(url,w,h)
{
	var windowName = "PolicyView";
		 var width  = screen.availWidth;
		 var height = screen.availHeight;
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
		var strOpen = window.open (url, windowName, features);
		strOpen.focus();
		return false;
}

</script>	
</body>
</html>