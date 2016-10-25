<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sing - List Groups</title>
    <link href="../css/application.min.css" rel="stylesheet">
    <link rel="shortcut icon" href="../img/favicon.png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <script src="../js/jquery-3.1.1.min.js" type="text/javascript"></script>
    <script>
    	//팀의 매너점수 가져오기
   		
   		//막대 그래프 함수
   		function viewGraph(){
       		$('.column').css('height','0');
	       		$('table tr').each(function(index) {
	       		var ha = $(this).children('td').eq(1).text();
	       		$('#col'+index).animate({height: ha}, 1500).html("<div>"+ha+"</div>");
	       		});
       		}
   		$(document).ready(function() {
   			viewGraph();
   		});
    </script>
    
    <style type="text/css">
   		#contenitore{
		position: relative;
		width: 800px;
		margin: 20px auto;
		text-align:center;
		overflow:hidden;
		font: 14px 'Trebuchet MS', sans serif;
		}
		.left{
		float:left;
		width:48%;
		}
		#grafico{
		position:relative;
		height:300px;
		border-bottom: 1px solid #cdcdcd;
		width: 85%;
		margin-left: 10%;
		text-align: center;
		}
		.riga{
		position:absolute;
		left:0;
		height: 1px;
		background-color:#cdcdcd;
		width: 100%;
		text-align: center;
		margin-bottom: 20px;
		}
		.riga div{
		float:left;
		margin: -8px 0 0 -40px;
		}
		.canc{
		clear:both;
		}
		.column{
		position:absolute;
		width: 16%;
		bottom: 0;
		background-color: #003366;
		margin-left:5%;
		}
		div.button {
		    margin: 0 auto;
		    text-align: center;
		    width: 100px;
		    background-color:#003366;
		    border: 1px solid #003366;
		    border-radius: 5px;
		    padding: 8px;
		    color: #E1E2CF;
		    cursor: pointer;
		}
		.column div{
		margin-top:-20px;
		height:20px;
		}
		    	
    </style>
    
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
                    <img class="img-circle" src="../demo/img/people/a5.jpg" alt="...">
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
                    <li><s:a action="mypagev" namespace="/player">전적 보기</s:a></li>
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
                            <img class="img-circle" src="../demo/img/people/a5.jpg" alt="...">
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
                                        <img class="img-circle" src="../css/images/logo.jpg" alt="...">
                                    </span><br><br>
                                    <h5 class="fw-normal" style="text-align: center; margin-left: -5.8%;"><s:property value="%{player.user_Id}"/><span class="fw-semi-bold" id="user_Id"></span></h5>
                                    <%-- <p style="text-align: center; margin-left: -5%;" id="team_Name">[<s:property value="%{player.user_Id}"/>]</p> --%>
                                    <ul class="contacts" style="margin-left: -5%;">
                                        <li><i class="fa fa-phone fa-fw mr-xs"></i><a href="#" id="user_Phone"><s:property value="%{player.user_Phone}"/></a></li><br>
                                        <li><i class="fa fa-map-marker fa-fw mr-xs"></i><a href="#" id="user_Location"><s:property value="%{player.user_Location}"/></a></li>
                                    </ul>
                                </div>
                            <div class="col-md-7" style="margin-left: -1%;">
                                <div class="stats-row stats-row-profile mt text-xs-right">
                                    <div class="stat-item">
                                        <p class="value text-xs-right" id="win"><s:property value="%{aver}"/>%</p>
                                        <h6 class="name">평균 승률</h6>
                                    </div>
                                    <div class="stat-item">
                                        <p class="value text-xs-right" id="manner">TODO</p>
                                        <h6 class="name">매너점수</h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div><!-- <div class="col-lg-6"> --><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	            <div class="col-lg-6 col-xl-5" style="float: left;">
	                <section class="widget">
                    	<div class="widget-body">
                        	<br><h3 style="text-align: center;">종목별 <span class="fw-semi-bold">승률</span></h3><br>
                        	<!-- 승률 그래프 -->
								<div style="margin-left: 30%;">
									<table class="table" style="width: 60%;">
										<tbody style="font-size: 15px;">
										<tr><td>축구</td><td id="winSC"><s:property value="%{winSC}"/>%</td><td style="background-color:#64bd63">&nbsp;</td></tr>
										<tr><td>야구</td><td id="winBS"><s:property value="%{winBS}"/>%</td><td style="background-color:#f0b518">&nbsp;</td></tr>
										<tr><td>탁구</td><td id="winTB"><s:property value="%{winTB}"/>%</td><td style="background-color:#dd5826">&nbsp;</td></tr>
										<tr><td>볼링</td><td id="winBW"><s:property value="%{winBW}"/>%</td><td style="background-color:#5d8fc2">&nbsp;</td></tr>
										</tbody>
									</table>
									<!-- <div class="button" onclick="viewGraph()">Rerun</div> --><!-- return button -->
								</div>
								<div style="margin-left: 10%; width: 80%;">
									<div id="grafico" style="font-size: 18px;">
										<!-- 눈금선 -->
										<div class="riga" style="top:25%"><div>75%</div></div>
										<div class="riga" style="top:50%"><div>50%</div></div>
										<div class="riga" style="top:75%"><div>25%</div></div>
										<!-- 그래프 -->
										<div id="col0" style="left:0; background-color:#64bd63;" class="column"></div>
										<div id="col1" style="left:25%; background-color:#f0b518;" class="column"></div>
										<div id="col2" style="left:50%; background-color:#dd5826;" class="column"></div>
										<div id="col3" style="left:75%; background-color:#5d8fc2;" class="column"></div>
									</div>
								</div>
                    	</div>
	                </section>
	            </div>
	            <div class="col-lg-6 col-xl-5" style="position: relative;">
                <!--  -->
                <div class="col-lg-12">
                <section class="widget">
                    <div class="widget-body">
                    <br><h3 style="text-align: center;">승률이 좋았던 <span class="fw-semi-bold">경기장</span></h3><br>
                        <table class="table" id="listOfGrounds" style="border-top-color: white;">
                            <tr>
	                            <th class="hidden-sm-down" style="text-align: center; font-size: 15px;">스포츠</th>
	                            <th class="hidden-sm-down" style="text-align: center; font-size: 15px;">경기장 이름</th>
	                            <th class="hidden-sm-down" style="text-align: center; font-size: 15px;">경기장 주소</th>
	                            <th class="hidden-sm-down" style="text-align: center; font-size: 15px;">경기장 연락처</th>
	                            <th class="hidden-sm-down" style="text-align: center; font-size: 15px;">보유 경기장</th>
                            </tr>
                            <tbody style="text-align: center; font-size: 18px;">
                            <!-- 축구 -->
                            <tr>
                                <td><button class="btn btn-success width-100 mb-xs" role="button">축구</button></td>
                                <td class="hidden-sm-down text-semi-muted" id="ground_Name_sc"><s:property value="%{SCGrounds.ground_Name}"/></td>
                                <td class="hidden-sm-down text-semi-muted" id="ground_Address_sc"><s:property value="%{SCGrounds.ground_Address}"/></td>
                                <td class="hidden-sm-down text-semi-muted" id="ground_Phone_sc"><s:property value="%{SCGrounds.ground_Phone}"/></td>
                                <td class="hidden-sm-down text-semi-muted" id="ground_Own_sc"><s:property value="%{SCGrounds.ground_Own}"/></td>
                            </tr>
                            
                            <!-- 야구 -->
                            <tr>
                                <td><button class="btn btn-warning width-100 mb-xs" role="button">야구</button></td>
                                <td class="hidden-sm-down text-semi-muted" id="ground_Name_bb"><s:property value="%{BSGrounds.ground_Name}"/></td>
                                <td class="hidden-sm-down text-semi-muted" id="ground_Address_bb"><s:property value="%{BSGrounds.ground_Address}"/></td>
                                <td class="hidden-sm-down text-semi-muted" id="ground_Phone_bb"><s:property value="%{BSGrounds.ground_Phone}"/></td>
                                <td class="hidden-sm-down text-semi-muted" id="ground_Own_bb"><s:property value="%{BSGrounds.ground_Own}"/></td>
                            </tr>
                            
                            <!-- 탁구 -->
                            <tr>
                                <td><button class="btn btn-danger width-100 mb-xs" role="button">탁구</button></td>
                                <td class="hidden-sm-down text-semi-muted" id="ground_Name_tb"><s:property value="%{TBGrounds.ground_Name}"/></td>
                                <td class="hidden-sm-down text-semi-muted" id="ground_Address_tb"><s:property value="%{TBGrounds.ground_Address}"/></td>
                                <td class="hidden-sm-down text-semi-muted" id="ground_Phone_tb"><s:property value="%{TBGrounds.ground_Phone}"/></td>
                                <td class="hidden-sm-down text-semi-muted" id="ground_Own_tb"><s:property value="%{TBGrounds.ground_Own}"/></td>
                            </tr>
                            
                            <!-- 볼링 -->
                            <tr>
                                <td><button class="btn btn-primary width-100 mb-xs" role="button">볼링</button></td>
                                <td class="hidden-sm-down text-semi-muted" id="ground_Name_bw"><s:property value="%{BWGrounds.ground_Name}"/></td>
                                <td class="hidden-sm-down text-semi-muted" id="ground_Address_bw"><s:property value="%{BWGrounds.ground_Address}"/></td>
                                <td class="hidden-sm-down text-semi-muted" id="ground_Phone_bw"><s:property value="%{BWGrounds.ground_Phone}"/></td>
                                <td class="hidden-sm-down text-semi-muted" id="ground_Own_bw"><s:property value="%{BWGrounds.ground_Own}"/></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </section>
            	</div>
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
<script src="../vendor/jquery.sparkline/index.js"></script>
<script src="../vendor/d3/d3.min.js"></script>
<script src="../vendor/rickshaw/rickshaw.min.js"></script>
<script src="../vendor/raphael/raphael-min.js"></script>
<script src="../vendor/flot.animator/jquery.flot.animator.min.js"></script>
<script src="../vendor/flot/jquery.flot.js"></script>
<script src="../vendor/flot-orderBars/js/jquery.flot.orderBars.js"></script>
<script src="../vendor/flot/jquery.flot.selection.js"></script>
<script src="../vendor/flot/jquery.flot.time.js"></script>

<script src="../vendor/nvd3/build/nv.d3.min.js"></script>
<script src="../vendor/morris.js/morris.min.js"></script>
<script src="../vendor/jquery.easy-pie-chart/dist/jquery.easypiechart.min.js"></script>

<!-- page specific js -->
<%-- <script src="../js/charts.js"></script> --%>

</body>
</html>