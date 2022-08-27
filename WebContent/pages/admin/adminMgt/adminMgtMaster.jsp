<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>
<!DOCTYPE HTML>
<html>
<head>
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap-multiselect.css" />
	<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap-multiselect.js" type="text/javascript"></script>
	<link href="<%=request.getContextPath()%>/bootstrap/css//style.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.responsive.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.jqueryui.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.tableTools.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datepicker/jquery-ui.css">
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.jqueryui.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.responsive.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.tableTools.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery.dataTables.js"></script>
	<script type="text/javascript">
  	jQuery(function ($) {
  		try {
			var data1 = $('#record').dataTable( {
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
</head>
<body>
<s:form id="adminlist" name="adminlist" method="post" theme="simple">
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:if test='"alist".equals(from)'>
					<s:text name="label.admin.existing.list" />
					<div class="pullRight">
						<a class="btn btn-sm btn-info" title="new admin" href="editadminAdmin.action?mode=new" style="text-decoration: none;"><i class="glyphicon glyphicon-plus"></i></a>
					</div>
					<br class="clear" />
				</s:if>
				<s:elseif test='"aform".equals(from) && "new".equals(mode)'>
					<s:text name="label.admin.new" />
				</s:elseif>
				<s:elseif test='"aform".equals(from) && "edit".equals(mode)'>
					<s:text name="label.admin.edit" />
				</s:elseif>
			</div>
			<div class="panel-body">
				<s:if test='"aform".equals(from)'>
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<s:actionerror cssStyle="color: red;" /> <s:actionmessage cssStyle="color: green;" />
					</div>
				</div>
				<br/>
				</s:if>
				<s:if test='"alist".equals(from)'>
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<table class="display responsive no-wrap" id="record" width="100%" cellspacing="0">
							<thead>
							<tr>
								<th class="no-sort"></th>
								<th><s:text name="S.No." /></th>
								<th><s:text name="Login ID" /></th>
								<th><s:text name="User Name" /></th>
								<th><s:text name="UserType" /></th>
								<th><s:text name="Branch" /></th>
								<th><s:text name="Status" /></th>
								<th><s:text name="Edit" /></th>
							</tr>
							</thead>
							<tbody>
							<s:iterator value="adminList" status="stat" var="record">
							<tr>
								<td></td>
								<td><s:property value="%{#stat.index+1}" /></td>
								<td><s:property value="LoginId" /></td>
								<td><s:property value="UserName" /></td>
								<td><s:property value="UserType" /></td>
								<td><s:property value="BranchName" /></td>								
								<td><s:property value="Status1" /></td>
								<td>
									<a class="btn btn-sm btn-warning" type="button" href="#" onclick="forward('<s:property value="LoginId"/>','editadminAdmin','adminlist')"><i class="fa fa-pencil-square-o"></i></a>
								</td>
							</tr>
							</s:iterator>
							</tbody>
						</table>
					</div>
				</div>
				<s:hidden name="loginID" id="loginID"/>
				</s:if>
				<s:elseif test='"aform".equals(from)'>
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text"><s:text name="admin.user.type"/> <font color="red">*</font></div>
						<div class="tbox">
							<s:select name="utype" id="utype" list="utypeList" headerKey="" headerValue="---Select---" listKey="CodeDescription"  listValue="CodeDescription" cssClass="inputBoxS" />
						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text"><s:text name="admin.user.name"/> <font color="red">*</font></div>
						<div class="tbox"><s:textfield name="uname" id="uname" cssClass="inputBox" /></div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text"><s:text name="admin.user.login.Id"/> <font color="red">*</font></div>
						<div class="tbox">
							<s:if test='"new".equals(mode)'>
   					    		<s:textfield name="loginID" id="loginID" cssClass="inputBox" />
   					    	</s:if>
   					    	<s:elseif test='"edit".equals(mode)'>
   					    		<s:property value="loginID"/><s:hidden name="loginID"/>
   					    	</s:elseif>
						</div>
					</div>
					</div>
					<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text"><s:text name="admin.user.pwd"/><s:if test='"new".equals(mode)'><font color="red">*</font></s:if></div>
						<div class="tbox">
							<s:password name="pwd" id="pwd" cssClass="inputBox" maxlength="20" />
						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text"> <s:text name="broker.region" /> </div>
						<div class="tbox">
							<s:select name="regionCode" id="regionCode" cssClass="inputBoxS" list="regionsList"  listKey="RegionId" listValue="RegionName"  headerKey="" headerValue="---Select---" onchange="getBranchList(this.value,'branchId');"/>
						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text"> <s:text name="broker.branchcode" /> </div>
						<div class="tbox">
							<div id="branchId"><s:select name="branchCodeS" id="branchCodeS" cssClass="inputBoxS" list="branchList"  listKey="BranchCode" listValue="BranchName"  headerKey="" headerValue="---Select---" /></div>
						</div>
					</div>
					</div>
					<div class="row">
					<%-- <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text"><s:text name="admin.user.branch"/> <font color="red">*</font></div>
						<div class="tbox"><s:property value="branch"/><s:hidden name="branch"/></div>
					</div> --%>
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text"><s:text name="admin.user.product.select"/> <font color="red">*</font></div>
						<div class="tbox">							
							<s:select name="productID" id="products" list="productList"  listKey="ProductId" listValue="ProductName" headerKey="" label="" multiple="true" />
						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text"><s:text name="admin.user.uw.select"/> <font color="red">*</font></div>
						<div class="tbox">							
							<s:select name="uwgrade" id="uwgrades" list="uwGradeList"  listKey="Code" listValue="CodeDescription" headerKey="" label="" multiple="true" />							
						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text"><s:text name="admin.user.mail"/> <font color="red">*</font></div>
						<div class="tbox">
							<s:textfield name="email" id="email" cssClass="inputBox" />
						</div>
					</div>
					</div>
					<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text"><s:text name="admin.user.status"/> <font color="red">*</font></div>
						<div class="tbox">
							<s:select name="status" list="#{'Y':'Active','N':'Deactive','D':'Delete','T':'Lock'}" headerKey="" headerValue="---Select---" cssClass="inputBoxS" />
						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text"><s:text name="admin.user.region.select"/> <font color="red">*</font></div>
						<div class="tbox">
							<s:select name="attachedregion" id="attachedregion" cssClass="inputBoxS" list="regionsList"  listKey="RegionId" listValue="RegionName"  headerKey=""  multiple="true"/>
						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text"><s:text name="admin.user.branch.select"/> <font color="red">*</font></div>
						<div class="tbox">
							<s:textarea name="branchId" id="branchId" cssClass="inputBoxA" rows="2" cssStyle="width: 85%;"/>
							<input class="btn btn-sm btn-primary" value="..." style="float:right;" type="button" name="menu" onclick="return callPopupbranch('<%=request.getContextPath()%>/branchSelectionAdmin.action')"/>							
						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text"><s:text name="admin.user.menu.select"/> <font color="red">*</font></div>
						<div class="tbox">
							<s:textarea name="mid" id="mid" cssClass="inputBoxA" rows="2" cssStyle="width: 85%;"/>
							<input class="btn btn-sm btn-primary" value="..." style="float:right;" type="button" name="menu" onclick="return clickMenuPopup('<%=request.getContextPath()%>/menuSelectionAdmin.action')"/>
						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text"><s:text name="admin.user.broker.select"/> <font color="red">*</font></div>
						<div class="tbox">
							<s:textarea name="broker" id="broker" cssClass="inputBoxA" rows="2" cssStyle="width: 85%;" />
							<input class="btn btn-sm btn-primary" style="float:right;" value="..." type="button" name="menu" onclick="return callPopup('<%=request.getContextPath()%>/brokerSelectionAdmin.action')"/>
						</div>
					</div>					
				</div>
				<br class="clear" />
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
						<input type="button" name="submit2" class="btn btn-sm btn-danger" value="Back" onclick="fnsubmit('adminback',this.form)"/> &nbsp;&nbsp;&nbsp;
						<input type="button" name="submit1" class="btn btn-sm btn-success" value="Submit" onclick="fnsubmit('admin',this.form)"/>
					</div>
				</div>
				</s:elseif>
				<s:elseif test='"addSuccess".equals(from)'>
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
							<span class="label label-md label-success" ><s:text name="admin.new.add.success"/></span>
						</div>
					</div>
					<br class="clear" />
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
							<input type="button" name="submit1" class="btn btn-sm btn-danger" value="Back" onclick="fnsubmit('adminback',this.form)"/>
						</div>
					</div>
				</s:elseif>
				<s:elseif test='"updateSuccess".equals(from)'>
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
							<span class="label label-md label-success" ><s:text name="admin.exist.update.success"/></span>
						</div>
					</div>
					<br class="clear" />
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
							<input type="button" name="submit1" class="btn btn-sm btn-danger" value="Back" onclick="fnsubmit('adminback',this.form)" />
						</div>
					</div>
				</s:elseif>
			</div>
		</div>
	</div>
</div>
<s:hidden name="mode" id="mode"/>
<s:hidden name="from"/>
<s:hidden name="mode1"/>
<s:hidden name="from1"/>
<s:token/>
</s:form>
<script type="text/javascript">
function callPopupbranch(url){	 
	var checkedItems='';
	try
	{
		var elements=document.getElementById("attachedregion");		 
		for(i=0; i<elements.length; i++)
		{
			obj=elements[i];
			if(obj.selected)
				checkedItems+=obj.value+',';
		}
	}catch(e){}	 
	if(checkedItems.length>1)
		checkedItems=checkedItems.substring(0, checkedItems.length-1);	 
	if(checkedItems!=null && checkedItems!="")
		return callPopup(url+'?selregions='+checkedItems);
	else
		alert('Please Select Attached Region');	
}
function callPopupbranch1(URL) {
	var regioncode=document.getElementById("regionCode").value;
	URL=URL+"?regionCode="+regioncode;
 	var bwidth = window.innerWidth;
	var bwidth1 = document.body.clientWidth;
	if(bwidth <= 768) {
		return popUp(URL,bwidth1,'500');
	} else {
		return popUp(URL,'750','500');
	}
}
function callPopup(URL) {
 	var bwidth = window.innerWidth;
	var bwidth1 = document.body.clientWidth;
	if(bwidth <= 768) {
		return popUp(URL,bwidth1,'500');
	} else {
		return popUp(URL,'750','500');
	}
}
function stopRKey(evt) { 
  var evt = (evt) ? evt : ((event) ? event : null); 
  var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null); 
  if ((evt.keyCode == 13) && (node.type=="text"))  {return false;} 
} 
document.onkeypress = stopRKey;

function getMenu(val, id){
	if(val.length>=2){
		var searchBy=document.getElementById("searchBy1").value;
		postRequest('<%=request.getContextPath()%>/ajaxListAdmin.action?reqFrom='+id+'&searchBy='+searchBy+'&searchValue='+val, id);
	}
}

function getBroker(val, id){
	if(val.length>=2){
		var searchBy=document.getElementById("searchBy").value;
		postRequest('<%=request.getContextPath()%>/ajaxListAdmin.action?reqFrom='+id+'&searchBy='+searchBy+'&searchValue='+val, id);
	}
}

function fnsubmit(from, frm){
	if(from=='menuback'){
		document.menulist.action="adminMgtAdmin.action?index=1";
		document.menulist.submit();
	}else if(from=='menu'){
		document.menulist.action="menuSaveAdmin.action?index=1";
		document.menulist.submit();
	}else if(from=='adminback'){
		document.adminlist.action="adminMgtAdmin.action?index=0";
		document.adminlist.submit();
	}else if(from=='admin'){
		if(document.getElementById('pwd').value!='' && document.getElementById('mode').value!='new'){
			conf=false;
			conf = confirm("Are You want to change Password?");
			if(!conf)
				document.getElementById('pwd').value='';
		}
		document.adminlist.action="adminSaveAdmin.action?index=0";
		document.adminlist.submit();
	}
}

function forward(id, action, frm){
	if(frm=='menulist'){
		document.menulist.action=action+".action";
		document.getElementById('mid').value=id;
		document.getElementById('mode1').value='edit';
		document.menulist.submit();
	}else if(frm=='adminlist'){
		document.adminlist.action=action+".action";
		document.getElementById('mode').value='edit';
		document.getElementById('loginID').value=id;
		document.adminlist.submit();
	}
}
var selectedproduct = [];
$(document).ready(function() {     
    $('#products').multiselect({ 
      includeSelectAllOption: true,
        enableFiltering:true 
  	});	
    $('#uwgrades').multiselect({ 
        includeSelectAllOption: true,
          enableFiltering:true 
    	});
    $('#attachedregion').multiselect({ 
        includeSelectAllOption: true,
          enableFiltering:true 
          
    	});
 	<s:if test='uwgrade!=null && !"".equals(uwgrade)'>	
 		var uwgrade='<s:property value="uwgrade"/>';
		 var data=uwgrade.replace(/ /g,'');	
	   	 var dataArray=data.split(",");   	 
	   	$("#uwgrades").val(dataArray);
		 $("#uwgrades").multiselect("refresh");
	</s:if>
	        
   
    
});

function clickMenuPopup(url){	 
	var checkedItems='';
	try
	{
		var elements=document.getElementById("products");		 
		for(i=0; i<elements.length; i++)
		{
			obj=elements[i];
			if(obj.selected)
				checkedItems+=obj.value+',';
		}
		var menuId=document.getElementById("mid").value;
	}catch(e){}	 
	if(checkedItems.length>1)
		checkedItems=checkedItems.substring(0, checkedItems.length-1);	 
	if(checkedItems!=null && checkedItems!="")
		return callPopup(url+'?selProducts='+checkedItems+'&mid='+menuId);
	else
		alert('Please Select Product');	
}
function getBranchList(val,id){
	postRequest('<%=request.getContextPath()%>/getBrokerAjaxBrokerMgm.action?reqFrom='+id+'&regionCode='+val, id);
}
</script>
</body>
</html>