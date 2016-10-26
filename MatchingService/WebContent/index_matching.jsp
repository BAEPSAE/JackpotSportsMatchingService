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
    <script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=e476fd3b9c743461f3c713db7e85c418&libraries=services"></script>
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
	    $(document).ready(function(){
	      $( ".block1" ).mouseover(function() {
	        $(this).addClass( "blur" );
	      });
	      $( ".block1" ).mouseout(function() {
	        $(this).removeClass( "blur" );
	      });
	      /* $().UItoTop({ easingType: 'easeOutQuart' }); */
	      
	     /*  $('#timetab input[type=radio]').click(function(){
	            var img = 'images/'+$(this).val()+'.png';
	            alert(img);
	            $('#timetab #timeimg>img').attr('src', img);
	         }); */
	    }); 
    </script>
    
</head>
<body>
<!-- 왼쪽 사이드 바 -->
<nav id="sidebar" class="sidebar" role="navigation">
    <div class="js-sidebar-content">
        <header class="logo hidden-sm-down">
            <a href="index.html">sing</a>
        </header>
        <div class="sidebar-status hidden-md-up">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <span class="thumb-sm avatar pull-xs-right">
                <!-- a5 -->
                    <!-- <img class="img-circle" src="../demo/img/people/a5.jpg" alt="..."> -->
                </span>
                <span class="circle bg-warning fw-bold text-gray-dark">
                    13
                </span>
                &nbsp;
                Philip <strong>Smith</strong>
                <b class="caret"></b>
            </a>
        </div>
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
        <ul class="sidebar-nav">
            <li  class="active">
                <a href="#sidebar-ui" data-toggle="collapse" data-parent="#sidebar">
                    <span class="icon">
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
                            <!-- <img class="img-circle" src="../demo/img/people/a5.jpg" alt="..."> -->
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
         </div>
      </div>
   </nav>



<!-- 매칭 메인 페이지 -->
<div class="content-wrap">
    <main id="content" class="content" role="main">
        <div class="row">
	        <div class="col-lg-12">
				<a href="#" class="block1">
  				<img src="images/12.jpg" style="width: 100%;">
  				<span class="price"><span></span><span><small></small> SOCCER</span><strong></strong></span>
				</a>
			</div>
            <div class="col-lg-12">
                <div class="panel-group mb-lg" id="accordion" data-toggle="collapse">
                <!-- 1. 날짜, 시간 선택 -->
                    <div class="panel panel-default">
                        <div class="panel-heading collapsed" style="text-align: center;">
                            <h6 class="panel-title">
                                <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                    <span class="label label-pill label-danger">01</span><span style="font-size: 20px; font-weight: bold;"> 날짜 선택</span>
                                    <i class="fa fa-angle-down pull-xs-right"></i>
                                </a>
                            </h6>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse in">
                            <div class="panel-body">
                               <!-- 날짜 선택 입력 -->
                            <div class="widget-body" style="text-align: center; margin-left: 37.3%;">
	                        	<form role="form">
	                            <fieldset>
	                                <div class="form-group" style="width: 40%;">
	                                    <label for="datepicker2i">
	                                        <span class="help-block">
	                                            날짜와 시간을 선택해 주세요
	                                        </span>
	                                    </label>
	                                    <div id="datetimepicker2" class="input-group">
	                                        <input id="datepicker2i" type="text" class="form-control" />
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
                    <!-- 2. 구장 유무 -->
                    <div class="panel panel-default">
                        <div class="panel-heading" style="text-align: center;">
                            <h6 class="panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                                    <span class="label label-pill label-warning">02</span><span style="font-size: 20px; font-weight: bold;"> 구장 유무</span>
                                    <i class="fa fa-angle-down pull-xs-right"></i>
                                </a>
                            </h6>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse">
                                <!-- 시간 선택 -->
                                <div class="panel-body" id="timetab">
                                	<div class="widget-body" style="text-align: center; margin-left: 43.3%;">
	                        			 <form class="form-horizontal form-label-left" role="form">
			                            <fieldset>
			                                <div class="form-group row">
			                                	<!-- 구장 유무 -->
			                                    <div class="col-md-10" style="margin-left: -12.8%; width: 60%; display: inline-block;">
			                                        <select data-placeholder="이미 예약해 둔 구장이 있습니까?"
			                                                data-width="auto"
			                                                data-minimum-results-for-search="10"
			                                                tabindex="-1"
			                                                class="select2 form-control" id="default-select">
			                                            <option value=""></option>
			                                            <option value="own">예, 있습니다.</option>
			                                            <option value="noOwn">아니오, 없습니다.</option>
			                                        </select>
			                                   	</div>
			                                </div>
			                                </fieldset>
			                            </form>    
                            		</div>
                        		</div>
                        	</div>
                    	</div>
                    <!-- 3. 희망 장소 -->
                    <div class="panel panel-default">
                        <div class="panel-heading" style="text-align: center;">
                            <h6 class="panel-title">
                                <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
                                    <span class="label label-pill label-success">03</span><span style="font-size: 20px; font-weight: bold;"> 희망 장소</span>
                                    <i class="fa fa-angle-down pull-xs-right"></i>
                                </a>
                            </h6>
                        </div>
                        <div id="collapseThree" class="panel-collapse collapse"> 
                            <div class="panel-body">
                            	<div class="widget-body">
			                        <form class="form-horizontal form-label-left" role="form">
			                            <fieldset>
			                                <div class="form-group row">
			                                    <!-- 지도 표시 -->
			                                    <div class="row" style="width: 100%; text-align: center;">
										            <div class="col-lg-12" style="width: 100%; margin-left: 0.5%;">
										                <section class="widget">
										                	<div style="margin-bottom: -6%;">
										                	<span class="label label-default">위도</span>&nbsp;<input type="text" class="form-control" id="ln" style="width: 180px; display: inline-block;">
										                	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="label label-default">경도</span>&nbsp;<input type="text" class="form-control" id="la" style="width: 180px; display: inline-block;">
										                	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="label label-default">위치</span>&nbsp;<input type="text" class="form-control" id="pl" style="width: 180px; display: inline-block;">
										                    </div>
										                    <div class="map_wrap">
															    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
																<div id="clickLatlng"></div>
															    <div id="menu_wrap" class="bg_white">
															        <div class="option">
															            <div>
															                <form onsubmit="searchPlaces(); return false;">
															                    <input type="text" class="form-control" value="" id="keyword" style="width: 160px; display: inline-block;"> 
															                    <button class="btn btn-default" type="submit">&nbsp;검색하기&nbsp;</button> 
															                </form>
															            </div>
															        </div>
															        <hr>
															        <ul id="placesList"></ul>
															        <div id="pagination"></div>
															    </div>
															</div>
												<script>
												// 마커를 담을 배열입니다
												var markers = [];
												
												var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
												    mapOption = {
												        center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
												        level: 3 // 지도의 확대 레벨
												    };  
												
												// 지도를 생성합니다    
												var map = new daum.maps.Map(mapContainer, mapOption); 
												
												// 장소 검색 객체를 생성합니다
												var ps = new daum.maps.services.Places();  
												
												// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
												var infowindow = new daum.maps.InfoWindow({zIndex:1});
												
												// 키워드로 장소를 검색합니다
												searchPlaces();
												
												var marker = new daum.maps.Marker({ 
												    // 지도 중심좌표에 마커를 생성합니다 
												    position: map.getCenter() 
												}); 
												// 지도에 마커를 표시합니다
												marker.setMap(map);
												// 지도에 클릭 이벤트를 등록합니다
												// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
												daum.maps.event.addListener(map, 'click', function(mouseEvent) {        
												    
												    // 클릭한 위도, 경도 정보를 가져옵니다 
												    var latlng = mouseEvent.latLng; 
												    
												    // 마커 위치를 클릭한 위치로 옮깁니다
												    marker.setPosition(latlng);
												    var lng = latlng.getLng();
												    var lat = latlng.getLat();
												    
												    
												    document.getElementById('ln').value = lng; 
												    document.getElementById('la').value = lat; 
												    
												});
												
												// 키워드 검색을 요청하는 함수입니다
												function searchPlaces() {
												
												    var keyword = document.getElementById('keyword').value;
												
												    if (!keyword.replace(/^\s+|\s+$/g, '')) {
														/*alert('키워드를 입력해주세요!');*/
														return false;
												    }
												
												    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
												    ps.keywordSearch(keyword, placesSearchCB); 
												}
												
												// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
												function placesSearchCB(status, data, pagination) {
												    if (status === daum.maps.services.Status.OK) {
												
												        // 정상적으로 검색이 완료됐으면
												        // 검색 목록과 마커를 표출합니다
												        displayPlaces(data.places);
												
												        // 페이지 번호를 표출합니다
												        displayPagination(pagination);
												
												    } else if (status === daum.maps.services.Status.ZERO_RESULT) {
												
												        alert('검색 결과가 존재하지 않습니다.');
												        return;
												
												    } else if (status === daum.maps.services.Status.ERROR) {
												
												        alert('검색 결과 중 오류가 발생했습니다.');
												        return;
												
												    }
												}
												
												// 검색 결과 목록과 마커를 표출하는 함수입니다
												function displayPlaces(places) {
												
												    var listEl = document.getElementById('placesList'), 
												    menuEl = document.getElementById('menu_wrap'),
												    fragment = document.createDocumentFragment(), 
												    bounds = new daum.maps.LatLngBounds(), 
												    listStr = '';
												    
												    // 검색 결과 목록에 추가된 항목들을 제거합니다
												    removeAllChildNods(listEl);
												
												    // 지도에 표시되고 있는 마커를 제거합니다
												    removeMarker();
												    
												    for ( var i=0; i<places.length; i++ ) {
												
												        // 마커를 생성하고 지도에 표시합니다
												        var placePosition = new daum.maps.LatLng(places[i].latitude, places[i].longitude),
												            marker = addMarker(placePosition, i), 
												            itemEl = getListItem(i, places[i], marker); // 검색 결과 항목 Element를 생성합니다
												
												        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
												        // LatLngBounds 객체에 좌표를 추가합니다
												        bounds.extend(placePosition);
												
												        // 마커와 검색결과 항목에 mouseover 했을때
												        // 해당 장소에 인포윈도우에 장소명을 표시합니다
												        // mouseout 했을 때는 인포윈도우를 닫습니다
												        (function(marker, title) {
												            daum.maps.event.addListener(marker, 'mouseover', function() {
												                displayInfowindow(marker, title);
												            });
												
												            daum.maps.event.addListener(marker, 'mouseout', function() {
												                infowindow.close();
												            });
												            
												            
												            //검색결과 클릭하면 이름 가져옴
												            daum.maps.event.addListener(marker, 'click', function() {
												            	document.getElementById('pl').value = title;
												            });
												            
												            itemEl.onmouseover =  function () {
												                displayInfowindow(marker, title);
												            };
												
												            itemEl.onmouseout =  function () {
												                infowindow.close();
												            };
												        })(marker, places[i].title);
												
												        fragment.appendChild(itemEl);
												    }
												
												    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
												    listEl.appendChild(fragment);
												    menuEl.scrollTop = 0;
												
												    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
												    map.setBounds(bounds);
												}
												
												// 검색결과 항목을 Element로 반환하는 함수입니다
												function getListItem(index, places) {
												
												    var el = document.createElement('li'),
												    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
												                '<div class="info">' +
												                '   <h5>' + places.title + '</h5>';
												
												    if (places.newAddress) {
												        itemStr += '    <span>' + places.newAddress + '</span>' +
												                    '   <span class="jibun gray">' +  places.address  + '</span>';
												    } else {
												        itemStr += '    <span>' +  places.address  + '</span>'; 
												    }
												                 
												      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
												                '</div>';           
												
												    el.innerHTML = itemStr;
												    el.className = 'item';
												
												    return el;
												}
												
												// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
												function addMarker(position, idx, title) {
												    var imageSrc = 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
												        imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
												        imgOptions =  {
												            spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
												            spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
												            offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
												        },
												        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
												            marker = new daum.maps.Marker({
												            position: position, // 마커의 위치
												            image: markerImage 
												        });
												
												    marker.setMap(map); // 지도 위에 마커를 표출합니다
												    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
												
												    return marker;
												}
												
												// 지도 위에 표시되고 있는 마커를 모두 제거합니다
												function removeMarker() {
												    for ( var i = 0; i < markers.length; i++ ) {
												        markers[i].setMap(null);
												    }   
												    markers = [];
												}
												
												// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
												function displayPagination(pagination) {
												    var paginationEl = document.getElementById('pagination'),
												        fragment = document.createDocumentFragment(),
												        i; 
												
												    // 기존에 추가된 페이지번호를 삭제합니다
												    while (paginationEl.hasChildNodes()) {
												        paginationEl.removeChild (paginationEl.lastChild);
												    }
												
												    for (i=1; i<=pagination.last; i++) {
												        var el = document.createElement('a');
												        el.href = "#";
												        el.innerHTML = i;
												
												        if (i===pagination.current) {
												            el.className = 'on';
												        } else {
												            el.onclick = (function(i) {
												                return function() {
												                    pagination.gotoPage(i);
												                }
												            })(i);
												        }
												
												        fragment.appendChild(el);
												    }
												    paginationEl.appendChild(fragment);
												}
												
												// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
												// 인포윈도우에 장소명을 표시합니다
												function displayInfowindow(marker, title) {
												    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
													
												    infowindow.setContent(content);
												    infowindow.open(map, marker);
												}
												
												 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
												function removeAllChildNods(el) {   
												    while (el.hasChildNodes()) {
												        el.removeChild (el.lastChild);
												    }
												}
												</script>
										                </section>
										            </div>
										        </div>
			                                    <!-- 지도 표시 끝 -->
			                                </div> 
			                            </fieldset>
			                         </form>
			                      </div>
                        	</div><!-- panel-body -->
                   		</div>
                    </div>
                </div>
            </div><!-- Matching_option -->
            <div class="col-lg-6" style="margin-left: 25%;"><br><br>
            	<button type="button" style="height: 100px;" class="btn btn-warning btn-block" id="matching"><span style="font-size: 30px;">MATCHING!</span></button>
            </div>
        </div><!-- row -->
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
</body>
</html>