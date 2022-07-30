<%@ page isELIgnored="false" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>
<!DOCTYPE HTML>
<html>
<head>
	<title> ::: SAICO - Reports ::: </title>
	<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/saicoHeaderLogo.jpg" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.responsive.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.jqueryui.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.tableTools.css">
	<link href="<%=request.getContextPath()%>/dataTables/css/jquery-start-ui.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.jqueryui.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.responsive.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.tableTools.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datepicker/jquery-ui.css">
	<script src="<%=request.getContextPath()%>/datepicker/jquery-ui.js"></script>
	<script type="text/javascript">
  	jQuery(function ($) {
  		try {
			var data1 = $('.display').dataTable( {
				"lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
				"order": [[ 0, "asc" ]],
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
<s:form id="bulkReport" name="bulkReport" action="" theme="simple">
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			<div class="panel panel-primary">
			<s:if test="mode1 != 'BrokerCnt'">
			<div class="panel-heading">
				<s:text name="Bulk Report Print" />
			</div>			
			<div class="panel-body">
				<div class="row">
					<div class="col-xs-12">
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
								<s:actionerror cssStyle="color: red;" />
							</div>
						</div>
						<s:if test="mode1 != 'count' && mode1 != 'broker'">
							<div class="row">
								<br class="clear">
								<table class="tableWidth">
									<tr>
										<td width="50%"><s:text name="Start Date" /><font color="red">*</font></td>
										<td width="50%"><s:textfield id="startDate" name="startDate" cssClass="inputBox datepicker" readonly="true"/></td>
									</tr>
									<tr><td colspan="2" height="5"></td></tr>
									<tr>
										<td><s:text name="End Date" /><font color="red">*</font></td>
										<td><s:textfield id="endDate" name="endDate" cssClass="inputBox datepicker" readonly="true" /></td>
									</tr>
								</table>
								<br class="clear">
								<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
								<br class="clear">
									<input type="button" class="btn btn-sm btn-success" value="Submit" onclick="fnSubmit('Countop');" />
									<input type="button" class="btn btn-sm btn-danger" value=" Back " onclick="fnBack12();" />
								</div>
								<!-- <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
								<br class="clear">
									
								</div> -->
							</div>
							</s:if>
						</div>
					</div>
					<s:if test="mode1 == 'count'">
					<div class="row">
						<div class="col-xs-12">
							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" align="center">
								<label><s:text name="label.start.date"/>&nbsp; : &nbsp;</label><s:property value="startDate"/><s:hidden name="startDate" />
							</div>
							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" align="center">
								<label><s:text name="label.end.date"/>&nbsp; : &nbsp;</label><s:property value="endDate"/><s:hidden name="endDate" />
							</div>
							<br class="clear" />
							<br class="clear" />
							<div class="panel-heading">
								<s:text name="label.op.user.bulk" />
							</div>			
							<div class="panel-body">
								<div class="row">
									<table class="table table-bordered" id="record" width="100%" cellspacing="0">
										<thead>
										<tr>
											<th> <s:text name="label.s.no" /> </th>
											<th> <s:text name="label.op.user" /> </th>
											<th> <s:text name="label.op.count" /> </th>
											<th> <s:text name="label.schedule" /> </th>
											<th> <s:text name="label.debit" /> </th>
											<th> <s:text name="label.credit" /> </th>
											<th> <s:text name="Details" /> </th>
										</tr>
										</thead>
										<tbody>
										<s:iterator value="bulkPrintOPList" status="stat" var="list">
										<tr>
											<td ><s:property value="#stat.count"/></td>
											<td><s:property value="#list.USERNAME"/></td>
											<td align="center"> <span class="badge"><s:property value="#list.TOTAL_POLICY"/></span> </td>
											<td align="center"> <button class="btn btn-sm btn-primary" onclick="fnSchedule('schedule','','opschedule','<s:property value="#list.APPLICATION_ID"/>');"> <i class="fa fa-file-pdf-o"></i></button></td>
											<td align="center"> <button class="btn btn-sm btn-info" onclick="fnSchedule('debit','','opschedule','<s:property value="#list.APPLICATION_ID"/>');"> <i class="fa fa-file-pdf-o"></i></button></td>
											<td align="center"> <button class="btn btn-sm btn-warning" onclick="fnSchedule('credit','','opschedule','<s:property value="#list.APPLICATION_ID"/>');"> <i class="fa fa-file-pdf-o"></i></button></td>
											<td align="center"> <button class="btn btn-sm btn-success" onclick="fnDetail('Countop','','opschedule','<s:property value="#list.APPLICATION_ID"/>')"> <i class="fa fa-file-pdf-o"></i></button></td>
										</tr>
										</s:iterator>
										</tbody>
									</table>
							</div>
						</div>
						<br/>
						<div class="panel-heading">
						<s:text name="label.broker.report" />
						</div>			
							<div class="panel-body">
								<div class="row">
									<table class="table table-bordered" id="record" width="100%" cellspacing="0">
										<thead>
										<tr>
											<th> <s:text name="label.s.no" /> </th>
											<th> <s:text name="label.broker" /> </th>
											<th> <s:text name="label.count" /> </th>
											<th> <s:text name="label.schedule" /> </th>
											<th> <s:text name="label.debit" /> </th>
											<th> <s:text name="label.credit" /> </th>
											<th> <s:text name="Details" /> </th>
										</tr>
										</thead>
										<tbody>
										<s:iterator value="bulkPrintBRList" status="stat" var="record">
										<tr>
											<td ><s:property value="#stat.count"/></td>
											<td ><s:property value="#record.COMPANY_NAME"/></td>
											<td align="center"> <span class="badge"><s:property value="#record.TOTAL_POLICY"/></span> </td>
											<td align="center"> <button class="btn btn-sm btn-primary" onclick="fnSchedule('schedule','<s:property value="#record.LOGIN_ID"/>','brschedule','');"> <i class="fa fa-file-pdf-o"></i></button></td>
											<td align="center"> <button class="btn btn-sm btn-info" onclick="fnSchedule('debit','<s:property value="#record.LOGIN_ID"/>','brschedule','');"> <i class="fa fa-file-pdf-o"></i></button></td>
											<td align="center"> <button class="btn btn-sm btn-warning" onclick="fnSchedule('credit','<s:property value="#record.LOGIN_ID"/>','brschedule','');"> <i class="fa fa-file-pdf-o"></i></button></td>
											<td align="center"> <button class="btn btn-sm btn-success" onclick="fnDetail('Countop','<s:property value="#record.LOGIN_ID"/>','brppschedule','')"> <i class="fa fa-file-pdf-o"></i></button></td>
										</tr>
										</s:iterator>
										</tbody>
									</table>
								</div>
								</div>
							</div>
						</div>
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
						<br class="clear">
							<input type="button" class="btn btn-sm btn-danger" value="Back" onclick="fnBack();" />
						</div>
						</s:if>
						<s:if test="mode1 == 'broker'">
						<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" align="center">
								<label><s:text name="label.start.date"/>&nbsp; : &nbsp;</label><s:property value="startDate"/><s:hidden name="startDate" />
							</div>
							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" align="center">
								<label><s:text name="label.end.date"/>&nbsp; : &nbsp;</label><s:property value="endDate"/><s:hidden name="endDate" />
							</div>
							<br class="clear" />
							<br class="clear" />
						<div class="panel-heading">
						<s:text name="label.broker.report" />
						<div class="pullRight"><s:text name="label.op.user" />: <div class="label label-warning" ><s:property value="userName" /></div></div>
						</div>			
						<div class="panel-body">
								<div class="row">
									<table class="table table-bordered" id="record" width="100%" cellspacing="0">
										<thead>
										<tr>
											<th> <s:text name="label.s.no" /> </th>
											<th> <s:text name="label.broker" /> </th>
											<th> <s:text name="label.opcpver.no" /> </th>
											<th> <s:text name="label.count" /> </th>
											<th> <s:text name="label.schedule" /> </th>
											<th> <s:text name="label.debit" /> </th>
											<th> <s:text name="label.credit" /> </th>
										</tr>
										</thead>
										<tbody>
										<s:iterator value="bulkPrintBRList" status="stat" var="record">
										<tr>
											<td><s:property value="#stat.count"/></td>
											<td><s:property value="#record.COMPANY_NAME"/></td>
											<td><s:property value="#record.OPEN_COVER_NO"/></td>
											<s:if test="reqFrom == 'brpschedule'">
											<td align="center"> <span class="badge"><s:property value="#record.TOTAL_POLICY"/></span> </td>
											<td align="center"> <button class="btn btn-sm btn-primary" onclick="fnSchedule1('schedule','<s:property value="#record.LOGIN_ID"/>','brppschedule','<s:property value="#record.OPEN_COVER_NO"/>','<s:property value="#record.APPLICATION_ID"/>');"> <i class="fa fa-file-pdf-o"></i></button></td>
											<td align="center"> <button class="btn btn-sm btn-info" onclick="fnSchedule1('debit','<s:property value="#record.LOGIN_ID"/>','brppschedule','<s:property value="#record.OPEN_COVER_NO"/>','<s:property value="#record.APPLICATION_ID"/>');"> <i class="fa fa-file-pdf-o"></i></button></td>
											<td align="center"> <button class="btn btn-sm btn-warning" onclick="fnSchedule1('credit','<s:property value="#record.LOGIN_ID"/>','brppschedule','<s:property value="#record.OPEN_COVER_NO"/>','<s:property value="#record.APPLICATION_ID"/>');"> <i class="fa fa-file-pdf-o"></i></button></td>
											</s:if>
											<s:else>
											<td align="center"> <span class="badge"><s:property value="#record.TOTAL_POLICY"/></span> </td>
											<td align="center"> <button class="btn btn-sm btn-primary" onclick="fnSchedule1('schedule','<s:property value="#record.LOGIN_ID"/>','brpschedule','<s:property value="#record.OPEN_COVER_NO"/>','<s:property value="#record.APPLICATION_ID"/>');"> <i class="fa fa-file-pdf-o"></i></button></td>
											<td align="center"> <button class="btn btn-sm btn-info" onclick="fnSchedule1('debit','<s:property value="#record.LOGIN_ID"/>','brpschedule','<s:property value="#record.OPEN_COVER_NO"/>','<s:property value="#record.APPLICATION_ID"/>');"> <i class="fa fa-file-pdf-o"></i></button></td>
											<td align="center"> <button class="btn btn-sm btn-warning" onclick="fnSchedule1('credit','<s:property value="#record.LOGIN_ID"/>','brpschedule','<s:property value="#record.OPEN_COVER_NO"/>','<s:property value="#record.APPLICATION_ID"/>');"> <i class="fa fa-file-pdf-o"></i></button></td>
											</s:else>
										</tr>
										</s:iterator>
										</tbody>
									</table>
							</div>
						</div>
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
						<br class="clear">
							<input type="button" class="btn btn-sm btn-danger" value="Back" onclick="fnSubmit('Countop');" />
						</div>
						</s:if>
					</div>
				</s:if>
			</div>
		</div>
	</div>
	<s:token/>
</s:form>
<script type="text/javascript">
function fnSubmit(val){
	document.bulkReport.action ='bulkPrintOPListReport.action?mode='+val;
	document.bulkReport.submit();
}
function fnDetail(mode,loginId,reqFrom,appId){
	document.bulkReport.action ='bulkPrintBRListReport.action?mode='+mode+'&brloginId='+loginId+'&reqFrom='+reqFrom+'&appId='+appId;
	document.bulkReport.submit();
}
function fnBack(val){
	document.bulkReport.action = 'bulkPrintReport.action';
	document.bulkReport.submit();
}
function fnSchedule(mode,loginId,reqFrom,appId){
	document.bulkReport.action = 'scheduleReport.action?mode='+mode+'&brloginId='+loginId+'&reqFrom='+reqFrom+'&appId='+appId;
	document.bulkReport.submit();
}
function fnSchedule1(mode,loginId,reqFrom,opcover,appId){
	document.bulkReport.action = 'scheduleReport.action?mode='+mode+'&brloginId='+loginId+'&reqFrom='+reqFrom+'&opCoverNo='+opcover+'&appId='+appId;
	document.bulkReport.submit();
}
function fnBack12(){
	document.bulkReport.action = 'viewOpenCoverReport.action';
	document.bulkReport.submit();
}
</script>
</body>
</html>