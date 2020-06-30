<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.emp.model.*" %>

<%
	EmpVO empVO = (EmpVO) request.getAttribute("empVO");
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/> <!--要有這條 -->
<title>修改密碼</title>
</head>
<body>
	<h3>員工更新密碼：</h3>
	
	<%-- 錯誤列表 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	
	<h4>
		<a href="<%= request.getContextPath()%>/back-end/emp/select_page.jsp">回首頁</a>
	</h4>
	
	<form method="post" action="<%= request.getContextPath()%>/emp/EmpServlet">
		<table>
			<tr>
				<td>員工編號：</td>
				<td><%=empVO.getEmpno()%></td>
			</tr>
			<tr>
				<td>新密碼：</td>
				<td><input type="password" name="emppwd" maxLength="10"></td>
			</tr>
			<tr>
				<td>確認密碼：</td>
				<td><input type="password" name="chkpwd" maxLength="10"></td>
			</tr>
		</table>
		<input type="hidden" name="action" value="updatePwd">
		<input type="hidden" name="empno" value="${empVO.empno}">
		<input type="submit" value="送出修改">
	</form>
	
</body>
</html>