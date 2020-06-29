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
//           "<div> �ХD: " + mbrno.val() + "</div>" +        
//           "<div> �C�����a: " + shopno.val() + "</div>" +
//           "<div> �H�ƭ���: " + lowlimit.val() + "~" + uplimit.val() +"�H&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;" + "<span text-align:right>" + "1/" + uplimit.val() + "</span>" + "</div>" +
//           "<div> �C���ɶ�: " + starttime.val() + "~" + endtime.val().substring(11) + "</div>" +
//           "<div> �w�p�����C��: " + game.val() + "</div>" +
//           "<div> ���W�I��ɶ�: " + cutoff.val() + "</div>" +
//           "<div> �Ƶ�: " + remarks.val() + "</div>" +
//           "<div> ��������: " + restriction.val() + "</div>" +
//           "<div> �[�J�O�_�ݼf��: " + confirmed.val() + "</div>" +
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
        "�إߩж�": addUserXX,
        "����": function() {
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

	<div id="dialog-form" title="�]�w���θ�T">
		<!-- 	<p class="validateTips">All form fields are required.</p> -->
		<p>��*���������</p>
		<c:if test="${not empty errorMsgs}">
			<font style="color: red">�Эץ��H�U���~:</font>
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li style="color: red">${message}</li>
				</c:forEach>
			</ul>
		</c:if>
		<form id="myMBRform" METHOD="post" ACTION="rminfo.do">
			<fieldset>
				<label for="mbrno">�D��: </label> <input readonly type="text"
					name="mbrno" id="mbrno" value="BM00001"
					class="text ui-widget-content ui-corner-all"> <label
					for="naming">*�ЦW: </label> <input type="text" name="naming"
					id="naming" value="BM00001���ж�"
					class="text ui-widget-content ui-corner-all"> <label
					for="shopno">*�a�I: </label> <input type="text" name="shopno"
					id="shopno" value="DS00001"
					class="text ui-widget-content ui-corner-all"> *�H�ƭ���: <select
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
				</select> <font>�H</font><br> <br> <label for="starttime">*�C���}�l�ɶ�</label>
				<input type="text" name="starttime" id="f_date2"
					class="text ui-widget-content ui-corner-all"> <label
					for="endtime">*�C�������ɶ�</label> <input type="text" name="endtime"
					id="f_date3" class="text ui-widget-content ui-corner-all">
				*�w�p�����C��: <br>
				<textarea placeholder="��J�Q�����C�� EX:�d�d�|" required="required"
					name="game" maxlength="50"
					style="resize: none; width: 280px; height: 60px;"><c:if
						test="${not empty requestScope.rminfoVO}">${requestScope.rminfoVO.game}</c:if></textarea>
				<br> <br> *�[�J�O�_�ݼf��: <select name="confirmed">
					<option value="0">�_</option>
					<option value="1">�O</option>
				</select><br> <br> *��������: <select name="restriction">
					<option value="0">�L</option>
					<%
						for (int i = 1; i <= 5; i++) {
					%>
					<option value="<%=i%>"><%=i%></option>
					<%
						}
					%>
				</select><br> <br> �Ƶ�: <br>
				<textarea name="remarks" maxlength="100"
					style="resize: none; width: 280px; height: 120px;"></textarea>

				<input type="hidden" name="action" value="insert">
				<!--  	  <input type="submit" value="�e�X�s�W"> -->
				<!-- Allow form submission with keyboard without duplicating the dialog button -->
				<!--       <input type="submit" tabindex="-1" style="position:absolute; top:-1000px"> -->
			</fieldset>
		</form>
	</div>


	<div id="users-contain" class="ui-widget">
		<h1>�ж��C��:</h1>
		<button id="create-user">�ڭn�}��</button>
	</div>


	<c:forEach var="rminfoVO" items="${list}">
		<div class='card' id="${rminfoVO.rmno}_info">
			<div>
				<form METHOD="post" ACTION="joinrm.do">
					<input type="hidden" name="rmno" value="${rminfoVO.rmno}">
					<input type="hidden" name="mbrno" value="BM00001"> 
					<input type="hidden" name="action" value="insert"> 
					<input type="submit" value="�[�J">
				</form>

				<form METHOD="post" ACTION="joinrm.do">
					<input type="hidden" name="rmno" value="${rminfoVO.rmno}">
					<input type="hidden" name="action" value="listInfo"> 
					<input type="submit" value="�Ф������M��">
				</form>
			</div>
			<div class='roomtitle'>
				<span class='titleType'><b>${rminfoVO.naming}</b>
			</div>
			<div>�ХD: ${rminfoVO.mbrno}</div>
			<div>�C�����a: ${rminfoVO.shopno}</div>
			<div>
				�H�ƭ���:
				${rminfoVO.lowlimit}~${rminfoVO.uplimit}�H&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
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
				�C���ɶ�:
				<fmt:formatDate value="${rminfoVO.starttime}"
					pattern="yyyy-MM-dd HH:mm" />
				~
				<fmt:formatDate value="${rminfoVO.endtime}" pattern="HH:mm" />
			</div>
			<div>�w�p�����C��: ${rminfoVO.game}</div>
			<div>
				���W�I��ɶ�:
				<fmt:formatDate value="${rminfoVO.cutoff}"
					pattern="yyyy-MM-dd HH:mm:ss" />
			</div>
			<div>��������: ${(rminfoVO.restriction == '0')?'�L':rminfoVO.restriction}</div>
			<div>�[�J�O�_�ݼf��: ${(rminfoVO.confirmed == '0')?'�_':'�O'}</div>
			<div>�Ƶ�: ${rminfoVO.remarks}</div>
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
	       step: 30,                //step: 60 (�o�Otimepicker���w�]���j60����)
// 	       format:'Y-m-d',         
			format:'Y-m-d H:i:s',
		   value: '<%=starttime%>', 
		   // value:   new Timestamp(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // �h���S�w���t
           //startDate:	            '2017/07/10',  // �_�l��
           minDate:               '-1970-01-01', // �h������(���t)���e
           //maxDate:               '+1970-01-01'  // �h������(���t)����
        });        
  </script>
<script>
        $.datetimepicker.setLocale('zh');
        $('#f_date3').datetimepicker({
	       theme: '',              //theme: 'dark',
// 	       timepicker:false,       
	       timepicker:true,
	       step: 30,                //step: 60 (�o�Otimepicker���w�]���j60����)
// 	       format:'Y-m-d',         
			format:'Y-m-d H:i:s',
		   value: '<%=endtime%>',
		// value:   new Timestamp(),
		//disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // �h���S�w���t
		//startDate:	            '2017/07/10',  // �_�l��
		minDate : '-1970-01-01', // �h������(���t)���e
	//maxDate:               '+1970-01-01'  // �h������(���t)����
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