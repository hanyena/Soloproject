package com.java.library.controller;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/mylibrary/")
public class MylibraryController{
	
	// 도서대출 페이지 화면(타일즈)
	@RequestMapping(value="borrow.do", method=RequestMethod.GET)
	public String borrow(){
		return "book/book_borrow";
	}
	
	
	// 도서대출 페이지 데이터
	@RequestMapping(value="json/borrow.do", method=RequestMethod.POST)
	public String getDataBorrow(){
		return "";
	}
   


  
   
}