<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.tfcord.model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/> <!--要有這條 -->
<title>兌換紀錄詳情</title>
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

<h3>顯示某筆點數交易紀錄的詳情</h3>

<table>
		<tr>
			<th>兌換編號</th>
			<th>會員編號</th>
			<th>兌換種類</th>
			<th>兌換金額</th>
			<th>兌換時間</th>
			<th>兌換狀態</th>
			<th>審核按鈕</th>
		</tr>
		<tr>     
			<td>${tfcordVO.tfno}</td>
			<td>${tfcordVO.mbrno}</td>
			<td>${(tfcordVO.tftype == "M") ? "兌現" : "儲值"}</td>
			<td>${tfcordVO.price}</td>
			<td><fmt:formatDate value="${tfcordVO.tftime}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
			<td>${(tfcordVO.tfstatus == 0) ? "未處理" : "已通過"}</td>
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
	</table>

</body>
</html>