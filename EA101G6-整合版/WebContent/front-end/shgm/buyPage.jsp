<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.shgm.model.*"%>
<%@ page import="com.mbrpf.model.*"%>
<%
	java.util.HashMap<String, String> hashmap = (java.util.HashMap<String, String>) request.getAttribute("cityarea");
	MbrpfVO mbrpfvo = (MbrpfVO) session.getAttribute("mbrpfvo");
	ShgmVO shgmvo = (ShgmVO) session.getAttribute("shgmvo");
%>
<!doctype html>
<html lang="en">
<head>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/address2.js"></script>
<title>buy_page</title>
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
	max-height: 750px;
	margin: 2% auto;
}

.top-info-wrapper {
	text-align: center;
	margin-top: 3%;
}

.breadcrumb-nav {
	background-color: #EEEEEE;
}

.awrapper {
	width: 150px;
	display: inline;
	text-align: right;
	margin-left: 70%;
}

div.top-info {
	margin: 0 auto;
	border: green 1px solid;
}

.breadcrumb button {
	margin: 0;
}

.shgm-info-left img {
	height: 320px;
	width: 480px;
	object-fit: contain;
}

.shgm-info-left {
	width: 45%;
	display: table-cell;
	vertical-align: left;
	margin: 3% 0;
	padding-top: 1.6%;
	text-align: left;
}

.shgm-info-right {
	width: 45%;
	display: table-cell;
	vertical-align: middle;
	margin: 3% 0;
	padding-top: 2%;
	text-align: left;
}

#rp {
	background-color: white;
}
#rpenter,#rpcancel,#buythis,#buycancel {
	margin: 10% auto;
	background-color: white;
}

#rp:hover,#rpenter:hover,#rpcancel:hover,#buythis:hover,#buycancel:hover {
	background-color: white;
	color: #FF8C00;
	box-shadow: 0 0 11px rgba(33, 33, 33, .2);
}

.button-wrapper {
	text-align: center;
}
.alert{
	color: #FF4500;
}
#modal-footer{
	height:70px;
}
#modal-footer>:not(:first-child) {
    margin-left: .25rem;
}
#modal-footer>:not(:last-child) {
    margin-right: .25rem;
}
</style>


<body background="images/bgimage3.jpg">

<%@ include file="/front-end/front-end-nav.jsp"%>

	<div class="main-area container col-10 align-self-center">
		<div class="top-info-wrapper">
			<nav aria-label="breadcrumb" class="breadcrumb-nav">
				<ol class="breadcrumb d-flex">
					<li class="breadcrumb-item"><a href="#">首頁</a></li>
					<li class="breadcrumb-item"><a
						href="<%=request.getContextPath()%>/front-end/shgm/mainPage.jsp">市集</a></li>
					<li class="breadcrumb-item"><a
						href="<%=request.getContextPath()%>/front-end/shgm/infoPage.jsp?shgmno=${shgmvo.shgmno}">商品頁面</a></li>
					<li class="breadcrumb-item active" aria-current="page">購買頁面</li>
					<li class="awrapper"><button type="button" id="rp"
							class="btn btn-primary" data-toggle="modal"
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
						<div id="modal-footer" class="modal-footer">
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
				<div id="imgzoom" class="shgm-info-left">
					<div
						class="d-flex align-items-left flex-column bd-highlight mb-3">
						<img
							src="<%=request.getContextPath() %>/shgm/displayimg?shgmno=${shgmvo.shgmno}"
							alt="..." class="img-thumbnail rounded float-left"> <br>
						<div class="p-2 bd-highlight">
							名稱
							<h1>${shgmvo.shgmname}</h1>
						</div>
						<div class="p-2 bd-highlight">
							售價
							<h1>${shgmvo.price}</h1>
						</div>
					</div>	
				</div>
				<div class="shgm-info-right justify-content-center">
					<div
						class="shgm-info-right-inner  align-items-center flex-column bd-highlight mb-3">
						<form method="post"
							action="<%=request.getContextPath()%>/front-end/shgm/shgm.do">
							<div class="form-group">
								<label for="take">取貨方式</label><span class="alert">${errormap.get(1)}</span>
								<input type="text" class="form-control" id="take" 
									name="take" value="<%=(shgmvo.getTake() == null)? "":shgmvo.getTake()%>">
							</div>
							<br>
							<div class="form-group">
								<label for="takernm">取貨人姓名</label><span class="alert">${errormap.get(2)}</span>
								<input type="text" class="form-control" id="takernm"
									name="takernm" value="<%=(shgmvo.getTakernm() == null)? "":shgmvo.getTakernm()%>">
							</div>
							<br>
							<div class="form-group">
								<label for="takerph">取貨人電話</label><span class="alert">${errormap.get(3)}</span>
								<input type="text" class="form-control" id="takerph"
									name="takerph" value="<%=(shgmvo.getTakerph() == null)? "":shgmvo.getTakerph()%>">
							</div>
							<br>
							<div class="form-group">
								<label for="ads">取貨地址</label><span class="alert">${errormap.get(4)}</span><br>
								<select id="縣市1" name="city" class="address"></select>
								<select id="鄉鎮市區1" name="area" class="address"></select>
								<input id="ads" name="ads" type="text" class="form-control address" value="<%= (hashmap == null)? "":hashmap.get("ads") %>"/>
								<input id="address" name="address" type="hidden" value="<%= (shgmvo.getAddress() == null)? "":shgmvo.getAddress() %>"/>
							</div>
							<input type="hidden" name="boxstatus" value="0">
							<input type="hidden" name="paystatus" value="1">
							<input type="hidden" name="status" value="1">
							<br>
							<div class="button-wrapper">
								<button id="buythis" type="submit" class="btn btn-primary">確定購買</button>
								<a id="buycancel"href="<%=request.getContextPath()%>/front-end/shgm/mainPage.jsp" class="btn btn-primary">取消購買</a>
							</div>
							<input type="hidden" name="shgmno" value="${shgmvo.shgmno}">
							<input type="hidden" name="buyerno" value="${mbrpfvo.mbrno}">
							<input type="hidden" name="action" value="dealingshgm">
						</form>
						<b><span class="alert">${errormap.get(5)}</span></b>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="random-area"></div>





	<script type="text/javascript">
	window.onload = function () {
		if(<%=shgmvo.getPrice() > mbrpfvo.getPoints() %>){
			window.location.href = "<%=request.getContextPath()%>/front-end/shgm/infoPage.jsp";
		}
	       //當頁面載完之後，用AddressSeleclList.Initialize()，
	       //傳入要綁定的縣市下拉選單ID及鄉鎮市區下拉選單ID
	       AddressSeleclList.Initialize('縣市1', '鄉鎮市區1'<%= (hashmap == null)? "":",'"+hashmap.get("city")+"'"%><%= (hashmap == null)? "": ",'"+hashmap.get("area")+"'"%>);
	       var addressClass = document.getElementsByClassName("address");
	       var address = document.getElementById("address");
	       
	       for (i = 0; i < addressClass.length; i++) {
	    	   addressClass[i].addEventListener("change", addressValues);
	    	}
	       function addressValues(){
		       var city = document.getElementById("縣市1").value;
		       var area = document.getElementById("鄉鎮市區1").value;
		       var location = document.getElementById("ads").value;
		       address.value = city + area + location;
		       console.log(address.value);
	       };
	  }
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