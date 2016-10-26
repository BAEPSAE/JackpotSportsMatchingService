<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>SportsMatchingSystem</title>
    <link href="css/cu/style.css" rel="stylesheet">
    <link href="css/application.min.css" rel="stylesheet">
    <link rel="shortcut icon" href="img/favicon.png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="icon" href="images/favicon.ico">
    <link rel="shortcut icon" href="images/favicon.ico" />
    <script src="js/jquery-3.1.1.min.js" type="text/javascript"></script>
    <script>
	    $(document).ready(function(){
	      $( ".block1" ).mouseover(function() {
	        $(this).addClass( "blur" );
	      });
	      $( ".block1" ).mouseout(function() {
	        $(this).removeClass( "blur" );
	      });
	      $().UItoTop({ easingType: 'easeOutQuart' });
	      
	      
	      $('#timetab input[type="radio"]').on('click', function(){
	    	  $(this).removeAttr('checked');
	    	  $(this).attr('checked', true);
	      })
	      
	      
	      
	    }) 
    </script>
    <style type="text/css">
    	#timetab div{
    		margin: 0 auto;
    		float: left;
    	}
    
    </style>
</head>
<body>
<!-- 왼쪽 사이드 바 -->
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
               <ul id="sidebar-ui" class="collapse in">
                  <li><s:a action="../player/mypagev.action">신고(아직 없음)</s:a></li>
               </ul></li>
            <li><a class="collapsed" href="#sidebar-maps"
               data-toggle="collapse" data-parent="#sidebar"> <span
                  class="icon"> <i class="fa fa-users"></i>
               </span> TEAM <i class="toggle fa fa-angle-down"></i>
            </a>
               <ul id="sidebar-maps" class="collapse">
                  <!-- data-no-pjax turns off pjax loading for this link. Use in case of complicated js loading on the
                         target page -->
                  <li><s:a action="teamPage" namespace="/team">팀 관리</s:a></li>
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
                  <li><a href="../matching/gamepage">진행 중</a></li>
                  <li><a href="tables_dynamic.html">지난 매칭(아직없음)</a></li>
               </ul>
            </li>
            <li><a href="../Ranking.action"> <span class="icon">
                     <span class="glyphicon glyphicon-star"></span>
               </span> Ranking
            </a></li>
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
            <a class="navbar-brand hidden-md-up" href="index.html"> <i
               class="fa fa-circle text-gray mr-n-sm"></i> <i
               class="fa fa-circle text-warning"></i> &nbsp; 골목대장 &nbsp; <i
               class="fa fa-circle text-warning mr-n-sm"></i> <i
               class="fa fa-circle text-gray"></i>
            </a>
         </div>
         <!-- this part is hidden for xs screens -->
         <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav pull-xs-right">
               <li class="dropdown nav-item"><a href="#"
                  class="dropdown-toggle dropdown-toggle-notifications nav-link"
                  id="notifications-dropdown-toggle" data-toggle="dropdown">
                     &nbsp; <strong> <s:if test="#session.user_Id != null">
                           <span class="thumb-sm avatar pull-xs-left"> <img
                              id="picture" class="img-circle" src="../img/" alt="...">
                           </span>
                           <s:property value="#session.user_Name" />
                        </s:if>
                        <s:else>
                           <s:a action="../player/loginv">로그인하기</s:a>
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
                     <li><a class="dropdown-item" href="profile.html"><i
                           class="glyphicon glyphicon-user"></i> &nbsp; Join</a></li>
                     <li><s:a class="dropdown-item" action="logout" namespace="player" ><i
                           class="fa fa-sign-out"></i> &nbsp; Log Out</s:a></li>
                  </ul></li>
            </ul>
         </div>
      </div>
   </nav>
<!-- 매칭 메인 페이지 -->margin: 0 auto;
<div class="content-wrap">
    <main id="content" class="content" role="main">
        <div class="row">
	        <div class="col-lg-12">
				<a href="#" class="block1">
  				<img src="images/2.jpg" style="width: 100%;">
  				<span class="price"><span></span><span><small></small> SOCCER</span><strong></strong></span>
				</a>
			</div>
            <div class="col-lg-12">
                <div class="panel-group mb-lg" id="accordion" data-toggle="collapse">
                    <div class="panel panel-default">
                        <div class="panel-heading collapsed" style="text-align: center;">
                            <h6 class="panel-title">
                                <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                    <span class="label label-pill label-danger">01</span><span> 날짜 선택</span>
                                    <i class="fa fa-angle-down pull-xs-right"></i>
                                </a>
                            </h6>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse">
                            <div class="panel-body">
                               <!-- 날짜 선택 입력 -->
                            </div>
                        </div>
                    </div>
                    <!-- 시간 선택 입력 -->
                    <div class="panel panel-default">
                        <div class="panel-heading" style="text-align: center;">
                            <h6 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                                    <span class="label label-pill label-warning">02</span><span> 시간 선택</span>
                                    <i class="fa fa-angle-down pull-xs-right"></i>
                                </a>
                            </h6>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse in">
                            <div class="panel-body" id="timetab">
								                            
                            	<div id=timelabel>
                            	<!-- 시간 선택지 -->
                            	<br>
                            		<input type=radio>6:00~9:00<br>
                            		<input type=radio>9:00~12:00<br>
                            		<input type=radio>12:00~15:00<br>
                            		<input type=radio>15:00~18:00<br>
                            		<input type=radio>18:00~21:00
                            	
                            	</div>
                            	<div id=timeimg>
                            	<!-- 시간 그림 -->
                            		<img src="time.png">
                            	</div>
                                                        
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading" style="text-align: center;">
                            <h6 class="panel-title">
                                <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
                                    <span class="label label-pill label-success">03</span><span> 장소 유무</span>
                                    <i class="fa fa-angle-down pull-xs-right"></i>
                                </a>
                            </h6>
                        </div>
                        <div id="collapseThree" class="panel-collapse collapse">
                            <div class="panel-body">
                                Why don't use Lore Ipsum? I think if some one says don't use lore ipsum it's very controversial point. I think the opposite actually.
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading" style="text-align: center;">
                            <h6 class="panel-title">
                                <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
                                    <span class="label label-pill label-info">04</span><span> 희망 장소</span>
                                    <i class="fa fa-angle-down pull-xs-right"></i>
                                </a>
                            </h6>
                        </div>
                        <div id="collapseThree" class="panel-collapse collapse">
                            <div class="panel-body">
                                Why don't use Lore Ipsum? I think if some one says don't use lore ipsum it's very controversial point. I think the opposite actually.
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- Matching_option -->
            <div class="col-lg-12">
            	<button type="button" class="btn btn-warning btn-block" id="matching">MATCHING!</button>
            </div>
        </div><!-- row -->
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
<script src="js/bootstrap-fix/collapse.js"></script>
<script src="js/ui-tabs-accordion.js"></script>

<!-- page specific libs -->
<script src="vendor/bootstrap/js/dist/tab.js"></script>
<!-- page specific js -->
</body>
</html>