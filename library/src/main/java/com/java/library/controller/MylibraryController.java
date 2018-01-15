package com.java.library.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mylibrary/")
public class MylibraryController{
	
	
	@RequestMapping("borrow.do")
	public String borrow(){
		return "book/book_borrow";
	   }
   


  
   
}