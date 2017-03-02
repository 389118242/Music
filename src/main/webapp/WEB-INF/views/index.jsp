<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<title></title>
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
<style>
#myMusicPlay {
	position: absolute;
	bottom: 0;
}

.tabs-left>ul.nav-tabs {
	float: left;
}

.tabs-left>.nav-tabs>li {
	float: none;
	background-color: #edf2f3;
}

.tabs-left>.nav-tabs>li>a {
	border: 0;
	margin: 0;
}

.tabs-left>.nav-tabs {
	border: 0;
	/*position: relative;*/
	/*top: 27px;*/
	/*left:13px;*/
	text-align: center;
	width: 147px;
}

.tabs-left>.nav-tabs>li>a:hover {
	border: 0;
	background-color: #fff;
}

.tabs-left>.nav-tabs>li.active>a {
	border: 0;
	background-color: #fff;
}

.tab-content {
	overflow: auto;
	background-color: white;
}

.tabs-left {
	background-color: #edf2f3;
	height: 100%;
}

.scrollable .tab-content {
	height: 100%;
}

.tabs-left .tab-content {
	background-color: #fff;
}

#interaction {
	height: 100%;
}

.tabs-left .tab-pane {
	height: 100%;
	padding: 13px 27px;
}

/*在setting页中 填充空白  --*/
#tianchong {
	height: 106px;
	width: 100%;
	padding-left: 44%;
	padding-top: 5%;
	margin-top: 2.49%;
}
/*在setting中 将头像放置中间*/
#touxiang {
	width: 30%;
	margin-left: 40%;
}
/*在setting中表单保存取消按钮居中*/
#tijiao {
	margin-left: 38%;
	margin-top: 5%;
}
/*表单中textarea不能改变大小*/
.form-control {
	border-color: #cbd5dd;
	border-radius: 2px;
	resize: none;
}
</style>
</head>
<body class="">
	<section class="vbox">
		<header
			class="bg-white-only header header-md navbar navbar-fixed-top-xs">
			<div class="navbar-header aside bg-info nav-xs">
				<a class="btn btn-link visible-xs"
					data-toggle="class:nav-off-screen,open" data-target="#nav,html">
					<i class="icon-list"></i>
				</a> <a href="index" class="navbar-brand text-lt"> <i
					class="icon-earphones"></i> <img src="images/logo.png" alt="."
					class="hide"> <span class="hidden-nav-xs m-l-sm">Musik</span>
				</a> <a class="btn btn-link visible-xs" data-toggle="dropdown"
					data-target=".user"> <i class="icon-settings"></i>
				</a>
			</div>
			<ul class="nav navbar-nav hidden-xs">
				<li><a href="#nav,.navbar-header"
					data-toggle="class:nav-xs,nav-xs" class="text-muted"> <i
						class="fa fa-indent text"></i> <i class="fa fa-dedent text-active"></i>
				</a></li>
			</ul>
			<form
				class="navbar-form navbar-left input-s-lg m-t m-l-n-xs hidden-xs"
				role="search">
				<div class="form-group">
					<div class="input-group">
						<span class="input-group-btn">
							<button type="submit"
								class="btn btn-sm bg-white btn-icon rounded">
								<i class="fa fa-search"></i>
							</button>
						</span> <input type="text"
							class="form-control input-sm no-border rounded"
							placeholder="Search songs, albums...">
					</div>

				</div>
			</form>
			<div class="navbar-right ">
				<ul class="nav navbar-nav m-n hidden-xs nav-user user">
					<c:if test="${user!=null }">
						<li class="hidden-xs"><a
							href="profile?userId=${user.userId }" target="mContent" class="dropdown-toggle lt">
								<i class="icon-bell"></i> <c:if test="${noRead>0 }">
									<span class="badge badge-sm up bg-danger">${noRead}</span>
								</c:if>
						</a></li>
						<li class="dropdown"><a href="#"
							class="dropdown-toggle bg clear" data-toggle="dropdown"> <span
								class="thumb-sm avatar pull-right m-t-n-sm m-b-n-sm m-l-sm">
									<img src="${img }" alt="...">
							</span> ${user.userName } <b class="caret"></b>
						</a>
							<ul class="dropdown-menu animated fadeInRight">
								<li><span class="arrow top"></span> <a href="setting"
									target="mContent">个人设置</a></li>
								<li><a href="profile?userId=${user.userId }"
									target="mContent">我的主页</a></li>
								<li><a href="mymusic" target="mContent">我的音乐 </a></li>
								<li><a href="alterPassword" target="mContent">修改密码</a></li>
								<li class="divider"></li>
								<li><a href="userLogout" data-toggle="ajaxModal">退出</a></li>
							</ul></li>
					</c:if>
					<c:if test="${user==null }">
						<ul class="nav navbar-nav m-n hidden-xs nav-user user">
							<li class="hidden-xs"><a href="login" class="bg clear">
									<i class="icon-login"></i> 登录
							</a></li>
							<li class="dropdown"><a href="register" class="lt"> <i
									class="icon-home"></i> 注册
							</a></li>
						</ul>
					</c:if>
				</ul>
			</div>
		</header>
		<section>
			<section class="hbox stretch">
				<!-- .aside -->
				<aside class="bg-black dk nav-xs aside hidden-print" id="nav">
					<section class="vbox">
						<section class="w-f-md scrollable">
							<div class="slim-scroll" data-height="auto"
								data-disable-fade-out="true" data-distance="0" data-size="10px"
								data-railOpacity="0.2">


								<!-- nav -->
								<nav class="nav-primary hidden-xs">
									<ul class="nav bg clearfix">
										<li class="hidden-nav-xs padder m-t m-b-sm text-xs text-muted">
											Discover</li>
										<li><a href="indexFrame" target="mContent"> <i
												class="icon-disc icon text-success"></i> <span
												class="font-bold">首页</span>
										</a></li>
										<li><a href="search" target="mContent"> <i
												class="fa fa-search icon text-primary-lter"></i> <span
												class="font-bold">搜索</span>
										</a></li>
										<li><a href="recommend" target="mContent"> <i
												class="icon-music-tone-alt icon text-info"></i> <span
												class="font-bold">推荐歌单</span>
										</a></li>
										<li><a href="alllist" target="mContent"> <i
												class="icon-list icon  text-info-dker"></i> <span
												class="font-bold">歌单分类</span>
										</a></li>
										<li class="m-b hidden-nav-xs"></li>
									</ul>
									<!--  
									<ul class="nav" data-ride="collapse">
										<li class="hidden-nav-xs padder m-t m-b-sm text-xs text-muted">
											Interface</li>

										<li><a href="#" class="auto"> <span
												class="pull-right text-muted"> <i
													class="fa fa-angle-left text"></i> <i
													class="fa fa-angle-down text-active"></i>
											</span> <i class="icon-grid icon"> </i> <span>Pages</span>
										</a>
											<ul class="nav dk text-sm">
												<li><a href="profile.html" target="mContent"
													class="auto"> <i class="fa fa-angle-right text-xs"></i>

														<span>Profile</span>
												</a></li>
												<li><a href="blog.html" class="auto"> <i
														class="fa fa-angle-right text-xs"></i> <span>Blog</span>
												</a></li>
												<li><a href="invoice.html" class="auto"> <i
														class="fa fa-angle-right text-xs"></i> <span>Invoice</span>
												</a></li>
												<li><a href="gmap.html" class="auto"> <i
														class="fa fa-angle-right text-xs"></i> <span>Google
															Map</span>
												</a></li>
												<li><a href="jvectormap.html" class="auto"> <i
														class="fa fa-angle-right text-xs"></i> <span>Vector
															Map</span>
												</a></li>
												<li><a href="signin.html" class="auto"> <i
														class="fa fa-angle-right text-xs"></i> <span>Signin</span>
												</a></li>
												<li><a href="signup.html" class="auto"> <i
														class="fa fa-angle-right text-xs"></i> <span>Signup</span>
												</a></li>
												<li><a href="404.html" class="auto"> <i
														class="fa fa-angle-right text-xs"></i> <span>404</span>
												</a></li>
											</ul></li>
									</ul>
									<ul class="nav text-sm">
										<li class="hidden-nav-xs padder m-t m-b-sm text-xs text-muted">
											<span class="pull-right"><a href="#"><i
													class="icon-plus i-lg"></i></a></span> Playlist
										</li>
										<li><a href="#"> <i class="icon-music-tone icon"></i>
												<span>Hip-Pop</span>
										</a></li>
										<li><a href="#"> <i
												class="icon-playlist icon text-success-lter"></i> <b
												class="badge bg-success dker pull-right">9</b> <span>Jazz</span>
										</a></li>
									</ul>
									-->
								</nav>
								<!-- / nav -->
							</div>
						</section>
						<c:if test="${user!=null }">
							<footer class="footer hidden-xs no-padder text-center-nav-xs">
								<div class="bg hidden-xs ">
									<div class="dropdown dropup wrapper-sm clearfix">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown">
											<span class="thumb-sm avatar pull-left m-l-xs"> <img
												src="${img }" class="dker" alt="...">
										</span> <span class="hidden-nav-xs clear"> <span
												class="block m-l"> <strong class="font-bold text-lt">${user.userName }</strong>
													<b class="caret"></b>
											</span> <span class="text-muted text-xs block m-l">Art
													Director</span>
										</span>
										</a>
										<ul class="dropdown-menu animated fadeInRight aside text-left">
											<li><span class="arrow bottom hidden-nav-xs"></span> <a
												href="setting" target="mContent">个人设置</a></li>
											<li><a href="profile?userId=${user.userId }"
												target="mContent">我的主页</a></li>
											<li><a href="mymusic" target="mContent">我的音乐 </a></li>
											<li><a href="alterPassword" target="mContent">修改密码</a></li>
											<li class="divider"></li>
											<li><a href="userLogout" data-toggle="ajaxModal">退出</a>
											</li>
										</ul>
									</div>
								</div>
							</footer>
						</c:if>
					</section>
				</aside>
				<iframe name="mContent" width="100%" height="100%"
					style="padding-bottom: 60px; boder: 0" src="indexFrame"></iframe>
				<footer id="myMusicPlay" class="footer bg-dark">
					<div id="jp_container_N">
						<div class="jp-type-playlist">
							<div id="jplayer_N" class="jp-jplayer hide"></div>
							<div class="jp-gui">
								<div class="jp-video-play hide">
									<a class="jp-video-play-icon">play</a>
								</div>
								<div class="jp-interface">
									<div class="jp-controls">
										<div>
											<a class="jp-previous"><i
												class="icon-control-rewind i-lg"></i></a>
										</div>
										<div>
											<a class="jp-play"><i class="icon-control-play i-2x"></i></a>
											<a class="jp-pause hid"><i
												class="icon-control-pause i-2x"></i></a>
										</div>
										<div>
											<a class="jp-next"><i class="icon-control-forward i-lg"></i></a>
										</div>
										<div class="hide">
											<a class="jp-stop"><i class="fa fa-stop"></i></a>
										</div>
										<div>
											<a class="" data-toggle="dropdown"
												data-target="#playlist,#lrc_content"><i
												class="icon-list"></i></a>
										</div>
										<div class="jp-progress hidden-xs">
											<div class="jp-seek-bar dk">
												<div class="jp-play-bar bg-info"></div>
												<div class="jp-title text-lt">
													<ul>
														<li></li>
													</ul>
												</div>
											</div>
										</div>
										<div
											class="hidden-xs hidden-sm jp-current-time text-xs text-muted"></div>
										<div
											class="hidden-xs hidden-sm jp-duration text-xs text-muted"></div>
										<div class="hidden-xs hidden-sm">
											<a class="jp-mute" title="mute"><i class="icon-volume-2"></i></a>
											<a class="jp-unmute hid" title="unmute"><i
												class="icon-volume-off"></i></a>
										</div>
										<div class="hidden-xs hidden-sm jp-volume">
											<div class="jp-volume-bar dk">
												<div class="jp-volume-bar-value lter"></div>
											</div>
										</div>
										<div>
											<a class="jp-shuffle" title="shuffle"><i
												class="icon-shuffle text-muted"></i></a> <a
												class="jp-shuffle-off hid" title="shuffle off"><i
												class="icon-shuffle text-lt"></i></a>
										</div>
										<div>
											<a class="jp-repeat" title="repeat"><i
												class="icon-loop text-muted"></i></a> <a
												class="jp-repeat-off hid" title="repeat off"><i
												class="icon-loop text-lt"></i></a>
										</div>
										<div class="hide">
											<a class="jp-full-screen" title="full screen"><i
												class="fa fa-expand"></i></a> <a class="jp-restore-screen"
												title="restore screen"><i class="fa fa-compress text-lt"></i></a>
										</div>
									</div>
								</div>
							</div>
							<div class="jp-playlist dropup" id="playlist">
								<ul class="dropdown-menu aside-xl dker">
									<!-- The method Playlist.displayPlaylist() uses this unordered list -->
									<li class="list-group-item"></li>
								</ul>
							</div>
							<div class="dropup" id="lrc_content">
								<ul class="dropdown-menu dker" id="lrc_list">
								</ul>
							</div>
							<div class="jp-no-solution hide">
								<span>Update Required</span> To play the media you will need to
								either update your browser to a recent version or update your <a
									href="http://get.adobe.com/flashplayer/" target="_blank">Flash
									plugin</a>.
							</div>
						</div>
					</div>
				</footer>
			</section>

		</section>
	</section>

	<script src="js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.js"></script>
	<!-- App -->
	<script src="js/app.js"></script>
	<script src="js/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="js/app.plugin.js"></script>
	<script type="text/javascript" src="js/jPlayer/jquery.jplayer.min.js"></script>
	<script type="text/javascript"
		src="js/jPlayer/add-on/jplayer.playlist.min.js"></script>
	<script type="text/javascript" src="js/jPlayer/demo.js"></script>
	<script type="text/javascript">
		$('button[type=submit]').click(function(event) {
			var key = $(this).parents('form').find('input[type=text]').val();
			$('iframe[name=mContent]').attr('src', "search?key=" + key);
			event.preventDefault();
		});
	</script>
	<script type="text/javascript" src="js/musicPlay.js"></script>
</body>
</html>