<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.shopbk.model.*"%>

<%
	ShopbkService shopbkSvc = new ShopbkService();
	List<ShopbkVO> list = shopbkSvc.getAllAfterNow();
	pageContext.setAttribute("list", list);
%>

<!doctype html>
<html lang="en">
<head>

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


<jsp:include page="select_page.jsp" flush="true"/>

	<table>
		<tr style="background-color: #FFFFFF; border: 0px; font:;">
			<td style="background-color: #FFFFFF; border: 0px;">
				<h3>遊戲列表</h3>
			</td>
		</tr>
	</table>
<%-- 	<%-- 錯誤表列 --%>
<%-- 	<c:if test="${not empty errorMsgs}"> --%>
<!-- 		<font style="color: red">請修正以下錯誤:</font> -->
<!-- 		<ul> -->
<%-- 			<c:forEach var="message" items="${errorMsgs}"> --%>
<%-- 				<li style="color: red">${message}</li> --%>
<%-- 			</c:forEach> --%>
<!-- 		</ul> -->
<%-- 	</c:if> --%>
<jsp:useBean id="shopSvc" scope="page"
	class="com.shop.model.ShopService" />
	<div>
		<input type="hidden" name="shopbkno" value="${shopbkVO.shopbkno}">
		<table>
			<tr>
				<th>店家名稱</th>
				<th>提供人數</th>
				<th>開始時間</th>
				<th>結束時間</th>
				<th>以小時計算</th>
				<th>包日</th>
<!-- 				<th>修改</th> -->
			</tr>
			<c:forEach var="shopbkVO" items="${list}">
				<tr>
					<td>${shopSvc.getOneShop(shopbkVO.shopno).shopname}</td>
					<td>${shopbkVO.ofdtable}</td>
					<td>${shopbkVO.shoppds}</td>
					<td>${shopbkVO.shoppde}</td>
					<td>${shopbkVO.payinfohr}</td>
					<td>${shopbkVO.payinfoday}</td>
<!-- 					<td> -->
<%-- 						<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/shopbk/shopbk.do" style="margin-bottom: 0px;"> --%>
<!-- 							<input type="submit" value="修改"> <input type="hidden" -->
<%-- 								name="shopbkno" value="${shopbkVO.shopbkno}"> <input --%>
<!-- 								type="hidden" name="action" value="getOne_For_Update"> -->
<!-- 						</FORM> -->
<!-- 					</td> -->
				</tr>
			</c:forEach>
		</table>
	</div>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- 查詢時有錯誤啟動 -->
	<c:if test="${not empty errorMsgs}">
		<script>
			swal({
				text : "${errorMsgs}"
			});
		</script>
		<%
			request.removeAttribute("errorMsgs");
		%>
	</c:if>


</body>
</html>