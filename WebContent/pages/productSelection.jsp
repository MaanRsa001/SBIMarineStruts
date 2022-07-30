<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<style type="text/css">
    	.parent {
    		color: #FFFFFF;
    	}
    	.hover-content {
		    display:none;
		}
						
		.parent:hover .hover-content {
		    display:block;
    		position: absolute;
    		width: 90%;   		
		}
		
		.btnContent {
			position: absolute;
			bottom: 30px;
			width: 90%;
			display:none;
		}
		.parent h3 {
			text-align: center;
			color: #FFFFFF;
		} 
		.parent:hover .btnContent {
			display:block;
		}
		
		.panel-body {
			min-height: 300px;			
		}
		
		.carInsurance {
			background: url('images/car_insurance.jpg');
			background-size: cover;
		}
		
		.travelInsurance {
			background: url('images/travel_insurance.jpg');
			background-size: cover;
		}
		
		.marineInsurance {
			background: url('images/newMarine5.jpg');
			background-size: cover;
			background-position:center center;
		}
		
		.homeInsurance {
			background: url('images/home_insurance.jpg');
			background-size: cover;
		}
		.yachtInsurance {
			background: url('images/yacht_insurance.jpg');
			background-size: cover;
		}
		.jetskiInsurance{
			background: url('images/jetski_insurance.jpg');
			background-size: cover;
		}
		.btn {
			width: 100%;
		}
		
		.btnContent .col-xs-6 {
			margin-bottom: 5px;
		}
		
		.btnContent .col-xs-12 {
			margin-bottom: 5px;
		}
		</style>
	</head>
	<body>
		<s:form name="ProductSelection" id="ProductSelection" action="" theme="simple">
			<s:set var="adminMarineCnt" value="0"/>
			<div class="row" style="margin-top: 120px;">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<div class="panel panel-primary">			
						<div class="panel-body" align="center">
							<s:if test="#session.ProductDetails.size()>0">
								<s:iterator value="#session.ProductDetails" var="productVar" status="stat">
									<s:if test='"65".equalsIgnoreCase(#productVar.ProductId)'>
										<div class="col-xs-12 col-sm-12 col-md-6">
											<div class="panel panel-primary">
												<div class="panel-body parent carInsurance">
													<h3> <s:property value="#productVar.ProductName"/> </h3>
												    <div class="hover-content"></div>
													<div class="row btnContent">
														<s:if test='"admin".equalsIgnoreCase(#session.usertype)'>
															<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
																<s:a class="btn btn-lg btn-primary" style="text-decoration: none;" href="#" onClick="getAdminHome('%{#productVar.ProductId}')">GET DETAILS</s:a>
															</div>
														</s:if>
														<s:else>
												        	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
												        		<s:a class="btn btn-lg btn-primary" style="text-decoration: none;" href="#" onClick="getPro('%{#productVar.ProductId}','NEW','','%{#productVar.ProductId}','','0','','')">Get a Quote</s:a>
												        	</div>
												        	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
<!-- 												        		<a href="#" class="btn btn-lg btn-default"> Learn More </a> -->
												        	</div>
												        </s:else>
											        </div>
												</div>
											</div>
										</div>
									</s:if>
									<s:elseif test='"30".equalsIgnoreCase(#productVar.ProductId)'>
										<div class="col-xs-12 col-sm-12 col-md-6">
											<div class="panel panel-primary">
												<div class="panel-body parent homeInsurance">
													<h3> <s:property value="#productVar.ProductName"/> </h3>
												    <div class="hover-content"></div>
													<div class="row btnContent">
														<s:if test='"admin".equalsIgnoreCase(#session.usertype)'>
															<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
																<s:a class="btn btn-lg btn-primary" style="text-decoration: none;" href="#" onClick="getAdminHome('%{#productVar.ProductId}')">GET DETAILS</s:a>
															</div>
														</s:if>
														<s:else>
															<s:iterator value="officeProductScheme" var="ofsVar" status="ofsStat">
																<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
													        		<s:a class="btn btn-lg btn-primary" style="text-decoration: none;" href="#" onClick="getPro('%{#productVar.ProductId}','NEW','','%{#productVar.ProductId}','','0','%{#ofsVar.SCHEME_ID}','%{#ofsVar.SCHEME_NAME}')">Get a Quote</s:a>
													        	</div>
												        	</s:iterator>
															<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
<!-- 												        		<a href="#" class="btn btn-lg btn-default"> Learn More </a> -->
												        	</div>
												        </s:else>
											        </div>
												</div>
											</div>
										</div>
									</s:elseif>
									<s:elseif test='"33".equalsIgnoreCase(#productVar.ProductId)'>
										<div class="col-xs-12 col-sm-12 col-md-6">
											<div class="panel panel-primary">
												<div class="panel-body parent travelInsurance">
													<h3> <s:property value="#productVar.ProductName"/> </h3>
												    <div class="hover-content"></div>
													<div class="row btnContent">
														<s:if test='"admin".equalsIgnoreCase(#session.usertype)'>
														<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
																<s:a class="btn btn-lg btn-primary" style="text-decoration: none;" href="#" onClick="getAdminHome('%{#productVar.ProductId}')">GET DETAILS</s:a>
															</div>
														</s:if>
														<s:else>
												        	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
												        		<s:a class="btn btn-lg btn-primary" style="text-decoration: none;" href="#" onClick="getPro('%{#productVar.ProductId}','NEW','','%{#productVar.ProductId}','','0','','')">Get a Quote</s:a>
												        	</div>
<!-- 												        	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6"> -->
<!-- 												        		<a href="#" class="btn btn-lg btn-default"> Learn More </a> -->
<!-- 												        	</div> -->
												        </s:else>
											        </div>
												</div>
											</div>
										</div>
									</s:elseif>
									<s:elseif test='"0".equalsIgnoreCase(#adminMarineCnt) && ("3".equalsIgnoreCase(#productVar.ProductId) || "11".equalsIgnoreCase(#productVar.ProductId))'>
										<div class="col-xs-12 col-sm-12 col-md-6">
											<div class="panel panel-primary">
												<div class="panel-body parent marineInsurance">
													<h3>
														<s:if test='"admin".equalsIgnoreCase(#session.usertype)'>
															<s:set var="adminMarineCnt" value="1"/>
															MARINE INSURANCE
														</s:if>
														<s:else>
															<s:property value="#productVar.ProductName"/>
														</s:else>
													</h3>
												    <div class="hover-content"></div>
													<div class="row btnContent">
														<s:if test='"admin".equalsIgnoreCase(#session.usertype)'>
															<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
																<s:a class="btn btn-lg btn-primary" style="text-decoration: none;" href="#" onClick="getAdminHome('%{#productVar.ProductId}')">GET DETAILS</s:a>
															</div>
														</s:if>
														<s:else>
												        	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
												        	<s:if test='"3".equalsIgnoreCase(#productVar.ProductId)'>
												        		<s:a class="btn btn-lg btn-primary" style="text-decoration: none;" href="#" onClick="getPro('%{#productVar.ProductId}','NEW','','%{#productVar.ProductId}','','0','','')">Get a Quote</s:a>
												        	</s:if>
												        	<s:else>
												        		<s:a class="btn btn-lg btn-primary" style="text-decoration: none;" href="#" onClick="getPro('%{#productVar.ProductId}','NEW','','%{#productVar.ProductId}','','0','','')">Get a Certificate</s:a>
												        	</s:else>
												        	</div>
<!-- 												        	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6"> -->
<!-- 												        		<a href="#" class="btn btn-lg btn-default"> Learn More </a> -->
<!-- 												        	</div> -->
												        </s:else>
											        </div>
												</div>
											</div>
										</div>
										<s:if test='"RSAIssuer".equalsIgnoreCase(#session.usertype) && ("11".equalsIgnoreCase(#productVar.ProductId))'>
										<div class="col-xs-12 col-sm-12 col-md-6">
											<div class="panel panel-primary">
												<div class="panel-body parent marineInsurance">
													<h3>
													OPEN COVER POLICY
													</h3>
												    <div class="hover-content"></div>
													<div class="row btnContent">
															<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
																<s:a class="btn btn-lg btn-primary" style="text-decoration: none;" href="#" onClick="getOpenPolicy()">GET DETAILS</s:a>
															</div>
											        </div>
												</div>
											</div>
										</div>
										</s:if>
									</s:elseif>
									<s:elseif test='"40".equalsIgnoreCase(#productVar.ProductId)'>
										<div class="col-xs-12 col-sm-12 col-md-6">
											<div class="panel panel-primary">
												<div class="panel-body parent yachtInsurance">
													<h3> <s:property value="#productVar.ProductName"/> </h3>
												    <div class="hover-content"></div>
													<div class="row btnContent">
														<s:if test='"admin".equalsIgnoreCase(#session.usertype)'>
															<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
																<s:a class="btn btn-lg btn-primary" style="text-decoration: none;" href="#" onClick="getAdminHome('%{#productVar.ProductId}')">GET DETAILS</s:a>
															</div>
														</s:if>
														<s:else>
												        	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
												        		<s:a class="btn btn-lg btn-primary" style="text-decoration: none;" href="#" onClick="getPro('%{#productVar.ProductId}','NEW','','%{#productVar.ProductId}','','0','','')">Get a Quote</s:a>
												        	</div>
												        	<!--<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
												        		<a href="#" class="btn btn-lg btn-default"> Learn More </a>
												        	</div>
												        --></s:else>
											        </div>
												</div>
											</div>
										</div>
									</s:elseif>
									<s:elseif test='"42".equalsIgnoreCase(#productVar.ProductId)'>
										<div class="col-xs-12 col-sm-12 col-md-6">
											<div class="panel panel-primary">
												<div class="panel-body parent jetskiInsurance">
													<h3> <s:property value="#productVar.ProductName"/> </h3>
												    <div class="hover-content"></div>
													<div class="row btnContent">
														<s:if test='"admin".equalsIgnoreCase(#session.usertype)'>
															<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
																<s:a class="btn btn-lg btn-primary" style="text-decoration: none;" href="#" onClick="getAdminHome('%{#productVar.ProductId}')">GET DETAILS</s:a>
															</div>
														</s:if>
														<s:else>
												        	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
												        		<s:a class="btn btn-lg btn-primary" style="text-decoration: none;" href="#" onClick="getPro('%{#productVar.ProductId}','NEW','','%{#productVar.ProductId}','','0','','')">Get a Quote</s:a>
												        	</div>
												        	<!--<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
												        		<a href="#" class="btn btn-lg btn-default"> Learn More </a>
												        	</div>
												        --></s:else>
											        </div>
												</div>
											</div>
										</div>
									</s:elseif>
								</s:iterator>
							</s:if>
							<s:else>
								Sorry! No Products Available
							</s:else>
						</div>
					</div>
				</div>
			</div>
			<s:hidden name="selectProd" />
			<s:hidden name="schemeId" />
			<s:hidden name="contenTypeId" />
			<s:hidden name="menuType" />
			<s:hidden name="reqFrom" />
			<s:hidden name="productId" />
			<s:hidden name="product" />
			<s:token/>
		</s:form>
		<script type="text/javascript">
		function getPro(pid,mod,dtdiff,homepid,qopt,tpid,officeScheme,OFSName) {
			if(pid=='3') {
				document.ProductSelection.selectProd.value=pid;
				document.ProductSelection.menuType.value='CHART';
				document.ProductSelection.reqFrom.value='PS';
				document.ProductSelection.productId.value=pid;
				document.ProductSelection.action ="${pageContext.request.contextPath}/initReport.action";
				document.ProductSelection.submit();
			}else if(pid=='40' || pid=='42') {
				document.ProductSelection.selectProd.value=pid;
				document.ProductSelection.menuType.value='CHART';
				document.ProductSelection.reqFrom.value='PS';
				document.ProductSelection.productId.value=pid;
				document.ProductSelection.action ="${pageContext.request.contextPath}/initReport.action";
				document.ProductSelection.submit();
			} else if(pid=='11') {
				document.ProductSelection.selectProd.value=pid;
				document.ProductSelection.productId.value=pid;
				document.ProductSelection.action ="${pageContext.request.contextPath}/viewOpenCoverReport.action";
				document.ProductSelection.submit();
			} else if(pid=='31'||pid=='32'||pid=='33'||pid=='34'||pid=='41' || pid=='65' || pid=='30') {
				document.ProductSelection.selectProd.value=pid;
				if(pid=='30') {
					document.ProductSelection.schemeId.value=officeScheme;
					document.ProductSelection.contenTypeId.value=tpid;
				}
				document.ProductSelection.menuType.value='CHART';
				document.ProductSelection.reqFrom.value='PS';
				document.ProductSelection.productId.value=pid;
				document.ProductSelection.action ="${pageContext.request.contextPath}/initReport.action";
				document.ProductSelection.submit();
			}
			return false;
		}
		function getAdminHome(productId) {
			document.ProductSelection.product.value=productId;
			document.ProductSelection.action ="${pageContext.request.contextPath}/homeAdmin.action";
			document.ProductSelection.submit();
		}
		function getOpenPolicy(productId){
			document.ProductSelection.product.value=productId;
			document.ProductSelection.action ="${pageContext.request.contextPath}/newQuoteOpenCover.do";
			document.ProductSelection.submit();
		}
		</script>
	</body>
</html>