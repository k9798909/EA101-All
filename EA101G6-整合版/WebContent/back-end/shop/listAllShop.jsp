<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.shop.model.*"%>

<%
	ShopService shopSvc = new ShopService();
	List<ShopVO> list = shopSvc.getAll();
	pageContext.setAttribute("list", list);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
</head>
<body>
<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color: red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color: red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
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
<div>
	<table>
		<tr>
			<th>���a�s��</th>
			<th>���a�W��</th>
			<th>��m</th>
			<th>���a</th>
			<th>�q��</th>
			<th>���a�Ϥ�</th>
			<th>���a���A</th>
			<th>�ק�</th>
		</tr>
		<c:forEach var="shopVO" items="${list}">
			<tr>
				<td>${shopVO.shopno}</td>
				<td>${shopVO.shopname}</td>
				<td>${shopVO.shoploc}</td>
				<td>${shopVO.shopcy}</td>
				<td>0${shopVO.shopphone}</td>
				<td><img src="<%=request.getContextPath()%>/ShopShowImg?shopno=${shopVO.shopno}"></td>
				<td>${(shopVO.status==0)? '���f��':''}${(shopVO.status==1)? '�f�ֳq�L':''}${(shopVO.status==2)? '���v':''}</td>
				<td>
					<FORM METHOD="post" ACTION="shop.do" style="margin-bottom: 0px;">
						<input type="submit" value="�ק�"> <input type="hidden"
							name="shopno" value="${shopVO.shopno}"> <input
							type="hidden" name="action" value="getOne_For_Update">
					</FORM>
				</td>
			</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>