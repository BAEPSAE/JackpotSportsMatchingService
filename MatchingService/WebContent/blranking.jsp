<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
    <title>골목대장 - 랭킹</title>
    <link href="../css/application.min.css" rel="stylesheet">
    <link rel="shortcut icon" href="../img/favicon.png">
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
    <!-- main page content. the place to put widgets in. usually consists of .row > .col-lg-* > .widget.  -->
    <main id="content" class="content" role="main">
        
        <h1 class="page-title">랭킹확인 - <span class="fw-semi-bold">볼링</span></h1>
        
        <section class="widget">
            <div class="widget-body">
                <p>
                   	 관심있는 지역, 종목의 현재순위를 확인해보세요.
                </p>
                <div class="mt">
                    <table class="table table-striped table-hover">
	                    
	                	<div class="btn-group">
	                    <a href="#" data-toggle="dropdown" class="btn dropdown-toggle btn-secondary">
	                        	지역선택<span class="caret"></span>
	                    </a>
	                    <ul class="dropdown-menu">
		                    <li><a class="dropdown-item" href="ppranking" >서울시</a></li>
	                        <li><a class="dropdown-item" href="ppranksearch?player.user_Location=강남구" >강남구</a></li>
	                        <li><a class="dropdown-item" href="ppranksearch?player.user_Location=강동구">강동구</a></li>
	                        <li><a class="dropdown-item" href="ppranksearch?player.user_Location=강북구">강북구</a></li>
	                        <li><a class="dropdown-item" href="ppranksearch?player.user_Location=강서구">강서구</a></li>
	                        <li><a class="dropdown-item" href="ppranksearch?player.user_Location=관악구">관악구</a></li>
	                        <li><a class="dropdown-item" href="ppranksearch?player.user_Location=광진구">광진구</a></li>
	                        <li><a class="dropdown-item" href="ppranksearch?player.user_Location=구로구">구로구</a></li>
	                        <li><a class="dropdown-item" href="ppranksearch?player.user_Location=금천구">금천구</a></li>
	                        <li><a class="dropdown-item" href="ppranksearch?player.user_Location=노원구">노원구</a></li>
	                        <li><a class="dropdown-item" href="ppranksearch?player.user_Location=도봉구">도봉구</a></li>
	                        <li><a class="dropdown-item" href="ppranksearch?player.user_Location=동대문구">동대문구</a></li>
	                        <li><a class="dropdown-item" href="ppranksearch?player.user_Location=동작구">동작구</a></li>
	                        <li><a class="dropdown-item" href="ppranksearch?player.user_Location=마포구">마포구</a></li>
	                        <li><a class="dropdown-item" href="ppranksearch?player.user_Location=서대문구">서대문구</a></li>
	                        <li><a class="dropdown-item" href="ppranksearch?player.user_Location=성동구">성동구</a></li>
	                        <li><a class="dropdown-item" href="ppranksearch?player.user_Location=성북구">성북구</a></li>
	                        <li><a class="dropdown-item" href="ppranksearch?player.user_Location=송파구">송파구</a></li>
	                        <li><a class="dropdown-item" href="ppranksearch?player.user_Location=양천구">양천구</a></li>
	                        <li><a class="dropdown-item" href="ppranksearch?player.user_Location=영등포구">영등포구</a></li>
	                        <li><a class="dropdown-item" href="ppranksearch?player.user_Location=용산구">용산구</a></li>
	                        <li><a class="dropdown-item" href="ppranksearch?player.user_Location=은평구">은평구</a></li>
	                        <li><a class="dropdown-item" href="ppranksearch?player.user_Location=중량구">중랑구</a></li>
	                    </ul>
	                	</div>
                        <thead>
                        <tr>
                            <th>순위</th>
                            <th>이름</th>
                            <th class="no-sort hidden-sm-down">정보</th>
                            <th class="hidden-sm-down">지역</th>
                            <th class="hidden-sm-down">매너점수</th>
                            <th class="no-sort">승점</th>
                        </tr>
                        </thead>
                        <tbody>
	                        <s:iterator value="playerlist" status="row">
	                        
	                        	<tr>
	                        	<s:if test="user_Id == #session.user_Id">
	                        		<td style="background-color: gray; color: white;"><s:property value="#row.index+1" /></td>
		                            <td style="background-color: gray; color: white;"><span class="fw-semi-bold"><s:property value="user_Name" /></span></td>
		                            <td class="hidden-sm-down" style="background-color: gray; color: white;">
		                                <small>
		                                    <span class="fw-semi-bold">성별:</span>
		                                    &nbsp; 남
		                                </small>
		                            </td>
		                            <td class="hidden-sm-down" style="background-color: gray; color: white;"><s:property value="user_Location" /></td>
		                            <td class="hidden-sm-down" style="background-color: gray; color: white;"><s:property value="user_Manner" /></td>
		                            <td class="hidden-sm-down" style="background-color: gray; color: white;"><s:property value="pp_Score" /></td>
		                            </tr>
	                        	</s:if>
	                        	<s:else>
	                        	<tr>
		                            <td><s:property value="#row.index+1" /></td>
		                            <td><span class="fw-semi-bold"><s:property value="user_Name" /></span></td>
		                            <td class="hidden-sm-down">
		                                <small>
		                                    <span class="fw-semi-bold">성별:</span>
		                                    &nbsp; 남
		                                </small>
		                            </td>
		                            <td class="hidden-sm-down"><s:property value="user_Location" /></td>
		                            <td class="hidden-sm-down"><s:property value="user_Manner" /></td>
		                            <td class="hidden-sm-down"><s:property value="pp_Score" /></td>
		                        </tr>
		                        </s:else>
	                        </s:iterator>
                        	
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
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

<!-- page specific js -->
<script src="../js/tables-basic.js"></script>
<script src="../vendor/jquery.sparkline/index.js"></script>

</body>
</html>