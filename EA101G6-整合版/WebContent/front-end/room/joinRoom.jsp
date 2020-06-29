<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.joinrm.model.*"%>

<%
  JoinrmVO joinrmVO = (JoinrmVO) request.getAttribute("joinrmVO");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



	<form METHOD="post" ACTION="joinrm.do">

	  <input type="text" name="rmno" value="<%= (joinrmVO==null)? "SR00005" : joinrmVO.getRmno()%>">
      <input type="text" name="mbrno" value="<%= (joinrmVO==null)? "BM00001" : joinrmVO.getMbrno()%>">
           
 	  <input type="hidden" name="action" value="insert">
 	  <input type="submit" value="加入">
	</form>

	<form METHOD="post" ACTION="joinrm.do">

	  <input type="text" name="rmno" value="<%= (joinrmVO==null)? "SR00005" : joinrmVO.getRmno()%>">
      <input type="text" name="mbrno" value="<%= (joinrmVO==null)? "BM00001" : joinrmVO.getMbrno()%>">
            
 	  <input type="hidden" name="action" value="delete">
 	  <input type="submit" value="離開">
	</form>
	
	<form METHOD="post" ACTION="joinrm.do">

	  <input type="text" name="rmno">
      <input type="text" name="mbrno">
            
 	  <input type="hidden" name="action" value="listInfo">
 	  <input type="submit" value="查詢">
	</form>
	
</body>
</html>