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
</head>
<body>
<s:form id="info" name="info" theme="simple">
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<s:if test='"lcview".equals(display)'>
			<div class="panel panel-primary">
				<div class="panel-heading">
					<s:text name="label.exist.policies" />
				</div>			
				<div class="panel-body">
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
							<s:text name="user.broker"/>&nbsp; : &nbsp;<b><s:property value="brokerName"/></b>
						</div>
					</div>
					<br/>
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<table class="display responsive no-wrap" id="record" width="100%" cellspacing="0">
								<thead>
								<tr>
									<th class="no-sort"></th>
									<th><s:text name="S.No." /></th>
									<th><s:text name="Core Application Policy No" /></th>
									<th><s:text name="Open Cover No" /></th>
									<th><s:text name="Customer Name" /></th>
									<th><s:text name="Open Cover Date" /></th>
									<th><s:text name="Validity Period" /></th>
									<th><s:text name="LC Details" /></th>
								</tr>
								</thead>
								<tbody>
								<s:iterator value="lcList" status="stat" var="record">
								<tr>
									<td></td>
									<td align="center"><s:property value="%{#stat.index+1}" /></td>								
									<td> <s:property value="MISSIPPI_OPENCOVER_NO" /> </td>
									<td> <s:property value="open_cover_no" /> </td>
									<td> <s:property value="cust_name" /> </td>
									<td> <s:property value="inception_date" /> </td>
									<td> <s:property value="expiry_date" /> </td>
									<td align="center">
										<s:if test='%{!"NONE".equals(LC_NUMBER)}'>
											<a type="button" class="btn btn-sm btn-primary" style="color: #ffffff;" href="#" onclick="forward('<s:property value="broker"/>','<s:property value="brokerName"/>','lcDetailsLC','<s:property value="open_cover_no"/>','<s:property value="cust_name"/>')">View</a>
										</s:if>
										<s:else> &nbsp; </s:else>
									</td>											
								</tr>
								</s:iterator>
								</tbody>
							</table>
						</div>
					</div>
					<br class="clear" />
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
							<s:submit name="back" cssClass="btn btn-sm btn-danger" value="Back" action="listLC"/>
						</div>
					</div>
				</div>
			</div>
		</s:if>
		<s:elseif test='"ocview".equals(display)'>
			<div class="panel panel-primary">
				<div class="panel-heading">
					<s:text name="label.exist.policies" />
				</div>			
				<div class="panel-body">
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
							<s:text name="user.broker"/>&nbsp; : &nbsp;<b><s:property value="brokerName"/></b>
						</div>
					</div>
					<br/>
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<table class="display responsive no-wrap" id="record" width="100%" cellspacing="0">
								<thead>
								<tr>
									<th class="no-sort"></th>
									<th><s:text name="S.No." /></th>
									<th><s:text name="Core Application Policy No" /></th>
									<th><s:text name="Open Cover No" /></th>
									<th><s:text name="Customer Name" /></th>
									<th><s:text name="Open Cover Date" /></th>
									<th><s:text name="Validity Period" /></th>
									<th><s:text name="LC Details" /></th>
								</tr>
								</thead>
								<tbody>
								<s:iterator value="lcList" status="stat" var="record">
								<tr>
									<td></td>
									<td align="center"><s:property value="%{#stat.index+1}" /></td>								
									<td> <s:property value="MISSIPPI_OPENCOVER_NO" /> </td>
									<td> <s:property value="open_cover_no" /> </td>
									<td> <s:property value="cust_name" /> </td>
									<td> <s:property value="inception_date" /> </td>
									<td> <s:property value="expiry_date" /> </td>
									<td align="center">
										<s:if test='%{!"NONE".equals(LC_NUMBER)}'>
											<a type="button" class="btn btn-sm btn-primary" style="color: #ffffff;" href="#" onclick="forward('<s:property value="broker"/>','<s:property value="brokerName"/>','lcDetailsLC','<s:property value="open_cover_no"/>','<s:property value="cust_name"/>')">View</a>
										</s:if>
										<s:else> &nbsp; </s:else>
									</td>											
								</tr>
								</s:iterator>
								</tbody>
							</table>
						</div>
					</div>
					<br class="clear" />
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
							<s:submit name="back" cssClass="btn btn-sm btn-danger" value="Back" action="listLC"/>
						</div>
					</div>
				</div>
			</div>
		</s:elseif>
		<s:else>
			<div class="panel panel-primary">
				<div class="panel-heading">
					<s:text name="label.lc.master.list" />
				</div>			
				<div class="panel-body">
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<table class="display responsive no-wrap" id="record" width="100%" cellspacing="0">
								<thead>
								<tr>
									<th class="no-sort"></th>
									<th><s:text name="S.No." /></th>
									<th><s:text name="Broker Company Name" /></th>
									<th><s:text name="Total OpenCovers" /></th>
									<th><s:text name="Total LC Numbers" /></th>
								</tr>
								</thead>
								<tbody>
								<s:iterator value="lcList" status="stat" var="record">
								<tr>
									<td></td>
									<td align="center"><s:property value="%{#stat.index+1}" /></td>								
									<td> <s:property value="COMPANY_NAME" /> </td>
									<td align="center">
										<a type="button" class="btn btn-sm btn-info" href="#" onclick="forward('<s:property value="LOGIN_ID_1"/>','<s:property value="COMPANY_NAME"/>','ocViewLC','','')"><s:property value="OPEN_COVER_COUNT"/></a>
									</td>
									<td align="center">
										<s:if test='%{"".equals(LC_NUMBER_COUNT) || LC_NUMBER_COUNT==null}'>0</s:if>
										<s:else><a type="button" class="btn btn-sm btn-info" href="#" onclick="forward('<s:property value="LOGIN_ID_1"/>','<s:property value="COMPANY_NAME"/>','lcViewLC','','')"><s:property value="LC_NUMBER_COUNT"/></a></s:else>
									</td>						
								</tr>
								</s:iterator>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</s:else>
	</div>
</div>
<s:hidden name="broker" id="broker1"/>
<s:hidden name="brokerName" id="brokerName1"/>
<s:hidden name="openCover" id="openCover1"/>
<s:hidden name="custName" id="custName1"/>
<s:hidden name="from1" id="from1"/>
<s:token/>
</s:form>
<script type="text/javascript">
function forward(broker, bname, action, openCover, custName){
	document.getElementById('broker1').value=broker;
	document.getElementById('brokerName1').value=bname;
	document.getElementById('openCover1').value=openCover;
	document.getElementById('custName1').value=custName;
	document.info.action=action+".action";
	document.info.submit();
}
</script>
</body>
</html>