<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sing - List Groups</title>
    <link href="../css/application.min.css" rel="stylesheet">
    <!-- as of IE9 cannot parse css files with more that 4K classes separating in two files -->
    <!--[if IE 9]>
    <link href="css/application-ie9-part2.css" rel="stylesheet">
    <![endif]-->
    <link rel="shortcut icon" href="../img/favicon.png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script type="text/javascript">
    //상단바에 프로필 사진 넣는 jquery
    	$(function() {
			var src = $('#picture').attr('src');
			src+='<s:property value="#session.profile" />';
			$('#picture').attr('src', src);
    	});
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
                        &nbsp;
                        <strong>
                        	<s:if test="#session.id != null" >
                        <span class="thumb-sm avatar pull-xs-left">
                        
                            <img id="picture" class="img-circle" src="../img/" alt="...">
                            
                        </span>
                        		<s:property value="#session.name" />
                        	</s:if>
                        	<s:else>
                        		<s:a action="loginv">로그인하기</s:a>
                        	</s:else>
                        </strong>&nbsp;
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
                        <li><a class="dropdown-item" href="profile.html"><i class="glyphicon glyphicon-user"></i> &nbsp; Join</a></li>
                        <li><a class="dropdown-item" href="logout.action"><i class="fa fa-sign-out"></i> &nbsp; Log Out</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="content-wrap">
    <!-- main page content. the place to put widgets in. usually consists of .row > .col-md-* > .widget.  -->
    <main id="content" class="content" role="main">
        <!-- jquery ui sortable chrome overflow-x fix. when set to hidden does not behaves as expected. resetting back
             just for this page.
             http://bugs.jqueryui.com/ticket/9588 -->
        <style>
            body{
                overflow-x: visible;
            }
        </style>
        <h1 class="page-title"><span class="fw-semi-bold">회원가입</span></h1>
        <div class="row">
            <div class="col-lg-6">
                <section class="widget">
                    <!-- 회원가입 폼 -->
                    <div class="widget-body">
                        <form class="form-horizontal" role="form" action="join" method="post" enctype="multipart/form-data">
                            <fieldset>
                            <legend style="height: 25px;"><strong></strong></legend>
                                <!-- 아이디 -->
                                <div class="form-group row">
                                    <label class="col-md-4 control-label text-md-right" for="prepended-input">아이디</label>
                                    <div class="col-md-7">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                            <input id="user_id" name="player.user_Id" class="form-control" size="16" type="text" placeholder="4자리 이상">
                                        </div>
                                    </div>
                                </div>
                                <!-- 비밀번호 -->
                                <div class="form-group row">
                                    <label class="col-md-4 control-label text-md-right" for="password-field">비밀번호</label>
                                    <div class="col-md-7">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                            <input type="password"  class="form-control" id="user_Pw" name="player.user_Pw" placeholder="8자리 이상">
                                        </div>
                                    </div>
                                </div>
                                <!-- 이름 -->
                                <div class="form-group row">
                                    <label for="normal-field" class="col-md-4 form-control-label text-md-right">이름</label>
                                    <div class="col-md-7">
                                        <input type="text" id="user_Name" name="player.user_Name" class="form-control">
                                    </div>
                                </div>
                                <!-- 연락처 -->
                                <div class="form-group row">
                                   <label for="normal-field" class="col-md-4 form-control-label text-md-right">연락처</label>
                                   	<div class="col-md-7">
                                        <input id="user_Phone" name="player.user_Phone" type="text" class="form-control">
                                    </div>
                                </div>
                                <!-- 거주지역 -->
                                <div class="form-group row">
                                    <label for="normal-field" class="col-md-4 form-control-label text-md-right">거주지역</label>
                                    <div class="col-md-7">
                                        <select id="user_Location"
                                                data-placeholder="지역선택"
                                                class="select2 form-control"
                                                tabindex="-1"
                                                name="player.user_Location">
                                            <option value=""></option>
                                            <option value="Gangnam">강남구</option>
                                            <option value="Gangdong">강동구</option>
                                            <option value="Gangbuk">강북구</option>
                                            <option value="Gangseo">강서구</option>
                                            <option value="Gwanak">관악구</option>
                                            <option value="Gwangjin">광진구</option>
                                            <option value="Guro">구로구</option>
                                            <option value="Geumcheon">금천구</option>
                                            <option value="Nowon">노원구</option>
                                            <option value="Dobong">도봉구</option>
                                            <option value="Dongdaemun">동대문구</option>
                                            <option value="Dongjak">동작구</option>
                                            <option value="Mapo">마포구</option>
                                            <option value="Seodaemun">서대문구</option>
                                            <option value="Seongdong">성동구</option>
                                            <option value="Seongbuk">성북구</option>
                                            <option value="Songpa">송파구</option>
                                            <option value="Yangcheon">양천구</option>
                                            <option value="Yeongdeungpo">영등포구</option>
                                            <option value="Yongsan">용산구</option>
                                            <option value="Eunpyeong">은평구</option>
                                            <option value="Jungnang">중랑구</option>
                                        </select>
                                    </div>
                                </div>
                                <!-- 썸네일 등록 -->
                                <div class="form-group row">
                                    <label class="control-label col-md-4 text-md-right" for="fileupload1">
                                        프로필 등록
                                    </label>
                                    <div class="col-md-8">
                                        <div class="fileinput fileinput-new" data-provides="fileinput">
                                            <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
                                                <img data-src="holder.js/100%x100%" alt="100%x100%" src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMTkyIiBoZWlnaHQ9IjE0MiIgdmlld0JveD0iMCAwIDE5MiAxNDIiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjwhLS0KU291cmNlIFVSTDogaG9sZGVyLmpzLzEwMCV4MTAwJQpDcmVhdGVkIHdpdGggSG9sZGVyLmpzIDIuNS4wLgpMZWFybiBtb3JlIGF0IGh0dHA6Ly9ob2xkZXJqcy5jb20KKGMpIDIwMTItMjAxNSBJdmFuIE1hbG9waW5za3kgLSBodHRwOi8vaW1za3kuY28KLS0+PGRlZnMvPjxyZWN0IHdpZHRoPSIxOTIiIGhlaWdodD0iMTQyIiBmaWxsPSIjRUVFRUVFIi8+PGc+PHRleHQgeD0iNzAuMDQ2ODc1IiB5PSI3MSIgc3R5bGU9ImZpbGw6I0FBQUFBQTtmb250LXdlaWdodDpib2xkO2ZvbnQtZmFtaWx5OkFyaWFsLCBIZWx2ZXRpY2EsIE9wZW4gU2Fucywgc2Fucy1zZXJpZiwgbW9ub3NwYWNlO2ZvbnQtc2l6ZToxMHB0O2RvbWluYW50LWJhc2VsaW5lOmNlbnRyYWwiPjE5MngxNDI8L3RleHQ+PC9nPjwvc3ZnPg==" data-holder-rendered="true" style="height: 100%; width: 100%; display: block;">
                                            </div>
                                            <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px;"></div>
                                            <div>
                                                <span class="btn btn-secondary btn-file"><span class="fileinput-new">Select image</span><span class="fileinput-exists">변경</span><input type="file" name="save"></span>
                                                <a href="#" class="btn btn-secondary fileinput-exists" data-dismiss="fileinput">제거</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </fieldset>
                            <div class="form-actions">
                                <div class="row">
                                    <div class="col-md-offset-4 col-md-7">
                                        <button type="submit" class="btn btn-primary">가입</button>
                                        <s:a href="index"><button type="button" class="btn btn-inverse">취소</button></s:a>
                                    </div>
                                </div>
                            </div>
                        </form>
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
<script src="../vendor/jquery/dist/jquery.min.js"></script>
<script src="../vendor/jquery-pjax/jquery.pjax.js"></script>
<script src="../vendor/tether/dist/js/tether.js"></script>
<script src="../vendor/bootstrap/js/dist/util.js"></script>
<script src="../vendor/bootstrap/js/dist/collapse.js"></script>
<script src="../vendor/bootstrap/js/dist/dropdown.js"></script>
<script src="../vendor/bootstrap/js/dist/button.js"></script>
<script src="../vendor/bootstrap/js/dist/tooltip.js"></script>
<script src="../vendor/bootstrap/js/dist/alert.js"></script>
<script src="../vendor/slimScroll/jquery.slimscroll.min.js"></script>
<script src="../vendor/widgster/widgster.js"></script>
<script src="../vendor/pace.js/pace.js" data-pace-options='{ "target": ".content-wrap", "ghostTime": 1000 }'></script>
<script src="../vendor/jquery-touchswipe/jquery.touchSwipe.js"></script>
<script src="../js/bootstrap-fix/button.js"></script>

<!-- common app js -->
<script src="../js/settings.js"></script>
<script src="../js/app.js"></script>

<!-- page specific libs -->
<script src="../vendor/bootstrap/js/dist/modal.js"></script>
<script src="../vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
<script src="../vendor/jquery-autosize/jquery.autosize.min.js"></script>
<script src="../vendor/bootstrap3-wysihtml5/lib/js/wysihtml5-0.3.0.min.js"></script>
<script src="../vendor/bootstrap3-wysihtml5/src/bootstrap3-wysihtml5.js"></script>
<script src="../vendor/select2/select2.min.js"></script>
<script src="../vendor/switchery/dist/switchery.min.js"></script>
<script src="../vendor/moment/min/moment.min.js"></script>
<script src="../vendor/eonasdan-bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
<script src="../vendor/mjolnic-bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
<script src="../vendor/jasny-bootstrap/js/inputmask.js"></script>
<script src="../vendor/jasny-bootstrap/js/fileinput.js"></script>
<script src="../vendor/holderjs/holder.js"></script>
<script src="../vendor/dropzone/dist/min/dropzone.min.js"></script>
<script src="../vendor/markdown/lib/markdown.js"></script>
<script src="../vendor/bootstrap-markdown/js/bootstrap-markdown.js"></script>
<script src="../vendor/seiyria-bootstrap-slider/dist/bootstrap-slider.min.js"></script>

<!-- page specific js -->
<script src="../js/ui-list-groups.js"></script>
<script src="js/form-elements.js"></script>
</body>
</html>