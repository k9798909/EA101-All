<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.shop.model.*"%>
<%@ page import="com.gmlist.model.*"%>
<%@ page import="com.game.model.*"%>
<%
	String shopno = request.getParameter("shopno");
	ShopService shopSvc = new ShopService();
	ShopVO shopVO = shopSvc.getOneShop(shopno);
	pageContext.setAttribute("shopVO", shopVO);
%>

<head>


<style>
</style>
</head>

<body>



	<div class="row">
		<div class="col-sm-4"></div>
		<div class="col-sm-5">
			<h1 class="display-4" style="margin-left: auto;">${shopVO.shopname}</h1>
			<p class="lead">
				<img style="width: 300px;height: 300px;" src="<%=request.getContextPath()%>/ShopShowImg?shopno=${shopVO.shopno}" />
			</p>
			<hr class="my-3">
			<p>提供座位:${shopVO.shopcy}</p>
			<p>電話:0${shopVO.shopphone}</p>
			<p>位置:${shopVO.shoploc}</p>
			<p class="lead">
			<FORM id="gmlist" METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/gmlist/gmlist.do">
				<input type="hidden" name="shopno" value="${shopVO.shopno}">
				<input type="hidden" name="action" value="getSome_For_Display">
				</FORM>
			</p>
		</div></div>
</body>
</html>