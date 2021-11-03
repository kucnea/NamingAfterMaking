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
	<link href="/css/plugin/jquery.fullPage.css" rel="stylesheet" />
    <!-- SLIDER REVOLUTION CSS SETTINGS -->
    <link href="/plugin/rs-plugin/css/settings.css" rel="stylesheet" type="text/css" media="screen" />

</head>
<tiles:insertAttribute name="title"/>

	<script type="text/javascript">
	
	/* 
	protocol
	user2 : 접속 유저
	user1 : "all" 로 통일
	string1 : 액션
	string2 : 장소 ( player.location.getLocIdx() )
	*/
	 
	
	function sendMessage(){
		var msg = document.getElementById("message").value;
		
		if(${player.getPIdx() != null}){
		
			var user2 = "${player.getPIdx() }";
			var user1= "all"; 
			
			if(msg.length > 0){
				if(socket){
					socket.send("game,"+user2+","+user1+","+msg+",1");
				}
			}
			
		}
		else user2 = "unknown";
		
		document.getElementById("message").value = "";
		document.getElementById("message").focus();
		
	}
	
	function connectGame(){
		if(${player.getPIdx() != null}){
			
			var user2 = "${player.getPIdx() }";
			var user1 = "all";  /* player.location.getLocChar 에 따라 */
			var string1 = "";
			var string2 = "0";
			if(socket) socket.send("game,"+user2+","+user1+","+string1+","+string2);
			
		}else{
			console.log('INFO : player의 번호가 확인되지 않습니다.');
		}
	}
	
	function enterkey(){
	
		if(event.keyCode ==13){
			sendMessage();
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
		<div id="fullpage">
		<!-- Competitions Slider -->
        <div id="competitions" class="section pt-60 pt-sm-80">
			<div class="container">
            <div class="owl-carousel content-carousel content-slider">
                <div class="item">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-4 mb-sm-30">
                                <img class="box-shadow" src="/img/competitions/knight1.jpg" alt="" />
                            </div>
                            <div class="col-md-7 col-md-offset-1">
                                <h3>강력한 용사를 키워보세요!</h3>
                                <div class="spacer-15"></div>
                                <p>용사는 당신을 기다리고 있습니다.</p>
								<p>강인한 장비와 당신의 전략</p>
								<p>무궁무진한 모험의 세계에 같이 뛰어들 준비가 되셨나요?</p>                                
                                <div class="spacer-15"></div>
                                <a href="/player/login" target="_blank"class="btn btn-md btn-black" style="margin:50px;">용사와 합류하기</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-7 mb-sm-30">
                                <h3>숨겨진 보물들을 찾아보세요!</h3>
                                <div class="spacer-15"></div>
                                <p>N.A.M의 세계에는 보물들이 숨겨져있습니다.</p>
                                <p>용사를 더 강하게 만들어 줄 보물들을 찾아보세요!</p>
                                <div class="spacer-15"></div>
                                <img class="box-shadow" src="/img/competitions/mountain.jpg" alt="" style="margin:50px;"/>
                                <br>
                            </div>
                            <div class="col-md-4 col-md-offset-1">
                                <a href="/gong/gonglist" class="btn btn-md btn-black" style="float:center;">공략게시판 </a>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-4 mb-sm-30">
                                <img class="box-shadow" src="/img/competitions/colosseum.jpg" alt="" />
                            </div>
                            <div class="col-md-7 col-md-offset-1">
                                <h3>최강의 용사를 가려보세요!</h3>
                                <div class="spacer-15"></div>
                                <p>많은 용사들이 최강의 용사가 되기위해 정진하고 있습니다.</p>
                                <p>그들에게 최고가 누구인지 알려주는건 어떨까요?</p>
                                <p>게임 내에서 다른 용사와 전투할 수 있습니다.</p>
                                <div class="spacer-15"></div>
                                <a href="/rank/page" class="btn btn-md btn-black" style="margin:50px;">렝킹페이지</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
			</div>
        </div>
        <!-- End Competitions Slider -->
        <!-- About Section -->
        <div id="about" class="section overlay-dark80 light-color pt-60 pt-sm-80 pb-sm-30" style="background:#323232;">
            <div class="container text-left">
                <div class="row">
                    <div class="about-text col-md-7 mb-30">
						<h3 class="padding-20 shadow" style="background-color:#8BC6CA;">N.A.M.의 이야기...</h3>
						<div class="padding-20 shadow" style="margin:-10px 0 0 15px;background: rgba(255,255,255,0.08);">
						<p>
						아무도 끝을 모르는 <br>
						이름은 나중에 지어질 대륙에 사람들은 평화롭게 살고 있었다. <br>
						끝을 알 수 없는 대륙에 자원은 충분했고, <br>
						누군가 욕심을 부려 남의 것을 뺏을 필요도 없었다. <br>
						법도 필요하지 않아 제정되지 않았고,  <br>
						더 효율적인 체계도, 누군가 누구를 부리는 일도 없었다. <br>
						<br>
						그런데 어느 날,<br> 
						단지 심심했었던 한 이름은 나중에 지어질 사람이 <br>
						본인의 이름이 없다는 것을 알아차렸고 <br>
						그것에 대해 궁금해하기 시작했다. <br>
						<br>
						그때부터 대륙의 사람들은 이름에 대한 결핍을 느끼기 시작했고 <br>
						끝없이 풍부했던 자원도 누군가의 것이라는 이름을 붙이고 싶어했다. <br>
						<br>
						그러던 중 어떤 이름은 나중에 지어질 노인이 <br>
						<br>
						"사실 옛날에는 모두에게 이름이 있었단다. 사람들의 이름은 천사가 가지고 갔단다. <br>
						 그렇게 우리는 누군가의 것이라는 생각을 하지 않게되고, 욕심을 부리지 않아 평화로워 진 것이지." <br>
						 <br>
						라고 사람들에게 알려주었다.<br>
						<br>
						그렇게 사람들은 천사에게 이름을 돌려달라고 성화를 부렸고,<br>
						천사는 이름을 갖고 있지도 않았고 노인에게 속은 사람들에게 실망해 대륙을 떠났다.<br>
						그리고 왜인지 대륙 곳곳에서 괴물들이 출현하게되고<br>
						<br>
						사람들은 용사를 필요로 하게됐는데..<br>
						<br>
						...&lt;더보기&gt;
						</p>
						</div>
						
					</div>
					<div class="col-xs-10 col-xs-offset-1 col-sm-10 col-md-offset-0 col-md-5">
						<img class="aligncenter" src="/img/mystery.jpg" />
					</div>
                </div>
            </div>
        </div>
        <!-- End About Section -->
		
        <!-- Calendar Section -->
        <!-- <div id="competitions" class="section pt-60 pt-sm-80" style="background:#323232;"> -->
        <div id="about" class="section overlay-dark80 light-color pt-60 pt-sm-80 pb-sm-30" style="background:#323232;">
            <div class="container">
                    	
				
				<h3 class="h4"> 접속하기를 눌러 용사를 조종해보세요! </h3>
                <h5 class="h4"> 명령어 : "이동 앞으로", "이동 뒤로" 까지 현재 지원됩니다.</h5>
                <h5 class="h4"> 많은 명령어가 추가될 예정이니 기대해주세요. </h5>
                <h5 class="h4"> 로그인을 통해 계약한 용사를 준비시켜야 접속이 가능합니다. </h5>
                <div class="spacer-15"></div>
				<p>
				<div id="chatArea" style="display:none; text-align:left; width:80%; height:250px; overflow:auto;"></div>
				</p>
				<input type="text" id="message" size="80" onkeyup="enterkey()" />
				<input type="button" id="sendBtn" value="SEND" onclick="sendMessage()"/>
				<input type="button" id="connectBtn" value="접속하기" onclick="connectGame()"/>
				

            </div>
        </div>
        <!-- <div id="calendar" class="section ptb-60 pt-sm-80 bg-img light-color" style="background: #93301d url('img/events-bg.jpg') left center no-repeat; background-size:100% auto;">
            <div class="container text-left">
				<div class="col-md-7">
                <h3 class="float-left float-none-xs">EVENTS THIS MONTH</h3>
                <div class="spacer-30"></div>
				<img src="/img/calendar.png"/>
				</div>
				<div class="col-md-5">
					<h3>Also check out...</h3>
					<div class="spacer-30"></div>
					<div class="row">
						<div class="col-xs-10 col-xs-offset-1 col-sm-offset-0 col-sm-6 mb-30">
							<img src="/img/portfolio/1.jpg">
						</div>
						<div class="col-xs-10 col-xs-offset-1 col-sm-offset-0 col-sm-6 mb-30">
							<img src="/img/portfolio/1.jpg">
						</div>
					</div>
					<div class="row">
						<div class="col-xs-10 col-xs-offset-1 col-sm-offset-0 col-sm-6 mb-30">
							<img src="/img/portfolio/1.jpg">
						</div>
						<div class="col-xs-10 col-xs-offset-1 col-sm-offset-0 col-sm-6 mb-30">
							<img src="/img/portfolio/1.jpg">
						</div>
					</div>
				</div>
            </div>
        </div> -->
        <!-- End Calendar Section -->
		<!-- To DO Section -->
        <div id="todo" class="section ptb-60 pt-sm-80 shadow bg-image dark-color" style="background: #fff url('img/desk.jpg') top left no-repeat; background-size:100% 100%;">
            <div class="container text-center">
				<div class="col-md-7 col-md-offset-5">
                <h3 class="text-left text-sm-white">What Would You Like To Do</h3>
                <div class="spacer-15"></div>
                <div class="row">
                    <div class="col-md-4 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 mb-25">
						<a href="/artist-directory.html">
						<div class="todo-box box-shadow">
							<div class="padding-10">
							<div class="page-icon-top"><i class="ion ion-eye"></i></div>
							<h5>Browse Artist Directory</h5>
							
							</div>
						</div>
						</a>
                    </div>
                    <div class="col-md-4 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 mb-25">
						<a href="/post-opportunity-detail.html">
						<div class="todo-box box-shadow">
							<div class="padding-10">
							<div class="page-icon-top"><i class="ion ion-ios-paper"></i></div>
							<h5>Post Requirement to Hire an Artist</h5>
							
							</div>
						</div>
						</a>
                    </div>
                    <div class="col-md-4 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 mb-25">
						<a href="/registration-detail.html">
						<div class="todo-box box-shadow">
							<div class="padding-10">
							<div class="page-icon-top"><i class="ion ion-speakerphone"></i></div>
							<h5>Show and Promote Wour Work as an Artist</h5>
							
							</div>
						</div>
						</a>
                    </div>
                    <div class="col-md-4 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 mb-25">
						<a href="/events-calendar.html">
						<div class="todo-box box-shadow">
							<div class="padding-10">
							<div class="page-icon-top"><i class="ion ion-android-calendar"></i></div>
							<h5>Check Events Calendar</h5>
							
							</div>
						</div>
						</a>
                    </div>
                    <div class="col-md-4 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 mb-25">
						<a href="/upcoming-competitions.html">
						<div class="todo-box box-shadow">
							<div class="padding-10">
							<div class="page-icon-top"><i class="ion ion-ios-people"></i></div>
							<h5>See Upcoming Competitions</h5>
							
							</div>
						</div>
						</a>
                    </div>
                    <div class="col-md-4 col-sm-6 col-sm-offset-0 col-xs-10 col-xs-offset-1 mb-25">
						<a href="/contact-us.html">
						<div class="todo-box box-shadow">
							<div class="padding-10">
							<div class="page-icon-top"><i class="ion ion-android-mail"></i></div>
							<h5>Contact Us for Best Corporate Deals</h5>
							
							</div>
						</div>
						</a>
                    </div>
                </div>
				</div>
				
            </div>
        </div>
        <!-- End Todo Section -->
		<!-- Aritsts Section -->
        <div id="artists" class="section ptb-60 pt-sm-80 bg-img light-color" style="background: #93301d url('img/artists-bg.jpg') left center no-repeat; background-size:100% auto;">
            <div class="container text-left">
				<div class="col-sm-offset-0 col-xs-10 col-xs-offset-1 col-md-7 mb-sm-30">
                <h3 class="float-left float-none-xs mb-60 mb-xs-15">FEATURED ARTISTS</h3>
				<a href="/artist-directory.html" class="btn-link-a float-right float-none-xs">View All</a>
				<div class="row">
                    <div class="owl-carousel item3-carousel nf-carousel-theme o-flow-hidden">
                        <div class="item">
                            <div class="nf-col-padding">
                                <div class="item-box">
                                    <!-- Shop item images -->
                                    <div class="shop-item box-shadow">
                                        <div class="item-img">
                                            <img src="/img/artist/07.jpg" />
                                        </div>
                                        <div class="item-mask">
                                            <div class="item-mask-detail">
                                                <div class="item-mask-detail-ele">
													<p>Our ante tincidunt tempus, Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante.</p>
                                                    <a href="/artist-profile.html" class="btn btn-line-xs btn-white-line">Full Profile</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End Shop item images -->

                                    <!-- Shop item info -->
                                    <div class="shop-item-info">
                                        <a href="/artist-profile.html">
                                            <h6 class="shop-item-name">ARTIST NAME</h6>
                                        </a>
                                        <div class="shop-item-price"><span>category</span></div>
                                    </div>
                                    <!-- Shop item info -->
                                </div>
                            </div>
                        </div>
						
                        <div class="item">
                            <div class="nf-col-padding">
                                <div class="item-box">
                                    <!-- Shop item images -->
                                    <div class="shop-item box-shadow">
                                        <div class="item-img">
                                            <img src="/img/artist/01.jpg" />
                                        </div>
                                        <div class="item-mask">
                                            <div class="item-mask-detail">
                                                <div class="item-mask-detail-ele">
													<p>Our ante tincidunt tempus, Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante.</p>
                                                    <a href="/artist-profile.html" class="btn btn-line-xs btn-white-line">Full Profile</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End Shop item images -->

                                    <!-- Shop item info -->
                                    <div class="shop-item-info">
                                        <a href="/artist-profile.html">
                                            <h6 class="shop-item-name">ARTIST NAME</h6>
                                        </a>
                                        <div class="shop-item-price"><span>category</span></div>
                                    </div>
                                    <!-- Shop item info -->
                                </div>
                            </div>
                        </div>
						
						<div class="item">
                            <div class="nf-col-padding">
                                <div class="item-box">
                                    <!-- Shop item images -->
                                    <div class="shop-item box-shadow">
                                        <div class="item-img">
                                            <img src="/img/artist/02.jpg" />
                                        </div>
                                        <div class="item-mask">
                                            <div class="item-mask-detail">
                                                <div class="item-mask-detail-ele">
													<p>Our ante tincidunt tempus, Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante.</p>
                                                    <a href="/artist-profile.html" class="btn btn-line-xs btn-white-line">Full Profile</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End Shop item images -->

                                    <!-- Shop item info -->
                                    <div class="shop-item-info">
                                        <a href="/artist-profile.html">
                                            <h6 class="shop-item-name">artist name</h6>
                                        </a>
                                        <div class="shop-item-price"><span>category</span></div>
                                    </div>
                                    <!-- Shop item info -->
                                </div>
                            </div>
                        </div>
						<div class="item">
                            <div class="nf-col-padding">
                                <div class="item-box">
                                    <!-- Shop item images -->
                                    <div class="shop-item  box-shadow">
                                        <div class="item-img">
                                            <img src="/img/artist/04.jpg" />
                                        </div>
                                        <div class="item-mask">
                                            <div class="item-mask-detail">
                                                <div class="item-mask-detail-ele">
													<p>Our ante tincidunt tempus, Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante.</p>
                                                    <a href="/artist-profile.html" class="btn btn-line-xs btn-white-line">Full Profile</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End Shop item images -->

                                    <!-- Shop item info -->
                                    <div class="shop-item-info">
                                        <a href="/artist-profile.html">
                                            <h6 class="shop-item-name">artist name</h6>
                                        </a>
                                        <div class="shop-item-price"><span>category</span></div>
                                    </div>
                                    <!-- Shop item info -->
                                </div>
                            </div>
                        </div>
						
						<div class="item">
                            <div class="nf-col-padding">
                                <div class="item-box">
                                    <!-- Shop item images -->
                                    <div class="shop-item box-shadow">
                                        <div class="item-img">
                                            <img src="/img/artist/05.jpg" />
                                        </div>
                                        <div class="item-mask">
                                            <div class="item-mask-detail">
                                                <div class="item-mask-detail-ele">
													<p>Our ante tincidunt tempus, Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante.</p>
                                                    <a href="/artist-profile.html" class="btn btn-line-xs btn-white-line">Full Profile</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End Shop item images -->

                                    <!-- Shop item info -->
                                    <div class="shop-item-info">
                                        <a href="/artist-profile.html">
                                            <h6 class="shop-item-name">artist name</h6>
                                        </a>
                                        <div class="shop-item-price"><span>category</span></div>
                                    </div>
                                    <!-- Shop item info -->
                                </div>
                            </div>
                        </div>
						
						<div class="item">
                            <div class="nf-col-padding">
                                <div class="item-box">
                                    <!-- Shop item images -->
                                    <div class="shop-item box-shadow">
                                        <div class="item-img">
                                            <img src="/img/artist/06.jpg" />
                                        </div>
                                        <div class="item-mask">
                                            <div class="item-mask-detail">
                                                <div class="item-mask-detail-ele">
													<p>Our ante tincidunt tempus, Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante.</p>
                                                    <a href="/artist-profile.html" class="btn btn-line-xs btn-white-line">Full Profile</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End Shop item images -->

                                    <!-- Shop item info -->
                                    <div class="shop-item-info">
                                        <a href="/artist-profile.html">
                                            <h6 class="shop-item-name">artist name</h6>
                                        </a>
                                        <div class="shop-item-price"><span>category</span></div>
                                    </div>
                                    <!-- Shop item info -->
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
				</div>
				<div class="col-md-4 col-md-offset-1 col-xs-12 col-xs-offset-0 mt-xs-30">
					<h3 class="float-left float-none-sm mb-45 mb-xs-15">Training Institutes</h3>	
					<ul class="mlr-0 list-none">
						<li class="mt-15">
							<a href="/single-associate.html"><h6>Institute Name</h6></a>
							<p>Pune, India for singers,musicians</p>
							<hr class="box-shadow">
						</li>
						<li class="mt-15">
							<a href="/single-associate.html"><h6>Institute Name</h6></a>
							<p>Pune, India for singers, musicians</p>
							<hr class="box-shadow">
						</li>
						<li class="mt-15">
							<a href="/single-associate.html"><h6>Institute Name</h6></a>
							<p>Pune, India for singers, musicians</p>
							<hr class="box-shadow">
						</li>
						<li class="mt-15">
							<a href="/single-associate.html"><h6>Institute Name</h6></a>
							<p>Pune, India for singers, musicians</p>
							<hr class="box-shadow">
						</li>			
						<a href="/institutes-directory.html" class="btn-link-a text-left">View All</a>
					</ul>
					
				</div>
            </div>
        </div>
        <!-- End Events Section -->
        <!-- END CONTENT ---------------------------------------------------------------------------->
		<div id="sponsors" class="section pt-60 pt-sm-0 dark-color bg-gray">
		<div class="shadow" style="z-index:1">
		<div class="container">
                <h4 class="text-center">Valued Sponsors</h4>
                <div class="spacer-30"></div>
                <div class="owl-carousel client-carousel nf-carousel-theme mb-30 ">
                    <div class="item">
                        <div class="client-logo">
                            <img src="/img/logos/01.png" alt="" />
                        </div>
                    </div>
                    <div class="item">
                        <div class="client-logo">
                            <img src="/img/logos/02.png" alt="" />
                        </div>
                    </div>
                    <div class="item">
                        <div class="client-logo">
                            <img src="/img/logos/03.png" alt="" />
                        </div>
                    </div>
                    <div class="item">
                        <div class="client-logo">
                            <img src="/img/logos/04.png" alt="" />
                        </div>
                    </div>
                    <div class="item">
                        <div class="client-logo">
                            <img src="/img/logos/05.png" alt="" />
                        </div>
                    </div>
                    <div class="item">
                        <div class="client-logo">
                            <img src="/img/logos/06.png" alt="" />
                        </div>
                    </div>
                    <div class="item">
                        <div class="client-logo">
                            <img src="/img/logos/08.png" alt="" />
                        </div>
                    </div>
                    <div class="item">
                        <div class="client-logo">
                            <img src="/img/logos/01.png" alt="" />
                        </div>
                    </div>
                    <div class="item">
                        <div class="client-logo">
                            <img src="/img/logos/02.png" alt="" />
                        </div>
                    </div>
                    <div class="item">
                        <div class="client-logo">
                            <img src="/img/logos/03.png" alt="" />
                        </div>
                    </div>
                </div>
            </div>
			</div>
			
        <!-- FOOTER -->
        <!-- FOOTER -->
        <!-- FOOTER -->
           
        <tiles:insertAttribute name="footer"/>
        
        <!-- END FOOTER -->
        <!-- END FOOTER -->
        <!-- END FOOTER -->
        
		</div>
		</div><!--end fullpage-->
        <!-- Scroll Top -->
        <a class="scroll-top">
            <i class="fa fa-angle-double-up"></i>
        </a>
        <!-- End Scroll Top -->

    </div>
    <!-- Site Wraper End -->


    <!-- JS -->

    <script src="/js/jquery-1.11.2.min.js" type="text/javascript"></script>

    <script src="/js/plugin/jquery.easing.js" type="text/javascript"></script>
    <script src="/js/jquery-ui.min.js" type="text/javascript"></script>
    <script src="/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="/js/plugin/jquery.flexslider.js" type="text/javascript"></script>
    <script src="/js/plugin/jquery.fitvids.js" type="text/javascript"></script>
    <script src="/js/plugin/jquery.viewportchecker.js" type="text/javascript"></script>
    <script src="/js/plugin/jquery.stellar.min.js" type="text/javascript"></script>
    <script src="/js/plugin/wow.min.js" type="text/javascript"></script>
    <script src="/js/plugin/jquery.colorbox-min.js" type="text/javascript"></script>
    <script src="/js/plugin/owl.carousel.min.js" type="text/javascript"></script>
    <!-- SLIDER REVOLUTION SCRIPTS  -->
    <script src="/plugin/rs-plugin/js/jquery.themepunch.tools.min.js" type="text/javascript"></script>
    <script src="/plugin/rs-plugin/js/jquery.themepunch.revolution.min.js" type="text/javascript"></script>
    <!-- End SLIDER REVOLUTION SCRIPTS  -->
    <script src="/js/plugin/isotope.pkgd.min.js" type="text/javascript"></script>
    <script src="/js/plugin/masonry.pkgd.min.js" type="text/javascript"></script>
    <script src="/js/plugin/imagesloaded.pkgd.min.js" type="text/javascript"></script>
    <script src="/js/plugin/jquery.fs.tipper.min.js" type="text/javascript"></script>
    <script src="/js/plugin/mediaelement-and-player.min.js"></script>
    <script src="/js/plugin/sidebar-menu.js" type="text/javascript"></script>
    <script src="/js/revolution-slider.js" type="text/javascript"></script>
    <script src="/js/theme.js" type="text/javascript"></script>
    <script src="/js/navigation.js" type="text/javascript"></script>
	<script src="/js/plugin/jquery.fullPage.js"></script>

    <!-- Full Page Section Script -->
    <script type="text/javascript">
        $(document).ready(function () {
            $('#fullpage').fullpage({
                anchors: ['Competitions','About','Calendar','Todo','Artists','Sponsors'],
                sectionsColor: ['#efefef', '', '','',''],
                navigation: true,
                navigationPosition: 'right',
                navigationTooltips: ['Competitions & Auditions', 'About Us', 'Events Calendar','What You Can Do','Featured Artists','Our Sponsors'],
                slidesNavigation: true,
                controlArrows: false,
                responsive: 900
            });

        });
    </script>
    <!-- End Full Page Section Script -->

</body>
</html>
