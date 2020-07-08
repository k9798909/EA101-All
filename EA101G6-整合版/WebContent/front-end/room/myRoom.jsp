<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.joinrm.model.*" %>
<%@ page import="java.util.*"%>

<%
	JoinrmService joinrmSvc = new JoinrmService();
	List<JoinrmVO> list = joinrmSvc.findByPK("","BM00001");
	pageContext.setAttribute("list",list);
%>

<jsp:useBean id="rminfoSvc" scope="page" class="com.rminfo.model.RminfoService" />
<jsp:useBean id="joinrmSvc2" scope="page" class="com.joinrm.model.JoinrmService" />
<!DOCTYPE html>
<html>
<head>
<title>玩家的房間列表+狀態改變</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript"> var jQuery_1_12_4 = $.noConflict(true); </script>
</head>
<body>
<%@ include file="/front-end/front-end-nav.jsp"%>
<div id="listAll">
<table class="table table-striped">
	<tr>
		<th style="width:10%">房名</th>
		<th style="width:6%">房主</th>
		<th style="width:7%">遊玩店家</th>
		<th style="width:6%">人數限制[目前人數]</th>
		<th style="width:15%">遊玩時間</th>
		<th style="width:15%">玩的遊戲</th>
		<th style="width:10%">備註</th>
		<th style="width:7%">房間狀態</th>
		<th style="width:6%"></th><th></th>
	</tr>
	<c:forEach var="joinrmVO" items="${list}">
	<tr>
		<td>${rminfoSvc.getOneRm(joinrmVO.rmno).naming}</td>
		<td>${rminfoSvc.getOneRm(joinrmVO.rmno).mbrno}</td>
		<td>${rminfoSvc.getOneRm(joinrmVO.rmno).shopno}</td>
		<td>${rminfoSvc.getOneRm(joinrmVO.rmno).lowlimit}~${rminfoSvc.getOneRm(joinrmVO.rmno).uplimit} [${fn:length(joinrmSvc2.findByPK(joinrmVO.rmno,''))}]</td>
		<td><fmt:formatDate value="${rminfoSvc.getOneRm(joinrmVO.rmno).starttime}" pattern="yyyy-MM-dd HH:mm" />
			~<fmt:formatDate value="${rminfoSvc.getOneRm(joinrmVO.rmno).endtime}" pattern="HH:mm" /></td>
		<td>${rminfoSvc.getOneRm(joinrmVO.rmno).game}</td>
		<td>${rminfoSvc.getOneRm(joinrmVO.rmno).remarks}</td>
		<td>
			<c:choose>
    			<c:when test="${rminfoSvc.getOneRm(joinrmVO.rmno).status eq 0}">
    				等待成員加入
   		 		</c:when>
			    <c:when test="${rminfoSvc.getOneRm(joinrmVO.rmno).status eq 1}">
			    	人數已達可訂位下限
			    </c:when>
			    <c:when test="${rminfoSvc.getOneRm(joinrmVO.rmno).status eq 2}">
			    	人數已滿
			    </c:when>
			    <c:when test="${rminfoSvc.getOneRm(joinrmVO.rmno).status eq 3}">
			    	已訂位
			    </c:when>
			    <c:when test="${rminfoSvc.getOneRm(joinrmVO.rmno).status eq 4}">
			    	取消揪團
			    </c:when>
			    <c:otherwise>
			    	已結束
			    </c:otherwise>
			</c:choose>
		</td>
		<td><div id="dialog_${joinrmVO.rmno}" title="成員列表">
		<jsp:include page="/front-end/room/roomMember.jsp"><jsp:param name="rmno" value="${joinrmVO.rmno}" /></jsp:include>
	</div><button id="opener_${joinrmVO.rmno}">參加成員</button></td>
	
		<td><div id="dialog2_${joinrmVO.rmno}" title="遊玩評價">
		<jsp:include page="/front-end/room/rate.jsp"><jsp:param name="rmno" value="${joinrmVO.rmno}" /></jsp:include>
	</div><button class="floatButton" id="opener2_${joinrmVO.rmno}">團員遊玩評價</button>
			<form METHOD="post" ACTION="rminfo.do">
				<input type="hidden" name="status" value="3">
				<input type="hidden" name="report" value="${rminfoSvc.getOneRm(joinrmVO.rmno).report}">
				<input type="hidden" name="rmno" value="${joinrmVO.rmno}">
				<input type="hidden" name="action" value="update">
				<input class="floatButton" type="submit" value="訂位">
			</form>
			<form METHOD="post" ACTION="rminfo.do">
				<input type="hidden" name="status" value="4">
				<input type="hidden" name="report" value="${rminfoSvc.getOneRm(joinrmVO.rmno).report}">
				<input type="hidden" name="rmno" value="${joinrmVO.rmno}">
				<input type="hidden" name="action" value="update">
				<input class="floatButton" type="submit" value="取消揪團">
			</form>
		</td>
	
<script>
(function($){
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
  
  $( function() {
	    $( "#dialog2_${joinrmVO.rmno}" ).dialog({
	      autoOpen: false,
	      show: {
	        effect: "blind",
	        duration: 1000
	      },
	      hide: {
	        effect: "explode",
	        duration: 1000
	      },
	      width: 800,
	    });
	 
	    $( "#opener2_${joinrmVO.rmno}" ).on( "click", function() {
	      $( "#dialog2_${joinrmVO.rmno}" ).dialog( "open" );
	    });
	  } );
})(jQuery_1_12_4);  
 </script>
	</tr>
	</c:forEach>

</table>
</div>	
</body>
<style>
#listAll{
	margin:20px auto;
	width:95%;

}
.floatButton{
	float:left;
	margin:0px 5px;
}

</style>
</html>