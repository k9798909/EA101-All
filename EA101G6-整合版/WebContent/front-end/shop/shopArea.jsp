<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.shop.model.*"%>
<%@ page import="com.gmlist.model.*"%>
<%@ page import="com.game.model.*"%>
<%@ include file="/front-end/front-end-nav.jsp"%>
<%
	// 	GmlistService gmlistSvc = new GmlistService();
	// 	ShopVO shopVO = (ShopVO)session.getAttribute("shopVO");
	// 	List<GmlistVO> list = gmlistSvc.getSomeGmlistByShop(shopVO.getShopno());;
	// 	if (request.getParameter("shopno") != null) {
	// 		shopVO = (ShopVO) request.getAttribute("shopVO");
	// 		list = gmlistSvc.getSomeGmlistByShop(shopVO.getShopno());
	// 	}
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

	<div class="row">
		<div class="col-sm-4">
			<div class="col-sm-1"></div>
			<div style="witdh: 20px;">
				<ul class="list-group-flush position-absolute">
					<li class="list-group-item" id="goGmlist"><a href="<%=request.getContextPath()%>/front-end/gmlist/addGmlist.jsp">我的遊戲</a></li>
					<FORM id="gmlist" METHOD="post"
						ACTION="<%=request.getContextPath()%>/front-end/gmlist/gmlist.do">
						<input type="hidden" name="shopno" value="${shopVO.shopno}">
						<input type="hidden" name="action" value="getSome_For_Display">
					</FORM>
					<li class="list-group-item" id="goShopbk" href="#"><a href="#">我的揪團</a></li>
					<FORM id="shopbk" METHOD="post"
						ACTION="<%=request.getContextPath()%>/front-end/shopbk/shopbk.do">
						<input type="hidden" name="shopno" value="${shopVO.shopno}">
						<input type="hidden" name="action" value="getSome_For_Display2">
					</FORM>
					<li class="list-group-item" id="goUpdate" href="#"><a href="#">更改店家資料</a></li>
					<FORM id="getOne_For_Update" METHOD="post"
						ACTION="<%=request.getContextPath()%>/front-end/shop/shop.do">
						<input type="hidden" name="action" value="getOne_For_Update">
					</FORM>
				</ul>
			</div>
		</div>
		<div class="col-sm-5">
			<h1 class="display-4" style="margin-left: auto;">${shopVO.shopname}</h1>
			<p class="lead">
				<img
					src="<%=request.getContextPath()%>/ShopShowImg?shopno=${shopVO.shopno}" />
			</p>
			<hr class="my-3">
			<p>提供座位:${shopVO.shopcy}</p>
			<p>電話:0${shopVO.shopphone}</p>
			<p>位置:${shopVO.shoploc}</p>
		</div>

		<script>
			$(document).ready(function() {
				$("#goUpdate").click(function() {
					$("#getOne_For_Update").submit();
				})
				$("#goShopbk").click(function() {
					$("#shopbk").submit();
				})
			})
		</script>
</body>
</html>