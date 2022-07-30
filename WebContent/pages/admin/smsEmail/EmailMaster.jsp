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
	<script type="text/javascript" src="js/common.js"></script>
	<script type="text/javascript" src="js/tcal.js"></script>
	<link href="css/styles.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/cssbootstrap/bootstrap.min.css" />
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
<s:form id="smsEmail" name="smsEmail" action="" theme="simple">
	<div class="container-fluid">
		<div class="row">
			<div class="col-xs-12">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<s:text name="label.master.sms.email"/>
						<%--<s:if test='mode == "list"'>
							<div class="pullRight">
								<input type="button" class="btn btn-sm btn-default" value="Add New" onclick="funSubmit('add','');">
							</div>
							<br class="clear" />
						</s:if>--%>
					</div>
					<font color="green"><s:actionmessage cssStyle="list-style: none;"/></font>
					<s:if test='mode == "list"'>
						<div class="panel-body">
							<div class="row">
								<table class="display responsive no-wrap" id="gridTableMake" width="100%" cellspacing="0">
									<thead>
									<tr>
										<th class="no-sort"><s:text name="label.master.sno"/></th>
										<th><s:text name="label.sms.required"/></th>
										<th><s:text name="label.sms.content"/></th>
										<th><s:text name="label.email.required"/></th>
										<th><s:text name="label.email.content"/></th>
										<th><s:text name="label.master.status"/></th>
										<th><s:text name="label.master.remarks"/></th>
										<th><s:text name="label.master.edit"/></th>
									</tr>
									</thead>
									<tbody>
										<s:iterator value="smsEmailTempList" var="list" status="stat">
											<tr>
												<td><s:property value="#stat.count" /></td>
												<td><s:property value="#list.SMS_REQUIRED" /></td>
												<td><s:property value="#list.SMS_BODY" /></td>
												<td><s:property value="#list.MAIL_REQUIRED" /></td>
												<td><s:property value="#list.MAIL_BODY" /></td>
												<td><s:property value="#list.STATUS" /></td>
												<td><s:property value="#list.REMARKS" /></td>
												<td style="text-align: center;">
													<input type="button" class="btn btn-warning btn-sm" onclick="funSubmit('edit','<s:property value="#list.SNO" />');" value="Modify" />
												</td>
											</tr>
										</s:iterator>
									</tbody>
								</table>								
							</div>
						</div>
					</s:if>
					<s:else>
						<div class="panel-body">
							<div class="row">									
								<font color="red"><s:actionerror cssStyle="list-style: none;"/></font>
								<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
									<div class="form-group">
    									<label><s:text name="label.sms.required"/><font color="red">*</font></label>
    									<s:radio list="#{'Y':'Yes','N':'No'}" name="smsRequired" id="smsRequired" />
									</div>
								</div>
							</div>
							<div class="row">	
								<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
									<div class="form-group">
    									<label><s:text name="label.sms.subject"/><font color="red">*</font></label>
    									<s:textarea name="smsSubject" id="smsSubject" rows="3" cssClass="form-control" maxlength="200"/>
									</div>
								</div>
								<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
									<div class="form-group">
    									<label><s:text name="label.sms.body"/><font color="red">*</font></label>
    									<s:textarea name="smsBody" id="smsBody" rows="3" cssClass="form-control" maxlength="1000"/>
									</div>
								</div>
								<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
									<div class="form-group">
    									<label><s:text name="label.sms.regards"/><font color="red">*</font></label>
    									<s:textarea name="smsRegards" id="smsRegards" rows="3" cssClass="form-control" maxlength="1000"/>
									</div>
								</div>
							</div>
							<div class="row">	
								<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
									<div class="form-group">
    									<label><s:text name="label.email.required"/><font color="red">*</font></label>
    									<s:radio list="#{'Y':'Yes','N':'No'}" name="emailRequired" id="emailRequired" />
									</div>
								</div>
							</div>
							<div class="row">	
								<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
									<div class="form-group">
    									<label><s:text name="label.email.subject"/><font color="red">*</font></label>
    									<s:textarea name="emailSubject" id="emailSubject" rows="3" cssClass="form-control" maxlength="200"/>
									</div>
								</div>
								<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
									<div class="form-group">
    									<label><s:text name="label.email.body"/><font color="red">*</font></label>
    									<s:textarea name="emailBody" id="emailBody" rows="3" cssClass="form-control" maxlength="1000"/>
									</div>
								</div>
								<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
									<div class="form-group">
    									<label><s:text name="label.email.regards"/><font color="red">*</font></label>
    									<s:textarea name="emailRegards" id="emailRegards" rows="3" cssClass="form-control" maxlength="1000"/>
									</div>
								</div>
								<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
									<div class="form-group">
    									<label><s:text name="label.master.remarks"/></label>
    									<s:textfield name="remarks" id="remarks" cssClass="form-control" maxlength="150"></s:textfield>
									</div>
								</div>
								<div class="col-xs-12 col-sm-12 col-md-6 col-lg-4">
									<div class="form-group">
    									<label><s:text name="label.master.status" /><font color="red">*</font></label><br/>
										<s:radio list="#{'Y':'Activate','N':'Deactivate'}" name="status" id="status" value='%{status==null?"N":status}' />
									</div>
								</div>
							</div>
						</div>
						<br class="clear" />
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-12" align="center">
								<input type="button" class="btn btn-sm btn-success" value="Submit" onclick="funSubmit('update','');">&nbsp;&nbsp;&nbsp;
								<input type="button" class="btn btn-sm btn-danger" value="Back" onclick="funSubmit('back','');" />
							</div>
						</div>	
						<s:hidden id="tempId" name="tempId"/>		
						<s:hidden name="mode" id="mode"></s:hidden>			
					</s:else>					
				</div>
			</div>
		</div>		
	</div>
	<s:token />
</s:form>
<script type="text/javascript" src="<%=request.getContextPath()%>/bootstrap/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
function funSubmit(mode,val){
	if(mode=="back"){
		document.smsEmail.action='viewSmsEmailMaster.action';		
	}else if(mode=="update"){
		document.smsEmail.action='insertSmsEmailMaster.action';
	}else if(mode=="add" || mode=="edit"){
		document.smsEmail.action='editSmsEmailMaster.action?mode='+mode+"&tempId="+val;
	}
	document.smsEmail.submit();
}
	
</script>
</body>
</html>   
