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
	
	function submitValid(){
		if(document.getElementById("freeTitle").value.length > 70){
			alert("제목은 70자 이하로 작성가능합니다.")
		} else if(document.getElementById("freeTitle").value.length < 1){
			alert("제목을 입력해주세요.")
		} else{
			if(document.getElementById("freeContent").value.length < 1){
				alert("내용을 입력해주세요.")
			}else{
				return true;
			}
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
        <section class="inner-intro dark-bg overlay-dark">
            <div class="container">
                <div class="row title">
                    <h2 class="h2">자유게시판</h2>
					<p> 여러 용사님들과 소통해보세요! </p>
					<div class="spacer-15"></div>
                    <div class="page-breadcrumb">
                        <a href="/index">Home</a>/<a href="/free/freelist">공략게시판</a>/<span>${free.freeTitle }</span>
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
                        <form action="/free/freeupdatesubmit" method="post" enctype="multipart/form-data">
							<input type="hidden" name="freeIdx" value=${free.freeIdx }>
							<input type="hidden" name="freeCnt" value=${free.freeCnt }>
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
                                <input class="input-sm form-full" id="freeTitle" type="text" name="freeTitle" value = "${free.freeitle }" required>
                            </div>
                            
                            <!-- <div class="form-field-wrapper"> -->
	                            <h6>작성자 : ${player.PId }</h6>	
                                <!-- 쪽지 기능(버튼) 추가 예정 -->
                            <!-- </div> -->
							<div class="form-field-wrapper">
							<c:if test="${free.getFreeImg().size() ne 0 }">
								<img alt="MainPic" src="/upload/${free.freeImg.iterator().next().getFileUseName() }">
							</c:if>
							</div>
                            <div class="form-field-wrapper">
                                <textarea class="form-full" id="freeContent" rows="7" name="freeContent" required>${free.freeContent }</textarea>
                            </div>
							
							<!-- 이미지 첨부 파일 설정 위치 -->
							<input type="file" name="file"/> <font size="0.8em" color="orange"> - 이미지 파일의 최대용랑은 15MB입니다. </font>
							
                            <button class="btn btn-md btn-black" type="submit" id="form-submit" name="submit">수정하기</button>
                            <button class="btn btn-md btn-black" type="button" onclick="location.href='freelist'">취소하기</button>
                        </form>
                        <!-- END Contact FORM -->
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
    <script type="text/javascript" src="js/map.js"></script>
    <script src="/js/contact-form.js" type="text/javascript"></script>
</body>
</html>
