<%@ page isELIgnored="false" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>
<!DOCTYPE HTML>
<html>
<head>
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
<div class="row">
	<s:if test='%{borganization!=null && !"".equals(borganization)}'>
		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
			<div class="panel panel-primary">
				<div class="panel-body">
					<input type="button" class="btn btn-sm btn-info" value="View" onclick="fnCall('view')"/><br/>
	                <input type="button" class="btn btn-sm btn-info" value="Edit" onclick="fnCall('edit')"/><br/>
	                <input type="button" class="btn btn-sm btn-info" value="Change Password" onclick="fnCall('changePwd')"/><br/>
	                <input type="button" class="btn btn-sm btn-info" value="Customer Details" onclick="fnCall('customerDetail')"/><br/>
	                <input type="button" class="btn btn-sm btn-info" value="OpenCover" onclick="fnCall('openCover')"/><br/>
	                <input type="button" class="btn btn-sm btn-info" value="Referral" onclick="fnCall('referal')"/><br/>
	                <input type="button" class="btn btn-sm btn-info" value="Statistics" onclick="fnCall('statistics')"/><br/>
				</div>
			</div>
		</div>
		<div class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<s:property value="borganization"/>(<s:property value="agencyCode"/>)
					<div class="pullRight">
						<a class="btn btn-sm btn-info" style="text-decoration: none;" title="Customer Creation" onclick="more('getNewUnderwriterMgm.action','new','','')" href="#" ><i class="glyphicon glyphicon-plus"></i></a>
					</div>
					<br class="clear" />
				</div>
	</s:if>
	<s:else>
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<s:text name="Underwriter Creation" />
					<div class="pullRight">
						<a class="btn btn-sm btn-info" style="text-decoration: none;" title="Customer Creation" onclick="more('getNewUnderwriterMgm.action','new','','')" href="#" ><i class="glyphicon glyphicon-plus"></i></a>
					</div>
					<br class="clear" />
				</div>	
	</s:else>
				<div class="panel-body">
					<s:form name="info" id="info" method="post" action="" theme="simple" validate="false">
						<table class="display responsive no-wrap" id="record" width="100%" cellspacing="0">
							<thead>
							<tr>
								<th class="no-sort"></th>
								<th><s:text name="S.No." /></th>
								<th><s:text name="Issuer Name" /></th>
								<th><s:text name="Issuer Type" /></th>
								<th><s:text name="Login Id" /></th>
								<th><s:text name="Created Date" /></th>
								<th><s:text name="More" /></th>
								<th><s:text name="Status" /></th>
							</tr>
							</thead>
							<tbody>
							<s:iterator value="underwriterList" status="stat" var="record">
							<tr>
								<td></td>
								<td><s:property value="%{#stat.index+1}" /></td>
								<td><s:property value="CompanyName" /></td>
								<td><s:property value="UserType" /></td>
								<td><s:property value="LoginId" /></td>
								<td><s:property value="CreateDate" /></td>
								<td>
									<a class="btn btn-sm btn-warning" style="text-decoration: none;" onclick="more('viewUnderwriterMgm.action','edit','<s:property value="#record.CompanyName"/>','<s:property value="#record.LoginId"/>')" href="#"><i class="fa fa-ellipsis-h"></i></a>
								</td>
								<td><s:property value="Status" /></td>
							</tr>
							</s:iterator>
							</tbody>
						</table>
						 <s:token/>
					</s:form>
					<s:form name="lform">
					  <s:hidden  name="mode"/>
					  <s:hidden  name="issurName"/>
					  <s:hidden  name="loginId"/>
					  <s:hidden name="optionMode" />
					  <s:token/>
					</s:form>
				</div>
			</div>
		</div>
</div>
</body>
<script type="text/javascript">
function getIssuer(val, id){
	if(val.length>=2){
		var searchBy=document.getElementById("searchBy").value;
		postRequest('<%=request.getContextPath()%>/getIssuerAjaxUnderwriterMgm.action?reqFrom='+id+'&searchBy='+searchBy+'&searchValue='+val, id);
	}
}
function fnCall(from){
	if(from=='edit')
		document.info.action = from+"BrokerMgm.action?mode=edit";
	else if(from=='userDetail')
		document.info.action = "getABListUserMgm.action?mode1=broker";
	else if(from=='customerDetail')
		document.info.action = "getABListCustomerMgm.action?mode1=broker";
	else if(from=='referal')
		document.info.action = "getOCListReferal.action";
	else if(from=='openCover')
		document.info.action = "opencoverOC.action";
	else
		document.info.action = from+"BrokerMgm.action";
	document.info.submit();
}
function more(aaction,mode,name,loginId){
	document.lform.action=aaction;
	if('getNewUnderwriterMgm.action'!=aaction) {
		document.lform.mode.value=mode;
	}
	document.lform.name.value=name;
	document.lform.loginId.value=loginId;
	if('getNewUnderwriterMgm.action'==aaction){
		document.lform.optionMode.value=mode;
	} 
	document.lform.submit();
}	
</script>
</html>