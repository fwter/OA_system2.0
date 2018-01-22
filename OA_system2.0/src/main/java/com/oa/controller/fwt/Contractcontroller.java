package com.oa.controller.fwt;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.oa.service.fwt.Contractservice;
import com.oa.service.fwt.Empservice;
import com.oa.vo.ResultMap;

@Controller
public class Contractcontroller {
	@Autowired
	Contractservice cs;
	
	@Autowired
	Empservice es;
	
	/**
	 * 查询合同
	 * @param page
	 * @param limit
	 * @param dept
	 * @param name
	 * @param type
	 * @param state
	 * @param enddate
	 * @return
	 */
	@RequestMapping("/queryCon")
	public @ResponseBody Map<String,Object> queryCon(int page,int limit,String dept,String name,String type,String state,String enddate){
		return cs.queryContract(page, limit,dept,name,type,state,enddate);
	}
	
	/**
	 * 跳转合同页面
	 * @return
	 */
	@RequestMapping("/toCon")
	public ModelAndView toCon(){
		ModelAndView mv = new ModelAndView("Contract");
		mv.addObject("dept", es.findDept());
		return mv;
	}
	
	/**
	 * 跳转合同详情页面
	 * @param conId
	 * @return
	 */
	@RequestMapping("/toCondetail")
	public ModelAndView toCondetail(String conId,String type){
		ModelAndView mv = new ModelAndView("Contractdetail");
		mv.addObject("contract",cs.queryOne(conId));
		mv.addObject("type",type);
		return mv;
	}
	
	/**
	 * 续签
	 * @param id
	 * @param enddate
	 * @return
	 */
	@RequestMapping("saveConform")
	public @ResponseBody HashMap<String, Object> saveConform(String id,String conEnddate){
		try {
			Boolean b = cs.editEnddate(id, conEnddate);
			ResultMap.putObj(b, null, null);
			return ResultMap.getResultMap();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			ResultMap.putObj(false, null, e.getMessage());
			return ResultMap.getResultMap();
		}
	}
	
	/**
	 * 终止
	 * @param conId
	 * @param conStopdate
	 * @return
	 */
	@RequestMapping("stopCon")
	public @ResponseBody HashMap<String,Object> stopCon(String conId){
		try {
			Boolean b = cs.editStopdate(conId);
			ResultMap.putObj(b, null, null);
			return ResultMap.getResultMap();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			ResultMap.putObj(false, null, e.getMessage());
			return ResultMap.getResultMap();
		}
	}
	
}
