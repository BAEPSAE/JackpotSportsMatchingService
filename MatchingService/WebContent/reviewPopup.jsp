<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>경기장 한줄평</title>
<link href="../css/application.min.css" rel="stylesheet">
<link rel="shortcut icon" href="../img/favicon.png">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="description" content="">
<meta name="author" content="">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<script src="../js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	$(function() {

		var strWidth = $('#container').outerWidth()
				+ (window.outerWidth - window.innerWidth);
		var strHeight = $('#container').outerHeight()
				+ (window.outerHeight - window.innerHeight) + 50;
		window.resizeTo(strWidth, strHeight);

		$('#send').on('click', function() {
			$('#cf').submit();
		});

	});
</script>
</head>
<body>

	<div class="content-wrap">
		<!-- main page content. the place to put widgets in. usually consists of .row > .col-md-* > .widget.  -->
		<div id="container">
			<main id="content" class="content" role="main"> <!-- jquery ui sortable chrome overflow-x fix. when set to hidden does not behaves as expected. resetting back
             just for this page.
             http://bugs.jqueryui.com/ticket/9588 -->
			<style>
body {
	overflow-x: visible;
}
</style>
			<section class="widget">

				<div class="widget-body">
					<div
						class="widget-top-overflow windget-padding-md clearfix bg-warning text-white">
						<h3>
							<span class="fw-semi-bold"><s:property
									value="item.ground_name" /></span>
						</h3>
						<p class="text-light fs-mini">
							<s:property value="item.ground_address" />
						</p>
					</div>

				</div>
				<footer class="bg-body-light">
					<ul class="post-links">
						<li><span class="text-danger"><i class="fa fa-heart"></i>
								경기장을 평가해주세요</span></li>
					</ul>
					<ul class="post-comments mt mb-0">
						<s:iterator value="groundList">
							<li>
								<div class="comment-body">
									<h6 class="author fs-sm fw-semi-bold">
										<s:property value="user_Id" />
									</h6>
									<p class="fs-mini">
										<s:property value="content" />
									</p>
								</div>
							</li>
						</s:iterator>

						<s:form id="cf" action="comment" method="post">
							<s:hidden value="%{ground_Id}" name="ground_Id"></s:hidden>
							<li>
								<div class="input-group input-group-sm">
									<input id="msg" name="gr.content" type="text"
										class="form-control" placeholder="Write your comment">
									<span class="input-group-btn">
										<button type="submit" id="send" class="btn btn-secondary">Send</button>
									</span>
								</div>
							</li>
						</s:form>
					</ul>
				</footer>
			</section>
			</main>
		</div>
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
	<script src="../vendor/bootstrap/js/dist/modal.js"></script>
	<script
		src="../vendor/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
	<script src="../vendor/jquery-autosize/jquery.autosize.min.js"></script>
	<script
		src="../vendor/bootstrap3-wysihtml5/lib/js/wysihtml5-0.3.0.min.js"></script>
	<script
		src="../vendor/bootstrap3-wysihtml5/src/bootstrap3-wysihtml5.js"></script>
	<script src="../vendor/select2/select2.min.js"></script>
	<script src="../vendor/switchery/dist/switchery.min.js"></script>
	<script src="../vendor/moment/min/moment.min.js"></script>
	<script
		src="../vendor/eonasdan-bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
	<script
		src="../vendor/mjolnic-bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
	<script src="../vendor/jasny-bootstrap/js/inputmask.js"></script>
	<script src="../vendor/jasny-bootstrap/js/fileinput.js"></script>
	<script src="../vendor/holderjs/holder.js"></script>
	<script src="../vendor/dropzone/dist/min/dropzone.min.js"></script>
	<script src="../vendor/markdown/lib/markdown.js"></script>
	<script src="../vendor/bootstrap-markdown/js/bootstrap-markdown.js"></script>
	<script
		src="../vendor/seiyria-bootstrap-slider/dist/bootstrap-slider.min.js"></script>

	<!-- page specific js -->
</body>
</html>