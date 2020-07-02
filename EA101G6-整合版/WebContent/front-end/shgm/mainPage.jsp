<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.shgm.model.*"%>
<%@ page import="com.mbrpf.model.*"%>
<%@ page import="java.util.*"%>
<%
	//MbrpfVO member = (MbrpfVO) session.getAttribute("member");
	ShgmService shgmsvc = new ShgmService();
	List<ShgmVO> shgmlist = shgmsvc.getAllForMain();
	pageContext.setAttribute("shgmlist", shgmlist);
%>
<!doctype html>
<html lang="en">
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<title>main_page</title>
<meta charset="utf-8">
</head>
<style>
body {
	background-color: #EEEEEE;
	background-size: repeat;
}

.icon {
	width: 20px;
	height: 20px;
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
	position: relative;
	text-align: center;
	margin-top: 3%;
}

.breadcrumb-nav {
	background-color: #EEEEEE;
}

.awrapper {
	width: 350px;
	display: inline;
	/* position: absolute; */
	text-align: right;
	margin-left: 70%;
}

div.top-info {
	margin: 0 auto;
	border: green 1px solid;
}

#upshgm,#myshgm {
	margin: 0 auto;
	background-color: white;
}

#upshgm:hover,#myshgm:hover {
	background-color: white;
	color: #FF8C00; /*ffa216*/
	box-shadow: 0 0 11px rgba(33, 33, 33, .2);
}

.shgm-area-wrapper {
	text-align: center;
}

div.shgm-area {
	margin: 3% auto;
}

.card-deck {
	margin: 0 auto;
}

.card {
	width: 228px;
	float: left;
	margin: 3% 5%;
}

.card:hover {
	cursor: pointer;
	box-shadow: 0 0 11px rgba(33, 33, 33, .2);
}

.card img {
	width: 225px;
	height: 240px;
	object-fit: contain;
}

.pageselect-area-wrapper {
	text-align: center;
}

div.pageselect-area {
	display: block;
	position: relative;
	width: 100%;
	margin: 0 auto;
}

.pagination {
	margin-top: -5%;
	display: flex;
	justify-content: center;
}
</style>
<body background="images/bgimage3.jpg">

<%@ include file="/front-end/front-end-nav.jsp"%>

	<div class="main-area container col-10 align-self-center">
		<div class="top-info-wrapper">
			<nav aria-label="breadcrumb" class="breadcrumb-nav">
				<ol class="breadcrumb d-flex">
					<li class="breadcrumb-item"><a href="#">首頁</a></li>
					<li class="breadcrumb-item active" aria-current="page">市集</li>
					<li class="awrapper">
					<a id="upshgm" class="btn btn-primary ml-auto" href="<%=request.getContextPath()%>/front-end/shgm/sellPage.jsp" role="button">我要上架</a>
					<a id="myshgm" class="btn btn-primary " href="#" role="button">我的市集商品</a></li>
				</ol>
			</nav>
		</div>
		<div class="shgm-area-wrapper">
			<div class="shgm-area ">
				<div class="card-deck">
				
					<c:forEach var="shgmvo" items="${shgmlist}">
						<div class="mb-4">
							<a target="_self" href="<%=request.getContextPath()%>/front-end/shgm/shgm.do?action=getOneToInfo&shgmno=${shgmvo.shgmno}">
								<div class="card">
									<img
										src="<%=request.getContextPath()%>/shgm/displayimg?shgmno=${shgmvo.shgmno}"
										class="card-img-top" alt="Sorry! there's no image...">
									<div class="card-body">
										<h5 class="card-title">${shgmvo.shgmname}</h5>
										<p class="card-text">$${shgmvo.price}</p>
									</div>
								</div>
							</a>
						</div>
					</c:forEach>
					
				</div>
			</div>
		</div>
	</div>
	<div class="pageselect-area-wrapper">
		<div class="pageselect-area ">
			<nav aria-label="Page navigation example">
				<ul class="pagination">
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							<span class="sr-only">Previous</span>
					</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
							class="sr-only">Next</span>
					</a></li>
				</ul>
			</nav>
		</div>
	</div>
	<input type="hidden" id="member" value="${member.mbrname}">



	<script>
	$(document).ready(function(){
		$("#upshgm").click(function(){
			if($("#member").val() === ''){
				alert('您未登入');
				window.location.href = "<%= request.getContextPath()%>/front-end/shgm/simpleLogin.jsp";
				return false;
			}
		});
	});
	</script>


</body>
</html>