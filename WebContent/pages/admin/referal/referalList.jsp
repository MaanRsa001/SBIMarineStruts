<%@ page isELIgnored="false" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>
<!DOCTYPE HTML>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.responsive.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.jqueryui.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.tableTools.css">
	<link href="<%=request.getContextPath()%>/dataTables/css/jquery-start-ui.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.jqueryui.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.responsive.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.tableTools.js"></script>
	<%--<script type="text/javascript">
  	jQuery(function ($) {
  		try {
  			var data = $('#record').dataTable( {
				"lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
				"order": [[ 1, "asc" ]],
				"columnDefs": [ {
		          "targets": 'no-sort',
		          "orderable": false
			    } ],
				responsive: true
			});
			var data1 = $('.display').dataTable( {
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
  	--%><style>
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
<%--<div id="loading" style="width:100%">
	   <img id="loading-image" src="<%=request.getContextPath()%>/images/ajax-loader-bar.gif" id="loader"/>
</div>
--%><s:form name="frmSearch" theme="simple" method="post" >
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<s:text name="Search Referral Quote No." />
				</div>			
				<div class="panel-body">
<!-- 					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-3"> -->
<%-- 						<div class="text"> <s:text name="product.product"/> </div> --%>
<!-- 						<div class="tbox"> -->
<%-- 							<s:select name="productID" cssClass="inputBoxS" id="productID" list="productDet" headerKey="" headerValue="---Select---" listKey="PRODUCT_ID" listValue="PRODUCT_NAME" /> --%>
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-3"> -->
<%-- 						<div class="text"><s:text name="admin.user.branch"/></div> --%>
<!-- 						<div class="tbox"> -->
<%-- 							<s:select name="branchId" cssClass="inputBoxS" id="branchId" list="branchDet" headerKey="ALL" headerValue="ALL" listKey="BRANCH_CODE" listValue="BRANCH_NAME" /> --%>
<!-- 						</div> -->
<!-- 					</div>	 -->
<!-- 					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-3" > -->
<%-- 						<div class="text"><s:text name="Search By"/></div> --%>
<!-- 						<div class="tbox"> -->
<%-- 							<s:radio list="#{'QNO':'Quote No','TNO':'Tran Id'}" name="searchBy" id="searchBy"  value='%{(searchBy==null || "".equals(searchBy))?"QNO":searchBy}'/> --%>
<!-- 						</div> -->
<!-- 					</div> -->
					<s:hidden name="searchBy" id="searchBy" value="QNO"/>
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-3" >
						<div class="text"><s:text name="Quote No"/></div>
						<div class="tbox">
							<s:textfield cssClass="inputBoxS" name="searchQuote" id="searchQuote" maxlength="10" ></s:textfield>
						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
						<input type="button" class="btn btn-sm btn-success" value="Search" onclick="searchReferral();"></input>
					</div>
					<br class="clear" /> 
					 <div id="searchReferral" class="row"> </div>
				</div>
			</div>	
		</div>
	
	</div>
	<br class="clear" /> 
	<s:token/>
</s:form>			
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="Referral Cases" />
			</div>			
			<div class="panel-body">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<div id="errors1" style="color: red; ">&nbsp;</div>
					</div>
				</div>
				
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<div class="tabsBg rEdge">
							<input type="button" class="tabBg rEdge" name="pendingTab" id='pendingTab' value="Pending Quotes" onclick="getTab('pendingTab')" />
						 	<input type="button" class="tabBg rEdge" name="approvedTab" id='approvedTab' value="Approved Quotes" onclick="getTab('approvedTab')" />
						 	<input type="button" class="tabBg rEdge" name="rejectedTab" id='rejectedTab' value="Rejected Quotes" onclick="getTab('rejectedTab')" />
						</div>
						<div title="Pending Quotes" style="padding:10px"  id="tone">
							<div id="pendingPolicies">
								<s:form id="pending" name="pending" theme="simple">									
									<div class="row">
										<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
											<div class="text"> <s:text name="product.product"/> </div>
											<div class="tbox">
												<s:select name="productID" cssClass="inputBoxS" id="productID" list="productDet" headerKey="" headerValue="---Select---" listKey="ProductId" listValue="ProductName" />
											</div>
										</div>
										<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
											<div class="text"><s:text name="Regions"/></div>
											<div class="tbox">
												<s:select name="region" id="region1" cssClass="inputBoxS" list="regionList" listKey="RegionId" listValue="RegionName" onchange="getBranches(this.value,'pendingBranch');" disabled="true" />
											</div>
										</div>
										<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
											<div class="text"><s:text name="admin.user.branch"/></div>
											<div class="tbox">
												<s:select name="branchId" cssClass="inputBoxS" id="branchId" list="branchDet" headerKey="ALL" headerValue="ALL" listKey="BranchCode" listValue="BranchName" />
											</div>
										</div>
										<s:if test='(rdate!=null || "".equals(rdate)) && "0".equals(index)'>
											<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
												Selected Date is <b><s:property value="rdate"/></b>
											</div>
										</s:if>
									</div>
									<br class="clear" />
									<div class="row">
										<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
											<input type="button" class="btn btn-sm btn-success" value="Search"  onclick="fnTab('', 'pending','','');">
										</div>
									</div>
									<br class="clear" /> 
								</s:form>
							</div>
						</div>
						<div title="Approved Quotes" style="padding:10px"  id="ttwo">
							<div id="approvedPolicies">
								<s:form id="approved" name="approved" theme="simple">
									 
									<div class="row">
										<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
											<div class="text"> <s:text name="product.product"/> </div>
											<div class="tbox">														
												<s:select name="productID" cssClass="inputBoxS" id="productID" list="productDet" headerKey="" headerValue="---Select---" listKey="ProductId" listValue="ProductName" />
											</div>
										</div>
										<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
											<div class="text"><s:text name="Regions"/></div>
											<div class="tbox">
												<s:select name="region" id="region1" cssClass="inputBoxS" list="regionList" listKey="RegionId" listValue="RegionName" onchange="getBranches(this.value,'pendingBranch');" disabled="true"/>
											</div>
										</div>
										<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
											<div class="text"><s:text name="admin.user.branch"/></div>
											<div class="tbox">
												<s:select name="branchId" cssClass="inputBoxS" id="branchId" list="branchDet" headerKey="ALL" headerValue="ALL" listKey="BranchCode" listValue="BranchName" />
											</div>
										</div>
										<s:if test='(rdate!=null || "".equals(rdate)) && "1".equals(index)'>
											<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
												Selected Date is <b><s:property value="rdate"/></b>
											</div>
										</s:if>
									</div>
									<br class="clear" />
									<div class="row">
										<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
											<input type="button" class="btn btn-sm btn-success" value="Submit" onclick="fnTab('', 'approved','','');">
										</div>
									</div>
									<br class="clear" />											
								</s:form>
							</div>
						</div>
						<div title="Approved Quotes" style="padding:10px"  id="tthree">
							<div id="rejectedPolicies">
								<s:form id="rejected" name="rejected" theme="simple">
									
									<div class="row">
										<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
											<div class="text"> <s:text name="product.product"/> </div>
											<div class="tbox">														
												<s:select name="productID" cssClass="inputBoxS" id="productID" list="productDet" headerKey="" headerValue="---Select---" listKey="ProductId" listValue="ProductName"  />
											</div>
										</div>
										<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
											<div class="text"><s:text name="Regions"/></div>
											<div class="tbox">
												<s:select name="region" id="region1" cssClass="inputBoxS" list="regionList" listKey="RegionId" listValue="RegionName" onchange="getBranches(this.value,'pendingBranch');" disabled="true"/>
											</div>
										</div>
										<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
											<div class="text"><s:text name="admin.user.branch"/></div>
											<div class="tbox">
												<s:select name="branchId" cssClass="inputBoxS" id="branchId" list="branchDet" headerKey="ALL" headerValue="ALL" listKey="BranchCode" listValue="BranchName" />
											</div>
										</div>
										<s:if test='(rdate!=null || "".equals(rdate)) && "2".equals(index)'>
											<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
												Selected Date is <b><s:property value="rdate"/></b>
											</div>
										</s:if>
									</div>
									<br class="clear" />
									<div class="row">
										<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
											<input type="button" class="btn btn-sm btn-success" value="Submit" onclick="fnTab('', 'rejected','','');" >
										</div>
									</div>
									<br class="clear" />
									<s:token/>											
								</s:form>
							</div>
						</div>						 
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<s:form name="form1" id="form1" theme="simple">
	<s:hidden name="agencyCode" id="agencyCode1"/>
	<s:hidden name="borganization" id="borganization1"/>
	<s:hidden name="quoteStatus" id="quoteStatus"/>
	<s:hidden name="applicationNo" id="applicationNo"/>
	<s:hidden name="referenceNo" id="referenceNo"/>
	<s:hidden name="loginId" id="loginId"/>
	<s:hidden name="quoteNo" id="quoteNo"/>
	<s:hidden name="productId" id="productId"/>
	<s:hidden name="entryDate" id="entryDate"/>
	<s:hidden name="pid" id="pid"/>
	<s:hidden name="reqFrom" id="reqFrom"/>
	<s:hidden name="schemeId" id="schemeId"/>
	<s:token/>
</s:form>
<script type="text/javascript">
function fnCall(from){
	if(from=='edit')
		document.rejected.action = from+"BrokerMgm.action?mode=edit";
	else if(from=='userDetail')
		document.rejected.action = "getABListUserMgm.action?mode1=broker";
	else if(from=='customerDetail')
		document.rejected.action = "getABListCustomerMgm.action?mode1=broker";
	else if(from=='referal')
		document.rejected.action = "getOCListReferal.action";
	else if(from=='openCover')
		document.rejected.action = "opencoverBrokerMgm.action";
	else
		document.rejected.action = from+"BrokerMgm.action";
	document.rejected.submit();
}

function fnTab(pid, reqFrom, value, index){
	var agencyCode=document.getElementById('agencyCode1').value;
	var borg=document.getElementById('borganization1').value;		
	var productId=document.getElementById('productID').value;
    if(reqFrom=="pending"){ 
    	var error="";
		var branch=document.pending.branchId.value;
		var region=document.pending.region.value;
		if(""==pid){
	    	 pid=document.pending.productID.value;
	  	 }
	    if(""==pid){
	      error=error+"Please select Product</br>";
	    }
	    if(""==branch){
	      error=error+"Please select Branch";
	    }
	    if(""==error){document.getElementById("errors1").innerHTML=error;
	    		postRequest('<%=request.getContextPath()%>/getOCAjaxReferal.action?reqFrom='+reqFrom+'&productID='+pid+'&index=0&from1=ajax&agencyCode='+agencyCode+'&borganization='+borg+'&branchId='+branch+'&region='+region, 'pendingPolicies');	
	    }else{
			document.getElementById("errors1").innerHTML=error;
		}				 	
  		}else if(reqFrom=="approved"){
  			var error="";
		var branch=document.approved.branchId.value;
		var region=document.approved.region.value;
		if(""==pid){
	    	 pid=document.approved.productID.value;
	  	 }
	    if(""==pid){
	      error=error+"Please select Product</br>";
	    }
	    if(""==branch){
	      error=error+"Please select Branch";
	    }
	    if(""==error){
	    	document.getElementById("errors1").innerHTML=error;
	    	postRequest('<%=request.getContextPath()%>/getOCAjaxReferal.action?reqFrom='+reqFrom+'&productID='+pid+'&index=1&from1=ajax&agencyCode='+agencyCode+'&borganization='+borg+'&branchId='+branch+'&region='+region, 'approvedPolicies');	
	    }else{
			document.getElementById("errors1").innerHTML=error;
		}
		
  		}else if(reqFrom=="rejected"){
  			var error="";
		var branch=document.rejected.branchId.value;
		var region=document.rejected.region.value;
		if(""==pid){
	    	 pid=document.rejected.productID.value;
	  	 }
	    if(""==pid){
	      error=error+"Please select Product</br>";
	    }
	    if(""==branch){
	      error=error+"Please select Branch";
	    }
	    if(""==error){
	    	document.getElementById("errors1").innerHTML=error;
	    	postRequest('<%=request.getContextPath()%>/getOCAjaxReferal.action?reqFrom='+reqFrom+'&productID='+pid+'&index=2&from1=ajax&agencyCode='+agencyCode+'&borganization='+borg+'&branchId='+branch+'&region='+region+'&region='+region, 'rejectedPolicies');	
	    }else{
			document.getElementById("errors1").innerHTML=error;
		}
		
  		}else{
  			var error="";
		var branch=document.pending.branchId.value;
		if(""==pid){
	    	 pid=document.pending.productID.value;
	  	 }
	    if(""==pid){
	      error=error+"Please select Product</br>";
	    }
	    if(""==branch){
	      error=error+"Please select Branch";
	    }
	    if(""==error){
	    	document.getElementById("errors1").innerHTML=error;
	    	postRequest('<%=request.getContextPath()%>/getOCAjaxReferal.action?reqFrom='+value+'&productID='+pid+'&from1=ajax&index='+index+'&rdate='+reqFrom+'&agencyCode='+agencyCode+'&borganization='+borg+'&branchId='+branch+'&region='+region, value+'Policies');	
	    }else{
			document.getElementById("errors1").innerHTML=error;
		}
  			
  		}
    		
				
  	}		   	
/*
$(function(){
	var index = '<s:property value="index"/>';
	var t = $('#tabs');
	var tabs = t.tabs('tabs');
	t.tabs('select', tabs[index].panel('options').title);
});
*/
function editQuote(applicationNo, loginId, proID, eDate,quoteNo,schemeId, quoteStatus){
	document.form1.quoteStatus.value='RU';
	document.form1.quoteNo.value=quoteNo;
	document.form1.applicationNo.value=applicationNo;
	document.form1.referenceNo.value=applicationNo;
	document.form1.loginId.value=loginId;
	document.form1.pid.value=proID;
	document.form1.productId.value=proID;
	document.form1.quoteStatus.value=quoteStatus;
	if(proID=='3'|| proID=='11'){
	document.form1.action = "editQuoteQuotation.action";
	}
	else if(proID=='65'){
	document.form1.action = "editQuoteMotor.action";
	}
	else if(proID=='30'){
	document.form1.action = "initHome.action";
	}
	else if(proID=='33'){
	document.form1.action = "initTravel.action";
	}
	document.form1.submit();	
}
function getTab(loginType){
	if(loginType=="pendingTab") {
		document.getElementById("pendingTab").className="tabBgA rEdge";
		document.getElementById("approvedTab").className="tabBg rEdge";
		document.getElementById("rejectedTab").className="tabBg rEdge";
		document.getElementById("tone").style.display = "block";
		document.getElementById("ttwo").style.display = "none";
		document.getElementById("tthree").style.display = "none";
		//document.getElementById("loginType").value = loginType;
	}
	else if(loginType=="approvedTab") {
		document.getElementById("approvedTab").className="tabBgA rEdge";
		document.getElementById("pendingTab").className="tabBg rEdge";
		document.getElementById("rejectedTab").className="tabBg rEdge";
		document.getElementById("ttwo").style.display = "block";
		document.getElementById("tone").style.display = "none";
		document.getElementById("tthree").style.display = "none";
		//document.getElementById("loginType").value = loginType;
	}else if(loginType=="rejectedTab") {
		document.getElementById("rejectedTab").className="tabBgA rEdge";
		document.getElementById("pendingTab").className="tabBg rEdge";
		document.getElementById("approvedTab").className="tabBg rEdge";
		document.getElementById("tthree").style.display = "block";
		document.getElementById("tone").style.display = "none";
		document.getElementById("ttwo").style.display = "none";
		//document.getElementById("loginType").value = loginType;
	}
	document.getElementById("loading").style.display = "none";
}
try{
getTab('pendingTab');
}catch(e){}
function searchReferral(){
	var ser=document.getElementById("searchQuote").value;
	var branch=document.getElementById("branchId").value;
	var productId=document.getElementById('productID').value;
	 var searchBy =false;
	 
	 
	if(ser!="")
		postRequest('<%=request.getContextPath()%>/searchRefReferal.action?branchId='+branch+'&searchQuote='+ser+'&productID='+productId+'&searchBy='+searchBy, 'searchReferral');
}

function searchDecReferral(){

	var ser=document.getElementById("searchDecQuote").value;
	var branch=document.getElementById("branchId").value;
	var productId=document.getElementById('productID').value;
	if(ser!="")
		postRequest('<%=request.getContextPath()%>/searchDecRefReferal.action?branchId='+branch+'&searchQuote='+ser+'&productID='+productId, 'searchReferral');
}
</script>
</body>
</html>