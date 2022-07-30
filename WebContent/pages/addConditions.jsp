<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
       <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="keywords" content="Maan Sarovar, Sea Trans, Marine Insurance">	
	<meta name="author" content="">
	<title> ::: AlRajhi - Add Clauses ::: </title>
	<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/AlRajhi_icon_header.jpg" />		
	<script type="text/javascript" src="js/common.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css" />
	<link href="<%=request.getContextPath()%>/bootstrap/css/style.css" rel="stylesheet" type="text/css" />	
</head>
<body>
<s:form name="conditions" theme="simple">
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<s:actionerror cssStyle="color: red;" />
	</div>
</div>
<br/>
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="%{'conditions'+conditionType}" />
			</div>
			<div class="panel-body">
				<s:if test="conditions.size > 0">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<table class="footable" width="100%;">
							<tbody>
							<s:iterator value="conditions" var="conditons">
								<tr>
									<td width="10%" align="center"><s:checkbox name="%{#conditons.CODE}" id="%{#conditons.CODE}" fieldValue="%{#conditons.CODE}" value="false"/> </td>
									<td width="90%"><s:textarea name="condition%{#conditons.CODE}" id="condition%{#conditons.CODE}" value="%{#conditons.CODE_DESC}" cols="90" rows="2" cssClass="inputBoxA" cssStyle="width: 100%;" /></td>
								</tr>
							</s:iterator>
							</tbody>
						</table>
					</div>
				</div>
				<br class="clear" />
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
						<input type="button" name="Image4" id="Image4" value="Close" border="0" class="btn btn-sm btn-danger" onclick="javascript:window.close();"> &nbsp;&nbsp;&nbsp;
						<a href="#" onClick="return Submit('<s:property value="%{conditionType}"/>')" class="btn btn-sm btn-success" > Submit </a>
					</div>
				</div>
				</s:if>
				<s:else>
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
						<span class="label label-danger" > Nothing found to display </span>
					</div>
				</div>
				</s:else>
			</div>
		</div>
	</div>
</div>
</s:form>
<script type="text/javascript">
function Submit(type)
{
	var elements=document.conditions.elements;
	var conditions='';
	for (var int = 0; int < elements.length; int++) 
	{
		var obj=elements[int];
		if(obj.type=='checkbox' && obj.checked)
		{
			conditions+='#'+obj.value+'~'+document.getElementById('condition'+obj.name).value;
		}
	}
	if(type=='1'){
		window.opener.premiumInfo.addClauses.value=conditions;
	}else if(type=='2'){
		window.opener.premiumInfo.addWarClauses.value=conditions;
	}else if(type=='3'){
		window.opener.premiumInfo.addExclusions.value=conditions;
	}else if(type=='4'){
		window.opener.premiumInfo.addWarranties.value=conditions;
	}
	window.close();
	return false;
}
setValues('<s:property value="%{conditionType}"/>');
function setValues(type)
{
		try{
		var obj;
		if(type=='1'){
			obj=window.opener.premiumInfo.addClauses;
		}else if(type=='2'){
			obj=window.opener.premiumInfo.addWarClauses;
		}else if(type=='3'){
			obj=window.opener.premiumInfo.addExclusions;
		}else if(type=='4'){
			obj=window.opener.premiumInfo.addWarranties;
		}
		if(obj && obj.value.length>0){
			var conditions=obj.value;
			if(conditions.indexOf('#')!=-1){
				var array=conditions.split('#');
				for ( var int = 0; int < array.length; int++) {
					var condition=array[int].split('~');
					var obj2=document.getElementById('condition'+condition[0]);
					if(obj2){
						document.getElementById(condition[0]).checked=true;
						obj2.value=condition[1];
					}
				}
			}else{
				var condition=obj.value.split('~');
				var obj2=document.getElementById('condition'+condition[0]);
				if(obj2){
					document.getElementById(condition[0]).checked=true;
					obj2.value=condition[1];
				}
			}
		}
		}catch(e){
		 alert("Error: " + e.name+ ". Error description: " + e.description+ ". Error number: " + e.number);	
	}
}
</script>
</body>
</html>