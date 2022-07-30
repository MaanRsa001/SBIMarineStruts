<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<style type="text/css">
	#myDIV {
	    overflow-x:scroll;
	    margin: auto:
	}
           }
</style>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="js/tcal.js"></script>
<link href="css/styles.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.tableTools.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.jqueryui.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/cssbootstrap/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/footable-0.1.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap-datetimepicker.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.responsive.css"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.jqueryui.css"/>
<link href="<%=request.getContextPath()%>/dataTables/css/jquery-start-ui.css" rel="stylesheet" type="text/css" />
<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap-datetimepicker.js" type="text/javascript"></script>
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
<s:form name="form1" theme="simple">
	<div class="container-fluid">
		<div class="row">
			<div class="col-xs-12">
			  <s:if test='"list".equals(mode)'>
				 	<div class="panel panel-primary">
						<div class="panel-heading">
							<s:text name="FeedBack"/>
						</div>				
						<div class="panel-body">
							<s:if test="hasActionErrors()">
								<div class="row">
									<font color="red"><s:actionerror cssStyle="list-style: none;"/></font>
								</div>
								<br class="clear" />
							</s:if>
							<div class="row">
								<div class="col-xs-12 col-sm-12 col-md-4 col-lg-3">
									<div class="form-group">
	   									<label><s:text name="label.startDate"/></label>
										<s:textfield name="startDate" id="startDate1" cssClass="form-control datepicker" readonly="true" />
									</div>
								</div>
								<div class="col-xs-12 col-sm-12 col-md-4 col-lg-3">
									<div class="form-group">
	   									<label><s:text name="label.endDate" /></label>
										<s:textfield name="endDate" id="endDate1" cssClass="form-control datepicker" readonly="true" />
									</div>
								</div>
								 
								<div class="col-xs-12 col-sm-12 col-md-6 col-lg-3" align="center">
									<br/>
									<input type="button" onclick="fnSubmit();" class="btn btn-sm btn-success" value="Submit" />
								</div>
							</div>
						</div>
					</div>
					<br class="clear"/>
					<div class="panel panel-primary">
						<div class="panel-heading">
							<s:text name="FeedBack Detail"/>
						</div>				
						<div class="panel-body">
							<table class="display responsive no-wrap" id="gridTableMake" width="100%" cellspacing="0">
								<thead>
								<tr>
									<th><s:text name="label.master.sno"/></th>
									<th><s:text name="label.quoteno"/></th>
									<th><s:text name="label.policyNo"/></th>					
									<th><s:text name="label.customerName"/></th>		
									<th><s:text name="Email"/></th>
									<th><s:text name="View"/></th>
									<th></th>
								</tr>
								</thead>
								<tbody>
									<s:iterator value="feedbackList" var="list" status="stat">
										<tr>
											<td><s:property value="#stat.count" /></td>
											<td><s:property value="#list.QUOTE_NO"/></td>
											<td><s:property value="#list.POLICY_No" /></td>
											<td><s:property value="#list.CUST_NAME"/></td>
											<td><s:property value="#list.EMAIL" /></td>
											<td align="center"><input type="button" onclick="viewForm('<s:property value="#list.QUOTE_NO"/>')" class="btn btn-sm btn-success" value="View" align="middle" /></td>
											<td></td>
										</tr>
									</s:iterator>
								</tbody>							
							</table>
							 
							<%-- <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
								<div class="" >
									<br/>
							    	<input type="button" onclick="fnReport('S');" class="btn btn-warning btn-sm" value="Excel" align="middle"/>
								</div>
							</div>--%> 
						</div>
					</div>
				
			  </s:if>
			  <s:elseif test='"view".equals(mode)'>
				  <div class="panel panel-primary">
						<div class="panel-heading">
							<s:text name="Customer FeedBack"/>
						</div>				
						<div class="panel-body">
							<s:if test="hasActionErrors()">
								<div class="row">
									<font color="red"><s:actionerror cssStyle="list-style: none;"/></font>
								</div>
								<br class="clear" />
							</s:if>
							<div class="row">
								<div class="col-xs-12">
									<s:iterator value="feedbackList" var="list" status="stat">
										<div class="form-group">
											<table border="0" style="width: 100%" cellpadding="20px">
												<tr>
													<th>Customer Name</th><td><s:property value="#list.CUST_NAME"/> </td><th>Email</th><td><s:property value="#list.EMAIL"/></td>												
												</tr>
												<tr ><td colspan="4"><br/></td></tr>
												<tr>											
													<th>Quote No</th><td><s:property value="#list.QUOTE_NO"/></td><th>Policy No</th><td><s:property value="#list.POLICY_No"/></td>
												</tr>
												<tr ><td colspan="4"><br/></td></tr>
												<tr>
													<th colspan="2">Experience with purchasing online policy from AlRajhi</th>
													<td colspan="2"><s:radio list="#{'E':'Excellent','A':'Average','P':'Poor'}" name="feedQuestion1" id="feedQuestion1" disabled="true" value="#list.FEDBCK_RATING" /></td>
												</tr>
												<tr ><td colspan="4"><br/></td></tr>
												<tr>
													<th colspan="2"> Recommend our Company to your friends or relatives</th> 
													<td colspan="2"><s:property value='"Y".equals(#list.FEDBCK_REFER_YN)?"Yes":"No"'/></td>
												</tr>
												<tr ><td colspan="4"><br/></td></tr>
												<tr>
													<th>Remarks</th><td colspan="3"><s:property value="#list.FEDBCK_REMARKS"/></td>
												</tr>
												
											</table>
										</div>
									</s:iterator>
									
								</div>
							</div>
							
						</div>
					</div>
					<div class="panel panel-primary">
								<div class="panel-heading">
									<s:text name="Admin Remarks"/>
								</div>				
								<div class="panel-body">
								
									<div class="row">
										<div class="col-xs-12">
											<div class="form-group">
													<table border="0" style="width: 100%">
														<tr><th>Remarks</th><td><s:textarea name="adminRemarks" id="adminRemarks" cssClass="form-controlA"  cssStyle="width: 100%;"	onkeyup="textLimit(this,'1500')" /> </td></tr>
														<tr><th>Status</th><td><s:radio list="#{'open':'Open','close':'Close'}" name="adminStatus" id="adminStatus"  value='%{adminStatus==null?"open":adminStatus}' /> </td></tr>
													</table>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-xs-12">
										<div class="form-group">
											<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
												   
						    							<input type="button" onclick="fnbackfeed();" class="btn btn-sm btn-danger" value="Back" align="middle" />
													 
						    							<input type="button" onclick="fnupdate();" class="btn btn-sm btn-success" value="Submit" align="middle" />
													 
							        		  </div>
										</div>
									</div>
								</div>
							</div>
							
					<s:hidden name="quoteNo"></s:hidden>
			  </s:elseif>
			  <s:else>
			  	<div class="panel panel-primary">
					<div class="panel-heading">
						<s:text name="FeedBack"/>
					</div>				
					<div class="panel-body">
						<s:if test="hasActionErrors()">
							<div class="row">
								<font color="red"><s:actionerror cssStyle="list-style: none;"/></font>
							</div>
							<br class="clear" />
						</s:if>
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-4 col-lg-3">
								<div class="form-group">
   									<label><s:text name="label.startDate"/></label>
									<s:textfield name="startDate" id="startDate1" cssClass="form-control datepicker" readonly="true" />
								</div>
							</div>
							<div class="col-xs-12 col-sm-12 col-md-4 col-lg-3">
								<div class="form-group">
   									<label><s:text name="label.endDate" /></label>
									<s:textfield name="endDate" id="endDate1" cssClass="form-control datepicker" readonly="true" />
								</div>
							</div>
							 
							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-3" align="center">
								<br/>
								<input type="button" onclick="fnSubmit();" class="btn btn-sm btn-success" value="Submit" />
							</div>
						</div>
					</div>
				</div>
				<br class="clear"/>
			  </s:else>
				 
			</div>
		</div>
	</div>
	<s:hidden name="reqFrom"/>
</s:form>	
<script type="text/Javascript" >
function fnSubmit(){
	    document.form1.action='feedGridPaymentStatus.action?mode=list';
	    document.form1.submit();
}
function viewForm(quoteNo){
	  document.form1.action='viewfPaymentStatus.action?mode=view&quoteNo='+quoteNo;
	  document.form1.submit();
}

function fnbackfeed(){
	document.form1.action='viewfListPaymentStatus.action';
	  document.form1.submit();
}
function fnupdate(){
	document.form1.action='updatedfeedPaymentStatus.action';
	  document.form1.submit();
}
</script>
</body>
</html>