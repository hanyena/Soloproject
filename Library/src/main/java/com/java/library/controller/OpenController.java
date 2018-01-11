package com.java.library.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.java.library.service.BoardServiceInterface;

import com.java.library.util.HttpUtil;

@Controller
public class OpenController{
   
	@Autowired
	BoardServiceInterface bsi;
	
   // board 화면부분
   @RequestMapping("/board")
   public ModelAndView board(ModelAndView mav){
		mav.setViewName("/board");
		return mav;
   }
   
   // board 데이터부분
   @RequestMapping("/board_data")
   public ModelAndView BoardSelect(HttpServletRequest req){
	   // ???
		HashMap<String, Object> paramMap = HttpUtil.paramMap(req);
		// 값을 JSON으로 변환
		return HttpUtil.returnJson(bsi.BoardSelect(paramMap));
   }
   

  
   
}