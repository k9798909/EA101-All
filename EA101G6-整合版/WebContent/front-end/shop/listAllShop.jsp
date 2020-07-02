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

.class { 
	margin-left: 200px;
	margin-right: auto;
 } 
 
div { 
	margin-left: auto;
	margin-right: auto;
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
				<h5><%@ include file="page1.file" %></h5>
			</td>
		</tr>
	</table>
		<div class="container">
		<div class="card-deck">
		<div class="row">
		
			<c:forEach var="shopVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
					
					<div class="col-sm-3" style="margin-bottom: 20px;margin-left: 20px;">
						
						<div class="card" style="width: 18rem">
							<div class="card-body">
							<label>
							<img
							src="<%=request.getContextPath()%>/ShopShowImg?shopno=${shopVO.shopno}"
							class="card-img-top" alt="Responsive image">
								<h5 class="card-title">${shopVO.shopname}</h5>
								<p class="card-text">地址:${shopVO.shoploc}</p>
								<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/shop/shop.do">
								<input type="hidden" name="shopno" value="${shopVO.shopno}">
								<input type="hidden" name="action" value="getOne_For_Display"><input
								type="submit" value="詳細資訊" class="btn btn-primary"></FORM>
							</label>
							</div>					
						</div>					
					</div>				
			</c:forEach>
			</div>
	<table>
		<tr style="background-color: #FFFFFF; border: 0px; font:;">
			<td style="background-color: #FFFFFF; border: 0px;">
				<p><%@ include file="page2.file" %></p>
			</td>
		</tr>
	</table>



</body>
</html>