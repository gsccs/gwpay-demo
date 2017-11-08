﻿<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" import=" com.allinpay.ets.client.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--
/*
 * @(#)post.html	V1.3.1	2010/08/10
 *
 *  Description:
 *  =========================================================================
 *  商户支付请求范例页面。
 *
 *  Change History:
 *  Author     Date       Description
 *  ========== ========== ===================================================
 *  Allinpay   2010/08/10 V1.3.1 Release
 *
 *  =========================================================================
 *
 */
-->
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta http-equiv="Content-Language" content="zh-CN"/>
<title>网上支付平台-商户接口范例-支付请求</title>
</head>
<body BGCOLOR='#FFFFFF' TEXT='#000000' LINK='#0000FF' VLINK='#0000FF' ALINK='#FF0000'>
<center> <h4>通联支付网关接口参数提交</h4></center>


<form action="${pageContext.request.contextPath}/post" method="post" onsubmit="AttributeJudge()">
<input type="hidden" name="serverUrl" id="serverUrl" value="" />
	<table border="1" cellpadding="1" cellspacing="1" align="center" width="50%">
			<tr>
				<td width="30%">订单提交地址：</td>
				<td width="40%">
					<select id="serverip" onchange="javascript:this.form.myServerIp.value=this.value;this.form.pickupUrl.value=this.form.pickupUrl.value.replace(/:.*?demo/, '://' + this.value + '/demo');this.form.receiveUrl.value=this.form.receiveUrl.value.replace(/:.*?demo/, '://' + this.value + '/demo');">
						<option value="192.168.101.41">开发环境192.168.101.41</option>
						<option value="192.168.101.81">验收测试环境192.168.101.81</option>
						<option value="192.168.103.51">测试组环境192.168.103.51</option>	
						<option value="test51.allinpay.com">测试组环境test51.allinpay.com</option>	
						<option value="192.168.101.111">商户测试环境192.168.101.111</option>
						<option value="ceshi.allinpay.com">商户测试环境ceshi.allinpay.com</option>
						<option value="service.allinpay.com">生产service.allinpay.com</option>
						<option value="192.168.3.60">便捷付测试192.168.3.60</option>
						<option value="cashier.allinpay.com">cashier.allinpay.com</option>
					</select>
					<input type="text" name="myServerIp" id="myServerIp" value="192.168.101.41"/>
				</td>
				<td width="30%"></td>
			</tr>
			<tr>
				<td>1. 字符集:</td>
				<td><input type="text" name="inputCharset" value="1"/></td>
				<td></td>
			</tr>	
			<tr>
				<td>2. 取货地址:</td>
				<td><input type="text" name="pickupUrl" value="http://192.168.103.51/demo/eshop/display-pay-result/display.do"/><font color="red">*</font></td>
				<td></td>
			</tr>
			<tr>
				<td>3. 商户系统通知地址:</td>
				<td><input type="text" name="receiveUrl" value="http://192.168.103.51/demo/eshop/recv-pay-result/recv.do"/><font color="red">*</font></td>
				<td></td>
			</tr>
			<tr>
				<td>4. 版本号:</td>
				<td><input type="text" name="version" value="v1.0"/><font color="red">*</font></td>
				<td></td>
			</tr>
			
			<tr>
				<td>5. 语言:</td>
				<td><input type="text" name="language" value="1"/></td>
				<td>1代表utf-8</td>
			</tr>
			
			<tr>
				<td>6. 签名类型:</td>
				<td><input type="text" name="signType" value="1"/><font color="red">*</font></td>
				<td></td>
			</tr>
			<tr>
				<td>7. 商户号:</td>
				<td><input type="text" name="merchantId" value="100020091218001"/><font color="red">*测试商户号</font></td>
				<td></td>
			</tr>
			<tr>
				<td>8. 付款人姓名:</td>
				<td><input type="text" name="payerName" value="飞龙"/></td>
				<td></td>
			</tr>
			<tr>
				<td>9. 付款人联系email:</td>
				<td><input type="text" name="payerEmail" value="feilong@163.com"/></td>
				<td></td>
			</tr>
			<tr>
				<td>10. 付款人电话:</td>
				<td><input type="text" name="payerTelephone" value="13123456789"/></td>
				<td></td>
			</tr>
			<tr>
				<td>11. 付款人证件号:</td>
				<td><input type="text" name="payerIDCard" value=""/></td>
				<td></td>
			</tr>
			<tr>
				<td>12. 合作伙伴商户号:</td>
				<td><input type="text" name="pid" value=""/></td>
				<td></td>
			</tr>
			<tr>
				<td>13. 商户系统订单号:</td>
				<td><input type="text" name="orderNo"  id="orderNo" value=""/><font color="red">*</font><input type="button" value="生成订单号" onclick="setOrderNo()"/></td>
				<td></td>
			</tr>
			<tr>
				<td>14. 订单金额(单位分):</td>
				<td><input type="text" name="orderAmount" value="200"/><font color="red">*</font></td>
				<td></td>
			</tr>
			<tr>
				<td>15. 订单金额币种类型:</td>
				<td><input type="text" name="orderCurrency" value="0"/></td>
				<td>默认为人民币;0,156表示人民币;344表示港币;840表示美元</td>
			</tr>
			<tr>
				<td>16. 商户的订单提交时间:</td>
				<td><input type="text" name="orderDatetime" id="orderDatetime" value=""/><font color="red">*</font></td>
				<td></td>
			</tr>
			<tr>
				<td>17. 订单过期时间:</td>
				<td><input type="text" name="orderExpireDatetime" value="60"/></td>
				<td></td>
			</tr>	
			<tr>
				<td>18. 商品名称:</td>
				<td><input type="text" name="productName" value="火星人"/></td>
				<td></td>
			</tr>
			<tr>
				<td>19. 商品单价:</td>
				<td><input type="text" name="productPrice" value="9999"/></td>
				<td></td>
			</tr>
			<tr>
				<td>20. 商品数量:</td>
				<td><input type="text" name="productNum" value="1"/></td>
				<td></td>
			</tr>
			<tr>
				<td>21. 商品标识:</td>
				<td><input type="text" name="productId" value="Mars man"/></td>
				<td></td>
			</tr>
			<tr>
				<td>22. 商品描述:</td>
				<td><input type="text" name="productDesc" value="火星人"/></td>
				<td></td>
			</tr>
			<tr>
				<td>23. 扩展字段1:</td>
				<td><input type="text" name="ext1" value="123"/></td>
				<td></td>
			</tr>
			<tr>
				<td>24. 扩展字段2:</td>
				<td><input type="text" name="ext2" value="123"/></td>
				<td></td>
			</tr>
			<tr>
				<td>25. 业务扩展字段:</td>
				<td><input type="text" name="extTL" value=""/></td>
				<td></td>
			</tr>				
			<tr>
				<td>26. 支付方式:</td>
				<td><input type="text" name="payType" value="0"/><font color="red">*</font></td>
				<td></td>
			</tr>
			<tr>
				<td>27. 发卡方代码:</td>
				<td><input type="text" name="issuerId" value="" /><span style="font-size:12px;color:blue;"></span></td>
				<td></td>
			</tr>	
			<tr>
				<td>28. 付款人支付卡号:</td>
				<td><input type="text" name="pan" value=""/></td>
				<td></td>
			</tr>
			<tr>
				<td>29. 贸易类型:</td>
				<td><input type="text" name="tradeNature" value="GOODS"/></td>
				<td>GOODS表示实物类型，SERVICES表示服务类型</td>
			</tr>
			<tr>
				<td>用于计算signMsg的key值:</td>
				<td><input type="text" name="key" id="key" value="1234567890"/><font color="red">*</font></td>
				<td></td>
			</tr>
		</table>
		<div align="center"><input type="submit" value="提交表单，计算signMsg"/></div>
</form>

<script language="javascript">
	setOrderNo();	
	function setOrderNo() {
		var curr = new Date();
		var m = curr.getMonth() + 1;
		if (m < 10) {m = '0' + m;}
		var d = curr.getDate();
		if (d < 10) {d = '0' + d;}
		var h = curr.getHours();
		if (h < 10) {h = '0' + h;}
		var mi = curr.getMinutes();
		if (mi < 10) {mi = '0' + mi;}
		var s = curr.getSeconds();
		if (s < 10) {s = '0' + s;}
		var strDatetime = '' + curr.getFullYear() + m + d + h + mi + s;		
		document.getElementById("orderDatetime").value = strDatetime;
		document.getElementById("orderNo").value = 'NO' + strDatetime;
	}
	
	function AttributeJudge() {
	var ip = document.getElementById("myServerIp").value;
			 if (null==ip || ''==ip) {
				alert('服务器IP不能为空！');
				return false;
			}	
			document.getElementById("serverUrl").value = "http://"+ip+"/gateway/index.do?";
			}
</script>

</BODY>
</HTML>
