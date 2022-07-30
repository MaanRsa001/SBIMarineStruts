<%@ page isELIgnored="false" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>
<!DOCTYPE HTML>
<html>
<head>
	<title> ::: AlRajhi - Reports ::: </title>
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
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="Reports" />
			</div>			
			<div class="panel-body">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<div class="tabsBg rEdge">
							<input type="button" class="tabBg rEdge" name="uwReport" id='uwReport' value="UnderWriter Report" onclick="getTab('uwReport')" />
						 	<input type="button" class="tabBg rEdge" name="brReport" id='brReport' value="Broker Report" onclick="getTab('brReport')" />
						</div>
		                <div title="UnderWriter Report" style="padding:10px"  id="tone">
		                	<s:form id="" name="uwReport" method="post" action="getRePolicyAreport.action?mode1=uw" theme="simple">
		                	<div class="panel panel-primary" id="uwReport">
								<div class="panel-heading">
									<s:text name="label.under.writer" />
								</div>			
								<div class="panel-body">
									<div class="row">
										<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
											<s:actionerror cssStyle="color: red;" />
										</div>
									</div>
									<div id="reportUW">
										<s:if test='%{"ajax".equals(from1) && "0".equals(index)}'>
											<div class="row" >												
												<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" align="center">
													<s:text name="policy.report.startdate"/>&nbsp; : &nbsp;<s:property value="startDate"/> <s:hidden name="startDate" id="startdate"/>
												</div>
												<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" align="center">
													<s:text name="policy.report.enddate"/>&nbsp; : &nbsp;<s:property value="endDate"/> <s:hidden name="endDate" id="enddate"/><s:hidden name="productID" id="productid"/>
												</div>
											</div>
											<br class="clear" />
											<div class="row">
												<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
													<table class="display responsive no-wrap" id="record" width="100%" cellspacing="0">
														<thead>
														<tr>
															<th class="no-sort"></th>
															<th><s:text name="Broker Name" /></th>
															<th><s:text name="RSA Branch Name" /></th>
															<th><s:text name="No.Of Policies" /></th>
															<th><s:text name="Core Application Policy No" /></th>
															<th><s:text name="Premium" /></th>
															<th><s:text name="Commission" /></th>
														</tr>
														</thead>
														<tbody>
														<s:iterator value="policyList" status="stat" var="record">
														<tr>
															<td></td>
															<td><s:property value="COMPANY_NAME" /> </td>
															<td><s:property value="RSA_BRANCH_NAME" /> </td>
															<td><s:property value="missippi_opencover_no" /> </td>
															<td align="center"> <a type="button" class="btn btn-sm btn-info" href="#" onclick="getPolicyReport('<s:property value="#record.UW_LOGIN_ID"/>','reportUW','<s:property value="#record.LOGIN_ID"/>')" ><s:property value="#record.POLICY"/> </a> </td>
															<td style="text-align: right;"><s:property value='getText("number.format.2",{@java.lang.Double@valueOf(premium)})' /> </td>
															<td style="text-align: right;"><s:property value='getText("number.format.2",{@java.lang.Double@valueOf(COMMISSION)})' /> </td>
														</tr>
														</s:iterator>
														</tbody>
													</table>
													<s:hidden name="index"/><s:hidden name="mode1" id="mode1"/><s:hidden name="broker" id="rbroker"/><s:hidden name="branch" id="branch"/>
												</div>
											</div>
											<br class="clear" />
											<div class="row">
												<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
													<s:submit name="bck" value="Back" cssClass="btn btn-sm btn-danger" action="policyAreport"/>
												</div>
											</div>
										</s:if>
										<s:else>
										<div class="row">
											<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
												<s:actionerror cssStyle="color: red;" />
											</div>
										</div>
										<div class="row">
											<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
												<div class="text"> <s:text name="policy.report.startdate"/> <font color="red">*</font> </div>
												<div class="tbox">
													<s:textfield cssClass="inputBox datepicker" name="startDate" id="startDate" />
												</div>
											</div>
											<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
												<div class="text"> <s:text name="policy.report.enddate"/> <font color="red">*</font> </div>
												<div class="tbox">
													<s:textfield cssClass="inputBox datepicker" name="endDate" id="endDate" />
												</div>
											</div>
											<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
												<div class="text"><s:text name="policy.report.select.uw"/> <font color="red">*</font></div>
												<div class="tbox">
													<s:select name="broker" id="broker" list="uwList" headerKey="ALL" headerValue="-ALL-" listKey="LoginId"  listValue="UserName" cssClass="inputBoxS"/>
												</div>
											</div>
											<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
												<div class="text"><s:text name="policy.report.product"/> <font color="red">*</font></div>
												<div class="tbox">
													<s:select name="productID" id="productID" list="productList" headerKey="" headerValue="---Select---" listKey="ProductId"  listValue="ProductName" cssClass="inputBoxS"/>
												</div>
											</div>
										</div>
										<br class="clear" />
										<div class="row">
											<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
												<input type="button" name="submit1" class="btn btn-sm btn-success" value="Submit" onclick="forward('reportUW',this.form)"/>
											</div>
										</div>
										</s:else>
									</div>
								</div>
							</div>
							<s:token/>
		                	</s:form>
		                </div>
		                <div title="Broker Report" style="padding:10px"  id="ttwo">
		                	<s:form id="" name="brReport" method="post" action="getRePolicyAreport.action?mode1=br" theme="simple">
		                	<div class="panel panel-primary" id="brReport">
								<div class="panel-heading">
									<s:text name="label.broker.report" />
								</div>			
								<div class="panel-body">
									<s:if test='"reportBR".equals(mode1)'>
									<div class="row">
										<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
											<s:actionerror cssStyle="color: red;" /> <s:actionmessage cssStyle="color: green;" /> 
										</div>
									</div>
									</s:if>
									<div id="reportBR">
										<s:if test='%{"ajax".equals(from1) && "1".equals(index)}'>
											<div class="row" >												
												<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" align="center">
													<s:text name="policy.report.startdate"/>&nbsp; : &nbsp;<s:property value="startDate"/> <s:hidden name="startDate" id="startdate"/>
												</div>
												<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" align="center">
													<s:text name="policy.report.enddate"/>&nbsp; : &nbsp;<s:property value="endDate"/> <s:hidden name="endDate" id="enddate"/><s:hidden name="productID" id="productid"/>
												</div>
											</div>
											<br class="clear" />
											<div class="row">
												<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
													<table class="display responsive no-wrap" id="record" width="100%" cellspacing="0">
														<thead>
														<tr>
															<th class="no-sort"></th>
															<th><s:text name="Broker Name" /></th>
															<th><s:text name="RSA Branch Name" /></th>
															<th><s:text name="No.Of Policies" /></th>
															<th><s:text name="Core Application Policy No" /></th>
															<th><s:text name="Premium" /></th>
															<th><s:text name="Commission" /></th>
														</tr>
														</thead>
														<tbody>
														<s:iterator value="policyList" status="stat" var="record">
														<tr>
															<td></td>
															<td><s:property value="COMPANY_NAME" /> </td>
															<td><s:property value="RSA_BRANCH_NAME" /> </td>
															<td><s:property value="missippi_opencover_no" /> </td>
															<td align="center"> <a type="button" class="btn btn-sm btn-info" href="#" onclick="getPolicyReport('<s:property value="#record.UW_LOGIN_ID"/>','reportUW','<s:property value="#record.LOGIN_ID"/>')" ><s:property value="#record.POLICY"/> </a> </td>
															<td style="text-align: right;"><s:property value='getText("number.format.2",{@java.lang.Double@valueOf(premium)})' /> </td>
															<td style="text-align: right;"><s:property value='getText("number.format.2",{@java.lang.Double@valueOf(COMMISSION)})' /> </td>
														</tr>
														</s:iterator>
														</tbody>
													</table>
													<s:hidden name="index"/><s:hidden name="mode1" id="mode1"/> <s:hidden name="branch" id="branch"/><s:hidden name="broker" id="rbroker"/>
												</div>
											</div>
											<br class="clear" />
											<div class="row">
												<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
													<s:submit name="bck" value="Back" cssClass="btn btn-sm btn-danger" action="policyReport"/>
												</div>
											</div>
										</s:if>
										<s:else>
										<div class="row">
											<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
												<s:actionerror cssStyle="color: red;" />
											</div>
										</div>
										<div class="row">
											<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
												<div class="text"> <s:text name="policy.report.startdate"/> <font color="red">*</font> </div>
												<div class="tbox">
													<s:textfield cssClass="inputBox datepicker" name="startDate" id="startDate1" />
												</div>
											</div>
											<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
												<div class="text"> <s:text name="policy.report.enddate"/> <font color="red">*</font> </div>
												<div class="tbox">
													<s:textfield cssClass="inputBox datepicker" name="endDate" id="endDate1" />
												</div>
											</div>
											<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
												<div class="text"><s:text name="policy.report.select.br"/> <font color="red">*</font></div>
												<div class="tbox">
													<s:select name="broker" id="broker1" list="brokerList" headerKey="ALL" headerValue="-ALL-" listKey="AgencyCode"  listValue="CompanyName" cssClass="inputBoxS"/>
												</div>
											</div>
											<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
												<div class="text"><s:text name="policy.report.product"/> <font color="red">*</font></div>
												<div class="tbox">
													<s:select name="productID" id="productID" list="productList" headerKey="" headerValue="---Select---" listKey="ProductId"  listValue="ProductName" cssClass="inputBoxS"/>
												</div>
											</div>
										</div>
										<br class="clear" />
										<div class="row">
											<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
												<input type="button" name="submit1" class="btn btn-sm btn-success" value="Submit" onclick="forward('reportBR',this.form)"/>
											</div>
										</div>
										</s:else>
									</div>
								</div>
							</div>
							<s:token/>
		                	</s:form>
		                	<s:form name="lform" id="lform">
								<s:hidden name="startDate" id="lstartDate"/>
								<s:hidden name="endDate" id="lendDate"/><s:hidden name="productID" id="lproductID"/>
								<s:hidden name="index"/><s:hidden name="mode1" id="lmode1"/><s:hidden name="pvapplication"/>
								<s:token/>
							</s:form>
		                </div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function(){
	try{
		var index = '<s:property value="index"/>';
		var t = $('#tabs');
		var tabs = t.tabs('tabs');
			t.tabs('select', tabs[index].panel('options').title);
	}catch(err){}
});

function forward(from, frm){
	if(from=='reportBR'){
		var startDate=document.getElementsByName('startDate')[1].value;
		var endDate=document.getElementsByName('endDate')[1].value;
		var pid=document.getElementsByName('productID')[1].value;
		//alert(pid);
		var y=document.getElementById('broker1');
			var broker="";
			  for (var i = 0; i < y.options.length; i++) {
			     if(y.options[i].selected ==true){
			     	broker=broker+","+y.options[i].value;
			      }
			  }
	}else{
		var startDate=document.uwReport.startDate.value;
		var endDate=document.uwReport.endDate.value;
		var pid=document.uwReport.productID.value;
		//alert(pid);
		var y=document.getElementById('broker');
			var broker="";
			  for (var i = 0; i < y.options.length; i++) {
			     if(y.options[i].selected ==true){
			     	broker=broker+","+y.options[i].value;
			      }
			  }
	}
	if(startDate==''){
		alert('Please Select Start Date');
	}else if(endDate==''){
		alert('Please Select End Date');
	}else if(pid==''){
		alert('Please Select Product');
	}else{
		/*if(from=='reportBR')
			document.getElementById('loaderImage1').style.display="block";
		else
			document.getElementById('loaderImage').style.display="block";*/
		postRequest('<%=request.getContextPath()%>/getRePolicyAreport.action?productID='+pid+'&mode1='+from+'&broker='+broker+'&startDate='+startDate+'&endDate='+endDate, from);
	}
  	}
  	 function getPolicyReport(broker, loginId,mode1){
  		document.getElementById('lstartDate').value=document.getElementById('startdate').value;
  		document.getElementById('lendDate').value=document.getElementById('enddate').value;
  		document.getElementById('lproductID').value=document.getElementById('productid').value;
  		//document.getElementById('lmode1').value='<s:property value="mode1" />';
  		document.getElementById('lmode1').value=document.getElementById('mode1').value;
  		if(broker==''){
  			broker=document.getElementById('rbroker').value;
  		}
  		branch=document.getElementById('branch').value;
  		document.lform.action="branchResultAreport.action?reportStatus=P&broker="+broker+"&from1=report&loginId="+loginId+"&branch="+branch;
  		document.lform.submit();
  	}		   
	function getTab(loginType){
		if(loginType=="uwReport") {
			document.getElementById("uwReport").className="tabBgA rEdge";
			document.getElementById("brReport").className="tabBg rEdge";
			document.getElementById("tone").style.display = "block";
			document.getElementById("ttwo").style.display = "none";
			//document.getElementById("loginType").value = loginType;
		}
		else if(loginType=="brReport") {
			document.getElementById("brReport").className="tabBgA rEdge";
			document.getElementById("uwReport").className="tabBg rEdge";
			document.getElementById("ttwo").style.display = "block";
			document.getElementById("tone").style.display = "none";
			//document.getElementById("loginType").value = loginType;
		}
	}
try{
	getTab('brReport');
}catch(e){}
</script>
</body>
</html>