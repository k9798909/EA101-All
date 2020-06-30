<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.shop.model.*"%>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<head>
<title>���a�n�J</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/loginStyle.css">
<style>
table {
	margin-top: 10px;
}

tr th {
	border: 2px solid black;
	text-align: center;
}

td {
	text-align: center;
}

.icon {
	width: 20px;
	height: 20px;
}

tr:nth-child(odd) {
	background-color: #FFED97;
}

img {
	width: 300px;
	height: 200px;
}

h4 {
	margin-left: 20px;
}
</style>
</head>

<body>

<%@ include file="/front-end/front-end-nav.jsp" %>

<h4 style="margin-left: 20px;">
	<a href="index.jsp"><img src="images/add-icon.png" class="icon">�^����</a>
</h4>

	<form method="post" action="<%=request.getContextPath()%>/front-end/shop/shop.do">
		<div class="login-form" style="margin-top: 40px;">
			<h1>���a�n�J</h1>
			<div class="form-group ">
				<input type="text" class="form-control" placeholder="�b�� "
					id="UserName" name="account"> <i class="fa fa-user"></i>
			</div>
			<div class="form-group log-status">
				<input type="password" class="form-control" placeholder="�K�X"
					id="Passwod" name="password"> <i class="fa fa-lock"></i>
			</div>
			<span style="font-size: 12px; color: #f00; float: left;"> <%-- ���~��C --%>
				<c:if test="${not empty errorMsgs}">
					<c:forEach var="message" items="${errorMsgs}">
							${message}
						</c:forEach>
				</c:if>
			</span> <a class="link" href="addShop.jsp">���U</a> <input type="submit"
				class="log-btn" value="�|���n�J"> <input type="hidden"
				name="action" value="login">
			<!-- 			</button> -->
		</div>
	</form>

	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
</body>
</html>