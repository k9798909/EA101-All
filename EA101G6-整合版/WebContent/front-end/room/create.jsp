<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script
	src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>
<style>
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

h1 {
	font-size: 1.2em;
	margin: .6em 0;
}

div#users-contain {
	width: 1200px;
	margin: 20px 0;
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
	margin: 80px 0px 11px;
	padding: 10px 16px;
	text-align: center;
}

.card {
	background-image: url("../image/p1.jpg");
	/*    			border: 1px black solid; */
	width: 344px;
	height: 440px;
	display: inline-block;
	margin: 10px;
	background-size: 385px 470px;
	background-position: -10px -20px;
}

.card div {
	padding: 2px 15px;
}
</style>
<script>
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
 
//     function addUser() {
//       var valid = true;
//       allFields.removeClass( "ui-state-error" );
 
//       if ( valid ) {
//         $( "#users-contain h1" ).append( "<div class='card'>" +
//           "<div class='roomtitle'>" + "<span class='titleType'>" + "<b>" + naming.val() + "</b>" + "</div>" +
//           "<div> 房主: " + mbrno.val() + "</div>" +        
//           "<div> 遊玩店家: " + shopno.val() + "</div>" +
//           "<div> 人數限制: " + lowlimit.val() + "~" + uplimit.val() +"人&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;" + "<span text-align:right>" + "1/" + uplimit.val() + "</span>" + "</div>" +
//           "<div> 遊玩時間: " + starttime.val() + "~" + endtime.val().substring(11) + "</div>" +
//           "<div> 預計玩的遊戲: " + game.val() + "</div>" +
//           "<div> 報名截止時間: " + cutoff.val() + "</div>" +
//           "<div> 備註: " + remarks.val() + "</div>" +
//           "<div> 評價限制: " + restriction.val() + "</div>" +
//           "<div> 加入是否需審核: " + confirmed.val() + "</div>" +
//         "</div>" );
//         dialog.dialog( "close" );
//       }
//       return valid;
//     }
 	
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
//     	$('#myMBRform')[0].reset();
        allFields.removeClass( "ui-state-error" );
      }
    });
 
//     form = dialog.find( "form" ).on( "submit", function( event ) {
//       event.preventDefault();
//       addUser();
//     });
 
    $( "#create-user" ).button().on( "click", function() {
      dialog.dialog( "open" );
    });
  } );
  </script>


</head>
<body onload="hasError()">

<%@ include file="/front-end/front-end-nav.jsp"%>

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
				<label for="mbrno">主揪: </label> <input readonly type="text"
					name="mbrno" id="mbrno" value="BM00001"
					class="text ui-widget-content ui-corner-all"> <label
					for="naming">*房名: </label> <input type="text" name="naming"
					id="naming" value="BM00001的房間"
					class="text ui-widget-content ui-corner-all"> <label
					for="shopno">*地點: </label> <input type="text" name="shopno"
					id="shopno" value="DS00001"
					class="text ui-widget-content ui-corner-all"> *人數限制: <select
					name="lowlimit" id="lowlimit">
					<%
						for (int i = 2; i <= 20; i++) {
					%>
					<option value="<%=i%>"><%=i%></option>
					<%
						}
					%>
				</select> <font>~</font> <select name="uplimit" id="uplimit" value="4">
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
				<br> <br> *加入是否需審核: <select name="confirmed">
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
		<h1>房間列表:</h1>
		<button id="create-user">我要開團</button>
	</div>


	<c:forEach var="rminfoVO" items="${list}">
		<div class='card' id="${rminfoVO.rmno}_info">
			<div>
				<form METHOD="post" ACTION="joinrm.do">
					<input type="hidden" name="rmno" value="${rminfoVO.rmno}">
					<input type="hidden" name="mbrno" value="BM00001"> 
					<input type="hidden" name="action" value="insert"> 
					<input type="submit" value="加入">
				</form>

				<form METHOD="post" ACTION="joinrm.do">
					<input type="hidden" name="rmno" value="${rminfoVO.rmno}">
					<input type="hidden" name="action" value="listInfo"> 
					<input type="submit" value="房內成員清單">
				</form>
			</div>
			<div class='roomtitle'>
				<span class='titleType'><b>${rminfoVO.naming}</b>
			</div>
			<div>房主: ${rminfoVO.mbrno}</div>
			<div>遊玩店家: ${rminfoVO.shopno}</div>
			<div>
				人數限制:
				${rminfoVO.lowlimit}~${rminfoVO.uplimit}人&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				<span id="${rminfoVO.rmno}_people">0</span>/${rminfoVO.uplimit}
				<form METHOD="post" ACTION="joinrm.do" id="${rminfoVO.rmno}_form">
					<input type="hidden" name="rmno" value="${rminfoVO.rmno}">
					<input type="hidden" name="action" value="listInfo2">
				</form>
				<script>
				$('#${rminfoVO.rmno}_form').submit(function(event){
				  event.preventDefault();
				  var $form = $(this);

				  $.ajax({
				      type: 'POST',
				      url: $form.attr('action'),
				      data: $form.serialize(),
				      success: function(data) {
				        // Do something with the response
				        $('#${rminfoVO.rmno}_people').text(data)
				      },
				      error: function(error) {
				        // Do something with the error
				        console.log(error)
				      }
				  });
				});
								
				$('#${rminfoVO.rmno}_form').submit();
				
			</script>
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
			<div>備註: ${rminfoVO.remarks}</div>
		</div>

	</c:forEach>
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
  </script>
<script>
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
</script>
<script>
	dialog2 = $("#dialog-form")
	<c:if test="${not empty errorMsgs}">
	function hasError() {
		dialog2.dialog("open");
	}
	</c:if>
</script>
</html>