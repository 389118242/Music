<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<title>个人信息</title>
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

.messagelook {
	width: 100%;
	text-align: left;
	color: #999999;
}

.messagenolook {
	width: 100%;
	text-align: left;
	color: #3b464d;
}

.likelook {
	width: 100%;
	text-align: left;
	color: #999999;
}

.likenolook {
	width: 100%;
	text-align: left;
	color: #3b464d;
}

.letterlook {
	width: 100%;
	text-align: left;
	color: #999999;
}

.letternolook {
	width: 100%;
	text-align: left;
	color: #5e5e5e;
}

.allnewcount {
	width: 19px;
	_width: 18px;
	height: 19px;
	line-height: 19px;
	text-align: center;
	display: inline-block;
	padding: 0 2px;
	background: #4cb6cb;
	color: #fff;
	border-radius: 13px;
}

.messagenew {
	width: 19px;
	_width: 18px;
	height: 19px;
	line-height: 19px;
	text-align: center;
	display: inline-block;
	padding: 0 2px;
	background: #4cb6cb;
	color: #fff;
	border-radius: 13px;
}

.likenew {
	width: 19px;
	_width: 18px;
	height: 19px;
	line-height: 19px;
	text-align: center;
	display: inline-block;
	padding: 0 2px;
	background: #4cb6cb;
	color: #fff;
	border-radius: 13px;
}

.letternew {
	width: 19px;
	_width: 18px;
	height: 19px;
	line-height: 19px;
	text-align: center;
	display: inline-block;
	padding: 0 2px;
	background: #4cb6cb;
	color: #fff;
	border-radius: 13px;
}
</style>
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
				<section class="scrollable">
					<section class="hbox stretch">
						<aside class="aside-lg bg-light lter b-r">
							<section class="vbox">
								<section class="scrollable">
									<div class="wrapper">
										<div class="text-center m-b m-t">
											<a href="#" class="thumb-lg"> <img src="${user.userImg}"
												class="img-circle">
											</a>
											<div>
												<div class="h3 m-t-xs m-b-xs">${user.userName }</div>
												<small class="text-muted"><i
													class="fa fa-map-marker"></i>
													${user.province.addressName}&nbsp;${user.city.addressName}&nbsp;${user.district.addressName}
												</small>
											</div>
										</div>
										<!-- 
                                    <div class="panel wrapper">
                                        <div class="row text-center">
                                            <div class="col-xs-6">
                                                <a href="#">
                                                    <span class="m-b-xs h4 block">245</span>
                                                    <small class="text-muted">Followers</small>
                                                </a>
                                            </div>
                                            <div class="col-xs-6">
                                                <a href="#">
                                                    <span class="m-b-xs h4 block">55</span>
                                                    <small class="text-muted">Following</small>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="btn-group btn-group-justified m-b">
                                        <a class="btn btn-success btn-rounded" data-toggle="button"></a>
                            <span class="text">
                              <i class="fa fa-eye"></i> Follow
                            </span>
                            <span class="text-active">
                              <i class="fa fa-eye"></i> Following
                            </span>
                                    </div>
                                    <div>
                                        <small class="text-uc text-xs text-muted">about me</small>
                                        <p>Artist</p>
                                        <small class="text-uc text-xs text-muted">info</small>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi id neque quam.
                                            Aliquam sollicitudin venenatis ipsum ac feugiat.</p>
                                        <div class="line"></div>
                                        <small class="text-uc text-xs text-muted">connection</small>
                                        <p class="m-t-sm">
                                            <a href="#" class="btn btn-rounded btn-twitter btn-icon"><i
                                                    class="fa fa-twitter"></i></a>
                                            <a href="#" class="btn btn-rounded btn-facebook btn-icon"><i
                                                    class="fa fa-facebook"></i></a>
                                            <a href="#" class="btn btn-rounded btn-gplus btn-icon"><i
                                                    class="fa fa-google-plus"></i></a>
                                        </p>
                                    </div>
                                     -->
									</div>
								</section>
							</section>
						</aside>
						<aside class="bg-white" style="padding-right: 13px;">
							<section class="vbox">
								<header class="header bg-light lt">
									<ul class="nav nav-tabs nav-white">
										<li class="active"><a href="#activity" data-toggle="tab">创建的歌单</a></li>
										<li class=""><a href="#events" data-toggle="tab">收藏的歌单</a></li>
										<c:if
											test="${null!=sessionScope.user&&sessionScope.user.userId==param.userId}">
											<li class=""><a href="#interaction" data-toggle="tab">我的消息<em
													class="allnewcount">1</em></a></li>
										</c:if>
									</ul>
								</header>
								<section class="scrollable">
									<div class="tab-content">
										<div class="tab-pane active" id="activity">
											<ul
												class="list-group no-radius m-b-none m-t-n-xxs list-group-lg no-border">
												<c:forEach items="${songListList }" var="item"
													varStatus="ind">
													<li id="myLikeSong" class="list-group-item"><a
														href="#" class="thumb-sm pull-left m-r-sm"
														style="position: relative;"> <img
															src="${item.listImg }" class="img-circle">
													</a> <a href="songListDetail?songListId=${item.listId }"
														class="clear" style="height: 37px"> <strong
															class="block">${item.listName }</strong> <small></small>
													</a> <c:if
															test="${null!=sessionScope.user&&sessionScope.user.userId==param.userId&&ind.index>0}">
															<a href="editSongList?songListId=${item.listId }"
																class="btn btn-rounded btn-sm btn-icon btn-default"
																style="position: absolute; top: 13px; right: 10px"><i
																class="icon-note"></i></a>
														</c:if></li>
												</c:forEach>

											</ul>
										</div>
										<div class="tab-pane" id="events">
											<ul
												class="list-group no-radius m-b-none m-t-n-xxs list-group-lg no-border">
												<c:forEach items="${collectionList }" var="item">
													<li id="myLikeSong" class="list-group-item"><a
														href="#" class="thumb-sm pull-left m-r-sm"
														style="position: relative;"> <img
															src="${item.listImg }" class="img-circle">
													</a> <a href="songListDetail?songListId=${item.listId }"
														class="clear" style="height: 37px"> <strong
															class="block">${item.listName }</strong> <small></small>
													</a></li>
												</c:forEach>

											</ul>
										</div>
										<c:if
											test="${null!=sessionScope.user&&sessionScope.user.userId==param.userId}">
											<!-- param. -->
											<div class="tab-pane" id="interaction">

												<div class="tabbable tabs-left">
													<ul class="nav nav-tabs">
														<li class="active"><c:if test="${messageNew!=0}">
																<a href="#first" data-toggle="tab">评论<em
																	class="messagenew">${messageNew}</em></a>
															</c:if> <c:if test="${messageNew==0}">
																<a href="#first" data-toggle="tab">评论</a>
															</c:if></li>
														<li><c:if test="${likesNew!=0}">
																<a href="#second" data-toggle="tab">回复<em
																	class="likenew">${likesNew}</em></a>
															</c:if> <c:if test="${likesNew==0}">
																<a href="#second" data-toggle="tab">回复</a>
															</c:if></li>
														<li><c:if test="${lettersNew!=0}">
																<a href="#third" data-toggle="tab">私信<em
																	class="letternew">${lettersNew }</em></a>
															</c:if> <c:if test="${lettersNew==0}">
																<a href="#third" data-toggle="tab">私信</a>
															</c:if></li>
													</ul>

													<div class="tab-content">
														<div id="first" class="tab-pane fade in active">
															<c:forEach items="${messagesList}" var="messages">
																<div class="text-center wrapper">
																	<c:if test="${messages.isRead==0}">
																		<div id=${ messages.messId} class="messagenolook">
																			<a href="profile?userId=${messages.user.userId}">${messages.user.userName}</a><br />评论我：${messages.messContent }
																		</div>
																	</c:if>
																	<c:if test="${messages.isRead==1}">
																		<div id=${ messages.messId} class="messagelook">
																			<a href="profile?userId=${messages.user.userId}">${messages.user.userName}</a><br />评论我：${messages.messContent }
																		</div>
																	</c:if>
																</div>
															</c:forEach>
														</div>
														<div id="second" class="tab-pane fade">
															<c:forEach items="${likesList}" var="likes">
																<div class="text-center wrapper">
																	<c:if test="${likes.isRead==0}">
																		<div id=${likes.messId } class="likenolook">
																			<a href="profile?userId=${likes.user.userId}">${likes.user.userName}</a><br />回复我：${likes.messContent }
																		</div>
																	</c:if>
																	<c:if test="${likes.isRead==1}">
																		<div id=${likes.messId } class="likelook">
																			<a href="profile?userId=${likes.user.userId}">${likes.user.userName}</a><br />回复我：${likes.messContent }
																		</div>
																	</c:if>
																</div>
															</c:forEach>

														</div>
														<div id="third" class="tab-pane fade">
															<c:forEach items="${lettersList}" var="letters">
																<div class="text-center wrapper">
																	<c:if test="${letters.isRead==0 }">
																		<div id=${letters.messId } class="letternolook">
																			<c:if
																				test="${letters.sendUserId==letters.receiveUserId}">
                                                            系统消息:${letters.messContent}
                                                         </c:if>
																			<c:if
																				test="${letters.sendUserId!=letters.receiveUserId}">
																				<a href="#">${letters.user.userName}</a>私信你：${letters.messContent}
                                                         </c:if>
																		</div>
																	</c:if>
																	<c:if test="${letters.isRead==1 }">
																		<div id=${letters.messId } class="letterlook">
																			<c:if
																				test="${letters.sendUserId==letters.receiveUserId}">
                                                            系统消息:${letters.messContent}
                                                         </c:if>
																			<c:if
																				test="${letters.sendUserId!=letters.receiveUserId}">
																				<a href="#">${letters.user.userName}</a>私信你：${letters.messContent}
                                                         </c:if>
																		</div>
																	</c:if>
																</div>
															</c:forEach>

														</div>
													</div>
												</div>
											</div>
										</c:if>
									</div>
								</section>
							</section>
						</aside>
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
	<script src="js/charts/easypiechart/jquery.easy-pie-chart.js"></script>
	<script src="js/app.plugin.js"></script>
	<script type="text/javascript" src="js/jPlayer/jquery.jplayer.min.js"></script>
	<script type="text/javascript"
		src="js/jPlayer/add-on/jplayer.playlist.min.js"></script>
	<script type="text/javascript" src="js/jPlayer/demo.js"></script>
	<script>
		$(function() {
			allcount();
			//点击表示已读消息
			$(".messagenolook")
					.click(
							function() {
								doAjax($(this).attr("id"));
								if (parseInt($(this).parent().parent().parent()
										.prev().children().eq(0).children()
										.children().text()) == 1) {

									$(this).parent().parent().parent().prev()
											.children().eq(0).children()
											.children().remove();
									$(this)[0].className = 'messagelook';
								} else {
									$(this)
											.parent()
											.parent()
											.parent()
											.prev()
											.children()
											.eq(0)
											.children()
											.children()
											.text(
													parseInt($(this).parent()
															.parent().parent()
															.prev().children()
															.eq(0).children()
															.children().text()) - 1);
									$(this)[0].className = 'messagelook';
								}
								allcount();

							});
			//点击表示已读点赞
			$(".likenolook")
					.click(
							function() {
								doAjax($(this).attr("id"));
								if (parseInt($(this).parent().parent().parent()
										.prev().children().eq(1).children()
										.children().text()) == 1) {

									$(this).parent().parent().parent().prev()
											.children().eq(1).children()
											.children().remove();
									$(this)[0].className = 'likelook';
								} else {
									$(this)
											.parent()
											.parent()
											.parent()
											.prev()
											.children()
											.eq(1)
											.children()
											.children()
											.text(
													parseInt($(this).parent()
															.parent().parent()
															.prev().children()
															.eq(1).children()
															.children().text()) - 1);
									$(this)[0].className = 'likelook'
								}
								allcount();
							});
			//点击表示已读私信
			$(".letternolook")
					.click(
							function() {
								doAjax($(this).attr("id"));
								if (parseInt($(this).parent().parent().parent()
										.prev().children().eq(2).children()
										.children().text()) == 1) {

									$(this).parent().parent().parent().prev()
											.children().eq(2).children()
											.children().remove();
									$(this)[0].className = 'letterlook';
								} else {
									$(this)
											.parent()
											.parent()
											.parent()
											.prev()
											.children()
											.eq(2)
											.children()
											.children()
											.text(
													parseInt($(this).parent()
															.parent().parent()
															.prev().children()
															.eq(2).children()
															.children().text()) - 1);
									$(this)[0].className = 'letterlook'
								}
								allcount();
							});
			//计算总评论数
			function allcount() {

				var messagenew = 0;
				var likenew = 0;
				var letternew = 0;
				if ($(".messagenew").text() != "")
					messagenew = parseInt($(".messagenew").text());
				if ($(".letternew").text() != "")
					letternew = parseInt($(".letternew").text());
				if ($(".likenew").text() != "")
					likenew = parseInt($(".likenew").text());
				if (messagenew + likenew + letternew == 0)
					$(".allnewcount").remove();
				else
					$(".allnewcount").text(messagenew + likenew + letternew);

			}
			//ajax
			function doAjax(messId) {
				$.ajax({
					type : "POST",
					url : "ajaxChange",
					data : {
						messId : messId
					},
					dataType : "text",
				});
			}

		});
	</script>

</body>
</html>