<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.gmlist.model.*"%>
<%@ page import="com.shop.model.*"%>
<%@ page import="com.game.model.*"%>
<%@ include file="/front-end/front-end-nav.jsp"%>
<%
	GmlistService gmlistSvc = new GmlistService();
	ShopVO shopVO = (ShopVO)session.getAttribute("shopVO");
	List<GmlistVO> list = gmlistSvc.getSomeGmlistByShop(shopVO.getShopno());
	pageContext.setAttribute("list", list);
%>
<jsp:useBean id="gameSvc" scope="page"
	class="com.game.model.GameService" />
<jsp:useBean id="shopSvc" scope="page"
	class="com.shop.model.ShopService" />
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">

	<title>�s�W���Ѫ��C��</title>

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
	width: 50px;
	height: 50px;
}

h4 {
	margin-left: 20px;
}
</style>
</head>

<body>

<%-- <%@ include file="/front-end/front-end-nav.jsp" %> --%>

<h4>
	<a href="../shop/index.jsp"><img src="images/add-icon.png"
		class="icon">�^����</a>
</h4>

<table>
	<tr style="background-color: #FFFFFF; border: 0px; font:;">
		<td style="background-color: #FFFFFF; border: 0px;">
			<h3>�s�W���Ѫ��C��</h3>
		</td>
	</tr>
</table>
<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color: red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color: red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
<div>
	<table>
		<tr>
			<th>�C���W��</th>
			<th>�C���Ϥ�</th>
			<th>�R��</th>
		</tr>
		<c:forEach var="gmlistVO" items="${list}">				
			<tr>
				<td>${gameSvc.getOneGame(gmlistVO.gmno).gmname}</td>
				<td><img
					src="<%=request.getContextPath()%>/GameShowImg?gmno=${gmlistVO.gmno}"></td>
				<td><FORM METHOD="post" ACTION="gmlist.do">
				<input type="hidden" name="shopno" value="${gmlistVO.shopno}">
				<input type="hidden" name="gmno" value="${gmlistVO.gmno}">
				<input type="hidden" name="action" value="delete">
				<input type="submit" value="�R��">
					</FORM></td>								
			</tr>
		</c:forEach>
	</table>
</div>

<div>
	<table>
		<tr>
			<th>�C���W��</th>
			<th>�C���Ϥ�</th>
			<th>�s�W</th>
		</tr>
			
			<c:forEach var="gameVO" items="${gameSvc.all}">
				<c:set var="tampbollean" value="true"/>
				<c:forEach var="gmlistVO" items="${list}">
					<c:if test="${gameVO.gmno==gmlistVO.gmno}">
						<c:set var="tampbollean" value="false"/>
					</c:if>
				</c:forEach>					
						
						<c:if test="${tampbollean}">
						<tr>
							<td>${gameVO.gmname}</td>
							<td><img
								src="<%=request.getContextPath()%>/GameShowImg?gmno=${gameVO.gmno}"></td>
							<td>							
							<FORM METHOD="post" ACTION="gmlist.do">
							<input type="hidden" name="shopno" value="${shopVO.shopno}">
							<input type="hidden" name="gmno" value="${gameVO.gmno}">
							<input type="hidden" name="action" value="insert">
							<input type="submit" value="�s�W">
							</FORM></td>								
						</tr>
						</c:if>
						
			</c:forEach>
	</table>
</div>
</body>
</html>