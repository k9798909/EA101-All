<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.emp.model.*"%>

<!-- EmpServlet.java (Controller) 存入req的empVO物件(req.getAttribute("empVO")) -->
<!-- 包含取出要更新的員工物件，以及輸入錯誤資料時，set進去(包含錯誤資訊)的員工物件empVO -->
<%
	EmpVO empVO = (EmpVO) request.getAttribute("empVO");  
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<link href='https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css' rel='stylesheet'></link>
<link rel="stylesheet" href="./vendors/bootstrap/css/bootstrap.min.css">
<title>員工修改</title>
</head>
<style>
	.empPic{
		height:120px;
		width:120px;
	}
	#upimg{
		border:1px solid black;
		background-color:#EEEEEE;
		cursor:pointer;
	}
	#output{
		height:120px;
		width:120px;
		border:none;
	}
	
	
	
</style>

<!-- 預覽圖片的三步驟 -->
<!-- 1.預覽圖片的js -->
<script>
  var loadFile = function(event) {
    var output = document.getElementById('output');
    output.src = URL.createObjectURL(event.target.files[0]);
    output.onload = function() {
      URL.revokeObjectURL(output.src) // free memory
    }
  };
</script>
<!-- 預覽圖片的js -->

<body>
	<h3>員工修改</h3>
	<h3>此為員工自己想修該資料 和 員工管理員想修改員工的狀態 的頁面</h3>
	<h4>
		<a href="<%=request.getContextPath()%>/back-end/emp/select_page.jsp">回首頁</a>
	</h4>

	<h3>資料修改</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤：</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<form method="post" action="<%=request.getContextPath()%>/emp/EmpServlet" enctype="multipart/form-data">
		<table>
		
			<tr>
				<td>員工照片：</td>
				<td><img class="empPic" src="<%=request.getContextPath()%>/emp/EmpImgServlet?empno=${empVO.empno}"></td>
				<td>
				<label id="upimg" class="btn btn-info">
				<input id="upload_img" style="display:none;" type="file" name="pic" onchange="loadFile(event)">
				<i class="fa fa-photo"></i> 修改圖片									<!-- 2.將type="file"後面註冊一個事件 -->
				</label>
				</td>
				<!-- 3.預覽圖片的圖片放這 -->
				<td><img id="output"/></td>
				<!-- 預覽圖片的圖片放這 -->
			</tr>
			
			<tr>
				<td>員工編號：</td>
				<td><%=empVO.getEmpno()%></td>
			</tr>
			<tr>
				<td>員工姓名：</td>
				<td><input type="text" name="empname" value="<%=empVO.getEmpname()%>"></td>
			</tr>
			<tr>
				<td>信箱：</td>
				<td><input type="email" name="mail" value="<%=empVO.getMail()%>"></td>
			</tr>
			<tr>
				<td>性別：</td>
				<td><input type="radio" name="sex" value="MALE" ${(empVO.sex == "MALE") ? "checked" : "" }>男
				<input type="radio" name="sex" value="FEMALE" ${(empVO.sex == "FEMALE") ? "checked" : "" }>女</td>
			</tr>
			<tr>
				<td>員工狀態：</td>
				<td>
				<select name="empstatus">
					<option value="0" ${(empVO.empstatus == 0) ? "selected" : "" }>離職</option>
					<option value="1" ${(empVO.empstatus == 1) ? "selected" : "" }>在職</option>
					<option value="2" ${(empVO.empstatus == 2) ? "selected" : "" }>未到職</option>
				</select>
				</td>
			</tr>
						<!-- !!!!!!!!!!!!!!!!!!之後會加上如果員工擁有授權管理的權限，才能修改這項的東西!!!!!!!!!!!!! -->

		</table>
		<br>
	<input type="hidden" name="action" value="update">
	<input type="hidden" name="empno" value="<%=empVO.getEmpno()%>">
	<input type="submit" value="送出修改">
	</form>
	
	 
	
	<script src="./vendors/jquery/jquery-3.4.1.min.js"></script>
    <script src="./vendors/popper/popper.min.js"></script>
    <script src="./vendors/bootstrap/js/bootstrap.min.js"></script>	
</body>
</html>