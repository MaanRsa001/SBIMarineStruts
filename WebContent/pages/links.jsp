<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML>
<html>
<head>
</head>
<body>
<s:form name="links" theme="simple">  
<s:property value="reqFrm"/>
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<s:if test="linkType=='MAIL' && reqFrom=='QUOTEMAIL'">
			<div class="panel panel-primary">
				<div class="panel-heading"> <s:text name="E-Mail Quote" /> </div>
				<div class="panel-body">
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<s:actionerror cssStyle="color: red;" />
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<table class="table table-bordered" width="100%">
								<thead>
								<tr>
									<th> <s:label key="label.report.sno" /> </th>
									<th> <s:label key="label.report.quoteno" /> </th>
									<th> <s:label key="label.report.cusname" /> </th>
									<th> <s:label key="label.report.quotedate" /> </th>
									<th> <s:label key="label.report.validatedate" /> </th>
								</tr>
								</thead>
								<tbody>
								<s:iterator value="lapsedQuote" var="commodityList" status="stat">
								<tr>
									<td> <s:property value="#stat.index+1"/> </td>
									<td> <s:property value="QuoteNo"/> </td>
									<td> <s:property value="CustomerName"/> </td>
									<td> <s:property value="QuoteDate"/> </td>
									<td> <s:property value="ValidityDate"/> </td>
								</tr>
								</s:iterator>
								</tbody>
							</table>
						</div>
					</div>
					<br class="clear" />
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							<div class="text"><s:label key="report.email"></s:label>&nbsp;<span style="color: red;">*</span></div>
							<div class="tbox"><s:textfield name="quoteMailIds" cssClass="inputBox" /></div>
						</div>
					</div>
					<br class="clear" />
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
							<s:submit type="button" name="close"  key="Back" cssClass="btn btn-sm btn-danger" onclick="goIndex('QE',this.form)"/>&nbsp;&nbsp;&nbsp;	
							<s:submit type="button" name="close"  key="Submit" cssClass="btn btn-sm btn-success" onclick="fnsubmit(this.form)"/>
						</div>
					</div>	
				</div>
			</div>
			<s:hidden name="linkType"/>
			<s:hidden name="reqFrom"/>
			<s:hidden name="applicationNo"/>
			<s:hidden name="quoteNo"/>
			<s:hidden name="refStatus"/>
		</s:if>
		<s:elseif test="linkType=='MAIL'">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
					<div class="label label-success"><s:label key="email.success"/></div>
				</div>
			</div>
			<br class="clear" />
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
					<input type="button" name="close"  value="Back" class="btn btn btn-danger" onclick="goIndex('QE',this.form);"/>
				</div>
			</div>		
		</s:elseif>
		<s:elseif test="linkType=='LAPSED'">
			<div class="panel panel-primary">
				<div class="panel-heading"> <s:text name="label.report.reject"/> </div>
				<div class="panel-body">
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<s:actionerror cssStyle="color: red;" />
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
							<table width="100%" class="table table-bordered">
								<thead>
								<tr>
									<th> <s:text name="label.report.sno" /> </th>
									<th> <s:text name="label.report.quoteno" /> </th>
									<th> <s:text name="label.report.cusname" /> </th>
									<th> <s:text name="label.report.quotedate" /> </th>
									<th> <s:text name="label.report.validatedate" /> </th>
								</tr>
								</thead>
								<tbody>
								<s:iterator value="lapsedQuote" var="commodityList" status="stat">
								<tr>      				  
									<td><s:property value="#stat.index+1"/></td>
									<td><s:property value="QuoteNo"/></td>
									<td><s:property value="CustomerName"/></td>
									<td><s:property value="QuoteDate"/></td>
									<td><s:property value="ValidityDate"/></td>
								</tr>
								<%--<s:hidden name="quoteNo" value="%{#commodityList.QUOTE_NO}"></s:hidden>
								<s:hidden name="loginId" value="%{#session.user}"></s:hidden>
								--%></s:iterator>
								</tbody>
							</table>
							<s:hidden name="quoteNo"></s:hidden>
						</div>
					</div>
					<br class="clear" />
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
							<div class="text"><s:label key="label.lapsed.reason"></s:label>&nbsp;<span style="color: red;">*</span></div>
							<div class="tbox">
								<s:select name="lapsedRemarks" list="lapsedReason" headerKey="" headerValue="---Select---" listKey="LapsedReason" listValue="LapsedReason" cssClass="inputBoxS" />
							</div>
						</div>
					</div>
					<br class="clear" />
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
							<s:submit type="button" name="close"  key="label.back" cssClass="btn btn-sm btn-danger" onclick="goIndex('QE',this.form)"/>&nbsp;&nbsp;&nbsp;	
							<s:submit type="button" name="close"  key="label.cancel.submit" cssClass="btn btn-sm btn-success" onclick="fnsubmit(this.form)"/>
						</div>
					</div>
				</div>
			</div>
		</s:elseif>
		<s:else>
			<div class="panel panel-primary">
				<div class="panel-body">
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
							<div class="label label-success"><s:label key="lapsed.success"/></div>
						</div>
					</div>
					<br class="clear" />
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
							<s:submit type="button" name="close"  key="label.back" cssClass="btn btn-sm btn-danger" onclick="goIndex('QE',this.form)"/>
						</div>
					</div>
				</div>
			</div>
		</s:else>
	</div>
</div>
<s:hidden name="loginId" value="%{#session.user}"></s:hidden>
<s:token/>
</s:form>
<script type="text/javascript">
function goIndex(val,forms) {
	forms.action = "<%=request.getContextPath()%>/initReport.action?menuType="+val;
	forms.submit();
}

function fnsubmit(forms) {			
	forms.action = "<%=request.getContextPath()%>/mailReport.action";
	forms.submit();
}
</script>
</body>
</html>