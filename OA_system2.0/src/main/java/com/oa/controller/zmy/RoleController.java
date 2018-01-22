package com.oa.controller.zmy;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oa.pojos.OaRole;
import com.oa.service.zmy.RoleService;
import com.oa.vo.ResultMap;

@Controller
public class RoleController {
	
	@Autowired
	RoleService rService;
	
	@RequestMapping(value="/to_addRole.do",params={"roleName"})
	public @ResponseBody Map<String, Object> toAddRole(OaRole formRole){
		try {
			Boolean result = rService.addRole(formRole);
			ResultMap.putObj(result, "添加成功","添加失败");
			return ResultMap.getResultMap();
		} catch (Exception e) {
			e.printStackTrace();
			ResultMap.putObj(false,null,e.getMessage());
			return ResultMap.getResultMap();
		}
	}
	
	@RequestMapping("/to_listRoles.do")
	public @ResponseBody Map<String, Object> getRoles(){
		try {
			List<OaRole> result = rService.getRoles();
			ResultMap.putObj("code",0);
			ResultMap.putObj("data", result);
			return ResultMap.getResultMap();
		} catch (Exception e) {
			e.printStackTrace();
			ResultMap.putObj(false,null,e.getMessage());
			return ResultMap.getResultMap();
		}
	}
	
	@RequestMapping(value="/to_editRole.do",params={"roleId"})
	public @ResponseBody Map<String, Object> editRole(OaRole formRole){
		try {
			Boolean result = rService.editRole(formRole);
			ResultMap.putObj(result,"修改成功","修改失败");
			return ResultMap.getResultMap();
		} catch (Exception e) {
			e.printStackTrace();
			ResultMap.putObj(false,null,e.getMessage());
			return ResultMap.getResultMap();
		}
	}
}
