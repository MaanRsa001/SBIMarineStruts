<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE HTML>
<html>
<head>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap-multiselect.css" />
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

<s:if test='!"new".equals(mode)'>
	<s:form name="infoCommon" id="infoCommon" method="post">
		<div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
			<div class="panel panel-primary">
				<div class="panel-body">
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12">
							<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="View" onclick="fnCall('view');"/>
						</div>
						<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12">
							 <input type="button" class="btn btn-sm btn-info adminMenuBtn" value="Change Password" onclick="fnCall('changePwd')"/>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12">
							<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="User Details" onclick="fnCall('userDetail')"/>
						</div>
						<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12">
							 <input type="button" class="btn btn-sm btn-info adminMenuBtn" value="Customer Detail" onclick="fnCall('customerDetail')"/>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12">
							<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="OpenCover" onclick="fnCall('openCover')"/>
						</div>
						<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12">
							 <input type="button" class="btn btn-sm btn-info adminMenuBtn" value="Referral" onclick="fnCall('referal')"/>
						</div>
					</div>
				</div>
			</div>
		</div>
		<s:hidden name="agencyCode"/>
		<s:hidden name="login_Id"/>
		<s:hidden name="mode"/>
		<s:token/>	
	</s:form>	
</s:if>
<div <s:if test='"new".equals(mode)'> class="col-xs-12 col-sm-12 col-md-12 col-lg-12"</s:if><s:else> class="col-xs-12 col-sm-12 col-md-9 col-lg-9"</s:else>>
		<div class="panel panel-primary">
			<div class="panel-heading"> 
				<s:if test='"new".equals(mode)'>
					<s:text name="New Broker Creation" /> 
				</s:if>
				<s:else>
					<s:text name="broker.brokermanagement" /> 
					<div class="pullRight label label-warning"><s:property value="borganization"/>(<s:property value="agencyCode"/>)</div>
					<br class="clear" /> 
				</s:else>
			</div>
			<div class="panel-body">
				<div class="row">
						<s:if test="'successNew'.equals(display)">
							<s:form id="BrokerInfoEdit" name="BrokerInfoEdit" method="post" action="" theme="simple" enctype="multipart/form-data">
								<div class="row">
									<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
										<span class="label label-success"> <s:text name="broker.new.success"/> </span>
									</div>
								</div>
								<br class="clear" />
								<div class="row">
									<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
										<input type="button" onclick="fnsubmit('back')" name="back" class="btn btn-sm btn-danger" value="Back" />
									</div>
								</div>
								<s:token/>
							</s:form>	
						</s:if>
						<s:elseif test="'successUpdate'.equals(display)">
							<s:form id="BrokerInfoEdit" name="BrokerInfoEdit" method="post" action="" theme="simple" enctype="multipart/form-data">
								<div class="row">
									<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
										<span class="label label-success"> <s:text name="broker.update.success"/> </span>
									</div>
								</div>
								<br class="clear" />
								<div class="row">
									<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
										<input type="button" onclick="fnsubmit('back')" name="back" class="btn btn-sm btn-danger" value="Back" />
									</div>
								</div>
								<s:token/>
							</s:form>
						</s:elseif>
						<s:else>
							<div class="row">
								<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">	
									<div id="horizontalTab">
										<ul class="resp-tabs-list">
											<li id="tabShow"><s:text name="Broker Management" /></li>
											<li id="tabShow1"><s:text name="Product Selection" /></li>
										</ul>
					
										<div class="resp-tabs-container">
											<div class="tab1" >
												<s:if test='!("newAjax".equals(mode1) || "editAjax".equals(mode1))'>
													<div class="row">
														<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
															<s:actionerror cssStyle="color:red;" /> <s:actionmessage cssStyle="color:green;" />
														</div>
													</div>
												<br class="clear" />
												</s:if>
												<s:form id="BrokerInfoEdit" name="BrokerInfoEdit" method="post" action="" theme="simple" enctype="multipart/form-data">
												<s:if test='"edit".equals(mode)'>
													<div class="row">
														<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
															<div class="text"><s:text name="broker.status"/><font color="red">*</font></div>
															<div class="tbox">
																<s:select name="status" list="#{'Y':'Active','N':'Deactive','D':'Delete','T':'Lock'}" headerKey="" headerValue="---Select--" cssClass="inputBoxS" />
															</div>
														</div>
													</div>
													<br class="clear" />
												</s:if>
												<div class="row">
												<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
														<div class="panel panel-primary">
															<div class="panel-heading"> <s:text name="broker.companyinfo" /> </div>
															<div class="panel-body">
																<div class="row">
																	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																		<div class="text"><s:text name="broker.approve"/> <font color="red">*</font></div>
																		<div class="tbox">
																			<s:textfield name="approvedby" id="approvedby" cssClass="inputBox" size="35" maxlength="30"/>
																		</div>
																	</div>
																	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																		<div class="text"><s:text name="broker.brokercode" /> <font color="red">*</font></div>
																		<div class="tbox">
																			<s:textfield name="bcode" id="bcode"  cssClass="inputBox"  size="35" maxlength="15"  />
																		</div>
																	</div>
																	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																	<div class="text"><s:text name="broker.brokerOrg" /> <font color="red">*</font></div>
																		<div class="tbox">
												                             <s:textfield name="borganization" id="borganization" cssClass="inputBox tooltipContent" data-content="Broker Name"   maxlength="500" />
																	       <%-- <span class="input-group-addon">
												                             <a onclick="return customerSelectionAction()" style="cursor: pointer" ><span class="glyphicon glyphicon-list"></a>
																	      </span> --%>
																	     </div>
																	</div>
																	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																		<div class="text"><s:text name="broker.address1" /></div>
																		<div class="tbox">
																			<s:textfield name="address1" id="address1" cssClass="inputBox" size="35" maxlength="50"/>
																		</div>
																	</div>
																	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																		<div class="text"><s:text name="broker.address2" /></div>
																		<div class="tbox">
																			<s:textfield name="address2" id="address2" cssClass="inputBox" size="35" maxlength="50"/>
																		</div>
																	</div>
																	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																		<div class="text"><s:text name="broker.city" /> <font color="red">*</font></div>
																		<div class="tbox">
																			<s:select name="emirate" id="emirate" list="emiratesInfo" listKey="CityCode" listValue="CityName" cssClass="inputBoxS" headerKey="" headerValue="---Select---" onchange="fnOtherCity(this.value)"/> 
																		</div>
																	</div>
																	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																		<div class="text"><s:text name="broker.othercity" /></div>
																		<div class="tbox">
																			<s:textfield name="othercity" id="othercity" cssClass="inputBox" size="35" maxlength="30"/>
																		</div>
																	</div>
																	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																		<div class="text"><s:text name="broker.country" /> <font color="red">*</font></div>
																		<div class="tbox">
																			<s:select name="country" id="country" list="countriesInfo" cssClass="inputBoxS" listKey="CountryCode" listValue="CountryName"/>
																		</div>
																	</div>
																	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																		<div class="text"><s:text name="broker.pobox" /></div>
																		<div class="tbox">
																			<s:textfield name="pobox" id="pobox" cssClass="inputBox" size="35" maxlength="6"/>
																		</div>
																	</div>
																	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																		<div class="text"><s:text name="broker.telephone" /></div>
																		<div class="tbox">
																			<s:textfield name="telephone" id="telephone"  cssClass="inputBox" size="35" maxlength="25"/>
																		</div>
																	</div>
																	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																		<div class="text"><s:text name="broker.fax" /></div>
																		<div class="tbox">
																			<s:textfield name="fax" id="fax" cssClass="inputBox" size="35" maxlength="25"/>
																		</div>
																	</div>
																	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																		<div class="text"><s:text name="broker.customercode" /></div>
																		<div class="tbox">
																			<s:textfield name="missippiId"  id="missippiId" cssClass="inputBox" size="30" readonly="true" />
						                        							<s:hidden name="CIMSNO"/>
						                        							<s:hidden name="ARACC"/>
						                        							<s:hidden name="customerName"/>
																		</div>
																	</div>
																	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																		<div class="text"> <s:text name="broker.region" /> <font color="red">*</font></div>
																		<div class="tbox">
																			<s:select name="regionCode" id="regionCode" cssClass="inputBoxS" list="regionsList"  listKey="RegionId" listValue="RegionName"  headerKey="" headerValue="---Select---" onchange="getBranchList(this.value,'branchId');"/>
																		</div>
																	</div>
																	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																		<div class="text"> <s:text name="broker.branchcode" /><font color="red">*</font> </div>
																		<div class="tbox">
																			<div id="branchId"><s:select name="branchCodeS" id="branchCodeS" cssClass="inputBoxS" list="branchList"  listKey="BranchCode" listValue="BranchName"  headerKey="" headerValue="---Select---" /></div>
																		</div>
																	</div>
																	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																		<div class="text"><s:text name="admin.user.region.select"/> <font color="red">*</font></div>
																		<div class="tbox">
																			<s:select name="attachedregion" id="attachedregion" cssClass="inputBoxS" list="regionsList"  listKey="RegionId" listValue="RegionName"  headerKey=""  multiple="true"/>
																		</div>
																	</div>
																	</div>
																	<div class="row">
																	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																		<div class="text"><s:text name="admin.user.branch.select"/> <font color="red">*</font></div>
																		<div class="tbox">
																			<s:textarea name="branchId" id="branchId" cssClass="inputBoxA" rows="2" cssStyle="width: 85%;"/>
																			<input class="btn btn-sm btn-primary" value="..." style="float:right;" type="button" name="menu" onclick="return callPopupbranch('<%=request.getContextPath()%>/branchSelectionBrokerMgm.action')"/>							
																		</div>
																	</div>
																	<%--<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																		<div class="text"> <s:text name="user.linked.location" /> </div>
																		<div class="tbox">
																			<s:select name="broLinkLoc" id="broLinkLoc" cssClass="inputBoxS" list="linkedBranchList"  listKey="FS_BRANCH_CODE" listValue="FS_BRANCH_NAME"  headerKey="" headerValue="---Select---" />
																		</div>
																	</div>
																	
																	<s:if test='broImgName!=null'>
																		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																			<div class="text"> <s:text name="broker.images" /> </div>
																			<div class="tbox">
																				<img src='<%=request.getContextPath()%><s:property value="broImgName"/>' border="0" width="150" height="60"  alt="" >
																				<a href="#" onclick="deleteLogo('','delete');"> <i class="fa fa-times"></i> </a>
			                         											<s:hidden name="broImgName"/>
																			</div>
																		</div>
																	</s:if>
																	<s:else>
																		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																			<div class="text"><s:text name="broker.images" /></div>
																			<div class="tbox">
																				<s:file name="upload" id="upload" cssClass="inputBox"/>
																			</div>
																		</div>
																	</s:else>
																--%>
																</div>
															</div>
														</div>
														<div class="panel panel-primary">
															<div class="panel-heading"> <s:text name="broker.contactpersonInfo" /> </div>
															<div class="panel-body">
																<div class="row">
																	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																		<div class="text"><s:text name="broker.title" /></div>
																		<div class="tbox">
																			<s:select name="title" id="title" list="titlesInfo" cssClass="inputBoxS" listKey="Code" listValue="CodeDescription"  headerKey="" headerValue="---Select---"/>
																		</div>
																	</div>
																	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																		<div class="text"><s:text name="broker.firstname" /> <font color="red">*</font></div>
																		<div class="tbox">
																			<s:textfield name="firstname" id="firstname" cssClass="inputBox" maxlength="70"/>
																		</div>
																	</div>
																	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																		<div class="text"> <s:text name="broker.lastname" /> </div>
																		<div class="tbox">
																			<s:textfield name="lastname" id="lastname" cssClass="inputBox" size="35" maxlength="30"/>
																		</div>
																	</div>
																	<%-- <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																		<div class="text"> <s:text name="broker.gender" /> </div>
																		<div class="tbox">
																			<s:radio name="gender" id="gender" list="#{'M':'Male','F':'Female'}" />
																		</div>
																	</div>
																	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																		<div class="text"> <s:text name="broker.dob" /> </div>
																		<div class="tbox">
																			<s:textfield id="dob" name="dob" cssClass="inputBox datepicker" />
																		</div>
																	</div> --%>
																	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																		<div class="text"> <s:text name="broker.nationality" /> <font color="red">*</font> </div>
																		<div class="tbox">
																			<s:select name="nationality" list="nationalitiesInfo" cssClass="inputBoxS" listKey="NationalityCode" listValue="NationalityName" headerKey="" headerValue="---Select---"/>
																		</div>
																	</div>
																	<%-- <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																		<div class="text"><s:text name="broker.occupation" /></div>
																		<div class="tbox">
																			<s:textfield name="occupation" id="occupation"  cssClass="inputBox" size="35" maxlength="30"/>
																		</div>
																	</div> --%>
																	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																		<div class="text"><s:text name="broker.mobile" /></div>
																		<div class="tbox">
																			<s:textfield name="mobile" id="mobile" cssClass="inputBox" size="35" maxlength="10"/>
																		</div>
																	</div>
																	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																		<div class="text"><s:text name="broker.email" /> <font color="red">*</font></div>
																		<div class="tbox">
																			<s:textfield name="bemail" id="bemail" cssClass="inputBox" size="35"/>
																		</div>
																	</div>
																	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																		<div class="text"><s:text name="broker.executive" /><font color="red">*</font></div>
																		<div class="tbox">
																			<s:select name="executive" list="executivesInfo" cssClass="inputBoxS" listKey="AcExecutiveId" listValue="AcExecutiveName" headerKey="" headerValue="---Select---" />
																		</div>
																	</div>
																	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																		<div class="text"><s:text name="policy.eff" /> <font color="red">*</font></div>
																		<div class="tbox">
																			<s:textfield id="effecdate" name="effecdate" cssClass="inputBox datepicker" />
																		</div>
																	</div>
																</div>
															</div>
														</div>
														<s:if test='"new".equals(mode)'>
															<div class="panel panel-primary">
																<div class="panel-heading"> <s:text name="broker.login.creation" /> </div>
																<div class="panel-body">
																	<div class="row">
																		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																			<div class="text"><s:text name="broker.new" /></div>
																			<div class="tbox">
																				<s:textfield name="loginid" id="loginid"  cssClass="inputBox" size="35" maxlength="15" />
																			</div>
																		</div>
																		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																			<div class="text"><s:text name="broker.password" /></div>
																			<div class="tbox">
																				<s:password name="password" cssClass="inputBox" size="35" maxlength="20"/>
																			</div>
																		</div>
																		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																			<div class="text"><s:text name="broker.rpassword" /> <font color="red">*</font></div>
																			<div class="tbox">
																				<s:password name="repassword" cssClass="inputBox" size="35" maxlength="20"/>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</s:if>
														<s:hidden id="policy_fee" name="policy_fee" value="N"></s:hidden>
														<s:hidden id="policFee" name="policFee" value="0"></s:hidden>
														<s:hidden id="app_for" name="app_for" value="broker"></s:hidden>
														<s:hidden id="oneOffCommission" name="oneOffCommission"></s:hidden>
														<s:hidden id="openCoverCommission" name="openCoverCommission"></s:hidden>
														<%-- <div class="panel panel-primary">
															<div class="panel-heading"> <s:text name="tax.info" /> </div>
															<div class="panel-body">
																<s:set var="taxInfo" value="customerTaxInfo[0]" />
																<div class="row">
																	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
																		<table width="100%" class="table table-bordered">
																			<tbody>
																			<tr>
																				<td width="2%">1.</td>
																				<td width="35%"><s:text name="policy.fee" /></td>
																				<td width="63%"><s:radio id="policy_fee" name="policy_fee" list="#{'Y':'Yes','N':'No'}" onclick="policyStatusDisplay(this.value)" value="%{policy_fee==null?'N':policy_fee}" /></td>
																			</tr>
																			<tr id="policy_Status_Display" style="display: <s:if test='"Y".equals(policy_fee)'></s:if><s:else>none</s:else>">
																				<td></td>
																				<td><s:text name="policy.feein" /></td>
																				<td><s:textfield name="policFee" cssClass="inputBox" maxlength="5" size="15"/></td>
																			</tr>
																			<tr>
																				<td>2.</td>
																				<td><s:text name="policy.app" /></td>
																				<td><s:radio name="app_for" list="#{'user':'Operation','broker':'Broker','both':'Both'}" /></td>
																			</tr>
																			<tr>
																				<td>3.</td>
																				<td>Commission for Issuer Quotes</td>
																				<td>
																					For One Off Policy&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:textfield name="oneOffCommission" cssClass="inputBox" maxlength="15"  size="15"/>
																				</td>
																			</tr>
																			<tr>
																				<td></td>
																				<td></td>
																				<td>
																					For Open Cover Policy<s:textfield name="openCoverCommission" maxlength="15" cssClass="inputBox" size="15"/>
																				</td>
																			</tr>
																			<tr>
																				<td></td>
																				<td><s:text name="policy.eff" /> : <font color="red">*</font></td>
																				<td> <s:textfield id="effecdate" name="effecdate" cssClass="inputBox datepicker" /> </td>
																			</tr>																						
																			</tbody>
																		</table>
																	</div>
																</div>
															</div>
														</div> --%>
													</div>
												</div>
												<s:hidden name="agencyCode"/>
												<s:hidden name="login_Id"/>
												<s:hidden name="mode"/>
												<s:hidden name="customer_id"/>
												<s:hidden name= "groupId"/>
												<s:token/>		
												</s:form>
												<br class="clear" />
												<div class="row">
													<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
														<input type="button" onclick="fnsubmit('back')" name="back" class="btn btn-sm btn-danger" value="Back" /> &nbsp;&nbsp;&nbsp;
														<input type="button" name="submit2" class="btn btn-sm btn-success" value="Submit" onclick="fnsubmit('info')"/>
													</div>
												</div>
											</div>
											 <div class="tab2" style="display:none;">
												<div class="row">
													<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
														<div class="panel panel-primary">
															<div class="panel-heading"> 
																<s:text name="Product Selection" />
																	<div class="pullRight">
																			<a href="#" onclick="forward(<s:property value="agencyCode"/>,'productselections', '','newAjax');" class="btn btn-sm btn-info" > <i class="glyphicon glyphicon-plus"></i> </a>
																	</div>
	 																<br class="clear" /> 
															</div>
															
															<div class="panel-body">
																<s:form id="info" name="info" method="post" action="" theme="simple">
																<div class="row">
																	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">																	 																	 
																		<div class="panel-body">
																			<div id="commisionDetailss">
																				<table class="table table-bordered commissionDetails" id="record" width="100%" cellspacing="0">
																					<thead>
																					<tr>
																						<th class="no-sort"></th>
																						<th><s:text name="Products" /></th>
																						<th><s:text name="Sum Insured" /></th>
																						<th><s:text name="Commission [%]" /></th>
																						<th><s:text name="Min Premium" /></th>
																						<th><s:text name="Loading % Max" /></th>
																						<th><s:text name="Discount % Max" /></th>
																						<th><s:text name="Back Days Allowed" /></th>
																						<th><s:text name="Edit" /></th>
																					</tr>
																					</thead>
																					<tbody>
																					<s:iterator value="commisionDetails" var="cdet"  status="status">
																					<tr>
																						<td></td>
																						<td> <s:property value="ProductName" /> </td>
																						<td> <s:property value="InsuranceEndLimit" /> </td>
																						<td> <s:property value="Commission" /> </td>
																						<td> <s:property value="MinPremiumAmount" /> </td>
																						<td> <s:property value="LoadingPremium" /> </td>
																						<td> <s:property value="DiscountPremium" /> </td>
																						<td> <s:property value="BackDateAllowed" /> </td>
																						<td style="text-align: center;">																						 
																							<a type="button" href="#"  name="edit" class="btn btn-sm btn-warning" onclick="forward('<s:property value="agencyCode"/>','productselections', '<s:property value="ProductId"/>', 'editAjax');"/>
																								<i class="fa fa-edit"></i>
																							</a>
																						</td>
																					</tr>
																					</s:iterator>
																					</tbody>
																				</table>
																			</div>
																		</div>																	 
																	</div>
																</div>
																<s:hidden name="mode1"/>
																<s:hidden name="agencyCode"/>
																<s:hidden name="borganization"/>
																<s:hidden name="bcode"/>
																<s:hidden name="firstname"/>
																<s:hidden name="login_Id"/>
																<s:hidden name="customer_id"/>
																<s:token/>
																</s:form>																			
																<br class="clear" />
																<div class="row">
																	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
																		<s:if test='"newAjax".equals(mode1) || "editAjax".equals(mode1)'>
												     						<s:actionerror cssStyle="color:red;" /> <s:actionmessage cssStyle="color:green;" />
													       				</s:if>
																	</div>
																</div>
																<div class="row">
																	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" ">																
																		<div id="productselections"></div>
																	</div>
																</div>
															</div>																		
														</div>
													</div>
												</div>															
											</div>
										</div>
									</div>
								</div>
							</div>
						</s:else>
					</div>
				</div>
				<s:hidden name="agencyCode"/>
				<s:hidden name="login_Id"/>
				<s:hidden name="mode"/>		  
	 		</div>
		</div>
	</div>
</body>
<script type="text/javascript">
if('<s:property value="mode1"/>'=='newAjax' || '<s:property value="mode1"/>'=='editAjax'){
	postRequest('<%=request.getContextPath()%>/getBrokerAjaxBrokerMgm.action?reqFrom=productselections&agencyCode='+'<s:property value="agencyCode"/>'+'&productID='+'<s:property value="productID"/>'+'&mode1='+'<s:property value="mode1"/>'+'&mode=ajax'+'&productName='+'<s:property value="productName"/>'+'&commission='+'<s:property value="commission"/>'
				+'&insurance_End_Limit='+'<s:property value="insurance_End_Limit"/>'+'&min_Premium_Amount='+'<s:property value="min_Premium_Amount"/>'+'&loadingPremium='+'<s:property value="loadingPremium"/>'+'&discountPremium='+'<s:property value="discountPremium"/>'+'&back_Date_Allowed='+'<s:property value="back_Date_Allowed"/>'
				+'&user_Id_Creation='+'<s:property value="user_Id_Creation"/>'+'&payReceipt='+'<s:property value="payReceipt"/>'+'&freight='+'<s:property value="freight"/>'+'&provision='+'<s:property value="provision"/>', 'productselections');
	}
function getCoreCustomerInfo()
{
var URL='<%=request.getContextPath()%>/getccInfoBrokerMgm.action?mode=info';
var windowName = "BrokerInfo";
var width  = screen.availWidth;
var height = screen.availHeight;
var bwidth = window.innerWidth;
var bwidth1 = document.body.clientWidth;
if(bwidth <= 768) {
	var w = bwidth;
	var h = 400;
} else {
	var w = 700;
	var h = 400;
}
var features =
	'width='          + w +
	',height='		  + h +
	',left='		  + ((width - w - 0) * .4)  +
	',top='			  + ((height - h - 0) * .4) +
	',directories=no' +
	',location=no'	  +
	',menubar=no'	  +
	',scrollbars=yes' +
	',status=yes'	  +
	',toolbar=no'	  +
	',resizable=false';
var strOpen = window.open (URL, windowName, features);
strOpen.focus();
}
function policyStatusDisplay(val){
	if("Y"==val){
		document.getElementById("policy_Status_Display").style.display = "";	
	}else{
		document.getElementById("policy_Status_Display").style.display = "none";
	}
	return true;
}
function govStatusDisplay(val){
	if("Y"==val){
		document.getElementById("gov_Status_Display").style.display = "";	
	}else{
		document.getElementById("gov_Status_Display").style.display = "none";
	}
	return true;
}
function emerStatusDisplay(val){
	if("Y"==val){
		document.getElementById("emer_Status_Display").style.display = "";	
	}else{
		document.getElementById("emer_Status_Display").style.display = "none";
	}
	return true;
}
function provisionDisplay(val){
	if("Y"==val){
		document.getElementById("provision_Display").style.display = "";	
	}else{
		document.getElementById("provision_Display").style.display = "none";    			
	}
	return true;
}  
function productsel(val)
{	 
	 
	if(val==11){
		document.getElementById("sme").style.display = "none";
		document.getElementById("travel").style.display = "none";
		document.getElementById("motor").style.display = "none";
		document.getElementById("opencov").style.display = "";
		document.getElementById("oneoff").style.display = "none";
	}
	else if(val==3){
		document.getElementById("sme").style.display = "none";
		document.getElementById("travel").style.display = "none";
		document.getElementById("motor").style.display = "none";
		document.getElementById("oneoff").style.display = "";
		document.getElementById("opencov").style.display = "none";
	}
	else if(val==30){ 
		document.getElementById("sme").style.display = "block";
		document.getElementById("travel").style.display = "none";
		document.getElementById("motor").style.display = "none";
		document.getElementById("opencov").style.display = "none";
		document.getElementById("oneoff").style.display = "none";
	}
	else if(val==33){
		document.getElementById("sme").style.display = "none";
		document.getElementById("travel").style.display = "";
		document.getElementById("motor").style.display = "none";
		document.getElementById("opencov").style.display = "none";
		document.getElementById("oneoff").style.display = "none";
	}
	else if(val==65){
		document.getElementById("sme").style.display = "none";
		document.getElementById("travel").style.display = "none";
		document.getElementById("motor").style.display = "";
		document.getElementById("opencov").style.display = "none";
		document.getElementById("oneoff").style.display = "none";
	}
	else{
		document.getElementById("sme").style.display = "none";
		document.getElementById("travel").style.display = "none";
		document.getElementById("motor").style.display = "none";
		document.getElementById("opencov").style.display = "none";
		document.getElementById("oneoff").style.display = "none";
	}
	document.getElementById("ajxproductID").value=val;
	return true;
}  	

function forward(agcode, id, value, mode1){
	postRequest('<%=request.getContextPath()%>/getBrokerAjaxBrokerMgm.action?reqFrom='+id+'&agencyCode='+agcode+'&productID='+value+'&mode1='+mode1, id);
}
<s:if test='emirate!=null && !"".equals(emirate) && !("successUpdate".equals(display) || "successNew".equals(display))'>
	fnOtherCity('<s:property value="emirate"/>');
</s:if>
function fnOtherCity(val){
	if(val=='VARIOUS'){
		document.getElementById('othercity').disabled=false;
	}else{
		document.getElementById('othercity').value='';
		document.getElementById('othercity').disabled=true;
	}
}
function getBranchList(val,id){
	postRequest('<%=request.getContextPath()%>/getBrokerAjaxBrokerMgm.action?reqFrom='+id+'&regionCode='+val, id);
}
function deleteProduct(){
var conf=confirm("Do you want do delete this product?"); 
if(conf){
document.productSelect.action="deleteProductBrokerMgm.action";
document.productSelect.submit();
}
}
function deleteLogo(agencyCode,mode){
document.BrokerInfoEdit.action = "editBrokerMgm.action?mode1=delete";
document.BrokerInfoEdit.submit();
}
function customerSelectionAction() {
 var URL ="<%=request.getContextPath()%>/customerSelectionQuotation.action?searchType=BROKER";
 return callPopup(URL);
}
function fnCall(from){
	if(from=='edit')
		document.infoCommon.action = from+"BrokerMgm.action?mode=edit";
	else if(from=='userDetail')
		document.infoCommon.action = "getABListUserMgm.action?mode1=broker";
	else if(from=='customerDetail')
		document.infoCommon.action = "getABListCustomerMgm.action?mode1=broker";
	else if(from=='referal')
		document.infoCommon.action = "getOCListReferal.action";
	else if(from=='openCover')
		document.infoCommon.action = "opencoverBrokerMgm.action";
	else
		document.infoCommon.action = from+"BrokerMgm.action";
	document.infoCommon.submit();
}
function fnsubmit(from){
	if(from=='info'){
		document.BrokerInfoEdit.action = "newBrokerBrokerMgm.action";
		document.BrokerInfoEdit.submit();
	}else if(from=='back'){
		document.BrokerInfoEdit.action = "getABListBrokerMgm.action";
		document.BrokerInfoEdit.submit();
	}
}
function callPopup(URL) {
 	var bwidth = window.innerWidth;
	var bwidth1 = document.body.clientWidth;
	if(bwidth <= 768) {
		return popUp(URL,bwidth1,'500');
	} else {
		return popUp(URL,'750','500');
	}
}
function addProduct(){
	document.productSelect.action='addProductBrokerMgm.action';
	document.productSelect.submit();
}

jQuery(function ($) {
	  $("#tabShow").click(function() {
	    $(".tab1").show();
	    $(".tab2").css("display" , "none");
	  });
	  $("#tabShow1").click(function() {
	    $(".tab2").show();
	    $(".tab1").css("display" , "none");
  });
});


$(document).ready(function() {
	try{
		var index = '<s:property value="index"/>';
		var t = $('#tabs');
		var tabs = t.tabs('tabs');
			t.tabs('select', tabs[index].panel('options').title);
	}catch(e){}
		
});
$(document).ready(function() {     
    $('#attachedregion').multiselect({ 
        includeSelectAllOption: true,
          enableFiltering:true 
          
    	});
});
function callPopupbranch(url){	 
	var checkedItems='';
	try
	{
		var elements=document.getElementById("attachedregion");		 
		for(i=0; i<elements.length; i++)
		{
			obj=elements[i];
			if(obj.selected)
				checkedItems+=obj.value+',';
		}
	}catch(e){}	 
	if(checkedItems.length>1)
		checkedItems=checkedItems.substring(0, checkedItems.length-1);	 
	if(checkedItems!=null && checkedItems!="")
		return callPopup(url+'?selregions='+checkedItems);
	else
		alert('Please Select Attached Region');	
}
</script>
</html>