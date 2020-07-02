<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.shop.model.*"%>
<%@ include file="/front-end/front-end-nav.jsp" %>
<%
	ShopVO shopVO = null;
	if(request.getParameter("shopno") != null)		
		shopVO = (ShopVO) request.getAttribute("shopVO");	
%>

<head>

<meta charset="utf-8">

<title>���a</title>
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



<h4 style="margin-left: 20px;">
	<a href="index.jsp"><img src="images/add-icon.png" class="icon">�^����</a>
</h4>
<jsp:include page="select_page.jsp" flush="true">
	<jsp:param name="" value="" />
</jsp:include>
<div class="row">
<div class="col-sm-4"></div>
<div class="col-sm-5">
  <h1 class="display-4" style="margin-left: auto;">${shopVO.shopname}</h1>
  <p class="lead">
<img src="<%=request.getContextPath()%>/ShopShowImg?shopno=${shopVO.shopno}" />  </p>
  <hr class="my-4">
  <p>���Ѯy��:${shopVO.shopcy}</p>
  <p>�q��:0${shopVO.shopphone}</p>
  <p>��m:${shopVO.shoploc}</p>
  <p class="lead">
    <a class="btn btn-primary btn-lg" href="#" role="button">���a�C��</a>
    <a class="btn btn-primary btn-lg" href="#" role="button">���a����</a>
  </p>
</div>
</div>


</body>
</html>