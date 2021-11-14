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
	
	<!-- 제이쿼리 -->
	<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
</head>
	<tiles:insertAttribute name="title"/>
	<style type="text/css">
		.cmtW{
			text-align:center;
		}
		ul{
			overflow:auto;
			list-style:none;
		}
		li{
			text-align:left;
		}
	</style>
	<script type="text/javascript">
		
		function cmtFormSubmit(){
			if(${player != null}){
				
				var freeIdx = "${free.freeIdx }";
				var freeTitle = "${free.freeTitle }";
				var replyWriter = "${player.getPId() }";
				var boardWriter = "${free.player.getPId() }";
				
				if(socket){
					socket.send("reply,"+replyWriter+","+boardWriter+","+freeTitle+","+freeIdx);
				}
				
				document.getElementById("cmtForm").submit();	
			}else{
				alert("로그인이 필요합니다.");
			}
			
		}
		/* function cmtUpdateSubmit(){
			document.getElementById("cmtUpdateForm").submit()
		} */
		function cmtUpdateSubmit(x){
			document.getElementById("cmtUpdateForm_"+x).submit()
		}
		
	
		function confirmDelete(){
			if(window.confirm("정말 삭제하시겠습니까?")){
				location.href="/free/freedelete?freeIdx=${free.freeIdx }";
			}else{
				location.reload();
			}
		}
		
		function countCmtUpdate(x){
			const textVal = document.getElementById("freeCmtUpdate"+x).value;
			const subVal = document.getElementById("freeCmtUpdate_cnt"+x);
			const textLength = textVal.length;
			subVal.innerHTML="("+textVal.length+"/ 100)"
			
			if(textLength > 100){
				document.getElementById("freeCmtUpdate"+x).value = document.getElementById("freeCmtUpdate"+x).value.substring(0,100);
				subVal.innerHTML="(100 / 100)"
			}
		}
		
		$(document).ready(function(){
			$('#freeCmtContent').on('keyup',function(){
				$('#freeCmtContent_cnt').html("("+$(this).val().length+"/100)");
				
				if($(this).val().length > 100){
					$(this).val($(this).val().substring(0,100));
					$('#freeCmtContent_cnt').html("(100 / 100)");
				}
			});
		});
		
		function openCmtArea(x){
			document.getElementById("field_"+x).style.display='table-row';
		}
		function closeCmtArea(x){
			document.getElementById("field_"+x).style.display='none';
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
                    <h2 class="h2">자유게시판</h2>
					<p> 여러 용사님들과 소통해보세요! </p>
					<div class="spacer-15"></div>
                    <div class="page-breadcrumb">
                        <a href="/index">Home</a>/<a href="/free/freelist?page=${page1 }&size=${size1 }">자유게시판</a>/<span>${free.freeTitle }</span>
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
                		<h2 class="h4">${free.freeTitle }</h2>
                		<hr>
                		<a class="btn btn-md btn-black float-right float-none-xs">작성자 : ${free.player.getPNick() }</a>
						<a class="btn btn-md btn-black float-right float-none-xs">조회수 : ${free.freeCnt }</a>
                	</div>
                	<p align="right">작성시간(수정시간) : ${free.freeWTime }</p>
                    <div class="col-md-12">
                        <div class="spacer-15">
                        <a id="menu-sidebar-list-icon" class="btn btn-md btn-black float-right float-none-xs" href="/free/freelist?page=${page1 }&size=${size1 }"><i class="fa fa-filter"></i><span> 목록 </span></a>
                        <c:set var="pIdx" value="${player.PIdx }"/>
                        <c:set var="freePIdx" value="${free.player.getPIdx() }"/>
                        <c:if test="${pIdx eq freePIdx }">
						<%-- <a id="menu-sidebar-list-icon" class="btn btn-md btn-black float-right float-none-xs" href="/free/freedelete?freeIdx=${free.freeIdx }"><i class="fa fa-filter"></i><span> 삭제 </span></a> --%>
						<a id="menu-sidebar-list-icon" class="btn btn-md btn-black float-right float-none-xs" onclick="confirmDelete();"><i class="fa fa-filter"></i><span> 삭제 </span></a>
						<a id="menu-sidebar-list-icon" class="btn btn-md btn-black float-right float-none-xs" href="/free/freeupdate?freeIdx=${free.freeIdx }"><i class="fa fa-filter"></i><span> 수정 </span></a>
						</c:if>
						</div>
                    </div>
                    <div class="col-md-12">
                    	<br><br><br>
                    	<p align="left" style="font-size:1.3em;">
	                    	<c:if test="${free.getFreeImg().size() ne 0 }">
	                    		<img alt="MainPic" src="/upload/${free.freeImg.iterator().next().getFreeFileUseName() }"><br>
	                    	</c:if>
                    	${free.freeContent }
                    	</p>
                    	<br><br><br>
                    	<hr>
                    	<h4> 댓글 </h4>
                    	<form action="/free/freecmtsubmit" method="post" id="cmtForm">
                    	<input type="hidden" id="freeIdx" name="freeIdx" value="${free.freeIdx }">
                    	<div class="form-field-wrapper">
                                <textarea class="form-full" id="freeCmtContent" rows="7" name="freeCmtContent" placeholder="댓글을 남겨주세요" required></textarea>
                                <div id="freeCmtContent_cnt">(0 / 100)</div>
                                <br>
                                <a id="menu-sidebar-list-icon" class="btn btn-md btn-black float-right float-none-xs" onclick="cmtFormSubmit()"><span> 작성하기 </span></a>
                        </div>
                        </form>
                        <br>
                        <hr>
                        <h5>총 ${cmtCnt }개</h5>
                        
                        <c:forEach var="cmt" varStatus="status" items="${cmt }">
                        <form action="/free/freecmtupdate" id="cmtUpdateForm_${status.count }">
                        <input type="hidden" name="freeIdx" value="${free.freeIdx }">
                        <input type="hidden" name="freeCmtIdx" value="${cmt.freeCmtIdx }">
                        <ul>
                        	<li><h6>${cmt.player.getPNick() }</h6></li>
                        	<li>${cmt.freeCmtContent }</li>
                        	<li>${cmt.freeCmtWTime }</li>
                        	<c:set var="pIdx" value="${player.PIdx }"/>
		                    <c:set var="freeCmtPIdx" value="${cmt.player.getPIdx() }"/>
		                    <c:if test="${pIdx eq freeCmtPIdx }">
                        	<li style="text-align:right;">
                        		<a href="javascript:openCmtArea(${status.count });">수정</a>
                        		<a href="/free/freecmtdelete?freeIdx=${free.freeIdx }&freeCmtIdx=${cmt.freeCmtIdx }" onclick="return confirm('댓글을 정말로 지우시겠습니까?')">삭제</a>                        	
                        	</li>
                        	</c:if>
							<li id="field_${status.count }" style="display:none; text-align:right; width:100%;">
								<textarea class="form-full" id="freeCmtUpdate${status.count }" name="freeCmtContent" style="resize:vertical;" onkeyup="javascript:countCmtUpdate(${status.count })"></textarea><br>
								<a onclick="cmtUpdateSubmit(${status.count })">작성</a> <a href="javascript:closeCmtArea(${status.count });">취소</a>
                                <div id="freeCmtUpdate_cnt${status.count }">(0 / 100)</div>
							</li>
                        </ul>
                        </form>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </section>


        <!-- 조회수로 인기게시글 -->
        <section id="testimonial" class="overlay-dark80 dark-bg ptb-80 ptb-sm-80" style="background-image: url('img/full/25.jpg');" data-stellar-background-ratio="0.4">
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
        <!-- 조회수로 인기게시글 -->

        <!-- freeIdx로 앞뒤 게시글? -->
        <section class="ptb-80 ptb-sm-80">
            <div class="container text-center">
                <h3>다른 글도 읽어보실래요?</h3>
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
                                            <h5>${free1.freeTitle }</h5>
                                            <p>
											<c:choose>
											<c:when test="${free1.freeContent.length() >= 60 }">
											${free1.freeContent.substring(0,60) }...
											</c:when>
											<c:otherwise>
											${free1.freeContent }
											</c:otherwise>
											</c:choose>
											</p>	
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
                                    <h5>${free1.player.getPNick() }</h5>
                                    <p class="">${free1.freeTitle }</p>
                                </div>
                            </div>
                        </div>

                        <div class="item">
                            <div class="team-item nf-col-padding">
                                <div class="team-item-img">
                                    <img src="/img/team/people-2.jpg" alt="" />
                                    <div class="team-item-detail">
                                        <div class="team-item-detail-inner light-color">
                                            <h5>${free2.freeTitle }</h5>
                                            <p>
											<c:choose>
											<c:when test="${free2.freeContent.length() >= 60 }">
											${free2.freeContent.substring(0,60) }...
											</c:when>
											<c:otherwise>
											${free2.freeContent }
											</c:otherwise>
											</c:choose>
											</p>	
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
                                    <h5>${free2.player.getPNick() }</h5>
                                    <p class="">${free2.freeTitle }</p>
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
