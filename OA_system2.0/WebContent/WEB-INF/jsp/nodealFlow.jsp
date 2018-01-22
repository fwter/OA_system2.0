<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>待办流程</title>
		<link rel="stylesheet" type="text/css" href="../plugs/easyui/themes/default/easyui.css">
		<link rel="stylesheet" type="text/css" href="../plugs/easyui/themes/icon.css">
		<link rel="stylesheet" type="text/css" href="../plugs/easyui/demo/demo.css">
		<link rel="stylesheet" type="text/css" href="../plugs/layui/css/layui.css">
		<link rel="stylesheet" type="text/css" href="//at.alicdn.com/t/font_526922_2mm2tte3pgj2x1or.css" />
		<script type="text/javascript" src="../plugs/easyui/jquery.min.js"></script>
		<script type="text/javascript" src="../plugs/easyui/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="../plugs/layui/layui.all.js"></script>
		<style>
			.childrenBody {
				margin: 10px 10px 0;
			}
			
			.news_search {
				padding: 10px 10px;
			}
			
			.grid-demo-bg1 {
				padding: 10px;
				line-height: 50px;
				text-align: center;
			}
			
			.grid-demo {
				padding: 10px;
				line-height: 50px;
				text-align: center;
			}
		</style>
		
	
	</head>

	<body class="childrenBody">
	<form class="layui-form">
		<div class="layui-form-item">
		    
		    <div class="layui-inline">
		      <label class="layui-form-label">申请人姓名:</label>
		      <div class="layui-input-inline">
		        <input type="text" name="name"  autocomplete="off" class="layui-input">
		      </div>
		    </div>
		   
		   <div class="layui-inline">
		      <label class="layui-form-label">流程标题:</label>
		      <div class="layui-input-inline">
		        <input type="text" name="flowtitle"  autocomplete="off" class="layui-input">
		      </div>
		    </div>
		   
		  
			  <div class="layui-inline">
     			 <button class="layui-btn" lay-submit lay-filter="formDemo">查询</button>
      		</div>
		  </div>

		 </form>
		<div class="layui-row">
			<div class="layui-col-xs2">
				
			</div>
			<table class="layui-hide layui-col-xs10" id="table_noflow" lay-filter="menu"></table>
		</div>
		<script type="text/html" id="bar">
			<a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
			<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
			<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
		</script>
		
		<script>
		//定义变量
			var table = layui.table;
			var $ = layui.$;
			var layer = layui.layer;
			var form=layui.form;
			//初始化表头结构
			table.render({
				elem: '#table_noflow',
				url: 'queryFlow',
				cols: [
					[{
						field: 'flowId',
						title: '序号',
						width: 80,
						sort: true
					}, {
						field: 'empName',
						title: '申请人姓名',
						width: 100
					}, {
						field: 'flowName',
						title: '申请类型',
						width: 120
					}, {
						field: 'flowTitle',
						title: '流程标题',
						width: 200
					}, {
						field: 'flowDate',
						title: '发起时间',
						width: 120,
					}, {
						field: 'flowState',
						title: '流程状态',
						width: 100,
					},{
						field: 'flowStep',
						title: '当前步骤',
						width: 120,
					}, {
						title: "操作",
						fixed: 'right',
						width: 178,
						align: 'center',
						toolbar: '#bar'
					}]
				],
				id: 'testReload',
				page: true,
				height: "full"
			});
			
			form.on('submit(formDemo)',function(data){
  				var a = data.field;
  				tableIns.reload({
  					page:{curr:1},
  					 where:{
  						name:a.name,
  						flowtitle:a.flowtitle
  					} 
  					
  				});
  				alert(a.name,a.flowtitle);
  				return false;
  			});
			form.render();
			
			
			//表格内的工具条的点击事件
			table.on('tool(menu)',function(obj){
				var data=obj.data;
				var event=obj.event;
				switch(event){
					case 'edit':
					edit(data);
					break;
					case 'del':
					del(obj);
					break;
				}
				
				//编辑点击事件
				function edit(data){
					layer.open({
					type: 2,
					content: "/form",
					area: ['450px', '90%'],
					btn:['确定', '取消'],
					before:function(){
					},
					success:function(layero,index){
						alert("success");
						var body = layer.getChildFrame('body', index);
						console.info(data);
						var menuId=body.find('input[name=menuId]');
						menuId.val(data.menuId);
						var menuName=body.find('input[name=meuName]');
						menuName.val(data.meuName);
						var menuLink=body.find('input[name=menuLink]');
						menuLink.val(data.menuLink);
						var ifrme=body.context.getElementsByTagName('iframe');
						var doc=ifrme[0].contentDocument;
						var dds=doc.getElementsByTagName('dd');
						for(var i=0;i<dds.length;i++){
							if(dds[i].getAttribute('lay-value')==data.menuFather){
								dds[i].click();return;
							}
						}
						var munuCkeckBox=body.find('div.layui-form-checkbox');
						if(data.menuIsvisable=='yes'){
							munuCkeckBox.click();
						}
						var img=body.find('#uploadImg');
						if(data.menuImg!=undefined){
							img.append('<img src="../resources/'+data.menuImg+'" style="height:30px;weight:30px">');
						}
					},
					yes: function(index) {
						alert("yes");
						var form = layer.getChildFrame('#addForm', index);
						var submit = form.find('#submit');
						submit.click();
					}
				});

				}
				
				//删除点击事件
				function del(obj){
					var index=layer.load();
					$.post('/delMenu',obj.data,function(){
						layer.close(index);
						obj.del();
					})
				}
				//重新渲染表单
				form.render();
			});
			
		</script>
	
	</body>

</html>