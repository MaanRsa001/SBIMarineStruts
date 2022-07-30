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
<body>
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
				<s:text name="Premium Computation" /><span style="float:right;"><s:text name="Proposal Number:" /><s:property value="proposalNo"/></span>
			</div>
			<div class="panel-body">
				<div class="row">
				<s:if test='endtYN!=null && "Y".equalsIgnoreCase(endtYN)'>
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						<div class="panel panel-primary">
							<div class="panel-heading">
								<s:text name="Transaction Details" />
							</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
													<table width="100%" class="table table-bordered" >
														<thead>
															<tr style="color:blue;">
																<th align="center"><s:text name="Proposal No"></s:text></th>
																<th align="center"><s:text name="Sum Insured"></s:text></th>
																<th align="center"><s:text name="Premium"></s:text></th>
																<th align="center"><s:text name="Inspection fee"></s:text></th>
																<th align="center"><s:text name="Policy Fee"></s:text></th>
																<th align="center"><s:text name="Total Premium"></s:text></th>
																<th align="center"><s:text name="Policy Fee Paid"></s:text></th>
																<th align="center"><s:text name="Inspection fee Paid"></s:text></th>
																<th align="center"><s:text name="Premium Paid"></s:text></th>
																<th align="center"><s:text name="Received Amount Till Date"></s:text></th>
																<th align="center"><s:text name="Balance Amount"></s:text></th>
																<th align="center"><s:text name="Debit / Credit"></s:text></th>
															</tr>
														</thead>
														<tbody>
															<s:iterator value="mopTransactionList" var="var"  status="stat">
																<tr>
																	<th align="left">
																		<s:property value="#var.ProposalNo"/>
																	</th>
																	<th align="left">
																		<s:property value="SumInsured"/>
																	</th>
																	<th align="left">
																		<s:property value="TotalPremium"/>
																	</th>
																	<th align="left">
																		<s:property value="#var.InspectionFee"/>
																	</th>
																	<th align="left">
																		<s:property value="PolicyFee"/>
																	</th>
																	<th align="left">
																		<s:property value="TotalMarinePremium"/>
																	</th>
																	<th align="left">
																		<s:property value="PolicyFeePaid"/>
																	</th>
																	<th align="left">
																		<s:property value="InspectionFeePaid"/>
																	</th>
																	<th align="left">
																		<s:property value="PayablePremium"/>
																	</th>
																	<th align="left">
																		<s:property value="PremiumReceived"/>
																	</th>
																	<th align="left">
																		<s:property value="Premium"/>
																	</th>
																	<td align="center">
																		<s:if test='!"Y".equalsIgnoreCase(EndtStatus) && CreditNoteNo!=null && DebitNoteNo!=null'>
																			<s:if test='CreditNoteNo!=null && !"".equalsIgnoreCase(DebitNoteNo)'>
																				<a href="#" title="Debit" class="two" onclick="return viewDoc('<s:property value="%{#var.MissippiOpenCoverNo}"/>','<s:property value="%{#session.user}" />','debit','<s:property value="%{#var.CreditNoteNo}"/>','','<s:property value="%{#var.ProposalNo}"/>','<s:property value="%{#var.EndtStatus}"/>');" > <b>Debit</b></a>&nbsp;&nbsp;
																			</s:if>
																			<s:if test='DebitNoteNo!=null && !"".equalsIgnoreCase(DebitNoteNo)'>
																				<a href="#" title="Credit" class="two" onclick="return viewDoc('<s:property value="%{#var.MissippiOpenCoverNo}"/>','<s:property value="%{#session.user}" />','credit','<s:property value="%{#var.DebitNoteNo}"/>','','<s:property value="%{#var.ProposalNo}"/>','<s:property value="%{#var.EndtStatus}"/>');" > <b>/Credit</b></a>&nbsp;&nbsp;
																			</s:if>
																		</s:if>
																		<s:else>
																			N/A
																		</s:else>
														             </td>
																</tr>
															 </s:iterator> 
														</tbody>
													</table>							
										</div>
									
								</div>
								<br/>
							</div>
						</div>
					</div>
					</s:if>
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
									<table width="100%" class="table table-bordered" >
										<thead>
											<tr style="color:blue;">
												<th width="20%" align="center"><s:text name="Total Sum Insured"></s:text></th>
												<th width="20%" align="center"><s:text name="Marine Rate"></s:text></th>
												<th width="20%" align="center"><s:text name="War Rate"></s:text></th>
												<th width="20%" align="center"><s:text name="Received Deposit Premium"></s:text></th>
												<%-- <th width="20%" align="center"><s:text name="Utilized Premium"></s:text></th> --%>
												
											</tr>
										</thead>
										<tbody>
											<%-- <s:iterator value="modewarRateList" var="list"  status="stat"> --%>
												<tr>
													<th align="left">
														<s:property value="psuminsured"/>
													</th>
													<th align="left">
														<s:property value="pmarineRate"/>
													</th>
													<th align="left">
														<s:property value="pwarRate"/>
													</th>
													<th align="left">
														<s:property value="balanceDepositPremium"/>
													</th>
													<%-- <th align="left">
														<s:property value="utilizedPremium"/>
													</th> --%>
												</tr>
											<%-- </s:iterator> --%>
										</tbody>
									</table>							
						</div>
					
				</div>
				<br/>
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
									<table width="100%" class="table table-bordered" >
									<thead>
										<tr>
											
											<th></th>
											<th>Premium</th>
											<th>Policy Fee</th>
											<th>Inspection Fee</th>
											<th>Total</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>Actual</td>
											<td ><s:textfield name="totalPremium" id="totalPremium"  class="inputBox" style="text-align: right;" maxlength="15" readonly="true"></s:textfield>
											 <s:hidden  name="actualPremium" id="actualPremium"/> </td>
											<td><s:textfield name="policyFee" id="policyFee"  class="inputBox" style="text-align: right;" maxlength="15"   onkeyup="this.value=numberComma(this.value);funActualTotal()" readonly='!"Y".equals(refundChrgYN)'/></td>
											<td ><s:textfield name="inceptionFee" id="inceptionFee" class="inputBox" style="text-align: right;" maxlength="15"  onkeyup="this.value=numberComma(this.value);funActualTotal()" readonly='!"Y".equals(refundChrgYN)'/></td>
											<td ><s:textfield name="finalPremium" id="finalPremium"  class="inputBox" style="text-align: right;" maxlength="15"  readonly='true'/></td>
										</tr>
										<tr>
											<td>Received Payment</td>
											<td ><s:textfield name="receviedAmt" id="receviedAmt"  class="inputBox" style="text-align: right;" maxlength="15" readonly="true"/></td>
											<td ><s:textfield name="policyFeeRcvd" id="policyFeeRcvd"  class="inputBox" style="text-align: right;" maxlength="15" readonly="true"/></td>
											<td ><s:textfield name="inceptionFeeRcvd" id="inceptionFeeRcvd" class="inputBox" style="text-align: right;" maxlength="15" readonly="true"/></td>
											<td ><s:textfield name="premiumRcvd" id="premiumRcvd"   class="inputBox" style="text-align: right;" maxlength="15" readonly="true"/></td>
										</tr>
										<tr>
											<td>Balance</td>
											<td ><s:textfield name="balanceAmt" id="balanceAmt"  class="inputBox" style="text-align: right;" maxlength="15" readonly="true"/></td>
											<td ><s:textfield  name="policyFeeBal" id="policyFeeBal" class="inputBox" style="text-align: right;" maxlength="15" readonly="true"/></td>
											<td ><s:textfield name="inceptionFeeBal" id="inceptionFeeBal"  class="inputBox" style="text-align: right;" maxlength="15" readonly="true"/></td>
											<td ><s:textfield name="receviedTot" id="receviedTot"  class="inputBox" style="text-align: right;" maxlength="15" readonly="true"/></td>
										</tr>
										<tr>
											<td colspan="1">Are You Want?</td>
											<td colspan="4">
												<s:radio  name="chargeableYN" id="chargeableYN" list="#{'C':'Chargeable','R':'Refund'}" onclick="toggleChargeable();" value="(chargeableYN==null ||chargeableYN=='')?'C':chargeableYN"/>
											</td>
										</tr>
										<tr>
											<td>Received/Refund</td>
											<td ><s:textfield name="refundAmt" id="PremiumPaid"  class="inputBox"  style="text-align: right;" maxlength="20"  onkeyup="this.value=numberComma(this.value);funTotal();" readonly='!"Y".equals(refundChrgYN)'/></td>
											<td ><s:textfield name="policyFeePaid" id="policyFeePaid"   class="inputBox"  style="text-align: right;" maxlength="20"  onkeyup="this.value=numberComma(this.value);funTotal();" readonly='!"Y".equals(refundChrgYN)'/></td>
											<td><s:textfield  name="inceptionFeePaid" id="inceptionFeePaid"    class="inputBox"  style="text-align: right;" maxlength="20" onkeyup="this.value=numberComma(this.value);funTotal();" readonly='!"Y".equals(refundChrgYN)'/></td>
											<td ><s:textfield name="total" id="total"  class="inputBox"    style="text-align: right;" maxlength="20" onkeyup="this.value=numberComma(this.value);" readonly="true"/></td>
										</tr>
									</tbody>
								</table>							
						</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<br/>
			<div class="row" align="center">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<input type="button" value="Back" onclick="backBtn();" class="btn btn-sm btn-danger">&nbsp;&nbsp;&nbsp;
					<input type="button" value="Calculate" onclick="CalculateBtn();" class="btn btn-sm btn-primary">&nbsp;&nbsp;&nbsp;
					<input type="button" value="Proceed" onclick="proceedBtn();" class="btn btn-sm btn-success">
				</div>
			</div>
			<br/>
		</div>
	</div>
	
	
</div>
<s:hidden name="refundChrgYN" id="refundChrgYN"/>
<s:hidden name="endtStatus" id="endtStatus"/>			
<s:hidden name="proposalNo" id="proposalNo"/>
<s:hidden name="endtYN" id="endtYN"/>

<s:token/>
</s:form>
<script type="text/javascript">

function backBtn(){
	document.Quotation.action = 'getCommodityRateInfoOpenCover.action';
	document.Quotation.submit();
}
function proceedBtn(){
	replaceComma(document.forms['Quotation'],'balanceAmt,suminsured,marinePremium,warPremium,totalPremium,inceptionFee,policyFee,finalPremium,premiumRcvd,inceptionFeeRcvd,policyFeeRcvd,finalPremium,Premium,inceptionFeeBal,policyFeeBal,receviedAmt,PremiumPaid,inceptionFeePaid,policyFeePaid,refundAmt');
	disableForm(Quotation,false,'');
	document.Quotation.action = 'policygenerateOpenCover.action';
	document.Quotation.submit();
}
function CalculateBtn(){
	replaceComma(document.forms['Quotation'],'balanceAmt,suminsured,marinePremium,warPremium,totalPremium,inceptionFee,policyFee,finalPremium,premiumRcvd,inceptionFeeRcvd,policyFeeRcvd,finalPremium,Premium,inceptionFeeBal,policyFeeBal,receviedAmt,PremiumPaid,inceptionFeePaid,policyFeePaid,refundAmt');
	disableForm(Quotation,false,'');
	document.Quotation.action = 'calculatepremiumOpenCover.action';
	document.Quotation.submit();
}

function addCommaval(){
	
	addComma(document.forms['Quotation'],'balanceAmt,suminsured,receviedTot,marinePremium,warPremium,totalPremium,inceptionFee,policyFee,finalPremium,premiumRcvd,inceptionFeeRcvd,policyFeeRcvd,finalPremium,Premium,inceptionFeeBal,policyFeeBal,receviedAmt,PremiumPaid,inceptionFeePaid,policyFeePaid,refundAmt');
	funTotal();
	funActualTotal();
}
function funTotal(){		
	var refundAmt,policyFeePaid,inceptionFeePaid;
	try{ 
		refundAmt=document.getElementById('PremiumPaid').value;
		if(refundAmt.length>0)
			refundAmt=refundAmt.replace(new RegExp(',','g'),'');
		else
			refundAmt="0";
			
		policyFeePaid=document.getElementById('policyFeePaid').value;	
	 	if(policyFeePaid.length>0)
			policyFeePaid=policyFeePaid.replace(new RegExp(',','g'),'');
		else
			policyFeePaid="0";
	 
	 	inceptionFeePaid=document.getElementById('inceptionFeePaid').value;
	  	if(inceptionFeePaid.length>0)
			inceptionFeePaid=inceptionFeePaid.replace(new RegExp(',','g'),'');
		else
			inceptionFeePaid="0";			 
		
	}catch (e) { console.log(e);}
	
	var total=parseFloat(refundAmt)+parseFloat(policyFeePaid)+parseFloat(inceptionFeePaid);	 
	document.getElementById('total').value=total;
	addComma(document.forms['Quotation'],'balanceAmt,suminsured,receviedTot,marinePremium,warPremium,totalPremium,inceptionFee,policyFee,finalPremium,premiumRcvd,inceptionFeeRcvd,policyFeeRcvd,finalPremium,Premium,inceptionFeeBal,policyFeeBal,receviedAmt,PremiumPaid,inceptionFeePaid,policyFeePaid,refundAmt');
	
}
function funActualTotal(){		
	var preAmt,policyFee,inceptionFee;
	var policyFeeBal,inceptionFeeBal,receviedTot;
	var policyFeeRcvd,inceptionFeeRcvd,premiumRcvd;
	try{ 
		preAmt=document.getElementById('totalPremium').value;
		if(preAmt.length>0)
			preAmt=preAmt.replace(new RegExp(',','g'),'');
		else
			preAmt="0";
			
		policyFee=document.getElementById('policyFee').value;	
	 	if(policyFee.length>0)
			policyFee=policyFee.replace(new RegExp(',','g'),'');
		else
			policyFee="0";
	 
	 	inceptionFee=document.getElementById('inceptionFee').value;
	  	if(inceptionFee.length>0)
			inceptionFee=inceptionFee.replace(new RegExp(',','g'),'');
		else
			inceptionFee="0";	
		
		
		// start Balnce amt calculation js
		policyFeeBal=document.getElementById('policyFeeBal').value;
		if(policyFeeBal.length>0)
			policyFeeBal=policyFeeBal.replace(new RegExp(',','g'),'');
		else
			policyFeeBal="0";
		inceptionFeeBal=document.getElementById('inceptionFeeBal').value;
		if(inceptionFeeBal.length>0)
			inceptionFeeBal=inceptionFeeBal.replace(new RegExp(',','g'),'');
		else
			inceptionFeeBal="0";
		receviedTot=document.getElementById('receviedTot').value;
		if(receviedTot.length>0)
			receviedTot=receviedTot.replace(new RegExp(',','g'),'');
		else
			receviedTot="0";
		policyFeeRcvd=document.getElementById('policyFeeRcvd').value;
		if(policyFeeRcvd.length>0)
			policyFeeRcvd=policyFeeRcvd.replace(new RegExp(',','g'),'');
		else
			policyFeeRcvd="0";
		inceptionFeeRcvd=document.getElementById('inceptionFeeRcvd').value;
		if(inceptionFeeRcvd.length>0)
			inceptionFeeRcvd=inceptionFeeRcvd.replace(new RegExp(',','g'),'');
		else
			inceptionFeeRcvd="0";
		premiumRcvd=document.getElementById('premiumRcvd').value;
		if(premiumRcvd.length>0)
			premiumRcvd=premiumRcvd.replace(new RegExp(',','g'),'');
		else
			premiumRcvd="0";	
		
		// End Balnce amt calculation js
			

		
	}catch (e) { console.log(e);}
	try{
		var total=parseFloat(preAmt)+parseFloat(policyFee)+parseFloat(inceptionFee);
		var polFee=parseFloat(policyFee)-parseFloat(policyFeeRcvd); 
		var incFee=parseFloat(inceptionFee)-parseFloat(inceptionFeeRcvd);
		var totFee=total-parseFloat(premiumRcvd);
		document.getElementById('finalPremium').value=total;
		document.getElementById('policyFeeBal').value=polFee;
		document.getElementById('inceptionFeeBal').value=incFee;
		document.getElementById('receviedTot').value=totFee;
		}catch (e) { console.log(e);}
		addComma(document.forms['Quotation'],'balanceAmt,receviedTot,suminsured,marinePremium,warPremium,totalPremium,inceptionFee,policyFee,finalPremium,premiumRcvd,inceptionFeeRcvd,policyFeeRcvd,finalPremium,Premium,inceptionFeeBal,policyFeeBal,receviedAmt,PremiumPaid,inceptionFeePaid,policyFeePaid,refundAmt');
		
		
}

toggleChargeable();
function toggleChargeable() {
	//document.getElementById('PremiumPaid').disabled = false;
}
function numberComma(Num){//Not allow any decimal value
	Num = Num.replace(/[^,0-9,]/g,'');
	  Num += '';
	  
    Num = Num.replace(/,/g, '');
    x = Num.split('.');
    x1 = x[0];
    x2 = x.length > 1 ? '.' + x[1] : '';
    var rgx = /(\d+)(\d{3})/;
    while (rgx.test(x1))
    x1 = x1.replace(rgx, '$1' + ',' + '$2');
    return x1 + x2;
}
</script>	
</body>
</html>