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

<title>�C���C��</title>

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
button{
	margin-left: auto;
	margin-right: auto;
}
</style>
</head>

<body>

<%@ include file="/front-end/front-end-nav.jsp" %>


<jsp:include page="select_page.jsp" flush="true"/>

	<table>
		<tr style="background-color: #FFFFFF; border: 0px; font:;">
			<td style="background-color: #FFFFFF; border: 0px;">
				<h3>�C���C��</h3>
			</td>
		</tr>
	</table>
<%-- 	<%-- ���~��C --%>
<%-- 	<c:if test="${not empty errorMsgs}"> --%>
<!-- 		<font style="color: red">�Эץ��H�U���~:</font> -->
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
				<th>���a�W��</th>
				<th>���ѤH��</th>
				<th>�}�l�ɶ�</th>
				<th>�����ɶ�</th>
				<th>�H�p�ɭp��</th>
				<th>�]��</th>
			</tr>
			<c:forEach var="shopbkVO" items="${list}">
				<tr>
					<td><A href="<%=request.getContextPath()%>/front-end/shop/shop.do?shopno=${shopbkVO.shopno}&action=getOne_For_Display2&requestURL=<%=request.getServletPath()%>">${shopSvc.getOneShop(shopbkVO.shopno).shopname}</a></td>
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
	
<!-- =========================================�H�U����listOneEmp.jsp�����e========================================== -->
               <jsp:include page="/front-end/shop/listOneShop2.jsp" />
<!-- =========================================�H�W����listOneEmp.jsp�����e========================================== -->			
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