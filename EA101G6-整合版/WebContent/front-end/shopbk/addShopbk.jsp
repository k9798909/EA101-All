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
	
	<title>�s�W����</title>

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

<%-- <%@ include file="/front-end/front-end-nav.jsp" %> --%>

	<table id="table-1">
		<a href="index.jsp"><img src="images/add-icon.png" class="icon">�^����</a>
		<h3>���ѭq��</h3>
	</table>
	<%-- ���~��C --%>
	<%-- 	<c:if test="${not empty errorMsgs}"> --%>
	<!-- 		<font style="color: red">�Эץ��H�U���~:</font> -->
	<!-- 		<ul> -->
	<%-- 			<c:forEach var="message" items="${errorMsgs}"> --%>
	<%-- 				<li style="color: red">${message}</li> --%>
	<%-- 			</c:forEach> --%>
	<!-- 		</ul> -->
	<%-- 	</c:if> --%>

	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/shopbk/shopbk.do">
		<table>
			<tr>
				<td>���a�s��:</td>
				<td><input type="TEXT" name="shopno" size=100%
					value="<%=(shopbkVO == null) ? "" : shopbkVO.getShopno()%>" /></td>
			</tr>
			<tr>
				<td>���ѤH��:</td>
				<td><input type="TEXT" name="ofdtable" size=100%
					value="<%=(shopbkVO == null) ? "" : shopbkVO.getOfdtable()%>" /></td>
			</tr>
			<tr>
				<td>�_:</td>
				<td><input type="TEXT" name="shoppds" size=100% id="f_date1"
					value="<%=(shopbkVO == null) ? "" : shopbkVO.getShoppds()%>" /></td>
			</tr>
			<tr>
				<td>��:</td>
				<td><input type="TEXT" name="shoppde" size=100% id="f_date2"
					value="<%=(shopbkVO == null) ? "" : shopbkVO.getShoppde()%>" /></td>
			</tr>
			<tr>
				<td>�C�p��:</td>
				<td><input type="TEXT" name="payinfohr" size=100%
					value="<%=(shopbkVO == null) ? "" : shopbkVO.getPayinfohr()%>" />��</td>
			</tr>
			<tr>
				<td>�]��:</td>
				<td><input type="TEXT" name="payinfoday" size=100%
					value="<%=(shopbkVO == null) ? "" : shopbkVO.getPayinfoday()%>" />��</td>
			</tr>
		</table>
		<br> <input type="hidden" name="action" value="insert"> <input
			type="submit" value="�e�X�s�W">
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
		step : 30, //step: 60 (�o�Otimepicker���w�]���j60����)
		format : 'Y-m-d H:i',
		value : new Date(),
		//disabledDates:    ['2017/06/08','2017/06/09','2017/06/10'], // �h���S�w���t
		//startDate:	        '2017/07/10',  // �_�l��
		minDate : '-1970-01-01', // �h������(���t)���e
	//maxDate:           '+1970-01-01'  // �h������(���t)����
	});
	$('#f_date2').datetimepicker({
		theme : '', //theme: 'dark',
		timepicker : true, //timepicker: false,
		step : 30, //step: 60 (�o�Otimepicker���w�]���j60����)
		format : 'Y-m-d H:i',
		value : new Date(),
		//disabledDates:    ['2017/06/08','2017/06/09','2017/06/10'], // �h���S�w���t
		//startDate:	        '2017/07/10',  // �_�l��
		minDate : '-1970-01-01', // �h������(���t)���e
	//maxDate:           '+1970-01-01'  // �h������(���t)����
	});
</script>

</html>