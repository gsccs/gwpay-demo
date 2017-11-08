<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
       	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>移动政企客户数据库信息系统</title>
        <link href="${pageContext.request.contextPath}/static/main/css/public.css" type="text/css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/static/main/css/houtai.css" type="text/css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/static/main/css/smartMenu.css" type="text/css" rel="stylesheet">
      <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/easyui/themes/icon.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/easyui/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/easyui/jquery.easyui.min.js"></script>
       
        <style type="text/css">
        .logo-title{
        	font-size: 20px;
  			color: cornflowerblue;
  			font-weight: bolder;
        }
        th{
	font-size: 12px;
  	padding: 5px 10px;
}

.datagrid-header td{
	text-align: center;
}
.wordupload{
    width: 100px;
    padding-left: 35px;
    line-height: 30px;
    font-size: 16px;
    font-weight: 600;
}
        </style>
    </head>
    <body>
    	<div id="admin">
    		<div class="ad-menu" id="ad-menu">
                <div class="ad-logo"><img src="${pageContext.request.contextPath}/static/main/image/m-logo.png" height="103" width="130"></div>
                <div class="ad-list">
                    <ul>
                    	<c:forEach items="${menus }" var="menu" varStatus="status">
						<li>
							<div class="li-item">
								<em class="scm li-ico ic${status.index + 1 }"></em>${menu.name }<span class="scm arrow"></span>
							</div>
							<dl>
								<c:forEach items="${menu.subs }" var="submenu">
								<dt class="dd-item J_menuItem"
									href="${pageContext.request.contextPath}${submenu.url}" data-index="${submenu.id}">${submenu.name }</dt>
								</c:forEach>
							</dl>
						</li>
						</c:forEach>
                    </ul>
                </div>
            </div>
    		<div class="ad-comment-box" id="ad-comment">
                <div class="ad-top-comment">
                    <div class="ad-message">
                        <div class="ad-top-left">
                            <div class="ad-change-btn"><a id="ad-list" href="javascript:;" class="scm ad-list-btn"></a></div>
                            <div class="ad-search-box clear logo-title">客户数据库信息系统
                            </div>
                        </div>
                        <div class="ad-top-right">
                            <div class="ad-notice">
                                <ul>
                                    <li>
                                        <a href="javascript:;" class="scm nt1"><span class="scm nt-count dot">0</span></a>
                                    </li>
                                    <li>
                                        <a href="javascript:;" class="scm nt2"><span class="scm nt-count dot">0</span></a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/static/data/word.doc" style="width:100px;" class="scm nt3 wordupload">操作手册下载</a>
                                    </li>
                                </ul>
                            </div>
                            <div class="ad-welcom">
                                <div class="ad-wel-img"><img src="${pageContext.request.contextPath}/static/main/image/min_logo.png" height="36" width="36"></div>
                                <div class="ad-wel-text">
                                    <div class="font-wel">欢迎您！<strong>${user.title }</strong></div>
                                    <div class="font-wel">
                                    <a href="javascript:;" onclick="loingout();"><strong>【退出】</strong>
                                    <a href="javascript:;" onclick="changePwdFun(${user.id });"><strong>【修改密码】</strong></a>
                                    <!-- <a href="javascript:;"><strong>【退出】</strong></a> -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="ad-sub-nav-box content-tabs">
                        <!-- <div class="ad-sub-record">历史记录</div> -->
                        <a href="javascript:;" class="scm jian-a sub-sel pre j_tabBg J_tabLeft"></a>
                        <div class="ad-sub-wraper page-tabs J_menuTabs">
                            <ul class="ad-sub-list page-tabs-content">
                                <li class="active J_menuTab" data-id="${pageContext.request.contextPath}/main">首页</li>
                            </ul>
                        </div>
                        <a href="javascript:;" class="scm jian-a next j_tabBg J_tabRight"></a>
                    </div>
                </div>
                <div class="ad-main-comment J_mainContent" id="ad-iframe">
                    <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="${pageContext.request.contextPath}/main" frameborder="0" data-id="${pageContext.request.contextPath}/main" seamless></iframe>
                </div>
    		</div>
    		<div id="user_window"></div>
    	</div>
        <%-- <script type="text/javascript" src="${pageContext.request.contextPath}/static/main/js/jquery.min.js"></script> --%>
        <script type="text/javascript" src="${pageContext.request.contextPath}/static/main/js/contabs.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/static/main/js/maintabs.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/static/main/js/jquery-smartMenu-min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/static/main/js/jquery.nicescroll.min.js"></script>
        <script type="text/javascript">
        	var basepath = "${pageContext.request.contextPath}";
            $(function(){
                $(".ad-menu").niceScroll({cursorborder:"0 none",cursorcolor:"#1a1a19",cursoropacitymin:"0",boxzoom:false});
            })
            
            function changePwdFun(id) {
            	var user_window_dialog = $('#user_window').dialog({
					title : '系统用户密码修改',
					width : 400,
					height : 200,
					closed : false,
					cache : false,
					href : basepath+'/user/changepwd?id='+id,
					modal : true,
					buttons : [ {
						text : '保   存',
						handler : function() {
							$('#user_pwd_form').form('submit',{
								url : basepath+'/user/changepwd1',
								success : function(data) {
									user_window_dialog.dialog('close');
								}
							});
						}
					} ]
				});
			}		
            
            function loingout(){
            	document.location = basepath+'/loginout';
            }
        </script>
    </body>
</html>