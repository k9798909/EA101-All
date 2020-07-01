<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.shop.model.*"%>
<%@ include file="/front-end/front-end-nav.jsp" %>

<html>
<head>
<meta charset="utf-8">

	<title>店家修改資料</title>

	<style>
table {
	margin-top: 10px;
}

tr th {
	border: 2px solid black;
	text-align: center;
}

td {
	border: 2px solid black;
	text-align: center;
}

.icon {
	width: 20px;
	height: 20px;
}

tr:nth-child(odd) {
	background-color: #FFED97;
}

img {
	width: 300px;
	height: 200px;
}
</style>
</head>
<body bgcolor='white'>



	<table>
		<h4>
			<a href="index.jsp"><img src="images/add-icon.png" class="icon">回首頁</a>
		</h4>
	</table>

	<h3>資料修改:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" ACTION="shop.do" name="form1"
		enctype="multipart/form-data">
		<table>
			<tr>
				<td>店家編號:</td>
				<td>${shopVO.shopno}</td>
			</tr>
			<tr>
				<td>店家帳號:</td>
				<td><input type="TEXT" name="shopact" size="45"
					value="${shopVO.shopact}" /></td>
			</tr>
			<tr>
				<td>店家密碼:</td>
				<td><input type="password" name="shoppw" size="45"
					value="${shopVO.shoppw}" /></td>
			</tr>
			<tr>
				<td>店家名稱:</td>
				<td><input type="text" name="shopname" size="45"
					value="${shopVO.shopname}" /></td>
			</tr>
			<tr>
				<td>位置:</td>
				<td><input type="TEXT" name="shoploc" size="45"
					value="${shopVO.shoploc}" /></td>
			</tr>
			<tr>
				<td>場地:</td>
				<td><input type="TEXT" name="shopcy" size="45"
					value="${shopVO.shopcy}" /></td>
			</tr>
			<tr>
				<td>電話:</td>
				<td><input type="TEXT" name="shopphone" size="45"
					value="${shopVO.shopphone}" /></td>
			</tr>
			<tr>
				<td>店家圖片:</td>
				<td><input type="file" id="myFile" name="shopimg">
					<div type="file" id="preview">
						<img src="<%=request.getContextPath()%>/ShopShowImg?shopno=${shopVO.shopno}" />
					</div></td>
			</tr>
			<input type="hidden" name="status" value="${shopVO.status}" />



		</table>
		<br> <input type="hidden" name="action" value="update"> <input
			type="hidden" name="shopno" value="${shopVO.shopno}">
		<input type="submit" value="送出修改">
	</FORM>
</body>



<script>
	function init() {
		var myFile = document.getElementById("myFile");
		var filename = document.getElementById("filename");
		var preview = document.getElementById('preview');
		myFile.addEventListener('change', function(e) {
			var files = myFile.files;
			if (files !== null && files.length > 0) {
				var file = files[0];
				if (file.type.indexOf('image') > -1) {
					// 					filename.value = file.name;
					var reader = new FileReader();
					reader.addEventListener('load', function(e) {
						var result = e.target.result;
						console.log(result);
						var img = document.createElement('img');
						img.src = result;
						preview.innerHTML="";
						preview.append(img);
					});
					reader.readAsDataURL(file);
				}
			}
		});
	}
	window.onload = init;
</script>
</html>