<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<style type="text/css">
section.content {
    margin: 100px 15px 0 15px;
}

  
</style>

<s:form name="ProductSelection" id="ProductSelection" action="" theme="simple">
 	<div id="productspanel"></div>
 	  
<s:hidden name="loginId" />
<s:hidden name="loginType" />
<s:hidden name="b2cType" />
<s:hidden name="selectProd" />
<s:hidden name="schemeId" />
<s:hidden name="contenTypeId" />
<s:hidden name="menuType" />
<s:hidden name="reqFrom" />
<s:hidden name="productId" />
<s:hidden name="product" />

<s:hidden name="usertype"  id="usertype" value="%{#session.usertype}"/>
<s:hidden name="isAdmin"  id="isAdmin" value='%{"admin".equalsIgnoreCase(#session.usertype)}'/>
<s:hidden name="isArabic" id="isArabic"></s:hidden>

</s:form>


<script type="text/javascript">

$(document).ready(function(){
	var $form = $("#ProductSelection");
	$.ajax({
		type : "POST",
		url :  "<%=request.getContextPath()%>/LoginproductSelection",		 
		processData: false, 
		data : $form.serialize(),
		success : function(result) {
	 		
	 		loadPanelFrom(result.productList);
		},
		error : function(error) {
		 
		}
	});
});	 
function loadPanelFrom(obj){
	var usertype=$('#isAdmin').val();
	var adminMarineCnt=0;
	 $.each(obj, function( key, value ) {
			 
			 var content;
			 if(value.PRODUCT_ID=='65'){
				 content=loadMotorContent(value);
			 }else if(value.PRODUCT_ID=='30'){
				 content=loadMotorContent(value); 
			 }else if(value.PRODUCT_ID=='33'){
				 content=loadTravenContent(value);
			 }else if(adminMarineCnt==0 && ('3'==value.PRODUCT_ID || '11'==value.PRODUCT_ID)){
				 if(usertype==true || usertype=='true'){
				 	adminMarineCnt=adminMarineCnt+1;
				 }
				 content=loadMarineContent(value)
			 }
			 $("#productspanel").append(content);
	 }); 
}
function loadMotorContent(obj){
	var usertype=$('#isAdmin').val();
	var content='';
	content+='<div class="col-md-4">';
	content+='<div class="panel panel-primary">';
	content+='<div class="panel-body" style="padding: 0px;">';
	content+='<h3 class="text-primary" align="center" > <s:text name="policyInfo.motorInsurance" /> </h3>';
	content+='<img alt="Car Insurance" src="<%=request.getContextPath()%>/images/car_insurance.jpg" width="100%" height="auto" />';																									    
	content+='<div class="row">';
	content+='<div class="col-xs-12">';
	content+='<div class="panel panel-default" style="border: 0px;">';
	content+='<div class="panel-body">';
	content+='<div class="row" style="background: #0A5676;">';
	content+='<div class="col-xs-12" style="padding: 5px;">';
	//content+='<span class="text-warning <s:if test="locale.language == 'ar'">pull-right</s:if><s:else>pull-left</s:else>" style="font-size: 18px; font-weight: 900; color: #FFFFFF;"><s:text name="label.starfrom" /> </span>';
	//content+='<span class="text-warning <s:if test="locale.language == 'ar'">pull-left</s:if><s:else>pull-right</s:else>" style="font-size: 36px; font-weight: 900; color: #FFFFFF;"><s:text name="label.b2c.420sar" /></span>';
	content+='</div>';
	content+='<div class="row">';
	if(usertype==true || usertype=='true'){
		content+='<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">';
		content+='<a class="btn btn-sm btn-warning" style="text-decoration: none;" href="#" onClick="getAdminHome('+obj.PRODUCT_ID+')"><s:text name="label.b2c.getdetails" /></a>';
		content+='</div>';
	}else{
	
		<s:if test='("ar".equals(#request_locale)) || "ar".equalsIgnoreCase(locale.language)'>
			content+='<div class="col-xs-12" align="center">';
			content+='<a class="btn btn-sm btn-warning" style="text-decoration: none; width:80%; height: 50px; line-height: 36px; font-size: 18px;" href="#" onClick=\'getProAR("'+obj.PRODUCT_ID+'","NEW","","'+obj.PRODUCT_ID+'","","'+0+'","","")\'><s:text name="label.b2c.getdetailsar" /></a>';
			content+='</div>';
		</s:if>
		<s:elseif test='"en".equals(#request_locale)  || "en".equalsIgnoreCase(locale.language)'>
			content+='<div class="col-xs-12" align="center">';
			content+='<a class="btn btn-sm btn-warning" style="text-decoration: none; width:80%; height: 50px; line-height: 36px; font-size: 18px;" href="#" onClick=\'getPro("'+obj.PRODUCT_ID+'","NEW","","'+obj.PRODUCT_ID+'","","'+0+'","","")\'><s:text name="label.b2c.getdetails" /></a>';
			content+='</div>';
		</s:elseif> 			
		<s:else>
			content+='<div class="col-xs-6" align="center">';
			content+='<a class="btn btn-sm btn-warning" style="text-decoration: none; width:80%; height: 50px; line-height: 36px; font-size: 18px;" href="#" onClick=\'getPro("'+obj.PRODUCT_ID+'","NEW","","'+obj.PRODUCT_ID+'","","'+0+'","","")\'><s:text name="label.b2c.getdetails" /></a>';
			content+='</div>';
			content+='<div class="col-xs-6" align="center">';
			content+='<a class="btn btn-sm btn-warning" style="text-decoration: none; width:80%; height: 50px; line-height: 36px; font-size: 18px;" href="#" onClick=\'getProAR("'+obj.PRODUCT_ID+'","NEW","","'+obj.PRODUCT_ID+'","","'+0+'","","")\'><s:text name="label.b2c.getdetailsar" /></a>';
			content+='</div>';
		</s:else>
 
		
		//content+='<div class="col-xs-6" align="center">';
		//content+='<a class="btn btn-sm btn-danger" style="text-decoration: none; width:80%; height: 50px; line-height: 36px; font-size: 18px;" href="<%=request.getContextPath()%>/Motorcancel.action">Cancel Request</a>';
		//content+='</div>';
	} 
	content+='</div>';
	content+='</div>';
	content+='<div class="row">';
	content+='<div class="col-xs-12">';
	content+='<ul class="listBullet">';
	content+='<li><s:text name="label.point1" /></li>';
	content+='<li><s:text name="label.point2" /></li>';
	content+='<li><s:text name="label.point3" /></li>';
	content+='<li><s:text name="label.point4" /></li>';
	content+='<li><s:text name="label.point5" /></li>';
	content+='<li><s:text name="label.point6" /></li>';
	content+='</ul>';
	content+='</div>';
	content+='<span class="col-xs-12" style="color: #FF0000;"><s:text name="label.point7" /></span>';
	<s:if test='"guestmotor".equalsIgnoreCase(loginId)'>
		content+='<div class="col-xs-12" align="right">';
		content+='<span><s:text name="label.cancel.clickpolicy" />';
		content+='<a style="color: #663399; font-style: italic;" href="#" onclick="getCancel(\'\');"><u><s:text name="label.cancel.cancelreq"/></u></a></span>';
		content+='<br class="clear"> <span>انقر لطلب ';
		content+='<a style="color: #663399; font-style: italic;" href="#" onclick="getCancel(\'ar\');"><u>إلغاء الوثيقة</u></a></span>';	content+='</div>';
		content+='</div>';
	</s:if>
	content+='</div>';
	content+='</div>';
	content+='</div>';
	content+='</div>';
	content+='</div>';
	content+='</div>';
	content+='</div>';
	return content;
}
function loadTravenContent(obj){
	var usertype=$('#isAdmin').val();
	var content='';
	content+='<div class="col-md-4">';
	content+='<div class="panel panel-primary">';
	content+='<div class="panel-body" style="padding: 0px;">';
	content+='<h3 class="text-primary"  align="center" > '+obj.PRODUCT_NAME+' </h3>';
	content+='<img alt="Travel Insurance" src="<%=request.getContextPath()%>/images/travel_insurance.jpg" width="100%" height="auto" />';
	content+='<div class="row">';
	content+='<div class="col-xs-12">';
	content+='<div class="panel panel-default" style="border: 0px;">';
	content+='<div class="panel-body">';
	content+='<div class="row" style="background: #0A5676;">';
	content+='<div class="col-xs-12" style="padding: 5px;">';
	content+='<span class="text-warning pull-left" style="font-size: 18px; font-weight: 900; color: #FFFFFF;">Starting From</span>';
	content+='<span class="text-warning pull-right" style="font-size: 36px; font-weight: 900; color: #FFFFFF;">SAR 44</span>';
	content+='</div>';
	content+='<div class="row">';
	if(usertype==true || usertype=='true'){
		content+='<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">';
		content+='<a class="btn btn-sm btn-warning" style="text-decoration: none;" href="#" onClick="getAdminHome('+obj.PRODUCT_ID+')">GET DETAILS</a>';
		content+='</div>';
	}else{
	content+='<div class="col-xs-12" align="center">';
	content+='<a class="btn btn-sm btn-warning" style="text-decoration: none; width:50%; height: 50px; line-height: 36px; font-size: 18px;" href="#" onClick="getPro('+obj.PRODUCT_ID+',\'NEW\',\'\','+obj.PRODUCT_ID+',\'\',\'0\',\'\',\'\')">Get a Quote</a>';
	content+='</div>';																        	
	}
	content+='</div>';
	content+='</div>';
	content+='<div class="row">';
	content+='<div class="col-xs-12" align="left">';
	content+='<ul class="listBullet">';
	content+='<li>	Cancellation</li>';
	content+='<li>	Curtailment</li>';
	content+='<li>	Missed Departure</li>';
	content+='<li>	Personal Accident</li>';
	content+='<li>Medical Emergency Expenses</li>';
	content+='<li>Medical Inconvenience Benefit</li>';
	content+='<li>Personal Property</li>';
	content+='<li>Personal Public Liability</li>';
	content+='</ul>';
	content+='</div>';
	content+='</div>';
	content+='</div>';
	content+='</div>';
	content+='</div>';
	content+='</div>';
	content+='</div>';
	content+='</div>';
	content+='</div>';
	return content;
}
function loadMarineContent(obj){
	var usertype=$('#isAdmin').val();
	var content='';
	
	content+='<div class="col-md-4">';
	content+='<div class="panel panel-primary">';
	content+='<div class="panel-body" style="padding: 0px;">';
	content+='<h3 class="text-primary"  align="center" >';
	
	if(usertype==true || usertype=='true'){
		content+='MARINE INSURANCE';
	}else
		content+=obj.PRODUCT_NAME;
	content+='</h3>';
	content+='<img alt="Marine Insurance" src="<%=request.getContextPath()%>/images/marine_insurance.jpg" width="100%" height="auto" />';
	content+='<div class="row">';
	content+='<div class="col-xs-12">';
	content+='<div class="panel panel-default" style="border: 0px;">';
	content+='<div class="panel-body">';
	content+='<div class="row">';
	if(usertype==true || usertype=='true'){
		content+='<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">';
		content+='<a class="btn btn-sm btn-warning" style="text-decoration: none;" href="#" onClick="getAdminHome('+obj.PRODUCT_ID+')">GET DETAILS</a>';
		content+='</div>';
	}else{
	content+='<div class="col-md-6">';
	content+='<a class="btn btn-sm btn-warning" style="text-decoration: none;" href="#" onClick="getPro(\''+obj.PRODUCT_ID+'\',\'NEW\',\'\',\''+obj.PRODUCT_ID+'\',\'\',\'0\',\'\',\'\')">Get a Quote</a>';
	content+='</div>';
	content+='<div class="col-md-6">';
	content+='<a href="#" class="btn btn-sm btn-default"> Learn More </a>';
	content+='</div>';
	}
	content+='</div>';
	content+='<div class="row">';
	content+='<div class="col-xs-12" align="left">';
	content+='<ul class="listBullet">';
	content+='<li> Issuing the repair approval within 48 hours</li>';
	content+='<li> Tracking claims electronically</li>';
	content+='<li> Instant submission of vehicles information to traffic Dept. Electronic data base</li>';
	content+='<li> Fast bank transfer of the indemnity payment</li>';
	content+='<li> Claims tracking by SMS</li>';
	content+='<li> Fast response at the claim center (Benefits, Extensions, Client indemnification, Third party liability)</li>';
	content+='</ul>';
	content+='</div>';
	content+='</div>';
	content+='</div>';
	content+='</div>';
	content+='</div>';
	content+='</div>';
	content+='</div>';
	content+='</div>';
	content+='</div>';
	return content;
}

function getPro(pid,mod,dtdiff,homepid,qopt,tpid,officeScheme,OFSName) {
	if(pid=='3') {
		document.ProductSelection.selectProd.value=pid;
		document.ProductSelection.menuType.value='CHART';
		document.ProductSelection.reqFrom.value='PS';
		document.ProductSelection.productId.value=pid;
		document.ProductSelection.action ="<%=request.getContextPath()%>/initReport.action";
		document.ProductSelection.submit();
	} else if(pid=='11') {
		document.ProductSelection.selectProd.value=pid;
		//document.ChooseProduct.QuoteOpt.value=qopt;
		document.ProductSelection.action ="<%=request.getContextPath()%>/ViewOpenCovers.jsp";
		document.ProductSelection.submit();
	} else if(pid=='31'||pid=='32'||pid=='33'||pid=='34'||pid=='41' || pid=='65' || pid=='30') {
		document.ProductSelection.selectProd.value=pid;
		if(pid=='30') {
			document.ProductSelection.schemeId.value=officeScheme;
			document.ProductSelection.contenTypeId.value=tpid;
		}
		document.ProductSelection.menuType.value='CHART';
		document.ProductSelection.reqFrom.value='PS';
		document.ProductSelection.productId.value=pid;
		document.ProductSelection.product.value=pid;
		document.ProductSelection.action ="<%=request.getContextPath()%>/LoginportalLogin.do?request_locale=en";
		document.ProductSelection.submit();
	}
	return false;
}

function getProAR(pid,mod,dtdiff,homepid,qopt,tpid,officeScheme,OFSName) {		
		document.ProductSelection.selectProd.value=pid;
		document.ProductSelection.menuType.value='CHART';
		document.ProductSelection.reqFrom.value='PS';
		document.ProductSelection.productId.value=pid;
		document.ProductSelection.product.value=pid;
		document.ProductSelection.action ="<%=request.getContextPath()%>/LoginportalLogin.do?request_locale=ar";
		document.ProductSelection.isArabic.value='ar';		
		document.ProductSelection.submit();
	return false;
}


function getAdminHome(productId) {
	document.ProductSelection.product.value=productId;
	document.ProductSelection.action ="<%=request.getContextPath()%>/homeAdmin.action";
	document.ProductSelection.submit();
}

function getCancel(val) {
	document.ProductSelection.isArabic.value=val;
	var req='request_locale=en';
	if(val=='ar')
		req='request_locale=ar';
	document.ProductSelection.action ="<%=request.getContextPath()%>/Motorcancel.action?"+req;
	document.ProductSelection.submit();
}

</script>