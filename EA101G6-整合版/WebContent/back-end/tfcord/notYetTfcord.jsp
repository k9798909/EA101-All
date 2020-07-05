<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.tfcord.model.*" %>

<%--將現在的位址，以pointLocation的名字存進session --%>
<%-- <% session.setAttribute("pointLocation", request.getRequestURI()); %>  --%>


<%
	TfcordService tfcordSvc = new TfcordService();
	List<TfcordVO> list = tfcordSvc.getNotYetAll();
	pageContext.setAttribute("list", list);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/> <!--要有這條 -->
<title>尚未處理的點數轉換紀錄</title>
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

<h3>此為所有還沒審核的點數交易紀錄(後台點數轉換管理)</h3>

<!-- 如果別人要從其他頁面進行購買點數的動作，會回到來源網頁 -->
<%-- <a href="<%=request.getContextPath()%>/front-end/tfcord/buyPoint.jsp">點數儲值</a><br> --%>


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
		<tr ${(tfcordVO.tfno == param.tfno) ?  'bgcolor=#CCCCFF' : ''} >
			<td>${tfcordVO.tfno}</td>
			<td>${tfcordVO.mbrno}</td>
			<td>${tfcordVO.tftype == "M" ? "兌現" : "儲值"}</td>
			<td>${tfcordVO.price}</td>
			<td><fmt:formatDate value="${tfcordVO.tftime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			<td>${tfcordVO.tfstatus == 1 ? "已審核" : "未審核"}</td>
			<td>
				<form method="post" action="<%=request.getContextPath()%>/tfcord/TfcordServlet">
					<input type="submit" value="確認審核" ${(tfcordVO.tfstatus == 1) ? "disabled" : "" }>
					<input type ="hidden" name="mbrno" value="${tfcordVO.mbrno}">
					<input type ="hidden" name="tfno" value="${tfcordVO.tfno}">
					<input type ="hidden" name="requestURL" value="<%=request.getServletPath()%>">					
					<input type ="hidden" name="whichPage" value="<%=whichPage%>">					
					<input type ="hidden" name="action" value="changeStatue">
				</form> 
			</td>
		</tr>
	</c:forEach>
	
</table>
<%@ include file="page2.file"%>


</body>
</html>