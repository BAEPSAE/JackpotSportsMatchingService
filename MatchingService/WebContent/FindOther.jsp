<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <title>골목대장 - 매칭상대 찾기</title>
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
                    My Page
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
<div class="content-wrap">
    <!-- main page content. the place to put widgets in. usually consists of .row > .col-lg-* > .widget.  -->
    <main id="content" class="content" role="main">
        <ol class="breadcrumb">
            <li>매칭신청</li>
            <li class="active">매칭정보 입력</li>
        </ol>
        <h1 class="page-title">경기종목 - <span class="fw-semi-bold">축구</span></h1>
        <div class="row">
            <div class="col-lg-12">
                <section class="widget">
                    <header>
                        <h5>당신을 기다리고 있을 대결상대는 누구?!</h5>
                    </header>
                    <div class="widget-body">
                        <div class="row">
                            <div class="col-lg-8">
                                <div id="wizard" class="form-wizard">
                                    <ul class="nav-justified mb-sm nav nav-pills">
                                        <li class="nav-item"><a class="nav-link" href="#tab1" data-toggle="tab">
                                            <small>1.</small>
                                           	 날짜 / 시간</a></li>
                                        <li class="nav-item"><a class="nav-link" href="#tab2" data-toggle="tab">
                                            <small>2.</small>
                                            	장소</a></li>
                                        <li class="nav-item"><a class="nav-link" href="#tab3" data-toggle="tab">
                                            <small>3.</small>
                                            	기타</a></li>
                                        
                                    </ul>
                                    <div class="bg-gray-lighter progress-bar mt-xs">
                                        <progress id="bar" class="progress progress-xs progress-bar-gray-light progress-animated" value="100" max="100" style="width: 0%"></progress>
                                    </div>
                                    <div class="tab-content">
                                        <div class="tab-pane bg-gray-lighter" id="tab1">
                                            <form action='' method="POST"
                                                  data-parsley-priority-enabled="false"
                                                  novalidate="novalidate">
                                                <fieldset>
                                                    <div class="form-group">
                                                        <!-- Username -->
                                                        <label for="username">희망날짜 / 시간</label>
                                                        <input type="date" id="username" name="username" placeholder=""
                                                               class="form-control"
                                                               required="required">
                                                    </div>
                                                    
                                                    <div class="mb-sm">
							                            <div class="btn-group" data-toggle="buttons">
							                                <label class="btn btn-secondary">
							                                    <input type="checkbox">6 ~ 8 시
							                                </label>
							                                <label class="btn btn-secondary">
							                                    <input type="checkbox"> 8 ~ 10 시
							                                </label>
							                                <label class="btn btn-secondary">
							                                    <input type="checkbox"> 10 ~ 12 시
							                                </label>
							                                <label class="btn btn-secondary">
							                                    <input type="checkbox"> 12 ~ 14 시
							                                </label>
							                                <label class="btn btn-secondary">
							                                    <input type="checkbox"> 14 ~ 16 시
							                                </label>
							                                <label class="btn btn-secondary">
							                                    <input type="checkbox"> 16 ~ 18 시
							                                </label>
							                                <label class="btn btn-secondary">
							                                    <input type="checkbox"> 18 ~ 20 시
							                                </label>
							                                <label class="btn btn-secondary">
							                                    <input type="checkbox"> 20 ~ 22 시
							                                </label>
							                                <label class="btn btn-secondary">
							                                    <input type="checkbox"> 상관없음
							                                </label>
							                            </div>
							                            
							                        </div>
                                                </fieldset>
                                            </form>
                                            
                                        </div>
                                        <div class="tab-pane bg-gray-lighter" id="tab2">
                                            <form action='' method="POST"
                                                  data-parsley-priority-enabled="false"
                                                  novalidate="novalidate">
                                                <fieldset>
                                                    <div class="form-group">
                                                        <label for="country-select">Destination Country</label>
                                                        <select id="country-select" data-placeholder="Choose a Country..."
                                                                class="form-control chzn-select">
                                                            <option value=""></option>
                                                            <option value="United States">United States</option>
                                                            <option value="United Kingdom">United Kingdom</option>
                                                            <option value="Afghanistan">Afghanistan</option>
                                                            <option value="Zambia">Zambia</option>
                                                            <option value="Zimbabwe">Zimbabwe</option>
                                                        </select>
                                                    </div>
                                                </fieldset>
                                            </form>
                                        </div>
                                        <div class="tab-pane bg-gray-lighter" id="tab3">
                                            <form action='' method="POST">
                                                <fieldset>
                                                 	 정보확인? 가중치?
                                                </fieldset>
                                            </form>
                                        </div>
                                        
                                        <div class="tab-pane bg-gray-lighter" id="tab4">
                                            <h2>Thank you!</h2>

                                            <p>Your submission has been received.</p>
                                        </div>
                                        <ul class="pager wizard">
                                            <li class="previous">
                                                <button class="btn btn-default btn-rounded pull-xs-left">
                                                    <i class="fa fa-caret-left"></i> &nbsp; Previous
                                                </button>
                                            </li>
                                            <li class="next">
                                                <button class="btn btn-primary btn-rounded pull-xs-right" >
                                                    Next &nbsp; <i class="fa fa-caret-right"></i></button>
                                            </li>
                                            
                                        </ul>
                                    </div>
                                </div>
                                
                            </div>
                            <div>
                            <div class="col-lg-4">
                            	<h1 class="page-title" id="calender-current-date"></h1>
                            <section class="widget widget-calendar">
				                    <div class="widget-body">
				                        <div class="calendar-controls">
				                            <div class="btn-group ">
				                                <button class="btn btn-secondary" id="calender-prev"><i class="fa fa-angle-left"></i></button>
				                                <button class="btn btn-secondary" id="calender-next"><i class="fa fa-angle-right"></i></button>
				                            </div>
				                            <div id="calendar-switcher" class="btn-group pull-xs-right" data-toggle="buttons">
				                                <label class="btn btn-secondary active">
				                                    <input type="radio" name="view" value="month"> Month
				                                </label>
				                                <label class="btn btn-secondary">
				                                    <input type="radio" name="view" value="agendaWeek"> Week
				                                </label>
				                                <label class="btn btn-secondary">
				                                    <input type="radio" name="view" value="agendaDay"> Day
				                                </label>
				                            </div>
				                        </div>
				                        <div id="calendar" class="calendar"></div>
				                        
				                        
				                        
				                        
				                        <button class="btn btn-success">매칭시작 &nbsp; <i class="glyphicon glyphicon-ok"></i></button>
				                        
				                        
				                        
                                                
				                    </div>
	                			 </section>   
                			 </div>
                			
                            <div class="col-lg-4">
                                <div class="wizard" id="satellite-wizard" data-title="Create Server">
                                </div>
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
<script src="vendor/parsleyjs/dist/parsley.min.js"></script>
<script src="vendor/bootstrap/js/dist/tab.js"></script>
<script src="vendor/twitter-bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
<script src="vendor/select2/select2.js"></script>
<script src="vendor/moment/min/moment.min.js"></script>
<script src="vendor/eonasdan-bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
<script src="vendor/jasny-bootstrap/js/inputmask.js"></script>
<script src="vendor/bootstrap/js/dist/modal.js"></script>
<script src="vendor/bootstrap/js/dist/popover.js"></script>
<script src="vendor/bootstrap-application-wizard/src/bootstrap-wizard.js"></script>

<!-- page specific js -->
<script src="js/form-wizard.js"></script>




<!-- 캘린더용 -->

<script src="vendor/jquery-ui/ui/core.js"></script>
<script src="vendor/jquery-ui/ui/widget.js"></script>
<script src="vendor/jquery-ui/ui/mouse.js"></script>
<script src="vendor/jquery-ui/ui/draggable.js"></script>
<script src="vendor/jquery-ui/ui/resizable.js"></script>
<script src="vendor/fullcalendar/fullcalendar.js"></script>
<script src="vendor/bootstrap/js/dist/modal.js"></script>
<!-- page specific js -->
<script src="js/calendar.js"></script>
</body>
</html>