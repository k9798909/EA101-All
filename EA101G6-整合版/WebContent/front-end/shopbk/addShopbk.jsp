<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.shopbk.model.*"%>

<%
	ShopbkVO shopbkVO = (ShopbkVO) request.getAttribute("shopbkVO");
%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<title>新增遊戲</title>

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
	width: 300px;
	height: 200px;
}
</style>
</head>
<body bgcolor='white'>

<%@ include file="/front-end/front-end-nav.jsp" %>

	<table id="table-1">
		<a href="index.jsp"><img src="images/add-icon.png" class="icon">回首頁</a>
		<h3>提供訂位</h3>
	</table>
	<%-- 錯誤表列 --%>
	<%-- 	<c:if test="${not empty errorMsgs}"> --%>
	<!-- 		<font style="color: red">請修正以下錯誤:</font> -->
	<!-- 		<ul> -->
	<%-- 			<c:forEach var="message" items="${errorMsgs}"> --%>
	<%-- 				<li style="color: red">${message}</li> --%>
	<%-- 			</c:forEach> --%>
	<!-- 		</ul> -->
	<%-- 	</c:if> --%>

	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/shopbk/shopbk.do">
		<table>
			<tr>
				<td>店家編號:</td>
				<td><input type="TEXT" name="shopno" size=100%
					value="<%=(shopbkVO == null) ? "" : shopbkVO.getShopno()%>" /></td>
			</tr>
			<tr>
				<td>提供人數:</td>
				<td><input type="TEXT" name="ofdtable" size=100%
					value="<%=(shopbkVO == null) ? "" : shopbkVO.getOfdtable()%>" /></td>
			</tr>
			<tr>
				<td>起:</td>
				<td><input type="TEXT" name="shoppds" size=100% id="f_date1"
					value="<%=(shopbkVO == null) ? "" : shopbkVO.getShoppds()%>" /></td>
			</tr>
			<tr>
				<td>迄:</td>
				<td><input type="TEXT" name="shoppde" size=100% id="f_date2"
					value="<%=(shopbkVO == null) ? "" : shopbkVO.getShoppde()%>" /></td>
			</tr>
			<tr>
				<td>每小時:</td>
				<td><input type="TEXT" name="payinfohr" size=100%
					value="<%=(shopbkVO == null) ? "" : shopbkVO.getPayinfohr()%>" />元</td>
			</tr>
			<tr>
				<td>包日:</td>
				<td><input type="TEXT" name="payinfoday" size=100%
					value="<%=(shopbkVO == null) ? "" : shopbkVO.getPayinfoday()%>" />元</td>
			</tr>
		</table>
		<br> <input type="hidden" name="action" value="insert"> <input
			type="submit" value="送出新增">
	</FORM>
</body>

<link rel="stylesheet" type="text/css"
	href="../../datetimepicker/jquery.datetimepicker.css" />
<script src="../../datetimepicker/jquery.js"></script>
<script src="../../datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
.xdsoft_datetimepicker .xdsoft_datepicker {
	width: 300px; /* width:  300px; */
}

.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
	height: 151px; /* height:  151px; */
}
</style>

<script>
	$.datetimepicker.setLocale('zh'); // kr ko ja en
	$('#f_date1').datetimepicker({
		theme : '', //theme: 'dark',
		timepicker : true, //timepicker: false,
		step : 30, //step: 60 (這是timepicker的預設間隔60分鐘)
		format : 'Y-m-d H:i',
		value : new Date(),
		//disabledDates:    ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
		//startDate:	        '2017/07/10',  // 起始日
		minDate : '-1970-01-01', // 去除今日(不含)之前
	//maxDate:           '+1970-01-01'  // 去除今日(不含)之後
	});
	$('#f_date2').datetimepicker({
		theme : '', //theme: 'dark',
		timepicker : true, //timepicker: false,
		step : 30, //step: 60 (這是timepicker的預設間隔60分鐘)
		format : 'Y-m-d H:i',
		value : new Date(),
		//disabledDates:    ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
		//startDate:	        '2017/07/10',  // 起始日
		minDate : '-1970-01-01', // 去除今日(不含)之前
	//maxDate:           '+1970-01-01'  // 去除今日(不含)之後
	});

</script>
</html>