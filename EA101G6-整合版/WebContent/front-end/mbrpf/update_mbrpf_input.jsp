<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mbrpf.model.*"%>

<%
  MbrpfVO mbrpfVO = (MbrpfVO) request.getAttribute("mbrpfVO"); //MbrpfServlet.java (Concroller) 存入req的mbrpfVO物件 (包括幫忙取出的mbrpfVO, 也包括輸入資料錯誤時的mbrpfVO物件)
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>會員資料修改 - update_mbrpf_input.jsp</title>

<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
  }
  table, th, td {
    border: 0px solid #CCCCFF;
  }
  th, td {
    padding: 1px;
  }
</style>

</head>
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>會員資料修改 - update_mbrpf_input.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<h3>資料修改:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="mbrpf.do" enctype="multipart/form-data">
<table>

	<tr>
		<td>會員頭像:</td>
		<img alt=""src="<%= request.getContextPath()%>/mbrpf/mbrimg.do?mbrno=${mbrpfVO.mbrno}" width="200" height="175" id="demo1">
		<td><input type="FILE" name="mbrimg" onchange="loadFile1(event)" size="45"  /></td>
	</tr>
	<tr>
		<td>會員編號:<font color=red><b>*</b></font></td>
		<td><%=mbrpfVO.getMbrno()%></td>
	</tr>
	<tr>
		<td>會員帳號:</td>
		<td><input type="TEXT" name="mbract" size="45" value="<%=mbrpfVO.getMbract()%>" /></td>
	</tr>
	<tr>
		<td>會員密碼:</td>
		<td><input type="TEXT" name="mbrpw" size="45" value="<%=mbrpfVO.getMbrpw()%>" /></td>
	</tr>
	
	<tr>
		<td>會員姓名:</td>
		<td><input type="TEXT" name="mbrname" size="45" value="<%=mbrpfVO.getMbrname()%>" /></td>
	</tr>
	<tr>
		<td>出生年月日:</td>
		<td><input name="birth" id="f_date1" type="text" value="<%=mbrpfVO.getBirth()%>" ></td>
	</tr>
	<tr>
		<td>性別:</td>
		<td><input type="TEXT" name="sex" size="45" value="<%=mbrpfVO.getSex()%>" /></td>
	</tr>
	<tr>
		<td>電子郵件:</td>
		<td><input type="TEXT" name="mail" size="45" value="<%=mbrpfVO.getMail()%>" /></td>
	</tr>
	<tr>
		<td>電話:</td>
		<td><input type="TEXT" name="phone" size="45" value="<%=mbrpfVO.getPhone()%>" /></td>
	</tr>
	<tr>
		<td>接收款項帳戶:</td>
		<td><input type="TEXT" name="mbrac" size="45" value="<%=mbrpfVO.getMbrac()%>" /></td>
	</tr>
	<tr>
		<td>暱稱:</td>
		<td><input type="TEXT" name="nickname" size="45" value="<%=mbrpfVO.getNickname()%>" /></td>
	</tr>
<!-- 	<tr> -->
<!-- 		<td>點數餘額:</td> -->
<%-- 		<td><input type="TEXT" name="points" size="45" value="<%=mbrpfVO.getPoints()%>" /></td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>一般會員狀態:</td> -->
<%-- 		<td><input type="TEXT" name="status" size="45" value="<%=mbrpfVO.getStatus()%>" /></td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>被評價總人數:</td> -->
<%-- 		<td><input type="TEXT" name="ratedtotal" size="45" value="<%=mbrpfVO.getRatedtotal()%>" /></td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>被評價總星數:</td> -->
<%-- 		<td><input type="TEXT" name="startotal" size="45" value="<%=mbrpfVO.getStartotal()%>" /></td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>未出席次數:</td> -->
<%-- 		<td><input type="TEXT" name="unattend" size="45" value="<%=mbrpfVO.getUnattend()%>" /></td> --%>
<!-- 	</tr> -->
<!-- 	<tr> -->
<!-- 		<td>總參團次數:</td> -->
<%-- 		<td><input type="TEXT" name="ttattend" size="45" value="<%=mbrpfVO.getTtattend()%>" /></td> --%>
<!-- 	</tr> -->
	

	


</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="mbrno" value="<%=mbrpfVO.getMbrno()%>">
<input type="submit" value="送出修改"></FORM>
</body>



<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
</style>
<script type="text/javascript">
	var loadFile1 = function(event){
		var output = document.getElementById("demo1");
		output.src = URL.createObjectURL(event.target.files[0]);
	};
</script>

<script>
        $.datetimepicker.setLocale('zh');
        $('#f_date1').datetimepicker({
           theme: '',              //theme: 'dark',
 	       timepicker:false,       //timepicker:true,
 	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
 	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
 		   value: '<%=mbrpfVO.getBirth()%>', // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
           //startDate:	            '2017/07/10',  // 起始日
           //minDate:               '-1970-01-01', // 去除今日(不含)之前
           //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
        });
        
        
   
        // ----------------------------------------------------------以下用來排定無法選擇的日期-----------------------------------------------------------

        //      1.以下為某一天之前的日期無法選擇
        //      var somedate1 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});

        
        //      2.以下為某一天之後的日期無法選擇
        //      var somedate2 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});


        //      3.以下為兩個日期之外的日期無法選擇 (也可按需要換成其他日期)
        //      var somedate1 = new Date('2017-06-15');
        //      var somedate2 = new Date('2017-06-25');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //		             ||
        //		            date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});
        
</script>
</html>