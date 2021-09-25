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
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
    <link rel="icon" type="image/png" href="img/favicon.png">
    <link rel="apple-touch-icon" href="img/favicon.png">

    <!-- CSS -->
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="css/font-awesome.css" rel="stylesheet" type="text/css" />
    <link href="css/ionicons.css" rel="stylesheet" type="text/css" />
    <link href="css/plugin/sidebar-menu.css" rel="stylesheet" type="text/css" />
    <link href="css/plugin/animate.css" rel="stylesheet" type="text/css" />
    <link href="css/jquery-ui.css" rel="stylesheet" type="text/css" />
    <!-- SLIDER REVOLUTION CSS SETTINGS -->
    <link href="plugin/rs-plugin/css/settings.css" rel="stylesheet" type="text/css" media="screen" />

</head>

<body style="overflow:hidden;">

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
        <!-- Intro -->
        <div id="intro" class="section">
			<div class="intro">
            <!-- Revolution Bg Video -->
            <div class="tp-banner-container">
                <div class="intro-Rev_Video text-center dark-bg black-bg">
                    <ul>
                        <li data-transition="fadein" data-slotamount="default" data-saveperformance="off" data-fsslotamount="7">

                            <!-- MAIN IMAGE -->
                            <img src="media/video1_poster.jpg" alt="video_forest" data-bgposition="center center" data-bgfit="cover" data-bgrepeat="no-repeat">
                            <!-- LAYERS -->

                            <!-- Video Bg-->
                            <div class="tp-caption fullscreenvideo"
                                data-x="0"
                                data-y="0"
                                data-speed="0"
                                data-start="0"
                                data-easing="easeNone"
                                data-endspeed="1500"
                                data-endeasing="easeNone"
                                data-autoplay="true"
                                data-autoplayonlyfirsttime="false"
                                data-nextslideatend="true"
                                data-videowidth="100%"
                                data-videoheight="100%"
                                data-forcecover="1"
                                data-dottedoverlay="twoxtwo"
                                data-aspectratio="16:9"
                                data-forcerewind="on"
                                data-volume="mute"
                                style="z-index: 2">


                                <video class="video-js vjs-default-skin" preload="" loop="" width="100%" height="100%"
                                    poster='media/video1_poster.jpg'>
                                    <source src="media/video1.mp4" type='video/mp4' />
                                    <source src='media/video1.webm' type='video/webm' />
                                    <source src='media/video1.ogv' type='video/ogg' />
                                </video>


                                <!-- LAYER NR. 1 -->
                                <h5 class="tp-caption customin customout sfb"
                                    data-x="center"
                                    data-hoffset="0"
                                    data-y="center"
                                    data-voffset="-80"
                                    data-speed="800"
                                    data-start="800"
                                    data-endspeed="500"
                                    data-customin="x:-0;y:-100;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0.5;scaleY:0.5;skewX:0;skewY:0;opacity:0;transformPerspective:0;transformOrigin:50% 50%;"
                                    data-customout="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0.75;scaleY:0.75;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                                    data-easing="Linear.easeNone"
                                    data-elementdelay="0.1">Hub For Creative Minds
                                </h5>

                                <!-- LAYER NR. 2 -->
                                <h1 class="tp-caption customin customout sfb h1"
                                    data-x="center"
                                    data-hoffset="0"
                                    data-y="center"
                                    data-voffset="0"
                                    data-speed="800"
                                    data-start="1400"
                                    data-endspeed="500"
                                    data-customin="x:0;y:0;z:0;rotationX:90;rotationY:0;rotationZ:0;scaleX:1;scaleY:1;skewX:0;skewY:0;opacity:0;transformPerspective:200;transformOrigin:50% 0%;"
                                    data-customout="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0.75;scaleY:0.75;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                                    data-easing="Linear.easeNone"
                                    data-elementdelay="0.1"
                                    data-endeasing="Linear.easeNone">Global Talent House
                                </h1>

                                <!-- LAYER NR. 3 -->
                                <div href="home.html" class="tp-caption customin customout sfb"
                                    data-x="center"
                                    data-hoffset="0"
                                    data-y="center"
                                    data-voffset="90"
                                    data-customin="x:0;y:100;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0.5;scaleY:0.5;skewX:0;skewY:0;opacity:0;transformPerspective:0;transformOrigin:50% 50%;"
                                    data-customout="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:0.75;scaleY:0.75;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
                                    data-speed="800"
                                    data-start="2000"
                                    data-endspeed="500"
                                    data-easing="Linear.easeNone"
                                    data-elementdelay="0.1">
                                    <a href="home.html" class="btn btn-md btn-white-line xs-hidden scroll-to-target">Enter Site</a><span class="btn-space-10 xs-hidden"></span>
                                </div>


                            </div>

                        </li>
                    </ul>
                </div>
            </div>
            <!-- End Revolution Bg Video -->
			</div>
        </div>
        <!-- End Intro -->
    </div>
    <!-- Site Wraper End -->


    <!-- JS -->

    <script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
    <script src="js/plugin/jquery.easing.js" type="text/javascript"></script>
    <script src="js/jquery-ui.min.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/plugin/jquery.fitvids.js" type="text/javascript"></script>
    <script src="js/plugin/jquery.viewportchecker.js" type="text/javascript"></script>
    <script src="js/plugin/jquery.stellar.min.js" type="text/javascript"></script>
    <script src="js/plugin/wow.min.js" type="text/javascript"></script>
    <script src="js/plugin/jquery.colorbox-min.js" type="text/javascript"></script>
    <!-- SLIDER REVOLUTION SCRIPTS  -->
    <script src="plugin/rs-plugin/js/jquery.themepunch.tools.min.js" type="text/javascript"></script>
    <script src="plugin/rs-plugin/js/jquery.themepunch.revolution.min.js" type="text/javascript"></script>
    <!-- End SLIDER REVOLUTION SCRIPTS  -->
    
    <script src="js/plugin/jquery.fs.tipper.min.js" type="text/javascript"></script>
    <script src="js/plugin/mediaelement-and-player.min.js"></script>
    <script src="js/plugin/sidebar-menu.js" type="text/javascript"></script>
    <script src="js/revolution-slider.js" type="text/javascript"></script>
    <script src="js/theme.js" type="text/javascript"></script>
    <script src="js/navigation.js" type="text/javascript"></script>

</body>
</html>
