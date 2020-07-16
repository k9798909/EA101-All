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

td th tr {
	text-align: center;
}

.icon {
	width: 20px;
	height: 20px;
}


img {
	width: 50px;
	height: 50px;
}

h4 {
	margin-left: 20px;
}
button{
	margin-left: auto;
	margin-right: auto;
}
</style>
</head>

<body>

<%@ include file="/front-end/front-end-nav.jsp" %>


<jsp:include page="select_page.jsp" flush="true"/>

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
	<div class="container-fluid">
		<input type="hidden" name="shopbkno" value="${shopbkVO.shopbkno}">
		<table class="table table-sm">
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
					<td><A style="color:black;" href="<%=request.getContextPath()%>/front-end/shop/shop.do?shopno=${shopbkVO.shopno}&action=getOne_For_Display2&requestURL=<%=request.getServletPath()%>"><b>${shopSvc.getOneShop(shopbkVO.shopno).shopname}</b></a></td>
					<td>${shopbkVO.ofdtable}</td>
					<td>${shopbkVO.shoppds}</td>
					<td>${shopbkVO.shoppde}</td>
					<td>${shopbkVO.payinfohr}</td>
					<td>${shopbkVO.payinfoday}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
<c:if test="${openModal!=null}">

<div class="modal fade element-center" id="basicModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
	
<!-- =========================================以下為原listOneEmp.jsp的內容========================================== -->
               <jsp:include page="/front-end/shop/listOneShop2.jsp" />
<!-- =========================================以上為原listOneEmp.jsp的內容========================================== -->			
<!-- 			<div class="modal-footer" style="margin-left:auto;margin-top:auto;"> -->
<!--                 <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
<!--             </div> -->
		
		</div>
	</div>
</div>

        <script>
    		 $("#basicModal").modal({show: true});
        </script>
 </c:if>


</body>
</html>