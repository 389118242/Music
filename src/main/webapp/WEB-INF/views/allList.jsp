<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<title>全部歌单</title>
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
<body class="">
	<section class="hbox stretch">
		<section id="content">
			<section class="vbox">
				<section class="w-f-md" id="bjax-target" style="bottom: 0;">
					<section class="hbox stretch">
						<!-- side content -->
						<aside class="aside bg-light dk" id="sidebar">
							<section class="vbox animated fadeInUp">
								<section class="scrollable hover">
									<div
										class="list-group no-radius no-border no-bg m-t-n-xxs m-b-none auto">
										<a href="javascript:;" id="0" class="list-group-item active">
											全部 </a>
										<c:forEach var="item" items="${listKinds }">
											<a href="javascript:;" id="${item.kindId }"
												class="list-group-item"> ${item.kindName } </a>
										</c:forEach>
									</div>
								</section>
							</section>
						</aside>
						<!-- / side content -->
						<section>
							<section class="vbox">
								<section class="scrollable padder-lg">
									<h2 class="font-thin m-b">全部</h2>
									<div class="row row-sm">
									<!-- 
										<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
											<div class="item">
												<div class="pos-rlt">
													<div class="item-overlay opacity r r-2x bg-black">
														<div class="center text-center m-t-n">
															<a href="#"><i class="fa fa-play-circle i-2x"></i></a>
														</div>
													</div>
													<a href="track-detail.html"><img src="images/m1.jpg"
														alt="" class="r r-2x img-full"></a>
												</div>
												<div class="padder-v">
													<a href="track-detail.html" data-bjax
														data-target="#bjax-target" data-el="#bjax-el"
														data-replace="true" class="text-ellipsis">Tempered
														Song</a> <a href="track-detail.html" data-bjax
														data-target="#bjax-target" data-el="#bjax-el"
														data-replace="true"
														class="text-ellipsis text-xs text-muted">Miaow</a>
												</div>
											</div>
										</div>
									 -->
									</div>
									<ul class="pagination pagination">
									<!-- 
										<li><a href="#"><i class="fa fa-chevron-left"></i></a></li>
										<li class="active"><a href="#">1</a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">5</a></li>
										<li><a href="#"><i class="fa fa-chevron-right"></i></a></li>
									 -->
									</ul>
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
	<script type="text/javascript" src="js/musicPlay.js"></script>
	<script>
		var presentPage = 1;
		var clickIndex = 0;
		var totalPage = 1;
		var presentKindId = 0;
		var addEvents = function(total) {
			$('ul.pagination.pagination li').click(
					function() {
						var text = $(this).children().html();
						if (isNaN(text)) { //不是数字
							if ($(this).index() == 0 && presentPage != 1) {
								getSongList(presentKindId, presentPage - 1);
							} else if ($(this).index() == total - 1
									&& presentPage != totalPage) {
								getSongList(presentKindId, presentPage + 1);
							}
						} else {//数字
							getSongList(presentKindId, parseInt(text));
						}
					});
		}
		var getSongList = function(id, page) {
			presentPage = page;
			$
					.ajax({
						url : "getSongListByKind",
						type : "post",
						data : {
							"kindId" : id,
							"page" : page
						},
						dataType : "json",
						success : function(ret) {
							var $p = $('.row.row-sm');
							$p.children().remove();
							var items = ret.songList;
							for (var i = 0; i < items.length; i++) {
								$p
										.append('<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">'
												+ '<div class="item">'
												+ '<div class="pos-rlt">'
												+ '<div class="item-overlay opacity r r-2x bg-black">'
												+ '<div class="center text-center m-t-n">'
												+ '<a href="javascript:;"><i id="'+items[i].listId+'" class="fa fa-play-circle i-2x addMusicListToListAndPlay"></i></a>'
												+ '</div></div>'
												+ '<a href="javascript:;"><img src="'+items[i].listImg+'" '+
										'alt="" class="r r-2x img-full"></a>'
												+ '</div>'
												+ '<div class="padder-v">'
												+ '<a href="songListDetail?songListId='
												+ items[i].listId
												+ '" class="text-ellipsis">'
												+ items[i].listName
												+ '</a>'
												+ '<a href="profile?userId='
												+ items[i].user.userId
												+ '" class="text-ellipsis text-xs text-muted">'
												+ items[i].user.userName
												+ '</a> '
												+ '</div> '
												+ '</div>' + '</div>');
							}
							addPlayEvents();
							var bp = ret.bp;
							var ep = ret.ep;
							$('.pagination.pagination').html('');
							if (ep > bp) {
								$('.pagination.pagination')
										.html(
												'<li><a href="javascript:;"><i '+
													'class="fa fa-chevron-left"></i></a></li>'
														+ '<li><a href="javascript:;"><i '+
															'class="fa fa-chevron-right"></i></a></li>');
								for (var i = bp; i < ep + 1; i++) {
									if (i == presentPage)
										$('.pagination.pagination li:last').before(
												'<li class="active"><a href="javascript:;">'
														+ i + '</a></li>');
									else
										$('.pagination.pagination  li:last').before(
												'<li><a href="javascript:;">'
														+ i + '</a></li>');
								}
							}
							totalPage = ret.totalPage;
							addEvents(ep - bp + 3);
						}
					});
		}
		$('.list-group-item').click(function() {
			$(this).addClass("active").siblings().removeClass("active");
			presentKindId = $(this).attr("id");
			$('.scrollable.padder-lg h2').text($(this).text());
			getSongList(presentKindId,1);
		});
		$(function(){
			$('.list-group-item').eq(0).trigger("click");
		});
	</script>
</body>
</html>