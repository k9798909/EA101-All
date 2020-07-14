<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>後台市集商品首頁</title>
</head>
<body>
<%@ include file="/back-end/back-end_nav.jsp"%>
	<ul>
		<c:if test="${not empty errormsgs}">
			<c:forEach var="errors" items="${errormsgs}">
				<li>${errors}</li>
			</c:forEach>
		</c:if>
	</ul>
	<ul>

		<jsp:useBean id="shgmsvc" class="com.shgm.model.ShgmService"/>

		<li>
			<form method="post" action="<%=request.getContextPath()%>/shgm/shgm.do" >
				請選擇市集商品編號：
				<select size="1" name="shgmno">
					<c:forEach var="shgmvo" items="${shgmsvc.allShgm}">
						<option value="${shgmvo.shgmno}">${shgmvo.shgmno}
					</c:forEach>
				</select>
				<input type="hidden" name="action" value="get_one" >
				<input type="submit" value="送出" >
			</form>
		</li>
		<li>
			<form method="post" action="<%=request.getContextPath()%>/shgm/shgm.do">
			請選擇市集商品名稱：
				<select size="1" name="shgmno">
					<c:forEach var="shgmvo" items="${shgmsvc.allShgm}">
						<option value="${shgmvo.shgmno}">${shgmvo.shgmname}
					</c:forEach>
				</select>
				<input type="hidden" name="action" value="get_one" >
				<input type="submit" value="送出" >
			</form>
		</li>

		<li>
			<a href="<%=request.getContextPath()%>/back-end/shgm/addShgm.jsp">上架新的市集商品</a>
		</li>

		<li>
			<form method="post" action="<%=request.getContextPath()%>/shgm/shgm.do">
			請選擇要修改的市集商品：
				<select size="1" name="shgmno">
					<c:forEach var="shgmvo" items="${shgmsvc.allShgm}">
						<option value="${shgmvo.shgmno}">${shgmvo.shgmno}
					</c:forEach>
				</select>
				<input type="hidden" name="action" value="getone_update" >
				<input type="hidden" name="requestURL" value="<%=request.getServletPath()%>"/>
				<input type="submit" value="送出" >
			</form>
		</li>

		<li>
			<a href="<%=request.getContextPath()%>/back-end/shgm/listAllShgm.jsp">檢視全部市集商品</a>
		</li>
	</ul>
</body>
</html> 