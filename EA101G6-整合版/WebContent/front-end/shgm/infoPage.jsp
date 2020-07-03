<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.shgm.model.*"%>
<%@ page import="com.mbrpf.model.*"%>
<%@ page import="java.util.*"%>
<%
	session.setAttribute("pointLocation", request.getRequestURI());
	MbrpfVO mbrpfvo = (MbrpfVO) session.getAttribute("mbrpfvo");
	List<ShgmVO> list = (List<ShgmVO>) session.getAttribute("randlist");
	pageContext.setAttribute("list", list);
%>
<!doctype html>
<html lang="en">
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<title>${shgmvo.shgmname}</title>
<meta charset="utf-8">
<style>
body {
	background-color: #EEEEEE;
	background-size: repeat;
}

.icon {
	width: 20px;
	height: 20px;
}

.modal-footer{
	height: 80px;
}

div.main-area {
	position: relative;
	display: block;
	border: black 1px solid;
	background-color: white;
	max-height: 100%;
	margin: 2% auto;
}

.top-info-wrapper {
	text-align: center;
	margin-top: 3%;
}

.breadcrumb-nav {
	background-color: #EEEEEE;
}

.rpdiv {
	color: #FF4500;
	margin-right: 5%;
}

.awrapper {
	width: 200px;
	display: inline;
	text-align: right;
	margin-left: 72.5%;
}

div.top-info {
	margin: 0 auto;
	border: green 1px solid;
}

.breadcrumb button {
	margin: 0;
}

.shgm-info-left img {
	margin: 0;
	height: 320px;
	width: 480px;
	object-fit: contain;
}

.shgm-info-right {
	display: table-cell;
	vertical-align: middle;
	margin: 3% 0;
	padding-top: 2%;
	text-align: left;
}

#rp,#rpenter,#rpcancel,#sold,#buythis {
	margin: 0 auto;
	background-color: white;
}

#rp:hover,#rpenter:hover,#rpcancel:hover,#sold:hover,#buythis:hover {
	background-color: white;
	color: #FF8C00;
	box-shadow: 0 0 11px rgba(33, 33, 33, .2);
}

.carousel-item img{
	width: 250px;
	height: 250px;
	object-fit: contain;
}

#blogCarousel {
	height: 90px;
	min-height: 300px;
	background-size: cover;
}

#modal-footer>:not(:first-child) {
    margin-left: .25rem;
}
#modal-footer>:not(:last-child) {
    margin-right: .25rem;
}
</style>
</head>

<body background="images/bgimage3.jpg">

<%@ include file="/front-end/front-end-nav.jsp"%>

	<div class="main-area container col-10 align-self-center">
		<div class="top-info-wrapper">
			<nav aria-label="breadcrumb" class="breadcrumb-nav">
				<ol class="breadcrumb d-flex">
					<li class="breadcrumb-item"><a href="#">首頁</a></li>
					<li class="breadcrumb-item"><a
						href="<%=request.getContextPath()%>/front-end/shgm/mainPage.jsp">市集</a></li>
					<li class="breadcrumb-item active" aria-current="page">商品頁面</li>
					<li class="awrapper"><span class="rpdiv">${errormap.get(1)}</span><button id="rp" type="button"
							class="btn btn-primary ml-auto" data-toggle="modal"
							data-target="#exampleModal" data-whatever="@mdo">檢舉</button></li>
				</ol>
			</nav>
		</div>
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">檢舉此商品</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<form method="post" action="<%=request.getContextPath()%>/front-end/shgm/shgmrp.do">
						<div class="modal-body">
							<div class="form-group">
								<label for="message-text" class="col-form-label">檢舉內容:</label>
								<textarea name="detail" class="form-control" id="message-text"></textarea>
							</div>

						</div>
						<div id="modal-footer"class="modal-footer">
							<button id="rpenter" type="submit" class="btn btn-primary">確定</button>
							<button id="rpcancel" type="button" class="btn btn-primary"
								data-dismiss="modal">取消</button>
						</div>
						<input type="hidden" name="shgmno" value="${shgmvo.shgmno}">
						<input type="hidden" name="suiterno" value="${mbrpfvo.mbrno}">
						<input type="hidden" name="action" value="insertrp">
					</form>
				</div>
			</div>
		</div>
		<div class="shgm-info-allarea">
			<div class="shgm-info-toparea container">
				<div id="imgzoom" class="shgm-info-left col-6 ">
					<img
						src="<%=request.getContextPath() %>/shgm/displayimg?shgmno=${shgmvo.shgmno}"
						alt="..." class="img-thumbnail rounded float-left">
				</div>
				<div class="shgm-info-right col-6 d-flex justify-content-center">
					<div
						class="shgm-info-right-inner d-flex align-items-start flex-column bd-highlight mb-3">
						<div class="p-2 bd-highlight">
							名稱
							<h1>${shgmvo.shgmname}</h1>
						</div>
						<div class="p-2 bd-highlight">
							售價
							<h1 id="price">${shgmvo.price}</h1>
						</div>
						<c:choose>
								<c:when test="${shgmvo.paystatus == 1}">
								<a id="sold" class="btn btn-primary" role="button">本商品已售出</a>
								</c:when>
								<c:otherwise>
									<a id="buythis" class="btn btn-primary"
									 href="<%=request.getContextPath()%>/front-end/shgm/buyPage.jsp" role="button">購買</a>
								</c:otherwise>
							</c:choose>
					</div>
				</div>
				<br>
				<div class="shgm-info-middle">
					簡介
					<div class="card">
						<div class="card-body">${shgmvo.intro}</div>
					</div>
				</div>
				<br>
				<div class="shgm-info-bottom">
					你可能也感興趣
					<div class="container">
						<div class="row blog">
							<div class="col-md-12">
								<div id="blogCarousel" class="carousel slide"
									data-ride="carousel">

									<ol class="carousel-indicators">
										<li data-target="#blogCarousel" data-slide-to="0"
											class="active"></li>
										<li data-target="#blogCarousel" data-slide-to="1"></li>
									</ol>

									<!-- Carousel items -->
									<div class="carousel-inner">
										<div class="carousel-item active">
											<div class="row">
											<c:forEach var="i" begin="0" end="3">
												<div class="col-md-3">
													<a
														href="<%=request.getContextPath()%>/front-end/shgm/shgm.do?action=getOneToInfo&shgmno=${list.get(i).shgmno}">
														<img src="<%=request.getContextPath()%>/shgm/displayimg?shgmno=${list.get(i).shgmno}" alt="Image"
														style="max-width: 100%;">
													</a>
												</div>
											</c:forEach>
											</div>
										</div>
										<div class="carousel-item">
											<div class="row">
											<c:forEach var="i" begin="4" end="7">
												<div class="col-md-3">
													<a
														href="<%=request.getContextPath()%>/front-end/shgm/shgm.do?action=getOneToInfo&shgmno=${list.get(i).shgmno}">
														<img src="<%=request.getContextPath()%>/shgm/displayimg?shgmno=${list.get(i).shgmno}" alt="Image"
														style="max-width: 100%;">
													</a>
												</div>
											</c:forEach>
											</div>											
										</div>
										<!--.item-->
									</div>
									<!--.carousel-inner-->
								</div>
								<!--.Carousel-->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<input type="hidden" id="points" value="${mbrpfvo.points}">
		<input type="hidden" id="success" value="${buysuccess}">
	</div>




	<script>
	$(document).ready(function(){
		if($("#success").val() != ''){
			Swal.fire({
				  icon: 'success',
				  title: '您已購買成功！',
				  showConfirmButton: false,
				  timer: 1500
				})
		}
		var $mbrname = $("#mbrname").text().substr(4);
		$("#buythis").click(function(){
			if($mbrname == ""){
				Swal.fire({
					  title: '您尚未登入',
					  icon: 'info',
					  html:'請先登入再執行動作',
					  showCancelButton: true,
					  focusConfirm: false,
					  confirmButtonText:
					    '<a style="color:white;" href="<%=request.getContextPath()%>/front-end/login.jsp" class="fa">前往登入</a>',
					  cancelButtonText:
					    '<span class="fa fa-thumbs-down">繼續逛逛</span>',
					})
				event.preventDefault();
			} else{
				var $price = parseInt($("#price").text());
				var $points = $("#points").val();
				if ( $price > $points ){
					Swal.fire({
						  icon: 'error',
						  title: '您的餘額不足',
						  text: '請進行儲值再繼續購物',
						  footer: '<a href="<%=request.getContextPath()%>/front-end/tfcord/buyPoint.jsp">點數儲值&nbsp&nbsp</a><span>尚餘'+$points+'點</span>'
						});
					event.preventDefault();
				}
			}
		});
		$("#rp").click(function(){
			if($mbrname == ""){
				Swal.fire({
					  title: '您尚未登入',
					  icon: 'info',
					  html:'請先登入再執行動作',
					  showCancelButton: true,
					  focusConfirm: false,
					  confirmButtonText:
					    '<a style="color:white;" href="<%=request.getContextPath()%>/front-end/login.jsp" class="fa">前往登入</a>',
					  cancelButtonText:
					    '<span class="fa fa-thumbs-down">繼續逛逛</span>',
					})
				event.stopPropagation();
			}
		});
	});
	</script>
	<script src="js/jquery-3.3.1.min.js"></script>
	<!-- 看起來沒屁用 -->
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<!-- 重要廣告界面 -->
	<script src="js/owl.carousel.min.js"></script>
	<!-- 看起來沒屁用 -->
	<script src="js/jquery.sticky.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.animateNumber.min.js"></script>
	<script src="js/jquery.fancybox.min.js"></script>


	<!-- 上介面連結動畫 -->
	<script src="js/jquery.easing.1.3.js"></script>

	<!-- 重要廣告界面 -->
	<script src="js/aos.js"></script>

	<script src="js/main.js"></script>

</body>
</html>