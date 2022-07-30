<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				<div class="panel panel-primary">
					<div class="panel-heading txtB">
						<s:text name="motor.feedbackfrom" />
					</div>
					<div class="panel-body">
					<%-- <div class="row">
							<div class="col-xs-12">
								<s:if test='quoteNo!=null && quoteNo!="" && isArabic=="ar"'>
			                		<div class="info-box pull-left" style="font-size: 12px;">
				                        <div class="bg-indigo" >
				                            <s:text name="label.quote.no" />
				                         		<s:property value="quoteNo"/>
				                        </div>
				                    </div>				
								</s:if>
								<s:if test='quoteNo!=null && quoteNo!="" && isArabic!="ar"'>
			                		<div class="info-box pull-right" style="font-size: 12px;">
				                        <div class="bg-indigo" >
				                            <s:text name="label.quote.no" />
				                        	<s:property value="quoteNo"/>
				                        </div>
				                    </div>				
								</s:if>
							</div>
							 
						</div>--%>
						<div class="row">
							<div class="col-xs-12 col-sm-12">
								<div class="form-group form-float">
									<label class="form-label">
										<s:text name="label.feedback.question1" />
									</label>
									<div class="form-line pull-center">
										<s:if test='isArabic=="ar"' >
											<s:radio list="#{'E':'ممتاز','A':'متوسط','P':'ضعيف'}" name="feedQuestion1" id="feedQuestion1" />
										</s:if>
										<s:else>
											<s:radio list="#{'E':'Excellent','A':'Average','P':'Poor'}" name="feedQuestion1" id="feedQuestion1" />
										</s:else>
									</div>
								</div>
							</div>
							<div class="col-xs-12 col-sm-12">
								<div class="form-group form-float">
									<label class="form-label">
										<s:text name="label.feedback.question2" />
									</label>
									<s:if test='isArabic=="ar"' >
									<div class="form-line pull-center">
										<s:radio list="#{'Y':'نعم','N':'لا'}" name="feedQuestion2" id="feedQuestion2" />
									</div>
									</s:if>
									<s:else>
									<div class="form-line pull-center">
										<s:radio list="#{'Y':'Yes','N':'No'}" name="feedQuestion2" id="feedQuestion2" />
									</div>
									</s:else>
								</div>
							</div>
							<div class="col-xs-12 col-sm-12">
								<div class="form-group form-float">
									<label class="form-label">
										<s:text name="label.feedback.question3" />
									</label>
									<div class="form-line pull-center">
										<s:textarea name="feedQuestion3" id="feedQuestion3" cssClass="form-controlA"  cssStyle="width: 100%;"	onkeyup="textLimit(this,'200')" />
									</div>
								</div>
							</div>
						</div>
						
						<%--<div class="row">
							<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">								 
		                		<div class="info-box pull-center" style="font-size: 12px;">
			                        <button type=button name="Submit2" class="btn btn-sm btn-warning" data-toggle="modal" data-target="#smallModal" >
																<s:text name="motor.save" />
															</button>
			                    </div>  
							</div>
							 --%> 
						</div>
					</div>
				</div>
			</div>
			
		</div>
	
		<div class="modal" id="smallModal" role="dialog">
             <div class="modal-dialog" role="document">
                 <div class="modal-content">
                     <div class="modal-header">
                         <h4 class="modal-title" id="smallModalLabel"><s:text name="motor.feedbackfrom" /></h4>
                     </div>
                     <div class="modal-body">
                          <div class="row">			                          	
							<div class="col-xs-12" style="margin-bottom: 0px;">
									<s:text name="label.feedback.compliment"></s:text>
							</div>
						 </div>
                     </div>
                     <div class="modal-footer">
                         <button type="submit" class="btn btn-sm btn-success waves-effect" onclick='update("updFeedbackMotor.action");'><s:text name="label.motor.close"/></button>
                	</div>
            	</div>
        	</div>
    	</div>
	 
</body>
<SCRIPT type="text/javascript">
function showModel(){
	
}
</SCRIPT>
</html>