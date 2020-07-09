<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>IBM Art: Home</title>

<style>
  table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
    border: 3px ridge Gray;
    height: 80px;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

</head>
<body bgcolor="white">

<%@ include file="/back-end/back-end_nav.jsp"%>





<h3 class="col-md-10 offset-md-1 table table-striped bg-white">資料查詢:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

	<ul class="col-md-8 offset-md-2">
		<li><a href='listAllArt.jsp'>List</a> all Arts. <br>
		<br></li>


		<li>
			<FORM METHOD="post" ACTION="art.do">
				<b>輸入文章編號 (如MA00001):</b> <input type="text" name="artno"> <input
					type="hidden" name="action" value="getOne_For_Display"> <input
					type="submit" value="送出">
			</FORM>
		</li>


		<li>
			<FORM METHOD="post" ACTION="art.do">
				<b>輸入作者編號 (如BM00001):</b> <input type="text" name="mbrno"> <input
					type="hidden" name="action" value="getAW_For_Display"> <input
					type="submit" value="送出">
			</FORM>
		</li>

		<jsp:useBean id="atypeSvc" scope="page"
			class="com.atype.model.AtypeService" />

		<li>
			<FORM METHOD="post" ACTION="art.do">
				<b>選擇文章種類:</b> <select size="1" name="atno">
					<c:forEach var="atypeVO" items="${atypeSvc.all}">
						<option value="${atypeVO.atno}">${atypeVO.atname}
					</c:forEach>
				</select> <input type="hidden" name="action" value="getAT_For_Display">
				<input type="submit" value="送出">
			</FORM>
		</li>
	</ul>





	<h3 class="col-md-8 offset-md-2">新增文章</h3>

<ul class="col-md-8 offset-md-2">
	<li><a href='addArt.jsp'>Add</a> a new Article.</li>
</ul>






</body>
</html>