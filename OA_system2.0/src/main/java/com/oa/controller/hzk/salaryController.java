package com.oa.controller.hzk;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oa.pojos.OaMenu;
import com.oa.service.zmy.MenuService;
/**
 * index页面控制器
 * @author Administrator
 *
 */
@Controller
public class salaryController {

	@Autowired
	MenuService mService;
	
	/**
	 * 跳转到查询薪资发放记录
	 * @return
	 */
	@RequestMapping("/salary-find")
	public String toSalaryFind(){
		return "salarytable";
	}
	
	/**
	 * 跳转到薪资项目管理
	 * @return
	 */
	@RequestMapping("/salary-item")
	public String toSalaryItem(){
		return "salaryitem";
	}
	
}
