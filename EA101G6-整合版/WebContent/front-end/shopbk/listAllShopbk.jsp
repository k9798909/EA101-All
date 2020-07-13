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
			</tr>
			<c:forEach var="shopbkVO" items="${list}">
				<tr>
					<td><A data-toggle="modal" data-target="#exampleModal" id="go" href="<%=request.getContextPath()%>/front-end/shop/shop.do?shopno=${shopbkVO.shopno}&action=getOne_For_Display2">${shopSvc.getOneShop(shopbkVO.shopno).shopname}</a></td>
					<td>${shopbkVO.ofdtable}</td>
					<td>${shopbkVO.shoppds}</td>
					<td>${shopbkVO.shoppde}</td>
					<td>${shopbkVO.payinfohr}</td>
					<td>${shopbkVO.payinfoday}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content rp-2">
				
			<div class="modal-header">
                <h3 class="modal-title" id="exampleModalLabel">The Bootstrap modal-header</h3>
           		<hr class="my-3">
            </div>
			
			<div class="modal-body">
			<div class="form-group">
<!-- =========================================以下為原listOneEmp.jsp的內容========================================== -->
               <jsp:include page="/front-end/shop/listOneShop2.jsp" />
<!-- =========================================以上為原listOneEmp.jsp的內容========================================== -->
			</div>
			</div>
			<div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
		
		</div>
	</div>
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