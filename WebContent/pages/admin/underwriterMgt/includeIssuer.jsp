<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ page language="java" import="com.maan.report.service.ReportService"%>
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
	<div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
		<div class="panel panel-primary">
			<div class="panel-body">
				<div class="row">
					<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12">
						<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="Underwriter Details" onclick="fnCall('list')"/> 
					</div>
					<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12">
						<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="Change Password" onclick="fnCall('changePwd')"/>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12">
						<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="Included Brokers" onclick="fnCall('include')"/> 
					</div>
					<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12">
						<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="Excluded Brokers" onclick="fnCall('exclude')"/>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-xs-12 col-sm-12 col-md-9 col-lg-9">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:if test='%{borganization!=null && borganization!=""}'>
					<s:property value="borganization"/>(<s:property value="agencyCode"/>)
				</s:if>
				<s:else>
					<s:property value="loginId"/>
				</s:else>
			</div>
			<div class="panel-body">
				<s:form id="info" name="underwriter" method="post" action="updateExcludeUnderwriterMgm" theme="simple">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">	
						<div class="panel panel-primary">
							<div class="panel-heading">
								<s:text name="INCLUDED BROKER" />
							</div>
							<div class="panel-body">
								<div id="underwriterInfo">
									<input name="type[0]" type="hidden" value="hi"/>
									<table class="display responsive no-wrap" id="record" width="100%" cellspacing="0">
										<thead>
										<tr>
											<th class="no-sort"></th>
											<th><s:text name="Select" /></th>
											<th><s:text name="Broker Code" /></th>
											<th><s:text name="Broker Name" /></th>
											<th><s:text name="Branch" /></th>
											<th><s:text name="Products" /></th>
										</tr>
										</thead>
										<tbody>
										<s:iterator value="includeIssuer" status="stat" var="record">
										<tr>
											<td><s:property value="%{#stat.index+1}" /></td>
											<td> 
												<s:checkboxlist name="status[%{#stat.index}]" list="#{'exclude':''}" />
												<s:hidden name="brokerCode[%{#stat.index}]" id="brokerCode[%{#stat.index}]" value="%{AgencyCode}"/> 
											</td>
											<td> <s:property value="AgencyCode" /> </td>
											<td> <s:property value="CompanyName" /> </td>
											<td> <s:property value="BranchName" /> </td>
											<td> <s:checkboxlist name="productId[%{#stat.index}]" list="productList" listKey="ProductId" listValue="ProductName"/> </td>
										</tr>
										</s:iterator>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
						<input name='type[<s:property value="%{underwriterInfo.size+1}"/>]' type="hidden" value="oi"/>
						<s:hidden name="loginId" /><s:submit type="button" name="Submit" value="Submit" cssClass="btn btn-sm btn-success" />
					</div>
				</div>
				 <s:token/>
				</s:form>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
function fnCall(from){
	if(from=='edit')
		document.underwriter.action ="viewUnderwriterMgm.action?mode=edit";
	else if(from=='list')
		document.underwriter.action = "UnderwriterCreationContoller.action";
	else if(from=='changePwd')
		document.underwriter.action = "changePassUnderwriterMgm.action?mode=changePass";	
	else if(from=='include')
		document.underwriter.action = "includeIssuerUnderwriterMgm.action?type1=include";
	else if(from=='exclude')
		document.underwriter.action = "excludeIssuerUnderwriterMgm.action?type1=exclude";
	else if(from=='openCover')
		document.info.action = "opencoverOC.action";
	else if(from=='statistics')
		document.info.action = "statisticsRE.action";
	<%--alert(from);
		postRequest('<%=request.getContextPath()%>/getABListCustomerMgm.action?agencyCode=10016&borganization='+'<s:property value="borganization"/>'+'&bcode='+'<s:hidden name="bcode"/>'+'&mode=mainTab', 'mainTab');
	}--%>else
		document.underwriter.action = from+"BrokerMgm.action";
	document.underwriter.submit();
}
</script>
</html>