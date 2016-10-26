<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>Sing - List Groups</title>
<link href="../css/application.min.css" rel="stylesheet">
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
<script src="../js/jquery-3.1.1.min.js" type="text/javascript"></script>
<script>
        $(function(){
        	//팀해체
        	 $('#leaderTab #deleteTeam').on('click',function(){
        		$.ajax({
        			url:'t_delete',
        			type:'get'
        		})
        	})
        	
        	//리더주기
        	$('#leaderTab #giveLeader').on('click', function(){
        		var thisrow = $('input[type="checkbox"]:checked');
        		var id=$('input[type="checkbox"]:checked').parent().parent().children().last().prev().text();
        		$.ajax({
        			url:'t_giveLeader'
        			,data:{"user_Id":id}
        			,dataType:'json'
        			,success:function(data){
        				location.href="teamPage";
        			}, error: function(request, status, error) {
						location.href="teamPage";
					}
        		})
        	})
        	//퇴출하기
        	$('#leaderTab #kick').on('click', function(){
        		var thisrow = $('input[type="checkbox"]:checked').parent().parent();
        		var id=$('input[type="checkbox"]:checked').parent().parent().children().last().prev().text();
        		$.ajax({
        			url:'t_kick'
        			, data:{"user_Id":id}
        			, dataType:'json'
        			, success:function(){
        				location.href="teamPage";
        			}, error: function(request, status, error) {
						location.href="teamPage";
					}
        		})
        	});
        	
        	
        	//팀 모집 여부
        	$('#t_openBtn').on('change', function(){
        		$.ajax({
        			url:'t_openChange'
        			,method:'get'
        			,data:{"selector":$(this).val()}
        			,dataType:'json'
        			,success:function(response){
        				var team = response.team;
        				$('#t_openBtn').val(team.team_Open);			
        			}
        		});
        	})
        	
         	//팀 지원자 승인 혹은 거절
        	$('#teamapplies').on('click', 'button', function(index) {
				var here=$(this);
				var playerId=$(this).parent().parent().children().first().text();
				if(here.attr('id')=='go'){
					if(confirm("팀원으로 등록하시겠습니까?")){
						$.ajax({
							url: 't_joinAccept'
							, method: 'post'
							, data: {
								"player.user_Id" : playerId
							}
							, success: function(response) {
								location.href="teamPage";
							}
							, error: function(request, status, error) {
								location.href="teamPage";
							}
						}); //$ajax
					}
				}else{
					if(confirm("팀합류 요청을 거부하시겠습니까?")){
						$.ajax({
							url: 't_joinDeny'
							, method: 'post'
							, data: {
								"player.user_Id" : playerId
							}
							, success: function(response) {
								location.href="teamPage";
							}
							, error: function(request, status, error) {
								location.href="teamPage";
							}
						}); //$ajax
					}
				}
			});
        	
        	
        })
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

   <div class="content-wrap">
      <main id="content" class="content" role="main">
      <style>
body {
   overflow-x: visible;
}
</style>

      <div class="row">
         <section class="widget">
            <div class="widget-body">
               <h3>
                  팀원 <span class="fw-semi-bold">목록</span>
                  <div style="float: right;">
                  
                  <s:select id="t_openBtn" class="btn btn-danger" list="#{0:'모집 가능', 1:'모집 불가'}" value="team.team_open"></s:select>
                    
                  </div>
               </h3>

               <p>팀원 목록 및 퇴출, 모집 여부, 팀 해체</p>


               <div class="col-lg-6" style="margin-left: 20%;">
                  <section class="widget user-profile">
                     <div class="widget-body">
                        <div class="widget-top-overflow text-white"></div>
                        <div class="row">
                           <div class="col-md-5 text-xs-center"></div>

                           <div class="col-md-7" style="width: 500px">
                              <div class="stats-row stats-row-profile mt text-xs-right">
                              	<!-- 썸넬들어가는부분 -->
                                 <!-- <img class="img-circle" src="../demo/img/pictures/3.jpg" alt="..."
                                    style="float: left;"> --> <br> <br> <br>
                                 <div style="float: right;">
                                    <div class="stat-item">
                                       <p class="value text-xs-right">
                                          <s:property value="team_winrate" />
                                          %
                                       </p>
                                       <h6 class="name">승률</h6>
                                    </div>
                                    <div class="stat-item">
                                       <p class="value text-xs-right">
                                          <s:property value="team.team_Score" />
                                       </p>
                                       <h6 class="name">승점</h6>
                                    </div>
                                    <div class="stat-item">
                                       <p class="value text-xs-right">
                                          <s:property value="team.team_Manner" />
                                       </p>
                                       <h6 class="name">매너점수</h6>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </section>
               </div>
            </div>
            <table class="table table-striped" id="mList">
               <thead>
                  <tr>
                     <th>
                        <div class="checkbox abc-checkbox">
                           <input id="checkbox1" type="checkbox" data-check-all>
                        </div>
                     </th>
                     <th>이름</th>
                     <th>아이디</th>
                     <th>Info</th>
                  </tr>
               </thead>
				<!-- 팀원목록 -->
               <tbody>
                  <s:iterator value="memberList">
                     <tr>
                        <td>
                            <input type="checkbox" name="teamMembers[]"> 
                        </td>
                        <td><s:property value="user_Name" /></td>
                        <td><s:property value="user_Id" /></td>
                        <s:if test="%{#session.t1Leader==user_Id}">
                        <td><span class="label label-danger">LEADER</span></td>
                        </s:if>
                        <s:else>
                        <td><span class="label label-danger"></span></td>
                        </s:else>
                     </tr>
                  </s:iterator>
                  
               </tbody>
            </table>
			
			<s:if test="%{#session.isLeader=='true'}">
				<div id="leaderTab">
	               <button class="btn btn-gray width-100 mb-xs" role="button" id="kick">퇴출</button>
    	           <button class="btn btn-gray width-100 mb-xs" role="button" id="giveLeader">팀장위임</button>
        	       <button class="btn btn-danger width-100 mb-xs" role="button" id="deleteTeam"
            	      style="float: right;">팀 해체</button>
            	</div>			
			</s:if>
         </section>
      </div>



      <br>
      <br>
      <div class="row">
         <section class="widget">
            <table class="table table-striped">
               <thead>
                  <tr>
                     <th>아이디</th>
                     <th>이름</th>
                     <th>지역</th>
                     <th>승인/거절</th>
                  </tr>
               </thead>
               <tbody id="teamapplies">
                  <s:iterator value="applyList">
                     <tr>
                        <td><s:property value="user_Id" /></td>
                        <td><s:property value="user_Name" /></td>
                        <td><s:property value="user_Location" /></td>
                        <td><button class="btn btn-success width-100 mb-xs" role="button" id="go">승인</button><button class="btn btn-gray width-100 mb-xs" role="button" id="stop">거절</button></td>
                     </tr>
                  </s:iterator>
               </tbody>
            </table>
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
   <script src="../vendor/pace.js/pace.js"
      data-pace-options='{ "target": ".content-wrap", "ghostTime": 1000 }'></script>
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
   <script
      src="../vendor/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>
   <script src="../vendor/jquery.nestable/jquery.nestable.js"></script>

   <!-- page specific js -->
   <script src="../js/ui-list-groups.js"></script>
</body>
</html>