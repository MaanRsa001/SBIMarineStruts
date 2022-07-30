<%@ page isELIgnored="false" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>
<!DOCTYPE HTML>
<html>
<head>
	<title> ::: AlRajhi - Customer List ::: </title>
	<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/AlRajhi_icon_header.jpg" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.responsive.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.jqueryui.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.tableTools.css">
	<link href="<%=request.getContextPath()%>/dataTables/css/jquery-start-ui.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.jqueryui.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.responsive.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.tableTools.js"></script>
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
						<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="User Details" onclick="fnCall('userDetail')"/>
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
				<div class="row">
					<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12">
               	 		<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="Statistics" onclick="fnCall('statistics')"/>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:property value="borganization"/>(<s:property value="agencyCode"/>)
			</div>
	</s:if>
	<s:else>
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="Customer Management" />
			</div>	
	</s:else>
			<div class="panel-body">
				<s:form name="info" id="info" method="post" action="" theme="simple" validate="false">
					<table class="display responsive no-wrap" id="record" width="100%" cellspacing="0">
						<thead>
						<tr>
							<th class="no-sort"></th>
							<th><s:text name="S.No." /></th>
							<th><s:text name="Customer Name" /></th>
							<th><s:text name="Customer Code" /></th>
							<th><s:text name="Broker Name" /></th>
							<th><s:text name="Created Date" /></th>
							<th><s:text name="More" /></th>
						</tr>
						</thead>
						<tbody>
						<s:iterator value="customerList" status="stat" var="record">
						<tr>
							<td></td>
							<td><s:property value="%{#stat.index+1}" /></td>
							<td><s:property value="COMPANY_NAME" /></td>
							<td><s:property value="customer_id" /></td>
							<td><s:property value="broker_name" /></td>
							<td><s:property value="ENTRY_DATE" /></td>
							<td>
								<a class="btn btn-sm btn-warning" style="text-decoration: none;" type="button" href="#" class="btn btn-sm btn-primary" onclick="forward('view','<s:property value="#record.customer_id"/>');" style="text-decoration: none;" ><i class="fa fa-ellipsis-h"></i></a>
							</td>
						</tr>
						</s:iterator>
						</tbody>						
					</table>
					<s:hidden name="borganization"/>
					<s:hidden name="agencyCode" id="agencyCode"/>
					<s:hidden name="customerId" id="customerId"/>
					<s:hidden name="login_Id" />
					<s:token/>
				</s:form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
function getCustomer(val, id){
	if(val.length>=2){
		var searchBy=document.getElementById("searchBy").value;
		var aCode=document.getElementById("agencyCode").value;
		postRequest('<%=request.getContextPath()%>/getCustomerAjaxCustomerMgm.action?agencyCode='+aCode+'&reqFrom='+id+'&searchBy='+searchBy+'&searchValue='+val, id);
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
function forward(from,val){
	document.getElementById("customerId").value=val;
	document.info.action ="viewCustomerMgm.action?mode=edit";
	document.info.submit();
}
</script>
</body>
</html>