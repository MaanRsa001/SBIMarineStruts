<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<link href="//cdnjs.cloudflare.com/ajax/libs/select2/4.0.0/css/select2.css" rel="stylesheet"/>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/select2/4.0.0/js/select2.js"></script>

 <link href="<%=request.getContextPath()%>/assets/plugins/dataTables/css/dataTables.bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/assets/plugins/dataTables/css/buttons.bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/assets/plugins/dataTables/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/assets/plugins/dataTables/css/responsive.bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/assets/plugins/dataTables/css/scroller.bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/assets/plugins/dataTables/css/dataTables.bootstrap.min.css" rel="stylesheet">
<script src="<%=request.getContextPath()%>/assets/plugins/dataTables/js/jquery.dataTables.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/plugins/dataTables/js/dataTables.bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/plugins/dataTables/js/dataTables.buttons.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/plugins/dataTables/js/buttons.bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/plugins/dataTables/js/buttons.flash.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/plugins/dataTables/js/buttons.html5.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/plugins/dataTables/js/buttons.print.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/plugins/dataTables/js/dataTables.fixedHeader.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/plugins/dataTables/js/dataTables.keyTable.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/plugins/dataTables/js/dataTables.responsive.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/plugins/dataTables/js/responsive.bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/assets/plugins/highcharts/highcharts.js"></script> 


<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.responsive.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.jqueryui.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.tableTools.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datepicker/jquery-ui.css">
<%-- 	<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery-1.11.1.min.js"></script> --%>
<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.jqueryui.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.responsive.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.tableTools.js"></script>
<script type="text/javascript">
  	
	jQuery(function ($) {
  		try {
  			var data = $('#record').dataTable( {
  				responsive: true,
				"lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]],
				"order": [[ 1, "desc" ]],
				"columnDefs": [ {
		          "targets": 'no-sort',
		          "orderable": false
			    } ],
				responsive: true
			});	
		} catch(err){}
		
	} );
	
  	</script>
  	
  	<style>

table {
  border: 1px solid #ccc;
  border-collapse: collapse;
  margin: 0;
  padding: 0;
  width: 100%;
  table-layout: fixed;
}

table caption {
  font-size: 1.5em;
  margin: .5em 0 .75em;
}

table tr {
  background-color: #f8f8f8;
  border: 1px solid #ddd;
  padding: .35em;
}

table th,
table td {
  padding: .625em;
  text-align: center;
}

table th {
  font-size: .85em;
  letter-spacing: .1em;
  text-transform: uppercase;
}

@media screen and (max-width: 600px) {
  table {
    border: 0;
  }

  table caption {
    font-size: 1.3em;
  }
  
  table thead {
    border: none;
    clip: rect(0 0 0 0);
    height: 1px;
    margin: -1px;
    overflow: hidden;
    padding: 0;
    position: absolute;
    width: 1px;
  }
  
  table tr {
    border-bottom: 3px solid #ddd;
    display: block;
    margin-bottom: .625em;
  }
  
  table td {
    border-bottom: 1px solid #ddd;
    display: block;
    font-size: .8em;
    text-align: right;
  }
  
  table td::before {
    /*
    * aria-label has no advantage, it won't be read inside a table
    content: attr(aria-label);
    */
    content: attr(data-label);
    float: left;
    font-weight: bold;
    text-transform: uppercase;
  }
  
  table td:last-child {
    border-bottom: 0;
  }
}

.overflow{
 overflow:scroll;
}

</style>

<s:if  test="#request.ELEMENT_NAME=='byimo'">
<br/>
<br/>
  <div class="overflow">
  
	<table class="table table-striped table-bordered dt-responsive wrap" id="record1" width="100%" cellspacing="0">
       <thead>
         <tr style="color:#000000;">
           <th>SNo</th>
           <th>Choose Vessel</th>
           <th>IMO Number</th>
           <th>Ship Name</th>
           <th>Type Of Ship</th>
           <th>Ship Status</th>
           <th>Year Of Build</th>
           <th>Flags</th>
           <th>Class</th>
           <th>PI club</th>
           <th>Ship Overall Compliance</th>
           <th>Sanction Screening</th>
           <th>Sanction Factors</th>
           <th>View </th>
         </tr>
       </thead>
       <tbody id="tbl_posts_body">
       <s:iterator value="shipByIHSLRorIMORes.apsshipdetail" status="cnt" var="var">
         <tr>
           <td data-label="SNo"><span class="sn"><s:property value="%{#cnt.count}"/></span>.</td>
          <td data-label="Choose Vessel">
           
           <input type="radio" name="selects" id="selects<s:property value='%{#var.ihslrorimoshipno}'/>" onclick="getImoNumber('<s:property value="%{#var.ihslrorimoshipno}"/>')"/></td>
           <td data-label="IMO Number"><s:property value="%{#var.ihslrorimoshipno}"/></td>
           <td data-label="Ship Name"><s:property value="%{#var.shipname}"/></td>
           <td data-label="Type Of Ship"><s:property value="%{#var.shiptypeGroup}"/></td> 
            <td data-label="Ship Status"><s:property value="%{#var.shipstatus}"/></td>
            <td data-label="Year Of Build"><s:property value="%{#var.yearOfBuild}"/></td> 
            <td data-label="Flags"><s:property value="%{#var.flagname}"/></td> 
            <td data-label="Class"><s:property value="%{#var.classificationsociety}"/></td> 
            <td data-label="PI Club"><s:property value="%{#var.PandIHistory.PandIClubCode[0]}"/></td> 
            <td data-label="Ship Overall Compliance"><s:property value="%{#var.shipoverallcompliancestatus}"/></td> 
            <td data-label="Sanction Screening">
            <s:if test='"0".equalsIgnoreCase(#var.shipownerfatfjurisdiction)'>
            	<font color="green"><s:text name="OK"/></font>
            </s:if>
            <s:elseif test='"1".equalsIgnoreCase(#var.shipownerfatfjurisdiction)'>
            	<font color="orange"><s:text name="Warning"/></font>
            </s:elseif>
            <s:elseif test='"2".equalsIgnoreCase(#var.shipownerfatfjurisdiction)'>
            	<font color="red"><s:text name="Severe"/></font>
            </s:elseif>
            </td> 
            <td data-label="Sanction Factors"><s:property value="%{#var.shipownerfatfjurisdiction}"/></td> 
            <td data-label="View"><input type="button" value="View" class="btn btn-sm btn-primary btn-width" onclick="return view('vesselView','<s:property value="%{#var.ihslrorimoshipno}"/>')"/></td>
         </tr>
       </s:iterator>
       </tbody>
    </table>
    
  </div>
    <script type="text/javascript">
    var imo='<s:property value="imoNumber"/>';
	//alert("selects"+imo);
	if(imo!=null && imo!=''){
		//alert();
		document.getElementById("selects"+imo).checked=true; 
	}
</script>
</s:if>
<s:elseif  test="#request.ELEMENT_NAME=='byName'">
	<table class="table table-striped table-bordered dt-responsive nowrap" id="record" width="100%" cellspacing="0">
       <thead>
         <tr style="color:#000000;">
           <th>SNo</th>
            <th>&nbsp;</th>
           <th>IMO Number</th>
           <th>Ship Name</th>
           <th>Ship Status</th>
           <!-- <th>Year Of Build</th> -->
           <th>View </th>
           
         </tr>
       </thead>
       <tbody>
       <s:iterator value="shipByNameRes.Ships" status="cnt" var="var">
         <tr>
           <td><span class="sn"><s:property value="%{#cnt.count}"/></span>.</td>
           <s:if test="#var.ihslrorimoshipno==imoNumber">
           <td><input type="radio" name="selects" id="selects<s:property value='%{#var.ihslrorimoshipno}'/>" checked="checked" onclick="getImoNumber('<s:property value="%{#var.ihslrorimoshipno}"/>')"/></td>
           </s:if>
           <s:else>
           <td><input type="radio" name="selects" id="selects<s:property value='%{#var.ihslrorimoshipno}'/>"  onclick="getImoNumber('<s:property value="%{#var.ihslrorimoshipno}"/>')"/></td>
           </s:else>
           <td><s:property value="%{#var.ihslrorimoshipno}"/></td>
           <td><s:property value="%{#var.shipname}"/></td>
            <td><s:property value="%{#var.shipstatus}"/></td>
           <%--  <td><s:property value="%{#var.dateofbuild}"/></td> --%>
            <%-- <td><input type="button" value="View" class="btn btn-sm btn-primary btn-width" onclick="view('<s:property value="#cnt.count-1"/>')" /></td> --%>
            <td><input type="button" value="View" class="btn btn-sm btn-primary btn-width" onclick="return view('vesselView','<s:property value="%{#var.ihslrorimoshipno}"/>')"/></td>
         </tr>
       </s:iterator>								          
         
       </tbody>
    </table>
   <script type="text/javascript">
    var imo='<s:property value="imoNumber"/>';
	//alert("selects"+imo);
	if(imo!=null && imo!=''){
		//alert();
		document.getElementById("selects"+imo).checked=true; 
	}
</script>
</s:elseif>
<s:elseif  test="#request.ELEMENT_NAME=='byexName'">
	<table class="table table-striped table-bordered dt-responsive nowrap" id="record" width="100%" cellspacing="0">
       <thead>
         <tr style="color:#000000;">
           <th>SNo</th>
            <th>&nbsp;</th>
           <th>IMO Number</th>
           <th>Ship Name</th>
           <th>Ship Status</th>
           <!-- <th>Year Of Build</th> -->
           <th>View </th>
           
         </tr>
       </thead>
       <tbody id="tbl_posts_body">
       <s:iterator value="shipByExNameRes.Ships" status="cnt" var="var">
         <tr>
           <td><span class="sn"><s:property value="%{#cnt.count}"/></span>.</td>
           <td><input type="radio" name="selects" id="selects<s:property value='%{#var.ihslrorimoshipno}'/>" onclick="getImoNumber('<s:property value="%{#var.ihslrorimoshipno}"/>')"/></td>
           <td><s:property value="%{#var.ihslrorimoshipno}"/></td>
           <td><s:property value="%{#var.shipname}"/></td>
            <td><s:property value="%{#var.shipstatus}"/></td>
            <%-- <td><s:property value="%{#var.dateofbuild}"/></td> --%>
           <%--  <td><input type="button" value="View" class="btn btn-sm btn-primary btn-width" onclick="view('<s:property value="#cnt.count-1"/>')" /></td> --%>
         	<td><input type="button" value="View" class="btn btn-sm btn-primary btn-width" onclick="return view('vesselView','<s:property value="%{#var.ihslrorimoshipno}"/>')"/></td>
         </tr>
       </s:iterator>								          
         
       </tbody>
    </table>
<script type="text/javascript">
    var imo='<s:property value="imoNumber"/>';
		//alert("selects"+imo);
		if(imo!=null && imo!=''){
			//alert();
			document.getElementById("selects"+imo).checked=true; 
		}
		
		
	
</script>
</s:elseif>


