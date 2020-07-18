<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.rminfo.model.*"%>

<%
	RminfoService rmSvc = new RminfoService();
	String rmno = request.getParameter("rmno");
	RminfoVO rmVO = rmSvc.getOneRm(rmno);
	pageContext.setAttribute("rmVO", rmVO);
%>
<jsp:useBean id="shopSvc" scope="page" class="com.shop.model.ShopService" />
<jsp:useBean id="jSvc" scope="page" class="com.joinrm.model.JoinrmService" />
<!DOCTYPE html>
<html>
<head>
<title>���|���a-include��</title>
</head>
<body>
<form METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/shoprpdt/shoprpdt.do">
<table class="table table-striped">
<tr><th style="width:130px">���a�W��</th>
<th style="width:100px">���|���a</th>
<th >���|���e</th></tr>
			<tr>		  
		      <td align="center">${shopSvc.getOneShop(rmVO.shopno).shopname}
		      </td>
		      <td align="center"> 
				${rmVO.naming}
			  </td>
		      <td><input type="text" name="detail" maxlength="15" placeholder="���󤣺�?" name="detail"></td>     
		    </tr>    		 	  
<!-- 	<tr><td colspan="3" align="right"><input type="hidden" name="action" value="insert"> -->
<!-- 	<input type="submit" value="�e�X"></td></tr> -->
	</table>
	<div style="text-align:right">
		<input type="hidden" name="shopno" value="${rmVO.rmno}">
		<input type="hidden" name="shopno" value="${param.rmno}">
		<input type="hidden" name="shopno" value="${shopSvc.getOneShop(rmVO.shopno).shopno}">
		<input type="hidden" name="action" value="insert">
		<input type="submit" value="�e�X" onclick="return(confirm('�e�X��N�L�k�ק�'))">
	</div>
</form>

</body>
</html>