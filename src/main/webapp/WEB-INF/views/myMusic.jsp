<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<title>我的音乐</title>
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
<link rel="stylesheet" href="css/pop.css" type="text/css" />
<link rel="stylesheet" href="css/bulidpop.css" type="text/css" />
<script src="js/jquery.min.js"></script>

<script>
	var songIndex = -1;
	$(function() {
		//点击右侧歌单显示左侧歌曲
		$('.clearfix').click(
				function() {
					var songListId = $(this).attr('id');
					$.post("showSongs", {
						songListId : $(this).attr('id')
					},

					function(data, textStatus) {
						var songs = data.songs;
						$('.m-t-n-xxs.item.pos-rlt').find('img').attr("src",
								data.listDetail.listImg);
						$('.bottom.gd.bg-info.wrapper-lg span').text(
								data.listDetail.listName);
						//清空左侧歌曲列表
						$('ul[id=songs] li').detach();
						//添加歌曲
						$.each(songs, function(i, song) {
							var $li1 = $('#clone').clone(true);
							$li1.show();
							$li1.appendTo($('#songs'));
							$li1.attr('id', song.songId);
							$li1.attr('name', songListId);
							$li1.find("i.icon-control-play").attr('id', song.songId);
							$li1.find("i.icon-plus").attr('id', song.songId);
							$li1.find('i.icon-cloud-download').attr("href","download?songId="+song.songId)
							$li1.children().eq(2).children().eq(0).text(
									song.songName);
							$li1.children().eq(2).children().eq(1).text(
									" -- " + song.singer.singerName);
							$li1.children().eq(2).children().eq(2).text(
									" -- " + song.songTime);
							//-----------------------新添加了这个-------------------------------				
							//------------------------------------------------------------------			
						});
						//addPlayEvents();
					})
				});

		//新建歌单 采用ajax
		$('#new').click(function() {
			$.post("addSongTosongList", {
				listName : $('input[name=listName]').val(),
				songId : $('#songList').val()
			}, function(data, textStatus) {
				alert("建立成功")
			}

			);

		});

		//点击删除把listid号传到删除弹框的隐藏域
		$('a[name=deleteSongList]').click(function() {
			$('#delete_input').val('');
			//获取要删除的歌单id号
			var listId = $(this).parent().parent().attr('id');
			//把id号赋给隐藏域
			$('#delete_input').val(listId);
			//删除歌单
			$('#deletebutton').click(function() {

				$.post("deleteSongList", {
					songListId : $('#delete_input').val()
				})
				$('#delete').modal('hide');
				event.preventDefault();
			});
			$(this).parent().parent().remove();
			event.preventDefault();
		});

		//--------------------------------------------------------------------------------------		
		//从歌单中移除歌曲       
		$("#deleteSongbutton").click(function() {
			var songid = $("#deleteSong_input").val();
			$.post("deleteSongFromList", {
				songId : $("#deleteSong_input").val(),
				songListId : $("#deleteSong_input").attr('name')
			}, function() {
				//！！！！！！！！！此处有问题！！！！！！！！！！
				//$("li[id=songid]").remove();
				$('#songs .list-group-item').eq(songIndex).remove();

			})
			$('#deleteSong').modal('hide');
			event.preventDefault();

		});

		var addEvents = function() {

			//点击删除把listid和songid传到删除歌曲弹框的隐藏域
			$(".deleteSong").click(
					function() {
						//放songid
						$("#deleteSong_input").val('');
						//放listid
						$("#deleteSong_input").attr('name', '');
						$("#deleteSong_input").val(
								$(this).parent().parent().attr('id'));
						$("#deleteSong_input").attr('name',
								$(this).parent().parent().attr('name'));
						songIndex = $(this).parent().parent().index();

					});

			//点击收藏歌曲把歌曲id存入我的歌单弹框内
			$('.collect').click(function() {
				$('#songList').val('');
				var songid;
				songid = $(this).parent().parent().attr('id');
				$('#songList').val(songid);
			});

			//点击收藏，歌单弹框内容用ajax获取
			$('.collect').click(
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
								$li.find('img').attr("src",list.listImg);
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
										songId : $('#songList').val()
									});

								})
							})

						});

					});
		}

		addEvents();

	})

	//---------------------------------------------------------------------------------
</script>
<style>
.bg-black {
	background-color: white;
	color: #2c2f3c;
}

.item .opacity {
	background-color: rgba(0, 0, 0, 0.1);
}

.lter {
	background-color: whitesmoke;
}

.bg-black .auto .list-group-item {
	border-color: white;
	!
	important;
}

.no-touch .scrollable.hover {
	overflow: auto
}

.modal {
	right: 0;
	overflow: auto;
	outline: 0;
}
</style>
<!--[if lt IE 9]>
    <script src="js/ie/html5shiv.js"></script>
    <script src="js/ie/respond.min.js"></script>
    <script src="js/ie/excanvas.js"></script>

    <![endif]-->
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
										src=""></a>
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

	<!--删除歌单弹框  -->
	<div role="dialog" tabindex="-1" aria-labelledby="myModalLabel"
		aria-hidden="true" id="delete"
		style="overflow-y: auto; top: 20%; bottom: 50%; left: 30%;"
		class="modal fade auto-1473594539484 m-layer z-show m-layer-w2">
		<form data-validate="parsley">
			<div id="auto-id-rZVKAsR9HnemIBlD" class="zbar">
				<div class="zttl">删除歌单</div>
			</div>
			<div class="zcnt">
				<div id="auto-id-I7km2EPlFaoE7uW3" class="lyct m-crgd f-cb f-tc">
					<input id="delete_input" name="songListId1" type="hidden">
					<h2
						style="padding-left: 120px; padding-bottom: 20px; font-size: 20px">是否删除歌单?</h2>
					<button type="submit" id="deletebutton">删除</button>
					<button id="cancel" data-dismiss="modal">取消</button>
				</div>
			</div>
		</form>
	</div>


	<!--删除歌曲弹框  -->
	<div role="dialog" tabindex="-1" aria-labelledby="myModalLabel"
		aria-hidden="true" id="deleteSong"
		style="overflow-y: auto; top: 20%; bottom: 50%; left: 30%;"
		class="modal fade auto-1473594539484 m-layer z-show m-layer-w2">
		<form data-validate="parsley">
			<div id="auto-id-rZVKAsR9HnemIBlD1" class="zbar">
				<div class="zttl">删除歌曲</div>
			</div>
			<div class="zcnt">
				<div id="auto-id-I7km2EPlFaoE7uW31" class="lyct m-crgd f-cb f-tc">
					<input id="deleteSong_input" name="" type="hidden">
					<h2
						style="padding-left: 120px; padding-bottom: 20px; font-size: 20px">是否从歌单中移除此歌曲?</h2>
					<button type="submit" id="deleteSongbutton">删除</button>
					<button id="cancelSong" data-dismiss="modal">取消</button>
				</div>
			</div>
			<!--<button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="background-color: white;color:black">&times;</button>-->
			<button type="button" class="close zcls" data-dismiss="modal"
				aria-hidden="true" id="auto-id-gZz1lykTByivR2Bd" title="关闭窗体">×
			</button>
		</form>
	</div>

	<section class="vbox">
		<section>
			<section class="hbox stretch">

				<section id="content">
					<section class="vbox">
						<section class="w-f-md">
							<section class="hbox stretch bg-black dker">
								<!-- side content -->
								<aside class="col-sm-5 no-padder" id="sidebar"
									style="background-color: white">
									<section class="vbox animated fadeInUp">
										<section class="scrollable">
											<div class="m-t-n-xxs item pos-rlt">
												<div class="top text-right">
													<span
														class="musicbar animate bg-success bg-empty inline m-r-lg m-t"
														style="width: 25px; height: 30px"> <span
														class="bar1 a3 lter"></span> <span class="bar2 a5 lt"></span>
														<span class="bar3 a1 bg"></span> <span class="bar4 a4 dk"></span>
														<span class="bar5 a2 dker"></span>
													</span>
												</div>
												<div class="bottom gd bg-info wrapper-lg">
													<span class="h2 font-thin">${songListList[0].listName}</span>
												</div>
												<img class="img-full" style="max-height: 456px;min-height: 237px"
													src="${songListList[0].listImg}" alt="...">
											</div>
											<li class="list-group-item" style="display: none" id="clone">
												<div class="pull-right m-l">
													<a href="#" class="m-r-sm"><i class="icon-plus addMusicToList"></i></a> <a
														href="#" class="m-r-sm collect"><i class="icon-heart"
														data-toggle="modal" data-target="#myModal"></i></a> <a
														href="#" class="m-r-sm"><i class="icon-cloud-download"></i></a>
													<a href="#" class="deleteSong" data-toggle="modal"
														data-target="#deleteSong"><i class="icon-close"></i></a>
												</div> <a href="#" class="jp-play-me m-r-sm pull-left"> <i
													class="icon-control-play text addMusicToListAndPlay"></i> <i
													class="icon-control-pause text-active"></i>
											</a>
												<div class="clear text-ellipsis">
													<span class="text-muted"></span> <span class="text-muted"></span>
													<span class="text-muted"></span>
												</div>
											</li>
											<ul id="songs"
												class="list-group list-group-lg no-radius no-border no-bg m-t-n-xxs m-b-none auto">



												<c:forEach items="${songs}" var="song">
													<li class="list-group-item" id="${song.songId}">
														<div class="pull-right m-l">
															<a href="#" class="m-r-sm"><i id="${song.songId}" class="icon-plus addMusicToList"></i></a>
															<a href="#" class="m-r-sm collect"><i
																class="icon-heart" data-toggle="modal"
																data-target="#myModal"></i></a> <a href="download?songId=${song.songId}" class="m-r-sm"><i
																class="icon-cloud-download"></i></a> <a href="#"
																data-toggle="modal" data-target="#deleteSong"
																class="deleteSong"><i class="icon-close"></i></a>
														</div> <a href="#" class="jp-play-me m-r-sm pull-left"> <i id="${song.songId}"
															class="icon-control-play text addMusicToListAndPlay"></i> <i
															class="icon-control-pause text-active"></i>
													</a>
														<div class="clear text-ellipsis">
															<span class="text-muted">${song.songName}</span> <span
																class="text-muted"> -- ${song.singer.singerName}</span>
															<span class="text-muted"> -- ${song.songTime}</span>
														</div>
													</li>
												</c:forEach>

											</ul>
										</section>
									</section>
								</aside>
								<!-- / side content -->
								<section class="col-sm-4 no-padder bg">
									<section class="vbox">
										<section class="scrollable hover"
											style="background-color: #e5eaee">
											<ul
												class="list-group list-group-lg no-bg auto m-b-none m-t-n-xxs">
												<c:forEach items="${songListList}" var="list"
													varStatus="ind">
													<li class="list-group-item clearfix" id="${list.listId}">
														<div class="pull-right m-l-md">
															<a href="#" class="m-r-sm"><i id="${list.listId}" class="icon-plus addMusicListToList"></i></a>
															<c:if test="${ind.index>0 }">
																<a href="#" class="m-r-sm" data-toggle="modal"
																	data-target="#delete" name="deleteSongList"><i
																	class="icon-close"></i></a>
															</c:if>
														</div> <a href="#" class="pull-left thumb-sm m-r"> <img
															src="${list.listImg}">
													</a> <a class="clear" href="#"> <span
															class="block text-ellipsis">${list.listName}</span> <small
															class="text-muted">创建时间:<fmt:formatDate
																	value="${list.createTime}"
																	pattern="yyyy-MM-dd hh:mm:ss" /></small>
													</a>
													</li>
												</c:forEach>
											</ul>
										</section>
									</section>
								</section>

								<section class="col-sm-3 no-padder "
									style="background-color: white">
									<section class="vbox">
										<section class="scrollable hover">
											<div class="m-t-n-xxs">
												<div class="item pos-rlt">
													<a href="#"
														class="item-overlay active opacity wrapper-md font-xs">
														<span class="block h3 font-bold text-info">Find</span> <span
														class="text-muted">Search the music you like</span> <span
														class="bottom wrapper-md block">- <i
															class="icon-arrow-right i-lg pull-right"></i></span>
													</a> <a href="#"> <img class="img-full"
														src="images/m40.jpg" alt="...">
													</a>
												</div>
												<div class="item pos-rlt">
													<a href="#"
														class="item-overlay active opacity wrapper-md font-xs text-right">
														<span class="block h3 font-bold text-warning text-u-c">Listen</span>
														<span class="text-muted">Find the peace in your
															heart</span> <span class="bottom wrapper-md block"><i
															class="icon-arrow-right i-lg pull-left"></i> -</span>
													</a> <a href="#"> <img class="img-full"
														src="images/m41.jpg" alt="...">
													</a>
												</div>
												<div class="item pos-rlt">
													<a href="#"
														class="item-overlay active opacity wrapper-md font-xs">
														<span class="block h3 font-bold text-success text-u-c">Share</span>
														<span class="text-muted">Share the good songs with
															your loves</span> <span class="bottom wrapper-md block">-
															<i class="icon-arrow-right i-lg pull-right"></i>
													</span>
													</a> <a href="#"> <img class="img-full"
														src="images/m42.jpg" alt="...">
													</a>
												</div>
												<div class="item pos-rlt">
													<a href="#"
														class="item-overlay active opacity wrapper-md font-xs text-right">
														<span class="block h3 font-bold text-white text-u-c">2014</span>
														<span class="text-muted">Find, Listen & Share</span> <span
														class="bottom wrapper-md block"><i
															class="icon-arrow-right i-lg pull-left"></i> -</span>
													</a> <a href="#"> <img class="img-full"
														src="images/m44.jpg" alt="...">
													</a>
												</div>
												<div class="item pos-rlt">
													<a href="#"
														class="item-overlay active opacity wrapper-md font-xs">
														<span class="block h3 font-bold text-danger-lter text-u-c">Top10</span>
														<span class="text-muted">Selected songs</span> <span
														class="bottom wrapper-md block">- <i
															class="icon-arrow-right i-lg pull-right"></i></span>
													</a> <a href="#"> <img class="img-full"
														src="images/m45.jpg" alt="...">
													</a>
												</div>
											</div>
										</section>
									</section>
								</section>
							</section>
						</section>
					</section>
					<a href="#" class="hide nav-off-screen-block"
						data-toggle="class:nav-off-screen,open" data-target="#nav,html"></a>
				</section>
			</section>
		</section>
	</section>

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