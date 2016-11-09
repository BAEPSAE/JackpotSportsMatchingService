<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
    <title>ResultOfGame_GetNumber</title>
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
	var check = '<s:property value="sports" />';
	if(check == 1) {
		alert("확인되었습니다.");
		this.close();
	}
	if(check == 2) {
		alert("인증키가 일치하지 않습니다.");
		this.close();
	}

	function formCheck() {
		var key1 = document.getElementById('key1').value;
		var key2 = document.getElementById('key2').value;
		
		if(key1.length != 3) {
			alert('인증번호는 각 3자리를 입력해주세요');
			return false;
		}
		
		if(key2.length != 3) {
			alert('인증번호는 각 3자리를 입력해주세요');
			return false;
		}
		
		return true;
	}
	
	
</script>
</head>
<body>
<div class="content-wrap">
    <!-- main page content. the place to put widgets in. usually consists of .row > .col-md-* > .widget.  -->
   <!--  <main id="content" class="content" role="main"> -->
        <!-- <div class="row"> -->
            <!-- <div class="col-lg-8"> -->
            <!-- <div class="col-xl-4 col-md-6 col-xs-10 col-xl-offset-4 col-md-offset-3 col-xs-offset-1"> -->
                <%-- <section class="widget"> --%>
                    <!-- 회원가입 폼 -->
                    <div class="widget-body">
                        <form class="form-horizontal" role="form" onsubmit="return formCheck()">
                            <fieldset style="text-align: center; margin-top: 10px;">
                            	<legend style="height: 25px"><strong>결과 입력</strong></legend>
                            </fieldset>
                            	<!-- 인증키 -->
                            	<h5 align="center"><s:property value="key"/></h5>
                                <!-- 인증번호 받기 -->
                                <div class="form-group row" style="text-align: center;">
                                    <div class="form-group" style="width: 45%; position: relative; display: inline-block;">
                                   		<input id="key1" type="text" name="item.ground_id" class="form-control form-control-lg" placeholder="인증번호">
                               		</div>
                               		 <div class="form-group" style="width: 45%; position: relative; display: inline-block;">
                                   		<input id="key2" type="text" name="item.ground_name" class="form-control form-control-lg" placeholder="인증번호">
                               		</div>
                                </div>
                            <div class="form-actions">
                                <div class="row">
                                    <div class="col-md-offset-4 col-md-7" style="margin-left: 30.8%;">
                                        <button type="submit" formaction="win" class="btn btn-primary">승리</button>
                                        <s:hidden value="%{ground_Id}" name="item.ground_phone" />
                                        <button type="submit" formaction="draw" class="btn btn-inverse">무승부</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                <%-- </section> --%>
            <!-- </div> -->
        <!-- </div> -->
    <!-- </main> -->
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