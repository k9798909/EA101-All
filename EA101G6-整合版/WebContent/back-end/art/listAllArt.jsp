<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<%@ page import="com.art.model.*" %>


<% 
	ArtService artSvc = new ArtService();
	List<ArtVO> list = artSvc.getAll();
	pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>所有文章資料 - listAllArt.jsp</title>

<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
  
  img {
  	width:400px;
  	height:500px;	
  }
  	
  table {
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
  
</style>

</head>
<body bgcolor='white'>

<%@ include file="/back-end/back-end_nav.jsp"%>

<table class="col-md-10 offset-md-1">
	<tr><td>
		<h3>所有文章資料</h3>
		
	</td></tr>
</table>


<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table class="col-md-10 offset-md-1 table table-striped bg-white">
	<tr>
		<th>文章編號</th>
		<th>作者編號</th>
		<th>文章標題</th>
		<th>發文日期</th>
		
		
		<th>文章種類</th>
		<th>文章狀態</th>
		
		<th>修改</th>
		<th>刪除</th>
	</tr>
	
<%-- 	<jsp:useBean id="mbrpfSvc" scope="page" class="com.mbrpf.model.MbrpfService"/> --%>
	
	
	<c:forEach var="artVO" items="${list}">
		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/art/art.do" style="margin-bottom: 0px;">
		<tr>
			<td><a target="_blank" href="<%=request.getContextPath()%>/back-end/art/art.do?action=get_One_Detail&artno=${artVO.artno}">${artVO.artno}</a></td>
			<td>${artVO.mbrno}</td>
			<td>${artVO.arttt}</td>
			<td>${artVO.pdate}</td>
			
			<c:if test="${artVO.atno == 'AT01'}">
				<td>遊戲心得</td>
			</c:if>
			
			<c:if test="${artVO.atno == 'AT02'}">
				<td>遊戲百科</td>
			</c:if>
			
			<c:if test="${artVO.atno == 'AT03'}">
				<td>討論區公告</td>
			</c:if>
			
			<td><select size="1" name="status">
				<option value="0" ${(artVO.status==0)? 'selected':''}>正常顯示
				<option value="1" ${(artVO.status==1)? 'selected':''}>隱藏文章
			</select></td>
			
			
			
			
			
			<td>
				<input type="submit" value="修改" >
				<input type="hidden" name="artno" value="${artVO.artno}">
				<input type="hidden" name="action" value="update_Art_Status">
			</td></FORM>
			
			<td>
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/art/art.do" style="margin-bottom: 0px;">
					<input type="submit" value="刪除" >
					<input type="hidden" name="artno" value="${artVO.artno}">
					<input type="hidden" name="action" value="delete">
				</FORM>
			</td>
		</tr>
	</c:forEach>
</table>


</body>
</html>