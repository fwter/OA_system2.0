package com.oa.controller.hlg;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oa.pojos.OaFlow;
import com.oa.service.hlg.FlowService;

@Controller
public class FlowController {
	
	@Autowired
	private FlowService flowService;
	
	/**
	 * 跳转到我的申请页面
	 */
	@RequestMapping("/to_application")
	public String to_application(){
		return "myapplication";
	}
	/**
	 * 跳转到待办流程页面
	 */ 
	@RequestMapping("/tonodealFlow")
	public String toNodealFlow(){
		return "nodealFlow";
	}
	
	/**
	 * 查询我申请的流程
	 */
	
	/**
	 * 查询待办流程
	 */
	@RequestMapping("/queryFlow")
	@ResponseBody
	public Map<String, Object> queryFlow(int page,int limit,String name,String flowtitle){
		return flowService.queryFlowAll(page, limit, name, flowtitle);
	}
	
	/**
	 * 按条件查询待办流程
	 */
	@RequestMapping("/queryToFlow")
	@ResponseBody
	public Map<String, Object> queryToFlow(String flowName){
		System.out.println(flowName);
		List<OaFlow> list = flowService.find_flowName_Like(flowName);
		Map<String, Object> map=new HashMap<>();
		map.put("code", 0);
		map.put("data", list);
		return map;
	}
}
