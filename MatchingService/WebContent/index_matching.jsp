<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
    <title>SportsMatchingSystem</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link href="css/cu/style.css" rel="stylesheet">
    <link href="css/application.min.css" rel="stylesheet">
    <link rel="shortcut icon" href="images/favicon.ico"/>
    <!-- map -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <script src="https://code.jquery.com/jquery-2.2.4.js"></script>
    <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
    <!-- 지도 -->
    <style type="text/css">
      .map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
      .map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
      .map_wrap {position:relative;width:100%;height:500px;}
      #menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
      .bg_white {background:#fff;}
      #menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
      #menu_wrap .option{text-align: center;}
      #menu_wrap .option p {margin:10px 0;}  
      #menu_wrap .option button {margin-left:5px;}
      #placesList li {list-style: none;}
      #placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
      #placesList .item span {display: block;margin-top:4px;}
      #placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
      #placesList .item .info{padding:10px 0 10px 55px;}
      #placesList .info .gray {color:#8a8a8a;}
      #placesList .info .jibun {padding-left:26px;background:url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
      #placesList .info .tel {color:#009900;}
      #placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
      #placesList .item .marker_1 {background-position: 0 -10px;}
      #placesList .item .marker_2 {background-position: 0 -56px;}
      #placesList .item .marker_3 {background-position: 0 -102px}
      #placesList .item .marker_4 {background-position: 0 -148px;}
      #placesList .item .marker_5 {background-position: 0 -194px;}
      #placesList .item .marker_6 {background-position: 0 -240px;}
      #placesList .item .marker_7 {background-position: 0 -286px;}
      #placesList .item .marker_8 {background-position: 0 -332px;}
      #placesList .item .marker_9 {background-position: 0 -378px;}
      #placesList .item .marker_10 {background-position: 0 -423px;}
      #placesList .item .marker_11 {background-position: 0 -470px;}
      #placesList .item .marker_12 {background-position: 0 -516px;}
      #placesList .item .marker_13 {background-position: 0 -562px;}
      #placesList .item .marker_14 {background-position: 0 -608px;}
      #placesList .item .marker_15 {background-position: 0 -654px;}
      #pagination {margin:10px auto;text-align: center;}
      #pagination a {display:inline-block;margin-right:10px;}
      #pagination .on {font-weight: bold; cursor: default;color:#777;}
      #timetab div{
          float: left;
       }
    </style>
    
    <!-- 상단 블러 -->
    <script>
    var sports;	//매칭용 변수
	    $(document).ready(function(){
	      //대상의 타입에 따라 매칭 대기 상태인지 아닌지를 확인
	      //축구
	      $('#sports1').on('click', function() {
	    	  sports=1;
	    	  
	    	  $.ajax({
		    		url: 'matching/checkMatching',
		    		data: {"sports":1},
		    		success: function(response) {
		    			var vg = response.validGame;
		    			 if(vg=='notLeader'){
		    				$('#notLeader').css('visibility', 'visible');
		    			}
		    			else if(vg=='notEnoughMember'){
		    				$('#notEnoughMember').css('visibility', 'visible');
		    			}
		    			else if(vg=='goMatch'){
		    				$('#go').css('visibility', 'visible');
		    			}
		    			else if(vg=='stopMatch'){
			    			$('#stop').css('visibility', 'hidden');
		    			} 
		    		}, error: function(response) {
		    		/* 	$('#go').css('visibility', 'hidden');
		    			$('#stop').css('visibility', 'visible'); */
		    			alert('error');
		    		}
		    	});	    				  
	    	  
	    	  
	      });
	    	//야구
	    	$('#sports2').on('click', function() {
	    		sports=2;
	    	  $.ajax({
	    		url: 'matching/checkMatching',
	    		data: {"sports":2},
	    		success: function(response) {
	    			var vg = response.validGame;
	    			 if(vg=='notLeader'){
	    				$('#notLeader').css('visibility', 'visible');
	    			}
	    			else if(vg=='notEnoughMember'){
	    				$('#notEnoughMember').css('visibility', 'visible');
	    			}
	    			else if(vg=='goMatch'){
	    				$('#go').css('visibility', 'visible');
	    			}
	    			else if(vg=='stopMatch'){
		    			$('#stop').css('visibility', 'hidden');
	    			} 
	    		}, error: function(response) {
	    			/* $('#go').css('visibility', 'hidden');
	    			$('#stop').css('visibility', 'visible'); */
	    			alert('error');
	    		}
	    	});
	      });
	    	//탁구
	    	$('#sports3').on('click', function() {
	    		sports=3;
	    	  $.ajax({
	    		url: 'matching/checkMatching',
	    		data: {'sports':3},
	    		success: function(response) {
	    			$('#go').css('visibility', 'visible');
	    			$('#stop').css('visibility', 'hidden');
	    		}, error: function(response) {
	    			$('#go').css('visibility', 'hidden');
	    			$('#stop').css('visibility', 'visible');
	    		}
	    	});
	      });
	    	//볼링
	    	$('#sports4').on('click', function() {
	    		sports=4;
	    	  $.ajax({
	    		url: 'matching/checkMatching',
	    		data: {'sports':4},
	    		success: function(response) {
	    			$('#go').css('visibility', 'visible');
	    			$('#stop').css('visibility', 'hidden');
	    		}, error: function(response) {
	    			$('#go').css('visibility', 'hidden');
	    			$('#stop').css('visibility', 'visible');
	    		}
	    	});
	      });
	     
	      //매칭 등록하기
	      $('#matching').on('click', function() {
	    	  $.ajax({
	    		  url: 'matching/insertMatching',
	    		  data: data(),
	    		  success: function(response) {
	    			  alert('등록되었습니다!');
	    		  },
	    		  error:function(request,status,error){
	    		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    	       }
	    	  }); 
	      });//matching
	     
	      //구장을 가지고 있습니다.
	      $('#yesIDo').on('click', function() {
	    	  pop();
	    	  function pop() {
	    			window.open('${pageContext.request.contextPath}/map.jsp','경기장 찾기','resizable=no scrollbars=yes top=100 left=100 width=1080 height=600');
	    		}
	      });
	      
	      //구장을 가지고 있지 않습니다.
	      $('#noIDont').on('click', function() {
	    	  pop();
	    	  function pop() {
	    			window.open('${pageContext.request.contextPath}/map2.jsp','희망 위치 찾기','resizable=no scrollbars=yes top=100 left=100 width=1080 height=600');
	    		}
	      });
	      
	      //버튼을 누르면 스케줄로 이동
	      $('#showSc').on('click', function() {
	    	location.href='player/Matching.action';
	      });
	      
	      $('#teamView').on('click', function() {
		    	location.href='team/soccerteampage';
		   });
	      
	    });//document.ready
	    //창 보이기
	    
	    //데이터 가지고 오기
	    function data() {
	    	/* var game_Type=$('#type').val(); */
	    	var cutDate=$('#time').val();
	    	var ground_name=$('#ground_name').val();
	    	var latitude=$('#la').val();
	    	var longitude=$('#ln').val();
	    	var ground_Hold=0;
	    	if(latitude.replace(/\s/g,"").length == 0) {
	    		ground_Hold=1;
	    	}
	    	else if(latitude.replace(/\s/g,"").length != 0) {
	    		ground_Hold=0;
	    	}
	    	var returnData={"sports": sports, "cutDate": cutDate, "matching.ground_Hold": ground_Hold, "matching.latitude": latitude, "matching.longitude": longitude, "ground_name": ground_name};
	    	return returnData;
	    }
    </script>
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
                          <%--  <span class="thumb-sm avatar pull-xs-left"> <img
                              id="picture" class="img-circle" src="../img/" alt="...">
                           </span> --%>
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
   
<!-- 매칭 메인 페이지 -->
<div class="content-wrap">
    <main id="content" class="content" role="main">
        <div class="row">
	        <div class="col-lg-12">
	        	<!-- <a href="#" class="block1" > -->
  				<img src="images/159.png" style="width: 100%;">
  				<%-- <span class="price"><span></span><span><small></small>Matching</span><strong></strong></span> --%>
  				</a>
			</div>
            <div class="col-lg-12">
                <div class="panel-group mb-lg" id="accordion" data-toggle="collapse">
                
                <!-- 1. 종목선택 -->
                
                <div class="panel panel-default">
                        <div class="panel-heading collapsed" style="text-align: center;">
                            <h6 class="panel-title">
                                <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                    <span class="label label-pill label-warning">01</span><span style="font-size: 20px; font-weight: bold;"> 종목 선택</span>
                                    <i class="fa fa-angle-down pull-xs-right"></i>
                                </a>
                            </h6>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse in">
                            <div class="panel-body">
                               <!-- 날짜 선택 입력 -->
                            <div class="widget-body" style="text-align: center;">
	                        	<form role="form">
	                        	<label for="datepicker2i">
	                                        <span class="help-block">
	                            				종목당 한 번에 매칭을 요청할 수 있는 횟수는 1회입니다.
	                                        </span>
	                                    </label>
	                            <fieldset>
	                                <div class="form-group">
	                                    	<div style="float: left; width: 50%;" id="sports1">
											<a href="#" class="block1"><input type="hidden" id="type1" value="1"/>
												<img src="images/12.jpg" style="width: 100%;">
		  										<span class="price"><span></span><span>SOCCER</span><strong></strong></span>
		  									</a>
		  									</div>
		  									<div style="float: left; width: 50%;" id="sports2">
		  									<a href="#" class="block1"><input type="hidden" id="type2" value="2"/>
												<img src="images/13.jpg" style="width: 100%;">
  												<span class="price"><span></span><span>Baseball</span><strong></strong></span>
		  									</a>
		  									</div>
		  									<div style="float: left; width: 50%;" id="sports3">
		  									<a href="#" class="block1"><input type="hidden" id="type3" value="3"/>
												<img src="images/14.jpg" style="width: 100%;">
  												<span class="price"><span></span><span>Pingpong</span><strong></strong></span>
		  									</a>
		  									</div>
		  									<div style="float: left; width: 50%;" id="sports4">
		  									<a href="#" class="block1"><input type="hidden" id="type4" value="4"/>
												<img src="images/15.jpg" style="width: 100%;">
  												<span class="price"><span></span><span>Bowling</span><strong></strong></span>
		  									</a>
		  									</div>
	                                </div><!-- form=group -->
	                                
	                                <div id="gostop">
		                                <div style="margin-left: 42.3%; visibility: hidden;" id="stop">
		                                	<label for="datepicker2i" style="float: left; font-size: 1.3em;">
		                                        <span class="help-block" id="comecome">
		                                            	<br>이미 <span style="font-weight: bold;">매칭 진행 중</span>인 종목입니다!<br><br>
		                                            	<button class="btn btn-inverse width-100 mb-xs" role="button" id="showSc">스케줄 보기</button>
		                                        </span>
		                                    </label>
	                                	</div>
		                                <div style="margin-left: 42.3%; visibility: hidden;" id="notLeader">
		                                	<label for="datepicker2i" style="float: left; font-size: 1.3em;">
		                                        <span class="help-block" id="comecome">
		                                            	<br>팀장만 신청할 수 있습니다!<br><br>
		                                            	<button class="btn btn-inverse width-100 mb-xs" role="button" id="teamView">팀 보러가기</button>
		                                        </span>
		                                    </label>
	                                	</div>
		                                <div style="margin-left: -57%; visibility: hidden;" id="notEnoughMember">
		                                	<label for="datepicker2i" style="float: left; font-size: 1.3em;">
		                                        <span class="help-block" id="comecome">
		                                            	<br>팀에 사람이 모자랍니다!<br><br>
		                                            	<button class="btn btn-inverse width-100 mb-xs" role="button" id="teamView">팀 보러가기</button>
		                                        </span>
		                                    </label>
	                                	</div>
	                                	<div style="display:inline; margin-left: -57%; visibility: hidden;" id="go">
		                                	<label for="datepicker2i" style="font-size: 1.3em">
		                                        <span class="help-block">
		                                            	<br><br>좋습니다. <span style="font-weight: bold;">매칭을 계속 진행</span>하세요!
		                                        </span>
		                                    </label>
	                                	</div>
                                	</div>
                                	
	                            </fieldset>
	                            </form>
                            </div>
                               <!-- 날짜 선택 완료 -->
                            </div>
                        </div>
                    </div>
                    <!-- 2. 날짜, 시간 선택 -->
                    
                    <div class="panel panel-default">
                        <div class="panel-heading collapsed" style="text-align: center;">
                            <h6 class="panel-title">
                                <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                    <span class="label label-pill label-danger">02</span><span style="font-size: 20px; font-weight: bold;"> 날짜 선택</span>
                                    <i class="fa fa-angle-down pull-xs-right"></i>
                                </a>
                            </h6>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse in">
                            <div class="panel-body">
                               <!-- 날짜 선택 입력 -->
                            <div class="widget-body" style="text-align: center; margin-left: 38.3%;">
	                        	<form role="form">
	                            <fieldset>
	                                <div class="form-group" style="width: 40%; text-align: center;">
	                                    <label for="datepicker2i" style="margin-left: -10%;">
	                                        <span class="help-block">
	                                            	날짜와 시간을 선택해 주세요
	                                        </span>
	                                    </label>
	                                    <div id="datetimepicker2" class="input-group">
	                                        <input id="time" type="text" class="form-control" style="text-align: center;"/>
	                                        <span class="input-group-addon">
	                                            <span class="fa fa-calendar"></span>
	                                        </span>
	                                    </div>
	                                </div><!-- form=group -->
	                            </fieldset>
	                            </form>
                            </div>
                               <!-- 날짜 선택 완료 -->
                            </div>
                        </div>
                    </div>
                    <!-- 3. 구장 유무 -->
                    <div class="panel panel-default">
                        <div class="panel-heading" style="text-align: center;">
                            <h6 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" id="locationOwn">
                                    <span class="label label-pill label-success">03</span><span style="font-size: 20px; font-weight: bold;"> 장소 선택</span>
                                    <i class="fa fa-angle-down pull-xs-right"></i>
                                </a>
                            </h6>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse in">
                                <div class="panel-body" id="timetab">
                                	<div class="widget-body" style="text-align: center;">
	                        			 <form class="form-horizontal form-label-left" role="form">
			                             <fieldset>
			                                <div class="form-group row">
			                                	<!-- 구장 유무 -->
			                                	<div class="widget-body">
			                                	<div class="col-sm-3" style="text-align: center; margin-left: 38%;">
			                                		<span class="help-block">
	                                           			이미 예약해 둔 구장이나 정해진 장소가 있나요?
	                                        		</span>
			                                		<input type="button" class="btn btn-default btn-block" id="yesIDo" value="예, 있습니다" "/>
			                                		<div class="col-sm-12" style="text-align: center; margin-top: 5px;" id="yesIDo_window"><input type="text" class="form-control" id="ground_name" placeholder="경기장 이름" readonly="readonly"/><br></div>
			                                		<input type="button" class="btn btn-default btn-block" id="noIDont" value="아니오, 없습니다"/>
			                                		<div style="margin-top: 5px;">
			                                			<!-- 위도 -->
			                                			 <div class="col-sm-12">
					                                        <div class="input-group">
					                                            <span class="input-group-addon"><i class="glyphicon glyphicon-resize-vertical"></i></span>
					                                            <input id="la" class="form-control" type="text" placeholder="위도" readonly="readonly">
					                                        </div>
					                                     </div>
					                                     <!-- 경도 -->
					                                     <div class="col-sm-12">
					                                        <div class="input-group">
					                                            <span class="input-group-addon"><i class="glyphicon glyphicon-resize-horizontal"></i></span>
					                                            <input id="ln" class="form-control" type="text" placeholder="경도" readonly="readonly">
					                                        </div>
					                                     </div>
			                                		</div><!-- no -->
			                                		</div>
			                                	</div><!-- widget -->
			                                </div>
			                                </fieldset>
			                            </form>    
                            		</div>
                        		</div>
                        	</div>
                    	</div>
                    <!-- 3. 희망 장소 -->
                </div>
            </div><!-- Matching_option -->
            <div class="col-lg-6" style="margin-left: 25%;"><br><br>
            	<button type="button" style="height: 100px;" class="btn btn-warning btn-block" id="matching"><span style="font-size: 30px;">MATCHING!</span></button>
            </div>
        </div><!-- row -->
        <input type="hidden" id="type" value="0"/>
        <input type="button" id="resize" style="visibility: hidden;"/>
        <br><br><br>
    </main>
</div>
<!-- 들고 오는 js -->
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
<!-- app -->
<script src="js/app.js"></script>
<script src="js/bootstrap-fix/collapse.js"></script>
<script src="js/ui-tabs-accordion.js"></script>

<!-- page specific libs -->
<script src="vendor/bootstrap/js/dist/modal.js"></script>
<script src="vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
<script src="vendor/jquery-autosize/jquery.autosize.min.js"></script>
<script src="vendor/bootstrap3-wysihtml5/lib/js/wysihtml5-0.3.0.min.js"></script>
<script src="vendor/bootstrap3-wysihtml5/src/bootstrap3-wysihtml5.js"></script>
<script src="vendor/select2/select2.min.js"></script>
<script src="vendor/switchery/dist/switchery.min.js"></script>
<script src="vendor/moment/min/moment.min.js"></script>
<script src="vendor/eonasdan-bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
<script src="vendor/mjolnic-bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
<script src="vendor/jasny-bootstrap/js/inputmask.js"></script>
<script src="vendor/jasny-bootstrap/js/fileinput.js"></script>
<script src="vendor/holderjs/holder.js"></script>
<script src="vendor/dropzone/dist/min/dropzone.min.js"></script>
<script src="vendor/markdown/lib/markdown.js"></script>
<script src="vendor/bootstrap-markdown/js/bootstrap-markdown.js"></script>
<script src="vendor/seiyria-bootstrap-slider/dist/bootstrap-slider.min.js"></script>

<!-- page specific js -->
<script src="vendor/bootstrap/js/dist/tab.js"></script>
<script src="js/form-elements.js"></script>
<script src="js/ui-buttons.js"></script>
</body>
</html>