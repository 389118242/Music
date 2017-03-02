<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<title>推荐歌单</title>
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
		<!-- /.aside -->
		<section id="content">
			<section class="vbox">
				<section class="scrollable">
					<div id="masonry" class="pos-rlt animated fadeInUpBig">
						<div class="item">
							<div class="carousel slide auto" data-interval="3000">
								<div class="carousel-inner">
									<div class="item active">
										<div
											class="item-overlay opacity animated fadeInDown wrapper bg-info">
											<p class="text-white">N.01</p>
											<div class="center text-center m-t-n">
												<a href="#"><i id="${rsl[0].songList.listId }"
													class="icon-control-play i-2x addMusicListToListAndPlay"></i></a>
											</div>
										</div>
										<div class="bottom wrapper bg-info gd">
											<div class="m-t m-b">
												<a
													href="songListDetail?songListId=${rsl[0].songList.listId }"
													class="b-b b-danger h2 text-u-c text-lt font-bold">${rsl[0].songList.listName }</a>
											</div>
											<p class="hidden-xs">${rsl[0].songList.listDetail }</p>
										</div>
										<a href="songListDetail?songListId=${rsl[0].songList.listId }"><img
											src="${rsl[0].img }" alt="" class="img-full"></a>
									</div>
									<div class="item">
										<div
											class="item-overlay opacity animated fadeInDown wrapper bg-info">
											<p class="text-white">N.02</p>
											<div class="center text-center m-t-n">
												<a href="#"><i id="${rsl[1].songList.listId }"
													class="icon-control-play i-2x addMusicListToListAndPlay"></i></a>
											</div>
										</div>
										<div class="bottom wrapper bg-info gd">
											<div class="m-t m-b">
												<a
													href="songListDetail?songListId=${rsl[1].songList.listId }"
													class="b-b b-warning h2 text-u-c text-lt font-bold">${rsl[1].songList.listName }</a>
											</div>
											<p class="hidden-xs">${rsl[1].songList.listDetail }</p>
										</div>
										<a href="songListDetail?songListId=${rsl[1].songList.listId }"><img
											src="${rsl[1].img }" alt="" class="img-full"></a>
									</div>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="item-overlay gd animated fadeInUp wrapper bg-info">
								<p class="text-white">No.3</p>
								<div class="center text-center m-t-n">
									<a href="#"><i id="${rsl[2].songList.listId }"
										class="icon-control-play i-2x addMusicListToListAndPlay"></i></a>
								</div>
							</div>
							<div class="bottom gd bg-info wrapper">
								<div class="m-t m-b">
									<a href="songListDetail?songListId=${rsl[2].songList.listId }"
										class="b-b b-info h4 text-u-c text-lt font-bold">${rsl[2].songList.listName }</a>
								</div>
								<p class="hidden-xs">${rsl[2].songList.listDetail }</p>
							</div>
							<a href="songListDetail?songListId=${rsl[2].songList.listId }"><img
								src="${rsl[2].img }" alt="" class="img-full"></a>
						</div>
						<div class="item">
							<div class="item-overlay gd animated fadeInUp wrapper bg-info">
								<p class="text-white">No.4</p>
								<div class="center text-center m-t-n">
									<a href="#"><i id="${rsl[3].songList.listId }"
										class="icon-control-play i-2x addMusicListToListAndPlay"></i></a>
								</div>
							</div>
							<div class="bottom gd bg-info wrapper">
								<div class="m-t m-b">
									<a href="songListDetail?songListId=${rsl[3].songList.listId }"
										class="b-b b-info h4 text-u-c text-lt font-bold">${rsl[3].songList.listName }</a>
								</div>
								<p class="hidden-xs">${rsl[3].songList.listDetail }</p>
							</div>
							<a href="songListDetail?songListId=${rsl[3].songList.listId }"><img
								src="${rsl[3].img }" alt="" class="img-full"></a>
						</div>
						<div class="item">
							<div class="item-overlay gd animated fadeInUp wrapper bg-info">
								<p class="text-white">No.6</p>
								<div class="center text-center m-t-n">
									<a href="#"><i id="${rsl[5].songList.listId }"
										class="icon-control-play i-2x addMusicListToListAndPlay"></i></a>
								</div>
							</div>
							<div class="bottom gd bg-info wrapper">
								<div class="m-t m-b">
									<a href="songListDetail?songListId=${rsl[5].songList.listId }"
										class="b-b b-info h4 text-u-c text-lt font-bold">${rsl[5].songList.listName }</a>
								</div>
								<p class="hidden-xs">${rsl[5].songList.listDetail }</p>
							</div>
							<a href="songListDetail?songListId=${rsl[5].songList.listId }"><img
								src="${rsl[5].img }" alt="" class="img-full"></a>
						</div>
						<div class="item">
							<div class="item-overlay gd animated fadeInUp wrapper bg-info">
								<p class="text-white">No.5</p>
								<div class="center text-center m-t-n">
									<a href="#"><i id="${rsl[4].songList.listId }"
										class="icon-control-play i-2x addMusicListToListAndPlay"></i></a>
								</div>
							</div>
							<div class="bottom gd bg-info wrapper">
								<div class="m-t m-b">
									<a href="songListDetail?songListId=${rsl[4].songList.listId }"
										class="b-b b-info h4 text-u-c text-lt font-bold">${rsl[4].songList.listName }</a>
								</div>
								<p class="hidden-xs">${rsl[4].songList.listDetail }</p>
							</div>
							<a href="songListDetail?songListId=${rsl[4].songList.listId }"><img
								src="${rsl[4].img }" alt="" class="img-full"></a>
						</div>

					</div>
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
	<script src="js/masonry/tiles.min.js"></script>
	<script src="js/masonry/demo.js"></script>
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