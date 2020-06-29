<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.rate.model.*"%>

<%
  RateVO rateVO = (RateVO) request.getAttribute("rateVO");
%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<form METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/rate.do">

	  <input type="text" name="rmno" value="<%= (rateVO==null)? "SR00004" : rateVO.getRmno()%>">
      <input type="hidden" name="ratingmbrno" value="BM00001">
      <input type="text" name="ratedmbrno" value="<%= (rateVO==null)? "BM00007" : rateVO.getRatedmbrno()%>">
      <input type="text" name="detail" value="<%= (rateVO==null)? "·F¸}¶W¯ä" : rateVO.getDetail()%>">
      <input type="text" name="score" value="<%= (rateVO==null)? "1" : rateVO.getScore()%>">
           
 	  <input type="hidden" name="action" value="insert">
 	  <input type="submit" value="°e¥X">
	</form>

</body>
</html>