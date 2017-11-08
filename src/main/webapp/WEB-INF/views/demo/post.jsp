<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" import=" com.allinpay.ets.client.*" errorPage="" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
	<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<title>通联网上支付平台-商户接口范例-支付请求信息签名</title>
	</head>
	<body>
	<center> <h2>支付请求信息签名</h2></center>	
	<!--
		1、订单可以通过post方式或get方式提交，建议使用post方式；
		   提交支付请求可以使用http或https方式，建议使用https方式。
		2、通联支付网关地址、商户号及key值，在接入测试时由通联提供；
		   通联支付网关地址、商户号，在接入生产时由通联提供，key值在通联支付网关会员服务网站上设置。
	-->
	<center>
	<!--================= post 方式提交支付请求 start =====================-->
    <!--================= 测试地址为 http://ceshi.allinpay.com/gateway/index.do =====================-->
	<!--================= 生产地址请在测试环境下通过后从业务人员获取 (https://service.allinpay.com/gateway/index.do )=====================-->
	<form name="form2" action="${serverUrl  }" method="post" > 
		<input type="hidden" name="inputCharset" value="${requestOrder.inputCharset }"/>
		<input type="hidden" name="pickupUrl" value="${requestOrder.pickupUrl }"/>
		<input type="hidden" name="receiveUrl" value="${requestOrder.receiveUrl }" />
		<input type="hidden" name="version" value="${requestOrder.version  }"/>
		<input type="hidden" name="language" value="${requestOrder.language  }" />
		<input type="hidden" name="signType" value="${requestOrder.signType }"/>
		<input type="hidden" name="merchantId" value="${requestOrder.merchantId }" />
		<input type="hidden" name="payerName" value="${requestOrder.payerName }"/>
		<input type="hidden" name="payerEmail" value="${requestOrder.payerEmail }" />
		<input type="hidden" name="payerTelephone" value="${requestOrder.payerTelephone  }" />
		<input type="hidden" name="payerIDCard" value="${requestOrder.payerIDCard  }" />
		<input type="hidden" name="pid" value="${requestOrder.pid }"/>
		<input type="hidden" name="orderNo" value="${requestOrder.orderNo }" />
		<input type="hidden" name="orderAmount" value="${requestOrder.orderAmount  }"/>
		<input type="hidden" name="orderCurrency" value="${requestOrder.orderCurrency }" />
		<input type="hidden" name="orderDatetime" value="${requestOrder.orderDatetime }" />
		<input type="hidden" name="orderExpireDatetime" value="${requestOrder.orderExpireDatetime  }"/>
		<input type="hidden" name="productName" value="${requestOrder.productName }" />
		<input type="hidden" name="productPrice" value="${requestOrder.productPrice }" />
		<input type="hidden" name="productNum" value="${requestOrder.productNum  }"/>
		<input type="hidden" name="productId" value="${requestOrder.productId }" />
		<input type="hidden" name="productDesc" value="${requestOrder.productDesc }" />
		<input type="hidden" name="ext1" value="${requestOrder.ext1 }" />
		<input type="hidden" name="ext2" value="${requestOrder.ext2 }" />
		<input type="hidden" name="payType" value="${requestOrder.payType }" />
		<input type="hidden" name="issuerId" value="${requestOrder.issuerId }" />
		<input type="hidden" name="pan" value="${requestOrder.pan  }" />
		<input type="hidden" name="tradeNature" value="${requestOrder.tradeNature  }" />
		<input type="hidden" name="signMsg" value="${strSignMsg  }" />
		
	    <input type="submit" value="确认付款，到通联支付去啦"/>
	 </form>
	<!--================= post 方式提交支付请求 end =====================-->
	</center>
	<BODY BGCOLOR='#FFFFFF' TEXT='#000000' LINK='#0000FF' VLINK='#0000FF' ALINK='#FF0000'>
	<table border="1" cellpadding="1" cellspacing="1" align="center">
			<!-- 报文参数 -->
			<tr>
				<td width="40%">1. 编码:</td>
				<td> ${requestOrder.inputCharset}</td>
			</tr>
			<tr>
				<td>2. 取货地址:</td>
				<td> ${requestOrder.pickupUrl}</td>
			</tr>
			<tr>
				<td>3. 商户系统通知地址:</td>
				<td> ${requestOrder.receiveUrl}</td>
			</tr>
			<tr>
				<td>4. 报文版本号:</td>
				<td> ${requestOrder.version}</td>
			</tr>
			<tr>
				<td>5. 语言:</td>
				<td>${requestOrder.language }</td>
			</tr>
			<tr>
				<td>6. 签名方式:</td>
				<td>${requestOrder.signType}</td>
			</tr>
			<!-- 买卖双方信息参数 -->
			<tr>
				<td>7. 商户号:</td>
				<td> ${requestOrder.merchantId}</td>
			</tr>
			<tr>
				<td>8. 付款人名称:</td>
				<td> ${requestOrder.payerName}</td>
			</tr>
			<tr>
				<td>9. 付款人联系email:</td>
				<td> ${requestOrder.payerEmail}</td>
			</tr>
			<tr>
				<td>10. 付款人电话:</td>
				<td> ${requestOrder.payerTelephone}</td>
			</tr>
			<tr>
				<td>11. 付款人证件号:</td>
				<td><textarea cols="60" rows="1">${requestOrder.payerIDCard }</textarea></td>
			</tr>
			<tr>
				<td>12. 合作伙伴的商户号:</td>
				<td> ${requestOrder.pid }</td>
			</tr>
			<!-- 业务参数 -->
			<tr>
				<td>13. 商户系统订单号:</td>
				<td> ${requestOrder.orderNo }</td>
			</tr>
			<tr>
				<td>14. 订单金额(单位分):</td>
				<td> ${requestOrder.orderAmount}</td>
			</tr>
			<tr>
				<td>15. 金额币种:</td>
				<td> ${requestOrder.orderCurrency }</td>
			</tr>
			<tr>
				<td>16. 商户的订单创建时间:</td>
				<td> ${requestOrder.orderDatetime}</td>
			</tr>
			<tr>
				<td>17. 订单过期时间:</td>
				<td> ${requestOrder.orderExpireDatetime}</td>
			</tr>
			<tr>
				<td>18. 商品名称:</td>
				<td> ${requestOrder.productName}</td>
			</tr>
			<tr>
				<td>19. 商品单价:</td>
				<td> ${requestOrder.productPrice}</td>
			</tr>
			<tr>
				<td>20. 商品数量:</td>
				<td> ${requestOrder.productNum }</td>
			</tr>
			<tr>
				<td>21. 商品标识:</td>
				<td> ${requestOrder.productId}</td>
			</tr>
			<tr>
				<td>22. 商品描述:</td>
				<td> ${requestOrder.productDesc}</td>
			</tr>
			<tr>
				<td>23. 附加参数1:</td>
				<td> ${requestOrder.ext1 }</td>
			</tr>
			<tr>
				<td>24. 附加参数2:</td>
				<td> ${requestOrder.ext2 }</td>
			</tr>			
			<tr>
				<td>25. 支付方式:</td>
				<td> ${requestOrder.payType}</td>
			</tr>
			<tr>
				<td>26. 发卡行机构号:</td>
				<td> ${requestOrder.issuerId}</td>
			</tr>
			<tr>
				<td>27. 付款人支付卡号:</td>
				<td> <textarea cols="60" rows="1">${requestOrder.pan }</textarea></td>
			</tr>
			<tr>
				<td>28. 贸易类型:</td>
				<td>${requestOrder.tradeNature }</td>
			</tr>
			<tr>
				<td>29. 报文签名后内容:</td>
				<td> ${strSignMsg }</td>
			</tr>
	</table>
	<center>

	<div>&nbsp;</div>
	<div>组成签名信息的源串: <textarea cols="100" rows="4">${strSrcMsg }</textarea></div>
	</center>
	</body>
	</html>
