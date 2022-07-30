<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
	<a onmouseover="TagToTip('premiumList',LEFT, true)" onmouseout="UnTip()"><img src="<%=request.getContextPath()%>/images/Help.jpg" width="20" height="20"/> </a>
	<div id="premiumList" style="display: none">
	<table width="100%" border="1" cellspacing="1" cellpadding="4" align="center" bgcolor="#FFFFFF">
		<tr>
          <td class="heading" colspan="7"><s:label key="premiumInfo.endtPremium" /><s:property value="#session.CurrencyDecimal"/></td>
        </tr>
		<tr>
			<th bgcolor="#4f6180" style="color: #FFFFFF"><s:label key="premiumInfo.endt" /></th>
			<th bgcolor="#4f6180" style="color: #FFFFFF"><s:label key="premiumInfo.marinePremium" />&nbsp;<s:property value="#session.BrokerDetails.CurrencyAbb"/></th>
			<th bgcolor="#4f6180" style="color: #FFFFFF"><s:label key="premiumInfo.warPremium" />&nbsp;<s:property value="#session.BrokerDetails.CurrencyAbb"/></th>
			<th bgcolor="#4f6180" style="color: #FFFFFF"><s:label key="premiumInfo.additionalPremium" />&nbsp;<s:property value="#session.BrokerDetails.CurrencyAbb"/></th>
			<%-- <th bgcolor="#4f6180" style="color: #FFFFFF"><s:label key="premiumInfo.governmentTax" />&nbsp;<s:property value="#session.BrokerDetails.CurrencyAbb"/></th>
			<th bgcolor="#4f6180" style="color: #FFFFFF"><s:label key="premiumInfo.policyIssuanceFee" />&nbsp;<s:property value="#session.BrokerDetails.CurrencyAbb"/></th>--%>
			<th bgcolor="#4f6180" style="color: #FFFFFF"><s:label key="premiumInfo.totalPremium" />&nbsp;<s:property value="#session.BrokerDetails.CurrencyAbb"/></th>
		</tr>
		<s:set var="format" value="%{'number.format.'+#session.CurrencyDecimal}"></s:set>
		<s:set value="endtPremiumInfo" var="endtPremiumInfo"></s:set>
		<tr class="bg" >
			<td><s:label key="premiumInfo.endt.prev" /></td>
			<td align="right"><s:property value="getText(#format,{#endtPremiumInfo.MARINE_PREMIUM_PREV})"/></td>
			<td align="right"><s:property value="getText(#format,{#endtPremiumInfo.WAR_PREMIUM_PREV})"/></td>
			<td align="right"><s:property value="getText(#format,{#endtPremiumInfo.EXCESS_PREMIUM_PREV})"/></td>
			<%-- <td align="right"><s:property value="getText(#format,{#endtPremiumInfo.GOVT_TAX_PREV})"/></td>
			<td align="right"><s:property value="getText(#format,{#endtPremiumInfo.POLICY_FEE_PREV})"/></td>--%>
			<td align="right"><s:property value="getText(#format,{#endtPremiumInfo.PREMIUM_PREV})"/></td>
		</tr>
		<tr class="bg" >
			<td><s:label key="premiumInfo.endt.actual" /></td>
			<td align="right"><s:property value="getText(#format,{#endtPremiumInfo.MARINE_PREMIUM})"/></td>
			<td align="right"><s:property value="getText(#format,{#endtPremiumInfo.WAR_PREMIUM})"/></td>
			<td align="right"><s:property value="getText(#format,{#endtPremiumInfo.EXCESS_PREMIUM})"/></td>
			<%-- <td align="right"><s:property value="getText(#format,{#endtPremiumInfo.GOVT_TAX})"/></td>
			<td align="right"><s:property value="getText(#format,{#endtPremiumInfo.POLICY_FEE})"/></td>--%>
			<td align="right"><s:property value="getText(#format,{#endtPremiumInfo.PREMIUM})"/></td>
		</tr>
		<tr class="bg" >
			<td bgcolor="#BFD6FC"><s:label key="premiumInfo.endt.diff" /></td>
			<td bgcolor="#BFD6FC" align="right"><s:property value="getText(#format,{#endtPremiumInfo.MARINE_PREMIUM_DIFF})"/></td>
			<td bgcolor="#BFD6FC" align="right"><s:property value="getText(#format,{#endtPremiumInfo.WAR_PREMIUM_DIFF})"/></td>
			<td bgcolor="#BFD6FC" align="right"><s:property value="getText(#format,{#endtPremiumInfo.EXCESS_PREMIUM_DIFF})"/></td>
			<%-- <td bgcolor="#BFD6FC" align="right"><s:property value="getText(#format,{#endtPremiumInfo.GOVT_TAX_DIFF})"/></td>
			<td bgcolor="#BFD6FC" align="right"><s:property value="getText(#format,{#endtPremiumInfo.POLICY_FEE_DIFF})"/></td>--%>
			<td bgcolor="#BFD6FC" align="right"><s:property value="getText(#format,{#endtPremiumInfo.PREMIUM_DIFF})"/></td>
		</tr>
	</table>
</div>
<script type="text/javascript" src="<%=request.getContextPath()%>/css/wz_tooltip.js"></script>