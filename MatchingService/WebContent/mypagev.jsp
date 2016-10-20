<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Sing - List Groups</title>
    <link href="css/application.min.css" rel="stylesheet">
    <!-- as of IE9 cannot parse css files with more that 4K classes separating in two files -->
    <!--[if IE 9]>
        <link href="css/application-ie9-part2.css" rel="stylesheet">
    <![endif]-->
    <link rel="shortcut icon" href="img/favicon.png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <script>
        /* yeah we need this empty stylesheet here. It's cool chrome & chromium fix
         chrome fix https://code.google.com/p/chromium/issues/detail?id=167083
         https://code.google.com/p/chromium/issues/detail?id=332189
         */
    </script>
</head>
<body>
<!-- 왼쪽 사이트 바 -->
<nav id="sidebar" class="sidebar" role="navigation">
    <!-- need this .js class to initiate slimscroll -->
    <div class="js-sidebar-content">
        <header class="logo hidden-sm-down">
            <a href="index.html">sing</a>
        </header>
        <!-- seems like lots of recent admin template have this feature of user info in the sidebar.
             looks good, so adding it and enhancing with notifications -->
        <div class="sidebar-status hidden-md-up">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <span class="thumb-sm avatar pull-xs-right">
                    <img class="img-circle" src="demo/img/people/a5.jpg" alt="...">
                </span>
                <!-- .circle is a pretty cool way to add a bit of beauty to raw data.
                     should be used with bg-* and text-* classes for colors -->
                <span class="circle bg-warning fw-bold text-gray-dark">
                    13
                </span>
                &nbsp;
                Philip <strong>Smith</strong>
                <b class="caret"></b>
            </a>
            <!-- #notifications-dropdown-menu goes here when screen collapsed to xs or sm -->
        </div>
        <!-- main notification links are placed inside of .sidebar-nav -->
        <ul class="sidebar-nav">
            <li>
                <a href="profile.html">
                    <span class="icon">
                        <i class="glyphicon glyphicon-user"></i>
                    </span>
                    index
                    <sup class="text-warning fw-semi-bold">
                        new
                    </sup>
                </a>
            </li>
        </ul>
        <!-- every .sidebar-nav may have a title -->
        <ul class="sidebar-nav">
            <li  class="active">
                <a href="#sidebar-ui" data-toggle="collapse" data-parent="#sidebar">
                    <span class="icon">
                        <!-- <i class="glyphicon glyphicon-tree-conifer"></i> -->
                        <i class="fa fa-child"></i>
                    </span>
                    Join
                    <i class="toggle fa fa-angle-down"></i>
                </a>
                <ul id="sidebar-ui" class="collapse in">
                    <li><a href="ui_components.html">전적 보기</a></li>
                    <li><a href="ui_notifications.html">수정</a></li>
                    <li><a href="ui_icons.html">신고</a></li>
                    <li><a href="ui_buttons.html">탈퇴</a></li>
                </ul>
            </li>
            <li>
                <a class="collapsed" href="#sidebar-maps" data-toggle="collapse" data-parent="#sidebar">
                    <span class="icon">
                        <i class="fa fa-users"></i>
                    </span>
                    TEAM
                    <i class="toggle fa fa-angle-down"></i>
                </a>
                <ul id="sidebar-maps" class="collapse">
                    <!-- data-no-pjax turns off pjax loading for this link. Use in case of complicated js loading on the
                         target page -->
                    <li><a href="maps_google.html" data-no-pjax>팀 관리</a></li>
                    <li><a href="maps_vector.html">팀 모집</a></li>
                </ul>
            </li>
            <li>
                <!-- an example of nested submenu. basic bootstrap collapse component -->
                <a class="collapsed" href="#sidebar-tables" data-toggle="collapse" data-parent="#sidebar">
                    <span class="icon">
                        <i class="fa fa-sitemap"></i>
                    </span>
                    Matching
                    <i class="toggle fa fa-angle-down"></i>
                </a>
                <ul id="sidebar-tables" class="collapse">
                    <li><a href="tables_basic.html">진행 중</a></li>
                    <li><a href="tables_dynamic.html">지난 매칭</a></li>
                </ul>
            </li>
            <li>
                <a href="grid.html">
                    <span class="icon">
                        <span class="glyphicon glyphicon-star"></span>
                    </span>
                    Ranking
                </a>
            </li>
            <li>
                <a href="grid.html">
                    <span class="icon">
                        <span class="glyphicon glyphicon-list-alt"></span>
                    </span>
                    자게
                </a>
            </li>
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
                    <a class="hidden-md-down nav-link" id="nav-state-toggle" href="#" data-toggle="tooltip" data-html="true" data-original-title="Turn<br>on/off<br>sidebar<br>collapsing" data-placement="bottom">
                        <i class="fa fa-bars fa-lg"></i>
                    </a>
                    <!-- shown on xs & sm screen. collapses and expands navigation -->
                    <a class="hidden-lg-up nav-link" id="nav-collapse-toggle" href="#" data-html="true" title="Show/hide<br>sidebar" data-placement="bottom">
                        <span class="rounded rounded-lg bg-gray text-white hidden-md-up"><i class="fa fa-bars fa-lg"></i></span>
                        <i class="fa fa-bars fa-lg hidden-sm-down"></i>
                    </a>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right hidden-md-up">
                <li>
                    <!-- toggles chat -->
                    <a href="#" data-toggle="chat-sidebar">
                        <span class="rounded rounded-lg bg-gray text-white"><i class="fa fa-globe fa-lg"></i></span>
                    </a>
                </li>
            </ul>
            <!-- xs & sm screen logo -->
            <a class="navbar-brand hidden-md-up" href="index.html">
                <i class="fa fa-circle text-gray mr-n-sm"></i>
                <i class="fa fa-circle text-warning"></i>
                &nbsp;
                골목대장
                &nbsp;
                <i class="fa fa-circle text-warning mr-n-sm"></i>
                <i class="fa fa-circle text-gray"></i>
            </a>
        </div>
        <!-- this part is hidden for xs screens -->
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav pull-xs-right">
                <li class="dropdown nav-item">
                    <a href="#" class="dropdown-toggle dropdown-toggle-notifications nav-link" id="notifications-dropdown-toggle" data-toggle="dropdown">
                        <span class="thumb-sm avatar pull-xs-left">
                            <img class="img-circle" src="demo/img/people/a5.jpg" alt="...">
                        </span>
                        &nbsp;
                        <strong>마스터도넛</strong>&nbsp;
                        <b class="caret"></b></a>
                    <!-- 드롭다운 -->
                    <div class="dropdown-menu dropdown-menu-right animated fadeInUp" id="notifications-dropdown-menu">
                    </div>
                </li>
                <li class="dropdown nav-item">
                    <a href="#" class="dropdown-toggle nav-link" data-toggle="dropdown">
                        <i class="fa fa-cog fa-lg"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-right">
                        <li><a class="dropdown-item" href="profile.html"><i class="glyphicon glyphicon-user"></i> &nbsp; My Page</a></li>
                        <li><a class="dropdown-item" href="login.html"><i class="fa fa-sign-out"></i> &nbsp; Log Out</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!-- 전적 페이지 -->
<div class="content-wrap">
    <main id="content" class="content" role="main">
        <!-- 화면 좌우이동 -->
        <style>
            body{
                overflow-x: visible;
            }
        </style>
 <h1 class="page-title">My Page - <span class="fw-semi-bold">전적보기</span></h1>
        <div style="height: 90px;">
        </div>
        <div class="row">
            <div class="col-lg-6" style="margin-left: 18%;">
                <section class="widget user-profile">
                    <div class="widget-body">
                        <div class="widget-top-overflow text-white">
                        </div>
                        <div class="row">
                            <div class="col-md-5 text-xs-center">
                            </div>
                             <div class="post-user post-user-profile">
                                    <span class="thumb-xlg">
                                        <img class="img-circle" src="img/logo.jpg" alt="...">
                                    </span><br>
                                    <h5 class="fw-normal" style="text-align: center; margin-left: -7%;">닉네임 <span class="fw-semi-bold">마스터도넛</span></h5>
                                    <p style="text-align: center; margin-left: -7%;">[팀 이름] 리더(또는 팀원)</p>
                                    <ul class="contacts">
                                        <li><i class="fa fa-phone fa-fw mr-xs"></i><a href="#">+82 010-1111-1111</a></li>
                                        <li><i class="fa fa-map-marker fa-fw mr-xs"></i><a href="#">Seoul, Jonro</a></li>
                                    </ul>
                                </div>
                            <div class="col-md-7">
                                <div class="stats-row stats-row-profile mt text-xs-right">
                                    <div class="stat-item">
                                        <p class="value text-xs-right">91.5%</p>
                                        <h6 class="name">승률</h6>
                                    </div>
                                    <div class="stat-item">
                                        <p class="value text-xs-right">938</p>
                                        <h6 class="name">승점</h6>
                                    </div>
                                    <div class="stat-item">
                                        <p class="value text-xs-right">300</p>
                                        <h6 class="name">매너점수</h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div><!-- <div class="col-lg-6"> --><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	        	<p style="margin-left: 31.4%;">
	        		<br>
           			<button class="btn btn-success width-100 mb-xs" role="button">
	                    축구
	                </button>
	                <button class="btn btn-warning width-100 mb-xs" role="button">
	                    야구
	                </button>
	                 <button class="btn btn-danger width-100 mb-xs" role="button">
	                    탁구
	                </button>
	                <button class="btn btn-primary width-100 mb-xs" role="button">
	                    볼링
	                </button>
	            </p><br><br>
	            <div class="col-lg-6 col-xl-5" style="float: left;">
	            	<h5>[축구]<span class="fw-semi-bold"> 승률</span></h5>
	                <section class="widget">
	                    <header>
	                        <div class="widget-body">
	                        	<canvas class="flot-overlay" style="direction: ltr; position: absolute; left: 0px; top: 0px; width: 423px; height: 260px;" width="846" height="520"></canvas>
	                    	</div>
	                    </header>
	                    <div class="widget-body">
	                        <div class="mt mb" id="flot-main" style="width: 100%; height: 260px;"></div>
	                        <div class="chart-tooltip" id="flot-main-tooltip" style="opacity: 0"></div>
	                    </div>
	                </section>
	            </div>
	            <div class="col-lg-6 col-xl-5" style="position: relative;">
                <h5>[축구]<span class="fw-semi-bold"> 승률이 좋았던 경기장</span></h5>
                <section class="search-result-item">
                    <a class="image-link">
                        <img class="image" src="img/logo.jpg">
                    </a>
                    <div class="search-result-item-body">
                        <div class="row">
                            <div class="col-md-9">
                                <h5 class="search-result-item-heading">
                                <a href="#">중랑구 XXX경기장</a>
                                <span class="label label-pill label-danger fw-normal pull-xs-right">First!</span>
                            </h5>
                                <p class="info">
                                    서울시 중랑구 OOO동 OOO로
                                </p>
                                <p class="description">
                                	[전화번호] +82 010-1111-1111
                                </p>
                            </div>
                            <div class="col-md-3 text-xs-center">
                                <p class="value4 mt-sm">
                                    999
                                </p>
                                <p class="text-muted">
                                    필드 보유
                                </p>
                                <a class="btn btn-primary btn-info btn-sm" href="#">상세보기</a>
                            </div>
                        </div>
                    </div>
                </section>
              	<section class="search-result-item">
                    <a class="image-link">
                        <img class="image" src="img/logo.jpg">
                    </a>
                    <div class="search-result-item-body">
                        <div class="row">
                            <div class="col-md-9">
                                <h5 class="search-result-item-heading">
                                <a href="#">중랑구 XXX경기장</a>
                            </h5>
                                <p class="info">
                                    서울시 중랑구 OOO동 OOO로
                                </p>
                                <p class="description">
                                	[전화번호] +82 010-1111-1111
                                </p>
                            </div>
                            <div class="col-md-3 text-xs-center">
                                <p class="value4 mt-sm">
                                    999
                                </p>
                                <p class="text-muted">
                                    필드 보유
                                </p>
                                <a class="btn btn-primary btn-info btn-sm" href="#">상세보기</a>
                            </div>
                        </div>
                    </div>
                </section>
               <section class="search-result-item">
                    <a class="image-link">
                        <img class="image" src="img/logo.jpg">
                    </a>
                    <div class="search-result-item-body">
                        <div class="row">
                            <div class="col-md-9">
                                <h5 class="search-result-item-heading">
                                <a href="#">중랑구 XXX경기장</a>
                            </h5>
                                <p class="info">
                                    서울시 중랑구 OOO동 OOO로
                                </p>
                                <p class="description">
                                	[전화번호] +82 010-1111-1111
                                </p>
                            </div>
                            <div class="col-md-3 text-xs-center">
                                <p class="value4 mt-sm">
                                    999
                                </p>
                                <p class="text-muted">
                                    필드 보유
                                </p>
                                <a class="btn btn-primary btn-info btn-sm" href="#">상세보기</a>
                            </div>
                        </div>
                    </div>
                </section>
	            </div>
		</div>
    </main>
</div>
<!-- The Loader. Is shown when pjax happens -->
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
<script src="vendor/slimScroll/jquery.slimscroll.min.js"></script>
<script src="vendor/widgster/widgster.js"></script>
<script src="vendor/pace.js/pace.js" data-pace-options='{ "target": ".content-wrap", "ghostTime": 1000 }'></script>
<script src="vendor/jquery-touchswipe/jquery.touchSwipe.js"></script>
<script src="js/bootstrap-fix/button.js"></script>

<!-- common app js -->
<script src="js/settings.js"></script>
<script src="js/app.js"></script>

<!-- page specific libs -->
<script src="vendor/jquery.sparkline/index.js"></script>
<script src="vendor/d3/d3.min.js"></script>
<script src="vendor/rickshaw/rickshaw.min.js"></script>
<script src="vendor/raphael/raphael-min.js"></script>
<script src="vendor/flot.animator/jquery.flot.animator.min.js"></script>
<script src="vendor/flot/jquery.flot.js"></script>
<script src="vendor/flot-orderBars/js/jquery.flot.orderBars.js"></script>
<script src="vendor/flot/jquery.flot.selection.js"></script>
<script src="vendor/flot/jquery.flot.time.js"></script>

<script src="vendor/nvd3/build/nv.d3.min.js"></script>
<script src="vendor/morris.js/morris.min.js"></script>
<script src="vendor/jquery.easy-pie-chart/dist/jquery.easypiechart.min.js"></script>

<!-- page specific js -->
<script src="js/charts.js"></script>

</body>
</html>