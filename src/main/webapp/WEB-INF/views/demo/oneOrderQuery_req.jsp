<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta http-equiv="Content-Language" content="zh-CN"/>
		<meta http-equiv="Expires" CONTENT="0">        
		<meta http-equiv="Cache-Control" CONTENT="no-cache">        
		<meta http-equiv="Pragma" CONTENT="no-cache">
		<title>通联网上支付平台-商户接口范例-单笔订单查询请求</title>
		<link href="css.css" rel="stylesheet" type="text/css">
	</head>
			
	<body>
		<form name="form2" action="${pageContext.request.contextPath}/query/one/" method="post" onsubmit="checkSubmit()">
			<input type="hidden" name="serverUrl" id="serverUrl"></input>
			
			<tr><td>
				<table class="table_box" width="100%">
					<tr>
						<td colspan="3" align="right"><input type="submit" name="订单查询" value="就这样，我要查询"></input></td>
					<td></td>
					</tr>
					<tr></tr>
					<tr></tr>
					<tr>
						<td colspan="3" class="tit_bar">非form表单提交信息</td>
					</tr>	
				    <tr>
						<td wide=15%>指定服务器IP地址</td>
						<td>
							<select id="serverip" onchange="javascript:this.form.myServerIp.value=this.value;">
							<option value="ceshi.allinpay.com">测试环境ceshi.allinpay.com</option>
							<option value="service.allinpay.com">生产环境service.allinpay.com</option>
							</select>
							<input type="text" name="myServerIp" id="myServerIp" value="ceshi.allinpay.com"/>
						</td>
						<td class="comment">
							(提交地址："http://"+ip+"/gateway/index.do?")
						</td>
					</tr>				
					<tr>
				     	<td>MD5 key:</td>
				    	<td>&nbsp&nbsp<input type="text" name="key" id="key" value="1234567890"/></td>
				    	<td class="comment">计算摘要的KEY值，在商户管理平台维护，初始值为“1234567890”</td>
				    </tr>	
				</table>
			  <hr/>
							
			<table class="table_box" width="90%">
				<tr>
					<td colspan="4" class="tit_bar">查询表单参数</td>
				</tr>
				<tr>
				    <td>1</td>
					<td>商户号:</td>
					<td><input type="text" name="merchantId" id="merchantId" value="100020091218001"/>
					</td>
					<td class="comment">&nbsp</td>
				</tr>
				<tr>
				    <td>2</td>
					<td>版本号:</td>
					<td><input type="text" name="version" id="version" value="v1.5"/></td>
					<td class="comment">固定值：v1.5，区分大小写</td>
				</tr>
				<tr>
				    <td>3</td>
					<td>签名类型:</td>
					<td><input type="text" name="signType" id="version" value="0"/></td>
					<td class="comment">0代表MD5加密签名方式</td>
				</tr>
				<tr>
				    <td>4</td>
					<td>商户订单号:</td>
					<td><input type="text" name="orderNo" id="orderNo" value=""/></td>
					<td class="comment">与提交订单时的商户订单号保持一致</td>
				</tr>
				<tr>
				    <td>5</td>
					<td>商户订单提交时间:</td>
					<td><input type="text" name="orderDatetime" id="orderDatetime" value=""/></td>
					<td class="comment">与提交订单时的商户订单提交时间保持一致</td>
				</tr>
				<tr>
				    <td>5</td>
					<td>查询时间:</td>
					<td><input type="text" name="queryDatetime" id="queryDatetime" value=""/></td>
					<td class="comment">此时间不能与系统当前时间相差15分钟</td>
				</tr>
				<tr>
				    <td>5</td>
					<td>签名字符串:</td>
					<td><input type="text" name="signMsg" id="signMsg" value=""/></td>
					<td class="comment"></td>
				</tr>
				<tr></tr>
				<tr></tr>
                <tr>
                    <td>&nbsp&nbsp&nbsp&nbsp</td>
     				<td></td>
					<td width="400">&nbsp&nbsp</td>
					<td><input type="submit" name="查询" value="就这样，查询此帐单"/></td>
				</tr>
			</table>
			
			</td></tr>

		</form>
	</body>
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
			document.getElementById("queryDatetime").value = strDatetime;
		}
		function checkSubmit() {
			var ip = document.getElementById("myServerIp").value;
			 if (null==ip || ''==ip) {
				alert('服务器IP不能为空！');
				return false;
			}	
			document.getElementById("serverUrl").value = "http://"+ip+"/gateway/index.do?";	
	  }
	</script>
</html>