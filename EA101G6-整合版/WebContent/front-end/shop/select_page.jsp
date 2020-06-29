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
	margin-left: center;
	margin-right: center;
}
li {
	margin-top: 15px;
}
</style>
</head>
<body bgcolor='white'>
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
		<li><a href='listAllShop.jsp' >List</a> all allowed Shops. <br></li>


		<li>
			<FORM METHOD="post" ACTION="shop.do">
				<b>��J���a�s�� (�pDS00001):</b> <input type="text" name="shopno">
				<input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="�e�X">
			</FORM>
		</li>

		<jsp:useBean id="shopSvc" scope="page"
			class="com.shop.model.ShopService" />

		<li>
			<FORM METHOD="post" ACTION="shop.do">
				<b>��ܩ��a�s��:</b> <select size="1" name="shopno">
					<c:forEach var="shopVO" items="${shopSvc.getAllowedShop()}">
						<option value="${shopVO.shopno}">${shopVO.shopno}
					</c:forEach>
				</select> <input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="�e�X">
			</FORM>
		</li>

		<li>
			<FORM METHOD="post" ACTION="shop.do">
				<b>��ܩ��a�m�W:</b> <select size="1" name="shopno">
					<c:forEach var="shopVO" items="${shopSvc.getAllowedShop()}">
						<option value="${shopVO.shopno}">${shopVO.shopname}
					</c:forEach>
				</select> <input type="hidden" name="action" value="getOne_For_Display">
				<input type="submit" value="�e�X">
			</FORM>
		</li>
	</ul>


</body>
</html>