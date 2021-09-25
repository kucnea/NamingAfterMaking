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
                    <h2 class="h2">Artist Directory</h2>
					<p>Explore our directory of selected artists. Use the filters to help find what you’re looking for. </p>
					<div class="spacer-15"></div>
                    <div class="page-breadcrumb">
                        <a href="/index">Home</a>/<span>Artist Directory</span>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Intro Section -->
		<!-- Sidemenu -->
					<section id="pushmenu-right" class="pushmenu pushmenu-right side-menu">
						<a id="menu-sidebar-close-icon" class="menu-close"><i class="ion ion-android-close"></i></a>
						<h5 class="white">Filters</h5>
						<div class="filter-form">
							 <!-- Filters FORM -->
                        <form class="filters-form" id="filters" role="form">
							<div class="form-field-wrapper">
								<input class="input-sm form-full" id="form-name" type="text" name="form-name" placeholder="Name">
							</div>
							<div class="form-field-wrapper">
								<input class="input-sm form-full" id="form-state" type="text" name="form-state" placeholder="State">
							</div>                                   
							<div class="form-field-wrapper">
								<input class="input-sm form-full" id="form-city" type="text" name="form-city" placeholder="City">
							</div>							
							<div class="form-field-wrapper">
								<input class="input-sm form-full" id="form-tags" type="text" name="form-tags" placeholder="Tags">
							</div>
							<div class="accordion mb-15">
                            <div class="accordion-section">
                                <h6 class="accordion-title white">Category</h6>
                                <div class="accordion-content">
                                    <div class="form-field-wrapper">
										<span><input class="input-sm" id="category" type="checkbox" name="form-category" value="Graphic Designer">Graphic Designer</span><br>
										<span><input class="input-sm" id="category" type="checkbox" name="form-category" value="Animators">Animator<span><br>
										<span><input class="input-sm" id="category" type="checkbox" name="form-category" value="Creative Directors">Creative Directors<span><br>
										<span><input class="input-sm" id="category" type="checkbox" name="form-category" value="Webdev">Web Developers<span><br>
										<span><input class="input-sm" id="category" type="checkbox" name="form-category" value="Videographers">Videographers<span><br>
										<span><input class="input-sm" id="category" type="checkbox" name="form-category" value="Coordinators">Coordinators<span><br>
										<span><input class="input-sm" id="category" type="checkbox" name="form-category" value="CastingDirectors">Casting Directors<span><br>
										<span><input class="input-sm" id="category" type="checkbox" name="form-category" value="Actors">Actors<span><br>
										<span><input class="input-sm" id="category" type="checkbox" name="form-category" value="Dancers">Dancers<span><br>
										<span><input class="input-sm" id="category" type="checkbox" name="form-category" value="ScriptWriter">Script Writer<span><br>
										<span><input class="input-sm" id="category" type="checkbox" name="form-category" value="Beauticians">Beauticians<span><br>
										<span><input class="input-sm" id="category" type="checkbox" name="form-category" value="HairStylist">Hair Stylist<span><br>
										<span><input class="input-sm" id="category" type="checkbox" name="form-category" value="FashionStylist">Fashion Stylist<span><br>
										<span><input class="input-sm" id="category" type="checkbox" name="form-category" value="Choreographers">Choreographers<span><br>
										<span><input class="input-sm" id="category" type="checkbox" name="form-category" value="Curators">Curators<span><br>
										<span><input class="input-sm" id="category" type="checkbox" name="form-category" value="Magicians">Magicians<span><br>
										<span><input class="input-sm" id="category" type="checkbox" name="form-category" value="Decorators">Decorators<span><br>
										<span><input class="input-sm" id="category" type="checkbox" name="form-category" value="Sound">Sound<span><br>
										<span><input class="input-sm" id="category" type="checkbox" name="form-category" value="Promoters">Promoters/ Hostesses<span><br>
										<span><input class="input-sm" id="category" type="checkbox" name="form-category" value="VFXArtist">VFX Artist<span><br>
										<span><input class="input-sm" id="category" type="checkbox" name="form-category" value="Visualizers">Visualizers<span><br>
										<span><input class="input-sm" id="category" type="checkbox" name="form-category" value="ContentWriters">Content Writers<span><br>
										<span><input class="input-sm" id="category" type="checkbox" name="form-category" value="Photographers">Photographers<span><br>
										<span><input class="input-sm" id="category" type="checkbox" name="form-category" value="Models">Models<span><br>
										<span><input class="input-sm" id="category" type="checkbox" name="form-category" value="Directors">Directors<span><br>
										<span><input class="input-sm" id="category" type="checkbox" name="form-category" value="Film Editors">Film Editors<span><br>
										<span><input class="input-sm" id="category" type="checkbox" name="form-category" value="Singers">Singers<span><br>
										<span><input class="input-sm" id="category" type="checkbox" name="form-category" value="Choreographers">Choreographers<span><br>
									</div>
								</div>
                            </div>
							</div>
							
                        <button class="btn btn-md btn-white form-full" type="submit" id="form-submit" name="submit">Filter</button>
                        </form>
                        <!-- END Filters	 FORM -->
						</div>
					</section>
					<!--End Sidemenu -->

        <!-- Options Section -->
        <section class="ptb-60 ptb-sm-30">
			<div class="container text-left">
                <div class="mb-30">	
					<a id="menu-sidebar-list-icon" class="btn btn-md btn-black float-right float-none-xs"><i class="fa fa-filter"></i><span> Filters</span></a>
					<h2> 1000 Artists </h2>	
					<hr>
				</div>	
				<div class="row mtb-30">
					<div class="item-box col-md-4 col-sm-4 col-sm-offset-0 col-xs-8 col-xs-offset-2 mb-sm-30">
						<a href="artist-profile.html"><img alt="1" src="/img/portfolio/1.jpg" class="item-container"></a>                           
					</div>
					<div class="col-md-8 col-sm-8 col-xs-12">
						<a href="artist-profile.html"><h6>John Doe</h6></a>
						<p class="color">Singer, Musician</p>
						<p>Pune, India</p>
						<p>Aenean tempor ullamcorper leo. Vivamus sed magna quis ligula eleifend adipiscing. Duis orci. Aliquam sodales tortor 
						vitae ipsum. Aliquam nulla. Duis aliquam molestie erat. Ut et mauris vel pede varius sollicitudin. Sed ut dolor nec 
						orci tincidunt interdum. Phasellus ipsum. Nunc tristique tempus lectus.
						<a class="btn" href="artist-profile.html">View Profile</a>
						</p>								
					</div>
				</div>	
				<hr>
				<div class="row mtb-30">
					<div class="item-box col-md-4 col-sm-4 col-sm-offset-0 col-xs-8 col-xs-offset-2 mb-sm-30">
						<a href="artist-profile.html"><img alt="1" src="/img/portfolio/1.jpg" class="item-container"></a>                            
					</div>
					<div class="col-md-8 col-sm-8 col-xs-12">
						<a href="artist-profile.html"><h6>John Doe</h6></a>
						<p class="color">Singer, Musician</p>
						<p>Pune, India</p>
						<p>Aenean tempor ullamcorper leo. Vivamus sed magna quis ligula eleifend adipiscing. Duis orci. Aliquam sodales tortor 
						vitae ipsum. Aliquam nulla. Duis aliquam molestie erat. Ut et mauris vel pede varius sollicitudin. Sed ut dolor nec 
						orci tincidunt interdum. Phasellus ipsum. Nunc tristique tempus lectus.
						<a class="btn" href="artist-profile.html">View Profile</a>
						</p>
					</div>
				</div>
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

