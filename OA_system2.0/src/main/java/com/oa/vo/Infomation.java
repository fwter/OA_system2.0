package com.oa.vo;

public class Infomation extends ResultMap{
	
	private String msg;
	
	private Boolean success;
	
	public Infomation(Boolean success, String msg) {
			this.success=success;
			this.msg=msg;
	}

	public static Infomation getInstance(Boolean success){
		if(success){
			return new Infomation(success,"成功");
		}else{
			return new Infomation(success,"失败");
		}
			
	}
	public static Infomation getInstance(Boolean success,Exception e){
			return new Infomation(false,e.getMessage());
	}
	
}
