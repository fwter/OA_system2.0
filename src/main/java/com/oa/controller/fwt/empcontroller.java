package com.oa.controller.fwt;

import java.io.File;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

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
	
	@RequestMapping("/toEmpdetail")
	public ModelAndView toEmpdetail(String empId){
		ModelAndView mv = new ModelAndView("Empdetail");
		mv.addObject("emp",es.findAll());
		mv.addObject("empvo",es.findOne(empId));
		return mv;
	}
	
	@RequestMapping("/saveImg")
	public void saveImg(@RequestParam("file") CommonsMultipartFile file, String id, HttpServletRequest request){
		try {
			ServletContext application = request.getServletContext();
            String root = application.getRealPath("WEB-INF/resources");
            System.out.println(root);
            //获取原始文件的扩展名
            //获取文件的原始名称
            String oldFileName = file.getOriginalFilename();
            System.out.println(oldFileName);
            //找到最后一个.的位置
            int pos = oldFileName.lastIndexOf('.');
            //截取出扩展名
            String ext = oldFileName.substring(pos);
            System.out.println(ext);
            //生成一个全球唯一的字符串
            String newFileName = UUID.randomUUID().toString().toUpperCase();
            System.out.println(newFileName);
            //拼成完整的文件名
            newFileName = newFileName + ext;
            System.out.println(newFileName);
            //定义新文件的绝对物理路径
            File realFile = new File(root,newFileName);
           
            //转存...
            file.transferTo(realFile);
            es.editImg(id, newFileName);
            
		}catch(Exception e){
			e.printStackTrace();
		}
			
	}
	
	@RequestMapping("/saveEmp")
	public @ResponseBody Map<String,Object> saveEmp(OaEmpformvo emp){
	try{
		Boolean state = es.editEmp(emp);
		ResultMap.putObj(state, null, null);
	} catch (Exception e) {
		e.printStackTrace();
		// TODO Auto-generated catch block
		ResultMap.putObj(false, null, e.getMessage());
	}
	return ResultMap.getResultMap();
	}
}
