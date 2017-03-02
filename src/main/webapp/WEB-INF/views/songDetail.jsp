<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<title>歌曲详情</title>
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
<link rel="stylesheet" href="css/bulidpop.css" type="text/css" />
<link rel="stylesheet" href="css/jquery.sinaEmotion.css" type="text/css" />
<script src="js/jquery.min.js"></script>
<script src="js/ie/html5shiv.js"></script>
<script src="js/ie/respond.min.js"></script>
<script src="js/ie/excanvas.js"></script>

<style>
.f-hide, .js-hide {
	display: none !important;
}

#lyric-content {
	line-height: 23px;
	text-align: center
}

.song {
	height: 100%;
	width: 100%;
}

.song_left {
	height: 100%;
	width: 40%;
	padding: 0px 40px;
	display: inline-block;
}

.song_right {
	height: 200px;
	width: 60%;
	float: right;
}

.doc-buttons {
	margin-top: 20px;
}

.mod_btn_green__icon_down {
	width: 16px;
	height: 16px;
	background-position: -40px -220px;
	display: inline-block;
	margin-right: 6px;
	background-image: url(images/icon.png);
	background-repeat: no-repeat;
	vertical-align: -3px;
}

.mod_btn_green__icon_like {
	width: 16px;
	height: 16px;
	background-position: -40px -220px;
	display: inline-block;
	margin-right: 6px;
	background-image: url(images/icon.png);
	background-repeat: no-repeat;
	vertical-align: -3px;
	background-position: -60px 0px;
}

.mod_btn_green__icon_play {
	width: 16px;
	height: 16px;
	background-position: -40px -220px;
	display: inline-block;
	margin-right: 6px;
	background-image: url(images/icon.png);
	background-repeat: no-repeat;
	vertical-align: -3px;
	background-position: -60px -220px;
}

.mod_btn_green__icon_common {
	width: 16px;
	height: 16px;
	background-position: -40px -220px;
	display: inline-block;
	margin-right: 6px;
	background-image: url(images/icon.png);
	background-repeat: no-repeat;
	vertical-align: -3px;
	background-position: -100px -40px;
}

.abtn {
	font-weight: 500;
	border-radius: 2px;
	float: right;
	display: inline-block;
	padding: 6px 12px;
	margin-bottom: 0;
	font-size: 14px;
	line-height: 1.42857143;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	cursor: pointer;
	-webkit-user-select: none;
	background-image: none;
	border: 1px solid transparent;
	padding-top: 3px;
	padding-bottom: 3px;
}

.m-t-none {
	margin-top: 0;
	font-size: 23px;
}

.m-b-lg {
	margin-bottom: 15px;
}

.modal {
	right: 0;
	overflow: auto;
	outline: 0;
}
</style>

</head>
<body class="">
	<!--新建歌单弹框-->
	<div role="dialog" tabindex="-1" aria-labelledby="myModalLabel"
		aria-hidden="true" id="newbulid"
		style="overflow-y: auto; top: 20%; bottom: 40.9%; left: 30%;"
		class="modal fade auto-1473594539484 m-layer z-show m-layer-w2">
		<form data-validate="parsley" method="POST">
			<div id="auto-id-rZVKAsR9HnemIBlD" class="zbar">
				<div class="zttl">新建歌单</div>
			</div>
			<div class="zcnt">
				<div id="auto-id-I7km2EPlFaoE7uW3" class="lyct m-crgd f-cb f-tc">
					<p>
						歌单名：<input data-required="true" id="auto-id-LSZQ38VTqM5s7eWT"
							class="u-txt j-flag" type="text" name="listName">
					</p>
					<div class="u-err f-vhide j-flag">
						<i class="u-icn u-icn-25"></i>错误提示
					</div>
					<p class="tip s-fc4">可通过“收藏”将音乐添加到新歌单中</p>
					<button type="submit" id="new">新建</button>
					<button id="cancel" data-dismiss="modal">取消</button>
				</div>
			</div>
			<!--<button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="background-color: white;color:black">&times;</button>-->
			<button type="button" class="close zcls" data-dismiss="modal"
				aria-hidden="true" id="auto-id-gZz1lykTByivR2Bd" title="关闭窗体">×
			</button>
		</form>
	</div>

	<!--添加到歌单弹框-->
	<div id="myModal" role="dialog" tabindex="-1"
		aria-labelledby="myModalLabel" aria-hidden="true"
		class="modal fade auto-1473474137786 m-layer z-show m-layer-w2"
		style="top: 15%; left: 30%;">
		<div class="zbar" id="auto-id-bpDfekqTEA8M9tat">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true"
				style="background-color: white; color: black; width: 20px; height: 20px">&times;</button>
			<div class="zttl">添加到歌单</div>
		</div>
		<div class="zcnt">
			<input id="listId" type="hidden" value="${songList.listId}">
			<div id="songList" class="lyct lyct-1 m-favgd f-cb">
				<div class="tit j-flag" id="newList" data-dismiss="modal"
					data-toggle="modal" data-target="#newbulid">
					<i class="u-icn u-icn-33"></i>新歌单
				</div>
				<div class="j-flag" id="auto-id-lH2ZTJaEJry8z8NG">
					<ul id="listpop">
						<li id="mylike" data-dismiss="modal" class="xtag "><div
								class="item f-cb">
								<div class="left">
									<a href="javascript:void(0)" class="avatar" target="_blank"><img
										alt=""
										src="http://p4.music.126.net/zPaZBLAigYIxYHg28VABdg==/3286440256922472.jpg?param=40y40"></a>
								</div>
								<p class="name f-thide">
									<a class="s-fc0" href="javascript:void(0)" target="_blank">我喜欢的音乐</a>
								</p>
								<p class="s-fc3">2首</p>
							</div></li>


					</ul>
				</div>
			</div>
		</div>
	</div>

	<section class="vbox">

		<section>
			<section class="hbox stretch">

				<section id="content" class="${song.songId}">
					<section class="vbox">
						<section class="scrollable wrapper-lg">
							<div class="row">
								<div class="col-sm-8">
									<div class="panel">
										<!-- video player -->
										<div class="row">
											<div class="col-sm-5 wrapper-lg">
												<img src="songImg/${album.albumImg }" class="img-full m-b">
											</div>
											<div class="col-sm-7 wrapper-lg">
												<h4 class=" text-black ">${song.songName}</h4>
												<div class="clearfix m-b-lg">
													<div class="clear">
														<a href="singer?singerId=${song.singerId }"><small
															class="text-muted">${singerName}</small></a>

													</div>
												</div>
												<div class="m-b-lg">
													<a href="javascript:;" class="btn btn-sm btn-icon btn-info">
														<i id="${song.songId }"
														class="icon-control-play addMusicToListAndPlay"></i>
													</a> <a href="javascript:;"
														class="btn btn-rounded btn-sm btn-icon btn-default"> <i
														id="${song.songId }" class="icon-plus addMusicToList"></i>
													</a> <a href="javascript:;"
														class="btn btn-rounded btn-sm btn-icon btn-default"
														data-toggle="modal" data-target="#myModal" id="collect"><i
														class="icon-heart"></i></a> <a href="download?songId=${song.songId }"
														class="btn btn-rounded btn-sm btn-icon btn-default"><i
														class="icon-cloud-download"></i></a> <a href="#comment"
														class="btn btn-rounded btn-sm btn-icon btn-default"><i
														class="icon-note"></i></a>
												</div>
												<div>
													歌曲时长：<a href="javascript:;" class="badge bg-light">${song.songTime}</a>
													播放次数：<a href="javascript:;" class="badge bg-light">${song.playNum}</a>
													专辑：<a href="#" class="badge bg-light">${album.albumName}</a>

												</div>

											</div>

										</div>




										<!-- / video player -->
										<div class="wrapper">
											<div class="post-sum">
												<c:if test="${fn:length(lyrs)>1 }">
													<div id="lyric-content">
														<c:forEach items="${lyrs}" var="item" begin="1"
															end="${fn:length(lyrs)/3 }">
														${item }<br />
														</c:forEach>

														<div id="flag_more" class="f-hide">
															<c:forEach items="${lyrs}" var="item"
																begin="${fn:length(lyrs)/3+1 }">
														${item }<br />
															</c:forEach>
														</div>

														<div class="crl">
															<a id="flag_ctrl" href="javascript:void(0)" class="s-fc7">展开<i
																class="u-icn u-icn-69"></i></a>
														</div>
													</div>
												</c:if>
											</div>
											<div class="line b-b"></div>
											<div class="text-muted">
												<!-- 	<i class="fa fa-user icon-muted"></i> by <a href="#"
													class="m-r-sm">Admin</a> <i
													class="fa fa-clock-o icon-muted"></i> Feb 20, 2013 <a
													href="#" class="m-l-sm"><i
													class="fa fa-comment-o icon-muted"></i> 3 comments</a> -->
											</div>
										</div>
									</div>
									<h4 class="m-t-lg m-b" id="comment">评&nbsp;&nbsp;&nbsp;论</h4>
									<form>
										<div class="form-group">
											<!-- <label>Comment</label> -->
											<textarea class="form-control" rows="5"
												placeholder="Type your comment" style="resize: none"></textarea>
										</div>
										<div class="form-group" style="position: relative">
											<i id="loadBQ" class="fa fa-smile-o face"
												style="font-size: 27px; margin-left: 13px; cursor: pointer"></i>
											<button type="submit" class="abtn btn-success">评 论</button>
											<div id="temp" style="display: none"></div>
										</div>
									</form>
									<h4 class="m-t-lg m-b">最新评论</h4>
									<section class="comment-list block" style="margin-top: 27px">

									</section>
									<div class="text-center">
										<ul class="pagination pagination-sm">
										</ul>
									</div>

								</div>
								<div class="col-sm-4">
									<div class="panel panel-default">
										<div class="panel-heading">Suggestions</div>
										<div class="panel-body">
											<article class="media">
												<a href="#" class="pull-left thumb-lg m-t-xs"> <img
													src="images/m40.jpg">
												</a>
												<div class="media-body">
													<a href="#" class="font-semibold">Bootstrap 3: What you
														need to know</a>
													<div class="text-xs block m-t-xs">
														<a href="#">Travel</a> 2 minutes ago
													</div>
												</div>
											</article>
											<article class="media">
												<a href="#" class="pull-left thumb-lg m-t-xs"> <img
													src="images/m41.jpg">
												</a>
												<div class="media-body">
													<a href="#" class="font-semibold">Lorem ipsum dolor sit
														amet it.</a>
													<div class="text-xs block m-t-xs">
														<a href="#">Design</a> 2 hours ago
													</div>
												</div>
											</article>
											<article class="media">
												<a href="#" class="pull-left thumb-lg m-t-xs"> <img
													src="images/m42.jpg">
												</a>
												<div class="media-body">
													<a href="#" class="font-semibold">Sed diam nonummy
														tincidunt ut laoreet</a>
													<div class="text-xs block m-t-xs">
														<a href="#">MFC</a> 1 week ago
													</div>
												</div>
											</article>
											<article class="media">
												<a href="#" class="pull-left thumb-lg m-t-xs"> <img
													src="images/m43.jpg">
												</a>
												<div class="media-body">
													<a href="#" class="font-semibold">Lonummy nibh euismod
														sed laoreet</a>
													<div class="text-xs block m-t-xs">
														<a href="#">MFC</a> 1 week ago
													</div>
												</div>
											</article>
											<article class="media">
												<a href="#" class="pull-left thumb-lg m-t-xs"> <img
													src="images/m44.jpg">
												</a>
												<div class="media-body">
													<a href="#" class="font-semibold">Mibh euismod
														tincidunt ut laoreet</a>
													<div class="text-xs block m-t-xs">
														<a href="#">MFC</a> 1 week ago
													</div>
												</div>
											</article>
											<article class="media">
												<a href="#" class="pull-left thumb-lg m-t-xs"> <img
													src="images/m45.jpg">
												</a>
												<div class="media-body">
													<a href="#" class="font-semibold">Siam nonummy nibh
														oreet</a>
													<div class="text-xs block m-t-xs">
														<a href="#">MFC</a> 1 week ago
													</div>
												</div>
											</article>
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

	<div class="modal fade" id="reply" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">回 复</h4>
				</div>
				<div class="modal-body">

					<form>
						<div class="form-group">
							<textarea class="form-control" rows="5"
								placeholder="Type your comment" style="resize: none"></textarea>
						</div>
						<div class="form-group1" style="position: relative">
							<i class="fa fa-smile-o face"
								style="font-size: 27px; margin-left: 13px; cursor: pointer"></i>
							<button type="submit" class="abtn btn-success">评 论</button>
							<div style="display: none"></div>
						</div>
					</form>

				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>

	<div class="modal fade" id="noLogin" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">ERROR</h4>
				</div>
				<div class="modal-body" style="color: red;">
					sorry...<br> <br> &nbsp;&nbsp;&nbsp;您未登录！
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	<div class="modal fade" id="noContent" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">ERROR</h4>
				</div>
				<div class="modal-body" style="color: red;">
					sorry...<br> <br> &nbsp;&nbsp;&nbsp;您未输入任何内容！
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>
	<div class="modal fade" id="replyRet" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">ERROR</h4>
				</div>
				<div class="modal-body" style="color: red;font-family:'microsoft yahei'">
					sorry...<br> <br> &nbsp;&nbsp;&nbsp;
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>

	<script src="js/jquery.min.js"></script>
	<script type="text/javascript">
		var loginUserId = "${user.userId}";
		var comType = "song";
		var replyId = "";
		var replyName = "";

		var mid = ${song.songId};
	</script>
	<script src="js/jquery.sinaEmotion.js"></script>
	<script src="js/show-tran-emo.js"></script>
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
	<script>
		$(function() {
			var count = 0;
			//展开
			$('#flag_ctrl').click(function() {
				//展开
				if ($(this).is(":contains('展开')")) {
					//展开隐藏内容
					$('#flag_more').removeClass('f-hide');
					//更改为收起
					$(this).text("收起");
				} else {
					//收起
					if ($(this).is(":contains('收起')")) {
						//展开隐藏内容
						$('#flag_more').addClass('f-hide');
						//更改为收起
						$(this).text("展开");
					}
				}
			});

			//记录点击播放的次数，把次数传到controller
			/**
			$(".icon-control-play ").click(function() {
				$.ajax({
					type : "POST",
					url : "count",
					data : {
						"songId" : $('#content').attr('class')
					},
				})
			});
			 */

			//点击收藏，收藏到歌单
			$('#collect').click(
					function() {
						$('li[name=listId]').remove();
						$('#mylike').hide();
						$.post("getSongList", {

						}, function(data, textStatus) {
							var songListList = data;
							$.each(songListList, function(i, list) {
								var $li = $('#mylike').clone();
								$li.show();
								$li.appendTo($('#listpop'));
								$li.attr("id", list.listId);
								$li.attr("name", "listId")
								$li.children().children('p').children().text(
										list.listName);
								$li.children().children('p').eq(1).text(
										list.songsList.length + "首");
								//点击歌单用ajax传送
								$('li[name=listId]').click(function() {
									$.post("collectSong", {
										//歌曲要收藏到的歌单
										collectListId : $(this).attr('id'),
										songId : $('#content').attr('class')
									});

								})
							})

						});

					});
			//新建歌单 采用ajax
			$('#new').click(function() {
				$.post("addSongTosongList", {
					listName : $('input[name=listName]').val(),
					songId : $('#content').attr('class')
				}, function(data, textStatus) {
					alert("建立成功")
				})
			})
		})
	</script>
	<script src="js/musicPlay.js"></script>
	<script type="text/javascript">
		addPlayEvents();
	</script>
</body>
</html>