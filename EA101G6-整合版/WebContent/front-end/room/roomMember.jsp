<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.joinrm.model.*"%>

<%
	JoinrmService joinrmSvc2 = new JoinrmService();
	List<JoinrmVO> list2 = joinrmSvc2.findByPK(request.getParameter("rmno"),"");
	pageContext.setAttribute("list2",list2);
%>
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
</head>
<body>

	<c:forEach var="joinrmVO2" items="${list2}">
		${joinrmVO2.mbrno} <br>
	</c:forEach>

</body>
</html>