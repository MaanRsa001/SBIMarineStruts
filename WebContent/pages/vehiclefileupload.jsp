<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"
	isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<style type="text/css">
.corners {
	background: #4db6ac;
	width: 250px;
	height: 50px;
	text-align: center;
	color: white;
}

.cornersbody {
	width: 250px;
	height: 250px;
	text-align: center;
	border-style: dotted;
	border-top: 1px;
	color: black;
	border-color: #4db6ac;
}

.dropzone {
	border: none !important;
	height: 220px;
}
/* upload    */
.box {
	width: 60%;
	height: 100%;
	background: #FFF;
	margin: 40px auto;
	padding: 20px;
}

.effect8 {
	position: relative;
	-webkit-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.3), 0 0 40px
		rgba(0, 0, 0, 0.1) inset;
	-moz-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.3), 0 0 40px
		rgba(0, 0, 0, 0.1) inset;
	box-shadow: 0 1px 4px rgba(0, 0, 0, 0.3), 0 0 40px rgba(0, 0, 0, 0.1)
		inset;
}

.effect8:before, .effect8:after {
	content: "";
	position: absolute;
	z-index: -1;
	-webkit-box-shadow: 0 0 20px rgba(0, 0, 0, 0.8);
	-moz-box-shadow: 0 0 20px rgba(0, 0, 0, 0.8);
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.8);
	top: 10px;
	bottom: 10px;
	left: 0;
	right: 0;
	-moz-border-radius: 100px/10px;
	border-radius: 100px/10px;
}

.effect8:after {
	right: 10px;
	left: auto;
	-webkit-transform: skew(8deg) rotate(3deg);
	-moz-transform: skew(8deg) rotate(3deg);
	-ms-transform: skew(8deg) rotate(3deg);
	-o-transform: skew(8deg) rotate(3deg);
	transform: skew(8deg) rotate(3deg);
}

.row-pdd-bottom {
	padding-bottom: 15px;
}
</style>
<link href="<%=request.getContextPath()%>/uploadscript/css/dropzone.css"
	rel="stylesheet">
<script
	src="<%=request.getContextPath()%>/uploadscript/js/dropzone-struts2.js"></script>
<div id="support" class="section wb">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="">
					<div id="message"></div>
					<s:form theme="simple" id="form" class="row" name="form"
						method="post">
						<fieldset class="row-fluid">
							<div class="box" style="margin-bottom: 0px; padding: 0px">
								<div class="section-title title-head"
									style="margin-bottom: 0px;">
									<h3 class="info-details">
										Upload Excel File <span
											style="float: right; padding-right: 10px;"><s:if
												test="requestreferenceno.length() != 0">
												<span style="padding-right: 10px;">Ref.No</span>
												<s:property value="requestreferenceno" />
											</s:if></span>
									</h3>
								</div>
								<!-- end title -->
							</div>
							<div class="box effect8" style="margin-top: 0px;">
								<div class="row" align="center" id="divUpload">
									<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
										<div class="textV">
											<s:text name="Open Cover No" />
										</div>
										<div class="tboxV">
											<s:property value="openCoverNo" />
										</div>
									</div>
								</div>
								<br />
								<br />
								<div class="row" align="center" id="divUpload">
									<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12"></div>
									<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
										<div class="row corners">
											<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
												<i class="fa fa-cloud-upload" aria-hidden="true"></i>&nbsp;Upload&nbsp;Excel
												file
											</div>
										</div>

										<div class="row cornersbody">

											<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 dropzone"
												id='drop1'>
												<i id="excelicon" class="fa fa-file-excel-o"
													aria-hidden="true"
													style="font-size: 48px; color: #4db6ac; margin: 50px;"></i>
											</div>
										</div>
										<div class="row" id="errdesc"
											style="color: red; font-weight: 700;">&nbsp;</div>
									</div>
									<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12"></div>





								</div>
								<div class="row" align="center" id="divDownload"
									style="display: none;">

									<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12"></div>
									<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
										<div class="row corners">
											<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
												<i class="fa fa-cloud-upload" aria-hidden="true"></i>&nbsp;Download&nbsp;Excel
												file
											</div>
										</div>

										<div class="row cornersbody">
											<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
												<i id="excelicon" class="fa fa-download" aria-hidden="true"
													style="font-size: 48px; color: #4db6ac; margin: 50px;"></i>
												<span id="spanfilename"></span>
											</div>
										</div>
										<div class="row" id="errdesc"
											style="color: red; font-weight: 700;">&nbsp;</div>
									</div>
									<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12"></div>





								</div>
							</div>
							<br />
							<br />
							<div class="row row-pdd-bottom" align="center">
								<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4"></div>
								<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
								<button class="btn  btn-block btn-lg btn-danger "
										id="btnback" onclick="getTranList()">Back</button>
									
								</div>
								<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
										<button class="btn  btn-block btn-lg btn-success "
										disabled="true" id="btnnext" onclick="next()">Next</button>
								</div>
								<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4"></div>
							</div>
						</fieldset>
						<s:hidden name="menuType" id="menuType" value="D"></s:hidden>
						<s:hidden name="uploadedtranid" id="uploadedtranid"></s:hidden>
						<s:hidden name="openCoverNo" id="openCoverNo"/>
						<s:hidden name="endtYN" id="endtYN"/>
						<s:hidden name="reqFrom" id="reqFrom"/>
						<s:hidden name="lapsedStatus" id="lapsedStatus"/>
						<s:token />
					</s:form>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	Dropzone.autoDiscover = false;

	try {
		$("#drop1")
				.dropzone(
						{
							addRemoveLinks : false,
							maxFiles : 1,
							maxFilesize : 50,
							acceptedFiles : "application/vnd.ms-excel,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
							dictDefaultMessage : "Drag or Drop File",
							dictResponseError : 'Error while uploading file!',
							url : '<s:property value="fileurl"/>',
							headers : {
								"Authorization" : '<s:property value="fileauth"/>'
							},
							init : function() {
								var documentpath = '';
								this.on("maxfilesexceeded", function(file) {
									this.removeFile(file);
								});
								this
										.on(
												"sending",
												function(file, xhr, formData) {
													$("#errdesc").html('');
													$("#btnnext").attr(
															'disabled', true);
													formData
															.append(
																	"FileUploadReq",
																	'{<s:property value="fileReq" escapeHtml="false"/>}');
												});
								this
										.on(
												'error',
												function(file, response) {
													$("#btnnext").attr(
															'disabled', true);
													if (response == "You can't upload files of this type.")
														alert("JPEG type file only applicaple");
													else if (response
															.substring(0, 15) == "File is too big")
														alert("Your upload file is big (below 50Kb) ");
													else
														alert(response);
													this.removeFile(file);
												});
								this.on('success', function(file, resp) {
									// alert(resp);
									$("#excelicon").css("display", "none");
									$("#errdesc").html(resp.ProgressErrorDesc);
									if (resp.ProgressErrorDesc == null
											|| resp.ProgressErrorDesc == '') {
										$("#uploadedtranid").val(
												resp.UploadedTranId);
										$("#btnnext").attr('disabled', false);
									}
									/* if(resp.dropzoneMap.documentPath!=null){
									// alert(resp.dropzoneMap.documentPath);
									 	documentpath=resp.dropzoneMap.documentPath;
									 //this.removeFile(file);
									 }
									 if(resp.dropzoneMap.Error!=null){
									
									  alert(resp.dropzoneMap.Error);
									  this.removeFile(file);
									 }*/

								});
								this
										.on(
												"removedfile",
												function(file) {
													var desicion = confirm("File will be deleted. Do You Want to continue? ");
													if (desicion) {
														$("#excelicon").css(
																"display",
																"block");
														$("#btnnext").attr(
																'disabled',
																true);
														//  deleteDoc(documentpath);
														this.removeFile(file);
													}

												});
							}
						});
	} catch (e) {
	}

	/* $(document).ready(function() {
		$.ajax({
			 url : '${pageContext.request.contextPath}/upfiledataFleet.action?uploadedtranid=<s:property value="uploadedtranid"/>&requestreferenceno=<s:property value="requestreferenceno"/>',
			 error : function() {	    		
	    			alert('<p>Api have issue</p>');
	    	},
	    	success : function(dataq) {
	    		if(dataq.filedetail!=null){
	    			$("#divDownload").show();
	    			$("#divUpload").hide();
	    			$("#spanfilename").html('<a href="'+dataq.downloadfilepath+'" target="_blank"><b>'+dataq.filedetail.filename+'</b></a>');
	    			 $("#btnnext").attr('disabled', false);
	    			 
	    		}else{
	    			$("#divDownload").hide();
	    			$("#divUpload").show();
	    		}
	    		
	    	}
		});
	}); */
	function next() {
		document.form.action = "${pageContext.request.contextPath}/TransactionMarineVehicle.action";
		document.form.submit();
		return false;
	}
	function getTranList(){
		document.form.action="vehicleInitMarineVehicle.do";
		document.form.submit();
		}
</script>
