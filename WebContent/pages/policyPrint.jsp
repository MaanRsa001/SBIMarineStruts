<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<!DOCTYPE HTML>
<html>
<head>     
</head>
<body>
<s:form name="report" theme="simple" action="initReport.action?menuType=P">
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<s:actionerror cssStyle="color: red;" />
	</div>
</div>
<br/>
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:text name="declaration.%{menuType}" />
			</div>
			<div class="panel-body">
				<s:if test='menuType=="PP"'>
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							<div class="text"> <s:text name="declaration.startDate" /> </div>
							<div class="tbox">
								<s:textfield name="policyStartDate" id="policyStartDate1" cssClass="inputBox datepicker" readonly="true"/>
							</div>
						</div>
						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							<div class="text"> <s:text name="Choose Policy" /> </div>
							<div class="tbox">
								<s:radio list="#{'B':'Broker','I':'Operational User','ALL':'Both'}" name="policyMode" id="policyMode" onchange="hideInfo()" value="%{policyMode==null?'ALL':policyMode}" ></s:radio>
							</div>
						</div>
						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4" align="center">
							<br/>
							<s:submit type="submit" name="submit" key="Submit" onclick="getInfo()" cssClass="btn btn-sm btn-success"/>
						</div>
					</div>
				</s:if>
				<s:if test="policyInfoList!=null && policyInfoList.size()>0">
				<br/><br/>
				<div id="polInfo">
					<table width="100%" border="0" bordercolor="#F2F2F2" align="center" cellpadding="4" cellspacing="0">
						<s:iterator value="policyInfoList" status="status" var="REC" >
							<tr>
								<td class="bg" width="100%" >
									<table width="100%">
										<tbody>
										<tr>
											<td width="20%">Date</td>
											<td width="30%"><b><s:property value="%{#REC.INCEPTION_DATE}"/></b></td>
											<td width="20%">Open cover No</td>
											<td width="30%"><b><s:property value="%{#REC.OPEN_COVER_NO}"/></b></td>
										</tr>
										<tr><td colspan="4" height="5"></td></tr>
										<tr>
											<td width="20%">Customer Name</td>
											<td width="30%"><b><s:property value="%{#REC.CUSTOMER_NAME}"/></b></td>
											<td width="20%">No of Records</td>
											<td width="30%"><b><s:property value="%{#REC.TOTAL_POLICY}"/></b></td>
										</tr>
										</tbody>
									</table>
					            </td>
							</tr>	
							<s:hidden name="incpDate" id="incpDate" value="%{#REC.INCEPTION_DATE}"/>		
						</s:iterator>
				        </table>
				        <br class="clear" />
				        <div align="center">
				        	<s:submit type="button" onclick="schedule('WL');" cssClass="btn btn-sm btn-info" value=" Schedule With LetterHead" /> &nbsp;&nbsp;&nbsp;
				        	<s:submit type="button" onclick="schedule('WOL');" cssClass="btn btn-sm btn-info" value="Schedule Without LetterHead" />
				        </div>
				</div>
			</s:if>
			<s:else>
				<br/><br/>
				<div id="polInfo" align="center">
					No Records Found
				</div>
			</s:else>
			<s:hidden name="menuType" />
			</div>
		</div>
	</div>
</div>  
   <s:hidden name="tranId"/>
   <s:hidden name="vessel"/>
   <s:hidden name="supplier"/>
   <s:hidden name="reqFrom"/>
   
 </s:form>
 <s:form name="report1" theme="simple" action="initDeclaration.action">
 	<s:hidden name="tranId" id="tranId1"/>
   	<s:hidden name="vessel" id="vessel1"/>
   	<s:hidden name="supplier" id="supplier1"/>
   	<s:hidden name="menuType" id="menuType1"/>
   	<s:hidden name="reqFrom" id="reqFrom1"/>
   	<s:hidden name="loginId" id="loginId1"/>
   	<s:hidden name="productId" id="productId1"/>
 </s:form>

</body>
<script type="text/javascript">
function disablePolicyDetail(obj){
   	var displayStatus=obj.value;   
	if(displayStatus=="N")
		document.getElementById('getPolicyDetail').style.display='none';
	else
		document.getElementById('getPolicyDetail').style.display='block';
}

function declaration(tranId){
	document.report.tranId.value=tranId;
	document.report.action = "<%=request.getContextPath()%>/showMultipleQuotes.jsp";
	document.report.submit();
}

function forward(menuType){
	if(menuType=='D'){
		document.report.tranId.value='';
		document.report.reqFrom.value='';
	}else if(menuType=='KD'){
		menuType='D';
		document.report.reqFrom.value='result';
		document.report.vessel.value='';
		document.report.supplier.value='';
	}	 
	document.report.action = "<%=request.getContextPath()%>/initDeclaration.action?menuType="+menuType;
	document.report.submit();
}

function update(menuType){
	document.report.action = "<%=request.getContextPath()%>/updateDeclaration.action?menuType="+menuType;
	document.report.submit();
}

function getVesselDeclare(vessel, transid, supplier){
	document.getElementById('tranId1').value=transid;
	document.getElementById('vessel1').value=vessel;
	document.getElementById('supplier1').value=supplier;
	document.getElementById('menuType1').value='D';
	document.getElementById('reqFrom1').value='result';
	document.report1.action = "<%=request.getContextPath()%>/initDeclaration.action";
	document.report1.submit();
}

function getBack(loginId){
	document.getElementById('loginId1').value=loginId;
	document.getElementById('menuType1').value='PD';
	document.getElementById('productId1').value='11';
	document.report1.action = "<%=request.getContextPath()%>/initReport.action";
	document.report1.submit();
}

function getConsigneeDetail(transid){
	document.getElementById('tranId1').value=transid;
	document.getElementById('reqFrom1').value='result';
	document.getElementById('menuType1').value='D';
	document.report1.action = "<%=request.getContextPath()%>/initDeclaration.action";
	document.report1.submit(); 
}
function getInfo(){
	document.report.action = "<%=request.getContextPath()%>/getInfoDeclaration.action";
	document.getElementById("polInfo").style.visibility = "";
	document.report.submit();
}
function schedule(choice){
	// var date=document.getElementById('incpDate').value;
	// var policyMode=document.report.policyMode.value;
	 document.report.action="<%=request.getContextPath()%>/scheduleDeclaration.action?scheduleType="+choice;	 
	 document.report.submit();
}

function hideInfo(){
	document.getElementById("polInfo").style.visibility = "hidden";
}

</script>
</html>


