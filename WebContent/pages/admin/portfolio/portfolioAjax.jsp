<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>
<s:if test='"portfolioLists1".equals(reqFrom)'>
	<div>
<!-- 	   	<table class="footable" id="record" width="100%" cellspacing="0"> -->
	   	<table class="display responsive no-wrap" width="100%" cellspacing="0" cellspacing="0" >
			<thead>
			<tr>
				<th> <s:text name="S.No." /> </th>
				<th> <s:text name="APPLICATION NO" /> </th>
				<th> <s:text name="BROKER ORGANIZATION" /> </th>
				<th> <s:text name="CUSTOMER NAME" /> </th>
				<th> <s:text name="EXCESS PREMIUM" /> </th>
				<th> <s:text name="INCEPTION DATE" /> </th>
				<th> <s:text name="LOGIN ID" /> </th>
				<th> <s:text name="OPEN COVER NO" /> </th>
				<th> <s:text name="POLICY NO" /> </th>
				<th> <s:text name="PREMIUM" /> </th>
				<th> <s:text name="QUOTE NO" /> </th>
				<th> <s:text name="REMARKS" /> </th>
			</tr>
			</thead>
			<tbody>
			<s:iterator value="portfolioList" status="stat" var="record">
			<tr>
				<td align="center"><s:property value="%{#stat.index+1}" /></td>
				<td align="center"><s:property value="ApplicationNo" /></td>
				<td align="center"><s:property value="BrokerOrganization" /></td>
				<td align="center"><s:property value="CustomerName" /></td>
				<td align="center"><s:property value="ExcessPremium" /></td>
				<td align="center"><s:property value="InceptionDate" /></td>
				<td align="center"><s:property value="LoginId" /></td>
				<td align="center"><s:property value="OpenCoverNo" /></td>
				<td align="center"><s:property value="PolicyNo" /></td>
				<td align="center"><s:property value="Premium" /></td>
				<td align="center"><s:property value="QuoteNo" /></td>
				<td align="center"><s:property value="Remarks" /></td>
			</tr>
			</s:iterator>
			</tbody>
		</table>
		<s:if test='"A".equals(rep)'>
			<br class="clear" />
			<div align="center">
				<input type="button" class="btn btn-sm btn-success" value="Save" onclick="pendingExcel();"/>
			</div>
		</s:if>	
	</div>
</s:if>
<s:elseif test='"portfolioLists".equals(reqFrom)'>
<div>
  <%--  Selected Date :<s:property value="viewdate"/>
	<s:hidden name="viewdate"  /> --%> <br class="clear" />
	<table class="display responsive no-wrap" width="100%" cellspacing="0" cellspacing="0" >
		<thead>
		<tr>
			<th> <s:text name="S.No." /> </th>
			<s:if test='"c".equals(rep)'>
				<th> <s:text name="BROKER ORAGANIZATION" /> </th>
				<th> <s:text name="QUOTE CREATED BY" /> </th>
				<th> <s:text name="QUOTE NO" /> </th>
				<th> <s:text name="CUSTOMER NAME" /> </th>
				<th> <s:text name="PREMIUM" /> </th>
				<th> <s:text name="VIEW DRAFT" /> </th>
				<th> <s:text name="VIEW DOCUMENT" /></th>
			</s:if>
			<s:elseif test='"p".equals(rep)'>
				<th> <s:text name="BROKER ORAGANIZATION" /> </th>
				<th> <s:text name="QUOTE CREATED BY" /> </th>
				<th> <s:text name="POLICY NO" /> </th>
				<th> <s:text name="CUSTOMER NAME" /> </th>
				<th> <s:text name="PREMIUM" /> </th>
				<th> <s:text name="VIEW PDF" /> </th>
				<th> <s:text name="VIEW DOCUMENT" /></th>
			</s:elseif>
			<s:elseif test='"y".equals(rep)'>
				<th> <s:text name="BROKER ORAGANIZATION" /> </th>
				<th> <s:text name="QUOTE CREATED BY" /> </th>
				<th> <s:text name="POLICY NO" /> </th>
				<th> <s:text name="CUSTOMER NAME" /> </th>
				<th> <s:text name="PREMIUM" /> </th>
				<th> <s:text name="SCHEDULE"/> </th>
				<th> <s:text name="CREDIT"/> </th>
				<th> <s:text name="DEBIT"/> </th>
			</s:elseif>
			<s:elseif test='"pc".equals(rep)'>
				<th> <s:text name="BROKER ORAGANIZATION" /> </th>
				<th> <s:text name="QUOTE CREATED BY" /> </th>
				<th> <s:text name="POLICY NO" /> </th>
				<th> <s:text name="CUSTOMER NAME" /> </th>
				<th> <s:text name="PREMIUM" /> </th>
				<th> <s:text name="VIEW PDF" /> </th>
				<th> <s:text name="Status" /> </th>
			</s:elseif>
			<s:elseif test='"r".equals(rep)'>
				<th> <s:text name="BROKER ORAGANIZATION" /> </th>
				<th> <s:text name="QUOTE CREATED BY" /> </th>
				<th> <s:text name="QUOTE NO" /> </th>
				<th> <s:text name="CUSTOMER NAME" /> </th>
				<th> <s:text name="PREMIUM" /> </th>
			</s:elseif>
			<s:elseif test='"sr".equals(rep)'>
				<th> <s:text name="BROKER ORAGANIZATION" /> </th>
				<th> <s:text name="QUOTE CREATED BY" /> </th>
				<th> <s:text name="QUOTE NO" /> </th>
				<th> <s:text name="POLICY NO" /> </th>
				<th> <s:text name="CUSTOMER NAME" /> </th>
				<th> <s:text name="PREMIUM" /> </th>
				<th> <s:text name="VIEW PDF" /> </th>
			</s:elseif>
			<s:elseif test='"sr".equals(rep)'>
				<th> <s:text name="BROKER ORAGANIZATION" /> </th>
				<th> <s:text name="QUOTE CREATED BY" /> </th>
				<th> <s:text name="QUOTE NO" /> </th>
				<th> <s:text name="POLICY NO" /> </th>
				<th> <s:text name="CUSTOMER NAME" /> </th>
				<th> <s:text name="PREMIUM" /> </th>
				<th> <s:text name="VIEW PDF" /> </th>
			</s:elseif>
			<s:elseif test='"d".equals(rep)'>
				<th> <s:text name="BROKER ORAGANIZATION" /> </th>
				<th> <s:text name="QUOTE CREATED BY" /> </th>
				<th> <s:text name="POLICY NO" /> </th>
				<th> <s:text name="CUSTOMER NAME" /> </th>
				<th> <s:text name="PREMIUM" /> </th>
				<s:if test='"13".equals(productID)'>
					<th> <s:text name="SCHEDULE"/> </th>
					<th> <s:text name="CREDIT"/> </th>
					<th> <s:text name="DEBIT"/> </th>
				</s:if>
				<s:else>
					<th> <s:text name="VIEW PDF" /> </th>
					<th> <s:text name="VIEW DOCUMENT" /></th>
				</s:else>
			</s:elseif>
		</tr>
		</thead>
		<tbody>
		<s:iterator value="portfolioList" status="stat" var="record">
		<tr>
			<td><s:property value="%{#stat.index+1}" /></td>
			<s:if test='"c".equals(rep)'>
				<td> <s:property value="BrokerOrganization" /> </td>
				<td> <s:property value="LoginId" /> </td>
				<td> <s:property value="QuoteNo" /> </td>
				<td> <s:property value="CustomerName" /> </td>
				<td> <s:property value="Premium" /> </td>
				<td align="center">
				
					<a href="#" type="button" class="btn btn-sm btn-info" onclick="viewDoc('<s:property value="QuoteNo"/>','<s:property value="policyNo"/>','draft')"> <i class="fa fa-book"></i> </a>
					<%-- <a href="#" type="button" class="btn btn-sm btn-info" onclick="viewPolicys('<s:property value="QuoteNo"/>','<s:property value="#record.LoginId"/>','draft','<s:property value="#record.ProductId"/>','<s:property value="#record.OpenCoverNo"/>')"> <i class="fa fa-book"></i> </a> --%>
				</td>

				<td align="center">
					<a href="#" type="button" class="btn btn-sm btn-info" onclick="viewDocument('<s:property value="PolicyNo"/>','display')"> <i class="fa fa-book"></i> </a>
				</td>

				
			</s:if>
			<s:elseif test='"p".equals(rep)'>
				<td> <s:property value="BrokerOrganization" /> </td>
				<td> <s:property value="LoginId" /> </td>
				<td> <s:property value="PolicyNo" /> </td>
				<td> <s:property value="CustomerName" /> </td>
				<td> <s:property value="Premium" /> </td>
				<td>
				<a href="#" type="button" class="btn btn-sm btn-info" onclick="viewDoc('<s:property value="QuoteNo"/>','<s:property value="PolicyNo"/>','schedule')"> <i class="fa fa-book"></i> </a>
					<%-- <a href="#" type="button" class="btn btn-sm btn-info" onclick="viewPolicys('<s:property value="PolicyNo"/>','<s:property value="#record.LoginId"/>','schedule','<s:property value="#record.ProductId"/>','<s:property value="#record.OpenCoverNo"/>')"> <i class="fa fa-file-pdf-o"></i> </a> --%>
				</td>

				<td align="center">
					<a href="#" type="button" class="btn btn-sm btn-info" onclick="viewDocument('<s:property value="PolicyNo"/>','display')"> <i class="fa fa-book"></i> </a>
				</td>

			</s:elseif>
			<s:elseif test='"y".equals(rep)'>
				<td> <s:property value="BrokerOrganization" /> </td>
				<td> <s:property value="LoginId" /> </td>
				<td> <s:property value="PolicyNo" /> </td>
				<td> <s:property value="CustomerName" /> </td>
				<td> <s:property value="Premium" /> </td>
				<td>	
					<a href="#" type="button"  class="btn btn-sm btn-primary" onClick="getVehicleSchedule(this.form,'<s:property value="PolicyNo"/>','schedule')"><i class="glyphicon glyphicon-book"></i></a>
				</td>	
				<td>	
					<a href="#" type="button" class="btn btn-sm btn-warning" onClick="getVehicleSchedule(this.form,'<s:property value="PolicyNo"/>','credit')"><i class="glyphicon glyphicon-book"></i></a>
				</td>
				<td>	
					<a href="#" type="button"  class="btn btn-sm btn-info"  onClick="getVehicleSchedule(this.form,'<s:property value="PolicyNo"/>','debit')"><i class="glyphicon glyphicon-book"></i></a>
				</td>	
			</s:elseif>
			<s:elseif test='"pc".equals(rep)'>
				<td> <s:property value="BrokerOrganization" /> </td>
				<td> <s:property value="LoginId" /> </td>
				<td> <s:property value="PolicyNo" /> </td>
				<td> <s:property value="CustomerName" /> </td>
				<td> <s:property value="Premium" /> </td>
				<td>
					<a href="#" type="button" class="btn btn-sm btn-info" onclick="viewPolicys('<s:property value="PolicyNo"/>','<s:property value="#record.LoginId"/>','schedule','<s:property value="#record.ProductId"/>','<s:property value="#record.OpenCoverNo"/>')"> <i class="fa fa-eye"></i> </a>
				</td>
				<td>
					<s:hidden name="policyNo[%{#attr.record_rowNum-1}]" value="%{#myrow.PolicyNo}" />
					<s:radio list="#{'A':'Active','D':'Deactive'}" name="status[%{#attr.record_rowNum-1}]" value="%{#myrow.POLICY_CANCEL_STATUS}"></s:radio>
				</td>
			</s:elseif>
			<s:elseif test='"r".equals(rep)'>
				<td> <s:property value="BrokerOrganization" /> </td>
				<td> <s:property value="LoginId" /> </td>
				<td> <s:property value="QuoteNo" /> </td>
				<td> <s:property value="CustomerName" /> </td>
				<td> <s:property value="Premium" /> </td>
			</s:elseif>
			<s:elseif test='"sr".equals(rep)'>
				<td> <s:property value="BrokerOrganization" /> </td>
				<td> <s:property value="LoginId" /> </td>
				<td> <s:property value="QuoteNo" /> </td>
				<td> <s:property value="PolicyNo" /> </td>
				<td> <s:property value="CustomerName" /> </td>
				<td> <s:property value="Premium" /> </td>
				<td>
					<a href="#" type="button" class="btn btn-sm btn-info" onclick="viewPolicys('<s:property value="PolicyNo"/>','<s:property value="#record.LoginId"/>','schedule','<s:property value="#record.ProductId"/>','<s:property value="#record.OpenCoverNo"/>')"><i class="fa fa-eye"></i></a>
				</td>
			</s:elseif>
			<s:elseif test='"sr".equals(rep)'>
				<td> <s:property value="BrokerOrganization" /> </td>
				<td> <s:property value="LoginId" /> </td>
				<td> <s:property value="QuoteNo" /> </td>
				<td> <s:property value="PolicyNo" /> </td>
				<td> <s:property value="CustomerName" /> </td>
				<td> <s:property value="Premium" /> </td>
				<td>
					<a href="#" type="button" class="btn btn-sm btn-info" onclick="viewPolicys('<s:property value="PolicyNo"/>','<s:property value="#record.LoginId"/>','schedule','<s:property value="#record.ProductId"/>','<s:property value="#record.OpenCoverNo"/>')"><i class="fa fa-eye"></i></a>
				</td>
			</s:elseif>
			<s:elseif test='"d".equals(rep)'>
				<td> <s:property value="BrokerOrganization" /> </td>
				<td> <s:property value="LoginId" /> </td>
				<td> <s:property value="PolicyNo" /> </td>
				<td> <s:property value="CustomerName" /> </td>
				
				<s:if test='"13".equals(productID)'>
					<td> <s:property value="Premium" /> </td>
				<td>	
					<a href="#" type="button"  class="btn btn-sm btn-primary" onClick="getVehicleSchedule(this.form,'<s:property value="PolicyNo"/>','schedule')"><i class="glyphicon glyphicon-book"></i></a>
				</td>	
				<td>	
					<a href="#" type="button" class="btn btn-sm btn-warning" onClick="getVehicleSchedule(this.form,'<s:property value="PolicyNo"/>','credit')"><i class="glyphicon glyphicon-book"></i></a>
				</td>
				<td>	
					<a href="#" type="button"  class="btn btn-sm btn-info"  onClick="getVehicleSchedule(this.form,'<s:property value="PolicyNo"/>','debit')"><i class="glyphicon glyphicon-book"></i></a>
				</td>	
				</s:if>
				<s:else>
				<td> <s:property value="Premium" /> </td>
				<td>
					<a href="#" type="button" class="btn btn-sm btn-info" onclick="viewPolicys('<s:property value="PolicyNo"/>','<s:property value="LoginId"/>','schedule','<s:property value="#record.ProductId"/>','<s:property value="#record.OpenCoverNo"/>')"> <i class="fa fa-file-pdf-o"></i> </a>
				</td>

				<td align="center">
					<a href="#" type="button" class="btn btn-sm btn-info" onclick="viewDocument('<s:property value="PolicyNo"/>','display')"> <i class="fa fa-book"></i> </a>
				</td>

			
				</s:else>
			</s:elseif>
		</tr>
		</s:iterator>
		</tbody>
	</table>
<br/>
			<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
						<input type="button"  onclick="getBack('<s:property value="productID" />');"  class="btn btn-sm btn-danger" value="Back"/>
					</div>
			</div>
<s:if test='"pc".equals(rep)'><input type="button" onclick="getSubmit();" value="Submit" /></s:if>

</div>
</s:elseif>

<s:if test='"searchList".equals(reqFrom)'>

    <table class="display responsive no-wrap" width="100%" cellspacing="0" cellspacing="0" style="font-size: 12px;">
		<thead>
		<tr>
			<th> <s:text name="S.No." /> </th>
			
				<th> <s:text name="BROKER ORAGANIZATION" /> </th>
				<th> <s:text name="QUOTE CREATED BY" /> </th>
				<th> <s:text name="QUOTE NO" /> </th>
				<th> <s:text name="POLICY NO" /> </th>
				<th> <s:text name="CUSTOMER NAME" /> </th>
				<th> <s:text name="PREMIUM" /> </th>
				<th> <s:text name="VIEW PDF" /> </th>
				<th> <s:text name="VIEW DOCUMENT" /></th>
		</tr>
		</thead>
		<tbody>
		
		<s:iterator value="searchList" status="stat" var="record">
		<tr>
			<td><s:property value="%{#stat.index+1}" /></td>
			
				<td> <s:property value="BrokerOrganization" /> </td>
				<td> <s:property value="LoginId" /> </td>
				<td> <s:property value="QuoteNo	" /> </td>
				<td> <s:property value="PolicyNo" /> </td>
				<td> <s:property value="CustomerName" /> </td>
				<td> <s:property value="Premium" /> </td>
				<s:set var="status" value="STATUS" />
				<s:if test='"P".equals(status)||"D".equals(status)'>
				<td>
					<a href="#" type="button" class="btn btn-sm btn-info" onclick="viewPolicys('<s:property value="PolicyNo"/>','<s:property value="#record.LoginId"/>','schedule','<s:property value="#record.ProductId"/>','<s:property value="#record.OpenCoverNo"/>')"> <i class="fa fa-file-pdf-o"></i> </a>
				</td>

				<td align="center">
					<a href="#" type="button" class="btn btn-sm btn-info" onclick="viewDocument('<s:property value="PolicyNo"/>','display')"> <i class="fa fa-book"></i> </a>
				</td>
				</s:if>
				<s:else>
				<td align="center">
					<a href="#" type="button" class="btn btn-sm btn-info" onclick="viewPolicys('<s:property value="QuoteNo"/>','<s:property value="#record.LoginId"/>','draft','<s:property value="#record.ProductId"/>','<s:property value="#record.OpenCoverNo"/>')"> <i class="fa fa-book"></i> </a>
				</td>

				<td align="center">
					<a href="#" type="button" class="btn btn-sm btn-info" onclick="viewDocument('<s:property value="PolicyNo"/>','display')"> <i class="fa fa-book"></i> </a>
				</td>
				</s:else>
		</tr>
		</s:iterator>

		</tbody>
	</table>
</s:if>
<s:elseif test='("branchsel".equals(reqFrom))'>
		<s:select name="branchId" cssClass="inputBoxS" id="branchId" list="branchList" headerKey="" headerValue="---Select---" listKey="BranchCode" listValue="BranchName" />
	</s:elseif>
