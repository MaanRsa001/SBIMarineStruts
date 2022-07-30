<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Report Claim</title>
	<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/apple-touch-icon.png" />
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/demo.css" />
	<link href="https://fonts.googleapis.com/css?family=Alegreya+Sans|Amiri|Cormorant+Garamond&display=swap" rel="stylesheet">
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap-multiselect.css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/datepicker3.css">	 
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/slimmenu.css">
	<link href="<%=request.getContextPath()%>/bootstrap/css/footable-0.1.css" rel="stylesheet" type="text/css">
	<link href="<%=request.getContextPath()%>/bootstrap/css/table-res.css" rel="stylesheet" type="text/css">
	<link href="<%=request.getContextPath()%>/bootstrap/css/easy-responsive-tabs.css" rel="stylesheet" type="text/css">
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css" />
	<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/style.css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
	<script src="<%=request.getContextPath()%>/bootstrap/js/modernizr.custom.63321.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/bootstrap/js/jquery-1.9.1.min.js"></script>
	<style>
	.PolicyVerification_Container{
	background-color:#f8f8ff;
	  box-shadow: rgba(50, 50, 93, 0.25) 0px 6px 12px -2px, rgba(0, 0, 0, 0.3) 0px 3px 7px -3px;
	}
	
	@media (min-width: 500px) {
	.PolicyVerification_Container .blueColor{
	     min-height: 150px;
	     max-height:100%;
	  }
	}

	@media only screen and (min-width: 510px) {
	
    }
    
    
	.PolicyVerification_Container .blueColor, 
	.PolicyVerification_Container .image,
	.PolicyVerification_Container .whiteColor, .PolicyVerification_Container .policyinfo{
	  min-height: 550px;
	  max-height:100%;
	  
	}
	.PolicyVerification_Container .blueColor{
	  background-color:#122c82;
	}
	.image{
	margin-left: -13%;
	}
	
	.whiteColor{
	margin-left:7%;
	background-color:transparent;
	}
	
	.parent {
    display: flex;
    height: 230px; /* Or whatever */
    }

	.child {
	    width: 200px;  /* Or whatever */
	    height: 200px; /* Or whatever */
	    margin: auto;  /* Magic! */
	}
	.headingnme{
	  color:white;
	  font-weight:bold;
	  font-size: 34px;
	  margin-top:100px;
	}
	.verifiColor{
	  color:#2196f3;
	  margin-left:20px;
	}
	.form-control {
    border: 0px solid #ccc;
    height: 50px;
    box-shadow: none;
    background-color: #e6e6e6;
    border-radius: 10px;
}
	.textbox-container{
	margin-top:120px;
	
	}
	.float-right{
	float:right;
	font-size:16px;
	}
	.labelheading{
	 font-size:16px;
	 font-weight:bold;
	}
	.policyinfo{
	 background-color:#f8f8ff;
	}
	.policyinfo ul{
	margin-top:20px;
	box-shadow: rgba(50, 50, 93, 0.25) 0px 6px 12px -2px, rgba(0, 0, 0, 0.3) 0px 3px 7px -3px;
	}
	.policyinfo ul li{
	  border:0;
	  
	}
	.policyinfo .list-group-item{
	border-bottom:2px solid #e6e6e6;
	}
	</style>
</head>
<body>
<div id="page" class="content">
	<div class="ielogo" style="text-align: center;">
	   <img id="Awnic InsuranceLogo" src="images/logonew.png" alt="logo" width="250">
    </div>	
     <div class="container">
       <form id="verifyPDF" name="verifyPDF" method="post">	
       <div class="PolicyVerification_Container">
	        <div class="row">
		       <div class="col-md-2 col-12 col-sm-12 blueColor">
		       
		       </div>
		       <div class="col-md-3 image text-center">
		            <h3 class="headingnme">Report <span class="verifiColor">Claim</span></h3>
		            <div class="parent">
					    <img class="child"  src="images1/shield.png" alt="logo" >
					</div>
		       </div>
		       <div class="col-md-7 whiteColor">
		          <div class="textbox-container">
			            <div class="row">
			                 <div class="col-md-8 col-md-offset-1">
			                     <div class="form-group">
								    <s:text name="Policy Number" />
								    <s:textfield name="policyNo"  class="form-control" />
								 </div>
			                 </div>
			            </div> 
			             <div class="row">
			                  <div class="col-md-8 col-md-offset-1">
			                      <div class="form-group">
								    <s:text name="Verification Code" />
								    <s:textfield name="code"  class="form-control" />
								 </div>
			                 </div>
			            </div> 
			                                        					
			            <div class="row">
							<div class="col-md-3 col-md-offset-2">
	                 			<input type="button" name="Submit1" style="cursor:pointer;" class="btn btn-block btn-sm btn-danger" value="Back " onclick="callSubmit('back')">	                            			
							</div>
							<div class="col-md-3">
							    <input type="button" name="Submit1" style="cursor:pointer;" class="btn btn-block btn-sm btn-success" value="Submit" onclick="callSubmit('submit')">
							</div>
						</div>
		          </div>
		       </div>
		   </div>
       </div>
       <s:token/>
       </form>
   </div>		
				
			
</body>
<script type="text/javascript">
	function callSubmit(val){
	       	if(val=='back'){
	       		document.verifyPDF.action="${pageContext.request.contextPath}/Loginpage.action";
	       	}
	       	else if(val=='submit'){
	       		document.verifyPDF.action="${pageContext.request.contextPath}/claimSearchPolicyNo.action";
	       	}
	          document.verifyPDF.submit();
	 	}
	
	function getSchedule(quoteNo , productId , policyNo,applicationNo){
		var URL ="${pageContext.request.contextPath}/getScheduleVerify.action?quoteNo="+quoteNo+"&productId="+productId+"&policyNo="+policyNo+"&applicationNo="+applicationNo;
		var bwidth = window.innerWidth;
		var bwidth1 = document.body.clientWidth;
		if(bwidth <= 768) {
			return popUp(URL,bwidth1,'500');
		} else {
			return popUp(URL,'750','500');
		}
	}
	
	</script>
</html>