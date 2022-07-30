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
	<div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
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
						<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="OpenCover" onclick="fnCall('customerDetail')"/>
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
	<div class="col-xs-12 col-sm-12 col-md-9 col-lg-9">
		<s:form id="info" name="info" theme="simple">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:property value="borganization"/>(<s:property value="agencyCode"/>)
			</div>
			<div class="panel-body">
				<div id="portfo">
					<table class="display responsive no-wrap" id="record" width="100%" cellspacing="0">
						<thead>
						<tr>
							<th class="no-sort"></th>
							<th><s:text name="Core Application Policy No" /></th>
							<th><s:text name="Proposal No" /></th>
							<th><s:text name="Customer Name" /></th>
							<th><s:text name="Policy Start Date" /></th>
							<th><s:text name="Policy End date" /></th>
							<th><s:text name="Schedule" /></th>
							<th><s:text name="LC Details" /></th>
						</tr>
						</thead>
						<tbody>
						<s:iterator value="portfolioList" status="stat" var="record">
						<tr>
							<td></td>
							<td><s:property value="MISSIPPI_OPENCOVER_NO" /></td>
							<td><s:property value="PROPOSAL_NO" /></td>
							<td><s:property value="CUSTOMER_NAME" /></td>
							<td><s:property value="START_DATE" /></td>
							<td><s:property value="END_DATE" /></td>						
							<td align="center">
								<a href="#" type="button" class="btn btn-sm btn-info" onclick="fndoc('<s:property value="#record.MISSIPPI_OPENCOVER_NO"/>', '<s:property value="session.user"/>', 'schedule', '<s:property value="#record.MISSIPPI_OPENCOVER_NO"/>', '', '<s:property value="#record.proposal_no"/>', 'false')"> <i class="fa fa-book"></i> </a>
							</td>
							<td align="center">
								<a href="#" type="button" class="btn btn-sm btn-default" onclick="fnlcdetail('<s:property value="#record.MISSIPPI_OPENCOVER_NO"/>', '<s:property value="#record.PROPOSAL_NO"/>', '<s:property value="session.user"/>')"><i class="fa fa-eye"></i></a>
							</td>
						</tr>
						</s:iterator>
						</tbody>						
					</table>
				</div>
			</div>
		</div>
		<s:hidden name="agencyCode"/>
		<s:hidden name="borganization"/>
		<s:hidden name="bcode"/>
		<s:hidden name="firstname"/>
		<s:token/>
		</s:form>
	</div>
</div>
<script type="text/javascript">
function fndoc(policynumber,loginId,docType,docNo,amendId,proposalNo,endtstatus){
 	var URL ="<%=request.getContextPath()%>/scheduleOC.action?docType="+docType+"&policynumber="+policynumber+"&loginId="+loginId+"&docNo="+docNo+"&amendId="+amendId+"&proposalNo="+proposalNo+"&endtstatus="+endtstatus;
 	viewPopUp(URL);
 }
function fnlcdetail(policynumber, proposalNo ,loginId){
 	var URL ="<%=request.getContextPath()%>/lcDetailOC.action?policynumber="+policynumber+"&loginId="+loginId+"&proposalNo="+proposalNo;
 	viewPopUp(URL);
 }
function fnTab(val, reqFrom, value, index){
	if(reqFrom=="portfo"){
		postRequest('<%=request.getContextPath()%>/getPortfolioOC.action?broker='+val+'&reqFrom='+reqFrom+'&index=2&from1=ajax', reqFrom);
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
$(function(){
	var index = '<s:property value="index"/>';
	var t = $('#tabs');
	var tabs = t.tabs('tabs');
		t.tabs('select', tabs[index].panel('options').title);
});
function viewPopUp() {
	var bwidth = window.innerWidth;
	var bwidth1 = document.body.clientWidth;
	if(bwidth <= 768) {
		return popUp(URL,bwidth1,'500');
	} else {
		return popUp(URL,'750','500');
	}
}
</script>
</body>
</html>