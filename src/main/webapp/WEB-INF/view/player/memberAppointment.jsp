<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>   


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Global Talent House - hub for creative minds</title>
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
	<link href="/css/plugin/smoothproducts.css" rel="stylesheet" />	
</head>

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
                    <h2 class="h2">Terms of Use</h2>
                    <div class="page-breadcrumb">
                        <a href="/index">Home</a>/<a href="/player/join">join</a>/<span>Terms of Use</span>
                    </div>
                </div>
            </div>
        </section>
        <div class="clearfix"></div>
        <!-- End Intro Section -->
        
        
        
		<section id="about" class="wow fadeIn ptb-80 ptb-sm-30">
            <div class="container">
                <div class="row text-center">
                    <div class="col-md-12">
                        <h3 class="h4">이용 약관</h3>
                        <div class="spacer-15"></div>
                        <p>i) 해당 페이지에서 서비스 제공자를 'A', 이용자를 'B'로 칭한다. </p>
                        <p>i) A는 가진 능력과 상황하에서 최대한 B의 원활한 사이트 이용 및 개인 정보 보호를 위해 서비스한다. </p>
                        <p>i) A는 안전한 사이트 이용을 위해 B에게 다음과 같은 내용을 미리 고지한다.</p>
                        <ul style="text-align:left;">
                        <li>하나, A는 초보 개발자로 보안 및 크래킹에 취약하다.</li>
                        <li>하나, A가 서비스하는 사이트에 개인 정보 수집은 최소한으로 설계했다. 이외 B의 유출로 인한 피해 및 사건사고는 A의 책임이 없다.</li>
                        <li>하나, 사이트 특성상 개인 정보 수집은 최소한으로 유지되어 범인 특정 및 유출 피해 방지에 어려움이 있을 수 있다. 
                        하지만 A는 개인 정보 유출사례에대해 최대한의 노력을 한다.</li>
                        <li>하나, 사이트상 노출되지는 않지만 ip가 저장된다.</li>
                        <li>하나, 사이트에 발생하는 게임데이터는 ( 캐릭터, 장비, 아이템 등 ) A에게 귀속되어 B에게 이용을 서비스하는 것으로, 
                        부득이하게 B의 이전 이용 경험과 동일하지 않거나, B가 예상한 가치와 변동이 발생하더라도 이에 대한 책임을 지지 않는다.</li>
                        <li>하나, 현 사이트의 게임데이터의 이용권한을 양도할 수 있으나, 거래하는 행위는 허하지 않으며 이에 따른 사건사고는 
                        A의 책임이 없다.</li>
                        <li>하나, 서비스 중 발생하는 예외 사례에 있어서는 A의 주관대로 결정되며, B의 요청이 타당하다고 여겨질 시 A는 판단에 대해 대답할 책임이 있다.</li>
                        <li>하나, 해당 사이트 서비스는 영리목적이 아니다.</li>
                        
                        </ul> 
                    </div>
                </div>
            </div>
        </section>
		
		
		
		
        <!-- Options Section -->
        <section class="ptb-60 ptb-sm-30">
			<div class="container text-left">
                <div class="row mb-30">

				</div>
			</div>
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
	
	<script src="/js/plugin/smoothproducts.js"></script>
	
    <script src="/js/plugin/owl.carousel.min.js" type="text/javascript"></script>
    <script src="/js/plugin/isotope.pkgd.min.js" type="text/javascript"></script>
    <script src="/js/plugin/masonry.pkgd.min.js" type="text/javascript"></script>
    <script src="/js/plugin/imagesloaded.pkgd.min.js" type="text/javascript"></script>
    <script src="/js/plugin/jquery.fs.tipper.min.js" type="text/javascript"></script>
    <script src="/js/plugin/mediaelement-and-player.min.js"></script>
    <script src="/js/plugin/sidebar-menu.js" type="text/javascript"></script>
    <script src="/js/theme.js" type="text/javascript"></script>
    <script src="/js/navigation.js" type="text/javascript"></script>

	 <script type="text/javascript">
        $(window).load(function () {
            $('.sp-wrap').smoothproducts();
        });
    </script>
</body>
</html>