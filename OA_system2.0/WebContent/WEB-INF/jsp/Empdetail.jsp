<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
</head>
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
     			 	<span style="margin-left:10px;color:black">${empvo.empName}</span>
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
	    		<span style="margin-left:10px;color:black">${empvo.empSex==1?"男":"女"}</span>
	    	</td>
	    	<td class="dangan_td1">生日:</td>
	    	<td class="dangan_td2">
	    		<span style="margin-left:10px;color:black ">${empvo.empBirth }</span>
	    	</td>
	    	
	    </tr>
		<tr>
	    	<td class="dangan_td1">手机:</td>
	    	<td class="dangan_td2">
	    		<span style="margin-left:10px;color:black ">${empvo.empPhone }</span>
	    	</td>
	    	<td class="dangan_td1">电话:</td>
	    	<td class="dangan_td2">
	    		<span style="margin-left:10px;color:black ">${empvo.empTel }</span>
	    	</td>
	   
	    </tr>
		<tr>
	    	<td class="dangan_td1">邮箱:</td>
	    	<td class="dangan_td2">
	    		<span style="margin-left:10px;color:black ">${empvo.empEmail }</span>
	    	</td>
	    	<td class="dangan_td1">QQ:</td>
	    	<td class="dangan_td2">
	    		<span style="margin-left:10px;color:black ">${empvo.empQq }</span>
	    	</td>
	    	
	    </tr>
		<tr>
	    	<td class="dangan_td1">地址:</td>
	    	<td class="dangan_td2">
	    		<span style="margin-left:10px;color:black ">${empvo.empAddress }</span>
	    	</td>
	    	<td class="dangan_td1">直接上级:</td>
	    	<td class="dangan_td2">
	    		<c:forEach var = "x" items = "${emp }">
			        	<c:if test="${x.empId == empvo.empMgr }">
			        		<span style="margin-left:10px;color:black ">${x.empName }</span>
			        	</c:if>
			    </c:forEach>
	    	</td>
	    	
	    </tr>
	    <tr>
	    	<td class="dangan_td1">菜单角色:</td>
	    	<td class="dangan_td2">
	    		
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
	    		<span style="margin-left:10px;color:black ">${empvo.empFileid }</span>
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
	    		<span style="margin-left:10px;color:black ">${empvo.empCardid }</span>
	    	</td>
	    	<td class="dangan_td3"></td>
	    </tr>
		<tr>
	    	<td class="dangan_td1">籍贯:</td>
	    	<td class="dangan_td2">
	    		<span style="margin-left:10px;color:black ">${empvo.empNative }</span>
	    	</td>
	    	<td class="dangan_td1">民族:</td>
	    	<td class="dangan_td2">
	    		<span style="margin-left:10px;color:black ">${empvo.empNation }</span>
	    	</td>
	    	<td class="dangan_td3"></td>
	    </tr>
	    <tr>
	    	<td class="dangan_td1">曾用名:</td>
	    	<td class="dangan_td2">
	    		<span style="margin-left:10px;color:black ">${empvo.empOldname }</span>
	    	</td>
	    	<td class="dangan_td1">国籍:</td>
	    	<td class="dangan_td2">
	    		<span style="margin-left:10px;color:black ">${empvo.empNationality }</span>
	    	</td>
	    	<td class="dangan_td3"></td>
	    </tr>
	    <tr>
	    	<td class="dangan_td1">入职日期:</td>
	    	<td class="dangan_td2">
	    		<span style="margin-left:10px;color:black ">${empvo.empEntrydate }</span>
	    	</td>
	    	<td class="dangan_td1">离职日期:</td>
	    	<td class="dangan_td2">
	    		<span style="margin-left:10px;color:black ">${empvo.empDismission }</span>
	    	</td>
	    	<td class="dangan_td3"></td>
	    </tr>
	    <tr>
	    	<td class="dangan_td1">岗位:</td>
	    	<td class="dangan_td2">
	    		<span style="margin-left:10px;color:black ">${empvo.empStation }</span>
	    	</td>
	    	<td class="dangan_td1">最高学位:</td>
	    	<td class="dangan_td2">
	    		<span style="margin-left:10px;color:black ">${empvo.empMaxdegree }</span>
	    	</td>
	    	<td class="dangan_td3"></td>
	    </tr>
	    <tr>
	    	<td class="dangan_td1">最高学历:</td>
	    	<td class="dangan_td2">
	    		<span style="margin-left:10px;color:black ">${empvo.empMaxeducation }</span>
	    	</td>
	    	<td class="dangan_td1">毕业学校:</td>
	    	<td class="dangan_td2">
	    		<span style="margin-left:10px;color:black ">${empvo.empSchool }</span>
	    	</td>
	    	<td class="dangan_td3"></td>
	    </tr>
	    <tr>
	    	<td class="dangan_td1">所学专业:</td>
	    	<td class="dangan_td2">
	    		<span style="margin-left:10px;color:black ">${empvo.empMajor }</span>
	    	</td>
	    	<td class="dangan_td1">毕业日期:</td>
	    	<td class="dangan_td2">
	    		<span style="margin-left:10px;color:black ">${empvo.empGraduation }</span>
	    	</td>
	    	<td class="dangan_td3"></td>
	    </tr>
	    <tr>
	    	<td class="dangan_td1">业余爱好:</td>
	    	<td class="dangan_td2">
	    		<span style="margin-left:10px;color:black ">${empvo.empLike }</span>
	    	</td>
	    	<td class="dangan_td1">健康状况:</td>
	    	<td class="dangan_td2">
	    		<span style="margin-left:10px;color:black ">${empvo.empHealthy }</span>
	    	</td>
	    	<td class="dangan_td3"></td>
	    </tr>
	    <tr>
	    	<td class="dangan_td1">身高:</td>
	    	<td class="dangan_td2">
	    		<span style="margin-left:10px;color:black ">${empvo.empHigh }</span>
	    	</td>
	    	<td class="dangan_td1">体重:</td>
	    	<td class="dangan_td2">
	    		<span style="margin-left:10px;color:black ">${empvo.empWeight }</span>
	    	</td>
	    	<td class="dangan_td3"></td>
	    </tr>
	    <tr>
	    	<td class="dangan_td1">银行:</td>
	    	<td class="dangan_td2">
	    		<span style="margin-left:10px;color:black ">${empvo.empBank }</span>
	    	</td>
	    	<td class="dangan_td1">银行帐号:</td>
	    	<td class="dangan_td2">
	    		<span style="margin-left:10px;color:black ">${empvo.empBankid }</span>
	    	</td>
	    	<td class="dangan_td3"></td>
	    </tr>
	    <tr>
	    	<td class="dangan_td1">紧急联系人:</td>
	    	<td class="dangan_td2">
	    		<span style="margin-left:10px;color:black ">${empvo.empEme }</span>
	    	</td>
	    	<td class="dangan_td1">紧急联系人号码:</td>
	    	<td class="dangan_td2">
	    		<span style="margin-left:10px;color:black ">${empvo.empEmetel }</span>
	    	</td>
	    	<td class="dangan_td3"></td>
	    </tr>
	    <tr>
	    	<td class="dangan_td1">员工备注:</td>
	    	<td class="dangan_td2" colspan="4">
	    		 <span style="margin-left:10px;color:black ">${empvo.empRemark }</span>
	    	</td>
	    </tr>
	    
	</table>
	
	</form>

</div>	
	
</body>
</html>