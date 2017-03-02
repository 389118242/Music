<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>专辑 - ${album.albumName }</title>
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
<!--[if lt IE 9]>
    <script src="js/ie/html5shiv.js"></script>
    <script src="js/ie/respond.min.js"></script>
    <script src="js/ie/excanvas.js"></script>
    <![endif]-->
<style>
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

.form-group1 {
	height: 20px;
}

.m-t-lg {
	margin-bottom: 10px;
}

.ziti {
	font-family: inherit;
	font-size: 12px;
	line-height: 1.1;
}
/* .m-t-none {
        margin-top: 0;
        font-size: 23px;
    }*/
.m-t-lg {
	margin-bottom: 10px;
	color: #333;
}

body {
	font-size: 12px;
}

.m-b-lg {
	margin-bottom: 15px;
}

.m-t-sm-return {
	float: right;
}

.m-t-sm {
	height: 50px;
}

.form-control {
	resize: none;
}

.modal {
	right: 0;
	overflow: auto;
	outline: 0;
}
</style>
<script src="js/jquery.min.js"></script>
<script src="js/parsley/parsley.min.js"></script>
<script>
	$(function() {
		//点击收藏歌曲把歌曲id存入我的歌单弹框内
		$('a[name=collect]').click(function() {
			$('#songList').val('');
			var songid;
			songid = $(this).parent().parent().val();
			$('#songList').val(songid);
		});

		//点击收藏，歌单弹框内容用ajax获取
		$('a[name=collect]').click(
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
							$li.attr("name", "listId");
							$li.find('a').eq(0).children().attr("src",
									list.listImg);
							$li.children().children('p').children().text(
									list.listName);
							$li.children().children('p').eq(1).text(
									list.songsList.length + "首");
							//点击歌单用ajax传送
							$('li[name=listId]').click(function() {
								$.post("collectSong", {
									//歌曲要收藏到的歌单
									collectListId : $(this).attr('id'),
									songId : $('#songList').val()
								});

							})
						})

					});

				});

		//新建歌单 采用ajax
		$('#new').click(function() {
			$.post("addSongTosongList", {
				listName : $('input[name=listName]').val(),
				songId : $('#songList').val()
			}, function(data, textStatus) {
				alert("创建,添加成功");
			}

			);

		})

	})
</script>

</head>
<body>

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

	<section id="content" style="height: 100%">
		<section class="vbox" id="bjax-el">
			<section class="scrollable wrapper-lg">
				<div class="row">
					<div class="col-sm-8">
						<div class="panel wrapper-lg">
							<div class="row">
								<div class="col-sm-5">
									<img src="songImg/${album.albumImg }" class="img-full m-b">
								</div>
								<div class="col-sm-7">
									<h4 class="m-t-none text-black">${album.albumName}</h4>
									<div class="clearfix m-b-lg">
										<div class="clear">
											<a class="text-muted" href="singer?singerId=${album.singer.singerId}"
												style="padding: 15px 0px">By ${album.singer.singerName}</a> <small
												class="block text-muted" style="padding-top: 15px">${album.company.companyName }</small>
										</div>
									</div>
									<div class="m-b-lg">
											<a href="javascript:;" id="${album.albumId}" class="btn btn-sm btn-icon btn-info addAlbumToListAndPlay"><i
												class=" icon-control-play"></i></a>
											<a href="javascript:;" id="${album.albumId}"
												class="btn btn-rounded btn-sm btn-icon btn-default addAlbumToList"><i
												class="icon-plus"></i></a>
												<!--
											<a href="#"
												class="btn btn-rounded btn-sm btn-icon btn-default"><i
												class="icon-cloud-download"></i></a>
												-->
										<a href="#comment"
											class="btn btn-rounded btn-sm btn-icon btn-default"><i
											class="icon-speech"></i></a>
										<!-- <a href="#" class="btn btn-info">播放</a> <a href="#" class="btn btn-default">3 Comments</a>-->
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
										<div class="zcnt"">
											<input id="listId" type="hidden" value="">
											<div id="songList" class="lyct lyct-1  m-favgd f-cb" value="">
												<div class="tit j-flag" id="newList" data-dismiss="modal"
													data-toggle="modal" data-target="#newbulid">
													<i class="u-icn u-icn-33"></i>新歌单
												</div>
												<div class="j-flag" id="auto-id-lH2ZTJaEJry8z8NG">
													<ul id="listpop">
														<li id="mylike" data-dismiss="modal" class="xtag "><div
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


													</ul>
												</div>
											</div>
										</div>
									</div>

								</div>
							</div>
							<div class="m-t">
								<p>介绍：${fn:replace(album.albumDetail,"\\n","<br/>") }</p>
								
							</div>
							<h4 class="m-t-lg m-b">歌曲列表</h4>
							<ul class="list-group list-group-lg">
								<c:if test="${album.songs!=null}">
									<c:forEach items="${album.songs}" var="song">
										<li class="list-group-item" id="${song.songId}"
											value="${song.songId}">
											<div class="pull-right m-l">
												<a href="javascript:;" class="m-r-sm"><i id="${song.songId}" class="icon-plus addMusicToList"></i></a> <a
													name="collect" href="javascript:;" class="m-r-sm"><i
													class="icon-heart" data-toggle="modal"
													data-target="#myModal"></i></a> <a href="download?songId=${song.songId}"><i
													class="icon-cloud-download"></i></a>
											</div> <a href="javascript:;" class="jp-play-me m-r-sm pull-left"> <i id="${song.songId }"
												class="icon-control-play text addMusicToListAndPlay"></i> <i
												class="icon-control-pause text-active"></i>
										</a>
											<div class="clear text-ellipsis">
												<span>${song.songName}</span> <span class="text-muted">
													-- ${song.songTime}</span>
											</div>
										</li>
									</c:forEach>
								</c:if>
							</ul>

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
					</div>
					<div class="col-sm-4">
						<div class="panel panel-default">
							<div class="panel-heading">相关推荐</div>
							<div class="panel-body">
								<article class="media">
									<a href="#" class="pull-left thumb-md m-t-xs"> <img
										src="images/m18.jpg">
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
									<a href="#" class="pull-left thumb-md m-t-xs"> <img
										src="images/m19.jpg">
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
									<a href="#" class="pull-left thumb-md m-t-xs"> <img
										src="images/m20.jpg">
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
									<a href="#" class="pull-left thumb-md m-t-xs"> <img
										src="images/m21.jpg">
									</a>
									<div class="media-body">
										<a href="#" class="font-semibold">Lonummy nibh euismod sed
											laoreet</a>
										<div class="text-xs block m-t-xs">
											<a href="#">MFC</a> 1 week ago
										</div>
									</div>
								</article>
								<article class="media">
									<a href="#" class="pull-left thumb-md m-t-xs"> <img
										src="images/m22.jpg">
									</a>
									<div class="media-body">
										<a href="#" class="font-semibold">Mibh euismod tincidunt
											ut laoreet</a>
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
				<div class="modal-body"
					style="color: red; font-family: 'microsoft yahei'">
					sorry...<br> <br> &nbsp;&nbsp;&nbsp;
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal -->
	</div>

	<script src="js/jquery.min.js"></script>
	<script type="text/javascript">
		var loginUserId = "${sessionScope.user.userId}";
		var comType = "album";
		var replyId = "";
		var replyName = "";

		var mid = ${album.albumId};
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
	<script type="text/javascript" src="js/musicPlay.js"></script>
	<script type="text/javascript">
	$(function(){
		addPlayEvents();
	});
	</script>
</body>
</html>