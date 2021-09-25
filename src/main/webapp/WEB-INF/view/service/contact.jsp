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
                    <h2 class="h2">Contact Us</h2>
					<p>We'd love to hear from you </p>
					<div class="spacer-15"></div>
                    <div class="page-breadcrumb">
                        <a href="/index">Home</a>/<span>Contact</span>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Intro Section -->

        <!-- Contact Section -->
        <section class="ptb-60 ptb-sm-30">
            <div class="container">
                <div class="row">
				<div class="col-md-6 pb-60">
                        <!-- Contact FORM -->
                        <form class="contact-form" id="contact" role="form">

                            <!-- IF MAIL SENT SUCCESSFULLY -->
                            <h6 class="successContent">
                                <i class="fa fa-check left" style="color: #5cb45d;"></i>Your message has been sent successfully.
                            </h6>
                            <!-- END IF MAIL SENT SUCCESSFULLY -->

                            <!-- MAIL SENDING UNSUCCESSFULL -->
                            <h6 class="errorContent">
                                <i class="fa fa-exclamation-circle left" style="color: #e1534f;"></i>There was a problem validating the form please check!
                            </h6>
                            <!-- END MAIL SENDING UNSUCCESSFULL -->

                            <div class="form-field-wrapper">
                                <input class="input-sm form-full" id="form-name" type="text" name="form-name" placeholder="Your Name" required>
                            </div>

                            <div class="form-field-wrapper">
                                <input class="input-sm form-full" id="form-email" type="email" name="form-email" placeholder="Email" required>
                            </div>

                            <div class="form-field-wrapper">
                                <input class="input-sm form-full" id="form-subject" type="text" name="form-subject" placeholder="Subject">
                            </div>

                            <div class="form-field-wrapper">
                                <textarea class="form-full" id="form-message" rows="7" name="form-message" placeholder="Your Message" required></textarea>
                            </div>

                            <button class="btn btn-md btn-black" type="submit" id="form-submit" name="submit">Send Message</button>
                        </form>
                        <!-- END Contact FORM -->
                    </div>
                    <div class="col-md-5 col-md-offset-1 contact">
                        <div class="contact-box-left mb-45">
                            <div class="contact-icon-left"><i class="ion ion-ios-location"></i></div>
                            <h6>Office Location</h6>
							<div class="col-md-6">
							<strong>Mumbai</strong>
                            <p>
                                37, Ground Floor, Shreeji Chambers,<br> 
								Calicut Street, Fort Market, <br>
								Mumbai - 400001
                            </p>
							<p><i class="fa fa-phone left"></i> 022 22610754</p>
							</div>
							<div class="col-md-6">
							<strong>Pune</strong>
                            <p>
                                The Mesh, C-4/5, Rakshalekha Society,<br>
								2nd Floor, Lane No-6, Koregaon Park, <br>
								Pune - 411001
                            </p>
							<p><i class="fa fa-phone left"></i> 020- 41245252</p>
							</div>
							<div class="clearfix"></div>
                        </div>
						<div class="contact-box-left mb-45">
                            <div class="contact-icon-left"><i class="fa fa-envelope-o left"></i></div>
                            <h6> yourname@domain.com</h6>          
                        </div>
                        <div class="contact-box-left mb-45">
                            <div class="contact-icon-left"><i class="ion ion-ios-people"></i></div>
                            <h6>Contact People</h6>
                            <p>
                                <span>Mr. John Doe - 09323637353</span>
								<br/>
								<span>Mrs. Jane Doe - 07498123098</span>
                            </p>
                        </div>
						
                        <div class="contact-box-left mb-45">

                            <h6>Follow Us</h6>
                            <ul class="list-none social">
                                <li><a href="https://www.twitter.com/" target="_blank"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="https://instagram.com/" target="_blank"><i class="fa fa-instagram"></i></a></li>
                                <li><a href="https://www.facebook.com/" target="_blank"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="https://vimeo.com/" target="_blank"><i class="fa fa-vimeo-square"></i></a></li>
                                <li><a href="https://www.behance.net/" target="_blank"><i class="fa fa-behance"></i></a></li>
                            </ul>
                        </div>
                    </div>
                    
                </div>
            </div>
        </section>
        <!-- Contact Section -->

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
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
    <script type="text/javascript" src="/js/map.js"></script>
    <script src="/js/contact-form.js" type="text/javascript"></script>
</body>
</html>
