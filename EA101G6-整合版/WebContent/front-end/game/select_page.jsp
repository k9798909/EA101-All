<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>搜尋</title>
</head>
<body>
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
	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<!-- 	<ul> -->
	<!-- 		<li><a href='listAllGame.jsp' >List</a> all Games. <br></li> -->






	<!-- 		<li> -->
	<!-- 			<FORM METHOD="post" ACTION="game.do"> -->
	<!-- 				<b>選擇遊戲名稱:</b> <select size="1" name="gmno"> -->
	<%-- 					<c:forEach var="gameVO" items="${gameSvc.all}"> --%>
	<%-- 						<option value="${gameVO.gmno}">${gameVO.gmname} --%>
	<%-- 					</c:forEach> --%>
	<!-- 				</select> <input type="hidden" name="action" value="getOne_For_Display"> -->
	<!-- 				<input type="submit" value="送出"> -->
	<!-- 			</FORM> -->
	<!-- 		</li> -->
	<!-- 	</ul> -->
	<!-- --------------------------------------------------------------------------------------------------------------------------- -->
	<nav
		class="navbar navbar-expand-lg navbar-light bg-gradient-info shadow p-3 mb-5 rounded">

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a href='listAllGame.jsp'>List </a>all
					Games.</li>
			</ul>
			<jsp:useBean id="gameSvc" scope="page"
				class="com.game.model.GameService" />

			<ul class="navbar-nav mr-auto">
				<li class="nav-item">
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/front-end/game/game.do"
						class="form-inline my-2 my-lg-0">
						<input type="text" name="gmname"  placeholder="遊戲名稱關鍵字" class="form-control">
						<input type="hidden" name="action" value="getSome_For_Display">
						<input type="submit" value="送出" class="btn btn-outline-secondary my-2 my-sm-0">
					</FORM>
				</li>
			</ul>

			<ul class="navbar-nav mr-auto">
				<li class="nav-item">
					<FORM METHOD="post" class="form-inline my-2 my-lg-0"
						ACTION="<%=request.getContextPath()%>/front-end/game/game.do">
						<select class="custom-select form-control mr-sm-1" name="gmno">
							<option value="">選擇遊戲名稱
								<c:forEach var="gameVO" items="${gameSvc.getAll()}">
									<option value="${gameVO.gmno}">${gameVO.gmname}
								</c:forEach>
						</select> <input type="hidden" name="action" value="getOne_For_Display">
						<button class="btn btn-outline-secondary my-2 my-sm-0"
							type="submit">送出</button>
					</FORM>
				</li>
			</ul>
		</div>
	</nav>

</body>
</html>