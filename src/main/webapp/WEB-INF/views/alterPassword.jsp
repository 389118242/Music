<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>隐私设置</title>
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
<link rel="stylesheet" href="js/datepicker/datepicker.css"
	type="text/css" />
<link rel="stylesheet" href="js/slider/slider.css" type="text/css" />
<link rel="stylesheet" href="js/chosen/chosen.css" type="text/css" />
<!-- file input -->

<!--[if lt IE 9]>
    <script src="js/ie/html5shiv.js"></script>
    <script src="js/ie/respond.min.js"></script>
    <script src="js/ie/excanvas.js"></script>
    <![endif]-->

<style>
#tijiao2 {
	margin-left: 20%;
	margin-top: 5%;
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
								<h3 class="m-b-none">修改密码</h3>
							</div>
							<div class="container " style="width: 580px">
								<div class="col-sm-12">
									<form class=" form-horizontal" data-validate="parsley">
										<section class="panel panel-default">
											<header class="panel-heading font-bold">修改密码</header>
											<div class="panel-body">
												<div class="form-group">
													<label class="col-sm-2 control-label">账号</label>
													<div class="col-sm-10">
														<input readonly="readonly" class="form-control"
															value="${user.userAccount }">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label">旧密码</label>
													<div class="col-sm-10">
														<input id="op" type="password" class="form-control"
															data-required="true">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label">新密码</label>
													<div class="col-sm-10">
														<input id="np" type="password" class="form-control"
															data-required="true" id="pwd">
													</div>
												</div>
												<div class="form-group">
													<label class="col-sm-2 control-label">确认密码</label>
													<div class="col-sm-10">
														<input type="password" class="form-control "
															data-equalto="#pwd" data-required="true">
													</div>
												</div>

												<div id="tijiao2" class="col-sm-10">
													<button type="submit"
														class="btn btn-s-md btn-info btn-rounded">提交</button>
													<button type="reset"
														class="btn btn-s-md btn-info btn-rounded">取消</button>
												</div>
											</div>
										</section>
									</form>
								</div>
							</div>
						</section>
					</section>
				</section>
			</section>
		</section>
	</section>
</body>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/file-input/bootstrap-filestyle.min.js"></script>
<!-- parsley -->
<script src="js/parsley/parsley.min.js"></script>
<script type="text/javascript">
	$("button[type=submit]").click(function(event) {
		var a = $('form').parsley();
		var tag = true;
		var items = a.items;
		for (var i = 1; i < items.length - 1; i++) {
			var item = items[i];
			var itemTag = item.validate();
			if (!itemTag) {
				tag = itemTag;
				break;
			}
		}
		if (tag) {
			$.ajax({
				url : "alterPassword",
				type : "post",
				data : {
					"oldPassword" : $('#op').val(),
					"newPassword" : $('#np').val()
				},
				success : function(ret) {
					if (ret == "e") {
						alert("未知错误，修改失败");
					} else if (ret == "f") {
						alert("旧密码错误，修改失败");
					} else if (ret == "n") {
						alert("账号未登录，请登录后再来修改密码");
					} else {
						alert("修改成功");
						window.parent.location.href = "login";
					}
				}
			});
		}
		event.preventDefault();
	});
</script>
</html>