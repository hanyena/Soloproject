package com.java.libary;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MagagerController{
   
//  관리자 이동 페이지
   @RequestMapping("/manager")
   public String site(){
      return "manager";
   }

      
   
   
}