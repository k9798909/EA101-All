<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.game.model.*"%>

<%
	GameService gameSvc = new GameService();
	String gmname = request.getParameter("gmname");
	List<GameVO> list = gameSvc.getSomeGames(gmname);
	pageContext.setAttribute("list", list);
%>

<!doctype html>
<html lang="en">
<head>

<meta charset="utf-8">

<title>遊戲列表</title>

<style>
table {
	margin-top: 10px;
}

tr th {
	border: 2px solid black;
	text-align: center;
}

td {
	text-align: center;
}

.icon {
	width: 20px;
	height: 20px;
}

tr:nth-child(odd) {
	background-color: #FFED97;
}

img {
	width: 50px;
	height: 50px;
}

h4 {
	margin-left: 20px;
}
</style>
</head>

<body>

<%@ include file="/front-end/front-end-nav.jsp" %>

<h4>
	<a href="../shop/index.jsp"><img src="images/add-icon.png"
		class="icon">回首頁</a>
</h4>

<jsp:include page="select_page.jsp" flush="true">
	<jsp:param name="" value="" />
</jsp:include>

<table>
	<tr style="background-color: #FFFFFF; border: 0px; font:;">
		<td style="background-color: #FFFFFF; border: 0px;">
			<h3>遊戲列表</h3>
		</td>
	</tr>
</table>
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color: red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color: red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
<div>
	<table>
		<tr>
			<th>遊戲編號</th>
			<th>遊戲名稱</th>
			<th>遊戲圖片</th>
			<th>修改</th>
		</tr>
		<c:forEach var="gameVO" items="${list}">
			<tr>
				<td>${gameVO.gmno}</td>
				<td>${gameVO.gmname}</td>
				<td><img
					src="<%=request.getContextPath()%>/GameShowImg?gmno=${gameVO.gmno}"></td>
				<td>
					<FORM METHOD="post" ACTION="game.do" style="margin-bottom: 0px;">
						<input type="submit" value="修改"> <input type="hidden"
							name="gmno" value="${gameVO.gmno}"> <input type="hidden"
							name="action" value="getOne_For_Update">
					</FORM>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>



</body>
</html>