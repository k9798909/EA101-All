<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.Date" %>

<%

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>購買點數</title>
</head>
<body>

<%@ include file="/front-end/front-end-nav.jsp"%>

<!-- 錯誤列表  -->
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤：</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

<h4>請選擇欲購買之面額</h4>
<form method="post" action="<%=request.getContextPath()%>/tfcord/TfcordServlet">
	<table>
		<tr>
			<td>
				<input type="radio" name="price" value="100">100元
			</td>
			<td>
				<input type="radio" name="price" value="200">200元
			</td>
			<td>
				<input type="radio" name="price" value="300">300元
			</td>
		</tr>
		<tr>
			<td>
				<input type="radio" name="price" value="400">400元
			</td>
			<td>
				<input type="radio" name="price" value="500">500元
			</td>
			<td>
				<input type="radio" name="price" value="600">600元
			</td>
		</tr>
		<tr>
			
		</tr>
	</table>
	<br>
	<button type="button">購買</button><!-- onClick後下面顯示輸入付款資訊 -->
	<input type="hidden" name="mbrno" value="BM00001"><!-- 先寫死的員工編號 -->
	<input type="hidden" name="tftype" value="P">
	
	<table>
		<tr>
			<th>信用卡資訊：</th>
		</tr>
		<tr>
			<td><input type="text" name="card" size="4">-<input type="text" name="card" size="4">-<input type="text" name="card" size="4">-<input type="text" name="card" size="4"></td>
		</tr>
		<tr>
			<th>有效日期：</th>
		</tr>
		<tr>
			<td><select size="1">
				<c:forEach var="month" begin="1" end="12" step="1">
					<option value="${month}">${month}月
				</c:forEach>
			</select></td>
			<td><select size="4">
				<c:forEach var="year" begin="1" end="12" step="1">
					<option value="${month}">${month}月
				</c:forEach>
			</select></td>
		</tr>
		<tr>
			<th>有效日期：</th>
		</tr>
	</table>
	
	<input type="hidden" name="tftype" value="P">
	<input type="hidden" name="tftype" value="P">
	<input type="hidden" name="tftype" value="P">
	<input type="hidden" name="tftype" value="P">
	
	
	<input type="hidden" name="action" value="addTfcord">	
	

</form>
</body>
</html>