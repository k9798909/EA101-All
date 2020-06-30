<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.shop.model.*"%>
<%@ include file="/front-end/front-end-nav.jsp" %>


<!DOCTYPE html>
<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" /><meta name="description" content="���M�a�Ͷկ߰��[��

" /><meta name="keywords" content="���~��s,��������,��ުk�v,�޳N��o,���~����,���M�a,�}���[�I" /><meta name="author" content="�]�Ϊk�H��T�u�~���i�|" /><meta name="copyright" content="�]�Ϊk�H��T�u�~���i�|" /><meta name="application-name" content="�]�Ϊk�H��T�u�~���i�|" /><meta name="URL" content="https://www.iii.org.tw/focus/Focus.aspx?f_type=1&amp;fm_sqno=12" /><meta property="article:author" content="https://www.facebook.com/weloveIII/" /><meta property="article:publisher" content="https://www.facebook.com/weloveIII/" /><meta property="fb:app_id" content="294382590268" /><meta property="og:url" content="https://www.iii.org.tw/focus/Focus.aspx?f_type=1&amp;fm_sqno=12" /><meta property="og:title" content="�M�a�[�I | �굦�|" /><meta property="og:type" content="article" /><meta property="og:site_name" content="�]�Ϊk�H��T�u�~���i�|" /><meta property="og:description" content="���M�a�Ͷկ߰��[��

" /><meta property="og:image" content="https://www.iii.org.tw/assets/images/banner/operation.jpg" /><meta property="og:video" /><meta property="og:video:url" /><meta property="og:video:type" content="application/x-shockwave-flash" /><meta name="twitter:card" content="summary" /><meta name="twitter:url" content="https://www.iii.org.tw/focus/Focus.aspx?f_type=1&amp;fm_sqno=12" /><meta name="twitter:title" content="�M�a�[�I | �굦�|" /><meta name="twitter:description" content="���M�a�Ͷկ߰��[��

" /><meta name="twitter:image" content="https://www.iii.org.tw/assets/images/banner/operation.jpg" /><meta name="twitter:creator" content="�]�Ϊk�H��T�u�~���i�|" />

    <link href="/css/style.css" rel="stylesheet" type="text/css" />

    <!-- favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="/favicon.ico" /><link href="/favicon.ico" rel="icon" type="image/x-icon" />
  
    <!-- New stuffs start here -->
    
    <script src="/units/jquery-2.1.3.min.js" type="text/javascript" ></script>
   
    <!-- �q����Menu -->
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

    <!--����MENU-->
    <link rel="stylesheet" type="text/css" href="/css/conmenu/menu-css.css">
    <script type="text/javascript" src="/units/conmenu/menu_min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".menu ul li").menu();
        });
    </script> 

    <!--tag-->
    <link type="text/css" href="/css/tag/zzsc.css" rel="stylesheet" />
    
    <!--�^��̳�-->
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

    
   	<!--Google+1 plugins �@�Τ���-->
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
	�M�a�[�I | �굦�|
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
						onclick="javascript:location.href='http://bid.iii.org.tw/bid/'">�ڪ��D�F</button>
				</div>
			</div>

            <div class="naviwithlogo">
            <div id="nav-all-content-search">
                <input type="text" id="search_keyword" class="search-trigger" placeholder="�п�J����r" onkeypress="handle(event)" />
                <a href="#" onclick="searchChk();"><label for="search-trigger"></label></a>
            </div>
            <div id="nav-all-content-pc" style="text-align:right">
                <span><a href="/default.aspx" target="_self">����</a></span><span>�x</span><span><a href="https://web.iii.org.tw" target="_blank">ENGLISH</a></span><span>�x</span><span><a href="/SiteInfo/ContactUs.aspx?fm_sqno=48&ff_sqno=8" target="_self">�p���ڭ�</a></span><span>�x</span><span><a href="/SiteInfo/Sitemap.aspx?fm_sqno=52" target="_self">��������</a></span><span>�x</span><span><a href="/Publish/EPaper.aspx?fm_sqno=32" target="_self">�q�l���q�\</a></span><span>�x</span><span><a href="#####" target="_self">������T</a></span><span>�x</span><span><a href="#####" target="_self" onclick="AnnounceControl()"  >���i��T</a><div id="div_Announce"  style="display:none;"><span style="text-align:right;"><a href="http://bid.iii.org.tw/bid/" target="_blank">���ʸ�T</a></span> | <span style="text-align:right;"><a href="/Info/AnnounceCooperationList.aspx?fm_sqno=77" target="_self">���Ǭ�X�@���i</a></span> | <span style="text-align:right;"><a href="/Info/AnnounceList.aspx?fm_sqno=82&AnnounceType=�i�����o���G����" target="_self">�i�����o���G����</a></span> | <span style="text-align:right;"><a href="/Info/AnnounceList.aspx?fm_sqno=83&AnnounceType=��o���G���P���i " target="_self">��o���G���P���i </a></span> | <span style="text-align:right;"><a href="/Info/AnnounceList.aspx?fm_sqno=84&AnnounceType=�M�Q�ۻ����" target="_self">�M�Q�����ۻ⤽�i</a></span> | <span style="text-align:right;"><a href="/Info/AnnounceList.aspx?fm_sqno=85&AnnounceType=�ɧU�D��Q���ʸ�T" target="_self">�ɧU�D��Q���ʸ�T</a></span></div></span>
                
            </div>

            </div>
            <nav class="navigtion-nav">
                <div class="nav_menu">
                    <div class="nav">
                        <div class="list" id="navlist">
                            <ul id="navfouce">
                                <li class="item-N-n nonestyle"><img src="/assets/images/nav-all/logo.png"/></li>
                                <li class="item-N-n"><a href="#">����굦�|</a></li>   
                                <li class="item-N-n"><a href="#">�зs�[�I</a></li>   
                                <li class="item-N-n"><a href="#">�s�D����</a></li>
                                <li class="item-N-n"><a href="#">���ʻP�ҵ{</a></li>
                                <li class="item-N-n"><a href="#">���~�A��</a></li>   
                                <li class="item-N-n"><a href="#">�X���~</a></li>
								<li class="item-N-n"><a href="#">��T���}</a></li>
                                <li class="item-N-n"><a href="/hr" target="_blank">�׭^�۶�</a></li>
                            </ul>
                        </div>      
                        
                            <div class="box" id="navbox" style="height:0px;opacity:0;overflow:hidden;">
                                
    <div class="cont" style="display:none;">
        <ul class="sublist clearfix">
        
                <li>
                    <h3 class="mcate-item-hd"><span><a href="/About/CoreValue.aspx?fm_sqno=8" target="_self">�֤߻���</a></span></h3>
                    
                </li>
            
                <li>
                    <h3 class="mcate-item-hd"><span><a href="#####" target="_self">��´²��</a></span></h3>
                    
                            <p class="mcate-item-bd">
                        
                            <a href="/FFPage.aspx?ff_sqno=2&fm_sqno=33" target="_self">��´�[�c</a>
                        
                            <a href="/FFPage.aspx?ff_sqno=3&fm_sqno=35" target="_self">���ʨƷ|</a>
                        
                            <a href="/About/Headman.aspx?fm_sqno=34" target="_self">�g��ζ�</a>
                        
                            <a href="/About/Department.aspx?dp_sqno=16&fm_sqno=36" target="_self">�~�ȳ��</a>
                        
                            <a href="/FFPage.aspx?ff_sqno=1&fm_sqno=37" target="_self">�A�Ⱦ��I</a>
                        
                        </p>
                        
                </li>
            
                <li>
                    <h3 class="mcate-item-hd"><span><a href="/Focus/Focus.aspx?f_type=2&fm_sqno=13" target="_self">�J�I����</a></span></h3>
                    
                </li>
            
                <li>
                    <h3 class="mcate-item-hd"><span><a href="#####" target="_self">�o���֩w</a></span></h3>
                    
                            <p class="mcate-item-bd">
                        
                            <a href="/About/Prize.aspx?prize_type=1&fm_sqno=43" target="_self">��ڼ���</a>
                        
                        </p>
                        
                </li>
            
                <li>
                    <h3 class="mcate-item-hd"><span><a href="/About/iii40/index.html" target="_blank">�j�Ƭ��n</a></span></h3>
                    
                </li>
            
                <li>
                    <h3 class="mcate-item-hd"><span><a href="/About/CSR.aspx?fm_sqno=60" target="_self">���~���|�d��</a></span></h3>
                    
                </li>
            
        </ul>
    </div>



                                
    <div class="cont" style="display:none;">
        <ul class="sublist clearfix">
        
                <li>
                    <h3 class="mcate-item-hd"><span><a href="/focus/Focus.aspx?f_type=1&fm_sqno=12" target="_self">�M�a�[�I</a></span></h3>
                    
                </li>
            
                <li>
                    <h3 class="mcate-item-hd"><span><a href="#####" target="_self">�s���s�T</a></span></h3>
                    
                            <p class="mcate-item-bd">
                        
                            <a href="/Info/ICTList.aspx?fm_sqno=40" target="_self">���~��s </a>
                        
                        </p>
                        
                </li>
            
        </ul>
    </div>



                                
    <div class="cont" style="display:none;">
        <ul class="sublist clearfix">
        
                <li>
                    <h3 class="mcate-item-hd"><span><a href="/Press/NewsList.aspx?fm_sqno=14" target="_self">���|�s�D</a></span></h3>
                    
                </li>
            
                <li>
                    <h3 class="mcate-item-hd"><span><a href="/Press/Photo.aspx?fm_sqno=16" target="_self">�v�����</a></span></h3>
                    
                            <p class="mcate-item-bd">
                        
                            <a href="/Press/Photo.aspx?fm_sqno=16" target="_self">�Ӥ����A</a>
                        
                            <a href="/Press/Video.aspx?fm_sqno=17" target="_self">���ʼv��</a>
                        
                        </p>
                        
                </li>
            
        </ul>
    </div>



                                
    <div class="cont" style="display:none;">
        <ul class="sublist clearfix">
        
                <li>
                    <h3 class="mcate-item-hd"><span><a href="/Info/ClassList.aspx?fm_sqno=38" target="_self">���ҵ{</a></span></h3>
                    
                </li>
            
                <li>
                    <h3 class="mcate-item-hd"><span><a href="/Info/SeminarList.aspx?fm_sqno=19" target="_self">��Q����</a></span></h3>
                    
                </li>
            
        </ul>
    </div>



                                
    <div class="cont" style="display:none;">
        <ul class="sublist clearfix">
        
                <li>
                    <h3 class="mcate-item-hd"><span><a href="/Product/TransferDB.aspx?fm_sqno=23" target="_self">�i����޳N</a></span></h3>
                    
                </li>
            
                <li>
                    <h3 class="mcate-item-hd"><span><a href="/Product/Patent.aspx?fm_sqno=24" target="_self">�M�Q</a></span></h3>
                    
                            <p class="mcate-item-bd">
                        
                            <a href="/Product/PatentAuthority.aspx?fm_sqno=59" target="_self">�M�Q�˯�</a>
                        
                            <a href="/Product/PatentGroup.aspx?fm_sqno=54" target="_self">�M�Q�զX</a>
                        
                        </p>
                        
                </li>
            
                <li>
                    <h3 class="mcate-item-hd"><span><a href="/Product/BrandAuthority.aspx?fm_sqno=25" target="_self">�Ӽ�</a></span></h3>
                    
                </li>
            
                <li>
                    <h3 class="mcate-item-hd"><span><a href="/Product/TechLens_Search.aspx?fm_sqno=55" target="_self">���~����</a></span></h3>
                    
                            <p class="mcate-item-bd">
                        
                            <a href="/Product/TechLens_Pages.aspx?fm_sqno=72" target="_self">��������</a>
                        
                            <a href="/Product/TechLens_Video.aspx?fm_sqno=73" target="_self">�޳N�v��</a>
                        
                        </p>
                        
                </li>
            
        </ul>
    </div>



                                
    <div class="cont" style="display:none;">
        <ul class="sublist clearfix">
        
                <li>
                    <h3 class="mcate-item-hd"><span><a href="/Publish/MIC.aspx?fm_sqno=27" target="_self">���~����</a></span></h3>
                    
                </li>
            
                <li>
                    <h3 class="mcate-item-hd"><span><a href="/Publish/TechLaw.aspx?fm_sqno=29" target="_self">��ުk��</a></span></h3>
                    
                </li>
            
                <li>
                    <h3 class="mcate-item-hd"><span><a href="/Publish/Market.aspx?fm_sqno=31" target="_self">���~����</a></span></h3>
                    
                </li>
            
                <li>
                    <h3 class="mcate-item-hd"><span><a href="/Publish/DownloadPages.aspx?fm_sqno=42" target="_self">�U���M��</a></span></h3>
                    
                </li>
            
        </ul>
    </div>



								
    <div class="cont" style="display:none;">
        <ul class="sublist2 clearfix">
        
                <li>
                    <h3 class="mcate-item-hd"><span><a href="/Info/BoardOfDirectorsList.aspx?fm_sqno=80" target="_self">���Ʒ|���n�Mĳ</a></span></h3>
                    
                </li>
            
                <li>
                    <h3 class="mcate-item-hd"><span><a href="/Info/OpenDataList_Operational.aspx?fm_sqno=75" target="_self">�]�ȳ��i</a></span></h3>
                    
                </li>
            
                <li>
                    <h3 class="mcate-item-hd"><span><a href="/Info/AnnounceAvoidanceList.aspx?fm_sqno=78" target="_self">�K���Q�q�j�פ��i</a></span></h3>
                    
                </li>
            
                <li>
                    <h3 class="mcate-item-hd"><span><a href="/Info/GovernmentSubsidyList.aspx?fm_sqno=81" target="_self">�F���ɧU�p�e�N���T</a></span></h3>
                    
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
                    alert("�п�J����r");
                    document.getElementById("search_keyword").focus();
                    event.returnValue = false;
                } else {
                    location = "/Search/SearchResult.aspx?fm_sqno=57&search_keyword=" + encodeURI(document.getElementById("search_keyword").value);
                    event.returnValue = false;
                }
            }
        </script>

    

    <!--����OMENU-->
    <nav id="nav-s" class="nav-s">
        <ul class="ce">
            <li><a href="/Default.aspx">����</a> </li>
            <li>
                <a href="#">����굦�|</a>
                
<ul class="er">

            <li><a href="/About/CoreValue.aspx?fm_sqno=8" class="topmenu_link" target="_self">�֤߻���</a>
            
        </li>
        <li class="divider"></li>
    
            <li class="e_li"><a href="#####" class="dropdown-toggle topmenu_link" data-toggle="dropdown" aria-expanded="false" target="_self">��´²�� <b class="caret caret-right"></b></a>
            
			    <ul class="thr">
	                
	                        <li>
                                <a href="/FFPage.aspx?ff_sqno=2&fm_sqno=33" class="topmenu_link" target="_self">��´�[�c</a>
	                        </li>
	                    
	                        <li>
                                <a href="/FFPage.aspx?ff_sqno=3&fm_sqno=35" class="topmenu_link" target="_self">���ʨƷ|</a>
	                        </li>
	                    
	                        <li>
                                <a href="/About/Headman.aspx?fm_sqno=34" class="topmenu_link" target="_self">�g��ζ�</a>
	                        </li>
	                    
	                        <li>
                                <a href="#####" class="dropdown-toggle topmenu_link" data-toggle="dropdown" aria-expanded="false" target="_self">�~�ȳ�� <b class="caret caret-right"></b></a><div class="thr_nr"><a href="/About/Department.aspx?fm_sqno=36&dp_sqno=16" class="topmenu_link">�Ʀ�A�ȳзs��s��</a></div><div class="thr_nr"><a href="/About/Department.aspx?fm_sqno=36&dp_sqno=18" class="topmenu_link">�Ʀ��૬��s��</a></div><div class="thr_nr"><a href="/About/Department.aspx?fm_sqno=36&dp_sqno=17" class="topmenu_link">���z�t�ά�s��</a></div><div class="thr_nr"><a href="/About/Department.aspx?fm_sqno=36&dp_sqno=7" class="topmenu_link">��w��ެ�s��</a></div><div class="thr_nr"><a href="/About/Department.aspx?fm_sqno=36&dp_sqno=8" class="topmenu_link">�Ʀ�Ш|��s��</a></div><div class="thr_nr"><a href="/About/Department.aspx?fm_sqno=36&dp_sqno=3" class="topmenu_link">���~������s��</a></div><div class="thr_nr"><a href="/About/Department.aspx?fm_sqno=36&dp_sqno=9" class="topmenu_link">��ުk�߬�s�� </a></div><div class="thr_nr"><a href="/About/Department.aspx?fm_sqno=36&dp_sqno=10" class="topmenu_link">��ڳB</a></div><div class="thr_nr"><a href="/About/Department.aspx?fm_sqno=36&dp_sqno=19" class="topmenu_link">�a��ХͪA�ȳB</a></div><div class="thr_nr"><a href="/About/Department.aspx?fm_sqno=36&dp_sqno=14" class="topmenu_link">�x�鲣�~���ʤ���</a></div><div class="thr_nr"><a href="/About/Department.aspx?fm_sqno=36&dp_sqno=20" class="topmenu_link">�e¤����</a></div><div class="thr_nr"><a href="/About/Department.aspx?fm_sqno=36&dp_sqno=21" class="topmenu_link">���ڸ�w�A�Ȥ���</a></div>
	                        </li>
	                    
	                        <li>
                                <a href="/FFPage.aspx?ff_sqno=1&fm_sqno=37" class="topmenu_link" target="_self">�A�Ⱦ��I</a>
	                        </li>
	                    
                </ul>
            
        </li>
        <li class="divider"></li>
    
            <li><a href="/Focus/Focus.aspx?f_type=2&fm_sqno=13" class="topmenu_link" target="_self">�J�I����</a>
            
        </li>
        <li class="divider"></li>
    
            <li class="e_li"><a href="#####" class="dropdown-toggle topmenu_link" data-toggle="dropdown" aria-expanded="false" target="_self">�o���֩w <b class="caret caret-right"></b></a>
            
			    <ul class="thr">
	                
	                        <li>
                                <a href="/About/Prize.aspx?prize_type=1&fm_sqno=43" class="topmenu_link" target="_self">��ڼ���</a>
	                        </li>
	                    
                </ul>
            
        </li>
        <li class="divider"></li>
    
            <li><a href="/About/iii40/index.html" class="topmenu_link" target="_blank">�j�Ƭ��n</a>
            
        </li>
        <li class="divider"></li>
    
            <li><a href="/About/CSR.aspx?fm_sqno=60" class="topmenu_link" target="_self">���~���|�d��</a>
            
        </li>
        <li class="divider"></li>
    
</ul>


            </li>
            <li>
                <a href="#">�зs�[�I</a>
                
<ul class="er">

            <li><a href="/focus/Focus.aspx?f_type=1&fm_sqno=12" class="topmenu_link" target="_self">�M�a�[�I</a>
            
        </li>
        <li class="divider"></li>
    
            <li class="e_li"><a href="#####" class="dropdown-toggle topmenu_link" data-toggle="dropdown" aria-expanded="false" target="_self">�s���s�T <b class="caret caret-right"></b></a>
            
			    <ul class="thr">
	                
	                        <li>
                                <a href="/Info/ICTList.aspx?fm_sqno=40" class="topmenu_link" target="_self">���~��s </a>
	                        </li>
	                    
                </ul>
            
        </li>
        <li class="divider"></li>
    
</ul>


            </li>
            <li>
                <a href="#">�s�D����</a>
                
<ul class="er">

            <li><a href="/Press/NewsList.aspx?fm_sqno=14" class="topmenu_link" target="_self">���|�s�D</a>
            
        </li>
        <li class="divider"></li>
    
            <li class="e_li"><a href="#####" class="dropdown-toggle topmenu_link" data-toggle="dropdown" aria-expanded="false" target="_self">�v����� <b class="caret caret-right"></b></a>
            
			    <ul class="thr">
	                
	                        <li>
                                <a href="/Press/Photo.aspx?fm_sqno=16" class="topmenu_link" target="_self">�Ӥ����A</a>
	                        </li>
	                    
	                        <li>
                                <a href="/Press/Video.aspx?fm_sqno=17" class="topmenu_link" target="_self">���ʼv��</a>
	                        </li>
	                    
                </ul>
            
        </li>
        <li class="divider"></li>
    
</ul>


            </li>
            <li>
                <a href="#">���ʻP�ҵ{</a>
                
<ul class="er">

            <li><a href="/Info/ClassList.aspx?fm_sqno=38" class="topmenu_link" target="_self">���ҵ{</a>
            
        </li>
        <li class="divider"></li>
    
            <li><a href="/Info/SeminarList.aspx?fm_sqno=19" class="topmenu_link" target="_self">��Q����</a>
            
        </li>
        <li class="divider"></li>
    
</ul>


            </li>
            <li>
                <a href="#">���~�A��</a>
                
<ul class="er">

            <li><a href="/Product/TransferDB.aspx?fm_sqno=23" class="topmenu_link" target="_self">�i����޳N</a>
            
        </li>
        <li class="divider"></li>
    
            <li class="e_li"><a href="#####" class="dropdown-toggle topmenu_link" data-toggle="dropdown" aria-expanded="false" target="_self">�M�Q <b class="caret caret-right"></b></a>
            
			    <ul class="thr">
	                
	                        <li>
                                <a href="/Product/PatentAuthority.aspx?fm_sqno=59" class="topmenu_link" target="_self">�M�Q�˯�</a>
	                        </li>
	                    
	                        <li>
                                <a href="/Product/PatentGroup.aspx?fm_sqno=54" class="topmenu_link" target="_self">�M�Q�զX</a>
	                        </li>
	                    
                </ul>
            
        </li>
        <li class="divider"></li>
    
            <li><a href="/Product/BrandAuthority.aspx?fm_sqno=25" class="topmenu_link" target="_self">�Ӽ�</a>
            
        </li>
        <li class="divider"></li>
    
            <li class="e_li"><a href="#####" class="dropdown-toggle topmenu_link" data-toggle="dropdown" aria-expanded="false" target="_self">���~���� <b class="caret caret-right"></b></a>
            
			    <ul class="thr">
	                
	                        <li>
                                <a href="/Product/TechLens_Pages.aspx?fm_sqno=72" class="topmenu_link" target="_self">��������</a>
	                        </li>
	                    
	                        <li>
                                <a href="/Product/TechLens_Video.aspx?fm_sqno=73" class="topmenu_link" target="_self">�޳N�v��</a>
	                        </li>
	                    
                </ul>
            
        </li>
        <li class="divider"></li>
    
</ul>


            </li>
            <li>
                <a href="#">�X���~</a>
                
<ul class="er">

            <li><a href="/Publish/MIC.aspx?fm_sqno=27" class="topmenu_link" target="_self">���~����</a>
            
        </li>
        <li class="divider"></li>
    
            <li><a href="/Publish/TechLaw.aspx?fm_sqno=29" class="topmenu_link" target="_self">��ުk��</a>
            
        </li>
        <li class="divider"></li>
    
            <li><a href="/Publish/Market.aspx?fm_sqno=31" class="topmenu_link" target="_self">���~����</a>
            
        </li>
        <li class="divider"></li>
    
            <li><a href="/Publish/DownloadPages.aspx?fm_sqno=42" class="topmenu_link" target="_self">�U���M��</a>
            
        </li>
        <li class="divider"></li>
    
</ul>


            </li>
            <li>
                <a href="#">��T���}</a>
                
<ul class="er">

            <li><a href="/Info/BoardOfDirectorsList.aspx?fm_sqno=80" class="topmenu_link" target="_self">���Ʒ|���n�Mĳ</a>
            
        </li>
        <li class="divider"></li>
    
            <li><a href="/Info/OpenDataList_Operational.aspx?fm_sqno=75" class="topmenu_link" target="_self">�]�ȳ��i</a>
            
        </li>
        <li class="divider"></li>
    
            <li><a href="/Info/AnnounceAvoidanceList.aspx?fm_sqno=78" class="topmenu_link" target="_self">�K���Q�q�j�פ��i</a>
            
        </li>
        <li class="divider"></li>
    
            <li><a href="/Info/GovernmentSubsidyList.aspx?fm_sqno=81" class="topmenu_link" target="_self">�F���ɧU�p�e�N���T</a>
            
        </li>
        <li class="divider"></li>
    
</ul>


            </li>            
            <li>
                <a href="/hr" target="_blank">�׭^�۶�</a>
            </li>
            <li>
                <a href="#">�ֳt�s��</a>
                
<ul class="er">

            <li><a href="/default.aspx" class="topmenu_link" target="_self">����</a>
            
        </li>
        <li class="divider"></li>
    
            <li><a href="https://web.iii.org.tw" class="topmenu_link" target="_blank">ENGLISH</a>
            
        </li>
        <li class="divider"></li>
    
            <li><a href="/SiteInfo/ContactUs.aspx?fm_sqno=48&ff_sqno=8" class="topmenu_link" target="_self">�p���ڭ�</a>
            
        </li>
        <li class="divider"></li>
    
            <li><a href="/SiteInfo/Sitemap.aspx?fm_sqno=52" class="topmenu_link" target="_self">��������</a>
            
        </li>
        <li class="divider"></li>
    
            <li><a href="/Publish/EPaper.aspx?fm_sqno=32" class="topmenu_link" target="_self">�q�l���q�\</a>
            
        </li>
        <li class="divider"></li>
    
            <li class="e_li"><a href="#####" class="dropdown-toggle topmenu_link" data-toggle="dropdown" aria-expanded="false" target="_self">������T <b class="caret caret-right"></b></a>
            
			    <ul class="thr">
	                
	                        <li>
                                <a href="/SiteInfo/ContactUs.aspx?fm_sqno=48&ff_sqno=8" class="topmenu_link" target="_self">�p���ڭ�</a>
	                        </li>
	                    
	                        <li>
                                <a href="/FFPage.aspx?ff_sqno=5&fm_sqno=49" class="topmenu_link" target="_self">���p�v�n�� </a>
	                        </li>
	                    
	                        <li>
                                <a href="/FFPage.aspx?ff_sqno=6&fm_sqno=50" class="topmenu_link" target="_self">������T�ϥ��n��</a>
	                        </li>
	                    
	                        <li>
                                <a href="/SiteInfo/PersonalData.aspx?fm_sqno=51" class="topmenu_link" target="_self">�Ӹ��ƤH����v�Q�M��</a>
	                        </li>
	                    
	                        <li>
                                <a href="/SiteInfo/SiteMap.aspx?fm_sqno=52" class="topmenu_link" target="_self">�������� </a>
	                        </li>
	                    
	                        <li>
                                <a href="/Info/LinksList.aspx?fm_sqno=22" class="topmenu_link" target="_self">���˳s��</a>
	                        </li>
	                    
	                        <li>
                                <a href="/Publish/EPaper.aspx?fm_sqno=32" class="topmenu_link" target="_self">�q�l���q�\</a>
	                        </li>
	                    
	                        <li>
                                <a href="/Search/SearchResult.aspx?fm_sqno=57&search_keyword=" class="topmenu_link" target="_self">�j�M</a>
	                        </li>
	                    
                </ul>
            
        </li>
        <li class="divider"></li>
    
            <li class="e_li"><a href="#####" class="dropdown-toggle topmenu_link" data-toggle="dropdown" aria-expanded="false" target="_self">���i��T <b class="caret caret-right"></b></a>
            
			    <ul class="thr">
	                
	                        <li>
                                <a href="http://bid.iii.org.tw/bid/" class="topmenu_link" target="_blank">���ʸ�T</a>
	                        </li>
	                    
	                        <li>
                                <a href="/Info/AnnounceCooperationList.aspx?fm_sqno=77" class="topmenu_link" target="_self">���Ǭ�X�@���i</a>
	                        </li>
	                    
	                        <li>
                                <a href="/Info/AnnounceList.aspx?fm_sqno=82&AnnounceType=�i�����o���G����" class="topmenu_link" target="_self">�i�����o���G����</a>
	                        </li>
	                    
	                        <li>
                                <a href="/Info/AnnounceList.aspx?fm_sqno=83&AnnounceType=��o���G���P���i " class="topmenu_link" target="_self">��o���G���P���i </a>
	                        </li>
	                    
	                        <li>
                                <a href="/Info/AnnounceList.aspx?fm_sqno=84&AnnounceType=�M�Q�ۻ����" class="topmenu_link" target="_self">�M�Q�����ۻ⤽�i</a>
	                        </li>
	                    
	                        <li>
                                <a href="/Info/AnnounceList.aspx?fm_sqno=85&AnnounceType=�ɧU�D��Q���ʸ�T" class="topmenu_link" target="_self">�ɧU�D��Q���ʸ�T</a>
	                        </li>
	                    
                </ul>
            
        </li>
        <li class="divider"></li>
    
</ul>


            </li>
            <li>
                <a href="/SiteInfo/ContactUs.aspx?fm_sqno=48&ff_sqno=8" >�p���ڭ�</a>
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
                    <h3>�M�a�[�I</h3>
                    <p>���M�a�Ͷկ߰��[��</p>
                </div>
            </section>
          <a name="gothis"></a>
            
                <script>$('#bn').css('background-image', 'url(/assets/images/banner/operation.jpg)');</script>
                

            <!--Bread-->
            <section id="bread">
                <div class="road">
                    <ul class="xbreadcrumbs" id="breadcrumbs-1">
                        <span id="ctl00_ctl00_ContentPlaceHolder_base_lbl_Breadcrum"><li><a href="/Default.aspx" class="home">����</a></li><li><a href="#" class="navi_link"> �зs�[�I</a></li> <li class="active"><a href="/focus/Focus.aspx?f_type=1&fm_sqno=12" class="navi_link">�M�a�[�I</a></li></span>
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

<div class="t1"><a href="mailto:?subject=[����] �M�a�[�I | �굦�|&body=���ɺ����T���G
���M�a�Ͷկ߰��[��
https%3a%2f%2fwww.iii.org.tw%2ffocus%2fFocus.aspx%3ff_type%3d1%26fm_sqno%3d12" title="�� Email ��H" onclick="return confirm('�z�T�w�n��H�o�Ӻ���?');"><img src="/assets/images/tool/1.jpg" alt="�� Email ��H" /></a></div>
<div class="t1"><a href="#####" onclick="PrintElem('#text_content');"><img src="/assets/images/tool/2.jpg" alt="�͵��C�L" /></a></div>
<div class="t1"><a href="#####" id="decfont"><img src="/assets/images/tool/3.jpg" border="0" alt="�Y�p�r��" /></a></div>
<div class="t1"><a href="#####" id="incfont"><img src="/assets/images/tool/4.jpg" border="0" alt="��j�r��" /></a></div>

<!-- Your share button code -->

<div class="t1"><a href="javascript: void(window.open('https://plus.google.com/share?url='.concat(encodeURIComponent(location.href)) ));">
                                <img src="/assets/images/tool/6.jpg" width="26" height="26" alt="Google+����"  /></a></div>
<div class="t1"><a href="javascript: void(window.open('https://twitter.com/intent/tweet?'.concat('original_referer=').concat(encodeURIComponent(location.href)).concat('&text=').concat(encodeURIComponent(document.title)).concat('&tw_p=tweetbutton&url=').concat(encodeURIComponent(location.href)) ));">
                                <img src="/assets/images/tool/7.jpg" width="26" height="26" alt="Twitter����" /></a></div>

<div class="t1" id="div_line"><a href="javascript: void(window.open('https://line.naver.jp/R/msg/text/?'.concat(encodeURIComponent(document.title)).concat(' ').concat(encodeURIComponent(location.href)) ));">
    <img src="/images/linebutton_30x30_zh-hant.png" width="26" height="26" alt="��LINE�ǰe" /></a></div>
        
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
                            <li><div class="title"><h2><span id="ctl00_ctl00_ContentPlaceHolder_base_UC_PageMenu_New_lbl_ChannelTitle">�зs�[�I</span></h2></div></li>
                            
                                    <li>
                                        <a href="/focus/Focus.aspx?f_type=1&fm_sqno=12" target="_self"  class="on">�M�a�[�I</a>
                                        <input id="Hidden1" type="hidden" Y />
                                        
                                    </li>
                                
                                    <li>
                                        <a href="#sub2" target="_self" >�s���s�T</a>
                                        <input id="Hidden1" type="hidden" N />
                                        
                                        <ul >
                                            
                                                <li >
                                                    <a href="/Info/ICTList.aspx?fm_sqno=40" target="_self">���~��s </a>
                                                    
                                                </li>
                                            
                                              </ul>
                                            
                                    </li>
                                
                        </ul>
                    </div>







                   
                    <div class="contentinfo">
                        <div id="ctl00_ctl00_ContentPlaceHolder_base_divChannelTitle" class="title">
                            <h2>�M�a�[�I</h2>
                        </div>
                        
                        <span id="ctl00_ctl00_ContentPlaceHolder_base_spanChannelTitleLine" class="line"></span>

                        <!--main conetnt start-->

                        

    <div class="sear">

        
        <select name="ctl00$ctl00$ContentPlaceHolder_base$ContentPlaceHolder1$dp_f_cgy" id="ctl00_ctl00_ContentPlaceHolder_base_ContentPlaceHolder1_dp_f_cgy">
	<option selected="selected" value="">�������O</option>
	<option value="1">���w����</option>
	<option value="2">�޳N��o</option>
	<option value="3">���~����</option>
	<option value="4">�H�~���|</option>
	<option value="5">���α��s</option>
	<option value="6">��ڷ~��</option>

</select>

        <select name="ctl00$ctl00$ContentPlaceHolder_base$ContentPlaceHolder1$dp_f_pubdate" id="ctl00_ctl00_ContentPlaceHolder_base_ContentPlaceHolder1_dp_f_pubdate">
	<option selected="selected" value="">�����~��</option>
	<option value="2020">2020�~</option>
	<option value="2019">2019�~</option>
	<option value="2018">2018�~</option>
	<option value="2017">2017�~</option>
	<option value="2016">2016�~</option>
	<option value="2015">2015�~</option>
	<option value="2014">2014�~</option>

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
                                <h4>Covid-19�����A�ʥX�C�y�ìP���~�o�i�M���P�Ӿ� </h4>
                                     </a>
                            </div>
                            <p class="content">�L�׬O�g�٬��ʡB�꨾�س]�Υ������ΡA�{�N�H��e�W�����t�ΤΩʯೣ�������n�D�A�ר�����w���b�w�}�o��a���ݰ�wĳ�D�A�a���q�H�����B��ʳq�T�t�ΡB�a���θ�����֨t�άһݻP�ɭѶi�C&nbsp;</p>
                            <a href="FocusDtl.aspx?f_type=1&f_sqno=%2fiBsIGQe4cZk5958qRFWsg__&fm_sqno=12"><div class="operate-I-more">READ MORE</div></a>
                        </div>

                    
                        <div class="focus-I">
                            <a href="FocusDtl.aspx?f_type=1&f_sqno=Qz8F3rVNm72XyJlcOZ7UMA__&fm_sqno=12">
                                <img src="/Files/Channel/Focus/View/covidssss.jpg" class="focus-I-title" />
                            </a>
                            <div class="date pull-left" >
                                2020/04/22&nbsp;&nbsp;
                                ����� | �i�N�R ��`���~���R�v�ݲժ�
                            </div>
                            <div class="focus_short pull-left">
                                 <a href="FocusDtl.aspx?f_type=1&f_sqno=Qz8F3rVNm72XyJlcOZ7UMA__&fm_sqno=12">
                                <h4>�s�a�ͪ��̱�����y�ȹC�P�|�i�A�ȷ~���v�T�[�� </h4>
                                     </a>
                            </div>
                            <p class="content">�H�ۥ��y�̱������A�U�곰��ť����B�X�J�Һި�ΰ��o�[��ñ�ҵ���������A���[���ȹC���~�������Ʋ`�C&nbsp;</p>
                            <a href="FocusDtl.aspx?f_type=1&f_sqno=Qz8F3rVNm72XyJlcOZ7UMA__&fm_sqno=12"><div class="operate-I-more">READ MORE</div></a>
                        </div>

                    
                        <div class="focus-I">
                            <a href="FocusDtl.aspx?f_type=1&f_sqno=yQMoQ%2bils%2fCubVdkdoe11Q__&fm_sqno=12">
                                <img src="/Files/Channel/Focus/View/ceosss.jpg" class="focus-I-title" />
                            </a>
                            <div class="date pull-left" >
                                2020/04/22&nbsp;&nbsp;
                                ����� | ������ ���~�U�ݭݥD��
                            </div>
                            <div class="focus_short pull-left">
                                 <a href="FocusDtl.aspx?f_type=1&f_sqno=yQMoQ%2bils%2fCubVdkdoe11Q__&fm_sqno=12">
                                <h4>����CEO�Чڪ����\�n�Z </h4>
                                     </a>
                            </div>
                            <p class="content">�굦�|���~������s�ҡ]MIC�^�b���~��1�u�ѻP�ˬ�޲z�����p�e�A���Ƕ�ϼƮa�b�L�h�X�~���򰪫צ������t��CEO�i��X�͡A���ɨ䦨�\�o�i���g��A�P�p�󭱹良�Ӫ����|�P�D�ԡC&nbsp;</p>
                            <a href="FocusDtl.aspx?f_type=1&f_sqno=yQMoQ%2bils%2fCubVdkdoe11Q__&fm_sqno=12"><div class="operate-I-more">READ MORE</div></a>
                        </div>

                    
                        <div class="focus-I">
                            <a href="FocusDtl.aspx?f_type=1&f_sqno=MtWyey6OisS5HXHTm7Th4g__&fm_sqno=12">
                                <img src="/Files/Channel/Focus/View/covidsss.jpg" class="focus-I-title" />
                            </a>
                            <div class="date pull-left" >
                                2020/04/08&nbsp;&nbsp;
                                ����� | �̩��k ���~���R�v
                            </div>
                            <div class="focus_short pull-left">
                                 <a href="FocusDtl.aspx?f_type=1&f_sqno=MtWyey6OisS5HXHTm7Th4g__&fm_sqno=12">
                                <h4>�q�s�a�ͪ� �ݸ�����εo�i������ĳ�D </h4>
                                     </a>
                            </div>
                            <p class="content">�s���a���f�r�]COVID-19�^�̱��q2020�~�쩵�N�ܤ��A����U��F���Υ��~�����ܯ�O�C������Φb�̱��o�ͪ��e�B���B����A�p�̱��l�ܡB�v�T�w���B��T�y�q���x����t�n���C&nbsp;</p>
                            <a href="FocusDtl.aspx?f_type=1&f_sqno=MtWyey6OisS5HXHTm7Th4g__&fm_sqno=12"><div class="operate-I-more">READ MORE</div></a>
                        </div>

                    
                        <div class="focus-I">
                            <a href="FocusDtl.aspx?f_type=1&f_sqno=wQTPoJnpriTx9rQu3TzFaQ__&fm_sqno=12">
                                <img src="/Files/Channel/Focus/View/carsss.jpg" class="focus-I-title" />
                            </a>
                            <div class="date pull-left" >
                                2020/03/23&nbsp;&nbsp;
                                ��a޳ | ���~���R�v�ݱM�׸g�z
                            </div>
                            <div class="focus_short pull-left">
                                 <a href="FocusDtl.aspx?f_type=1&f_sqno=wQTPoJnpriTx9rQu3TzFaQ__&fm_sqno=12">
                                <h4>�ܯ�ٴ� 2020���z���o�i�Ͷիe¤ </h4>
                                     </a>
                            </div>
                            <p class="content">�ۥh�~�_���y�T�����~����Ͳ��޳N���ܥH�Υ����ݨD��֡A���C�n�X�i�j�W�ҵ�����A�Ө줵�~��s�a�ͪ��̱��������y�A�ר�O����j���T���s�y����Z�~��O���a�ϡA�\�h�u�t����}�u�A�����y�T��������D���v�T�A�]�������u���^�Ū��Ʊ���ʹ���C���ﱵ��ӨӪ��a�����A�ƦܬO�¤��Z�ƥ�����A�p��z�L�s����ޡA�[�t�T�����~���૬�A�N�O2020���z�������n�o�i�����C&nbsp;</p>
                            <a href="FocusDtl.aspx?f_type=1&f_sqno=wQTPoJnpriTx9rQu3TzFaQ__&fm_sqno=12"><div class="operate-I-more">READ MORE</div></a>
                        </div>

                    
                        <div class="focus-I">
                            <a href="FocusDtl.aspx?f_type=1&f_sqno=uXx6sVZrPuAg%2bK3cgy7c3Q__&fm_sqno=12">
                                <img src="/Files/Channel/Focus/View/Elderly societysss.jpg" class="focus-I-title" />
                            </a>
                            <div class="date pull-left" >
                                2020/03/22&nbsp;&nbsp;
                                ����� | �F�q�� ���~�U�ݭݰƥD��
                            </div>
                            <div class="focus_short pull-left">
                                 <a href="FocusDtl.aspx?f_type=1&f_sqno=uXx6sVZrPuAg%2bK3cgy7c3Q__&fm_sqno=12">
                                <h4>��V�W���֪��|���Ѧ~����Ͷ��[�� </h4>
                                     </a>
                            </div>
                            <p class="content">�x�W�H�f�ѤƳt�ק�֡A�̰�o�|2018�~������ơA2026�~�N�i�J�W���֪��|�]65���H�W�H�f�e20%�^�C�H�f�Ѥƹ���|�M�g�٨t�αa�Ӫ����I�]�A�ҰʤO�u�ʡB�߾i���k�ɡB�����O���������_�W�[�B�g�٦�����w���C����B�饻�B�s�[�Y����]�����Ӫ��H�f���c�ܤƶi��վA�W���A�ǥ��[��o�ǰ�a��U�Ѧ~�̪��޳N��o�ʦV�A�i�ѧڰ�~�̶}�o�������~�M�A�Ȫ���Ҥ�V�C&nbsp;</p>
                            <a href="FocusDtl.aspx?f_type=1&f_sqno=uXx6sVZrPuAg%2bK3cgy7c3Q__&fm_sqno=12"><div class="operate-I-more">READ MORE</div></a>
                        </div>

                    
                        <div class="focus-I">
                            <a href="FocusDtl.aspx?f_type=1&f_sqno=DdiOU%2b5UJQo%2fKdvVMsD8gw__&fm_sqno=12">
                                <img src="/Files/Channel/Focus/View/supply chainsss.jpg" class="focus-I-title" />
                            </a>
                            <div class="date pull-left" >
                                2020/03/08&nbsp;&nbsp;
                                ����� | ���Y�� ���~���R�v
                            </div>
                            <div class="focus_short pull-left">
                                 <a href="FocusDtl.aspx?f_type=1&f_sqno=DdiOU%2b5UJQo%2fKdvVMsD8gw__&fm_sqno=12">
                                <h4>������E�p��A�_�A�t�Ӫ��U�@�B </h4>
                                     </a>
                            </div>
                            <p class="content">2018�~�̨����H�f�ت��J�I�A���L������T���Ĭ�A�g�L�ƪi�հ����|�B�T��O�����I�A�ް_�����쪺�_���A���g��~����ӡA�b�����ͧP�e�����������ҤU�A���~�g�窺�v�T���l�i���y�C&nbsp;</p>
                            <a href="FocusDtl.aspx?f_type=1&f_sqno=DdiOU%2b5UJQo%2fKdvVMsD8gw__&fm_sqno=12"><div class="operate-I-more">READ MORE</div></a>
                        </div>

                    
                        <div class="focus-I">
                            <a href="FocusDtl.aspx?f_type=1&f_sqno=mpbJCJ02qzmZ%2fXw1kyvalQ__&fm_sqno=12">
                                <img src="/Files/Channel/Focus/View/Digital learningss.jpg" class="focus-I-title" />
                            </a>
                            <div class="date pull-left" >
                                2020/03/08&nbsp;&nbsp;
                                ����� | ���M�x ���~���R�v
                            </div>
                            <div class="focus_short pull-left">
                                 <a href="FocusDtl.aspx?f_type=1&f_sqno=mpbJCJ02qzmZ%2fXw1kyvalQ__&fm_sqno=12">
                                <h4>���̦v�ǲߡA�Ʀ�ǲߢA���Z�ǲߪ������o�i���| </h4>
                                     </a>
                            </div>
                            <p class="content">�ۤ���Z�~�z�o�s�a�f�r�]COVID-19�^�̱��H�ӡA�̱������ܾF���a�A��U��g�ٵo�i�P������d�y�������A�Ҷq�s�a�f�r���ǬV�O�S�ʡA�H�ΰꤺ�U�žǮը��̸귽�ǳơA�ڰ�Ш|���ť������]�t�^�H�U�����2��25��}�ǡA�j�M�|�ն}�Ǥ�穵��2��25�餧��C���F�T�O�ǥ;ǲߤ����_�A�Ш|���J�������B�a��F���P�����Ʀ�ǲߥ��x�귽�A���ѦU�žǮծv�͹B�ΡC&nbsp;</p>
                            <a href="FocusDtl.aspx?f_type=1&f_sqno=mpbJCJ02qzmZ%2fXw1kyvalQ__&fm_sqno=12"><div class="operate-I-more">READ MORE</div></a>
                        </div>

                    
                        <div class="focus-I">
                            <a href="FocusDtl.aspx?f_type=1&f_sqno=km2ADrdTRbqmspNtcsClJQ__&fm_sqno=12">
                                <img src="/Files/Channel/Focus/View/gamesss.jpg" class="focus-I-title" />
                            </a>
                            <div class="date pull-left" >
                                2020/02/24&nbsp;&nbsp;
                                ����� | ²���w ���~���R�v
                            </div>
                            <div class="focus_short pull-left">
                                 <a href="FocusDtl.aspx?f_type=1&f_sqno=km2ADrdTRbqmspNtcsClJQ__&fm_sqno=12">
                                <h4>AI�Ч@�P��@ ���e���~�s�U�O </h4>
                                     </a>
                            </div>
                            <p class="content">�H�H�u���z�]AI�^���_�o�i�A���e���~�U���`�]�ɤJ�������ΡC�H���зN��{�Q�{���O�H���ҿW������O���@�A�M���HAI�v�B�����A�b�����ǲΪ��^�Ѯѵe�|�j���A�p���֡B�C���B�奻�A�P�Ϲ��Ч@�W�A���w�i���h�˾����ͦ����e���ΡA��J�Ч@�P���s��@�C&nbsp;</p>
                            <a href="FocusDtl.aspx?f_type=1&f_sqno=km2ADrdTRbqmspNtcsClJQ__&fm_sqno=12"><div class="operate-I-more">READ MORE</div></a>
                        </div>

                    
                        <div class="focus-I">
                            <a href="FocusDtl.aspx?f_type=1&f_sqno=0YoEOJ1dWGRMWMR%2bp1wpuw__&fm_sqno=12">
                                <img src="/Files/Channel/Focus/View/���R�W-2.jpg" class="focus-I-title" />
                            </a>
                            <div class="date pull-left" >
                                2020/02/23&nbsp;&nbsp;
                                ����� | �L�H�� ��`���~���R�v�ݱM�׸g�z
                            </div>
                            <div class="focus_short pull-left">
                                 <a href="FocusDtl.aspx?f_type=1&f_sqno=0YoEOJ1dWGRMWMR%2bp1wpuw__&fm_sqno=12">
                                <h4>�O�W���ͤ��@���p���������R </h4>
                                     </a>
                            </div>
                            <p class="content">IoT�����λ��D�`�s�x�A�[�\�����P�p���C�u���ͤ��@���p���v�ݩ�e�̡A��ڭ^��q�ΦW�٬�Public IoT�A�x�W�t�٬�Civil IoT�]²��CIoT�^�A��N���P���ͮ������������@���p���A�D�n�ѬF������IoT�ѨM��סA�A�ȹ�H���@��j���]G2C�^�Υ��~�]G2B�^�C�u���@���Ρv�D�D�}�����A�p���˸m�����s�λ��A�B�ƶq�e�j�A��γ~�h�D�n�w�綠���A�ȡA�p���z�w���B���z���ҡB���z��귽�B���z��q�B���z�A�~�����j���λ��C&nbsp;</p>
                            <a href="FocusDtl.aspx?f_type=1&f_sqno=0YoEOJ1dWGRMWMR%2bp1wpuw__&fm_sqno=12"><div class="operate-I-more">READ MORE</div></a>
                        </div>

                    
                    

            </div>
        

        

        <div class="holder">
            <span id="ctl00_ctl00_ContentPlaceHolder_base_ContentPlaceHolder1_DataPager_Bottom"><a class="aspNetDisabled jp-previous">�� previous</a>&nbsp;<span class="jp-current">1</span>&nbsp;<a href="/focus/Focus.aspx?f_type=1&amp;fm_sqno=12&amp;pageid=2">2</a>&nbsp;<a href="/focus/Focus.aspx?f_type=1&amp;fm_sqno=12&amp;pageid=3">3</a>&nbsp;<a href="/focus/Focus.aspx?f_type=1&amp;fm_sqno=12&amp;pageid=4">4</a>&nbsp;<a href="/focus/Focus.aspx?f_type=1&amp;fm_sqno=12&amp;pageid=5">5</a>&nbsp;<a href="/focus/Focus.aspx?f_type=1&amp;fm_sqno=12&amp;pageid=6">6</a>&nbsp;<a href="/focus/Focus.aspx?f_type=1&amp;fm_sqno=12&amp;pageid=7">7</a>&nbsp;<a href="/focus/Focus.aspx?f_type=1&amp;fm_sqno=12&amp;pageid=8">8</a>&nbsp;<a href="/focus/Focus.aspx?f_type=1&amp;fm_sqno=12&amp;pageid=9">9</a>&nbsp;<a href="/focus/Focus.aspx?f_type=1&amp;fm_sqno=12&amp;pageid=10">10</a>&nbsp;&nbsp;<a href="/focus/Focus.aspx?f_type=1&amp;fm_sqno=12&amp;pageid=11">next 10 pages</a>&nbsp;<a class="jp-next" href="/focus/Focus.aspx?f_type=1&amp;fm_sqno=12&amp;pageid=2">next ��</a>&nbsp;</span>

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
                    <p>�ҵn�������e�Y�ݥ��|���v�Ҧ�<br />
                    </p>
                    <p>�b�����o���|�ѭ��P�N�e</p>
                    <p>���o�������B�����ϥΡA�����B�C�L�B��������C��</p>
                    <p><span><a href="/FFPage.aspx?ff_sqno=5&fm_sqno=49">���p�v�n��</a></span><span>�x</span><span><a href="/SiteInfo/TermOfUse.aspx?fm_sqno=50">������T�ϥ��n��</a></span><span>�x</span><span><a href="/SiteInfo/PersonalData.aspx?fm_sqno=51">�Ӹ��ƤH����v�Q�M��</a></span></p>
                    <p>��ĳ�s����:</p>
                    <p>�������䴩IE10�H�W�BFirefox��Chrome</p>
                </div>
                <div class="item-A active-img">
                    <img src="/assets/images/about-iii/copyright.png" alt="" />
                    <p>10622�x�_���j�w�ϩM���F���G�q106��11��</p>
                    <p><a tel="0266318168">TEL 02-6631-8168</a></p>
                    <p><a tel="0266318168">FAX 02-2737-7113</a></p>
                </div>
                <div class="item-A active-img">
                    <div class="fb-page" data-href="https://www.facebook.com/weloveIII" data-small-header="true" data-adapt-container-width="true" data-hide-cover="true" data-show-facepile="true" data-show-posts="false">
                        <div class="fb-xfbml-parse-ignore">
                            <blockquote cite="https://www.facebook.com/weloveIII"><a href="https://www.facebook.com/weloveIII">�굦�|</a></blockquote>
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
   	<!--Google+1 plugins �@�Τ���-->
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
	<!--����OMENU-->
    <script type="text/javascript" src="/units/menumobile/main.js"></script>
    <!--�q����Menu-->
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
