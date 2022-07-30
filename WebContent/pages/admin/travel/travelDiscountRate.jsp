<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
	<SCRIPT language=Javascript>
		function isNumberKey(evt) {
			var charCode = (evt.which) ? evt.which : event.keyCode;
			if (charCode != 46 && charCode > 31 
			&& (charCode < 48 || charCode > 57))
			return false;
			return true;
		}
	</SCRIPT>
	<script type="text/javascript" src="pages/admin/ratingEngine/menu.js"> </script>
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
				var data = $('#gridTableMake').dataTable( {
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
<s:form name="form1"  method="post" theme="simple">
<s:if test ="display==null or display == ''">
<div class="container-fluid">
	<div class="row">
		<div class="col-xs-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<s:text name="travel.discountrate"/>
					<div class="pullRight">
						<input type="button" name="sub" value="Add More" onclick="fnsubmit(this.form,'new','')" class="btn btn-sm btn-default" />
					</div>
					<br class="clear" />
				</div>
				<div class="panel-body">
				<div class="row">
						<div class="col-xs-12">
							<s:actionerror cssStyle="color: red;" />
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
							<div class="form-group">
								<label><s:text name="ChooseProduct" /><font color="red">*</font></label>
								<s:select name="product" id="product" list="#{'31':'Travel Insurance Walla'}" cssClass="inputBoxS" />
								
							</div>
						</div>
					</div>
					<br class="clear" />    
					<div class="row">
						<div class="col-xs-12">
							<table class="display responsive no-wrap" id="gridTableMake" width="100%" cellspacing="0">
								<thead>
								<tr>
									<th class="no-sort"><s:text name="S.No."/></th>
									<th><s:text name="Age Start"/></th>
									<th><s:text name="Age End"/></th>
									<th><s:text name="Rate Value"/></th>
									<th><s:text name="Type"/></th>
									<th><s:text name="Core App Code"/></th>
									<th><s:text name="Effective Date" /></th>
									<th><s:text name="Status"/></th>
									<th><s:text name="View"/></th>
									<th><s:text name="Edit"/></th>										
								</tr>
								</thead>
								<tbody>
									<s:iterator value="list" var="list" status="stat">
										<tr>
											<td><s:property value="#stat.count" /></td>
											<td><s:property value="AGE_START" /></td>
											<td><s:property value="AGE_END" /></td>
											<td><s:property value="RATE_VALUE" /></td>
											<td><s:property value="TYPE" /></td>
											<td><s:property value="COREAPP_CODE" /></td>
											<td><s:property value="EFFECTIVE_DATE" /></td>
											<td><s:property value="STATUS" /></td>
											<td style="text-align: center;">
												<!-- <a type="button" class="btn btn-sm btn-info" href="#" onclick="return callPopup('<%=request.getContextPath()%>/premiumrateTravelConfigure.action?display=history&disId=<s:property value="RATE_ID" />');">View</a> -->
												<!--  <a type="button" class="btn btn-sm btn-info" href="#" onclick="return popUp('<%=request.getContextPath()%>/discountrateTravelConfigure.action?display=history&drateId=<s:property value="RATE_ID" />','400','350');">View</a>-->
												<a type="button" class="btn btn-sm btn-info" href="#" onclick="$('#discountRateView<s:property value="#stat.count"/>').modal('show')">View</a>
											</td>
											<td style="text-align: center;">
												<input type="button" name="reset" value="Edit" onclick="return fnsubmit(this.form,'edit','<s:property value="RATE_ID" />');" class="btn btn-sm btn-warning" />
											</td>
										</tr>
									</s:iterator>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</s:if>
<s:elseif test="'edit'.equalsIgnoreCase(display) || 'new'.equalsIgnoreCase(display)">
<div class="container-fluid">
	<div class="row">
		<div class="col-xs-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<s:text name="travel.discountrate"/>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-xs-12">
							<s:actionerror cssStyle="color: red;" />
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
							<div class="form-group">
								<label><s:text name="travel.choose.type" /><font color="red">*</font></label>
								<!--<s:select name="disType" id="disType" list="#{'Self':'SELF','Spouse':'SPOUSE','Family':'FAMILY','Group':'GROUP'}" headerKey="" headerValue="---Select---" cssClass="inputBox" />
								<s:select name="disType" id="disType" list="#{'Child':'Child','Adult':'Adult'}" headerKey="" headerValue="---Select---" cssClass="inputBox" />-->
								<s:select name="disType" id="disType" list="travelRelationList" headerKey="" headerValue="---Select---" cssClass="inputBoxS" listKey="RSACODE" listValue="DETAIL_NAME"/>
								
							</div>
						</div>
						<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
							<div class="form-group">
								<label><s:text name="Start Age" /><font color="red">*</font></label>
								<s:select name="disStart" id="disStart" list="sage" headerKey="" headerValue="---Select---" cssClass="inputBoxS" />
							</div>
						</div>
						<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
							<div class="form-group">
								<label><s:text name="End Age" /><font color="red">*</font></label>
								<s:select name="disEnd" id="disEnd" list="eage" headerKey="" headerValue="---Select---" cssClass="inputBoxS" />
							</div>
						</div>
						<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
							<div class="form-group">
								<label><s:text name="travel.rate.value" /><font color="red">*</font></label>
								<s:textfield name="disRateValue" id="disRateValue" cssClass="inputBox" maxlength="10"/>
							</div>
						</div>
						<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
							<div class="form-group">
								<label><s:text name="travel.core.app.code" /><font color="red">*</font></label>
								<s:textfield name="disCode" id="disCode" cssClass="inputBox" maxlength="25"/>
							</div>
						</div>
						<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
							<div class="form-group">
								<label><s:text name="travel.effectivedate" /><font color="red">*</font></label>
								<s:textfield name="disDate" cssClass="inputBox datepicker" id="disDate" />
							</div>
						</div>
						<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
							<div class="form-group">
								<label><s:text name="travel.status" /><font color="red">*</font></label>
								<s:radio list="#{'Y':'Active','N':'DeActive'}" name="disStatus" id="disStatus" value="%{disStatus==null?'N':disStatus}" cssClass="input2"/>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br class="clear" />
	<div class="row">
		<div class="col-xs-12" align="center">
			<input type="button" name="sub" value="Back" onclick="fnsubmit(this.form,'back','')" class="btn btn-sm btn-danger" />
			<s:if test="'new'.equalsIgnoreCase(display)"> &nbsp;&nbsp;&nbsp;
				<input type="button" name="sub" value="Insert" onclick="fnsubmit(this.form,'insert','')" class="btn btn-sm btn-success" />
			</s:if>
			<s:if test="'edit'.equalsIgnoreCase(display)"> &nbsp;&nbsp;&nbsp;
				<input type="button" name="sub" value="Update" onclick="fnsubmit(this.form,'update','')" class="btn btn-sm btn-success" />
			</s:if>
		</div>
	</div>
</div>
<s:hidden name="disId"/>
</s:elseif>
<s:iterator value="list" var="list" status="stat">
	<div id='discountRateView<s:property value="#stat.count"/>' class="modal fade" role="dialog">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title"><s:text name="travel.discount.coverages"/></h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<s:if test='list.size()>0'>
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 table-responsive">
								<table class="table table-bordered responsive no-wrap" width="100%" cellspacing="0">
										<thead>
										<tr>
											<th><s:text name="Age Start"/></th>
											<th><s:text name="Age End"/></th>
											<th><s:text name="Rate Value"/></th>
											<th><s:text name="Type"/></th>
											<th><s:text name="Core App Code"/></th>
											<th><s:text name="Effective Date" /></th>
											<th><s:text name="label.Status"/></th>								
										</tr>
										</thead>
										<tbody>
											<tr>
												<td><s:property value="AGE_START" /></td>
												<td><s:property value="AGE_END" /></td>
												<td><s:property value="RATE_VALUE" /></td>
												<td><s:property value="TYPE" /></td>
												<td><s:property value="COREAPP_CODE" /></td>
												<td><s:property value="EFFECTIVE_DATE" /></td>
												<td><s:property value="STATUS" /></td>
											</tr>
										</tbody>
									</table>
							</div>
						</s:if>
						<s:else>
							<font color="green"><s:text name="label.no.records.available"></s:text></font>
						</s:else>
					</div>
				</div>
			</div>
		</div>
	</div>
</s:iterator>
<!--<s:elseif test="'history'.equalsIgnoreCase(display)">
<div class="container-fluid">
	<div class="row">
		<div class="col-xs-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<s:text name="travel.discountrate"/>
				</div>
				<div class="panel-body">
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
							<div class="form-group">
								<label><s:text name="ChooseProduct" /><font color="red">*</font></label>
								<s:select name="product" id="product" list="#{'31':'Travel Insurance Walla'}" cssClass="inputBoxS" />
							</div>
						</div>
					</div>
					<br class="clear" />    
					<div class="row">
						<div class="col-xs-12">
							<table class="display responsive no-wrap" id="gridTableMake" width="100%" cellspacing="0">
								<thead>
								<tr>
									<th class="no-sort"><s:text name="S.No."/></th>
									<th><s:text name="Start Age"/></th>
									<th><s:text name="End Age"/></th>
									<th><s:text name="Rate Value"/></th>
									<th><s:text name="Relation Type"/></th>
									<th><s:text name="Core App Code"/></th>
									<th><s:text name="Effective Date" /></th>
									<th><s:text name="Status"/></th>							
								</tr>
								</thead>
								<tbody>
									<s:iterator value="list" var="list" status="stat">
										<tr>
											<td><s:property value="#stat.count" /></td>
											<td><s:property value="AGE_START" /></td>
											<td><s:property value="AGE_END" /></td>
											<td><s:property value="RATE_VALUE" /></td>
											<td><s:property value="TYPE" /></td>
											<td><s:property value="COREAPP_CODE" /></td>
											<td><s:property value="EFFECTIVE_DATE" /></td>
											<td><s:property value="STATUS" /></td>
										</tr>
									</s:iterator>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-xs-12" align="center">
			<s:submit type="button" name="Cancel"  key="close" cssClass="btn btn-sm btn-danger" onclick="window.close();return false;"/>
		</div>
	</div>
</div>
</s:elseif>-->
</s:form>
</body>
<script type="text/javascript">
function fnsubmit(frm,from,val) {
	if(from == 'edit') {
		document.form1.action = "<%=request.getContextPath()%>/discountrateTravelConfigure.action?disId="+val+'&display='+from;
	} else {
		document.form1.action = "<%=request.getContextPath()%>/discountrateTravelConfigure.action?display="+from;
	}
	document.form1.submit();
}
</script>
</html>