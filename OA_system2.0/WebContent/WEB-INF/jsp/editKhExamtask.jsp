<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑考核任务</title>
<link rel="stylesheet" href="../plugs/layui/css/layui.css">
<script type="text/javascript" src="../plugs/layui/layui.all.js"></script>
<script src="../plugs/layui/layui.js"></script>

<script type="text/javascript">
	layui.use(['form', 'table' ], function() {
		var laydate = layui.laydate, form = layui.form;
	});
</script>
</head>
<body>
	<form class="layui-form" action="#">
		<table class="layui-table"
			lay-data="{ url:'',  id:'editKhExamtaskTab'}"
			lay-filter="editKhExamtaskTab">
			<thead>
				<tr>
					<td>考核信息</td>
				</tr>
			</thead>
			</table>
	</form>
</body>
</html>