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
<jsp:useBean id="mbrpfSvc" scope="page" class="com.mbrpf.model.MbrpfService" />
<!DOCTYPE html>
<html>
<head>
<title>遊玩後玩家互相評價-include用</title>
</head>
<body>
<form METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/room/rate.do">
<table>
<tr><th>成員名稱</th><th style="width:100px">評價分數</th><th >評價內容</th></tr>
	<c:forEach var="joinrmVO2" items="${list2}">
		<c:if test="${joinrmVO2.mbrno ne 'BM00001'}">
			<tr>		  
		      <td>
			      <input type="text" name="ratedmbrno" value="${mbrpfSvc.getOneMbrpf(joinrmVO2.mbrno).mbrname}" readonly>
			      <input type="hidden" name="rmno" value="<%=request.getParameter("rmno")%>">
			      <input type="hidden" name="ratingmbrno" value="BM00001">
		      </td>
		      <td align="center"> 
		      	<select name="score">
					<%for (int i = 5; i >= 1; i--) {%>
					<option value="<%=i%>"><%=i%></option>
					<%}%>
				</select>
			  </td>
		      <td><input type="text" name="detail" value="幹腳超臭"></td>     
		    </tr>    		 	  
		</c:if>
	</c:forEach>
	<tr><td colspan="3" align="right"><input type="hidden" name="action" value="insert">
	<input type="submit" value="送出"></td></tr>
	</table>
</form>

</body>
</html>