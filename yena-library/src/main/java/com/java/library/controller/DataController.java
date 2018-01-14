package com.java.library.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/data/")
public class DataController{
	
   @RequestMapping(value="newbook.do", method=RequestMethod.GET)
   public String getNewbook(){
      return "data/data_newbook";
   }
   @RequestMapping(value="newbook.do", method=RequestMethod.POST)
   public String postNewbook(){
      return "/data/data_newbook";
   }
   
   @RequestMapping("search.do")
   public String search(){
      return "data/data_search";
   }
   
   @RequestMapping("recommend.do")
   public String recommend(){
      return "data/data_recommend";
   }
   
   @RequestMapping("recommendview.do")
   public String recommendview(){
      return "data/data_recommendview";
   }
   
   
}