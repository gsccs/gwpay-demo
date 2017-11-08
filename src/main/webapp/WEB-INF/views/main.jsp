<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>无标题文档</title>
<link
	href="${pageContext.request.contextPath}/static/main/css/bootstrap.min.css?v=3.3.5"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/static/main/css/font-awesome.min.css?v=4.4.0"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/static/main/css/animate.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/static/main/css/style.min.css?v=4.0.0"
	rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/easyui/themes/icon.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/easyui/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/js/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	var ctx = "${pageContext.request.contextPath}";
</script>
<style type="text/css">
.svg_dl{
	height: 30px;
}
.svg_dt{
	float: left;
	width: 30%;
}
.svg_dd{
	float: left;
	width: 70%;
}
</style>
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-sm-6">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>用户信息</h5>
						<div class="ibox-tools">
							<a class="close-link"> <i class="fa fa-times"></i>
							</a>
						</div>
					</div>
					<div class="ibox-content" style="min-height: 175px;">
						<dl class="svg_dl">
							<dt class="svg_dt">当前用户：</dt>
							<dd class="svg_dd">${user.title }</dd>
						</dl>
						<dl class="svg_dl">
							<dt class="svg_dt">登录帐号：</dt>
							<dd class="svg_dd">${user.account }</dd>
						</dl>
					</div>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>通知公告</h5>
						<div class="ibox-tools">
							<a class="close-link"> <i class="fa fa-times"></i>
							</a>
						</div>
					</div>
					<div id="notice_list_data" class="ibox-content" style="min-height: 125px;">
						
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-sm-6">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>ICT项目列表</h5>
						<div class="ibox-tools">
							<a class="close-link"> <i class="fa fa-times"></i></a>
						</div>
					</div>
					<div id="corp_list_data" class="ibox-content"
						style="min-height: 175px;"></div>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="ibox float-e-margins">
					<div class="ibox-title">
						<h5>数据上报</h5>
						<div class="ibox-tools">
							<a class="close-link"> <i class="fa fa-times"></i>
							</a>
						</div>
					</div>
					<div id="sale_list_data" class="ibox-content"
						style="min-height: 175px;"></div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		
	</script>
	<script
		src="${pageContext.request.contextPath}/static/main/js/jquery.min.js?v=2.1.4"></script>
	<script
		src="${pageContext.request.contextPath}/static/main/js/bootstrap.min.js?v=3.3.5"></script>
</body>
</html>
