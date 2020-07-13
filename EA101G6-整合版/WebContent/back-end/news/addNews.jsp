<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.news.model.*"%>

<%
  NewsVO newsVO = (NewsVO) request.getAttribute("newsVO");
%>  
<%= newsVO==null %> -- ${newsVO.newsno}-- <!--���p���100�� -->
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/ckeditor/ckeditor.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<title>�̷s�����s�W - addNews.jsp</title>

<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
    margin-top: 50px;
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
  textarea {
  	width:33%;
  	height:21%;
  }

  table {
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
  }
  table, th, td {
    border: 0px solid #CCCCFF;
  }
  th, td {
    padding: 1px;
  }
</style>

</head>
<body bgcolor='white'>

<%@ include file="/back-end/back-end_nav.jsp"%>


<table id="table-1" class="col-md-8 offset-md-2">
	<tr><td>
		<h3>�̷s�����s�W -addNews.jsp</h3>
		<h4><a href="select_page.jsp">�^����</a></h4>
	</td></tr>
</table>



<%-- ���~�C�� --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/news/news.do" name="form1" >
	
	
	
	
	<div class="form-group">
    	<label for="exampleFormControlInput1">�̷s�������D:</label>
    	<input type="TEXT" class="form-control" id="exampleFormControlInput1" placeholder="�̷s�������D" name="newstt"  value="<%= (newsVO==null)? "" : newsVO.getNewstt()%>">
  	</div>
	
	


	
	
	<textarea name="detail" id="detail" ><%= (newsVO==null)? "" : newsVO.getDetail()%></textarea>
	
  	<script type="text/javascript">
  		window.onload = function(){
        	CKEDITOR.replace( 'detail' );
    	};
  	</script>
  	
  	
  	

<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="�e�X�s�W"></FORM>





<script src="./vendors/jquery/jquery-3.4.1.min.js"></script>
<script src="./vendors/popper/popper.min.js"></script>
<script src="./vendors/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>