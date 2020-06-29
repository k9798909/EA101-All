<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.game.model.*"%>

<%
// 	GameService gameSvc = new GameService();
	GameVO gameVO = (GameVO) request.getAttribute("gameVO"); //gameServlet.java (Concroller) �s�Jreq��gameVO���� (�]�A�������X��gameVO, �]�]�A��J��ƿ��~�ɪ�shopVO����)
%>

<!doctype html>
<html lang="en">
<head>

<meta charset="utf-8">

	<title>�C���C��</title>

	<style>
table {
	margin-top: 10px;
}

tr th {
	border: 2px solid black;
	text-align: center;
}

td {
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
	height: 300px;
}

h4 {
	margin-left: 20px;
}
</style>

<body>

<%@ include file="/front-end/front-end-nav.jsp" %>

</head>
<h4>
	<a href="../shop/index.jsp"><img src="images/add-icon.png" class="icon">�^����</a>
</h4>

<%-- <jsp:include page="select_page.jsp" flush="true"> --%>
<%-- 	<jsp:param name="" value="" /> --%>
<%-- </jsp:include> --%>

<table>
	<tr style="background-color: #FFFFFF; border: 0px; font:;">
		<td style="background-color: #FFFFFF; border: 0px;">
			<h3>�C���C��</h3>
		</td>
	</tr>
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
<div>


	<h3>��ƭק�:</h3>

	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" ACTION="game.do" name="form1"
		enctype="multipart/form-data">
		<table>
			<input type="hidden" name="gmno" value="<%=gameVO.getGmno()%>" />
			<tr>
				<td>�C���W��:</td>
				<td><input type="TEXT" name="gmname" size="45"
					value="<%=gameVO.getGmname()%>" /></td>
			</tr>
			<tr>
				<td>�C���Ϥ�:</td>
				<td><input type="file" id="myFile" name="gmimg">
					<div type="file" id="preview">
						<img src="<%=request.getContextPath()%>/GameShowImg?gmno=${gameVO.gmno}" />
					</div></td>
			</tr>



		</table>
		<br> <input type="hidden" name="action" value="update"> <input
			type="hidden" name="shopno" value="<%=gameVO.getGmno()%>">
		<input type="submit" value="�e�X�ק�">
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
						preview.innerHTML='';
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