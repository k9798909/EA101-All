<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.shopbk.model.*"%>
<!DOCTYPE html>
<html>
<head>
<title>�j�M</title>


<style>
body {
	background-position: center;
}
table {
	width: 80%;
	margin-top: 10px;
	margin-left: auto;
	margin-right: auto;
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
h3 {
	margin-left: auto;
	margin-rghit: auto;
}
ul {
	margin-top: 2px;
	margin-left: center;
	margin-right: center;
}
li {
	margin-top: 15px;
}
</style>

</head>


<body>


	<h3 style="margin-left:20px;">��Ƭd��:</h3>
	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<ul>
		<li><a href='listAllShopbk.jsp' >List</a> all shopbks. <br></li>


		<li>
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/shopbk/shopbk.do">
				<b>��J�Q�n�C�����ɶ� :</b> �_<input type="text" name="shoppds" id="f_date1">��<input type="text" name="shoppde" id="f_date2">
				<input type="hidden" name="action" value="getSome_For_Display">
				<input type="submit" value="�e�X">
			</FORM>
		</li>

		<jsp:useBean id="shopbkSvc" scope="page"
			class="com.shopbk.model.ShopbkService" />

		<li>
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/shopbk/shopbk.do">
				<b>�Q�h���a����:</b> <input type="text" name="shopno">
				<input type="hidden" name="action" value="getSome_For_Display">
				<input type="submit" value="�e�X">
			</FORM>
		</li>
	</ul>


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