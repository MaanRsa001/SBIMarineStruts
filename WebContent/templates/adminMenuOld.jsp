<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="/pages/sessionCheckAdmin.jsp" %>
<html>
    <head>
    	<link href="css/ddlevelsmenu-topbar.css" rel="stylesheet" type="text/css" />
        <link href="css/ddlevelsmenu-base.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/jquery-ui.js"></script>
        <script type="text/javascript" src="js/jquery.easyui.min.js"></script>
        <script type="text/javascript">
            ddlevelsmenu.setup("ddtopmenubar", "topbar")
        </script>
    </head>
    <body>
        <table width="100%" align="center" border="0" cellspacing="0" cellpadding="0" style="background: #4f6180;">
            <tr> 
                <td>
                    <div id="ddtopmenubar" class="mattblackmenu" style="z-index: 2000;">
                        <ul>
                            <s:iterator value="%{#session.MenuList}" var="menuList" status="stat">
                                <s:if test='%{PARENT_MENU==null && !"99999".equals(MENU_ID) && !"Parent".equals(DETAIL_NAME)}'>
                                    <li>
                                        <a href="<s:property value="MENU_URL"/>" /><s:property value="MENU_NAME"/></a>
                                    </li>
                                </s:if>
                                <s:elseif test='PARENT_MENU=="99999"'>
                                    <li>
                                        <a rel="ddsubmenu<s:property value="MENU_ID"/>" style="cursor:pointer"/><s:property value="MENU_NAME"/></a>
                                    </li>
                                </s:elseif>
                                <s:elseif test='%{PARENT_MENU!="99999" && PARENT_MENU!=null && !"".equals(CATEGORY_DETAIL_ID)}'>
                                    <ul id="ddsubmenu<s:property value="PARENT_MENU"/>" class="ddsubmenustyle">
                                        <s:iterator value="%{#session.MenuList}" var="menuSubList">
                                            <s:if test="#menuSubList.PARENT_MENU == #menuList.PARENT_MENU">
                                                <li>
                                                    <a href="<s:property value="MENU_URL"/>" /><s:property value="MENU_NAME"/></a>
                                                </li>
                                            </s:if>
                                        </s:iterator>
                                    </ul>
                                </s:elseif>
                            </s:iterator>
                            <!-- <li><a href="viewDeposit.action"/><s:text name="Deposit Master"/></a> </li> -->
                        </ul>
                    </div>
                </td>
            </tr>
        </table>
    </body>
</html>
