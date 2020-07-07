<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.joinrm.model.*"%>

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
<form METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/room/shoprp.do">
	<table>
	<tr>
		<th>�|���W��</th><th>�O�_���</th><th>�Ƶ�</th>
	</tr>
	<c:forEach var="joinrmVO2" items="${list2}">
		<tr>
		    <td><input type="hidden" name="rmno" value="<%=request.getParameter("rmno")%>">
			<input type="text" name="mbrno" value="${joinrmVO2.mbrno}" readonly></td>
			<td style="text-align:center">
				<select name="attend">
					<option value="1">�O</option>
					<option value="0">�_</option>
				</select>
			</td>
			<td><input type="text" name="detail" value="123"></td>
		</tr>	             		 	  
	</c:forEach>
	<tr>
		<td colspan="3" align="right">
			<input type="hidden" name="action" value="insert">
			<input type="submit" value="�e�X">
		</td>
	</tr>
	</table>
</form>

</body>
</html>