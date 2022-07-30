<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<table id="searchResult" style="width:100%; align:center;" cellpadding="1" class="table table-bordered">
	<thead>
		<tr>
			<th><s:text name="label.report.sno"/></th>
			<th><s:text name="label.report.quoteno"/></th>
			<th><s:text name="label.report.cusname"/></th>
			<th><s:text name="label.report.quotedate"/></th>
			<th><s:text name="label.search.policystartdate"/></th>
			<th><s:text name="label.report.policyno"/></th>
			<th><s:text name="report.status"/></th>
			<th></th>
		</tr>
	</thead>
	<tbody>
	<s:if test="policyList !=null && policyList.size()>0">
		<s:iterator value="policyList" var="result" status="stat">
			<tr>
				<td><s:property value="#stat.index+1"/></td>
				<td><s:property value="QUOTE_NO"/></td>
				<td><s:property value="CUSTOMER_NAME"/></td>
				<td><s:property value="QUOTATION_DATE"/></td>
				<td><s:property value="POLICY_START_DATE"/></td>
				<td><s:property value="POLICY_NO"/></td>
				<s:if test='"policyNo1".equals(searchBy)'>
					<s:if test='"ar".equals(locale.language)'>
					<td>المحفظة</td>
					</s:if>
					<s:else><td>Portfolio</td></s:else>
				</s:if>
				<s:else>
				<s:if test='"ar".equals(locale.language)'>
					<td><s:property value="STATUS_TYPE_NAME_AR"/></td>
					</s:if>
					<s:else>
					<td><s:property value="STATUS_TYPE_NAME"/></td>
					</s:else>
				</s:else>
				<td style="text-align: center;">
					<s:if test='"policyNo".equals(searchBy) || "P".equals(STATUS_TYPE) '>
						<%-- <a href="#" type="button" class="btn btn-sm btn-info" onclick="javascript:popUp('<%=request.getContextPath()%>/documentpdfReport.action?docType=schedule&quoteNo=<s:property value="QUOTE_NO"/>&loginid=<s:property value="loginId"/>',1000,500);"><i class="glyphicon glyphicon-print">&nbsp;</i><s:text name="label.report.print"/></a> --%>
						<a href="#" type="button" class="btn btn-sm btn-info" onclick="getPopup('<s:property value="QUOTE_NO"/>','<s:property value="loginId"/>','schedule','<s:property value="POLICY_NO"/>');"><i class="glyphicon glyphicon-print">&nbsp;</i><s:text name="label.report.print"/></a>
					</s:if>
					<s:elseif test='"N".equals(STATUS_TYPE)'>
						<%-- <a href="#" type="button" class="btn btn-sm btn-info" onclick="javascript:popUp('<%=request.getContextPath()%>/documentpdfReport.action?docType=schedule&quoteNo=<s:property value="QUOTE_NO"/>&loginid=<s:property value="loginId"/>',1000,500);"><i class="glyphicon glyphicon-print">&nbsp;</i><s:text name="label.report.print"/></a> --%>
						<a href="#" type="button" class="btn btn-sm btn-info" onclick="getPopup('<s:property value="QUOTE_NO"/>','<s:property value="loginId"/>','draft','<s:property value="POLICY_NO"/>');"><i class="glyphicon glyphicon-print">&nbsp;</i><s:text name="label.report.print"/></a>
					</s:elseif>
					<s:elseif test='"QE".equals(STATUS_TYPE) || "RA".equals(STATUS_TYPE) || "RU".equals(STATUS_TYPE)'>
						<a href="#" type="button" class="btn btn-sm btn-info" onclick="editQuote('<s:property value="APPLICATION_NO"/>', '<s:property value="QUOTE_NO"/>','<s:property value="STATUS_TYPE"/>','<s:property value="CUSTOMER_ID"/>','<s:property value="CONTENT_TYPE_ID"/>');"><i class="glyphicon glyphicon-edit" >&nbsp;<s:text name="label.report.edit"/></i></a>
					</s:elseif>
					<s:elseif test='"QL".equals(STATUS_TYPE)'>
						<a href="#" type="button" class="btn btn-sm btn-info" onclick="sentMail('','ACTIVE','<s:property value="QUOTE_NO"/>');"><i class="glyphicon glyphicon-ok-sign">&nbsp;<s:text name="label.report.active"/></i></a>
					</s:elseif>
					<s:elseif test='"L".equals(STATUS_TYPE) || "RR".equals(STATUS_TYPE) || "R".equals(STATUS_TYPE)'>
						<a href="#" type="button" class="btn btn-sm btn-info" onclick="view('<s:property value="APPLICATION_NO"/>','<s:property value="QUOTE_NO"/>','<s:property value="productId"/>');"><i class="glyphicon glyphicon-eye-open">&nbsp;<s:text name="report.view"/></i></a>
					</s:elseif>
				</td>
			</tr>
		</s:iterator>
	</s:if>
	<s:else>
	<tr class="odd">
		<td style="text-align:center;width:6%" colspan="8"><s:label key="error.search.nodata" theme="simple"/></td>
	</tr>
	</s:else>
	</tbody>
</table>