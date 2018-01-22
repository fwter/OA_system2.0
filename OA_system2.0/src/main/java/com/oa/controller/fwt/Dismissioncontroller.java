package com.oa.controller.fwt;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.oa.service.fwt.Dismissionservice;
@Controller
public class Dismissioncontroller {

	@Autowired
	Dismissionservice ds;
	
	@RequestMapping("/toDis")
	public ModelAndView toDis(){
		ModelAndView mv = new ModelAndView("dismission");
		mv.addObject("dept",ds.queryDept());
		mv.addObject("job",ds.queryJob());
		return mv;
	}
	
	@RequestMapping("/queryDis")
	public @ResponseBody Map<String,Object> queryDis(int page,int limit,String dept,String name,String job,String begindate,String enddate){
		return ds.queryDis(page, limit, dept, name, job, begindate, enddate);
	}
}
