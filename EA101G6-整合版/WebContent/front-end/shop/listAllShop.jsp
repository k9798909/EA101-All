<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.shop.model.*"%>

<%
	ShopService shopSvc = new ShopService();
	List<ShopVO> list = shopSvc.getAllowedShop();
	pageContext.setAttribute("list", list);
%>


<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">


<title>店家列表</title>

<style>

.icon {
	width: 20px;
	height: 20px;
}

img {
	width: 300px;
	height: 200px;
}

h4 {
	margin-left: 20px;
}

.container {
}
</style>
</head>

<body>

	<%@ include file="/front-end/front-end-nav.jsp"%>

	<h4>
		<a href="index.jsp"><img src="images/add-icon.png" class="icon">回首頁</a>
	</h4>

	<jsp:include page="select_page.jsp" flush="true">
		<jsp:param name="" value="" />
	</jsp:include>

	<table>
		<tr style="background-color: #FFFFFF; border: 0px; font:;">
			<td style="background-color: #FFFFFF; border: 0px;">
				<h3>店家列表</h3>
			</td>
		</tr>
	</table>
	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	<div class="row">
		<div class="container" class="col-sm-3-10">
		<div class="card-deck">
		<div class="row">
			<c:forEach var="shopVO" items="${list}">
				
					<div class="col-sm-4" style="margin-bottom: 20px;">
						<div class="card" style="width: 18rem">
							<div class="card-body">
							<img
							src="<%=request.getContextPath()%>/ShopShowImg?shopno=${shopVO.shopno}"
							class="card-img-top" alt="Responsive image">
								<h5 class="card-title">${shopVO.shopname}</h5>
								<p class="card-text">地址:${shopVO.shoploc}</p>
								<a href="#" class="btn btn-primary">詳細資訊</a>
							</div>
						</div>
					</div>
					<!-- 				<td> -->
					<!-- 					<FORM METHOD="post" ACTION="shop.do" style="margin-bottom: 0px;"> -->
					<!-- 						<input type="submit" value="修改"> <input type="hidden" -->
					<%-- 							name="shopno" value="${shopVO.shopno}"> <input --%>
					<!-- 							type="hidden" name="action" value="getOne_For_Update"> -->
					<!-- 					</FORM> -->
					<!-- 				</td> -->
					<!-- 				</tr> -->
			</c:forEach>
			</div>
	</div>



</body>
</html>