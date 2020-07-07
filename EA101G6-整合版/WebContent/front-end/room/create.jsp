<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*"%>
<%@ page import="com.rminfo.model.*"%>
<%@ page import="com.joinrm.model.*"%>

<%
	RminfoService rminfoSvc = new RminfoService();
	List<RminfoVO> list = rminfoSvc.getAll();
	pageContext.setAttribute("list", list);
%>

<%
	RminfoVO rminfoVO = (RminfoVO) request.getAttribute("rminfoVO");
%>

<jsp:useBean id="mbrpfSvc" scope="page" class="com.mbrpf.model.MbrpfService" />
<jsp:useBean id="shopSvc" scope="page" class="com.shop.model.ShopService" />
<jsp:useBean id="joinrmSvc" scope="page" class="com.joinrm.model.JoinrmService" /> 

<!DOCTYPE html>
<html>
<head>
<title>房間列表+開房+加入</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>
<script type="text/javascript"> var jQuery_1_12_2 = $.noConflict(true); </script>

</head>

<body>

<%@ include file="/front-end/front-end-nav.jsp"%>
<!-- 開團表單 -->
	<div id="dialog-form" title="設定揪團資訊">
		<!-- 	<p class="validateTips">All form fields are required.</p> -->
		<p>有*為必填欄位</p>
		<c:if test="${not empty errorMsgs}">
			<font style="color: red">請修正以下錯誤:</font>
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li style="color: red">${message}</li>
				</c:forEach>
			</ul>
		</c:if>
		<form id="myMBRform" METHOD="post" ACTION="rminfo.do">
			<fieldset>
				<label for="mbrno">主揪: </label> 
				<input readonly type="text"	name="mbrno" id="mbrno" value="BM00001" class="text ui-widget-content ui-corner-all"> 
				<label for="naming">*房名: </label>	
				<input type="text" name="naming" id="naming" value="BM00001的房間" class="text ui-widget-content ui-corner-all">
				*地點:
				<select name="shopno">
					<c:forEach var="shopVO" items="${shopSvc.getAll()}">
						<option value="${shopVO.shopno}">${shopVO.shopname}
					</c:forEach>
				</select><br><br>
				
				*人數限制: 
				<select name="lowlimit" id="lowlimit">
					<%for (int i = 2; i <= 20; i++) {%>
					<option value="<%=i%>"><%=i%></option>
					<%}%>
				</select> 
				<font>~</font> 
				<select name="uplimit" id="uplimit" value="4">
					<%
						for (int i = 2; i <= 20; i++) {
					%>
					<%
						if (i == 4) {
					%>
					<option value="<%=i%>" selected><%=i%></option>
					<%
						}
					%>
					<option value="<%=i%>"><%=i%></option>
					<%
						}
					%>
				</select> <font>人</font><br> <br> <label for="starttime">*遊玩開始時間</label>
				<input type="text" name="starttime" id="f_date2"
					class="text ui-widget-content ui-corner-all"> <label
					for="endtime">*遊玩結束時間</label> <input type="text" name="endtime"
					id="f_date3" class="text ui-widget-content ui-corner-all">
				*預計玩的遊戲: <br>
				<textarea placeholder="輸入想玩的遊戲 EX:卡卡頌" required="required"
					name="game" maxlength="50"
					style="resize: none; width: 280px; height: 60px;"><c:if
						test="${not empty requestScope.rminfoVO}">${requestScope.rminfoVO.game}</c:if></textarea>
				<br> <br> *加入是否需審核: 
				<select name="confirmed">
					<option value="0">否</option>
					<option value="1">是</option>
				</select><br> <br> *評價限制: <select name="restriction">
					<option value="0">無</option>
					<%
						for (int i = 1; i <= 5; i++) {
					%>
					<option value="<%=i%>"><%=i%></option>
					<%
						}
					%>
				</select><br> <br> 備註: <br>
				<textarea name="remarks" maxlength="100"
					style="resize: none; width: 280px; height: 120px;"></textarea>

				<input type="hidden" name="action" value="insert">
				<!--  	  <input type="submit" value="送出新增"> -->
				<!-- Allow form submission with keyboard without duplicating the dialog button -->
				<!--       <input type="submit" tabindex="-1" style="position:absolute; top:-1000px"> -->
			</fieldset>
		</form>
	</div>


	<div id="users-contain" class="ui-widget">
		<h3>房間列表:</h3>
		<button id="create-user" type="button" class="btn btn-info btn-lg">我要開團</button>
	</div>

<!-- 房間列表 -->
<div id="allCard">
	<c:forEach var="rminfoVO" items="${list}">
		<div class='card' id="${rminfoVO.rmno}_info">
			<div>
				<form METHOD="post" ACTION="joinrm.do">
					<input type="hidden" name="rmno" value="${rminfoVO.rmno}">
					<input type="hidden" name="mbrno" value="BM00001"> 
					<input type="hidden" name="action" value="insert"> 
					<input class="btn btn-danger btn-sm" type="submit" value="加入">
				</form>				
			</div>
			<div id="dialog3_${rminfoVO.rmno}" title="成員列表">
				<jsp:include page="/front-end/room/roomMember.jsp"><jsp:param name="rmno" value="${rminfoVO.rmno}" /></jsp:include>
			</div>
<script>
(function($){
  $( function() {
    $( "#dialog3_${rminfoVO.rmno}" ).dialog({
      autoOpen: false,
      show: {
        effect: "blind",
        duration: 1000
      },
      hide: {
        effect: "explode",
        duration: 1000
      }
    });
 
    $( "#opener3_${rminfoVO.rmno}" ).on( "click", function() {
      $( "#dialog3_${rminfoVO.rmno}" ).dialog( "open" );
    });
  } );
  
})(jQuery_1_12_2);  
 </script>
			<div class='roomtitle'>
				<span class='titleType'><b>${rminfoVO.naming}</b></span>
			</div>
			<div>房主: ${rminfoVO.mbrno}<button class="btn btn-outline-info btn-sm" id="opener3_${rminfoVO.rmno}">成員列表</button></div>
			<div>遊玩店家: ${shopSvc.getOneShop(rminfoVO.shopno).shopname}</div>
			<div>
				人數限制:
				${rminfoVO.lowlimit}~${rminfoVO.uplimit}人&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				${fn:length(joinrmSvc.findByPK(rminfoVO.rmno,''))}/${rminfoVO.uplimit}
			</div>
			<div>
				遊玩時間:
				<fmt:formatDate value="${rminfoVO.starttime}"
					pattern="yyyy-MM-dd HH:mm" />
				~
				<fmt:formatDate value="${rminfoVO.endtime}" pattern="HH:mm" />
			</div>
			<div>預計玩的遊戲: ${rminfoVO.game}</div>
			<div>
				報名截止時間:
				<fmt:formatDate value="${rminfoVO.cutoff}"
					pattern="yyyy-MM-dd HH:mm:ss" />
			</div>
			<div>評價限制: ${(rminfoVO.restriction == '0')?'無':rminfoVO.restriction}</div>
			<div>加入是否需審核: ${(rminfoVO.confirmed == '0')?'否':'是'}</div>
			<div class="remark">備註: ${rminfoVO.remarks}</div>
		</div>

	</c:forEach>
</div>	
</body>
<%
	java.sql.Timestamp starttime = null;
	try {
		starttime = rminfoVO.getStarttime();
	} catch (Exception e) {
		starttime = new java.sql.Timestamp(
				(System.currentTimeMillis() / 1800000) * 1800000 + (1000 * 60 * 60 * 72));
	}
%>
<%
	java.sql.Timestamp endtime = null;
	try {
		endtime = rminfoVO.getEndtime();
	} catch (Exception e) {
		endtime = new java.sql.Timestamp(
				(System.currentTimeMillis() / 1800000) * 1800000 + (1000 * 60 * 60 * 75));
	}
%>
<script>
(function($){
        $.datetimepicker.setLocale('zh');
        $('#f_date2').datetimepicker({
	       theme: '',              //theme: 'dark',
// 	       timepicker:false,       
	       timepicker:true,
	       step: 30,                //step: 60 (這是timepicker的預設間隔60分鐘)
// 	       format:'Y-m-d',         
			format:'Y-m-d H:i:s',
		   value: '<%=starttime%>', 
		   // value:   new Timestamp(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
           //startDate:	            '2017/07/10',  // 起始日
           minDate:               '-1970-01-01', // 去除今日(不含)之前
           //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
        });        

        $.datetimepicker.setLocale('zh');
        $('#f_date3').datetimepicker({
	       theme: '',              //theme: 'dark',
// 	       timepicker:false,       
	       timepicker:true,
	       step: 30,                //step: 60 (這是timepicker的預設間隔60分鐘)
// 	       format:'Y-m-d',         
			format:'Y-m-d H:i:s',
		   value: '<%=endtime%>',
		// value:   new Timestamp(),
		//disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
		//startDate:	            '2017/07/10',  // 起始日
		minDate : '-1970-01-01', // 去除今日(不含)之前
	//maxDate:               '+1970-01-01'  // 去除今日(不含)之後
	});
        
       
        	  $( function() {
        	    var dialog, form,
        	 
        	      mbrno = $( "#mbrno" ),
        	      naming = $( "#naming" ),
        	      shopno = $( "#shopno" ),
        	      lowlimit = $( "#lowlimit" ),
        	      uplimit = $( "#uplimit" ),
        	      starttime = $( "#starttime" ),
        	      endtime = $( "#endtime" ),
        	      game = $( "#game" ),
        	      cutoff = $( "#cutoff" ),
        	      remarks = $( "#remarks" ),     
        	      restriction = $( "#restriction" ),
        	      confirmed = $( "#confirmed" ),
        	      
        	      allFields = $( [] ).add( mbrno ).add( naming ).add( shopno ).add( lowlimit ).add( uplimit ).add( starttime )
        	      .add( endtime ).add( game ).add( cutoff ).add( remarks ).add( restriction ).add( confirmed ),
        	      tips = $( ".validateTips" );
        	 
        	    function updateTips( t ) {
        	      tips
        	        .text( t )
        	        .addClass( "ui-state-highlight" );
        	      setTimeout(function() {
        	        tips.removeClass( "ui-state-highlight", 1500 );
        	      }, 500 );
        	    }
        	 	
        	    function addUserXX() {
        	 		$('#myMBRform').submit();
        	 	}
        	 	
        	    dialog = $( "#dialog-form" ).dialog({
        	      autoOpen: false,
        	      height: 500,
        	      width: 350,
        	      modal: true,
        	      buttons: {
        	        "建立房間": addUserXX,
        	        "取消": function() {
        	          dialog.dialog( "close" );
        	        }
        	      },
        	      close: function() {
//        	     	$('#myMBRform')[0].reset();
        	        allFields.removeClass( "ui-state-error" );
        	      }
        	    });
        	 
        	    $( "#create-user" ).button().on( "click", function() {
        	      dialog.dialog( "open" );
        	    });
        	  } );


	dialog2 = $("#dialog-form")
	
	$(window).load(function() {
		<c:if test="${not empty errorMsgs}">
			dialog2.dialog("open");
		</c:if>
	});
})(jQuery_1_12_2);  	
</script>
<script>
	var cards = document.getElementsByClassName('card');
	for(var i = 0; i < cards.length; i++){
		var r = Math.floor((Math.random()*4)+1);
		cards[i].style.backgroundImage="url(<%=request.getContextPath()%>/image/poker" + r +".jpg)";
	}
</script>
<style>
body{
   	background-image: url('<%=request.getContextPath()%>/images/bg4.png');
  }
  
#allCard{
	margin:50px 5% 50px 15%;
	width:80%;
}
#create-user{
	float:right;
	display: inline;
	margin:15px 70px;
}
.btn-danger{
	float:right;
	margin:10px 5px;
}
.btn-outline-info{
	float:right;
	margin:0px 5px;
}
#form {
	display: none;
}

label, input {
	display: block;
}

input.text {
	margin-bottom: 12px;
	width: 95%;
	padding: .4em;
}

fieldset {
	padding: 0;
	border: 0;
	margin-top: 25px;
}

h3 {
	margin: .6em 50px;
	display: inline-block;
	color:red;
}

div#users-contain {
	width: 90%;
	margin: 20px 10px;
}

div#users-contain table {
	margin: 1em 0;
	border-collapse: collapse;
	width: 100%;
}

div#users-contain table th {
	border: 1px solid #eee;
	padding: .6em 10px;
	text-align: left;
}

div#users-contain table td {
	border: 1px solid #eee;
	padding: .6em 10px;
	text-align: center;
}

.ui-dialog .ui-state-error {
	padding: .3em;
}

.validateTips {
	border: 1px solid transparent;
	padding: 0.3em;
}

.roomtitle {
	background:;
	font: 20px fantasy;
	width: 312px;
	height: 34px;
	margin: 60px 0px 30px 25px;
	padding: 10px 16px;
	text-align: center;
}
.card {
	width: 344px;
	height: 440px;
	display: inline-block;
	margin: 25px;
	background-size: 395px 490px;
	background-position: -25px -30px; 
	border: none;
}

.card div {
	padding:0px 30px;
}
.remark{
	width:100%;
	height:20%;
	overflow: auto;
}
</style>
</html>