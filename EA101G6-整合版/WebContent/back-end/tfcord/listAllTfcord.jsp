<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.tfcord.model.*"%>

<%
	TfcordService tfSvc = new TfcordService();
	List<TfcordVO> list = tfSvc.getAll();
	pageContext.setAttribute("list", list);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>點數交易紀錄</title>
</head>
<body>

<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤：</font>
		<c:forEach var="message" items="${errorMsgs}">
			<ul>
				<li style="color:red">${message}</li>
			</ul>	
		</c:forEach>
</c:if>

<a href="<%=request.getContextPath()%>/back-end/tfcord/select_page_Tfcord.jsp">回後台點數轉換首頁</a>

<h3>顯示所有會員的點數交易紀錄</h3>

<table>
	<tr>
		<th>兌換編號</th>
		<th>會員編號</th>
		<th>兌換種類</th>
		<th>兌換金額</th>
		<th>兌換時間</th>
		<th>審核狀態</th>
		<th>審核按鈕</th>
	</tr>
	
	<%@ include file="page1.file"%>
	<c:forEach var="tfcordVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr>
			<td>${tfcordVO.tfno}</td>
			<td>${tfcordVO.mbrno}</td>
			<td>${tfcordVO.tftype == "M" ? "兌現" : "儲值"}</td>
			<td>${tfcordVO.price}</td>
<%-- 			<td>${tfcordVO.tftime}</td> --%>
			<td><fmt:formatDate value="${tfcordVO.tftime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			<td>${tfcordVO.tfstatus == 1 ? "已審核" : "未審核"}</td>
			<td>
				<form method="post" action="<%=request.getContextPath()%>/tfcord/TfcordServlet">
					<input type="submit" value="確認審核" ${(tfcordVO.tfstatus == 1) ? "disabled" : "" }>
					<input type ="hidden" name="mbrno" value="${tfcordVO.mbrno}">
					<input type ="hidden" name="tfno" value="${tfcordVO.tfno}">
					<input type ="hidden" name="requestURL" value="<%=request.getServletPath()%>">					
					<input type ="hidden" name="action" value="changeStatue">
				</form> 
			</td>
		</tr>
	</c:forEach>
	
</table>
<%@ include file="page2.file"%>
</body>
</html>