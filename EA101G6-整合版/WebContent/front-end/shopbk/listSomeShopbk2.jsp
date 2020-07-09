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
div { 
	margin-left: auto;
	margin-right: auto;
 } 
 .class { 
	margin-left: 200px;
	margin-right: auto;
 } 
h4 {
	margin-left: 20px;
}
button{
	margin-left: auto;
	margin-right: auto;
}
.xdsoft_datetimepicker .xdsoft_datepicker {
	width: 300px; /* width:  300px; */
}

.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
	height: 151px; /* height:  151px; */
}
</style>
</head>

<link rel="stylesheet" type="text/css"
	href="../../datetimepicker/jquery.datetimepicker.css" />
<script src="../../datetimepicker/jquery.js"></script>
<script src="../../datetimepicker/jquery.datetimepicker.full.js"></script>
<!-- <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> -->
<body>

<div class="row">
		<div class="col-sm-4"></div></div>
		<div class="col-sm-5">
<div>
<div>
<button data-toggle="modal" data-target="#exampleModal" class="btn btn-primary btn-lg">�s�W</button></div>
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
</div>
</div>



<div class="modal fade" id="exampleModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content rp-2">				
			<div class="modal-header">
                <h3 class="modal-title" id="exampleModalLabel">���ѭq��</h3>
                <hr class="my-3">
            </div>
			
			<div class="modal-body">
				<div class="form-group">
<!-- =========================================�H�U����listOneEmp.jsp�����e========================================== -->
               <FORM id="create" METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/shopbk/shopbk.do">
			<table>
			<input type="hidden" name="shopno" value="<%=shopno%>"/>
<%-- 					value="<%=(shopbkVO == null) ? "" : shopbkVO.getShopno()%>"  --%>
				
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
		<br> <input type="hidden" name="action" value="insert">
	</FORM>

<!-- =========================================�H�W����listOneEmp.jsp�����e========================================== -->
			</div></div>
			
			<div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button id="go" type="button" class="btn btn-primary">�e�X�s�W</button>
            </div>
		
		</div>
	</div>
</div>
<!-- 	=================================datetimepicker============================ -->
	<script>
	$.datetimepicker.setLocale('en'); // kr ko ja en
	$('#f_date1').datetimepicker({
		theme : '', //theme: 'dark',
		timepicker : true, //timepicker: false,
		step : 30, //step: 60 (�o�Otimepicker���w�]���j60����)
		format : 'Y-m-d H:i:s',
		value : new Date(),
		//disabledDates:    ['2017/06/08','2017/06/09','2017/06/10'], // �h���S�w���t
		//startDate:	        '2017/07/10',  // �_�l��
		minDate : '-1970-01-01 00:00:00', // �h������(���t)���e
		//maxDate:  '+1970-01-01'  // �h������(���t)����
	});
	$('#f_date2').datetimepicker({
		theme : '', //theme: 'dark',
		timepicker : true, //timepicker: false,
		step : 30, //step: 60 (�o�Otimepicker���w�]���j60����)
		format : 'Y-m-d H:i:s',
		value : new Date(),
		//disabledDates:    ['2017/06/08','2017/06/09','2017/06/10'], // �h���S�w���t
		//startDate:	        '2017/07/10',  // �_�l��
		minDate : '-1970-01-01 00:00:00', // �h������(���t)���e
	//maxDate:           '+1970-01-01'  // �h������(���t)����
	});
	
	</script>
	<script>
	$(document).ready(function(){
		$("#go").click(function(){
			$("#create").submit();
		})
	})	
	</script>

</body>
</html>