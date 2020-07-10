<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.joinrm.model.*"%>

<%
	JoinrmService joinrmSvc2 = new JoinrmService();
	List<JoinrmVO> list2 = joinrmSvc2.findByPK(request.getParameter("rmno"),"");
	pageContext.setAttribute("list2",list2);
%>
<jsp:useBean id="mbrpfSvc" scope="page" class="com.mbrpf.model.MbrpfService" />
<!DOCTYPE html>
<html>
<head>

<title>房間內成員列表</title>
</head>
<body>

	<c:forEach var="joinrmVO2" items="${list2}">
		${mbrpfSvc.getOneMbrpf(joinrmVO2.mbrno).mbrname} <br>
	</c:forEach>

</body>
</html>