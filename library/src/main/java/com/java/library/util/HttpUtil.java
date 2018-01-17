package com.java.library.util;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

public class HttpUtil {
	// 메모리에 먼저 할당시킴
	public static ModelAndView returnJson(final Map<String, Object> result){
		
		  ModelAndView mav = new ModelAndView();
		
		  JSONObject jsonObject = new JSONObject();
	      // JSONObject형식으로 맞춰줌
	      jsonObject = JSONObject.fromObject(JSONSerializer.toJSON(result));
	      // json.jsp에 $message와 매칭이 되어서 json.jsp에 jsonObject.toString() 내용을 보여줌
	      mav.addObject("message", jsonObject.toString());	
	      System.out.println("JSON 있어요 ?");
	      mav.setViewName("json");
	      
	      return mav;
	}
	
	public static HashMap<String, Object> paramMap(HttpServletRequest req){
		HashMap<String, Object> params = new HashMap<String, Object>();
		//<?> => 모든지 받겠다
		Enumeration<?> enums = req.getParameterNames();
		
		// 내용이 없을 때까지 돌리겠다
		while(enums.hasMoreElements()){
			String paramName = (String) enums.nextElement();
			String[] parameters = req.getParameterValues(paramName);
			
			if(parameters.length > 1){
				params.put(paramName, parameters);
			}else{
				// 예외 처리 할 경우에만 사용할 것
				// 하나씩 들어왔을 때
				try{
					// 첫번째 것만 값으로 쓰겠다.
					params.put(paramName, parameters[0]);
				} catch(Exception e){
					e.printStackTrace();
				}
			}
		}
		return params;
	}
	
}
