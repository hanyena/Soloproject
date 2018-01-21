package com.java.library.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.java.library.util.social.naver.NaverLogin;

@Controller
public class SiteController{
   
	@RequestMapping("/")
   public String main(){
      return "redirect:/index.do";
   }   
	
//   메인
   @RequestMapping("/index.do")
   public ModelAndView site(ModelAndView mav, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws UnsupportedEncodingException{
	  NaverLogin.startRequestAPIURL(mav,session);
	  mav.setViewName("main_index");
      return mav;
   }
   
// 이용안내
   // 타일즈를 불러옴
   @RequestMapping("/guide.do")
   public String guide(){
      return "guide/guide_index";
   }
      
   
   
}