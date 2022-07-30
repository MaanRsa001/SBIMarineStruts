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
<s:form id="smart" name="smart" method="post" action="" theme="simple">
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="label.smart.report" />
			</div>			
			<div class="panel-body">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<s:actionerror cssStyle="color: red;" /> <s:actionmessage cssStyle="color: green;" />
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
						<div class="text"> <s:text name="policy.report.product"/> <font color="red">*</font> </div>
						<div class="tbox">
							<s:select name="productID" id="productID" list="productList" headerKey="" headerValue="---Select---" listKey="PRODUCT_ID"  listValue="PRODUCT_NAME" cssClass="inputBoxS"/>
						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4" style="height: 120px;">
						<div class="text"> <s:text name="policy.report.select.br" /> <font color="red">*</font> </div>
						<div class="tbox">
							<div style="overflow:scroll;overflow-x:hidden;height:100px;width:100%;" class="inputBoxA">	
  								<s:checkboxlist name="brokers" id="brokers" list="brokerList" listKey="login_id"  listValue="COMPANY_NAME" cssStyle="vertical"/>
  							</div>
						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4" style="height: 120px;">
						<div class="text"> <s:text name="policy.report.orgination" /> </div>
						<div class="tbox">
							<div style="overflow:scroll;overflow-x:hidden;height:100px;width:100%;" class="inputBoxA">	
  								<s:checkboxlist name="orginCountries" id="orginCountries" list="countrySmartList" listKey="COUNTRY_ID"  listValue="COUNTRY_NAME" cssStyle="vertical"/>
  							</div>
						</div>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4" style="height: 120px;">
						<div class="text"> <s:text name="policy.report.destination" /> </div>
						<div class="tbox">
							<div style="overflow:scroll;overflow-x:hidden;height:100px;width:100%;" class="inputBoxA">	
  								<s:checkboxlist name="destCountries" id="destCountries" list="countrySmartList" listKey="COUNTRY_ID"  listValue="COUNTRY_NAME" cssStyle="vertical"/>
  							</div>
						</div>
					</div>
					<s:hidden name="busType" value="2"/>
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text"><s:text name="policy.report.commodity"/> <font color="red">*</font></div>
						<div class="tbox">
							<s:textarea name="commodity" id="commodity" cssClass="inputBoxA" rows="2" cssStyle="width: 85%;"/>
							<input class="btn btn-sm btn-primary" value="..." style="float:right;" type="button" name="commod" onclick="commodityselect()"/>							
						</div>
					</div>
				</div>	
			</div>
		</div>
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="policy.report.select.coverages" />
			</div>			
			<div class="panel-body">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<s:text name="policy.report.select.coverages" /> <font color="red">*</font>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
						<s:iterator value="transportModeList" var="trans">
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
								<s:checkbox name="transportId" />
								<s:label value="%{#trans.TRANSPORT_DESCRIPTION}"></s:label>
							</div>
							<s:iterator value="coverList" var="cover" status="stat">
								<s:if test='%{#trans.MODE_TRANSPORT_ID==#cover.MODE_TRANSPORT_ID}'>
									<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
										<s:checkbox name="coverId"/><s:label value="%{#cover.COVER_NAME}"></s:label>
									</div>
								</s:if>
							</s:iterator>
						</div>
						</s:iterator>
					</div>
				</div>
				<s:hidden name="rag"/>
			</div>
		</div>
	</div>
</div>
<br class="clear" />
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
		<s:submit name="submit2" cssClass="btn btn-sm btn-success" value="Submit" action="smartlistAreport"/>
	</div>
</div>
<s:token/>
</s:form>
<script type="text/javascript">
function commodityselect()
{
	var URL='<%=request.getContextPath()%>/commoditySelectAreport.action';
	var windowName = "Commodity List";
	var width  = screen.availWidth;
	var height = screen.availHeight;
	var bwidth = window.innerWidth;
	var bwidth1 = document.body.clientWidth;
	if(bwidth <= 768) {
		var w = bwidth;
		var h = 400;
	} else {
		var w = 700;
		var h = 400;
	}	
	var features =
		'width='          + w +
		',height='		  + h +
		',left='		  + ((width - w - 0) * .4)  +
		',top='			  + ((height - h - 0) * .4) +
		',directories=no' +
		',location=no'	  +
		',menubar=no'	  +
		',scrollbars=yes' +
		',status=yes'	  +
		',toolbar=no'	  +
		',resizable=false';
	var strOpen = window.open (URL, windowName, features);
	strOpen.focus();
}
function fncommodity(policynumber, proposalNo ,loginId){
	var URL ="<%=request.getContextPath()%>/commodityAreport.action?policynumber="+policynumber+"&loginId="+loginId+"&proposalNo="+proposalNo;
	callPopUp(URL);
}
function callPopUp(URL) {
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
			