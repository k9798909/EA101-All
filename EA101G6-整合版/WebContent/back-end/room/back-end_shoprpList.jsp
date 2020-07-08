<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.shoprp.model.*"%>

<%
	ShoprpService shoprpSvc = new ShoprpService();
	List<ShoprpVO> list = shoprpSvc.getAll();
	pageContext.setAttribute("list", list);
%>

<!DOCTYPE html>
<html>
<head>

<title>後臺用店家回報列表</title>

<%-- <script src="<%=request.getContextPath()%>/js/model/jquery-3.3.1.min.js"></script> --%>
<script src="<%=request.getContextPath()%>/js/model/popper.min.js"></script>
<script src="<%=request.getContextPath()%>/js/model/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/model/bootstrap.min.css">
</head>
<body>
<%@ include file="/back-end/back-end_nav.jsp" %>
<div id="listAll">
<table class="table table-striped">
	<tr>
		<th style="width:10%">房間編號</th>
		<th style="width:6%">會員編號</th>
		<th style="width:15%">回報時間</th>
		<th style="width:10%">備註</th>
		<th style="width:15%">是否到場</th>
		<th></th>
	</tr>
	<c:forEach var="shoprpVO" items="${list}">
	<tr>
		<td>${shoprpVO.rmno}</td>
		<td>${shoprpVO.mbrno}</td>
		<td><fmt:formatDate value="${shoprpVO.rpdate}" pattern="yyyy-MM-dd HH:mm" /></td>
		<td>${shoprpVO.detail}</td>
		<td>
			<c:choose>
    			<c:when test="${shoprpVO.attend eq 0}">
    				未出席
   		 		</c:when>
   		 		<c:otherwise>
			    	有到場
			    </c:otherwise>
			</c:choose>
   		 </td>
		<td>
			<form METHOD="post" ACTION="shoprp.do">			
				<input type="hidden" name="rmno" value="${shoprpVO.rmno}">
				<input type="hidden" name="mbrno" value="${shoprpVO.mbrno}">
				<input type="hidden" name="action" value="delete">
				<input type="submit" value="刪除">
			</form>
		</td>
	</tr>
	</c:forEach>

</table>
</div>
</body>
<style>
#listAll{
	margin:20px auto;
	width:89%;
	background-color:white;
}
</style>
</html>