<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/> <!--要有這條 -->
<title>轉換現金</title>
</head>
<body>

<a href="<%=request.getContextPath()%>/front-end/tfcord/select_page_Tfcord_front.jsp">回前台點數轉換首頁</a>

	<form method="post" action="<%=request.getContextPath()%>/tfcord/TfcordServlet">
		請選擇欲轉換多少點數為現金
		<select size="1" name="price">
<!-- 		onmousedown="if(this.options.length>5){this.size=5;}"  onchange='this.size=0;' onblur="this.size=0;" 可以將下拉式選單加上滾輪，但位置怪怪的-->
							<%-- end這邊之後要換${mbr.point} --%>
			<c:forEach var="price" begin="100" end="1000" step="100">
				<option value="${price}">${price}元
			</c:forEach>	
		</select>
		
		<input type="hidden" name="tftype" value="M">
		<input type="hidden" name="tfstatus" value="0">
		<input type="hidden" name="mbrno" value="BM00001">
		<input type="hidden" name="action" value="addTfMoney" >
		<br><input type="submit" value="提領現金">
	</form>
</body>
</html>