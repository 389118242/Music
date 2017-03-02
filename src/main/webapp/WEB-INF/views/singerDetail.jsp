<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<title>歌手详情页</title>
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
<link rel="stylesheet" href="css/pop.css" type="text/css" />

<!--[if lt IE 9]>
    <script src="js/ie/html5shiv.js"></script>
    <script src="js/ie/respond.min.js"></script>
    <script src="js/ie/excanvas.js"></script>
  <![endif]-->
<style>
.modal {
	right: 0;
	overflow: auto;
	outline: 0;
}
</style>
</head>
<body class="">
	<section class="vbox">
		<section>
			<section class="hbox stretch">

				<section id="content">
					<section class="vbox" id="bjax-el">
						<section class="scrollable wrapper-lg">
							<div class="row">
								<div class="col-sm-8">
									<div class="panel wrapper-lg">
										<div class="row">
											<div class="col-sm-5">
												<img src="singerImg/${singer.singerImg}"
													class="img-full m-b">
											</div>
											<div class="col-sm-7">
												<h4 class="m-t-none text-black">${singer.singerName}</h4>
												<p>${singer.singerDetail }</p>
											</div>
											<div id="myModal" role="dialog" tabindex="-1"
												aria-labelledby="myModalLabel" aria-hidden="true"
												class="modal fade auto-1473474137786 m-layer z-show m-layer-w2"
												style="top: initial; left: initial;">
												<div class="zbar" id="auto-id-bpDfekqTEA8M9tat">
													<button type="button" class="close" data-dismiss="modal"
														aria-hidden="true"
														style="background-color: white; color: black">&times;</button>
													<div class="zttl">添加到歌单</div>
												</div>
												<div class="zcnt">
													<div class="lyct lyct-1 m-favgd f-cb">
														<div class="tit j-flag" id="auto-id-8K3DJpfGaGK7ICMf">
															<i class="u-icn u-icn-33"></i>新歌单
														</div>
														<div class="j-flag" id="auto-id-lH2ZTJaEJry8z8NG">
															<ul>
																<li data-id="174140198" class="xtag "><div
																		class="item f-cb">
																		<div class="left">
																			<a href="javascript:void(0)" class="avatar"
																				target="_blank"><img alt=""
																				src="http://p4.music.126.net/zPaZBLAigYIxYHg28VABdg==/3286440256922472.jpg?param=40y40"></a>
																		</div>
																		<p class="name f-thide">
																			<a class="s-fc0" href="javascript:void(0)"
																				target="_blank">我喜欢的音乐</a>
																		</p>
																		<p class="s-fc3">2首</p>
																	</div></li>
																<li data-id="459518050" class="xtag "><div
																		class="item f-cb">
																		<div class="left">
																			<a href="javascript:void(0)" class="avatar"
																				target="_blank"><img alt=""
																				src="http://p4.music.126.net/cU7izHzkhfLXOVVsd5Oobw==/5832909185361985.jpg?param=40y40"></a>
																		</div>
																		<p class="name f-thide">
																			<a class="s-fc0" href="javascript:void(0)"
																				target="_blank">林俊杰</a>
																		</p>
																		<p class="s-fc3">14首</p>
																	</div></li>
																<li data-id="452454259" class="xtag "><div
																		class="item f-cb">
																		<div class="left">
																			<a href="javascript:void(0)" class="avatar"
																				target="_blank"><img alt=""
																				src="http://p3.music.126.net/cU7izHzkhfLXOVVsd5Oobw==/5832909185361985.jpg?param=40y40"></a>
																		</div>
																		<p class="name f-thide">
																			<a class="s-fc0" href="javascript:void(0)"
																				target="_blank">跑步</a>
																		</p>
																		<p class="s-fc3">14首</p>
																	</div></li>
																<li data-id="387988392" class="xtag "><div
																		class="item f-cb">
																		<div class="left">
																			<a href="javascript:void(0)" class="avatar"
																				target="_blank"><img alt=""
																				src="http://p4.music.126.net/pVqkX6H0FWZwNdonDc_2uA==/7865906185633611.jpg?param=40y40"></a>
																		</div>
																		<p class="name f-thide">
																			<a class="s-fc0" href="javascript:void(0)"
																				target="_blank">哈哈</a>
																		</p>
																		<p class="s-fc3">10首</p>
																	</div></li>
																<li data-id="174134263" class="xtag "><div
																		class="item f-cb">
																		<div class="left">
																			<a href="javascript:void(0)" class="avatar"
																				target="_blank"><img alt=""
																				src="http://p4.music.126.net/oAG2ZzQJqrmaAmZ45ZSKow==/69269232550727.jpg?param=40y40"></a>
																		</div>
																		<p class="name f-thide">
																			<a class="s-fc0" href="javascript:void(0)"
																				target="_blank">刚刚好</a>
																		</p>
																		<p class="s-fc3">10首</p>
																	</div></li>
															</ul>
														</div>
													</div>
												</div>
											</div>
										</div>

										<h4 class="m-t-lg m-b">热门歌曲</h4>
										<ul class="list-group list-group-lg">
											<c:forEach items="${songTop50}" var="song">
												<li class="list-group-item">
													<div class="pull-right m-l">
														<a href="#" class="m-r-sm"><i class="icon-plus"></i></a> <a
															href="#" class="m-r-sm"><i class="icon-heart"
															data-toggle="modal" data-target="#myModal"></i></a> <a
															href="#" class="m-r-sm"><i
															class="icon-cloud-download"></i></a>
													</div> <a href="#" class="jp-play-me m-r-sm pull-left"> <i
														class="icon-control-play text "></i> <i
														class="icon-control-pause text-active"></i>
												</a>
													<div class="clear text-ellipsis">
														<span class="text-muted">${song.songName}</span> <span
															class="text-muted"> --- ${song.album.albumName}</span> <span
															class="text-muted"> --- ${song.songTime}</span>
													</div>
												</li>
											</c:forEach>
										</ul>
									</div>
								</div>
								<div class="col-sm-4">
									<div class="panel panel-default">
										<div class="panel-heading">专辑</div>
										<div id="mAlbum" class="panel-body">
											<ul class="pagination pagination">
											</ul>
										</div>
									</div>
								</div>
							</div>
						</section>
					</section>
					<a href="#" class="hide nav-off-screen-block"
						data-toggle="class:nav-off-screen,open" data-target="#nav,html"></a>
				</section>
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
		var present = 1;
		var singerId = ${singer.singerId};
		var totalPage = 1;
		var addEvents = function(total) {
			$('#mAlbum li').click(
					function() {
						var text = $(this).children().html();
						if (isNaN(text)) { //不是数字
							if ($(this).index() == 0 && present != 1) {
								getAlbumsOfSinger(present - 1);
							} else if ($(this).index() == total - 1
									&& present != totalPage) {
								getAlbumsOfSinger(present + 1);
							}
						} else {//数字
							getAlbumsOfSinger(parseInt(text));
						}
					});
		}

		var getAlbumsOfSinger = function(page) {
			$
					.ajax({
						url : "getAlbumsOfSinger",
						type : "POST",
						dataType : "json",
						data : {
							"singerId" : singerId,
							"page" : page
						},
						success : function(ret) {
							var albums = ret.albums;
							$('#mAlbum').children('article').remove();
							for (var i = 0; i < albums.length; i++) {
								$('#mAlbum ul')
										.before(
												'<article class="media">'
														+ '<a href="#" class="pull-left thumb-md m-t-xs"> <img '+
															'src="albumImg\\'+albums[i].albumImg+'"></a>'
														+ '<div class="media-body">'
														+ '<a href="#" class="font-semibold">'
														+ albums[i].albumName
														+ '</a>'
														+ '<div class="text-xs block m-t-xs">'
														+ albums[i].issueTime
														+ '</div>' + '</div>'
														+ '</article>');
							}
							var bp = ret.bp;
							var ep = ret.ep;
							$('#mAlbum ul').html('');
							if (ep > bp) {
								$('#mAlbum ul')
										.html(
												'<li><a href="javascript:;"><i '+
															'class="fa fa-chevron-left"></i></a></li>'
														+ '<li><a href="javascript:;"><i '+
																	'class="fa fa-chevron-right"></i></a></li>');
								for (var i = bp; i < ep + 1; i++) {
									$('#mAlbum ul li:last').before(
											'<li><a href="javascript:;">' + i
													+ '</a></li>');
								}
							}

							present = ret.present;
							totalPage = ret.totalPage;
							addEvents(ep - bp + 3);
						}
					});
		}
		$(function() {
			getAlbumsOfSinger(1);
		});
	</script>

</body>
</html>