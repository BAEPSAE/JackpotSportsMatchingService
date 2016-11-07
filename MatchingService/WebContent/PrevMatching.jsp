<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>골목대장 - 지난경기</title>
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
    <script>
        /* yeah we need this empty stylesheet here. It's cool chrome & chromium fix
         chrome fix https://code.google.com/p/chromium/issues/detail?id=167083
         https://code.google.com/p/chromium/issues/detail?id=332189
         */
    </script>
    <script src="../js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript">
    	$(function() {
    		var a = 0; var b = 0; var c = 0; var d = 0; var e = 0;
    		var notdone = '';
    		
    		
    		$.ajax({
				url:'prevgamelist',
				method: 'post',
				success: function(resp) { 
					var prevlist = resp.prevgamelist;
					$.each(prevlist, function(index) {
						alert('<s:property value="#session.user_Id" />');
						var imgflag = '';
						var gametype = '';
						var zoom = '';
						if(prevlist[index].game_Type == '축구'){
							imgflag = '<img class="image" src="../demo/img/pictures/555.jpg">';
							gametype = '축구';
						}else if(prevlist[index].game_Type == '야구'){
							imgflag = '<img class="image" src="../demo/img/pictures/666.jpg">';
							gametype = '야구';
						}else if(prevlist[index].game_Type == '볼링'){
							imgflag = '<img class="image" src="../demo/img/pictures/777.jpg">';
							gametype = '볼링';
						}else if(prevlist[index].game_Type == '탁구'){
							imgflag = '<img class="image" src="../demo/img/pictures/888.jpg">';
							gametype = '탁구';
						}
						var aite = '';
						/* aaa는 세션으로 고쳐야함  개인아이디와 팀아이디로 모두 검사 필요*/
						if(prevlist[index].player1 == '<s:property value="#session.user_Id" />'){
							aite = prevlist[index].player2;
						}else{
							aite = prevlist[index].player1;
						}
						var worl = '';
						if(prevlist[index].winner_Id == '<s:property value="#session.user_Id" />'){
							worl = '승';
							a = a + 1;
							notdone = '';
						}else if(prevlist[index].winner_Id != '<s:property value="#session.user_Id" />' && prevlist[index].winner_Id != null){
		                     worl = '패';
		                     b = b + 1;
		                     notdone = '';
		                  }else if(prevlist[index].game_Draw == 1){
							worl = '무';
							c = c + 1;
							notdone = '';
						}
						if(prevlist[index].winner_Id == null && prevlist[index].game_Draw == null){
		                     worl = '진행중!';
		                     e = e + 1;
		                      notdone = '<span class="label label-pill label-danger fw-normal pull-xs-right">게임이 성사되었습니다!</span><br>';
		                      zoom = '<a class="btn btn-primary btn-info btn-sm" id="zoomin" >자세히보기</a>';
		                  }
						$('#rarara').append('<section class="search-result-item"><a class="image-link">'+imgflag + '</a><div class="search-result-item-body"><div class="row"><div class="col-md-9"><h5 class="search-result-item-heading">경기종목 - ' + gametype + notdone + '</h5><p class="info">'+ '어떤경기장' +'</p><p class="description">'+ '경기날짜 / 시간' +'</p></div><div class="col-md-3 text-xs-center"><p class="value4 mt-sm">'+ worl +'</p><p class="text-muted">상대 : '+ aite +'</p>'+ zoom +'<input type="hidden" value="' + prevlist[index].game_Id +'" name="hidden"></div></div></div></section>')
					});
					$('#rarara').append('<div class="text-xs-center"><ul class="pagination pagination-sm"><li class="page-item disabled"><a class="page-link" href="#">Prev</a></li><li class="page-item active"><a class="page-link" href="#">1</a></li><li class="page-item"><a class="page-link" href="#">2</a></li><li class="page-item"><a class="page-link" href="#">3</a></li><li class="page-item"><a class="page-link" href="#">4</a></li><li class="page-item"><a class="page-link" href="#">5</a></li><li class="page-item"><a class="page-link" href="#">Next</a></li></ul></div>')
					$('#matched').text(e);
					$('#getwins').text(a);
		    		$('#getloses').text(b);
		    		$('#getdraws').text(c);
		    		$('#gettotal').text(a+b+c+e);
				}
    		
			});
    		
    		$('#content').on('click', 'a', function(index) {
				var hereiam = $(this);
				var gameid = hereiam.next().val();
				/* $.ajax({
 					url: '../matching/gamepage',
					method: 'post',
					data: {'games.game_Id': gameid},
					success: function(response) {
						location.href='../matching/gamepage';			
					} 
					
				});*/
				location.href='../matching/gamepage?games.game_Id='+gameid;
			});
		});
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
    <!-- main page content. the place to put widgets in. usually consists of .row > .col-xl-* > .widget.  -->
    <main id="content" class="content" role="main">
        <ol class="breadcrumb">
            <li>매칭</li>
            <li class="active">지난경기</li>
        </ol>
        <h1 class="page-title"> 지난경기 <span class="fw-semi-bold">목록</span></h1>
                        <p class="search-results-count">지난경기 내용을 확인할 수 있습니다.</p>
        
        <div class="clearfix">
            <div class="btn-toolbar">
                <div class="btn-group">
                    <a href="#" data-toggle="dropdown" class="btn dropdown-toggle btn-secondary">
                        	경기종목 <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">축구</a></li>
                        <li><a class="dropdown-item" href="#">야구</a></li>
                        <li><a class="dropdown-item" href="#">볼링</a></li>
                        <li><a class="dropdown-item" href="#">탁구</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xl-3 col-xl-push-9">
                <h5>경기결과 <span class="fw-semi-bold">요약</span></h5>
                
                <ul class="nav nav-pills nav-stacked search-result-categories mt">
                    
                    <li class="nav-item">
                        <a class="nav-link">매치된 경기
                        <span class="label label-pill label-default pull-xs-right" id="matched"></span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link">승리한 경기
                        <span class="label label-pill label-default pull-xs-right" id="getwins"></span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link">패배한 경기
                        <span class="label label-pill label-default pull-xs-right" id="getloses"></span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link">무승부 경기
                        <span class="label label-pill label-default pull-xs-right" id="getdraws"></span>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link">전체 경기수
                        <span class="label label-pill label-default pull-xs-right" id="gettotal"></span>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="col-xl-9 col-xl-pull-3" id="rarara"></div>
        </div>
    </main>
</div>
<div class="loader-wrap hiding hide">
    <i class="fa fa-circle-o-notch fa-spin-fast"></i>
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
<script src="../vendor/jquery-ui/ui/sortable.js"></script>
<script src="../vendor/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>
<script src="../vendor/jquery.nestable/jquery.nestable.js"></script>

<!-- page specific js -->
<script src="../js/ui-list-groups.js"></script>
</body>
</html>