<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
try {
	String contextPath = request.getContextPath();
	String userType = (String)session.getAttribute("usertype");
	if(org.apache.commons.lang.StringUtils.isBlank(userType) || !"admin".equals(userType)) {
		%>
			<jsp:forward page="/login/error_messg.jsp"/>
		<%
	}
} catch(Exception e) {
	e.printStackTrace();
}
%>