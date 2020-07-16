<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.shgmrp.model.*" %>
<%@ page import="com.shgm.model.*" %>
<%@ page import="java.util.*" %>
<%
	ShgmrpService shgmrpsvc = new ShgmrpService();
	Set<ShgmrpVO> set = shgmrpsvc.getAllShgmrp();
	pageContext.setAttribute("shgmrpset", set);
	ShgmService shgmsvc = new ShgmService();
	pageContext.setAttribute("shgmsvc", shgmsvc);
%>

<html>
<head>
<meta charset="UTF-8">
<title>市集商品檢舉審核</title>

<style>
	.logoutPIC{
		margin-top:18%;
	}
	table{
		border: 1px solid gray;
		text-align: center;
	}
	#intro{
		text-align:left;
	}
	td {
    	border: 1px solid gray;
    	width: 200px;
  	}
  	#table td{
    	padding:0px;
    	vertical-align: middle;
	}
  	img{
  		height: 150px;
  		width: 200px;
  		objtec-fit:contain;
  	}
  	div.pageselect-area {
		display: flex;
		justify-content: center;
	}
	.lefta{
		float: right;
		margin-left:1%;
	}
	#whichpage{
		width: 50px;
		margin:0 1%;
	}
	.right-area{
		width:48%;
		float:left;
	}
	.right-area a,.left-area  a{
		background-color: #9999
	}
	.left-area{
		width:48%;
	}
</style>
</head>
<body>

<jsp:include page="/back-end/back-end_nav-boyuan.jsp"></jsp:include>
<div class="col-10" style="margin: 0 auto;">
	<jsp:include page="/back-end/shgmrp/shgmrp_select_page.jsp"></jsp:include>
</div>
<ul>
	<c:if test="${not empty errormsgs}">
		<c:forEach var="error" items="${errormsgs}">
			<li>${error}</li>
		</c:forEach>
	</c:if>
</ul>
<div class="col-10" style="margin: 0 auto;">
<%@ include file="/back-end/shgmrp/page1.file" %> 
	<table id="table" class="table bg-white">
		<tr style="background-color:#e6e6e6;">
			<td>市集商品檢舉編號</td>
			<td>賣家會員編號</td>
			<td>市集商品名稱</td>
			<td>市集商品價錢</td>
			<td>市集商品簡介</td>
			<td>市集商品圖片</td>
			<td>檢舉人會員編號</td>
			<td>檢舉內容</td>
			<td>檢舉狀態</td>
			<td>修改檢舉</td>
			<td>刪除檢舉</td>
		</tr>
		
		<c:forEach var="shgmrpvo" items="${shgmrpset}"  begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr ${(shgmrpvo.shgmrpno == param.shgmrpno)? 'bgcolor=#e6e6e6':''}>
			<td>${shgmrpvo.shgmrpno}</td>
			<td>${shgmsvc.getOneForInfo(shgmrpvo.shgmno).sellerno}</td>
			<td>${shgmsvc.getOneForInfo(shgmrpvo.shgmno).shgmname}</td>
			<td>${shgmsvc.getOneForInfo(shgmrpvo.shgmno).price}</td>
			<td id="intro"style="width:300px">${shgmsvc.getOneForInfo(shgmrpvo.shgmno).intro}</td>
			<td><img src="<%=request.getContextPath() %>/shgm/displayimg?shgmno=${shgmrpvo.shgmno}"></td>
			<td>${shgmrpvo.suiterno}</td>
			<td>${shgmrpvo.detail}</td>
			<c:choose>
				<c:when test="${shgmrpvo.status == 0}">
					<td>未審核</td>
				</c:when>
				<c:when test="${shgmrpvo.status == 1}">
					<td>確認檢舉</td>
				</c:when>
				<c:otherwise>
					<td>取消檢舉</td>
				</c:otherwise>
			</c:choose>
			<td>
				<form method="post" action="<%= request.getContextPath()%>/shgmrp/shgmrp.do">
					<input type="hidden" name="shgmrpno" value="${shgmrpvo.shgmrpno}">
					<input type="hidden" name="action" value="getone_update" >
					<input type="hidden" name="whichPage" value="<%=whichPage%>">
					<input type="submit" value="修改" class="btn btn-primary">
				</form>
			</td>
			<td>
				<form method="post" action="<%= request.getContextPath()%>/shgmrp/shgmrp.do">
					<input type="hidden" name="shgmrpno" value="${shgmrpvo.shgmrpno}">
					<input type="hidden" name="action" value="delete" >
					<input type="hidden" name="whichPage" value="<%=whichPage%>">
					<input type="submit" value="刪除" class="btn btn-primary">
				</form>
			</td>
		</tr>
		</c:forEach>
	</table>
</div>
<%@ include file="/back-end/shgmrp/page2.file" %>
	<jsp:include page="/back-end/shgm/alert-area-backend.jsp"></jsp:include>
	<input type="hidden" id="mbrno" value="shgmBackEnd">
	<input type="hidden" id="wsShgmno" value="${param.shgmno}">

	<script type="text/javascript" src="<%=request.getContextPath() %>/js/jsForShgm/ajaxForMbrmsgs-backend.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/jsForShgm/wsForShgm.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/jsForShgm/jsForAlert-area.js"></script>
</body>
</html>