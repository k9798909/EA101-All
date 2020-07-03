<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.gmlist.model.*"%>
<%@ page import="com.shop.model.*"%>
<%@ page import="com.game.model.*"%>

<%
	GmlistService gmlistSvc = new GmlistService();
	List<GmlistVO> list = gmlistSvc.getAll();
	pageContext.setAttribute("list", list);
%>
<jsp:useBean id="gameSvc" scope="page" class="com.game.model.GameService" />
<jsp:useBean id="shopSvc" scope="page" class="com.shop.model.ShopService" />

<!doctype html>
<html lang="zh">
<head>
<meta charset="utf-8">
	<title>���a���ѹC���C��</title>

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
	width: 150px;
	height: 100px;
}

h4 {
	margin-left: 20px;
}
</style>
</head>
<body>

<%@ include file="/front-end/front-end-nav.jsp" %>


<jsp:include page="select_page.jsp" flush="true">
	<jsp:param name="" value="" />
</jsp:include>

<table>
	<tr style="background-color: #FFFFFF; border: 0px; font:;">
		<td style="background-color: #FFFFFF; border: 0px;">
			<h3>���a���ѹC���C��</h3>
		</td>
	</tr>
</table>
<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color: red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color: red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

	<table>
		<tr>
			<th>���a�W��</th>
			<th>���a�Ӥ�</th>
			<th>���a��m</th>
			<th>�C���W��</th>
			<th>�C���Ϥ�</th>
		</tr>
		<c:forEach var="gmlistVO" items="${list}">
			<tr>
				<td>${ shopSvc.getOneShop(gmlistVO.shopno).shopname }</td>
				<td><img src="<%=request.getContextPath()%>/ShopShowImg?shopno=${gmlistVO.shopno}"></td>
				<td>${ shopSvc.getOneShop(gmlistVO.shopno).shoploc }</td>
				<td>${ gameSvc.getOneGame(gmlistVO.gmno).gmname }</td>
				<td><img style="width: 50px; height: 50px;" src="<%=request.getContextPath()%>/GameShowImg?gmno=${gmlistVO.gmno}"></td>
			</tr>
		</c:forEach>
	</table>




</body>
</html>