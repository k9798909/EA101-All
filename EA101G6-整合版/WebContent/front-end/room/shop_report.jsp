<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<form METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/room/shoprp.do">
	<table>
	<tr>
		<th>會員名稱</th><th>是否到場</th><th>備註</th>
	</tr>
	<c:forEach var="joinrmVO2" items="${list2}">
		<tr>
		    <td><input type="hidden" name="rmno" value="<%=request.getParameter("rmno")%>">
			<input type="text" name="mbrno" value="${joinrmVO2.mbrno}" readonly></td>
			<td><input type="checkbox" value="1" name="attend"></td>
			<td><input type="text" name="detail" value="123"></td>
		</tr>	             		 	  
	</c:forEach>
	<tr>
		<td colspan="3" align="right">
			<input type="hidden" name="action" value="insert">
			<input type="submit" value="送出">
		</td>
	</tr>
	</table>
</form>

</body>
</html>