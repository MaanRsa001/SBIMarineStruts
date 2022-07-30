<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

 <link href="<%=request.getContextPath()%>/assets1/plugins/dataTables/css/dataTables.bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/assets1/plugins/dataTables/css/buttons.bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/assets1/plugins/dataTables/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/assets1/plugins/dataTables/css/responsive.bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/assets1/plugins/dataTables/css/scroller.bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/assets1/plugins/dataTables/css/dataTables.bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/bootstrap/js/jquery-1.9.1.min.js"></script>
<script src="<%=request.getContextPath()%>/assets1/plugins/dataTables/js/jquery.dataTables.min.js"></script>
<script src="<%=request.getContextPath()%>/assets1/plugins/dataTables/js/dataTables.bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/assets1/plugins/dataTables/js/dataTables.buttons.min.js"></script>
<script src="<%=request.getContextPath()%>/assets1/plugins/dataTables/js/buttons.bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/assets1/plugins/dataTables/js/buttons.flash.min.js"></script>
<script src="<%=request.getContextPath()%>/assets1/plugins/dataTables/js/buttons.html5.min.js"></script>
<script src="<%=request.getContextPath()%>/assets1/plugins/dataTables/js/buttons.print.min.js"></script>
<script src="<%=request.getContextPath()%>/assets1/plugins/dataTables/js/dataTables.fixedHeader.min.js"></script>
<script src="<%=request.getContextPath()%>/assets1/plugins/dataTables/js/dataTables.keyTable.min.js"></script>
<script src="<%=request.getContextPath()%>/assets1/plugins/dataTables/js/dataTables.responsive.min.js"></script>
<script src="<%=request.getContextPath()%>/assets1/plugins/dataTables/js/responsive.bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/assets1/plugins/highcharts/highcharts.js"></script> 
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/assets1/pivot/jquery-ui.css"> 
	<script src="<%=request.getContextPath()%>/assets1/pivot/jquery-ui.js"></script>
<link href="<%=request.getContextPath()%>/assets1/pivot/pivot.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/assets1/pivot/pivot.js"></script>
<style>
.head-margin{
margin:5px;
}

.nav-pills > li > a {
    width: 100% !important;
    padding: 15px !important;
    float: left;
    margin: 0 !important;
    font-size: 14px;
}

.nav-pills > li {
    width: 20% !important;
    padding:10px;
    margin:10px;
}

</style>
<s:form  theme="simple" class="row" action="#" name="form" id="form" method="post">
	<div class="container">
		<br>
		<div class="row"> 
	   		<div class="col-lg-12 col-sm-12  col-xs-12 col-md-12">
	   			<div class="section-title title-head" style="margin-bottom:0px;padding: 1px 15px;">
	   				 
					<h4 class="head-margin" style="color:white;" >Marine Records</h4>
				</div>	

	   		</div>
   		</div>
   		
		<div class="row">
	   		<div class="col-lg-12 col-sm-12  col-xs-12 col-md-12">
	   		
	   			<div id="exTab1">	
					<ul  class="nav nav-pills">
						<li class="active">
        					<a  href="#1a" data-toggle="tab" class="tab-width"><i class="fa fa-bar-chart" aria-hidden="true"></i>&nbsp;Pivot chart</a>
						</li>
						<!-- <li><a href="#2a" data-toggle="tab" class="tab-width"><i class="fa fa-filter" aria-hidden="true"></i> &nbsp;Range : SumInsured</a>
						</li>
						<li><a href="#3a" data-toggle="tab" class="tab-width"><i class="fa fa-filter" aria-hidden="true"></i> &nbsp;Range : Vehicle Age</a>
						</li>
  						 
  						 <li><a href="#4a" data-toggle="tab" class="tab-width"><i class="fa fa-info-circle" aria-hidden="true"></i> &nbsp;Un-Group : SumInsured</a>
						</li>
						<li><a href="#5a" data-toggle="tab" class="tab-width"><i class="fa fa-info-circle" aria-hidden="true"></i> &nbsp;Un-Group : Vehicle Age</a>
						</li> -->
					</ul>
					<br>
					<div class="tab-content clearfix">
					  <div class="tab-pane active" id="1a">
					  			
		          				<h4 class="head-margin">Pivot Chart for Marine Quote </h4>
		          				<%-- <s:if test="fleeterrors!=null && fleeterrors.size()>0">	
		          					<ul>	          				
				          				<s:iterator value="fleeterrors" var="err" status="stat">
				          					<li><font color="red"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i>
				          					<s:property value="#err.ErrorDescription"/></font></li>
				          				</s:iterator>
			          				</ul>	
		          				</s:if> --%>
		          				
		          				<div id="output" style="margin: 30px;"></div>
		          				<div id="outputtxt" style="margin: 30px;display:none;"></div>
		          				
		          				
		          				
		          				<div class="modal"  id="modelcreatg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
							  <div class="modal-dialog modal-lg"  role="document" id="modelvehicleBody">
								<div class="modal-content"> 
									<div class="modal-header tit-up" style="border-bottom: 0px !important;">
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
									</div>
									<div class="modal-body customer-box row" id="modelclausbody">
										<div class="container-fluid">
										 		<div class="row">
										 			<div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
										 			</div>
										   			<div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
										   				<h4>Do You Want Create new grouping?</h4>
										   			</div>
										   			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
										   				<p></p>
										   				<s:radio list="#{'Y':'Yes','N':'No'}" value="%{regroupingyn==null?'N':'Y'}" name="regroupingyn" id="regroupingyn" theme="simple" cssClass=""></s:radio>
										   			</div>
										   		</div>
										   	</div>
																				
									</div>
									<div class="modal-footer" style="text-align: center;">
												<div class="row">
										   			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3"> 
										   			</div>
										   			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3"> 
										   				<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
										   			</div>
										   			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3"> 
										   				<button type="button" class="btn btn-success" onclick="return movetogroup();">Move</button>
										   			</div>
										   			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3"> 
										   			</div>
										   		</div>
 							     	</div>	
								</div>
							  </div>
					</div>
								<!-- <div class="row">
							   		<div class="col-lg-2 col-md-2 col-sm-3 col-xs-3">
							   		</div> 
							   		<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
							   				 	<button class="btn btn-warning btn-block btn-lg " style="width: 100%" onclick="back()">Back</button>
							   		</div>
							   		<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
							   				 	<button class="btn btn-success btn-block btn-lg " style="width: 100%" onclick="return showpopup();">Move/Create Group</button>
							   		</div>
							   		
						   		</div> -->
						</div>
						<%-- <div class="tab-pane" id="2a">
		          			<h4><i class="fa fa-cogs" aria-hidden="true"></i> SumInsured Configure</h4>
		          			 
		          			<s:include value="/pages/b2c/fleet/configsuminsured.jsp" ></s:include>
		          			
						</div>
		        		<div class="tab-pane" id="3a">
		          				<h4><i class="fa fa-cogs" aria-hidden="true"></i> Vehicle Age Configure</h4>
		          			<s:include value="/pages/b2c/fleet/configvehicleusage.jsp" ></s:include>	
						</div>
		         	
		         	<div class="tab-pane" id="4a">
		          				<h4><i class="fa fa-cogs" aria-hidden="true"></i> Not Grouped Records (SumInsured)</h4>
		          			<s:include value="/pages/b2c/fleet/ungroupedsi.jsp" ></s:include>	
						</div>
						
						<div class="tab-pane" id="5a">
		          				<h4><i class="fa fa-cogs" aria-hidden="true"></i> Not Grouped Records (Vehicle Age)</h4>
		          			<s:include value="/pages/b2c/fleet/ungroupedvi.jsp" ></s:include>	
						</div> --%>
					</div>
	   </div>
	   		
	   		
	   		 
	   		
	   				
	   				
	   		</div>
   		</div>
				
   		
										
	</div>
	 
										        
							
	
		
	
	
	
	
	<s:hidden name="pivotchartreq" id="pivotchartreq" theme="simple"></s:hidden>
	<s:hidden name="requestreferenceno" id="requestreferenceno" theme="simple"></s:hidden>
    <s:hidden name="uploadedtranid" id="uploadedtranid" theme="simple"></s:hidden>	
   <s:hidden name="offerno" id="offerno" theme="simple"></s:hidden>
   <s:hidden name="offername" id="offername" theme="simple"></s:hidden>
</s:form>
  <script type="text/javascript">
    // This example is the most basic usage of pivotUI()
var pivotui;
    $(function(){
    	
    	
    	
    	$.ajax({
			 url : '${pageContext.request.contextPath}/dashboardInfoAreport.action',
			 error : function() {
	    			$('#output"/>').html('<p>Pivot Chart Api have issue</p>');
	    	},
	    	success : function(data) {
	    		
	    	 	var dynrows=new Array();
	    	 	//<s:iterator value="groupindesc.groupingcolms" var="group" status="stat">
	    	 		//dynrows[<s:property value="#stat.index"/>]='<s:property/>';
	    	 	//</s:iterator> 
	    		var objcol={
	    				cols: ["loginId","branchName","brokerName","insuredName","transportDescription","coverName","policyStartDate","commodityName","goodsDescription","orignCountry","destCountry","sumInsured","totalPremium"],
	               // rows:dynrows, 
	              //  cols: ["quoteNo","policyNo"],
	                onRefresh: function(config) {
	                     var config_copy = JSON.parse(JSON.stringify(config));
	                     //delete some values which are functions
	                     delete config_copy["aggregators"];
	                     delete config_copy["renderers"];
	                     //delete some bulky default values
	                     delete config_copy["rendererOptions"];
	                     delete config_copy["localeStrings"];
	                     
	                    
	                     $("#outputtxt").text(JSON.stringify(config_copy, undefined, 2));
	                 }/*,
	                 rendererOptions: {table: {rowTotals: false, colTotals: false,}}*/
	    		
	            }
	    		 pivotui=$("#output").pivotUI(data.pivrecords,objcol);		
	    	},beforeSend : function() {
	  			$('#loaderstyle').show();
	  			 
	  		},
	  		complete : function() {
	  			$('#loaderstyle').hide();
	  		}
    	});
    	
     });
    
function back(){
		
		document.form.action="${pageContext.request.contextPath}/showoffersFleet.action";
		document.form.submit();
		return false;
	}
function showpopup(){
	
	$("#modelcreatg").modal("show");	
	return false;
}
function movetogroup(){
	
	pivotreq=$("#outputtxt").html();
	var objec=JSON.parse(pivotreq);
	pivotchartreq='';
	for (var i in objec.rows) {
		pivotchartreq += objec.rows[i]+",";	
	}
	for (var i in objec.cols) {
		pivotchartreq += objec.cols[i]+",";	
	}
	document.form.pivotchartreq.value=pivotchartreq ;
	document.form.action="${pageContext.request.contextPath}/groupshowFleet.action";
	document.form.submit();
	
	return false;
}
	

        </script>
