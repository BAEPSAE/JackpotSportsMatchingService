<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<script src="../js/jquery-3.1.1.min.js"></script>
	  <script type="text/javascript">
  
        /* yeah we need this empty stylesheet here. It's cool chrome & chromium fix
         chrome fix https://code.google.com/p/chromium/issues/detail?id=167083
         https://code.google.com/p/chromium/issues/detail?id=332189
         */
         $(function(){
     		$('#list').click(function(){
     			location.href="list";
     		});//click
     		$('#delete').click(function(){
     			if(confirm("진짜 삭제 하시겠습니까?")){
     				var num='<s:property value="board.boardNum"/>';
         			alert(num);
					$.ajax({
						url: 'delete'
						, method: 'post'
						, data: {
							"board.boardNum" : num
						},
						 success: function(response) {
							alert("삭제성공");
							location.href="list";
							
						}
						, error: function(request, status, error) {
							alert("삭제실패");
							location.href="list";
						}
					}); //$ajax
				}
     		});//click
     		$('#update').click(function(){
     			location.href="list";
     		});//click

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
    <main id="content" class="content" role="main">
        <style>
            body{
                overflow-x: visible;
            }
            table a:link {color: #CC6633;}
table a:visited {color: #CC6633;}
 table a:hover {color: #999966;}
 table a:active {color: #CC6633;}
 table a:focus{color: #CC6633;}


 table caption {
		padding: 18px 2px 18px 2px;
		color: #cfcfcf;
		background-color: inherit;
		font-weight: normal;
		text-align: centered;
	//	text-transform: capitalize;
		}

	 table{
	 	font-size:170%;
		border: 2px solid red;
	}
	 table tr td{
		padding: 36px 39px;
		text-align:left;

	}
	/*  table thead th{
		background-color: #E5E5D8;
		border-bottom: 1px solid #ccc;
		border-left: 1px solid #D9D9D9;
		font-weight: bold;
		text-align:left;
		padding: 36px 39px;
		color:#592C16;
	} */
	 table tbody th{
		/* background-color: #fff; */
	/* 	font-weight: normal; */
		border-right: none;
		padding: 36px 39px;
		background-color: #E5E5D8;
	}
	 table tbody td{
	 
			border-left: 2px solid #D9D9D9;
			border-right:2px solid red;
	}
/* 	 table tbody tr.odd{
		background-color: #F3F3F3;
	} */
/* 	
 table tbody tr:hover {
	color: #333333;
	background-color: #E5E5D8;
}

 table tbody tr.odd:hover {
color: #333333;
	background-color: #E5E5D8;
} */
	
/* 	 table tfoot td,  table tfoot th{
		border-top: 1px solid #ccc;
		font-weight:bold;
		color:#592C16;
		padding: 16px 9px;
		
	}
             */
        </style>
        
       <h1 class="page-title">게시글 읽기 - <span class="fw-semi-bold">목록</span></h1> 
     	<div id="contents"><!--내용-->
			<h1>글 읽기 게시판<span></span></h1><!-- 내용제목 -->
	 	<s:form theme="simple"> 
			<table class="wr_board">
				<tr>
					<th>작성자</th>
					<td><s:property value="board.user_Id"/> </td>
				</tr>
				<tr>
					<th>글번호</th>
					<td><s:property value="board.boardNum"/> </td>
				</tr>
				<tr>	
					<th>카테고리</th>
					<s:if test="board.category==0">
					<td>잡담</td></tr>
					</s:if>
					<s:elseif test="board.category==1">
					<td>리뷰</td></tr>
					</s:elseif>
					<s:else> 
						<td>정보</td></tr>
					
					</s:else>
										
				<tr>
					<th>제목</th>
					<td><s:property value="board.title"/>  </td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="2"><s:textarea value="%{board.content}"></s:textarea></td>
				</tr>
				
			
			</table>
		
			<p class="list_btn">
			<s:if test="#session.user_Id==board.user_Id"> 
	     <button  class="btn btn-primary" id="update">수정</button>
    	 <button class="btn btn-primary"  id="delete">삭제</button>
				</s:if> 
			</p>
  		   </s:form> 
        
       <button class="btn btn-gray width-100 mb-xs" role="button" id="list">목록으로</button>

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