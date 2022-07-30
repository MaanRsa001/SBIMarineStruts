<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="js/common.js"></script>
</head>
<body>
<s:iterator value="quotationInfo" status="stat" var="quotation">
<div class="table0">
	<s:form id="premiumInfo" name="premiumInfo" method="post" action="" theme="simple">
	    <s:set var="format" value="%{'number.format.'+#session.CurrencyDecimal}"></s:set>
		<div class="tablerow">
			<s:actionerror cssStyle="color: red;" />
		</div>
		<div class="tablerow">
			<div class="boxcontent">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<div class="textfield25V">
							<s:text name="premiumInfo.quotation" />
						</div>
						<div class="textfield25V">
					 		<s:text name="premiumInfo.quoteNo" />&nbsp;:&nbsp;<s:property value="QUOTE_NUMBER" />
					 	</div>
					 	<div class="textfield25V">
					 		<s:text name="premiumInfo.customerName" />&nbsp;:&nbsp;<s:property value="CUSTOMER_NAME"/>
					 	</div>
					 	<div class="textfield25V">
					 		<s:text name="premiumInfo.coverStartDate" />&nbsp;:&nbsp;<s:property value="POLICY_START_DATE" />
					 	</div>
					 	<br class="clear"/>
					</div>
					<div class="panel-body">
						<s:if test='"endt".equals(endtView)'>
		                   <div class="textfield33V">
						 		<div class="textV">
						 			<s:text name="Policy No"  />
						 		</div>
						 		<div class="tboxV">
						 			<s:property value="policyNo" />									 		
						 		</div>
						 	</div>
	                	</s:if>
						<div class="textfield33V">
					 		<div class="textV">
					 			<s:text name="premiumInfo.formTrans"  />
					 		</div>
					 		<div class="tboxV">
					 			<s:property value="TRANSPORT_DESCRIPTION" />									 		
					 		</div>
					 	</div>
					 	<div class="textfield33V">
					 		<div class="textV">
					 			<s:text name="premiumInfo.coverage"/>
					 		</div>
					 		<div class="tboxV">
					 			<s:property value="COVER_NAME" />									 		
					 		</div>
					 	</div>
					 	<div class="textfield33V">
					 		<div class="textV">
					 			<s:text name="premiumInfo.warSrcc" />
					 		</div>
					 		<div class="tboxV">
					 			<s:property value="WAR_SRCC" />									 		
					 		</div>
					 	</div>
					 	<div class="textfield33V">
					 		<div class="textV">
					 			<s:text name="premiumInfo.originatingCountry"/>
					 		</div>
					 		<div class="tboxV">
					 			<s:property value="ORIGIN_COUNTRY" default="nil" />									 		
					 		</div>
					 	</div>
					 	<div class="textfield33V">
					 		<div class="textV">
					 			<s:text name="premiumInfo.designationCountry"/>
					 		</div>
					 		<div class="tboxV">
					 			<s:property value="DEST_COUNTRY" default="nil" />	 		
					 		</div>
					 	</div>
					 	<div class="textfield33V">
					 		<div class="textV">
					 			<s:text name="premiumInfo.currency"/>
					 		</div>
					 		<div class="tboxV">
					 			<s:property value="CURRENCY_NAME"/>(<s:property value="EXCHANGE_RATE"/>)		
					 		</div>
					 	</div>
					 	<div class="textfield33V">
					 		<div class="textV">
					 			<s:text name="premiumInfo.saleTermForValuation"/>
					 		</div>
					 		<div class="tboxV">
					 			<s:property value="SALES_TERM" default="nil" />							 		
					 		</div>
					 	</div>
					 	<div class="textfield33V">
					 		<div class="textV">
					 			<s:text name="premiumInfo.totalInsuredValue"/>
					 		</div>
					 		<div class="tboxV">
					 			<s:property value="getText(#format,{TOTAL_INSURED})" default="" />					 		
					 		</div>
					 	</div>
					 	<div class="textfield33V">
					 		<div class="textV">
					 			<s:text name="premiumInfo.equivalent"/>(<s:property value="#session.BrokerDetails.CurrencyAbb"/>)
					 		</div>
					 		<div class="tboxV">
					 			<s:property value="getText(#format,{EQUIVALENT})" default="nil" />									 		
					 		</div>
					 	</div>					 	
					 	<br class="clear" />
					</div>
				</div>
				<s:if test='Status=="N" || #session.user1 == "admin"'>
					<div class="panel panel-primary">
						<div class="panel-heading">
							<s:label key="premiumInfo.premiumInfo" />
						</div>
						<div class="panel-body">
							<table width="100%" class="footable">
								<tbody>
								<tr>
									<td width="25%"></td>
									<td width="25%"><s:label key="premiumInfo.marinePremium" />&nbsp;<s:property value="#session.BrokerDetails.CurrencyAbb"/></td>
									<td width="25%" align="right"><s:property value="getText(#format,{MARINE_PREMIUM})" default=" "/></td>
									<td width="25%"></td>
								</tr>
								<tr>
									<td align="right"><s:label key="premiumInfo.add" /></td>
									<td><s:label key="premiumInfo.warPremium" />&nbsp;<s:property value="#session.BrokerDetails.CurrencyAbb"/></td>
									<td align="right"><s:property value="getText(#format,{WAR_PREMIUM})" /></td>
									<td align="right"><s:property value="getText(#format,{TOTAL_PREMIUM})"/></td>
								</tr>
								<s:if test="#session.user1 == 'admin' || productId != openCover">
								<tr>
									<td></td>
									<td></td>
									<td><s:label key="premiumInfo.additionalPremium" />&nbsp;<s:property value="#session.BrokerDetails.CurrencyAbb"/></td>
									<td>
										<s:if test="hasActionErrors()">
											<s:textfield name="additionalPremium" readonly="true" cssClass="inputBox" cssStyle="text-align: right;" />                        
										</s:if>
										<s:else>
											<s:textfield name="additionalPremium"  value="%{#quotation.ADDITIONAL_PREMIUM}" readonly="true" cssClass="inputBox" cssStyle="text-align: right;" />                          
										</s:else>
									</td>
								</tr>
								</s:if>
								<s:else>
	                      			<s:hidden name="additionalPremium"  value="%{#quotation.ADDITIONAL_PREMIUM}"/>
	                      		</s:else>
								<tr>
									<td><s:label key="premiumInfo.add" /></td>
									<td><s:label key="premiumInfo.policyIssuanceFee" />&nbsp;<s:property value="#session.BrokerDetails.CurrencyAbb"/></td>
									<td>
										<s:if test='#session.user1 == "admin"'>
				                       		<s:label key="premiumInfo.editPolicyIssuanceFee" /><s:radio list="#{'Y':'Yes','N':'No'}" name="editPolicyFee" value="%{editPolicyFee==null?'N':editPolicyFee}" onclick="enable(this.value,'policyFee')"/>
				                       </s:if>
									</td>
									<td>
										<s:textfield name="policyFee" id="policyFee" value="%{#quotation.POLICY_ISSUNCE_FEE}" readonly='%{editPolicyFee=="Y"?"false":"true"}' cssClass="inputBox" cssStyle="text-align: right;" />
									</td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td><b><s:label key="premiumInfo.totalPremium" />	<s:property value="#session.BrokerDetails.CurrencyAbb"/></b></td>
									<td>
										<s:textfield name="netPremium"  value="%{#quotation.NET_PREMIUM}" readonly="true" cssClass="inputBox" cssStyle="text-align: right;" />
									</td>
								</tr>
								</tbody>
							</table>			 	
						 	<br class="clear" />
						</div>
					</div>
					
					<s:if test='Status=="N" || #session.user1 == "admin"'>
						<div class="panel panel-primary">
							<div class="panel-heading">
								<s:label key="premiumInfo.clausesInfo" />
							</div>
							<div class="panel-body">
								<s:if test='#session.user1 == "admin"'>
									<a type="button" class="btn btn-sm btn-info" href="#" onclick="viewPopUp('<%=request.getContextPath()%>/clausesPremium.action?quoteNo=<s:property value="%{#quotation.QUOTE_NUMBER}"/>&openCoverNo=<s:property value="openCoverNo"/>');"><s:label key="premiumInfo.editClauses"/></a> &nbsp;&nbsp;&nbsp;
									<a type="button" class="btn btn-sm btn-info" href="#" onclick="viewPopUp('<%=request.getContextPath()%>/addClausesPremium.action?quoteNo=<s:property value="%{#quotation.QUOTE_NUMBER}"/>&coverId=<s:property value="COVER_ID"/>&conditionType=1');"><s:label key="premiumInfo.addClauses"/></a> &nbsp;&nbsp;&nbsp;
									<a type="button" class="btn btn-sm btn-info" href="#" onclick="viewPopUp('<%=request.getContextPath()%>/addClausesPremium.action?quoteNo=<s:property value="%{#quotation.QUOTE_NUMBER}"/>&coverId=<s:property value="COVER_ID"/>&conditionType=2');"><s:label key="premiumInfo.addWarClauses"/></a> &nbsp;&nbsp;&nbsp;
									<a type="button" class="btn btn-sm btn-info" href="#" onclick="viewPopUp('<%=request.getContextPath()%>/addClausesPremium.action?quoteNo=<s:property value="%{#quotation.QUOTE_NUMBER}"/>&coverId=<s:property value="COVER_ID"/>&conditionType=3');"><s:label key="premiumInfo.addExclusions"/></a> &nbsp;&nbsp;&nbsp;
									<a type="button" class="btn btn-sm btn-info" href="#" onclick="viewPopUp('<%=request.getContextPath()%>/addClausesPremium.action?quoteNo=<s:property value="%{#quotation.QUOTE_NUMBER}"/>&coverId=<s:property value="COVER_ID"/>&conditionType=4');"><s:label key="premiumInfo.addWarranties"/></a>
								</s:if>
								<s:else>
									<div class="textfield50" align="center" style="padding-top: 5px;" style="height: 30px;">
										<s:label key="premiumInfo.viewClausesDesc"/> &nbsp;&nbsp;&nbsp;
										<%-- <a type="button" class="btn btn-sm btn-info" href="#" onclick="viewPopUp('<%=request.getContextPath()%>/clausesPremium.action?applicationNo=<s:property value="%{applicationNo}"/>');"><s:label key="premiumInfo.viewClauses"/></a> --%>
										<a type="button" class="btn btn-sm btn-info"  style="cursor: pointer" data-toggle="modal" data-target="#viewclausesModal" onclick="viewClause('<%=request.getContextPath()%>/clausesPremium.action?applicationNo=<s:property value="%{applicationNo}"/>&quoteNo=<s:property value="QUOTE_NUMBER"/>','viewclauseAjaxId');"><s:text name="premiumInfo.viewClauses"/></a>
									</div>
								</s:else>
							</div>
						</div>
					</s:if>
					
				</s:if>
				<s:elseif test='Status=="Y"'>
				<div class="panel panel-primary">
					<div class="panel-body">
						<div style="color:red;font-size: 15px;">
	     					<s:label key="premiumInfo.referralMsg"/> <s:property value="REFERRAL_DESC"/>										     				
	     				</div>
					</div>
				</div>
				</s:elseif>
				<s:if test='#session.user1 == "admin"'>
					<div class="panel panel-primary">
						<div class="panel-body">
							<div class="textfield33">
						 		<div class="text">
						 			<s:text name="premiumInfo.commissionYN"/>
						 		</div>
						 		<div class="tbox">
						 			<s:radio name="commissionYN" list="#{'YES':'Yes','NO':'No'}" value="%{commissionYN==null?'NO':commissionYN}" onclick="enable(this.value,'commission')" />
						 		</div>	
						 	</div>
						 	<div class="textfield33">
						 		<div class="text">
						 			<s:label key="premiumInfo.commission"/>
						 		</div>
						 		<div class="tbox">
						 			<s:textfield name="commission" id="commission" readonly='%{commissionYN=="YES"?"false":"true"}' cssClass="inputBox" />
						 		</div>	
						 	</div>
						 	<div class="textfield33">
						 		<div class="text">
						 			<s:label key="premiumInfo.referralStatus"/>
						 		</div>
						 		<div class="tbox">
						 			<s:radio name="referralStatus" list="#{'A':'Approve','R':'Reject','N':'None'}" value="%{referralStatus==null?'A':referralStatus}"/>
						 		</div>	
						 	</div>
						 	<div class="textfield50A">
						 		<div class="text">
						 			<s:label key="premiumInfo.remarks"/>
						 		</div>
						 		<div class="tbox">
						 			<s:textarea name="adminRemarks" onkeyup="textLimit(this,'450')" cssClass="inputBoxA" cssStyle="width: 100%;" />
						 		</div>	
						 	</div>
						 	<br class="clear" />
						</div>
					</div>
				</s:if>
			</div>
		</div>
		<br class="clear" />
		<div class="tablerow" align="center">
			<s:submit name="Submit2" type="submit" cssClass="btn btn-sm btn-danger" value="Back"  onclick="return update('initSearchReport.action')"/>&nbsp;&nbsp;&nbsp;
           	<%-- <s:if test='%{quoteStatus!="P"}'>
            	<s:submit name="Submit3" type="button" cssClass="btn btn-sm btn-warning" value="Edit" onclick="return editQuote()"/>&nbsp;&nbsp;&nbsp;
           	</s:if>
          	<s:if test='!"endt".equals(endtView)'>
          		<s:submit name="Submit" type="button" cssClass="btn btn-sm btn-primary" value="Proceed"  onclick="return update('policyInfoPremium.action')"/>
          	</s:if> --%>
		</div>
		<s:if test='!"endt".equals(endtView)'>
        	<s:hidden name="quoteNo" value="%{#quotation.QUOTE_NUMBER}"/>
            <s:hidden name="openCoverNo"/>    
        </s:if>
        <s:else>
        	<s:hidden name="quoteNo" />
            <s:hidden name="openCoverNo" value="%{#session.openCoverNo}" />
    	</s:else>   
    <s:hidden name="quoteStatus" value="%{quoteStatus}"/>    
    <s:hidden name="applicationNo"/>  
    <s:hidden name="loginId" />
    <s:hidden name="searchBy" />
    <s:hidden name="searchValue" />
    <s:hidden name="endtView" />
    <s:hidden name="policyNo" />
    <s:hidden name="menuType" />
    <s:hidden name="menuBlocker" />
    <s:token/>
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
	</s:form>
</div>
</s:iterator>
</body>
<script type="text/javascript">
function viewPopUp(URL) {
	var bwidth = window.innerWidth;
	var bwidth1 = document.body.clientWidth;
	if(bwidth <= 768) {
		return popUp(URL,bwidth1,'500');
	} else {
		return popUp(URL,'750','500');
	}
}

function update(actionPath) { 
	 var endtView= document.premiumInfo.endtView.value;
     if(endtView=="endt"){
        document.premiumInfo.menuType.value='E';
		document.premiumInfo.action = "<%=request.getContextPath()%>/initReport.action";
		document.premiumInfo.submit();
     }else{
	       	document.premiumInfo.action = '<%=request.getContextPath()%>/' + actionPath;
	    	document.premiumInfo.submit();
	    }
 	return false;
}
function editQuote() {
	document.premiumInfo.action = "<%=request.getContextPath()%>/editQuoteQuotation.action";
	document.premiumInfo.submit();
}
function viewClause(URL,id){
	 postRequest(URL, id); 
}
</script>
</html>