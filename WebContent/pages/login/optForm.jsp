<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html <s:if test="locale.language == 'ar'">dir="rtl"</s:if>>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>OTP</title>
<link href="<%=request.getContextPath()%>/newlogin/Logo.png" rel="icon" type="image/png">
<link href="<%=request.getContextPath()%>/newlogin/style(2).css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/newlogin/animate.css" rel="stylesheet">
<link media="screen" href="<%=request.getContextPath()%>/bootstrap/css/font-awesome.css" rel="stylesheet" type="text/css">
<link media="screen" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
</head>
<body>
				<s:form id="motor" name="motor" method="post" theme="simple" >
					<div class="row">							
			                <div class="col-xs-12">                	
			                	<div class="panel-group" id="accordion_100" role="tablist" aria-multiselectable="true">
			                       <div class="panel panel-primary">
			                           <div class="panel-heading" role="tab" id="headingOne_100">
			                               <h4 class="panel-title">
			                                      <s:text name="label.otp.verification"/>
			                               </h4>
			                           </div>
			                        <div class="panel-body" style="padding: 0px;">
			                        <s:if test='hasActionErrors()'>
										<div class="row">
											<div class="col-xs-12">
												<span style="color: red;"><s:actionerror /></span>
											</div>
										</div>
									</s:if>
									<div class="row">
										<div class="col-xs-4" >
										</div>
										<div class="col-xs-4" >
										<div class="form-group form-float">
											<s:text name="label.otp.send"/>&nbsp;<s:property value="ologinId"/></label> 
											<br class="clear"/>
												<label class="form-label">
													<s:text name="label.otp.enter" /> <font color="red">*</font>
												</label>
												<div class="form-line">
													<s:if test='"ar".equals(locale.language)'>
													<s:textfield name="otp" id="otp" cssClass="form-control tooltipContent" placeholder="استخدام كلمة المرور لمرة واحدة" data-content="One Time Password" maxlength="8"  />
													</s:if>
													<s:else>
													<s:textfield name="otp" id="otp" cssClass="form-control tooltipContent" placeholder="One Time Password" data-content="One Time Password" maxlength="8"  />
													</s:else>
													  <div class="otpHide" id="reotp" align="right">
														<button type="submit" id="reGenerateOtp" class="btn btn-sm btn-warning" onclick="callOTP(this.value);">
															<s:text name="label.cancel.regotp" />
														</button>
													</div>
												</div>
											</div>
											<div align="right">
												<span style="color: red;" ><s:text name="label.otp.validity"/> </span>
											</div>
										</div>
										<div class="col-xs-4" >
										</div>
									</div>
									<br class="clear"/>
									<div class="row">
										<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">											
											<button type="submit" id="submitOtp"  class="btn btn-sm btn-success" onclick="validateOTP();">
												<s:text name="label.cancel.submit" />
											</button>
										</div>
									</div>
									<br class="clear"/>
								</div>
								</div> 
			                </div>
		          		</div>
			         
						<s:hidden name="display" />
						<s:hidden name="premiumtType" />
						<s:hidden name="otpId" />
						<s:hidden name="actionType" />
						<s:hidden name="fleetNo" />
						<s:hidden name="applicationNo" />
						<s:hidden name="quoteNo" />
						<s:hidden name="quoteStatus" />
						<%--<s:hidden name="referralMsg"/>--%>
						<s:hidden name="endTypeId" />
						<s:hidden name="policyNo" />
						<s:hidden name="brokerCompany" />
						<s:hidden name="custName" />
						<s:hidden name="otpStatus" />
						<s:hidden name="reqFrom" id="reqFrom" />
						<s:hidden name="bloginId"/>
						<s:hidden name="loginType"/>
						<s:hidden name="ologinId"/>
					</div>
					</s:form>
					<script src="<%=request.getContextPath()%>/dataTables/js/jquery-1.11.1.min.js" type="text/javascript"></script>
					<script type="text/javascript" src="<%=request.getContextPath()%>/newlogin/slick.min.js"></script>
					
					<script type="text/javascript">
					function validateOTP(){
						document.motor.action = '<%=request.getContextPath()%>/LoginvalidOTP?request_locale=<%=request.getParameter("request_locale")==null?"en":request.getParameter("request_locale")%>';
						document.motor.submit();	
					}
					function callOTP(vald){
						document.motor.action='<%=request.getContextPath()%>/LoginotpLogin.action?request_locale=<%=request.getParameter("request_locale")==null?"en":request.getParameter("request_locale")%>';
						document.motor.submit();
					}
					</script>
</body>
</html>