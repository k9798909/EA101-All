<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>�j�M</title>
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
	margin-left: center;
	margin-right: center;
}
li {
	margin-top: 15px;
}
</style>
	<h3 style="margin-left:20px;">��Ƭd��:</h3>
	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<ul>
		<li><a href='listAllGame.jsp' >List</a> all Games. <br></li>


		<li>
			<FORM METHOD="post" ACTION="game.do">
				<b>��J�C���W������r (�p�T�H��):</b> <input type="text" name="gmname">
				<input type="hidden" name="action" value="getSome_For_Display">
				<input type="submit" value="�e�X">
			</FORM>
		</li>

		<jsp:useBean id="gameSvc" scope="page"
			class="com.game.model.GameService" />

		<li>
			<FORM METHOD="post" ACTION="game.do">
				<b>��ܹC���s��:</b> <select size="1" name="gmno">
					<c:forEach var="gameVO" items="${gameSvc.all}">
						<option value="${gameVO.gmno}">${gameVO.gmno}
					</c:forEach>
				</select> <input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="�e�X">
			</FORM>
		</li>

		<li>
			<FORM METHOD="post" ACTION="game.do">
				<b>��ܹC���W��:</b> <select size="1" name="gmno">
					<c:forEach var="gameVO" items="${gameSvc.all}">
						<option value="${gameVO.gmno}">${gameVO.gmname}
					</c:forEach>
				</select> <input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="�e�X">
			</FORM>
		</li>
	</ul>


</body>
</html>