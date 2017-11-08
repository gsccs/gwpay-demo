	<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" 
	import="java.util.*,com.allinpay.ets.client.SecurityUtil,java.net.*,java.io.*,com.allinpay.ets.client.SecurityUtil,com.allinpay.ets.client.StringUtil,org.apache.commons.httpclient.methods.PostMethod,org.apache.commons.httpclient.*,com.allinpay.ets.client.PaymentResult" errorPage="" %>
	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta http-equiv="Content-Language" content="zh-CN"/>
		<meta http-equiv="Expires" content="0" />        
		<meta http-equiv="Cache-Control" content="no-cache" />        
		<meta http-equiv="Pragma" content="no-cache" />
		<title>通联网上支付平台-商户接口范例-单笔订单查询确认</title>
		<link href="css.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<!-- 2. HTTPCLIENT方式提交查询请求 -->
		<hr/>
		<center> <font size=16><strong>查询结果</strong></font></center>
		
		<div style="padding-left:40px;">
			<div>订单是否成功：${isSuccess }</div>
			<div>查询处理结果：${resultMsg }</div>
			<div>订单详细信息：<br/>
				 merchantId：${paymentResult.merchantId }<br/>
				 payType：${paymentResult.payType }<br/>
				 issuerId：${paymentResult.issuerId }<br/>
				 paymentOrderId：${paymentResult.paymentOrderId }<br/>
				 orderNo：${paymentResult.orderNo }<br/>
				 orderDatetime：${paymentResult.orderDatetime }<br/>
				 orderAmount：${paymentResult.orderAmount }<br/>
				 payResult：${paymentResult.payResult }<br/>
				 errorCode：${paymentResult.errorCode }<br/>
		    </div>
		</div>

  </body>
	
</html>









