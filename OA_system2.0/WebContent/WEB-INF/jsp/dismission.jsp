<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="../plugs/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="../plugs/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="../plugs/easyui/demo/demo.css">
<link rel="stylesheet" type="text/css"
	href="../plugs/layui/css/layui.css">
<link rel="stylesheet" type="text/css"
	href="//at.alicdn.com/t/font_526922_2mm2tte3pgj2x1or.css" />
<script type="text/javascript" src="../plugs/easyui/jquery.min.js"></script>
<script type="text/javascript"
	src="../plugs/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../plugs/layui/layui.all.js"></script>
</head>
<body class="childrenBody">
	<form class="layui-form">
		<div class="layui-form-item">
			<div class="layui-inline">
				<label class="layui-form-label">部门：</label>
				<div class="layui-input-inline">
					<select name="dept">
						<option value=""></option>
						<c:forEach var="x" items="${dept }">
							<option value="${x.deptId }">${x.deptName}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">姓名:</label>
				<div class="layui-input-inline">
					<input type="text" name="name" autocomplete="off"
						class="layui-input">
				</div>
			</div>
			<div class="layui-inline">
				<label class="layui-form-label">职位:</label>
				<div class="layui-input-inline">
					<select name="job">
						<option value=""></option>
						<c:forEach var="x" items="${job }">
							<option value="${x.jobId }">${x.jobName}</option>
						</c:forEach>
					</select>
				</div>
			</div>

			<div class="layui-inline">
				<label class="layui-form-label">离职日期:</label>
				<div class="layui-input-inline" style="width: 100px;">
					<input type="text" name="begindate" id="begindate"
						autocomplete="off" class="layui-input">
				</div>
				<div class="layui-form-mid">~</div>
				<div class="layui-input-inline" style="width: 100px;">
					<input type="text" name="enddate" id="enddate" lay-verify="entryd" autocomplete="off"
						class="layui-input">
				</div>
			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="formDemo">查询</button>
				<button class="layui-btn" lay-filter="formDemo2">增加</button>
			</div>
		</div>
	</form>

	<table id="table_emp" lay-filter="emp"></table>
	<script type="text/html" id="bar">
			<a class="layui-btn layui-btn-xs" lay-event="edit">查看</a>
		</script>

	<script>
		layui.use([ 'table', 'form', 'jquery', 'laydate' ], function() {
			var table = layui.table;
			var $ = layui.$;
			var layer = layui.layer;
			var form = layui.form;
			var laydate = layui.laydate;

			laydate.render({
				elem : '#begindate' //指定元素
			});

			laydate.render({
				elem : '#enddate' //指定元素
			});

			// 初始化表头结构
var tableIns = table.render({
				elem : '#table_emp',
				url : '/queryDis',
				cols : [ [ {
					field : 'deptName',
					title : '部门',
				}, {
					field : 'empName',
					title : '姓名',
				}, {
					field : 'jobName',
					title : '职位',
				}, {
					field : 'disApplaydate',
					title : '申请日期',
				}, {
					field : 'disInworkdate',
					title : '入职日期',
				}, {
					field : 'disDate',
					title : '离职日期',
				}, {
					field : 'disType',
					title : "离职类型",
				}, {
					field : 'disReason',
					title : "离职原因",
				}, {
					fixed : 'right',
					title : "操作",
					align : 'center',
					toolbar : '#bar'
				}

				] ],
				id : 'testReload',
				page : true,
				height : "full"
			});

			form.on('submit(formDemo)', function(data) {
				var a = data.field;
				tableIns.reload({
					where:{
						dept:a.dept,
						name:a.name,
						job:a.job,
						begindate:a.begindate,
						enddate:a.enddate
					}
				});
				return false;
			});
			
			form.verify({
				entryd:function(value,item){
					if($("#begindate").val() != null && value < $("#begindate").val()){
						return "结束日期小于开始日期";
					}
				}
			});

			form.render();

		});
	</script>
</body>
</html>