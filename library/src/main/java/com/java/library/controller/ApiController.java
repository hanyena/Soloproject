package com.java.library.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.java.library.util.Util;

import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

@RestController
@RequestMapping("/api/")
public class ApiController{
	
	@RequestMapping(value ="paging.do", method = RequestMethod.POST)
	public String paging(@RequestParam(value="pageNum",defaultValue="0") int pageNum, @RequestParam(value="pageLimitCnt",defaultValue="0") int pageLimitCnt, 
						@RequestParam(value="limitCnt",defaultValue="0") int limitCnt, @RequestParam(value="limitCnt",defaultValue="0")  int totalCnt) {
		return JSONObject.fromObject(JSONSerializer.toJSON(Util.paging(pageNum, pageLimitCnt, limitCnt, totalCnt))).toString();
	}
	

}
