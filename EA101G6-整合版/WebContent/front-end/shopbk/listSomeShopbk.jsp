<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.shopbk.model.*"%>
<%@ include file="/front-end/front-end-nav.jsp" %>
<%
	ShopbkService shopbkSvc = new ShopbkService();
	String shopno = null;
	java.sql.Timestamp shoppds = null;
	java.sql.Timestamp shoppde = null;
	List<ShopbkVO> list = null;
	if(request.getParameter("shopps")==null || request.getParameter("shoppe")==null){
		shopno = request.getParameter("shopno");
		list = shopbkSvc.getShopbkByShop(shopno);
	}
	if(request.getParameter("shopno")==null) {
		shoppds = java.sql.Timestamp.valueOf(request.getParameter("shoppds"));
		shoppde = java.sql.Timestamp.valueOf(request.getParameter("shoppde"));
		list = shopbkSvc.getShopbkByTime(shoppds, shoppde);
	}
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



<jsp:include page="select_page.jsp" flush="true"/>

<table>
	<tr style="background-color: #FFFFFF; border: 0px; font:;">
		<td style="background-color: #FFFFFF; border: 0px;">
			<h3>店家提供訂位列表</h3>
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
			<th>店家名稱</th>
			<th>提供人數</th>
			<th>開始時間</th>
			<th>結束時間</th>
			<th>以小時計算</th>
			<th>包日</th>
		</tr>
		<jsp:useBean id="shopSvc" scope="page" class="com.shop.model.ShopService" />
		<c:forEach var="shopbkVO" items="${list}">
			<tr>
				<td>${shopSvc.getOneShop(shopbkVO.shopno).getShopname()}</td>
				<td>${shopbkVO.ofdtable}</td>
				<td>${shopbkVO.shoppds}</td>
				<td>${shopbkVO.shoppde}</td>
				<td>${shopbkVO.payinfohr}</td>
				<td>${shopbkVO.payinfoday}</td>
			</tr>
		</c:forEach>
	</table>
</div>



</body>
</html>