 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="keywords" content="Maan Sarovar, Sea Trans, Marine Insurance">	
		<meta name="author" content="">
		<title> ::: E-Way - Customer Selection ::: </title>
		<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/saicoHeaderLogo.jpg" />	
		<script type="text/javascript" src="js/common.js"></script>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css//bootstrap.min.css" />
		<link href="<%=request.getContextPath()%>/bootstrap/css//style.css" rel="stylesheet" type="text/css" />
		
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.responsive.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.jqueryui.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/dataTables/css/dataTables.tableTools.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datepicker/jquery-ui.css">
		<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery-1.11.1.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery.dataTables.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.jqueryui.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.responsive.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/dataTables.tableTools.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/jquery.dataTables.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/dataTables/js/numeric-comma.js"></script>
		
		
   		<script type="text/javascript">
	  	jQuery(function ($) {
	  		try {
	  			var data = $('#record').dataTable( {
	  				"scrollY": 250,
					"paging": false,
					"order": [[ 1, "asc" ]],
					"columnDefs": [ {
			          "targets": 'no-sort',
			          "orderable": false
				    } ],
					responsive: true
				});
				var table = $('#record').DataTable();
				$('#clearBtn').click(function() {
				    table.search('').draw();
				});
			} catch(err){}
		} );
	  	</script>
	</head>
<body>

<s:form id="commodity" name="commodity" method="post" action="getQuoteQuotation.action" theme="simple">
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<s:actionerror cssStyle="color: red;" />
	</div>
</div>
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="panel panel-primary">
			<div class="panel-heading" align="center">
			<s:text name="label.categorygoodinfo"></s:text>
			</div>
			<div class="panel-body">
				<div>
					<table class="display responsive no-wrap" id="record" width="100%" cellspacing="0" style="font-size: 12px;">
						<thead>
							<tr>
									<th width="45%"><b><s:text name="label.categorygood"/><FONT color=red>**</FONT></b></th>
									<th width="45%"><b><s:text name="label.description"/></b></th>
									<th width="10%"><b><s:text name="label.fragile"/></b></th>
									
							</tr>
						</thead>
						<tbody>					
							<s:iterator value="commdityId" var="list" status="stat">
								<tr>
								<td>
				   				 <s:checkbox name="commditycheck[%{#stat.index}]"/><s:property value="commdityName[#stat.index]"/>
				   				 <s:hidden name="commdityId[%{#stat.index}]" />
				   				 <s:hidden name="commdityName[%{#stat.index}]"/>
				   				 <s:hidden name="commodityTypeId[%{#stat.index}]"/>
								</td>
								<td><s:textarea name="commdityNameDesc[%{#stat.index}]"  onkeyup="textLimit(this,600)" rows="3" cols="20" cssClass="inputBox tooltipContent"/></td>
								<td><s:checkbox name="commdityFragile[%{#stat.index}]" /></td>
										
								</tr>
							</s:iterator>
						</tbody>
					</table>
				
				</div>
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" align="center">
						<button type="button" name="close" class="btn btn-danger btn-oval" data-dismiss="modal">Close</button>
						<input type="button" id="commoditybtn" value="Submit" onclick="fncomSubmit()" class="btn btn-sm btn-success">
					</div>
				</div>
			</div>
		</div>
	</div>
<s:hidden name="totalLength" id="totalLength" value="%{commodityList.size()}"/>
<s:hidden name="error" id="error"/>
<s:hidden name="totalTypeIDLength" id="totalTypeIDLength"/>
<s:hidden name="chkProposalNo" id="chkProposalNo"/>
<s:hidden name="proposalNo" id="proposalNo"/>
<s:hidden name="identify" id="identify"/>
</s:form>
<script type="text/javascript">
function settingBefore(selectLength)
{
	if(selectLength.length>=1)
	{
		var commodityLen=document.commodity.totalLength.value;
		var idLen=document.commodity.totalTypeIDLength.value;
		for(var i=1;i<=commodityLen;i++)
		{
			var c=eval("window.opener.Quotation.commodityId"+i+".value");
			if('selected'==c)
			{
				eval("document.commodity.commodityId_"+i+".checked=true");
				eval("document.commodity.commodity_desc"+i+".value=window.opener.Quotation.commodity_desc"+i+".value");
				c=eval("window.opener.Quotation.commodity_Fragile"+i+".value");
				if('selected'==c)
					eval("document.commodity.commodityFragile"+i+".checked=true");
				/*c=eval("window.opener.Quotation.commodityType"+i+".value");
				for(var ct=1;ct<=idLen;ct++)
				{
					if(ct == c)
						eval("document.commodity.commodityType"+i+".value="+c);
				}*/
			}
		}
	}
}

function textLimit(field, maxlen) 
{
	if (field.value.length > maxlen + 1)
		alert('Character is Exceed Maximum Length!');
	if (field.value.length > maxlen)
		field.value = field.value.substring(0, maxlen);
} 
function fncomSubmit(){
	//document.commodity.action = 'savecommodityOpenCover.action';
	//document.commodity.submit();
	postFormRequest('savecommodityOpenCover.action','commoditySelectionAjaxId','commodity');
	$("#commoditybtn").attr("data-dismiss","modal");
}
function submitForms()
{	
	$('#gridTable').DataTable().search('').draw();
	//with(Form)
	//{
	//	var r=document.commodity.commodityLen.length;
		var count=0;
		var commodityLen = document.commodity.totalLength.value;
		var k=0;
		var name='';
		var nameId='';
		var error="";
		var cmName = ' ';
	if(window.opener.document.Quotation.chkProposalNo.value == document.commodity.chkProposalNo.value)
	{
		for(var i=1;i<=commodityLen;i++)
		{			
			var c = eval("document.commodity.commodityId["+i+"].checked");
			if(c)
			{ 
			
				k++;	
				var openComId = eval("document.commodity.opencommodityId"+i+".value");
				nameId=nameId+','+openComId;
				name=name+','+eval("document.commodity.comName"+i+".value");
				eval("window.opener.document.Quotation.commodityId"+i+".value='selected'");
				eval("window.opener.document.Quotation.commodity_desc"+i+".value=document.commodity.commdityName["+i+"].value");
				if(eval("document.commodity.commodityFragile"+i+".checked"))
				{	
					eval("window.opener.document.Quotation.commodity_Fragile"+i+".value='selected'");	
				}
				
				var comDesc = eval("document.commodity.commodity_desc"+i+".value");
				comDesc = removeSpaces(comDesc);
				var errname = eval("document.commodity.comName"+i+".value");
				errname = "<font color='blue'>"+errname+"</font>";

				if(comDesc.length == 0)
				{
					error = error+"Please enter goods desription for - "+errname+"<br/>";
				}

				else
					eval("window.opener.document.Quotation.commodityType"+i+".value=1");
			}
			else {
				eval("window.opener.document.Quotation.commodityId"+i+".value=''");
			}
		}
		name=name.substr(1,name.length); 
		nameId=nameId.substr(1,nameId.length);
		//alert(name);
		window.opener.document.Quotation.totalCommudity.value=k;
		window.opener.document.Quotation.commodityIds.value=nameId;
		window.opener.document.Quotation.commodity_TA.value=name;
		
		window.close();
	} // chkproposalNo if statement...
	else
	{
		alert("please close the commodity selection window and reopen again");
		window.close();
	}
	return false;
}

function removeSpaces(string) {
 return string.split(' ').join('');
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
//settingBefore('<s:property value="commodityIds"/>');	
</script>	
</body>
</html>