<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

                <!-- Logo -->
                <div class="logo">
                    <a href="/index">
                        <img class="logo-light" src="/img/gth-logo-white.png" alt="Global Talent House" />
                        <img class="logo-dark" src="/img/gth-logo-black.png" alt="Global Talent House" />
                    </a>
                </div>
                <!-- End Logo -->

                <!-- Rightside Menu (Search icon) -->
                <div class="side-menu-btn">
                    <ul>
                        <!-- Search Icon -->
                        <li class="">
                            <a class="search-overlay-menu-btn header-icon"><i class="fa fa-search"></i></a>
                        </li>
                        <!-- End Search Icon -->
                    </ul>
                </div>
                <!-- End Rightside Menu -->

                <!-- Mobile Navbar Icon -->
                <div class="nav-mobile nav-bar-icon">
                    <span></span>
                </div>
                <!-- End Mobile Navbar Icon -->


			  <div class="nav-menu">
                    <ul class="nav-menu-inner">
                        <li>
                            <a class="" href="/ingame/gamescreen">게임하기</a>
                        </li>
                        <li>
                            <a class="menu-has-sub">상점 <i class="fa fa-angle-down"></i></a>
							<!-- Dropdown -->
                            <ul class="sub-dropdown dropdown">
								<li>
                                    <a href="/store/npc">NPC 거래</a>
                                </li>
                                <li>
                                    <a href="/store/ptp">PTP 거래 ( Player To Player )</a>
                                </li>
                                <li>
                                    <a href="/store/basket">장바구니</a>
                                </li>
                                <li>
                                    <a href="/store/storelist">거래내역</a>
                                </li>
                            </ul>
                            <!-- End Dropdown -->
                        </li>
                        <li>
                            <a class="" href="/introduce/nam">게임소개</a>                         
                        </li>
                        <li>
                            <a class="" href="/gong/board">공략게시판</a>
                        </li>
                        <li>
                            <a class="" href="/rank/page">랭킹페이지</a>
                        </li>
                        <li>
                            <a class="" href="/free/board">자유게시판</a>
                        </li>
                        <li>
                            <a class="" href="/realtime/chat">실시간 채팅방</a>
                        </li>
                        <li>
                            <a class="menu-has-sub">To 개발자<i class="fa fa-angle-down"></i></a>
							<!-- Dropdown -->
                            <ul class="sub-dropdown dropdown">
								<li>
                                    <a href="/todeveloper/introduce">개발자 소개</a>
                                </li>
                                <li>
                                    <a href="/todeveloper/reportboard">버그제보, 건의게시판</a>
                                </li>
								<li>
                                    <a href="/todeveloper/mtm">일대일 상담</a>
                                </li>
                            </ul>
                            <!-- End Dropdown -->
                        </li>
						<li>
                            <c:choose>
                            <c:when test="${login != null }">
                            <a class="btn btn-md btn-black join-btn" href="/player/logedin">My Page</a>
                            </c:when>
                            <c:otherwise>
                            <a class="btn btn-md btn-black join-btn" href="/player/login">LOGIN N.A.M.</a>
                            </c:otherwise>
                            </c:choose>                            
                        </li>
                        <c:if test="${login != null }">
                        <c:set var="pId" value="${player.pId }"/>
	                    <c:if test="${pId eq 'admin' }">
	                        <li>
	                        <a class="btn btn-md btn-black join-btn" href="/player/login">관리페이지</a>
	                        </li>
                        </c:if>
                        </c:if>
                    </ul>
                </div>
 