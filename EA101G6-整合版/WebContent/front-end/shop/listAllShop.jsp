<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.shop.model.*"%>

<%
	ShopService shopSvc = new ShopService();
	List<ShopVO> list = shopSvc.getAllowedShop();
	pageContext.setAttribute("list", list);
%>


<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">


	<title>���a�C��</title>

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
	width: 300px;
	height: 200px;
}

h4 {
	margin-left: 20px;
}
</style>
</head>

<body>

<%@ include file="/front-end/front-end-nav.jsp" %>

<h4>
	<a href="index.jsp"><img src="images/add-icon.png" class="icon">�^����</a>
</h4>

<jsp:include page="select_page.jsp" flush="true">
	<jsp:param name="" value="" />
</jsp:include>

<table>
	<tr style="background-color: #FFFFFF; border: 0px; font:;">
		<td style="background-color: #FFFFFF; border: 0px;">
			<h3>���a�C��</h3>
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
			<th>���a�W��</th>
			<th>��m</th>
			<th>���a</th>
			<th>�q��</th>
			<th>���a�Ϥ�</th>
<!-- 			<th>�ק�</th> -->
		</tr>
		<c:forEach var="shopVO" items="${list}">
			<tr>
				<td>${shopVO.shopname}</td>
				<td>${shopVO.shoploc}</td>
				<td>${shopVO.shopcy}</td>
				<td>0${shopVO.shopphone}</td>
				<td><img src="<%=request.getContextPath()%>/ShopShowImg?shopno=${shopVO.shopno}"></td>
<!-- 				<td> -->
<!-- 					<FORM METHOD="post" ACTION="shop.do" style="margin-bottom: 0px;"> -->
<!-- 						<input type="submit" value="�ק�"> <input type="hidden" -->
<%-- 							name="shopno" value="${shopVO.shopno}"> <input --%>
<!-- 							type="hidden" name="action" value="getOne_For_Update"> -->
<!-- 					</FORM> -->
<!-- 				</td> -->
			</tr>
		</c:forEach>
	</table>
</div>



</body>
</html>