<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
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

    <script src="../js/jquery-3.1.1.min.js"></script>
    
    <style type="text/css">
    /* 데이터 테이블에서 ID, 팀리더, 전적 감춤 */
    #datatable-table tr > *:nth-child(2) {
    display: none;
	}
	#datatable-table tr > *:nth-child(4) {
    display: none;
	}
	#datatable-table tr > *:nth-child(5) {
    display: none;
	}
    </style>
    
	<script type="text/javascript">
		$(document).ready(function() {
			$('#searchbtn').click(function() {
				
				var teamname = $('#search-input').val();
				$.ajax({
					url:'t_search',
					data: {'team.team_Name':teamname},
					method: 'post',
					success: function(resp) {
						$('#teamlistbody').empty();
						var tlist = resp.teamlist;
						$.each(tlist, function(index) {
							var lose = tlist[index].team_TotalGame - tlist[index].team_WinGame - tlist[index].team_Draw;
							var flag = '<button class="btn btn-success width-100 mb-xs" role="button">팀 참가</button>';
							if(tlist[index].team_Open == false){
								flag = '<button class="btn btn-gray width-100 mb-xs" role="button" disabled="disabled">참가 불가</button>';
							}else if(tlist[index].team_Id == resp.player.team1){
								if(resp.player.team1_Flag == '0'){
									flag = '<button class="btn btn-warning width-100 mb-xs" role="button" disabled="disabled">참가 요청중</button>';
								}
								if(resp.player.team1_Flag == '1'){
									flag = '<button class="btn btn-danger width-100 mb-xs" role="button" disabled="disabled">우리팀</button>';
								}
							}else if(tlist[index].team_Id == resp.player.team2){
								if(resp.player.team2_Flag == '0'){
									flag = '<button class="btn btn-warning width-100 mb-xs" role="button" disabled="disabled">참가 요청중</button>';
								}
								if(resp.player.team2_Flag == '1'){
									flag = '<button class="btn btn-danger width-100 mb-xs" role="button" disabled="disabled">우리팀</button>';
								}
							}
							$('#teamlistbody').append('<tr><td>' + tlist[index].team_GameType +'</td><td>'+tlist[index].team_Id+'</td><td><span class="fw-semi-bold">'+tlist[index].team_Name+'</span></td><td><span class="fw-semi-bold">'+tlist[index].team_Leader+'</span></td><td class="hidden-sm-down">'+tlist[index].team_TotalGame + '전 - ' + tlist[index].team_WinGame+'승 '+ tlist[index].team_Draw + "무 "+ lose + "패 " +'</td><td class="hidden-sm-down">'+tlist[index].team_Score+'</td><td class="width-150">'+flag+'</td></tr>')
						});
					}, error: function() {
						/* alert("2323"); */
					}
				});
			});
			$('#teamlistbody').on('click', 'button', function(index) {
				var here=$(this);

				$.confirm({
		            'title'         : '정말로 참가하시겠습니까?　　같은종목 팀에 가입된 경우 이전팀에서 자동탈퇴되며,　　　　 같은종목의 팀에 참가신청한 경우 마지막팀에만 전달됩니다.',
		            'acceptTitle'   : '예!',
		            'rejectTitle'	: '아니오!',
		            'acceptAction'  : function() {
						var game_type=here.parent().parent().children().first().text();
						var teamId=here.parent().parent().children().first().next().text();
						if(game_type == "축구"){
							$.ajax({
								url: 't_joinApply'
								, method: 'post'
								, data: {
									"player.team1" : teamId
								}
								, success: function(response) {
									
									$('#searchbtn').trigger('click');
								}
								, error: function(request, status, error) {
									
									$('#searchbtn').trigger('click');
								}
							}); //$ajax
						}else{
							$.ajax({
								url: 't_joinApply'
								, method: 'post'
								, data: {
									"player.team2" : teamId
								}
								, success: function(response) {
									
									$('#searchbtn').trigger('click');
								}
								, error: function(request, status, error) {
									
									$('#searchbtn').trigger('click');
								}
							}); //$ajax
						}
					}
		        });
				
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
    <main class="content" role="main">
		<h1 class="page-title">
			팀 <span class="fw-semi-bold">찾기</span>
		</h1>
		<section class="widget">
			<header>
				<h4>
					<span class="fw-semi-bold"></span>
					
				</h4>
				<div class="input-group">
				
					<input class="form-control" id="search-input" type="search"
						placeholder="팀명으로 검색"> <span class="input-group-btn">
						<button class="btn btn-secondary" id="searchbtn" type="button">Search</button>
					</span>
				</div>

			</header>
			<!-- <div class="widget-body">
                <p>
                    Editable, validatable, filterable and sortable table made with
                    <a href="http://backgridjs.com/" target="_blank">Backgrid.js</a>
                </p>
                <div id="table-dynamic"></div>
            </div> -->
		</section>
		<section class="widget">
			<header>
				<div class="widget-controls">
					<a data-widgster="expand" title="Expand" href="#"><i
						class="glyphicon glyphicon-chevron-up"></i></a> <a
						data-widgster="collapse" title="Collapse" href="#"><i
						class="glyphicon glyphicon-chevron-down"></i></a> <a
						data-widgster="close" title="Close" href="#"><i
						class="glyphicon glyphicon-remove"></i></a>
				</div>
			</header>
			<div class="widget-body">
				<div class="mt">
					<table id="datatable-table" class="table table-striped table-hover" style="text-align: center;">
						<thead>
							<tr align="center">
								<th width="50" align="center">종목</th>
								<th>Id</th>
								<th width="180" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									팀명</th>
								<th class="no-sort hidden-sm-down">팀 리더</th>
								<th class="hidden-sm-down">전적</th>
								<th class="hidden-sm-down" width="50" align="center">승점</th>
								<th class="no-sort" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									팀 참가</th>
							</tr>
						</thead>
						<tbody id="teamlistbody">
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

<!-- page specific libs -->
<script src="../vendor/jquery-ui/ui/core.js"></script>
<script src="../vendor/jquery-ui/ui/widget.js"></script>
<script src="../vendor/jquery-ui/ui/mouse.js"></script>
<script src="../vendor/jquery-ui/ui/sortable.js"></script>
<script src="../vendor/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>
<script src="../vendor/jquery.nestable/jquery.nestable.js"></script>

<!-- page specific js -->
<script src="../js/ui-list-groups.js"></script>
<script src="../js/jquery.confirm.js"></script>
</body>
</html>