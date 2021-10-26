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
		function changeSize(){
		}
	</script>
<!-- <script type="text/javascript">
	var page = 1;
	
	$(function(){
		getList(page);
		page++;
	});
	
	$(window).scroll(function(){
		if($(window).scrollTop() >= $(document).height() - $(window).height()){
			getList(page);
			page++;
		}
	});
	
	function getList(page){
		
		$.ajvax({
			type : 'POST',
			dataType : 'json',
			data : {"page" : page},
			url : '주소'
			success : function(returnDate){
				var data = returnData.rows;
				var html = "";
				if(page==1){
					$("#list").html("");
				}
				if(returnData.startNum<=returnData.totCnt){
					if(data.length>0){
						
					}else{
						
					}
				}
				html = html.replace(/%20/gi, " ");
				if(page==1){
					$("#list").html(html);
				}else{
					$("#busStopList").append(html);
				}
			},error:function(e){
				if(e.status==300){
					alert("데이터를 가져오는데 실패했습니다.");					
				};
			}
		});
		
	}
</script> -->

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
                    <h2 class="h2">공략게시판</h2>
					<p> 여러분이 알고계신 공략을 모두에게 자랑해보세요! </p>
					<div class="spacer-15"></div>
                    <div class="page-breadcrumb">
                        <a href="/index">Home</a>/<span>공략게시판</span>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Intro Section -->
		

        <!-- Options Section -->
        <section class="ptb-60 ptb-sm-30">
			<div class="container text-left">
                <div class="mb-30">	
                	<a id="menu-sidebar-list-icon" class="btn btn-md btn-black float-right float-none-xs" href="/gong/gongwrite"><i class="fa fa-filter"></i><span> 글쓰기 </span></a>
                	<form id="frm" action="/gong/gonglist" method="get">
                	<select id="sizeSelect" name="size" class="btn btn-md btn-black float-right float-none-xs" onchange="submit()">
                		<option value="${size1 }">현재 ${size1 }개씩</option>
                		<option value="10">10개씩</option>
                		<option value="20">20개씩</option>
                		<option value="30">30개씩</option>
                	</select>
                	<a style="float:right">페이지로</a>
                	<input type="number" name="page" min="1" max="${maxPage }" style="float:right" value="${page1 }">
                	</form>
					<h2> 공략게시글 </h2>	
					<hr>
				</div>	
				<c:choose>
				<c:when test="${msg eq '조회된 결과가 없습니다.' }">
					<div class="col-md-8 col-sm-8 col-xs-12">
						<a href="artist-profile.html"><h6>${msg }</h6></a>
						<p> 다른 플레이어를 위해 새로운 공략을 작성해보시는 건 어떨까요? </p>								
					</div>
				</c:when>
				<c:otherwise>
				<c:forEach var="vo" items="${list }">
				<div class="row mtb-30">
					<div class="item-box col-md-4 col-sm-4 col-sm-offset-0 col-xs-8 col-xs-offset-2 mb-sm-30">
						<a href="/gong/gongdetail?gongIdx=${vo.gongIdx}&page=${page1 }&size="${size1 }">
						<c:choose>
							<c:when test="${vo.getGongImg().size() == 0 }">
							<img alt="Thumnail" src="/img/portfolio/1.jpg" class="item-container">
							</c:when>
							<c:otherwise>
							<img alt="Thumnail" src="/upload/${vo.gongImg.get(0).getFileUseName() }" class="item-container">
							</c:otherwise>
						</c:choose>
						</a>                           
					</div>
					<div class="col-md-8 col-sm-8 col-xs-12">
						<a href="/gong/gongdetail?gongIdx=${vo.gongIdx}&page=${page1 }&size="${size1 }"><h6>${vo.gongTitle }</h6></a>
						<p class="color">${vo.player.getPNick() }</p>
						<p>조회수 : ${vo.gongCnt } 작성시간 : ${vo.gongWTime }</p>
						<p><a href="/gong/gongdetail?gongIdx=${vo.gongIdx}&page=${page1 }&size="${size1 }">
						<c:choose>
						<c:when test="${vo.gongContent.length() >= 60 }">
						${vo.gongContent.substring(0,60) }... <font size="0.7em"; color="orange";> 댓글 [${vo.getGongComment().size() }]</font>
						</c:when>
						<c:otherwise>
						${vo.gongContent } <font size="0.7em"; color="orange";> 댓글 [${vo.getGongComment().size() }]</font>
						</c:otherwise>
						</c:choose>
						</a></p>								
					</div>
				</div>	
				<hr>
				</c:forEach>
				</c:otherwise>
				</c:choose>
				</div>
			</div>
				 <div style="text-align: center;">
					<a href="?page=1&size=${size1 }">&lt;&lt;</a> 
					<a href="?page=${page1-1 }&size=${size1 }">&lt;</a>  
					
					<c:forEach var="i" begin="1" end="${maxPage }">
						<a href="?page=${i}&size=${size1 }">${i}</a>
					</c:forEach>
					
					<a href="?page=${page1+1 }&size=${size1 }">&gt;</a> 
					<a href="?page=${maxPage }&size=${size1 }">&gt;&gt;</a>
				</div>
				<form action="/gong/gonglist" method="get">
				<input type="hidden" name="page" value="${page1 }">
				<input type="hidden" name="size" value="${size1 }">
				<table>
					<tr>
						<th>
						<select name="searchObject">
							<option value="subject">제목</option>
							<option value="content">내용</option>
							<option value="subjectContent">제목+내용</option>
							<option value="writer">작성자</option>
						</select>
						</th>
						<th>
						<input type="text" name="searchTarget" placeholder="검색어를 입력하세요" required><input type="submit" value="검색">
						</th>
					</tr>
				</table>
				</form>
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

