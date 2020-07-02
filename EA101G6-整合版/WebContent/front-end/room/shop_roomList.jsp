<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.joinrm.model.*" %>
<%@ page import="java.util.*"%>
<%@ page import="com.rminfo.model.*"%>

<%
	RminfoService rminfoSvc = new RminfoService();
	List<RminfoVO> list = rminfoSvc.findByShopno("DS00001");
	pageContext.setAttribute("list", list);
%>

<%-- <jsp:useBean id="joinrmSvc" scope="page" class="com.joinrm.model.JoinrmService" /> --%>

<!DOCTYPE html>
<html>
<head>

<title>店家預約列表</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript"> var jQuery_1_12_4 = $.noConflict(true); </script>
</head>
<body>
<%@ include file="/front-end/front-end-nav.jsp"%>
	<table>
	<tr>
		<th style="width:10%">房名</th>
		<th style="width:6%">房主</th>
		<th style="width:7%">遊玩店家</th>
		<th style="width:5%">人數</th>
		<th style="width:15%">遊玩時間</th>
		<th style="width:15%">玩的遊戲</th>
		<th style="width:10%">備註</th>
		<th style="width:10%">房間狀態</th>
	</tr>
	<c:forEach var="rminfoVO" items="${list}">
	<tr>
		<td>${rminfoVO.naming}</td>
		<td>${rminfoVO.mbrno}</td>
		<td>${rminfoVO.shopno}</td>
		<td>${rminfoVO.lowlimit}</td>
		<td><fmt:formatDate value="${rminfoVO.starttime}" pattern="yyyy-MM-dd HH:mm" />
			~<fmt:formatDate value="${rminfoVO.endtime}" pattern="HH:mm" /></td>
		<td>${rminfoVO.game}</td>
		<td>${rminfoVO.remarks}</td>
		<td>
			<c:choose>
    			<c:when test="${rminfoVO.status eq 0}">
    				等待成員加入
   		 		</c:when>
			    <c:when test="${rminfoVO.status eq 1}">
			    	人數已達可訂位下限
			    </c:when>
			    <c:when test="${rminfoVO.status eq 2}">
			    	人數已滿
			    </c:when>
			    <c:when test="${rminfoVO.status eq 3}">
			    	已訂位
			    </c:when>
			    <c:when test="${rminfoVO.status eq 4}">
			    	取消揪團
			    </c:when>
			    <c:otherwise>
			    	已結束
			    </c:otherwise>
			</c:choose>
		</td>
		<td>
			<div id="dialog_${rminfoVO.rmno}" title="到場回報">
				<jsp:include page="/front-end/room/shop_report.jsp"><jsp:param name="rmno" value="${rminfoVO.rmno}" /></jsp:include>
			</div><button id="opener_${rminfoVO.rmno}">到場回報</button>
			<script>
			(function($){
			  $( function() {
			    $( "#dialog_${rminfoVO.rmno}" ).dialog({
			      autoOpen: false,
			      width:700,
			      show: {
			        effect: "blind",
			        duration: 1000
			      },
			      hide: {
			        effect: "explode",
			        duration: 1000
			      }
			    });
			 
			    $( "#opener_${rminfoVO.rmno}" ).on( "click", function() {
			      $( "#dialog_${rminfoVO.rmno}" ).dialog( "open" );
			    });
			  } );
			})(jQuery_1_12_4);  
			</script>
		</td>
	</tr>
	</c:forEach>

</table>

</body>
<style>
table td{
	border:1px black solid;
}
table th{
	text-align:center;
}
</style>
</html>