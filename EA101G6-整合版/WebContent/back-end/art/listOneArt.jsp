<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<%@ page import="com.art.model.*" %>

<%
	ArtVO artVO = (ArtVO) request.getAttribute("artVO");
%>


<html>
<head>
<title>文章資料</title>

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
</style>

<style>
  table {
	width: 600px;
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
		<h3>文章資料</h3>
		<h4><a href="listAllArt.jsp">回首頁</a></h4>
	</td></tr>
</table>

<table class="col-md-10 offset-md-1">
	<tr>
		<th>文章編號</th>
		<th>作者編號</th>
		<th>文章標題</th>
		<th>發文日期</th>
		
		<th>文章狀態</th>
		<th>文章種類</th>
		<th>修改</th>
		<th>刪除</th>
		
		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/art/art.do" style="margin-bottom: 0px;">
		<tr>
			<td>${artVO.artno}</td>
			<td>${artVO.mbrno}</td>
			<td>${artVO.arttt}</td>
			<td>${artVO.pdate}</td>
			
			<td><select size="1" name="status">
				<option value="0" ${(artVO.status==0)?'selected':'' }>正常顯示</option>
				<option value="1" ${(artVO.status==1)?'selected':'' }>隱藏文章</option>	
			</select></td>
			<td>${artVO.atno}</td>
			<td>
				<input type="hidden" name="artno" value="${artVO.artno}">
				<input type="hidden" name="action" value="update_Art_Status">
				<input type="submit" value="修改">
			</td></FORM>
			<td>
				<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/art/art.do" style="margin-bottom: 0px;">	
				<input type="submit" value="刪除">
				<input type="hidden" name="artno" value="${artVO.artno}">
				<input type="hidden" name="action" value="delete">
				</FORM>
			</td>
		</tr>
	
</table>
</body>
</html>