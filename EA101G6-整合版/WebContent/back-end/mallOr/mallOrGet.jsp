<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>Insert title here</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/jquery-ui.css">

<style>
div.backNav .navbar-light .navbar-nav a.nav-link, .dropdown-item {
	width: auto;
	margin: 0px;
	padding: 0px;
}



</style>

</head>
<body>

	<%@ include file="/back-end/back-end_nav.jsp"%>
	
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div id="tabs" style="margin-top: 20px;">
					<ul>
						<li><a href="#tabs-1">未出貨</a></li>
						<li><a href="#tabs-2">所有交易紀錄</a></li>
					</ul>

					<jsp:useBean id="mallOrSvc" class="com.mallOr.model.MallOrService" />

				
					<div id="tabs-2">
						<%@ include file="/back-end/mallOr/mallOrGetAll.jsp"%>
					</div>
				</div>
			</div>
		</div>
	</div>



	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<script>
		$(function() {
			$("#tabs").tabs();
		});
	</script>
</body>
</html>