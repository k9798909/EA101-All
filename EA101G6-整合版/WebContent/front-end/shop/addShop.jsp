<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.shop.model.*"%>

<%
	ShopVO shopVO = (ShopVO) request.getAttribute("shopVO");
%>
<html>
<head>
<meta charset="utf-8">

<title>���U���a</title>

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
label {
	text-align: left;
}
.icon {
	width: 20px;
	height: 20px;
}

tr:nth-child(odd) {
	background-color: #FFED97;
}

img {
	width:300px;
	height:200px;
}
</style>
</head>
<body bgcolor='white'>

<%@ include file="/front-end/front-end-nav.jsp" %>

	<table id="table-1">
		<a href="index.jsp"><img src="images/add-icon.png"
			class="icon">�^����</a>
		<h3>���a���U</h3>
	</table>
	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" ACTION="shop.do" enctype="multipart/form-data">
		<table>
			<tr>
				<td>���a�b��:</td>
				<td><input type="TEXT" name="shopact" size=100%
					value="<%=(shopVO == null) ? "321" : shopVO.getShopact()%>" /></td>
			</tr>
			<tr>
				<td>���a�K�X:</td>
				<td><input type="TEXT" name="shoppw" size=100%
					value="<%=(shopVO == null) ? "123" : shopVO.getShoppw()%>" /></td>
			</tr>
			<tr>
				<td>���a�W��:</td>
				<td><input type="TEXT" name="shopname" size=100%
					value="<%=(shopVO == null) ? "RRRR" : shopVO.getShopname()%>" /></td>
			</tr>
			<tr>
				<td>���a��m:</td>
				<td><input type="TEXT" name="shoploc" size=100%
					value="<%=(shopVO == null) ? "��饫" : shopVO.getShoploc()%>" /></td>
			</tr>
			<tr>
				<td>���a:</td>
				<td><input type="TEXT" name="shopcy" size=100%
					value="<%=(shopVO == null) ? "10�H��*10" : shopVO.getShopcy()%>" /></td>
			</tr>
			<tr>
				<td>�q��:</td>
				<td><input type="TEXT" name="shopphone" size=100%
					value="<%=(shopVO == null) ? "093040" : shopVO.getShopphone()%>" /></td>
			</tr>
			<tr>
				<td>���a�Ϥ�:</td>
				<td>
					<input type="file" id="myFile" name="shopimg">				
					<div id="preview">
					</div>	
				</td>
			</tr>
			<tr>
				<input type="hidden" name="status" value="0">
			</tr>
		</table>
		<br> <input type="hidden" name="action" value="insert"> <input
			type="submit" value="�e�X�s�W">
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