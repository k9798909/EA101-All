<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.tfcord.model.*" %>
<%@ page import="java.util.*"%>

<%
	
	String mbrno = (String) session.getAttribute("mbrno");
	TfcordService tfcordSvc = new TfcordService();
	List<TfcordVO> list = tfcordSvc.getWhoAll(mbrno);
	pageContext.setAttribute("list",list);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/> <!--要有這條 -->
<title>會員點數交易紀錄</title>
</head>
<body>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>	

<a href="<%=request.getContextPath()%>/back-end/tfcord/select_page_Tfcord.jsp">回後台點數轉換首頁</a>

<h3>顯示某會員所有的點數交易紀錄</h3>
---${param.whichPage}---${param.mbrno}---
<table>
	<tr>
		<th>兌換編號</th>
		<th>兌換種類</th>
		<th>兌換金額</th>
		<th>兌換時間</th>
		<th>兌換狀態</th>
		<th>審核按鈕</th>
	</tr>
	
	<%@ include file="page1.file"%>
	
	<c:forEach var="tfcordVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1 %>">
		<tr ${(tfcordVO.tfno == param.tfno) ? 'bgcolor=#CCCCFF' : ''}><!--將審核的那一筆加入對比色-->
			<td>${tfcordVO.tfno}</td>
			<td>${(tfcordVO.tftype == "M") ? "兌現" : "儲值"}</td>
			<td>${tfcordVO.price}</td>
			<td><fmt:formatDate value="${tfcordVO.tftime}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
			<td>${(tfcordVO.tfstatus == 0) ? "未處理" : "已通過"}</td>
			<td>
				<form method="post" action="<%=request.getContextPath()%>/tfcord/TfcordServlet">
<%-- 					<input type="button" value="確認審核" ${(tfcordVO.tfstatus == 1) ? "disabled" : "" } > --%>
					<input type ="submit" value="確認審核" ${(tfcordVO.tfstatus == 1) ? "disabled" : "" }>
					<input type ="hidden" name="mbrno" value="${tfcordVO.mbrno}">
					<input type ="hidden" name="tfno" value="${tfcordVO.tfno}">
					<input type ="hidden" name="requestURL" value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller-->
					<input type ="hidden" name="whichPage" value="<%=whichPage%>"><!--送出當前是第幾頁給Controller，給這行才有辦法回修改的頁數-->
					<input type ="hidden" name="action" value="changeStatue">
				</form> 
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>
request.getServletPath() = <%=request.getServletPath()%>
</body>
</html>