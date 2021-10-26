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
	<script type="text/javascript">
	function validId(){
		if(document.getElementById("pId").value.length > 0){
			location.href="/player/valid?pId="+document.getElementById("pId").value+"&pNick="+document.getElementById("pNick").value+"&pPw="+document.getElementById("pPw").value;	
		}else{
			alert("입력된 아이디가 없습니다.");
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
        <!-- Intro Section -->
        <section class="inner-intro dark-bg overlay-dark">
            <div class="container">
                <div class="row title">
                    <h2 class="h2">Join</h2>
                    <div class="page-breadcrumb">
                        <a href="/index">Home</a>/<span>JOIN</span>
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
                            <h4> 함께할 준비 됐나요? </h4>
                            <form action="/player/create" method="post">
                                <div class="form-field-wrapper">
                                    <label for="pId">당신의 용사의 ID를 정해주세요. <p style="font-size:0.8em;";>( 해당 코드네임 규칙은 한글, 대문자, 특수문자(-,_ 2가지 제외) 사용이 불가합니다. )</p><p style="font-size:0.8em;";>( 또한 특수문자 -는 맨앞과 맨뒤에 사용이 불가합니다. )</p></label>
                                    <input type="text" required="" placeholder="Enter your Id" name="pId" id="pId" class="input-sm form-full" aria-required="true" value="${pId1 }">
									<input type="button" onclick="validId()" value="중복체크">
									<c:choose>
                                    	<c:when test="${result eq 0 }">
                                    		<font size="0.7em" color="red"> 사용 가능한 ID 입니다.</font>
                                    	</c:when>
                                    	<c:when test="${result eq 1 }">
                                    		<font size="0.7em" color="red"> 중복되진 않지만, 규약에 맞지 않습니다. ${pId1 } 어떠신가요?</font>
                                    	</c:when>
                                    	<c:when test="${result eq 2 }">
                                    		<font size="0.7em" color="red"> 중복이거나, 규약에 맞지 않습니다. ${pId1 } 어떠신가요?</font>
                                    	</c:when>
                                    	<c:when test="${result eq 3 }">
                                    		<font size="0.7em" color="red"> 아이디 추천 알고리즘의 100가지 이상의 시도가 있었으나 모두 사용중으로 추천이 어렵습니다. 다른 아이디는 어떠세요?</font>
                                    	</c:when>
                                    </c:choose>
                                </div>
                                <div class="form-field-wrapper">
                                    <label for="pNick">당신의 용사의 이름을 정해주세요. <p style="font-size:0.8em;";>( 사람의 이름은 특수문자 사용이 불가합니다. )</p></label>
                                    <input type="text" required="" placeholder="Enter Hero's Name" name="pNick" id="pNick" class="input-sm form-full" aria-required="true" value="${pNick1 }">
                                </div>
                                <div class="form-field-wrapper">
                                    <label for="pPw">당신과 용사가 서로 알아 볼 수 있는 비밀번호를 정해주세요. <p style="font-size:0.8em;";>( 비밀번호 규칙은 한글, 대문자, 특수문자 사용이 불가합니다. )</p></label>
                                    <input type="password" required="" placeholder="Enter your Password" name="pPw" id="pPw" class="input-sm form-full" aria-required="true" value="${pPw1 }">
                                </div>
                                <div class="form-field-wrapper">
                                    <label for="pAgree">세계와의 약속 ( 이용약관 )에 동의하십니까?</label>
                                    <input type="checkbox" required="" placeholder="Enter your Password" name="pAgree" id="pAgree" class="input-sm form-full" aria-required="true" value="1">
                                </div>
                                <button name="submit" id="form-submit" type="submit" class="btn btn-md btn-black">등록하기</button>
                            </form>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="border-box">
                            <h4>Welcome N.A.M.</h4>
                            <p> 용사와 여러분간에는 Id( 코드네임 )과 비밀번호 두가지만이 필요하지만, 여러분은 세계와의 약속이 필요합니다.
                            아래의 버튼을 통해 세계와의 약속을 확인해보세요. ( 이용약관 )</p>
							<a class="btn btn-md btn-black join-btn" href="/player/appointment">이용약관</a>  
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
