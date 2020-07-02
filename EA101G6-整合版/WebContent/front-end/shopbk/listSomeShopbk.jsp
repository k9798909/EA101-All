<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.shopbk.model.*"%>
<%@ include file="/front-end/front-end-nav.jsp" %>
<%
	ShopbkService shopbkSvc = new ShopbkService();
	String shopno = null;
	String shoppds = null;
	String shoppde = null;
	List<ShopbkVO> list = null;
	if(request.getParameter("shopps")==null || request.getParameter("shoppe")==null){
		shopno = request.getParameter("shopno");
		list = shopbkSvc.getShopbkByShop(shopno);
	}
	if(request.getParameter("shopno")==null) {
		shoppds = request.getParameter("shoppds");
		shoppde = request.getParameter("shoppde");
		list = shopbkSvc.getShopbkByTime(shoppds, shoppde);
	}
	pageContext.setAttribute("list", list);
%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">

	<title>�C���C��</title>

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



<h4>
	<a href="../shop/index.jsp"><img src="images/add-icon.png" class="icon">�^����</a>
</h4>

<jsp:include page="select_page.jsp" flush="true">
	<jsp:param name="" value="" />
</jsp:include>

<table>
	<tr style="background-color: #FFFFFF; border: 0px; font:;">
		<td style="background-color: #FFFFFF; border: 0px;">
			<h3>���a���ѭq��C��</h3>
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
<div>
	<table>
		<tr>
			<th>���a�s��</th>
			<th>���ѤH��</th>
			<th>�}�l�ɶ�</th>
			<th>�����ɶ�</th>
			<th>�H�p�ɭp��</th>
			<th>�]��</th>
		</tr>
		<c:forEach var="shopbkVO" items="${list}">
			<tr>
				<td>${shopbkVO.shopno}</td>
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