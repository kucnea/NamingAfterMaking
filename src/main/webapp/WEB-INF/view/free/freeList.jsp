<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Name After Making - Game For Creative Funs</title>
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="author" content="Vrinda Maru Kansal">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
    <!--[if IE]><meta http-equiv='X-UA-Compatible' content='IE=edge,chrome=1'><![endif]-->

    <!-- Favicone Icon -->
    <link rel="shortcut icon" type="image/x-icon" href="/img/favicon.ico">
    <link rel="icon" type="image/png" href="/img/favicon.png">
    <link rel="apple-touch-icon" href="/img/favicon.png">

    <!-- CSS -->
    <link href="/css/style.css" rel="stylesheet" type="text/css" />
    <link href="/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="/css/font-awesome.css" rel="stylesheet" type="text/css" />
    <link href="/css/ionicons.css" rel="stylesheet" type="text/css" />
    <link href="/css/plugin/sidebar-menu.css" rel="stylesheet" type="text/css" />
    <link href="/css/plugin/animate.css" rel="stylesheet" type="text/css" />
    <link href="/css/jquery-ui.css" rel="stylesheet" type="text/css" />
</head>
<tiles:insertAttribute name="title"/>
	<script type="text/javascript">
		function changeSize(){
		}
	</script>

<body>

    <!-- Preloader -->
    <section id="preloader">
        <div class="loader" id="loader">
            <div class="loader-img"></div>
        </div>
    </section>
    <!-- End Preloader -->

    <!-- Search Overlay Menu -->
    <div class="search-overlay-menu">
        <span class="search-overlay-close"><i class="ion ion-ios-close-empty"></i></span>
        <form role="search" id="searchform" action="/search" method="get">
            <input value="" name="q" type="search" placeholder="Search..." />
            <button type="submit"><i class="ion ion-ios-search"></i></button>
        </form>
    </div>
    <!-- End Search Overlay Menu -->

    <!-- Site Wraper -->
    <div class="wrapper">

        <!-- Header -->
        <header id="header" class="header shadow">
            <div class="header-inner">

                <!-- Logo -->
                <!-- End Logo -->

                <!-- Rightside Menu (Search icon) -->
                <!-- End Rightside Menu -->

                <!-- Mobile Navbar Icon -->
                <!-- End Mobile Navbar Icon -->

                <!-- Navbar Navigation -->
                                
                <!-- menu -->
                <!-- menu -->
                <!-- menu -->
                
                <tiles:insertAttribute name="menu"/>
                
                <!-- menu -->
                <!-- menu -->
                <!-- menu -->
                
                <!-- End Navbar Navigation -->

            </div>
        </header>
        <!-- End Header -->

        <!-- CONTENT --------------------------------------------------------------------------------->
        <!-- Intro Section -->
        <section class="inner-intro dark-bg overlay-dark">
            <div class="container">
                <div class="row title">
                    <h2 class="h2">???????????????</h2>
					<p> ?????? ??????????????? ??????????????????! </p>
					<div class="spacer-15"></div>
                    <div class="page-breadcrumb">
                        <a href="/index">Home</a>/<span>???????????????</span>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Intro Section -->
		

        <!-- Options Section -->
        <section class="ptb-60 ptb-sm-30">
			<div class="container text-left">
                <div class="mb-30">	
                	<a id="menu-sidebar-list-icon" class="btn btn-md btn-black float-right float-none-xs" href="/free/freewrite"><i class="fa fa-filter"></i><span> ????????? </span></a>
                	<form id="frm" action="/free/freelist" method="get">
                	<select id="sizeSelect" name="size" class="btn btn-md btn-black float-right float-none-xs" onchange="submit()">
                		<option value="${size1 }">?????? ${size1 }??????</option>
                		<option value="10">10??????</option>
                		<option value="20">20??????</option>
                		<option value="30">30??????</option>
                	</select>
                	<a style="float:right">????????????</a>
                	<input type="number" name="page" min="1" max="${maxPage }" style="float:right" value="${page1 }">
                	</form>
					<h2> ??????????????? </h2>	
					<hr>
				</div>	
				<c:choose>
				<c:when test="${msg eq '????????? ????????? ????????????.' }">
					<div class="col-md-8 col-sm-8 col-xs-12">
						<a href="artist-profile.html"><h6>${msg }</h6></a>
						<p> ?????? ??????????????? ????????????????????? ????????????? </p>								
					</div>
				</c:when>
				<c:otherwise>
				<c:forEach var="vo" items="${list }">
				<div class="row mtb-30">
					<div class="item-box col-md-4 col-sm-4 col-sm-offset-0 col-xs-8 col-xs-offset-2 mb-sm-30">
						<a href="/free/freedetail?freeIdx=${vo.freeIdx}&page=${page1 }&size="${size1 }">
						<c:choose>
							<c:when test="${vo.getFreeImg().size() == 0 }">
							<img alt="Thumnail" src="/img/portfolio/1.jpg" class="item-container">
							</c:when>
							<c:otherwise>
							<img alt="Thumnail" src="/upload/${vo.freeImg.iterator().next().getFreeFileUseName() }" class="item-container">
							</c:otherwise>
						</c:choose>
						</a>                           
					</div>
					<div class="col-md-8 col-sm-8 col-xs-12">
						<a href="/free/freedetail?freeIdx=${vo.freeIdx}&page=${page1 }&size="${size1 }"><h6>${vo.freeTitle }</h6></a>
						<p class="color">${vo.player.getPNick() }</p>
						<p>????????? : ${vo.freeCnt } ???????????? : ${vo.freeWTime }</p>
						<p><a href="/free/freedetail?freeIdx=${vo.freeIdx}&page=${page1 }&size="${size1 }">
						<c:choose>
						<c:when test="${vo.freeContent.length() >= 60 }">
						${vo.freeContent.substring(0,60) }... <font size="0.7em"; color="orange";> ?????? [${vo.getFreeComment().size() }]</font>
						</c:when>
						<c:otherwise>
						${vo.freeContent } <font size="0.7em"; color="orange";> ?????? [${vo.getFreeComment().size() }]</font>
						</c:otherwise>
						</c:choose>
						</a></p>								
					</div>
				</div>	
				<hr>
				</c:forEach>
				</c:otherwise>
				</c:choose>
				</div>
			</div>
				 <div style="text-align: center;">
					<a href="?page=1&size=${size1 }">&lt;&lt;</a> 
					<a href="?page=${page1-1 }&size=${size1 }">&lt;</a>  
					
					<c:forEach var="i" begin="1" end="${maxPage }">
						<a href="?page=${i}&size=${size1 }">${i}</a>
					</c:forEach>
					
					<a href="?page=${page1+1 }&size=${size1 }">&gt;</a> 
					<a href="?page=${maxPage }&size=${size1 }">&gt;&gt;</a>
				</div>
				<form action="/free/freelist" method="get">
				<input type="hidden" name="page" value="${page1 }">
				<input type="hidden" name="size" value="${size1 }">
				<table>
					<tr>
						<th>
						<select name="searchObject">
							<option value="subject">??????</option>
							<option value="content">??????</option>
							<option value="subjectContent">??????+??????</option>
							<option value="writer">?????????</option>
						</select>
						</th>
						<th>
						<input type="text" name="searchTarget" placeholder="???????????? ???????????????" required><input type="submit" value="??????">
						</th>
					</tr>
				</table>
				</form>
        </section>
		
        <!-- End Options Section -->

        <!-- End CONTENT ------------------------------------------------------------------------------>

        <!-- FOOTER -->
        <!-- FOOTER -->
        <!-- FOOTER -->
           
        <tiles:insertAttribute name="footer"/>
        
        <!-- END FOOTER -->
        <!-- END FOOTER -->
        <!-- END FOOTER -->

        <!-- Scroll Top -->
        <a class="scroll-top">
            <i class="fa fa-angle-double-up"></i>
        </a>
        <!-- End Scroll Top -->

    </div>
    <!-- Site Wraper End -->


    <!-- JS -->

    <script src="/js/jquery-1.11.2.min.js" type="text/javascript"></script>
    <script src="/js/jquery-ui.min.js" type="text/javascript"></script>
    <script src="/js/plugin/jquery.easing.js" type="text/javascript"></script>
    <script src="/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="/js/plugin/jquery.flexslider.js" type="text/javascript"></script>
    <script src="/js/plugin/jquery.fitvids.js" type="text/javascript"></script>
    <script src="/js/plugin/jquery.viewportchecker.js" type="text/javascript"></script>
    <script src="/js/plugin/jquery.stellar.min.js" type="text/javascript"></script>
    <script src="/js/plugin/wow.min.js" type="text/javascript"></script>
    <script src="/js/plugin/jquery.colorbox-min.js" type="text/javascript"></script>	
    <script src="/js/plugin/owl.carousel.min.js" type="text/javascript"></script>
    <script src="/js/plugin/isotope.pkgd.min.js" type="text/javascript"></script>
    <script src="/js/plugin/masonry.pkgd.min.js" type="text/javascript"></script>
    <script src="/js/plugin/imagesloaded.pkgd.min.js" type="text/javascript"></script>
    <script src="/js/plugin/jquery.fs.tipper.min.js" type="text/javascript"></script>
    <script src="/js/plugin/mediaelement-and-player.min.js"></script>
    <script src="/js/plugin/sidebar-menu.js" type="text/javascript"></script>
    <script src="/js/theme.js" type="text/javascript"></script>
    <script src="/js/navigation.js" type="text/javascript"></script>
</body>
</html>

