<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.shop.model.*"%>
<%@ include file="/front-end/front-end-nav.jsp" %>
<%
	java.util.HashMap<String, String> hashmap = (java.util.HashMap<String, String>) request.getAttribute("cityarea");
	ShopVO shopVO = (ShopVO) request.getAttribute("shopVO");
%>
<html>
<head>
<meta charset="utf-8">

	<title>店家修改資料</title>

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




	<h3>資料修改:</h3>


	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/shop/shop.do" name="form1"
		enctype="multipart/form-data">
		<table>
			<tr>
				<td>店家帳號:</td>
				<td><input type="TEXT" name="shopact" size="45"
					value="${shopVO.shopact}" /></td>
			</tr>
			<tr>
				<td>店家密碼:</td>
				<td><input type="password" name="shoppw" size="45"
					value="${shopVO.shoppw}" /></td>
			</tr>
			<tr>
				<td>店家名稱:</td>
				<td><input type="text" name="shopname" size="45"
					value="${shopVO.shopname}" /></td>
			</tr>
			<tr>
				<td>店家位置:</td>
				<td><select name="city" id="縣市1">
				<option value"${city.city}">${city.city}</option></select>
				<select name="area" id="鄉鎮市區1"></select>
				<input type="text" id="ads" name="addr" class="address" value="<%= (hashmap == null)? "":hashmap.get("addr") %>"></td>
				<input id="address" name="address" type="hidden" value="<%= (shopVO == null)? "":shopVO.getShoploc() %>"/>			
			</tr>
			<tr>
				<td>場地:</td>
				<td><input type="TEXT" name="shopcy" size="45"
					value="${shopVO.shopcy}" /></td>
			</tr>
			<tr>
				<td>電話:</td>
				<td><input type="TEXT" name="shopphone" size="45"
					value="${shopVO.shopphone}" /></td>
			</tr>
			<tr>
				<td>店家圖片:</td>
				<td><input type="file" id="myFile" name="shopimg">
					<div type="file" id="preview">
						<img src="<%=request.getContextPath()%>/ShopShowImg?shopno=${shopVO.shopno}" />
					</div></td>
			</tr>
			<input type="hidden" name="status" value="${shopVO.status}" />



		</table>
		<br> <input type="hidden" name="action" value="update"> <input
			type="hidden" name="shopno" value="${shopVO.shopno}">
		<input type="submit" value="送出修改">
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
	
	<c:if test="${not empty errorMsgs}">	
 	var erromsg="";
	<c:forEach var="erromsg" items="${errorMsgs}">
			erromsg+="${erromsg}\n"
	</c:forEach>
	swal({text:erromsg });
	</c:if>


   	window.onload = function () {
   		init();
       //當頁面載完之後，用AddressSeleclList.Initialize()，
       //傳入要綁定的縣市下拉選單ID及鄉鎮市區下拉選單ID
   	 AddressSeleclList.Initialize('縣市1', '鄉鎮市區1'<%= (hashmap == null)? "":",'"+hashmap.get("city")+"'"%><%= (hashmap == null)? "": ",'"+hashmap.get("area")+"'"%>);
     var addressClass = document.getElementsByClassName("address");
     var address = document.getElementById("address");
     
     for (i = 0; i < addressClass.length; i++) {
  	   addressClass[i].addEventListener("change", addressValues);
  	}
     function addressValues(){
	       var city = document.getElementById("縣市1").value;
	       console.log(city);
	       var area = document.getElementById("鄉鎮市區1").value;
	       console.log(area);
	       var location = document.getElementById("ads").value;
	       console.log(location);
	       address.value = city + area + location;
	       console.log(address.value);
     };
  }
   	
   	
</script>
<script
		src="<%=request.getContextPath()%>/js/address2.js"></script>	
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</html>