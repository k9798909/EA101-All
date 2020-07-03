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

	<title>新增提供的遊戲</title>

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




<div class="container">
<div class="row">
<div class="col-sm-5">
	<table class="table table-sm">
		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/gmlist/gmlist.do">
		<tr>
		<h4 class="text-dark">我的桌遊</h4>
		<input type="hidden" name="action" value="delete">
		<input type="submit" value="刪除" class="btn btn-primary">
		</tr>
		
		<c:forEach var="gmlistVO" items="${list}">				
			<tr>
			<td>
			<div class="form-check">
  			<input class="form-check-input" name="gmno" value="${gmlistVO.gmno}" type="checkbox" id="${gmlistVO.gmno}">
  			<label class="form-check-label" for="${gmlistVO.gmno}"></label>
  			</div>
  			</td>			
			<td>
			<label class="form-check-label" for="${gmlistVO.gmno}">${gameSvc.getOneGame(gmlistVO.gmno).gmname}</label></td>				
			<td>
			<label class="form-check-label" for="${gmlistVO.gmno}"><img
					src="<%=request.getContextPath()%>/GameShowImg?gmno=${gmlistVO.gmno}"></label></td>							
			</tr>
		</c:forEach>
		</FORM>
	</table>
</div>
<div class="col-sm-5">
	<table class="table table-sm">
		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/gmlist/gmlist.do">
		<tr>
			<h4 class="text-dark">其他桌遊</h4>
			<input type="hidden" name="action" value="insert">
			<input type="submit" value="增加" class="btn btn-primary">
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
			<td>
			<div class="form-check">
  			<input class="form-check-input" name="gmno2" value="${gameVO.gmno}" type="checkbox" id="${gameVO.gmno}">
  			<label class="form-check-label" for="${gameVO.gmno}"></label>
  			</div>
  			</td>			
			<td>
			<label class="form-check-label" for="${gameVO.gmno}">${gameSvc.getOneGame(gameVO.gmno).gmname}</label></td>				
			<td>
			<label class="form-check-label" for="${gameVO.gmno}"><img
					src="<%=request.getContextPath()%>/GameShowImg?gmno=${gameVO.gmno}"></label></td>							
			</tr>
			</c:if>			
		</c:forEach>

		</FORM>
	</table>
</div>
</div>
</div>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<!-- 查詢時有錯誤啟動 -->
	<c:if test="${not empty errorMsgs}">
		<script>
			swal({
				text : "${errorMsgs}"
			});
		</script>
		<%
			request.removeAttribute("errorMsgs");
		%>
	</c:if>
</body>
</html>