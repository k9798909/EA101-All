<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.shopbk.model.*"%>
<%@ include file="/front-end/shopbk/front-end-nav.jsp"%>
<%
	ShopbkService shopbkSvc = new ShopbkService();
	String shopno = request.getParameter("shopno");
	List<ShopbkVO> list = shopbkSvc.getShopbkByShop(shopno);
	pageContext.setAttribute("list", list);
	ShopbkVO shopbkVO = (ShopbkVO)request.getAttribute("shopvkVO");
%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">

<style>
table {
	margin-top: 10px;
}

td th tr {
	text-align: center;
}

.icon {
	width: 20px;
	height: 20px;
}

img {
	width: 50px;
	height: 50px;
}

.class {
	margin-left: 200px;
	margin-right: auto;
}

h4 {
	margin-left: 20px;
}

button {
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
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-2">
				<div style="witdh: 20px;">
					<ul class="list-group list-group-item-action">
						<li class="list-group-item list-group-item-action"
							onclick="location.href='<%=request.getContextPath()%>/front-end/shop/shopArea.jsp';">我的資訊</li>
						<li class="list-group-item list-group-item-action" id="goGmlist"
							onclick="location.href='<%=request.getContextPath()%>/front-end/gmlist/addGmlist.jsp';">我的遊戲</li>
						<FORM id="gmlist" METHOD="post"
							ACTION="<%=request.getContextPath()%>/front-end/gmlist/gmlist.do">
							<input type="hidden" name="shopno" value="${shopVO.shopno}">
							<input type="hidden" name="action" value="getSome_For_Display">
						</FORM>
						<li class="list-group-item list-group-item-action active"
							id="goShopbk">我的揪團</li>
						<FORM id="shopbk" METHOD="post"
							ACTION="<%=request.getContextPath()%>/front-end/shopbk/shopbk.do">
							<input type="hidden" name="shopno" value="${shopVO.shopno}">
							<input type="hidden" name="action" value="getSome_For_Display2">
						</FORM>
						<li class="list-group-item list-group-item-action" id="goUpdate">更改店家資料</li>
						<FORM id="getOne_For_Update" METHOD="post"
							ACTION="<%=request.getContextPath()%>/front-end/shop/shop.do">
							<input type="hidden" name="action" value="getOne_For_Update">
						</FORM>
						<li class="list-group-item list-group-item-action" onclick="location.href='<%=request.getContextPath()%>/front-end/room/shop_roomList.jsp';">我的訂位</li>
					</ul>
				</div>
			</div>
			<!-- 		<div class="col-sm-1"></div> -->
			<div class="col-sm-8">
				<div>
				
					<div>
						<button data-toggle="modal" data-target="#exampleModal"
							class="btn btn-primary btn-lg" <c:if test="${shopVO.status!=1}">disabled="disabled"</c:if>>新增</button>
					</div>
				
				
					<table class="table table-sm">
						<tr>
							<th scope="col">提供人數</th>
							<th scope="col">開始時間</th>
							<th scope="col">結束時間</th>
							<th scope="col">以小時計算</th>
							<th scope="col">包日</th>
						</tr>
						<c:forEach var="shopbkVO" items="${list}">
							<tr>
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
		</div>
	</div>

	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content rp-2">
				<div class="modal-header"  style="text-align:center;">
				</div>

				<div class="modal-body">
					<div class="form-group">
						<!-- =========================================以下為原listOneEmp.jsp的內容========================================== -->
						<div class="container">
							<FORM id="create" METHOD="post"
								ACTION="<%=request.getContextPath()%>/front-end/shopbk/shopbk.do">

								<input type="hidden" name="shopno" value="<%=shopno%>" />
								<%-- 					value="<%=(shopbkVO == null) ? "" : shopbkVO.getShopno()%>"  --%>
								<div class="form-row">
									<div class="form-group col-md-4">
										<label for="1">提供人數</label> <input type="TEXT"
											name="ofdtable" class="form-control" id="1" value="<%=(shopbkVO == null) ? "" : shopbkVO.getOfdtable()%>" placeholder="單位:人頭"/>
									</div>
									<div class="form-group col-md-4">
										<label for="2">每小時</label> <input type="TEXT"
											name="payinfohr" class="form-control" id="2" value="<%=(shopbkVO == null) ? "" : shopbkVO.getPayinfohr()%>" placeholder="每小時/元"/>
									</div>
									<div class="form-group col-md-4">
										<label for="3">包日:</label> <input type="TEXT"
											name="payinfoday" class="form-control" id="3"  value="<%=(shopbkVO == null) ? "" : shopbkVO.getPayinfoday()%>" placeholder="整天/元"/>
									</div>
								</div>
								<div class="form-row">
									<div class="form-group col-md-12">
										<label for="f_date1">起:</label> <input type="datetime"
											name="shoppds" id="f_date1" class="form-control"  value="<%=(shopbkVO == null) ? "" : shopbkVO.getShoppds()%>"/>
									</div>
								</div>
								<div class="form-row">
									<div class="form-group col-md-12">
										<label for="f_date2">迄:</label> <input type="datetime"
											name="shoppde" id="f_date2" class="form-control" value="<%=(shopbkVO == null) ? "" : shopbkVO.getShoppde()%>"/>
									</div>
									</div>
								 <input type="hidden" name="action" value="insert">
							</FORM>
						</div>
						<!-- =========================================以上為原listOneEmp.jsp的內容========================================== -->
					</div>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button id="go" type="button" class="btn btn-primary">送出新增</button>
				</div>

			</div>
		</div>
	</div>
	<!-- 	=================================datetimepicker============================ -->
	<%
		java.sql.Timestamp start = null;
		try {
			start = shopbkVO.getShoppds();
		} catch (Exception e) {
			start = new java.sql.Timestamp(System.currentTimeMillis()+ (1000 * 60 * 60 * 96));
		}

		java.sql.Timestamp stop = null;
		try {
			stop = shopbkVO.getShoppde();
		} catch (Exception e) {
			stop = new java.sql.Timestamp(System.currentTimeMillis()+ (1000 * 60 * 60 * 106));
		}
	%>
	<script>
		$.datetimepicker.setLocale('en'); // kr ko ja en
		$('#f_date1').datetimepicker({
			theme : '', //theme: 'dark',
			timepicker : true, //timepicker: false,
			step : 30, //step: 60 (這是timepicker的預設間隔60分鐘)
			format : 'Y-m-d H:i:s',
			value : '<%=start%>',
			//disabledDates:    ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
			//startDate:	        '2017/07/10',  // 起始日
			minDate : '-1969-12-28 00:00:00', // 去除今日(不含)之前
		//maxDate:  '+1970-01-01'  // 去除今日(不含)之後
		});
		$('#f_date2').datetimepicker({
			theme : '', //theme: 'dark',
			timepicker : true, //timepicker: false,
			step : 30, //step: 60 (這是timepicker的預設間隔60分鐘)
			format : 'Y-m-d H:i:s',
			value : '<%=stop%>',
			//disabledDates:    ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
			//startDate:	        '2017/07/10',  // 起始日
			minDate : '-1969-12-28 00:00:00', // 去除今日(不含)之前
// 			maxDate:           '+1970-01-01'  // 去除今日(不含)之後
		});
	</script>
	
	<script>
	<c:if test="${not empty errorMsgs}">	
 	var erromsg="";
	<c:forEach var="erromsg" items="${errorMsgs}">
			erromsg+="${erromsg}\n"
	</c:forEach>
	swal({text:erromsg });
	</c:if>
	</script>
	
	<script>
		$(document).ready(function() {
			$("#go").click(function() {
				$("#create").submit();
			})
			$("#goUpdate").click(function() {
				$("#getOne_For_Update").submit();
			})
			$("#goShopbk").click(function() {
				$("#shopbk").submit();
			})
		})
	</script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</body>
</html>