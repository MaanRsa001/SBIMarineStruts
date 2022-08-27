<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML>
<html>
<head>
	<style>
  	.information-grid{
  	grid-area: main;
  display: grid;
  grid-auto-rows: auto;
  /* gap: 10px; */
  grid-template-columns: 1fr 1fr;
  	}
  	.information-grid-item{
  	display:flex;
  	justify-content: space-between;
  	border: 1px solid #ccc;
  	padding: 0.6rem;
  	}
  		.information-grid-item div:last-child{
  		color:#8f7f7fed;
  		}
  	</style>
</head>
<body>
<div class="row">	
	<div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
		<div class="panel panel-primary">
			<div class="panel-body">
				<s:if test='%{borganization!=null && !"".equals(borganization)}'>
					<div class="row">
						<div class="col-xs-6 col-sm-6 col-md-12 col-lg-12">
							<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="Edit" onclick="fnCall('edituser')"/>
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
							<input type="button" class="btn btn-sm btn-info adminMenuBtn" value="Edit" onclick="fnCall('edituser')"/>
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
		<div class="panel panel-primary">
			<div class="panel-heading">
				<s:if test='%{borganization!=null && !"".equals(borganization)}'>
					<s:property value="borganization"/>(<s:property value="agencyCode"/>)
				</s:if>
				 <s:else>
				 	User Management
				 </s:else>
			</div>
			<div class="panel-body">
				<s:form id="info" name="info" method="post" action="" theme="simple">
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
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
								<div class="panel panel-primary">
									<div class="panel-heading">
										<s:text name="User Details" />
									</div>
									<div class="panel-body">
										<div class="information-grid">
													<div class="information-grid-item">
														<div><s:text name="user.broker"/></div>
														<div><s:property value="brokerName"/></div>
													</div>
													<div class="information-grid-item">
														<div><s:text name="user.type"/></div>
														<div><s:property value='utype'/></div>
													</div>
													<div class="information-grid-item">
														<div><s:text name="user.userId"/></div>
														<div><s:property value="userId"/></div>
													</div>
													<div class="information-grid-item">
														<div><s:text name="user.name"/></div>
														<div><s:property value="uname"/></div>
													</div>
													<div class="information-grid-item">
														<div><s:text name="user.gender"/></div>
														<div><s:property value='%{ugender=="M"?"Male":"Female"}'/></div>
													</div>
													<div class="information-grid-item">
														<div><s:text name="user.dob"/></div>
														<div><s:property value="udob"/></div>
													</div>
													<div class="information-grid-item">
														<div><s:text name="user.occupation"/></div>
														<div><s:property value="uoccupation"/></div>
													</div>
													<div class="information-grid-item">
														<div><s:text name="user.address1"></s:text> </div>
														<div><s:property value="uaddress1"/></div>
													</div>
													
													<div class="information-grid-item">
														<div><s:text name="user.address2"/></div>
														<div><s:property value="uaddress2"/></div>
													</div>
													<div class="information-grid-item">
														<div><s:text name="user.city"/></div>
														<div><s:property value='emirate'/></div>
													</div>
													<div class="information-grid-item">
														<div><s:text name="user.country"/></div>
														<div><s:property value="ucountryNa"/></div>
													</div>
													<div class="information-grid-item">
														<div><s:text name="user.pobox"/></div>
														<div><s:property value="upobox"/></div>
													</div>
													<div class="information-grid-item">
														<div><s:text name="user.telephone"/></div>
														<div><s:property value='uphone'/></div>
													</div>
													<div class="information-grid-item">
														<div><s:text name="user.mobile"/></div>
														<div><s:property value="umobile"/></div>
													</div>
													<div class="information-grid-item">
														<div><s:text name="user.email"/></div>
														<div><s:property value="uemail"/></div>
													</div>
													<div class="information-grid-item">
														<div><s:text name="user.fax"></s:text> </div>
														<div><s:property value="ufax"/></div>
													</div>
													<div class="information-grid-item">
														<div><s:text name="user.nationality"></s:text> </div>
														<div><s:property value="unationalityName"/></div>
													</div>
													<div class="information-grid-item">
														<div><s:text name="user.loginid"></s:text> </div>
														<div><s:property value="ulogin_Id"/></div>
													</div>
												</div>
									
									</div>
								</div>
							</div>
						</div>
						<br class="clear" />
						<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
							 
								<s:if test='%{borganization!=null && !"".equals(borganization)}'>
									<input type="button" class="btn btn-sm btn-danger" value="Back" onclick="fnBack('getABListBrokerMgm')"/>
								</s:if>
								<s:else>
									<input type="button" class="btn btn-sm btn-danger" value="Back" onclick="fnBack('getABListUserMgm')"/>
								</s:else>
							</div>
						</div>
					</div>
				</div>
				<s:hidden name="agencyCode"/>
				<s:hidden name="uagencyCode"/>
				<s:hidden name="login_Id"/>
				<s:token/>
				<%--<s:hidden name="borganization"/>--%>
				</s:form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
function fnCall(from){
	if(from=='edit')
		document.info.action = from+"BrokerMgm.action?mode=edit";
	else if(from=='userDetail')
		document.info.action = "getABListUserMgm.action?mode1=broker";
	else if(from=='edituser')
		document.info.action = "editUserMgm.action?mode1=broker&mode=edit";
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
function fnBack(from){
	document.info.action = from+".action";
	document.info.submit();
}
</script>
</body>
</html>