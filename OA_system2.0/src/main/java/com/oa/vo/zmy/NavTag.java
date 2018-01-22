package com.oa.vo.zmy;

import java.io.IOException;
import java.io.StringWriter;
import java.io.Writer;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import com.oa.pojos.OaEmp;

public class NavTag extends SimpleTagSupport{
	
	
	@Override
	public void doTag() throws JspException, IOException {
		PageContext context = (PageContext) getJspContext();
		HttpServletRequest req = (HttpServletRequest) context.getRequest();
		OaEmp emp = (OaEmp) req.getSession().getAttribute("emp");
		System.out.println("Tag----------"+emp.getEmpName());
		getJspContext().getOut().print(emp.getEmpName());
	}
}
