<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>골목대장 - 진행중인 매칭</title>
    <link href="../css/application.min.css" rel="stylesheet">
    <link rel="shortcut icon" href="../img/favicon.png">
    <link rel="stylesheet" href="../css/jquery.confirm.css">
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
    <script src="../js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript">
    $(document).ready(function() {
    	
			$('#nowlist').on('click', 'li', function(index) {
	            var hereiam = $(this);
	            var matchingid = hereiam.children().first().val();
	            $.confirm({   
	                  'title'         : '같은 정보로 다시 매칭합니다. 삭제를 원하신다면 : <a id="sa" href="">삭제하기</a>',
	                  'acceptTitle'   : '예!',
	                  'rejectTitle'   : '아니오!',
	                  'acceptAction'  : function() {
	                     $.ajax({
	                     url: 'tobecontinue',
	                     method: 'post',
	                     data: {'matching.matching_Id': matchingid},
	                     success: function(response) {
	                        location.href = "Matching";
	                     }
	                  });
	               }
	                  
	              });
	            $('#sa').click(function() {
	               $.ajax({
	                  url: 'deletematching',
	                  method: 'post',
	                  data: {'matching.matching_Id': matchingid},
	                  success: function(response) {
	                     location.href = "Matching";
	                  }
	               });
	            });
	            
	         });
			
	});
    </script>
    
    
</head>
<body>
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
              <li><s:a action="list" namespace="/board"> <span class="icon"> <span
                     class="glyphicon glyphicon-list-alt"></span>
               </span> 자게
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
                           <span class="thumb-sm avatar pull-xs-left"> <img
                              id="picture" class="img-circle" src="../img/" alt="...">
                           </span>
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
        <ol class="breadcrumb">
            <li>매칭</li>
            <li class="active">진행중인 매칭</li>
        </ol>
        
        <div class="row">
        	<div class="col-xl-4">
                <h1 class="page-title" id="calender-current-date">Calendar - <span class="fw-semi-bold">Events</span></h1>
            	<div class="widget-body no-padding">
                        <ul class="news-list stretchable" id="nowlist">
                         	
                         	<s:iterator value="schedule">
                         	
                            <s:if test="onoff < 0">
	                            
	                            <li><input type="hidden" value="<s:property value="matching_Id" />" name="hidden">
	                                <span class="icon bg-danger text-white">
	                                    <i class="fa fa-star"></i>
	                                </span>
	                                <div class="news-item-info">
	                                    <h5 class="name no-margin mb-xs"><s:property value="game_Type" />매칭 실패</h5>
	                                    <p class="fs-mini">
	                                        	경기날짜: <s:property value="game_Date" /> 
	                                    </p>
	                                    <time class="help-block">매칭시작시간 : <s:property value="matching_Time" /></time>
	                                </div>
	                            </li>
	                            
	                         </s:if>
	                         
	                         <s:else>
	                         
	                            <li><input type="hidden" value="<s:property value="matching_Id" />" name="hidden">
	                                <span class="icon bg-success text-white">
	                                    <i class="fa fa-eye"></i>
	                                </span>
	                                <div class="news-item-info">
	                                    <h5 class="name no-margin mb-xs"><s:property value="game_Type" />상대 매칭중!</h5>
	                                    <p class="fs-mini">
	                                        	경기날짜: <s:property value="game_Date" /> 
	                                    </p>
	                                    <time class="help-block">매칭시작시간 : <s:property value="matching_Time" /></time>
	                                </div>
	                            </li>
	                            
	                         </s:else>
	                            
                           </s:iterator>
                    </div>
            </div>
            <div class="col-lg-3 col-xl-4"><p>　　　</p></div>
            <div class="col-lg-9 col-xl-8">
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
                    </div>
                </section>
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel17" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header no-border">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                <h6 class="modal-title fw-bold mt" id="myModalLabel17">경기정보</h6>
                                <p>이런저런경기내용</p>
                            </div>
                            <div class="modal-footer no-border">
                                <button type="button" class="btn btn-default" data-dismiss="modal">OK</button>
                            </div>
                        </div>
                    </div>
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
<script src="../vendor/jquery-ui/ui/core.js"></script>
<script src="../vendor/jquery-ui/ui/widget.js"></script>
<script src="../vendor/jquery-ui/ui/mouse.js"></script>
<script src="../vendor/jquery-ui/ui/draggable.js"></script>
<script src="../vendor/jquery-ui/ui/resizable.js"></script>
<script src="../vendor/fullcalendar/fullcalendar.js"></script>
<script src="../vendor/bootstrap/js/dist/modal.js"></script>
<!-- page specific js -->
<script src="../js/calendar.js"></script>
<script src="../js/jquery.confirm.js"></script>
</body>
</html>