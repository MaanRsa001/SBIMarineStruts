<%@ taglib prefix="s" uri="/struts-tags"%> 
<s:if test="#request.ELEMENT_NAME=='package'">
	<s:select name="packageCode" list="packageList" headerKey="" headerValue="-Select-" listKey="CODE" listValue="CODEDESC" cssClass="inputBoxS tooltipContent" theme="simple" id="packageCode" />
</s:if>
<s:elseif  test="#request.ELEMENT_NAME=='cover'">
   	<s:if test="%{productId==openCover}" >
   		<%--<s:if test='coverList!=null && coverList.size==1'>
   			<s:select name="cover" id="cover" list="coverList" listKey="CODE" listValue="CODEDESC" cssClass="inputSelect" onchange="getList('?cover='+this.value,'conveyanceList');" />
   		</s:if>
   		<s:else>--%>
    		<s:select name="cover" id="cover" list="coverList" headerKey="" headerValue="-Select-" listKey="CODE" listValue="CODEDESC" cssClass="inputBoxS tooltipContent" theme="simple" onchange="getList('?modeOfTransport=%{modeOfTransport}&cover='+this.value,'conveyanceList');"/>
    	<%--</s:else>--%>
    </s:if>	
    <s:else>
    	<s:select name="cover" id="cover" list="coverList" headerKey="" headerValue="-Select-" listKey="CODE" listValue="CODEDESC" cssClass="inputBoxS tooltipContent" theme="simple" />                                
   	</s:else>
</s:elseif>
<s:elseif  test="#request.ELEMENT_NAME=='showPremiumPopUp'">
 <table class="table table-bordered table-stripped" width="100%">
 	<thead class="style-3" style="background-color: #1f91f3;">
 		<tr style="color: white;">
 			<td  style="text-align: center;"><s:text name="label.document.description" /></td>
 			<td  style="text-align: right;"><s:text name="motor.Premium" /></td>
 		</tr>
 	</thead>
	<tbody>
	   	<s:iterator value="premiumDetailsList" var="prInfo" status="stat">
			<tr>
				<td style="text-align: center;">
					<span class="preText">
					<s:if test='"ar".equals(#session.isArabic)'>
					<font style="float: left;"><s:property value="%{#prInfo.PVDESCAR}" /> </font>
					</s:if>
					<s:else>
					<font style="float: left;"><s:property value="%{#prInfo.PVDESC}" /> </font>
					</s:else>
					<b style="float: right;">[<s:property value="#session.BrokerDetails.CurrencyAbb" />]</b>
					</span>
				</td>
				<td style="text-align: right;">
					<span class="preText">
						<b><s:property value="getText('{0,number,#,##0.00}',{#prInfo.PVAMOUNT})" /> </b>
					</span>
				</td>
			</tr>
		</s:iterator>
	</tbody>
 </table>
 <script type="text/javascript">
 premiumSubmit('<s:property value="policyType"/>');
 function premiumSubmit(type) {
	 document.getElementById('showBody'+type).style.display='block';
 }
</script>
</s:elseif>
<s:elseif  test="#request.ELEMENT_NAME=='promoagreedetails'">
 <div class="modal-header" style="background-color: #337ab7;">
 	<div style="color: white;">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
      <span aria-hidden="true"><i class="fa fa-times-circle" aria-hidden="true"></i></span></button>
    <h3 class="modal-title"><i class="fa fa-info-circle" aria-hidden="true"></i>&nbsp;&nbsp;<B>
    	<s:if test='!hasActionErrors()'>
	    <s:if test='"ar".equals(#session.isArabic)'>
	    	<s:property value="promoAgreeTitleAr" />
	    </s:if>
	    <s:else>
			<s:property value="promoAgreeTitle" />
		</s:else>
		</s:if>
    </B></h3>
    </div>
  </div>
  <div class="modal-body" style="background-color: #ffffff;">
  	<s:if test='hasActionErrors()'>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<span style="color: red;"><s:actionerror /></span>
			</div>
		</div>
	</s:if>
	<s:else>
		<div class="row" align="center">			                          	
          <s:if test='"ar".equals(#session.isArabic)'>
	    	<h5><B><s:property value="promoAgreeDescAr" /></B></h5>
	    </s:if>
	    <s:else>
			<h5><B><s:property value="promoAgreeDesc" /></B></h5>
		</s:else>
		</div>
		<br class="clear"/>
	   	<div class="row" align="center">
	   	<button type="button" class="btn btn-sm btn-danger" data-dismiss="modal" aria-label="Close">
			<s:text name="motor.declaration.disagree"/>
		</button>
		   	<s:if test='quoteStatus=="RA"'>
				<span id="proceedSpan"> 
				</span>
				<button type="submit" id="submitVehicle3" class="btn btn-sm btn-success" onclick="this.form.actionType.value='getQuote';disableForm(this.form,false,'');fnsubmit('getQuoteMotor');disableButton(this.id);">
					<s:text name="motor.declaration.Agree" />
				</button>
			</s:if>
			<s:else>
				<span id="proceedSpan"></span>
					<button type="submit" id="submitVehicle3" class="btn btn-sm btn-success" onclick="this.form.actionType.value='getQuote';disableForm(this.form,false,'');fnsubmit('getQuoteMotor');disableButton(this.id);">
						<s:text name="motor.declaration.Agree" />
					</button>
			</s:else>
			</div>
	</s:else>
</div>
</s:elseif>
<s:elseif  test="#request.ELEMENT_NAME=='conveyance'">
	<s:if test='conveyanceList!=null && conveyanceList.size==1'>
   		<s:select name="conveyance" list="conveyanceList" listKey="CODE" listValue="CODEDESC" cssClass="inputBoxS tooltipContent" theme="simple" id="conveyanceList" />
   	</s:if>
   	<s:else>
		<s:select name="conveyance" list="conveyanceList" headerKey="" headerValue="-Select-" listKey="CODE" listValue="CODEDESC" cssClass="inputBoxS tooltipContent" theme="simple" id="conveyanceList" />
	</s:else>
</s:elseif>
<s:elseif  test="#request.ELEMENT_NAME=='city'">
	<s:select name="city" id="city" list="cityList" headerKey="" headerValue="---Select---" listKey="CODE" listValue="CODEDESC" cssClass="inputBoxS tooltipContent" data-content="City" disabled="#disable" theme="simple"/>
</s:elseif>
<s:elseif  test="#request.ELEMENT_NAME=='agent'">
	<s:select name="settlingAgent" list="agentList" headerKey="" headerValue="-Select-" listKey="CODE" listValue="CODEDESC" cssClass="inputBoxS tooltipContent" theme="simple" id="agentList" onchange="disableOthers(this);"/>
</s:elseif>
<s:elseif  test="#request.ELEMENT_NAME=='saleTermPercent'">
	<s:if test="%{productId==openCover}" >
		<s:if test='conveyanceList!=null && conveyanceList.size==1'>
   			<s:select name="saleTermPercent" list="percentList" listKey="CODE" listValue="CODEDESC" cssClass="inputBoxS tooltipContent"  onchange="getList('?saleTermPercent='+this.value,'toleranceList');" theme="simple"/>
   		</s:if>
		<s:else>
    		<s:select name="saleTermPercent" list="percentList" headerKey="" headerValue="-Select-" listKey="CODE" listValue="CODEDESC" cssClass="inputBoxS tooltipContent"  onchange="getList('?saleTermPercent='+this.value,'toleranceList');" theme="simple"/>
    	</s:else>
    </s:if>	
    <s:else>
    	<s:select name="saleTermPercent" list="percentList" headerKey="" headerValue="-Select-" listKey="CODE" listValue="CODEDESC" cssClass="inputBoxS tooltipContent"   onchange="getList('?saleTermPercent='+this.value,'toleranceList');" theme="simple"/>                                
   	</s:else>
</s:elseif>
<s:elseif  test="#request.ELEMENT_NAME=='tolerance'">
	<s:select name="tolerance" list="toleranceList" listKey="CODE" listValue="CODEDESC" cssClass="inputBoxS tooltipContent" theme="simple"/>
</s:elseif>
<s:elseif  test="#request.ELEMENT_NAME=='lcNo'">
	<s:if test='lcList!=null && lcList.size==1'>
		<s:select name="lcNo" list="lcList" listKey="CODE" listValue="CODEDESC" cssClass="inputBoxS tooltipContent" disabled="%{#disable2==false?(quoteStatus=='RA'):#disable2}" theme="simple"/>
	</s:if>
	<s:else>
		<s:select name="lcNo" list="lcList" headerKey="" headerValue="-Select-" listKey="CODE" listValue="CODEDESC" cssClass="inputBoxS tooltipContent" disabled="%{#disable2==false?(quoteStatus=='RA'):#disable2}" theme="simple"/>
	</s:else>
</s:elseif>
<s:elseif  test="#request.ELEMENT_NAME=='executive'">
	<s:select name="executive" list="executiveList" headerKey="" headerValue="-Select-" listKey="CODE" listValue="CODEDESC" cssClass="inputBoxS tooltipContent" value='executive==null?getText("quotation.executiveDefault"):executive' theme="simple"/>
</s:elseif>
<s:elseif  test="#request.ELEMENT_NAME=='brokerList'">
	<s:label key="report.selectuser" theme="simple"/>&nbsp;<s:select list="brokerList" listKey="LOGIN_ID" listValue="USERNAME" name="loginId" cssClass="inputBoxS tooltipContent"  headerKey="" headerValue="Select" theme="simple" />
</s:elseif>
<s:elseif  test="#request.ELEMENT_NAME=='coverUpload'">
	<s:select name="ucover[%{rowNum}]" list="coverList" headerKey="" headerValue="-Select-" listKey="CODE" listValue="CODEDESC" cssClass="inputBoxS tooltipContent" disabled="#disable" theme="simple"/>
</s:elseif>
<s:elseif  test="#request.ELEMENT_NAME=='saleTermPercentUpload'">
	<s:select name="usaleTermPercent[%{rowNum}]" id="percent" list="percentList" headerKey="" headerValue="-Select-" listKey="CODE" listValue="CODEDESC" cssClass="inputBoxS tooltipContent" disabled="%{saleTerm=='205' || #disable}" onchange="getList('?saleTermPercent='+this.value+'&rowNum=%{rowNum}','toleranceList[%{rowNum}]','toleranceList');" theme="simple" />
</s:elseif>
<s:elseif  test="#request.ELEMENT_NAME=='toleranceUpload'">
	<s:select name="utolerance[%{rowNum}]" list="toleranceList" listKey="CODE" listValue="CODEDESC" cssClass="inputBoxS tooltipContent" disabled="#disable" theme="simple"/>
</s:elseif>
<s:elseif test="#request.ELEMENT_NAME=='packageUpload'">
	<s:select name="upkgDesc[%{rowNum}]" list="packageList" headerKey="" headerValue="-Select-" listKey="CODEDESC" listValue="CODEDESC" cssClass="inputBoxS tooltipContent" disabled="#disable2" cssStyle="width:154px;" theme="simple"/>
</s:elseif>
<s:elseif  test="#request.ELEMENT_NAME=='travelCover'">
<s:select name="travelCover" list="travelCoverList" headerKey="" headerValue="-Select-" listKey="CODE" listValue="CODEDESC" cssClass="inputBoxS tooltipContent" onchange="getAjaxCoverage(this.form,'?schemeCover=%{schemeCover}&travelCover='+this.value,'coverageList')" theme="simple"/>
</s:elseif>
<s:elseif  test="#request.ELEMENT_NAME=='coverages'">
<s:if test="coveragesList.size()>0">
      <table width="100%" border="0" align="center" cellpadding="4" cellspacing="0" >
      	<s:iterator value="coveragesList" var="cov" status="stat">
            	<tr>
              	<td width="2%">&nbsp;</td>
               	<td width="40%">		             
               	<s:property value="CODEDESC"/>
               	</td>
               	<td width="35%">
               	<s:radio list="coverageYNList" name="coverages[%{#stat.count-1}]" id="coverages" value="%{'N'}" theme="simple" />
              	</td>
               	<td width="2%">&nbsp;</td>
              </tr>
         </s:iterator>
      </table>
</s:if>
<s:else>
      <table width="100%" border="0" align="center" cellpadding="4" cellspacing="0">
      <tr>
	      <td width="2%">&nbsp;</td>
	      <td><s:text name="travel.noSchemeAvailable"/></td>
	      <td width="2%">&nbsp;</td>
      </tr> 
      </table>
</s:else>
</s:elseif>
<s:elseif  test="#request.ELEMENT_NAME=='searchResult'">
<display:table name="policyList" pagesize="10"  requestURI="<%=request.getContextPath()%>/initReport.action?reqFrm=Normal"
					class="table" uid="row" id="record" style="width:100%; align:center; " cellpadding="1" cellspacing="1" >
					<display:setProperty name="paging.banner.one_item_found" value="" />
					<display:setProperty name="paging.banner.one_items_found" value="" />
					<display:setProperty name="paging.banner.all_items_found" value="" />
					<display:setProperty name="paging.banner.some_items_found" value="" />
					<display:setProperty name="paging.banner.placement"	value="bottom" />
					<display:setProperty name="paging.banner.onepage" value="" />
					<display:setProperty name="basic.empty.showtable" value="true"/>
					<display:setProperty name="paging.banner.no_items_found" value=""/>	
					<s:if test='menuType!="T" && menuType!="PD" && menuType!="C"'>									
						<display:column sortable="true" style="text-align:center;width:3%" titleKey="report.sno" value='<s:property value="record_rowNum"/>'/> 
						<display:column sortable="true" style="text-align:center;width:9%" titleKey="report.quoteNo" property="QUOTE_NO"/>
						<display:column sortable="true" style="text-align:left;width:16%" titleKey="report.custName" property="CUSTOMER_NAME"/>
						<display:column sortable="true"	style="text-align:center;width:13%" titleKey="report.quoteDate"	property="QUOTATION_DATE"/>
					</s:if>							
					<s:if test='menuType=="P" || menuType=="PE"'> 
						<s:if test='#session.product_id!="31" && #session.product_id!="32" && #session.product_id!="33" && #session.product_id!="41" && #session.product_id!="65" && #session.product_id!="30"'>
						<display:column sortable="true"	style="text-align:right;width:6%" titleKey="report.premium" format="{0,number,##,##0.00}"  property="PREMIUM"/>					
						<display:column sortable="true" style="text-align:center;width:13%" titleKey="report.policyNo" property="POLICY_NO"/>
						<display:column sortable="true"	style="text-align:center;width:10%" titleKey="report.schedule" >
							<a href="#" onclick="return popUp('<%=request.getContextPath()%>/Copy of information.jsp?policyMode=schedule&policynumber=<s:property value="#record.POLICY_NO"/>&loginid=<s:property value="#record.LOGIN_ID"/>','1000','500')">Schedule</a>
						</display:column>
						<display:column sortable="true"	style="text-align:center;width:10%" titleKey="report.debitNote" >
							<c:if test="#record.DEBIT_NOTE_NO != null">
								<a href="#" onclick="return popUp('<%=request.getContextPath()%>/Copy of information.jsp?policyMode=debit&policynumber=<s:property value="#record.POLICY_NO"/>&loginid=<s:property value="#record.LOGIN_ID"/>','1000','500')">Debit Note</a>
							</c:if>
						</display:column>
						</s:if>
						<s:else>
						<display:column sortable="true"	style="text-align:right;width:6%" titleKey="report.premium" format="{0,number,##,##,###}"  property="OVERALL_PREMIUM"/>					
						<display:column sortable="true" style="text-align:center;width:13%" titleKey="report.policyNo" property="POLICY_NO"/>
						<%--<display:column sortable="true"	style="text-align:center;width:8%" titleKey="report.corrections">
							<a href="#" onclick="popUp('viewTravel.action?quoteNo=<s:property value="#record.QUOTE_NO}&applicationNo=<s:property value="#record.APPLICATION_NO}',650,550)">Correction</a>
						</display:column>--%>
						<display:column sortable="true"	style="text-align:center;width:10%" titleKey="report.schedule" >
							   <a href="#" onclick="return popUp('<%=request.getContextPath()%>/PdfSummary_Schedule.Travel?quoteNo=<s:property value="#record.QUOTE_NO"/>','1000','500')">Schedule</a>
						</display:column>
						<display:column sortable="true"	style="text-align:center;width:10%" titleKey="report.debitNote" >
							<c:if test="#record.DEBIT_NOTE_NO != null}">
							    <a href="#" onclick="return popUp('<%=request.getContextPath()%>/PdfSummary_Debit.Travel?quoteNo=<s:property value="#record.QUOTE_NO"/>','1000','500')">Debit</a>
							</c:if>
						</display:column>
						<display:column sortable="true"	style="text-align:center;width:10%" titleKey="report.receipt" >
							<c:if test="#record.DEBIT_NOTE_NO != null}">
							    <a href="#" onclick="return popUp('<%=request.getContextPath()%>/PdfSummary_Receipt.Travel?quoteNo=<s:property value="#record.QUOTE_NO"/>','1000','500')">Receipt</a>
							</c:if>
						</display:column>
						</s:else>
						<s:if test='#session.product_id!="31" && #session.product_id!="32" && #session.product_id!="33"&& #session.product_id!="41" && #session.product_id!="65" && #session.product_id!="30"'>
						<display:column sortable="true"	style="text-align:center;width:10%" titleKey="report.creditNote" >
							<c:if test="#record.CREDIT_NOTE_NO != null}">
								<a href="#" onclick="return popUp('<%=request.getContextPath()%>/Copy of information.jsp?policyMode=credit&policynumber=<s:property value="#record.POLICY_NO"/>&loginid=<s:property value="#record.LOGIN_ID"/>','1000','500')">Credit Note</a>
							</c:if>
						</display:column>
						</s:if>
						<%--<s:else>
						<display:column sortable="true"	style="text-align:center;width:10%" titleKey="report.cancelReIssue" >
		                    <a href="#" onclick="return popUp('<%=request.getContextPath()%>/cancelReissueTravel.action?quoteNo=<s:property value="#record.QUOTE_NO}&applicationNo=<s:property value="#record.APPLICATION_NO}&policyNo=<s:property value="#record.POLICY_NO}&product_id=#session.product_id &branch_code=#session.branch_code','650','420');">Cancel/ReIssue</a>
						</display:column>
						</s:else>--%>
						<display:column sortable="true"	style="text-align:center;width:10%" titleKey="report.endorse" >
							<a href="#" onclick='endorsement("E","<s:property value="#record.QUOTE_NO"/>","<s:property value="#record.POLICY_NO"/>","<s:property value="#record.CUSTOMER_NAME"/>","<s:property value="#record.BROKER_NAME"/>")'>Endorse</a>
						</display:column>
					</s:if>
					<s:elseif test='menuType=="QL"'>
						<display:column sortable="true"	style="text-align:center;width:13%" title="Validity Date"	property="VALIDITY_DATE"/>
						<display:column sortable="true"	style="text-align:center;width:8%" title="Active">
							<a href="#" onclick="sentEMail('','ACTIVE','<s:property value="#record.QUOTE_NO"/>')" >Active</a>
						</display:column>
						<display:column sortable="true"	style="text-align:center;width:8%" title="DeActive">
						<a href="#" onclick="sentEMail('','LAPSED','<s:property value="#record.QUOTE_NO"/>')">Reject</a>
						</display:column>
					</s:elseif>
					<s:elseif test='menuType=="QE" || menuType=="QS"'>
						<display:column sortable="true"	style="text-align:center;width:13%" title="Validity Date"	property="VALIDITY_DATE"/>
						<s:if test='menuType=="QE"'>
						<s:if test='#session.product_id=="31" || #session.product_id=="32" || #session.product_id=="33" || #session.product_id=="65" && #session.product_id=="30"'>					
						<display:column sortable="true"	style="text-align:right;width:6%" title="Premium" format="{0,number,##,##,###}"  property="PREMIUM"/>
						</s:if>
						<s:else>					
						<display:column sortable="true"	style="text-align:right;width:6%" title="Premium" format="{0,number,##,##,###.00}"  property="PREMIUM"/>
						</s:else>					
						</s:if>
						<display:column sortable="true"	style="text-align:center;width:8%" title="Edit">
							<a href="#" onclick="editQuote('<s:property value="#record.APPLICATION_NO"/>','<s:property value="#record.QUOTE_NO"/>','<s:property value="%{menuType}" />','<s:property value="#record.CUSTOMER_ID"/>')">Edit</a>
						</display:column>
						<s:if test='menuType=="QE"'>
						<s:if test='#session.product_id!="31" && #session.product_id!="32" && #session.product_id!="33" && #session.product_id!="65" && #session.product_id!="30"'>
						<display:column sortable="true"	style="text-align:center;width:8%" title="Email">
							<a href="#" onclick="sentEMail('<s:property value="#record.APPLICATION_NO"/>','MAIL','<s:property value="#record.QUOTE_NO"/>')">Email</a>
						</display:column>
						<display:column sortable="true"	style="text-align:center;width:8%" title="Print">
							<a href="#" onclick="viewQuote('<s:property value="#record.QUOTE_NO"/>')">Print</a>
						</display:column>
						</s:if>
						<s:else>
						<display:column sortable="true"	style="text-align:center;width:8%" title="Email">
							<a href="#" onclick="sentEMail('<s:property value="#record.APPLICATION_NO"/>','MAIL','<s:property value="#record.QUOTE_NO"/>')">Email</a>
						</display:column>
						<display:column sortable="true"	style="text-align:center;width:8%" title="Print">
							<a href="#" onclick="return popUp('<%=request.getContextPath()%>/PdfSummary_Draft.Travel?quoteNo=<s:property value="#record.QUOTE_NO"/>','1000','500')">Print</a>
						</display:column>
						</s:else>
						</s:if>
						<display:column sortable="true"	style="text-align:center;width:8%" title="Reject">
							<a href="#" onclick="sentEMail('<s:property value="#record.APPLICATION_NO"/>','LAPSED','<s:property value="#record.QUOTE_NO"/>')">Reject</a>
						</display:column>	
					</s:elseif>
					<s:elseif test='menuType=="RU" || menuType=="RA"'>
						<display:column sortable="true"	style="text-align:center;width:8%" title="Edit">
							<a href="#" onclick="editQuote('<s:property value="#record.APPLICATION_NO"/>','<s:property value="#record.QUOTE_NO"/>','<s:property value="%{menuType}" />','<s:property value="#record.CUSTOMER_ID"/>')">Edit</a>
						</display:column>
						<display:column sortable="true"	style="text-align:center;width:8%" title="Reject">
							<a href="#" onclick="sentEMail('','LAPSED','<s:property value="#record.QUOTE_NO"/>')">Reject</a>
						</display:column>
					</s:elseif>
					<s:elseif test='menuType=="RR"'>
						<display:column sortable="true"	style="text-align:center;width:13%" title="Remarks"	property="LAPSED_REMARKS"/>
						<display:column sortable="true"	style="text-align:center;width:8%" title="View">
							<a href="#" onclick="popUp('viewTravel.action?quoteNo=<s:property value="#record.QUOTE_NO"/>&applicationNo=<s:property value="#record.APPLICATION_NO"/>&selection=profile',650,650)">View</a>
						</display:column>
					</s:elseif>
					<s:elseif test='menuType=="L"'>
						<display:column sortable="true"	style="text-align:center;width:13%" title="Validity Date"	property="VALIDITY_PERIOD"/>
						<display:column sortable="true"	style="text-align:center;width:15%" title="Rejected Date" property="LAPSED_DATE"/>	
						<display:column sortable="true"	style="text-align:center;width:15%" title="Remarks" property="LAPSED_REMARKS"/>
						<display:column sortable="true"	style="text-align:center;width:8%" title="View">
							<a href="#" onclick="popUp('viewTravel.action?quoteNo=<s:property value="#record.QUOTE_NO"/>&applicationNo=<s:property value="#record.APPLICATION_NO"/>&selection=profile',650,650)">View</a>
						</display:column>
					</s:elseif>
					<s:elseif test='menuType=="T"'>
						<display:column sortable="true" style="text-align:center;width:6%" title="S.No" value='<s:property value="record_rowNum"/>'/>
						<display:column sortable="true" style="text-align:center;width:9%" title="Transaction Id" property="TRANSACTION_ID"/>
						<display:column sortable="true" style="text-align:center;width:16%" title="Valid Records" >
							<a href="#" onclick="return declaration('<s:property value="#record.TRANSACTION_ID"/>')"><s:property value="#record.VALID_RECORDS"/></a>
						</display:column>
						<display:column sortable="true"	style="text-align:center;width:13%" title="Invalid Records"	property="INVALID_RECORDS"/>
					</s:elseif>
					<s:elseif test='menuType=="PD"'>
						<display:column sortable="true" style="text-align:center;width:6%" title="S.No" value='<s:property value="record_rowNum"/>'/> 
						<display:column sortable="true" style="text-align:center;width:10%" title="Policy No." property="POLICY_NO"/>
						<display:column sortable="true" style="text-align:center ;width:14%" title="OpenCover Customer Name" property="OPENCOVER_CUST_NAME"/>
						<display:column sortable="true"	style="text-align:right;width:6%" title="Premium"  format="{0,number,##,##,###.00}"	property="PREMIUM"/>						
						<display:column sortable="true"	style="text-align:center;width:8%" title="Total of Certificates" >
							<a href="#" onclick="declaration('<s:property value="#record.POLICY_NO"/>')"/><s:property value="#attr.#record.POLICY_COUNT"/> </a>
						</display:column>
						<display:column sortable="true"	style="text-align:center;width:8%" title="Schedule" >
							<a href="#" onclick="return popUp('<%=request.getContextPath()%>/Copy of information.jsp?policyMode=scheduleMultiple&policynumber=<s:property value="#record.POLICY_NO"/>&loginid=<s:property value="#record.LOGIN_ID"/>','1000','500')">Schedule</a>
						</display:column>
						<display:column sortable="true"	style="text-align:center;width:8%" title="Debit Note" >
							<c:if test="#record.DEBIT_NOTE_NO != null">
								<a href="#" onclick="return popUp('<%=request.getContextPath()%>/Copy of information.jsp?policyMode=debitMultiple&policynumber=<s:property value="#record.POLICY_NO"/>&loginid=<s:property value="#record.LOGIN_ID"/>','1000','500')">Debit</a>
							</c:if>
						</display:column>
						<display:column sortable="true"	style="text-align:center;width:8%" title="Credit Note" >
							<c:if test="#record.CREDIT_NOTE_NO != null">
								<a href="#" onclick="return popUp('<%=request.getContextPath()%>/Copy of information.jsp?policyMode=creditMultiple&policynumber=<s:property value="#record.POLICY_NO"/>&loginid=<s:property value="#record.LOGIN_ID"/>','1000','500')">Credit</a>
							</c:if>
						</display:column>
					</s:elseif>		
					<s:elseif test='menuType=="C"'>
						<display:column sortable="true" style="text-align:center;width:6%" title="S.No" value='<s:property value="record_rowNum"/>'/> 
						<display:column sortable="true"	style="text-align:left;width:13%" title="Customer Name"	property="FIRST_NAME"/>					
						<display:column sortable="true"	style="text-align:left;width:10%" title="Address"  property="ADDRESS"/>
						<display:column sortable="true"	style="text-align:left;width:10%" title="Customer Civil ID" property="CUSTOMER_SOURCE"/>					
						<display:column sortable="true"	style="text-align:left;width:15%" title="Email Id" property="EMAIL"/>
						<display:column sortable="true"	style="text-align:left;width:10%" title="Contact No." property="MOBILE"/>	
					<%--	<display:column sortable="true"	style="text-align:left;width:10%" title="Core App. Code" property="MISSIPPI_CUSTOMER_CODE"/> --%>
						<display:column sortable="true"	style="text-align:center;width:10%" title="Edit">
							<a href="#" onclick="editQuote('<s:property value="#record.APPLICATION_NO"/>','<s:property value="#record.QUOTE_NO"/>','<s:property value="%{menuType}" />','<s:property value="#record.CUSTOMER_ID"/>')">Edit</a>						
						</display:column>									
					</s:elseif>	
					<s:elseif test='menuType=="E"'> 
						<display:column sortable="true"	style="text-align:right;width:6%" title="Premium" format="{0,number,##,###}"  property="PREMIUM"/>					
						<display:column sortable="true" style="text-align:center;width:13%" title="Policy Number">
							<c:if test='#record.STATUS == "P"'>
								<c:out value="#record.POLICY_NO"/>
							</c:if>
						</display:column>
						<s:if test='#sessoion.product_id =="3" || #sessoion.product_id =="11"'>
						<display:column sortable="true"	style="text-align:center;width:10%" title="Schedule" >
							<c:if test='#record.STATUS == "P"'>
								<a href="#" onclick="return popUp('<%=request.getContextPath()%>/Copy of information.jsp?policyMode=schedule&policynumber=<s:property value="#record.POLICY_NO"/>&loginid=<s:property value="#record.LOGIN_ID"/>','1000','500')">Schedule</a>
							</c:if>
						</display:column>
						<display:column sortable="true"	style="text-align:center;width:10%" title="Debit Note" >
							<c:if test='#record.STATUS == "P" && #record.DEBIT_NOTE_NO != null}'>
								<a href="#" onclick="return popUp('<%=request.getContextPath()%>/Copy of information.jsp?policyMode=debit&policynumber=<s:property value="#record.POLICY_NO"/>&loginid=<s:property value="#record.LOGIN_ID"/>','1000','500')">Debit Note</a>
							</c:if>
						</display:column>
						<display:column sortable="true"	style="text-align:center;width:10%" title="Credit Note" >
							<c:if test='#record.STATUS == "P" && #record.CREDIT_NOTE_NO != null}'>
								<a href="#" onclick="return popUp('<%=request.getContextPath()%>/Copy of information.jsp?policyMode=credit&policynumber=<s:property value="#record.POLICY_NO"/>&loginid=<s:property value="#record.LOGIN_ID"/>','1000','500')">Credit Note</a>
							</c:if>
						</display:column>
						</s:if>
						<s:else>
						<display:column sortable="true"	style="text-align:center;width:10%" title="Schedule" >
						    <c:if test='#record_rowNum == "1"}'>
								<c:set var="eQuoteNo" value="#record.QUOTE_NO"/>
								<c:set var="eApplicationNo" value="#record.APPLICATION_NO}"/>
					        </c:if>
							<c:if test='#record.STATUS == "P"}'>
								<a href="#" onclick="return popUp('<%=request.getContextPath()%>/PdfSummary_Schedule.Travel?quoteNo=<s:property value="#record.QUOTE_NO"/>','1000','500')">Schedule</a>
							</c:if>
						</display:column>
						<display:column sortable="true"	style="text-align:center;width:10%" title="Debit Note" >
							<c:if test='#record.STATUS == "P" && #record.DEBIT_NOTE_NO != null}'>
								<a href="#" onclick="return popUp('<%=request.getContextPath()%>/PdfSummary_Debit.Travel?quoteNo=<s:property value="#record.QUOTE_NO"/>','1000','500')">Debit Note</a>
							</c:if>
						</display:column>
						 <display:column sortable="true"	style="text-align:center;width:10%" title="Receipt" >
							<c:if test='#record.STATUS == "P" && #record.RECEIPT_NO != null}'>
								<a href="#" onclick="return popUp('<%=request.getContextPath()%>/PdfSummary_Receipt.Travel?quoteNo=<s:property value="#record.QUOTE_NO"/>','1000','500')">Receipt</a>
							</c:if>
						  </display:column>
						</s:else>
						<display:column sortable="true"	style="text-align:center;width:10%" title="Status" >
								<c:choose>
									<c:when test='#record.REF_STATUS == "RU"'>
										Referral
									</c:when>
									<c:when test='#record.REF_STATUS == "RA"'>
										Referral Approved
									</c:when>
									<c:when test='#record.REF_STATUS == "RR"'>
										Referral Rejected
									</c:when>
									<c:when test='#record.REF_STATUS == "N"}'>
										Normal
									</c:when>
								</c:choose>
						</display:column>
						<display:column sortable="true"	style="text-align:center;width:10%" titleKey="report.endorse" >
							<s:if test='issuer !=null && issuer.length() > 0' >
								<c:choose>
									<c:when test='#record.STATUS == "E" && #record.ENDT_STATUS == "Y"}'>
										<a href="#" onclick="endorsementType('ET','P','<s:property value="#record.ENDT_TYPE"/>','<s:property value="#record.QUOTE_NO"/>','<s:property value="#record.REF_STATUS"/>','<s:property value="#record.APPLICATION_NO"/>')"> Edit</a>
										<s:set var="endtStatus" value="%{'Y'}" ></s:set>
									</c:when>
									<c:when test='#session.product_id=="3" || #session.product_id=="11"'>
									<c:when test='#record.STATUS == "P" && #record.ENDT_STATUS == "Y"}'>
										<a href="#" onclick="popUp('<%=request.getContextPath()%>/documentReport.action?policyNo=<s:property value="#record.POLICY_NO"/>&applicationNo=<s:property value="#record.APPLICATION_NO"/>&endTypeId=<s:property value="#record.ENDT_TYPE"/>','1000','500')">Endt Schedule</a>
										<s:set var="endtStatus" value="%{'N'}" ></s:set>
										<c:set var="quoteNo" value="#record.QUOTE_NO" ></c:set>
										<c:set var="applicationNo" value="<s:property value="#record.APPLICATION_NO"/>" ></c:set>
									</c:when>
									<c:when test='#record.STATUS == "P"}'>
										<a href="#" onclick="popUp('<%=request.getContextPath()%>/documentReport.action?policyNo=<s:property value="#record.POLICY_NO"/>&applicationNo=<s:property value="#record.APPLICATION_NO"/>&endTypeId=<s:property value="#record.ENDT_TYPE"/>','1000','500')">Endt Schedule</a>
									</c:when>
									</c:when>
								</c:choose>
							</s:if>
						</display:column>
					</s:elseif>
					</display:table>
</s:elseif>
<s:elseif  test="#request.ELEMENT_NAME=='showDoc'">
<s:hidden name="FileCountforDrm%{docId}" id="FileCountforDrm%{docId}" value="%{updDocumentList.size()}" />
	<table align="center" width="100%">
	<s:if test='updDocumentList!=null && updDocumentList.size()>0'>
	<tr>
      	<td width="5%" align="center" class="heading"><s:text name="label.file.id" /></td>
	    <td width="20%" align="center" class="heading"><s:text name="label.file.name" /></td>
	    <td width="45%" align="center" class="heading"><s:text name="label.file.desc" /></td>
	    <td width="10%" align="center" class="heading"><s:text name="label.upload" />&nbsp;<s:text name="label.date" /></td>
	    <td width="10%" align="center" class="heading"><s:text name="label.download" /></td>
	    <td width="10%" align="center" class="heading"><s:text name="label.delete" /></td>
   	</tr>
   	<s:hidden name="FileCountforDrm%{docId}" id="FileCountforDrm%{docId}" value="%{updDocumentList.size()}" />
   	<s:iterator value="updDocumentList" var="stat">
    	<tr style="background-color: #F7F7F7;">
    		<td style="text-align: center;"><s:property value="#stat.docSNo" /></td>
    		<td>
    			<a href="#" onclick="openUploadedDoc('<s:property value="#stat.docOurName" />')">
    				<s:property value="#stat.docName" />
    			</a>
   			</td>
    		<td><s:property value="#stat.docDesc" /></td>
    		<td style="text-align: center;"><s:property value="#stat.docUploadDate" /></td>
    		<td align="center">
			    <input type="button" class="btn" name="download" value="Download" onclick="downloadFile('<s:property value="#stat.docOurName" />','<s:property value="#stat.docName" />',this.form)" />
			</td>
			<td align="center">
				<input type="button" class="btn" name="delete" value="Delete" onclick="deleteDocuments('<s:property value="#stat.docId" />', '<s:property value="#stat.docSNo" />')" />
   			</td>  
    	</tr>
   	</s:iterator>
   	</s:if>
   	<s:else>
   		<tr>
   			<td align="center"><s:text name="msg.details.not.found" /></td>
   		</tr>
   	</s:else>
   	</table>
</s:elseif>
<s:elseif  test="#request.ELEMENT_NAME=='customerList'">
	<table width="100%" border="1" bordercolor="#A4A4A4"  align="center" cellpadding="4" cellspacing="0" >
					<tr>     				   
						<td width="2%" bgcolor="#4f6180" style="color: #FFFFFF" align="center"></td>
						<td width="4%" bgcolor="#4f6180" style="color: #FFFFFF" align="center"><b><s:label key="customer.customerName"  theme="simple"/></b></td>
						<td width="10%"  bgcolor="#4f6180" style="color: #FFFFFF" align="center"><b><s:label key="customer.coreAppCode"  theme="simple"/></b></td>
						<td width="6%"  bgcolor="#4f6180" style="color: #FFFFFF" align="center"><b><s:label key="customer.city"  theme="simple"/></b></td>
						<td width="6%"  bgcolor="#4f6180" style="color: #FFFFFF" align="center"><b><s:label key="customer.mobileNo"  theme="simple"/></b></td>
						<td width="10%"  bgcolor="#4f6180" style="color: #FFFFFF" align="center"><b><s:label key="customer.email"  theme="simple"/></b></td>                       
					</tr>
					<s:if test="customerSelection.size > 0">					
					<s:iterator value="customerSelection" var="customerdetail" status="stat">
						<tr>   
						 	<td width="2%"><input type="radio" name="selects"onclick="customerDetail('<s:property value="%{#customerdetail.TITLE}"/>','<s:property value="%{#customerdetail.ADDRESS1}"/>','<s:property value="%{#customerdetail.ADDRESS2}"/>','<s:property value="%{#customerdetail.MOBILE}"/>','<s:property value="%{#customerdetail.EMIRATE}"/>','<s:property value="%{#customerdetail.POBOX}"/>','<s:property value="%{#customerdetail.FIRST_NAME}"/>','<s:property value="%{#customerdetail.MISSIPPI_CUSTOMER_CODE}"/>','<s:property value="%{#customerdetail.CUSTOMER_ID}"/>','<s:property value="%{#customerdetail.EMAIL}"/>','<s:property value="%{#customerdetail.CUST_AR_NO}"/>')"/></td>   				  
							<td width="10%" class="bg"><s:property value="FIRST_NAME" /></td>
							<td width="4%" class="bg"><s:property value="MISSIPPI_CUSTOMER_CODE"  /></td>
							<td width="10%" class="bg"><s:property value="CITY_NAME" /></td>
							<td width="6%" class="bg"><s:property value="MOBILE" /></td>
							<td width="10%" class="bg"><s:property value="EMAIL" /></td>
						</tr>
					</s:iterator>
					</s:if>
					<s:else>
					<tr><td colspan="5"><s:label key="customer.msg.nothingFound" theme="simple"></s:label> </tr>
					</s:else>
	</table>					
</s:elseif>
<s:elseif test="#request.ELEMENT_NAME=='makeListAjax'">
	<s:select name="makeIdList[0]" id="make" list="makeList" listKey="CODE" listValue="CODEDESC" headerKey="" headerValue="---Select---" onchange="getAjaxModel(this.form,'?make='+this.value,'modelList')" theme="simple" cssClass="inputBoxS tooltipContent" disabled="#disable1"/>
</s:elseif>
<s:elseif  test="#request.ELEMENT_NAME=='model'">
	<s:select name="modelIdList[0]" id="model" list="modelList" listKey="CODE" listValue="CODEDESC" headerKey="" headerValue="---Select---" onchange="getAjaxModel(this.form,'?model='+this.value,'typeBodyAjax');getAjaxModel(this.form,'?model='+this.value,'vehicleUsageAjax');" cssClass="form-control tooltipContent" data-content="Model" disabled="#disable1" theme="simple"/>
</s:elseif>
<s:elseif  test="#request.ELEMENT_NAME=='noOfCylinder'">
	<s:select name="noOfCylinderIdList[0]" list="noOfCylinderList" listKey="CODE" listValue="CODEDESC" headerKey="" headerValue="-Select-" cssClass="inputBoxS tooltipContent" theme="simple"/>
</s:elseif>
<s:elseif test="#request.ELEMENT_NAME=='typeBody'">
	<s:select name="typeBodyIdList[0]" id="typeBody" list="typeBodyList" listKey="CODE" listValue="CODEDESC" cssClass="inputBoxS tooltipContent" disabled="true" theme="simple"/>
</s:elseif>
<s:elseif test="#request.ELEMENT_NAME=='nijmAjax'">
	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
		ajx woking <s:property value="driverDetailAjax"/>
	</div>
</s:elseif>
<s:elseif  test="#request.ELEMENT_NAME=='fragileoff'">
	<s:radio name="fragile[0]" list="#{true:'Yes',false:'No'}" disabled="true" value='false' />
</s:elseif>	
<s:elseif  test="#request.ELEMENT_NAME=='fragileon'">
	<s:radio name="fragile[0]" list="#{true:'Yes',false:'No'}" disabled="#disable" value='%{#comLst.size()>0 ? #comLst[0].FRAGILE_SELECTED: false}'/>
</s:elseif>
<s:elseif  test="#request.ELEMENT_NAME=='brokersList'">
	<s:select name="brokerCode" id="brokerCode" list="brokerList" headerKey="" headerValue="---Select---"  listKey="CODE" listValue="CODEDESC" cssClass="inputBoxS  tooltipContent" data-content="Broker" onchange="getList('?brokerCode='+this.value,'executiveList');getList('?brokerCode='+this.value,'promotionalList');emptyCustInfo();" theme="simple"/>
</s:elseif>
<s:elseif test="#request.ELEMENT_NAME=='vehicleUsageAjax'">
	<s:select name="vehicleUsageIdList[0]"  id="vehicleUsage" list="vehicleUsageList" listKey="CODE" listValue="CODEDESC" cssClass="form-control tooltipContent" data-content="Vehicle Usage" disabled="true" theme="simple"/>
</s:elseif>
<s:elseif test="#request.ELEMENT_NAME=='branchselection'">
	 <s:select name="branch" id="branch"  class="form-control" list="branchList"  listKey="BranchCode" listValue="BranchName" headerKey="" headerValue="--Select--"/>
</s:elseif>
<s:elseif  test="#request.ELEMENT_NAME=='surveyagent'">
	<s:select  name="surveyagentid" id="surveyagentid" list="surveyagentList" headerKey="" headerValue="-Select-" listKey="CODE" listValue="CODEDESC" cssClass="inputBoxS tooltipContent" theme="simple"  onchange="disableOthers(this);"/>
</s:elseif>
