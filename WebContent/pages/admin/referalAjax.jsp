<%@ page isELIgnored="false" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="sj" uri="/struts-jquery-tags"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display"%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.responsive.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.jqueryui.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.tableTools.css">
	<link href="<%=request.getContextPath()%>/dataTables/css/jquery-start-ui.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.jqueryui.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.responsive.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.tableTools.js"></script>
	<script type="text/javascript">
  	/*jQuery(function ($) {
  		try {
			var data1 = $('.referralRecords').dataTable( {
				"lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
				"order": [[ 1, "asc" ]],
				"columnDefs": [ {
		          "targets": 'no-sort',
		          "orderable": false
			    } ],
				responsive: true
			});
		} catch(err){}
	} );*/

  	<s:if test='("pending".equals(reqFrom)) && (rdate==null || "".equals(rdate))'>
 	jQuery(function ($) {
	try {
		var data = $('#occListPID').dataTable( {
			"lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
			"order": [[ 0, "asc" ]],
			"columnDefs": [ {
	          "targets": 'no-sort',
	          "orderable": false
		    } ],
			responsive: true
		});
	} catch(err){}
} );
</s:if>
<s:if test='("approved".equals(reqFrom)) && (rdate==null || "".equals(rdate))'>
 	jQuery(function ($) {
 		try {
 			var data = $('#occListAID').dataTable( {
 				"lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
 				"order": [[ 0, "asc" ]],
 				"columnDefs": [ {
 		          "targets": 'no-sort',
 		          "orderable": false
 			    } ],
 				responsive: true
 			});
 		} catch(err){}
 	} );
 </s:if>
 <s:if test='("rejected".equals(reqFrom)) && (rdate==null || "".equals(rdate))'>
 	jQuery(function ($) {
 		try {
 			var data = $('#occListRID').dataTable( {
 				"lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
 				"order": [[ 0, "asc" ]],
 				"columnDefs": [ {
 		          "targets": 'no-sort',
 		          "orderable": false
 			    } ],
 				responsive: true
 			});
 		} catch(err){}
 	} );
 </s:if>
 <s:if test='("pending".equals(reqFrom)) && (rdate!=null && !"".equals(rdate))'>
	jQuery(function ($) {
	try {
		var data = $('#policyListP').dataTable( {
			"lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
			"order": [[ 0, "asc" ]],
			"columnDefs": [ {
	          "targets": 'no-sort',
	          "orderable": false
		    } ],
			responsive: true
		});
	} catch(err){}
} );
</s:if>
<s:if test='("approved".equals(reqFrom)) && (rdate!=null && !"".equals(rdate))'>
	jQuery(function ($) {
		try {
			var data = $('#policyListA').dataTable( {
				"lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
				"order": [[ 0, "asc" ]],
				"columnDefs": [ {
		          "targets": 'no-sort',
		          "orderable": false
			    } ],
				responsive: true
			});
		} catch(err){}
	} );
</s:if>
<s:if test='("rejected".equals(reqFrom)) && (rdate!=null && !"".equals(rdate))'>
	jQuery(function ($) {
		try {
			var data = $('#policyListR').dataTable( {
				"lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
				"order": [[ 0, "asc" ]],
				"columnDefs": [ {
		          "targets": 'no-sort',
		          "orderable": false
			    } ],
				responsive: true
			});
		} catch(err){}
	} );
</s:if>

<s:if test='("QuoteSearch".equals(reqFrom))'>
	jQuery(function ($) {
		try {
			var data = $('#policyListQR').dataTable( {
				"lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
				"order": [[ 0, "asc" ]],
				"columnDefs": [ {
		          "targets": 'no-sort',
		          "orderable": false
			    } ],
				responsive: true
			});
		} catch(err){}
	} );
</s:if>
  	</script>

<s:if test='("pending".equals(reqFrom)) && (rdate==null || "".equals(rdate))'>
    <div id="<s:property value='reqFrom'/>Policies">
        <s:form id="pending" name="pending" theme="simple">        	
        	<div class="row">
        		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
					<div class="text"><s:text name="product.product"/></div>
					<div class="tbox">
						<s:select name="productID" cssClass="inputBoxS" id="productID" list="productDet" headerKey="" headerValue="---Select---" listKey="ProductId" listValue="ProductName" />
					</div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
					<div class="text"><s:text name="Regions"/></div>
					<div class="tbox">
						<s:select name="region" id="region1" list="regionList" listKey="RegionId" listValue="RegionName" onchange="getBranches(this.value,'pendingBranch');" cssClass="inputBoxS" disabled="true"/>
					</div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
					<div class="text"><s:text name="admin.user.branch"/></div>
					<div class="tbox">
						<s:select name="branchId" cssClass="inputBoxS" id="branchId" list="branchDet" headerKey="ALL" headerValue="ALL" listKey="BranchCode" listValue="BranchName"  />
					</div>
				</div>
        	</div>
        	<br class="clear" />
				<div class="row">
					<div class="col-xs-12" align="center">
						<input type="button" class="btn btn-sm btn-success" value="Search"  onclick="fnTab('', 'pending','','');">
					</div>
				</div>
        	<div class="row">
        		<div class="col-xs-12">
        		<table class="display responsive no-wrap" id="occListPID" width="100%" cellspacing="0">
						<thead>
						<tr>
							<th class="no-sort"><s:text name="S.No"/></th>
							<th><s:text name="Broker Organisation"/></th>
							<th><s:text name="Quote Created By"/></th>
							<th><s:text name="Customer Name"/></th>
							<th><s:text name="Quote Date"/></th>
							<th><s:text name="Quote No"/></th>
							<th><s:text name="Remarks"/></th>
							<th><s:text name="Status"/></th>
						</tr>
						</thead>
						<tbody>
							<s:iterator value="occList" var="record" status="stat">
								<tr>
									<td><s:property value="#stat.count" /></td>
									<td style="text-align: center;"><s:property value="#record.BrokerName" /></td>
									<td style="text-align: center;"><s:property value="#record.QuoteCreated" /></td>
									<td style="text-align: center;"><s:property value="#record.CustomerName" /></td>
									<td style="text-align: center;"><s:property value="#record.EntryDate" /></td>
									<td style="text-align: center;">
										<a type="button" class="btn btn-sm btn-primary" style="color: #ffffff;" href="#" onclick="editQuote('<s:property value="#record.ApplicationNo"/>', '<s:property value="session.user"/>','<s:property value="productID"/>','<s:property value="rdate"/>','<s:property value="#record.QuoteNo"/>','<s:property value="#record.SCHEME_ID"/>','RU','<s:property value="#record.QuoteNo"/>');"><s:property value="#record.QuoteNo"/></a>
									</td>
<%-- 									<td style="text-align: center;"><s:property value="#record.QuoteNo" /></td> --%>
									<td style="text-align: center;"><s:property value="#record.Remarks" /></td>
									<td style="text-align: center;"><s:property value="#record.Status" /></td>
								</tr>
							</s:iterator>
						</tbody>
					</table>      
        			</div>
        	</div> 
        </s:form>
    </div>
</s:if>
<s:elseif test='("approved".equals(reqFrom)) && (rdate==null || "".equals(rdate))'>
    <div id="<s:property value='reqFrom'/>Policies">
        <s:form id="approved" name="approved" theme="simple">
            <div class="row">
        		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
					<div class="text"><s:text name="product.product"/></div>
					<div class="tbox">
						<s:select name="productID" cssClass="inputBoxS" id="productID" list="productDet" headerKey="" headerValue="---Select---" listKey="ProductId" listValue="ProductName" />
					</div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
					<div class="text"><s:text name="Regions"/></div>
					<div class="tbox">
						<s:select name="region" id="region1" list="regionList" listKey="RegionId" listValue="RegionName" onchange="getBranches(this.value,'pendingBranch');" cssClass="inputBoxS" disabled="true"/>
					</div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
					<div class="text"><s:text name="admin.user.branch"/></div>
					<div class="tbox">
						<s:select name="branchId" cssClass="inputBoxS" id="branchId" list="branchDet" headerKey="ALL" headerValue="ALL" listKey="BranchCode" listValue="BranchName"  />
					</div>
				</div>
        	</div>
        	<br class="clear" />
				<div class="row">
					<div class="col-xs-12" align="center">
						<input type="button" class="btn btn-sm btn-success" value="Submit" onclick="fnTab('', 'approved','','');">
					</div>
				</div>
				<br class="clear" /> 
        	<div class="row">
        		<div class="col-xs-12">
        		<table class="display responsive no-wrap" id="occListAID" width="100%" cellspacing="0">
						<thead>
						<tr>
							<th class="no-sort"><s:text name="S.No"/></th>
							<th><s:text name="Broker Organisation"/></th>
							<th><s:text name="Quote Created By"/></th>
							<th><s:text name="Customer Name"/></th>
							<th><s:text name="Quote Date"/></th>
							<th><s:text name="Quote No"/></th>
							<th><s:text name="Remarks"/></th>
							<th><s:text name="Status"/></th>
						</tr>
						</thead>
						<tbody>
							<s:iterator value="occList" var="record" status="stat">
								<tr>
									<td><s:property value="#stat.count" /></td>
									<td style="text-align: center;"><s:property value="#record.BrokerName" /></td>
									<td style="text-align: center;"><s:property value="#record.QuoteCreated" /></td>
									<td style="text-align: center;"><s:property value="#record.CustomerName" /></td>
									<td style="text-align: center;"><s:property value="#record.EntryDate" /></td>
									<td style="text-align: center;">
										<a type="button" class="btn btn-sm btn-primary" style="color: #ffffff;" href="#" onclick="editQuote('<s:property value="#record.ApplicationNo"/>', '<s:property value="session.user"/>','<s:property value="productID"/>','<s:property value="rdate"/>','<s:property value="#record.QuoteNo"/>','<s:property value="#record.SCHEME_ID"/>','RA','<s:property value="#record.QuoteNo"/>');"><s:property value="#record.QuoteNo"/></a>
									</td>
<%-- 									<td style="text-align: center;"><s:property value="#record.QuoteNo" /></td> --%>
									<td style="text-align: center;"><s:property value="#record.Remarks" /></td>
									<td style="text-align: center;"><s:property value="#record.Status" /></td>
								</tr>
							</s:iterator>
						</tbody>
					</table>       
					</div>
    		</div>
    	</s:form>
    </div>
</s:elseif>
<s:elseif test='("rejected".equals(reqFrom)) && (rdate==null || "".equals(rdate))'>
    <div id="<s:property value='reqFrom'/>Policies">
        <s:form id="rejected" name="rejected" theme="simple">
             <div class="row">
        		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
					<div class="text"><s:text name="product.product"/></div>
					<div class="tbox">
						<s:select name="productID" cssClass="inputBoxS" id="productID" list="productDet" headerKey="" headerValue="---Select---" listKey="ProductId" listValue="ProductName" />
					</div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
					<div class="text"><s:text name="Regions"/></div>
					<div class="tbox">
						<s:select name="region" id="region1" list="regionList" listKey="RegionId" listValue="RegionName" onchange="getBranches(this.value,'pendingBranch');" cssClass="inputBoxS" disabled="true"/>
					</div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
					<div class="text"><s:text name="admin.user.branch"/></div>
					<div class="tbox">
						<s:select name="branchId" cssClass="inputBoxS" id="branchId" list="branchDet" headerKey="ALL" headerValue="ALL" listKey="BranchCode" listValue="BranchName"  />
					</div>
				</div>
        	</div>
        	<div class="row">
				<div class="col-xs-12" align="center">
					<input type="button" class="btn btn-sm btn-success" value="Submit" onclick="fnTab('', 'rejected','','');" >
				</div>
			</div>
			<br class="clear" />	
        	<div class="row">
        		<div class="col-xs-12">
        			<table class="display responsive no-wrap" id="occListRID" width="100%" cellspacing="0">
						<thead>
						<tr>
							<th class="no-sort"><s:text name="S.No"/></th>
							<th><s:text name="Broker Organisation"/></th>
							<th><s:text name="Quote Created By"/></th>
							<th><s:text name="Customer Name"/></th>
							<th><s:text name="Quote Date"/></th>
							<th><s:text name="Quote No"/></th>
							<th><s:text name="Remarks"/></th>
							<th><s:text name="Status"/></th>
						</tr>
						</thead>
						<tbody>
							<s:iterator value="occList" var="record" status="stat">
								<tr>
									<td><s:property value="#stat.count" /></td>
									<td style="text-align: center;"><s:property value="#record.BrokerName" /></td>
									<td style="text-align: center;"><s:property value="#record.QuoteCreated" /></td>
									<td style="text-align: center;"><s:property value="#record.CustomerName" /></td>
									<td style="text-align: center;"><s:property value="#record.EntryDate" /></td>
									<td style="text-align: center;">
										<a type="button" class="btn btn-sm btn-primary" style="color: #ffffff;" href="#" onclick="editQuote('<s:property value="#record.ApplicationNo"/>', '<s:property value="session.user"/>','<s:property value="productID"/>','<s:property value="rdate"/>','<s:property value="#record.QuoteNo"/>','<s:property value="#record.SCHEME_ID"/>','RR','<s:property value="#record.QuoteNo"/>');"><s:property value="#record.QuoteNo"/></a>
									</td>
<%-- 									<td style="text-align: center;"><s:property value="#record.QuoteNo" /></td> --%>
									<td style="text-align: center;"><s:property value="#record.Remarks" /></td>
									<td style="text-align: center;"><s:property value="#record.Status" /></td>
								</tr>
							</s:iterator>
						</tbody>
					</table>        	
                      </div>
			</div>
        </s:form>
    </div>
</s:elseif>
<s:elseif test='("pending".equals(reqFrom)) && (rdate!=null && !"".equals(rdate))'>
    <div id="<s:property value='reqFrom'/>Policies">
        <s:form id="pending" name="pending" theme="simple"> 
        	<div class="row">
        		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
					<div class="text"><s:text name="product.product"/></div>
					<div class="tbox">
						<s:select name="productID" cssClass="inputBoxS" id="productID" list="productDet" headerKey="" headerValue="---Select---" listKey="ProductId" listValue="ProductName" />
					</div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
					<div class="text"><s:text name="Regions"/></div>
					<div class="tbox">
						<s:select name="region" id="region1" list="regionList" listKey="BranchCode" listValue="BranchName" onchange="getBranches(this.value,'pendingBranch');" cssClass="inputBoxS" />
					</div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
					<div class="text"><s:text name="admin.user.branch"/></div>
					<div class="tbox">
						<s:select name="branchId" cssClass="inputBoxS" id="branchId" list="branchDet" headerKey="ALL" headerValue="ALL" listKey="BranchCode" listValue="BranchName"  />
					</div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4" align="center">
					<b>Selected Date is <span class="label label-warning"> <s:property value="rdate"/> </span> </b>
				</div>
        	</div>
        	<div class="row">
				<div class="col-xs-12" align="center">
					<input type="button" class="btn btn-sm btn-success" value="Submit" onclick="fnTab('', 'pending','','');">
				</div>
			</div>
        	<br/>
        	<div class="row">
        		<div class="col-xs-12">
        		<table class="display responsive no-wrap" id="policyListP" width="100%" cellspacing="0">
						<thead>
						<tr>
							<th class="no-sort"><s:text name="S.No"/></th>
							<th><s:text name="Broker Organization"/></th>
							<th><s:text name="Quote Created By"/></th>
							<th><s:text name="Customer Name"/></th>
							<th><s:text name="Quote No" /></th>
							<th><s:text name="Remarks" /></th>
							<th><s:text name="Status"/></th>
						</tr>
						</thead>
						<tbody>
							<s:iterator value="policyList" var="record" status="stat">
								<tr>
									<td><s:property value="#stat.count" /></td>
									<td><s:property value="#record.BROKERNAME" /></td>
									<td><s:property value="#record.QUOTE_CREATED" /></td>
									<td><s:property value="#record.CUST_NAME" /></td>
									<td style="text-align: center;">
										<a type="button" class="btn btn-sm btn-primary" style="color: #ffffff;" href="#" onclick="editQuote('<s:property value="#record.APPLICATION_NO"/>', '<s:property value="session.user"/>','<s:property value="productID"/>','<s:property value="rdate"/>','<s:property value="#record.QUOTE_NO"/>','<s:property value="#record.SCHEME_ID"/>','RU','<s:property value="#record.QUOTE_NO"/>');"><s:property value="#record.QUOTE_NO"/></a>
									</td>
									<td><s:property value="#record.REMARKS" /></td>
									<td><s:property value="#record.STATUS" /></td>
								</tr>
							</s:iterator>
						</tbody>
					</table>        	
		           </div>
			</div> 
        </s:form>
    </div>
</s:elseif> 
<s:elseif test='("approved".equals(reqFrom)) && (rdate!=null && !"".equals(rdate))'>
    <div id="<s:property value='reqFrom'/>Policies">
        <s:form id="approved" name="approved" theme="simple">
        	<div class="row">
        		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
					<div class="text"><s:text name="product.product"/></div>
					<div class="tbox">
						<s:select name="productID" cssClass="inputBoxS" id="productID" list="productDet" headerKey="" headerValue="---Select---" listKey="ProductId" listValue="ProductName" />
					</div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
					<div class="text"><s:text name="Regions"/></div>
					<div class="tbox">
						<s:select name="region" id="region1" list="regionList" listKey="BranchCode" listValue="BranchName" onchange="getBranches(this.value,'pendingBranch');" cssClass="inputBoxS" />
					</div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
					<div class="text"><s:text name="admin.user.branch"/></div>
					<div class="tbox">
						<s:select name="branchId" cssClass="inputBoxS" id="branchId" list="branchDet" headerKey="ALL" headerValue="ALL" listKey="BranchCode" listValue="BranchName"  />
					</div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4" align="center">
					<b>Selected Date is <span class="label label-warning"> <s:property value="rdate"/> </span> </b>
				</div>
				
        	</div>
        	<div class="row">
				<div class="col-xs-12" align="center">
					<input type="button" class="btn btn-sm btn-success" value="Submit" onclick="fnTab('', 'approved','','');">
				</div>
			</div>
			<br class="clear" />
        	<div class="row">
        		<div class="col-xs-12">
        			<table class="display responsive no-wrap" id="policyListA" width="100%" cellspacing="0">
						<thead>
						<tr>
							<th class="no-sort"><s:text name="S.No"/></th>
							<th><s:text name="Broker Organization"/></th>
							<th><s:text name="Quote Created By"/></th>
							<th><s:text name="Customer Name"/></th>
							<th><s:text name="Quote No" /></th>
							<th><s:text name="Remarks" /></th>
							<th><s:text name="Status"/></th>
						</tr>
						</thead>
						<tbody>
							<s:iterator value="policyList" var="record" status="stat">
								<tr>
									<td><s:property value="#stat.count" /></td>
									<td><s:property value="#record.BROKERNAME" /></td>
									<td><s:property value="#record.QUOTE_CREATED" /></td>
									<td><s:property value="#record.CUST_NAME" /></td>
									<td style="text-align: center;">
										<a type="button" class="btn btn-sm btn-primary" style="color: #ffffff;" href="#" onclick="editQuote('<s:property value="#record.APPLICATION_NO"/>', '<s:property value="session.user"/>','<s:property value="productID"/>','<s:property value="rdate"/>','<s:property value="#record.QUOTE_NO"/>','<s:property value="#record.SCHEME_ID"/>','RA','<s:property value="#record.QUOTE_NO"/>');"><s:property value="#record.QUOTE_NO"/></a>
									</td>
									<td><s:property value="#record.REMARKS" /></td>
									<td><s:property value="#record.STATUS" /></td>
								</tr>
							</s:iterator>
						</tbody>
					</table></div>
			</div>
        </s:form>
    </div>
</s:elseif>
<s:elseif test='("rejected".equals(reqFrom)) && (rdate!=null && !"".equals(rdate))'>
    <div id="<s:property value='reqFrom'/>Policies">
        <s:form id="rejected" name="rejected" theme="simple">
        	<div class="row">
        		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
					<div class="text"><s:text name="product.product"/></div>
					<div class="tbox">
						<s:select name="productID" cssClass="inputBoxS" id="productID" list="productDet" headerKey="" headerValue="---Select---" listKey="ProductId" listValue="ProductName" />
					</div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
					<div class="text"><s:text name="Regions"/></div>
					<div class="tbox">
						<s:select name="region" id="region1" list="regionList" listKey="BranchCode" listValue="BranchName" onchange="getBranches(this.value,'pendingBranch');" cssClass="inputBoxS" />
					</div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
					<div class="text"><s:text name="admin.user.branch"/></div>
					<div class="tbox">
						<s:select name="branchId" cssClass="inputBoxS" id="branchId" list="branchDet" headerKey="ALL" headerValue="ALL" listKey="BranchCode" listValue="BranchName"  />
					</div>
				</div>
				<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4" align="center">
					<b>Selected Date is <span class="label label-warning"> <s:property value="rdate"/> </span> </b>
				</div>
				
        	</div>
        	<div class="row">
				<div class="col-xs-12" align="center">
					<input type="button" class="btn btn-sm btn-success" value="Submit" onclick="fnTab('', 'rejected','','');" >
				</div>
			</div>
			<br class="clear" />	
        	<div class="row">
        		<div class="col-xs-12">
        			<table class="display responsive no-wrap" id="policyListR" width="100%" cellspacing="0">
						<thead>
						<tr>
							<th class="no-sort"><s:text name="S.No"/></th>
							<th><s:text name="Broker Organization"/></th>
							<th><s:text name="Quote Created By"/></th>
							<th><s:text name="Customer Name"/></th>
							<th><s:text name="Quote No" /></th>
							<th><s:text name="Remarks" /></th>
							<th><s:text name="Status"/></th>
						</tr>
						</thead>
						<tbody>
							<s:iterator value="policyList" var="record" status="stat">
								<tr>
									<td><s:property value="#stat.count" /></td>
									<td><s:property value="#record.BROKERNAME" /></td>
									<td><s:property value="#record.QUOTE_CREATED" /></td>
									<td><s:property value="#record.CUST_NAME" /></td>
									<td style="text-align: center;">
										<a type="button" class="btn btn-sm btn-primary" style="color: #ffffff;" href="#" onclick="editQuote('<s:property value="#record.APPLICATION_NO"/>', '<s:property value="session.user"/>','<s:property value="productID"/>','<s:property value="rdate"/>','<s:property value="#record.QUOTE_NO"/>','<s:property value="#record.SCHEME_ID"/>','RR','<s:property value="#record.QUOTE_NO"/>');"><s:property value="#record.QUOTE_NO"/></a>
									</td>
									<td><s:property value="#record.REMARKS" /></td>
									<td><s:property value="#record.STATUS" /></td>
								</tr>
							</s:iterator>
						</tbody>
					</table>        
		          </div>
             </div>
        </s:form>
    </div>
</s:elseif>
<s:elseif test='"QuoteSearch".equals(reqFrom)'>
	<div class="row" >
        		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">  
        			<table class="display responsive no-wrap" id="policyListQR" width="100%" cellspacing="0" align="center">
						<thead>
						<tr>
							<th class="no-sort"><s:text name="S.No"/></th>
							<th><s:text name="Broker Organization"/></th>
							<th><s:text name="Quote Created By"/></th>
							<th><s:text name="Customer Name"/></th>
							<th><s:text name="Quote No" /></th>
							<th><s:text name="Remarks" /></th>
							<th><s:text name="Status"/></th>
						</tr>
						</thead>
						<tbody>
							<s:iterator value="policyList" var="record" status="stat">
								<tr>
									<td><s:property value="#stat.count" /></td>
									<td><s:property value="#record.BROKERNAME" /></td>
									<td><s:property value="#record.QUOTE_CREATED" /></td>
									<td><s:property value="#record.CUST_NAME" /></td>
									<td style="text-align: center;">
										<a type="button" class="btn btn-sm btn-primary" style="color: #ffffff;" href="#" onclick="editQuote('<s:property value="#record.APPLICATION_NO"/>', '<s:property value="session.user"/>','<s:property value="#record.PRODUCT_ID"/>','<s:property value="rdate"/>',<s:property value="#record.QUOTE_NO"/>,'<s:property value="#record.SCHEME_ID"/>','RU');"><s:property value="#record.QUOTE_NO"/></a>
									</td>
									<td><s:property value="#record.REMARKS" /></td>
									<td><s:property value="#record.STATUS" /></td>
								</tr>
							</s:iterator>
						</tbody>
					</table>        
		          </div>
             </div>
	</s:elseif>

