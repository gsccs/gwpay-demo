<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" import=" com.allinpay.ets.client.*" errorPage="" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta http-equiv="Content-Language" content="zh-CN"/>
	<meta http-equiv="Expires" CONTENT="0">        
	<meta http-equiv="Cache-Control" CONTENT="no-cache">        
	<meta http-equiv="Pragma" CONTENT="no-cache">
	<title>通联网上支付平台-商户接口范例</title>
	<link href="css.css" rel="stylesheet" type="text/css">
</head>

<body >
<center>
<br />
<br />
<font face="Verdana, Arial, Helvetica, sans-serif" size="+5"><strong>商户接口范例</strong></font>
<br />
<br />
<hr  color="#00FFFF" style="border-bottom-color:#00FF66"/>
<fieldset>
<legend>测试路径入口选择</legend>
<br />
<font face="Verdana, Arial, Helvetica, sans-serif" size="+1"><a href="${pageContext.request.contextPath}/post">订单支付</a></font>
&nbsp;&nbsp;&nbsp;
<font face="Verdana, Arial, Helvetica, sans-serif" size="+1"><a href="${pageContext.request.contextPath}/query/one">单笔订单查询</a></font>
&nbsp;&nbsp;&nbsp;
<font face="Verdana, Arial, Helvetica, sans-serif" size="+1"><a href="${pageContext.request.contextPath}/batchOrderQuery">批量订单查询</a></font>
&nbsp;&nbsp;&nbsp;
<font face="Verdana, Arial, Helvetica, sans-serif" size="+1"><a href="${pageContext.request.contextPath}/refund">联机退款申请</a></font>
</fieldset>
</center>
</body>
</html>
