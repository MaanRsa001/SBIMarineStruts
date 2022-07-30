 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script language="JavaScript">javascript:window.history.forward(1);</script>
<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap-multiselect.js" type="text/javascript"></script>
<link href="<%=request.getContextPath()%>/bootstrap/css//style.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.responsive.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.jqueryui.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.tableTools.css">
	<link href="<%=request.getContextPath()%>/dataTables/css/jquery-start-ui.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.jqueryui.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.responsive.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.tableTools.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery.dataTables.js"></script>
<script language="JavaScript">
function stopRKey(evt) { 
  var evt = (evt) ? evt : ((event) ? event : null); 
  var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null); 
  if ((evt.keyCode == 13) && (node.type=="text"))  {return false;} 
} 
document.onkeypress = stopRKey;
</script>
<style>
	#loading {
	  width: 100%;
	  height: 100%;
	  top: 0px;
	  left: 0px;
	  position: fixed;
	  display: block;
	  opacity: 0.7;
	  background-color: #fff;
	  z-index: 99;
	  text-align: center;
	}
	
	#loading-image {
	  position: absolute;
	  top: 30%;
	  left: 45%;
	  z-index: 100;
	  width: 100px;
	  height: 100px;
	}
</style>
</head>
<body onload="toggleEndt()">
<s:form id="Quotation" name="Quotation" method="post" action="" theme="simple">
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<s:actionerror cssStyle="color: red;" />
	</div>
</div>
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="label.commodityRateInfo" /><span style="float:right;"><s:text name="label.proposalNo" />:<s:property value="proposalNo"/></span>
			</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text">
				 			<s:text name="label.commodity" />
				 		</div>
				 		<div class="tbox">
						<s:select name="commodityCode" id="commodityCode" list="commoditynotinList" headerKey="" headerValue="---Select---" listKey="CommodityId" listValue="CommodityName" cssClass="inputBoxS tooltipContent tooltipContent" data-content="Currency List" cssStyle="width:80%;float:left;"  onchange=" getList(this.value,'commodityRate')"/>
						</div>
						<br/>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<s:iterator value="commodityinList" var="list"  status="stat">
							<button type="button"  class="btn btn-sm btn-info"  data-toggle="modal" data-target="#CSIFrame"  onclick="getList('<s:property value='#list.CommodityId'/>','commodityRate');" tabindex="1"> <s:property value="#list.CommodityName"/> </button>
							&nbsp;&nbsp;&nbsp;
						</s:iterator>
					</div>
					
				</div>
				<div class="row">
				<br/>
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<div class="row" id="commodityRate">
					    	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
									<table width="100%" class="table table-bordered" >
										<thead>
											<tr style="color:blue;">
												<th width="5%"><s:text name="Sno"></s:text></th>
												<th width="19%" align="center"><s:text name="label.commodityName"></s:text><font color="red">*</font></th>
												<th width="10%" align="center"><s:text name="label.modeoftransport"></s:text><font color="red">*</font></th>
												<th width="15%" align="center"><s:text name="label.cover"></s:text><font color="red">*</font></th>
												<th width="7%" align="center"><s:text name="label.baseRate"></s:text><font color="red">*</font></th>
												<th width="7%" align="center"><s:text name="label.excessPer"></s:text><font color="red">*</font></th>
												<th width="7%" align="center"><s:text name="label.exceseValue"></s:text><font color="red">*</font></th>
												<th width="15%" align="center"><s:text name="label.excessDesc"></s:text><font color="red">*</font></th>
											</tr>
										</thead>
										<tbody>
											<s:iterator value="commdityId" var="list"  status="stat">
												<tr>
													<th align="center" width="5%"><s:property value="%{#stat.count}"/></th>
													<th align="left" width="19%">
														<s:hidden name="commdityId[%{#stat.index}]" id="commdityId[%{#stat.index}]" theme="simple"/>
														<s:hidden name="commdityNameDesc[%{#stat.index}]" id="commdityNameDesc[%{#stat.index}]"  theme="simple"/>
														<s:textfield name="commdityName[%{#stat.index}]" id="commdityName[%{#stat.index}]"  cssClass="form-control" readonly="true"  theme="simple"/>
													</th>
													<th align="left" width="10%">
														<s:hidden name="commodityModeId[%{#stat.index}]" id="commodityModeId[%{#stat.index}]"  theme="simple"/>
														<s:textfield name="commodityModeName[%{#stat.index}]"  id="commodityModeName[%{#stat.index}]" cssClass="form-control" cssStyle="text-align: left;" maxlength="100" readonly="true"  theme="simple"/> 
													</th>
													<th align="left" width="15%">
													<s:hidden name="commodityCoverId[%{#stat.index}]" id="commodityCoverId[%{#stat.index}]"  theme="simple"/>
													<s:textfield name="commodityCoverName[%{#stat.index}]"  id="commodityCoverName[%{#stat.index}]" cssClass="form-control" cssStyle="text-align: left;" maxlength="100" readonly="true" theme="simple"/>
													</th>
													<th align="left" width="7%">
													<s:textfield name="commoditybaseRate[%{#stat.index}]"  id="commoditybaseRate[%{#stat.index}]" cssClass="form-control decimal4Only" cssStyle="text-align: right;" maxlength="20" theme="simple"/>
													</th>
													<th align="left" width="7%">
													<s:textfield name="commodityexcessPer[%{#stat.index}]"  id="commodityexcessPer[%{#stat.index}]" cssClass="form-control decimal4Only" cssStyle="text-align: right;" maxlength="20" theme="simple"/>
													</th>
													<th align="left" width="7%">
													<s:textfield name="commodityexcessVal[%{#stat.index}]"  id="commodityexcessVal[%{#stat.index}]" cssClass="form-control decimal4Only" cssStyle="text-align: right;" maxlength="20" theme="simple"/>
													</th>
													<th align="left" width="15%">
													<s:textarea name="commodityexcessDesc[%{#stat.index}]"  id="commodityexcessDesc[%{#stat.index}]" cssClass="form-control " cssStyle="text-align: right;" maxlength="1000" theme="simple"/>
													</th>								
												</tr>
											</s:iterator>
										</tbody>
									</table>							
						</div>
					</div>
					<div class="row">
					<br/>
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
							<input type="button" value="Save Commodity" onclick="addCommodity();" class="btn btn-sm btn-success">
						</div>
					</div>
				 </div>
			 	</div>
			</div>
		</div>
	</div>
	
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="label.claueseInfo" />
			</div>
			<div class="panel-body">
				<div class="row">
				<s:iterator value="coverClausesList" var="list"  status="stat">
					<div class="col-md-3 marginTop_15px">
					    <button type="button"  class="btn btn-block btn-sm btn-info"  data-toggle="modal" data-target="#CSIFrame"  onclick="getClausesInfo('<s:property value='#list.CoverId'/>','<s:property value='#list.CoverName'/>','<s:property value='#list.ModeOfTransport'/>','<s:property value='#list.ModeOfTransportName'/>','clauses');" tabindex="1"> <s:property value="#list.CoverName"/> </button>
					</div>
				</s:iterator>
				 </div>
				 <div class="row">
				     <div class="col-md-3 marginTop_15px">
				    	 <button type="button"  class="btn btn-block btn-sm btn-danger"  data-toggle="modal" data-target="#CSIFrame"  onclick="getClausesInfo('<s:property value='#list.CoverId'/>','<s:property value='#list.CoverName'/>','<s:property value='#list.ModeOfTransport'/>','<s:property value='#list.ModeOfTransportName'/>','warrenty');"  tabindex="1"> <s:text name="label.warranties"/> </button>
				     </div>
				     <div class="col-md-3 marginTop_15px">
				     	<button type="button"  class="btn btn-block btn-sm btn-warning"  data-toggle="modal" data-target="#CSIFrame"  onclick="getClausesInfo('<s:property value='#list.CoverId'/>','<s:property value='#list.CoverName'/>','<s:property value='#list.ModeOfTransport'/>','<s:property value='#list.ModeOfTransportName'/>','exclusion');"  tabindex="1"><s:text name="label.exclusion"/> </button>
				     </div>
				     <s:if test='"Y".equals(warSrcYN)'>
					     <div class="col-md-3 marginTop_15px">
					    	 <button type="button"  class="btn btn-block btn-sm btn-warning"  data-toggle="modal" data-target="#CSIFrame"  onclick="getClausesInfo('<s:property value='#list.CoverId'/>','<s:property value='#list.CoverName'/>','<s:property value='#list.ModeOfTransport'/>','<s:property value='#list.ModeOfTransportName'/>','war');"  tabindex="1"> <s:text name="label.war"/> </button>&nbsp;&nbsp;&nbsp;
					     </div>
					 </s:if>
				     <div class="col-md-3 marginTop_15px">
				     	<button type="button"  class="btn btn-block btn-sm btn-primary"  data-toggle="modal" data-target="#CSIFrame"  onclick="getClausesInfo('<s:property value='#list.CoverId'/>','<s:property value='#list.CoverName'/>','<s:property value='#list.ModeOfTransport'/>','<s:property value='#list.ModeOfTransportName'/>','others');"  tabindex="1"> <s:text name="label.other"/> </button>&nbsp;&nbsp;&nbsp;
				     </div>
				 </div>   
					
						
						
						
						
				
			 	
			</div>
		</div>
	</div>
	<s:if test='"V".equals(haulierYN)'>
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="Land Trasit Info" />
			</div>
			<div class="panel-body">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<div class="row" id="commodityRate">
					    	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
									<table width="100%" class="table table-bordered"  id="newvehicle">
										<thead>
											<tr style="color:blue;">
												<th><s:text name="label.sno" /></th>
												<th width="30%" align="center"><s:text name="Haulier Category"></s:text><font color="red">*</font></th>
												<th width="20%" align="center"><s:text name="Category Description"></s:text><font color="red">*</font></th>
												<th width="10%" align="center"><s:text name="Start Limit"></s:text><font color="red">*</font></th>
												<th width="10%" align="center"><s:text name="End Limit"></s:text><font color="red">*</font></th>
												<th width="10%" align="center"><s:text name="Premium (per vehicle)"></s:text><font color="red">*</font></th>
												<th  width="10%"><input type="button"  value="<s:text name="label.addMore"/>"  class="btn btn-sm btn-primary" onclick="insVehicle('newvehicle');" />
											</tr>
										</thead>
										<tbody>
											<s:iterator value="haulierCategoryId" var="list"  status="stat">
												 <tr>
												 <th align="left" width="5%">
													<s:property value="%{#stat.index+1}" />
												 </th>
													<th align="left">
													<s:hidden name="hauliersno[%{#stat.index}]" id="hauliersno%{#stat.index}" value="%{#stat.index}" theme="simple"/>
														<s:select name="haulierCategoryId[%{#stat.index}]" id="haulierCategoryId[%{#stat.index}]" list="haulierCategoryList" headerKey="" headerValue="---Select---" listKey="Code" listValue="CodeDescription" cssClass="inputBoxS tooltipContent tooltipContent" data-content="Currency List"  onchange=" getName(this.value,'mode','%{#stat.index}')"/>
													</th>
													<th align="left">
													<s:textfield name="haulierCategory[%{#stat.index}]"  id="haulierCategory[%{#stat.index}]" cssClass="form-control"  maxlength="20" />
													</th>
													<th align="left">
													<s:textfield name="startLimit[%{#stat.index}]"  id="startLimit[%{#stat.index}]" cssClass="form-control decimal4Only" cssStyle="text-align: right;" maxlength="20" />
													</th>
													<th align="left">
													<s:textfield name="endLimit[%{#stat.index}]"  id="endLimit[%{#stat.index}]" cssClass="form-control decimal4Only" cssStyle="text-align: right;" maxlength="20" />
													</th>
													<th align="left">
													<s:textfield name="premiumVec[%{#stat.index}]"  id="premiumVec[%{#stat.index}]" cssClass="form-control decimal4Only" cssStyle="text-align: right;" maxlength="20" />
													</th>
									            	<th><input type="button" value="<s:text name='label.delete'/>" class="btn btn-sm btn-danger btn-width" onclick="deleteVehicle('<s:property value="#stat.index"/>')" /></th>
												</tr> 
											</s:iterator>
										</tbody>
									</table>							
						</div>
					</div>
					<div class="row">
					<br/>
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
							<input type="button" value="add Land Trasit" onclick="fndVehicle();" class="btn btn-sm btn-primary">
						</div>
					</div>
				 </div>
				
			</div>
		</div>
	</div>
	</s:if>
	<s:if test='"Y".equals(warSrcYN)'>
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="label.warInfo" />
			</div>
			<div class="panel-body">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<div class="row" id="commodityRate">
					    	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
									<table width="100%" class="table table-bordered"  id="newwarrate">
										<thead>
											<tr style="color:blue;">
												<th><s:text name="label.sno" /></th>
												<th width="30%" align="center"><s:text name="label.modeoftransport"></s:text><font color="red">*</font></th>
												<th width="20%" align="center"><s:text name="label.city"></s:text><font color="red">*</font></th>
												<th width="10%" align="center"><s:text name="label.warrate"></s:text><font color="red">*</font></th>
												 <th><input type="button"  value="<s:text name="label.addMore"/>"  class="btn btn-sm btn-primary" onclick="insWarRate('newwarrate');" />
											</tr>
										</thead>
										<tbody>
											<s:iterator value="warmodeTransId" var="list"  status="stat">
												 <tr>
												 <th align="left" width="5%">
													<s:property value="%{#stat.index+1}" />
												 </th>
													<th align="left" width="33%">
														<s:hidden name="warsno[%{#stat.index}]" id="warsno%{#stat.index}" value="%{#stat.index}" theme="simple"/>
														<s:hidden name="warmodeTransName[%{#stat.index}]" id="warmodeTransName_%{#stat.index}" theme="simple"/>
														<s:select name="warmodeTransId[%{#stat.index}]" id="warmodeTransId[%{#stat.index}]" list="editModeTransportList" headerKey="" headerValue="---Select---" listKey="ModeOfTransportId" listValue="ModeOfTransportName" cssClass="inputBoxS tooltipContent tooltipContent" data-content="Currency List"  onchange=" getName(this.value,'mode','%{#stat.index}')"/>
													</th>
													<th align="left" width="33%">
													<s:hidden name="warcityName[%{#stat.index}]" id="warcityName_%{#stat.index}"></s:hidden>
													<s:hidden name="warcitymodeTransId[%{#stat.index}]" id="warcitymodeTransId_%{#stat.index}" value="%{warmodeTransId[#stat.index]}" theme="simple"/>
													<s:select name="warcityCode[%{#stat.index}]" id="warcityCode[%{#stat.index}]" list="warCityList" headerKey="9999" headerValue="---ALL---" listKey="CityCode" listValue="CityName" cssClass="inputBoxS tooltipContent tooltipContent" data-content="Currency List"   onchange=" getName(this.value,'city','%{#stat.index}')"/>
													</th>
													<th align="left" width="30%">
													<s:textfield name="warBaseRate[%{#stat.index}]"  id="warBaseRate[%{#stat.index}]" cssClass="form-control decimal4Only" cssStyle="text-align: right;" maxlength="20" />
													</th>
									            	<td><input type="button" value="<s:text name='label.delete'/>" class="btn btn-sm btn-danger btn-width" onclick="deleteWarRate('<s:property value="#stat.index"/>','<s:property value="warmodeTransId[#stat.index]"/>','<s:property value="warcityCode[#stat.index]"/>')" /></td>
												</tr> 
											</s:iterator>
										</tbody>
									</table>							
						</div>
						<s:iterator value="editModeTransportList" var="list"  status="stat">
						<s:hidden name="mode_%{#list.ModeOfTransport}" id="mode_%{#list.ModeOfTransportId}" value="%{#list.ModeOfTransportName}"/>
						</s:iterator>
						<s:iterator value="warCityList" var="list"  status="stat">
						<s:hidden name="city_%{#list.CityCode}" id="city_%{#list.CityCode}" value="%{#list.CityName}"/>
						</s:iterator>
					</div>
					<div class="row">
					<br/>
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
							<input type="button" value="add War Rate" onclick="fndWarRate();" class="btn btn-sm btn-primary">
						</div>
					</div>
				 </div>
				
			</div>
		</div>
	</div>
	</s:if>
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="label.sharepercentinfo" />
			</div>
			<div class="panel-body">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<div class="row" id="commodityRate">
					    	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
									<table width="100%" class="table table-bordered" >
										<thead>
											<tr style="color:blue;">
												<th width="33%" align="center"><s:text name="label.insurancecompany"></s:text><font color="red">*</font></th>
												<th width="33%" align="center"><s:text name="label.sharepercent"></s:text><font color="red">*</font></th>
												<s:if test="noofInsrance[0]!=null && noofInsrance[0]>0">
												<th width="33%" align="center"><s:text name="label.leaderpar"></s:text><font color="red">*</font></th>
												</s:if>
												
											</tr>
										</thead>
										<tbody>
										<s:iterator value="OrginalInsuranceList" var="list"  status="stat">
											<tr>
												<th align="left" width="33%">
													<s:hidden name="companyName[%{#stat.index}]" id="companyName_%{#stat.index}" theme="simple"/>
													<s:select name="companyId[%{#stat.index}]" id="companyId[%{#stat.index}]" list="OrginalInsuranceList"  listKey="InsuranceCompanyId" listValue="InsuranceCompanyName" cssClass="inputBoxS tooltipContent tooltipContent" data-content="Currency List" cssStyle="width:80%;float:left;"  onchange=" getName(this.value,'company','%{#stat.index}')" disabled="true"/>
												</th>
												<th align="left" width="33%">
												<s:textfield name="shareValue[%{#stat.index}]"  id="shareValue[%{#stat.index}]" cssClass="form-control decimal4Only" cssStyle="text-align: right;" maxlength="20" disabled="true"/>
												</th>
												<s:if test="noofInsrance[0]!=null && noofInsrance[0]>0">
												<th align="left" width="33%">
												<s:radio list="#{'L':'Leader','P':'Participant' }" name="leaderYN[%{#stat.index}]" id="leaderYN[%{#stat.index}]"></s:radio>
												</th>
												</s:if>
												<s:else>
												<s:hidden name="leaderYN[%{#stat.index}]" id="leaderYN[%{#stat.index}]" value="Y"></s:hidden>
												</s:else>
											</tr>
										</s:iterator>
										<s:if test="noofInsrance[0]!=null && noofInsrance[0]>0">
										<s:iterator value="noofInsrance" var="list"  status="stat">
												<tr>
													<th align="left" width="33%">
														<s:hidden name="companyName[%{#stat.index+1}]" id="companyName_%{#stat.index+1}" theme="simple"/>
														<s:select name="companyId[%{#stat.index+1}]" id="companyId[%{#stat.index+1}]" list="additionalInsuranceList" headerKey="" headerValue="---Select---" listKey="InsuranceCompanyId" listValue="InsuranceCompanyName" cssClass="inputBoxS tooltipContent tooltipContent" data-content="Currency List" cssStyle="width:80%;float:left;"  onchange=" getName(this.value,'company','%{#stat.index}')"/>
													</th>
													<th align="left" width="33%">
													<s:textfield name="shareValue[%{#stat.index+1}]"  id="shareValue[%{#stat.index+1}]" cssClass="form-control decimal4Only" cssStyle="text-align: right;" maxlength="20" />
													</th>
													<th align="left" width="33%">
													<s:radio list="#{'L':'Leader','P':'Participant' }" name="leaderYN[%{#stat.index+1}]" id="leaderYN[%{#stat.index+1}]"></s:radio>
													</th>
												</tr>
											</s:iterator> 
										</s:if>
										</tbody>
									</table>
									<s:iterator value="warCityList" var="list"  status="stat">
										<s:hidden name="company_%{#list.CityCode}" id="company_%{#list.CityCode}" value="%{#list.CityName}"/>
									</s:iterator>							
						</div>
					</div>
					<div class="row">
					<br/>
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
							<input type="button" value="Save share Percentage" onclick="fnsharePer();" class="btn btn-sm btn-primary">
						</div>
					</div>
				 </div>
				
			</div>
		</div>
	</div>
	<s:if test='"Y".equals(endtYN)'>
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="label.endtInfo" />
			</div>
			<div class="panel-body">
				
				<s:set var="list" value="endtType"></s:set>
		        <s:set var="#typelist" value="endorsementList"></s:set>
		        <div class="row">
					<s:set var="datacnt" value="0"/>
					<s:iterator value="#typelist" var="type" status="stat">
			        		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
			        			<s:set var="datacnt" value="%{@java.lang.Integer@parseInt(#attr.datacnt)+1}"/>
								<s:checkbox name="endtType" value="%{#type.EndtTypeId in #list}" id="endtType%{#type.EndtTypeId}" fieldValue="%{#type.EndtTypeId}" onchange="toggleEndt();"/><s:property value="%{#type.EndtTypeDesc}" />
			        		</div>
			        </s:iterator>
		        </div>
		        <div class="row" id="toggle" style="display:none">
		        	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
						<div class="text">
				 			<s:text name="label.cancelDate" />
				 		</div>
				 		<div class="tbox">
							<s:textfield name="cancellationDate" id="cancellationDate" cssClass="inputBox datepicker tooltipContent" data-content="Open Cover Start Date"  />
						</div>
					</div>
		        	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" >
						<div class="text">
							<s:text name="label.remarks" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
							<s:textarea rows="3" name="cancellationRemarks" cols="55" style="width: 100%;" onkeyup="textLimit(this,1000)"/>
						</div>
						<br/>
						<br/>
					</div>
		        </div>
		        <div class="row" id="toggle2" style="display:none">
		        	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" >
							<div class="text">
								<s:text name="label.remarks" /><font color="red">*</font>
					 		</div>
					 		<div class="tbox">
								<s:textarea rows="3" name="endorsementRemarks" cols="55" style="width: 100%;" onkeyup="textLimit(this,1000)"/>
							</div>
							<br/>
							<br/>
					</div>
		        </div>
			</div>
		</div>
	</div>
	</s:if>
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<br/>
			<div class="row" align="center">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<input type="button" value="Back" onclick="backBtn();" class="btn btn-sm btn-danger">&nbsp;&nbsp;&nbsp;
					<input type="button" value="Proceed" onclick="proceedBtn();" class="btn btn-sm btn-success">
				</div>
			</div>
			<br/>
		</div>
	</div>
</div>
			
<s:hidden name="proposalNo" id="proposalNo"/>
<s:hidden name="openCoverType" id="openCoverType" value="%{openCoverTypeS}"/>
<s:hidden name="endtYN" id="endtYN"/>
<s:hidden name="endtStatus" id="endtStatus"/>
<s:hidden name="deleteId" id="deleteId"/>
<s:hidden name="modeOfTransport" id="modeOfTransport"/>
<s:hidden name="cityCode" id="cityCode"/>
<s:token/>
</s:form>
<script type="text/javascript">
$(function() {
	$('#cancellationDate').datetimepicker({
	     format:'d/m/Y',
	     //step: 1,
	     timepicker:false,
	    // minDate:'0',
	    // maxDate:'+1970/01/15',    
	     scrollInput : false,
	     onSelectDate:function(current_time, $input){
	    	 $(".xdsoft_datetimepicker").css("display", "none");
	     }
	});
});
function backBtn(){
	document.Quotation.action = 'getModeofCoverOpenCover.action';
	document.Quotation.submit();
}
function proceedBtn(){
	var opencoverType=document.getElementById("openCoverType").value;
	if(opencoverType=='12' || opencoverType=='13'){
		document.Quotation.action = 'adddepositInfoOpenCover.action';
	}else{
		document.Quotation.action = 'policygenerateOpenCover.action';
	}
	document.Quotation.submit();
}
<s:if test="!hasActionErrors()">
getList('<s:property value="commodityCode"/>','commodityRate')
</s:if>
function getList(val, id) {
	var proposalno=document.getElementById("proposalNo").value;
 	postRequest('<%=request.getContextPath()%>/'+id+'OpenCover.action?commodityCode='+val+'&proposalNo='+proposalno, id);
}
function addCommodity() {
	document.Quotation.action = 'addCommodityRateOpenCover.action';
	document.Quotation.submit();
}
function fndWarRate() {
	document.Quotation.action = 'savemodeWarOpenCover.action';
	document.Quotation.submit();
}
function fndVehicle() {
	document.Quotation.action = 'savevehicleInfoOpenCover.action';
	document.Quotation.submit();
}

function getClausesInfo(coverid,covername,modeid,modeName,type){
	
		var where_to= confirm("Do You Want to Edit the Clauses and Warrenties?");
		if(where_to==true)
		{
			 var URL = '';
			 if(type=='clauses'){
				 URL='clausesPopupCondition.action?coverId='+coverid+'&coverName='+covername+'&modeOfTransport='+modeid+'&modeOfTransportName='+modeName+'&type='+type+'&proposalNo='+document.Quotation.proposalNo.value;
			 }else if(type=='warrenty'){
				 URL='warrantyPopupCondition.action?type='+type+'&proposalNo='+document.Quotation.proposalNo.value;
			 }else if(type=='exclusion'){
				 URL='exclusionPopupCondition.action?type='+type+'&proposalNo='+document.Quotation.proposalNo.value;
			 }else if(type=='war'){
				 URL='warPopupCondition.action?type='+type+'&proposalNo='+document.Quotation.proposalNo.value;
			 } else if(type=='others'){
				 URL='othersPopupCondition.action?type='+type+'&proposalNo='+document.Quotation.proposalNo.value;
			 }
			 
		
	 		var windowName = "Clauses";
			var width  = screen.availWidth;
			var height = screen.availHeight;
			var h=400;
			var w=700;
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
		return false;
}
function getName(Field,type,id)
{
	if(type=='mode'){
		document.getElementById("warmodeTransName_"+id).value=document.getElementById("mode_"+Field).value;
		document.getElementById("warcitymodeTransId_"+id).value=Field;
	}else if(type=='city'){
		document.getElementById("warcityName_"+id).value=document.getElementById("city_"+Field).value;
	}else if(type=='company'){
		document.getElementById("companyName_"+id).value=document.getElementById("company_"+Field).value;
	}
	
}
function fnsharePer(){
	document.Quotation.action = 'savesharepercentOpenCover.action';
	disableForm(Quotation,false,'');
	document.Quotation.submit();
}
function insWarRate(tableID){
	//alert(tableID);
	var table = document.getElementById(tableID);
	//alert(table);
	var rowCount = table.rows.length;	
	//alert(rowCount);
	var row = table.insertRow(rowCount);
	var cell1 = row.insertCell(0)
	cell1.innerHTML="<strong>"+rowCount+"</stong>";
	var cell1 = row.insertCell(1)
	createModeCell(cell1, rowCount);	
	
	var cell2 = row.insertCell(2);
	createCityCell(cell2, rowCount);	
	
	var cell3 = row.insertCell(3);
	var element3 = document.createElement("input");
	element3.type = "text";
	element3.name = "warBaseRate["+(rowCount-1)+"]";
	element3.id = "warBaseRate["+(rowCount-1)+"]";
	element3.className = "form-control decimal4Only";
	element3.style = "text-align: right";
	element3.type = "text";
	element3.setAttribute("maxlength", "20");
	
	//cell4.setAttribute("align","center");
	cell3.appendChild(element3);
	
	var cell6 = row.insertCell(4);
	//cell9.setAttribute("align","center");
	var element9 = document.createElement("input");
	element9.type = "button";
	
	element9.value="<s:text name='label.delete'/>";
	element9.setAttribute("onclick", "deleteWarRate('"+(rowCount-1)+"','','')");
	element9.className="btn btn-sm btn-danger btn-width"
	cell6.appendChild(element9);
	// document.getElementById("ageloopcount").value =parseInt(rowCount);
}
function createModeCell(cell, rowCount){
	 element = document.createElement("select");
    element.name = "warmodeTransId["+(rowCount-1)+"]";
  	 element.id = "warmodeTransId["+(rowCount-1)+"]";
  	element.setAttribute("onchange", "getName(this.value,'mode','"+(rowCount-1)+"')");
    element.className = "inputBoxS tooltipContent tooltipContent";
    var element1 = document.createElement("input");
	element1.type = "hidden";
	 element1.name = "warmodeTransName["+(rowCount-1)+"]";
  	 element1.id = "warmodeTransName_"+(rowCount-1);
  	  var element2 = document.createElement("input");
  	element2.type = "hidden";
  	 element2.name = "warsno["+(rowCount-1)+"]";
   	element2.id = "warsno"+(rowCount-1);
   	element2.value =(rowCount-1);
  	
    populateMode(element);
    cell.appendChild(element);
    cell.appendChild(element1);
    cell.appendChild(element2);
}
function populateMode(objSelect){
	var objOption = document.createElement("option");
         objOption.text = '---Select---';
         objOption.value = '';
         if(document.all && !window.opera){
         	objSelect.add(objOption);
         }else{
         	objSelect.add(objOption, null);
         }
        	<s:iterator value='editModeTransportList'>
				var objOption = document.createElement("option");
				objOption.text = "<s:property value='ModeOfTransportName' />".replace("&amp;", "&");
				objOption.value = "<s:property value='ModeOfTransportId' />";
				if(document.all && !window.opera){
					element.add(objOption);
					
					
				}else{
					element.add(objOption, null);
				}
			</s:iterator>
}

function createCityCell(cell, rowCount){
	 element = document.createElement("select");
  	 element.name = "warcityCode["+(rowCount-1)+"]";
	 element.id = "warcityCode["+(rowCount-1)+"]";
	 element.setAttribute("onchange", "getName(this.value,'city','"+(rowCount-1)+"')");
  	 element.className = "inputBoxS tooltipContent tooltipContent";
     var element1 = document.createElement("input");
	 element1.type = "hidden";
	 element1.name = "warcityName["+(rowCount-1)+"]";
	 element1.id = "warcityName_"+(rowCount-1);
	 var element2 = document.createElement("input");
	 element2.type = "hidden";
	 element2.name = "warcitymodeTransId["+(rowCount-1)+"]";
	 element2.id = "warcitymodeTransId_"+(rowCount-1);
	 
  populateCity(element);
  cell.appendChild(element);
  cell.appendChild(element1);
  cell.appendChild(element2);
}
function populateCity(objSelect){
	var objOption = document.createElement("option");
       objOption.text = '---ALL---';
       objOption.value = '9999';
       if(document.all && !window.opera){
       	objSelect.add(objOption);
       }else{
       	objSelect.add(objOption, null);
       }
      	<s:iterator value='warCityList'>
				var objOption = document.createElement("option");
				objOption.text = "<s:property value='CityName' />".replace("&amp;", "&");
				objOption.value = "<s:property value='CityCode' />";
				if(document.all && !window.opera){
					element.add(objOption);
					
					
				}else{
					element.add(objOption, null);
				}
			</s:iterator>
}
function insVehicle(tableID){
	//alert(tableID);
	var table = document.getElementById(tableID);
	//alert(table);
	var rowCount = table.rows.length;	
	//alert(rowCount);
	var row = table.insertRow(rowCount);
	var cell1 = row.insertCell(0)
	cell1.innerHTML="<strong>"+rowCount+"</stong>";
	var cell1 = row.insertCell(1)
	createCategoryCell(cell1, rowCount);
	
	var cell2 = row.insertCell(2);
	var element2 = document.createElement("input");
	element2.type = "text";
	element2.name = "haulierCategory["+(rowCount-1)+"]";
	element2.id = "haulierCategory["+(rowCount-1)+"]";
	element2.className = "form-control";
	element2.type = "text";
	element2.setAttribute("maxlength", "200"); 	
	cell2.appendChild(element2);
	
	var cell3 = row.insertCell(3);
	var element3 = document.createElement("input");
	element3.type = "text";
	element3.name = "startLimit["+(rowCount-1)+"]";
	element3.id = "startLimit["+(rowCount-1)+"]";
	element3.className = "form-control decimal4Only";
	element3.style = "text-align: right";
	element3.type = "text";
	element3.setAttribute("maxlength", "20");
	
	cell3.appendChild(element3);
	
	var cell4 = row.insertCell(4);
	var element4 = document.createElement("input");
	element4.type = "text";
	element4.name = "endLimit["+(rowCount-1)+"]";
	element4.id = "endLimit["+(rowCount-1)+"]";
	element4.className = "form-control decimal4Only";
	element4.style = "text-align: right";
	element4.type = "text";
	element4.setAttribute("maxlength", "20");
	
	cell4.appendChild(element4)
	
	var cell5 = row.insertCell(5);
	var element5 = document.createElement("input");
	element5.type = "text";
	element5.name = "premiumVec["+(rowCount-1)+"]";
	element5.id = "premiumVec["+(rowCount-1)+"]";
	element5.className = "form-control decimal4Only";
	element5.style = "text-align: right";
	element5.type = "text";
	element5.setAttribute("maxlength", "20");
	
	cell5.appendChild(element5)
	
	var cell6 = row.insertCell(6);
	//cell9.setAttribute("align","center");
	var element9 = document.createElement("input");
	element9.type = "button";
	
	element9.value="<s:text name='label.delete'/>";
	element9.setAttribute("onclick", "deleteVehicle('"+(rowCount-1)+"')");
	element9.className="btn btn-sm btn-danger btn-width"
	cell6.appendChild(element9);
	// document.getElementById("ageloopcount").value =parseInt(rowCount);
}
function createCategoryCell(cell, rowCount){
	 element = document.createElement("select");
 	 element.name = "haulierCategoryId["+(rowCount-1)+"]";
	 element.id = "haulierCategoryId["+(rowCount-1)+"]";
 	 element.className = "inputBoxS tooltipContent tooltipContent";
 	  var element1 = document.createElement("input");
 	 element1.type = "hidden";
 	 element1.name = "hauliersno["+(rowCount-1)+"]";
 	 element1.id = "hauliersno_"+(rowCount-1);
 	 element1.value = (rowCount-1);
	 
 populateCategory(element);
 cell.appendChild(element);
 cell.appendChild(element1);
 
}
function populateCategory(objSelect){
	var objOption = document.createElement("option");
      objOption.text = '---Select---';
      objOption.value = '';
      if(document.all && !window.opera){
      	objSelect.add(objOption);
      }else{
      	objSelect.add(objOption, null);
      }
     	<s:iterator value='haulierCategoryList'>
				var objOption = document.createElement("option");
				objOption.text = "<s:property value='CodeDescription' />".replace("&amp;", "&");
				objOption.value = "<s:property value='Code' />";
				if(document.all && !window.opera){
					element.add(objOption);
					
					
				}else{
					element.add(objOption, null);
				}
			</s:iterator>
}
function toggleEndt(){

 	var opencoverType=document.getElementById("openCoverType").value;
	var status=false;
	
	var endtStatus=document.getElementById("endtStatus").value;
		
			try {
   			status=document.getElementById('endtType42').checked;
		}
		catch(err) {status=false}
	if(status){
	   document.getElementById('toggle').style.display="";
	   document.getElementById('toggle2').style.display="none";
	}else if (endtStatus=='Y'){
	   document.getElementById('toggle').style.display="none";
	   document.getElementById('toggle2').style.display="";
	} 
}
function deleteWarRate(val,val1,val2){
	if(val==0){
		alert("First row can't be deleted");
	}
	else{
		var status=confirm("Do you want to delete specified row");
		if(status){
			document.getElementById("deleteId").value=val;
			document.getElementById("modeOfTransport").value=val1;
			document.getElementById("cityCode").value=val2;
			document.Quotation.action = 'deleteWarRateOpenCover.action';
			document.Quotation.submit();
		}
		}
}
function deleteVehicle(val){
	if(val==0){
		alert("First row can't be deleted");
	}
	else{
		var status=confirm("Do you want to delete specified row");
		if(status){
			document.getElementById("deleteId").value=val;
			document.Quotation.action = 'deleteVehicleOpenCover.action';
			document.Quotation.submit();
		}
		}
}
</script>	
</body>
</html>