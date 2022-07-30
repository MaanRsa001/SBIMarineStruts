<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="/pages/sessionCheckAdmin.jsp" %>
<!DOCTYPE html>
<html>
<head>
 	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<div>
	<div class="row" style="margin-bottom: 0px;">
		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4"></div>
		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4"></div>
		<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 style="margin-bottom: 0px;">
						<s:if test='#session.product_id=="33" || #session.product_id=="34"'>
							<i class="fa fa-plane"></i>&nbsp;<s:text name="Travel Insurance"/>
						</s:if>
						<s:elseif test='#session.product_id=="41"'>
							<i class="fa fa-heartbeat"></i>&nbsp;<s:text name="Health Insurance"/>
						</s:elseif>
						<s:elseif test='#session.product_id=="65"'>
							<i class="fa fa-car"></i>&nbsp;<s:text name="Motor Insurance"/>
						</s:elseif>
						<s:elseif test='#session.product_id=="30"'>
							<i class="fa fa-home"></i>&nbsp;<s:text name="Home Insurance"/>
						</s:elseif>
						<s:elseif test='#session.product_id=="3" || #session.product_id=="11"'>
							<i class="fa fa-ship"></i>&nbsp;<s:text name="Marine Insurance"/>
						</s:elseif>						
					</h3>
				</div>
			</div>
		</div>
	</div>
	<div style="width: 100%; margin: 0 auto;">
		<ul class="slimmenu">
	       <s:iterator value="%{#session.MenuList}" var="menuList" status="stat">
	           <s:if test='%{PARENT_MENU==null && !"99999".equals(MENU_ID) && !"Parent".equals(MENU_NAME)}'>
	               <li>
	                   <a href="<s:property value="MENU_URL"/>" /><s:property value="MENU_NAME"/></a>
	               </li>
	           </s:if>
	           <s:elseif test='PARENT_MENU=="99999"'>
	           		 <li>
	                   <a href="<s:property value="MENU_URL"/>"><s:property value="MENU_NAME"/></a> 
	                   <ul style="padding: 0px;">
		                   <s:iterator value="%{#session.MenuList}" var="menuSubList" status="stat">
		                       <s:if test="#menuSubList.PARENT_MENU == #menuList.MENU_ID">
		                           <li>
		                               <a href="<s:property value="MENU_URL"/>" /><s:property value="MENU_NAME"/></a>
		                           </li>
		                       </s:if>
		                   </s:iterator>
		               </ul>                  
	              	</li>
	           </s:elseif>
	           <s:elseif test='PARENT_MENU==null'>
	           		<li>
	                   <a href="<s:property value="MENU_URL"/>" /><s:property value="MENU_NAME"/></a>
	               </li>
	           </s:elseif> 
	         <%--  <s:elseif test='%{PARENT_MENU!="99999" && PARENT_MENU!=null && !"".equals(MENU_ID)}'>
	               <li>
	                   <a style="cursor:pointer" href="<s:property value="MENU_URL"/>"><s:property value="MENU_NAME"/></a>                 
		               <ul style="padding: 0px;">
		                   <s:iterator value="%{#session.MenuList}" var="menuSubList">
		                       <s:if test="#menuSubList.PARENT_MENU == #menuList.MENU_ID">
		                           <li>
		                               <a href="<s:property value="MENU_URL"/>" /><s:property value="MENU_NAME"/></a>
		                           </li>
		                       </s:if>
		                   </s:iterator>
		               </ul>
	               </li>
	           </s:elseif> --%>
	       </s:iterator>
	       <!-- <li><a href="viewDeposit.action"/><s:text name="Deposit Master"/></a> </li> -->
	   </ul>
	</div>	
</div>
</body> 	
</html>