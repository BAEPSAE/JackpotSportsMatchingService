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
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
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
<style type="text/css">.jqstooltip { position: absolute;left: 0px;top: 0px;visibility: hidden;background: rgb(0, 0, 0) transparent;background-color: rgba(0,0,0,0.6);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000);-ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";color: white;font: 10px arial, san serif;text-align: left;white-space: nowrap;padding: 5px;border: 1px solid white;z-index: 10000;}.jqsfield { color: white;font: 10px arial, san serif;text-align: left;}</style>
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
            <s:a action="../intro">Matching</s:a>
         </header>
         <!-- seems like lots of recent admin template have this feature of user info in the sidebar.
             looks good, so adding it and enhancing with notifications -->
         <div class="sidebar-status hidden-md-up">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown"> <span
               class="thumb-sm avatar pull-xs-right"> <!-- <img class="img-circle" src="demo/img/people/a5.jpg" alt="..."> -->
            </span> <!-- .circle is a pretty cool way to add a bit of beauty to raw data.
                     should be used with bg-* and text-* classes for colors -->
               <span class="circle bg-warning fw-bold text-gray-dark"> </span>
               &nbsp; 우리동내 <strong>골목대장</strong> <b class="caret"></b>
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
                  <li><s:a action="mypagev" namespace="/player">전적/게임 정보</s:a></li>
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
                  <li><s:a action="index_matching" namespace="..">매칭신청</s:a></li>
                  <li><s:a action="Matching" namespace="/player">진행 중</s:a></li>
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
            <li><s:a action="list" namespace="/board"> <span class="icon"> <span
                     class="glyphicon glyphicon-list-alt"></span>
               </span> 자유게시판
            </s:a></li>
            
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
                           <s:property value="#session.user_Name" />
                        </s:if>
                        <s:else>
                           <s:a action="loginv" namespace="/player">로그인하기</s:a>
                        </s:else>
                  </strong>&nbsp; <b class="caret"></b>
               </a> <!-- 드롭다운 -->
                  <ul class="dropdown-menu dropdown-menu-right">
                     <li><s:a class="dropdown-item" action="logout" namespace="/player" ><i
                           class="fa fa-sign-out"></i> &nbsp; Log Out</s:a></li>
                  </ul></li>
            </ul>
         </div>
      </div>
   </nav>

	<div class="content-wrap">
		<main id="content" class="content" role="main">
		<style>
body {
	overflow-x: visible;
}
</style>

		<div class="row">
			<div class="col-lg-4">
                <section class="widget">
                    <header class="bb">
                        <h6>Recent <span class="fw-semi-bold">Chats</span></h6>
                    </header>
                    <div class="widget-body">
                        <div class="widget-middle-overflow">
                            <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 287px;"><ul class="list-group widget-chat-list-group" style="overflow: hidden; width: auto; height: 287px;">
                                <li class="list-group-item">
                                <span class="thumb">
                                    <img class="img-circle" src="demo/img/people/a6.jpg" alt="...">
                                </span>
                                    <time class="time">10 sec ago</time>
                                    <h6 class="sender">Chris Gray</h6>
                                    <p class="body">Hey! What's up? So much time since we saw each other there</p>
                                </li>
                                <li class="list-group-item on-right">
                                <span class="thumb">
                                    <img class="img-circle" src="img/avatar.png" alt="...">
                                </span>
                                    <time class="time">10 sec ago</time>
                                    <h6 class="sender">John Doe</h6>
                                    <p class="body">True! Totally makes sense. But how do we find that?</p>
                                </li>
                                <li class="list-group-item">
                                <span class="thumb">
                                    <img class="img-circle" src="demo/img/people/a6.jpg" alt="...">
                                </span>
                                    <time class="time">10 sec ago</time>
                                    <h6 class="sender">Chris Gray</h6>
                                    <p class="body">OK, but so now what? What should we do now? Not sure actually.</p>
                                </li>
                                <li class="list-group-item on-right">
                                <span class="thumb">
                                    <img class="img-circle" src="img/avatar.png" alt="...">
                                </span>
                                    <time class="time">10 sec ago</time>
                                    <h6 class="sender">John Doe</h6>
                                    <p class="body">Hey guys, didn't you notice this conversation is sort of jubberish?</p>
                                </li>
                            </ul><div class="slimScrollBar" style="background: rgb(0, 0, 0); width: 4px; position: absolute; top: 0px; opacity: 0.0237734; display: block; border-radius: 1px; z-index: 99; right: 1px; height: 242.262px;"></div><div class="slimScrollRail" style="width: 4px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div></div>
                        </div>
                    </div>
                    <footer class="bg-body-light bt">
                        <div class="input-group input-group-sm">
                            <input type="text" class="form-control" placeholder="Your message">
                            <span class="input-group-btn">
                                <button type="submit" class="btn btn-secondary">
                                    Send
                                </button>
                            </span>
                        </div>
                    </footer>
                </section>
            </div>
		
		</div> <!-- 채팅 로우 -->


		<!-- 챗창-->

		<div class="row">
			<div class="col-lg-10">
				<div class="table-responsive">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>경기장 이름</th>
								<th>위치</th>
								<th>홈페이지 주소</th>
								<th>전화번호</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>새마을</td>
								<td>강동구</td>
								<td><a href="#">www.naver.com</a></td>
								<td><span
									class="label label-pill bg-gray-lighter text-gray">02-444-4444</span></td>
							</tr>
							<tr>
								<td>우리집</td>
								<td>삼성동</td>
								<td><a href="#">sebank.com</a></td>
								<td><span
									class="label label-pill bg-gray-lighter text-gray-light">02-777-7777</span></td>
							</tr>
							<tr>
								<td>우리집</td>
								<td>삼성동</td>
								<td><a href="#">sebank.com</a></td>
								<td><span
									class="label label-pill bg-gray-lighter text-gray-light">02-777-7777</span></td>
							</tr>
							<tr>
								<td>우리집</td>
								<td>삼성동</td>
								<td><a href="#">sebank.com</a></td>
								<td><span
									class="label label-pill bg-gray-lighter text-gray-light">02-777-7777</span></td>
							</tr>
							<tr>
								<td>우리집</td>
								<td>삼성동</td>
								<td><a href="#">sebank.com</a></td>
								<td><span
									class="label label-pill bg-gray-lighter text-gray-light">02-777-7777</span></td>
							</tr>
							<tr>
								<td>우리집</td>
								<td>삼성동</td>
								<td><a href="#">sebank.com</a></td>
								<td><span
									class="label label-pill bg-gray-lighter text-gray-light">02-777-7777</span></td>
							</tr>
							<tr>
								<td>우리집</td>
								<td>삼성동</td>
								<td><a href="#">sebank.com</a></td>
								<td><span
									class="label label-pill bg-gray-lighter text-gray-light">02-777-7777</span></td>
							</tr>
							<tr>
								<td>우리집</td>
								<td>삼성동</td>
								<td><a href="#">sebank.com</a></td>
								<td><span
									class="label label-pill bg-gray-lighter text-gray-light">02-777-7777</span></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<button type="button" class="btn btn-primary btn-lg mb-xs"
				style="float: right;">Large button</button>
			<br> <br> <br>
			<button type="button" class="btn btn-secondary btn-lg mb-xs"
				style="float: right;">Large button</button>
		</div>
		<!-- row --> <!-- 경기장 리스트 --> </main>
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
	<script src="vendor/pace.js/pace.js"
		data-pace-options='{ "target": ".content-wrap", "ghostTime": 1000 }'></script>
	<script src="vendor/jquery-touchswipe/jquery.touchSwipe.js"></script>
	<script src="js/bootstrap-fix/button.js"></script>

	<!-- common app js -->
	<script src="js/settings.js"></script>
	<script src="js/app.js"></script>

	<!-- page specific libs -->
	<script src="vendor/jquery-ui/ui/core.js"></script>
	<script src="vendor/jquery-ui/ui/widget.js"></script>
	<script src="vendor/jquery-ui/ui/mouse.js"></script>
	<script src="vendor/jquery-ui/ui/sortable.js"></script>
	<script src="vendor/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>
	<script src="vendor/jquery.nestable/jquery.nestable.js"></script>
	<script src="vendor/underscore/underscore.js"></script>
	<script src="vendor/jquery.sparkline/index.js"></script>
	<script src="vendor/d3/d3.min.js"></script>
	<script src="vendor/rickshaw/rickshaw.min.js"></script>
	<script src="vendor/raphael/raphael-min.js"></script>
	<script src="vendor/jQuery-Mapael/js/jquery.mapael.js"></script>
	<script src="vendor/jQuery-Mapael/js/maps/usa_states.js"></script>
	<script src="vendor/jQuery-Mapael/js/maps/world_countries.js"></script>
	<script src="vendor/flot/jquery.flot.js"></script>
	<script src="vendor/MetroJS/release/MetroJs.Full/MetroJs.js"></script>
	<script src="vendor/skycons/skycons.js"></script>
	
	<!-- page specific js -->
	<script src="js/ui-list-groups.js"></script>
	<script src="demo/js/_fake-world-data.js"></script>
	<script src="js/widgets.js"></script>
	<div data-tether-id="1" style="top: 0px; left: 0px; position: absolute;"></div>
</body>
</html>