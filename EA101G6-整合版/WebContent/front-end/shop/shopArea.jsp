<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.shop.model.*"%>
<%@ include file="/front-end/front-end-nav.jsp" %>


<!DOCTYPE html>
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" /><meta name="description" content="領域專家趨勢脈動觀察

" /><meta name="keywords" content="產業研究,市場情報,科技法治,技術研發,產業推動,領域專家,洞察觀點" /><meta name="author" content="財團法人資訊工業策進會" /><meta name="copyright" content="財團法人資訊工業策進會" /><meta name="application-name" content="財團法人資訊工業策進會" /><meta name="URL" content="https://www.iii.org.tw/focus/Focus.aspx?f_type=1&amp;fm_sqno=12" /><meta property="article:author" content="https://www.facebook.com/weloveIII/" /><meta property="article:publisher" content="https://www.facebook.com/weloveIII/" /><meta property="fb:app_id" content="294382590268" /><meta property="og:url" content="https://www.iii.org.tw/focus/Focus.aspx?f_type=1&amp;fm_sqno=12" /><meta property="og:title" content="專家觀點 | 資策會" /><meta property="og:type" content="article" /><meta property="og:site_name" content="財團法人資訊工業策進會" /><meta property="og:description" content="領域專家趨勢脈動觀察

" /><meta property="og:image" content="https://www.iii.org.tw/assets/images/banner/operation.jpg" /><meta property="og:video" /><meta property="og:video:url" /><meta property="og:video:type" content="application/x-shockwave-flash" /><meta name="twitter:card" content="summary" /><meta name="twitter:url" content="https://www.iii.org.tw/focus/Focus.aspx?f_type=1&amp;fm_sqno=12" /><meta name="twitter:title" content="專家觀點 | 資策會" /><meta name="twitter:description" content="領域專家趨勢脈動觀察

" /><meta name="twitter:image" content="https://www.iii.org.tw/assets/images/banner/operation.jpg" /><meta name="twitter:creator" content="財團法人資訊工業策進會" />

    <link href="/css/style.css" rel="stylesheet" type="text/css" />

    <!-- favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="/favicon.ico" /><link href="/favicon.ico" rel="icon" type="image/x-icon" />
  
    <!-- New stuffs start here -->
    
    <script src="/units/jquery-2.1.3.min.js" type="text/javascript" ></script>
   
    <!-- 電腦版Menu -->
    <link type="text/css" href="/units/menu/style.css" rel="stylesheet" />
    <!-- BANNER/Link Swiper's CSS -->
    <link rel="stylesheet" href="/dist/css/swiper.min.css">
    <!-- New stuffs end here -->

    <link href="/css/jpages/jPages.css" rel="stylesheet" type="text/css"/>
    
    <style>
        #popupcontent{
            position: absolute;
            visibility: hidden;
            overflow: hidden;
            border:1px solid #CCC;
            background-color:#F9F9F9;
            border:1px solid #333;
            padding:5px;
            border-radius: 10px;
            background-image:url("/images/moveImage2.jpg");
			background-size: 100%;
		    z-index:2147483647;
            }
   	 
       #statusbar
       {
       	text-align:right;
       }
    </style>
	<script>
		var baseText = null;
		function showPopup(){

		var popUp = document.getElementById("popupcontent");
		popUp.style.top = (window.screen.height*10/100).toString()+ "px";
		popUp.style.left = (window.screen.width*25/100).toString()+  "px";
		
		popUp.style.width = (window.screen.width*50/100).toString()+ "px";
		//popUp.style.height = (window.screen.height*50/100).toString()+  "px";
		$("#popupcontent").animate({height:(window.screen.height*45/100).toString()+  "px"});
		//$("#popupcontent").animate({width:(window.screen.width*50/100).toString()+  "px"});
		

		if (baseText == null) baseText = popUp.innerHTML;
		popUp.innerHTML = baseText;
		var sbar = document.getElementById("statusbar");
		//sbar.style.marginTop = (parseInt(h)-40).toString()+ "px";
		popUp.style.visibility = "visible";

		}
		/*function hidePopup(){
		
		//var popUp = document.getElementById("popupcontent");
		//popUp.style.visibility = "hidden";
		}*/
		
	     function AnnounceControl()
        {
            if($("#div_Announce").is(':hidden'))
                $("#div_Announce").show(500);
            else
                $("#div_Announce").hide(500);
        }

        function AnnounceControl2(IsShow)
        {
            if(IsShow=="0")
                $("#div_Announce").show(500);
            else
                $("#div_Announce").hide(500);
        }
	</script>
    

    <!--new stuffs start-->
    <link href="/css/page.css" rel="stylesheet" type="text/css"/>

    <!--bread-->
    <link rel="stylesheet" href="/css/bread/css/xbreadcrumbs.css" />

    <!--左側MENU-->
    <link rel="stylesheet" type="text/css" href="/css/conmenu/menu-css.css">
    <script type="text/javascript" src="/units/conmenu/menu_min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".menu ul li").menu();
        });
    </script> 

    <!--tag-->
    <link type="text/css" href="/css/tag/zzsc.css" rel="stylesheet" />
    
    <!--回到最頂-->
    <script type="text/javascript">
        $(function () {
            $("#gotop").click(function () {
                jQuery("html,body").animate({
                    scrollTop: 0
                }, 1000);
            });
            $(window).scroll(function () {
                if ($(this).scrollTop() > 300) {
                    $('#gotop').fadeIn("fast");
                } else {
                    $('#gotop').stop().fadeOut("fast");
                }
            });
        });
    </script>
    <!--new stuffs end-->

    
   	<!--Google+1 plugins 共用元素-->
	<script type="text/javascript">
	    window.___gcfg = { lang: 'zh-TW' };
	    //window.___gcfg = {lang: 'zh-TW', parsetags: 'onload'};
	    (function () {
	        var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
	        po.src = 'https://apis.google.com/js/plusone.js';
	        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
	    })();
	</script>

    <script type="application/ld+json">
    {
      "@context": "https://www.iii.org.tw",
      "@type": "Organization",
      "url": "",
      "logo": "https://www.iii.org.tw/images/logo.png"
    }
    </script>

    

    
        <link href="/css/operation.css" rel="stylesheet" type="text/css" />


<title>
	專家觀點 | 資策會
</title></head>
<body>
    <form method="post" action="./Focus.aspx?f_type=1&amp;fm_sqno=12" id="aspnetForm">
<div class="aspNetHidden">
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="lI9pg4NUGCIO21j8cHpWWy/b8CzUswU6yufzN6wrJOSKxbfDQJOfM7JUO51mj2kCmmtkLUzs8JqO1AS7nRwN0pKG2ilGqv7KFmPo+PFk7S2DdFGaOEpPaO9i38zFLc0dmvliYjtN0CMKks94cyATtARYg9HZZq7WJzJZMgEfa1fLx29122cuqPuzVizblkMwRcetBB2PQStDCQHCKGvlAyXZfcLerFvcMabOEoS4JQdmLRdTtZDD+krLl7LAiHZxb1I8JKNfAXDqaphiJSXty4Q1aKGzqNk1N+33IYKdXSKT78hCU1g1pghFnXZbIqI4Q4wChwV+UCF5QcDCs+vgLqI/A4lFOscAhZCnS/Y9OcGhQ1TxdRt5MmKbqhYh2RfoCKlMbkyYeLxkuysDmh9+/5F+UZWFheHUuxQDWVsmf9JLR5YgfZfIo1XQz7iLGZZVgf8qlglL3JVgLSeV8rqNnZVQKsrQmRF1JgDvvdXZ0dmKW7yqstHQ/oxCkfu8oHy2jrNbEUDJM3JcWtPFkEn6RXxUVwNIbmIgoJHGqTE6iF0vxpSjwpOnMyGHKIkHHlpOg9hHAC//Gmoer0Kvpnu8VKkG7uhwUhWR4ROhjmLoyOrIUenRAHTcdeP5AKfzzARy9fuecPo4DQfajvMCgcFAHNDgX/Ors9eVMMBwvHdwndlru6Mche+4NOFeJ4N4e+X/MFOcxA==" />
</div>

<div class="aspNetHidden">

	<input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="76DCEDAE" />
	<input type="hidden" name="__VIEWSTATEENCRYPTED" id="__VIEWSTATEENCRYPTED" value="" />
	<input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="fJI32mYet2GgvRj7uhYXwRXrWUOEIi1vFdAMc6E+ETlHwiQamSh9cJnm958UUCOhvZNfoG50Bka0UzcTGxuYT3HEfRF/g4XnRnfIEmBBjdG9r7uYlJZOw6KrAeLytHrCz7AH2BIa2HPS1BbkaAWieJEhlIc1HhgqTHoqBDTh179Gex9MeegQVyAhF4mzJgZ69jltBDtld7isJYVkyI1bxPrS1lIRxFPX9a/qJy89t+2q5LfIwd5nRWOhcIDS3y5I6bzxs39xm5WOyTA04eyVdPKRishy4HDbOwFldg6glud4+bZT4c5obMOB7IQv/rLfFYlUe0Ndk/G6Lkn7hAg3oGBj70ZOPRISLbJwy7S9ygIc6UUBno8aZxjcQLNwgGfyQbKIoTK8RGhoPvhJCqlAo54MCrCJZxNsms/M3QJwFSErv3hn8x2W3Yoo9RrrbkfFZqeaR0B7xXdv/cWEbDMpSP6GaJQ=" />
</div>

    <!--nav-all-->
    

			
        <!--nav-all-->
        <nav id="nav-all" class="nav-all">
            <div id="nav-all-content-nav">
                <input type="checkbox" id="nav-trigger" class="nav-trigger" />
                <label for="nav-trigger"></label>
            </div>
			<div id="popupcontent">
				<div id="statusbar">
					<button type="button" class="agree" style="margin: 1%;
						float: none;
						padding: 5px 10px;
						border: 0px solid #593131;
						border-radius: 5px;
						-moz-border-radius: 5px;
						-webkit-border-radius: 5px;
						color: #fff;
						background: #666;
						font-size: 1em;
						position: relative;
						-webkit-appearance: none;" 
						onclick="javascript:location.href='http://bid.iii.org.tw/bid/'">我知道了</button>
				</div>
			</div>

            <div class="naviwithlogo">
            <div id="nav-all-content-search">
                <input type="text" id="search_keyword" class="search-trigger" placeholder="請輸入關鍵字" onkeypress="handle(event)" />
                <a href="#" onclick="searchChk();"><label for="search-trigger"></label></a>
            </div>
            <div id="nav-all-content-pc" style="text-align:right">
                <span><a href="/default.aspx" target="_self">首頁</a></span><span>│</span><span><a href="https://web.iii.org.tw" target="_blank">ENGLISH</a></span><span>│</span><span><a href="/SiteInfo/ContactUs.aspx?fm_sqno=48&ff_sqno=8" target="_self">聯絡我們</a></span><span>│</span><span><a href="/SiteInfo/Sitemap.aspx?fm_sqno=52" target="_self">網站導覽</a></span><span>│</span><span><a href="/Publish/EPaper.aspx?fm_sqno=32" target="_self">電子報訂閱</a></span><span>│</span><span><a href="#####" target="_self">網站資訊</a></span><span>│</span><span><a href="#####" target="_self" onclick="AnnounceControl()"  >公告資訊</a><div id="div_Announce"  style="display:none;"><span style="text-align:right;"><a href="http://bid.iii.org.tw/bid/" target="_blank">採購資訊</a></span> | <span style="text-align:right;"><a href="/Info/AnnounceCooperationList.aspx?fm_sqno=77" target="_self">產學研合作公告</a></span> | <span style="text-align:right;"><a href="/Info/AnnounceList.aspx?fm_sqno=82&AnnounceType=可移轉研發成果說明" target="_self">可移轉研發成果說明</a></span> | <span style="text-align:right;"><a href="/Info/AnnounceList.aspx?fm_sqno=83&AnnounceType=研發成果讓與公告 " target="_self">研發成果讓與公告 </a></span> | <span style="text-align:right;"><a href="/Info/AnnounceList.aspx?fm_sqno=84&AnnounceType=專利招領獎金" target="_self">專利獎金招領公告</a></span> | <span style="text-align:right;"><a href="/Info/AnnounceList.aspx?fm_sqno=85&AnnounceType=補助非營利活動資訊" target="_self">補助非營利活動資訊</a></span></div></span>
                
            </div>

            </div>
            <nav class="navigtion-nav">
                <div class="nav_menu">
                    <div class="nav">
                        <div class="list" id="navlist">
                            <ul id="navfouce">
                                <li class="item-N-n nonestyle"><img src="/assets/images/nav-all/logo.png"/></li>
                                <li class="item-N-n"><a href="#">關於資策會</a></li>   
                                <li class="item-N-n"><a href="#">創新觀點</a></li>   
                                <li class="item-N-n"><a href="#">新聞中心</a></li>
                                <li class="item-N-n"><a href="#">活動與課程</a></li>
                                <li class="item-N-n"><a href="#">產業服務</a></li>   
                                <li class="item-N-n"><a href="#">出版品</a></li>
								<li class="item-N-n"><a href="#">資訊公開</a></li>
                                <li class="item-N-n"><a href="/hr" target="_blank">菁英招募</a></li>
                            </ul>
                        </div>      
                        
                            <div class="box" id="navbox" style="height:0px;opacity:0;overflow:hidden;">
                                
    <div class="cont" style="display:none;">
        <ul class="sublist clearfix">
        
                <li>
                    <h3 class="mcate-item-hd"><span><a href="/About/CoreValue.aspx?fm_sqno=8" target="_self">核心價值</a></span></h3>
                    
                </li>
            
                <li>
                    <h3 class="mcate-item-hd"><span><a href="#####" target="_self">組織簡介</a></span></h3>
                    
                            <p class="mcate-item-bd">
                        
                            <a href="/FFPage.aspx?ff_sqno=2&fm_sqno=33" target="_self">組織架構</a>
                        
                            <a href="/FFPage.aspx?ff_sqno=3&fm_sqno=35" target="_self">董監事會</a>
                        
                            <a href="/About/Headman.aspx?fm_sqno=34" target="_self">經營團隊</a>
                        
                            <a href="/About/Department.aspx?dp_sqno=16&fm_sqno=36" target="_self">業務單位</a>
                        
                            <a href="/FFPage.aspx?ff_sqno=1&fm_sqno=37" target="_self">服務據點</a>
                        
                        </p>
                        
                </li>
            
                <li>
                    <h3 class="mcate-item-hd"><span><a href="/Focus/Focus.aspx?f_type=2&fm_sqno=13" target="_self">焦點報導</a></span></h3>
                    
                </li>
            
                <li>
                    <h3 class="mcate-item-hd"><span><a href="#####" target="_self">得獎肯定</a></span></h3>
                    
                            <p class="mcate-item-bd">
                        
                            <a href="/About/Prize.aspx?prize_type=1&fm_sqno=43" target="_self">國際獎項</a>
                        
                        </p>
                        
                </li>
            
                <li>
                    <h3 class="mcate-item-hd"><span><a href="/About/iii40/index.html" target="_blank">大事紀要</a></span></h3>
                    
                </li>
            
                <li>
                    <h3 class="mcate-item-hd"><span><a href="/About/CSR.aspx?fm_sqno=60" target="_self">企業社會責任</a></span></h3>
                    
                </li>
            
        </ul>
    </div>



                                
    <div class="cont" style="display:none;">
        <ul class="sublist clearfix">
        
                <li>
                    <h3 class="mcate-item-hd"><span><a href="/focus/Focus.aspx?f_type=1&fm_sqno=12" target="_self">專家觀點</a></span></h3>
                    
                </li>
            
                <li>
                    <h3 class="mcate-item-hd"><span><a href="#####" target="_self">新知新訊</a></span></h3>
                    
                            <p class="mcate-item-bd">
                        
                            <a href="/Info/ICTList.aspx?fm_sqno=40" target="_self">產業研究 </a>
                        
                        </p>
                        
                </li>
            
        </ul>
    </div>



                                
    <div class="cont" style="display:none;">
        <ul class="sublist clearfix">
        
                <li>
                    <h3 class="mcate-item-hd"><span><a href="/Press/NewsList.aspx?fm_sqno=14" target="_self">本會新聞</a></span></h3>
                    
                </li>
            
                <li>
                    <h3 class="mcate-item-hd"><span><a href="/Press/Photo.aspx?fm_sqno=16" target="_self">影音精選</a></span></h3>
                    
                            <p class="mcate-item-bd">
                        
                            <a href="/Press/Photo.aspx?fm_sqno=16" target="_self">照片集錦</a>
                        
                            <a href="/Press/Video.aspx?fm_sqno=17" target="_self">活動影音</a>
                        
                        </p>
                        
                </li>
            
        </ul>
    </div>



                                
    <div class="cont" style="display:none;">
        <ul class="sublist clearfix">
        
                <li>
                    <h3 class="mcate-item-hd"><span><a href="/Info/ClassList.aspx?fm_sqno=38" target="_self">精選課程</a></span></h3>
                    
                </li>
            
                <li>
                    <h3 class="mcate-item-hd"><span><a href="/Info/SeminarList.aspx?fm_sqno=19" target="_self">研討活動</a></span></h3>
                    
                </li>
            
        </ul>
    </div>



                                
    <div class="cont" style="display:none;">
        <ul class="sublist clearfix">
        
                <li>
                    <h3 class="mcate-item-hd"><span><a href="/Product/TransferDB.aspx?fm_sqno=23" target="_self">可移轉技術</a></span></h3>
                    
                </li>
            
                <li>
                    <h3 class="mcate-item-hd"><span><a href="/Product/Patent.aspx?fm_sqno=24" target="_self">專利</a></span></h3>
                    
                            <p class="mcate-item-bd">
                        
                            <a href="/Product/PatentAuthority.aspx?fm_sqno=59" target="_self">專利檢索</a>
                        
                            <a href="/Product/PatentGroup.aspx?fm_sqno=54" target="_self">專利組合</a>
                        
                        </p>
                        
                </li>
            
                <li>
                    <h3 class="mcate-item-hd"><span><a href="/Product/BrandAuthority.aspx?fm_sqno=25" target="_self">商標</a></span></h3>
                    
                </li>
            
                <li>
                    <h3 class="mcate-item-hd"><span><a href="/Product/TechLens_Search.aspx?fm_sqno=55" target="_self">產品型錄</a></span></h3>
                    
                            <p class="mcate-item-bd">
                        
                            <a href="/Product/TechLens_Pages.aspx?fm_sqno=72" target="_self">型錄介紹</a>
                        
                            <a href="/Product/TechLens_Video.aspx?fm_sqno=73" target="_self">技術影片</a>
                        
                        </p>
                        
                </li>
            
        </ul>
    </div>



                                
    <div class="cont" style="display:none;">
        <ul class="sublist clearfix">
        
                <li>
                    <h3 class="mcate-item-hd"><span><a href="/Publish/MIC.aspx?fm_sqno=27" target="_self">產業情報</a></span></h3>
                    
                </li>
            
                <li>
                    <h3 class="mcate-item-hd"><span><a href="/Publish/TechLaw.aspx?fm_sqno=29" target="_self">科技法律</a></span></h3>
                    
                </li>
            
                <li>
                    <h3 class="mcate-item-hd"><span><a href="/Publish/Market.aspx?fm_sqno=31" target="_self">產業推動</a></span></h3>
                    
                </li>
            
                <li>
                    <h3 class="mcate-item-hd"><span><a href="/Publish/DownloadPages.aspx?fm_sqno=42" target="_self">下載專區</a></span></h3>
                    
                </li>
            
        </ul>
    </div>



								
    <div class="cont" style="display:none;">
        <ul class="sublist2 clearfix">
        
                <li>
                    <h3 class="mcate-item-hd"><span><a href="/Info/BoardOfDirectorsList.aspx?fm_sqno=80" target="_self">董事會重要決議</a></span></h3>
                    
                </li>
            
                <li>
                    <h3 class="mcate-item-hd"><span><a href="/Info/OpenDataList_Operational.aspx?fm_sqno=75" target="_self">財務報告</a></span></h3>
                    
                </li>
            
                <li>
                    <h3 class="mcate-item-hd"><span><a href="/Info/AnnounceAvoidanceList.aspx?fm_sqno=78" target="_self">免除利益迴避公告</a></span></h3>
                    
                </li>
            
                <li>
                    <h3 class="mcate-item-hd"><span><a href="/Info/GovernmentSubsidyList.aspx?fm_sqno=81" target="_self">政府補助計畫代行資訊</a></span></h3>
                    
                </li>
            
        </ul>
    </div>



                            </div><!--box-->
                    </div><!--nav-->
                </div>
            </nav>

        </nav>

        <script>
            function handle(e) {
                if (e.keyCode === 13) {
                    searchChk();
                }

                return false;
            }
            function searchChk() {
                if (document.getElementById("search_keyword").value == "") {
                    alert("請輸入關鍵字");
                    document.getElementById("search_keyword").focus();
                    event.returnValue = false;
                } else {
                    location = "/Search/SearchResult.aspx?fm_sqno=57&search_keyword=" + encodeURI(document.getElementById("search_keyword").value);
                    event.returnValue = false;
                }
            }
        </script>

    

    <!--手機板MENU-->
    <nav id="nav-s" class="nav-s">
        <ul class="ce">
            <li><a href="/Default.aspx">首頁</a> </li>
            <li>
                <a href="#">關於資策會</a>
                
<ul class="er">

            <li><a href="/About/CoreValue.aspx?fm_sqno=8" class="topmenu_link" target="_self">核心價值</a>
            
        </li>
        <li class="divider"></li>
    
            <li class="e_li"><a href="#####" class="dropdown-toggle topmenu_link" data-toggle="dropdown" aria-expanded="false" target="_self">組織簡介 <b class="caret caret-right"></b></a>
            
			    <ul class="thr">
	                
	                        <li>
                                <a href="/FFPage.aspx?ff_sqno=2&fm_sqno=33" class="topmenu_link" target="_self">組織架構</a>
	                        </li>
	                    
	                        <li>
                                <a href="/FFPage.aspx?ff_sqno=3&fm_sqno=35" class="topmenu_link" target="_self">董監事會</a>
	                        </li>
	                    
	                        <li>
                                <a href="/About/Headman.aspx?fm_sqno=34" class="topmenu_link" target="_self">經營團隊</a>
	                        </li>
	                    
	                        <li>
                                <a href="#####" class="dropdown-toggle topmenu_link" data-toggle="dropdown" aria-expanded="false" target="_self">業務單位 <b class="caret caret-right"></b></a><div class="thr_nr"><a href="/About/Department.aspx?fm_sqno=36&dp_sqno=16" class="topmenu_link">數位服務創新研究所</a></div><div class="thr_nr"><a href="/About/Department.aspx?fm_sqno=36&dp_sqno=18" class="topmenu_link">數位轉型研究所</a></div><div class="thr_nr"><a href="/About/Department.aspx?fm_sqno=36&dp_sqno=17" class="topmenu_link">智慧系統研究所</a></div><div class="thr_nr"><a href="/About/Department.aspx?fm_sqno=36&dp_sqno=7" class="topmenu_link">資安科技研究所</a></div><div class="thr_nr"><a href="/About/Department.aspx?fm_sqno=36&dp_sqno=8" class="topmenu_link">數位教育研究所</a></div><div class="thr_nr"><a href="/About/Department.aspx?fm_sqno=36&dp_sqno=3" class="topmenu_link">產業情報研究所</a></div><div class="thr_nr"><a href="/About/Department.aspx?fm_sqno=36&dp_sqno=9" class="topmenu_link">科技法律研究所 </a></div><div class="thr_nr"><a href="/About/Department.aspx?fm_sqno=36&dp_sqno=10" class="topmenu_link">國際處</a></div><div class="thr_nr"><a href="/About/Department.aspx?fm_sqno=36&dp_sqno=19" class="topmenu_link">地方創生服務處</a></div><div class="thr_nr"><a href="/About/Department.aspx?fm_sqno=36&dp_sqno=14" class="topmenu_link">台日產業推動中心</a></div><div class="thr_nr"><a href="/About/Department.aspx?fm_sqno=36&dp_sqno=20" class="topmenu_link">前瞻中心</a></div><div class="thr_nr"><a href="/About/Department.aspx?fm_sqno=36&dp_sqno=21" class="topmenu_link">網際資安服務中心</a></div>
	                        </li>
	                    
	                        <li>
                                <a href="/FFPage.aspx?ff_sqno=1&fm_sqno=37" class="topmenu_link" target="_self">服務據點</a>
	                        </li>
	                    
                </ul>
            
        </li>
        <li class="divider"></li>
    
            <li><a href="/Focus/Focus.aspx?f_type=2&fm_sqno=13" class="topmenu_link" target="_self">焦點報導</a>
            
        </li>
        <li class="divider"></li>
    
            <li class="e_li"><a href="#####" class="dropdown-toggle topmenu_link" data-toggle="dropdown" aria-expanded="false" target="_self">得獎肯定 <b class="caret caret-right"></b></a>
            
			    <ul class="thr">
	                
	                        <li>
                                <a href="/About/Prize.aspx?prize_type=1&fm_sqno=43" class="topmenu_link" target="_self">國際獎項</a>
	                        </li>
	                    
                </ul>
            
        </li>
        <li class="divider"></li>
    
            <li><a href="/About/iii40/index.html" class="topmenu_link" target="_blank">大事紀要</a>
            
        </li>
        <li class="divider"></li>
    
            <li><a href="/About/CSR.aspx?fm_sqno=60" class="topmenu_link" target="_self">企業社會責任</a>
            
        </li>
        <li class="divider"></li>
    
</ul>


            </li>
            <li>
                <a href="#">創新觀點</a>
                
<ul class="er">

            <li><a href="/focus/Focus.aspx?f_type=1&fm_sqno=12" class="topmenu_link" target="_self">專家觀點</a>
            
        </li>
        <li class="divider"></li>
    
            <li class="e_li"><a href="#####" class="dropdown-toggle topmenu_link" data-toggle="dropdown" aria-expanded="false" target="_self">新知新訊 <b class="caret caret-right"></b></a>
            
			    <ul class="thr">
	                
	                        <li>
                                <a href="/Info/ICTList.aspx?fm_sqno=40" class="topmenu_link" target="_self">產業研究 </a>
	                        </li>
	                    
                </ul>
            
        </li>
        <li class="divider"></li>
    
</ul>


            </li>
            <li>
                <a href="#">新聞中心</a>
                
<ul class="er">

            <li><a href="/Press/NewsList.aspx?fm_sqno=14" class="topmenu_link" target="_self">本會新聞</a>
            
        </li>
        <li class="divider"></li>
    
            <li class="e_li"><a href="#####" class="dropdown-toggle topmenu_link" data-toggle="dropdown" aria-expanded="false" target="_self">影音精選 <b class="caret caret-right"></b></a>
            
			    <ul class="thr">
	                
	                        <li>
                                <a href="/Press/Photo.aspx?fm_sqno=16" class="topmenu_link" target="_self">照片集錦</a>
	                        </li>
	                    
	                        <li>
                                <a href="/Press/Video.aspx?fm_sqno=17" class="topmenu_link" target="_self">活動影音</a>
	                        </li>
	                    
                </ul>
            
        </li>
        <li class="divider"></li>
    
</ul>


            </li>
            <li>
                <a href="#">活動與課程</a>
                
<ul class="er">

            <li><a href="/Info/ClassList.aspx?fm_sqno=38" class="topmenu_link" target="_self">精選課程</a>
            
        </li>
        <li class="divider"></li>
    
            <li><a href="/Info/SeminarList.aspx?fm_sqno=19" class="topmenu_link" target="_self">研討活動</a>
            
        </li>
        <li class="divider"></li>
    
</ul>


            </li>
            <li>
                <a href="#">產業服務</a>
                
<ul class="er">

            <li><a href="/Product/TransferDB.aspx?fm_sqno=23" class="topmenu_link" target="_self">可移轉技術</a>
            
        </li>
        <li class="divider"></li>
    
            <li class="e_li"><a href="#####" class="dropdown-toggle topmenu_link" data-toggle="dropdown" aria-expanded="false" target="_self">專利 <b class="caret caret-right"></b></a>
            
			    <ul class="thr">
	                
	                        <li>
                                <a href="/Product/PatentAuthority.aspx?fm_sqno=59" class="topmenu_link" target="_self">專利檢索</a>
	                        </li>
	                    
	                        <li>
                                <a href="/Product/PatentGroup.aspx?fm_sqno=54" class="topmenu_link" target="_self">專利組合</a>
	                        </li>
	                    
                </ul>
            
        </li>
        <li class="divider"></li>
    
            <li><a href="/Product/BrandAuthority.aspx?fm_sqno=25" class="topmenu_link" target="_self">商標</a>
            
        </li>
        <li class="divider"></li>
    
            <li class="e_li"><a href="#####" class="dropdown-toggle topmenu_link" data-toggle="dropdown" aria-expanded="false" target="_self">產品型錄 <b class="caret caret-right"></b></a>
            
			    <ul class="thr">
	                
	                        <li>
                                <a href="/Product/TechLens_Pages.aspx?fm_sqno=72" class="topmenu_link" target="_self">型錄介紹</a>
	                        </li>
	                    
	                        <li>
                                <a href="/Product/TechLens_Video.aspx?fm_sqno=73" class="topmenu_link" target="_self">技術影片</a>
	                        </li>
	                    
                </ul>
            
        </li>
        <li class="divider"></li>
    
</ul>


            </li>
            <li>
                <a href="#">出版品</a>
                
<ul class="er">

            <li><a href="/Publish/MIC.aspx?fm_sqno=27" class="topmenu_link" target="_self">產業情報</a>
            
        </li>
        <li class="divider"></li>
    
            <li><a href="/Publish/TechLaw.aspx?fm_sqno=29" class="topmenu_link" target="_self">科技法律</a>
            
        </li>
        <li class="divider"></li>
    
            <li><a href="/Publish/Market.aspx?fm_sqno=31" class="topmenu_link" target="_self">產業推動</a>
            
        </li>
        <li class="divider"></li>
    
            <li><a href="/Publish/DownloadPages.aspx?fm_sqno=42" class="topmenu_link" target="_self">下載專區</a>
            
        </li>
        <li class="divider"></li>
    
</ul>


            </li>
            <li>
                <a href="#">資訊公開</a>
                
<ul class="er">

            <li><a href="/Info/BoardOfDirectorsList.aspx?fm_sqno=80" class="topmenu_link" target="_self">董事會重要決議</a>
            
        </li>
        <li class="divider"></li>
    
            <li><a href="/Info/OpenDataList_Operational.aspx?fm_sqno=75" class="topmenu_link" target="_self">財務報告</a>
            
        </li>
        <li class="divider"></li>
    
            <li><a href="/Info/AnnounceAvoidanceList.aspx?fm_sqno=78" class="topmenu_link" target="_self">免除利益迴避公告</a>
            
        </li>
        <li class="divider"></li>
    
            <li><a href="/Info/GovernmentSubsidyList.aspx?fm_sqno=81" class="topmenu_link" target="_self">政府補助計畫代行資訊</a>
            
        </li>
        <li class="divider"></li>
    
</ul>


            </li>            
            <li>
                <a href="/hr" target="_blank">菁英招募</a>
            </li>
            <li>
                <a href="#">快速連結</a>
                
<ul class="er">

            <li><a href="/default.aspx" class="topmenu_link" target="_self">首頁</a>
            
        </li>
        <li class="divider"></li>
    
            <li><a href="https://web.iii.org.tw" class="topmenu_link" target="_blank">ENGLISH</a>
            
        </li>
        <li class="divider"></li>
    
            <li><a href="/SiteInfo/ContactUs.aspx?fm_sqno=48&ff_sqno=8" class="topmenu_link" target="_self">聯絡我們</a>
            
        </li>
        <li class="divider"></li>
    
            <li><a href="/SiteInfo/Sitemap.aspx?fm_sqno=52" class="topmenu_link" target="_self">網站導覽</a>
            
        </li>
        <li class="divider"></li>
    
            <li><a href="/Publish/EPaper.aspx?fm_sqno=32" class="topmenu_link" target="_self">電子報訂閱</a>
            
        </li>
        <li class="divider"></li>
    
            <li class="e_li"><a href="#####" class="dropdown-toggle topmenu_link" data-toggle="dropdown" aria-expanded="false" target="_self">網站資訊 <b class="caret caret-right"></b></a>
            
			    <ul class="thr">
	                
	                        <li>
                                <a href="/SiteInfo/ContactUs.aspx?fm_sqno=48&ff_sqno=8" class="topmenu_link" target="_self">聯絡我們</a>
	                        </li>
	                    
	                        <li>
                                <a href="/FFPage.aspx?ff_sqno=5&fm_sqno=49" class="topmenu_link" target="_self">隱私權聲明 </a>
	                        </li>
	                    
	                        <li>
                                <a href="/FFPage.aspx?ff_sqno=6&fm_sqno=50" class="topmenu_link" target="_self">網站資訊使用聲明</a>
	                        </li>
	                    
	                        <li>
                                <a href="/SiteInfo/PersonalData.aspx?fm_sqno=51" class="topmenu_link" target="_self">個資當事人行使權利專頁</a>
	                        </li>
	                    
	                        <li>
                                <a href="/SiteInfo/SiteMap.aspx?fm_sqno=52" class="topmenu_link" target="_self">網站導覽 </a>
	                        </li>
	                    
	                        <li>
                                <a href="/Info/LinksList.aspx?fm_sqno=22" class="topmenu_link" target="_self">推薦連結</a>
	                        </li>
	                    
	                        <li>
                                <a href="/Publish/EPaper.aspx?fm_sqno=32" class="topmenu_link" target="_self">電子報訂閱</a>
	                        </li>
	                    
	                        <li>
                                <a href="/Search/SearchResult.aspx?fm_sqno=57&search_keyword=" class="topmenu_link" target="_self">搜尋</a>
	                        </li>
	                    
                </ul>
            
        </li>
        <li class="divider"></li>
    
            <li class="e_li"><a href="#####" class="dropdown-toggle topmenu_link" data-toggle="dropdown" aria-expanded="false" target="_self">公告資訊 <b class="caret caret-right"></b></a>
            
			    <ul class="thr">
	                
	                        <li>
                                <a href="http://bid.iii.org.tw/bid/" class="topmenu_link" target="_blank">採購資訊</a>
	                        </li>
	                    
	                        <li>
                                <a href="/Info/AnnounceCooperationList.aspx?fm_sqno=77" class="topmenu_link" target="_self">產學研合作公告</a>
	                        </li>
	                    
	                        <li>
                                <a href="/Info/AnnounceList.aspx?fm_sqno=82&AnnounceType=可移轉研發成果說明" class="topmenu_link" target="_self">可移轉研發成果說明</a>
	                        </li>
	                    
	                        <li>
                                <a href="/Info/AnnounceList.aspx?fm_sqno=83&AnnounceType=研發成果讓與公告 " class="topmenu_link" target="_self">研發成果讓與公告 </a>
	                        </li>
	                    
	                        <li>
                                <a href="/Info/AnnounceList.aspx?fm_sqno=84&AnnounceType=專利招領獎金" class="topmenu_link" target="_self">專利獎金招領公告</a>
	                        </li>
	                    
	                        <li>
                                <a href="/Info/AnnounceList.aspx?fm_sqno=85&AnnounceType=補助非營利活動資訊" class="topmenu_link" target="_self">補助非營利活動資訊</a>
	                        </li>
	                    
                </ul>
            
        </li>
        <li class="divider"></li>
    
</ul>


            </li>
            <li>
                <a href="/SiteInfo/ContactUs.aspx?fm_sqno=48&ff_sqno=8" >聯絡我們</a>
            </li>
            <li>
                <a href="https://web.iii.org.tw">ENGLISH</a>
            </li>
        </ul>
    </nav>





    <div id="container" class="container">


       <!--ContentPlaceHolder1-->
            
          
    <div id="container" class="container page">
            <section id="bn">
                <div class="maintitle">
                    <h3>專家觀點</h3>
                    <p>領域專家趨勢脈動觀察</p>
                </div>
            </section>
          <a name="gothis"></a>
            
                <script>$('#bn').css('background-image', 'url(/assets/images/banner/operation.jpg)');</script>
                

            <!--Bread-->
            <section id="bread">
                <div class="road">
                    <ul class="xbreadcrumbs" id="breadcrumbs-1">
                        <span id="ctl00_ctl00_ContentPlaceHolder_base_lbl_Breadcrum"><li><a href="/Default.aspx" class="home">首頁</a></li><li><a href="#" class="navi_link"> 創新觀點</a></li> <li class="active"><a href="/focus/Focus.aspx?f_type=1&fm_sqno=12" class="navi_link">專家觀點</a></li></span>
                  </ul>
                </div>
            </section>
             <section id="bread" style="border-bottom:none;">
                <div class="road">
                    <div class="tools">
                        <div class="toollist">
                            
<script type="text/javascript">
    $(document).ready(function () {

        $('#incfont').click(function () {

            var element = $('#text_content');

            var curSize = parseInt(element.css('font-size')) + 2;

            if (curSize <= 20) {
                element.css('font-size', curSize);
            }

            setChildDivFontBig($('#text_content'));
            
        });
        $('#decfont').click(function () {
            var element = $('#text_content');

            var curSize = parseInt(element.css('font-size')) - 2;

            if (curSize >= 12) {
                element.css('font-size', curSize);
            }
            setChildDivFontSmall($('#text_content'));


        });

    });

    function setChildDivFontBig(ele) {
        var element = ele.children();

        element.each(function (i) {
            var curSize = parseInt($(this).css('font-size')) + 2;
            if (curSize <= 20) {
                $(this).css('font-size', curSize);
            }

            //recursive
            setChildDivFontBig($(this));
        });

    }
    function setChildDivFontSmall(ele) {
        var element = ele.children();

        element.each(function (i) {
            var curSize = parseInt($(this).css('font-size')) - 2;
            if (curSize >= 12) {
                $(this).css('font-size', curSize);
            }

            //recursive
            setChildDivFontSmall($(this));
        });

    }
    function PrintElem(elem) {
        //Popup($(elem).html(), $('head').html());
		
		var printContents = $(elem).html();
		var originalContents = $('html')[0].outerHTML;

		document.body.innerHTML = printContents;

		window.print();

		document.write(originalContents);
    }

    function Popup(data, head) {
        var mywindow = window.open('', 'Print', 'height=768,width=1024');
        mywindow.document.write('<html xmlns="http://www.w3.org/1999/xhtml">');
        mywindow.document.write('<head>');
        mywindow.document.write(head);
        mywindow.document.write('</head><body >');
        mywindow.document.write(data);
        mywindow.document.write('</body></html>');

        mywindow.document.close(); // necessary for IE >= 10
        mywindow.focus(); // necessary for IE >= 10

        mywindow.print();
        mywindow.close();

        return true;
    }
    function detectmob() {
        if (navigator.userAgent.match(/Android/i)
        || navigator.userAgent.match(/webOS/i)
        || navigator.userAgent.match(/iPhone/i)
        || navigator.userAgent.match(/iPad/i)
        || navigator.userAgent.match(/iPod/i)
        || navigator.userAgent.match(/BlackBerry/i)
        || navigator.userAgent.match(/Windows Phone/i)
        ) {
            return true;
        }
        else {
            return false;
        }
    }

</script>

<div class="t1"><a href="mailto:?subject=[分享] 專家觀點 | 資策會&body=分享網頁訊息：
領域專家趨勢脈動觀察
https%3a%2f%2fwww.iii.org.tw%2ffocus%2fFocus.aspx%3ff_type%3d1%26fm_sqno%3d12" title="用 Email 轉寄" onclick="return confirm('您確定要轉寄這個網頁?');"><img src="/assets/images/tool/1.jpg" alt="用 Email 轉寄" /></a></div>
<div class="t1"><a href="#####" onclick="PrintElem('#text_content');"><img src="/assets/images/tool/2.jpg" alt="友善列印" /></a></div>
<div class="t1"><a href="#####" id="decfont"><img src="/assets/images/tool/3.jpg" border="0" alt="縮小字體" /></a></div>
<div class="t1"><a href="#####" id="incfont"><img src="/assets/images/tool/4.jpg" border="0" alt="放大字體" /></a></div>

<!-- Your share button code -->

<div class="t1"><a href="javascript: void(window.open('https://plus.google.com/share?url='.concat(encodeURIComponent(location.href)) ));">
                                <img src="/assets/images/tool/6.jpg" width="26" height="26" alt="Google+分享"  /></a></div>
<div class="t1"><a href="javascript: void(window.open('https://twitter.com/intent/tweet?'.concat('original_referer=').concat(encodeURIComponent(location.href)).concat('&text=').concat(encodeURIComponent(document.title)).concat('&tw_p=tweetbutton&url=').concat(encodeURIComponent(location.href)) ));">
                                <img src="/assets/images/tool/7.jpg" width="26" height="26" alt="Twitter分享" /></a></div>

<div class="t1" id="div_line"><a href="javascript: void(window.open('https://line.naver.jp/R/msg/text/?'.concat(encodeURIComponent(document.title)).concat(' ').concat(encodeURIComponent(location.href)) ));">
    <img src="/images/linebutton_30x30_zh-hant.png" width="26" height="26" alt="用LINE傳送" /></a></div>
        
<div class="t1" style="padding-right:50px; width :100px">
    <div class="fb-share-button" id="div_facebook"
    data-href="" 
    data-layout="button_count" data-size="large">
    </div>
</div>

<script>
    if (!detectmob())
        document.getElementById('div_line').style.display = 'none';
    document.getElementById('div_facebook').attributes["data-href"] = encodeURIComponent(location.href) ;
</script>

                        </div>
                    </div>
                </div>
            </section>




            <!--content-->
            <a id="head"></a>
            <section>
                
                <div id="text_content">
               
                    

                    <!-- left menu                                           
                        <ul >
-->
                    <div class="menu">
                        <ul>
                            <li><div class="title"><h2><span id="ctl00_ctl00_ContentPlaceHolder_base_UC_PageMenu_New_lbl_ChannelTitle">創新觀點</span></h2></div></li>
                            
                                    <li>
                                        <a href="/focus/Focus.aspx?f_type=1&fm_sqno=12" target="_self"  class="on">專家觀點</a>
                                        <input id="Hidden1" type="hidden" Y />
                                        
                                    </li>
                                
                                    <li>
                                        <a href="#sub2" target="_self" >新知新訊</a>
                                        <input id="Hidden1" type="hidden" N />
                                        
                                        <ul >
                                            
                                                <li >
                                                    <a href="/Info/ICTList.aspx?fm_sqno=40" target="_self">產業研究 </a>
                                                    
                                                </li>
                                            
                                              </ul>
                                            
                                    </li>
                                
                        </ul>
                    </div>







                   
                    <div class="contentinfo">
                        <div id="ctl00_ctl00_ContentPlaceHolder_base_divChannelTitle" class="title">
                            <h2>專家觀點</h2>
                        </div>
                        
                        <span id="ctl00_ctl00_ContentPlaceHolder_base_spanChannelTitleLine" class="line"></span>

                        <!--main conetnt start-->

                        

    <div class="sear">

        
        <select name="ctl00$ctl00$ContentPlaceHolder_base$ContentPlaceHolder1$dp_f_cgy" id="ctl00_ctl00_ContentPlaceHolder_base_ContentPlaceHolder1_dp_f_cgy">
	<option selected="selected" value="">全部類別</option>
	<option value="1">智庫幕僚</option>
	<option value="2">技術研發</option>
	<option value="3">產業推動</option>
	<option value="4">人才培育</option>
	<option value="5">應用推廣</option>
	<option value="6">國際業務</option>

</select>

        <select name="ctl00$ctl00$ContentPlaceHolder_base$ContentPlaceHolder1$dp_f_pubdate" id="ctl00_ctl00_ContentPlaceHolder_base_ContentPlaceHolder1_dp_f_pubdate">
	<option selected="selected" value="">不限年度</option>
	<option value="2020">2020年</option>
	<option value="2019">2019年</option>
	<option value="2018">2018年</option>
	<option value="2017">2017年</option>
	<option value="2016">2016年</option>
	<option value="2015">2015年</option>
	<option value="2014">2014年</option>

</select>

        <input name="ctl00$ctl00$ContentPlaceHolder_base$ContentPlaceHolder1$tb_keyword" type="text" id="ctl00_ctl00_ContentPlaceHolder_base_ContentPlaceHolder1_tb_keyword" style="width:110px;" />

        <input type="image" name="ctl00$ctl00$ContentPlaceHolder_base$ContentPlaceHolder1$btn_Search" id="ctl00_ctl00_ContentPlaceHolder_base_ContentPlaceHolder1_btn_Search" src="../assets/images/search.jpg" />
    </div>

    <article>

        
            <div class="focus-I-wrap" id="itemContainer">


                
                        
                        <div class="focus-I">
                            <a href="FocusDtl.aspx?f_type=1&f_sqno=%2fiBsIGQe4cZk5958qRFWsg__&fm_sqno=12">
                                <img src="/Files/Channel/Focus/View/satellitesss.jpg" class="focus-I-title" />
                            </a>
                            <div class="date pull-left" >
                                2020/05/10&nbsp;&nbsp;
                                
                            </div>
                            <div class="focus_short pull-left">
                                 <a href="FocusDtl.aspx?f_type=1&f_sqno=%2fiBsIGQe4cZk5958qRFWsg__&fm_sqno=12">
                                <h4>Covid-19衝擊，催出低軌衛星產業發展危機與商機 </h4>
                                     </a>
                            </div>
                            <p class="content">無論是經濟活動、國防建設或民生應用，現代人對寬頻網路系統及性能都有極高要求，尤其網路安全在已開發國家中屬國安議題，地面電信網路、行動通訊系統、地面或跨海光纖系統皆需與時俱進。&nbsp;</p>
                            <a href="FocusDtl.aspx?f_type=1&f_sqno=%2fiBsIGQe4cZk5958qRFWsg__&fm_sqno=12"><div class="operate-I-more">READ MORE</div></a>
                        </div>

                    
                        <div class="focus-I">
                            <a href="FocusDtl.aspx?f_type=1&f_sqno=Qz8F3rVNm72XyJlcOZ7UMA__&fm_sqno=12">
                                <img src="/Files/Channel/Focus/View/covidssss.jpg" class="focus-I-title" />
                            </a>
                            <div class="date pull-left" >
                                2020/04/22&nbsp;&nbsp;
                                產研所 | 張筱祺 資深產業分析師兼組長
                            </div>
                            <div class="focus_short pull-left">
                                 <a href="FocusDtl.aspx?f_type=1&f_sqno=Qz8F3rVNm72XyJlcOZ7UMA__&fm_sqno=12">
                                <h4>新冠肺炎疫情對全球旅遊與會展服務業之影響觀測 </h4>
                                     </a>
                            </div>
                            <p class="content">隨著全球疫情蔓延，各國陸續宣布鎖國、出入境管制及停發觀光簽證等相關限制，對觀光旅遊產業的衝擊甚深。&nbsp;</p>
                            <a href="FocusDtl.aspx?f_type=1&f_sqno=Qz8F3rVNm72XyJlcOZ7UMA__&fm_sqno=12"><div class="operate-I-more">READ MORE</div></a>
                        </div>

                    
                        <div class="focus-I">
                            <a href="FocusDtl.aspx?f_type=1&f_sqno=yQMoQ%2bils%2fCubVdkdoe11Q__&fm_sqno=12">
                                <img src="/Files/Channel/Focus/View/ceosss.jpg" class="focus-I-title" />
                            </a>
                            <div class="date pull-left" >
                                2020/04/22&nbsp;&nbsp;
                                產研所 | 楊中傑 產業顧問兼主任
                            </div>
                            <div class="focus_short pull-left">
                                 <a href="FocusDtl.aspx?f_type=1&f_sqno=yQMoQ%2bils%2fCubVdkdoe11Q__&fm_sqno=12">
                                <h4>那些CEO教我的成功要訣 </h4>
                                     </a>
                            </div>
                            <p class="content">資策會產業情報研究所（MIC）在今年第1季參與竹科管理局的計畫，對科學園區數家在過去幾年持續高度成長的廠商CEO進行訪談，分享其成功發展的經驗，與如何面對未來的機會與挑戰。&nbsp;</p>
                            <a href="FocusDtl.aspx?f_type=1&f_sqno=yQMoQ%2bils%2fCubVdkdoe11Q__&fm_sqno=12"><div class="operate-I-more">READ MORE</div></a>
                        </div>

                    
                        <div class="focus-I">
                            <a href="FocusDtl.aspx?f_type=1&f_sqno=MtWyey6OisS5HXHTm7Th4g__&fm_sqno=12">
                                <img src="/Files/Channel/Focus/View/covidsss.jpg" class="focus-I-title" />
                            </a>
                            <div class="date pull-left" >
                                2020/04/08&nbsp;&nbsp;
                                產研所 | 甘岱右 產業分析師
                            </div>
                            <div class="focus_short pull-left">
                                 <a href="FocusDtl.aspx?f_type=1&f_sqno=MtWyey6OisS5HXHTm7Th4g__&fm_sqno=12">
                                <h4>從新冠肺炎 看資料應用發展的關鍵議題 </h4>
                                     </a>
                            </div>
                            <p class="content">新型冠狀病毒（COVID-19）疫情從2020年初延燒至今，考驗各國政府及企業的應變能力。資料應用在疫情發生的前、中、後期，如疫情追蹤、影響預測、資訊流通平台等扮演要角。&nbsp;</p>
                            <a href="FocusDtl.aspx?f_type=1&f_sqno=MtWyey6OisS5HXHTm7Th4g__&fm_sqno=12"><div class="operate-I-more">READ MORE</div></a>
                        </div>

                    
                        <div class="focus-I">
                            <a href="FocusDtl.aspx?f_type=1&f_sqno=wQTPoJnpriTx9rQu3TzFaQ__&fm_sqno=12">
                                <img src="/Files/Channel/Focus/View/carsss.jpg" class="focus-I-title" />
                            </a>
                            <div class="date pull-left" >
                                2020/03/23&nbsp;&nbsp;
                                塗家瑋 | 產業分析師兼專案經理
                            </div>
                            <div class="focus_short pull-left">
                                 <a href="FocusDtl.aspx?f_type=1&f_sqno=wQTPoJnpriTx9rQu3TzFaQ__&fm_sqno=12">
                                <h4>披荊斬棘 2020智慧車發展趨勢前瞻 </h4>
                                     </a>
                            </div>
                            <p class="content">自去年起全球汽車產業受到生產技術轉變以及市場需求減少，醞釀好幾波大規模裁員潮，而到今年初新冠肺炎疫情蔓延全球，尤其是中國大陸汽車製造重鎮武漢更是重災區，許多工廠延遲開工，讓全球汽車供應鏈遭受影響，也讓車市短期回溫的希望更趨渺茫。面對接踵而來的壞消息，甚至是黑天鵝事件衝擊，如何透過新興科技，加速汽車產業的轉型，將是2020智慧車的重要發展契機。&nbsp;</p>
                            <a href="FocusDtl.aspx?f_type=1&f_sqno=wQTPoJnpriTx9rQu3TzFaQ__&fm_sqno=12"><div class="operate-I-more">READ MORE</div></a>
                        </div>

                    
                        <div class="focus-I">
                            <a href="FocusDtl.aspx?f_type=1&f_sqno=uXx6sVZrPuAg%2bK3cgy7c3Q__&fm_sqno=12">
                                <img src="/Files/Channel/Focus/View/Elderly societysss.jpg" class="focus-I-title" />
                            </a>
                            <div class="date pull-left" >
                                2020/03/22&nbsp;&nbsp;
                                產研所 | 厲秀玲 產業顧問兼副主任
                            </div>
                            <div class="focus_short pull-left">
                                 <a href="FocusDtl.aspx?f_type=1&f_sqno=uXx6sVZrPuAg%2bK3cgy7c3Q__&fm_sqno=12">
                                <h4>迎向超高齡社會的老年科技趨勢觀察 </h4>
                                     </a>
                            </div>
                            <p class="content">台灣人口老化速度更快，依國發會2018年推估資料，2026年將進入超高齡社會（65歲以上人口占20%）。人口老化對社會和經濟系統帶來的風險包括勞動力短缺、扶養比攀升、醫療保健成本不斷增加、經濟成長放緩等。美國、日本、新加坡等國因應未來的人口結構變化進行調適規劃，藉由觀察這些國家協助老年者的技術研發動向，可供我國業者開發相關產品和服務的思考方向。&nbsp;</p>
                            <a href="FocusDtl.aspx?f_type=1&f_sqno=uXx6sVZrPuAg%2bK3cgy7c3Q__&fm_sqno=12"><div class="operate-I-more">READ MORE</div></a>
                        </div>

                    
                        <div class="focus-I">
                            <a href="FocusDtl.aspx?f_type=1&f_sqno=DdiOU%2b5UJQo%2fKdvVMsD8gw__&fm_sqno=12">
                                <img src="/Files/Channel/Focus/View/supply chainsss.jpg" class="focus-I-title" />
                            </a>
                            <div class="date pull-left" >
                                2020/03/08&nbsp;&nbsp;
                                產研所 | 楊欣倫 產業分析師
                            </div>
                            <div class="focus_short pull-left">
                                 <a href="FocusDtl.aspx?f_type=1&f_sqno=DdiOU%2b5UJQo%2fKdvVMsD8gw__&fm_sqno=12">
                                <h4>供應鏈遷徙潮再起，廠商的下一步 </h4>
                                     </a>
                            </div>
                            <p class="content">2018年最受眾人矚目的焦點，莫過於美中貿易衝突，經過數波調高關稅、禁售令等措施，引起供應鏈的震盪，歷經兩年的協商，在美中談判前景未明的情境下，企業經營的影響仍餘波盪漾。&nbsp;</p>
                            <a href="FocusDtl.aspx?f_type=1&f_sqno=DdiOU%2b5UJQo%2fKdvVMsD8gw__&fm_sqno=12"><div class="operate-I-more">READ MORE</div></a>
                        </div>

                    
                        <div class="focus-I">
                            <a href="FocusDtl.aspx?f_type=1&f_sqno=mpbJCJ02qzmZ%2fXw1kyvalQ__&fm_sqno=12">
                                <img src="/Files/Channel/Focus/View/Digital learningss.jpg" class="focus-I-title" />
                            </a>
                            <div class="date pull-left" >
                                2020/03/08&nbsp;&nbsp;
                                產研所 | 鐘映庭 產業分析師
                            </div>
                            <div class="focus_short pull-left">
                                 <a href="FocusDtl.aspx?f_type=1&f_sqno=mpbJCJ02qzmZ%2fXw1kyvalQ__&fm_sqno=12">
                                <h4>防疫宅學習，數位學習∕遠距學習迎來關鍵發展機會 </h4>
                                     </a>
                            </div>
                            <p class="content">自中國武漢爆發新冠病毒（COVID-19）疫情以來，疫情蔓延至鄰近國家，對各國經濟發展與國民健康造成衝擊，考量新冠病毒高傳染力特性，以及國內各級學校防疫資源準備，我國教育部宣布高中（含）以下延後至2月25日開學，大專院校開學日亦延至2月25日之後。為了確保學生學習不中斷，教育部彙集中央、地方政府與民間數位學習平台資源，提供各級學校師生運用。&nbsp;</p>
                            <a href="FocusDtl.aspx?f_type=1&f_sqno=mpbJCJ02qzmZ%2fXw1kyvalQ__&fm_sqno=12"><div class="operate-I-more">READ MORE</div></a>
                        </div>

                    
                        <div class="focus-I">
                            <a href="FocusDtl.aspx?f_type=1&f_sqno=km2ADrdTRbqmspNtcsClJQ__&fm_sqno=12">
                                <img src="/Files/Channel/Focus/View/gamesss.jpg" class="focus-I-title" />
                            </a>
                            <div class="date pull-left" >
                                2020/02/24&nbsp;&nbsp;
                                產研所 | 簡妤安 產業分析師
                            </div>
                            <div class="focus_short pull-left">
                                 <a href="FocusDtl.aspx?f_type=1&f_sqno=km2ADrdTRbqmspNtcsClJQ__&fm_sqno=12">
                                <h4>AI創作與協作 內容產業新助力 </h4>
                                     </a>
                            </div>
                            <p class="content">隨人工智慧（AI）不斷發展，內容產業各環節也導入相關應用。以往創意表現被認為是人類所獨有的能力之一，然而隨AI逐步成長，在文藝傳統的琴棋書畫四大領域，如音樂、遊戲、文本，與圖像創作上，均已可見多樣機器生成內容應用，投入創作與產製協作。&nbsp;</p>
                            <a href="FocusDtl.aspx?f_type=1&f_sqno=km2ADrdTRbqmspNtcsClJQ__&fm_sqno=12"><div class="operate-I-more">READ MORE</div></a>
                        </div>

                    
                        <div class="focus-I">
                            <a href="FocusDtl.aspx?f_type=1&f_sqno=0YoEOJ1dWGRMWMR%2bp1wpuw__&fm_sqno=12">
                                <img src="/Files/Channel/Focus/View/未命名-2.jpg" class="focus-I-title" />
                            </a>
                            <div class="date pull-left" >
                                2020/02/23&nbsp;&nbsp;
                                產研所 | 林信亨 資深產業分析師兼專案經理
                            </div>
                            <div class="focus_short pull-left">
                                 <a href="FocusDtl.aspx?f_type=1&f_sqno=0YoEOJ1dWGRMWMR%2bp1wpuw__&fm_sqno=12">
                                <h4>臺灣民生公共物聯網策略分析 </h4>
                                     </a>
                            </div>
                            <p class="content">IoT的應用領域非常廣泛，涵蓋公領域與私領域。「民生公共物聯網」屬於前者，國際英文通用名稱為Public IoT，台灣另稱為Civil IoT（簡稱CIoT），其意指與民生息息相關的公共物聯網，主要由政府提供IoT解決方案，服務對象為一般大眾（G2C）或企業（G2B）。「公共應用」訴求開放場域，聯網裝置分布廣及遠，且數量龐大，其用途則主要針對公眾服務，如智慧安防、智慧環境、智慧能資源、智慧交通、智慧農業等五大應用領域。&nbsp;</p>
                            <a href="FocusDtl.aspx?f_type=1&f_sqno=0YoEOJ1dWGRMWMR%2bp1wpuw__&fm_sqno=12"><div class="operate-I-more">READ MORE</div></a>
                        </div>

                    
                    

            </div>
        

        

        <div class="holder">
            <span id="ctl00_ctl00_ContentPlaceHolder_base_ContentPlaceHolder1_DataPager_Bottom"><a class="aspNetDisabled jp-previous">← previous</a>&nbsp;<span class="jp-current">1</span>&nbsp;<a href="/focus/Focus.aspx?f_type=1&amp;fm_sqno=12&amp;pageid=2">2</a>&nbsp;<a href="/focus/Focus.aspx?f_type=1&amp;fm_sqno=12&amp;pageid=3">3</a>&nbsp;<a href="/focus/Focus.aspx?f_type=1&amp;fm_sqno=12&amp;pageid=4">4</a>&nbsp;<a href="/focus/Focus.aspx?f_type=1&amp;fm_sqno=12&amp;pageid=5">5</a>&nbsp;<a href="/focus/Focus.aspx?f_type=1&amp;fm_sqno=12&amp;pageid=6">6</a>&nbsp;<a href="/focus/Focus.aspx?f_type=1&amp;fm_sqno=12&amp;pageid=7">7</a>&nbsp;<a href="/focus/Focus.aspx?f_type=1&amp;fm_sqno=12&amp;pageid=8">8</a>&nbsp;<a href="/focus/Focus.aspx?f_type=1&amp;fm_sqno=12&amp;pageid=9">9</a>&nbsp;<a href="/focus/Focus.aspx?f_type=1&amp;fm_sqno=12&amp;pageid=10">10</a>&nbsp;&nbsp;<a href="/focus/Focus.aspx?f_type=1&amp;fm_sqno=12&amp;pageid=11">next 10 pages</a>&nbsp;<a class="jp-next" href="/focus/Focus.aspx?f_type=1&amp;fm_sqno=12&amp;pageid=2">next →</a>&nbsp;</span>

        </div>

    </article>
    


    

    

    



                        <!--main conetnt end-->


                        <div class="backto">
                            <div class="toptool">
                                <div id="gotop"><img src="/assets/images/about/top.png"></div>
                            </div>
                        </div>
                    </div>

                </div>

            </section>
        </div>
            <!--content end-->















        


        <!--about-iii-->
        <section id="link-about">
            <div class="item-A-wrap">
                <div class="item-A active-img" id="copyinfo">
                    <p>所登載的內容係屬本會版權所有<br />
                    </p>
                    <p>在未取得本會書面同意前</p>
                    <p>不得做片面、全面使用，拷貝、列印、轉載於任何媒體</p>
                    <p><span><a href="/FFPage.aspx?ff_sqno=5&fm_sqno=49">隱私權聲明</a></span><span>│</span><span><a href="/SiteInfo/TermOfUse.aspx?fm_sqno=50">網站資訊使用聲明</a></span><span>│</span><span><a href="/SiteInfo/PersonalData.aspx?fm_sqno=51">個資當事人行使權利專頁</a></span></p>
                    <p>建議瀏覽器:</p>
                    <p>本網站支援IE10以上、Firefox及Chrome</p>
                </div>
                <div class="item-A active-img">
                    <img src="/assets/images/about-iii/copyright.png" alt="" />
                    <p>10622台北市大安區和平東路二段106號11樓</p>
                    <p><a tel="0266318168">TEL 02-6631-8168</a></p>
                    <p><a tel="0266318168">FAX 02-2737-7113</a></p>
                </div>
                <div class="item-A active-img">
                    <div class="fb-page" data-href="https://www.facebook.com/weloveIII" data-small-header="true" data-adapt-container-width="true" data-hide-cover="true" data-show-facepile="true" data-show-posts="false">
                        <div class="fb-xfbml-parse-ignore">
                            <blockquote cite="https://www.facebook.com/weloveIII"><a href="https://www.facebook.com/weloveIII">資策會</a></blockquote>
                        </div>
                    </div>
                </div>
            </div>
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/zh_TW/sdk.js#xfbml=1&version=v2.9&appId=294382590268";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
        
    <script src="/units/modernizr-custom.js" type="text/javascript"></script>
    <script src="/units/slick/slick.js" type="text/javascript"></script>
    <script src="/units/wheel/jquery.mousewheel.min.js" type="text/javascript"></script>
    <script src="/units/easing/jquery.easing.1.3.js" type="text/javascript"></script>
    <script src="/units/config/config.js" type="text/javascript"></script>
    <script src="/units/slider_ad.js" type="text/javascript"></script>
    <script src="/units/i_news.js" type="text/javascript"></script>
    <script src="/units/focus_news.js" type="text/javascript"></script>
    <script src="/units/link_others.js" type="text/javascript"></script>       
    <script src="/units/link-favorite.js" type="text/javascript"></script>
    <script src="/units/about_iii.js" type="text/javascript"></script>
    <script src="/units/modules/animate_events.js" type="text/javascript"></script>
    <script src="/units/modules/media_events.js" type="text/javascript"></script>
   	<!--Google+1 plugins 共用元素-->
	<script type="text/javascript">
	    window.___gcfg = { lang: 'zh-TW' };
	    //window.___gcfg = {lang: 'zh-TW', parsetags: 'onload'};
	    (function () {
	        var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
	        po.src = 'https://apis.google.com/js/plusone.js';
	        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
	    })();
	</script>

    <script type="application/ld+json">
    {
      "@context": "http://www.iii.org.tw",
      "@type": "Organization",
      "url": "",
      "logo": "http://www.iii.org.tw/images/logo.png"
    }
    </script>
	<!--手機板MENU-->
    <script type="text/javascript" src="/units/menumobile/main.js"></script>
    <!--電腦版Menu-->
    <script type="text/javascript" src="/units/menu/menu.js"></script>
    
    </form>

	<!--google-analytics-->
    <script>
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date(); a = s.createElement(o),
            m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

        ga('create', 'UA-11444707-1', 'auto');
        ga('send', 'pageview');

    </script>

</body>
</html>
