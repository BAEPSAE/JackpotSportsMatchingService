<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <title>골목대장 - 매칭상대 찾기</title>
    <link href="../css/application.min.css" rel="stylesheet">
    <!-- as of IE9 cannot parse css files with more that 4K classes separating in two files -->
    <!--[if IE 9]>
    <link href="css/application-ie9-part2.css" rel="stylesheet">
    <![endif]-->
    <link rel="shortcut icon" href="img/favicon.png">
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
  	</style>
</head>
<body>
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
                    <img class="img-circle" src="demo/img/people/a5.jpg" alt="...">
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
                    My Page
                    <i class="toggle fa fa-angle-down"></i>
                </a>
                <ul id="sidebar-ui" class="collapse in">
                    <li><a href="ui_components.html">전적 보기</a></li>
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
                            <img class="img-circle" src="demo/img/people/a5.jpg" alt="...">
                        </span>
                        &nbsp;
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
<div class="content-wrap">
    <!-- main page content. the place to put widgets in. usually consists of .row > .col-lg-* > .widget.  -->
    <main id="content" class="content" role="main">
        <ol class="breadcrumb">
            <li>매칭신청</li>
            <li class="active">매칭정보 입력</li>
        </ol>
        <h1 class="page-title">경기종목 - <span class="fw-semi-bold">축구</span></h1>
        <div class="row">
            <div class="col-lg-12">
            
                <section class="widget">
                    	위도<input type="text" id="ln">경도<input type="text" id="la">위치<input type="text" id="pl">
                    <div class="map_wrap">
                    
					    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
						<div id="clickLatlng"></div>
					    <div id="menu_wrap" class="bg_white">
					        <div class="option">
					            <div>
					                <form onsubmit="searchPlaces(); return false;">
					                    키워드 : <input type="text" value="" id="keyword" size="15"> 
					                    <button type="submit">검색하기</button> 
					                </form>
					            </div>
					        </div>
					        <hr>
					        <ul id="placesList"></ul>
					        <div id="pagination"></div>
					    </div>
					</div>

		<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=e476fd3b9c743461f3c713db7e85c418&libraries=services"></script>
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
		    ps.keywordSearch( keyword, placesSearchCB); 
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
    </main>
</div>

<!-- The Loader. Is shown when pjax happens -->
<div class="loader-wrap hiding hide">
    <i class="fa fa-circle-o-notch fa-spin-fast"></i>
</div>

<!-- common libraries. required for every page-->
<script src="../vendor/jquery/dist/jquery.min.../js"></script>
<script src="../vendor/jquery-pjax/jquery.pjax.../js"></script>
<script src="../vendor/tether/dist/../js/tether.../js"></script>
<script src="../vendor/bootstrap/../js/dist/util.../js"></script>
<script src="../vendor/bootstrap/../js/dist/collapse.../js"></script>
<script src="../vendor/bootstrap/../js/dist/dropdown.../js"></script>
<script src="../vendor/bootstrap/../js/dist/button.../js"></script>
<script src="../vendor/bootstrap/../js/dist/tooltip.../js"></script>
<script src="../vendor/bootstrap/../js/dist/alert.../js"></script>
<script src="../vendor/slimScroll/jquery.slimscroll.min.../js"></script>
<script src="../vendor/widgster/widgster.../js"></script>
<script src="../vendor/pace.../js/pace.../js" data-pace-options='{ "target": ".content-wrap", "ghostTime": 1000 }'></script>
<script src="../vendor/jquery-touchswipe/jquery.touchSwipe.../js"></script>
<script src="../js/bootstrap-fix/button.../js"></script>

<!-- common app ../js -->
<script src="../js/settings.../js"></script>
<script src="../js/app.../js"></script>

<!-- page specific libs -->
<script src="../vendor/parsley../js/dist/parsley.min.../js"></script>
<script src="../vendor/bootstrap/../js/dist/tab.../js"></script>
<script src="../vendor/twitter-bootstrap-wizard/jquery.bootstrap.wizard.min.../js"></script>
<script src="../vendor/select2/select2.../js"></script>
<script src="../vendor/moment/min/moment.min.../js"></script>
<script src="../vendor/eonasdan-bootstrap-datetimepicker/build/../js/bootstrap-datetimepicker.min.../js"></script>
<script src="../vendor/jasny-bootstrap/../js/inputmask.../js"></script>
<script src="../vendor/bootstrap/../js/dist/modal.../js"></script>
<script src="../vendor/bootstrap/../js/dist/popover.../js"></script>
<script src="../vendor/bootstrap-application-wizard/src/bootstrap-wizard.../js"></script>

<!-- page specific ../js -->
<script src="../js/form-wizard.../js"></script>




<!-- 캘린더용 -->

<script src="../vendor/jquery-ui/ui/core.../js"></script>
<script src="../vendor/jquery-ui/ui/widget.../js"></script>
<script src="../vendor/jquery-ui/ui/mouse.../js"></script>
<script src="../vendor/jquery-ui/ui/draggable.../js"></script>
<script src="../vendor/jquery-ui/ui/resizable.../js"></script>
<script src="../vendor/fullcalendar/fullcalendar.../js"></script>
<script src="../vendor/bootstrap/../js/dist/modal.../js"></script>
<!-- page specific ../js -->
<script src="../js/calendar.../js"></script>
</body>
</html>