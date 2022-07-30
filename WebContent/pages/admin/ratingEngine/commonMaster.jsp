<%@ page isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html <s:if test="locale.language == 'ar'">dir="rtl"</s:if> >
	<head>
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/font-awesome.min.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.responsive.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.jqueryui.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.tableTools.css" />
	<link href="<%=request.getContextPath()%>/dataTables/css/jquery-start-ui.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.jqueryui.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.responsive.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.tableTools.js"></script>
	<script type="text/javascript">
  	jQuery(function ($) {
  		try {
  			var data = $('#gridTable').dataTable( {
				"lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
				"order": [[ 1, "asc" ]],
				"columnDefs": [ {
		          "targets": 'no-sort',
		          "orderable": false
			    } ],
				responsive: true
			});
		} catch(err){}
	} );
  	</script>
	<script type="text/javascript" src="pages/admin/ratingEngine/menu.js"></script>
	
	<style>
#productId{
  width: 80%;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 5px;
  box-sizing: border-box;
}


</style>
	
	    <script>
        
		
		function reloadGridScheme() { 
            $.publish('reloadScheme');
        } 
        
		function funcedit(response, postdata){
   			var success = true;
   			var message = ""; 
   			if(response.responseText==''){
            	reloadGridScheme();
            	success = false;
            	message="success";
            }else{
	            var json = eval('(' + response.responseText + ')');
	            if(json.actionErrors){
	            	success = false;
	                for(i=0; i < json.actionErrors.length; i++){
	                	message += json.actionErrors[i] + '<br/>'; 
	                }
	            }
			}
			 return [success,message];
         } 
         $(function(){
    		$("#transID").change(function(e){
            var param = $(this).val(); 
            alert(param); 

         	});  
 		}); 
  
</script>

  <script type="text/javascript">
/* function edit_row(value)
{
//	alert(value);
	document.getElementById("productId["+value+"]").readOnly = false;
	document.getElementById("agencyCode["+value+"]").readOnly = false;
	
	document.getElementById("effid["+value+"]").hidden = true;
	document.getElementById("effectiveDate["+value+"]").hidden = false;
	document.getElementById("endid["+value+"]").hidden = true;
	document.getElementById("endDate["+value+"]").hidden = false;
	document.getElementById("status["+value+"]").hidden = true;
	document.getElementById("stat["+value+"]").hidden = false;
	
	
	var eff= document.getElementById("effectDate["+value+"]").value; 
	var res = eff.split("/");
    var effdate = res[2]+"-"+res[1]+"-"+res[0];
    
    var end= document.getElementById("endDateid["+value+"]").value; 
	var res1 = end.split("/");
    var enddate = res1[2]+"-"+res1[1]+"-"+res1[0];
	 //alert(eff+" "+effdate);
	 document.getElementById("effectiveDate["+value+"]").value=effdate;
	 document.getElementById("effectiveDate["+value+"]").hidden=false;
	 document.getElementById("endDate["+value+"]").value=enddate;
	 document.getElementById("endDate["+value+"]").hidden=false;
	
	document.getElementById("edit_button["+value+"]").style.display="none"; 
	 document.getElementById("update_button["+value+"]").hidden=false;
	 
	 var product = document.getElementById("productId["+value+"]");
	 var agency = document.getElementById("agencyCode["+value+"]");
	 var effDate = document.getElementById("effectiveDate["+value+"]");
	 var end_Date = document.getElementById("endDate["+value+"]");
	 var status = document.getElementById("status["+value+"]");
		
	 var product_data = document.getElementById("productId["+value+"]").value;
	 var agency_data = document.getElementById("agencyCode["+value+"]").value;
	 var effDate_data = document.getElementById("effectiveDate["+value+"]").value;
	 var end_Date_data = document.getElementById("endDate["+value+"]").value;
	 var status_data = document.getElementById("status["+value+"]").value; 
	 
	 var product_data=product.innerHTML;
	 var agency_data=agency.innerHTML;
	 var effDate_data=effDate.innerHTML;
	 var end_Date_data=end_Date.innerHTML;
	 var status_data=status.innerHTML;  
	 product.innerHTML="<input type='text' id='product_text"+value+"' value='"+product_data+"'>";
	 agency.innerHTML="<input type='text' id='agency_text"+value+"' value='"+agency_data+"'>";
	 effDate.innerHTML="<input type='text' id='effDate_text"+value+"' value='"+effDate_data+"'>";
	 end_Date.innerHTML="<input type='text' id='end_Date_text"+value+"' value='"+end_Date_data+"'>";
	 status.innerHTML="<input type='text' id='status_text"+value+"' value='"+status_data+"'>";    
	 
} 
function update_row(value,factorRateId){
	var productId = document.getElementById("productId["+value+"]").value;
	var agencyCode = document.getElementById("agencyCode["+value+"]").value;
	var effDate = document.getElementById("effectiveDate["+value+"]").value;
	var endDate = document.getElementById("endDate["+value+"]").value; 
	if (document.getElementById("statusActive["+value+"]").value!=null){
		status = document.getElementById("statusActive["+value+"]").value;
	}
	else{
		status = document.getElementById("statusDeactive["+value+"]").value;
	}
	alert(status);
	var url = 'updateFrequency.action?branchvalue='+branch+'&partnerName='+partner+'&freq='+freq+'&print='+print+"&rule="+rule+"&imdCde="+imdCode+"&clientCde="+clientCode+"&addrDispatch="+addressType+"&addressSpecified="+address+"&prefCourier="+prefCour+"&mode=imd&ajaxId=actionUpdateDivId";
	 postRequest(url,'actionUpdateDivId');
	document.getElementById("button["+value+"]").style.display="none";
}
function postRequest(strUrl, id){
	$.ajax({
		   url: strUrl,		   
		   error: function() {
		      $('#'+id).html('<p>An error has occurred in jquery Ajax</p>');
		   },		   
		   success: function(data) {
		      $('#'+id).html(data);
		   },
		   beforeSend : function(){
			   $('#loading').show();
			   $('.ajaxLoader').show();
           },
           complete : function(){
        	   $('#loading').hide();
        	   $('.ajaxLoader').hide();
           },
		   type: 'POST'
	});	
}
 
function save_row(no)
{
 var name_val=document.getElementById("name_text"+no).value;
 var country_val=document.getElementById("country_text"+no).value;
 var age_val=document.getElementById("age_text"+no).value;

 document.getElementById("name_row"+no).innerHTML=name_val;
 document.getElementById("country_row"+no).innerHTML=country_val;
 document.getElementById("age_row"+no).innerHTML=age_val;

 document.getElementById("delete_button"+no).style.display="block";
 document.getElementById("edit_button"+no).style.display="block";
 document.getElementById("save_button"+no).style.display="none";
} */
function lovGridcall(mode){
	var productId =document.getElementById('productId2').value;
	var itemtype = document.getElementById('itemType').value;
	 if (productId.length<=0) {
	    document.getElementById("demo").innerHTML = "Please Select ProductId";
	  } 
	 else if (itemtype.length<=0) {
	    document.getElementById("demo").innerHTML = "Please Select ItemType";
	  } 
	 else{
	//alert(itemtype);
	document.info.action="lovGridDataRating.action?mode=grid&menuType=lovmaster&itemType="+itemtype+"&productId2="+productId;
	document.info.submit();	
	 }
}
function ajaxcall(zone,id){
	//alert('asfbxdgdfsg');
	//postRequest("${pageContext.request.contextPath}/makeNameMakeModelMotor.action?bodyName="+value+"&makeName=<s:property value='makeName'/>","makeNameajx"); 
	postRequest("${pageContext.request.contextPath}/itemAjaxRating.action?productId2="+zone,id);
}
function postRequest(strUrl,id) {
	$.ajax( {
		url : strUrl,
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
		},
		type : 'POST'
	});
}
</script> 

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
			
			<div class="panel-heading">
				
					<s:property value="menuType" />
				
			</div>
			
			<div class="panel-body">
				<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#E5E5E5">
		      			<tr>
		        			<td bgcolor="#FFFFFF" style="padding:10px; background:#F8F8F8">
		        				<table width="100%">
		        				<s:if test = 'menuType!="lovmaster"'>
		        					<tr><td  style="color:red;font-size:15px;"><s:actionmessage/></td></tr> 
		        				</s:if>
							       	<tr><td height="15px" align="right">
							     
							       		 <s:if test='"constantdetail".equalsIgnoreCase(menuType)'>
							       			<a href="edit${menuType}Rating.action?mode=add&categoryID=${categoryID}">Add New</a>
							       		</s:if> 
							       		<s:elseif test = 'menuType=="lovmaster" && (mode.equals("grid"))'>
							       			<b style="font-size:15px;"><a href="editLovRating.action?mode=add&&productId2=<s:property value='productId2'/>&itemType=<s:property value='itemType'/>">Add New</a></b>
							       		</s:elseif>
							       		 <s:elseif test = 'menuType!="lovmaster" && menuType != "commodityratemaster" '>
							       			<b style="font-size:15px;"><a href="edit${menuType}Rating.action?mode=add&type=${menuType}">Add New</a></b>
							       		</s:elseif> 
							       		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							 		</td>					 		
							 		</tr>
							 		<tr><td bgcolor="#ffffff">
								 		<table width="100%" border="0" cellpadding="4" cellspacing="0">
									        <tr>
									        	<td width="100%">
									        		<s:url  var="editurl" action="editWsrccRating" />
									        		<table class="display responsive no-wrap" id="gridTable" width="100%" cellspacing="0">
									        			<thead>
															<tr>
																<th class="no-sort"></th>
																<s:if test = 'menuType=="conveyance"'>
																	<th><s:text name="CONVEY ID" /></th>
																	<th><s:text name="MODE OF TRANSPORT" /></th>
																	<th><s:text name="CONVEY NAME" /></th>
																	<th><s:text name="CONVEY RATE" /></th>
																	<th><s:text name="EFFECTIVE DATE" /></th>
																	<th><s:text name="STATUS" /></th>
																	<th><s:text name="EDIT" /></th>
																</s:if>
																<s:elseif test = 'menuType=="countrymaster"'>
																	<th><s:text name="COUNTRY ID" /></th>
																	<th><s:text name="COUNTRY NAME" /></th>
																	<th><s:text name="NATIONALITY NAME" /></th>
																	<th><s:text name="EFFECTIVE DATE" /></th>
																	<th><s:text name="STATUS" /></th>
																	<th><s:text name="EDIT" /></th>
																</s:elseif>
																<s:elseif test = 'menuType=="country"'>
																	<th><s:text name="COUNTRY ID" /></th>
																	<th><s:text name="COUNTRY NAME" /></th>
																	<th><s:text name="WAR RATE" /></th>
																	<th><s:text name="IMPORT" /></th>
																	<th><s:text name="EXPORT" /></th>
																	<th><s:text name="EFFECTIVE DATE" /></th>
																	<th><s:text name="STATUS" /></th>
																	<th><s:text name="EDIT" /></th>
																</s:elseif>
																<s:elseif test = 'menuType=="bankmaster"'>
																	<th><s:text name="BANK ID" /></th>
																	<th><s:text name="BANK NAME" /></th>
																	<th><s:text name="EFFECTIVE DATE" /></th>
																	<th><s:text name="STATUS" /></th>
																	<th><s:text name="EDIT" /></th>
																</s:elseif>
																<s:elseif test = 'menuType=="materialmaster"'>
																	<th><s:text name="MATERIAL ID" /></th>
																	<th><s:text name="MATERIAL NAME" /></th>
																	<th><s:text name="COVER NAME" /></th>
																	<th><s:text name="MATERIAL RATE" /></th>
																	<th><s:text name="EFFECTIVE DATE" /></th>
																	<th><s:text name="STATUS" /></th>
																	<th><s:text name="EDIT" /></th>
																</s:elseif>
																<s:elseif test = 'menuType=="commoditymaster"'>
																	<th><s:text name="COMMODITY ID" /></th>
																	<th><s:text name="COMMODITY NAME" /></th>
																	<th><s:text name="EFFECTIVE DATE" /></th>
																	<th><s:text name="STATUS" /></th>
																	<th><s:text name="EDIT" /></th>
																</s:elseif>
																<s:elseif test = 'menuType=="covercommomaster"'>
																	<th><s:text name="CATEGORY" /></th>
																	<th><s:text name="COVER NAME" /></th>
																	<th><s:text name="COVER DESCRIPTION" /></th>
																	<th><s:text name="COVER RATE" /></th>
																	<th><s:text name="CATEGORY RATE" /></th>
																	<th><s:text name="STATUS" /></th>
																	<th><s:text name="EDIT" /></th>
																</s:elseif>
																<s:elseif test = 'menuType=="categorymaster"'>
																	<th><s:text name="CATEGORY ID" /></th>
																	<th><s:text name="CATEGORY NAME" /></th>
																	<th><s:text name="CATEGORY RATE" /></th>
																	<th><s:text name="STATUS" /></th>
																	<th><s:text name="EDIT" /></th>
																</s:elseif>
																<s:elseif test = 'menuType=="warratemaster"'>
																	<th><s:text name="WAR ID" /></th>
																	<th><s:text name="WAR DESC" /></th>
																	<th><s:text name="WAR RATE" /></th>
																	<th><s:text name="TRANSPORT DESC" /></th>
																	<th><s:text name="EFFECTIVE DATE" /></th>
																	<th><s:text name="STATUS" /></th>
																	<th><s:text name="EDIT" /></th>
																</s:elseif>
																<s:elseif test = 'menuType=="packagemaster"'>
																	<th><s:text name="PACKAGE ID" /></th>
																	<th><s:text name="PACKAGE DESC" /></th>
																	<th><s:text name="PERCENT RATE" /></th>
																	<th><s:text name="TRANSPORT MODE" /></th>
																	<th><s:text name="STATUS" /></th>
																	<th><s:text name="EDIT" /></th>
																</s:elseif>
																<s:elseif test = 'menuType=="saletermmaster"'>
																	<th><s:text name="SALE TERM ID" /></th>
																	<th><s:text name="SALE TERM NAME" /></th>
																	<th><s:text name="SALE TERM VALUE" /></th>
																	<th><s:text name="STATUS" /></th>
																	<th><s:text name="EDIT" /></th>
																</s:elseif>
																<s:elseif test = 'menuType=="tolerancemaster"'>
																	<th><s:text name="TOLE ID" /></th>
																	<th><s:text name="TOLERANCE NAME" /></th>
																	<th><s:text name="TOLERANCE VALUE" /></th>
																	<th><s:text name="STATUS" /></th>
																	<th><s:text name="EDIT" /></th>
																</s:elseif>
																<s:elseif test = 'menuType=="commodityexcess"'>
																	<th><s:text name="COMEX ID" /></th>
																	<th><s:text name="START AMOUNT" /></th>
																	<th><s:text name="END AMOUNT" /></th>
																	<th><s:text name="DEDUCTIBLE" /></th>
																	<th><s:text name="RATE" /></th>
																	<th><s:text name="EFFECTIVE DATE" /></th>
																	<th><s:text name="STATUS" /></th>
																	<th><s:text name="EDIT" /></th>
																</s:elseif>
																<s:elseif test = 'menuType=="vesselmaster"'>
																	<th><s:text name="VESSEL ID" /></th>
																	<th><s:text name="VESSEL NAME" /></th>
																	<th><s:text name="VESSEL CLASS" /></th>
																	<th><s:text name="STATUS" /></th>
																	<th><s:text name="EDIT" /></th>
																</s:elseif>
																<s:elseif test = 'menuType=="settlingagent"'>
																	<th><s:text name="AGENT ID" /></th>
																	<th><s:text name="SETTLING AGENT NAME" /></th>
																	<th><s:text name="COUNTRY NAME" /></th>
																	<th><s:text name="STATUS" /></th>
																	<th><s:text name="EDIT" /></th>
																</s:elseif>
																<s:elseif test = 'menuType=="exchangemaster"'>
																	<th><s:text name="EXCHANGE ID" /></th>
																	<th><s:text name="CURRENCY TYPE" /></th>
																	<th><s:text name="EXCHANGE RATE" /></th>
																	<th><s:text name="STATUS" /></th>
																	<th><s:text name="EDIT" /></th>
																</s:elseif>
																<s:elseif test = 'menuType=="currencymaster"'>
																	<th><s:text name="CURRENCY ID" /></th>
																	<th><s:text name="CURRENCY TYPE" /></th>
																	<th><s:text name="SUB CURRENCY" /></th>
																	<th><s:text name="SHORT NAME" /></th>
																	<th><s:text name="STATUS" /></th>
																	<th><s:text name="EDIT" /></th>
																</s:elseif>
																<s:elseif test = 'menuType=="extracover"'>
																	<th><s:text name="EXTRA COVER ID" /></th>
																	<th><s:text name="EXTRA COVER NAME" /></th>
																	<th><s:text name="MODE OF TRANSPORT" /></th>
																	<th><s:text name="STATUS" /></th>
																	<th><s:text name="EDIT" /></th>
																</s:elseif>
																<s:elseif test = 'menuType=="modeoftransport"'>
																	<th><s:text name="MODE TRANSPORT ID" /></th>
																	<th><s:text name="MODE OF TRANSPORT" /></th>
																	<th><s:text name="STATUS" /></th>
																	<th><s:text name="EDIT" /></th>
																</s:elseif>
																<s:elseif test = 'menuType=="warrantymaster"'>
																	<th><s:text name="WARRANTY ID" /></th>
																	<th><s:text name="WARRANTY DESCRIPTION" /></th>
																	<th><s:text name="STATUS" /></th>
																	<th><s:text name="EDIT" /></th>
																</s:elseif>
																<s:elseif test ='"constantMaster".equalsIgnoreCase(menuType)'>
																	<th><s:text name="Category Id" /></th>
																	<th><s:text name="Category Name" /></th>																	
																	<th><s:text name="STATUS" /></th>
																	<th><s:text name="EDIT" /></th>
																	<th><s:text name="Detail" /></th>
																</s:elseif>
																<s:elseif test = 'menuType=="constantdetail"' >
																	<th><s:text name="CONSTANT ID" /></th>
																	<th><s:text name="DETAIL NAME" /></th>
																	<th><s:text name="STATUS" /></th>
																	<th><s:text name="EDIT" /></th>
																</s:elseif>
																<s:elseif test = 'menuType=="exclusionmaster"'>
																	<th><s:text name="EXCLUSION ID" /></th>
																	<th><s:text name="EXCLUSION NAME" /></th>
																	<th><s:text name="STATUS" /></th>
																	<th><s:text name="EDIT" /></th>
																</s:elseif>
																<s:elseif test = 'menuType=="citymaster"'>
																	<th><s:text name="CITY ID" /></th>
																	<th><s:text name="COUNTRY NAME" /></th>
																	<th><s:text name="CITY NAME" /></th>
																	<th><s:text name="STATUS" /></th>
																	<th><s:text name="EDIT" /></th>
																</s:elseif>
																<s:elseif test = 'menuType=="wsrcc"'>
																	<th><s:text name="WSRCC ID" /></th>
																	<th><s:text name="MODE OF TRANSPORT" /></th>
																	<th><s:text name="COVER" /></th>
																	<th><s:text name="WSRCC DESCRIPTION" /></th>
																	<th><s:text name="STATUS" /></th>
																	<th><s:text name="EDIT" /></th>
																</s:elseif>
																<s:elseif test = 'menuType=="covermaster"'>
																	<th><s:text name="COVER ID" /></th>
																	<th><s:text name="COVER NAME" /></th>
																	<th><s:text name="COVER RATE" /></th>
																	<th><s:text name="TRANSPORT DESCRIPTION" /></th>
																	<th><s:text name="STATUS" /></th>
																	<th><s:text name="EDIT" /></th>
																</s:elseif>
																<s:elseif test='menuType=="clause"'>
																	<th><s:text name="CLAUSE ID" /></th>
																	<th><s:text name="MODE OF TRANSPORT" /></th>
																	<th><s:text name="COVER" /></th>
																	<th><s:text name="CLAUSE DESCRIPTION" /></th>
																	<th><s:text name="STATUS" /></th>
																	<th><s:text name="EDIT" /></th>
																</s:elseif>
																<s:elseif test = 'menuType=="error"'>
																	<th><s:text name="ERROR ID" /></th>
																	<th><s:text name="ERROR DESCRIPTION" /></th>
																	<th><s:text name="STAGE NAME" /></th>
																	<th><s:text name="PRODUCT NAME" /></th>
																	<th><s:text name="STATUS" /></th>
																	<th><s:text name="EDIT" /></th>
																</s:elseif>
																<s:elseif test = 'menuType=="executivemaster"'>
																	<th><s:text name="EXECUTIVE ID" /></th>
																	<th><s:text name="EXECUTIVE NAME" /></th>
																	<th><s:text name="EFFECTIVE DATE" /></th>
																	<th><s:text name="STATUS" /></th>
																	<th><s:text name="EDIT" /></th>
																</s:elseif>
															</tr>
														</thead>
														<tbody>
															<s:iterator value="gridList" status="stat" var="report">
																<tr>
																	<td></td>
																	<s:if test = 'menuType=="conveyance"'>
																		<td><s:property value="conveyID"/></td>
																		<td><s:property value="transDesc" /></td>
																		<td><s:property value="conveyName" /></td>
																		<td><s:property value="conveyRate" /></td>
																		<td><s:property value="eff_date" /></td>
																		<td><s:property value="status" /></td>
																		<td align="center">
																			<a href='<%=request.getContextPath()%>/editconveyanceRating.action?mode=edit&conveyID=<s:property value="edit"/>'>Edit</a>
																		</td>
																	</s:if>
																	<s:elseif test = 'menuType=="countrymaster"'>
																		<td><s:property value="countryID" /></td>
																		<td><s:property value="countryName" /></td>
																		<td><s:property value="countryNat" /></td>
																		<td><s:property value="eff_date" /></td>
																		<td><s:property value="status" /></td>
																		<td align="center">
																			<a href='<%=request.getContextPath()%>/editcountrymasterRating.action?mode=edit&countryID=<s:property value="edit"/>'>Edit</a>
																		</td>
																	</s:elseif>
																	<s:elseif test = 'menuType=="country"'>
																		<td><s:property value="countryDetID" /></td>
																		<td><s:property value="countryID" /></td>
																		<td><s:property value="warRate" /></td>
																		<td><s:property value="startPlace" /></td>
																		<td><s:property value="endPlace" /></td>
																		<td><s:property value="eff_date" /></td>
																		<td><s:property value="status" /></td>
																		<td align="center">
																			<a href='<%=request.getContextPath()%>/editcountryRating.action?mode=edit&countryDetID=<s:property value="edit"/>'>Edit</a>
																		</td>
																	</s:elseif>
																	<s:elseif test = 'menuType=="bankmaster"'>
																		<td><s:property value="bankID" /></td>
																		<td><s:property value="bankName" /></td>
																		<td><s:property value="eff_date" /></td>
																		<td><s:property value="status" /></td>
																		<td align="center">
																			<a href='<%=request.getContextPath()%>/editbankmasterRating.action?mode=edit&bankID=<s:property value="edit"/>'>Edit</a>
																		</td>
																	</s:elseif>
																	<s:elseif test = 'menuType=="materialmaster"'>
																		<td><s:property value="materialID" /></td>
																		<td><s:property value="materialName" /></td>
																		<td><s:property value="coverName" /></td>
																		<td><s:property value="materialRate" /></td>
																		<td><s:property value="eff_date" /></td>
																		<td><s:property value="status" /></td>
																		<td align="center">
																			<a href='<%=request.getContextPath()%>/editmaterialmasterRating.action?mode=edit&materialID=<s:property value="edit"/>'>Edit</a>
																		</td>
																	</s:elseif>
																	<s:elseif test = 'menuType=="commoditymaster"'>
																		<td><s:property value="commodityID" /></td>
																		<td><s:property value="commodityName" /></td>
																		<td><s:property value="eff_date" /></td>
																		<td><s:property value="status" /></td>
																		<td align="center">
																			<a href='<%=request.getContextPath()%>/editcommoditymasterRating.action?mode=edit&commodityID=<s:property value="edit"/>'>Edit</a>
																		</td>
																	</s:elseif>
																	<s:elseif test = 'menuType=="covercommomaster"'>
																		<td><s:property value="catname" /></td>
																		<td><s:property value="coverName" /></td>
																		<td><s:property value="coverDesc" /></td>
																		<td><s:property value="coverRate1" /></td>
																		<td><s:property value="catrate1" /></td>
																		<td><s:property value="status" /></td>
																		<td align="center">
																			<a href='<%=request.getContextPath()%>/editcovercommomasterRating.action?mode=edit&<s:property value="edit"/>'>Edit</a>
																		</td>
																	</s:elseif>
																	<s:elseif test = 'menuType=="categorymaster"'>
																		<td><s:property value="catID" /></td>
																		<td><s:property value="catname" /></td>
																		<td><s:property value="catrate" /></td>
																		<td><s:property value="status" /></td>
																		<td align="center">
																			<a href='<%=request.getContextPath()%>/editcategorymasterRating.action?mode=edit&catID=<s:property value="edit"/>'>Edit</a>
																		</td>
																	</s:elseif>
																	<s:elseif test = 'menuType=="warratemaster"'>
																		<td><s:property value="warID" /></td>
																		<td><s:property value="warName" /></td>
																		<td><s:property value="warRate" /></td>
																		<td><s:property value="transID" /></td>
																		<td><s:property value="eff_date" /></td>
																		<td><s:property value="status" /></td>
																		<td align="center">
																			<a href='<%=request.getContextPath()%>/editwarratemasterRating.action?mode=edit&warID=<s:property value="edit"/>'>Edit</a>
																		</td>
																	</s:elseif>
																	<s:elseif test = 'menuType=="packagemaster"'>
																		<td><s:property value="packageId" /></td>
																		<td><s:property value="packageDesc" /></td>
																		<td><s:property value="percentRate" /></td>
																		<td><s:property value="modeOfTransport" /></td>
																		<td><s:property value="status" /></td>
																		<td align="center">
																			<a href='<%=request.getContextPath()%>/editpackagemasterRating.action?mode=edit&packageId=<s:property value="edit"/>'>Edit</a>
																		</td>
																	</s:elseif>
																	<s:elseif test = 'menuType=="saletermmaster"'>
																		<td><s:property value="saleID" /></td>
																		<td><s:property value="saleName" /></td>
																		<td><s:property value="saleValue" /></td>
																		<td><s:property value="status" /></td>
																		<td align="center">
																			<a href='<%=request.getContextPath()%>/editsaletermmasterRating.action?mode=edit&saleID=<s:property value="edit"/>'>Edit</a>
																		</td>
																	</s:elseif>
																	<s:elseif test = 'menuType=="tolerancemaster"'>
																		<td><s:property value="toleID" /></td>
																		<td><s:property value="toleName" /></td>
																		<td><s:property value="toleValue" /></td>
																		<td><s:property value="status" /></td>
																		<td align="center">
																			<a href='<%=request.getContextPath()%>/edittolerancemasterRating.action?mode=edit&toleID=<s:property value="edit"/>'>Edit</a>
																		</td>
																	</s:elseif>
																	<s:elseif test = 'menuType=="commodityexcess"'>
																		<td><s:property value="comExID" /></td>
																		<td><s:property value="startAmt" /></td>
																		<td><s:property value="endAmt" /></td>
																		<td><s:property value="deductible" /></td>
																		<td><s:property value="comExRate" /></td>
																		<td><s:property value="eff_date" /></td>
																		<td><s:property value="status" /></td>
																		<td align="center">
																			<a href='<%=request.getContextPath()%>/editcommodityexcessRating.action?mode=edit&comExID=<s:property value="edit"/>'>Edit</a>
																		</td>
																	</s:elseif>
																	<s:elseif test = 'menuType=="vesselmaster"'>
																		<td><s:property value="vesselID" /></td>
																		<td><s:property value="vesselName" /></td>
																		<td><s:property value="vesselClass" /></td>
																		<td><s:property value="status" /></td>
																		<td align="center">
																			<a href='<%=request.getContextPath()%>/editvesselmasterRating.action?mode=edit&vesselID=<s:property value="edit"/>'>Edit</a>
																		</td>
																	</s:elseif>
																	<s:elseif test = 'menuType=="settlingagent"'>
																		<td><s:property value="agentID" /></td>
																		<td><s:property value="agentName" /></td>
																		<td><s:property value="countryID" /></td>
																		<td><s:property value="status" /></td>
																		<td align="center">
																			<a href='<%=request.getContextPath()%>/editsettlingagentRating.action?mode=edit&agentID=<s:property value="edit"/>'>Edit</a>
																		</td>
																	</s:elseif>
																	<s:elseif test = 'menuType=="exchangemaster"'>
																		<td><s:property value="exchangeID" /></td>
																		<td><s:property value="currencyID" /></td>
																		<td><s:property value="exchangeRate" /></td>
																		<td><s:property value="status" /></td>
																		<td align="center">
																			<a href='<%=request.getContextPath()%>/editexchangemasterRating.action?mode=edit&exchangeID=<s:property value="edit"/>'>Edit</a>
																		</td>
																	</s:elseif>
																	<s:elseif test = 'menuType=="currencymaster"'>
																		<td><s:property value="currencyID" /></td>
																		<td><s:property value="currencyType" /></td>
																		<td><s:property value="subCurrency" /></td>
																		<td><s:property value="currencyShortName" /></td>
																		<td><s:property value="status" /></td>
																		<td align="center">
																			<a href='<%=request.getContextPath()%>/editcurrencymasterRating.action?mode=edit&currencyID=<s:property value="edit"/>'>Edit</a>
																		</td>
																	</s:elseif>
																	<s:elseif test = 'menuType=="extracover"'>
																		<td><s:property value="extraCoverId" /></td>
																		<td><s:property value="extraCoverName" /></td>
																		<td><s:property value="transID" /></td>
																		<td><s:property value="status" /></td>
																		<td align="center">
																			<a href='<%=request.getContextPath()%>/editextracoverRating.action?mode=edit&extraCoverId=<s:property value="edit"/>'>Edit</a>
																		</td>
																	</s:elseif>
																	<s:elseif test = 'menuType=="modeoftransport"'>
																		<td><s:property value="transID" /></td>
																		<td><s:property value="transDesc" /></td>
																		<td><s:property value="status" /></td>
																		<td align="center">
																			<a href='<%=request.getContextPath()%>/editmodeoftransportRating.action?mode=edit&transID=<s:property value="edit"/>'>Edit</a>
																		</td>
																	</s:elseif>
																	<s:elseif test = 'menuType=="warrantymaster"'>
																		<td><s:property value="warrantyID" /></td>
																		<td><s:property value="warrantyDesc" /></td>
																		<td><s:property value="status" /></td>
																		<td align="center">
																			<a href='<%=request.getContextPath()%>/editwarrantymasterRating.action?mode=edit&warrantyID=<s:property value="edit"/>'>Edit</a>
																		</td>
																	</s:elseif>
																	<s:elseif test ='"constantMaster".equalsIgnoreCase(menuType)'>
																		<td><s:property value="categoryId" /></td>
																		<td><s:property value="categoryName" /></td>																	
																		<td><s:property value="status" /></td>
																		<td align="center">
																			<a href='<%=request.getContextPath()%>/editconstantMasterRating.action?mode=edit&categoryId=<s:property value="edit"/>'>Edit</a>
																		</td>
																		<td align="center">
																			<s:text name="addDetail" />
																		</td>
																	</s:elseif>
																	<s:elseif test = 'menuType=="constantdetail"' >
																		<td><s:property value="category_detail_id" /></td>
																		<td><s:property value="detailName" /></td>
																		<td><s:property value="status" /></td>
																		<td align="center">
																			<a href='<%=request.getContextPath()%>/editconstantdetailRating.action?mode=edit&constantID=<s:property value="edit"/>'>Edit</a>
																		</td>
																	</s:elseif>
																	<s:elseif test = 'menuType=="exclusionmaster"'>
																		<td><s:property value="exclusionID" /></td>
																		<td><s:property value="exclusionName" /></td>
																		<td><s:property value="status" /></td>
																		<td align="center">
																			<a href='<%=request.getContextPath()%>/editexclusionmasterRating.action?mode=edit&exclusionID=<s:property value="edit"/>'>Edit</a>
																		</td>
																	</s:elseif>
																	<s:elseif test = 'menuType=="citymaster"'>
																		<td><s:property value="cityID" /></td>
																		<td><s:property value="countryID" /></td>
																		<td><s:property value="cityName" /></td>
																		<td><s:property value="status" /></td>
																		<td align="center">
																			<a href='<%=request.getContextPath()%>/editcitymasterRating.action?mode=edit&cityID=<s:property value="edit"/>'>Edit</a>
																		</td>
																	</s:elseif>
																	<s:elseif test = 'menuType=="wsrcc"'>
																		<td><s:property value="wsrccid" /></td>
																		<td><s:property value="transDesc" /></td>
																		<td><s:property value="coverName" /></td>
																		<td><s:property value="wsrccdesc" /></td>
																		<td><s:property value="status" /></td>
																		<td align="center">
																			<a href='<%=request.getContextPath()%>/editwsrccRating.action?mode=edit&wsrccid=<s:property value="edit"/>'>Edit</a>
																		</td>
																	</s:elseif>
																	<s:elseif test = 'menuType=="covermaster"'>
																		<td><s:property value="coverID" /></td>
																		<td><s:property value="coverName" /></td>
																		<td><s:property value="coverRate" /></td>
																		<td><s:property value="transID" /></td>
																		<td><s:property value="status" /></td>
																		<td align="center">
																			<a href='<%=request.getContextPath()%>/editcovermasterRating.action?mode=edit&coverID=<s:property value="edit"/>'>Edit</a>
																		</td>
																	</s:elseif>
																	<s:elseif test='menuType=="clause"'>
																		<td><s:property value="clauseID" /></td>
																		<td><s:property value="transDesc" /></td>
																		<td><s:property value="coverName" /></td>
																		<td><s:property value="clauseDesc" /></td>
																		<td><s:property value="status" /></td>
																		<td align="center">
																			<a href='<%=request.getContextPath()%>/editclauseRating.action?mode=edit&clauseID=<s:property value="edit"/>'>Edit</a>
																		</td>
																	</s:elseif>
																	<s:elseif test = 'menuType=="error"'>
																		<td><s:property value="errorID" /></td>
																		<td><s:property value="errorDesc" /></td>
																		<td><s:property value="stagename" /></td>
																		<td><s:property value="productname" /></td>
																		<td><s:property value="status" /></td>
																		<td align="center">
																			<a href='<%=request.getContextPath()%>/editerrorRating.action?mode=edit&errorID=<s:property value="edit"/>'>Edit</a>
																		</td>
																	</s:elseif>
																	<s:elseif test = 'menuType=="executivemaster"'>
																		<td><s:property value="exmexecutiveId" /></td>
																		<td><s:property value="executiveName" /></td>
																		<td><s:property value="exmEffectiveDate" /></td>
																		<td><s:property value="exmStatus" /></td>
																		<td align="center">
																			<a href='<%=request.getContextPath()%>/editexecutivemasterRating.action?mode=edit&exmexecutiveId=<s:property value="edit"/>'>Edit</a>
																		</td>
																	</s:elseif>
																</tr>
															</s:iterator>
														</tbody>
									        		</table>												    
									        	</td>
									 			
							        		</tr>
							        	</table>
							    	</td></tr>
							    	<s:if test = '"constantdetail".equalsIgnoreCase(menuType)' >
								    	<tr>
								    		<td width="5%" align="center">
							 					<s:hidden name="categoryID"/>
							 					<input type="button" class="btn" value="Back" onclick="fnCall('constantMaster')"/>
							 				</td>
							 			</tr>
						 			</s:if>
								</table>
							</td>
						</tr>
					</table>
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
                <div title="${menuType}" style="padding:5px">                
                	
                		
		   		</div>
            </div>
        </div>
    </div> --%>
    <s:hidden name="transID" id="transID"/>
    <s:hidden name="coverID" id="coverID"/>
    <s:hidden name="menuType" id="menuType"/>
    <s:hidden name="itemType" id="itemType"/>
    <s:form name="info" id="info">
    </s:form>
    </body>
</html>