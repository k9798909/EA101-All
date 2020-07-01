<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.rate.model.*"%>
<%@ page import="com.joinrm.model.*"%>

<%
  RateVO rateVO = (RateVO) request.getAttribute("rateVO");
%>
<%
	JoinrmService joinrmSvc2 = new JoinrmService();
	List<JoinrmVO> list2 = joinrmSvc2.findByPK(request.getParameter("rmno"),"");
	pageContext.setAttribute("list2",list2);
%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<c:forEach var="joinrmVO2" items="${list2}">
	<form METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/room/rate.do">

	  <input type="hidden" name="rmno" value="<%=request.getParameter("rmno")%>">
      <input type="hidden" name="ratingmbrno" value="BM00001">
      <input type="text" name="ratedmbrno" value="${joinrmVO2.mbrno}" readonly>
      <input type="text" name="score" value="1">
      <input type="text" name="detail" value="·F¸}¶W¯ä">       
 	  <input type="hidden" name="action" value="insert">
 	  <input type="submit" value="°e¥X">
	</form>
</c:forEach>
</body>
</html>