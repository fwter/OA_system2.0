package com.oa.controller.fwt;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.oa.service.fwt.Empservice;
import com.oa.vo.ResultMap;
import com.oa.vo.fwt.OaEmpformvo;

@Controller
public class empcontroller {
	
	@Autowired
	Empservice es;
	
	@RequestMapping("/toEmp")
	public ModelAndView toEmp(){
		ModelAndView mv = new ModelAndView("emp");
		mv.addObject("dept", es.findDept());
		return mv;
	}
	
	@RequestMapping("/queryEmp")
	public @ResponseBody Map<String,Object> queryEmp(int page,int limit,String dept,String name,String type,String state,String begindate,String enddate){
		
		return es.findEmppage(page, limit,dept,name,type,state,begindate,enddate);
	}
	
	@RequestMapping("/toEmpform")
	public ModelAndView toEmpform(String empId){
		ModelAndView mv = new ModelAndView("Empform");
		mv.addObject("emp",es.findAll());
		mv.addObject("empvo",es.findOne(empId));
		return mv;
	}
	
	@RequestMapping("/saveEmp")
	public @ResponseBody Map<String, Object> saveEmp(OaEmpformvo emp,@RequestParam CommonsMultipartFile empPhoto){
		try {
			Boolean state = es.editEmp(emp);
			ResultMap.putObj(state, null, null);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			ResultMap.putObj(false, null, e.getMessage());
		}
		return ResultMap.getResultMap();
	}
}
