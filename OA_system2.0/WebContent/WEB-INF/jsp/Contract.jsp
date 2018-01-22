
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../plugs/easyui/themes/default/easyui.css">
		<link rel="stylesheet" type="text/css" href="../plugs/easyui/themes/icon.css">
		<link rel="stylesheet" type="text/css" href="../plugs/easyui/demo/demo.css">
		<link rel="stylesheet" type="text/css" href="../plugs/layui/css/layui.css">
		<link rel="stylesheet" type="text/css" href="//at.alicdn.com/t/font_526922_2mm2tte3pgj2x1or.css" />
		<script type="text/javascript" src="../plugs/easyui/jquery.min.js"></script>
		<script type="text/javascript" src="../plugs/easyui/jquery.easyui.min.js"></script>
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
		        <c:forEach var = "x" items = "${dept}">
		       		<option value = "${x.deptId }">${x.deptName}</option>
		       </c:forEach>
		      </select>
		      </div>
		    </div>
		    <div class="layui-inline">
		      <label class="layui-form-label">姓名:</label>
		      <div class="layui-input-inline">
		        <input type="text" name="name"  autocomplete="off" class="layui-input">
		      </div>
		    </div>
		    <div class="layui-inline">
		      <label class="layui-form-label">类型:</label>
		      <div class="layui-input-inline">
			       <select name="type">
			        <option value=""></option>
			        <option value="0">有固定期限</option>
			        <option value="1">无固定期限</option>
			       
			      </select>
		      </div>
		    </div>
		    <div class="layui-inline">
		    	<label class="layui-form-label">状态:</label>
		    	 <div class="layui-input-inline">
			       <select name="state">
			        <option value=""></option>
			        <option value="0">解除</option>
			        <option value="1">有效</option>
			        <option value="2">过期</option>
			        
			      </select>
		      </div>
		    </div>
		    <div class="layui-inline">
			    <label class="layui-form-label">合同到期:</label>
			    <div class="layui-input-inline" style="width: 100px;">
			      <input type="text" name="enddate" id="enddate" autocomplete="off" class="layui-input">
			    </div>
			  </div>
		  </div>

		 <div class="layui-form-item">
    		<div class="layui-input-block">
     			 <button class="layui-btn" lay-submit lay-filter="formDemo">查询</button>
      		</div>
 		 </div>

		 </form>

		 <table id="table_emp" lay-filter="emp"></table>
		<script type="text/html" id="bar">
			<a class="layui-btn layui-btn-xs" lay-event="detail">查看</a>
			<a class="layui-btn layui-btn-xs" lay-event="continue">续签</a>
			<a class="layui-btn layui-btn-xs" lay-event="stop">终止</a>
		</script>
		
		<script>
		layui.use(['table','form','jquery','laydate'],function(){
			var table = layui.table;
			var $ = layui.$;
			var layer = layui.layer;
			var form=layui.form;
			var laydate = layui.laydate;

  			laydate.render({
    			elem: '#enddate',  //指定元素
    			type: 'month'
  			});
			
  			// 初始化表头结构
	var ta = table.render({
				elem: '#table_emp',
				url: 'queryCon',
				cols: [
					[{
						field: 'deptName',
						title: '部门',
						
					}, {
						field: 'empName',
						title: '姓名',
						
					}, 
					 {
						field: 'conType',
						title: '合同类型',
						
					}, {
						field: 'conSigndate',
						title: '签订日期',
						
					}, {
						field: 'conEnddate',
						title: '合同到期',
						
					}, {
						field:'conStopdate',
						title: "终止日期",
						
					},{
						field: 'conState',
						title: "合同状态",
						
					},{
						fixed: 'right', 
						title: "操作",
						width:150, 
						align:'center', 
						toolbar: '#bar'
					}

					]
				],
				id: 'testReload',
				page: true,
				limit:3,
				height: "full"
			});

			form.on('submit(formDemo)',function(data){
  				var a = data.field;
  				ta.reload({
  					page:{curr:1},
  					 where:{
  						dept:a.dept,
  						name:a.name,
  						type:a.type,
  						state:a.state,
  						enddate:a.enddate
  					}  
  				});
  				return false;
  			});
			
			table.on('tool(emp)',function(obj){
				var a = obj.data;
				var b;
				if(obj.event == "detail"){
						b = 1;
				}else if(obj.event == "continue"){
					if(a.conEnddate != "无" && a.conState != "解除"){
						b = 2;
					}else{
						layer.msg('该合同无法续签,可能已解除或是无固定期限合同',{icon:5});
						b = 0;
					}
				}else if(obj.event == "stop"){
					b = 0;
					if(a.conState == "有效"){
						layer.confirm('您确定要终止该合同吗?',function(index){
							$.post('/stopCon',{conId:a.conId},function(da){
								if(da.success){
									layer.close(index);
									ta.reload();
								}
							});
						},
						function(index){
							layer.close(index);
						});
					}else{
						layer.msg('只能终止有效的合同',{icon:5});
					}
				}
				
				if(b != 0){
					layer.open({
	  					type: 2, 
	  					content: '/toCondetail?conId='+a.conId+'&type='+b,  //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
	  					area: ['770px', '350px'],
	  					skin:'layui-layer-molv',
	  					title: ['编辑类型', 'font-size:15px;'], 
	  					shade: [0.8, '#393D49'],
	  					anim: 4,
	  					closeBtn: 1,
	  					resize:false,
	  					end:function(){
	  						ta.reload();
	  					}
					});
				}
			});
			
			form.render();	
		});
		</script>
</body>
</html>