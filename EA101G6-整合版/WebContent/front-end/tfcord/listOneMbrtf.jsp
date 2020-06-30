<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.tfcord.model.*" %>

<%
 	//String mbrno = request.getParameter("mbrno");
	String mbrno = (String) session.getAttribute("mbrno");
	TfcordService tfcordSvc = new TfcordService();
	List<TfcordVO> list = tfcordSvc.getWhoAll(mbrno);
	pageContext.setAttribute("list", list);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/> <!--要有這條 -->
<title>會員轉換紀錄</title>
</head>
<body>

<h3>此為某會員的所有點數交易紀錄(帳戶管理)</h3>

<a href="<%=request.getContextPath()%>/front-end/tfcord/select_page_Tfcord_front.jsp">回前台點數轉換首頁</a>

<table>
	<tr>
		<th>兌換編號</th>
		<th>兌換種類</th>
		<th>兌換金額</th>
		<th>兌換時間</th>
		<th>兌換狀態</th>
	</tr>
<%@ include file="page1.file" %>
	<c:forEach var="tfcordVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr>
			<td>${tfcordVO.tfno}</td>
			<td>${tfcordVO.tftype == "M" ? "兌現" : "儲值"}</td>
			<td>${tfcordVO.price}</td>
		<%--<td>${tfcordVO.tftime}</td>--%>
			<td><fmt:formatDate value="${tfcordVO.tftime}" pattern="yyyy-MM-dd hh:mm:ss" /></td>
			<td>${(tfcordVO.tfstatus == 0) ? "未處理" : "已通過"}</td>
		</tr>
	</c:forEach>
</table>	
<%@ include file="page2.file" %>	

</body>
</html>