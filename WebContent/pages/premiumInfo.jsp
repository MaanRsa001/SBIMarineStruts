<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datepicker/jquery-ui.css">

<style>
label{
 font-weight:600;
}
</style>
</head>
<body>
<s:set var="isRefferal" value='%{"N"}'></s:set>
<s:set var="endtVar" value="%{endt}"/>
<s:set var="financialVar" value="%{financial}"/>
<s:set var="financialEndtVar" value="%{financialEndt}"/>
<s:iterator value="quotationInfo" status="stat" var="quotation">
<s:form id="premiumInfo" name="premiumInfo" method="post" action="" theme="simple">
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<s:set var="disable" value="%{endTypeId!=null && endTypeId.length() > 0}"/>
		<s:set var="endtDisable" value='%{!"admin".equals(#session.user1) && (#financialEndtVar || "RA".equals(quoteStatus))}'/>
		<s:if test='%{"admin".equalsIgnoreCase(#session.user1)}'>
			<s:set var="format" value="%{'number.format.2'}"/>
		</s:if>
		<s:else>
			<s:set var="format" value="%{'number.format.'+#session.CurrencyDecimal}"/>
		</s:else>
		<s:actionerror cssStyle="color: red;" />
	</div>	
</div>
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<s:if test="#endtVar">
			<div class="panel panel-primary">
				<div class="panel-body" style="padding: 0;">
					<s:set value="policyEndtInfo" var="policyEndtInfo"></s:set>
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
					 		<div class="text35V">
					 			<b><s:text name="endt.policyNo"/></b>
					 		</div>
					 		<div class="tbox65V">
					 			<span style="color:blue;"><s:property value="%{#policyEndtInfo.POLICY_NO}"/></span>								 		
					 		</div>
					 	</div>
					 	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
					 		<div class="text35V">
					 			<b><s:text name="endt.brokerName"/></b>
					 		</div>
					 		<div class="tbox65V">
					 			<span style="color:blue;"><s:property value="%{#policyEndtInfo.BROKER_NAME}"/></span>						 		
					 		</div>
					 	</div>
					 	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
					 		<div class="text35V">
					 			<b><s:text name="endt.custName"/></b>
					 		</div>
					 		<div class="tbox65V">
					 			<span style="color:blue;"><s:property value="%{#policyEndtInfo.CUSTOMER_NAME}"/></span>							 		
					 		</div>
					 	</div>
					</div>
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
					 		<div class="textV">
					 			<b><s:text name="quotation.endtTypeDesc" /></b>
					 		</div>
					 		<div class="tboxV">
					 			<span style="color:blue;"><s:property value="endtType" /></span>						 		
					 		</div>
					 	</div>
					</div>
				 	<br class="clear"/>
				</div>
			</div>
		</s:if>
		<s:elseif test="%{productId==openCover}" >
			<div class="panel panel-primary">
				<div class="panel-body" style="padding: 0;">					
				 	<s:set value="openCoverInfo" var="openCoverInfo"></s:set>
				 	<div class="row">
				 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
					 		<div class="text35V">
					 			<b><s:text name="endt.openPolicyNo"/></b>
					 		</div>
					 		<div class="tbox65V">
					 			<span style="color:blue;"><s:property value="%{#openCoverInfo.OPEN_COVER_NO}"/></span>						 		
					 		</div>
					 	</div>
					 	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
					 		<div class="text35V">
					 			<b><s:text name="endt.brokerName"/></b>
					 		</div>
					 		<div class="tbox65V">
					 			<span style="color:blue;"><s:property value="%{#openCoverInfo.BROKER_NAME}"/></span>						 		
					 		</div>
					 	</div>
					 	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
					 		<div class="text35V">
					 			<b><s:text name="endt.custName"/></b>
					 		</div>
					 		<div class="tbox65V">
					 			<span style="color:blue;"><s:property value="%{#openCoverInfo.CUSTOMER_NAME}"/></span>								 		
					 		</div>
					 	</div>
				 	</div>
				 	<br class="clear"/>
				 </div>
			</div>
		</s:elseif>
	</div>
</div>
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading" id="plus" onclick="quotationDetail();" style="display: none; cursor: pointer;">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-3">
					+ <s:text name="premiumInfo.quotation"/>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-3">
				 		<s:text name="premiumInfo.quoteNo"/>&nbsp;:&nbsp;<s:property value="QUOTE_NUMBER" />
				 	</div>
				 	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-3">
				 		<s:text name="premiumInfo.customerName"/>&nbsp;:&nbsp;<s:property value="CUSTOMER_NAME"/>
				 	</div>
				 	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-3">
				 		<s:text name="premiumInfo.coverStartDate"/>&nbsp;:&nbsp;<s:property value="POLICY_START_DATE" />
				 	</div>
				</div>
			</div>
			<div class="panel-heading" id="miuns" onclick="normalForm();" style="display: block; cursor: pointer;">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-3">
					- <s:text name="premiumInfo.quotation"/>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-6 col-lg-3">
				 		<s:text name="premiumInfo.quoteNo"/>&nbsp;:&nbsp;<s:property value="QUOTE_NUMBER" />
				 	</div>
				 	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-3">
				 		<s:text name="premiumInfo.customerName"/>&nbsp;:&nbsp;<s:property value="CUSTOMER_NAME"/>
				 	</div>
				 	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-3">
				 		<s:text name="premiumInfo.coverStartDate"/>&nbsp;:&nbsp;<s:property value="POLICY_START_DATE" />
				 	</div>
				</div>				
			</div>
			<div class="panel-body" id="quoteInfo" style="padding: 0px;">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				 		<div class="textV">
				 			<s:text name="premiumInfo.formTrans"  />
				 		</div>
				 		<div class="tboxV">
				 			<s:property value="TRANSPORT_DESCRIPTION"/>									 		
				 		</div>
				 	</div>
				 	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				 		<div class="textV">
				 			<s:text name="premiumInfo.coverage" />
				 		</div>
				 		<div class="tboxV">
				 			<s:property value="COVER_NAME"/>							 		
				 		</div>
				 	</div>
				 	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				 		<div class="textV">
				 			<s:text name="premiumInfo.conveyance" />
				 		</div>
				 		<div class="tboxV">
				 			<s:property value="CONVDESC" />							 		
				 		</div>
				 	</div>
				</div>
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				 		<div class="textV">
				 			<s:if test='%{"3".equals(MODE_OF_TRANSPORT)}'>
								<s:text name="quotation.Srcc" />
							</s:if>
							<s:else>
								<s:text name="premiumInfo.warSrcc" />
							</s:else>
				 		</div>
				 		<div class="tboxV">
				 			<s:property value="WAR_SRCC" />						 		
				 		</div>
				 	</div>
				 	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				 		<div class="textV">
				 			<s:text name="premiumInfo.originatingCountry" />
				 		</div>
				 		<div class="tboxV">
				 			<s:property value="ORIGIN_COUNTRY" default="nil" />									 		
				 		</div>
				 	</div>
				 	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				 		<div class="textV">
				 			<s:text name="premiumInfo.designationCountry" />
				 		</div>
				 		<div class="tboxV">
				 			<s:property value="DEST_COUNTRY" default="nil" />									 		
				 		</div>
				 	</div>
				</div>
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				 		<div class="textV">
				 			<s:text name="premiumInfo.currency" />
				 		</div>
				 		<div class="tboxV">
				 			<s:property value="CURRENCY_NAME"/>(<s:property value="EXCHANGE_RATE"/>)									 		
				 		</div>
				 	</div>
				 	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				 		<div class="textV">
				 			<s:text name="premiumInfo.saleTermForValuation" />
				 		</div>
				 		<div class="tboxV">
				 			<s:property value="SALES_TERM" default="nil" />									 		
				 		</div>
				 	</div>
				 	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				 		<div class="textV">
				 			<s:text name="premiumInfo.totalInsuredValue" />
				 		</div>
				 		<div class="tboxV">
				 			<s:property value="getText(#format,{TOTAL_INSURED})" default="" />									 		
				 		</div>
				 	</div>
				</div>
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
				 		<div class="textV">
				 			<s:text name="premiumInfo.equivalent"  />(<s:property value="#session.BrokerDetails.CurrencyAbb"/>)
				 		</div>
				 		<div class="tboxV">
				 			<s:property value="getText(#format,{EQUIVALENT})" default="nil" />									 		
				 		</div>
				 	</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="premiumInfo.insuredGoods" />
			</div>
			<div class="panel-body" style="padding: 0px;">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<table class="table table-bordered" width="100%" id="insGoodsTable">
							<thead>
							<tr>
								<th><s:text name="S.No" /></th>
								<th><s:text name="premiumInfo.categoryOfGoods" /></th>
								<th><s:text name="premiumInfo.policyExcess" /></th>
								<th><s:text name="premiumInfo.excessdesc" /></th>
								<th><s:text name="premiumInfo.description" /></th>
								<th><s:text name="premiumInfo.insuredValue" /></th>
								<th><s:text name="commodity.dutyinsuredValue" /></th>
								<s:if test='"N".equals(warShowYN)'>
								<th><s:text name="premiumInfo.ratePercentage" /></th>
								</s:if>
								<s:else>
								<s:if test='status=="N" || #session.user1 == "admin" || "RSAIssuer".equalsIgnoreCase(#session.usertype)'>
									<s:if test='"admin".equalsIgnoreCase(#session.usertype) || "RSAIssuer".equalsIgnoreCase(#session.usertype)'>
										<th><s:text name="premiumInfo.ratePercentage" /></th>
										<th>
											<s:if test='%{"3".equals(MODE_OF_TRANSPORT)}'>
					                       		<s:text name="premiumInfo.srccRetePercentage" />
					                       	</s:if>
					                       	<s:else>
					                       		<s:text name="premiumInfo.warRetePercentage" />
					                       	</s:else>
										</th>
									</s:if>
									<s:else>
										<th><s:text name="premiumInfo.ratePercentage" /></th>
									</s:else>
								</s:if>
								</s:else>
								<th><s:text name="premiumInfo.importrate" /></th>
								<th><s:text name="premiuminfo.ricode" /></th>
								<th><s:text name="premiumInfo.fragile" /></th>
								
							</tr>
							</thead>
							<tbody>
							<s:iterator value="insuredGoodsInfo" var="commodityList" status="stat">
							<tr>
								<td><s:property value="#stat.index+1" default=" "/></td>
								<td><s:property value="COMMODITY_NAME"  default=" "/></td>
								<s:if test='#session.user1 == "admin" || "RSAIssuer".equals(#session.usertype)'>
								<td style="width:15%">
									<s:if test="hasActionErrors()">
		                       	    	<s:textfield value="%{policyExcessPercent[#stat.index]}" name="policyExcessPercent" cssClass="inputBox"  cssStyle="width:35%;float:left;" onkeyup="checkDecimal2(this)"   disabled="#endtDisable" tabindex="1" />%
		                    			<s:textfield value="%{policyExcess[#stat.index]}" name="policyExcess" cssClass="inputBox" cssStyle="width:60%;float:right;" id="policyExcess%{#commodityList.COMMODITY_ID}" onkeyup="checkNumbers(this)" maxlength="6" disabled="#endtDisable" tabindex="2" />				                      				
		                    			<s:hidden name="originalPolicyExcess" value="%{#commodityList.POLICY_EXCESS}"/>
		                    		</s:if>
			                       <s:else>
			                            <s:textfield value="%{POLICY_EXCESS_PERCENT}" name="policyExcessPercent" cssClass="inputBox" cssStyle="width:35%;float:left;" onkeyup="checkDecimal2(this)"  disabled="#endtDisable" tabindex="1" />%
			                       		<s:textfield value="%{POLICY_EXCESS}" name="policyExcess" id="policyExcess%{COMMODITY_ID}" cssClass="inputBox" cssStyle="width:60%;float:right;" onkeyup="checkNumbers(this)" maxlength="6" disabled="#endtDisable" tabindex="2" />						                       		
			                       		<s:hidden name="originalPolicyExcess[%{#stat.count-1}]" />    
			                       </s:else>
								</td>
								</s:if>
								<s:else >
								<td> <s:property value="POLICY_EXCESS_PERCENT"/>%<br/><s:property value="POLICY_EXCESS"/> </td>
								</s:else>
								<s:if test='#session.user1 == "admin" || "RSAIssuer".equals(#session.usertype)'>
								<td>
									<s:if test="hasActionErrors()">
										<s:textarea value="%{excessDesc[#stat.index]}" name="excessDesc" cssClass="inputBoxA" cssStyle="width: 100%;" id="excessDesc%{#commodityList.COMMODITY_ID}" maxlength="1000" disabled="#endtDisable" tabindex="2" rows="2" />				                      				
									</s:if>
									<s:else>
										<s:textarea value="%{EXCESS_DESCRIPTION}" name="excessDesc" id="excessDesc%{COMMODITY_ID}" cssClass="inputBoxA" cssStyle="width: 100%;" maxlength="1000" disabled="#endtDisable" tabindex="2" rows="2" />
										&nbsp;						                       		    
									</s:else>
								</td>
								</s:if>
								<s:else>
								<td>
									<s:property value="EXCESS_DESCRIPTION"/> <s:hidden name="excessDesc" value="%{EXCESS_DESCRIPTION}"></s:hidden>
								</td>
								</s:else>
								<td><s:property value="DESCRIPTION" default=" " /></td>
								<td align="right"><s:property value="getText(#format,{SUM_INSURED})" default=" " /></td>
								<td align="right"><s:property value="%{DUTY_SI}" default=" " /></td>
								<s:if test='"N".equals(warShowYN)'>
								<td><s:textfield cssClass="inputBox" name="commodityRate" value="%{getText('{0,number,#,##0.0000}',{MARINE_WAR_RATE})}" cssStyle="width:80px" onkeyup="checkNumbers(this)" disabled="#endtDisable" readonly="true"/><s:hidden name="commodityId" value="%{#commodityList.COMMODITY_ID}"/></td>
								<s:hidden name="commodityWarRate" value="0"></s:hidden>
								</s:if>
								<s:else>
								<s:if test='("RSAIssuer".equals(#session.usertype)) || ("admin".equalsIgnoreCase(#session.usertype))'>
									<s:if test="hasActionErrors()">
										<td>
											<s:textfield cssClass="inputBox" name="commodityRate" value="%{commodityRate[#stat.index]}" disabled="#endtDisable" cssStyle="width:80px" onkeyup="checkNumbers(this)" /><s:hidden name="commodityId" value="%{#commodityList.COMMODITY_ID}"/>
										</td>
										<td>
											<s:textfield cssClass="inputBox" name="commodityWarRate" value="%{commodityWarRate[#stat.index]}" cssStyle="width:80px" onkeyup="checkNumbers(this)" disabled="#endtDisable"/>
										</td>
										<td>
											<s:textfield cssClass="inputBox" name="commodityImportRate" value="%{commodityImportRate[#stat.index]}" cssStyle="width:80px" onkeyup="checkNumbers(this)" disabled="#endtDisable"/>
										</td>
									</s:if>
									<s:else>
										<td>
											<s:textfield cssClass="inputBox" name="commodityRate" value="%{getText('{0,number,#,##0.0000}',{RATE})}" cssStyle="width:80px" onkeyup="checkNumbers(this)" disabled="#endtDisable" /><s:hidden name="commodityId" value="%{#commodityList.COMMODITY_ID}"/>
										</td>
										<td>
											<s:textfield cssClass="inputBox" name="commodityWarRate" value="%{getText('{0,number,#,##0.0000}',{WARRATE})}" cssStyle="width:80px" onkeyup="checkNumbers(this)" disabled="#endtDisable" />
										</td>
										<td>
											<s:textfield cssClass="inputBox" name="commodityImportRate" value="%{getText('{0,number,#,##0.0000}',{IMPORT_RATE})}" cssStyle="width:80px" onkeyup="checkNumbers(this)" disabled="#endtDisable" />
										</td>
									</s:else>
								</s:if>
								<td align="right"><s:property value="%{RAG}" default=" " /></td>
								<s:elseif test='status=="N"'>
									<s:if test='"admin".equalsIgnoreCase(#session.usertype) || "RSAIssuer".equalsIgnoreCase(#session.usertype)'>
										<td><s:textfield cssClass="inputBox" name="commodityRate" value="%{getText('{0,number,#,##0.0000}',{RATE})}" cssStyle="width:80px" onkeyup="checkNumbers(this)" disabled="#endtDisable" readonly="true"/><s:hidden name="commodityId" value="%{#commodityList.COMMODITY_ID}"/></td>
										<td><s:textfield cssClass="inputBox" name="commodityWarRate" value="%{getText('{0,number,#,##0.0000}',{WARRATE})}" cssStyle="width:80px" onkeyup="checkNumbers(this)" disabled="#endtDisable" readonly="true"/></td>
									</s:if>
									<s:else>
										<td><s:property value="getText('{0,number,#,##0.000000}',{MARINE_WAR_RATE})" default=" " /></td>
									</s:else>
								</s:elseif>
								</s:else>
								<td><s:property value="FRAGILE"/></td>
							</tr>
							</s:iterator>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<s:if test="%{IMO_NUMBER!=null && IMO_NUMBER!=''}">
<s:hidden name="imoNumber" value="IMO_NUMBER"/>

<div class="panel panel-primary">
	<div class="panel-heading">
		<s:text name="Vessel Details" />
		</div>
		<div class="panel-body" >
		
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<div id="wait" align="center"  style="display:none"><img src='<%=request.getContextPath()%>/images/ajax-loader-bar.gif' width="64" height="64" /><br>Loading..</div>
				<div id="vesselLists"></div>	
			</div>
		</div>
		
		
			<div class="row" id="marineship" >
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<table class="table table-striped table-bordered dt-responsive nowrap" id="record" width="100%" cellspacing="0">
				       <thead>
				         <tr style="color:#000000;">
				           <th>SNo</th>
				           <th>IMO Number</th>
				           <th>Ship Name</th>
				           <th>Ship Status</th>
				           <th>Sanction</th>
				           <th>View </th>
				           
				         </tr>
				       </thead>
				       <tbody id="tbl_posts_body">
				       <s:iterator value="shipdetail" status="cnt" var="var">
				         <tr>
				           <td><span class="sn"><s:property value="%{#cnt.count}"/></span>.</td>
				           <td><s:property value="%{#var.ImoNumber}"/></td>
				           <td><s:property value="%{#var.ShipName}"/></td>
				            <td><s:property value="%{#var.ShipStatus}"/></td>
				            <td><s:property value="%{#var.LegalOverall}"/></td> 
				            <td><input type="button" value="View" class="btn btn-sm btn-primary btn-width" onclick="return view('vesselView','<s:property value="%{#var.ImoNumber}"/>')"/></td>
				         </tr>
				       </s:iterator>								          
				         
				       </tbody>
				    </table>
				</div>
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<div id="vesselView"></div>	
					</div>
				</div>
		</div>
		<br class="clear" />
	</div>
</div>
</s:if>
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<s:if test='status=="N" || #session.user1 == "admin"'>		
			<div class="panel panel-primary">
				<div class="panel-heading">
					<s:text name="premiumInfo.premiumInfo" />
					<span  style="float: right">&nbsp;<s:property value="#session.BrokerDetails.CurrencyAbb"/></span>
				</div>
				<div class="panel-body" style="padding: 0px;">
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<table width="100%" class="table table-bordered">
								<tbody>
								<s:if test='"N".equals(warShowYN)'>
								<tr>
										<td width="25%">&nbsp;</td>
										<td width="25%" align="left">
										<s:text name="premiumInfo.marinePremium" />
										</td>
										<td width="25%" align="right">&nbsp;</td>
										<td width="25%" align="right">
											<s:property value="getText(#format,{TOTAL_PREMIUM})"/> 
											</td>
									</tr>
								</s:if>
								<s:else>
									<tr>
										<td width="25%">&nbsp;</td>
										<td width="25%" align="left">
											<s:text name="premiumInfo.marinePremium" />
										</td>
										<td width="25%" align="right">
											<s:property value="getText(#format,{MARINE_PREMIUM})" default=" "/> 
										</td>
										<td width="25%" align="right">&nbsp;</td>
									</tr>
									<tr>
										<td align="right"><s:text name="premiumInfo.add" /></td>
										<td>
											
				                   	    		<s:if test='%{"3".equals(MODE_OF_TRANSPORT)}'>
				                   	    			<s:text name="premiumInfo.srccPremium" />
				                   	    		</s:if>
				                   	    		<s:else>
				                   	    			<s:text name="premiumInfo.warPremium" />
				                   	    		</s:else>
				                   	    	
										</td>
										<s:if test='#session.user1 == "admin" || "RSAIssuer".equals(#session.usertype)'>
										<td align="right"> <s:property value="getText(#format,{WAR_PREMIUM})"/> </td>
										</s:if>
										<s:else>
										<td align="right"> <s:property value="getText(#format,{TOTAL_WAR_PREMIUM})"/> </td>
										</s:else>
										<%-- <td align="right"><s:property value="getText(#format,{WAR_PREMIUM})" default="0.0" /> </td>
										<td align="right"> <s:property value="getText(#format,{TOTAL_PREMIUM})"/> </td>--%>
										<td align="right">&nbsp;</td>
									</tr>
									</s:else>
									<!-- Import Premium -->
									<tr>
										<td align="right"><s:text name="premiumInfo.add" /></td>
										<td>  <s:text name="premiumInfo.importpremium" /> 
										</td>
										<td align="right"> <s:property value="getText(#format,{IMPORT_PREMIUM})"/> </td>
										<%-- <td align="right"><s:property value="getText(#format,{WAR_PREMIUM})" default="0.0" /> </td> --%>
										<td align="right"> <s:property value="getText(#format,{TOTAL_PREMIUM})"/> </td>
									</tr>
									
									<tr>
										<td></td>
										<td></td>
										<td>
											<s:text name="premiumInfo.additionalPremium" />
											<s:if test='"RA".equals(quoteStatus) && !"admin".equalsIgnoreCase(#session.user1)'>
												<s:select list="#{'+':'+','-':'-'}" name="premiumOption" value="%{#quotation.EXCESS_SIGN}" headerKey="" disabled="true" cssClass="inputBoxS" cssStyle="width: 70px;" />
											</s:if>
											<s:else>
												<s:select list="#{'+':'+','-':'-'}" name="premiumOption" value="%{#quotation.EXCESS_SIGN}" headerKey="" disabled="#disable" cssStyle="width: 70px;" />
											</s:else>  
										</td>
										<td>
											<s:if test="hasActionErrors()">
						                        <s:textfield name="additionalPremium" onkeyup="validamt(this)" readonly="%{quoteStatus=='RA' && #session.user1 != 'admin'?'true':'false'}" disabled="#disable"  cssStyle="text-align:right;" cssClass="inputBox"/>                        
						                     </s:if>
						                     <s:else>
					                       		<s:textfield name="additionalPremium"  value="%{#quotation.ADDITIONAL_PREMIUM}" onkeyup="validamt(this)" readonly='%{ (#session.user1 != "admin" && "11".equals(#session.product_id)) || (quoteStatus=="RA" && #session.user1 != "admin")?"true":"false"}' disabled="#disable"  cssStyle="text-align:right;" cssClass="inputBox" />                          
						                     </s:else>
										</td>
									</tr>
									<s:if test="GOVT_TAX">
									<tr>
										<td></td>
										<td></td>
										<td><s:text name="premiumInfo.governmentTax" /></td>
										<td>
											<s:property value="getText(#format,{@java.lang.Double@parseDouble(GOVT_TAX)})"/>
											<s:hidden name="govtTax" value="%{getText(#format,{@java.lang.Double@parseDouble(GOVT_TAX)})}"/>
										</td>
									</tr>
									</s:if>
									<tr>
										<td></td>
										<td><s:text name="premiumInfo.add" /></td>
										<td>
										<s:text name="premiumInfo.inspectionFee" />
										</td>
										<td>
											<s:textfield name="inspectionFee" id="inspectionFee" value="%{#quotation.INSPECTION_FEE}" onkeyup="validamt(this)"  cssStyle="text-align:right;" readonly='#endtDisable' cssClass="inputBox" disabled="true"/>
										</td>
									</tr>
									<s:if test='#session.user1 == "admin"  || ("RSAIssuer".equals(#session.usertype) && productId!=openCover)'>
									<tr>
										<td align="right"><s:text name="premiumInfo.add" /></td>
										<td><s:text name="premiumInfo.policyIssuanceFee" /></td>
										<td><s:text name="premiumInfo.editPolicyIssuanceFee" /><s:radio list="#{'Y':'Yes','N':'No'}" name="editPolicyFee" value="%{(#quotation.POLICYFEEYN==null || #quotation.POLICYFEEYN=='null' || #quotation.POLICYFEEYN=='')?'N':#quotation.POLICYFEEYN}" onclick="enable(this.value,'policyFee')" disabled="true"/></td>
										<td>
											<s:textfield name="policyFee" id="policyFee" cssClass="inputBox" value="%{#quotation.POLICY_ISSUNCE_FEE}" readonly='%{#quotation.POLICYFEEYN=="Y"?"false":"true"}'  cssStyle="text-align:right;" disabled="true"/>
										</td>
									</tr>
									</s:if>
									<s:else>
									<tr> 
										<td align="right"><s:text name="premiumInfo.add" /></td>
										<td><s:text name="premiumInfo.policyIssuanceFee" /></td>
										<td></td>
										<td>
											<s:textfield name="policyFee" id="policyFee" cssClass="inputBox"  value="%{#quotation.POLICY_ISSUNCE_FEE}" disabled="true" cssStyle="text-align:right;"/>
										</td>
									</tr>
									<s:hidden name="editPolicyFee" value="%{#quotation.POLICYFEEYN==null?'N':#quotation.POLICYFEEYN}"></s:hidden>
									</s:else>
									 <s:if test='VAT_TAX_PERCENT!=0'>	
			                      	     <tr>
					     				   <td width="25%" align="right">&nbsp;</td>
			                                <td width="25%">Vat Tax</td>  
			                                <td width="25%" align="right">
				                                <%--<s:label key="servicetax.percentage" />--%>
				                              	  <s:property value="VAT_TAX_PERCENT"/>%                            
			                                <td width="25%" align="right"><s:textfield name="vatTax" id="vatTax" value="%{#quotation.VAT_TAX_AMT}" cssClass="inputBox"  readonly='true'  cssStyle="text-align:right;"/>
			                                </td>   
			                      	    </tr>
		                      	    </s:if>
		                      	    <s:if test="%{#quotation.STAMP_DUTY>0}">
		                      	     <tr>
					     				   <td width="25%" align="right">&nbsp;</td>
			                                <td width="25%"></td>  
			                                <td width="25%" align="right">
				                                <%--<s:label key="servicetax.percentage" />--%>
				                              	  Stamp Duty                             
			                                <td width="25%" align="right">
			                                <s:textfield name="stampduty" id="stampduty" value="%{#quotation.STAMP_DUTY}" cssClass="inputBox"  readonly='true'  cssStyle="text-align:right;"/>
			                                </td>   
			                      	    </tr>
		                      	    </s:if>
		                      	    
		                      	    <s:if test='GSTFLAG=="Y"'>
		                      	     <s:if test="%{#quotation.CGST>0}">
		                      	     <tr>
					     				   <td width="25%" align="right">&nbsp;</td>
			                                <td width="25%">GST</td>  
			                                <td width="25%" align="right">
				                                <%--<s:label key="servicetax.percentage" />--%>
				                              	  CGST<s:property value="CGST_RATE"/>%                            
			                                <td width="25%" align="right">
			                                <s:textfield name="cgst" id="cgst" value="%{#quotation.CGST}" cssClass="inputBox"  readonly='true'  cssStyle="text-align:right;"/>
			                                </td>   
			                      	    </tr>
		                      	    </s:if>
		                      	     <s:if test="%{#quotation.SGST>0}">
		                      	    <tr>
					     				   <td width="25%" align="right">&nbsp;</td>
			                                <td width="25%"></td>  
			                                <td width="25%" align="right">
				                                <%--<s:label key="servicetax.percentage" />--%>
				                              	  SGST<s:property value="SGST_RATE"/>%                            
			                                <td width="25%" align="right">
			                                <s:textfield name="sgst" id="sgst" value="%{#quotation.SGST}" cssClass="inputBox"  readonly='true'  cssStyle="text-align:right;"/>
			                                </td>   
			                      	    </tr>
			                      	    </s:if>
			                      	     <s:if test="%{#quotation.IGST>0}">
			                      	    <tr>
					     				   <td width="25%" align="right">&nbsp;</td>
			                                <td width="25%"></td>  
			                                <td width="25%" align="right">
				                                <%--<s:label key="servicetax.percentage" />--%>
				                              	  IGST<s:property value="IGST_RATE"/>%                            
			                                <td width="25%" align="right">
			                                <s:textfield name="igst" id="igst" value="%{#quotation.IGST}" cssClass="inputBox"  readonly='true'  cssStyle="text-align:right;"/>
			                                </td>   
			                      	    </tr>
			                      	    </s:if>
			                      	    <s:if test="%{#quotation.UTGST>0}">
		                      	    <tr>
		                      	    
					     				   <td width="25%" align="right">&nbsp;</td>
			                                <td width="25%"></td>  
			                                <td width="25%" align="right">
				                                <%--<s:label key="servicetax.percentage" />--%>
				                              	  UTGST <s:property value="UTGST_RATE"/>%                            
			                                <td width="25%" align="right">
			                                <s:textfield name="utgst" id="utgst" value="%{#quotation.UTGST}" cssClass="inputBox"  readonly='true'  cssStyle="text-align:right;"/>
			                                </td>   
			                      	    </tr>
		                      	    </s:if>
			                      	    </s:if>
									<tr>
										<td></td>
										<td></td>
										<td><s:text name="premiumInfo.totalPremium" /></td>
										<td align="right">
											<s:if test="%{#endtVar && endTypeId!='15'}">
					                     		<s:include value="/pages/premiumInfoEndt.jsp"></s:include>
					                     	</s:if>
				                       		<s:textfield name="netPremium"  value="%{#quotation.NET_PREMIUM}" readonly="true" cssClass="inputBox"  cssStyle="text-align:right;"/>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<%--<s:if test='"admin".equalsIgnoreCase(#session.usertype) || "RSAIssuer".equalsIgnoreCase(#session.usertype) || "N".equalsIgnoreCase(viewClausesOption)'>--%>
			<s:if test='"admin".equalsIgnoreCase(#session.usertype) || "RSAIssuer".equalsIgnoreCase(#session.usertype) || "N".equalsIgnoreCase(viewClausesOption)' >
				<div class="panel panel-primary">
					<div class="panel-heading">
						<s:text name="premiumInfo.clausesInfo" />
					</div>
					<div class="panel-body">
						<s:if test='(#session.user1 == "admin" || "RSAIssuer".equals(#session.usertype))'>
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center" id="editClauses">
								<a type="button" class="btn btn-sm btn-info" style="cursor: pointer" data-toggle="modal" data-target="#editclausesModal" onclick="viewClause('<%=request.getContextPath()%>/clausesPremium.action?applicationNo=<s:property value="%{applicationNo}"/>&quoteNo=<s:property value="QUOTE_NUMBER"/>&condStatus=modify','editclauseAjaxId');"><s:text name="premiumInfo.editClauses"/></a> &nbsp;&nbsp;&nbsp;
								<a type="button" class="btn btn-sm btn-info" style="cursor: pointer;" data-toggle="modal" data-target="#addclausesModal" onclick="viewClause('<%=request.getContextPath()%>/clausesPremium.action?applicationNo=<s:property value="%{applicationNo}"/>&quoteNo=<s:property value="QUOTE_NUMBER"/>&coverId=<s:property value="COVER_ID"/>&conditionType=1&condStatus=add','addclauseAjaxId');"><s:text name="premiumInfo.addClauses"/></a> &nbsp;&nbsp;&nbsp;
								<s:if test='!"NO".equals(WAR_SRCC)'>
								<a type="button" class="btn btn-sm btn-info" style="cursor: pointer;" data-toggle="modal" data-target="#addwarModal"  onclick="viewClause('<%=request.getContextPath()%>/clausesPremium.action?applicationNo=<s:property value="%{applicationNo}"/>&quoteNo=<s:property value="QUOTE_NUMBER"/>&coverId=<s:property value="COVER_ID"/>&conditionType=2&condStatus=add','addwarAjaxId');"><s:text name="premiumInfo.addWarClauses"/></a> &nbsp;&nbsp;&nbsp;
								</s:if>
								<a type="button" class="btn btn-sm btn-info" style="cursor: pointer;" data-toggle="modal" data-target="#addexclusionModal"  onclick="viewClause('<%=request.getContextPath()%>/clausesPremium.action?applicationNo=<s:property value="%{applicationNo}"/>&quoteNo=<s:property value="QUOTE_NUMBER"/>&coverId=<s:property value="COVER_ID"/>&conditionType=3&condStatus=add','addexclusionAjaxId');"><s:text name="premiumInfo.addExclusions"/></a> &nbsp;&nbsp;&nbsp;
								<a type="button" class="btn btn-sm btn-info" style="cursor: pointer;" data-toggle="modal" data-target="#addwarrantyModal"  onclick="viewClause('<%=request.getContextPath()%>/clausesPremium.action?applicationNo=<s:property value="%{applicationNo}"/>&quoteNo=<s:property value="QUOTE_NUMBER"/>&coverId=<s:property value="COVER_ID"/>&conditionType=4&condStatus=add','addwarrantyAjaxId');"><s:text name="premiumInfo.addWarranties"/></a>
							</div>
						</div>
						</s:if>
						<s:else>
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center" style="padding-top: 5px;" style="height: 30px;">
								<div class="row">
									<div class="col-xs-9">
										<s:text name="premiumInfo.viewClausesDesc"/>
									</div>
									<div class="col-xs-3" align="center">
										
										<a type="button" class="btn btn-sm btn-info"  style="cursor: pointer" data-toggle="modal" data-target="#viewclausesModal" onclick="viewClause('<%=request.getContextPath()%>/clausesPremium.action?applicationNo=<s:property value="%{applicationNo}"/>&quoteNo=<s:property value="QUOTE_NUMBER"/>','viewclauseAjaxId');"><s:text name="premiumInfo.viewClauses"/></a>
									</div>
								</div>
							</div>
						</div>
						</s:else>
						<s:if test='"RSAIssuer".equals(#session.usertype)'>
						<br class="clear" />
							<div class="row">
								<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" id="viewClauses">
									<div class="row">
										<div class="col-xs-9">
											<s:text name="premiumInfo.viewClausesDesc"/>
										</div>
										<div class="col-xs-3" align="center">
											<a type="button" class="btn btn-sm btn-info" style="cursor: pointer" data-toggle="modal" data-target="#viewclausesModal" onclick="viewClause('<%=request.getContextPath()%>/clausesPremium.action?applicationNo=<s:property value="%{applicationNo}"/>&quoteNo=<s:property value="QUOTE_NUMBER"/>','viewclauseAjaxId');"><s:text name="premiumInfo.viewClauses"/></a>
										</div>
									</div>
								</div>
								<s:if test="!#endtVar">
								<s:if test='%{productId!=openCover || "admin".equals(#session.user1)}'>
										<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" id="viewClauses">
											<div class="row">
												<div class="col-xs-9">
													<s:text name="Do you want to edit the clauses?"/>
												</div>
												<div class="col-xs-3" align="center">
													<s:radio name="editClausesYN" list="#{'Y':'Yes','N':'No'}" onclick="getEditClauses(this.value,'normal');" tabindex="30" />
												</div>
											</div>
										</div>
									</s:if>
								</s:if>
							</div>
						</s:if>
					</div>
				</div>
			</s:if>
			
			<s:if test='status=="N" && #session.user1 != "admin"'>
   				<s:if test="!#endtVar || (#endtVar && #financialVar)">
   					<div class="panel panel-primary">
						<div class="panel-heading">
							<s:text name="premiumInfo.referralInfo" />
						</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
									<div class="row">
										<div class="col-xs-9">
											<s:text name="Would you like to get in touch with under writer for getting better quote?"/>
										</div>
										<div class="col-xs-3">
											<s:radio list="#{'Y':'Yes','N':'No'}" name="referralUpdate"  id="referralUpdate"  onclick="disablePolicyOption(this.value);enable(this.value, 'referralComment')" value="%{(referralUpdate==null||referralUpdate=='')?((ADMIN_REFERRAL_STATUS==null || ADMIN_REFERRAL_STATUS=='')?'N':ADMIN_REFERRAL_STATUS):referralUpdate}"/>
										</div>
									</div>
								</div>
								<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
									<div class="row">
										<div class="col-xs-3">
											<s:text name="premiumInfo.comments" />
										</div>
										<div class="col-xs-9">
											<s:textarea name="referralComment" cssClass="inputBoxA" cssStyle="width: 100%;" id="referralComment" cols="25" rows="2" readonly='%{referralUpdate==null || referralUpdate=="N"?(ADMIN_REFERRAL_STATUS!="Y"):"false"}' value='%{referralComment==null?(ADMIN_REFERRAL_STATUS=="Y"?REFERRAL_DESC:""):referralComment}'/>
										</div>
									</div>
								</div>
								<s:if test='"RSAIssuer".equals(#session.usertype) && !"RA".equals(quoteStatus)'>
								<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
									<div class="row">
										<div class="col-xs-9">
											<s:text name="Are You finalizing this Quote?" />
										</div>
										<div class="col-xs-3">
											<s:radio name="finalizeYN" tabindex="16" list="#{'Y':'Yes','N':'No'}"  />
										</div>
									</div>
								</div>
								</s:if>
								<s:elseif test='"RSAIssuer".equals(#session.usertype) && "RA".equals(quoteStatus)'>
									<s:hidden name="finalizeYN" value="Y"/>
								</s:elseif>
								<s:else>
									<s:hidden name="finalizeYN"/>
								</s:else>
							</div>
						</div>
					</div>
   				</s:if>
   				<div id="policyGeneration" >
   					<div class="panel panel-primary">
						<div class="panel-heading">
							<B><s:text name="premiumInfo.policyGeneration" /></B>
						</div>
						<div class="panel-body">
						<%-- <s:if test="%{endt}"></s:if>
						<s:elseif test='"RSAIssuer".equals(#session.usertype)'>
							<div class="row">
								<div class="col-xs-3">
									<s:text name="premiumInfo.effetivePolicy" />
								</div>
								<div class="col-xs-3">
								 	<s:textfield id="preEffectiveDate1" name="effectiveDate" cssClass="inputBox datepicker tooltipContent"  data-content="Effective Date" readonly="true" />
								</div>
							</div>
				<div class="panel-body">
					<table id="QuoteDocTable" class="table table-bordered table-striped" style="display: none;" >
						<thead>
							<tr>
								<th >S.No.</th>
								<th >Due Amount</th>
								<th >Due Percent</th>
								<th >Due Date</th>
								<th >Effective Date</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<s:if test="hasActionErrors()">
								<s:iterator value="dueList" var="dueList" status="stat">
									<tr>
									<td align="center"><s:property value="%{#stat.count}"/></td>
									
									<td>
											<s:hidden name="dueList[%{#stat.count-1}]" id="dueList[%{#stat.count-1}]"></s:hidden>
								 			<s:textfield name="dueamount[%{#stat.count-1}]" id="dueamount[%{#stat.count-1}]" cssClass="form-control tooltipContent"  maxlength="100"/>
									</td>
									<td>
								 			<s:textfield name="duepercent[%{#stat.count-1}]" id="duepercent[%{#stat.count-1}]" cssClass="form-control tooltipContent"  maxlength="100"/>
									</td>
									<td>
								 			<s:textfield id="dueDate%{#stat.count-1}" name="dueDate[%{#stat.count-1}]"  readonly="true"  cssClass="form-control passExpDate tooltipContent"   />
								 	</td>
									<td>
								 			<s:textfield id="effectiveDate%{#stat.count-1}" name="effectiveDatePT[%{#stat.count-1}]"  readonly="true"  cssClass="form-control passExpDate tooltipContent" />
								 	</td>
									<td>	
										<s:if test="!#stat.first">
											<s:checkbox name="deleteRow[%{#stat.count-1}]" id="chk%{#stat.count}" onclick="deleteRow(this.id, this)"/>
										</s:if>
									</td>
									</tr>
							</s:iterator>
							</s:if>
							<s:else>
								<tr>
								<td align="center">1</td>
								
								<td>
										<s:hidden name="dueList[0]" id="dueList[0]" value="0"></s:hidden>
							 			<s:textfield name="dueamount[0]" id="dueamount[0]" cssClass="form-control tooltipContent"  maxlength="100"/>
								</td>
								<td>
							 			<s:textfield name="duepercent[0]" id="duepercent[0]" cssClass="form-control tooltipContent"  maxlength="100"/>
								</td>
								<td>
							 			<s:textfield id="dueDate1" name="dueDate" cssClass="form-control datepicker tooltipContent"   />
							 	</td>
								<td>
							 			<s:textfield id="effectiveDate1" name="effectiveDatePT" cssClass="form-control datepicker tooltipContent" />
							 	</td>
							 	<td/>
								</tr>
							</s:else>
						</tbody>
					</table>
						<div class="boxcontent" align="right" id="addTable">
					    	<input type="button" name="addadd" value="Add" class="btn btn-sm btn-primary" onclick="addQuoDocRow()" />
					    </div>
					   
					</div>
						</s:elseif> --%>
							<div class="row">
								<div class="col-xs-3">
									<s:text name="premiumInfo.generatePolicy" />
								</div>
								<div class="col-xs-3">
									<s:radio list="#{'Y':'Schedule','N':'Draft'}"  name="generatePolicy" id="generatePolicy" value="%{generatePolicy==null?'N':generatePolicy}" onclick="getPaymentStatus(this.value);disablePolicyDetail(this);"/>
								</div>
							</div>
							<div class="row">
								<div class="col-xs-3">
									<s:text name="premiumInfo.certificateDisplayInfo" />
								</div>
								<div class="col-xs-9">
									 
									<s:iterator var="docInfo" value="policyInformation">
<!--										<s:if test="productId != openCover">-->
<!--											<s:if test='"RSAIssuer".equalsIgnoreCase(#session.usertype)'>-->
<!--												<s:checkbox name="premiumYes"  id="premiumYes"  fieldValue="YES" value='%{premiumYN==null?PDF_PRE_SHOW_STATUS=="YES":premiumYN=="YES"}' disabled='%{premiumYN==null?PDF_PRE_SHOW_STATUS=="PAID":premiumYN=="PAID"}' onclick="setPremiumYN();"/><s:label key="premiumInfo.showPremium"  name="certificateInfo"/>&nbsp;&nbsp;&nbsp;										-->
<!--												<s:checkbox name="premiumPaid"  id="premiumPaid"  fieldValue="PAID" value='%{premiumYN==null?PDF_PRE_SHOW_STATUS=="PAID":premiumYN=="PAID"}' disabled='%{premiumYN==null?PDF_PRE_SHOW_STATUS=="YES":premiumYN=="YES"}' onclick="setPremiumYN();"/><s:label key="premiumInfo.paidPremium"/>&nbsp;&nbsp;&nbsp;-->
<!--												<s:hidden name="premiumYN"  id="premiumYN" />-->
<!--											</s:if>-->
<!--											<s:else>-->
<!--												<s:checkbox name="premiumYN"  id="check_premium"  fieldValue="YES" value='%{premiumYN==null?PDF_PRE_SHOW_STATUS=="YES":premiumYN=="YES"}' /><s:label key="premiumInfo.showPremium"  name="certificateInfo"/>&nbsp;&nbsp;&nbsp;-->
<!--											</s:else>-->
<!--											-->
<!--											<s:if test='%{OPEN_BANK_ID!=0}'>-->
<!--												<s:checkbox name="banker" id="check_banker"  fieldValue="YES"  value='%{banker==null?PDF_BANKER_STATUS=="YES":banker=="YES"}' onclick="if (this.checked) document.getElementById('check_both').disabled=true; else document.getElementById('check_both').disabled = false;" disabled='%{BANK_NAME==null || both=="YES"}'/><s:label key="premiumInfo.shouldBankerOnly"  name="certificateInfo"/> &nbsp;&nbsp;&nbsp;-->
<!--												<s:checkbox name="both" id="check_both"  fieldValue="YES"  value='%{both==null?PDF_BANKER_ASSURED_STATUS=="YES":both=="YES"}' onclick="if (this.checked) document.getElementById('check_banker').disabled=true; else document.getElementById('check_banker').disabled = false;" disabled='%{BANK_NAME==null || banker=="YES"}'/><s:label key="premiumInfo.shouldBankerAndAssured"  name="certificateInfo"/> &nbsp;&nbsp;&nbsp;-->
<!--											</s:if>-->
<!--											<s:checkbox name="foreign" id="check_foreign" fieldValue="YES" value='%{foreign==null?PDF_CURRENCY_STATUS=="YES":foreign=="YES"}' disabled="#endtDisable"/><s:label key="premiumInfo.showForeign"  name="certificateInfo"/> &nbsp;&nbsp;&nbsp;-->
<!--											<s:checkbox name="rubberStamp" id="check_rubber_stamp" fieldValue="Y" value='%{rubberStamp==null?PDF_STAMP_STATUS=="Y":rubberStamp=="Y"}' cssStyle="display: none;" /><s:label key="premiumInfo.printRubberStamp"  name="certificateInfo" style="display: none;"/> &nbsp;&nbsp;&nbsp;-->
<!--											<s:hidden name="certClausesYN" value="Y"/>-->
<!--											<s:if test='"RSAIssuer".equalsIgnoreCase(#session.usertype)'>-->
<!--												<s:checkbox name="excess"  id="check_excess"  fieldValue="YES" value='%{excess==null?PDF_EXCESS_STATUS=="YES":excess=="YES"}' cssStyle="display: none;" /><s:label key="premiumInfo.showExcess"  name="certificateInfo" style="display: none;" /> &nbsp;&nbsp;&nbsp;-->
<!--											</s:if>-->
<!--											<s:else>-->
<!--												<s:hidden name="excess"  id="check_excess" value=""/>-->
<!--											</s:else> -->
<!--										</s:if>-->
										
											
												<s:checkbox name="premiumYes"  id="premiumYes"  fieldValue="YES" value='%{premiumYN==null?PDF_PRE_SHOW_STATUS=="YES":premiumYN=="YES"}' disabled='%{premiumYN==null?PDF_PRE_SHOW_STATUS=="PAID":premiumYN=="PAID"}' onclick="setPremiumYN();"/><s:label key="premiumInfo.showPremium"  name="certificateInfo"/> &nbsp;&nbsp;&nbsp;
												<s:checkbox name="premiumPaid"  id="premiumPaid"  fieldValue="PAID" value='%{premiumYN==null?PDF_PRE_SHOW_STATUS=="PAID":premiumYN=="PAID"}' disabled='%{premiumYN==null?PDF_PRE_SHOW_STATUS=="YES":premiumYN=="YES"}' onclick="setPremiumYN();"/><s:text name="premiumInfo.paidPremium"/> &nbsp;&nbsp;&nbsp;
												<s:hidden name="premiumYN" id="premiumYN"/>
											<s:if test='%{OPEN_BANK_ID!=0}'>
												<s:checkbox name="banker" id="check_banker"  fieldValue="YES"  value='%{banker==null?PDF_BANKER_STATUS=="YES":banker=="YES"}' onclick="if (this.checked) document.getElementById('check_both').disabled=true; else document.getElementById('check_both').disabled = false;" disabled='%{BANK_NAME==null || BANK_NAME=="" || both=="YES"}'/><s:label key="premiumInfo.shouldBankerOnly"  name="certificateInfo"/> &nbsp;&nbsp;&nbsp;
												<s:checkbox name="both" id="check_both"  fieldValue="YES"  value='%{both==null?PDF_BANKER_ASSURED_STATUS=="YES":both=="YES"}' onclick="if (this.checked) document.getElementById('check_banker').disabled=true; else document.getElementById('check_banker').disabled = false;" disabled='%{BANK_NAME==null || BANK_NAME=="" || banker=="YES"}'/><s:label key="premiumInfo.shouldBankerAndAssured"  name="certificateInfo"/> &nbsp;&nbsp;&nbsp;
											</s:if>
											<s:checkbox name="foreign" id="check_foreign" fieldValue="YES" value='%{foreign==null?PDF_CURRENCY_STATUS=="YES":foreign=="YES"}'  disabled="endtDisable"/><s:label key="premiumInfo.showForeign"  name="certificateInfo"/> &nbsp;&nbsp;&nbsp;
											<s:checkbox name="rubberStamp" id="check_rubber_stamp" fieldValue="Y" value='%{rubberStamp==null?PDF_STAMP_STATUS=="Y":rubberStamp=="Y"}' /><s:label key="premiumInfo.printRubberStamp"  name="certificateInfo"/> &nbsp;&nbsp;&nbsp;
												<s:hidden name="certClausesYN" value="Y"/>
											<s:if test='"RSAIssuer".equalsIgnoreCase(#session.usertype)'>
												<s:checkbox name="excess"  id="check_excess"  fieldValue="YES" value='%{excess==null?PDF_EXCESS_STATUS=="YES":excess=="YES"}' /><s:label key="premiumInfo.showExcess"  name="certificateInfo"/>
											</s:if>
											<s:else>
												<s:hidden name="excess" id="check_excess"  value=""/>
											</s:else>
										
									</s:iterator>
								</div>
							</div>							
						</div>
					</div>
   				</div>
   				<div id="getPolicyDetail" >   					
					<s:if test="#endtVar">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<s:text name="premiumInfo.certificateDisplayInfoEndt" />
							</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
										<s:iterator var="docInfo" value="policyInformation">
											<s:checkbox name="showpremiumYN"  id="check_showpremium"  fieldValue="Y" value='%{showpremiumYN==null?ENDT_PREM_YN=="Y":showpremiumYN=="Y"}' /><s:label key="premiumInfo.showPremiumEndt"  name="certificateInfo"/> &nbsp;&nbsp;&nbsp;
											<s:checkbox name="printClausesYN" id="printClausesYN" fieldValue="Y" value='%{printClausesYN==null?ENDT_CLAUSES_YN=="Y":printClausesYN=="Y"}' /><s:label key="premiumInfo.showClausesEndt"  name="certificateInfo"/>
										</s:iterator>
									</div>
								</div>
								<br>
								<div class="row">
									<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
								 			<s:label key="premiumInfo.effectiveDate"/>&nbsp;&nbsp;&nbsp;
									</div>
									<div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
								 			<s:textfield id="preEffectiveDate" name="effectiveDate" cssClass="inputBox datepicker tooltipContent"  data-content="Effective Date" readonly="true" />
									</div>
								</div>
							</div>
						</div>
					</s:if>
					<%-- <s:if test='%{"RSAIssuer".equalsIgnoreCase(#session.usertype)}'>
						<div class="panel panel-primary">
							<div class="panel-heading">
								<s:text name="premiumInfo.documentBasis" />
							</div>
						</div>
					</s:if>	
							<div class="panel-body">
								<div class="row">
									<s:if test="#endtVar">
										<s:hidden name="noteType" value="G"/>
										<s:if test='%{#quotation.ISSUER!=null && !"".equals(#quotation.ISSUER) && "cash".equalsIgnoreCase(#quotation.CHANNEL_TYPE)}'>
											<s:hidden name="paymentMode" value="CA"/>
										</s:if>
										<s:else>
											<s:hidden name="paymentMode" value="CR"/>
										</s:else>
										<s:if test='%{"RSAIssuer".equalsIgnoreCase(#session.usertype)}'>
											<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
										 		<div class="text">
										 			<s:text name="premiumInfo.basisOfValidation" />
										 		</div>
										 		<div class="tbox">
										 			<s:select cssClass="inputBoxS" list="basisValList" name="basisValDesc" listKey="REMARKS" listValue="REMARKS"></s:select>
										 		</div>	
										 	</div>
										</s:if>
										<s:else>
											<s:hidden name="basisValDesc" value="ACTUAL AMOUNT"/>
										</s:else>
									</s:if>
									<s:else>
										<s:hidden name="noteType" value="G"/>
										<s:if test='%{#quotation.ISSUER!=null && !"".equals(#quotation.ISSUER) && "cash".equalsIgnoreCase(#quotation.CHANNEL_TYPE)}'>
											<s:hidden name="paymentMode" value="CA"/>
										</s:if>
										<s:else>
											<s:hidden name="paymentMode" value="CR"/>
										</s:else>
										<s:if test='%{"RSAIssuer".equalsIgnoreCase(#session.usertype)}'>
											<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
										 		<div class="text">
										 			<s:text name="premiumInfo.basisOfValidation" />
										 		</div>
										 		<div class="tbox">
										 			<s:select list="basisValList" name="basisValDesc" listKey="REMARKS" listValue="REMARKS" cssClass="inputBox"></s:select>
										 		</div>	
										 	</div>
										</s:if>
										<s:else>
											<s:hidden name="basisValDesc" value="ACTUAL AMOUNT"/>
										</s:else>
									</s:else>
								</div>
							</div> --%>
							<s:hidden name="noteType" value="G"/>
							<s:if test='%{#quotation.ISSUER!=null && !"".equals(#quotation.ISSUER) && "cash".equalsIgnoreCase(#quotation.CHANNEL_TYPE)}'>
								<s:hidden name="paymentMode" value="CA"/>
							</s:if>
							<s:else>
								<s:hidden name="paymentMode" value="CR"/>
							</s:else>
							<s:hidden name="basisValDesc" value="ACTUAL AMOUNT"/>
						</div>
					</s:if>   				 
   			</s:if>
			<s:elseif test='status=="Y"'>	
					<s:set var="isRefferal" value='%{"Y"}'></s:set>		 
					<div class="panel panel-primary">
						<div class="panel-heading">
							<div >
									<div style="font-size: 15px;">
										<b>List of Refferal in Your Quotation</b><br/><s:property value="referralMsg"/>
									</div>
							</div>
						</div>					 	
						<div class="row">
							<br/>
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">								 
								<div style="color:red;font-size: 12px; padding-left:12px ;" >
									<ol class="">
										<s:iterator value='REFERRAL_DESC.split("~")' status="stat"> 
											<li><b><s:property/></b></li>
										</s:iterator>
									</ol>
								</div>
							</div>
							<br/>
						</div>	
						<s:hidden name="referralStatus" value="Y"></s:hidden>						
					</div>				 
				<div class="panel panel-primary">
					<div class="panel-body">
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
								<div class="panel-heading">
									<div >
											<div style="font-size: 15px;">
												<center><b><s:property value="premiumInfoReferralMsg"/></b></center> 
											</div>
									</div>
								</div>								
								<s:if test="adminuwList.size()>0">
									<table class="table table-bordered" width="100%">
										<thead>
										<tr>
											<th><span style="color: #000000;">SNO.</span></th>
											<th><span style="color: #000000;">Name</span></th>
											<th><span style="color: #000000;">Email</span></th>
										</tr>
										</thead>
										<tbody>
										<s:iterator value="adminuwList" status="stat" var="adminIds">  
										<tr>
											<td>
												<s:property value="%{#stat.index+1}"/>
											</td>
											<td>
									    		<s:property value="%{#adminIds.USERNAME}"/>
											</td>
											<td>
									    		<s:property value="%{#adminIds.USER_MAIL}"/>
											</td>
										</tr>
										</s:iterator>
										</tbody>
									</table>
								</s:if>
							</div>
						</div>
					</div>
				</div>
			</s:elseif>
			<s:if test='#session.user1 == "admin"'>
				<div class="panel panel-primary">
					<div class="panel-body">
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						 		<div class="text">
						 			<s:text name="premiumInfo.commissionYN"/>
						 		</div>
						 		<div class="tbox">
						 			<s:radio name="commissionYN" list="#{'YES':'Yes','NO':'No'}" value="%{commissionYN==null?'NO':commissionYN}" onclick="enable(this.value,'commission')"/>
						 		</div>	
						 	</div>
						 	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						 		<div class="text">
						 			<s:text name="premiumInfo.commission"/>
						 		</div>
						 		<div class="tbox">
						 			<s:textfield name="commission" id="commission" readonly="%{commissionYN==null || commissionYN=='NO'}" value="%{commission==null?#quotation.DISCOUNT_PREMIUM:commission}" maxlength="5" onkeyup="checkNumbers(this)" cssClass="inputBox" />
						 		</div>	
						 	</div>
						 	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						 		<div class="text">
						 			<s:text name="premiumInfo.referralStatus"/>
						 		</div>
						 		<div class="tbox">
						 			<s:radio name="referralStatus" list="#{'A':'Approve','R':'Reject','N':'None'}" value='%{(referralStatus==null || "".equals(referralStatus))?quoteStatus=="RA"?"A":quoteStatus=="RR"?"R":"N":referralStatus}'/>
						 		</div>	
						 	</div>
						</div>
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						 		<div class="text">
						 			<s:text name="premiumInfo.remarks"/>
						 		</div>
						 		<div class="tbox">
						 			<s:textarea name="adminRemarks" value="%{adminRemarks==null?#quotation.ADMIN_REMARKS:adminRemarks}" onkeyup="textLimit(this,'450')" cssClass="inputBoxA" cssStyle="width: 100%;"  />
						 		</div>	
						 	</div>
						</div>
						<br class="clear" />
						<br class="clear" />
					</div>
				</div>
			</s:if>		 
		</div>
	</div>
	<div id="viewclausesModal" class="modal fade" role="dialog">
		  <div class="modal-dialog modal-lg">
		    <!-- Modal content-->
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        	<div class="modal-title">
					<div class="row">
	       				<div class="col-md-12 col-xs-12">
				         	<h3><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;&nbsp;<s:text name="ViewClauses" /></h3>
				         </div>
	    			</div>
				</div>
		      </div>
		      <div class="modal-body" >
		        <div class="container-fluid" id="viewclauseAjaxId">
		        </div>
		      </div>
		    </div>
		  </div>
		</div>
		<div id="editclausesModal" class="modal fade" role="dialog">
		  <div class="modal-dialog modal-lg">
		    <!-- Modal content-->
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        	<div class="modal-title">
					<div class="row">
	       				<div class="col-md-12 col-xs-12">
				         	<h3><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;&nbsp;<s:text name="Edit Clauses" /></h3>
				         </div>
	    			</div>
				</div>
		      </div>
		      <div class="modal-body" >
		        <div class="container-fluid" id="editclauseAjaxId">
		        </div>
		      </div>
		    </div>
		  </div>
		</div>
		<div id="addclausesModal" class="modal fade" role="dialog">
		  <div class="modal-dialog modal-lg">
		    <!-- Modal content-->
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        	<div class="modal-title">
					<div class="row">
	       				<div class="col-md-12 col-xs-12">
				         	<h3><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;&nbsp;<s:text name="Add Clauses" /></h3>
				         </div>
	    			</div>
				</div>
		      </div>
		      <div class="modal-body" >
		        <div class="container-fluid" id="addclauseAjaxId">
		        </div>
		      </div>
		    </div>
		  </div>
		</div>
		<div id="addwarModal" class="modal fade" role="dialog">
		  <div class="modal-dialog modal-lg">
		    <!-- Modal content-->
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        	<div class="modal-title">
					<div class="row">
	       				<div class="col-md-12 col-xs-12">
				         	<h3><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;&nbsp;<s:text name="Add War" /></h3>
				         </div>
	    			</div>
				</div>
		      </div>
		      <div class="modal-body" >
		        <div class="container-fluid" id="addwarAjaxId">
		        </div>
		      </div>
		    </div>
		  </div>
		</div>
		<div id="addexclusionModal" class="modal fade" role="dialog">
		  <div class="modal-dialog modal-lg">
		    <!-- Modal content-->
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        	<div class="modal-title">
					<div class="row">
	       				<div class="col-md-12 col-xs-12">
				         	<h3><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;&nbsp;<s:text name="Add Exclusions" /></h3>
				         </div>
	    			</div>
				</div>
		      </div>
		      <div class="modal-body" >
		        <div class="container-fluid" id="addexclusionAjaxId">
		        </div>
		      </div>
		    </div>
		  </div>
		</div>
		<div id="addwarrantyModal" class="modal fade" role="dialog">
		  <div class="modal-dialog modal-lg">
		    <!-- Modal content-->
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        	<div class="modal-title">
					<div class="row">
	       				<div class="col-md-12 col-xs-12">
				         	<h3><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;&nbsp;<s:text name="Add Warranty" /></h3>
				         </div>
	    			</div>
				</div>
		      </div>
		      <div class="modal-body" >
		        <div class="container-fluid" id="addwarrantyAjaxId">
		        </div>
		      </div>
		    </div>
		  </div>
		</div>
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
			<s:if test="%{endTypeId!=null && endTypeId.length() > 0 && quoteStatus=='RA'}">
				<s:submit name="Submit2" type="submit" cssClass="btn btn-sm btn-danger" value="Back"  onclick="update('initReport.action?menuType=E')"/>&nbsp;&nbsp;&nbsp;
			</s:if>
			<s:else>
				<s:submit name="Submit2" type="submit" cssClass="btn btn-sm btn-danger" value="Back"  onclick="update('editQuoteQuotation.action')"/>&nbsp;&nbsp;&nbsp;
			</s:else>
			<s:if test='status=="N" || #session.user1 == "admin"'>
				<s:if test="!(quoteStatus=='RA' && #session.user1 != 'admin')">
					<s:submit name="Submit3" type="button" cssClass="btn btn-sm btn-primary" value="Calculate" onclick="disableForm(this.form,false,'');update('calculatePremium.action')"/> &nbsp;&nbsp;&nbsp;
				</s:if>
			</s:if>
			<s:submit name="SubmitProceed" id="SubmitProceed" type="button" cssClass="btn btn-sm btn-success" value="Proceed"  onclick="return proceed(this);"/>
		</div>
	</div>
	<s:hidden name="quoteNo" value="%{#quotation.QUOTE_NUMBER}"/>    
	<s:hidden name="totalPremium" value="%{#quotation.TOTAL_PREMIUM}"/>    
	<s:hidden name="applicationNo"/>
	<s:hidden name="referenceNo" />
	<s:hidden name="refNo" />  
	<s:hidden name="openCoverNo"/>  
	<s:hidden name="loginId" value="%{#quotation.LOGIN_ID}"/>
	<s:hidden name="issuer" value="%{#quotation.ISSUER}"/>
	<s:hidden name="totalWarPremium" value="%{#quotation.WAR_PREMIUM}"/>
	<s:hidden name="status" value="%{#quotation.STATUS}"/>
	<s:hidden name="quoteStatus" />
	<s:hidden name="settlingAgent" value="%{#quotation.SETTLING_AGENT_NAME}"/>
	<s:hidden name="packDesc" value="%{#quotation.PACKAGE_DESCRIPTION}"/>
	<s:hidden name="addClauses"/>
	<s:hidden name="addWarClauses"/>
	<s:hidden name="addExclusions"/>
	<s:hidden name="addWarranties"/>
	<s:hidden name="endTypeId" />
	<s:hidden name="adminRefStatus" value="%{#quotation.ADMIN_REFERRAL_STATUS}"/>
	<s:hidden name="policyNo"/> 
	<s:hidden name="custName"/>
	<s:hidden name="brokerCompany"/>
	<s:hidden name="updateClauses" value="Y"/>
	<s:hidden name="searchFrom" />
	<s:hidden name="searchBy" />
	<s:hidden name="searchValue" />
	<s:hidden name="customerId" value="%{#quotation.CUSTOMER_ID}"/>
	<s:hidden name="channelType" value="%{#quotation.CHANNEL_TYPE}"/>
	<s:token/>
	</s:form>
</s:iterator>
</body>
<script src="<%=request.getContextPath()%>/datepicker/jquery-ui.js"></script>
<script type="text/javascript">
$(function() {
	$('#preEffectiveDate1').datepicker({
		changeMonth: true,
        changeYear: true,
        yearRange: "-1:+1",
        dateFormat: 'dd/mm/yy'
	}).on('changeDate', function(e){
	    $(this).datepicker('hide');
	});
    
});

$(function() {
	$('#preEffectiveDate').datetimepicker({
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
	$('.passExpDate').datepicker({
		todayHighlight: true,
		dateFormat: 'dd/mm/yy'	,
		yearRange: "-1:+1",
		viewMode: "years"
		}).on('changeDate', function(e){
		   $(this).datepicker('hide');
		});
	
    
});
$('#dueDate1').datepicker({
					todayHighlight: true,
		        	dateFormat: 'dd/mm/yy'	,
		        	yearRange: "-1:+1",
				  	viewMode: "years"
				  	//endDate: dt
				}).on('changeDate', function(e){
		            $(this).datepicker('hide');
		        });
	 
	 		$('#effectiveDate1').datepicker({
					todayHighlight: true,
		        	 dateFormat: 'dd/mm/yy'	,
		        	yearRange: "-1:+1",
				  	viewMode: "years"
				  	//endDate: dt
				}).on('changeDate', function(e){
		            $(this).datepicker('hide');
		        });
	<s:if  test='"RSAIssuer".equals(#session.usertype)' >
      getEditClauses('<s:property value="editClausesYN" />','onload');
    </s:if>
    
    
function viewPopUp(URL) {
	var bwidth = window.innerWidth;
	var bwidth1 = document.body.clientWidth;
	if(bwidth <= 768) {
		return popUp(URL,bwidth1,'500');
	} else {
		return popUp(URL,'750','500');
	}
}
getPaymentStatus('<s:property value="%{generatePolicy}" />')
		function getPaymentStatus(val){
	try{
			if(val=='Y'){
				document.getElementById('QuoteDocTable').style.display="";
				document.getElementById('addTable').style.display="";
		
			}
			else{
				document.getElementById('QuoteDocTable').style.display="none";
				document.getElementById('addTable').style.display="none";
			}
	}catch(err){
		console.log(err);
	}
		}
	function addQuoDocRow(){
		var table = document.getElementById('QuoteDocTable');
		var rowCount = table.rows.length;
		var row = table.insertRow(rowCount);
		var rowCount1 = 0;
		try{
			var table1 = document.getElementById('paymentTermsDetails');
			rowCount1=table1.rows.length;
		}catch(err){rowCount1=2}
		rowCount=rowCount+rowCount1-2;
		row.className="runtext";
		row.id = "new_"+rowCount;
		
		
		cell = row.insertCell(0);     
	   	cell.align = "center"; 
	    	cell.innerHTML = rowCount;
	    	var element = document.createElement("input");
		element.className = "inputSelect";	 
	 	element.type = "hidden";	
		element.value=rowCount;
		element.name = "dueList["+(rowCount-1)+"]";
		element.type = "hidden";
		element.value=rowCount-1;
		cell.appendChild(element);
		
		 
		
		cell = row.insertCell(1);
		var element = document.createElement("input");
		element.className = "form-control";
		element.name = "dueamount["+(rowCount-1)+"]";
		element.id = "dueamount["+(rowCount-1)+"]";
		element.type = "text";
		
		cell.appendChild(element);
		
		cell = row.insertCell(2);
		var element = document.createElement("input");
		element.className = "form-control";
		element.name = "duepercent["+(rowCount-1)+"]";
		element.id = "duepercent["+(rowCount-1)+"]";
		element.type = "text";
		cell.appendChild(element);
		
		cell = row.insertCell(3);
		var element = document.createElement("input");
	        element.type = "text";
	        element.setAttribute("placeholder",'DD/MM/YYYY'); 
	        element.setAttribute("maxlength",'10'); 
	         element.setAttribute("readonly",'true'); 
	        element.className = "form-control datepickerTable";
	        element.name = "dueDate";
	        element.id = "dueDate"+rowCount+"";            
	        cell.appendChild(element);
	        $(function() {
	        	var dt = new Date();
				dt.setFullYear(new Date().getFullYear()-18);
				$('#dueDate'+rowCount+'').datepicker({
					todayHighlight: true,
		        	dateFormat: "dd/mm/yy",
		        	yearRange: "-1:+1",
				  	viewMode: "years"
				  	//endDate: dt
				}).on('changeDate', function(e){
		            $(this).datepicker('hide');
		        });
			});
		cell.appendChild(element);
		
		cell = row.insertCell(4);
			var element = document.createElement("input");
	        element.type = "text";
	        element.setAttribute("placeholder",'DD/MM/YYYY'); 
	        element.setAttribute("maxlength",'10'); 
	         element.setAttribute("readonly",'true'); 
	        element.className = "form-control datepickerTable";
	        element.name = "effectiveDatePT["+(rowCount-1)+"]";
	        element.id = "effectiveDate"+rowCount+"";            
	        cell.appendChild(element);
	        $(function() {
	        	var dt = new Date();
				dt.setFullYear(new Date().getFullYear()-18);
				$('#effectiveDate'+rowCount+'').datepicker({
					todayHighlight: true,
		        	dateFormat: 'dd/mm/yy'	,
		        	yearRange: "-1:+1",
				  	viewMode: "years"
				  	//endDate: dt
				}).on('changeDate', function(e){
		            $(this).datepicker('hide');
		        });
			});
		cell.appendChild(element);
			
		cell = row.insertCell(5);
		cell.align = "center";
		cell.setAttribute('colSpan', '2');
		var element = document.createElement("input");
		element.type = "checkbox";
		element.id = "chk"+rowCount;
		element.onclick = function () {deleteRow(this.id,this)};	
	    cell.appendChild(element);
	}
	
	function deleteRow(id, el) {
				var decision = confirm("Row will be deleted. Do You Want to continue? ","");
				if (decision==true){
					while (el.parentNode && el.tagName.toLowerCase() != 'tr') {
						el = el.parentNode;
					}
					if (el.parentNode && el.parentNode.rows.length > 1) {
						el.parentNode.removeChild(el);
					}
				} else {
					document.getElementById(id).checked=false;
				}	   
			
		}
if(document.premiumInfo.endTypeId.value!='') {
	enableForm(document.premiumInfo,false,'<s:property value="%{fields}"/>');
}  
function quotationDetail() {
	document.getElementById('quoteInfo').style.display='block';
    document.getElementById('miuns').style.display='block';
    document.getElementById('plus').style.display='none';
}
<s:if test='"RSAIssuer".equalsIgnoreCase(#session.usertype)'>
	try {
		setPremiumYN();
	} catch(e){}
</s:if>
function setPremiumYN() {
	if(document.getElementById('premiumYes').checked == true) {
		document.getElementById('premiumPaid').disabled = true;
		document.getElementById('premiumYN').value = document.getElementById('premiumYes').value;
	}
	else if(document.getElementById('premiumPaid').checked == true) {
		document.getElementById('premiumYes').disabled = true;
		document.getElementById('premiumYN').value = document.getElementById('premiumPaid').value;
	}
	else {
		document.getElementById('premiumYes').disabled = false;
		document.getElementById('premiumPaid').disabled = false;
		document.getElementById('premiumYN').value = "";
	}
}

function normalForm() {
	document.getElementById('quoteInfo').style.display='none';
	document.getElementById('miuns').style.display='none';
	document.getElementById('plus').style.display='block';
} 
       
function disablePolicyDetail(obj) {
     var displayStatus=obj.value;   
	if(displayStatus=="N") {
		document.getElementById('getPolicyDetail').style.display='block';
	} else {
		document.getElementById('getPolicyDetail').style.display='block';    
	}
}
/*if(document.getElementById('policyGeneration') && document.getElementById('getPolicyDetail') && document.premiumInfo.referralUpdate[0].checked){
	disablePolicyOption('Y');
}*/
disablePolicyOption(document.premiumInfo.referralUpdateY.checked?'Y':'N');
function disablePolicyOption(value) {
	if(value=="Y") {
		document.getElementById('policyGeneration').style.display='none';
		document.getElementById('getPolicyDetail').style.display='none';
		document.premiumInfo.generatePolicy[0].checked=false;
		document.premiumInfo.generatePolicy[1].checked=true;
	} else {   
		document.getElementById('policyGeneration').style.display='block';
		document.getElementById('referralComment').value='';
		//if(document.premiumInfo.generatePolicy[0].checked){
			document.getElementById('getPolicyDetail').style.display='block';
		//}
	} 
}
   
function update(actionPath) { 
	document.getElementById('SubmitProceed').disabled=true;
	document.premiumInfo.action = '<%=request.getContextPath()%>/' + actionPath;
	document.premiumInfo.submit();
	return false;
}

function enable(value, id) { 
	if('Y'==value || 'YES'==value){
		document.getElementById(id).readOnly=false;
	} else {
		try{
		document.getElementById(id).readOnly=true;
		document.getElementById('commission').value='';
		}catch(e){}
	} if(id=='referralComment' && 'N'==value){
		document.getElementById(id).value='';
	}else if(id=='policyFee' && 'N'==value){
	 		document.premiumInfo.policyFee.value='<s:property value="defaultPolicyFee"/>';
 	 }
 	return false;
}
 
    function toggleCredit(value)
	{
		var accountStatus='<s:property value="accountStatus"/>';
		var commission='<s:property value="commissionStatus"/>';	
		var opencover='<s:text name="OPEN_COVER"/>';
 	    var session_productCode='<s:property value="#session.product_id"/>';
		if(session_productCode == opencover)
			{				
			   var arInsuredStatus=accountStatus;
			   var arNo='<s:property value="arInsuredStatus"/>';
			}
			else{
				  var arNo=accountStatus;
			}		
 	    
		if(value=='N'){		
			if(!arNo || commission)
			{		
				document.premiumInfo.paymentMode[1].disabled=true;
				document.premiumInfo.paymentMode[1].checked=false;
				document.premiumInfo.paymentMode[0].checked=true;
			}			
			if(session_productCode == opencover && (!arInsuredStatus || commission))
			{					
				document.premiumInfo.paymentMode[2].disabled=true;
				document.premiumInfo.paymentMode[2].checked=false;
				document.premiumInfo.paymentMode[0].checked=true;		
			}
		
		}
		if(value=='G'){
			document.premiumInfo.paymentMode[0].disabled=false;
			if(arNo){
				document.premiumInfo.paymentMode[1].disabled=false;
			}else{
				document.premiumInfo.paymentMode[1].disabled=true;
			}
			if(arInsuredStatus){
				document.premiumInfo.paymentMode[2].disabled=false;
			}else{
				document.premiumInfo.paymentMode[2].disabled=true;
			}
		}
	}
	function directMsg(value)
	{
	  var status='<s:property value="directStatus"/>';
	  if(value=='CA'){		
		   if(status=='Y'){
		   alert('You are trying to create debit note under Cash customer');
		   }
	   }
	}
 	function addConditions(type)
	{
		 var exclude='';
		 var obj='';
		 var ids='';
		 if(type=='1'){
		 	obj=document.form1.clausesIds;
		 }else if(type=='2'){
		 	obj=document.form1.exClausesIds;
		 }else if(type=='3'){
		 	obj=document.form1.exIds;
		 }else if(type=='4'){
		 	obj=document.form1.warIds;
		 }
		 if(obj.length)
		 {
		 	for ( var int = 0; int < obj.length; int++) {
				exclude+=obj[int].value+',';
			}
		 }else{
		 	exclude=obj.value;
		 }
		 if(exclude.lastIndexOf(',')!=-1){
		 	ids=exclude.substring(0, exclude.lastIndexOf(',')-1);
	 	 }
		popUp('<%=request.getContextPath()%>/admin/addConditions.jsp?type='+type+'&exclude='+ids+'&coverId='+document.form1.exisCoverId.value,'1000','500');
	}	
	function validamt(val){
		
		try{
			var value=val.value;
			if(value!=null && value){
				val.value = value.replace(/[^0-9.]/g,'');
			}
			if(val.value=='')
				val.value = '0';
		}catch(err){ val.value = '0';}
	}
	function validamt1(val){
		try{
			var value=val.value;
			if(value!=null){
				val.value = value.replace(/[^0-9]/g,'');
			}
			if(val.value=='')
				val.value = '0';
		}catch(err){val.value = '0';}
	}

    function getEditClauses(clausesYN,status){
       var userType='<s:property value="%{#session.usertype}" />';
       if("RSAIssuer"==userType){
	        if("Y"==clausesYN){
	          document.getElementById("editClauses").style.display="";
	        //  document.getElementById("viewClauses").style.display="none";	          
	        //  document.premiumInfo.referralUpdate[0].checked=true;
	        //  document.premiumInfo.referralUpdate[1].checked=false;
	        //  disablePolicyOption("Y");
	          enable("Y", 'referralComment');
	         }else{
	          document.getElementById("editClauses").style.display="none";
	         // document.getElementById("viewClauses").style.display="";
	          /*if("normal"==status){
		          document.premiumInfo.referralUpdate[0].checked=false;
		          document.premiumInfo.referralUpdate[1].checked=true;
		          disablePolicyOption("N");
		          enable("N", 'referralComment');
	          }*/
	        }
         }
     }
     
    /* function proceed(obj){
	     var userType='<s:property value="%{#session.usertype}" />';
	     var Status='<s:property value="%{#isRefferal}"/>'; 
	     var generatePolicyYN='N';
	     var referralUpdateYN='N';
		     if(Status=='N'){
			     generatePolicyYN=document.premiumInfo.generatePolicy.value;
			     referralUpdateYN=document.premiumInfo.referralUpdate.value;
		     }
	     	if(Status!='Y' && userType !='admin'&&generatePolicyYN=='Y'&&referralUpdateYN!='Y'){
			    	 var conf=confirm("Please Confirm to convert into Policy?");
			    if(conf){
					disableForm(obj.form,false,'');
			     	update('updatePremium.action')
				}
			}else{
				disableForm(obj.form,false,'');
			    update('updatePremium.action')
			}
			return false;     	
     }*/
       function proceed(obj){
     
	      try{
			   var generatePolicyYN=document.premiumInfo.generatePolicy.value;
			  }catch(e)	 {
			   	var generatePolicyYN='N';
			   }
		   var conf=true; 
		if(generatePolicyYN=='Y')
		    conf =confirm("Please Confirm to convert into Policy?");
		
		  if(conf){
			disableForm(obj.form,false,'');
			update('updatePremium.action')
		}
		 
		return false;     	
     }
     function view(id,searchBy) { 
 		
 		var URL = '<%=request.getContextPath()%>/viewListVessel.action?iHSLRORIMO='+searchBy;
 		return viewPopUp(URL);
 	}
     function viewClause(URL,id){
    	 postRequest(URL, id); 
     }
     
</script>
</html>