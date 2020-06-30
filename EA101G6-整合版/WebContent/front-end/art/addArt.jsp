<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.art.model.*"%>

<%
  ArtVO artVO = (ArtVO) request.getAttribute("artVO");
%>  



<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/ckeditor/ckeditor.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<title>文章資料新增 - addArt.jsp</title>


<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Rubik:300,400,700|Oswald:400,700" rel="stylesheet">
	<!-- 登入圖示 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/fonts/icomoon/style.css">

    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery.fancybox.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/owl.carousel.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/owl.theme.default.min.css">
    
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/aos.css">

    <!-- MAIN CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">



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
   .icon{
    width:20px;
    height:20px;
   }
   .category-1{
   	margin-top:20px;
   	margin-bottom:20px;
   	
   }
   .add-1{
   	margin-top: 100px;
   }
   .img-1{
   	width: 100%;
   	margin-bottom: 25px;
   }
   .ta1{
   	margin-top: 40px;
   	margin-bottom: 40px;
   }
   body{
   	background-image: url('<%=request.getContextPath()%>/images/bg3.png');
   }
  
  
</style>

</head>



<body bgcolor='white' data-spy="scroll" data-target=".site-navbar-target" data-offset="300">

	<div class="site-wrap"  id="home-section">

    <div class="site-mobile-menu site-navbar-target">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div>
   </div>

    <div class="top-bar">
      <div class="container">
        <div class="row">
          <div class="col-12">
            
            <a href="#" class="text-white"><span class="d-md-inline-block"><img class="icon" src="<%=request.getContextPath()%>/images/add-icon.png">註冊</span></a>
            
            <div class="float-right">
            <a href="#" class="text-white"><span class="d-md-inline-block"><img class="icon" src="<%=request.getContextPath()%>/images/User-icon.png">會員登入</span></a>
            <a href="#" class="text-white"><span class="d-md-inline-block"><img class="icon" src="<%=request.getContextPath()%>/images/man-icon.png" >店家登入</span></a>
            </div>

          </div>
          
        </div>
        
      </div>
    </div>
      
    <header class="site-navbar js-sticky-header site-navbar-target" role="banner">

      <div class="container">
        <div class="row align-items-center position-relative">
          
            
            <div class="site-logo">
              <a href="<%=request.getContextPath()%>/index.jsp" class="text-black"><span class="text-primary">Gaming on Board</span></a>
            </div>
            
            <div class="col-12">
              <nav class="site-navigation text-right ml-auto " role="navigation">

                <ul class="site-menu main-menu js-clone-nav ml-auto d-none d-lg-block">
                <li><a href="" class="nav-link">首頁</a></li>

                  <li class="has-children">
                  <a href="" class="nav-link">會員專區</a>
                  <ul class="dropdown arrow-top">
                    <li><a href="#team-section" class="nav-link">Team</a></li>
                    <li><a href="#pricing-section" class="nav-link">Pricing</a></li>
                    <li><a href="#faq-section" class="nav-link">FAQ</a></li>
                    <li class="has-children">
                      <a href="#">More Links</a>
                      <ul class="dropdown">
                        <li><a href="#">Menu One</a></li>
                        <li><a href="#">Menu Two</a></li>
                        <li><a href="#">Menu Three</a></li>
                      </ul>
                    </li>
                  </ul>
                </li>

                <li><a href="#mall" class="nav-link">商城</a></li>
                <li><a href="#shop" class="nav-link">市集</a></li>
                <li><a href="#play" class="nav-link">揪團區</a></li>
                <li><a href="#store" class="nav-link">店家列表</a></li>
                <li><a href="<%=request.getContextPath()%>/font-end/art/listAllArt.jsp" class="nav-link">討論區</a></li>
              </ul>
              </nav>
          
            </div>

          <div class="toggle-button d-inline-block d-lg-none"><a href="#" class="site-menu-toggle py-5 js-menu-toggle text-black"><span class="icon-menu h3"></span></a></div>

        </div>
      </div>
      
    </header>

	<!-- 錯誤訊息 -->
	  <div class="errorMsgs col-md-8 offset-md-2">
	  	<c:if test="${not empty errorMsgs}">
			<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color:red">${message}</li>
			</c:forEach>
			</ul>
	  	</c:if>
	  </div>

	<div class="bg-white tm-block col-md-8 offset-md-2 add-1">
		<div class="row">
			<div class="col-12">
				<h2 class="tm-block-title d-inline-block">Add Article</h2>
			</div>
		</div>
		
		<FORM METHOD="post" class="tm-edit-product-form" ACTION="art.do" name="form1" enctype="multipart/form-data">
		<div class="row mt-4 tm-edit-product-row">
			<div class="col-xl-7 col-lg-7 col-md-12">			
					
					<div class="input-group mb-3">
						<label for="name"
							class="col-xl-4 col-lg-4 col-md-4 col-sm-5 col-form-label">作者編號</label> 
							<input type="text" name="mbrno" value="<%=(artVO == null) ? "" : artVO.getMbrno()%>" class="form-control validate col-xl-9 col-lg-8 col-md-8 col-sm-7"/>
					</div>
					
					<div class="input-group mb-3">
						<label for="name"
							class="col-xl-4 col-lg-4 col-md-4 col-sm-5 col-form-label">文章標題</label> 
							<input type="text" name="arttt" value="<%=(artVO == null) ? "" : artVO.getArttt()%>" class="form-control validate col-xl-9 col-lg-8 col-md-8 col-sm-7"/>
					</div>
					<div class="ta1">
						<textarea  name="detail" id="detail"><%=(artVO == null) ? "" : artVO.getDetail()%></textarea>

						<script type="text/javascript">
							window.onload = function() {
								CKEDITOR.replace('detail');
							};
						</script>
					</div>	
					<div class="input-group mb-3 category-1">
						<label for="category" class="col-xl-4 col-lg-4 col-md-4 col-sm-5 col-form-label">文章分類</label>
						<jsp:useBean id="atypeSvc" scope="page" class="com.atype.model.AtypeService"/>
						<select size="1" name="atno" class="custom-select col-xl-5 col-lg-4 col-md-4 col-sm-3">
							<c:forEach var="atypeVO" items="${atypeSvc.all}">
								<option value="${atypeVO.atno}"
									${(artVO.atno==atypeVO.atno)? 'selected':'' }>${atypeVO.atname}
							</c:forEach>
						</select>
						<div class="ml-auto col-xl-2 col-lg-2 col-md-2 col-sm-1 pl-0 ">
							<button type="submit" class="btn btn-primary">Add</button>
							<input type="hidden" name="action" value="insert_AF">
						</div>
					</div>
					
					<input type="hidden" name="status" value="0" ${(artVO.status==0)? 'checked' : '' } checked>
					
					
				
			</div>
			<div class="col-xl-4 col-lg-4 col-md-12 mx-auto mb-4">
				
  				<img class="img-1" id="prePic" src="<%=request.getContextPath()%>/art/artpic.do?artno=${artVO.artno}"/>
				<input type = "file" name = "apic" id="upPic" class="btn btn-primary d-block mx-auto"/> 
				
			</div>
		</div>
		</FORM>
	</div>














<script>
	$("#upPic").change(function(){
		readURL(this);
	});
	
	function readURL(input){
		if(input.files){
			var reader = new FileReader();
			reader.onload = function(e){
				$("#prePic").attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
</script>


<script src="<%=request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
   <!-- 看起來沒屁用 -->
  <script src="<%=request.getContextPath()%>/js/popper.min.js"></script>
  <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
   <!-- 重要廣告界面 -->
  <script src="<%=request.getContextPath()%>/js/owl.carousel.min.js"></script>
  <!-- 看起來沒屁用 -->
  <script src="<%=request.getContextPath()%>/js/jquery.sticky.js"></script>
  <script src="<%=request.getContextPath()%>/js/jquery.waypoints.min.js"></script>
  <script src="<%=request.getContextPath()%>/js/jquery.animateNumber.min.js"></script>
  <script src="<%=request.getContextPath()%>/js/jquery.fancybox.min.js"></script>
  
  
<!-- 上介面連結動畫 -->
  <script src="<%=request.getContextPath()%>/js/jquery.easing.1.3.js"></script>
  
  <!-- 重要廣告界面 -->
  <script src="<%=request.getContextPath()%>/js/aos.js"></script>
  
  <script src="<%=request.getContextPath()%>/js/main.js"></script>




</body>
</html>