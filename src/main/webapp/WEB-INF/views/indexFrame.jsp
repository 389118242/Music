<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en" class="app">
<head>
<meta charset="utf-8" />
<title>Musik | Web Application</title>
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
<script src="js/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	 //点击收藏歌曲把歌曲id存入我的歌单弹框内
    $('.collect').click(function(){
   	 $('#songList').val('');
   	 var songid;
   	 songid=$(this).parents('.pos-rlt').attr('value');
   	 $('#songList').val(songid);
    });
	//点击收藏，收藏到歌单
	$('.collect').click(function(){
		 $('li[name=listId]').remove();
    	  $('#mylike').hide();
    	  $.post("getSongList",{
    		  
    	  },function(data,textStatus){
    		  var songListList=data;
    		  $.each(songListList,function(i,list){
    			  var $li=$('#mylike').clone();
    			  $li.show();
    			  $li.appendTo($('#listpop'));
    			  $li.attr("id",list.listId);
    			  $li.attr("name","listId")
    			  $li.children().children('p').children().text(list.listName);
    			  $li.children().children('p').eq(1).text(list.songsList.length+"首");
    			//点击歌单用ajax传送
    	          $('li[name=listId]').click(function(){
    	        	 $.post("collectSong",{
    	         	    //歌曲要收藏到的歌单
    	         		collectListId:$(this).attr('id'),
    	         		songId:$('#songList').val()
    	         	});
    	         
    	    	  
    	      })
    		  })
    		  
    	  });
    	
	});
	//新建歌单 采用ajax
     $('#new').click(function(){
    	$.post("addSongTosongList",{
    		listName:$('input[name=listName]').val(),
    	    songId:$('#songList').val()
    	},function(data,textStatus){
    	    alert("建立成功")
    	})
     })
	
	
	
})







</script>
</head>
<body>
<!--新建歌单弹框-->
<div role="dialog" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true" id="newbulid"
     style="overflow-y: auto;top: 20%;bottom: 40.9%; left: 30%;"
     class="modal fade auto-1473594539484 m-layer z-show m-layer-w2">
    <form  data-validate="parsley" method="POST">
    <div id="auto-id-rZVKAsR9HnemIBlD" class="zbar">
        <div class="zttl">新建歌单</div>
    </div>
    <div class="zcnt">
        <div id="auto-id-I7km2EPlFaoE7uW3" class="lyct m-crgd f-cb f-tc">
            <p>歌单名：<input data-required="true" id="auto-id-LSZQ38VTqM5s7eWT" class="u-txt j-flag" type="text" name="listName"></p>
            <div class="u-err f-vhide j-flag"><i class="u-icn u-icn-25"></i>错误提示</div>
            <p class="tip s-fc4">可通过“收藏”将音乐添加到新歌单中</p>
            <button  type="submit"  id="new"  >新建</button>
            <button  id="cancel" data-dismiss="modal">取消</button>
        </div>
    </div>
    <!--<button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="background-color: white;color:black">&times;</button>-->
    <button type="button" class="close zcls" data-dismiss="modal" aria-hidden="true" id="auto-id-gZz1lykTByivR2Bd"
            title="关闭窗体">×
    </button>
    </form>
</div>

      <!--添加到歌单弹框-->
                                <div id="myModal"  role="dialog" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true" class="modal fade auto-1473474137786 m-layer z-show m-layer-w2" style="top:15%; left: 30%;">
                                    <div class="zbar" id="auto-id-bpDfekqTEA8M9tat">
                                        <button  type="button" class="close" data-dismiss="modal" aria-hidden="true" style="background-color: white;color:black; width: 20px;height: 20px">&times;</button>
                                        <div class="zttl">添加到歌单</div></div><div class="zcnt" "><input id="listId" type="hidden" value="">
                                        <div id="songList" class="lyct lyct-1 m-favgd f-cb" value="">
                                    <div  class="tit j-flag" id="newList" data-dismiss="modal" data-toggle="modal" data-target="#newbulid"><i class="u-icn u-icn-33"></i>新歌单</div>
                                    <div class="j-flag" id="auto-id-lH2ZTJaEJry8z8NG">
                                    <ul id="listpop">
                                    <li  id="mylike"  data-dismiss="modal" class="xtag "><div class="item f-cb"><div class="left"><a href="javascript:void(0)" class="avatar" target="_blank"><img alt="" src="http://p4.music.126.net/zPaZBLAigYIxYHg28VABdg==/3286440256922472.jpg?param=40y40"></a></div><p class="name f-thide"><a class="s-fc0" href="javascript:void(0)" target="_blank">我喜欢的音乐</a></p><p class="s-fc3">2首</p></div>
                                    </li>
                                   
                                    
                                    </ul>
                                    </div>
                                </div>
                                </div>
                                </div>
	<section class="hbox stretch">
		<section id="content">
			<section class="hbox stretch">
				<!--左边推荐单曲-->
				<section>
					<section class="vbox">
						<section class="scrollable padder-lg w-f-md" id="bjax-target">
							<!--刷新按钮-->
							<a href="#" class="pull-right text-muted m-t-lg"
								data-toggle="class:fa-spin"> <i
								class="icon-refresh i-lg  inline" id="refresh"></i>
							</a>
							<h2 class="font-thin m-b">
								每日推荐 <span class="musicbar animate inline m-l-sm"
									style="width: 20px; height: 20px"> <span
									class="bar1 a1 bg-primary lter"></span> <span
									class="bar2 a2 bg-info lt"></span> <span
									class="bar3 a3 bg-success"></span> <span
									class="bar4 a4 bg-warning dk"></span> <span
									class="bar5 a5 bg-danger dker"></span>

								</span>
							</h2>
							
							<!--推荐单曲表-->
							<div class="row row-sm">
								<!--每个单曲-->
								<c:forEach items="${songList}" var="list">
								<div class="col-xs-6 col-sm-4 col-md-3 col-lg-2">
									<div class="item">
										<div class="pos-rlt" value="${list.songId }">
											<div class="item-overlay opacity r r-2x bg-black ">
												<div class="text-info padder m-t-sm text-sm">
													<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
														class="fa fa-star"></i> <i class="fa fa-star-o text-muted"></i>
													<i class="fa fa-star-o text-muted"></i>
												</div>
												<div class="center text-center m-t-n">
													<a href="#" data-toggle="class"> <i id="${list.songId }" 
														class="icon-control-play i-2x text addMusicToListAndPlay"></i> <i
														class="icon-control-pause i-2x text-active"></i>
													</a>
												</div>
												<div class="bottom padder m-b-sm">
													<a href="#" class="collect pull-right " data-toggle="class"> <i
														class="fa fa-heart-o text" data-toggle="modal"
														data-target="#myModal"></i>
													</a> <a href="#" data-toggle="class"> <i id="${list.songId }" 
														class="fa fa-plus-circle text addMusicToList"></i> <i
														class="fa fa-check-circle text-active text-info"></i>
													</a>
												</div>
											</div>
											<a href="#"><img src="albumImg/${list.album.albumImg}" alt=""
												class="r r-2x img-full"></a>
										</div>
										<div class="padder-v" id="${list.songId}">
											<a href="song?songId=${list.songId }" class="text-ellipsis">${list.songName}</a> <a href="singer?singerId=${list.singerId }"
												class="text-ellipsis text-xs text-muted">${list.singer.singerName}</a>
										</div>
									</div>
								</div>
							</c:forEach>
							</div>
						</section>
					</section>
					<!--/左边推荐单曲-->
				</section>
				<!--右边排行榜-->
				<aside class="aside-md bg-light dk" id="sidebar">
					<section class="vbox animated fadeInRight">
						<section class="w-f-md scrollable hover">
							<h4 class="font-thin m-l-md m-t">排行榜</h4>
							<ul class="list-group no-bg no-borders auto m-t-n-xxs">
								<!--排行榜上每一首歌-->
								<c:forEach items= "${sList }" var="item">
								<li class="list-group-item"><span
									class="pull-left thumb-xs m-t-xs avatar m-l-xs m-r-sm">
										<img src="songImg/${item.album.albumImg }" class="img-full">
								</span>
									<div class="clear">
										<div>
											<a href="song?songId=${item.songId }">${item.songName}</a>
										</div>
										<a href="singer?singerId=${item.singerId }"> <small class="text-muted">${item.singer.singerName}</small>
										</a>
									</div></li>
									</c:forEach>
							</ul>
						</section>
					</section>
				</aside>
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
	addPlayEvents();
	</script>
</body>
</html>