<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>後台市集商品首頁</title>
</head>
<style>
	table#select-area{
		margin-top: 2%;
		border: gray 1px solid;
		background-color:white;
	}
	table#select-area td{
		padding:1% 0 0 0;
	}
	.half{
		width:50%;
	}
</style>
<body>
	<jsp:useBean id="shgmsvc" class="com.shgm.model.ShgmService"/>

	<table id="select-area" class="table table-striped">
		<tr>
			<td>
				<form method="post" action="<%=request.getContextPath()%>/shgm/shgm.do" >
					查詢市集商品，編號：
					<select size="1" name="shgmno">
						<c:forEach var="shgmvo" items="${shgmsvc.allShgm}">
							<option value="${shgmvo.shgmno}">${shgmvo.shgmno}
						</c:forEach>
					</select>
					<input type="hidden" name="action" value="get_one" >
					<input type="submit" value="送出" class="btn btn-primary">
				</form>
			</td>
			<td class="half">
				<a href="<%=request.getContextPath()%>/back-end/shgm/addShgm.jsp" class="btn btn-primary">上架新的市集商品</a>
			</td>
		</tr>
		<tr>
			<td>
				<form method="post" action="<%=request.getContextPath()%>/shgm/shgm.do">
				查詢市集商品，名稱：
					<select size="1" name="shgmno">
						<c:forEach var="shgmvo" items="${shgmsvc.allShgm}">
							<option value="${shgmvo.shgmno}">${shgmvo.shgmname}
						</c:forEach>
					</select>
					<input type="hidden" name="action" value="get_one" >
					<input type="submit" value="送出" class="btn btn-primary">
				</form>
			</td>
			<td class="half">
				<form method="post" action="<%=request.getContextPath()%>/shgm/shgm.do">
					選擇要修改的市集商品：
					<select size="1" name="shgmno">
						<c:forEach var="shgmvo" items="${shgmsvc.allShgm}">
							<option value="${shgmvo.shgmno}">${shgmvo.shgmno}
						</c:forEach>
					</select>
					<input type="hidden" name="action" value="getone_update" >
					<input type="hidden" name="requestURL" value="<%=request.getServletPath()%>"/>
					<input type="submit" value="送出" class="btn btn-primary">
				</form>
			</td>
		</tr>
	</table>
	<ul>
		<c:if test="${not empty errormsgs}">
			<c:forEach var="errors" items="${errormsgs}">
				<li>${errors}</li>
			</c:forEach>
		</c:if>
	</ul>
</body>
</html> 