<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  
<body onload="progressbarInvoke(); ">
<s:form name="uploadResult" method="post" theme="simple">
<div class="panel panel-primary">
	<div class="panel-heading">
		<s:label key="upload.uploadDetails"/>
	</div>
	<div>
	<div class="page-title">
		<div class="title_left">
			<h3><s:text name="Excel Upload" /></h3>
		</div>
		<div class="pull-right">
			<s:text name="Transaction ID" />&nbsp;:&nbsp;<s:property value="tranId"/>
		</div>
		<div class="clearfix"></div>	
	</div>
	<div class="clearfix"></div>
	<div class="row">
		<div class="col-xs-12">
			<div class="x_panel" style="padding: 0px;">
				<div class="x_content" style="padding: 0px;margin-top: 0px">
					<div id="contentcontainer" class="layoutHeightFleet">
						<div class="progress progress-striped" style="height: 40px;">
						    <div class="progress-bar progress-bar-striped progress-bar-success active" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
						    	<span style="line-height: 40px; font-size: 18px; color: #FFFFFF;" id="progressMessage" ></span>
						    </div>
						</div>
					</div>
				</div>
			</div>
		</div>						
	</div>
</div>
<s:hidden name="pageFor" id="pageFor" />
<s:hidden name="customerName" id="customerName" />
<s:hidden name="email" id="email" />
<s:hidden name="tranId" id="tranId"/>	
<s:hidden id="typeId" name="typeId" />
<s:token/>	 
</div>
<script>
var sec=2;
 function UpdateTimer(){
            	//console.log('exec');               
                ///document.getElementById("time").innerHTML = sec;
                if(sec == 2){
                	var tranId= document.getElementById("tranId").value;
                	progressbar("<%=request.getContextPath()%>/rest/motor/fileProgress/"+tranId,"progressMessage");
                    sec=0;
                   // window.clearInterval(1000); 
                }
                sec = sec+1;
            }   
              
             function stopTimer() {
 				   clearTimeout(timerId);
			 }
                   
function progressbar(strUrl, id){
	$.ajax({
		   url: strUrl,		   
		   error: function() {
		      $('#'+id).html('<p>An error has occurred in Upload</p>');
		   },		   
		   success: function(data) {
		      if(data.status=='Moving to Master'){
		   	 		//document.getElementById("proceed").style.display='block';
		   	 		//document.getElementById("proceedMsg").style.display='block';
		   	 		stopTimer();
		   	 		//proceedTran('<s:property value="tranId"/>');
		   	 		frmSubmit();
		   	 	}else{
			   	 	document.getElementById("progressMessage").innerHTML=data.status; 
			   	}
		   },
		   beforeSend : function(){
			   
           },
           complete : function(){
        	 
           },
		   type: 'POST'
	});	
}
function progressbarInvoke(){
	timerId=setInterval("UpdateTimer()", 1000);
}
function frmSubmit(){
	document.uploadResult.action = 'redirectTranOpenUpload.action?';
	document.uploadResult.submit();
}
var $progress = $('.progress');
var $progressBar = $('.progress-bar');
var $progressMessage = $('#progressMessage')

setTimeout(function() {
    $progressBar.css('width', '10%');
    setTimeout(function() {
        $progressBar.css('width', '30%');
        $progressMessage.text('Converted to CSV');
        setTimeout(function() {
            $progressBar.css('width', '60%');
            $progressMessage.text('Moved to Raw');
            setTimeout(function() {
	            $progressBar.css('width', '100%');
	            $progressMessage.text('Moving to Master');
	            setTimeout(function() {
	                
	            }, 500); // WAIT 5 milliseconds
	        }, 2000); // WAIT 2 seconds
        }, 2000); // WAIT 2 seconds
    }, 1000); // WAIT 1 seconds
}, 1000); // WAIT 1 second
</script>
</s:form>
</body>
</html>