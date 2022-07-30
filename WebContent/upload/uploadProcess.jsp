<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/file-upload/css/jquery.fileupload.css">
<style type="text/css">
.label {
	font-size: 100%;
}
#copyProgress {
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
  font-size: 18px;
}

#dataCopyProgress{
  position: absolute;
  top: 30%;
  left: 45%;
  z-index: 100;
  width: 100px;
  height: 100px;
  font-size: 18px;
}

.progress {
	height: 40px;
}
</style>
<s:form name="payoutUpload" id="payoutUpload" action="" enctype="multipart/form-data" theme="simple">
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
						<s:if test="hasActionErrors()">
							<div class="row">
								<div class="col-xs-12">
									<span style="color: red;"><s:actionerror /></span>
								</div>
							</div>
						</s:if>
						<div id="progress" class="progress progress-striped">
							<div class="progress-bar progress-bar-success" ><span style="line-height: 40px; font-size: 18px;" id="progressMessage" >Copying file to Server</span></div>
						</div>
						<div id="files" class="files"></div>
										    <br>    
										    <div id="time"></div>
										    <div id="errorDetails"></div>
										   <div class="row">
											<div class="col-xs-12" align="center">
												<!--<input type="button" class="btn btn-sm btn-danger" value="Back" onclick="showBack('edit')" >
												--><div id="proceedMsg" style='display:none;'>To Move Records and Group Click Proceed...</div>
												<input type="button" class="btn btn-sm btn-success" value="Proceed" id="proceed" style='display:none;' onclick="proceedTran(<s:property value="tranId"/>);"> 
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
</s:form>	

<script type="text/javascript">
 function UpdateTimer(){
            	//console.log('exec');               
                ///document.getElementById("time").innerHTML = sec;
                if(sec == 2){
                	var tranId= document.getElementById("tranId").value;
                	progressbar("<%=request.getContextPath()%>/rest/motor/fileProgress/"+tranId,"copyProgress");
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
		      $('#'+id).html('<p>An error has occurred in jquery Ajax</p>');
		   },		   
		   success: function(data) {
		      if(data.status=='URC'){
		   	 		document.getElementById("proceed").style.display='block';
		   	 		document.getElementById("proceedMsg").style.display='block';
		   	 		stopTimer();
		   	 		proceedTran('<s:property value="tranId"/>');
		   	 	}else{
			   	 	document.getElementById("progressMessage").innerHTML=data.statusDesc;
		   	 	}
		   },
		   beforeSend : function(){
			   
           },
           complete : function(){
        	 
           },
		   type: 'POST'
	});	
}
</script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/file-upload/js/vendor/jquery.ui.widget.js"></script>
<script src="//blueimp.github.io/JavaScript-Load-Image/js/load-image.all.min.js"></script>
<script src="//blueimp.github.io/JavaScript-Canvas-to-Blob/js/canvas-to-blob.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/file-upload/js/jquery.iframe-transport.js"></script>
<script src="<%=request.getContextPath()%>/file-upload/js/jquery.fileupload.js"></script>
<script src="<%=request.getContextPath()%>/file-upload/js/jquery.fileupload-process.js"></script>
<script src="<%=request.getContextPath()%>/file-upload/js/jquery.fileupload-image.js"></script>
<script src="<%=request.getContextPath()%>/file-upload/js/jquery.fileupload-audio.js"></script>
<script src="<%=request.getContextPath()%>/file-upload/js/jquery.fileupload-video.js"></script>
<script src="<%=request.getContextPath()%>/file-upload/js/jquery.fileupload-validate.js"></script>			    