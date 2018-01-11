package com.java.library.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SiteController{
   
//   메인
   @RequestMapping("/index")
   public String site(){
      return "index";
   }
   
// 이용안내
   @RequestMapping("/guide")
   public String guide(){
      return "guide";
   }
      
   
   
}