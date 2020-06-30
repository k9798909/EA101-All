<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.emp.model.*"%>
<%
	EmpService empSvc = new EmpService();
	List<EmpVO> list = empSvc.getAllEmp();
	pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>全部員工</title>

<!-- 此處放css!!!!!! -->

</head>
<body>
<%-- 錯誤列表 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

<%@ include file="/back-end/back-end_nav.jsp" %>
	
	<div class="container">
		<div class="row tm-content-row emptop">
			<div class="tm-col emp">
				<div class="bg-white tm-block">
					<div class="row">
						<div class="col"><!-- 員工清單的標題 -->
							<h2 class="tm-block-title d-inline-block">員工清單</h2>
						</div>
						<div class="col"><!-- 新增員工 -->
							<form method="post" action="<%=request.getContextPath()%>/back-end/emp/addEmp.jsp">
								 <input type="submit" id="addEmp" value="新增員工" >
							</form>
						</div>
					</div>
					<div class="table-responsive">
						<table class="table"><!-- listAll.jsp -->
							<thead>
								<tr class="tabletop">
									<th scope="col">照片</th>
				                    <th scope="col">員工編號</th>
				                    <th scope="col">員工姓名</th>
				                    <th scope="col">Email</th>
				                    <th scope="col">員工權限</th>
				                    <th scope="col">員工狀態</th>
				                    <th scope="col">相關修改</th>
                				</tr>
							</thead>
								<%@ include file="page1.file"%><!-- 引入換頁的程式碼 -->
							<tbody>
								<c:forEach var="empVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex + rowsPerPage-1 %>">
									<tr>
										<td>
											<div class="emp_pic">
												<img src="<%=request.getContextPath()%>/emp/EmpImgServlet?empno=${empVO.empno}">
											</div>
										</td>
										<td>${empVO.empno}</td>
						                <td>${empVO.empname}</td>
						                <td>${empVO.mail}</td>
						                <td>${empVO.sex}</td>
						                <td>${empVO.empstatus}</td>
						                <td>
						                	<form method="post" action="<%=request.getContextPath()%>/emp/EmpServlet">
						                		<input type="submit" value="修改"> 
												<input type="hidden" name="empno" value="${empVO.empno}"> 
												<input type="hidden" name="action" value="getOne_For_Update">
											</form>
						                </td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<%@include file="page2.file"%>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<h4>
		<a href="<%=request.getContextPath()%>/back-end/emp/select_page.jsp">回首頁</a>
	</h4>

</body>
</html>