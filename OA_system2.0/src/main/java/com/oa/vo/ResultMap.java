package com.oa.vo;

import java.util.HashMap;
import java.util.Map;

public class ResultMap {
	private static HashMap<String,Object> resultMap;
	
	protected ResultMap(){
	}
	/**
	 * 存入数据
	 * @param key
	 * @param value
	 */
	public static void putObj(String key,Object value){
		if(resultMap==null){
			resultMap=new HashMap<>();
		}
		resultMap.put(key, value);
	}
	/**
	 * 存入信息
	 * @param success 是否成功
	 * @param successMsg 成功信息
	 * @param errorMsg 失败信息
	 */
	public static void putObj(Boolean success,String successMsg,String errorMsg){
		if(resultMap==null){
			resultMap=new HashMap<>();
		}
		resultMap.put("success", success);
		if(success){
			resultMap.put("msg", successMsg);
		}else{
			resultMap.put("msg", errorMsg);
		}
	}

	/**
	 * 返回HashMap数据
	 * @return
	 */
	public static HashMap<String,Object> getResultMap() {
		HashMap<String, Object> temp=resultMap;
		resultMap=new HashMap<>();
		return temp;
	}
	
	
}
