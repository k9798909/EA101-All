<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%@ page import="com.shop.model.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gaming on Board</title>

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Rubik:300,400,700|Oswald:400,700"
	rel="stylesheet">
<!-- 登入圖示 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/fonts/icomoon/style.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/model/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/model/jquery.fancybox.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/model/owl.carousel.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/model/owl.theme.default.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/model/aos.css">
<!-- MAIN CSS -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/model/style.css">
<!-- 顯示訊息的css -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/cssForShgm/alert-area.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/cssForShgm/btn.css">

<style>
.icon {
	width: 30px;
	height: 30px;
	margin-right: 3px;
}
.reg1{
	width: 30px;
	height: 30px;
	margin-right: 10px;
}
</style>






</head>
<body>
<%
	HttpServletRequest req = (HttpServletRequest)request;
	HttpServletResponse res = (HttpServletResponse)response;
	
	session.setAttribute("location",req.getRequestURI());	
%>

	<div class="site-wrap" id="home-section">
		<div class="site-mobile-menu site-navbar-target">
			<div class="site-mobile-menu-header">
				<div class="site-mobile-menu-close mt-3">
					<span class="icon-close2 js-menu-toggle"></span>
				</div>
			</div>
			<div class="site-mobile-menu-body"></div>
		</div>
	</div>

	<div class="top-bar">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="float-left">
						<c:choose>
						<c:when test="${mbrpfVO.mbrname != null}">
						<span id="mbrname" class="d-md-inline-block text-white">歡迎你！${mbrpfVO.mbrname}</span>
						<input type="hidden" id="mbrno" value="${mbrpfVO.mbrno}"/>
						</c:when>
						<c:otherwise>
						<a href="<%=request.getContextPath()%>/front-end/mbrpf/addMbrpf.jsp" class="text-white"><span class="d-md-inline-block">
								<img class="icon reg1"
								src="<%=request.getContextPath()%>/images/reg3.png">註冊
						</span></a>
						</c:otherwise>
						</c:choose>
					</div>

					<div class="float-right">
						<c:choose>
						<c:when test="${mbrpfVO.mbrname != null}">
						<a href="<%= request.getContextPath()%>/mbrpf/mbrpf.do?action=logout" id="logout" class="d-md-inline-block text-white"><img class="icon"
								src="<%=request.getContextPath()%>/images/logout.png">登出</a>
						</c:when>
						<c:otherwise>
						<a href="<%= request.getContextPath()%>/front-end/login.jsp" class="text-white"><span class="d-md-inline-block">
								<img class="icon"
								src="<%=request.getContextPath()%>/images/ghost.png">會員登入
						</span></a><c:if test="${not empty sessionScope.shopVO}">
							<span class="mx-md-2 d-inline-block"></span>
							<a href="<%=request.getContextPath()%>/front-end/shop/shopArea.jsp" class="text-white"> <span
								class="mr-2 text-white icon-instagram"></span> <span
								class="d-none d-md-inline-block">${sessionScope.shopVO.shopname}</span></a>
							<a href="#" class="text-white" id="goLogout"> <span
								class="mr-2 text-white"></span> <span
								class="d-none d-md-inline-block">log out</span></a>
							<FORM id="logout" METHOD="post"
								ACTION="<%=request.getContextPath()%>/front-end/shop/shop.do">
								<input type="hidden" name="action" value="logout">
								<input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>">
							</FORM>							
						</c:if>
						<c:if test="${empty sessionScope.shopVO}">
							<a href="<%=request.getContextPath()%>/front-end/shop/login.jsp"
								class="text-white"> <span class="d-md-inline-block"><img
									class="icon"
									src="<%=request.getContextPath()%>/images/shop.png">店家登入</span></a>
						</c:if>
						</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>

	<header class="site-navbar js-sticky-header site-navbar-target"
		role="banner">

		<div class="container">
			<div class="row align-items-center position-relative">


				<div class="site-logo">
					<a href="<%= request.getContextPath()%>/front-end/index.jsp" class="text-black"><span
						class="text-primary">Gameing on Board</span></a>
				</div>

				<div class="col-12">
					<nav class="site-navigation text-right ml-auto " role="navigation">

						<ul
							class="site-menu main-menu js-clone-nav ml-auto d-none d-lg-block">
							<li><a href="<%=request.getContextPath()%>/front-end/index.jsp" class="nav-link">首頁</a></li>

							<li class="has-children"><a href="" class="nav-link">會員專區</a>
								<ul class="dropdown arrow-top">
									<li><a href="<%= request.getContextPath()%>/front-end/mallOr/mbrMallOr.jsp" class="nav-link">查詢訂單</a></li>
									<li><a href="<%= request.getContextPath()%>/front-end/tfcord/listOneMbrtf.jsp" class="nav-link">帳戶管理</a></li>
									<li><a href="<%=request.getContextPath()%>/front-end/tfcord/buyPoint.jsp" class="nav-link">購買點數</a></li>
									<li><a href="<%=request.getContextPath()%>/front-end/tfcord/tfMoney.jsp" class="nav-link">兌換現金</a></li>
									<li class="has-children"><a href="#">More Links</a>
										<ul class="dropdown">
											<li><a href="#">Menu One</a></li>
											<li><a href="#">Menu Two</a></li>
											<li><a href="#">Menu Three</a></li>
										</ul></li>
								</ul></li>

							<li><a href="<%=request.getContextPath()%>/front-end/mall/mallGetAllUp.jsp" class="nav-link">商城</a></li>
							<li><a href="<%=request.getContextPath()%>/front-end/shgm/mainPage.jsp" class="nav-link">市集</a></li>
							<li class="has-children"><a href="#" class="nav-link">揪團區</a>
								<ul class="dropdown arrow-top">
									<li><a href="<%=request.getContextPath()%>/front-end/room/create.jsp" class="nav-link">房間列表</a></li>
									<li><a href="<%=request.getContextPath()%>/front-end/room/myRoom.jsp" class="nav-link">我的房間</a></li>
								</ul>
							</li>
							<li class="has-children"><a href="<%=request.getContextPath()%>/front-end/shop/listAllShop.jsp" class="nav-link">店家列表</a>
							<ul class="dropdown arrow-top">
							<li><a href="<%= request.getContextPath()%>/front-end/gmlist/listAllGmlist.jsp" class="nav-link">店家遊戲</a></li>
							<li><a href="<%= request.getContextPath()%>/front-end/shopbk/listAllShopbk.jsp" class="nav-link">店家訂位</a></li>
							</ul></li>
							<li><a href="<%=request.getContextPath()%>/front-end/art/listAllArt.jsp" class="nav-link">討論區</a></li>
						</ul>
					</nav>

				</div>

				<div class="toggle-button d-inline-block d-lg-none">
					<a href="#" class="site-menu-toggle py-5 js-menu-toggle text-black"><span
						class="icon-menu h3"></span></a>
				</div>
			</div>
		</div>
	</header>

	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/model/jquery-3.3.1.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/model/popper.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/model/owl.carousel.min.js"></script>
	<!--...-->
	<script
		src="<%=request.getContextPath()%>/js/model/jquery.sticky.js"></script>
	<script	
		src="<%=request.getContextPath()%>/js/model/jquery.waypoints.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/model/jquery.animateNumber.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/model/jquery.fancybox.min.js"></script>
	<!-- 上介面連結動畫 -->
	<script
		src="<%=request.getContextPath()%>/js/model/jquery.easing.1.3.js"></script>
	<!-- 重要廣告界面 -->
	<script src="<%=request.getContextPath()%>/js/model/aos.js"></script>
	<script src="<%=request.getContextPath()%>/js/model/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<script
		src="<%=request.getContextPath()%>/js/model/bootstrap.min.js"></script>
	<!-- 重要廣告界面 -->

		<!-- 	店家登出js -->
	<script>
		$(document).ready(function() {
			$("#goLogout").click(function() {
				$("#logout").submit();
			})
		})
	</script>
</body>
</html>
