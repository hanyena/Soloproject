package com.java.library.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SiteController{
   
	@RequestMapping("/")
   public String main(){
      return "redirect:/index.do";
   }   
	
//   메인
   @RequestMapping("/index.do")
   public String site(){
      return "main_index";
   }
   
// 이용안내
   // 타일즈를 불러옴
   @RequestMapping("/guide.do")
   public String guide(){
      return "guide/guide_index";
   }
      
   
   
}