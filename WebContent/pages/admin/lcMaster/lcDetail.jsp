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
		<s:if test='"useamtView".equals(display)'>
			<div class="panel panel-primary">
				<div class="panel-heading">
					<s:text name="LC Policy Report" />
				</div>			
				<div class="panel-body">
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" align="center">
							<s:text name="user.broker"/>&nbsp; : &nbsp;<b><s:property value="brokerName"/></b>
						</div>
						<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" align="center">
							<s:text name="Total LC Amount"/>&nbsp; : &nbsp;<b><s:property value="lcAmt"/></b>
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
									<th><s:text name="Customer Name" /></th>
									<th><s:text name="Policy Issue Date" /></th>
									<th><s:text name="Policy Start Date" /></th>
									<th><s:text name="Sum Insured" /></th>
									<th><s:text name="Running Balance" /></th>
								</tr>
								</thead>
								<tbody>
								<s:iterator value="lcList" status="stat" var="record">
								<tr>
									<td><s:set var="totalAmt" value="lcAmt"/></td>
									<td align="center"><s:property value="%{#stat.index+1}" /></td>								
									<td> <s:property value="POLICY_NO" /> </td>
									<td> <s:property value="NAME" /> </td>
									<td> <s:property value="POLICY_ISSUE_DATE" /> </td>
									<td> <s:property value="POLICY_START_DATE" /> </td>
									<td> <s:property value="SUM_INSURED" /> </td>
									<td align="right">
										<s:set var="totalAmt" value="%{@java.lang.Double@parseDouble(totalAmt)-@java.lang.Double@parseDouble(#myrow.SUM_INSURED)}"/>
										<s:property value="totalAmt"/>
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
							<s:submit name="back" cssClass="btn btn-sm btn-danger" value="Back" action="lcDetailsLC"/>
						</div>
					</div>
				</div>
			</div>
		</s:if>
		<s:else>
			<div class="panel panel-primary">
				<div class="panel-heading">
					<s:text name="label.lc.detail" />
					<div class="pullRight">
						<a type="button" class="btn btn-sm btn-default" href="#" onclick="forward('new','<s:property value="openCover"/>','','','addLC')">Add New LC Number</a>
					</div>
					<br class="clear" />
				</div>			
				<div class="panel-body">
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4" align="center">
							<s:text name="label.cims.policy"/>&nbsp; : &nbsp;<b><s:property value="openCover"/></b>
						</div>
						<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4" align="center">
							<s:text name="user.broker"/>&nbsp; : &nbsp;<b><s:property value="brokerName"/></b>
						</div>
						<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4" align="center">
							<s:text name="label.quote.customer"/>&nbsp; : &nbsp;<b><s:property value="custName"/></b>
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
									<th><s:text name="LC NUMBER" /></th>
									<th><s:text name="BANK NAME" /></th>
									<th><s:text name="LC AMOUNT" /></th>
									<th><s:text name="CURRENCY TYPE" /></th>
									<th><s:text name="LC DATE" /></th>
									<th><s:text name="EXPIRY DATE" /></th>
									<th><s:text name="Used Amount" /></th>
									<th><s:text name="Delete" /></th>
									<th><s:text name="EXPIRY DATE" /></th>
								</tr>
								</thead>
								<tbody>
								<s:iterator value="lcList" status="stat" var="record">
								<tr>
									<td><s:set var="totalAmt" value="lcAmt"/></td>
									<td align="center"><s:property value="%{#stat.index+1}" /></td>								
									<td> <s:property value="LC_NUMBER" /> </td>
									<td> <s:property value="bank_name" /> </td>
									<td> <s:property value="LC_AMOUNT" /> </td>
									<td> <s:property value="currency_name" /> </td>
									<td> <s:property value="LC_DATE" /> </td>
									<td> <s:property value="EXPIRY_DATE" /> </td>
									<td align="center">
										<a type="button" class="btn btn-sm btn-primary" href="#" onclick="viewUsedAmt('<s:property value="openCover"/>','<s:property value="#record.LC_ID"/>','<s:property value="#record.BANK_ID"/>','useAmtDetailsLC','<s:property value="#record.LC_AMOUNT"/>')"><s:property value="#record.USED_AMT"/></a>
									</td>
									<td align="center">
										<a type="button" class="btn btn-sm btn-warning" href="#" onclick="forward('edit','<s:property value="openCover"/>','<s:property value="#record.LC_ID"/>','<s:property value="#record.LC_NUMBER"/>','addLC')"> <i class="fa fa-edit"></i> </a>
									</td>
									<td align="center">
										<s:if test='%{0==#myrow.USED_AMT}'>
											<a type="button" class="btn btn-sm btn-danger" href="#" onclick="forward('delete','<s:property value="openCover"/>','<s:property value="#record.LC_ID"/>','<s:property value="#record.LC_NUMBER"/>','lcDeleteLC')"><i class="fa fa-remove"></i></a>
										</s:if>
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
							<s:submit name="bck" cssClass="btn btn-sm btn-danger" value="Back" action="%{from1}LC"/>
						</div>
					</div>
				</div>
			</div>
		</s:else>
	</div>
</div>
<s:hidden name="openCover" id="openCover"/>
<s:hidden name="brokerName" id="brokerName"/>
<s:hidden name="lcNum" id="lcNum"/>
<s:hidden name="lcId" id="lcId"/>
<s:hidden name="custName" id="custName"/>
<s:hidden name="from1" id="from1"/>
<s:hidden name="from" id="from"/>
<s:hidden name="broker" id="broker"/>
<s:hidden name="bank" id="bank"/> 
<s:hidden name="lcAmt" id="lcAmt"/>
<s:token/>
</s:form>
<script type="text/javascript">
function viewUsedAmt(openCover, lcId,bank, action,lcAmt){
	document.info.openCover.value=openCover;
	document.info.bank.value=bank;
	document.info.lcId.value=lcId;
	document.info.lcAmt.value=lcAmt; 
	document.info.action=action+".action?lcAmtc="+lcAmt;
	document.info.submit(); 
}

function forward(from,openCover, lcId, lcNumber, action){
	conf=true;
	document.info.openCover.value=openCover;
	document.info.lcNum.value=lcNumber;
	document.info.lcId.value=lcId;
	document.info.from.value=from; 
	if(from=='view')
	document.info.bank.value=lcNumber;
	if(from=='delete'){
		conf=confirm('Are you want to delete LC Number of '+lcNumber+"?");
	}
	if(conf){
		document.info.action=action+".action";
		document.info.submit();
	}
}
</script>
</body>
</html>