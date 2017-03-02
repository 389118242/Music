<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>搜 索</title>
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
<link rel="stylesheet" href="js/nestable/nestable.css" type="text/css" />
<!--[if lt IE 9]>
    <script src="js/ie/html5shiv.js"></script>
    <script src="js/ie/respond.min.js"></script>
    <script src="js/ie/excanvas.js"></script>
    <![endif]-->
<style>
.vbox {
	display: table;
	border-spacing: 0;
	position: relative;
	height: 100%;
	width: 100%;
	margin: 0 auto;
	border: 1px solid #d3d3d3;
	border-width: 0 1px;
	padding: 40px;
}

.pgsrch {
	width: 420px;
	height: 40px;
	margin: 0 auto;
	background-position: 0 0;
	z-index: 10;
}

.srch .j-flag {
	font-size: 12px;
	color: #333;
	font-family: Arial, Helvetica, sans-serif;
}

.b-b {
	border-bottom: 0px;
}

.bg-light {
	background-color: #f2f4f8;
	color: #788188;
}

.f-pr {
	position: relative;
	zoom: 1;
}

.pgsrch .srch {
	float: left;
	width: 320px;
	height: 17px;
	margin: 12px 0 0 20px;
	padding: 0;
	background: #fff;
	border: none;
}

.pgsrch .btn {
	float: right;
	width: 50px;
	height: 40px;
	text-indent: -9999px;
}

.bg-info .nav>li>a {
	color: #ffffff;
}

.bg-info .nav>li.active>a {
	color: #788188;
}

.nav-tabs>li {
	float: left;
	margin-bottom: -1px;
	width: 25%;
	text-align: center;
}

.nav-tabs>li>a {
	margin-right: 0px;
}

.list-group {
	border-radius: 2px;
	margin-top: 20px;
}

/*=====================================songer====================================*/
.n-srchrst {
	margin-top: 20px;
}

.m-sgerlist-1 .m-cvrlst {
	margin: 0 0 0 -24px;
}

.m-sgerlist .m-cvrlst {
	margin: 20px 0 0 -17px;
	padding-left: 0px;
}

.u-cover-5 {
	width: 130px;
	height: 130px;
}

.u-cover {
	position: relative;
	display: block;
}

.m-sgerlist-1 .m-cvrlst li {
	padding-left: 24px;
}

.m-sgerlist .m-cvrlst li {
	padding-left: 17px;
}

.m-cvrlst-5 li {
	width: 130px;
	height: 154px;
}

.m-cvrlst li {
	float: left;
	display: inline-block;
	width: 140px;
	height: 188px;
	overflow: hidden;
	padding: 0 0 30px 50px;
	line-height: 1.4;
}

.u-cover img {
	display: block;
	width: 100%;
	height: 100%;
}

.u-cover-3 {
	width: 50px;
	height: 50px;
	float: right;
}

.u-cover .msk {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}

.m-sgerlist .m-cvrlst li p {
	margin-top: 8px;
}

.m-cvrlst li p {
	width: 100%;
}

/*=============================zhuanji========================*/
.m-cvrlst-alb3 {
	margin-left: -33px;
}

.f-cb {
	padding-left: 0px;
}

.m-cvrlst-alb3 li {
	padding-left: 33px;
}

.m-cvrlst-alb2 li, .m-cvrlst-alb3 li {
	width: 153px;
	height: 178px;
}

.u-cover-alb2 {
	width: 130px;
	height: 130px;
}

.m-cvrlst li .dec {
	margin: 8px 0 3px;
	font-size: 14px;
}

.m-cvrlst li .tit {
	display: inline-block;
	max-width: 100%;
	_width: 100%;
	vertical-align: middle;
}

.f-thide {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.m-cvrlst li .nm {
	display: inline-block;
	max-width: 85%;
	vertical-align: middle;
}

.s-fc3, a.s-fc3:hover {
	color: #666;
}

.widthh li {
	width: 183px;
	height: 208px;
}

.u-cover .msk, .n-musicsd .lst .avatar .msk {
	background: url(images/coverall.png) no-repeat;
}

.u-cover .msk {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
}

.u-cover-alb2 .msk {
	width: 153px;
	height: 130px;
	background-position: 0 -845px;
}

.m-r-xxs {
	margin-right: 10px;
}

.m-r-xxxs {
	margin-right: 15px;
}

.m-l-xxxs {
	margin-left: 15px;
}

.m-r-xxxss {
	margin-right: 20px;
}

.m-r-xxxxs {
	margin-right: 80px;
}

.m-l-xxxxs {
	margin-left: 117px;
}

.m-cvrlst li .dec {
	margin: 8px 0 3px;
	font-size: 13px;
}

.modal {
	right: 0;
	overflow: auto;
	outline: 0;
}
</style>
</head>
<body>
	<!--<div class="col-sm-6">
    <section class="panel panel-default">
        <header class="panel-heading">
            <div class="input-group text-sm">
                <input type="text" class="input-sm form-control" placeholder="Search">
                <div class="input-group-btn">
                    <button type="button" class="btn btn-sm btn-default dropdown-toggle" data-toggle="dropdown">Action <span class="caret"></span></button>
                    <ul class="dropdown-menu pull-right">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                    </ul>
                </div>
            </div>
        </header>
        <ul class="list-group alt">
            <li class="list-group-item">
                <div class="media">
                    <span class="pull-left thumb-sm"><img src="images/a0.png" alt="John said" class="img-circle"></span>
                    <div class="pull-right text-success m-t-sm">
                        <i class="fa fa-circle"></i>
                    </div>
                    <div class="media-body">
                        <div><a href="#">Chris Fox</a></div>
                        <small class="text-muted">about 2 minutes ago</small>
                    </div>
                </div>
            </li>
            <li class="list-group-item">
                <div class="media">
                    <span class="pull-left thumb-sm"><img src="images/a0.png" alt="John said" class="img-circle"></span>
                    <div class="pull-right text-muted m-t-sm">
                        <i class="fa fa-circle"></i>
                    </div>
                    <div class="media-body">
                        <div><a href="#">Amanda Conlan</a></div>
                        <small class="text-muted">about 2 hours ago</small>
                    </div>
                </div>
            </li>
            <li class="list-group-item">
                <div class="media">
                    <span class="pull-left thumb-sm"><img src="images/a0.png" alt="John said" class="img-circle"></span>
                    <div class="pull-right text-warning m-t-sm">
                        <i class="fa fa-circle"></i>
                    </div>
                    <div class="media-body">
                        <div><a href="#">Dan Doorack</a></div>
                        <small class="text-muted">3 days ago</small>
                    </div>
                </div>
            </li>
            <li class="list-group-item">
                <div class="media">
                    <span class="pull-left thumb-sm"><img src="images/a0.png" alt="John said" class="img-circle"></span>
                    <div class="pull-right text-danger m-t-sm">
                        <i class="fa fa-circle"></i>
                    </div>
                    <div class="media-body">
                        <div><a href="#">Lauren Taylor</a></div>
                        <small class="text-muted">about 2 minutes ago</small>
                    </div>
                </div>
            </li>
        </ul>
    </section>
</div>-->
	<section id="content" style="height: 100%">

		<section class="vbox">
			<header class="header bg-light b-b">
				<div class="pgsrch "
					style="background: url('./images/search.png') no-repeat">
					<form action="search">
						<input type="text" class="srch j-flag" value="${key }" name="key"
							style="outline: none"> <span class="j-flag"
							style="display: none;" id="auto-id-oXk5N1pSNtSmHFXl">&nbsp;</span>
					</form>
					<a hidefocus="true" href="javascript:void(0)" class="btn j-flag"
						title="搜索" id="auto-id-UZor2emnhQKPEkAe">搜索</a>
				</div>
			</header>
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
					<input id="listId" type="hidden" value="${songList.listId}">
					<div id="songList" class="lyct lyct-1 m-favgd f-cb" value="">
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
			<section class="scrollable wrapper">
				<div class="">
					<header class="header bg-info lt">
						<ul class="nav nav-tabs nav-white">
							<li class="active media-xs "><a href="#singlesong"
								data-toggle="tab">单曲</a></li>
							<li class="media-xs "><a href="#songer" data-toggle="tab">歌手</a></li>
							<li class="media-xs "><a href="#zhuanji" data-toggle="tab">专辑</a></li>
							<li class="media-xs "><a href="#List" data-toggle="tab">歌单</a></li>
						</ul>
					</header>

					<div class="tab-content" style="height: 100%">
						<div class=" tab-pane fade in active" id="singlesong">
							<ul
								class="list-group gutter list-group-lg list-group-sp sortable text-ellipsis text-xs ">

							</ul>
						</div>
						<div class="tab-pane fade ztag j-flag" id="songer">
							<div class=" ztag text-ellipsis text-xs text-muted">
								<div class="m-sgerlist m-sgerlist-1">
									<ul class="m-cvrlst m-cvrlst-5 f-cb">

									</ul>
								</div>
							</div>
						</div>
						<div class="tab-pane fade ztag j-flag" id="zhuanji">
							<div class="n-srchrst ztag text-ellipsis text-xs text-muted">
								<ul class="m-cvrlst m-cvrlst-alb3 f-cb widthh ">

								</ul>
							</div>
						</div>
						<div class="tab-pane fade " id="List">
							<ul
								class="list-group gutter list-group-lg list-group-sp sortable text-ellipsis text-xs ">

							</ul>
							`
						</div>
						<div class="tab-pane fade " id="List">
							<ul
								class="list-group gutter list-group-lg list-group-sp sortable text-ellipsis text-xs ">

							</ul>
						</div>
					</div>
					<div class="text-center">
						<ul class="pagination pagination-sm">
						</ul>
					</div>
				</div>
			</section>
		</section>
		<a href="#" class="hide nav-off-screen-block"
			data-toggle="class:nav-off-screen,open" data-target="#nav,html"></a>
	</section>

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


	<script src="js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="js/bootstrap.js"></script>
	<!-- App -->
	<script src="js/app.js"></script>
	<script src="js/slimscroll/jquery.slimscroll.min.js"></script>
	<script src="js/sortable/jquery.sortable.js"></script>
	<script src="js/nestable/jquery.nestable.js"></script>
	<script src="js/nestable/demo.js"></script>
	<script src="js/app.plugin.js"></script>
	<script type="text/javascript" src="js/jPlayer/jquery.jplayer.min.js"></script>
	<script type="text/javascript"
		src="js/jPlayer/add-on/jplayer.playlist.min.js"></script>
	<script type="text/javascript" src="js/jPlayer/demo.js"></script>

	<script type="text/javascript">
		var key = "${key}";
		var type = [ "song", "singer", "album", "songList" ];
		var presentPage = 1;
		var clickIndex = 0;
		var totalPage = 1;
		var addEvents = function(total) {
			$('ul.pagination.pagination-sm li').click(
					function() {
						var text = $(this).children().html();
						var index = $('ul.nav.nav-tabs.nav-white').find(
								'li.active').index();
						if (isNaN(text)) { //不是数字
							if ($(this).index() == 0 && presentPage != 1) {
								getSeachResult(presentPage - 1, index);
							} else if ($(this).index() == total - 1
									&& presentPage != totalPage) {
								getSeachResult(presentPage + 1, index);
							}
						} else {//数字
							getSeachResult(parseInt(text), index);
						}
					});
		}
		var getSeachResult = function(page, index) {
			clickIndex = index;
			key = $('input[type=text]').val();
			if (key.trim() != '')
				$
						.ajax({
							url : "search",
							type : "POST",
							data : {
								"type" : type[index],
								"key" : key,
								"page" : page
							},
							success : function(ret) {
								var resultList = ret.resultList;
								if (resultList.length > 0) {
									var $parent = $('.tab-content ul').eq(
											clickIndex);
									$parent.children().remove();
								}
								for (var i = 0; i < resultList.length; i++) {
									if (clickIndex == 0) {
										$parent
												.append('<li class="list-group-item" value="'+resultList[i].songId+'"><span class="pull-right">'
														+ '<a class="m-r-xs" href="#"><i class="icon-plus m-r-xs addMusicToList" id="'+resultList[i].songId+'" title="播放"></i></a>'
														+ '<a href="javascript:;" name="collect"><i class="icon-heart m-r-xxs" '+
										'data-toggle="modal" data-target="#myModal"></i></a> <a href="download?songId='
														+ resultList[i].songId
														+ '"><i '+
										'class="icon-cloud-download "></i></a>'
														+ '</span> <span class="pull-left media-xs"> <i '+
									'class="icon-social-youtube m-r-xs addMusicToListAndPlay" id="'+resultList[i].songId+'" title="播放"></i>'
														+ (i + 1)
														+ '</span>'
														+ '<div class="clear "><a href="song?songId='
														+ resultList[i].songId
														+ '">'
														+ resultList[i].songName
														+ '</a> -- <a href="singer?singerId='
														+ resultList[i].singer.singerId
														+ '">'
														+ resultList[i].singer.singerName
														+ '</a> -- '
														+ resultList[i].songTime
														+ '</div></li>');
									} else if (clickIndex == 1) {
										$parent
												.append('<li><div class="u-cover u-cover-5">'
														+ '<a href="singer?singerId='
														+ resultList[i].singerId
														+ '"><img '+
													'src="singerImg/'+resultList[i].singerImg+'"><span '+
													'title="'+resultList[i].singerName+'" class="msk"></span></a>'
														+ '</div>'
														+ '<p>'
														+ '<a class="nm f-thide s-fc0" href="singer?singerId='
														+ resultList[i].singerId
														+ '" '
														+ 'title="'
														+ resultList[i].singerName
														+ '">'
														+ resultList[i].singerName
														+ '</a>' + '</p></li>');
									} else if (clickIndex == 2) {
										$parent
												.append('<li><div class="u-cover u-cover-alb2">'
														+ '<a href="album?albumId='
														+ resultList[i].albumId
														+ '"><img '+
												'src="albumImg/'+resultList[i].albumImg+'"><span'+
												'title="'+resultList[i].albumName+'" class="msk"></span></a></div>'
														+ '<p class="dec">'
														+ '<a href="album?albumId='
														+ resultList[i].albumId
														+ '" class="tit f-thide s-fc0" title="'
														+ resultList[i].albumName
														+ '"><span'+
												' class="s-fc7">'
														+ resultList[i].albumName
														+ '</span></a>'
														+ '</p><p><span class="nm f-thide" title="'+resultList[i].singer.singerName+'"><a '
														+ 'href="singer?singerId='
														+ resultList[i].singer.singerId
														+ '" class="s-fc3">'
														+ resultList[i].singer.singerName
														+ '</a></span></p>');
									} else if (clickIndex == 3) {
										$parent
												.append('<li class="list-group-item "'+
											'style="padding: 1px; line-height: 50px"><span '+
											'class="pull-right"> <a class=" media-xs m-r-xxxs">'
														+ resultList[i].songsList.length
														+ '首 '
														+ '</a> <a class="m-r-xxxs media-xs" href="#">by '
														+ resultList[i].user.userName
														+ ' </a> <a '+
												'class="m-r-xxxxs media-xs" href="#">收藏：'
														+ resultList[i].collectionNum
														+ '</a> <a '+
												'class="m-r-xs" href="#"><i id="'+resultList[i].listId+'" class="icon-plus m-r-xs addMusicListToList"></i></a>'
														+ '</span> <span class="pull-left media-xs"> <i id="'+resultList[i].listId+'" '+
												'class="icon-social-youtube m-l-xxxs m-r-xxxss addMusicListToListAndPlay"></i> <a '+
												'class="u-cover u-cover-3" href="#"><img '
													+ 'src="'+resultList[i].listImg+'">' //修改过
														+ '</a>'
														+ '</span>'
														+ '<div class="clear m-l-xxxxs">'
														+ resultList[i].listName
														+ '</div>'
														+ '<div style="clear: both;"></div></li>');
									}
								}
								addPlayEvents();
								var bp = ret.bp;
								var ep = ret.ep;
								presentPage = ret.page
								totalPage = ret.totalPage;
								$('ul.pagination.pagination-sm').html('');
								if (ep > bp) {
									$('ul.pagination.pagination-sm')
											.html(
													'<li><a href="javascript:;"><i '+
													'class="fa fa-chevron-left"></i></a></li>'
															+ '<li><a href="javascript:;"><i '+
															'class="fa fa-chevron-right"></i></a></li>');
									for (var i = bp; i < ep + 1; i++) {
										$('ul.pagination.pagination-sm li:last')
												.before(
														'<li><a href="javascript:;">'
																+ i
																+ '</a></li>');
									}
									addEvents(ep - bp + 3);
								}
								
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

							}
						});
		}
		$(function() {
			//新建歌单 采用ajax
			$('#new').click(function(event) {
				$.post("addSongTosongList", {
					listName : $('input[name=listName]').val(),
					songId : $('#songList').val()
				}, function(data, textStatus) {
					//alert("创建,添加成功");
				}
				);
				event.preventDefault();
			});
			$('.nav.nav-tabs li').click(function() {
				var tag = $(this).index();
				getSeachResult(1, tag);
			});
			$('#auto-id-UZor2emnhQKPEkAe').click(function() {
				getSeachResult(1, 0);
			});
			getSeachResult(1, 0);
		})
	</script>
	<script type="text/javascript" src="js/musicPlay.js"></script>

</body>
</html>