<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>个人设置 - 有氧音乐</title>
<meta name="description"
	content="app, web app, responsive, admin dashboard, admin, flat, flat ui, ui kit, off screen nav" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1" />
<link rel="stylesheet" href="js/jPlayer/jplayer.flat.css"
	type="text/css" />
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css"
	type="text/css" />
<link rel="stylesheet" href="css/animate.css" type="text/css" />
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css" />
<link rel="stylesheet" href="css/simple-line-icons.css" type="text/css" />
<link rel="stylesheet" href="css/font.css" type="text/css" />
<link rel="stylesheet" href="css/app.css" type="text/css" />
<link rel="stylesheet" href="js/datepicker/datepicker.css"
	type="text/css" />
<link rel="stylesheet" href="js/slider/slider.css" type="text/css" />
<link rel="stylesheet" href="js/chosen/chosen.css" type="text/css" />
<link rel="stylesheet" href="css/style.css" type="text/css">
<!-- file input -->
<script src="js/jquery.min.js"></script>
<script src="js/file-input/bootstrap-filestyle.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/bootstrap-datetimepicker.min.js"></script>
<script src="js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="js/cropbox.js"></script>
<script src="js/distpicker.data.js"></script>
<script src="js/distpicker.js"></script>
<script src="js/main.js"></script>

<!--[if lt IE 9]>
    <script src="js/ie/html5shiv.js"></script>
    <script src="js/ie/respond.min.js"></script>
    <script src="js/ie/excanvas.js"></script>
    <![endif]-->
<style type="text/css">
.modal-backdrop.fade.in {
	z-index: 0;
}

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

/*在setting页中 填充空白  --*/
#tianchong {
	height: 106px;
	width: 100%;
	padding-left: 44%;
	padding-top: 5%;
}
/*在setting中 将头像放置中间*/
#touxiang {
	width: 30%;
	margin-left: 35%;
}
/*在setting中表单保存取消按钮居中*/
#tijiao {
	margin-left: 38%;
	margin-top: 5%;
	margin-bottom: 5%;
}

/*表单中textarea不能改变大小*/
.form-control {
	border-color: #cbd5dd;
	border-radius: 2px;
	resize: none;
}

body.modal-open {
	margin: 0;
}

.input-group-addon {
	padding: 0px 0px;
	font-size: 14px;
	font-weight: normal;
	line-height: 1;
	text-align: center;
	background-color: #eee;
	border: 1px solid #ccc;
	border-radius: 4px;
}

select, textarea {
	font-family: inherit;
	font-size: 13px;
	line-height: inherit;
}

#tianchong {
	height: 100px;
	width: 100%;
	padding-left: 44%;
	padding-top: 5%;
	/* margin-top: 12%; */
}
</style>
</head>
<body>
	<section class="vbox">
		<section>
			<section class="hbox stretch">
				<section id="content">
					<section class="vbox">
						<section class="scrollable padder">
							<div class="m-b-md">
								<h3 class="m-b-none">个人设置</h3>
							</div>
							<div class="row">
								<form class="form-horizontal">
									<!--基本信息-->
									<div class="col-sm-6">
										<section class="panel panel-default">
											<header class="panel-heading font-bold">基本信息</header>
											<div class="panel-body">

												<div class="form-group">
													<label class="col-sm-2 control-label">账号</label>
													<div class="col-sm-10">
														<input readonly="readonly" class="form-control"
															value="${settingUser.userAccount}">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label">昵称</label>
													<div class="col-sm-10">
														<input class="form-control" name="userName"
															value="${settingUser.userName}">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label">个人介绍</label>
													<div class="col-sm-10">
														<textarea class="form-control" name="userDetail">${settingUser.userDetail}</textarea>
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label">性别</label>
													<div class="col-sm-10">
														<label class="radio-inline"> <input id="boy"
															type="radio" name="userGender" value="1">男
														</label> <label class="radio-inline"> <input id="girl"
															type="radio" name="userGender" value="0">女
														</label>
													</div>
													<script type="text/javascript">
														var sexx = ${settingUser.userGender};
														if (sexx == 0) {
															$('#girl').prop(
																	"checked",
																	true);
														} else {
															$('#boy').prop(
																	"checked",
																	true);
														}
													</script>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label">生日</label>
													<div class="col-sm-10">
														<div class="input-group date form_date col-md-5"
															style="width: 147px;"
															data-date="<fmt:formatDate value='${settingUser.userBirthDay}' pattern='yyyy-MM-dd'/>"
															data-date-format="yyyy-mm-dd"
															data-link-field="dtp_input2"
															data-link-format="yyyy-mm-dd">
															<input class="form-control" size="16" type="text"
																value="<fmt:formatDate value='${settingUser.userBirthDay}' pattern='yyyy-MM-dd'/>"
																style="height: auto; font-size: 14px; text-align: center; padding: 3px 12px; width: 91px;"
																readonly> <span class="input-group-addon"><span
																class="glyphicon glyphicon-calendar"
																style="width: 25px;"></span></span>
														</div>
														<input type="hidden" id="dtp_input2" name="userBirthDay"
															value="" /><br />

														<script>
															$('.form_date')
																	.datetimepicker(
																			{
																				language : 'zh-CN',
																				weekStart : 1,
																				autoclose : 1,
																				todayHighlight : 1,
																				startView : 2,
																				minView : 2,
																				forceParse : 0
																			});
														</script>
													</div>
												</div>

												<div class="form-group">
													<label class="col-sm-2 control-label">地区</label>
													<div class="col-sm-10" style="font-size: 18px">
														<div id="addressDIV">
															<select></select> <select></select> <select id="address"></select>
														</div>
														<c:if test="${settingUser.district!=null }">
															<script>
															$("#addressDIV")
																	.distpicker(
																			{
																				province : "${settingUser.province.addressName}",
																				city : "${settingUser.city.addressName}",
																				district : "${settingUser.district.addressName}"
																			});
														</script>
														</c:if>
														<c:if test="${settingUser.district==null }">
															<script>
															$("#addressDIV")
																	.distpicker();
														</script>
														</c:if>
													</div>
												</div>

											</div>
										</section>
									</div>
									<!--头像信息-->
									<div class="col-sm-6">
										<section class="panel panel-default">
											<header class="panel-heading font-bold">头像信息</header>
											<div class="panel-body" STYLE="padding-top: 80px;">
												<div id="touxiang">


													<div class="thumb-lg">
														<img src="${settingUser.userImg}" alt=""
															class="img-circle">
													</div>
												</div>
											</div>
											<div id="tianchong">
												<input class="btn btn-rounded btn-sm btn-info"
													data-toggle="modal" data-target="#selectImg" type="button"
													value="修改头像">

												<div class="modal fade" id="selectImg" tabindex="-1"
													role="dialog" aria-labelledby="myModalLabel"
													aria-hidden="true" style="text-align: center">
													<div class="modal-dialog"
														style="display: inline-block; width: auto;">
														<div class="modal-content">
															<div class="modal-header">
																<button type="button" class="close" data-dismiss="modal"
																	aria-hidden="true">&times;</button>
																<h4 class="modal-title" id="myModalLabel">选择头像</h4>
															</div>
															<div class="modal-body">

																<div class="container">
																	<div class="imageBox">
																		<div class="thumbBox"></div>
																		<div class="spinner" style="display: none">
																			Loading...</div>
																	</div>
																	<div class="action">
																		<!-- <input type="file" id="file" style=" width: 200px">-->
																		<div class="new-contentarea tc">
																			<a href="javascript:void(0)" class="upload-img">
																				<label for="upload-file">上传图像</label>
																			</a> <input type="file" class="" name="upload-file"
																				id="upload-file" />
																		</div>
																		<input type="button" id="btnCrop"
																			class="Btnsty_peyton" value="裁切"
																			style="display: none"> <input type="button"
																			id="btnZoomIn" class="Btnsty_peyton" value="+">
																		<input type="button" id="btnZoomOut"
																			class="Btnsty_peyton" value="-">
																	</div>
																	<div class="cropped"></div>
																	<input type="text" name="image" hidden="hidden">
																</div>
																<script type="text/javascript">
																	var haveSelect = false;
																	$(window)
																			.load(
																					function() {
																						var options = {
																							thumbBox : '.thumbBox',
																							spinner : '.spinner'
																						//                                                                        imgSrc: 'images/avatar.png'
																						}
																						var cropper = $(
																								'.imageBox')
																								.cropbox(
																										options);
																						$(
																								'#upload-file')
																								.on(
																										'change',
																										function() {
																											var reader = new FileReader();
																											reader.onload = function(
																													e) {
																												options.imgSrc = e.target.result;
																												cropper = $(
																														'.imageBox')
																														.cropbox(
																																options);
																											}
																											reader
																													.readAsDataURL(this.files[0]);
																											this.files = [];
																										})
																						$(
																								'#btnCrop')
																								.on(
																										'click',
																										function() {
																											var img = cropper
																													.getDataURL();
																											$(
																													'.cropped')
																													.html(
																															'');
																											$(
																													'.cropped')
																													.append(
																															'<img src="' + img + '" align="absmiddle" style="width:64px;margin-top:4px;border-radius:64px;box-shadow:0px 0px 12px #7E7E7E;" ><p>64px*64px</p>');
																											$(
																													'.cropped')
																													.append(
																															'<img src="' + img + '" align="absmiddle" style="width:128px;margin-top:4px;border-radius:128px;box-shadow:0px 0px 12px #7E7E7E;"><p>128px*128px</p>');
																											$(
																													'.cropped')
																													.append(
																															'<img src="' + img + '" align="absmiddle" style="width:180px;margin-top:4px;border-radius:180px;box-shadow:0px 0px 12px #7E7E7E;"><p>180px*180px</p>');
																											$(
																													'input[name=image]')
																													.val(
																															img);
																										})
																						$(
																								'#btnZoomIn')
																								.on(
																										'click',
																										function() {
																											cropper
																													.zoomIn();
																										})
																						$(
																								'#btnZoomOut')
																								.on(
																										'click',
																										function() {
																											cropper
																													.zoomOut();
																										})
																					});
																</script>

															</div>
															<div class="modal-footer">
																<button type="button" class="btn btn-default"
																	data-dismiss="modal">关闭</button>
																<button type="button" class="btn btn-primary">提交更改</button>
																<script>
																	$(
																			'.modal-footer button:last')
																			.click(
																					function() {
																						var str = $(
																								'input[name=image]')
																								.val();
																						if (str.length > 0) {
																							$(
																									'.thumb-lg img')
																									.attr(
																											'src',
																											str);
																							$(
																									'#selectImg')
																									.modal(
																											'hide');
																						} else {
																							alert('未选择图片...');
																						}
																					});
																</script>
															</div>
														</div>
														<!-- /.modal-content -->
													</div>
													<!-- /.modal -->
												</div>

											</div>
										</section>
									</div>
									<div id="tijiao" class="col-sm-10">
										<button type="submit"
											class="btn btn-s-md btn-info btn-rounded">提交</button>
										<button type="reset" class="btn btn-s-md btn-info btn-rounded">取消</button>
									</div>
								</form>
								<div class="modal fade" id="errorMess" tabindex="-1"
									role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-hidden="true">×</button>
												<h4 class="modal-title" id="myModalLabel">ERROR</h4>
											</div>
											<div class="modal-body">用户信息修改失败...</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													data-dismiss="modal">关闭</button>
											</div>
										</div>
									</div>
								</div>

								<div class="modal fade" id="successMess" tabindex="-1"
									role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-hidden="true">×</button>
												<h4 class="modal-title" id="myModalLabel">有氧音乐提醒您</h4>
											</div>
											<div class="modal-body">用户信息修改成功...</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													data-dismiss="modal">关闭</button>
												<button type="button" class="btn btn-primary">刷新界面
												</button>
												<script type="text/javascript">
													$('#successMess button.btn-primary').click(function(){
														location.reload();
													});
												</script>
											</div>
										</div>
									</div>
								</div>
								<script type="text/javascript">
									var name="${settingUser.userName}";
									var gender="${settingUser.userGender}"
									var detail="${settingUser.userDetail==null?'':settingUser.userDetail}";
									var birthday=new Date('${settingUser.userBirthDay==null?"1999-09-09":settingUser.userBirthDay}').toUTCString();
									var img="${settingUser.userImg}";
									var address="${settingUser.district!=null?settingUser.district.addressId:''}";
								$('button[type=submit]').click(function(event){
									var nname=$('input[name=userName]').val().trim();
									var ngender=$('input[name=userGender]:checked').val();
									var ndetail=$('textarea[name=userDetail]').val().trim();
									var nbirthday=$('input[name=userBirthDay]').val();
									var nimg=$('input[name=image]').val();
									var naddress=$('#address option:selected').attr('data-code');
									var u={};
									var tag=false;
									if(name!=nname&&nname!=''){
										u.userName=nname;
										tag=true;
									}
									if(gender!=ngender){
										u.userGender=ngender;
										tag=true;
									}
									if(detail!=ndetail&&ndetail!=''){
										u.userDetail=ndetail;
										tag=true;										
									}
									if(birthday!=new Date(nbirthday).toUTCString()&&nbirthday!=''){
										u.userBirthDay=nbirthday;
										tag=true;
									}
									if(img!=nimg&&nimg!=''){
										u.userImg=nimg;
										tag=true;
									}
									if(address!=naddress&&naddress!=''){
										u.userAddress=naddress;
										tag=true;
									}
									if(tag){
									$.ajax({
										url:"setting",
										type:"POST",
										data:JSON.stringify(u),
										contentType:"application/json",
										success:function(ret){
											if(ret){
												$('#successMess').modal();
											}else{
												$('#errorMess').modal();
											}
										}
									});
									}
									event.preventDefault();
								});
								</script>
							</div>
						</section>
					</section>
				</section>
			</section>
		</section>
	</section>
</body>
</html>