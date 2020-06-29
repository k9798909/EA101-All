<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.joinrm.model.*" %>
<%@ page import="java.util.*"%>

<%
	JoinrmService joinrmSvc = new JoinrmService();
	List<JoinrmVO> list = joinrmSvc.findByPK("","BM00001");
	pageContext.setAttribute("list",list);
%>
<jsp:useBean id="rminfoSvc" scope="page" class="com.rminfo.model.RminfoService" />
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script>
  $( function() {
    $( "#dialog" ).dialog({
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
 
    $( "#opener" ).on( "click", function() {
      $( "#dialog" ).dialog( "open" );
    });
  } );
  </script>
</head>
<body>
<table>
	<tr>
		<th>房名</th>
		<th>房主</th>
		<th>遊玩店家</th>
		<th>人數限制</th>
		<th>遊玩時間</th>
		<th>玩的遊戲</th>
		<th>備註</th>
		<th>房間狀態</th>
	</tr>
	<c:forEach var="joinrmVO" items="${list}">
	<tr>
		<td>${rminfoSvc.getOneRm(joinrmVO.rmno).naming}</td>
		<td>${rminfoSvc.getOneRm(joinrmVO.rmno).mbrno}</td>
		<td>${rminfoSvc.getOneRm(joinrmVO.rmno).shopno}</td>
		<td>${rminfoSvc.getOneRm(joinrmVO.rmno).lowlimit}~${rminfoSvc.getOneRm(joinrmVO.rmno).uplimit}</td>
		<td><fmt:formatDate value="${rminfoSvc.getOneRm(joinrmVO.rmno).starttime}" pattern="yyyy-MM-dd HH:mm" />
			~<fmt:formatDate value="${rminfoSvc.getOneRm(joinrmVO.rmno).endtime}" pattern="HH:mm" /></td>
		<td>${rminfoSvc.getOneRm(joinrmVO.rmno).game}</td>
		<td>${rminfoSvc.getOneRm(joinrmVO.rmno).remarks}</td>
		<td>已結束</td>
		<td><div id="dialog_${joinrmVO.rmno}" title="成員列表">
		<jsp:include page="/front-end/room/roomMember.jsp"><jsp:param name="rmno" value="${joinrmVO.rmno}" /></jsp:include>
	</div><button id="opener_${joinrmVO.rmno}">參加成員</button></td>
	<script>
  $( function() {
    $( "#dialog_${joinrmVO.rmno}" ).dialog({
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
 
    $( "#opener_${joinrmVO.rmno}" ).on( "click", function() {
      $( "#dialog_${joinrmVO.rmno}" ).dialog( "open" );
    });
  } );
  </script>
	</tr>
	</c:forEach>
</table>
<!-- 	<form METHOD="post" ACTION="joinrm.do" id="selectByMbrno"> -->
<!--       <input type="hidden" name="mbrno" value="BM00001">             -->
<!--  	  <input type="hidden" name="action" value="listInfo"> -->
<!-- 	</form> -->
<!-- <script>$('#selectByMbrno').submit();</script> -->
</body>
</html>