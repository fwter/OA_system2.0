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
	.dangan_state{margin:2px 0px 0px 10px;}
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
	.dangan_btn{margin:20px 0px 20px 500px; }
	
</style>
<body>
		<div id="dangan_bigdiv">
	<form class="layui-form">
	<table>
	 	<tr>
	 		<th colspan="5">基本信息</th>
	 	</tr>
	    <tr>
	    	<td class="dangan_td1">姓名：</td>
	    	<td class="dangan_td2">
	    		<div class="layui-input-block dangan_div" >
     			 	<input type="text" name="empName" required  lay-verify="required" value="${empvo.empName }" autocomplete="off" class="layui-input dangan_div_input">
  			    </div>
	    	</td>
	    	<td class="dangan_td1">工号：</td>
	    	<td class="dangan_td2">
	    		<span style="margin-left:10px;color:black ">${empvo.empId }</span>
	    		<input type="hidden" value="${empvo.empId }" name = "empId">
	    	</td>
	    	<td class="dangan_td3 dangan_div_img" rowspan="6" >
	    		<div class=" layui-upload" id="upl">
	    			<c:if test="${empty empvo.empPhoto }">
	    				<img src="../resources/person.png" width="247px" height="249px" id="img">
	    			</c:if>
	    			<c:if test="${not empty empvo.empPhoto }">
	    				<img src="../resources/${empvo.empPhoto}" width="247px" height="249px" id="img">
	    			</c:if>
	    			
	    		</div>
	    		
	    	</td>
	    </tr>
		<tr>
	    	<td class="dangan_td1">部门：</td>
	    	<td class="dangan_td2">
	    		 <span style="margin-left:10px; color:black">${empvo.oaDept.deptName}</span>
	    	</td>
	    	<td class="dangan_td1">职位:</td>
	    	<td class="dangan_td2">
	    		<span style="margin-left:10px;color:black">${empvo.oaJob.jobName}</span>
	    	</td>
	    </tr>
		<tr>
	    	<td class="dangan_td1">性别:</td>
	    	<td class="dangan_td2">
	    		<div class="layui-input-block dangan_sexd`iv">
	    			<input type="radio" name="empSex" value="1" title="男" ${empvo.empSex==1?"checked":""}>
					<input type="radio" name="empSex" value="0" title="女" ${empvo.empSex==1?"":"checked"}>
	    		</div>
	    	</td>
	    	<td class="dangan_td1">生日:</td>
	    	<td class="dangan_td2">
	    		<div class="layui-input-block dangan_div">
	    			 <input type="text" class="layui-input dangan_div_input" id="birth" name="empBirth" value="${empvo.empBirth }">
	    		</div>
	    	</td>
	    	
	    </tr>
		<tr>
	    	<td class="dangan_td1">手机:</td>
	    	<td class="dangan_td2">
	    		<div class="layui-input-block dangan_div" >
     			 	<input type="text" name="empPhone" autocomplete="off" lay-verify="phone" class="layui-input dangan_div_input" value="${empvo.empPhone }">
  			    </div>
	    	</td>
	    	<td class="dangan_td1">电话:</td>
	    	<td class="dangan_td2">
	    		<div class="layui-input-block dangan_div" >
     			 	<input type="text" name="empTel" autocomplete="off" lay-verify="number" class="layui-input dangan_div_input" value="${empvo.empTel }">
  			    </div>
	    	</td>
	   
	    </tr>
		<tr>
	    	<td class="dangan_td1">邮箱:</td>
	    	<td class="dangan_td2">
	    		<div class="layui-input-block dangan_div" >
     			 	<input type="text" name="empEmail" autocomplete="off" lay-verify="email" class="layui-input dangan_div_long_input" value="${empvo.empEmail }">
  			    </div>
	    	</td>
	    	<td class="dangan_td1">QQ:</td>
	    	<td class="dangan_td2">
	    		<div class="layui-input-block dangan_div" >
     			 	<input type="text" name="empQq" autocomplete="off" lay-verify="number" class="layui-input dangan_div_input" value="${empvo.empQq }">
  			    </div>
	    	</td>
	    	
	    </tr>
		<tr>
	    	<td class="dangan_td1">地址:</td>
	    	<td class="dangan_td2">
	    		<div class="layui-input-block dangan_div" >
     			 	<input type="text" name="empAddress" autocomplete="off" class="layui-input dangan_div_long_input" value="${empvo.empAddress }">
  			    </div>
	    	</td>
	    	<td class="dangan_td1">直接上级:</td>
	    	<td class="dangan_td2">
	    		<div class="layui-input-block dangan_deptdiv">
	    			<select name="empMgr" id="dangan_dept">
			        <option value=""></option>
			        <c:forEach var = "x" items = "${emp }">
			        	<c:if test="${x.empId != empvo.empId }">
			        		<option value = "${x.empId}">${x.empName}</option>
			        	</c:if>
			        </c:forEach>
			      </select>
	    		</div>
	    	</td>
	    	
	    </tr>
	    <tr>
	    	<td class="dangan_td1">菜单角色:</td>
	    	<td class="dangan_td2">
	    		<div class="layui-input-block dangan_deptdiv">
	    			
	    		</div>
	    	</td>
	    	<td class="dangan_td1" colspan="3" style="background: white">
	    	</td>
	    	
	    </tr>
		<tr>
	    	<td class="dangan_div_th" colspan="5">档案信息</td>
	    	
	    </tr>
		<tr>
	    	<td class="dangan_td1">档案编号:</td>
	    	<td class="dangan_td2">
	    		<div class="layui-input-block dangan_div" >
     			 	<input type="text" name="empFileid" autocomplete="off" class="layui-input dangan_div_input" value="${empvo.empFileid }">
  			    </div>
	    	</td>
	    	<td class="dangan_td1">在职状态:</td>
	    	<td class="dangan_td2">
	    		<div class="layui-input-block dangan_state" style="min-height:3px">
			      <span style="color:black ">${empvo.empWorkstate == 1?"在职":"离职"}</span>
			    </div>
	    	</td>
	    	<td class="dangan_td3"></td>
	    </tr>
		<tr>
	    	<td class="dangan_td1">员工类型:</td>
	    	<td class="dangan_td2">
	    		<div class="layui-input-block dangan_state" style="min-height:3px">
			      <span style="color:black ">${empvo.empType == 0?"临时工":(empvo.empType == 1?"合同工":"正式工")}</span>
			    </div>
	    	</td>
	    	<td class="dangan_td1">身份证号码:</td>
	    	<td class="dangan_td2">
	    		<div class="layui-input-block dangan_div" >
     			 	<input type="text" name="empCardid" autocomplete="off" lay-verify="cardid" class="layui-input dangan_div_long_input" value="${empvo.empCardid }">
  			    </div>
	    	</td>
	    	<td class="dangan_td3"></td>
	    </tr>
		<tr>
	    	<td class="dangan_td1">籍贯:</td>
	    	<td class="dangan_td2">
	    		<div class="layui-input-block dangan_div" >
     			 	<input type="text" name="empNative" autocomplete="off" class="layui-input dangan_div_input" value="${empvo.empNative }">
  			    </div>
	    	</td>
	    	<td class="dangan_td1">民族:</td>
	    	<td class="dangan_td2">
	    		
	    		<div class="layui-input-block dangan_div" >
     			 	<input type="text" name="empNation" autocomplete="off" class="layui-input dangan_div_input"  value="${empvo.empNation }">
  			    </div>
	    	
	    	</td>
	    	<td class="dangan_td3"></td>
	    </tr>
	    <tr>
	    	<td class="dangan_td1">曾用名:</td>
	    	<td class="dangan_td2">
	    		<div class="layui-input-block dangan_div" >
     			 	<input type="text" name="empOldname" autocomplete="off" class="layui-input dangan_div_input" value="${empvo.empOldname }">
  			    </div>
	    	</td>
	    	<td class="dangan_td1">国籍:</td>
	    	<td class="dangan_td2">
	    		<div class="layui-input-block dangan_div" >
     			 	<input type="text" name="empNationality" autocomplete="off" class="layui-input dangan_div_input" value="${empvo.empNationality }">
  			    </div>
	    	</td>
	    	<td class="dangan_td3"></td>
	    </tr>
	    <tr>
	    	<td class="dangan_td1">入职日期:</td>
	    	<td class="dangan_td2">
	    		<div class="layui-input-block dangan_div">
	    			 <input type="text" class="layui-input dangan_div_input" id="entrydate" name="empEntrydate" value="${empvo.empEntrydate }">
	    		</div>
	    	</td>
	    	<td class="dangan_td1">离职日期:</td>
	    	<td class="dangan_td2">
	    		<div class="layui-input-block dangan_div">
	    			 <input type="text" class="layui-input dangan_div_input" id="dismission" name="empDismission" value="${empvo.empDismission }">
	    		</div>
	    	</td>
	    	<td class="dangan_td3"></td>
	    </tr>
	    <tr>
	    	<td class="dangan_td1">岗位:</td>
	    	<td class="dangan_td2">
	    		<div class="layui-input-block dangan_div" >
     			 	<input type="text" name="empStation" autocomplete="off" class="layui-input dangan_div_input" value="${empvo.empStation }">
  			    </div>
	    	</td>
	    	<td class="dangan_td1">最高学位:</td>
	    	<td class="dangan_td2">
	    		<div class="layui-input-block dangan_deptdiv">
			      <select name="empMaxdegree" id="dangan_dept">
			        <option value=""></option>
			        <option value="博士">博士</option>
			        <option value="硕士">硕士</option>
			        <option value="研究生">研究生</option>
			        <option value="本科生">本科生</option>
			        <option value="专科生">专科生</option>
			      </select>
			    </div>
	    	</td>
	    	<td class="dangan_td3"></td>
	    </tr>
	    <tr>
	    	<td class="dangan_td1">最高学历:</td>
	    	<td class="dangan_td2">
	    		<div class="layui-input-block dangan_deptdiv">
			      <select name="empMaxeducation" id="dangan_dept" value="${empvo.empMaxeducation }">
			        <option value=""></option>
			        <option value="博士">博士</option>
			        <option value="硕士">硕士</option>
			        <option value="研究生">研究生</option>
			        <option value="本科生">本科生</option>
			        <option value="专科生">专科生</option>
			      </select>
			    </div>
	    	</td>
	    	<td class="dangan_td1">毕业学校:</td>
	    	<td class="dangan_td2">
	    		<div class="layui-input-block dangan_div" >
     			 	<input type="text" name="empSchool" autocomplete="off" class="layui-input dangan_div_input" value="${empvo.empSchool }">
  			    </div>
	    	</td>
	    	<td class="dangan_td3"></td>
	    </tr>
	    <tr>
	    	<td class="dangan_td1">所学专业:</td>
	    	<td class="dangan_td2">
	    		<div class="layui-input-block dangan_div" >
     			 	<input type="text" name="empMajor" autocomplete="off" class="layui-input dangan_div_input" value="${empvo.empMajor }">
  			    </div>
	    	</td>
	    	<td class="dangan_td1">毕业日期:</td>
	    	<td class="dangan_td2">
	    		<div class="layui-input-block dangan_div">
	    			 <input type="text" class="layui-input dangan_div_input" id="graduation" name="empGraduation" value="${empvo.empGraduation }">
	    		</div>
	    	</td>
	    	<td class="dangan_td3"></td>
	    </tr>
	    <tr>
	    	<td class="dangan_td1">业余爱好:</td>
	    	<td class="dangan_td2">
	    		<div class="layui-input-block dangan_div" >
     			 	<input type="text" name="empLike" autocomplete="off" class="layui-input dangan_div_input" value="${empvo.empLike }">
  			    </div>
	    	</td>
	    	<td class="dangan_td1">健康状况:</td>
	    	<td class="dangan_td2">
	    		<div class="layui-input-block dangan_div" >
     			 	<input type="text" name="empHealthy" autocomplete="off" class="layui-input dangan_div_input" value="${empvo.empHealthy }">
  			    </div>
	    	</td>
	    	<td class="dangan_td3"></td>
	    </tr>
	    <tr>
	    	<td class="dangan_td1">身高:</td>
	    	<td class="dangan_td2">
	    		<div class="layui-input-block dangan_div" >
     			 	<input type="text" name="empHigh" autocomplete="off" class="layui-input dangan_div_input" value="${empvo.empHigh }">
  			    </div>
	    	</td>
	    	<td class="dangan_td1">体重:</td>
	    	<td class="dangan_td2">
	    		<div class="layui-input-block dangan_div" >
     			 	<input type="text" name="empWeight" autocomplete="off" class="layui-input dangan_div_input" value="${empvo.empWeight }">
  			    </div>
	    	</td>
	    	<td class="dangan_td3"></td>
	    </tr>
	    <tr>
	    	<td class="dangan_td1">银行:</td>
	    	<td class="dangan_td2">
	    		<div class="layui-input-block dangan_div" >
     			 	<input type="text" name="empBank" autocomplete="off" class="layui-input dangan_div_input" value="${empvo.empBank }">
  			    </div>
	    	</td>
	    	<td class="dangan_td1">银行帐号:</td>
	    	<td class="dangan_td2">
	    		<div class="layui-input-block dangan_div" >
     			 	<input type="text" name="empBankid" autocomplete="off" class="layui-input dangan_div_long_input" value="${empvo.empBankid }">
  			    </div>
	    	</td>
	    	<td class="dangan_td3"></td>
	    </tr>
	    <tr>
	    	<td class="dangan_td1">紧急联系人:</td>
	    	<td class="dangan_td2">
	    		<div class="layui-input-block dangan_div" >
     			 	<input type="text" name="empEme" autocomplete="off" class="layui-input dangan_div_input" value="${empvo.empEme }">
  			    </div>
	    	</td>
	    	<td class="dangan_td1">紧急联系人号码:</td>
	    	<td class="dangan_td2">
	    		<div class="layui-input-block dangan_div" >
     			 	<input type="text" name="empEmetel" autocomplete="off" class="layui-input dangan_div_input" value="${empvo.empEmetel }">
  			    </div>
	    	</td>
	    	<td class="dangan_td3"></td>
	    </tr>
	    <tr>
	    	<td class="dangan_td1">员工备注:</td>
	    	<td class="dangan_td2" colspan="4">
	    		 <div class="layui-input-block dangan_div_textarea">
      				<textarea name="empRemark" placeholder="请输入内容" class="layui-textarea" value="${empvo.empRemark }"></textarea>
   				 </div>
	    	</td>
	    </tr>
	    
	</table>
	<div class="layui-input-block dangan_btn">
      		<button class="layui-btn" lay-submit lay-filter="formDemo" id = "submit">保存</button>
     	 	<button type="reset" class="layui-btn layui-btn-primary">重置</button>
    	</div>
	</form>

</div>	
<script>
//Demo
layui.use(['form','upload','laydate'], function(){
  var form = layui.form;
  var upload = layui.upload;
  var $ = layui.$;
  var laydate = layui.laydate;

  laydate.render({
  	elem:'#birth'
  });

  laydate.render({
  	elem:'#entrydate'
  });

  laydate.render({
  	elem:'#entrydate'
  });

  laydate.render({
  	elem:'#dismission'
  });

  laydate.render({
  	elem:'#graduation'
  });

  

  upload.render({
  	elem:'#upl',
  	url:'/saveImg',
  	accept:'images',
  	data:{id:$("[name=empId]").val()},
  	drag:true,
  	before:function(obj){
  		$(".layui-upload-choose").text();
  		obj.preview(function(index, file, result){
      	
      	$("#img").attr('src',result); //得到文件base64编码，比如图片
      //这里还可以做一些 append 文件列表 DOM 的操作
      
      //obj.upload(index, file); //对上传失败的单个文件重新上传，一般在某个事件中使用
      //delete files[index]; //删除列表中对应的文件，一般在某个事件中使用
    });
  	},
  	error:function(index,upload){
  		layer.closeAll();
  	}
  });
  
 
  $("[name=empMaxdegree]").val("${empvo.empMaxdegree }");
  $("[name=empMaxeducation]").val("${empvo.empMaxeducation }");
  $("[name=empMgr]").val("${empvo.empMgr }");
  form.render();
  
  form.verify({
	  cardid: function(value, item){
		  if( !new RegExp("^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$)|(^[1-9]\d{5}\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{2}$").test(value)){
			 return "身份证号码格式不合法"; 
		  }
	  }
  });
  
   form.on('submit(formDemo)',function(data){
	 $.post('/saveEmp',data.field,function(da){
		  if(da.success){
			  layer.msg('编辑成功',function(){
				  location="/toEmp";
			  });
		  }else{
			  layer.alert(da.msg);
		  }
	  }); 
	  return false;
  }) 
});
</script>	
</body>
</html>