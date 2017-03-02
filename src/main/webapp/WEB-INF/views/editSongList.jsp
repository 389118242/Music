<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>编辑歌单</title>
<link rel="stylesheet" href="css/app.css" type="text/css" />
<link rel="stylesheet" href="css/bulidpop.css" type="text/css" />
<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
<link rel="stylesheet" href="css/editsonglist.css" type="text/css" />
<link href="css/cropper.min.css" rel="stylesheet" type="text/css">
<script src="js/jquery.min.js"></script>
<script src="js/cropper.min.js"></script>
<script src="js/my.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/parsley/parsley.min.js"></script>
<script type="text/javascript" src="js/ajaxfileupload.js"></script>

<style>
a:hover {
	text-decoration: none;
}

.m-seltags h4 {
	margin-top: 0px;
	padding: 15px 0 0;
	color: #999;
	font-weight: normal;
	float: left;
	width: 50px;
	margin-right: -50px;
	line-height: 30px;
}

.taglst ul {
	margin: -10px 0 0 30px;
}

.taglst ul li {
	position: relative;
	float: left;
	display: inline;
	width: 70px;
	height: 31px;
	margin: 20px 0px 0 40px;
	border-top: none;
	text-align: center;
	padding: 0px;
}

.m-seltags ul {
	margin: -10px 0 0 30px;
}

.f-cb {
	
}

.m-seltags li {
	position: relative;
	float: left;
	display: inline;
	width: 70px;
	height: 31px;
	margin: 10px 0 0 20px;
}

li, s {
	list-style: none;
}

li {
	display: list-item;
	text-align: -webkit-match-parent;
}

.m-seltags .u-btn2 {
	position: absolute;
	width: 65px;
}

.m-seltags .u-btn2 {
	position: absolute;
	width: 65px;
}

.m-seltags .u-btn2, .m-seltags .u-btn2 i, .m-seltags .u-btn2:hover,
	.m-seltags .u-btn2:hover i, .m-seltags .u-btn2:active, .m-seltags .u-btn2:active i
	{
	display: block;
	color: #666;
}

.u-btn2-1 {
	color: #333;
	background-position: right -100px;
	background-color: rgb(232, 231, 231);;
}

.u-btn2, .u-btn2:hover {
	text-decoration: none;
}

.u-btn2 {
	padding: 0 5px 0 0;
	white-space: nowrap;
}

.u-btn2, .u-btn2 i {
	display: inline-block;
	height: 31px;
	line-height: 31px;
	overflow: hidden;
	vertical-align: top;
	text-align: center;
	cursor: pointer;
}

.taglst a {
	padding: 0 !important;
	text-decoration: none !important;
	background-image: none !important;
}

#save {
	height: 30px;
	width: 85px;
	margin: 0px;
	color: whitesmoke;
}

.tagSelected {
	background-color: #4cb6cb !important;
}
</style>
<script>
	$(function() {
		//文本域获取焦点
		$('textarea').focus(function() {
			//判断内容是否为空
			if ($(this).val() == '') {
				$('a[name=save]').removeClass('color1');
			} else {
				$('a[name=save]').addClass('color1');
			}
		}).blur(function() {//失去焦点时
			if ($(this).val() == '') {
				$('a[name=save]').removeClass('color1');
			} else {
				$('a[name=save]').addClass('color1');
			}
		});
		//点击歌单展开
		$('span[class=rtitle]').click(function() {
			//展开
			if ($(this).parent().parent().hasClass('n-minelst-hide')) {
				$(this).parent().parent().removeClass('n-minelst-hide');
				$(this).parent().next().hide().show();
			}
			//隐藏
			else {
				$(this).parent().parent().addClass('n-minelst-hide');
				$(this).parent().next().hide();
			}

		});

		$('#deletebutton').click(
				function() {
					var $li = $('<li class="j-iflag" id=""'+
							'value="" data-matcher="playlist-174140198">'+
							'<div name="songList" class="item f-cb">'+
								'<div class="left"><a href="" '+
										'hidefocus="true" class="avatar"><img src="" alt=""></a>'+
								'</div><p class="name f-thide">'+
									'<a hidefocus="true" '+
										'href="" '+
										'class="s-fc0"></a>'+
								'</p><p class="s-fc4 f-thide num">首</p>'+
							'</div><span class="oper hshow" style="display: none;"> <a '+
									'name="edit" hidefocus="true" title="编辑" '+
									'href="javascript:void(0);" class="u-icn u-icn-10"></a> <a '+
									'name="delete" hidefocus="true" title="删除" '+
									'href="javascript:void(0);" class="u-icn u-icn-11" '+
									'data-toggle="modal" data-target="#delete"></a></span></li>');
					$.post("deleteSongList", {
						songListId : $('#delete_input').val()

					}, function() {
						//清空ul
						$('ul[name=new] li').remove();
						//获取该用户所有歌单
						$.post("getSongList", {}, function(data, textStatus) {
							var songListList = data;
							$.each(songListList, function(i, list) {
								$li1 = $li.clone();
								$li1.appendTo($('ul[name=new]'));
								$li1.attr("id",list.listId)
								$li1.attr("value",list.listId)
								$li1.find('img').attr("src", list.listImg);
								$li1.find('a').attr("href", "songListDetail?songListId="+list.listId);
								$li1.children().children().eq(1).children()
										.text(list.listName);
								$li1.children().children().eq(2).text(
										list.songsList.length + "首");
								if (i == 0) {
									$li1.find('span').remove();
								}

							});
							addEvents();
							$('#delete').modal('hide');
						});

					});

					event.preventDefault();
				});

		//点提交按钮时用ajax提交
		$('#editForm').click(function() {
			var param = {};
			param.listId = $('input[name=songListId]').val();
			param.listName = $('input[name=SongListName]').val();
			param.listDetail = $('textarea[name=SongListDetail]').val();
			param.listKind = [];
			var lk = $('.tags').children().not(":last");
			for (var i = 0; i < lk.length; i++) {
				param.listKind.push(lk[i].id.substring(3));
			}
			param.imgPath = $('#image').attr("src");
			param.imgData = cropperData;
			/**
			$.post("editList", {
				listName : $('input[name=SongListName]').val(),
				listDetail : $('textarea[name=SongListDetail]').val(),
				listId : $('input[name=songListId]').val()

			});
			 */
			$.ajax({
				url : "editList",
				type : "POST",
				data : JSON.stringify(param),
				contentType : "application/json; charset=utf-8",
				success : function(ret) {
					alert(ret=="s"?"修改成功":"修改失败");
				}
			});
		});

		//新建歌单 采用ajax
		$('#new').click(
				function(event) {
					var $li = $('<li class="j-iflag" id=""'+
							'value="" data-matcher="playlist-174140198">'+
							'<div name="songList" class="item f-cb">'+
								'<div class="left"><a href="" '+
										'hidefocus="true" class="avatar"><img src="" alt=""></a>'+
								'</div><p class="name f-thide">'+
									'<a hidefocus="true" '+
										'href="" '+
										'class="s-fc0"></a>'+
								'</p><p class="s-fc4 f-thide num">首</p>'+
							'</div><span class="oper hshow" style="display: none;"> <a '+
									'name="edit" hidefocus="true" title="编辑" '+
									'href="javascript:void(0);" class="u-icn u-icn-10"></a> <a '+
									'name="delete" hidefocus="true" title="删除" '+
									'href="javascript:void(0);" class="u-icn u-icn-11" '+
									'data-toggle="modal" data-target="#delete"></a></span></li>');
					$.post("addNewList", {
						listName : $('input[name=listName]').val()

					}, function() {
						//清空ul
						$('ul[name=new] li').remove();
						//获取该用户所有歌单
						$.post("getSongList", {}, function(data, textStatus) {
							var songListList = data;
							$('span.j-flag:first').text(data.length);
							$.each(songListList, function(i, list) {
								$li1 = $li.clone();
								$li1.appendTo($('ul[name=new]'));
								$li1.attr("id",list.listId)
								$li1.attr("value",list.listId)
								$li1.find('a').attr("href", "songListDetail?songListId="+list.listId);
								$li1.find('img').attr("src", list.listImg);
								$li1.children().children().eq(1).children()
										.text(list.listName);
								$li1.children().children().eq(2).text(
										list.songsList.length + "首");
								if (i == 0) {
									$li1.find('span').remove();
								}
							});
							addEvents();
							$('#myModal').modal('hide');

						});
					});
					event.preventDefault();
				});

		var addEvents = function() {
			//新建歌单弹框 点击新建按钮input内容清空
			$('#newButton').click(function() {
				$('input[name=listName]').val('');
			});
			//鼠标滑过显示编辑删除
			$('.item ').parent().hover(function() {
				$(this).children().eq(1).show();
			}, function() {
				$(this).children().eq(1).hide();
			});

			//点删除时删除歌单
			$('a[name=delete]').click(function() {
				$('#delete_input').val('');
				//获取要删除的歌单id号
				var listId = $(this).parent().parent().val();
				//把id号赋给隐藏域
				$('#delete_input').val(listId);

			});
			//点击编辑时用ajax获取歌单信息
			$('a[name=edit]').click(
					function() {
						var list;
						$.post("showSongList", {
							//传入歌曲id
							listId : $(this).parent().parent().val(),

						},
								function(data, textStatus) {
									//处理data数据
									list = data;
									//更改右侧的编辑歌单信息
									$('input[name=SongListName]').val(
											list.listName);
									$('textarea[name=SongListDetail]').val('');
									$('textarea[name=SongListDetail]').val(
											list.listDetail);
									$('input[name=songListId]')
											.val(list.listId);
									$('a[name=linkName]').text(list.listName);
									$('a[name=linkName]').attr(
											"href",
											"songListDetail?songListId="
													+ list.listId);
									$("#edit_cover").attr("src", list.listImg);
								});

					});

		}

		addEvents();

		$('#addKind')
				.on(
						'show.bs.modal',
						function() {
							$
									.ajax({
										url : "getListKind",
										type : "post",
										dataType : "json",
										success : function(ret) {
											var $ul = $('#addKind ul');
											$ul.children().remove();
											kindCount = 1;
											for (var i = 0; i < ret.length; i++) {
												$ul
														.append('<li><a id="'+ret[i].kindId+'" href="#" class="u-btn2 u-btn2-1 u-btn2-sm"'+
									' style="margin-right: 0px; border-radius: 13px;"> <i>'
																+ ret[i].kindName
																+ '</i>'
																+ '</a></li>');
												if ($('#tag' + ret[i].kindId).length > 0) {
													$ul
															.children()
															.last()
															.children()
															.addClass(
																	'tagSelected');
													kindCount++;
												}
											}

											var num = $(".u-btn2-1")
													.click(
															function() {
																if ($(this)
																		.hasClass(
																				'tagSelected')) {
																	$(this)
																			.removeClass(
																					'tagSelected');
																	kindCount--;
																	return;
																}
																if (kindCount > 3)
																	alert("最多选择三个标签");
																else {
																	kindCount++;
																	$(this)
																			.addClass(
																					'tagSelected');
																}

															});

										}
									});
						});
		$('#save')
				.click(
						function() {
							var $selected = $('a.tagSelected');
							$('#tag').siblings().remove();
							for (var i = 0; i < $selected.length; i++) {
								$('#tag')
										.before(
												'<a href="javascript:;" class="badge bg-light"'+
						'id="tag'+$selected[i].id+'">'
														+ $selected[i].innerText
														+ '</a>');
							}
							$('#addKind').modal('hide');
						});
		$('button[data-dismiss="modal"]').click(function() {
			$("#edit_cover").attr("src", listImgPath);
		});

	})
	var kindCount = 1;
	var listImgPath = "${songList.listImg}";
</script>
</head>
<body>

	<!--新建歌单弹框-->
	<div role="dialog" tabindex="-1" aria-labelledby="myModalLabel"
		aria-hidden="true" id="myModal"
		style="overflow: hidden; top: 20%; bottom: 40.9%; left: 30%;"
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

	<div role="dialog" tabindex="-1" aria-labelledby="myModalLabel"
		aria-hidden="true" id="addKind"
		style="overflow: hidden; top: 20%; bottom: 40.9%; left: 30%;"
		class="modal fade auto-1473594539484 m-layer z-show m-layer-w2">
		<div class="zbar" id="auto-id-bpDfekqTEA8M9tat"
			style="overflow-y: auto">
			<div class="zttl">选择标签</div>
		</div>
		<div class="zcnt" style="height: 81%; overflow-y: auto; border: 0">
			<div id="songList" class="lyct lyct-1 m-favgd f-cb"
				style="padding: 13px;">
				<div class="tit j-flag" id="newList" data-dismiss="modal"
					data-toggle="modal" data-target="#newbulid">选择合适的标签</div>
				<div class="m-seltags">

					<div class="tagtyp f-cb" id="songstyle">
						<h4>风格:</h4>
						<div class="taglst">
							<ul class="f-cb" style="padding-left: 0px">
								<li><a href="#" class="u-btn2 u-btn2-1 u-btn2-sm"
									style="margin-right: 0px; border-radius: 13px;"> <i>流行</i>
								</a></li>

							</ul>
						</div>
					</div>
				</div>

				<div class="lybtc" style="text-align: center; margin-top: 20px">
					<a id="save" href="Javascript:;" hidefocus="true"
						class="u-btn2 u-btn2-2"> <i>保存并关闭</i>
					</a>
				</div>
			</div>
			<!--<button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="background-color: white;color:black">&times;</button>-->
			<button type="button" class="close zcls" data-dismiss="modal"
				aria-hidden="true" id="auto-id-gZz1lykTByivR2Bd" title="关闭窗体">×
			</button>
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
					<h2 style="padding-left: 150px; padding-bottom: 20px;">是否删除歌单?</h2>
					<button type="submit" id="deletebutton">删除</button>
					<button id="cancel" data-dismiss="modal">取消</button>
				</div>
			</div>
			<!--<button type="button" class="close" data-dismiss="modal" aria-hidden="true" style="background-color: white;color:black">&times;</button>-->
			<button type="button" class="close zcls" data-dismiss="modal"
				aria-hidden="true" id="auto-id-gZz1lykTByivR2Bd" title="关闭窗体">×
			</button>
		</form>
	</div>


	<div id="g_mymusic" class="g-mymusic" style="height: 548px;">
		<div class="g-bd3 p-mymusic f-cb" style="min-height: 346px;">

			<div class="g-sd3 u-scroll n-musicsd f-pr j-flag"
				style="overflow-y: scroll; background-color: #f9f9f9">
				<div id="left" style="height: 500px">
					<div class="n-minelst n-minelst-1" style="margin-top: 8px;">
						<h2 class="f-ff1">
							<a id="newButton" href="#" class="u-btn u-btn-crt f-fr j-flag"
								data-toggle="modal" data-target="#myModal"> <!--<a href="#" class="btn btn-rounded btn-sm btn-icon btn-default" data-toggle="modal" data-target="#myModal"><i class="icon-heart"></i></a>-->
								<i>新建</i></a> <span class="rtitle" data-action="spread"><i
								class="tri tri1"></i>创建的歌单(<span class="j-flag">${fn:length(songListList) }</span>)</span>
						</h2>
						<ul name="new" class="j-flag f-cb">
							<c:forEach items="${songListList}" var="songList" varStatus="ind">
								<li class="j-iflag" id="${songList.listId}"
									value="${songList.listId}" data-matcher="playlist-174140198">
									<div name="songList" class="item f-cb">
										<div class="left">
											<a href="songListDetail?songListId=${songList.listId}"
												hidefocus="true" class="avatar"><img
												src="${songList.listImg}" alt=""></a>
										</div>
										<p class="name f-thide">
											<a hidefocus="true"
												href="songListDetail?songListId=${songList.listId}"
												class="s-fc0">${songList.listName}</a>
										</p>
										<p class="s-fc4 f-thide num">${fn:length(songList.songsList)}首</p>
									</div> <c:if test="${ind.index>0 }">
										<span class="oper hshow" style="display: none;"> <a
											name="edit" hidefocus="true" title="编辑"
											href="javascript:void(0);" class="u-icn u-icn-10"></a> <a
											name="delete" hidefocus="true" title="删除"
											href="javascript:void(0);" class="u-icn u-icn-11"
											data-toggle="modal" data-target="#delete"></a></span>
									</c:if>
								</li>
							</c:forEach>
						</ul>
					</div>

				</div>
			</div>
			<div class="g-mn3 f-pr j-flag">
				<div class="g-wrap" id="auto-id-cByl4B3LxQkFDUpR">
					<div>
						<div class="u-bread1">
							<a href="showSongListDetail?songListId=${songList.listId}"
								name="linkName" href="" class="s-fc7">${songList.listName}</a><span
								class="arr s-fc4">&gt;</span><span class="f-fw1">编辑歌单</span>
						</div>
						<div class="n-base f-cb">
							<!-- <form  > -->
							<div class="frm frm-1 m-frm m-frm-1">
								<div class="itm">
									<label class="lab"> <input name="songListId"
										value="${songList.listId}" type="hidden"> <span
										class="must s-fc6">*</span>&nbsp;&nbsp;歌单名：
									</label><input name="SongListName" type="text" class="u-txt txt j-flag"
										value="${songList.listName}" id="auto-id-TSSp118z3zqgDCwg">
									<div class="u-err f-vhide j-flag">
										<i class="u-icn u-icn-25"></i>
									</div>
								</div>
								<div class="itm">
									<label class="lab">标签：</label>
									<div class="f-cb tags">
										<c:forEach items="${listKind }" var="item">
											<a href="javascript:;" class="badge bg-light"
												id="tag${item.kindId }">${item.kindName }</a>
										</c:forEach>
										<a id="tag" data-action="select" href="javascript:void(0)"
											class="cho s-fc7" data-toggle="modal" data-target="#addKind">选择标签</a>
									</div>
									<div class="s-fc4 tagnote">选择适合的标签，最多选3个</div>
								</div>
								<div class="itm f-cb">
									<label class="lab">介绍：</label>
									<div class="u-txtwrap f-pr">
										<textarea name="SongListDetail" class="u-txt area j-flag"
											id="auto-id-cQxiQvu6qMG5eLvP"
											style="margin-top: 10px; height: 183px;">${songList.listDetail}</textarea>
										<span class="zs s-fc2 j-flag">1000</span>
									</div>
								</div>
								<div class="itm ft" style="padding-left: 25%;">
									<button id="editForm" class="btn btn-s-md btn-info btn-rounded"
										style="margin-left: 30px">提交</button>
									<!-- 
									<button type="submit" class="btn btn-s-md btn-info btn-rounded"
										style="margin-left: 30px">取消</button>
										 -->

									<!-- <a name="save" data-action="save" href="javascript:void(0)" hidefocus="true"
                                    class="u-btn2 u-btn2-1 u-btn2-w2 "><i>保 存</i></a>
                                 <a name="cancel" data-action="cc" href="javascript:void(0)"  hidefocus="true"
                                    class="u-btn2 u-btn2-1 u-btn2-w2 color1"><i>取  消</i></a>-->
								</div>
							</div>
							<div class="avatar f-pr">
								<div class="img-yl"
									style="overflow: hidden; width: 100%; height: 100%">
									<img id="edit_cover" src="${songList.listImg }">
								</div>
								<span class="btm"></span><a href="javascript:;" class="upload"
									data-toggle="modal" data-target="#alertListImg">编辑封面</a>
							</div>
							<!-- </form> -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="alertListImg" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" style="min-width: 678px">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h4 class="modal-title" id="myModalLabel">编 辑 封 面</h4>
				</div>
				<div class="modal-body">
					<form id="uploadListImg">
						<input name="songListId" value="${param.songListId }"
							hidden="hidden"> <input id="uploadImg" name="file"
							type="file">
					</form>
					<br />
					<div style="width: 100%">
						<div id="myCropper"
							style="width: 345px; height: 345px; float: left; border: 1px solid #ccc">
							<img id="image">
						</div>
						<div class="img-yl"
							style="float: right; overflow: hidden; width: 180px; height: 180px; border: 1px solid #eee">

						</div>
						<div class="img-yl"
							style="margin-top: 13px; clear: right; float: right; overflow: hidden; width: 40px; height: 40px; border: 1px solid #eee">

						</div>
						<div style="clear: both"></div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary">确定</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<script type="text/javascript">
		var cropperData = null;
		$('#uploadImg').change(function() {
			var formData = new FormData($("#uploadListImg")[0]);
			$.ajax({
				url : 'uploadListImg',
				type : 'POST',
				data : formData,
				async : false,
				cache : false,
				contentType : false,
				processData : false,
				success : function(ret) {
					if (ret == "") {
						alert("文件上传失败");
					} else if (ret == "type") {
						alert("请上传图片文件");
					} else {
						$('#image').attr("src", ret);
						var options = {
							aspectRatio : 1 / 1,
							preview : '.img-yl',
							zoomable : false,
							strict : false,
							minCropBoxWidth : 180,
							minCropBoxHeight : 180
						};
						$('#image').cropper('destroy').cropper(options);
					}
				},
				error : function(returndata) {
					alert("文件大小不可以超过20M");
				}
			});
		});
		$('button.btn-primary').click(function() {
			cropperData = $('#image').cropper('getData');
			cropperData.x = Math.round(cropperData.x);
			cropperData.y = Math.round(cropperData.y);
			cropperData.width = Math.round(cropperData.width);
			cropperData.height = Math.round(cropperData.height);
			$("#edit_cover").attr("src", "");
			$('#alertListImg').modal('hide')
		});
	</script>

</body>
</html>