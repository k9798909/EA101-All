<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.rate.model.*"%>

<%
	RateService rateSvc = new RateService();
	List<RateVO> list = rateSvc.getAll();
	pageContext.setAttribute("list", list);
%>

<!DOCTYPE html>
<html>
<head>

<title>後台用評價列表</title>
</head>
<body>
<table>
	<tr>
		<th style="width:10%">評價編號</th>
		<th style="width:6%">房間編號</th>
		<th style="width:7%">評價人編號</th>
		<th style="width:10%">被評價人編號</th>
		<th style="width:15%">備註</th>
		<th style="width:5%">分數</th>
		<th style="width:10%">評價時間</th>
	</tr>
	<c:forEach var="rateVO" items="${list}">
	<tr>
		<td>${rateVO.rateno}</td>
		<td>${rateVO.rmno}</td>
		<td>${rateVO.ratingmbrno}</td>
		<td>${rateVO.ratedmbrno}</td>
		<td>${rateVO.detail}</td>
		<td>${rateVO.score}</td>
		<td><fmt:formatDate value="${rateVO.ratetime}" pattern="yyyy-MM-dd HH:mm" /></td>
		<td>
			<form METHOD="post" ACTION="rate.do">			
				<input type="hidden" name="rateno" value="${rateVO.rateno}">
				<input type="hidden" name="action" value="delete">
				<input type="submit" value="刪除">
			</form
		></td>
	</tr>
	</c:forEach>

</table>

</body>
<style>

table td{
	border:1px black solid;
}
table th{
	text-align:center;
}
</style>
</html>