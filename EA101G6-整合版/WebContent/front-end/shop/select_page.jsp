<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<style>
body {
	background-position: center;
}

table {
	width: 80%;
	margin-top: 10px;
	margin-left: auto;
	margin-right: auto;
}

tr th {
	border: 2px solid black;
	text-align: center;
}

td {
	border: 2px solid black;
	text-align: center;
}

.icon {
	width: 20px;
	height: 20px;
}

tr:nth-child(odd) {
	background-color: #FFED97;
}

h3 {
	margin-left: auto;
	margin-rghit: auto;
}

ul {
	margin-top: 2px;
	margin-left: auto;
	margin-right: auto;
}

li {
	margin-top: 15px;
	margin-left: auto;
	margin-right: auto;
}
</style>
</head>
<body bgcolor='white'>
	<%-- 錯誤表列 --%>
<%-- 	<c:if test="${not empty errorMsgs}">	 --%>
<!-- 		<div class="alert alert-danger" role="alert"> -->
<!-- 		<h5>請修正以下錯誤:</h5> -->
<%-- 			<c:forEach var="message" items="${errorMsgs}"> --%>
<%-- 				<p style="margin-left:80px;">${message}</p> --%>
<%-- 			</c:forEach> --%>
<!-- 		</div> -->
<%-- 	</c:if> --%>

	<nav class="navbar navbar-expand-lg navbar-light">

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href='listAllShop.jsp'>List
						all Shops.</a></li>
			</ul>
			<jsp:useBean id="shopSvc" scope="page"
				class="com.shop.model.ShopService" />
			<ul class="navbar-nav mr-auto">
				<li class="nav-item">
					<FORM METHOD="post" class="form-inline my-2 my-lg-0"
						ACTION="<%=request.getContextPath()%>/front-end/shop/shop.do">
						<select class="custom-select form-control mr-sm-1" name="shopno">
							<option value="">選擇店家編號
								<c:forEach var="shopVO" items="${shopSvc.getAllowedShop()}">
									<option value="${shopVO.shopno}">${shopVO.shopno}
								</c:forEach>
						</select> <input type="hidden" name="action" value="getOne_For_Display">
						<button class="btn btn-outline-secondary my-2 my-sm-0" type="submit">送出</button>
					</FORM>
				</li>
			</ul>
			<ul class="navbar-nav mr-auto">
				<li class="nav-item">
					<FORM METHOD="post" class="form-inline my-2 my-lg-0"					
						ACTION="<%=request.getContextPath()%>/front-end/shop/shop.do">
						<select class="custom-select form-control mr-sm-1" name="shopno">
							<option value="">選擇店家姓名
								<c:forEach var="shopVO" items="${shopSvc.getAllowedShop()}">
									<option value="${shopVO.shopno}">${shopVO.shopname}
								</c:forEach>
						</select> <input type="hidden" name="action" value="getOne_For_Display">
						<button class="btn btn-outline-secondary my-2 my-sm-0" type="submit">送出</button>
					</FORM>
				</li>
			</ul>
		</div>
	</nav>


<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<!-- 查詢時有錯誤啟動 -->
	<c:if test="${not empty errorMsgs}">
		<script>
			swal({
				text : "${errorMsgs}"
			});
		</script>
		<%
			request.removeAttribute("errorMsgs");
		%>
	</c:if>
</body>
</html>