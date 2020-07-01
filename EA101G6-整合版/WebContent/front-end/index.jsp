<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.shop.model.*"%>



<!doctype html>
<html lang="en">
<head>
<title>Unearth &mdash; Website Template by Colorlib</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link href="https://fonts.googleapis.com/css?family=Rubik:300,400,700|Oswald:400,700" rel="stylesheet">
<!-- 登入圖示 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/fonts/icomoon/style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/model/bootstrap.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/model/jquery.fancybox.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/model/owl.carousel.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/model/owl.theme.default.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/model/aos.css">
<!-- MAIN CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/model/style.css">
	
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mallCss/mallGetAllUpFornt.css">	

<style>
.icon {
	width: 20px;
	height: 20px;
}

	.imgdiv img{
		width: 100%;
		height: 100%;
		margin:0px auto;
		border:solid #FF5809; 
	}
	
	div.imgdiv{
		margin:5px auto;
		width: 80%;
		height: 40%;
	}

</style>

</head>
<body data-spy="scroll" data-target=".site-navbar-target" data-offset="300">



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
						<a href="<%= request.getContextPath()%>/front-end/mbrpf/addMbrpf.jsp" class="text-white">
								<img class="icon" src="<%=request.getContextPath()%>/front-end/images/add-icon.png">註冊
						</span></a>
					</div>

					<div class="float-right">
					
						<a href="<%= request.getContextPath()%>/front-end/login.jsp" class="text-white">
							<span class="d-md-inline-block">
								<img class="icon" src="<%=request.getContextPath()%>/front-end/images/User-icon.png">會員登入 
							</span>
						</a> 
<!-- 測試4257424 -->
						<c:if test="${not empty shopVO}">
							<span class="mx-md-2 d-inline-block"></span>
							<a href="<%=request.getContextPath()%>/front-end/shop/update_shop_input.jsp" class="text-white"> <span
								class="mr-2 text-white icon-instagram"></span> <span
								class="d-none d-md-inline-block">${shopVO.shopname}</span>
						</c:if>
						<c:if test="${empty shopVO}">
							<a href="<%=request.getContextPath()%>/front-end/shop/login.jsp"
								class="text-white"> <span class="d-md-inline-block"><img
									class="icon"
									src="<%=request.getContextPath()%>/front-end/images/man-icon.png">店家登入</span></a>
						</c:if>
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
					<a href="<%= request.getContextPath()%>/front-end/index.jsp" class="text-black">
						<span class="text-primary">Gameing on Board</span>
					</a>
				</div>

				<div class="col-12">
					<nav class="site-navigation text-right ml-auto " role="navigation">

						<ul class="site-menu main-menu js-clone-nav ml-auto d-none d-lg-block">
							<li><a href="<%=request.getContextPath()%>/front-end/index.jsp" class="nav-link">首頁</a></li>
							<li class="has-children"><a href="#about-section"
								class="nav-link">會員專區</a>
								<ul class="dropdown arrow-top">
									<li><a href="#team-section" class="nav-link">查詢訂單</a></li>
									<li><a href="#pricing-section" class="nav-link">Pricing</a></li>
									<li><a href="#faq-section" class="nav-link">FAQ</a></li>
									<li class="has-children"><a href="#">More Links</a>
										<ul class="dropdown">
											<li><a href="#">Menu One</a></li>
											<li><a href="#">Menu Two</a></li>
											<li><a href="#">Menu Three</a></li>
										</ul></li>
								</ul></li>

							<li><a href="<%=request.getContextPath()%>/front-end/mall/mallGetAllUp.jsp" class="nav-link">商城</a></li>
							<li><a href="<%=request.getContextPath()%>/front-end/shgm/mainPage.jsp" class="nav-link">市集</a></li>
							<li><a href="<%=request.getContextPath()%>/front-end/room/joinRoom.jsp" class="nav-link">揪團區</a></li>
							<li><a href="<%=request.getContextPath()%>/front-end/shop/listAllShop.jsp" class="nav-link">店家列表</a></li>
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

	<div class="owl-carousel slide-one-item">





		<div class="site-section-cover  img-bg-section"
			style="background-image: url('images/logo.gif');">
			<div class="container">
				<div
					class="row align-items-center justify-content-center text-center">
					<div class="col-md-12 col-lg-7">
						<h1 data-aos="fade-up" data-aos-delay="">Welcome to Gameing
							on board</h1>
						<p class="mb-5" data-aos="fade-up" data-aos-delay="100">資策會最大桌遊平台上線啦!!</p>
						<p data-aos="fade-up" data-aos-delay="200">
							<a href="#" class="btn btn-outline-white border-w-2 btn-md">Get
								in touch</a>
						</p>
					</div>
				</div>
			</div>

		</div>



		<div class="site-section-cover  img-bg-section"
			style="background-image: url('images/game.png');">
			<div class="container">
				<div
					class="row align-items-center justify-content-center text-center">
					<div class="col-md-12 col-lg-8"></div>
				</div>
			</div>

		</div>

		<div class="site-section-cover  img-bg-section"
			style="background-image: url('images/game2.png');">
			<div class="container">
				<div
					class="row align-items-center justify-content-center text-center">
					<div class="col-md-12 col-lg-8"></div>
				</div>
			</div>

		</div>


		<div class="site-section-cover overlay img-bg-section"
			style="background-image: url('images/game2.png');">
			<div class="container">
				<div
					class="row align-items-center justify-content-center text-center">
					<div class="col-md-12 col-lg-8">
						<h1 data-aos="fade-up" data-aos-delay="">New Generation of
							Mining</h1>
						<p class="mb-5" data-aos="fade-up" data-aos-delay="100">Lorem
							ipsum dolor sit amet, consectetur adipisicing elit. Est odit
							dolorum voluptates!</p>
						<p data-aos="fade-up" data-aos-delay="200">
							<a href="#" class="btn btn-outline-white border-w-2 btn-md">Get
								in touch</a>
						</p>
					</div>
				</div>
			</div>
		</div>


	</div>

	<div class="block__73694 mb-2">
		最新消息<br> ................<br> ................<br>
		................<br> ................<br>
	</div>


	<jsp:useBean id="gmTypeSvc" class="com.gmType.model.GmTypeService" scope="request"/>
	<jsp:useBean id="mallSvc" class="com.mall.model.MallService" scope="request"/>

	<div id="services-section">
		最新商品
		<div class="container commMain">
			<div class="row">
				<c:forEach var="mallVo" items="${mallSvc.getNew()}" >
						<div class="col-lg-2 col-4 comm">
							<a href="<%=request.getContextPath()%>/front-end/mall/mallGetOne.jsp?commNo=${mallVo.commNo}">
							<div class="imgdiv">
								<img src="<%= request.getContextPath()%>/Mall/MallShowImg?commNo=${mallVo.commNo}">
							</div>
							<p>${mallVo.commName}</p>
							
							<div class="dt"><p><b>$${mallVo.price}</b></p></div>
						</a>
					</div>
				</c:forEach>

			</div>
		</div>

	</div>



	<div class="site-section" id="press-section">
		市集<br> .........................<br>
		..........................<br> ...........................<br>
		...........................<br>

	</div>
	<!--  -->
	<div class="site-section bg-light block-13" id="testimonials-section"
		data-aos="fade">
		揪團區<br> .........................<br>
		..........................<br> ...........................<br>
		...........................<br>

	</div>

	<div class="site-section" id="blog-section">
		店家列表<br> .........................<br>
		..........................<br> ...........................<br>
		...........................<br>

	</div>

	<div class="site-section bg-light" id="contact-section">
		討論區<br> .........................<br>
		..........................<br> ...........................<br>
		...........................<br>

	</div>




	<script src="<%=request.getContextPath()%>/js/model/jquery-3.3.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/model/popper.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/model/bootstrap.min.js"></script>
	<!-- 重要廣告界面 -->
	<script src="<%=request.getContextPath()%>/js/model/owl.carousel.min.js"></script>
	<!--...-->
	<script src="<%=request.getContextPath()%>/js/model/jquery.sticky.js"></script>
	<script src="<%=request.getContextPath()%>/js/model/jquery.waypoints.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/model/jquery.animateNumber.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/model/jquery.fancybox.min.js"></script>
	<!-- 上介面連結動畫 -->
	<script src="<%=request.getContextPath()%>/js/model/jquery.easing.1.3.js"></script>
	<!-- 重要廣告界面 -->
	<script src="<%=request.getContextPath()%>/js/model/aos.js"></script>
	<script src="<%=request.getContextPath()%>/js/model/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

</body>
</html>