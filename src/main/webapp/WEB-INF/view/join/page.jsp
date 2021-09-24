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
                <div class="logo">
                    <a href="/index.html">
                        <img class="logo-light" src="/img/gth-logo-white.png" alt="Global Talent House" />
                        <img class="logo-dark" src="/img/gth-logo-black.png" alt="Global Talent House" />
                    </a>
                </div>
                <!-- End Logo -->

                <!-- Rightside Menu (Search icon) -->
                <div class="side-menu-btn">
                    <ul>
                        <!-- Search Icon -->
                        <li class="">
                            <a class="search-overlay-menu-btn header-icon"><i class="fa fa-search"></i></a>
                        </li>
                        <!-- End Search Icon -->
                    </ul>
                </div>
                <!-- End Rightside Menu -->

                <!-- Mobile Navbar Icon -->
                <div class="nav-mobile nav-bar-icon">
                    <span></span>
                </div>
                <!-- End Mobile Navbar Icon -->

                <!-- Navbar Navigation -->
                <div class="nav-menu">
                    <ul class="nav-menu-inner">
                        <li>
                            <a class="" href="/home.html">Home</a>
                        </li>
                        <li>
                            <a class="" href="/about-us.html">About Us</a>                         
                        </li>
                        <li>
                            <a class="menu-has-sub">Artists <i class="fa fa-angle-down"></i></a>
							<!-- Dropdown -->
                            <ul class="sub-dropdown dropdown">
								<li>
                                    <a href="/artist-directory.html">Artist Directory</a>
                                </li>
                                <li>
                                    <a href="/institutes-directory.html">Training Institutes</a>
                                </li>
                            </ul>
                            <!-- End Dropdown -->
                        </li>
                        <li>
                            <a class="menu-has-sub">Events <i class="fa fa-angle-down"></i></a>
							<!-- Dropdown -->
                            <ul class="sub-dropdown dropdown">
								<li>
                                    <a href="/upcoming-competitions.html">Competitions & Auditions</a>
                                </li>
                                <li>
                                    <a href="/events-calendar.html">Events Calendar</a>
                                </li>
								<li>
                                    <a href="/past-events.html">Past Events Gallery</a>
                                </li>
                            </ul>
                            <!-- End Dropdown -->
                        </li>
                        <li>
                            <a class="" href="/contact-us.html">Contact Us</a>
                        </li>
                        <li>
                            <a class="" href="/login.html">Sign In</a>                            
                        </li>
						<li>
                            <a class="btn btn-md btn-black join-btn" href="/join-gth.html">Join GTH</a>                            
                        </li>
                    </ul>
                </div>
                <!-- End Navbar Navigation -->

            </div>
        </header>
        <!-- End Header -->

        <!-- CONTENT --------------------------------------------------------------------------------->
        <!-- Intro Section -->
        <section class="inner-intro dark-bg overlay-dark">
            <div class="container">
                <div class="row title">
                    <h2 class="h2">Login</h2>
                    <div class="page-breadcrumb">
                        <a href="/index.html">Home</a>/<span>Login</span>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Intro Section -->
        
        <!-- Login Section -->
        <section id="Pricing" class="ptb-60 ptb-sm-30">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <div class="border-box">
                            <h4>Already registered?</h4>
                            <form>
                                <div class="form-field-wrapper">
                                    <label for="login-email">Email address</label>
                                    <input type="email" required="" placeholder="Enter your Email" name="login-email" id="login-email" class="input-sm form-full" aria-required="true">
                                </div>
                                <div class="form-field-wrapper">
                                    <label for="login-pass">Password</label>
                                    <input type="password" required="" placeholder="Enter your Password" name="login-pass" id="login-pass" class="input-sm form-full" aria-required="true">
                                </div>
                                <button name="submit" id="form-submit" type="submit" class="btn btn-md btn-black">Sign In</button>
                                <a class="float-right">Forgot password?</a>
                            </form>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="border-box">
                            <h4>Join Global Talent House</h4>
                            <p> We are the largest community of artists. Click the button below to become a member.</p>
							<a class="btn btn-md btn-black join-btn">Join GTH</a>  
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Login Section -->

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
