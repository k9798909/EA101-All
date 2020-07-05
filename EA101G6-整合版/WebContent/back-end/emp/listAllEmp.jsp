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

<style type="text/css">
	.table{
		text-align:center;
	}
	.emptext{
		text-align: center;
	}
</style>


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
				<div class="row">
					<div class="col emptext">
						<form method="post" action="<%=request.getContextPath()%>/emp/EmpServlet" enctype="multipart/form-data">
																									<!-- ↑如果有檔案的傳送，一定要加這條 -->
							<b>請輸入員工編號(ex:LE00001)：</b> <input type="text" name="empno">
							<input type="hidden" name="action" value="getOne_For_Display">  <!-- name是給後端傳資料用的，controller用getParameter接 -->
							<input type="submit" value="送出">
						</form>
					</div>
					<div class="col emptext">
						<form method="post" action="<%=request.getContextPath()%>/emp/EmpServlet" enctype="multipart/form-data">
																									<!-- ↑如果有檔案的傳送，一定要加這條 -->
							<b>請輸入員工姓名：</b> <input type="text" name="empname"> 
							<input type="hidden" name="action" value="getOneName_For_Display">  <!-- name是給後端傳資料用的，controller用getParameter接 -->
							<input type="submit" value="送出">
						</form>																		
					</div>
				</div>
				<br>
				<div class="bg-white tm-block">
					<!-- 員工清單的區塊 -->
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
					<div class="table-responsive"> <!--table-striped：將畫面一行灰色，一行白色-->
						<table class="table"><!-- listAll.jsp -->
							<thead>
								<tr class="tabletop">
									<th scope="col">照片</th>
				                    <th scope="col">員工編號</th>
				                    <th scope="col">員工姓名</th>
				                    <th scope="col">Email</th>
				                    <th scope="col">員工性別</th>
				                    <th scope="col">員工狀態</th>
				                    <th scope="col">相關修改</th>
                				</tr>
							</thead>
								<%@ include file="page1.file"%><!-- 引入換頁的程式碼 -->
							<tbody>
								<c:forEach var="empVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex + rowsPerPage-1 %>">
									<tr>
										<td class="align-middle">
											<div class="emp_pic align-middle">
												<img src="<%=request.getContextPath()%>/emp/EmpImgServlet?empno=${empVO.empno}">
											</div>
										</td>
										<td  class="align-middle">${empVO.empno}</td>
						                <td  class="align-middle">${empVO.empname}</td>
						                <td  class="align-middle">${empVO.mail}</td>
						                <td  class="align-middle">${empVO.sex}</td>
						                <td  class="align-middle">${(empVO.empstatus== 0)? "離職" : (empVO.getEmpstatus() == 1)? "在職" : "未到職"}</td>
						                <td  class="align-middle">
						                	<form method="post" action="<%=request.getContextPath()%>/emp/EmpServlet">
						                		<input type="submit" value="修改" class="btn-outline-secondary" style="border:1px solid;color:black;"> 
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

</body>
</html>