<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
	<head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="keywords" content="Maan Sarovar, Sea Trans, Marine Insurance">	
		<meta name="author" content="">
		<title> ::: AlRajhi - City Selection ::: </title>
		<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/AlRajhi_icon_header.jpg" />	
		<script type="text/javascript" src="js/common.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css" />
		<link href="<%=request.getContextPath()%>/bootstrap/css/style.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.responsive.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.jqueryui.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.tableTools.css">
	<link href="<%=request.getContextPath()%>/dataTables/css/jquery-start-ui.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.jqueryui.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.responsive.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.tableTools.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery.dataTables.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/numeric-comma.js"></script>
		<style type="text/css">
		label {
			margin-left: 7px;
		}
		.citycard{
		width:100%;
		padding:12px;
		background-color:#f8f8ff;
		border-radius:10px;
		height:55px;
		 box-shadow: 0 1px 1px rgba(0,0,0,0.15), 
              0 2px 2px rgba(0,0,0,0.15), 
              0 4px 4px rgba(0,0,0,0.15), 
              0 8px 8px rgba(0,0,0,0.15);
		}
		.mt-1{
		 margin-top:6px;
		}
		p-1{
		 padding:3px;
		}
		
		
		
		</style>	
		<script type="text/javascript">
		
		function stopRKey(evt) { 
		  var evt = (evt) ? evt : ((event) ? event : null); 
		  var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null); 
		  if ((evt.keyCode == 13) && (node.type=="text"))  {return false;} 
		} 
		document.onkeypress = stopRKey; 
		
   		$(document).ready(function() {
		    $('table.display').dataTable( {
			        "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
			        responsive: true
			} );
		} );
   		</script>
	</head>
<body>
<div class="panel panel-primary">
			<div class="panel-body"> 
				<s:if test='countrySelect=="O"'>
					<s:form name="originCitySelection" id="originCitySelection" theme="simple">
						<div class="row">
							<s:iterator value="orgCityList" var="city">
					   			<div class="col-md-4 mt-1 p-1">
					   			    <div class="citycard">
					   				 <s:radio list="#{city}" name="cityName"  listKey="CODE" listValue="CODEDESC" title="%{#city.CODEDESC}" onclick="orgtoggleField('')" ></s:radio>
					   			    </div>
					   			</div>
							</s:iterator>
							
							
						</div>
						<div class="citycard mt-1" style="width:50%;height:auto;margin-top:8px;">
							<div class="row">
							    <div class="col-md-4" style="padding-top: 9px;">
								   <s:radio list="#{'9999':'Others'}" name="cityName" onclick="orgtoggleField('Others')" title="Others"/>
								</div>
								<div class="col-md-8">
								   <s:textfield id="otherOriginCity" maxlength="120" cssClass="inputBox"/>
								</div>
							</div>
						</div>	
						<br/>
						<div class="row" align="center">
				             <button type="button" name="close" class="btn btn-danger btn-oval" data-dismiss="modal">Close</button>
							 <button type="button" name="submit" id="ocitysum" class="btn btn-success btn-oval"  onclick="fnOrgcitySubmit()">Submit</button>
						</div>
						<br/>
						<script type="text/javascript">
							 setOriginValues();
							 function setOriginValues(){
								 try{
								 	var cityId=document.quotation.originCity.value;
								 	var elements=document.originCitySelection.elements;
								 	for ( var int = 0; int < elements.length; int++) {
										var obj=elements[int];
										if(obj.name=='cityName' && obj.value==cityId){
											obj.checked=true;
										}else if(cityId=="9999"){			
											obj.checked[cityId]=true;
											document.originCitySelection.otherOriginCity.value=document.quotation.originCityName.value
										}
									}
								 }catch(err){
									 console.log(err);
								 }
							 }
						</script>
					</s:form>
				</s:if>
				<s:elseif test='countrySelect=="D"'>
					<s:form name="destCitySelection" id="destCitySelection" theme="simple">
						<div class="row">
							<s:iterator value="destCityList" var="city">
								<div class="col-md-4 mt-1 p-1">
								   <div class="citycard">
									 <s:radio list="#{city}" name="cityName"  listKey="CODE" listValue="CODEDESC" title="%{#city.CODEDESC}" onclick="destoggleField('')" ></s:radio>
					   			   </div>
					   			</div>
							</s:iterator>
							
						</div>
						<div class="citycard mt-1" style="width:50%;height:auto;margin-top:8px;">
							<div class="row">
							    <div class="col-md-4" style="padding-top: 9px;">
								   	<s:radio list="#{'9999':'Others'}" name="cityName" onclick="destoggleField('Others')" title="Others"/>
								</div>
								<div class="col-md-8">
								   <s:textfield id="otherDestCity" maxlength="120" cssClass="inputBox"/>
								</div>
							</div>
						</div>	
						<br/>
						<div class="row" align="center">
				             <button type="button" name="close" class="btn btn-danger btn-oval" data-dismiss="modal">Close</button>
							  <button type="button" name="submit" id="dcitysum" class="btn btn-success btn-oval"  onclick="fnDestcitySubmit()">Submit</button>
						</div>
						<br/>
						<script type="text/javascript">
							setDestValues();
							 function setDestValues(){
								 try{
								 	var cityId=document.quotation.destCity.value;
								 	var elements=document.destCitySelection.elements;
								 	for ( var int = 0; int < elements.length; int++) {
										var obj=elements[int];
										if(obj.name=='destCityName' && obj.value==cityId){
											obj.checked=true;
										}else if(cityId=="9999"){			
											obj.checked[cityId]=true;
											document.destCitySelection.otherDestCity.value=document.quotation.destCityName.value
										}
									}
								 }catch(err){
									 console.log(err);
								 }
							 }
						</script>
					</s:form>
				</s:elseif>
			</div>
		</div>
<%-- <s:form name="citySelection" theme="simple" >
<div class="table0">
	<div class="tablerow">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:if test='countrySelect=="O"'>
					<s:label key="quotation.cityOfOrigin" />
				</s:if>
				<s:else>
					<s:label key="quotation.cityOfDest" />
				</s:else>
			</div> 
			<div class="panel-body">
				<div class="row">
					<s:if test='countrySelect=="O"'>
				      	<s:iterator value="orgCityList" var="city">
				      		<div class="textfield33">
				      			<s:radio list="#{city}" name="cityName"  listKey="CODE" listValue="CODEDESC" title="%{#city.CODEDESC}" onclick="toggleField('')" ></s:radio>
							</div>
		    	     	</s:iterator>
				     </s:if>
				     <s:else>
				     	<s:iterator value="destCityList" var="city">
				     		<div class="textfield33">
				     			<s:radio list="#{city}" name="cityName"  listKey="CODE" listValue="CODEDESC" title="%{#city.CODEDESC}" onclick="toggleField('')"></s:radio>
							</div>
		    	     	</s:iterator>
				     </s:else><br/>
				    <div class="textfield33">
				    	<s:radio list="#{'9999':'Others'}" name="cityName" onclick="toggleField('Others')" title="Others"/><s:textfield id="otherCity" maxlength="120" cssClass="inputBox"/>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="tablerow" align="center">
		 <button type="button" name="close" class="btn btn-danger btn-oval" data-dismiss="modal">Close</button>
		 <button type="button" name="submit" id="citysum" class="btn btn-success btn-oval"  onclick="fncitySubmit()">Submit</button>
		<s:hidden name="countrySelect"/>
	</div>
</div> 
</s:form> --%>
<script type="text/javascript">
<%--setValues();
function setValues() {
	var countrySelect=document.citySelection.countrySelect.value; 
	if(countrySelect=="O") {
		var cityId=document.quotation.originCity.value;
	} else if(countrySelect=="D") {
		var cityId=document.quotation.destCity.value;
	}  	 
 	var elements=document.citySelection.elements;
 	for ( var int = 0; int < elements.length; int++) {
		var obj=elements[int];
		if(obj.name=='cityName' && obj.value==cityId) {
			obj.checked=true;
		}
		else if(cityId=="9999") {			
			obj.checked[cityId]=true;
			if(countrySelect=="O") {
			document.citySelection.otherCity.value=document.quotation.originCityName.value
			} else {
				document.citySelection.otherCity.value=document.quotation.destCityName.value
			}
		}	
	}
}--%>
function orgtoggleField(value) {
	if(value=='Others') {
		document.getElementById('otherOriginCity').readOnly=false;
	}else{
		document.getElementById('otherOriginCity').readOnly=true;
	}
}
function destoggleField(value) {
	if(value=='Others') {
		document.getElementById('otherDestCity').readOnly=false;
	}else{
		document.getElementById('otherDestCity').readOnly=true;
	}
} 






</script>
</body>
</html>