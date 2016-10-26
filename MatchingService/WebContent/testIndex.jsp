<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Sing - List Groups</title>
    <link href="css/application.min.css" rel="stylesheet">
    <link rel="shortcut icon" href="mg/favicon.png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<!-- 여기서부터 coffee -->
 	<meta charset="UTF-8">
    <title>Responsive Infinite Carousel</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no" />
	<script type="text/javascript" src="//use.typekit.net/kei2cfp.js"></script>
	<script type="text/javascript">try{Typekit.load();}catch(e){}</script>
<style>
/* NOTE: The styles were added inline because Prefixfree needs access to your styles and they must be inlined if they are on local disk! */
* {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}

body, html {
  font-family: "europa-1","europa-2", sans-serif;
  overflow: hidden;
}
.wrapper {
  max-width: 1920px;
  max-height: 1080px;
  width: 100%;
  position: relative;
  overflow: hidden;
  margin: 0 auto;
}

/**
 * Use this wrapper only for demo purposes
 * So you can show the items outside the wrapper
 */
.wrapper--demo {
  /* overflow: visible; */
}
.wrapper--demo:after, .wrapper--demo:before {
  content: "";
  position: absolute;
  /* width: 800px; */
  height: 100%;
  top: 0;
  left: 100%;
  background: rgba(255, 255, 255, 0.5);
  z-index: 2;
}
.wrapper--demo:before {
  /* left: -800px; */
}

.carousel {
  width: 100%;
  position: relative;
}
.carousel .carousel__content {
  width: auto;
  position: relative;
  overflow: hidden;
  -webkit-backface-visibility: hidden;
  -webkit-transition: translate3d(0, 0, 0);
}
.carousel .carousel__content .item {
  display: block;
  float: left;
  width: 100%;
  position: relative;
}
.carousel .carousel__content .item .title {
  position: absolute;
  top: 50%;
  left: 0;
  margin: -33px 0 0 0;
  padding: 0;
  font-size: 3rem;
  width: 100%;
  text-align: center;
  letter-spacing: .3rem;
  color: #FFF;
}
.carousel .carousel__content .item .title--sub {
  margin-top: 20px;
  font-size: 1.2em;
  opacity: .5;
}
.carousel .carousel__content .item img {
  width: 100%;
  max-width: 100%;
  display: block;
}
.carousel .carousel__nav {
  position: absolute;
  width: 100%;
  top: 50%;
  margin-top: -17px;
  left: 0;
  z-index: 1;
}
.carousel .carousel__nav .nav {
  position: absolute;
  top: 0;
  color: #000;
  background: #FFF;
  padding: 8px 12px;
  font-weight: bold;
  text-decoration: none;
  font-size: .8rem;
  transition: padding .25s ease;
}
.carousel .carousel__nav .nav:hover {
  padding: 8px 20px;
}
.carousel .carousel__nav .nav--left {
  border-radius: 0px 3px 3px 0px;
}
.carousel .carousel__nav .nav--right {
  right: 0;
  border-radius: 3px 0px 0px 3px;
}
</style>
<script src="../js/prefixfree.min.js"></script>
<!-- 여기까지 -->
</head>
<body>
<!-- 왼쪽 사이드 바 -->
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
                    <!-- <img class="img-circle" src="../demo/img/people/a5.jpg" alt="..."> -->
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
                    <!-- <li><s:a action="mypagev" namespace="/player">전적 보기</s:a></li> -->
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
<!-- 오른쪽 사이드 바 -->
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
                            <!-- <img class="img-circle" src="../demo/img/people/a5.jpg" alt="..."> -->
                        </span>
                        &nbsp;
                        <!-- 로그인 아이디 입력 -->
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
<!-- 페이지 -->
<div class="content-wrap">
    <main id="content" class="content" role="main">
        <!-- 화면 좌우이동 -->
        <style>
            body{
                overflow-x: visible;
            }
        </style>
        <div class="row">
            <div class="col-lg-12">
            	<!-- 메인 뷰 -->
		        <div class="wrapper wrapper--demo">
					<div class="carousel">
						<div class="carousel__content">
							<div class="item" style="background-color: white;">
						        <div class="widget-body, title"><br>
						        	<!-- <span> -->
			                        	<form role="form">
			                            <fieldset>
			                                <legend>
			                                    <span class="label label-pill label-danger">01</span><span style="font-size: 28px;"> 날짜선택</span>
			                                </legend>
			                                <div class="form-group">
			                                    <label for="datepicker2i">
			                                        <span class="help-block" style="font-size: 15px;">
			                                            원하는 날짜를 선택하세요
			                                        </span>
			                                    </label>
			                                    <div id="datetimepicker2" class="input-group" style="width: 40%; margin-left: 30%;">
			                                        <input id="datepicker2i" type="text" class="form-control"/>
			                                        <span class="input-group-addon">
			                                            <span class="fa fa-calendar"></span>
			                                        </span>
			                                    </div>
			                                </div>
			                            </fieldset>
			                            </form>
						        	<!-- </span> -->
						        </div>
						        <!-- <img src="http://placehold.it/1800x850/000000/FFF&text=&nbsp;"> -->
						        <img src="imges/first.jpg">
				     		</div>
							<div class="item">
						       <div class="widget-body, title"><br>
						        	<form role="form">
			                            <fieldset>
			                                <legend>
			                                    <span class="label label-pill label-warning">02</span><span style="font-size: 28px;"> 시간 선택</span>
			                                </legend>
			                                <div class="form-group">
			                                    <label for="datepicker2i">
			                                        <span class="help-block" style="font-size: 15px;">
			                                            원하는 시간을 선택하세요
			                                        </span>
			                                    </label>
			                                    <div id="datetimepicker2" class="input-group" style="width: 40%; margin-left: 30%;">
			                                        <input id="datepicker2i" type="text" class="form-control"/>
			                                        <span class="input-group-addon">
			                                            <span class="fa fa-calendar"></span>
			                                        </span>
			                                    </div>
			                                </div>
			                            </fieldset>
		                            </form>
						        </div>
						        <img src="img/first.jpg">
					     	</div>
							<div class="item">
						        <div class="widget-body, title"><br>
						        	<form role="form">
			                            <fieldset>
			                                <legend>
			                                    <span class="label label-pill label-success">03</span><span style="font-size: 28px;"> 구장 보유</span>
			                                </legend>
			                                <div class="form-group">
			                                    <label for="datepicker2i">
			                                        <span class="help-block" style="font-size: 15px;">
			                                            원하는 시간을 선택하세요
			                                        </span>
			                                    </label>
			                                    <div id="datetimepicker2" class="input-group" style="width: 40%; margin-left: 30%;">
			                                        <input id="datepicker2i" type="text" class="form-control"/>
			                                        <span class="input-group-addon">
			                                            <span class="fa fa-calendar"></span>
			                                        </span>
			                                    </div>
			                                </div>
			                            </fieldset>
		                            </form>
						        </div>
						        <img src="img/first.jpg">
				     	 	</div>
							<div class="item">
						        <div class="widget-body, title"><br>
						        	<br>
						        	<span>희망 지역</span><br>
						        	<span>여기쓰면</span>
						        </div>
						        <img src="img/first.jpg">
				      		</div>
							<div class="item">
						        <div class="widget-body, title"><br>
						        	<br>
						        	<span>매칭</span><br>
						        	<span>여기쓰면</span>
						        </div>
						        <img src="img/first.jpg">
					      	</div>
							<div class="item">
						        <div class="widget-body, title"><br>
						        	<br>
						        	<span>매칭 중...</span><br>
						        	<span>여기쓰면</span>
						        </div>
						        <div class="title title--sub">Last Item</div>
						        <img src="img/first.jpg">
					      	</div>
						</div>
					    <div class="carousel__nav">
						    <a href="#" class="nav nav--left">PREVIOUS</a>
						    <a href="#" class="nav nav--right">NEXT</a>
					    </div>
					</div>
				</div>
            </div><!-- <div class="col-lg-12"> -->
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
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery.transit/0.9.9/jquery.transit.min.js'></script>
<script src="js/coffee/index.js"></script>
<script src="vendor/bootstrap/js/dist/modal.js"></script>
<script src="vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
<script src="vendor/jquery-autosize/jquery.autosize.min.js"></script>
<script src="vendor/bootstrap3-wysihtml5/lib/js/wysihtml5-0.3.0.min.js"></script>
<script src="vendor/bootstrap3-wysihtml5/src/bootstrap3-wysihtml5.js"></script>
<script src="vendor/select2/select2.min.js"></script>
<script src="vendor/switchery/dist/switchery.min.js"></script>
<script src="vendor/moment/min/moment.min.js"></script>
<script src="vendor/eonasdan-bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
<script src="vendor/mjolnic-bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
<script src="vendor/jasny-bootstrap/js/inputmask.js"></script>
<script src="vendor/jasny-bootstrap/js/fileinput.js"></script>
<script src="vendor/holderjs/holder.js"></script>
<script src="vendor/dropzone/dist/min/dropzone.min.js"></script>
<script src="vendor/markdown/lib/markdown.js"></script>
<script src="vendor/bootstrap-markdown/js/bootstrap-markdown.js"></script>
<script src="vendor/seiyria-bootstrap-slider/dist/bootstrap-slider.min.js"></script>

<!-- page specific js -->
<script src="js/form-elements.js"></script>
</body>
</html>