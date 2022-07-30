<style>

header{
box-shadow: rgba(50, 50, 93, 0.25) 0px 6px 12px -2px, rgba(0, 0, 0, 0.3) 0px 3px 7px -3px;
 border-radius: 20px !important;
 margin-top: 10%;
 width: 100% !important;


}

@media only screen and (min-width: 500px) {
 header {
    margin-top:110px !important;
  }
}

@media only screen and (min-width: 510px) {
 header {
    margin-top:120px !important;
  }
}

ul, li{
cursor:pointer;
}

</style>



<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
  <header class="header header_style_02">
        <nav class="megamenu navbar navbar-default">
           <!--  <div class="container"> -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
             
                </div>
                
                 <div id="navbar" class="navbar-collapse collapse nav-menu">
                 <s:if test='"admin1".equals(#session.usertype)'> 
                 <ul class="nav navbar-nav nav-ul"> 
                 <s:if test='#session.MenuList != null && #session.MenuList.size()>0'>
                    	<s:iterator var="menu" value="#session.MenuList">
                    		<s:if test='"99999".equalsIgnoreCase(#menu.PARENT_MENU)'>
	                    		 <li class="nav-ul dropdown"><a><s:property value="#menu.MENU_NAME"/></a>
		                        	<ul class="nav-ul dropdown-content dropdown-Menu ">
		                        		<s:iterator var="subMenu" value="#session.MenuList">
		                        			<s:if test='#menu.MENU_ID == #subMenu.PARENT_MENU'>
					                    		<li class="nav-menu0"><a class="quotes_a" href="#" onclick="dynamicMenu('<s:property value="#subMenu.MENU_URL"/>');"><s:property value="#subMenu.MENU_NAME"/></a></li>
					                    	</s:if>
					                    </s:iterator>			                    
		                			</ul>
		                        </li>
	                        </s:if>
	                        <s:elseif test='#menu.PARENT_MENU == null || "".equalsIgnoreCase(#menu.PARENT_MENU)'>
	                        	<li class="nav-li dropdown"><a class="active" href="#" onclick="dynamicMenu('<s:property value="#menu.MENU_URL"/>');"><s:property value="#menu.MENU_NAME"/></a></li>
	                        </s:elseif>
                    	</s:iterator>
                    </s:if>
                 </ul>
                 </s:if>
                 <s:else>
                    <ul class="nav navbar-nav nav-ul">                    
                        <li class="nav-li dropdown"><a href="#" onclick="dynamicMenu('newQuoteOpenCover.do')">New Quote</a></li>
                         <li class="nav-li dropdown"><a href="#" onclick="dynamicMenu('quoteRegisterReportReg.do')">Quote Register</a></li>
                         <li class="nav-li dropdown"><a href="#" onclick="dynamicMenu('pendingAcceptReportReg.do?Status=A')">Pending To Accept </a></li>
                         <li class="nav-li dropdown"><a href="#" onclick="dynamicMenu('policyRegisterReportReg.do')">Portfolio </a></li>
                         <li class="nav-li dropdown"><a href="#" onclick="dynamicMenu('copyQuoteReportReg.do')">Copy Open Cover </a></li>	
                       	 <!-- <li class="nav-li dropdown"><a href="#" onclick="dynamicMenu('initPaymentTerm.do')">Payment Terms </a></li> -->
                       	 <li class="nav-li dropdown"><a href="#" onclick="dynamicMenu('expiredPolicyReportReg.do')">Expired Open Cover </a></li>
                       	 <li class="nav-li dropdown"><a href="#" onclick="dynamicMenu('renewalPolicyReportReg.do')">Renewal Pending </a></li>
                       	 <li class="nav-li dropdown"><a href="#" onclick="dynamicMenu('lapsedPolicyReportReg.do')">Lapsed Policies </a></li>
                    </ul>
                    </s:else>
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
        
function dynamicMenu(act){
	document.forms['menu'].action="${pageContext.request.contextPath}/"+act;
	document.forms['menu'].submit();
}
</script>
    </header>
