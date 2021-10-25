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
                    <h2 class="h2">Privacy Policy</h2>
                    <div class="page-breadcrumb">
                        <a href="/index">Home</a>/<span>Privacy Policy</span>
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
                        <h3 class="h4">개인 정보 정책</h3>
                        <div class="spacer-15"></div>
                        <p>현 사이트는 개발자가 전혀 다른 직종에서 일을하다가 21년도에 개발을 처음 배우고, 자기 계발목표로 만든 사이트 입니다. 
                        그렇기에 개발 단계부터 보안에 취약할 것이라는 예상하에 최소한의 개인정보를 요하는 구조로 설계되었습니다.
                        관리에 편리한 카카오톡 로그인 기능도 그런 이유로 선택되지 않았습니다.</p>

						<p>Text RPG 사이트로서 서비스를 위한 최소한의 정보를 요하지만 이용자가 게시판, 채팅, 이메일 등에있어 노출하는 
						개인 정보를 보호할 수 없습니다. 개인 정보 보호 및 유출사고로 인해 본인 및 수사기관의 협조가 요구될 시 적극적으로 
						응하겠지만 	최소한의 정보를 요하는 서비스 특성상 상대를 규정하기 어려울 수 있는 점 참고바랍니다.</p>
						
						<p>협조에 따른 비용 발생시에는, 어쩔 수 없이 요구할 수 있는 상황 참고부탁드립니다.</p>
						<p>개인 e-mail의 경우 확인 늦어질 수 있는 상황 참고부탁드립니다.</p>
                    </div>
                </div>
                <div class="row mt-80">
                    <!-- Welcome Content -->
                    <div class="col-md-6">
                        <h4>당신은 소중합니다. 그렇기 때문에</h4>
                        <div class="spacer-15"></div>
                        <p>잘 알고계시다시피 스스로의 정보를 소중히 다뤄주셔야 합니다. 스스로의 정보를 유출하는 사고를 대비하기 위해서 또한,
                        타인의 정보를 유출하는 사건을 대비하기위해서 게시판에서 개인을 특정할 수 있는 정보를 게시판에 게시하는 것을 금합니다.
                        개인의 자유를 침범하고 싶지는 않지만, 타인의 정보를 본인의 정보인양 유출하는 경우도 있을 수 있기 때문입니다.
                        혹은 개인을 특정할 수 없는 상황이더라도, 민감정보에 ( 의료정보, 성적인 정보, 종교정보, 등등 ) 해당한다고 판단되는 
                        경우 역시 금합니다. 이상의 판단은 서비스하는 개발자의 판단이며, 서비스 규모상 정확한 범주를 규정하지 않습니다.</p>

						<p>규정위반으로 인한 사이트 정지는 개인에게 어떠한 불이익이나, 모독을 하는 것이 아닌 단순 해당 사이트의 이용정지이며,
						개인의 사이트 이용 데이터에대한 보호를 책임지지 않습니다.</p>
                    </div>
                    <!-- End Welcome Content -->

                    <!-- Skills -->
                    <div class="col-md-6">
						<div class="spacer-45"></div>
                        <p>개인 정보 보호 정책의 발전에 따라 그리고 개발자의 해당 정보에 대한 지식의 성장에 따라 정책내용은 변동될 수 있으며
                        업데이트 됨에 대한 동의는 새로 갱신하지 않습니다. 자유로운 온라인 공간에서 각각 개인을 보호하기위한 정책으로
                        너른 양해 부탁드립니다.</p>

						<p>해당 페이지의 내용은 약관에도 명시하는 내용으로, 이용동의는 이 페이지의 내용의 동의도 포함하게 됩니다.</p>

						<p>부디, 스스로 그리고 타인을 소중히 여기어 어떠한 힘든일도 일어나지 않기를 평안하고 평범한 하루가 반복되길
						바랍니다. 좋은 하루 되시기 바라요. :)</p>
                    </div>
                    <!-- End Skills -->
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
