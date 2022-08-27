<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<!-- <link href="https://fonts.googleapis.com/css?family=Alegreya+Sans|Amiri|Cormorant+Garamond&display=swap" rel="stylesheet">-->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<!-- <link href="<%=request.getContextPath()%>/pages/font-awesome-JA/font-awesome.css" rel="stylesheet" type="text/css">-->

<script language="JavaScript">javascript:window.history.forward(1);</script>
<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap-multiselect.js" type="text/javascript"></script>
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
<s:form id="Quotation" name="Quotation" method="post" theme="simple">
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<s:actionerror cssStyle="color: red;" />
	</div>
</div>
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="label.newopencoverinfo" />
			</div>
			<div class="panel-body">
			 	<div class="row">
			 		<s:if test='"admin".equalsIgnoreCase(#session.usertype)'>
				 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							<div class="text">
							<s:if test='"Y".equals(renewalYN)'>
								<s:text name="Do You want to Renew Open Cover?" /><font color="red">*</font>
							</s:if>
							<s:else>
								<s:text name="Do You want to Generate Open Cover?" /><font color="red">*</font>
							</s:else>
					 			
					 		</div>
					 		<div class="tbox">
								<s:radio list="#{'Y':'Yes','N':'No'}" name="opencovergenerate" id="opencovergenerate" value="%{opencovergenerate==null || opencovergenerate==''?'N':opencovergenerate}"  onclick="toggleDisplay('',this.value);checkNo(this.value)"/>
							</div>
							<s:hidden name="renewalYN" id="renewalYN"/>
							<s:hidden name="endtYN" id="endtYN"/>
						</div>
					</s:if>
					<s:else>
						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							<div class="text">
								<s:text name="Are you finalizing this Proposal?" /><font color="red">*</font>
					 		</div>
					 		<div class="tbox">
								<s:radio list="#{'A':'Yes','N':'No'}" name="opencovergenerate" id="opencovergenerate" value="%{opencovergenerate==null || opencovergenerate==''?'N':opencovergenerate}"  onclick="checkNo(this.value)" />
							</div>
							<s:hidden name="renewalYN" id="renewalYN"/>
							<s:hidden name="endtYN" id="endtYN"/>
						</div>
					</s:else>
			 		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
						<div class="text">
				 			<s:text name="Policy Effective Date" />
				 		</div>
				 		<div class="tbox">
							<s:textfield name="policyeffectiveDate" id="policyeffectiveDate" cssClass="inputBox datepicker tooltipContent" data-content="Open Cover Start Date"  />
						</div>
					</div>
					<s:hidden name="deposit" id="deposit" value="%{deposit==null || deposit==''?'N':deposit}"/>
					<s:hidden name="marinePremium" id="marinePremium"/>
					<s:hidden name="warPremium" id="warPremium"/>
					<s:hidden name="vatTax" id="vatTax"/>
					<s:if test='"12".equalsIgnoreCase(type) ||"13".equalsIgnoreCase(type)'>
					<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4" >
						<div class="text">
							<s:text name="Installment" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
							<s:select list="installmentList" name="installType" id="installType" headerKey="" headerValue="--Select--" listKey="CategoryDetailId" listValue="DetailName" style="width:315px" class="inputBoxS tooltipContent tooltipContent"></s:select>
						</div>
					</div> 
					<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" >
							<div class="text">
								<s:text name="Remarks" /><font color="red">*</font>
					 		</div>
					 		<div class="tbox">
								<s:textarea rows="3" name="remarks" cols="55" style="width: 100%;" onkeyup="textLimit(this,1000)"/>
							</div>
						</div>
					</s:if>
					<%-- <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4" id="DebitInfo">
						<div class="text">
							<s:text name="Deposit Premium" /><font color="red">*</font>
				 		</div>
				 		<div class="tbox">
							<s:radio list="#{'Y':'Yes','N':'No'}" name="deposit" id="deposit" value="%{deposit==null || deposit==''?'N':deposit}" onclick="toggleDisplay('DepositInfo', this.value);toggleDisplay('DebitNameInfo', this.value)" disabled="true"/>
						</div>
					</div> --%>
			 	</div>
			 	<%-- <div class="row">
			 	<br/>
			 	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			 		<div id="DepositInfo" style="display:none;">
						<div id="existingDeposit" style="display:none;">
							<table width="100%" class="table table-bordered" >
								<tr>
									<td width="25%" style="padding: 5px;">
										Existing Deposit
									</td>
									<td width="75%" style="padding: 5px;">
										<table width="100%" class="table table-bordered" >
											<thead>
											<tr style="color:blue;">
												<th width="33%">Deposit Date</th>
												<th width="33%">DN No.</th>
												<th width="33%">CN No.</th>
											</tr>
											</thead>
											<tbody>
											<tr>
												<td align="center"><s:textfield id="depositDate" name="depositDate"  size="25" class="inputBox datepicker" /></td>
												<td align="center"><s:textfield name="debitNoteNo" id="debitNoteNo"   class="inputBox" maxlength="15"/></td>
												<td align="center"><s:textfield name="creditNoteNo" id="creditNoteNo"   class="inputBox" maxlength="15"/></td>
											</tr>
											</tbody>
										</table>					
									</td>
								</tr>			
							</table>
						</div>
						<div id="newDeposit" style="display:none;">
						<table width="100%" class="table table-bordered" >
							<tr>
								<td  width="25%" style="padding: 5px;">
									Type of Deposit
								</td>
								<td width="75%" style="padding: 5px;">
									<s:select list="depositList" name="depositType" id="depositType"  headerKey="" headerValue="--Select--" listKey="CategoryDetailId" listValue="DetailName" style="width:315px" class="inputBoxS tooltipContent tooltipContent" onchange="toggleDisplay('InstallInfo', this.value)"></s:select>
								</td>
							</tr>
						</table>
						<table width="100%" class="table table-bordered" id="InstallInfo">		
							<tr>
								<td  width="25%" style="padding: 5px;">
									Installment
								</td>
								<td  width="75%" style="padding: 5px;">
									<s:select list="installmentList" name="installType" id="installType" headerKey="" headerValue="--Select--" listKey="CategoryDetailId" listValue="DetailName" style="width:315px" class="inputBoxS tooltipContent tooltipContent"></s:select>
								</td>
							</tr>
						</table>
						<table width="100%" class="table table-bordered" >
							<tr>
								<td width="25%" style="padding: 5px;">
									Deposit Amount
								</td>
								<td width="75%" style="padding: 5px;">
									<table width="100%" class="table table-bordered" >
										<thead>
										<tr style="color:blue;">
											<th width="33%">Premium</th>
											<th width="33%">Policy Fee</th>
											<th width="33%">VAT Tax </th>
										</tr>
										</thead>
										<tbody>
										<tr>
											<td align="center"><s:textfield name="marinePremium" id="marinePremium"  onchange="vatCalc()" cssClass="inputBox" readonly='"12".equals(openCoverType)'/></td>
											<td align="center"><s:textfield name="warPremium" id="warPremium"   onchange="vatCalc()" maxlength="15"  cssClass="inputBox" readonly='"12".equals(openCoverType)'/></td>
											<td align="center"><s:textfield name="vatTax" id="vatTax"    readonly="true" maxlength="15" class="inputBox"/></td>
											
										</tr>
										</tbody>
									</table>					
								</td>
							</tr>
						</table>
						</div>
						<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" >
							<div class="text">
								<s:text name="Remarks" /><font color="red">*</font>
					 		</div>
					 		<div class="tbox">
								<s:textarea rows="3" name="remarks" cols="55" style="width: 100%;" onkeyup="textLimit(this,1000)"/>
							</div>
							<br/>
							<br/>
						</div>
						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4" id="DebitNameInfo" style="display:none">
							<div class="text">
								<s:text name="Debit note in the name of" /><font color="red">*</font>
					 		</div>
					 		<div class="tbox">
								<s:radio list="#{'B':'Broker','A':'Assured'}" name="debitNoteName" id="debitNoteName" value="%{debitNoteName==null || debitNoteName==''?'B':debitNoteName}"  />
							</div>
						</div>
					</div>
					</div>
				</div>
			 	</div> --%>
			</div>
		</div>
	</div>
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="Conveyance" />
			</div>
			<div class="panel-body">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<s:iterator value="conveyanceList" var="list"  status="stat">
					<table width="100%" class="table table-bordered" >
							<tr>
								<td width="25%" style="padding: 5px;">
									<s:property value="#list.TransportDescription"/>
								</td>
								<td class="formtxtf1" width="75%" style="padding: 5px;">
								<s:hidden name="transportId[%{#stat.index}]" id="transportId[%{#stat.index}]" value="%{#list.ModeTransportId}"/>
									<s:textarea rows="3" name="conveyanceDesc[%{#stat.index}]"  cols="55" onkeyup="textLimit(this,1000)" value="%{#list.Conveyance}"></s:textarea>
								</td>
							</tr>
						</table>
					</s:iterator>
					<%-- <div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					 		<div class="tbox">
								<s:textfield name="cancelClaus" id="cancelClaus" maxlength="15" onkeyup="checkNumbers(this)" cssClass="inputBox"/>
							</div>
						</div>
						
					</div>	 --%>
				 </div>
				
			</div>
		</div>
	</div>
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="Print in Schedule" />
			</div>
			<div class="panel-body">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							<div class="text">
								<s:text name="Cancellation Clauses" /><font color="red">*</font>
					 		</div>
					 		<div class="tbox">
								<s:textfield name="cancelClaus" id="cancelClaus" maxlength="15" onkeyup="checkNumbers(this)" cssClass="inputBox"/>
							</div>
						</div>
						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							<div class="text">
								<s:text name="Schedule" /><font color="red">*</font>
					 		</div>
					 		<div class="tbox">
								<s:radio list="#{'Y':'Rate','N':'As Agreed'}" name="ratesYN" id="ratesYN" value="%{ratesYN==null || ratesYN==''?'N':ratesYN}"  />
							</div>
						</div>
						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							<div class="text">
								<s:text name="Do You want to print Amended Insolvency Exclusion Clause" /><font color="red">*</font>
					 		</div>
					 		<div class="tbox">
								<s:radio list="#{'Y':'Yes','N':'No'}" name="amendedClauseYN" id="amendedClauseYN" value="%{amendedClauseYN==null || amendedClauseYN==''?'N':ratesYN}"  />
							</div>
						</div>
						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							<div class="text">
								<s:text name="PPW days" /><font color="red">*</font>
					 		</div>
					 		<div class="tbox">
								<s:textfield name="ppwdays"  maxlength="3" onkeyup="checkNumbers(this)"  class="inputBox"/>
							</div>
						</div>
<%-- 						<s:if test='"11".equalsIgnoreCase(type) ||"13".equalsIgnoreCase(type)'> --%>
						
<%-- 						</s:if> --%>
					</div>
				 </div>
				
			</div>
		</div>
	</div>
	
	<%-- <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="Share Percentage Info" />
			</div>
			<div class="panel-body">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						
					
				 </div>
				
			</div>
		</div>
	</div>
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="Share Percentage Info" />
			</div>
			<div class="panel-body">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
						
					
				 </div>
				
			</div>
		</div>
	</div> --%>
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

<s:token/>
<s:hidden name="proposalNo"  />
<s:hidden name="openCoverType" id="openCoverType" value="%{openCoverTypeS}"/>
<s:hidden name="type"/>
<s:hidden name="vatTaxPrecent"/>
<s:hidden name="depositPremiumType"/>

</s:form>
<script type="text/javascript">
$(function() {
	$('#policyeffectiveDate').datetimepicker({
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
$(function() {
	$('#depositDate').datetimepicker({
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
	var opencoverType=document.getElementById("openCoverType").value;
	if(opencoverType=='12' || opencoverType=='13'){
		document.Quotation.action = 'depositInfoOpenCover.action';
	}else{
		document.Quotation.action = 'getCommodityRateInfoOpenCover.action';
	}
	document.Quotation.submit();
}
function proceedBtn(){
	document.Quotation.action = 'convertPolicyOpenCover.action';
	document.Quotation.submit();
}
function toggleDisplay(element, val) 
{	
	if(val=='O')
	{ 
		document.getElementById(element).style.display="block";
		document.getElementById('existingDeposit').style.display="block";
		document.getElementById('newDeposit').style.display="none";
		document.getElementById('depositType').value='';
	}
	else if( val=='Y' )
	{	
		document.getElementById(element).style.display="block";
		document.getElementById('newDeposit').style.display="block";
		document.getElementById('existingDeposit').style.display="none";
		document.getElementById('PolicyFee').style.display="none";
		document.getElementById('depositDate').value='';
		
	}else if(val=='5'){
		document.getElementById(element).style.display="block";
		
	}else
	{
		if(element!='InstallInfo'){
			document.getElementById(element).style.display="none";
			document.getElementById('PolicyFee').style.display="block";
		}
		document.getElementById('depositDate').value='';
		
	}
	return false;
}
function checkNo(val) 
{
	if(val=='N')
	{
		document.getElementById('depositY').checked=false;
		document.getElementById('depositN').checked=true;
	}
	return false;
}
function toggleDisplayTemp(element, val) 
{	
 if(val=='Y')
	{
		document.getElementById('depositY').checked=true;
	}
 if(val=='O')
	{
		document.getElementById('depositO').checked=true;
	}
toggleDisplay(element,val)
}
function vatCalc(){
	  var vatTaxPre='<s:property value="vatTaxPrecent"/>';
	  var marinePre=0;
	  var policyFee=0;
	  var vatTaxAmt=0;
	  marinePre=document.getElementById('marinePremium').value;
	  policyFee=document.getElementById('warPremium').value;
	  if(marinePre==null ){
	 	marinePre=0;
	  }
	  if(policyFee==null){
	 	policyFee=0;
	  }
	  //alert(parseFloat(marinePre)+parseFloat(policyFee));
	  vatTaxAmt=((parseFloat(marinePre)+parseFloat(policyFee)) * parseFloat(vatTaxPre))/100;
	  document.getElementById('vatTax').value=vatTaxAmt;
}
function vatCalc1(val){
	//alert(val);
	  var vatTaxPre='<s:property value="vatTaxPrecent"/>';
	  var policyFee=0;
	  var vatTaxAmt=0;
	  policyFee=val;
	 
	  if(policyFee==null || policyFee==''){
	 	policyFee=0;
	  }
	 // alert(policyFee);
	 // alert(vatTaxPre);
	  //alert(parseFloat(marinePre)+parseFloat(policyFee));
	  vatTaxAmt=(parseFloat(policyFee)*parseFloat(vatTaxPre))/100;
	  //alert(vatTaxAmt);
	  document.getElementById('vatTax').value=vatTaxAmt;
}
if('<s:property value="deposit"/>'==null || '<s:property value="deposit"/>'==''){
	//toggleDisplay("DebitInfo", 'N');
}else{
	//toggleDisplay("DebitInfo", '<s:property value="deposit"/>');
}

<s:if test="openCoverNo!=null && openCoverNo.lenght()>0">
toggleDisplay("DebitInfo", "Y");
</s:if>
<s:if test='"Y".equalsIgnoreCase(depositPremiumType)'>
//toggleDisplay("DebitInfo", 'Y');
	 <s:if test='!"".equalsIgnoreCase(depositType) && depositType!=null'>
		 toggleDisplayTemp('DepositInfo', 'Y');
		 <s:if test='"5".equalsIgnoreCase(installType) && installType!=null'>
		 	toggleDisplay('InstallInfo', 'Y');
		 </s:if>
	 </s:if>
</s:if>
<s:elseif test='"Y".equalsIgnoreCase(deposit)'>
toggleDisplayTemp('DepositInfo', 'Y');
</s:elseif>
<s:elseif test='"N".equalsIgnoreCase(deposit)'>
toggleDisplayTemp('DepositInfo', 'N');
</s:elseif>
<s:else>
toggleDisplayTemp('DepositInfo', 'N');
</s:else>
<s:if test='!"Y".equalsIgnoreCase(depositPremiumType)'>
vatCalc1('<s:property value="policyFee"/>');
</s:if>
<%-- <%if(!"Y".equalsIgnoreCase(depositeData[0][0])){%>
	vatCalc1(<%=result[0][19]%>);
<%}%> --%> 

</script>	
</body>
</html>