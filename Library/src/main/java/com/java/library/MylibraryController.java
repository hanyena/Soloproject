package com.java.library;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MylibraryController{
	
	
	@RequestMapping("/borrow")
	public String recommend(){
		return "borrow";
	   }
   


  
   
}