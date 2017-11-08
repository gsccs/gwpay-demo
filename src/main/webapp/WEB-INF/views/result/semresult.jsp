<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>联系方式添加</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/static/easyui/themes/icon.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/easyui/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/easyui/jquery.easyui.min.js"></script>
</head>

<style type="text/css">

th{
	font-size: 12px;
  	padding: 5px 10px;
}

.datagrid-header td{
	text-align: center;
}
input {
	width: 200px;
}

.thclass {
	height: 50px;
}
</style>

<body>
	<form id="way_form" action="" method="post">
		<input type="hidden" name="id" value="${conway.id }">
		<input type="hidden" name="cid" value="${cid }">
		<table class="tableForm" style="margin-top: 10px;">
			 <tr class="thclass" style="height: 40px">
				<th style="width: 130px;text-align: right;">运营商：<font style="color: red">*</font></th>
				<td>
					<select name="ispcode" style="width:165px;">
							<c:forEach var="bean" items="${ispList}" varStatus="status">
								<option value="${bean.id }" >${bean.title }</option>
							</c:forEach>
					</select>
				</td>
			</tr> 
			
			<tr class="thclass" style="height: 40px">
				<th style="width: 130px;text-align: right;">联系电话：<font style="color: red">*</font></th>
				<td><input type="text" name="phone" class="easyui-numberbox"  missingMessage="进度只能为数值"
					  size="28"
					value="${conway.phone}" /></td>
			</tr>
			
		</table>
	</form>
<script type="text/javascript">

	formatterDate = function(date) {
	var day = date.getDate() > 9 ? date.getDate() : "0" + date.getDate();
	var month = (date.getMonth() + 1) > 9 ? (date.getMonth() + 1) : "0"
	+ (date.getMonth() + 1);
	return date.getFullYear() + '-' + month + '-' + day;
	};

window.onload = function () { 
	$('#addtime').datebox('setValue', formatterDate(new Date()));
	/* $('#signdate').datebox('setValue', formatterDate(new Date()));
	$('#planstartdate').datebox('setValue', formatterDate(new Date()));
	$('#planenddate').datebox('setValue', formatterDate(new Date())); */
}


</script>
</body>

</html>
