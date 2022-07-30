 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/demo.css" /> 
	<link href="<%=request.getContextPath()%>/bootstrap/css/footable-0.1.css" rel="stylesheet" type="text/css">
	<link href="<%=request.getContextPath()%>/bootstrap/css/table-res.css" rel="stylesheet" type="text/css">
	<link href="<%=request.getContextPath()%>/bootstrap/css/easy-responsive-tabs.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datepicker/datetimepicker/jquery.datetimepicker.min.css"/> 
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css" />
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/style.css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
	<script src="<%=request.getContextPath()%>/bootstrap/js/modernizr.custom.63321.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/bootstrap/js/jquery-1.9.1.min.js"></script>
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/select2.css" rel="stylesheet"/>
	
<!-- my css-->

<link rel="stylesheet" type="text/css" href="assets/css/main.css">
<link rel="stylesheet" type="text/css" href="assets/css/fair-j.css">
<!-- my end css -->

<!-- Site Icons -->

<!-- Bootstrap CSS -->
<!-- <link rel="stylesheet" href="assets/css/bootstrap.min.css"> -->
<!-- Site CSS -->
<link rel="stylesheet" href="host_fair.css"> 
<!-- Colors CSS -->
<link rel="stylesheet" href="assets/css/colors.css">
<!-- ALL VERSION CSS -->
<link rel="stylesheet" href="assets/css/versions.css">
<!-- Responsive CSS -->
<link rel="stylesheet" href="assets/css/responsive.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="assets/css/custom.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/bootstrap/js/jquery.slimmenu.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/bootstrap/js/jquery.easing.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/bootstrap/js/easy-responsive-tabs.js"></script>	
<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap-datepicker.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap-multiselect.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap-3.2.0.min.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/bootstrap/js/select2.js"></script>
<script src="<%=request.getContextPath()%>/datepicker/datetimepicker/jquery.datetimepicker.js"></script>
<script src="<%=request.getContextPath()%>/bootstrap/js/app-js.js" type="text/javascript"></script>
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
<script language="javascript">
	NS = document.layers? 1:0;

	function moveAll(input,out) {
		for(k=0; k < out.options.length; k++) { 
			out.options[k] = new Option(out.options[k].text,out.options[k].value); 
		} 
		j = k;
		for(i=1; i < input.options.length; i++) { 
			out.options[k] = new Option(input.options[i].text,input.options[i].value);
			k++;
		} 
		out.length =k; 
		input.length = 1;
		if (NS) {  
		   history.go(0);  
		}
	}


	function add(input,out) { 
		//alert("SKRTEST"+"----------Input"+input+"------------Out"+out);

      	var selLen = out.options.length; 
        var availLen = 0;

        for(k=0; k < out.options.length; k++) { 
            out.options[k] = new Option(out.options[k].text,out.options[k].value); 
        } 
        j = k;
		input.options[availLen++] = new Option(input.options[0].text,input.options[0].value); 
			
        for(i=1; i < input.options.length; i++) { 
			if(input.options[i].selected) { 
				out.options[j++] = new Option(input.options[i].text,input.options[i].value); 
				selLen++;
			} 
			else { 
				input.options[availLen++] = new Option(input.options[i].text,input.options[i].value); 
			}
        }
        input.length = availLen; 
        out.length = selLen; 
        if (NS) {  
			history.go(0);  
        }
	}
	
	function moveContinent(input, out, countryList) {
		for(j=1; j < input.options.length; j++) {
			input.options[j].selected = false;
		}
		var res = countryList.split("~");
		for(i=0 ; i < res.length ; i++) {
			for(j=1; j < input.options.length; j++) {
				var inputOption = input.options[j].value.split("~");
				if(inputOption[0]==res[i]) {
					input.options[j].selected = true;
				}
			}
		}
		add(input,out);
	}


	function move(input,out,value) {
		var selLen = out.options.length;
		var availLen = 0;
		
		for(k=0; k < out.options.length; k++) { 
            out.options[k] = new Option(out.options[k].text,out.options[k].value); 
			
        } 
        j = k;
		input.options[availLen++] = new Option(input.options[0].text,input.options[0].value); 

		for(i=1; i < input.options.length; i++) { 
			if(input.options[i].value == value) { 
				out.options[j++] = new Option(input.options[i].text,input.options[i].value); 
				selLen++;
			} 
			else { 
				input.options[availLen++] = new Option(input.options[i].text,input.options[i].value); 
			}
        }
		input.length = availLen; 
        out.length = selLen; 
        if (NS) {  
			history.go(0);  
        }
	}
	

	function validate() {
		var docname = document.saleform;
		var statesList;
		var length = docname.rightSide.options.length;
		if (length < 2) {
			alert("Please select a state to proceed further.");
			return;
		}
		var statesList = docname.rightSide[1].value;
		for(i = 2; i < docname.rightSide.options.length; i++) {
			statesList += "," + docname.rightSide[i].value;
		}
		docname.statesList.value = statesList;
		docname.submit();
	}
</script>
<s:form id="saleform" name="saleform" method="post" action="getQuoteQuotation.action" theme="simple">
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<s:actionerror cssStyle="color: red;" />
	</div>
</div>
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading" align="center">
			<s:text name="Value Basis [ Multiple Selection ]"></s:text>
			</div>
			<div class="panel-body">
				<div class="row">
			 		<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5"  align="center">
				 			<s:if test='includeList!=null && includeList.size()>0 '>
				 			<s:select name="leftSide" id="leftSide" list="includeList" listKey="Code" listValue="SaleTermName" headerValue="--- Available Value Basis ---" headerKey=""   multiple="true"  cssStyle="height:300px;width:200px"></s:select>
				 			</s:if>
				 			<s:elseif test="excludeList!=null && excludeList.size()>0 ">
				 			<s:select name="leftSide" id="leftSide" list="#{}"  headerValue="--- Available Value Basis ---" headerKey=""   multiple="true"  cssStyle="height:300px;width:250px"></s:select>
				 			</s:elseif>
				 			<s:else>
			 				<s:select name="leftSide" id="leftSide" list="saleTermList" listKey="Code" listValue="SaleTermName" headerValue="--- Available Value Basis ---" headerKey=""   multiple="true"  cssStyle="height:300px;width:200px"></s:select>
			 			</s:else>
			 		</div>
				 	<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2" align="center">
				 	<br/><br/>
			 				<input type="button" name="button3" value="  >  "  class="btn btn-sm btn-info" style="cursor: pointer;" onClick="javascript:add(document.saleform.leftSide,document.saleform.rightSide);"    >
								<br class="clear"/>
								<br class="clear"/>
								<input type="button" name="button4" value="  <  "  class="btn btn-sm btn-info" style="cursor: pointer;" onClick="javascript:add(document.saleform.rightSide,document.saleform.leftSide);"     >
								<br class="clear"/>
								<br class="clear"/>
								<input type="button" name="button1" value=" >> "   class="btn btn-sm btn-info" style="cursor: pointer;" onClick="javascript:moveAll(document.saleform.leftSide,document.saleform.rightSide);" >
								<br class="clear"/>
								<br class="clear"/>
								<input type="button" name="button2" value=" <<  "   class="btn btn-sm btn-info" style="cursor: pointer;" onClick="javascript:moveAll(document.saleform.rightSide,document.saleform.leftSide);" >
			 		</div>
			 		<div class="col-xs-5 col-sm-5 col-md-5 col-lg-5"  align="center">
				 		<s:if test='excludeList!=null && excludeList.size()>0 '>
				 			<s:select name="rightSide" id="rightSide" list="excludeList" listKey="Code" listValue="SaleTermName" headerValue="--- Selected Value Basis ---" headerKey=""   multiple="true"  cssStyle="height:300px;width:200px"></s:select>
				 			</s:if>
				 			<s:else>	
			 				<s:select name="rightSide" id="rightSide" list="#{ }" headerValue="--- Selected Value Basis ---" headerKey=""   multiple="true"  cssStyle="height:300px;width:200px"></s:select>
			 			</s:else>
			 		</div>
				</div>
				
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
						<button type="button" name="close" class="btn btn-danger btn-oval" data-dismiss="modal">Close</button>
						<input type="button" value="Submit" id="saletermbtn" onclick="fnsaleSubmit()" class="btn btn-sm btn-success">
					</div>
					
				</div>
				</div>
			</div>
		</div>
	</div>

<s:hidden name="proposalNo" id="proposalNo" />
<s:hidden name="identify" id="identify"/>
<s:hidden name="saletermId" id="saletermId"/>
<s:hidden name="saleTermName" id="saleTermName"/>

</s:form>
<script type="text/javascript">

function fnsaleSubmit()
{
	if(document.Quotation.chkProposalNo.value == document.saleform.proposalNo.value)
	{
		if(document.saleform.rightSide.options.length<=1)
		{
			alert("Please select value Basis");
		}
		else
		{
			var stNames="";
			var ids="";
			var val="";
			var count=0;
			
			var rightlength	=	document.saleform.rightSide.length;

			for(i = 1; i < document.saleform.rightSide.options.length; i++) 
			{
				count++;
				var val	=0;
				val=document.saleform.rightSide.options[i].value;
				
				stNames=stNames+","+(val.substr(0,val.indexOf(',')));
				ids=ids+","+(val.substr(val.indexOf(',')+1,val.length));
			}
					
			ids=ids.substr(1,ids.length);
			stNames=stNames.substr(1,stNames.length);
			document.saleform.saleTermName.value=stNames;
			document.saleform.saletermId.value=ids;
			//document.saleform.action = 'saveSaletermOpenCover.action';
			//document.saleform.submit();
			postFormRequest('saveSaletermOpenCover.action','saletermSelectionAjaxId','saleform');
			$("#saletermbtn").attr("data-dismiss","modal");
		}
	} // chkProposalNo if
	else
	{
		alert("please close the value Basis selection window and open again");
		$("#saletermbtn").attr("data-dismiss","modal");
	}
}
function postFormRequest(strUrl, id, formId) {
    $.ajax({
		url : strUrl,
		type : "POST",
		data : $("#" + formId).serialize(),
		error : function() {
			$('#' + id).html('<p>An error has occurred in jquery Ajax</p>');
		},
		success : function(data) {
			$('#' + id).html(data);
		},
		beforeSend : function() {
			$('#loading').show();
			$('.ajaxLoader').show();
		},
		complete : function() {
			$('#loading').hide();
			$('.ajaxLoader').hide();
		}
	});
}
</script>	
</body>
</html>