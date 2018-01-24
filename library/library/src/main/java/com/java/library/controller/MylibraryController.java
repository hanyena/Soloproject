package com.java.library.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.java.library.service.MyLibrarayServiceInterface;
import com.java.library.util.social.naver.NaverProfile;

import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

@Controller
@RequestMapping("/mylibrary/")
public class MylibraryController{
	
	@Autowired
	MyLibrarayServiceInterface mlsi;
	
	// 도서대출 페이지 화면(타일즈)
	@RequestMapping(value="borrow.do", method=RequestMethod.GET)
	public ModelAndView borrow(ModelAndView mav,HttpSession session){
		NaverProfile nProfile = NaverProfile.getSessionNaverProfile(session);
		if(nProfile == null) {
			mav.addObject("msg", "로그인이 필요한 페이지입니다");
			mav.addObject("location", "/index.do");
			mav.setViewName("alert");
			return mav;
		}
		mav.setViewName("book/book_borrow");
		return mav;
	}
	
	
	// 도서대출 페이지 데이터 부분
	@RequestMapping(value="json/borrow.do", method=RequestMethod.POST)
	@ResponseBody
	public String getDataBorrow(@RequestParam Map<String, Object> paramMap,HttpSession session){
		
		return JSONObject.fromObject(JSONSerializer.toJSON(mlsi.myLibrarySelect(paramMap,session))).toString();
	}
   


  
   
}