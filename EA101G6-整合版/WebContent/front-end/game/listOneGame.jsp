<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.game.model.*"%>

<%
	GameVO gameVO = (GameVO) request.getAttribute("gameVO"); //shopServlet.java (Concroller) 存入req的shopVO物件 (包括幫忙取出的shopVO, 也包括輸入資料錯誤時的shopVO物件)	
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
	<a href="../shop/index.jsp"><img src="images/add-icon.png" class="icon">回首頁</a>
</h4>

<jsp:include page="select_page.jsp" flush="true">
	<jsp:param name="" value="" />
</jsp:include>

<table>
	<tr>
		<th>遊戲編號</th>
		<th>遊戲名稱</th>
		<th>遊戲圖片</th>
		<th>修改</th>
	</tr>
	<tr>
		<td><%=gameVO.getGmno()%></td>
		<td><%=gameVO.getGmname()%></td>
		<td><img src="<%=request.getContextPath()%>/GameShowImg?gmno=${gameVO.gmno}" /></td>
		<td>
					<FORM METHOD="post" ACTION="game.do" style="margin-bottom: 0px;">
						<input type="submit" value="修改"> <input type="hidden"
							name="gmno" value="${gameVO.gmno}"> <input
							type="hidden" name="action" value="getOne_For_Update">
					</FORM>
		</td>
	</tr>
</table>

</body>
</html>