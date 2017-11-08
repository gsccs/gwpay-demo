<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>酒泉移动信息报送系统</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/style.css" />
<script language="JavaScript" src="${pageContext.request.contextPath}/static/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/cloud.js"></script>

<script language="javascript">
$(function(){
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
	$(window).resize(function(){  
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
    })  
});  
	
</script>

</head>

<body style="background-color: #1c77ac; background-image: url(${pageContext.request.contextPath}/static/images/light.png); background-repeat: no-repeat; background-position: center top; overflow: hidden;">
<script type="text/javascript">
if(window !=top){  
    top.location.href=location.href;  
}  
</script>
	<div id="mainBody">
		<div id="cloud1" class="cloud"></div>
		<div id="cloud2" class="cloud"></div>
	</div>


	<div class="logintop">
		<span>欢迎登录酒泉移动信息报送系统</span>
		<ul>
			<!-- <li><a href="#">回首页</a></li>
			<li><a href="#">帮助</a></li>
			<li><a href="#">关于</a></li> -->
		</ul>
	</div>

	<div class="loginbody">

		<span class="systemlogo"></span>

		<div class="loginbox">
			<form action="${pageContext.request.contextPath}/login" method="post">
			<ul>
				<li><input name="username" type="text" class="loginuser" value=""
					onclick="JavaScript:this.value=''" /></li>
				<li><input name="password" type="password" class="loginpwd" value=""
					onclick="JavaScript:this.value=''" /></li>
				<li><input name="" type="submit" class="loginbtn" value="登录"
					/><label>
					<input name="" type="checkbox" value="" checked="checked" />记住密码</label>
						<!-- <label><a href="#">忘记密码？</a></label> -->
				</li>
				<li class="logoerror">${error}</li>
			</ul>
			</form>
		</div>
	</div>
	<div class="loginbm">
		版权所有 2016 <a href="#">中国移动酒泉分公司</a>
	</div>
</body>

</html>
