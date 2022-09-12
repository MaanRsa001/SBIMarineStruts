<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Marine Login</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Titillium+Web:wght@300;600;700;900&display=swap" rel="stylesheet">
</head>
<style>
html{
background-color: #a9c0df;
}
.marginTop_15px{
	margin-top: 10px;
	
}

    .text-color{
        color: white;
    }
    .example-spacer {
    margin-left: 500px;
    flex: 1 1 auto;
  }
  .navbar-light .navbar-brand {
    color: #FFFFFF;
   }
   body{
        font-family: 'Titillium Web', sans-serif !important;
		background-color: #a9c0df;
   }
   body,h1{
    font-family: Arial, sans-serif;  
   }
   .mySlides {display: none;}
img {vertical-align: middle;}

/* Slideshow container 
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}
*/
/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

.navbar-brand img{
   width:200px;
  }

/* On smaller screens, decrease text size */
@media only screen and (max-width: 500px) {
  .text {font-size: 11px}
  
  .navbar-brand img{
   width:100px;
  }
}


		.Cards{
		 box-shadow: 0 1px 1px rgba(0,0,0,0.15), 
              0 2px 2px rgba(0,0,0,0.15), 
              0 4px 4px rgba(0,0,0,0.15), 
              0 8px 8px rgba(0,0,0,0.15);
		margin-top:15px;
		padding:10px;
		background-color:white;
		
		}
		.form-group{
		 margin-top:5px;
		}


         .form-control{
          
           height:45px;
           border-radius:0px;
         }
         
         .fixed-top{
           padding-right:10px;
         }
         
         .navbar{
           background-color:white !important;
          font-weight:bold;
         }
         
         .main-heading{
         
          font-weight:600; 
          font-family: 'Titillium Web', sans-serif !important;
          letter-spacing:2px;
         }
         
         .main-container{
          background-color:transparent;
          text-align:center;  
          color:white;   
         }
         
         .sub-heading{
          font-family: 'Titillium Web', sans-serif !important;
          font-size:20px
     
         }
         .slideshow-container{    
		 
		 height:410px;
		 
         }
         .slideshow-container img{
	         object-fit: fill;
		    width: 100%;
		    height: 100%;
         }
	   nav{
	    width: 82%;
	    margin: auto;
	    box-shadow: 0 1px 1px rgba(0,0,0,0.15), 
              0 2px 2px rgba(0,0,0,0.15), 
              0 4px 4px rgba(0,0,0,0.15), 
              0 8px 8px rgba(0,0,0,0.15);
	    margin-top:5px;
	   }

		.sameheight{
		height:300px;
		text-align:center;
		
		}

		.btn-light{
		  border-radius:0;
		  background-color:#1d4b80;
		  color:white;
		}
		
		.btn-success{
		 border-radius:0;
		}
		.number-heading{
		  font-size:100px;
		  font-weight: 600;
		   font-family: 'Titillium Web', sans-serif !important;
		}  
		
		.noCards{
		  padding-bottom:20px;
		  
		}
</style>
<body>




<s:form name="form1" method="post" action="" theme="simple">


<div class="container">

    <div class="navCards">
	   <nav class="navbar navbar-expand-md bg-light navbar-light fixed-top">
		 
		  <a class="navbar-brand" href="#">
		  <img src="<%=request.getContextPath()%>/images1/logonew.png" >
		  </a>
		
		
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
		    <span class="navbar-toggler-icon"></span>
		  </button>
		
		 
		  <div class="collapse navbar-collapse justify-content-end" id="collapsibleNavbar">
		    <ul class="navbar-nav">
		      <li class="nav-item pr-4">
		        <a class="navbar-link" href="#" onclick="getCodeVerf();">VERIFY A CERTIFICATE</a>
		      </li>
		      <li class="nav-item pr-4">
		        <a class="navbar-link" href="#"  onclick="getReportClaim();">REPORT A LOSS</a>
		      </li>
		      <li class="nav-item pr-1">
		       <a class="navbar-link" href="#">TRACK A CLAIM</a>
		      </li>
		    </ul>
		  </div>
		</nav>
    </div>
      
      
    <div class="main-container" style="margin-top:10rem;">
        <h1 class="main-heading">
          Marine Cargo Insurance
        </h1> 
        <p class="sub-heading">
           Ensure your marine cargo is covered against direct physical loss or damage with SBI Cooperative Insurance Company
        </p>
    </div>  
      
   <div class="Cards"> 
   
      <div class="row">
                <div class="col-md-7">
             
		           <div class="slideshow-container">
			           <img src="images/home-banner.jpg" alt="dubai">
				        <%-- <div class="mySlides">
				          <div class="numbertext">1 / 3</div>
				          <img src="<%=request.getContextPath()%>/images1/cargo.jpg" style="width:100%;height: 400px;">
				          <div class="text">Caption Text</div>
				        </div>
				        
				        <div class="mySlides">
				          <div class="numbertext">2 / 3</div>
				          <img src="<%=request.getContextPath()%>/images1/cargo3.jpg" style="width:100%;height: 400px;">
				          <div class="text">Caption Two</div>
				        </div>
				        
				        <div class="mySlides">
				          <div class="numbertext">3 / 3</div>
				          <img src="<%=request.getContextPath()%>/images1/cargo2.jpg" style="width:100%;height: 400px;">
				          <div class="text">Caption Three</div>
				        </div>--%>
			        
			      </div> 
				      
		         </div>
		    
            <div class="col-md-5 pt-1">
              <div class="row">
                   <!-- <div class="col-md-6 col-6 col-sm-6 text-center">
                   <button class="btn btn-light" onclick="getTab('Broker'); return false;">
                   Broker / Customer Login
                   </button> 
                   </div> 
                   <div class="col-md-6 col-6 co-sm-6 text-center">
                   <button class="btn btn-light" onclick="getTab('admin'); return false;" >Login</button>
                   </div>-->
              </div>
              <div class="row">
					<div class="col-md-12" style="color: red;">
						<s:actionerror/>
					</div>
			  </div>
			  <div class="row">
			      <div class="col-md-12">
				      <div id="broker">	      
				           <div class="form-group">
				             <label class="align-center">Username</label>
				             <s:textfield name="bloginId" id="bloginId" class="form-control" placeholder="Enter Your UserName"  maxlength="50" />
				           </div>
				       
				           <div class="form-group">
				             <label class="align-center">Password</label>
				             <s:password name="bpwd" id="bpwd"   placeholder="Enter Your Password" class="form-control"  />
				           </div>
				       </div>    
				       <div id="issuer">
                  
		                  <div class="form-group">
		                     <label class="align-center">Username</label>
		                     <s:textfield name="aloginId" id="aloginId"   class="form-control"   placeholder="Enter Your UserName"  maxlength="50" />
		                  </div>
		                  
		                  <div class="form-group">
		                    <label class="align-center">Password</label>
                            <s:password name="apwd" id="apwd"  placeholder="Enter Your Password" class="form-control" />
		                  </div>
		                  <div class="row">
		                       <div class="col-md-6">
		                            <div class="form-group">
			                             <label class="align-center">Region</label>
			                             <s:select name="region" id="region"  class="form-control" list="regionList"  listKey="RegionId" listValue="RegionName" headerKey="" headerValue="--Select--" onchange="getBranchList('?region='+this.value,'branchSelection');"/>
				                  	</div>
		                       </div>
		                       <div class="col-md-6">
		                             <div class="form-group">
			                             <label class="align-center">Branch</label>
			                             <div id="branchSelection"><s:select name="branch" id="branch"  class="form-control" list="branchList"  listKey="BranchCode" listValue="BranchName" headerKey="" headerValue="--Select--"/></div>
					                 </div>
		                       </div>
		                  </div>
		                  
		                       
                  
                      </div>      
			      </div>
			      
			  </div>
			  <div class="row">
		         <div class="col-md-12 text-center">
			        <button class="btn btn-success" onclick="callSubmit('login');">LOG IN</button>
			     </div> 
			  </div>
			 <div class="row marginTop_15px">
	           <div class="col-md-6 text-center">
	              <a href="#" onclick="change('changePwd');" class="fPass" style="cursor: pointer;">Change your Password?</a><s:hidden name="appId" value="16"/> <br/>          
	           </div>
	           <div class="col-md-6 text-center">
	              <a href="#" onclick="change('forgotPwd')" class="fPass" style="cursor: pointer;">Forgot your Password?</a>
	           </div>
			 </div>
          </div>
      </div>
   
   </div>
   
   <div class="noCards">
    <div class="mt-5 main-container">
        <h1 class="main-heading">
           Marine Cargo Insurance: What Can SBI Cooperative Insurance Company Provide?
        </h1> 
    </div>    
      
   <div class="row">
      <div class="col-md-4">
        <div class="Cards sameheight">
           <h4 class="main-heading">Lost in Transit</h4>
           <br>
          <p>
            Our marine cargo insurance offers coverage for direct physical loss of or damage to shipments that are in the process of being imported to Malta.
          </p> 
         
        </div>
      </div>
      <div class="col-md-4">
        <div class="Cards sameheight">
		     <h4 class="main-heading">Flexible Coverages</h4>
		     <br>
		     <p>
		       Whether you need coverage for a one-off shipment or annual open coverage, we can provide against loss for most types of nonhazardous goods (including household and personal effects). Policies cover shipments by land, air and sea.
		     </p>  
		   </div>
      </div>
      <div class="col-md-4">
        <div class="Cards sameheight">
		     <h4 class="main-heading">Door-to-Door Coverage</h4>
		     <br>
	         <hp>
              To ensure that your items have more than enough time to reach their destination, our coverage takes effect from the time the item leaves the warehouse, premises or place of storage and continues through its ordinary course of transit, ending when it reaches its destination.		     
             </p>  
		   </div>
      </div>
   </div>
   
   </div>
   
   
   <div class="noCards">
    <div class="mt-5 main-container">
        <h1 class="main-heading">
          How it works?
        </h1> 
    </div>    
      
   <div class="row">
      <div class="col-md-4">
        <div class="Cards sameheight">
           <h4 class="main-heading">Enter Details</h4>
           <br>
          <p>
           Insure your goods before moving by entering a few details like material type, category and pick and drop location  
          </p> 
          <h1 class="number-heading">
		        1
		   </h1>
         
        </div>
      </div>
      <div class="col-md-4">
        <div class="Cards sameheight">
		     <h4 class="main-heading">Get the Price</h4>
		     <br>
		     <p>
               Get an instant quote by entering material details, the insurance quote is displayed on your screen within seconds		  
             </p>  
             <h1 class="number-heading">
		        2
		     </h1>
		   </div>
      </div>
      <div class="col-md-4">
        <div class="Cards sameheight">
		     <h4 class="main-heading">
		        Buy Online
		     </h4>
		     <br>
	         <p>
              You can confirm the insurance booking if agreed to the quote or contact support team for any detail.            
             </p>  
             <h1 class="number-heading">
		        3
		     </h1>
		   </div>
      </div>
   </div>
   
   </div>
   
   
   

   
	 
   
   
     
        
        
       
        
       
   <%-- <div class="row" style="width: 1420px;">
        <div class="card" style="width: 800px;margin-left: 40px;" >
            <div class="card-header">
                <h2>Certificate issuance</h2>
            </div>
            <div class="card-body">
                <h3 style="font-size: 19px;">For companies engaged in international trade, a certificate of insurance is an essential document.
                    To assist in the production of these certificates,
                    Chubb has electronic certificates of insurance available on the spot via the CargoAdvantage system.</h3> <br> 
                <h3 style="font-size: 19px;">
                    All that is required is Internet access, a User ID and a password provided by the local Chubb Office.
                </h3>
            </div>
        </div>
        
        
        <div class="card" style="width: 450px;margin-left: 20px;" >
            <div class="card-header"> 
                <div class="row">
                <button class="btn btn-light" onclick="getTab('Broker'); return false;">BROKER LOGIN</button> &nbsp; / &nbsp; 
                <button class="btn btn-light" onclick="getTab('admin'); return false;" >ISSUER LOGIN</button>
            </div>
            </div>
            <div>
				<div>
					<div style="color: red; background: #c2c2c2">
						<s:actionerror/>
					</div>
				</div>
			</div>
            <div class="card-body">
            <div id="broker">
                <div class="col-md-7">
                    <label class="align-center">UserName</label>
                  </div>
                  <div class="form-group col-md-7">
                  <s:textfield name="bloginId" id="bloginId" style="width: 300px;" class="form-control" placeholder="Enter Your UserName"  maxlength="50" />
                  </div>
                  <div class="col-md-7">
                    <label class="align-center">Password</label>
                  </div>
                  <div class="form-group col-md-7">
                  <s:password name="bpwd" id="bpwd" style="width: 300px;"   placeholder="Enter Your Password" class="form-control"  />
                    
                  </div>
            </div>
            <div id="issuer">
                <div class="col-md-7">
                    <label class="align-center">Username</label>
                  </div>
                  <div class="form-group col-md-7">
                  <s:textfield name="aloginId" id="aloginId"  style="width: 300px;" class="form-control"   placeholder="Enter Your UserName"  maxlength="50" />
                    
                  </div>
                  <div class="col-md-7">
                    <label class="align-center">Password</label>
                  </div>
                  <div class="form-group col-md-7">
                  <s:password name="apwd" id="apwd" style="width: 300px;" placeholder="Enter Your Password" class="form-control" />
                    
                  </div>
                  <div class="col-md-7">
                    <label class="align-center">Region</label>
                  </div>
                  <div class="form-group col-md-7">
                  <s:select name="region" id="region" style="width: 300px;" class="form-control" list="regionList"  listKey="REGION_CODE" listValue="REGION_NAME" headerKey="" headerValue="--Select--" onchange="getBranchList('?region='+this.value,'branchSelection');"/>
                    
                  </div>
                  <div class="col-md-7">
                    <label class="align-center">Branch</label>
                  </div>
                  <div class="form-group col-md-7">
                  <div id="branchSelection"><s:select name="branch" id="branch" style="width: 300px;" class="form-control" list="branchList"  listKey="BRANCH_CODE" listValue="BRANCH_NAME" headerKey="" headerValue="--Select--"/></div>
                    
                  </div>
            </div>
        </div>
            <div class="card-footer">
            
                <button class="btn btn-success" onclick="callSubmit('login');">LOG IN</button>
                
            </div>

        </div>
    </div>
        <div class="card" style="width: 800px;margin-left: 20px;margin-top: 10px;">
            <div class="card-header">
                <h2>Benefits</h2>
            </div>
            <div class="card-body">
                <h3 style="font-size: 19px;">This user-friendly system has multiple benefits for insured clients, including:</h3> <br> 
                <ul style="font-size: 17px;">
                    <li>Certificates issued on the spot to support transportation and trade documentation</li>
                    <li>The system is accessible anywhere, anytime via computer with Internet access</li>
                    <li>The certificates are automatically archived and can easily be referenced in the event of a claim</li>
                    <li>Streamlined operations process of automated monthly invoicing and billing</li>
                    <li>CargoAdvantage also provides logistics companies with access to Incoterms® 2010,
                         a glossary of common Marine terms and claims forms for ease of reference and convenience</li>
                </ul>
            </div>
        </div>--%> 
        
        
        
        
</div>
<s:token/>
	<s:hidden name="status" id="status"/>
	<s:hidden name="appId" value="16"/>
	<s:hidden name="swidth" id="swidth" value=""/>
	<s:hidden name="loginType" id="loginType"/>	
	<s:token />
</s:form>
</body>
<script>
getTab('admin');
    function getTab(loginType){
        if(loginType=='Broker'){
            document.getElementById("broker").style.display = "block";
			document.getElementById("issuer").style.display = "none";
			document.getElementById("loginType").value = loginType;
        }
        else{
            document.getElementById("issuer").style.display = "block";
			document.getElementById("broker").style.display = "none";
			document.getElementById("loginType").value = loginType;
        }
    }
   /*  var slideIndex = 0;
    showSlides();
    
    function showSlides() {
      var i;
      var slides = document.getElementsByClassName("mySlides");
      var dots = document.getElementsByClassName("dot");
      for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";  
      }
      slideIndex++;
      if (slideIndex > slides.length) {slideIndex = 1}    
      for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
      }
      slides[slideIndex-1].style.display = "block";  
      dots[slideIndex-1].className += " active";
      setTimeout(showSlides, 4000); // Change image every 2 seconds
    } */
    function callSubmit(val){
		if(val=='login'){
	    	document.form1.action="${pageContext.request.contextPath}/Loginsubmit.action";
	    }
	    document.form1.submit();
	}
    function getBranchList(val, id) {
     		postRequest('<%=request.getContextPath()%>/Login'+id+'.action'+val, id);
    }
    function postRequest(strUrl, id){
    	$.ajax({
    		   url: strUrl,		   
    		   error: function() {
    		      $('#'+id).html('<p>An error has occurred in jquery Ajax</p>');
    		   },		   
    		   success: function(data) {			 
    		      $('#'+id).html(data);
    		   },
    		   beforeSend : function(){
    			   $('#wait').show();
               },
               complete : function(){
            	   $('#wait').hide();
                },
    		   type: 'POST'
    	});	
    }
    
    function getCodeVerf(){
		document.form1.action="${pageContext.request.contextPath}/getCodeVerify.action";
	    document.form1.submit();
	}
    
    function getReportClaim(){
		document.form1.action="${pageContext.request.contextPath}/claiminit.action";
	    document.form1.submit();
	}
    
	function change(stat){
		document.getElementById("status").value = stat;
		document.form1.action="<%=request.getContextPath()%>/Loginchange.action";
		document.form1.submit();
	}
    </script>
</html>