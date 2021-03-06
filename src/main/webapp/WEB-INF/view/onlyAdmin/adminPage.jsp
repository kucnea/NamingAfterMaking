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

	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<tiles:insertAttribute name="title"/>
<script type="text/javascript">

function doExcelUploadProcess(){
	
	var f = new FormData(document.getElementById("DBForm"));
	$.ajax({
		url: "/excel/uploadexcelfile",
		data: f,
		processData: false,
		contentType: false,
		type: "POST",
		success: function(data){
			console.log(data);
			document.getElementById("excelResult").innerHTML = JSON.stringify(data);
		}
	})
	
}

function doExcelDownloadProcess(){
	
	var f = document.DBForm;
	f.action = "/excel/downloadexcelfile";
	f.submit();
	
}

function searchSubmit(){
	
	var id = document.getElementById("searchId").value;
	
	if(id.length < 1){
		alert("????????? id??? ???????????????.");
		return false;
	}else{
		return true;	
	}
	
	
}
function updateSubmit(){
	
	var id = document.getElementById("updateId").value;
	var pw = document.getElementById("updatePw").value;
	var nick = document.getElementById("updateNick").value;
	var status = document.getElementById("updateStatus").value;
	
	if(id.length = 0) {
		alert("id??? ???????????????");
		return false;
	}else if(pw.length = 0){
		alert("pw??? ???????????????");
		return false;
	}else if(nick.length = 0){
		alert("nick??? ???????????????");
		return false;
	}else if(status.length = 0){
		alert("status??? ???????????????");
		return false;
	}else{
		return window.confirm("?????? ?????????????????????????");
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
                    <h2 class="h2">????????? ?????????</h2>
					<h6>????????? ?????? ?????????</h6>
					<div class="spacer-15"></div>
                    <div class="page-breadcrumb">
                        <a href="/index">Home</a>/<span>Admin</span>
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
                        <h3 class="h4">????????? ?????????</h3>
                        <div class="spacer-15"></div>
                        
                        <form id="searchForm" action="/admin/playersearch" method="get" onsubmit="return searchSubmit()">
                        	<c:choose>
                        	<c:when test="${player1 ne null }">
                        		ID ?????? : <input type="text" id="searchId" name="searchId" value="${player1.getPId() }"> &nbsp; <input type="submit" id="searchButton" name="searchButton" value="??????">
                        	</c:when>
                        	<c:otherwise>
                        		ID ?????? : <input type="text" id="searchId" name="searchId"> &nbsp; <input type="submit" id="searchButton" name="searchButton" value="??????">
                        	</c:otherwise>
                        	</c:choose>
                        </form>
                        <form id="updateForm" action="/admin/playerupdate" method="post" onsubmit="return updateSubmit()">
	                        <h4>?????? ??????, ??????</h4>
	                        <c:choose>
	                        <c:when test="${player1 ne null }">
	                        <input type="hidden" id="pIdx" name="pIdx" value="${player1.getPIdx() }">
	                        <p>
	                        	<label for="pId">ID : </label><input type="text" id="pId" name="pId" value="${player1.getPId() }"> <br>
	                         	<label for="pPw">PW : </label><input type="text" id="pPw" name="pPw" value="${player1.getPPw() }"> <br>
	                        	<label for="pNick">NICK : </label><input type="text" id="pNick" name="pNick" value="${player1.getPNick() }"> <br>
	                        	<label for="pStatus">Status : </label><input type="text" id="pStatus" name="pStatus"value="${player1.getPStatus() }"> 
	                        	<input type="submit" id="updateButton" name="updateButton" value="??????">
	                        </p>
	                        </c:when>
	                        <c:otherwise>
	                        <p>
	                        	<label for="pId">ID : </label><input type="text" id="pId" name="pId"> <br>
	                         	<label for="pPw">PW : </label><input type="text" id="pPw" name="pPw"> <br>
	                        	<label for="pNick">NICK : </label><input type="text" id="pNick" name="pNick"> <br>
	                        	<label for="pStatus">Status : </label><input type="text" id="pStatus" name="pStatus"> 
	                        	<input type="submit" id="updateButton" name="updateButton" value="??????">
	                        </p>
	                        </c:otherwise>
	                        </c:choose>
	                        <p>
	                        -??????-
	                        Status : 0 = ??????, 1 = ??????, 2 = ?????????
	                        </p>
	                        </form>
                        </form>
						
						<hr>
						
						<form>
							<h4>????????? ??????, ??????</h4>
							<p>
								?????? ???
							</p>
						</form>
						
						<hr>
						
						<form id="DBForm" name="DBForm" method="post" enctype="multipart/form-data">
							<h4>Location DB ??????, ??????</h4>
							<h5>Only use formal .xlsx file</h5>
							<p>
								<input type="file" id="fileInput" name="fileInput">
								<button type="button" onclick="doExcelUploadProcess()">?????? ?????????, location DB update ??????</button>
								<button type="button" onclick="doExcelDownloadProcess()">?????? ???????????? ??????</button>
							</p>
						</form>
						<div id="excelResult">
						</div>
						
						<hr>
						
                    </div>
                </div>
            </div>
        </section>


        <!-- Vision -->
        <!-- End Vision -->

        <!-- Team -->
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
