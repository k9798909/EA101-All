<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.shop.model.*"%>

    <%
	ShopVO shopVO = (ShopVO) request.getAttribute("shopVO"); //shopServlet.java (Concroller) �s�Jreq��shopVO���� (�]�A�������X��shopVO, �]�]�A��J��ƿ��~�ɪ�shopVO����)
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>
</head>
<body>
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
<table>
	<tr>
		<th>���a�s��</th>
		<th>���a�W��</th>
		<th>��m</th>
		<th>���a</th>
		<th>�q��</th>
		<th>���a�Ϥ�</th>
		<th>���a���A</th>
	</tr>
	<tr>
		<td><%=shopVO.getShopno()%></td>
		<td><%=shopVO.getShopname()%></td>
		<td><%=shopVO.getShoploc()%></td>
		<td><%=shopVO.getShopcy()%></td>
		<td><%=shopVO.getShopphone()%></td>	
		<td><img src="<%=request.getContextPath()%>/ShopShowImg?shopno=${shopVO.shopno}" /></td>
		<td>${(shopVO.status==0)? '���f��':''}${(shopVO.status==1)? '�f�ֳq�L':''}${(shopVO.status==2)? '���v':''}</td>
	</tr>

</table>
</body>
</html>