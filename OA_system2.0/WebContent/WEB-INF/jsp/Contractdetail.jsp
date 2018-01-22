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
<style type="text/css">
	
	#dangan_bigdiv{}
	table{color:#009688;}
	td{border:1px solid #e6e6e6;height:30px;}
	.dangan_div_input{height:25px;margin-top:5px;width:140px;}
	.dangan_div_long_input{width: 220px;}
	.dangan_div{margin-left:10px;}
	.dangan_td1{width:200px;text-align: right;background:#F2F2F2}
	.dangan_td2{width:280px;}
	.dangan_td3{width:250px;}
	.dangan_deptdiv{width:140px;margin:5px 0px 0px 8px;}
	.dangan_sexdiv{margin-left: 8px; }
	.dangan_div_select{width: 100px;height: 25px;}
	.layui-input, .layui-select, .layui-textarea {
    height: 30px;
    line-height: 1.3;	
    line-height: 38px\9;
    border-width: 1px;
    border-style: solid;
    background-color: #fff;
    border-radius: 2px;
}

	.dangan_div_th{font-size: 14px;font-weight: bold;text-align: center;border-right: 0px;}
	.dangan_div_textarea{margin-left: 8px;}
	.dangan_btn{margin:20px 0px 20px 300px; }
	
</style>
<div id="dangan_bigdiv">
	<form class="layui-form">
	<table>	 	
	    <tr>
	    	<td class="dangan_td1">姓名:</td>
	    	<td class="dangan_td2">
	    		<span style="margin-left:10px; color:black">${contract.oaEmp.empName}</span>
	    	</td>
	    	<td class="dangan_td1">合同编号:</td>
	    	<td class="dangan_td2">
	    		<span style="margin-left:10px; color:black">${contract.conId}</span>
	    		<input type = "hidden" value = "${contract.conId}" name = "id">
	    	</td>
	    	
	    </tr>
	    <tr>
	    	<td class="dangan_td1">合同类型:</td>
	    	<td class="dangan_td2">
	    		<span style="margin-left:10px; color:black">${contract.conType == 0?"有固定期限":"无固定期限" }</span>
	    	</td>
	    	<td class="dangan_td1">是否期限固定:</td>
	    	<td class="dangan_td2">
	    		<span style="margin-left:10px; color:black">${contract.conTerm == 1?"有":"无" }</span>
	    	</td>
	    	
	    </tr>
	    <tr>
	    	<td class="dangan_td1">签约日期:</td>
	    	<td class="dangan_td2">
	    		<span style="margin-left:10px; color:black">${contract.conSigndate }</span>
	    	</td>
	    	<td class="dangan_td1">签约次数:</td>
	    	<td class="dangan_td2">
	    		<span style="margin-left:10px; color:black">${contract.conSigntime }</span>
	    	</td>
	    	
	    </tr>
	    <tr>
	    	<td class="dangan_td1">开始日期:</td>
	    	<td class="dangan_td2">
	    		<span style="margin-left:10px; color:black" id = "begindate">${contract.conBegindate }</span>
	    	</td>
	    	<td class="dangan_td1">结束日期:</td>
	    	<td class="dangan_td2">
	    	<c:if test="${type == 1 || type == 3}">
	    			<span style="margin-left:10px; color:black" >${contract.conEnddate }</span>
	    	</c:if>
	    	<c:if test="${type == 2 }">
	    		<div class="layui-input-block dangan_div" >
     			 	<input type="text" name="conEnddate" id="conEnddate" value="${contract.conEnddate }" lay-verify="enddate" autocomplete="off" class="layui-input dangan_div_input">
     			 	<input type = "hidden" value = "${contract.conEnddate}" id = "end">
  			    </div>
	    	</c:if>
	    	</td>
	    	
	    </tr>
	    <tr>
	    	<td class="dangan_td1">试用结束日期:</td>
	    	<td class="dangan_td2">
	    		<span style="margin-left:10px; color:black">${contract.conTryend }</span>
	    	</td>
	    	<td class="dangan_td1">终止日期:</td>
	    	<td class="dangan_td2">
	    		<span style="margin-left:10px; color:black">${contract.conStopdate }</span>
	    	</td>
	    	
	    </tr>
	    <tr>
	    	<td class="dangan_td1">附件:</td>
	    	<td class="dangan_td2" colspan="3">
	    		<span style="margin-left:10px; color:black">${contract.conEnc}</span>
	    	</td>
	    	    	
	    </tr>
	    <tr>
	    	<td class="dangan_td1">员工备注:</td>
	    	<td class="dangan_td2" colspan="3">
	    		 <span style="margin-left:10px; color:black">${contract.conRemark }</span>
	    	</td>
	    </tr>
	    
	</table>
	<c:if test="${type != 1 }">
		<div class="layui-input-block dangan_btn">
      		<button class="layui-btn" lay-submit lay-filter="formDemo">保存</button>
     	 	<button class="layui-btn layui-btn-primary">取消</button>
    	</div>
	</c:if>
	</form>
	<script type="text/javascript">
		layui.use(['form','upload','laydate','layer'], function(){
		  var form = layui.form;
		  var upload = layui.upload;
		  var $ = layui.$;
		  var laydate = layui.laydate;
		  var layer = layui.layer;

		  
		  
		  laydate.render({
		  	elem:'#conEnddate'
		  });
		  
		  
		  /*提交事件*/
		  form.on('submit(formDemo)',function(data){
			   $.post('saveConform',data.field,function(da){
				  if(da.success){
					  parent.layer.closeAll('iframe');
				  }
			  }); 
			  return false;
		  });
		  
		  /*验证*/
		  form.verify({
			  enddate: function(value, item){ //value：表单的值、item：表单的DOM对象
			  		if($("#end").val() > value){
			  			return "结束日期小于原始日期";
			  		}
			  		if(new Date() > value){
			  			return "结束日期小于当前日期";
			  		}
				}
		  	}
		  );      
		});
	</script>
</body>

</html>