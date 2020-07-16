<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.shop.model.*"%>

<%
	String account = (String) request.getAttribute("account");
	String password = (String) request.getAttribute("password");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UnearthLogin</title>

  <link rel="stylesheet" href="<%= request.getContextPath()%>/css/style_login.css">

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Rubik:300,400,700|Oswald:400,700"
	rel="stylesheet">
<!-- 登入圖示 -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/fonts/icomoon/style.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/model/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/model/jquery.fancybox.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/model/owl.carousel.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/model/owl.theme.default.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/model/aos.css">
<!-- MAIN CSS -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/model/style.css">

<style>
.icon {
	width: 30px;
	height: 30px;
	margin-right: 3px;
}
.reg1{
	width: 30px;
	height: 30px;
	margin-right: 10px;
}
</style>

</head>

<body>

<jsp:include page="/front-end/front-end-nav.jsp"/>

<main>
<form class="login-form " action="<%=request.getContextPath()%>/mbrpf/mbrpf.do" method="post">
<div class="login-form ">
     <h1><img src="<%=request.getContextPath()%>/images/rocket.gif" width="250" height="200" border="0"></h1>
     <div class="form-group ">
       <input type="text" class="form-control" name="account" placeholder="帳號 " id="UserName">
       <i class="fa fa-user"></i>
     </div>
     <div class="form-group log-status">
       <input type="password" class="form-control" name="password" placeholder="密碼" id="Passwod">
       <i class="fa fa-lock"></i>
     </div>
      <span class="alert">密碼錯誤</span>
      <a class="link" href="<%=request.getContextPath()%>/front-end/forgetPwd.jsp">忘記密碼?</a>
      <input type="hidden" name="action" value="tryLogin">
     <input type="submit" class="log-btn" value="會員登入">
     <h3>  </h3>
     <button type="button" class="sign-btn" onclick="location.href='<%=request.getContextPath()%>/front-end/mbrpf/addMbrpf.jsp'" >會員註冊</button>
       <!-- <a class="linksignup" href="#">會員註冊</a> -->
     
    
   </div>
   </form>
  </main>
  
   
   
<!-- partial -->
  <script  src="<%= request.getContextPath()%>/js/script_login.js"></script>

  <script
		src="<%=request.getContextPath()%>/js/model/jquery-3.3.1.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/model/popper.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/model/bootstrap.min.js"></script>
	<!-- 重要廣告界面 -->
	<script
		src="<%=request.getContextPath()%>/js/model/owl.carousel.min.js"></script>
	<!--...-->
	<script
		src="<%=request.getContextPath()%>/js/model/jquery.sticky.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/model/jquery.waypoints.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/model/jquery.animateNumber.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/js/model/jquery.fancybox.min.js"></script>
	<!-- 上介面連結動畫 -->
	<script
		src="<%=request.getContextPath()%>/js/model/jquery.easing.1.3.js"></script>
	<!-- 重要廣告界面 -->
	<script src="<%=request.getContextPath()%>/js/model/aos.js"></script>
	<script src="<%=request.getContextPath()%>/js/model/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

		<!-- 	店家登出js -->
	<script>
		$(document).ready(function() {
			$("#goLogout").click(function() {
				$("#logout").submit();
			})
		})
		
	<c:if test="${not empty successMsg}">
	swal({text:"${successMsg}" });
	</c:if>
	
	<c:if test="${not empty errorMsgs}">
	let erroStr="";
	<c:forEach var="str" items="${errorMsgs}">
		erroStr+="${str}"+"\n";
	</c:forEach>
	swal({text:erroStr });
</c:if>
		
	</script>


</body>
</html>