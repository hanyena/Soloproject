package com.java.library.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manager/")
public class ManagerController{
   
//  관리자 이동 페이지
   @RequestMapping("manager.do")
   public String manager(){
      return "manager/manager_index";
   }

   
      
   
   
}