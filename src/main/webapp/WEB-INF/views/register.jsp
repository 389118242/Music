<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<title>注册 - 有氧音乐</title>
<meta name="description"
	content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<link rel="stylesheet" href="js/jPlayer/jplayer.flat.css"
	type="text/css" />
<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
<link rel="stylesheet" href="css/animate.css" type="text/css" />
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css" />
<link rel="stylesheet" href="css/simple-line-icons.css" type="text/css" />
<link rel="stylesheet" href="css/font.css" type="text/css" />
<link rel="stylesheet" href="css/app.css" type="text/css" />
<!--[if lt IE 9]>
    <script src="js/ie/html5shiv.js"></script>
    <script src="js/ie/respond.min.js"></script>
    <script src="js/ie/excanvas.js"></script>
  <![endif]-->
</head>
<body class="bg-info dker" style="overflow-y:scroll">

	<section id="content" class="m-t-lg wrapper-md animated fadeInDown">
		<div class="container aside-xl">
			<a class="navbar-brand block" href="index"><span
				class="h1 font-bold">有氧</span></a>
			<header class="wrapper text-center">
				<strong>加入有氧,一起呼吸音乐</strong>
			</header>
			<form data-validate="parsley" data-parsley-validate action="register"
				method="POST">
				<div class="form-group">
					<input placeholder="账号"
						class="form-control rounded input-lg text-center no-border"
						data-required="true" name="userAccount" data-parsley-remote
						data-parsley-remote-options='{ "type": "POST","dataType":"json"}'
						data-parsley-remote-validator="checkAccount">
					<!-- 
 						data-remote="accountIsExists" data-remote-method='POST'
 -->
				</div>
				<div class="form-group">
					<input placeholder="昵称"
						class="form-control rounded input-lg text-center no-border"
						data-parsley-required name="userName">
				</div>
				<div class="form-group">
					<input type="password" placeholder="密码"
						class="form-control rounded input-lg text-center no-border"
						data-parsley-required id="pwd" name="userPassword">
				</div>
				<div class="form-group">
					<input type="password" placeholder="确认密码"
						class="form-control rounded input-lg text-center no-border"
						data-parsley-equalto="#pwd" data-parsley-required="true">
				</div>
				<div class="form-group">
					<input type="email" placeholder="email"
						class="form-control rounded input-lg text-center no-border"
						data-parsley-required="true" name="userEmail">
				</div>

				<button type="submit"
					class="btn btn-lg btn-warning lt b-white b-2x btn-block btn-rounded">
					<i class="icon-arrow-right pull-right"></i><span class="m-r-n-lg">
						注册</span>
				</button>
				<div class="line line-dashed"></div>
				<p class="text-muted text-center">
					<small>已有账号?</small>
				</p>
				<a href="login" class="btn btn-lg btn-info btn-block btn-rounded">
					登录</a>
			</form>

		</div>
	</section>
	<!-- footer -->
	<footer id="footer">
		<div class="text-center padder clearfix">
			<p>
				<small>照照后援会小组<br>&copy; 2016
				</small>
			</p>
		</div>
	</footer>
	<!-- / footer -->
	<script src="js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.js"></script>
	<!-- parsley -->
	<script type="text/javascript" src="js/parsley.min.js"></script>
	<!-- 
	<script src="js/parsley/parsley.min.js"></script>
	 -->
	<!-- App -->
	<script src="js/app.js"></script>
	<script src="js/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="js/app.plugin.js"></script>
	<script type="text/javascript" src="js/jPlayer/jquery.jplayer.min.js"></script>
	<script type="text/javascript"
		src="js/jPlayer/add-on/jplayer.playlist.min.js"></script>
	<script type="text/javascript" src="js/jPlayer/demo.js"></script>
	<script type="text/javascript">
		window.Parsley.addAsyncValidator('checkAccount', function(xhr) {
			console.log(this.$element); // jQuery Object[ input[name="q"] ]
			return xhr.responseJSON.ret;
		}, 'accountIsExists');
	</script>
</body>
</html>