package com.java.libary;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OpenController{
   
   @RequestMapping("/board")
   public String board(){
      return "board";
   }
   
   @RequestMapping("/boardInput")
   public String boardInput(){
      return "boardInput";
   }
   

  
   
}