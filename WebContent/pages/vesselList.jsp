<%@page import="java.util.List,java.util.Map,org.apache.commons.lang.*"%>
<%@ taglib prefix="s" uri="/struts-tags"%> 
<table class="table table-bordered" width="100%" style="font-size: 12px;">
	<tbody>
	
	<s:if test="vesselList.size()>0">
	<s:iterator value="vesselList" var="vesselinfo" status="stat">
	<tr>
		<td width="5%">
			<input type="radio" name="select" onclick="selectVessel(<s:property value='#vesselinfo.VesselId'/>,<s:property value='#vesselinfo.VesselDescription'/>)" <s:if test='vesselName.equalsIgnoreCase(#vesselinfo.VesselDescription)'>checked</s:if> value='<s:property value="#vesselinfo.vesselId"/>' title='<s:property value="#vesselinfo.VesselDescription"/>'/>
		</td>
		<td width="23.75%"><s:property value="#vesselinfo.VesselDescription"/></td>
		<td width="23.75%"><s:property value="#vesselinfo.VesselType"/></td>
		<td width="23.75%"><s:property value="#vesselinfo.VesselClass"/></td>
		<td width="23.75%"><s:property value="#vesselinfo.ManfctureYear"/></td>
	</tr>
	</s:iterator>
	</s:if>
	<s:else>
	<tr>
		<td colspan="6">
			No records found
		</td>
	</tr>
	</s:else>
</tbody>
</table>