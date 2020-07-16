<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.gmlist.model.*"%>
<%@ page import="com.shop.model.*"%>
<%@ page import="com.game.model.*"%>

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

td th tr {
	text-align: center;
}

.icon {
	width: 20px;
	height: 20px;
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
}
div {
	margin-left: auto;
	margin-right: auto;
}
</style>
</head>
<body bgcolor='white'>
	<%-- ���~��C --%>
<%-- 	<c:if test="${not empty errorMsgs}"> --%>
<!-- 		<font style="color: red">�Эץ��H�U���~:</font> -->
<!-- 		<ul> -->
<%-- 			<c:forEach var="message" items="${errorMsgs}"> --%>
<%-- 				<li style="color: red">${message}</li> --%>
<%-- 			</c:forEach> --%>
<!-- 		</ul> -->
<%-- 	</c:if> --%>

<jsp:useBean id="gmlistSvc" scope="page" class="com.gmlist.model.GmlistService" />
<jsp:useBean id="gameSvc" scope="page" class="com.game.model.GameService" />
<jsp:useBean id="shopSvc" scope="page" class="com.shop.model.ShopService" />

<nav class="navbar navbar-expand-lg navbar-light  bg-gradient-info shadow p-3 mb-5 rounded">

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item "><a href='listAllGmlist.jsp'>List
						</a>all Gmlist.</li>
			</ul>
			<ul class="navbar-nav mr-auto">
				<li class="nav-item">
					<FORM METHOD="post" class="form-inline my-2 my-lg-0"
						ACTION="<%=request.getContextPath()%>/front-end/gmlist/gmlist.do">
						<select class="custom-select form-control mr-sm-1" name="gmno">
							<option value="">��ܹC���W��
								<c:forEach var="gameVO" items="${gameSvc.getAll()}">
									<option value="${gameVO.gmno}">${gameVO.gmname}
								</c:forEach>
						</select> <input type="hidden" name="action" value="getSome_For_Display">
						<button class="btn btn-outline-secondary my-2 my-sm-0" type="submit">�e�X</button>
					</FORM>
				</li>
			</ul>
			<ul class="navbar-nav mr-auto">
				<li class="nav-item">
					<FORM METHOD="post" class="form-inline my-2 my-lg-0"					
						ACTION="<%=request.getContextPath()%>/front-end/gmlist/gmlist.do">
						<select class="custom-select form-control mr-sm-1" name="shopno">
							<option value="">��ܩ��a�m�W
								<c:forEach var="shopVO" items="${shopSvc.getAllowedShop()}">
									<option value="${shopVO.shopno}">${shopVO.shopname}
								</c:forEach>
						</select> <input type="hidden" name="action" value="getSome_For_Display">
						<button class="btn btn-outline-secondary my-2 my-sm-0" type="submit">�e�X</button>
					</FORM>
				</li>
			</ul>
		</div>
	</nav>




</body>
</html>