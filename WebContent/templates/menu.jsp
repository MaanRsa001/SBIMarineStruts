<style>

header{

 border-radius: 20px !important;
 


}



ul, li{
cursor:pointer;
}

</style>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>


  <header class="header header_style_02">
  
        <nav class="megamenu navbar navbar-default" id="topnavbar">
            <!-- <div class="container"> -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
             
                </div>
                
                 <div id="navbar" class="navbar-collapse collapse nav-menu">
                 <s:if test="menuBlocker != 'bulkreport'">
                 <s:if test='"admin".equals(#session.usertype)'> 
                 <ul class="nav navbar-nav nav-ul"> 
                 <s:if test='#session.MenuList != null && #session.MenuList.size()>0'>
                    	<s:iterator var="menu" value="#session.MenuList">
                    		<s:if test='"99999".equalsIgnoreCase(#menu.ParentMenu)'>
	                    		 <li class="nav-ul dropdown"><a><s:property value="#menu.MenuName"/></a>
		                        	<ul class="nav-ul dropdown-content dropdown-Menu ">
		                        		<s:iterator var="subMenu" value="#session.MenuList">
		                        			<s:if test='#menu.MenuId == #subMenu.ParentMenu'>
					                    		<li class="nav-menu0"><a class="quotes_a" href="#" onclick="dynamicMenu('<s:property value="#subMenu.MenuUrl"/>');"><s:property value="#subMenu.MenuName"/></a></li>
					                    	</s:if>
					                    </s:iterator>			                    
		                			</ul>
		                        </li>
	                        </s:if>
	                        <s:elseif test='#menu.ParentMenu == null || "".equalsIgnoreCase(#menu.ParentMenu)'>
	                        	<li class="nav-li dropdown"><a class="active" href="#" onclick="dynamicMenu('<s:property value="#menu.MenuUrl"/>');"><s:property value="#menu.MenuName"/></a></li>
	                        </s:elseif>
                    	</s:iterator>
                    </s:if>
                 </ul>
                 </s:if>
                 <s:else>
                    <ul class="nav navbar-nav nav-ul">                    
                        <li class="nav-li dropdown"><a href="#" onclick="newQuote('<s:property value="%{#session.product_id}"/>')">New Quote</a></li>
                         
                        <li class="nav-ul dropdown"><a>Quote Register </a>
                        	<ul class="nav-ul dropdown-content">
			                    <li class="nav-menu0"><a class="quotes_a" href="#" onclick="menuSelect('QE')">Existing Quotes</a></li>
			                    <li class="nav-menu0"><a class="quotes_a" href="#" onclick="menuSelect('QL')">Lapsed Quotes</a></li>			                     
			                    <li class="nav-menu0"><a class="quotes_a" href="#" href="#" onclick="menuSelect('L')">Rejected Quotes</a></li>
			                </ul>
			                
                        </li>
                        <s:if test='#session.product_id==getText("OPEN_COVER")'>
                        <li class="nav-ul dropdown"><a>Portfolio</a>
                        	<ul class="nav-ul dropdown-content dropdown-Menu ">
			                    <li class="nav-menu0"><a class="quotes_a" onclick="menuSelect('P')">Certificate</a></li>
			                    <li class="nav-menu0"><a class="quotes_a" onclick="menuSelect('PC')">Canceled Certificate</a></li>
			                    <li class="nav-menu0"><a class="quotes_a" onclick="menuSelect('PF')">Failed Certificate</a></li>
			                </ul>
                        </li>	
                        </s:if>
                        <s:else>
                        <li class="nav-ul dropdown"><a>Portfolio</a>
                        	<ul class="nav-ul dropdown-content dropdown-Menu ">
			                    <li class="nav-menu0"><a class="quotes_a" onclick="menuSelect('P')">Policies</a></li>
			                    <li class="nav-menu0"><a class="quotes_a" onclick="menuSelect('PC')" style="text-align:justify;">Canceled Policies</a></li>
			                    <li class="nav-menu0"><a class="quotes_a" onclick="menuSelect('PF')">Failed Policies</a></li>
			                </ul>
                        </li>
                        </s:else>
                        <li class="nav-ul dropdown">
                        <s:if test='#session.product_id==getText("OPEN_COVER")'>	
						<a href="#">Referral Certificate</a>
						</s:if>
						<s:else>
						<a href="#">Referral Quote</a>
						</s:else>
                        	<ul class="nav-ul dropdown-content dropdown-Menu ">
			                    <li class="nav-menu0"><a class="quotes_a" onclick="menuSelect('RA')" >Referral Approved</a></li>
			                    <li class="nav-menu0"><a class="quotes_a" onclick="menuSelect('RU')">Referral UnApproved</a></li>
			                    <li class="nav-menu0"><a class="quotes_a" onclick="menuSelect('RR')">Referral Rejected</a></li>
			                </ul>
                        </li>
                        <s:if test='%{!"User".equalsIgnoreCase(#session.usertype)}'>
                        <li class="nav-li dropdown"><a href="#" onclick="menuSelect('C')">Customer</a></li>
                         </s:if>
                         <s:if test='#session.LoginType != "B2C"'>
						<li class="nav-ul dropdown">
						<a href="#"><s:text name="label.menu.reports"/></a>
						<ul class="nav-ul dropdown-content dropdown-Menu ">
							<li class="nav-menu0"><a class="quotes_a" href="#" onclick="menuSelect('R')"><s:text name="label.menu.reports"/></a></li>
							<s:if test='#session.usertype==getText("ISSUER") && "3".equals(#session.product_id) || "11".equals(#session.product_id)'>
							 	
							 	<s:if test='"3".equals(#session.product_id)'><li class="nav-menu0"><a class="quotes_a" href="#" onclick="moveBulkPrint('BRP')">Bulk Report Print </a></li></s:if>		
							 </s:if>	
						</ul>
					</li>
				</s:if>
				<s:if test='#session.product_id=="11"'>
					<li class="nav-ul dropdown">
						<a href="#">Open Cover</a>
						<ul class="nav-ul dropdown-content dropdown-Menu ">
							<li class="nav-menu0"><a class="quotes_a"  href="#" onclick="declarationMenu('C')" >Certificate</a></li>
							<li class="nav-menu0"><a class="quotes_a"  href="#" onclick="declarationMenu('D')">Declaration</a></li>
							<li class="nav-menu0"><a class="quotes_a"  href="#" onclick="declarationMenu('DE')">Declaration Menu</a></li>
							<li class="nav-menu0"><a class="quotes_a"  href="<%=request.getContextPath()%>/redirectOpenUpload.action" onclick="menuSelect('RU')">Declaration Upload</a></li>
							<li class="nav-menu0"><a class="quotes_a"  href="#" onclick="goTransaction()">Upload Transaction</a></li>
						</ul>
					</li>	
				</s:if>
				<s:if test='issuer !=null && !("33".equals(#session.product_id) || "65".equals(#session.product_id))'>
					<li class="nav-li dropdown"><a href="#" onclick="menuSelect('PE')">Endorsement</a></li>
				</s:if>				
				<li class="nav-li dropdown"><a href="#" onclick="simSubmit('initCopyQuote.action')"><s:text name="label.menu.copyquote"/></a></li>
				<li class="nav-li dropdown"><a href="#" onclick="simSubmit('initSearchReport.action')" >  <s:text name="label.menu.search"/></a></li>		
				<%--  <li class="nav-li dropdown"><a href="#" onclick="simSubmit('shipDetailsReport.action')" >  <s:text name="Shipment Tracking"/></a></li> --%>   
                               
                               
                     <%-- </s:else>  --%>
                       
                    </ul>
                    </s:else>
                    </s:if>
                </div>
           <!--  </div> -->
        </nav>
        <s:form theme="simple" action="initReport.do" method="post" name="menu">
        	<s:hidden name="menuType"/>		
			<s:hidden name="productId"/>
			<s:hidden name="quoteStatus"/>
			<s:hidden name="loginId"/>
			<s:token/>
        </s:form>
        
        <script type="text/javascript">
        function simSubmit(act){
        	document.forms['menu'].action="${pageContext.request.contextPath}/"+act;
        	document.forms['menu'].submit();
        }
function menuSelect(obj)
{	
	var productId=document.forms['menu'].productId.value;
	document.forms['menu'].menuType.value=obj;
	document.forms['menu'].loginId.value='<s:property value="#session.user"/>';
	document.forms['menu'].action="${pageContext.request.contextPath}/initReport.action";
	document.forms['menu'].submit();
}
function newQuote(productId)
{
	if(null=='<s:property value="#session.RSAISSUER"/>' || ''=='<s:property value="#session.RSAISSUER"/>')
	{
		document.forms['menu'].productId.value=productId;
		document.forms['menu'].quoteStatus.value='QE';	
		//if(productId=='31'||productId=='32'||productId=='33'||productId=='34'||productId=='41')//31-Travel & 32-Travel Standard &33-Travel -Walaa &41-Helath Insurance Walaa & 30-Home Insurance-Walaa
		if(productId=='31'||productId=='32'||productId=='34'||productId=='41')//31-Travel & 32-Travel Standard &33-Travel -Walaa &41-Helath Insurance Walaa & 30-Home Insurance-Walaa
		{
			document.forms['menu'].action="${pageContext.request.contextPath}/getDetailCustomer.action";
		}else if(productId=='65')
			document.forms['menu'].action="${pageContext.request.contextPath}/editQuoteMotor.action";
		else if(productId=='30')
			document.forms['menu'].action="${pageContext.request.contextPath}/packageSelectionHome.action";
		else if(productId=='33')
			document.forms['menu'].action="${pageContext.request.contextPath}/initTravel.action";	
		else if(productId=='40' || productId=='42')
			document.forms['menu'].action="${pageContext.request.contextPath}/initYacht.action";
		else
			document.forms['menu'].action="${pageContext.request.contextPath}/newQuoteQuotation.action";
	}else{
		document.forms['menu'].quoteStatus.value='QE';
		if(productId=='65')
			document.forms['menu'].action="${pageContext.request.contextPath}/editQuoteMotor.action";
		else if(productId=='30')
			document.forms['menu'].action="${pageContext.request.contextPath}/packageSelectionHome.action";
		else if(productId=='11' || productId=='3')
			document.forms['menu'].action="${pageContext.request.contextPath}/newQuoteQuotation.action";
		else if(productId=='40' || productId=='42')
			document.forms['menu'].action="${pageContext.request.contextPath}/initYacht.action";	
		else if(productId=='33')
			document.forms['menu'].action="${pageContext.request.contextPath}/initTravel.action";	
		else{
			document.forms['menu'].loginId.value='<s:property value="#session.user"/>';
			document.forms['menu'].action="${pageContext.request.contextPath}/newQuoteQuotation.action";
		}
	}
	document.forms['menu'].submit();
	return false;
}
function declarationMenu(obj)
{
	document.forms['menu'].menuType.value=obj;
	document.forms['menu'].action='${pageContext.request.contextPath}/initDeclaration.action';	
	document.forms['menu'].submit();
}
function movePolicyPrint(obj)
{
	document.forms['menu'].menuType.value=obj;
	document.forms['menu'].action='${pageContext.request.contextPath}/pInitDeclaration.action';	
	document.forms['menu'].submit();
}

function moveBulkPrint(obj)
{
	document.forms['menu'].menuType.value=obj;
	document.forms['menu'].action='${pageContext.request.contextPath}/bulkPrintReport.action';	
	document.forms['menu'].submit();
}

function motorVehicleDetails(policyNo) {
	document.forms['report'].menuType.value = 'PVD';
	document.forms['report'].policyNo.value = policyNo;
	document.forms['report'].action = "${pageContext.request.contextPath}/initReport.action";
	document.forms['report'].submit();
}
function dynamicMenu(act){
	document.forms['menu'].action="${pageContext.request.contextPath}/"+act;
	document.forms['menu'].submit();
}
function goTransaction()
{
 document.forms['menu'].action="${pageContext.request.contextPath}/listOpenUpload.action";
 document.forms['menu'].submit();
 return true;
}
$(document).ready(function(){
    $(document.body).css('padding-top', $('#topnavbar').height() + 20);
    $(window).resize(function(){
        $(document.body).css('padding-top', $('#topnavbar').height() + 20);
    });
});
</script>
    </header>
