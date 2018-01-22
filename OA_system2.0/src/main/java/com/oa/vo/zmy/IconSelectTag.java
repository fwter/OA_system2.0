package com.oa.vo.zmy;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import com.alibaba.fastjson.JSONObject;
import com.xiaoleilu.hutool.io.file.FileReader;
import com.xiaoleilu.hutool.text.StrFormatter;


public class IconSelectTag extends SimpleTagSupport{


	private String src;
	
	public void setSrc(String src) {
		this.src = src;
	}


	@Override
	public void doTag() throws JspException, IOException {
		try{
			List<Map<String, Object>> maps=readJson();
			if(maps==null)return;
			StringBuffer html=new StringBuffer("<select id='e1_element' name='menuImg'>");
			html.append("<option value=''>NO icon</option>");
			for (Map<String, Object> map : maps) {
				html.append(StrFormatter.format("<option>iconfont {}</option>",map.get("icons")));
			}
			html.append("</select>");
			System.out.println(html.toString());
			getJspContext().getOut().print(html);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	private List<Map<String, Object>> readJson() {
		try {
			PageContext pageContext = (PageContext) getJspContext();
			HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
			String path=request.getServletContext().getRealPath("/WEB-INF/json/"+src);
			FileReader fileReader = new FileReader(path);
			return (List)JSONObject.parseArray(fileReader.readString());
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
}
