<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
    <title>로그인</title>
    <link href="css/application.min.css" rel="stylesheet">
    <link rel="shortcut icon" href="img/favicon.png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <script>
    </script>
</head>
<body class="login-page">
<div class="container">
    <main id="content" class="widget-login-container" role="main">
        <div class="row">
            <div class="col-xl-4 col-md-6 col-xs-10 col-xl-offset-4 col-md-offset-3 col-xs-offset-1">
                <h5 class="widget-login-logo animated fadeInUp">
                    <i class="fa fa-circle text-gray"></i>
                    우리동네 골목대장
                    <i class="fa fa-circle text-warning"></i>
                </h5>
                <section class="widget widget-login animated fadeInUp">
                    <header>
                        <h3>로그인</h3>
                    </header>
                    <div class="widget-body">
                        <form class="login-form mt-lg">
                            <div class="form-group">
                                <input type="text" class="form-control" id="id" placeholder="아이디">
                            </div>
                            <div class="form-group">
                                <input class="form-control" id="password" type="text" placeholder="비밀번호">
                            </div>
                            <div class="clearfix">
                                <div class="btn-toolbar pull-xs-right">
                                    <button type="button" class="btn btn-secondary btn-sm">가입하기</button>
                                    <a class="btn btn-inverse btn-sm" href="index.html">로그인</a>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 col-md-push-6">
                                    <div class="clearfix">
                                        <div class="abc-checkbox widget-login-info pull-xs-right ml-n-lg">
                                            <input type="checkbox" id="checkbox1" value="1">
                                            <label for="checkbox1">아이디를 기억합니다</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </section>
            </div>
        </div>
    </main>
    <footer class="page-footer">
        2016 &copy; B_Class. Admin Dashboard Template.
    </footer>
</div>
<!-- The Loader. Is shown when pjax happens -->
<div class="loader-wrap hiding hide">
    <i class="fa fa-circle-o-notch fa-spin-fast"></i>
</div>

<!-- common libraries. required for every page-->
<script src="vendor/jquery/dist/jquery.min.js"></script>
<script src="vendor/jquery-pjax/jquery.pjax.js"></script>
<script src="vendor/tether/dist/js/tether.js"></script>
<script src="vendor/bootstrap/js/dist/util.js"></script>
<script src="vendor/bootstrap/js/dist/collapse.js"></script>
<script src="vendor/bootstrap/js/dist/dropdown.js"></script>
<script src="vendor/bootstrap/js/dist/button.js"></script>
<script src="vendor/bootstrap/js/dist/tooltip.js"></script>
<script src="vendor/bootstrap/js/dist/alert.js"></script>
<script src="vendor/slimScroll/jquery.slimscroll.min.js"></script>
<script src="vendor/widgster/widgster.js"></script>

<!-- common app js -->
<script src="js/settings.js"></script>
<script src="js/app.js"></script>

<!-- page specific libs -->
<!-- page specific js -->
</body>
</html>