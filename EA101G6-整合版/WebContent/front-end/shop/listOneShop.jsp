<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.shop.model.*"%>
<%@ include file="/front-end/front-end-nav.jsp" %>
<%
	if(request.getParameter("shopno") != null)		
		shopVO = (ShopVO) request.getAttribute("shopVO");	
%>

<head>

<meta charset="utf-8">

<title>���a</title>
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



<h4 style="margin-left: 20px;">
	<a href="index.jsp"><img src="images/add-icon.png" class="icon">�^����</a>
</h4>
<jsp:include page="select_page.jsp" flush="true">
	<jsp:param name="" value="" />
</jsp:include>
<table>
	<tr>
		<th>���a�W��</th>
		<th>��m</th>
		<th>���a</th>
		<th>�q��</th>
		<th>���a�Ϥ�</th>
	</tr>
	<tr>
		<td><%=shopVO.getShopname()%></td>
		<td><%=shopVO.getShoploc()%></td>
		<td><%=shopVO.getShopcy()%></td>
		<td><%=shopVO.getShopphone()%></td>
		<td><img src="<%=request.getContextPath()%>/ShopShowImg?shopno=<%=shopVO.getShopno()%>" /></td>
	</tr>

</table>

</body>
</html>