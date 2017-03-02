<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<title>登录 - 有氧音乐</title>
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
<body class="bg-info dker" class="overflow-y:scroll">
	<section id="content" class="m-t-lg wrapper-md animated fadeInUp">
		<div class="container aside-xl">
			<a class="navbar-brand block" href="index"><span
				class="h1 font-bold">有氧</span></a>
			<section class="m-b-lg">
				<header class="wrapper text-center">
					<strong>进入有氧,一起呼吸音乐</strong>
				</header>
				<form data-validate="parsley">
					<div class="form-group">
						<input type="text" placeholder="账号"
							class="form-control rounded input-lg text-center no-border"
							name="userAccount" data-required>
					</div>
					<div class="form-group">
						<input type="password" placeholder="密码"
							class="form-control rounded input-lg text-center no-border"
							name="userPassword" data-required>
					</div>
					<div class="form-group" style="margin: 0">
						<div class="col-lg-offset-2 col-lg-10" style="margin-left: 0">
							<div class="checkbox i-checks" style="margin-top: 0">
								<label> <input type="checkbox" checked
									name="remberPassword"><i></i> 记住密码
								</label>
							</div>
						</div>
					</div>
					<button type="submit"
						class="btn btn-lg btn-warning lt b-white b-2x btn-block btn-rounded">
						<i class="icon-arrow-right pull-right"></i><span class="m-r-n-lg">登录</span>
					</button>
					<div class="text-center m-t m-b">
						<a href="#"><small>忘记密码 ?</small></a>
					</div>
					<div class="line line-dashed"></div>
					<p class="text-muted text-center">
						<small>没有账号?</small>
					</p>
					<a href="register" class="btn btn-lg btn-info btn-block rounded">注册</a>
				</form>
			</section>
		</div>
	</section>
	<!-- footer -->
	<footer id="footer">
		<div class="text-center padder">
			<p>
				<small>照照的后援团小组<br>&copy; 2016
				</small>
			</p>
		</div>
	</footer>
	<!-- / footer -->
	<script src="js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.js"></script>
	<!-- parsley -->
	<script src="js/parsley/parsley.min.js"></script>
	<!-- App -->
	<script src="js/app.js"></script>
	<script src="js/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="js/app.plugin.js"></script>
	<script type="text/javascript" src="js/jPlayer/jquery.jplayer.min.js"></script>
	<script type="text/javascript"
		src="js/jPlayer/add-on/jplayer.playlist.min.js"></script>
	<script type="text/javascript" src="js/jPlayer/demo.js"></script>
	<script type="text/javascript">
		$('button[type=submit]')
				.click(
						function(event) {
							var a = $('form').parsley();
							var tag = true;
							var items = a.items;
							for (var i = 0; i < items.length - 1; i++) {
								var item = items[i];
								var itemTag = item.validate();
								if (!itemTag) {
									tag = itemTag;
									break;
								}
							}
							if (tag) {
								$
										.ajax({
											url : "login",
											type : "POST",
											data : {
												"userAccount" : $(
														'input[type=text]')
														.val(),
												"userPassword" : $(
														'input[type=password]')
														.val(),
												"isAutoLogin" : $(
														'input[type=checkbox]')
														.prop('checked')
											},
											success : function(ret) {
												if (ret) {
													location.href = "index";
												} else {
													if ($('#errorMMM').length == 0)
														$(
																'input[type=password]')
																.after(
																		'<div class="form-group" id="errorMMM" style="text-align:center;margin-top: 15px;font-size=18px;color:red"">'
																				+ '账号或密码错误'
																				+ '</div>');
												}
											}
										});
							}
							event.preventDefault();
						});
	</script>

</body>
</html>