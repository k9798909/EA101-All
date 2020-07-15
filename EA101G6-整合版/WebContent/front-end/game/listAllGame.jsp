<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.game.model.*"%>

<%
	GameService gameSvc = new GameService();
	List<GameVO> list = gameSvc.getAll();
	pageContext.setAttribute("list", list);
%>

<!doctype html>
<html lang="en">
<head>

<title>遊戲列表</title>

<style>
table {
	margin-top: 10px;
}

td th tr {
	text-align: center;
}

.icon {
	width: 20px;
	height: 20px;
}



img {
	width: 50px;
	height: 50px;
}

h4 {
	margin-left: 20px;
}
</style>
</head>

<body>

	<jsp:include page="/front-end/front-end-nav.jsp" flush="true"></jsp:include>



	<jsp:include page="select_page.jsp" flush="true">
		<jsp:param name="" value="" />
	</jsp:include>


	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	<div class="container">
		<div class="row">
			<%@ include file="page1.file"%>
			<table class="table table-sm">
				<tr>
					<th>遊戲編號</th>
					<th>遊戲名稱</th>
					<th>遊戲圖片</th>
					<th>修改</th>
				</tr>
				<c:forEach var="gameVO" items="${list}" begin="<%=pageIndex%>"
					end="<%=pageIndex+rowsPerPage-1%>">
					<tr>
						<td>${gameVO.gmno}</td>
						<td>${gameVO.gmname}</td>
						<td><img
							src="<%=request.getContextPath()%>/GameShowImg?gmno=${gameVO.gmno}"></td>
						<td>
<!-- 							<FORM METHOD="post" ACTION="game.do" style="margin-bottom: 0px;"> -->
								<input type="submit" value="修改" data-toggle="modal" data-target="#exampleModal" class="btn btn-secondary"> <input type="hidden"
									name="gmno" value="${gameVO.gmno}"> 
<%-- 									 onclick="location.href='<%=request.getContextPath()%>/front-end/game/game.do?gmno=$gameVO.gmno&action=getOne_For_Update';" --%>
<!-- 									<input type="hidden" name="action" value="getOne_For_Update"> -->
<!-- 							</FORM> -->
						</td>
					</tr>
				</c:forEach>
			</table>
			<div class="d-flex justify-content-center container"
				style="margin-left: auto; margin-right: auto;">
				<div class="row">
					<div class="col-sm-12">
						<%@ include file="page2.file"%>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<div class="modal fade" id="exampleModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content rp-2">				
			<div class="modal-header">
                <h3 class="modal-title" id="exampleModalLabel">新增遊戲</h3>
                <hr class="my-3">
            </div>
			
			<div class="modal-body">
				<div class="form-group">
<!-- =========================================以下為原addGame.jsp的內容========================================== -->
<%-- 		<jsp:include page="update_game_input.jsp" flush="true"/> --%>
<!-- =========================================以上為原addGame.jsp的內容========================================== -->
			</div></div>			
			<div class="modal-footer">
                <input type="submit" value="確認送出" id="go" class="btn btn-primary">
            </div>		
		</div>
	</div>
</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	<!-- <script  src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js"> -->



</body>
</html>