<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>MatchingService</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<script src="js/jquery-3.1.1.min.js"></script>
		<script src="js/skel.min.js"></script>
		<script src="js/init.js"></script>
		<link rel="stylesheet" href="css/skel.css" />
		<link rel="stylesheet" href="css/style.css" />
		<link rel="stylesheet" href="css/style-noscript.css" />
		<link rel="stylesheet" href="css/style-wide.css" />
		<link rel="stylesheet" href="images/font-awesome.min.css" />
		<link rel="stylesheet" href="css/ie/v9.css" />
		<link rel="stylesheet" href="css/ie/v8.css" />
		
		<!-- 자바 스크립트 추가 -->
		<script type="text/javascript">
			$(document).ready(function() {
				//축구
				$('#soccer').mouseenter(function() {
					var url='url("css/images/img1.jpg")';
					$('#bg').css('background-image', url);
				});
				
				//야구
				$('#baseball').mouseenter(function() {
					var url='url("css/images/img2.jpg")';
					$('#bg').css('background-image', url);
				});
				
				//탁구
				$('#tableTennis').mouseenter(function() {
					var url='url("css/images/img3.jpg")';
					$('#bg').css('background-image', url);
				});
				
				//볼링
				$('#bowling').mouseenter(function() {
					var url='url("css/images/img4.jpg")';
					$('#bg').css('background-image', url);
				});
			});//document
		</script>
	</head>
	<body class="loading">
		<div id="wrapper">
			<div id="bg"></div>
			<div id="overlay"></div>
			<div id="main">
				<!-- Header -->
					<header id="header">
						<h1>Sports Matching Service</h1>
						<p>3rd Web Project &nbsp;&bull;&nbsp; B-class &nbsp;&bull;&nbsp; Never asked for this</p>
						<nav>
							<ul><!-- 인덱스 분기_MatchingAction -->
								<li><s:a action="index_matching" class="fa fa-circle" id="soccer"><span>Soccer</span></s:a></li>
								<li><s:a action="index_matching" class="fa fa-dribbble" id="baseball"><span>Baseball</span></s:a></li>
								<li><s:a action="index_matching" class="fa fa-circle-o" id="tableTennis"><span>Table Tennis</span></s:a></li>
								<li><s:a action="index_matching" class="fa fa-dot-circle-o" id="bowling"><span>Bowling</span></s:a></li>
							</ul>
						</nav>
					</header>
				<!-- Footer -->
					<footer id="footer">
						<span class="copyright">&copy; 2016 <a href="http://html5up.net">Free CSS</a>. All Rights Reserved</span>
					</footer>
			</div>
		</div>
	</body>
</html>