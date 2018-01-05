package com.java.library;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DataController{
	
   @RequestMapping("/newbook")
   public String newbook(){
      return "newbook";
   }
   
   @RequestMapping("/search")
   public String search(){
      return "search";
   }
   
   @RequestMapping("/recommend")
   public String recommend(){
      return "recommend";
   }
   
   @RequestMapping("/recommendview")
   public String recommendview(){
      return "recommendview";
   }
   
   
}