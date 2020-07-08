<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.shopbk.model.*"%>
<%@ include file="/front-end/front-end-nav.jsp" %>
<%
	ShopbkService shopbkSvc = new ShopbkService();
	String shopno = request.getParameter("shopno");
	List<ShopbkVO> list = shopbkSvc.getShopbkByShop(shopno);
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

<div class="row">
		<div class="col-sm-4"></div></div>
		<div class="col-sm-5">
<div>
<button id="basicModal">新增</button>
	<table>
		<tr>
			<th>店家編號</th>
			<th>提供人數</th>
			<th>開始時間</th>
			<th>結束時間</th>
			<th>以小時計算</th>
			<th>包日</th>
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
</div></div>
<%-- <c:if test="${openModal!=null}"> --%>

<div class="modal fade" id="basicModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
				
			<div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h3 class="modal-title" id="myModalLabel">The Bootstrap modal-header</h3>
            </div>
			
			<div class="modal-body">
<!-- =========================================以下為原listOneEmp.jsp的內容========================================== -->
               <jsp:include page="addShopbk.jsp" />
<!-- =========================================以上為原listOneEmp.jsp的內容========================================== -->
			</div>
			
			<div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
		
		</div>
	</div>
</div>
<!--         <script> -->
<!-- //     		 $("#basicModal").click().modal({show: true}); -->
<!--         </script> -->
<%--  </c:if> --%>
</body>
</html>