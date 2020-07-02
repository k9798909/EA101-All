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
<script type="text/javascript"> var jQuery_1_12_4 = $.noConflict(true); </script>
</head>
<body>
<%@ include file="/front-end/front-end-nav.jsp"%>
<div id="listAll">
<table>
	<tr>
		<th style="width:10%">�ЦW</th>
		<th style="width:6%">�ХD</th>
		<th style="width:7%">�C�����a</th>
		<th style="width:5%">�H�ƭ���</th>
		<th style="width:15%">�C���ɶ�</th>
		<th style="width:15%">�����C��</th>
		<th style="width:10%">�Ƶ�</th>
		<th style="width:10%">�ж����A</th>
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
		<td>
			<c:choose>
    			<c:when test="${rminfoSvc.getOneRm(joinrmVO.rmno).status eq 0}">
    				���ݦ����[�J
   		 		</c:when>
			    <c:when test="${rminfoSvc.getOneRm(joinrmVO.rmno).status eq 1}">
			    	�H�Ƥw�F�i�q��U��
			    </c:when>
			    <c:when test="${rminfoSvc.getOneRm(joinrmVO.rmno).status eq 2}">
			    	�H�Ƥw��
			    </c:when>
			    <c:when test="${rminfoSvc.getOneRm(joinrmVO.rmno).status eq 3}">
			    	�w�q��
			    </c:when>
			    <c:when test="${rminfoSvc.getOneRm(joinrmVO.rmno).status eq 4}">
			    	��������
			    </c:when>
			    <c:otherwise>
			    	�w����
			    </c:otherwise>
			</c:choose>
		</td>
		<td><div id="dialog_${joinrmVO.rmno}" title="�����C��">
		<jsp:include page="/front-end/room/roomMember.jsp"><jsp:param name="rmno" value="${joinrmVO.rmno}" /></jsp:include>
	</div><button id="opener_${joinrmVO.rmno}">�ѥ[����</button></td>
	
		<td><div id="dialog2_${joinrmVO.rmno}" title="�C������">
		<jsp:include page="/front-end/room/rate.jsp"><jsp:param name="rmno" value="${joinrmVO.rmno}" /></jsp:include>
	</div><button id="opener2_${joinrmVO.rmno}">�έ��C������</button></td>
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
	width:90%;

}
table td{
	border:1px black solid;
}
table th{
	text-align:center;
}
</style>
</html>