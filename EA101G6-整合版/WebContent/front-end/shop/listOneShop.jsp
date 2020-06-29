<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.shop.model.*"%>

<%
	ShopVO shopVO = null;
	if(request.getParameter("shopno") == null){		
		shopVO = (ShopVO) session.getAttribute("account");
	}else{
		shopVO = (ShopVO) request.getAttribute("shopVO"); //shopServlet.java (Concroller) 存入req的shopVO物件 (包括幫忙取出的shopVO, 也包括輸入資料錯誤時的shopVO物件)
	}
%>

<head>

<meta charset="utf-8">

<title>店家</title>
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

<h4 style="margin-left: 20px;">
	<a href="index.jsp"><img src="images/add-icon.png" class="icon">回首頁</a>
</h4>
<jsp:include page="select_page.jsp" flush="true">
	<jsp:param name="" value="" />
</jsp:include>
<table>
	<tr>
		<th>店家名稱</th>
		<th>位置</th>
		<th>場地</th>
		<th>電話</th>
		<th>店家圖片</th>
	</tr>
	<tr>
		<td><%=shopVO.getShopname()%></td>
		<td><%=shopVO.getShoploc()%></td>
		<td><%=shopVO.getShopcy()%></td>
		<td><%=shopVO.getShopphone()%></td>
		<td><img src="<%=request.getContextPath()%>/ShopShowImg?shopno=${shopVO.shopno}" /></td>
	</tr>

</table>

</body>
</html>