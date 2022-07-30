<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
       <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="keywords" content="Maan Sarovar, Sea Trans, Marine Insurance">	
	<meta name="author" content="">
	<title> ::: AlRajhi - Clauses Information ::: </title>
	<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/AlRajhi_icon_header.jpg" />		
	<script type="text/javascript" src="js/common.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css" />
	<link href="<%=request.getContextPath()%>/bootstrap/css/style.css" rel="stylesheet" type="text/css" />
	<link href="<%=request.getContextPath()%>/bootstrap/css/font-awesome.css" rel="stylesheet" type="text/css" />
	
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.responsive.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.jqueryui.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.tableTools.css">
		<link href="<%=request.getContextPath()%>/dataTables/css/jquery-start-ui.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery.dataTables.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.jqueryui.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.responsive.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.tableTools.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery.dataTables.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/numeric-comma.js"></script>	
<style>
  .glyphicon-star{
    padding-right: 10px;
  }
  .list-group-item{
    color: #004085;
    background-color: #f8f8ff;
    border:0;
    box-shadow: rgba(50, 50, 93, 0.25) 0px 2px 5px -1px, rgba(0, 0, 0, 0.3) 0px 1px 3px -1px;
    margin-top:2px;
    
  }
  .padding-0{
   padding:0;
  }
  .margin-0{
  margin:0;
  }
  .inputBox {
    display: block;
    width: 100%;
    height: 40px;
    padding: 6px 12px;
    line-height: 1.42857143;
    background-color: #fff;
    background-image: none;
    border: 1.50px solid #ccc;
    border-radius: 10px;
    -webkit-box-shadow: inset 0 1px 1px rgb(0 0 0 / 8%);
    box-shadow: inset 0 1px 1px rgb(0 0 0 / 8%);
    color: black;
}
	textarea{
	
	height:100% !important;
	
	}
	.nav-pills{
	  border:0;
	}
	.nav-pills li a{
	  font-weight:bold;
	  box-shadow: 0 1px 1px rgba(0,0,0,0.25), 
              0 2px 2px rgba(0,0,0,0.20), 
              0 4px 4px rgba(0,0,0,0.15), 
              0 8px 8px rgba(0,0,0,0.10),
              0 16px 16px rgba(0,0,0,0.05);
	}
</style>		
		
</head>
<body> 

<div class="table0">
	<div class="tablerow">
		<s:actionmessage cssStyle="color: green; align: center;"/>
		<s:actionerror cssStyle="color: red; align: center;" />
	</div>
	<br/>
	<br/>
	<div class="tablerow" style="width: 100%;">
		<s:if test='(("add".equalsIgnoreCase(condStatus)) && (#session.user1 == "admin" || "RSAIssuer".equalsIgnoreCase(#session.usertype)))'>
			<s:if test="conditionsList['clausesDesc'].size > 0">
			<s:form name="addclauses" id="addclauses" theme="simple" action="" method="post">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<s:label key="premiumInfo.clauses" />
					</div>
					<div class="panel-body padding-0">
						<ul class="list-group margin-0" >
							<s:iterator value="conditionsList['clausesDesc']" var="clauses">
					    		<s:if test="%{CODE!=null}">
					    			<li class="list-group-item list-group-item-light">
					    			  <div class="row">
					    			    <div class="col-md-1"  style="padding-top: 17px;"><s:checkbox name="" id="clausesDesc%{CODE}Check" fieldValue="%{CODE}" value='%{condStatus=="modify"?true:false}' onclick="fnRemoveClauses('clausesDesc%{CODE}','clausesId%{CODE}');"/><s:hidden name="clausesId" value="%{CODE}" id="clausesId%{CODE}" disabled='%{condStatus=="add"?true:false}'/> </div>
										<div class="col-md-11"><s:textarea rows="2" id="clausesDesc%{CODE}"  name="clausesDesc" value="%{CODEDESC}" cols="119" onkeyup="textLimit(this,1000)" cssClass="inputBox" disabled='%{condStatus=="add"?true:false}' cssStyle="width: 100%;" /></div>
					    			  </div>
									</li>
				               </s:if>
					    	</s:iterator>
						</ul>						
					</div>
				</div>
				<s:hidden name="applicationNo" id="applicationNo"/>	
			<s:hidden name="quoteNo" id="quoteNo"/>
			<s:hidden name="coverId" id="coverId"/>
			<s:hidden name="condStatus" id="condStatus"/>
			<s:hidden name="conditionType" id="conditionType"/>
			</s:form>
			</s:if>
			<s:if test="conditionsList['extraClausesDesc'].size > 0">
			<s:form name="addwar" id="addwar" theme="simple" action="" method="post">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<s:label key="premiumInfo.war" />
					</div>
					<div class="panel-body padding-0">
						<ul class="list-group margin-0">
							<s:iterator value="conditionsList['extraClausesDesc']" >
					    		<s:if test="%{CODE!=null}">
					    			<li class="list-group-item list-group-item-light">
						    			<div class="row">
											<div class="col-md-1"  style="padding-top: 17px;"><s:checkbox name="" id="warDesc%{CODE}Check" fieldValue="%{CODE}" value='%{condStatus=="modify"?true:false}' onclick="fnRemoveClauses('warDesc%{CODE}','warId%{CODE}');"/><s:hidden name="warId" value="%{CODE}" id="warId%{CODE}" disabled='%{condStatus=="add"?true:false}'/> </div>
											<div class="col-md-11"><s:textarea id="warDesc%{CODE}" rows="2" name="warDesc" value="%{CODEDESC}" cols="119" onkeyup="textLimit(this,1000)" cssClass="inputBox" disabled='%{condStatus=="add"?true:false}' cssStyle="width: 100%;" /></div>
										</div>
									</li>
									
							  	</s:if>
					    	</s:iterator>
						</ul>						
					</div>
				</div>
				<s:hidden name="applicationNo" id="applicationNo"/>	
			<s:hidden name="quoteNo" id="quoteNo"/>
			<s:hidden name="coverId" id="coverId"/>
			<s:hidden name="condStatus" id="condStatus"/>
			<s:hidden name="conditionType" id="conditionType"/>
			</s:form>
			</s:if>
			<s:if test="conditionsList['exclusionsDesc'].size > 0">
			<s:form name="addexclusion" id="addexclusion" theme="simple" action="" method="post">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<s:label key="premiumInfo.exclusions" />
					</div>
					<div class="panel-body padding-0">
						<ul class="list-group margin-0">
							<s:iterator value="conditionsList['exclusionsDesc']" >
	    						<s:if test="%{CODE!=null}">	
					    			<li class="list-group-item list-group-item-light">
						    			<div class="row">
											<div class="col-md-1"  style="padding-top: 17px;"><s:checkbox name="" id="exclusionDesc%{CODE}Check" fieldValue="%{CODE}" value='%{condStatus=="modify"?true:false}' onclick="fnRemoveClauses('exclusionDesc%{CODE}','exclusionId%{CODE}');"/><s:hidden name="exclusionId" value="%{CODE}" id="exclusionId%{CODE}" disabled='%{condStatus=="add"?true:false}'/> </div>
											<div class="col-md-11"><s:textarea id="exclusionDesc%{CODE}" rows="2" name="exclusionDesc" value="%{CODEDESC}" cols="119" onkeyup="textLimit(this,1000)" cssClass="inputBox" disabled='%{condStatus=="add"?true:false}' cssStyle="width: 100%;"/></div>
										</div>
									</li>
						  		</s:if>
					    	</s:iterator>
						</ul>						
					</div>
				</div>
				<s:hidden name="applicationNo" id="applicationNo"/>	
			<s:hidden name="quoteNo" id="quoteNo"/>
			<s:hidden name="coverId" id="coverId"/>
			<s:hidden name="condStatus" id="condStatus"/>
			<s:hidden name="conditionType" id="conditionType"/>
			</s:form>
			</s:if>
			<s:if test="conditionsList['warrantyDesc'].size > 0">
			<s:form name="addwarranty" id="addwarranty" theme="simple" action="" method="post">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<s:label key="premiumInfo.warranties" />
					</div>
					<div class="panel-body padding-0">
						<ul class="list-group margin-0">
							<s:iterator value="conditionsList['warrantyDesc']" >
	    						<s:if test="%{CODE!=null}">
					    			<li class="list-group-item list-group-item-light">
						    			<div class="row">
											<div class="col-md-1" style="padding-top: 17px;">
											   <s:checkbox name="" id="warrantyDesc%{CODE}Check" fieldValue="%{CODE}" value='%{condStatus=="modify"?true:false}' onclick="fnRemoveClauses('warrantyDesc%{CODE}','warrantyId%{CODE}');"/><s:hidden name="warrantyId" id="warrantyId%{CODE}" value="%{CODE}" disabled='%{condStatus=="add"?true:false}'/>
											 </div>
											<div class="col-md-11">
											   <s:textarea rows="2" id="warrantyDesc%{CODE}" name="warrantyDesc" value="%{CODEDESC}" cols="119" onkeyup="textLimit(this,1000)" cssClass="inputBox" disabled='%{condStatus=="add"?true:false}'  cssStyle="width: 100%;"/>
											</div>
										</div>
									</li>
						  		</s:if>
					    	</s:iterator>
						</ul>						
					</div>
				</div>
			<s:hidden name="applicationNo" id="applicationNo"/>	
			<s:hidden name="quoteNo" id="quoteNo"/>
			<s:hidden name="coverId" id="coverId"/>
			<s:hidden name="condStatus" id="condStatus"/>
			<s:hidden name="conditionType" id="conditionType"/>
			</s:form>
			</s:if>
		</s:if>
		<s:elseif test='(("modify".equalsIgnoreCase(condStatus)) &&  (#session.user1 == "admin" || "RSAIssuer".equalsIgnoreCase(#session.usertype)))'>
		<s:form name="editclauses" id="editclauses" theme="simple" action="" method="post">
			<s:if test="conditionsList['clausesDesc'].size > 0">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<s:label key="premiumInfo.clauses" />
					</div>
					<div class="panel-body padding-0">
					    <ul class="list-group margin-0 text-area-list">
					    <s:iterator value="conditionsList['clausesDesc']" var="clauses">
					      <li class="list-group-item list-group-item-light">
				    		  <s:if test="%{CODE!=null}">
				    		     <div class="row">
				    		         <div class="col-md-1" style="padding-top: 17px;">
				    		           <s:checkbox name="" id="clausesDesc%{CODE}Check" fieldValue="%{CODE}" value='%{condStatus=="modify"?true:false}' onclick="fnRemoveClauses('clausesDesc%{CODE}','clausesId%{CODE}');"/><s:hidden name="clausesId" value="%{CODE}" id="clausesId%{CODE}" disabled='%{condStatus=="add"?true:false}'/>
				    		         </div>
				    		         <div class="col-md-11">
				    		           <s:textarea rows="2" id="clausesDesc%{CODE}" name="clausesDesc" value="%{CODEDESC}" cols="119" onkeyup="textLimit(this,1000)" cssClass="inputBox" disabled='%{condStatus=="add"?true:false}' cssStyle="width: 100%;height: 100%;" />
				    		         </div>
				    		     </div>
				    		  </s:if>
					      </li>
					      </s:iterator>  
					   </ul>
					</div>
				</div>
			</s:if>
			<s:if test="conditionsList['extraClausesDesc'].size > 0">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<s:label key="premiumInfo.war" />
					</div>
					<div class="panel-body padding-0">
						<ul class="list-group margin-0">
							<s:iterator value="conditionsList['extraClausesDesc']" >
					    		<s:if test="%{CODE!=null}">
					    			<li class="list-group-item list-group-item-light">
					    			    <div class="row">
						    			    <div class="col-md-1" style="padding-top:17px"><s:checkbox name="" id="warDesc%{CODE}Check" fieldValue="%{CODE}" value='%{condStatus=="modify"?true:false}' onclick="fnRemoveClauses('warDesc%{CODE}','warId%{CODE}');"/><s:hidden name="warId" value="%{CODE}" id="warId%{CODE}" disabled='%{condStatus=="add"?true:false}'/> </div>
						    			    <div class="col-md-11"><s:textarea id="warDesc%{CODE}" rows="2" name="warDesc" value="%{CODEDESC}" cols="119" onkeyup="textLimit(this,1000)" cssClass="inputBox" disabled='%{condStatus=="add"?true:false}' cssStyle="width: 100%;" /></div>
					    			    </div>
									</li>
								</s:if>
					    	</s:iterator>
						</ul>						
					</div>
				</div>
			</s:if>
			<s:if test="conditionsList['exclusionsDesc'].size > 0">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<s:label key="premiumInfo.exclusions" />
					</div>
					<div class="panel-body padding-0">
						<ul class="list-group margin-0">
							<s:iterator value="conditionsList['exclusionsDesc']" >
	    						<s:if test="%{CODE!=null}">	
					    			<li class="list-group-item list-group-item-light">
						    			<div class="row">
											<div class="col-md-1" style="padding-top:17px"><s:checkbox name="" id="exclusionDesc%{CODE}Check" fieldValue="%{CODE}" value='%{condStatus=="modify"?true:false}' onclick="fnRemoveClauses('exclusionDesc%{CODE}','exclusionId%{CODE}');"/><s:hidden name="exclusionId" value="%{CODE}" id="exclusionId%{CODE}" disabled='%{condStatus=="add"?true:false}'/> </div>
											<div class="col-md-11"><s:textarea id="exclusionDesc%{CODE}" rows="2" name="exclusionDesc" value="%{CODEDESC}" cols="119" onkeyup="textLimit(this,1000)" cssClass="inputBox" disabled='%{condStatus=="add"?true:false}' cssStyle="width: 100%;"/></div>
										</div>
									</li>
						  		</s:if>
					    	</s:iterator>
						</ul>						
					</div>
				</div>
			</s:if>
			<s:if test="conditionsList['warrantyDesc'].size > 0">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<s:label key="premiumInfo.warranties" />
					</div>
					<div class="panel-body padding-0">
						<ul class="list-group margin-0">
							<s:iterator value="conditionsList['warrantyDesc']" >
	    						<s:if test="%{CODE!=null}">
					    			<li class="list-group-item list-group-item-light">
						    			<div class="row">
											<div class="col-md-1" style="padding-top:17px"><s:checkbox name="" id="warrantyDesc%{CODE}Check" fieldValue="%{CODE}" value='%{condStatus=="modify"?true:false}' onclick="fnRemoveClauses('warrantyDesc%{CODE}','warrantyId%{CODE}');"/><s:hidden name="warrantyId" id="warrantyId%{CODE}" value="%{CODE}" disabled='%{condStatus=="add"?true:false}'/> </div>
											<div class="col-md-11"><s:textarea rows="2" id="warrantyDesc%{CODE}" name="warrantyDesc" value="%{CODEDESC}" cols="119" onkeyup="textLimit(this,1000)" cssClass="inputBox" disabled='%{condStatus=="add"?true:false}'  cssStyle="width: 100%;"/></div>
										</div>
									</li>
						  		</s:if>
					    	</s:iterator>
						</ul>						
					</div>
				</div>
			</s:if>
			<s:hidden name="applicationNo" id="applicationNo"/>	
			<s:hidden name="quoteNo" id="quoteNo"/>
			<s:hidden name="coverId" id="coverId"/>
			<s:hidden name="condStatus" id="condStatus"/>
			<s:hidden name="conditionType" id="conditionType"/>
		</s:form>
		</s:elseif>
		<s:else>
		<s:form name="viewclauses" id="viewclauses" theme="simple" action="" method="post">
			 <ul class="nav nav-pills nav-justified">
			    <li class="active"><a  data-toggle="tab" href="#clausestab">Clauses</a></li>
			    <li><a  data-toggle="tab" href="#exclusionstab">Exclusions</a></li>
			    <li><a  data-toggle="tab" href="#warrantiestab">Warranties</a></li>
			  </ul>
			  <div class="tab-content marginTop_15px">
				  <div id="clausestab" class="tab-pane fade in active">
				        <s:if test="conditionsList['clausesDesc'].size > 0">
							<div class="panel panel-primary">
								<div class="panel-heading">
									<s:label key="premiumInfo.clauses" />
								</div>
								<div class="panel-body padding-0">
								      <ul class="list-group margin-0">
										  <s:iterator value="conditionsList['clausesDesc']" var="clauses">			  		
									  		<li class="list-group-item list-group-item-primary"><span class="glyphicon glyphicon-star"></span><s:property value="CODEDESC"/></li>
								    	  </s:iterator>
								    	  <s:iterator value="conditionsList['extraClausesDesc']" >			  		
										  	<li class="list-group-item list-group-item-primary"><span class="glyphicon glyphicon-star"></span><s:property value="CODEDESC"/></li>
								    	  </s:iterator>
									  </ul>
								</div>
							</div>
						 </s:if>
				  </div>
				  <div id="exclusionstab" class="tab-pane fade">
				       <s:if test="conditionsList['exclusionsDesc'].size > 0">
							<div class="panel panel-primary">
								<div class="panel-heading">
									<s:label key="premiumInfo.exclusions" />
								</div>
								<div class="panel-body padding-0">
								     <ul class="list-group margin-0">
								    	  <s:iterator value="conditionsList['exclusionsDesc']" >			  		
									  		<li class="list-group-item list-group-item-primary"><span class="glyphicon glyphicon-star"></span><s:property value="CODEDESC"/></li>
								    	</s:iterator>
									  </ul>
																				
								</div>
							</div>
						</s:if>
				  </div>
				  <div id="warrantiestab" class="tab-pane fade">
				        <s:if test="conditionsList['warrantyDesc'].size > 0">
							<div class="panel panel-primary">
								<div class="panel-heading">
									<s:label key="premiumInfo.warranties" />
								</div>
								<div class="panel-body padding-0">
									<ul class="list-group margin-0">
										<s:iterator value="conditionsList['warrantyDesc']" >			  		
									  		<li class="list-group-item list-group-item-primary">
										  		<span class="glyphicon glyphicon-star"></span>
										  		<s:property value="CODEDESC"/>
									  		</li>
								    	</s:iterator>
									</ul>												
								</div>
							</div>
						</s:if>
				  </div>
			  </div>
			
			
			
			<s:hidden name="applicationNo" id="applicationNo"/>	
			<s:hidden name="quoteNo" id="quoteNo"/>
			<s:hidden name="coverId" id="coverId"/>
			<s:hidden name="condStatus" id="condStatus"/>
			<s:hidden name="conditionType" id="conditionType"/>
		</s:form>
		</s:else>
	</div>
	<br class="clear" />
	<div class="tablerow" align="center">
		<button type="button" name="close" class="btn btn-danger btn-oval" data-dismiss="modal">Close</button>		
		<s:if test='(("add".equalsIgnoreCase(condStatus)) && (#session.user1 == "admin" || "RSAIssuer".equalsIgnoreCase(#session.usertype)))'>
			<button type="button"  id="clausesbtn<s:property value='%{conditionType}'/>" onclick="fnaddSubmit(<s:property value='%{conditionType}'/>)" class="btn btn-sm btn-success btn-oval">Submit</button>
		</s:if>
		<s:elseif test='(("modify".equalsIgnoreCase(condStatus)) &&  (#session.user1 == "admin" || "RSAIssuer".equalsIgnoreCase(#session.usertype)))'>
			<button type="button"  id="clausesbtn" onclick="fnclauseSubmit()" class="btn btn-sm btn-success btn-oval">Submit</button>
		</s:elseif>
	</div>
</div>

</body>
<script type="text/javascript">
function fnRemoveClauses(id,id1){
	if(document.getElementById(id+'Check').checked){
		document.getElementById(id).disabled=false;
		document.getElementById(id1).disabled=false;
	}else{
		document.getElementById(id).disabled=true;
		document.getElementById(id1).disabled=true;
	}
}
function fnclauseSubmit()
{
		
	postFormRequest('updateConditionsPremium.action','editclauseAjaxId','editclauses');
	$("#clausesbtn").attr("data-dismiss","modal");
}
function fnaddSubmit(val)
{
	if(val==1){
		postFormRequest('updateConditionsPremium.action','editclauseAjaxId','addclauses');	
	}else if(val==2){
		postFormRequest('updateConditionsPremium.action','editwarAjaxId','addwar');	
	}else if(val==3){
		postFormRequest('updateConditionsPremium.action','editexcAjaxId','addexclusion');	
	}else if(val==4){
		postFormRequest('updateConditionsPremium.action','editwarrAjaxId','addwarranty');	
	}	
	$("#clausesbtn"+val).attr("data-dismiss","modal");
}
function postFormRequest(strUrl, id, formId) {
    $.ajax({
		url : strUrl,
		type : "POST",
		data : $("#" + formId).serialize(),
		error : function() {
			$('#' + id).html('<p>An error has occurred in jquery Ajax</p>');
		},
		success : function(data) {
			$('#' + id).html(data);
		},
		beforeSend : function() {
			$('#loading').show();
			$('.ajaxLoader').show();
		},
		complete : function() {
			$('#loading').hide();
			$('.ajaxLoader').hide();
		}
	});
}
</script>
</html>