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
				<div class="row">
					<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12">
						<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="View" onclick="fnCall('view')"/>
					</div>
					<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12">
						<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="Edit" onclick="fnCall('edit')"/>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12">
                		<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="Change Password" onclick="fnCall('changePwd')"/>
					</div>
					<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12">
						<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="Customer Details" onclick="fnCall('customerDetail')"/>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12">
                		<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="OpenCover" onclick="fnCall('openCover')"/>
					</div>
					<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12">
						<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="Referral" onclick="fnCall('referal')"/>
					</div>
				</div>
				<!-- <div class="row">
					<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12">
               	 		<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="Statistics" onclick="fnCall('statistics')"/>
					</div>
				</div> -->
			</div>
		</div>
	</div>
	<div class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:property value="borganization"/>(<s:property value="agencyCode"/>)
				<div class="pullRight">
					<a class="btn btn-sm btn-info" type="button" style="text-decoration: none;" title="Customer Creation" href="editUserMgm.action?mode=new&agencyCode=<s:property value="agencyCode"/>&borganization=<s:property value="borganization"/>"><i class="glyphicon glyphicon-plus"></i></a>
				</div>
				<br class="clear" />
			</div>
	</s:if>
	<s:else>
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="User Management" />
				<div class="pullRight">
					<a class="btn btn-sm btn-info" type="button" style="text-decoration: none;" title="Customer Creation" href="editUserMgm.action?mode=new&agencyCode=<s:property value="agencyCode"/>&borganization=<s:property value="borganization"/>"><i class="glyphicon glyphicon-plus"></i></a>
					
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
							<th><s:text name="User Name" /></th>
							<th><s:text name="User Code" /></th>
							<th><s:text name="Login Id" /></th>
							<th><s:text name="Broker Name" /></th>
							<th><s:text name="Created Date" /></th>
							<th><s:text name="More" /></th>
							<th><s:text name="Status" /></th>
						</tr>
						</thead>
						<tbody>
						<s:iterator value="userList" status="stat" var="record">
						<tr>
							<td></td>
							<td><s:property value="%{#stat.index+1}" /></td>
							<td><s:property value="CompanyName" /></td>
							<td><s:property value="AgencyCode" /></td>
							<td><s:property value="LoginId" /></td>
							<td><s:property value="BrokerName" /></td>								
							<td><s:property value="CreateDate" /></td>
							<td>
								<a class="btn btn-sm btn-warning" style="text-decoration: none;" type="button" href='viewUserMgm.action?mode=edit&uagencyCode=<s:property value="#record.AgencyCode"/>&borganization=<s:property value="borganization"/>&agencyCode=<s:property value="agencyCode"/>' class="btn btn-sm btn-primary" style="text-decoration: none;" ><i class="fa fa-ellipsis-h"></i></a>
							</td>
							<td><s:property value="Status" /></td>
						</tr>
						</s:iterator>
						</tbody>
					</table>
					<s:hidden name="borganization"/>
					<s:hidden name="mode1"/>
					<s:hidden name="agencyCode" id="agencyCode"/>
					<s:hidden name="login_Id"/>
					<s:token/>
				</s:form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
function getUser(val, id){
	if(val.length>=2){
		var searchBy=document.getElementById("searchBy").value;
		var aCode=document.getElementById("agencyCode").value;
		postRequest('<%=request.getContextPath()%>/getUserAjaxUserMgm.action?agencyCode='+aCode+'&reqFrom='+id+'&searchBy='+searchBy+'&searchValue='+val, id);
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
		document.info.action = "opencoverBrokerMgm.action";
	else
		document.info.action = from+"BrokerMgm.action";
	document.info.submit();
}
</script>
</body>
</html>