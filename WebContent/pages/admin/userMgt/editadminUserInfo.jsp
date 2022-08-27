<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE HTML>
<html>
<head>
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap-multiselect.css" />
	<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap-multiselect.js" type="text/javascript"></script>
</head>
<body>
<div class="row">
	<s:if test='%{borganization!=null && !"".equals(borganization)}'>
		<div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
			<div class="panel panel-primary">
				<div class="panel-body">
					<s:if test='%{borganization!=null && !"".equals(borganization)}'>
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12">
								<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="View" onclick="fnCall('viewuser')"/>
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
								<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="Customer Details" onclick="fnCall('customerDetail')"/>
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
						<!-- <div class="row">
							<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12">
								<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="Statistics" onclick="fnCall('statistics')"/>
							</div>
						</div> -->
					</s:if>
					<s:else>
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12">
								<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="View" onclick="fnCall('viewuser')"/>
							</div>
							<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12">
								<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="Customer Details" onclick="fnCall('customerDetail')"/>
							</div>
						</div>
					</s:else>
				</div>
			</div>
		</div>
		<div class="col-xs-12 col-sm-12 col-md-9 col-lg-9">
	</s:if>
	 <s:elseif test='"new".equals(optionMode)'>
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
	</s:elseif>
	<s:else>
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
	</s:else>
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:if test='%{borganization!=null && !"".equals(borganization)}'>
					<s:property value="borganization"/>(<s:property value="agencyCode"/>)
				</s:if>
				 <s:elseif test='"new".equals(optionMode)'>
				 	New User Creation
				 </s:elseif>
				 <s:else>
				 	User Management
				 </s:else>
			</div>
			<div class="panel-body">			
				<div id="horizontalTab">
					<ul class="resp-tabs-list">
						<li id="tabShow"><s:text name="user.usermanagement" /></li>
						<li id="tabShow1"><s:text name="Product Selection" /></li>
						<s:if test='!"new".equals(mode)'>
							<li id="tabShow2"><s:text name="Password Change" /></li>
						</s:if>
					</ul>
					
					<div class="resp-tabs-container">
						 <s:if test="hasActionErrors()" >
						 	<s:set var="responsiveTab" value='%{"1"}'/>												 	
						 </s:if>
						 
				 	<div class="tab1">
						<div id='<s:property value="%{responsiveTab}" default="1"/>'>
							<s:form id="info" name="info" method="post" action="newUserUserMgm" theme="simple">
								<s:if test="'successNew'.equals(display)">
									<div class="row">
										<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">	
											<span class="label label-md label-success" ><s:label key="user.new.success"/></span>
										</div>
									</div>
									<br/>
									<div class="row">
										<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
											<input type="button" onclick="fnsubmit('back','getABListUserMgm', this.form)" name="back" class="btn btn-sm btn-danger" value="Back" />
										</div>
									</div>
								</s:if>
								<s:elseif test="'successUpdate'.equals(display)">
									<div class="row">
										<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">	
											<span class="label label-md label-success" ><s:label key="user.update.success"/></span>
										</div>
									</div>
									<br/>
									<div class="row">
										<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
											<input type="button" onclick="fnsubmit('back','getABListUserMgm', this.form)" name="back" class="btn btn-sm btn-danger" value="Back" />
										</div>
									</div>
								</s:elseif>
								<s:else>
									<div class="row">
										<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">	
											<s:if test='!"product".equals(mode1) && !"login".equals(mode1)'>
												<div class="row">
													<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">	
														<s:actionerror cssStyle="color: red;" />
														<s:actionmessage cssStyle="color: green;" />
													</div>
												</div>
												<br/>
											</s:if>
											<s:if test='!"new".equals(optionMode)'>
												<div class="row">
													<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
														<div class="text"><s:text name="user.status"/></div>
														<div class="tbox">
															<s:select name="ustatus" list="#{'Y':'Active','N':'Deactive','D':'Delete','T':'Lock'}" headerKey="" headerValue="---Select---" cssClass="inputBoxS" />
														</div>
													</div>
												</div>	
												<br/>
											</s:if>
											<div class="row">
												<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
													<div class="panel panel-primary">
														<div class="panel-heading">
															<s:text name="user.contactpersonInfo" />
														</div>
														<div class="panel-body">
															<div class="row">
																<s:if test='"edit".equals(mode)'>
																	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																		<div class="text"> <s:text name="user.broker" /> </div>
																		<div class="tbox">
																			<s:if test='"".equals(borganization) || borganization==null'>
					                           									<s:select name="broker" id="broker" list="brokerList" listKey="AgencyCode" listValue="CompanyName" cssClass="inputBoxS" headerKey="" headerValue="---Select---" />
					                           								</s:if>
					                           								<s:else>
					                           									<s:property value="borganization"/>
					                           									<s:hidden name="broker" id="broker" value="%{agencyCode}"></s:hidden>
					                           								</s:else>
																		</div>
																	</div>
																	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																		<div class="text"> <s:text name="user.type" /> </div>
																		<div class="tbox"> <s:property value="utype"/> </div>
																	</div>
																	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																		<div class="text"> <s:text name="user.userId" /> </div>
																		<div class="tbox"> <s:property value="userId" /> <s:hidden name="userId" id="userId"/><s:hidden name="customerId" id="customerId"/> </div>
																	</div>
																</s:if>
																<s:else>
																	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																		<div class="text"> <s:text name="user.broker" /> <font color="red">*</font></div>
																		<div class="tbox">
																			<s:if test='"".equals(borganization) || borganization==null'>
					                           									<s:select name="broker" id="broker" list="brokerList" listKey="AgencyCode" listValue="CompanyName" cssClass="inputBoxS" headerKey="" headerValue="---Select---"/>
					                           								</s:if>
					                           								<s:else>
					                           								<s:select name="broker" id="broker" list="brokerList" listKey="AgencyCode" listValue="CompanyName" cssClass="inputBoxS" headerKey="" headerValue="---Select---" value="%{agencyCode}"/>
					                           									<%-- <s:property value="borganization"/>
					                           									<s:hidden name="broker" id="broker" value="%{agencyCode}"></s:hidden> --%>
					                           								</s:else>
																		</div>
																	</div>
																	<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																		<div class="text"> <s:text name="user.type" /> <font color="red">*</font></div>
																		<div class="tbox">
																			<s:textfield name="utype" cssClass="inputBox" size="35" disabled="true"/>
																		</div>
																	</div>
																</s:else>
															</div>
															<div class="row">
																<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																	<div class="text"> <s:text name="user.title" /> <font color="red">*</font></div>
																	<div class="tbox">
																		<s:select name="utitle" id="title" list="titlesInfo" cssClass="inputBoxS" listKey="Code" listValue="CodeDescription"  headerKey="" headerValue="---Select---"/>
																	</div>
																</div>
																<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																	<div class="text"> <s:text name="user.firstname" /> <font color="red">*</font></div>
																	<div class="tbox">
																		<s:textfield name="ufirstname" cssClass="inputBox" size="35" maxlength="30"  />
																	</div>
																</div>
																<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																	<div class="text"> <s:text name="user.lastname" /> </div>
																	<div class="tbox">
																		<s:textfield name="ulastname" cssClass="inputBox" size="35" maxlength="30"/>
																	</div>
																</div>
																<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																	<div class="text"> <s:text name="user.gender" /> </div>
																	<div class="tbox">
																		<s:radio name="ugender" id="ugender" list="#{'M':'Male','F':'Female'}" />
																	</div>
																</div>
																<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																	<div class="text"> <s:text name="user.nationality" /> <font color="red">*</font></div>
																	<div class="tbox">
																		<s:select name="unationality" list="nationalitiesInfo" listKey="NationalityCode" listValue="NationalityName" headerKey="" headerValue="---Select---" cssClass="inputBoxS" />
																	</div>
																</div>
																<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																	<div class="text"> <s:text name="user.dob" /> </div>
																	<div class="tbox">
																		<s:textfield id="udob" name="udob" cssClass="inputBox" size="35" readonly="true" />
																	</div>
																</div>
																<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																	<div class="text"> <s:text name="user.occupation" /> </div>
																	<div class="tbox">
																		<s:textfield name="uoccupation"  cssClass="inputBox" size="35" maxlength="30"/>
																	</div>
																</div>
																<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																	<div class="text"> <s:text name="user.address1" /> </div>
																	<div class="tbox">
																		<s:textfield name="uaddress1" id="address1" cssClass="inputBox" size="35" maxlength="50"/>
																	</div>
																</div>
																<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																	<div class="text"> <s:text name="user.address2" /> </div>
																	<div class="tbox">
																		<s:textfield name="uaddress2" id="address2" cssClass="inputBox" size="35" maxlength="50"/>
																	</div>
																</div>
																<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																	<div class="text"> <s:text name="user.city" /> <font color="red">*</font></div>
																	<div class="tbox">
																		<s:select name="ucity" id="emirate" cssClass="inputBoxS" list="emiratesInfo" listKey="CityCode" listValue="CityName"  headerKey="" headerValue="---Select---" />
																	</div>
																</div>
																<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																	<div class="text"> <s:text name="user.country" /> <font color="red">*</font></div>
																	<div class="tbox">
																		<s:select name="ucountry" id="country" list="countriesInfo" cssClass="inputBoxS" listKey="CountryCode" listValue="CountryName" />
																	</div>
																</div>
																<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																	<div class="text"> <s:text name="user.pobox" /> <font color="red">*</font></div>
																	<div class="tbox">
																		<s:textfield name="upobox" id="pobox" cssClass="inputBox" size="35" maxlength="6"/>
																	</div>
																</div>
																<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																	<div class="text"> <s:text name="user.telephone" /> </div>
																	<div class="tbox">
																		<s:textfield name="uphone" id="telephone"  cssClass="inputBox" size="35" maxlength="15"/>
																	</div>
																</div>
																<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																	<div class="text"> <s:text name="user.mobile" /> </div>
																	<div class="tbox">
																		<s:textfield name="umobile" cssClass="inputBox" size="35" maxlength="20"/>
																	</div>
																</div>
																<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																	<div class="text"> <s:text name="user.email" /> <font color="red">*</font> </div>
																	<div class="tbox">
																		<s:textfield name="uemail" cssClass="inputBox" size="35" maxlength="30"/>
																	</div>
																</div>
																<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																	<div class="text"> <s:text name="user.fax" /> </div>
																	<div class="tbox">
																		<s:textfield name="ufax" id="ufax" cssClass="inputBox" size="35" maxlength="10"/>
																	</div>
																</div>
																<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																	<div class="text"><s:text name="admin.user.region.select"/> <font color="red">*</font></div>
																	<div class="tbox">
																		<s:textarea name="attachedregion" id="attachedregion" cssClass="inputBoxA" rows="2" cssStyle="width: 85%;"/>
																		<input class="btn btn-sm btn-primary" value="..." style="float:right;" type="button" name="menu" onclick="return callPopupregion('<%=request.getContextPath()%>/regionSelectionUserMgm.action')"/>							
																	</div>
																</div>
																
																<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																	<div class="text"><s:text name="admin.user.branch.select"/> <font color="red">*</font></div>
																	<div class="tbox">
																		<s:textarea name="branchId" id="branchId" cssClass="inputBoxA" rows="2" cssStyle="width: 85%;"/>
																		<input class="btn btn-sm btn-primary" value="..." style="float:right;" type="button" name="menu" onclick="return callPopupbranch('<%=request.getContextPath()%>/branchSelectionUserMgm.action')"/>							
																	</div>
																</div>
																<%-- <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																	<div class="text"> <s:text name="user.linked.location" /> </div>
																	<div class="tbox">
																		<s:select name="broLinkLoc" id="broLinkLoc" cssClass="inputBoxS" list="linkedBranchList"  listKey="FS_BRANCH_CODE" listValue="FS_BRANCH_NAME"  headerKey="" headerValue="---Select---" />
																	</div>
																</div>	 --%>											
															</div>
														</div>
													</div>
												</div>
											</div>
											<s:if test='"new".equals(mode)'>
											<div class="row">
												<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
													<div class="panel panel-primary">
														<div class="panel-heading">
															<s:text name="user.login.creation" />
														</div>
														<div class="panel-body">
															<div class="row">
																<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																	<div class="text"> <s:text name="user.new" /> <font color="red">*</font> </div>
																	<div class="tbox">
																		<s:textfield name="userId"  cssClass="inputBox" size="35" maxlength="15"/>
																	</div>
																</div>
																<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																	<div class="text"> <s:text name="user.password" /> <font color="red">*</font> </div>
																	<div class="tbox">
																		<s:password name="password" cssClass="inputBox" maxlength="20"/>
																	</div>
																</div>
																<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
																	<div class="text"> <s:text name="user.rpassword" /> <font color="red">*</font> </div>
																	<div class="tbox">
																		<s:password name="repassword" cssClass="inputBox" maxlength="20"/>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											</s:if>
											<br class="clear" />
											<div class="row">
												<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
													<s:submit onclick="this.form.action='getABListUserMgm.action';this.form.submit();" name="submit1" cssClass="btn btn-sm btn-danger" value="Back" /> &nbsp;&nbsp;&nbsp;
													<s:submit name="submit2" cssClass="btn btn-sm btn-success" value="Submit" />
												</div>
											</div>
										</div>
									</div>
								</s:else>
								<s:hidden name="agencyCode"/>
								<s:hidden name="mode"/>
								<s:hidden name="mode1"/>
								<s:hidden name="uagencyCode"/>
								<s:hidden name="borganization"/>
								<s:hidden name="login_Id" value="%{#ulogin_Id}"/>
								<s:token/>
								</s:form>
						</div>
					</div>
						
				 	<div class="tab2" style="display:none;">
						<div id='<s:property value="%{responsiveTab}" default="2"/>'>
							<div class="row">
								<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">	
									<s:form id="form1" name="form1" method="post" action="" theme="simple">
									<s:if test='"product".equals(mode1)'>
										<div class="row">
											<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">	
												<s:actionerror cssStyle="color: red;" />
												<s:actionmessage cssStyle="color: green;" />												
												 <s:if test="hasActionErrors()" >
												 	<s:set var="responsiveTab" value='%{"2"}'/>												 	
												 </s:if>
											</div>
										</div>
										<br/>
									</s:if>
									<div class="row">
										<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
											<div class="panel panel-primary">
												<div class="panel-heading">
													<s:text name="user.product" />
												</div>
												<div class="panel-body">
													<s:if test='"updatesuccess".equals(display)'>
														<div class="row">
															<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">	
																<span class="label label-md label-success" ><s:label key="product.modify.success"/></span>
															</div>
														</div>
														<br/>
														<div class="row">
															<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
																<input type="button" onclick="fnsubmit('back','getABListUserMgm', this.form)" name="back" class="btn btn-sm btn-danger" value="Back" />
															</div>
														</div>
													</s:if>
													<s:elseif test='"newsuccess".equals(display)'>
														<div class="row">
															<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">	
																<span class="label label-md label-success" ><s:label key="product.new.success"/></span>
															</div>
														</div>
														<br/>
														<div class="row">
															<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
																<input type="button" onclick="fnsubmit('back','getABListUserMgm', this.form)" name="back" class="btn btn-sm btn-danger" value="Back" />
															</div>
														</div>
													</s:elseif>
													<s:else>
														<div class="row">
															<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
															<s:if test='commisionDetails.size()>0'>
																<div id="commisionDetailss">
																	<table class="table table-bordered commissionDetails" id="record" width="100%" cellspacing="0">
																		<thead>
																		<tr>
																			<th class="no-sort"></th>
																			<th><s:text name="Products" /></th>
																			<th><s:text name="Special Discount" /></th>
																			<th><s:text name="Sum Insured (SAR)" /></th>
																			<th><s:text name="Provision for Credit" /></th>
																		</tr>
																		</thead>
																		<tbody>																	
																		<s:iterator value="commisionDetails" var="cdet"  status="status">
																			<tr>
																				<td align="center"><s:checkbox name="product[%{#status.index}]" value='%{#cdet.PRODUCT=="Y"?true:false}'/></td>
																				<td align="center"><s:property value="%{#cdet.uproductName}"/></td><s:hidden name="uproductId[%{#status.index}]" value="%{#cdet.uproductId}"/><s:hidden name="uproductName[%{#status.index}]" value="%{#cdet.uproductName}"/>
																				<s:if test='%{uproductId!="11"}'>
																					<td align="center"><s:textfield name="specialDis[%{#status.index}]" value="%{#cdet.specialDis}" cssClass="inputBox" maxlength="15"/></td>
																					<td align="center"><s:textfield name="insEndLimit[%{#status.index}]" value="%{#cdet.insEndLimit}" cssClass="inputBox" maxlength="15"/></td>
																				</s:if>
																				<s:else>
																					<td colspan="2" align="center">
																						<input type="button" name="opencov" value="Open Cover Certificate"  onclick="return callPopup('<%=request.getContextPath()%>/getOCCertificateUserMgm.action?uagencyCode=<s:property value="uagencyCode"/>&agencyCode=<s:property value="agencyCode"/>')" class="btn btn-sm btn-warning" />
																							<s:hidden name="specialDis[%{#status.index}]" value="%{#cdet.specialDis}"/>
																							<s:hidden name="insEndLimit[%{#status.index}]" value="%{#cdet.insEndLimit}"/>
																							<s:hidden name="openCover" id="openCover" value="%{#cdet.open_cover_no}"/>
																					</td>																					
																				</s:else>
																				<s:hidden name="receipt[%{#status.index}]" value="N"></s:hidden>
																				<td align="center"> 
																				<s:radio name="freight[%{#status.index}]" list="#{'Y':'Yes','N':'No'}"  value="%{#cdet.freight==null?'N':#cdet.freight}"/></td>																			
																			</tr>
																		</s:iterator>																	
																	</tbody>
																</table>
																</div>
																<br class="clear" />
																<div align="center">
																	<input type="button"  name="submit1" class="btn btn-sm btn-danger" value="Back" onclick="fnsubmit('back','getABListUserMgm', this.form)"/> &nbsp;&nbsp;&nbsp;
																	<s:submit name="submit3" cssClass="btn btn-sm btn-success" value="Submit" onclick="addProduct();"/>
																</div>
															</s:if>
															<s:else> No products found</s:else>	
															</div>
														</div>
													</s:else>
												</div>
											</div>
										</div>
									</div>
									<s:hidden name="agencyCode"/>
									<s:hidden name="borganization"/>
									<s:hidden name="uagencyCode"/>
									<s:hidden name="mode1"/>
									<s:hidden name="login_Id" value="%{#ulogin_Id}"/>
									<s:token/>
									</s:form>
								</div>
							</div>
						</div>
					</div>
						 <div class="tab3" style="display:none;">
						<s:if test='!"new".equals(mode)'>
						<div id="3">
							<s:form id="newPwd" name="newPwd" method="post" theme="simple">
								<div class="row">
									<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">	
										<div class="panel panel-primary">
											<div class="panel-heading">
												<s:text name="user.usermanagement" />
											</div>
											<div class="panel-body">
												<s:if test='"login".equals(mode1)'>
													<div class="row">
														<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">	
															<s:actionerror cssStyle="color: red;" />
															<s:actionmessage cssStyle="color: green;" />
														</div>
													</div>
													<br/>
												</s:if>
												<div class="row">
													<div class="">
														<table width="100%">
															<tbody>
															<tr>
																<td width="30%"><s:label key="user.new"/> : </td>
																<td width="70%" colspan="2"> <s:property value="ulogin_Id"/>( <s:property value="uagencyCode"/> ) </td>
															</tr>	
															<tr>
																<td width="30%"><s:text name="broker.nameNpassword"/> : </td>
																<td width="30%"><s:password name="password" cssClass="inputBox" maxlength="20" onkeyup="passwordStrength(this.value)"/></td>
																<td width="40%"><s:text name="broker.passwordmessage"/> </td>
															</tr>
															<tr align="center">
																<td width="30%">&nbsp;</td>
																<td colspan="2" align="left" style="padding-left: 10px;"><div id="passwordDescription">Password not entered</div><div id="passwordStrength" class="strength0"></div></td>
															</tr>
															<tr>
																<td width="30%"><s:label key="user.rpassword"/> : </td>
																<td width="30%"><s:password name="repassword" cssClass="inputBox" maxlength="20"/> </td>
																<td width="40%">&nbsp;</td>
															</tr>
															<tr><td>&nbsp;</td></tr>
															<tr>
																<td colspan="4" align="center">
																	<s:submit onclick="this.form.action='getABListUserMgm.action';this.form.submit();" name="submit1" cssClass="btn btn-sm btn-danger" value=" Cancel " /> &nbsp;&nbsp;&nbsp;
	               													<s:submit onclick="this.form.action='checkPwdUserMgm.action';this.form.submit();" name="submit1" cssClass="btn btn-sm btn-success" value=" Submit " />
																</td>
															</tr>
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<s:hidden name="index" value="2"/>
								<s:hidden name="borganization"/>
								<s:hidden name="agencyCode"/>
								<s:hidden name="firstname"/>
								<s:hidden name="uagencyCode"/>
								<s:hidden name="mode1"/>
								<s:hidden name="login_Id" value="%{#ulogin_Id}"/>
								<s:token/>
							</s:form>
						</div>
						</s:if>
						</div>
					</div>
				</div>
			</div>
		</div>
</div>
<script type="text/javascript">

jQuery(function ($) {
	  $("#tabShow").click(function() {
	    $(".tab1").show();
	    $(".tab2").css("display" , "none");
	    $(".tab3").css("display" , "none");
	  });
	  $("#tabShow1").click(function() {
	    $(".tab2").show();
	    $(".tab1").css("display" , "none");
	    $(".tab3").css("display" , "none");
	  });
	  $("#tabShow2").click(function() {
		    $(".tab3").show();
		    $(".tab1").css("display" , "none");
		    $(".tab2").css("display" , "none");
		  });
});


function fnCall(from){
	if(from=='edit')
		document.info.action = from+"BrokerMgm.action?mode=edit";
	else if(from=='userDetail')
		document.info.action = "getABListUserMgm.action?mode1=broker";
	else if(from=='edituser')
		document.info.action = "editUserMgm.action?mode1=broker&mode=edit";
	else if(from=='viewuser')
		document.info.action = "viewUserMgm.action?mode1=broker";
	else if(from=='customerDetail')
		document.info.action = "getABListCustomerMgm.action?mode1=broker";
	else if(from=='referal')
		document.info.action = "getOCListReferal.action";
	else if(from=='openCover')
		document.info.action = "opencoverBrokerMgm.action";
	else
		document.info.action = from+"BrokerMgm.action";
	document.info.submit();
}
function passwordStrength(password){
	var desc = new Array();
	desc[0] = "Very Weak";
	desc[1] = "Weak";
	desc[2] = "Better";
	desc[3] = "Medium";
	desc[4] = "Strong";
	desc[5] = "Strongest";
	var score   = 0;
	if (password.length > 6) score++;
	if ( ( password.match(/[a-z]/) ) && ( password.match(/[A-Z]/)) ) score++;
	if ( password.match(/\d+/)) score++;
	if ( password.match(/.[@,#,$,%]/))score++;
	if ( (password.length > 10) && (password.match(/.[@,#,$,%]/)) && (password.match(/[a-z]/) ) && (password.match(/[A-Z]/)) && (password.match(/\d+/)))score++;
	document.getElementById("passwordDescription").innerHTML = desc[score];
	document.getElementById("passwordStrength").className = "strength" + score;
}
$(function(){
	var dt = new Date();
	dt.setFullYear(new Date().getFullYear()-18);
	$('#udob').datepicker({
		todayHighlight: true,
    	format: "dd/mm/yyyy",
	  	viewMode: "years",
	  	yearRange: "-100:+0",
	  	endDate: dt
	}).on('changeDate', function(e){
	    $(this).datepicker('hide');
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

function forward1(agcode, id, value, mode1){
	postRequest('<%=request.getContextPath()%>/getUserAjaxUserMgm.action?reqFrom='+id+'&agencyCode='+agcode+'&productID='+value+'&mode1='+mode1, id);
}
function fnRegion1(agcode, id){
	postRequest('<%=request.getContextPath()%>/getUserAjaxUserMgm.action?reqFrom='+id+'&agencyCode='+agcode, id);
}	
function fnRegion(agcode, id){

	 $.ajax({
        type: "POST",
        url: '${pageContext.request.contextPath}/getUserAjaxUserMgm.action?reqFrom='+id+'&agencyCode='+agcode,
        success: function(data){
            $('#' + id).html(data);
            $('#attachedregion').multiselect({ 
                includeSelectAllOption: true,
                  enableFiltering:true 
                  
            	});
        }
        });
       // getAjaxCover(value,'coverdepartid0','0');
}
function fnsubmit(from, action, frm){
	frm.action=action+".action";
	frm.submit();
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
	document.form1.action="addProductUserMgm.action";
	document.form1.submit();	
}

function callPopupregion(url){	 
	var checkedItems='';
	try
	{
		var elements=document.getElementById("broker");		 
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
		return callPopup(url+'?agencyCode='+checkedItems);
	else
		alert('Please Select Broker');	
}
function callPopupbranch(url){	 
	var checkedItems='';
	var agencycode='';
	try
	{
		 checkedItems=document.getElementById("attachedregion").value;		 
		 agencycode=document.getElementById("broker").value;		 
	}catch(e){}	 	 
	if(checkedItems!=null && checkedItems!="")
		return callPopup(url+'?selregions='+checkedItems+'&agencyCode='+agencycode);
	else
		alert('Please Select Attached Region');	
}
</script>
</body>
</html>