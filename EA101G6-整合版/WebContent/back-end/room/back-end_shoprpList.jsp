<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.shoprp.model.*"%>

<%
	ShoprpService shoprpSvc = new ShoprpService();
	List<ShoprpVO> list = shoprpSvc.getAll();
	pageContext.setAttribute("list", list);
%>

<!DOCTYPE html>
<html>
<head>

<title>��O�Ω��a�^���C��</title>

<%-- <script src="<%=request.getContextPath()%>/js/model/jquery-3.3.1.min.js"></script> --%>
<script src="<%=request.getContextPath()%>/js/model/popper.min.js"></script>
<script src="<%=request.getContextPath()%>/js/model/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/model/bootstrap.min.css">
</head>
<body>
<%@ include file="/back-end/back-end_nav.jsp" %>
<div id="listAll">
<table class="table table-striped">
	<tr>
		<th style="width:10%">�ж��s��</th>
		<th style="width:6%">�|���s��</th>
		<th style="width:15%">�^���ɶ�</th>
		<th style="width:10%">�Ƶ�</th>
		<th style="width:15%">�O�_���</th>
		<th></th>
	</tr>
	<c:forEach var="shoprpVO" items="${list}">
	<tr>
		<td>${shoprpVO.rmno}</td>
		<td>${shoprpVO.mbrno}</td>
		<td><fmt:formatDate value="${shoprpVO.rpdate}" pattern="yyyy-MM-dd HH:mm" /></td>
		<td>${shoprpVO.detail}</td>
		<td>
			<c:choose>
    			<c:when test="${shoprpVO.attend eq 0}">
    				���X�u
   		 		</c:when>
   		 		<c:otherwise>
			    	�����
			    </c:otherwise>
			</c:choose>
   		 </td>
		<td>
			<form METHOD="post" ACTION="shoprp.do">			
				<input type="hidden" name="rmno" value="${shoprpVO.rmno}">
				<input type="hidden" name="mbrno" value="${shoprpVO.mbrno}">
				<input type="hidden" name="action" value="delete">
				<input type="submit" value="�R��">
			</form>
		</td>
	</tr>
	</c:forEach>

</table>
</div>
</body>
<style>
#listAll{
	margin:20px auto;
	width:89%;
	background-color:white;
}
</style>
</html>