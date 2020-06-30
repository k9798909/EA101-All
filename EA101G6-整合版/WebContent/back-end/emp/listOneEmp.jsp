<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.emp.model.*"%>

<!-- 下方可以getAttribute，是因為EmpServlet有存放empVO 【req.setAttribute("empVO", empVO);】 EmpServlet的69行 -->
<%
	EmpVO empVO = (EmpVO) request.getAttribute("empVO");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>員工資料</title>
</head>

<!-- 這邊放css!!!!!!!!!!!!!! -->
<style>
	.empPic{
		height:80px;
		width:80px;
	}
</style>
<body>
	<h3>員工資料</h3>
	<h4>
		<a href="<%= request.getContextPath()%>/back-end/emp/select_page.jsp">回首頁</a>
	</h4>

	<table>
		<tr>
			<th>員工照片</th>
			<th>員工編號</th>
			<th>員工姓名</th>
			<th>信箱</th>
			<th>性別</th>
			<th>員工狀態</th>
			<th>修改</th>
		</tr>
		<tr>
			<th><img class="empPic" src="<%=request.getContextPath()%>/emp/EmpImgServlet?empno=${empVO.empno}"></th>        
			<th><%=empVO.getEmpno() %></th>
			<th><%=empVO.getEmpname() %></th>
			<th><%=empVO.getMail() %></th>
			<th><%=empVO.getSex() %></th>
			<th><%=(empVO.getEmpstatus() == 0)? "離職" : (empVO.getEmpstatus() == 1)? "在職" : "未到職"%></th>
			<th>
				<form method="post" action="<%=request.getContextPath()%>/emp/EmpServlet">
					<input type="submit" value="修改"> 
					<input type="hidden" name="empno" value="${empVO.empno}"> 
					<input type="hidden" name="action" value="getOne_For_Update">
				</form>
			</th>
		</tr>
	</table>
</body>
</html>