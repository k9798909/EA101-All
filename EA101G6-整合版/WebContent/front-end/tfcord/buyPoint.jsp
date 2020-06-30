<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.Date" %>

<%
	java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy");
	//利用SimpleDateFormat定義格式
	
	java.util.Date date = new java.util.Date(System.currentTimeMillis());
	//透過util.Date的System.currentTimeMillis()取得系統當前的時間
	// 	將當前系統時間(ms)傳給sql.Date()
	// 	System.out.println(date); //2020-06-28
	
	String year = df.format(date);
	//並利用DateFormat的format()，將傳進的util.Date轉型成指定格式的字串
	//System.out.println(year); //2020
	
	request.setAttribute("year", year);
%>

<!-- 此處輝先取得會員account，如果沒有代表沒登入過，得先登入才能購買 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/> <!--要有這條 -->
<title>購買點數</title>
</head>
<body>
<!-- 錯誤列表  -->
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤：</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

<a href="<%=request.getContextPath()%>/front-end/tfcord/select_page_Tfcord_front.jsp">回前台點數轉換首頁</a>

<h4>請選擇欲購買之面額</h4>
<form method="post" action="<%=request.getContextPath()%>/tfcord/TfcordServlet">
	<table>
		<tr>
			<td>
				<input type="radio" name="price" value="100" checked>100元
			</td>
			<td>
				<input type="radio" name="price" value="200">200元
			</td>
			<td>
				<input type="radio" name="price" value="300">300元
			</td>
		</tr>
		<tr>
			<td>
				<input type="radio" name="price" value="400">400元
			</td>
			<td>
				<input type="radio" name="price" value="500">500元
			</td>
			<td>
				<input type="radio" name="price" value="600">600元
			</td>
		</tr>
		<tr>
			
		</tr>
	</table>
	<br>
	
	<input type="hidden" name="mbrno" value="BM00001"><!-- 先寫死的員工編號 -->
	<input type="hidden" name="tftype" value="P">
	
	<table>
		<tr>
			<th>信用卡資訊：</th>
		</tr>
		<tr>
			<td>
			<input type="text" name="card1" size="4" maxlength="4" onKeyUp="next(this, 'card2')"> -
			<input type="text" name="card2" size="4" maxlength="4" onKeyUp="next(this, 'card3')"> -
			<input type="text" name="card3" size="4" maxlength="4" onKeyUp="next(this, 'card4')"> -
			<input type="text" name="card4" size="4" maxlength="4" onKeyUp="next(this)">
			</td>
		</tr>
		<tr>
			<th>有效日期：</th><th>CCV：</th>
		</tr>
		<tr>
			<td><select size="1">
				<c:forEach var="month" begin="1" end="12" step="1">
					<option value="${month}">${month}月
				</c:forEach>
			</select>
			
			<select size="1">
				<c:forEach var="year" begin="${year}" end="${year+15}" step="1">
					<option value="${year}">${year}年
				</c:forEach>
			</select></td>
			<td>
				<input type="text" name="ccv" size="3" maxlength="3">
			</td>
		</tr>
	</table>
	
	<input type="hidden" name="tfstatus" value="1">
	
	
	<input type="hidden" name="action" value="addTfcord">	
	<br><input type="submit" value="確認購買">

</form>


<!-- 讓信用卡的text 自動往下一個text移動的js -->
<script>  
	function next(obj,next) {  
	    if (obj.value.length == obj.maxLength)  //注意此處maxLength的大小寫  
	        obj.form.elements[next].focus();      
	}  
</script>

</body>
</html>