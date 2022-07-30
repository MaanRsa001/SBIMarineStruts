<%@ taglib prefix="s" uri="/struts-tags"%> 
<s:if test="#request.ELEMENT_NAME=='commodityRate'">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<table width="100%" class="table table-bordered" >
								<thead>
									<%-- <tr style="color:blue;">
										<th width="5%"><s:text name="label.Sno"></s:text></th>
										<th width="25%"><s:text name="label.modeofTransport"></s:text><font color="red">*</font></th>
										<th width="15%"><s:text name="label.Cover"></s:text><font color="red">*</font></th>
										<th width="10%"><s:text name="label.baseRate"></s:text><font color="red">*</font></th>
										<th width="10%"><s:text name="label.excessPercent"></s:text><font color="red">*</font></th>
										<th width="10%"><s:text name="label.excessValue"></s:text><font color="red">*</font></th>
										<th width="10%"><s:text name="label.excessDesc"></s:text><font color="red">*</font></th>
									</tr> --%>
									<tr style="color:blue;">
										<th width="5%"><s:text name="Sno"></s:text></th>
										<th width="19%" align="center"><s:text name="Commodity Name"></s:text><font color="red">*</font></th>
										<th width="10%" align="center"><s:text name="Mode of Transport"></s:text><font color="red">*</font></th>
										<th width="15%" align="center"><s:text name="Cover"></s:text><font color="red">*</font></th>
										<th width="7%" align="center"><s:text name="Base Rate"></s:text><font color="red">*</font></th>
										<th width="7%" align="center"><s:text name="Excess %"></s:text><font color="red">*</font></th>
										<th width="7%" align="center"><s:text name="Excess Value"></s:text><font color="red">*</font></th>
										<th width="15%" align="center"><s:text name="Excess Desc"></s:text><font color="red">*</font></th>
									</tr>
								</thead>
								<tbody>
									<s:iterator value="commodityRateList" var="list"  status="stat">
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
</s:if>

