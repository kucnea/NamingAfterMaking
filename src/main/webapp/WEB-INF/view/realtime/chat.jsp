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
	<script type="text/javascript">
	
	function sendMessage(){
		var msg = document.getElementById("message").value;
		/* socket.send(msg); */
		
		if(${player.getPId() != null}) var user2 = "${player.getPId() }";
		else user2 = "unknown";
		
		var user1 = document.getElementById("targetP").value;
		if(user1.length == 0) user1="all";
		
		
		if(socket){
			socket.send("chat,"+user2+","+user1+","+msg+",1");
		}
	}
	
	
	function connectChat(){
		if(${player.getPId() != null}) var user2 = "${player.getPId() }";
		else user2 = "unknown";
		
		var user1 = "all";
		var string1 = "";
		var string2 = "0";
		
		if(socket){
			socket.send("chat,"+user2+","+user1+","+string1+","+string2);
		}
		
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
                    <h2 class="h2">About Us</h2>
					<h6>Hub for creative minds</h6>
					<div class="spacer-15"></div>
                    <div class="page-breadcrumb">
                        <a href="/index">Home</a>/<span>About</span>
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
                    
                        <h3 class="h4">같은 용사분들과 실시간 채팅을 나눠보세요!</h3>
                        <div class="spacer-15"></div>
						<input type="button" id="enterBtn" value="ENTER"/>
						<input type="button" id="exitBtn" value="EXIT"/>
						<p>
						Session ID : 
						<div id="chatArea" style="display:none; text-align:left; width:80%; height:250px; overflow:auto;"></div>
						</p>
						<input type="text" id="targetP" value=""/>
						<input type="text" id="message" size="50"/>
						<input type="button" id="sendBtn" value="SEND" onclick="sendMessage()"/>
						<input type="button" id="connectBtn" value="접속하기" onclick="connectChat()"/>
						
						<div id="data">
						
						</div>
						
						<p>We at Global talent house understand your needs, your foresight and….you. Thus we take you ahead confirming your presence in style 
						with our sweat our toil. Firming your grip on every industry, securing a spot in every event, here we are, not just to give and take, 
						but to participate.</p>
                    </div>
                </div>
                <div class="row mt-80">
                    <!-- Welcome Content -->
                    <div class="col-md-6">
                        <h4>YOU ARE SO WE ARE.</h4>
                        <div class="spacer-15"></div>
                        <p>We understand that it is very difficult for the established or the emerging creative professionals to show case there talents on the 
						web, live through portfolios, show reels, or video clips of creative individuals or groups displaying their talents or to do live 
						performance for promotions individuals. The basic infrastructure cost for making portfolios, video clips, show reels and more 
						importantly the marketing would be too time consuming and not economically viable for each individuals or group.</p>

						<p>However we cover you all in our own special way.</p>

						<p>Hence Global Talent House.com an online portal dedicated to the creative community was established with the sole aim of providing 
						the creative professionals a platform to show case there talents to the national and international community and helping individuals 
						and groups open their doors to global markets.</p>
                    </div>
                    <!-- End Welcome Content -->

                    <!-- Skills -->
                    <div class="col-md-6">
						<div class="spacer-45"></div>
                        <p>With a the perfect team of advisor, trainers, skill developers, Photographers, Web & graphic Designers, Marketers, Coordinators, 
						promotions and PR Managers we are your one stop shop for all your promotional needs. This we do by providing creative innovative and 
						cost effective marketing strategies and solutions in the most convincing and professionals ways.</p>

						<p>All promotional need services are provided at a very nominal cost. Our training and skill development ensures that you are better 
						than the best.</p>

						<p>So go global - Share the same platform as the leaders in the creative world.</p>

						<p>Now…….Isn’t it the simplest way, to put a plus factor into your own creative outlook……!</p>
                    </div>
                    <!-- End Skills -->
                </div>
            </div>
        </section>


        <!-- Vision -->
        <section id="testimonial" class="overlay-dark80 dark-bg ptb-80 ptb-sm-80" style="background-image: url('/img/full/25.jpg');" data-stellar-background-ratio="0.4">
            <div class="container">
                <div class="owl-carousel testimonial-carousel nf-carousel-theme white">
                    <div class="item">
                        <div class="testimonial text-center dark-color">
							<h4 class="quote-author">Our Vision</h4>
                            <p class="lead">To become the most admired and sought after provider of a platform to the talented creative community of India. </p>
                        </div>
                    </div>
                    <div class="item">
                        <div class="testimonial text-center dark-color">
                            <h4 class="quote-author">Our Mission</h4>
                            <p class="lead">To unearth the best available Indian talent from different regions of the country and the world.</p>
							<p class="lead">To provide them the best possible Guidance, Training, Grooming and Skill development to enable them to showcase their talent across the world to the Global Market.</p>
                        </div>
                    </div>
                    <div class="item">
                        <div class="testimonial text-center dark-color">
                            <h4 class="quote-author">Our Values</h4>
                            <p class="lead">To maintain transparency</p>
							<p class="lead">To provide Quality Service</p>
							<p class="lead">Customers satisfaction</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Vision -->

        <!-- Team -->
        <section class="ptb-80 ptb-sm-80">
            <div class="container text-center">
                <h3>The Team Behind The Scenes</h3>
                <div class="spacer-60"></div>
                <!--Team Carousel -->
                <div class="row">
                    <div class="owl-carousel team-carousel nf-carousel-theme">

                        <div class="item">
                            <div class="team-item nf-col-padding">
                                <div class="team-item-img">
                                    <img src="/img/team/people-1.jpg" alt="" />
                                    <div class="team-item-detail">
                                        <div class="team-item-detail-inner light-color">
                                            <h5>John Doe</h5>
                                            <p>Similique sunt culpa qui officia deserunt mollitia animi dolorum fuga.</p>
                                            <ul class="social">
                                                <li><a href="https://www.facebook.com/" target="_blank"><i class="fa fa-facebook"></i></a></li>
                                                <li><a href="https://www.twitter.com/" target="_blank"><i class="fa fa-twitter"></i></a></li>
                                                <li><a href="https://www.dribbble.com/" target="_blank"><i class="fa fa-dribbble"></i></a></li>
                                                <li><a href="https://www.pinterest.com/" target="_blank"><i class="fa fa-pinterest"></i></a></li>
                                                <li><a href="https://www.behance.net/" target="_blank"><i class="fa fa-behance"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="team-item-info">
                                    <h5>John Doe</h5>
                                    <p class="">Designer</p>
                                </div>
                            </div>
                        </div>

                        <div class="item">
                            <div class="team-item nf-col-padding">
                                <div class="team-item-img">
                                    <img src="/img/team/people-2.jpg" alt="" />
                                    <div class="team-item-detail">
                                        <div class="team-item-detail-inner light-color">
                                            <h5>John Doe</h5>
                                            <p>Similique sunt culpa qui officia deserunt mollitia animi dolorum fuga.</p>
                                            <ul class="social">
                                                <li><a href="https://www.facebook.com/" target="_blank"><i class="fa fa-facebook"></i></a></li>
                                                <li><a href="https://www.twitter.com/" target="_blank"><i class="fa fa-twitter"></i></a></li>
                                                <li><a href="https://www.dribbble.com/" target="_blank"><i class="fa fa-dribbble"></i></a></li>
                                                <li><a href="https://www.pinterest.com/" target="_blank"><i class="fa fa-pinterest"></i></a></li>
                                                <li><a href="https://www.behance.net/" target="_blank"><i class="fa fa-behance"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="team-item-info">
                                    <h5>John Doe</h5>
                                    <p class="">Artist</p>
                                </div>
                            </div>
                        </div>

                        <div class="item">
                            <div class="team-item nf-col-padding">
                                <div class="team-item-img">
                                    <img src="/img/team/people-3.jpg" alt="" />
                                    <div class="team-item-detail">
                                        <div class="team-item-detail-inner light-color">
                                            <h5>Jane Doe</h5>
                                            <p>Similique sunt culpa qui officia deserunt mollitia animi dolorum fuga.</p>
                                            <ul class="social">
                                                <li><a href="https://www.facebook.com/" target="_blank"><i class="fa fa-facebook"></i></a></li>
                                                <li><a href="https://www.twitter.com/" target="_blank"><i class="fa fa-twitter"></i></a></li>
                                                <li><a href="https://www.dribbble.com/" target="_blank"><i class="fa fa-dribbble"></i></a></li>
                                                <li><a href="https://www.pinterest.com/" target="_blank"><i class="fa fa-pinterest"></i></a></li>
                                                <li><a href="https://www.behance.net/" target="_blank"><i class="fa fa-behance"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="team-item-info">
                                    <h5>Jane Doe</h5>
                                    <p class="">Project Manager</p>
                                </div>
                            </div>
                        </div>

                        <div class="item">
                            <div class="team-item nf-col-padding">
                                <div class="team-item-img">
                                    <img src="/img/team/people-4.jpg" alt="" />
                                    <div class="team-item-detail">
                                        <div class="team-item-detail-inner light-color">
                                            <h5>John Doe</h5>
                                            <p>Similique sunt culpa qui officia deserunt mollitia animi dolorum fuga.</p>
                                            <ul class="social">
                                                <li><a href="https://www.facebook.com/" target="_blank"><i class="fa fa-facebook"></i></a></li>
                                                <li><a href="https://www.twitter.com/" target="_blank"><i class="fa fa-twitter"></i></a></li>
                                                <li><a href="https://www.dribbble.com/" target="_blank"><i class="fa fa-dribbble"></i></a></li>
                                                <li><a href="https://www.pinterest.com/" target="_blank"><i class="fa fa-pinterest"></i></a></li>
                                                <li><a href="https://www.behance.net/" target="_blank"><i class="fa fa-behance"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="team-item-info">
                                    <h5>John Doe</h5>
                                    <p class="">Photographer</p>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <!--End Team Carousel --->
            </div>
        </section>
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
