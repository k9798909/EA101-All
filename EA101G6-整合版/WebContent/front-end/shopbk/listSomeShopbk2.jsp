<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.shopbk.model.*"%>
<%@ include file="/front-end/front-end-nav.jsp" %>
<%
	ShopbkService shopbkSvc = new ShopbkService();
	String shopno = request.getParameter("shopno");
	List<ShopbkVO> list = shopbkSvc.getShopbkByShop(shopno);
	pageContext.setAttribute("list", list);
// 	ShopVO ssVO = (ShopVO)session.getAttribute("shopVO");
// 	pageContext.setAttribute("ssVO", ssVO);
// 	ShopbkVO shopbkVO = (ShopbkVO) request.getAttribute("shopbkVO");
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
	width: 50px;
	height: 50px;
}

h4 {
	margin-left: 20px;
}
</style>
</head>

<body>

<div class="row">
		<div class="col-sm-4"></div></div>
		<div class="col-sm-5">
<div>

	<table>
		<tr>
			<th>���a�s��</th>
			<th>���ѤH��</th>
			<th>�}�l�ɶ�</th>
			<th>�����ɶ�</th>
			<th>�H�p�ɭp��</th>
			<th>�]��</th>
		</tr>
		<c:forEach var="shopbkVO" items="${list}">
			<tr>
				<td>${shopbkVO.shopno}</td>
				<td>${shopbkVO.ofdtable}</td>
				<td>${shopbkVO.shoppds}</td>
				<td>${shopbkVO.shoppde}</td>
				<td>${shopbkVO.payinfohr}</td>
				<td>${shopbkVO.payinfoday}</td>
			</tr>
		</c:forEach>
	</table>
</div></div>


<button data-toggle="modal" data-target="#exampleModal">�s�W</button>
<div class="modal fade" id="exampleModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
				
			<div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h3 class="modal-title" id="myModalLabel">The Bootstrap modal-header</h3>
            </div>
			
			<div class="modal-body">
<!-- =========================================�H�U����listOneEmp.jsp�����e========================================== -->
               <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/shopbk/shopbk.do">
		<table>
			<tr>
				<td>���a�s��:</td>
				<td><input type="TEXT" name="shopno" 
<%-- 					value="<%=(shopbkVO == null) ? "" : shopbkVO.getShopno()%>"  --%>
					/></td>
			</tr>
			<tr>
				<td>���ѤH��:</td>
				<td><input type="TEXT" name="ofdtable"
<%-- 					value="<%=(shopbkVO == null) ? "" : shopbkVO.getOfdtable()%>"  --%>
					/></td>
			</tr>
			<tr>
				<td>�_:</td>
				<td><input type="TEXT" name="shoppds"  id="f_date1"
<%-- 					value="<%=(shopbkVO == null) ? "" : shopbkVO.getShoppds()%>"  --%>
					/></td>
			</tr>
			<tr>
				<td>��:</td>
				<td><input type="TEXT" name="shoppde"  id="f_date2"
<%-- 					value="<%=(shopbkVO == null) ? "" : shopbkVO.getShoppde()%>"  --%>
					/></td>
			</tr>
			<tr>
				<td>�C�p��:</td>
				<td><input type="TEXT" name="payinfohr" 
<%-- 			value="<%=(shopbkVO == null) ? "" : shopbkVO.getPayinfohr()%>"  --%>
				/>��</td>
			</tr>
			<tr>
				<td>�]��:</td>
				<td><input type="TEXT" name="payinfoday" 
<%-- 					value="<%=(shopbkVO == null) ? "" : shopbkVO.getPayinfoday()%>"  --%>
					/>��</td>
			</tr>
		</table>
		<br> <input type="hidden" name="action" value="insert"> <input
			type="submit" value="�e�X�s�W">
	</FORM>
<!-- 	=================================datetimepicker============================ -->
	<script>
	$.datetimepicker.setLocale('en'); // kr ko ja en
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
<!-- =========================================�H�W����listOneEmp.jsp�����e========================================== -->
			</div>
			
			<div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
            </div>
		
		</div>
	</div>
</div>

</body>
</html>