<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>골목대장 - 진행중인 매칭</title>
    <link href="css/application.min.css" rel="stylesheet">
    <link rel="shortcut icon" href="../img/favicon.png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">


	<script type="text/javascript">
		function applybtn() {
			location.href = 'player/joinv';
		}
		function loginbtn() {
			location.href = 'player/loginv';
		}
	</script>
</head>
<body>
<!--
  Main sidebar seen on the left. may be static or collapsing depending on selected state.

    * Collapsing - navigation automatically collapse when mouse leaves it and expand when enters.
    * Static - stays always open.
-->

<nav id="sidebar" class="sidebar" role="navigation">
      <!-- need this .js class to initiate slimscroll -->
      <div class="js-sidebar-content">
         <header class="logo hidden-sm-down">
            <s:a action="../index.action">Matching</s:a>
         </header>
         <!-- seems like lots of recent admin template have this feature of user info in the sidebar.
             looks good, so adding it and enhancing with notifications -->
         <div class="sidebar-status hidden-md-up">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown"> <span
               class="thumb-sm avatar pull-xs-right"> <!-- <img class="img-circle" src="demo/img/people/a5.jpg" alt="..."> -->
            </span> <!-- .circle is a pretty cool way to add a bit of beauty to raw data.
                     should be used with bg-* and text-* classes for colors -->
               <span class="circle bg-warning fw-bold text-gray-dark"> 13 </span>
               &nbsp; Philip <strong>Smith</strong> <b class="caret"></b>
            </a>
            <!-- #notifications-dropdown-menu goes here when screen collapsed to xs or sm -->
         </div>
         <!-- main notification links are placed inside of .sidebar-nav -->
         <ul class="sidebar-nav">
            <li class="active"><a href="#sidebar-ui" data-toggle="collapse"
               data-parent="#sidebar"> <span class="icon"> <!-- <i class="glyphicon glyphicon-tree-conifer"></i> -->
                     <i class="fa fa-child"></i>
               </span> My Page <i class="toggle fa fa-angle-down"></i>
            </a>
               <ul id="sidebar-ui" class="collapse in">
                  <li><s:a action="mypagev" namespace="/player">전적 보기</s:a></li>
               </ul>
               </li>
            <li><a class="collapsed" href="#sidebar-maps"
               data-toggle="collapse" data-parent="#sidebar"> <span
                  class="icon"> <i class="fa fa-users"></i>
               </span> TEAM <i class="toggle fa fa-angle-down"></i>
            </a>
               <ul id="sidebar-maps" class="collapse">
                  <!-- data-no-pjax turns off pjax loading for this link. Use in case of complicated js loading on the
                         target page -->
                  <li><s:a action="soccerteampage" namespace="/team">축구팀 관리</s:a></li>
                  <li><s:a action="baseballteampage" namespace="/team">야구팀 관리</s:a></li>
                  <li><s:a action="t_searchv" namespace="/team">팀 찾기</s:a></li>
               </ul></li>
            <li>
               <!-- an example of nested submenu. basic bootstrap collapse component -->
               <a class="collapsed" href="#sidebar-tables" data-toggle="collapse"
               data-parent="#sidebar"> <span class="icon"> <i
                     class="fa fa-sitemap"></i>
               </span> Matching <i class="toggle fa fa-angle-down"></i>
            </a>
               <ul id="sidebar-tables" class="collapse">
                  <li><s:a action="Matching" namespace="/player">진행 중</s:a></li>
                  <li><s:a action="prevMatching" namespace="/player">지난 매칭</s:a></li>
               </ul>
            </li>
            
            <li><a class="collapsed" href="#sidebar-forms" data-toggle="collapse" data-parent="#sidebar" aria-expanded="false">
                    <span class="icon">
                        <i class="glyphicon glyphicon-star"></i>
                    </span>
                    Ranking
                    <i class="toggle fa fa-angle-down"></i>
                </a>
                <ul id="sidebar-forms" class="collapse" aria-expanded="false">
                  <li><s:a action="scranking" namespace="/player">축구 명예의 전당</s:a></li>
                  <li><s:a action="baranking" namespace="/player">야구 명예의 전당</s:a></li>
                  <li><s:a action="blranking" namespace="/player">볼링 명예의 전당</s:a></li>
                  <li><s:a action="ppranking" namespace="/player">탁구 명예의 전당</s:a></li>
                </ul>
            </li>
            <li><a href="grid.html"> <span class="icon"> <span
                     class="glyphicon glyphicon-list-alt"></span>
               </span> 자게
            </a></li>
            
         </ul>
      </div>
   </nav>
   <!-- This is the white navigation bar seen on the top. A bit enhanced BS navbar. See .page-controls in _base.scss. -->

   <nav class="page-controls navbar navbar-dashboard">
      <div class="container-fluid">
         <div class="navbar-header">
            <ul class="nav navbar-nav">
               <li class="nav-item">
                  <!-- whether to automatically collapse sidebar on mouseleave. If activated acts more like usual admin templates -->
                  <a class="hidden-md-down nav-link" id="nav-state-toggle" href="#"
                  data-toggle="tooltip" data-html="true"
                  data-original-title="Turn<br>on/off<br>sidebar<br>collapsing"
                  data-placement="bottom"> <i class="fa fa-bars fa-lg"></i>
               </a> <!-- shown on xs & sm screen. collapses and expands navigation -->
                  <a class="hidden-lg-up nav-link" id="nav-collapse-toggle" href="#"
                  data-html="true" title="Show/hide<br>sidebar"
                  data-placement="bottom"> <span
                     class="rounded rounded-lg bg-gray text-white hidden-md-up"><i
                        class="fa fa-bars fa-lg"></i></span> <i
                     class="fa fa-bars fa-lg hidden-sm-down"></i>
               </a>
               </li>
            </ul>
            <ul class="nav navbar-nav navbar-right hidden-md-up">
               <li>
                  <!-- toggles chat --> <a href="#" data-toggle="chat-sidebar">
                     <span class="rounded rounded-lg bg-gray text-white"><i
                        class="fa fa-globe fa-lg"></i></span>
               </a>
               </li>
            </ul>
            <!-- xs & sm screen logo -->
            <s:a class="navbar-brand hidden-md-up" action="index" namespace="/"> <i
               class="fa fa-circle text-gray mr-n-sm"></i> <i
               class="fa fa-circle text-warning"></i> &nbsp; 골목대장 &nbsp; <i
               class="fa fa-circle text-warning mr-n-sm"></i> <i
               class="fa fa-circle text-gray"></i>
            </s:a>
         </div>
         <!-- this part is hidden for xs screens -->
         <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav pull-xs-right">
               <li class="dropdown nav-item"><a href="#"
                  class="dropdown-toggle dropdown-toggle-notifications nav-link"
                  id="notifications-dropdown-toggle" data-toggle="dropdown">
                     &nbsp; <strong> <s:if test="#session.user_Id != null">
                          <%--  <span class="thumb-sm avatar pull-xs-left"> <img
                              id="picture" class="img-circle" src="../img/" alt="...">
                           </span> --%>
                           <s:property value="#session.user_Name" />
                        </s:if>
                        <s:else>
                           <s:a action="loginv" namespace="player">로그인하기</s:a>
                        </s:else>
                  </strong>&nbsp; <b class="caret"></b>
               </a> <!-- 드롭다운 -->
                  <div class="dropdown-menu dropdown-menu-right animated fadeInUp"
                     id="notifications-dropdown-menu"></div></li>

               <li class="dropdown nav-item"><a href="#"
                  class="dropdown-toggle nav-link" data-toggle="dropdown"> <i
                     class="fa fa-cog fa-lg"></i>
               </a>
                  <ul class="dropdown-menu dropdown-menu-right">
                     <li><s:a class="dropdown-item" action="joinv" namespace="/player"><i
                           class="glyphicon glyphicon-user"></i> &nbsp; Join</s:a></li>
                     <li><s:a class="dropdown-item" action="logout" namespace="player" ><i
                           class="fa fa-sign-out"></i> &nbsp; Log Out</s:a></li>
                  </ul></li>
            </ul>
         </div>
      </div>
   </nav>

<div class="content-wrap">
    <!-- main page content. the place to put widgets in. usually consists of .row > .col-lg-* > .widget.  -->
    <main id="content" class="content" role="main">
        <h1 class="page-title">우리동내 골목대장 <small><small>생활체육 매칭 서비스</small></small></h1>
        <div class="row">
            <div class="col-lg-8">
                <!-- minimal widget consist of .widget class. note bg-transparent - it can be any background like bg-gray,
                bg-primary, bg-white -->
                <section class="widget bg-transparent">
                    <!-- .widget-body is a mostly semantic class. may be a sibling to .widget>header or .widget>footer -->
                    <div class="widget-body">
                        <div id="map" class="mapael">
                           
                            <div class="map">
                            		<img src="images/159.png" style="width: 100%;">
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            <div class="col-lg-4">
                <section class="widget bg-transparent">
                    <header>
                        <h5>
                            	우리동내 골목대장
                            <span class="fw-semi-bold">전체통계</span>
                        </h5>
                        <div class="widget-controls widget-controls-hover">
                            <a href="#"><i class="glyphicon glyphicon-cog"></i></a>
                            <a href="#"><i class="fa fa-refresh"></i></a>
                            <a href="#" data-widgster="close"><i class="glyphicon glyphicon-remove"></i></a>
                        </div>
                    </header>
                    <div class="widget-body">
                        <p>
                            <p class="h3 text-warning no-margin"><i class="fa fa-map-marker"><strong id="geo-locations-number">5 035</strong> </i>개의 매칭이 성사되었습니다.</p>
                        </p>
                        <div class="row progress-stats">
                            <div class="col-md-9">
                                <h6 class="name m-t-1">서비스 이용 만족도</h6>
                                <div class="bg-white progress-bar">
                                    <progress class="progress progress-primary progress-sm js-progress-animate" value="100" max="100" style="width: 0%" data-width="60%"></progress>
                                </div>
                            </div>
                            <div class="col-md-3 text-xs-center">
                                <span class="status rounded rounded-lg bg-body-light">
                                    <small><span id="percent-1">72</span>%</small>
                                </span>
                            </div>
                        </div>
                        <div class="row progress-stats">
                            <div class="col-md-9">
                                <h6 class="name m-t-1">무효된 게임</h6>
                                <div class="bg-white progress-bar">
                                    <progress class="progress progress-sm progress-danger js-progress-animate" value="100" max="100" style="width: 0%" data-width="39%"></progress>
                                </div>
                            </div>
                            <div class="col-md-3 text-xs-center">
                                <span class="status rounded rounded-lg bg-body-light">
                                    <small><span  id="percent-2">28</span>%</small>
                                </span>
                            </div>
                        </div>
                        <div class="row progress-stats">
                            <div class="col-md-9">
                                <h6 class="name m-t-1">매칭 성공률</h6>
                                <div class="bg-white progress-bar">
                                    <progress class="progress progress-sm progress-success js-progress-animate" value="100" max="100" style="width: 0%" data-width="80%"></progress>
                                </div>
                            </div>
                            <div class="col-md-3 text-xs-center">
                                <span class="status rounded rounded-lg bg-body-light">
                                    <small><span id="percent-3">92</span>%</small>
                                </span>
                            </div>
                        </div>
                        <s:if test="#session.user_Id==null">
                        <div class="input-group mt">
                            <span class="input-group-btn">
                                <button class="btn btn-info btn-block" onclick="applybtn()">회원가입</button>
                                <button class="btn btn-warning btn-block" onclick="loginbtn()">로그인</button>
                            </span>
                        </div>
                        </s:if>
                        <s:else>
                        <div class="input-group mt" style="margin-left: 10%;">
                                 <h6 class="fw-semi-bold mt" style="margin-left: 100px;">
                                 	<s:property value="#session.user_Name"/>님 로그인 중
                                 </h6>
                            <div style="width: 350px; height: 80px;">
                        	<button class="btn btn-info btn-block" style="width: 100%; height: 100%;" onclick="location.href='index_matching'">
                        		<p style="font-size: 20px; font-weight: bold;">매칭하러가기</p>
                        	</button>
                        	</div>
                        </div>
                        </s:else>
                    </div>
                </section>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4">
                <section class="widget">
                    <!-- .widget>header is generally a place for widget title and widget controls. see .widget in _base.scss -->
                    <header>
                        <h6>
                            	볼링매칭
                        </h6>
                        <div class="widget-controls">
                            <a href="#"><i class="glyphicon glyphicon-cog"></i></a>
                            <a href="#" data-widgster="close"><i class="glyphicon glyphicon-remove"></i></a>
                        </div>
                    </header>
                    <div class="widget-body">
                        <div class="stats-row">
                            <div class="stat-item">
                                <h6 class="name fs-sm">전체이용자 중</h6>
                                <p class="value">76.38%</p>
                            </div>
                            <div class="stat-item">
                                <h6 class="name fs-sm">월증가</h6>
                                <p class="value">10.38%</p>
                            </div>
                            <div class="stat-item">
                                <h6 class="name fs-sm">24시간</h6>
                                <p class="value">3.38%</p>
                            </div>
                        </div>
                        <div class="bg-gray-lighter progress-bar">
                            <progress class="progress progress-xs progress-success" value="100" max="100" style="width: 60%"></progress>
                        </div>
                        <p>
                            <small><span class="circle bg-warning"><i class="glyphicon glyphicon-chevron-up"></i></span></small>
                            <span class="fw-semi-bold">17% higher</span>
                            than last month</p>
                    </div>
                </section>
            </div>
            <div class="col-lg-4">
                <section class="widget">
                    <header>
                        <h6>
                            	탁구매칭
                        </h6>
                        <div class="widget-controls">
                            <a href="#"><i class="glyphicon glyphicon-cog"></i></a>
                            <a href="#" data-widgster="close"><i class="glyphicon glyphicon-remove"></i></a>
                        </div>
                    </header>
                    <div class="widget-body">
                        <div class="stats-row">
                            <div class="stat-item">
                                <h6 class="name fs-sm">전체이용자 중</h6>
                                <p class="value">71.81%</p>
                            </div>
                            <div class="stat-item">
                                <h6 class="name fs-sm">월증가</h6>
                                <p class="value">19.31%</p>
                            </div>
                            <div class="stat-item">
                                <h6 class="name fs-sm">24시간</h6>
                                <p class="value">9.10%</p>
                            </div>
                        </div>
                        <div class="bg-gray-lighter progress-bar">
                            <progress class="progress progress-xs progress-danger" value="100" max="100" style="width: 60%"></progress>
                        </div>
                        <p>
                            <small><span class="circle bg-warning"><i class="fa fa-chevron-down"></i></span></small>
                            <span class="fw-semi-bold">8% lower</span>
                            than last month
                        </p>
                    </div>
                </section>
            </div>
            <div class="col-lg-4">
                <section class="widget">
                    <header>
                        <h6>
                           	축구매칭
                        </h6>
                        <div class="widget-controls">
                            <a href="#"><i class="glyphicon glyphicon-cog"></i></a>
                            <a href="#" data-widgster="close"><i class="glyphicon glyphicon-remove"></i></a>
                        </div>
                    </header>
                    <div class="widget-body">
                        <div class="stats-row">
                            <div class="stat-item">
                                <h6 class="name fs-sm">전체이용자 중</h6>
                                <p class="value">80.12%</p>
                            </div>
                            <div class="stat-item">
                                <h6 class="name fs-sm">월증가</h6>
                                <p class="value">14.38%</p>
                            </div>
                            <div class="stat-item">
                                <h6 class="name fs-sm">24시간</h6>
                                <p class="value">10.29%</p>
                            </div>
                        </div>
                        <div class="bg-gray-lighter progress-bar">
                            <progress class="progress progress-primary progress-xs" value="100" max="100" style="width: 60%"></progress>
                        </div>
                        <p>
                            <small><span class="circle bg-warning"><i class="fa fa-chevron-down"></i></span></small>
                            <span class="fw-semi-bold">2% lower</span>
                            than last month
                        </p>
                    </div>
                    
                </section>
            </div>
             <div class="col-lg-4">
                <section class="widget">
                    <!-- .widget>header is generally a place for widget title and widget controls. see .widget in _base.scss -->
                    <header>
                        <h6>
                            	야구매칭
                        </h6>
                        <div class="widget-controls">
                            <a href="#"><i class="glyphicon glyphicon-cog"></i></a>
                            <a href="#" data-widgster="close"><i class="glyphicon glyphicon-remove"></i></a>
                        </div>
                    </header>
                    <div class="widget-body">
                        <div class="stats-row">
                            <div class="stat-item">
                                <h6 class="name fs-sm">전체이용자 중</h6>
                                <p class="value">76.38%</p>
                            </div>
                            <div class="stat-item">
                                <h6 class="name fs-sm">월증가</h6>
                                <p class="value">10.38%</p>
                            </div>
                            <div class="stat-item">
                                <h6 class="name fs-sm">24시간</h6>
                                <p class="value">3.38%</p>
                            </div>
                        </div>
                        <div class="bg-gray-lighter progress-bar">
                            <progress class="progress progress-xs progress-success" value="100" max="100" style="width: 60%"></progress>
                        </div>
                        <p>
                            <small><span class="circle bg-warning"><i class="glyphicon glyphicon-chevron-up"></i></span></small>
                            <span class="fw-semi-bold">17% higher</span>
                            than last month</p>
                    </div>
                </section>
            </div>
            <div class="col-lg-4">
                <section class="widget">
                    <header>
                        <h6>
                            	OO매칭
                        </h6>
                        <div class="widget-controls">
                            <a href="#"><i class="glyphicon glyphicon-cog"></i></a>
                            <a href="#" data-widgster="close"><i class="glyphicon glyphicon-remove"></i></a>
                        </div>
                    </header>
                    <div class="widget-body">
                        <div class="stats-row">
                            <div class="stat-item">
                                <h6 class="name fs-sm">전체이용자 중</h6>
                                <p class="value">00.00%</p>
                            </div>
                            <div class="stat-item">
                                <h6 class="name fs-sm">월증가</h6>
                                <p class="value">00.00%</p>
                            </div>
                            <div class="stat-item">
                                <h6 class="name fs-sm">24시간</h6>
                                <p class="value">00.00%</p>
                            </div>
                        </div>
                        <div class="bg-gray-lighter progress-bar">
                            <progress class="progress progress-xs progress-danger" value="100" max="100" style="width: 60%"></progress>
                        </div>
                        <p>
                            <small><span class="circle bg-warning"><i class="fa fa-chevron-down"></i></span></small>
                            <span class="fw-semi-bold">00.00%</span>
                            than last month
                        </p>
                    </div>
                </section>
            </div>
            <div class="col-lg-4">
                <section class="widget">
                    <header>
                        <h6>
                           	OO매칭
                        </h6>
                        <div class="widget-controls">
                            <a href="#"><i class="glyphicon glyphicon-cog"></i></a>
                            <a href="#" data-widgster="close"><i class="glyphicon glyphicon-remove"></i></a>
                        </div>
                    </header>
                    <div class="widget-body">
                        <div class="stats-row">
                            <div class="stat-item">
                                <h6 class="name fs-sm">전체이용자 중</h6>
                                <p class="value">00.00%</p>
                            </div>
                            <div class="stat-item">
                                <h6 class="name fs-sm">월증가</h6>
                                <p class="value">00.00%</p>
                            </div>
                            <div class="stat-item">
                                <h6 class="name fs-sm">24시간</h6>
                                <p class="value">00.00%</p>
                            </div>
                        </div>
                        <div class="bg-gray-lighter progress-bar">
                            <progress class="progress progress-primary progress-xs" value="100" max="100" style="width: 60%"></progress>
                        </div>
                        <p>
                            <small><span class="circle bg-warning"><i class="fa fa-chevron-down"></i></span></small>
                            <span class="fw-semi-bold">00.00%</span>
                            than last month
                        </p>
                    </div>
                    
                </section>
            </div>
        </div>
    </main>
</div>

<div class="loader-wrap hiding hide">
    <i class="fa fa-circle-o-notch fa-spin-fast"></i>
</div>

<!-- common libraries. required for every page-->
<script src="vendor/jquery/dist/jquery.min.js"></script>
<script src="vendor/jquery-pjax/jquery.pjax.js"></script>
<script src="vendor/tether/dist/js/tether.js"></script>
<script src="vendor/bootstrap/js/dist/util.js"></script>
<script src="vendor/bootstrap/js/dist/collapse.js"></script>
<script src="vendor/bootstrap/js/dist/dropdown.js"></script>
<script src="vendor/bootstrap/js/dist/button.js"></script>
<script src="vendor/bootstrap/js/dist/tooltip.js"></script>
<script src="vendor/bootstrap/js/dist/alert.js"></script>
<script src="vendor/slimScroll/jquery.slimscroll.js"></script>
<script src="vendor/widgster/widgster.js"></script>
<script src="vendor/pace.js/pace.js" data-pace-options='{ "target": ".content-wrap", "ghostTime": 1000 }'></script>
<script src="vendor/jquery-touchswipe/jquery.touchSwipe.js"></script>
<script src="../js/bootstrap-fix/button.js"></script>

<!-- common app js -->
<script src="js/settings.js"></script>
<script src="js/app.js"></script>

<!-- page specific libs -->
<script id="test" src="vendor/underscore/underscore.js"></script>
<script src="vendor/jquery.sparkline/index.js"></script>
<script src="vendor/jquery.sparkline/index.js"></script>
<script src="vendor/d3/d3.min.js"></script>
<script src="vendor/rickshaw/rickshaw.min.js"></script>
<script src="vendor/raphael/raphael-min.js"></script>
<script src="vendor/jQuery-Mapael/js/jquery.mapael.js"></script>
<script src="vendor/jQuery-Mapael/js/maps/usa_states.js"></script>
<script src="vendor/jQuery-Mapael/js/maps/world_countries.js"></script>
<script src="vendor/bootstrap/js/dist/popover.js"></script>
<script src="vendor/bootstrap_calendar/bootstrap_calendar/js/bootstrap_calendar.min.js"></script>
<script src="vendor/jquery-animateNumber/jquery.animateNumber.min.js"></script>

<!-- page specific js -->
<script src="js/index.js"></script>
</body>
</html>