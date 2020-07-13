<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<%@ page import="com.artrp.model.*" %>


<% 
	ArtrpService artrpSvc = new ArtrpService();
	List<ArtrpVO> list = artrpSvc.getAll();
	pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>討論區文章檢舉審核</title>

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
  .logoutPIC{
   	margin-top: 18%;
   }
   .www{
   	text-align: center;
   }
</style>

</head>
<body bgcolor='white'>

<%@ include file="/back-end/back-end_nav.jsp"%>


<table class="col-md-10 offset-md-1">
	<tr><td>
		<h3>討論區文章檢舉審核</h3>
		
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
		<th class="align-middle www">文章檢舉編號</th>
		<th class="align-middle www">文章編號</th>
		<th class="align-middle www">檢舉內容</th>
		<th class="align-middle www">檢舉人編號</th>
		<th class="align-middle www">檢舉狀態</th>
		
		<th class="align-middle www">修改</th>
		
	</tr>
	
<%-- 	<jsp:useBean id="mbrpfSvc" scope="page" class="com.mbrpf.model.MbrpfService"/> --%>
	
	
	<c:forEach var="artrpVO" items="${list}">
		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/artrp/artrp.do" style="margin-bottom: 0px;">
		<tr>
			<td>${artrpVO.artrpno}</td>
			
			<td><a target="_blank" href="<%=request.getContextPath()%>/artrp/artrp.do?action=getOne_Display&artno=${artrpVO.artno}">${artrpVO.artno}</a></td>
			<td>${artrpVO.detail}</td>
			<td>${artrpVO.mbrno}</td>
			<td><select size="1" name="status">
				<option value="0" ${(artrpVO.status==0)? 'selected':''}>未審核
				<option value="1" ${(artrpVO.status==1)? 'selected':''}>已審核
			</select></td>
			
			
			
			<td>
				<input type="submit" id="action" value="修改" >
				<input type="hidden" name="artrpno" value="${artrpVO.artrpno}">
				<input type="hidden" name="action" value="update">
			</td>
			
			
		</tr></FORM>
	</c:forEach>
</table>



</body>
</html>