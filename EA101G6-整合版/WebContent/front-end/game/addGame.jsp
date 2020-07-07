<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.game.model.*"%>

<%
	GameVO gameVO = (GameVO) request.getAttribute("gameVO");
%>

<html>
<head>
<meta charset="utf-8">

	<title>�s�W�C��</title>

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
<%@ include file="/front-end/front-end-nav.jsp" %>
</head>

<body bgcolor='white'>

	<table id="table-1">
		<a href="index.jsp"><img src="images/add-icon.png"
			class="icon">�^����</a>
		<h3>�W�[�C��</h3>
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

	<FORM METHOD="post" ACTION="game.do" enctype="multipart/form-data">
		<table>
			<tr>
				<td>�C���W��:</td>
				<td><input type="TEXT" name="gmname" size=100%
					value="<%=(gameVO == null) ? "" : gameVO.getGmname()%>" /></td>
			</tr>
			<tr>
				<td>�C���Ϥ�:</td>
				<td>
					<input type="file" id="myFile" name="gmimg">				
					<div id="preview">
					</div>	
				</td>
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