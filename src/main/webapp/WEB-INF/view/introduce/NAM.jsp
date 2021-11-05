<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>   

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
        <section class="inner-intro dark-bg overlay-dark ">
            <div class="container">
                <div class="row title">
                    <h2 class="h2">N.A.M.에 대해</h2>
					<h6>Story for N.A.M...</h6>
					<div class="spacer-15"></div>
                    <div class="page-breadcrumb">
                        <a href="/index">Home</a>/<span>About N.A.M.</span>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Intro Section -->
        
        <!-- About Section -->
        <section id="about" class="wow fadeIn ptb-80 ptb-sm-30">
            <div class="container">
                <div class="row text-center">
                    <div class="col-md-12">
                        <h3 class="h4">N.A.M.은 옛 텍스트 기반 웹 게임 입니다.</h3>
                        <div class="spacer-15"></div>
                        <p style="text-align:left;">
						어린시절 텍스트 기반의 웹 게임에 대한 기억이 있어, 데이터를 다루는 데에 있어 좋은 훈련이 될 거라 생각하고<br>
						제 수준에서 구현할 수 있는 수준으로 웹 게임을 구현해보고자 했습니다.<br><br>
						미흡한 부분이 많을거고 얼마만큼의 유저분들이 한번에 접속이 가능한지, 서버가 어떻게 감당해 가는지 등을<br>
						알지 못해 대비도 되어있지 않습니다. 또한 사이트 자체에 대해서도 게임에 대해서도 1인 개발로<br>
						대응 속도역시 미진할 것 같습니다.<br>
						</p>

						<p style="text-align:left;">
						다만 기획 중, 최대하나 서버자원을 효율적으로 관리하기위해 많은 노력을 기울이고 있으니<br>
						참고부탁드립니다.<br>
						</p>

						<p style="text-align:left;">
						게임 설계에대한 지식이 전무해 즐겨보던 경험으로 최대한 즐겁게 만들 수 있도록 해보겠습니다. 감사합니다.<br>
						</p>
                    </div>
                </div>
            </div>
        </section>


        <!-- Vision -->
        <!-- End Vision -->

        <!-- Team -->
        <!-- End Team -->

        <!-- About Section -->

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
    <script src="/js/plugin/jquery.validate.min.js" type="text/javascript"></script>
    <script src="/js/plugin/sidebar-menu.js" type="text/javascript"></script>
    <script src="/js/theme.js" type="text/javascript"></script>
    <script src="/js/navigation.js" type="text/javascript"></script>
</body>
</html>
