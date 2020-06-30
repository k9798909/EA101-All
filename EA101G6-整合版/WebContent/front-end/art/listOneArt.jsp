<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*" %>
<%@ page import="com.art.model.*" %>

<%
	ArtVO artVO = (ArtVO) request.getAttribute("artVO");
%>


<html>
<head>
<title>文章資料 - listOneEmp.jsp</title>

	<meta charset="utf-8">
	
<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
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
  table {
	width: 600px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
  img {
  	width:400px;
  	height:500px;
  }
  .icon{
    width:20px;
    height:20px;
  }
  .icon-2{
    width:25px;
    height:25px;
  }
  .d1{
  	margin-top: 50px;
  }
  .t1{
  	margin-top: 50px;
  }
  .breadcrumb{
  	margin-top: 35px;
  	margin-left: 35px;
  	
  	background-color: white;
  }
  .ha1{
  	text-align: center;
  	margin-top: 50px;
  	margin-bottom: 50px;
  	
  }
  .breadcrunm-2{
  	margin-left: -35px;
  }
  body{
   	background-image: url('<%=request.getContextPath()%>/images/bg4.png');
  }
  .rp-area{
  	width: 450px;
  	height: 50px;
  }
  .rp-2{
  	margin-top: 350px;
  }
  
</style>

</head>



<body>

<%@ include file="/front-end/front-end-nav.jsp"%>  
    
	<!-- 麵包屑 -->
    <nav aria-label="breadcrumb" class="d-inline-flex ">
  			<ol class="breadcrumb ">
    			<li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/index.html">Home</a></li>
    			<li class="breadcrumb-item"><a href="<%=request.getContextPath()%>/font-end/art/listAllArt.jsp">Article</a></li>
    			<li class="breadcrumb-item active" aria-current="page">${artVO.arttt}</li>
 			</ol>
	</nav>
    



    <div class="card col-md-8 offset-md-2" id="d1">
    	<header class="ha1">
    		<h1 class="card-title col-md-12">${artVO.arttt}</h1>
    		<nav aria-label="breadcrumb" class="d-inline-flex breadcrunm-2">
  			<ol class="breadcrumb">
    			<li class="breadcrumb-item"><a href="#" class="text-black"><span class="d-md-inline-block"><img class="icon-2" src="<%=request.getContextPath()%>/images/User-icon.png">${artVO.mbrno}</span></a></li>
    			<li class="breadcrumb-item active" aria-current="page"><img class="icon-2" src="<%=request.getContextPath()%>/images/cal-icon.png">${artVO.pdate}</li>
 			</ol>
			</nav>

			<!-- Button trigger modal -->
			<button type="button" class="btn btn-primary" data-toggle="modal"
				data-target="#exampleModal">Report</button>
			
			
			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content rp-2">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">檢舉內容</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body"><input type="text" class="rp-area" id="rp_detail" name="rp_detail" placeholder="輸入檢舉原因"></div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">關閉</button>
							<button type="submit" name="action" id="action" value="insert" id="demo1" class="btn btn-primary" data-dismiss="modal">送出檢舉</button>
							<input type="hidden" name="artno" id="artno" value="${artVO.artno}">
							<input type="hidden" name="mbrno" id="mbrno" value="${artVO.mbrno}">
							<input type="hidden" name="status" id="status" value="0">
							
						</div>
					</div>
				</div>
			</div>
			
			
		</header>
    	
  		<img class="card-img-top col-md-8 offset-md-2" src="<%=request.getContextPath()%>/art/artpic.do?artno=${artVO.artno}" alt="Card image cap">
  		<div class="card-body col-md-8 offset-md-2">
    		<p class="card-text">${artVO.detail}</p>	
  		</div>
	</div>
    
    
    <script>
    $("#action").click(function(){
    	if ($("#rp_detail").val() == ''){
    		swal("Fuck you!", "請輸入檢舉內容!", "error");
    	} else{
    		$.ajax({
        		url: "<%=request.getContextPath()%>/artrp/artrp.do",
        		type: "POST",
        		data: { action: $("#action").val(), artno: $("#artno").val(), rp_detail: $("#rp_detail").val(), mbrno: $("#mbrno").val(), status: $("#status").val()},
        		success: function(){
        			swal("Good job!", "檢舉成功!", "success");
        		}
        	})
    	}
    	
    })
    
    
//     $.post("ArtrpServlet.java",
//     		{ action: $("#action").val(), artno: $("#artno").val(), rp_detail: $("#rp_dateil").val(), mbrno: $("#mbrno").val(), status: $("#status").val()},
//     		function(data, status){
//     			if(status == "success"){
//     				swal("Good job!", "You clicked the button!", "success");
//     			}
//     		});
    
    

	
	
	
	</script>













	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

	<script type="text/javascript" src="/js/jquery/jquery.form.js"></script> //必須
	<script type="text/javascript" src="/js/jquery/jquery-1.8.0.min.js"></script>  //必須




</body>
</html>