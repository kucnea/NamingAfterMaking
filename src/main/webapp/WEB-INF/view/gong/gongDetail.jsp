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
				/* var gongTitle = document.getElementById("gongTitle").value;
				var replyWriter = document.getElementById("replyPId").value;
				var boardWriter = document.getElementById("boardPId").value; */
				
				var gongIdx = "${gong.gongIdx }";
				var gongTitle = "${gong.gongTitle }";
				var replyWriter = "${player.getPId() }";
				var boardWriter = "${gong.player.getPId() }";
				
				if(socket){
					socket.send("reply,"+replyWriter+","+boardWriter+","+gongTitle+","+gongIdx);
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
				location.href="/gong/gongdelete?gongIdx=${gong.gongIdx }";
			}else{
				location.reload();
			}
		}
		
		function countCmtUpdate(x){
			const textVal = document.getElementById("gongCmtUpdate"+x).value;
			const subVal = document.getElementById("gongCmtUpdate_cnt"+x);
			const textLength = textVal.length;
			subVal.innerHTML="("+textVal.length+"/ 100)"
			
			if(textLength > 100){
				document.getElementById("gongCmtUpdate"+x).value = document.getElementById("gongCmtUpdate"+x).value.substring(0,100);
				subVal.innerHTML="(100 / 100)"
			}
		}
		
		$(document).ready(function(){
			$('#gongCmtContent').on('keyup',function(){
				$('#gongCmtContent_cnt').html("("+$(this).val().length+"/100)");
				
				if($(this).val().length > 100){
					$(this).val($(this).val().substring(0,100));
					$('#gongCmtContent_cnt').html("(100 / 100)");
				}
			});
		});
		
		function openCmtArea(x){
			document.getElementById("field_"+x).style.display='table-row';
		}
		function closeCmtArea(x){
			document.getElementById("field_"+x).style.display='none';
		}
		/* function openCmtArea(){
			const target = document.getElementById("intext")
			target.innerHTML = "<td colspan='3'><textarea class='form-full' name='gongCmtContent' rows='2'></textarea></td><td><a>작성</a> <a href='javascript:closeCmtArea();'>취소</a></td>";
		} */
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
                    <h2 class="h2">공략게시글</h2>
					<h6>여러분이 알고계신 공략을 모두에게 자랑해보세요!</h6>
					<div class="spacer-15"></div>
                    <div class="page-breadcrumb">
                        <a href="/index">Home</a>/<a href="/gong/gonglist?page=${page1 }&size=${size1 }">공략게시판</a>/<span>${gong.gongTitle }</span>
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
                		<h2 class="h4">${gong.gongTitle }</h2>
                		<hr>
                		<a class="btn btn-md btn-black float-right float-none-xs">작성자 : ${gong.player.getPNick() }</a>
						<a class="btn btn-md btn-black float-right float-none-xs">조회수 : ${gong.gongCnt }</a>
                	</div>
                	<p align="right">작성시간(수정시간) : ${gong.gongWTime }</p>
                    <div class="col-md-12">
                        <div class="spacer-15">
                        <a id="menu-sidebar-list-icon" class="btn btn-md btn-black float-right float-none-xs" href="/gong/gonglist?page=${page1 }&size=${size1 }"><i class="fa fa-filter"></i><span> 목록 </span></a>
                        <c:set var="pIdx" value="${player.PIdx }"/>
                        <c:set var="gongPIdx" value="${gong.player.getPIdx() }"/>
                        <c:if test="${pIdx eq gongPIdx }">
						<%-- <a id="menu-sidebar-list-icon" class="btn btn-md btn-black float-right float-none-xs" href="/gong/gongdelete?gongIdx=${gong.gongIdx }"><i class="fa fa-filter"></i><span> 삭제 </span></a> --%>
						<a id="menu-sidebar-list-icon" class="btn btn-md btn-black float-right float-none-xs" onclick="confirmDelete();"><i class="fa fa-filter"></i><span> 삭제 </span></a>
						<a id="menu-sidebar-list-icon" class="btn btn-md btn-black float-right float-none-xs" href="/gong/gongupdate?gongIdx=${gong.gongIdx }"><i class="fa fa-filter"></i><span> 수정 </span></a>
						</c:if>
						</div>
                    </div>
                    <div class="col-md-12">
                    	<br><br><br>
                    	<p align="left" style="font-size:1.3em;">
	                    	<c:if test="${gong.getGongImg().size() ne 0 }">
	                    		<img alt="MainPic" src="/upload/${gong.gongImg.iterator().next().getFileUseName() }"><br>
	                    	</c:if>
	                    	FIleUseName : ${gong.gongImg.iterator().next().getFileUseName() }
                    	${gong.gongContent }
                    	</p>
                    	<br><br><br>
                    	<hr>
                    	<h4> 댓글 </h4>
                    	<form action="/gong/gongcmtsubmit" method="post" id="cmtForm">
                    	<input type="hidden" id="gongIdx" name="gongIdx" value="${gong.gongIdx }">
                    	<%-- <input type="hidden" id="gongTitle" value="${gong.gongTitle }">
                    	<input type="hidden" id="replyPId" value="${player.getPId() }">
                    	<input type="hidden" id="boardPId" value="${gong.player.getPId() }"> --%>
                    	<div class="form-field-wrapper">
                                <textarea class="form-full" id="gongCmtContent" rows="7" name="gongCmtContent" placeholder="댓글을 남겨주세요" required></textarea>
                                <div id="gongCmtContent_cnt">(0 / 100)</div>
                                <br>
                                <a id="menu-sidebar-list-icon" class="btn btn-md btn-black float-right float-none-xs" onclick="cmtFormSubmit()"><span> 작성하기 </span></a>
                        </div>
                        </form>
                        <br>
                        <hr>
                        <h5>총 ${cmtCnt }개</h5>
                        
                        <!-- 댓글창 table로 구현하려했을때의 코드 -->
                        
                        <%-- <form action="/gong/gongcmtupdate" method="post" id="cmtUpdateForm">
                        <input type="hidden" name="gongIdx" value="${gong.gongIdx }">
                        <table>
                        <tr>
                        	<td width="15%" class="cmtW">작성자</td>
                        	<td width="50%" class="cmtW">내용</td>
                        	<td width="25%">작성시간</td>
                        	<td width="10%">수정/삭제</td>
                        </tr>
                        <c:forEach var="cmt" varStatus="status" items="${cmt }">
                        <tr>
	                        <td class="cmtW">${cmt.player.getPNick() }</td>
	                        <td align="left">${cmt.gongCmtContent }</td>
	                        <td class="cmtW">${cmt.gongCmtWTime }</td>
	                        <td>
	                        	<c:set var="pIdx" value="${player.PIdx }"/>
		                        <c:set var="gongCmtPIdx" value="${cmt.player.getPIdx() }"/>
		                        <c:if test="${pIdx eq gongCmtPIdx }">
	                        	<a href="/gong/gongcmtupdate?gongIdx=${gong.gongIdx }&gongCmtIdx=${cmt.gongCmtIdx }">수정</a>
	                        	<a href="javascript:openCmtArea(${status.count });">수정</a>
	                        	<a href="/gong/gongcmtdelete?gongIdx=${gong.gongIdx }&gongCmtIdx=${cmt.gongCmtIdx }" onclick="return confirm('댓글을 정말로 지우시겠습니까?')">삭제</a>
	                        	</c:if>
	                       	</td>
                       	</tr>
                       	<!-- <tr id="intext"></tr> -->
                      	<tr id="field_${status.count }" style="display:none">
	                       	<td colspan="3">
	                       	<textarea class="form-full" name="gongCmtContent" rows="2"></textarea>
	                       	</td>
	                       	<td>
	                       	<input type="hidden" name="gongCmtIdx" value="${cmt.gongCmtIdx }">
	                       	<a onclick="cmtUpdateSubmit()">작성</a> <a href="javascript:closeCmtArea(${status.count });">취소</a>
	                       	</td>
                       	</tr>
                        </c:forEach>
                        </table>
                        </form> --%>
                        
                        <!-- 댓글창 table로 구현하려했을때의 코드 -->
                        
                        <c:forEach var="cmt" varStatus="status" items="${cmt }">
                        <form action="/gong/gongcmtupdate" id="cmtUpdateForm_${status.count }">
                        <input type="hidden" name="gongIdx" value="${gong.gongIdx }">
                        <input type="hidden" name="gongCmtIdx" value="${cmt.gongCmtIdx }">
                        <ul>
                        	<li><h6>${cmt.player.getPNick() }</h6></li>
                        	<li>${cmt.gongCmtContent }</li>
                        	<li>${cmt.gongCmtWTime }</li>
                        	<c:set var="pIdx" value="${player.PIdx }"/>
		                    <c:set var="gongCmtPIdx" value="${cmt.player.getPIdx() }"/>
		                    <c:if test="${pIdx eq gongCmtPIdx }">
                        	<li style="text-align:right;">
                        		<a href="javascript:openCmtArea(${status.count });">수정</a>
                        		<a href="/gong/gongcmtdelete?gongIdx=${gong.gongIdx }&gongCmtIdx=${cmt.gongCmtIdx }" onclick="return confirm('댓글을 정말로 지우시겠습니까?')">삭제</a>                        	
                        	</li>
                        	</c:if>
							<li id="field_${status.count }" style="display:none; text-align:right; width:100%;">
								<textarea class="form-full" id="gongCmtUpdate${status.count }" name="gongCmtContent" style="resize:vertical;" onkeyup="javascript:countCmtUpdate(${status.count })"></textarea><br>
								<a onclick="cmtUpdateSubmit(${status.count })">작성</a> <a href="javascript:closeCmtArea(${status.count });">취소</a>
                                <div id="gongCmtUpdate_cnt${status.count }">(0 / 100)</div>
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

        <!-- gongIdx로 앞뒤 게시글? -->
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
                                            <h5>${gong1.gongTitle }</h5>
                                            <p>
											<c:choose>
											<c:when test="${gong1.gongContent.length() >= 60 }">
											${gong1.gongContent.substring(0,60) }...
											</c:when>
											<c:otherwise>
											${gong1.gongContent }
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
                                    <h5>${gong1.player.getPNick() }</h5>
                                    <p class="">${gong1.gongTitle }</p>
                                </div>
                            </div>
                        </div>

                        <div class="item">
                            <div class="team-item nf-col-padding">
                                <div class="team-item-img">
                                    <img src="/img/team/people-2.jpg" alt="" />
                                    <div class="team-item-detail">
                                        <div class="team-item-detail-inner light-color">
                                            <h5>${gong2.gongTitle }</h5>
                                            <p>
											<c:choose>
											<c:when test="${gong2.gongContent.length() >= 60 }">
											${gong2.gongContent.substring(0,60) }...
											</c:when>
											<c:otherwise>
											${gong2.gongContent }
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
                                    <h5>${gong2.player.getPNick() }</h5>
                                    <p class="">${gong2.gongTitle }</p>
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
