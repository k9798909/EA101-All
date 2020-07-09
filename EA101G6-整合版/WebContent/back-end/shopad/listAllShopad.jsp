<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<%@ page import="com.shopad.model.*" %>


<% 
	ShopadService shopadSvc = new ShopadService();
	List<ShopadVO> list = shopadSvc.getAll();
	pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>所有店家廣告 - listAllShopad.jsp</title>

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
  	width:100%;
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
  .t1{
  	margin-top: 50px;
  }
  
</style>

</head>
<body bgcolor='white'>

<%@ include file="/back-end/back-end_nav.jsp"%>


<table class="col-md-10 offset-md-1 t1">
	<tr><td>
		<h3>所有店家廣告 -listAllShopad.jsp</h3>
		
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
		<th>店家廣告編號</th>
		<th>店家編號</th>
		<th>店家廣告標題</th>
		
		<th>開始日期</th>
		<th>結束日期</th>
		<th>審核狀態</th>
		<th>刪除</th>
	</tr>
	
	
	
	<c:forEach var="shopadVO" items="${list}">
		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/shopad/shopad.do" style="margin-bottom: 0px;">
		<tr>
			<td>${shopadVO.shopadno}</td>
			<td>${shopadVO.shopno}</td>
			<td>${shopadVO.shopadtt}</td>		
			<td>${shopadVO.startt}</td>
			<td>${shopadVO.stopt}</td>
			<td><select size="1" name="status">
				<option value="0" ${(shopadVO.status==0)? 'selected':''}>未審核
				<option value="1" ${(shopadVO.status==1)? 'selected':''}>已上架
				<option value="2" ${(shopadVO.status==2)? 'selected':''}>已下架
			</select></td>
			
			
			
			<td>
				
					<input type="submit" value="修改" >
					<input type="hidden" name="shopadno" value="${shopadVO.shopadno}">
					<input type="hidden" name="action" value="update">
				
			</td>
		</tr></FORM>
		
	</c:forEach>
	
	<marquee onMouseOver="this.stop()" onMouseOut="this.start()"  bgcolor=ffcc00 class="col-md-10 offset-md-1">
		<c:forEach var="shopadVO" items="${list}">
			<c:if test="${shopadVO.status == 1}">
				<a target="_self" style="text-decoration:none;" href="<%=request.getContextPath()%>/shop/shop.do?action=getOne_Detail&shopno=${shopadVO.shopno}">
					${shopadVO.shopno}
				</a> : ${shopadVO.shopadtt} &nbsp;&nbsp;&nbsp;
			</c:if>
		</c:forEach>
	</marquee>
	
	
</table>


</body>
</html>